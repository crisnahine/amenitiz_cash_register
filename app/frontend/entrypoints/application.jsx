import React from 'react'
import { createRoot } from 'react-dom/client'
import "bootstrap/dist/css/bootstrap.min.css"

function App() {
    const [basket, setBasket] = React.useState([])
    const [price, setPrice] = React.useState(null)

    const addToCart = (code) => setBasket([...basket, code])

    const removeOne = (code) => {
        const index = basket.findIndex(item => item === code)
        if (index > -1) {
            const newBasket = [...basket]
            newBasket.splice(index, 1)
            setBasket(newBasket)
        }
    }

    const checkout = async () => {
        const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content')

        const res = await fetch('/api/carts', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken,
            },
            body: JSON.stringify({ product_codes: basket }),
            credentials: 'same-origin',
        })

        const data = await res.json()
        setPrice(data.total_price)
    }

    // ✅ Group basket items by code
    const groupedBasket = basket.reduce((acc, code) => {
        acc[code] = (acc[code] || 0) + 1
        return acc
    }, {})

    return (
        <div className="container py-5">
            <div className="card shadow-lg p-4">
                <h1 className="text-center mb-4">Amenitiz Cash Register</h1>

                <div className="d-flex justify-content-center gap-2 mb-3">
                    <button onClick={() => addToCart('GR1')} className="btn btn-outline-success">
                        Green Tea
                    </button>
                    <button onClick={() => addToCart('SR1')} className="btn btn-outline-danger">
                        Strawberries
                    </button>
                    <button onClick={() => addToCart('CF1')} className="btn btn-outline-warning">
                        Coffee
                    </button>
                </div>

                <h5>🧺 Basket</h5>
                {basket.length === 0 ? (
                    <p className="text-muted">No items added</p>
                ) : (
                    <ul className="list-group mb-3">
                        {Object.entries(groupedBasket).map(([code, count]) => (
                            <li key={code} className="list-group-item d-flex justify-content-between align-items-center">
                                <div><strong>{code}</strong> × {count}</div>
                                <button
                                    className="btn btn-sm btn-outline-secondary"
                                    onClick={() => removeOne(code)}
                                >
                                    Remove one
                                </button>
                            </li>
                        ))}
                    </ul>
                )}

                <button onClick={checkout} className="btn btn-primary w-100 mb-3">
                    Checkout
                </button>

                {price !== null && (
                    <div className="alert alert-success text-center mb-0">
                        💰 Total: €{price}
                    </div>
                )}
            </div>
        </div>
    )
}

createRoot(document.getElementById('root')).render(<App />)
