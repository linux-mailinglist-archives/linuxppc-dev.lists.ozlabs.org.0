Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330D89B6FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 06:49:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KWjK23+y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCc7M04jKz3vYx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 14:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KWjK23+y;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCc6d3pnbz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 14:48:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712551705;
	bh=IpU2QpSZg46kAHUBDGrgW+pdugVyxW5ZiVLWGqq1RMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KWjK23+yiyYGRGatLbITytavO0r4Q0wv49xIFeUm+MS8qa0QSsQFOIMq5Swy1LbnY
	 3OLH0f68FILNILH444xqAV4UFrx5k3CpND+p0N9a0+5dwcGPVns41StOJMLUqovw9Q
	 g0kjD18aSWvTO+BOk8ImUHzeri1rIEjmhmwyvhPErOCl3OJ0h8TsHO9MAnSLK/vnK4
	 +XrsXnGCejwS2EUPRgdeKOD1OFQjOLGjbjQ8ZrWddbLQWdasjj3zTRBTmTmS4WdBKn
	 7/fjhfmEb7aUjszUEgKkbEcX/blOz3Sdxp7VmKEhLSzSITaUozgadzGuxeHrt2yt0P
	 OBYUG6c8Osdbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VCc6b6RhPz4wjF;
	Mon,  8 Apr 2024 14:48:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: Drop Li Yang as their email address
 stopped working
In-Reply-To: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
References: <20240405072042.697182-2-u.kleine-koenig@pengutronix.de>
Date: Mon, 08 Apr 2024 14:48:23 +1000
Message-ID: <871q7gcve0.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, kernel@pengutronix.de, vladimir.oltean@nxp.com, Shawn Guo <shawnguo@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> When sending a patch to (among others) Li Yang the nxp MTA replied that
> the address doesn't exist and so the mail couldn't be delivered. The
> error code was 550, so at least technically that's not a temporal issue.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I added the affected maintainers and lists to Cc:, maybe someone there
> knows if this issue is only temporal?

Apparently not. See https://lore.kernel.org/all/20240219153016.ntltc76bphwr=
v6hn@skbuf/

  Leo Li (Li Yang) is no longer with NXP.


cheers

> @Greg: Given that I noticed the non-existing address when sending an usb
> patch, I suggest you care for application of this patch (iff it should
> be applied now). If Li Yang disappeared indeed, I'd prefer to drop the
> contact from MAINTAINERS early to not give wrong expectations to
> contributors.
>
> Best regards
> Uwe
>
>  MAINTAINERS | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c121493f43d..be19aad15045 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2191,7 +2191,6 @@ N:	mxs
>=20=20
>  ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
>  M:	Shawn Guo <shawnguo@kernel.org>
> -M:	Li Yang <leoyang.li@nxp.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> @@ -8523,7 +8522,6 @@ S:	Maintained
>  F:	drivers/video/fbdev/fsl-diu-fb.*
>=20=20
>  FREESCALE DMA DRIVER
> -M:	Li Yang <leoyang.li@nxp.com>
>  M:	Zhang Wei <zw@zh-kernel.org>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Maintained
> @@ -8688,10 +8686,9 @@ F:	drivers/soc/fsl/qe/tsa.h
>  F:	include/dt-bindings/soc/cpm1-fsl,tsa.h
>=20=20
>  FREESCALE QUICC ENGINE UCC ETHERNET DRIVER
> -M:	Li Yang <leoyang.li@nxp.com>
>  L:	netdev@vger.kernel.org
>  L:	linuxppc-dev@lists.ozlabs.org
> -S:	Maintained
> +S:	Orphan
>  F:	drivers/net/ethernet/freescale/ucc_geth*
>=20=20
>  FREESCALE QUICC ENGINE UCC HDLC DRIVER
> @@ -8708,10 +8705,9 @@ S:	Maintained
>  F:	drivers/tty/serial/ucc_uart.c
>=20=20
>  FREESCALE SOC DRIVERS
> -M:	Li Yang <leoyang.li@nxp.com>
>  L:	linuxppc-dev@lists.ozlabs.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -S:	Maintained
> +S:	Orphan
>  F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
>  F:	Documentation/devicetree/bindings/soc/fsl/
>  F:	drivers/soc/fsl/
> @@ -8745,10 +8741,9 @@ F:	Documentation/devicetree/bindings/sound/fsl,qmc=
-audio.yaml
>  F:	sound/soc/fsl/fsl_qmc_audio.c
>=20=20
>  FREESCALE USB PERIPHERAL DRIVERS
> -M:	Li Yang <leoyang.li@nxp.com>
>  L:	linux-usb@vger.kernel.org
>  L:	linuxppc-dev@lists.ozlabs.org
> -S:	Maintained
> +S:	Orphan
>  F:	drivers/usb/gadget/udc/fsl*
>=20=20
>  FREESCALE USB PHY DRIVER
>
> base-commit: c85af715cac0a951eea97393378e84bb49384734
> --=20
> 2.43.0
