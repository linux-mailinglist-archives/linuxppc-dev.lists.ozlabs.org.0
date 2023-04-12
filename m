Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2B6DF958
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 17:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxQyf0sPwz3fRG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 01:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxQy71SSdz3cdH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 01:05:48 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmc2L-0006ND-CS; Wed, 12 Apr 2023 17:05:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmc2H-00AlLr-83; Wed, 12 Apr 2023 17:05:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmc2G-00CdHe-EK; Wed, 12 Apr 2023 17:05:24 +0200
Date: Wed, 12 Apr 2023 17:05:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH] powerpc/mpc52xx_lpbfifo: Drop unused functions
Message-ID: <20230412150524.ojsvukh47hing6db@pengutronix.de>
References: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwhvh7pjvkdx7wa7"
Content-Disposition: inline
In-Reply-To: <20221228145129.31700-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rwhvh7pjvkdx7wa7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 03:51:29PM +0100, Uwe Kleine-K=F6nig wrote:
> The four exported functions mpc52xx_lpbfifo_submit(),
> mpc52xx_lpbfifo_abort(), mpc52xx_lpbfifo_poll(), and
> mpc52xx_lpbfifo_start_xfer() are not used. So they can be dropped and the
> definitions needed to call them can be moved into the driver file.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I never got feedback about this driver and it has not appeared in next
up to now. Did it fell through the cracks?

Best regards
Uwe

