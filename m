Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CED2A18EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Oct 2020 18:14:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNm4p3rCCzDqdg
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Nov 2020 04:14:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=BtU7BEOu; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNm2C66DSzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Nov 2020 04:12:19 +1100 (AEDT)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F444206E5;
 Sat, 31 Oct 2020 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604164337;
 bh=twQgN1Y1z8exlY3r71I3ZihQiCAGvG9Gae4RwmXJ/ts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BtU7BEOuk65G9AhsBSbq29tqoeagdjbEzoTanYWmoCtuMCYigAiLgK11D5wMFmwcJ
 nGdnuDEWBvTemNLvy3iTArF4CpVp2MfmgvvkX5CtfAtpJfwrL7jbbg8oi8TU3fN+AS
 CjvtkSVxRf+kBaJf3M0H7+fviR9KvGGUqFE5Tcjg=
Date: Sat, 31 Oct 2020 10:12:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next 14/15] net: dpaa: Replace in_irq() usage.
Message-ID: <20201031101215.38a13e51@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201027225454.3492351-15-bigeasy@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
 <20201027225454.3492351-15-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Samuel Chessman <chessman@tux.org>, Ping-Ke Shih <pkshih@realtek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?UTF-8?B?R2VhbnTEgw==?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, linuxppc-dev@lists.ozlabs.org,
 Daniel Drake <dsd@gentoo.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Oct 2020 23:54:53 +0100 Sebastian Andrzej Siewior wrote:
> The driver uses in_irq() + in_serving_softirq() magic to decide if NAPI
> scheduling is required or packet processing.
>=20
> The usage of in_*() in drivers is phased out and Linus clearly requested
> that code which changes behaviour depending on context should either be
> seperated or the context be conveyed in an argument passed by the caller,
> which usually knows the context.
>=20
> Use the `napi' argument passed by the callback. It is set true if
> called from the interrupt handler and NAPI should be scheduled.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: "Horia Geant=C4=83" <horia.geanta@nxp.com>
> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Madalin Bucur <madalin.bucur@nxp.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: linux-crypto@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net=
/ethernet/freescale/dpaa/dpaa_eth.c
> index 27835310b718e..2c949acd74c67 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -2300,9 +2300,9 @@ static void dpaa_tx_conf(struct net_device *net_dev,
>  }
> =20
>  static inline int dpaa_eth_napi_schedule(struct dpaa_percpu_priv *percpu=
_priv,
> -					 struct qman_portal *portal)
> +					 struct qman_portal *portal, bool napi)
>  {
> -	if (unlikely(in_irq() || !in_serving_softirq())) {
> +	if (napi) {
>  		/* Disable QMan IRQ and invoke NAPI */
>  		qman_p_irqsource_remove(portal, QM_PIRQ_DQRI);
> =20

Nit: some networking drivers have a bool napi which means "are we
running in napi context", the semantics here feel a little backwards,
at least to me. But if I'm the only one thinking this, so be it.