> ---
>  arch/powerpc/include/asm/mpc52xx.h            |  41 ------
>  arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c | 134 +++++-------------
>  2 files changed, 33 insertions(+), 142 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/as=
m/mpc52xx.h
> index 5ea16a71c2f0..01ae6c351e50 100644
> --- a/arch/powerpc/include/asm/mpc52xx.h
> +++ b/arch/powerpc/include/asm/mpc52xx.h
> @@ -285,47 +285,6 @@ extern int mpc52xx_gpt_start_timer(struct mpc52xx_gp=
t_priv *gpt, u64 period,
>  extern u64 mpc52xx_gpt_timer_period(struct mpc52xx_gpt_priv *gpt);
>  extern int mpc52xx_gpt_stop_timer(struct mpc52xx_gpt_priv *gpt);
> =20
> -/* mpc52xx_lpbfifo.c */
> -#define MPC52XX_LPBFIFO_FLAG_READ		(0)
> -#define MPC52XX_LPBFIFO_FLAG_WRITE		(1<<0)
> -#define MPC52XX_LPBFIFO_FLAG_NO_INCREMENT	(1<<1)
> -#define MPC52XX_LPBFIFO_FLAG_NO_DMA		(1<<2)
> -#define MPC52XX_LPBFIFO_FLAG_POLL_DMA		(1<<3)
> -
> -struct mpc52xx_lpbfifo_request {
> -	struct list_head list;
> -
> -	/* localplus bus address */
> -	unsigned int cs;
> -	size_t offset;
> -
> -	/* Memory address */
> -	void *data;
> -	phys_addr_t data_phys;
> -
> -	/* Details of transfer */
> -	size_t size;
> -	size_t pos;	/* current position of transfer */
> -	int flags;
> -	int defer_xfer_start;
> -
> -	/* What to do when finished */
> -	void (*callback)(struct mpc52xx_lpbfifo_request *);
> -
> -	void *priv;		/* Driver private data */
> -
> -	/* statistics */
> -	int irq_count;
> -	int irq_ticks;
> -	u8 last_byte;
> -	int buffer_not_done_cnt;
> -};
> -
> -extern int mpc52xx_lpbfifo_submit(struct mpc52xx_lpbfifo_request *req);
> -extern void mpc52xx_lpbfifo_abort(struct mpc52xx_lpbfifo_request *req);
> -extern void mpc52xx_lpbfifo_poll(void);
> -extern int mpc52xx_lpbfifo_start_xfer(struct mpc52xx_lpbfifo_request *re=
q);
> -
>  /* mpc52xx_pic.c */
>  extern void mpc52xx_init_irq(void);
>  extern unsigned int mpc52xx_get_irq(void);
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c b/arch/powerpc=
/platforms/52xx/mpc52xx_lpbfifo.c
> index 6d1dd6e87478..32fd1345ffeb 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_lpbfifo.c
> @@ -38,6 +38,39 @@ MODULE_LICENSE("GPL");
>  #define LPBFIFO_REG_FIFO_CONTROL	(0x48)
>  #define LPBFIFO_REG_FIFO_ALARM		(0x4C)
> =20
> +#define MPC52XX_LPBFIFO_FLAG_WRITE		(1<<0)
> +#define MPC52XX_LPBFIFO_FLAG_NO_DMA		(1<<2)
> +#define MPC52XX_LPBFIFO_FLAG_POLL_DMA		(1<<3)
> +
> +struct mpc52xx_lpbfifo_request {
> +	struct list_head list;
> +
> +	/* localplus bus address */
> +	unsigned int cs;
> +	size_t offset;
> +
> +	/* Memory address */
> +	void *data;
> +	phys_addr_t data_phys;
> +
> +	/* Details of transfer */
> +	size_t size;
> +	size_t pos;	/* current position of transfer */
> +	int flags;
> +	int defer_xfer_start;
> +
> +	/* What to do when finished */
> +	void (*callback)(struct mpc52xx_lpbfifo_request *);
> +
> +	void *priv;		/* Driver private data */
> +
> +	/* statistics */
> +	int irq_count;
> +	int irq_ticks;
> +	u8 last_byte;
> +	int buffer_not_done_cnt;
> +};
> +
>  struct mpc52xx_lpbfifo {
>  	struct device *dev;
>  	phys_addr_t regs_phys;
> @@ -381,107 +414,6 @@ static irqreturn_t mpc52xx_lpbfifo_bcom_irq(int irq=
, void *dev_id)
>  	return IRQ_HANDLED;
>  }
> =20
> -/**
> - * mpc52xx_lpbfifo_poll - Poll for DMA completion
> - */
> -void mpc52xx_lpbfifo_poll(void)
> -{
> -	struct mpc52xx_lpbfifo_request *req =3D lpbfifo.req;
> -	int dma =3D !(req->flags & MPC52XX_LPBFIFO_FLAG_NO_DMA);
> -	int write =3D req->flags & MPC52XX_LPBFIFO_FLAG_WRITE;
> -
> -	/*
> -	 * For more information, see comments on the "Fat Lady"=20
> -	 */
> -	if (dma && write)
> -		mpc52xx_lpbfifo_irq(0, NULL);
> -	else=20
> -		mpc52xx_lpbfifo_bcom_irq(0, NULL);
> -}
> -EXPORT_SYMBOL(mpc52xx_lpbfifo_poll);
> -
> -/**
> - * mpc52xx_lpbfifo_submit - Submit an LPB FIFO transfer request.
> - * @req: Pointer to request structure
> - *
> - * Return: %0 on success, -errno code on error
> - */
> -int mpc52xx_lpbfifo_submit(struct mpc52xx_lpbfifo_request *req)
> -{
> -	unsigned long flags;
> -
> -	if (!lpbfifo.regs)
> -		return -ENODEV;
> -
> -	spin_lock_irqsave(&lpbfifo.lock, flags);
> -
> -	/* If the req pointer is already set, then a transfer is in progress */
> -	if (lpbfifo.req) {
> -		spin_unlock_irqrestore(&lpbfifo.lock, flags);
> -		return -EBUSY;
> -	}
> -
> -	/* Setup the transfer */
> -	lpbfifo.req =3D req;
> -	req->irq_count =3D 0;
> -	req->irq_ticks =3D 0;
> -	req->buffer_not_done_cnt =3D 0;
> -	req->pos =3D 0;
> -
> -	mpc52xx_lpbfifo_kick(req);
> -	spin_unlock_irqrestore(&lpbfifo.lock, flags);
> -	return 0;
> -}
> -EXPORT_SYMBOL(mpc52xx_lpbfifo_submit);
> -
> -int mpc52xx_lpbfifo_start_xfer(struct mpc52xx_lpbfifo_request *req)
> -{
> -	unsigned long flags;
> -
> -	if (!lpbfifo.regs)
> -		return -ENODEV;
> -
> -	spin_lock_irqsave(&lpbfifo.lock, flags);
> -
> -	/*
> -	 * If the req pointer is already set and a transfer was
> -	 * started on submit, then this transfer is in progress
> -	 */
> -	if (lpbfifo.req && !lpbfifo.req->defer_xfer_start) {
> -		spin_unlock_irqrestore(&lpbfifo.lock, flags);
> -		return -EBUSY;
> -	}
> -
> -	/*
> -	 * If the req was previously submitted but not
> -	 * started, start it now
> -	 */
> -	if (lpbfifo.req && lpbfifo.req =3D=3D req &&
> -	    lpbfifo.req->defer_xfer_start) {
> -		out_8(lpbfifo.regs + LPBFIFO_REG_PACKET_SIZE, 0x01);
> -	}
> -
> -	spin_unlock_irqrestore(&lpbfifo.lock, flags);
> -	return 0;
> -}
> -EXPORT_SYMBOL(mpc52xx_lpbfifo_start_xfer);
> -
> -void mpc52xx_lpbfifo_abort(struct mpc52xx_lpbfifo_request *req)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&lpbfifo.lock, flags);
> -	if (lpbfifo.req =3D=3D req) {
> -		/* Put it into reset and clear the state */
> -		bcom_gen_bd_rx_reset(lpbfifo.bcom_rx_task);
> -		bcom_gen_bd_tx_reset(lpbfifo.bcom_tx_task);
> -		out_be32(lpbfifo.regs + LPBFIFO_REG_ENABLE, 0x01010000);
> -		lpbfifo.req =3D NULL;
> -	}
> -	spin_unlock_irqrestore(&lpbfifo.lock, flags);
> -}
> -EXPORT_SYMBOL(mpc52xx_lpbfifo_abort);
> -
>  static int mpc52xx_lpbfifo_probe(struct platform_device *op)
>  {
>  	struct resource res;
> --=20
> 2.38.1
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rwhvh7pjvkdx7wa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ2yLMACgkQj4D7WH0S
/k4SVwgAoeCZ4FK/2lh2NNrW8meBlIGCJ1OtX7rXemyzxa9DiElwxF9+2lHjkSPx
N7a6CZ7ePbuPlE3+c1IOfwdyZs5/VwnKEDtmLbfTpcMbsq05yJJENt32Sji9wwbu
ZKZZANe7mK7eAPhCMC6IxBt0nEBsbDNGzcblybZBX1ua+7JUTjIqMp+4qrOBgRFe
UGS80vQXKJd3K3/UnkBDWF72ytMfifb4RHCfVtqCvMviW/pF5W503lmF1ezDdM3o
aTDNya3zJ6fjNJazubGt3xkouhyosjFLpsYwnR5pIV3c7xcONiYJ2BoWvniiiLxb
p65l5BM5kczg8WUf23mS4Qdgss9iTw==
=qwFe
-----END PGP SIGNATURE-----

--rwhvh7pjvkdx7wa7--
