Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B963BDF12
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 23:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKGBh4Kt8z3bjH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 07:38:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fjV4+ka8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=vilhelm.gray@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fjV4+ka8; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKGBC5B4Gz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 07:37:54 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id s13so9708803plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jul 2021 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
 b=fjV4+ka8h0vH05QQfb5mosysrP9nHimBGyZMIaa5AG6oYKlZIJ9fBu1u8zdUGxqK0V
 Um+d4Woup62vh1nDeTEMfYQu/z07c7tU/WMAtzd8zyjZ+D++/9qAcGD3Qi5HWfAEidnP
 LVIhoqq3BcdDCaWawKEqjjS8yu6I4JR+nAEzkK0jeMXN28vBiyhs3oL9vVM3I/zG4bRq
 0ch+fVpWTwIZJdpOA5MGN4Hsas/DzY0s55S8/73rafQT0BQHzaPtbSSjdX9FgBPH3Kng
 zdOUu0zymj0lCUC9mcaI5h90C5jAW9R9slEqBMssceloFyAtObCoJPafpr9GaUMLPWWg
 1jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
 b=YZ3X1F7/7Z+u25FLIc6okyaKj8J9SxWq3OAqrlx26xFfFsKqedYNkO0ePlf8tx+MeT
 IdwSQgkbLfsIhkkK46+2Sq+lPmuSjsyBqGm392z7eHXZP+V852Dmu7i0NL7Vry+THkud
 TkiwKezUqbRpOPmHdFzSz3nh2CmJ561/YQ/dSLSpmfzdrRsLpr9C+sGHCZ29XnkAstYI
 5Bv6ZYoGXW4F+7ZjiUhFBnwOheh+pNsMtQ2ncDaLZ6Tdah3rNFmwgSOlh/6st/JEBF0e
 hyL9c4mXNEfeDuQKeyTZywtT7oUHwpvk9R4nCv00HoWSbkImN3yS9vImjgrWRr1cVOFs
 q5WA==
X-Gm-Message-State: AOAM5309ZfZY+p1Oq3G0OWwh8nVpEMNLyNHnvi/RtGzoC69s0tdcKkxz
 V4n2A8s7BZiyuGhl44Vok6g=
X-Google-Smtp-Source: ABdhPJyn2Hi8kaCYu+WokB25snaMIG+9Q6KwjeQoMDQJIrAIZd3JeXm641055Ca25Y6q1bD80UK2hA==
X-Received: by 2002:a17:90a:3009:: with SMTP id
 g9mr2332932pjb.82.1625607470831; 
 Tue, 06 Jul 2021 14:37:50 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id h14sm14343197pgv.47.2021.07.06.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:37:49 -0700 (PDT)
Date: Wed, 7 Jul 2021 06:37:39 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOTMp88HfFiy6+RM@shinobu>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VOubNWsj2sFIOkFX"
Content-Disposition: inline
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
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
Cc: nvdimm@lists.linux.dev, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-cxl@vger.kernel.org, linux-mips@vger.kernel.org,
 target-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, industrypack-devel@lists.sourceforge.net,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 greybus-dev@lists.linaro.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-ntb@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--VOubNWsj2sFIOkFX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 05:48:03PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>=20
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>=20
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
>=20
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk> (For ARM, Am=
ba and related parts)
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org> (for drivers/bus/sunxi-rsb.c)
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> (for drivers/media)
> Acked-by: Hans de Goede <hdegoede@redhat.com> (For drivers/platform)
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Juergen Gross <jgross@suse.com> (For Xen)
> Acked-by: Lee Jones <lee.jones@linaro.org> (For drivers/mfd)
> Acked-by: Johannes Thumshirn <jth@kernel.org> (For drivers/mcb)
> Acked-by: Johan Hovold <johan@kernel.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org> (For drive=
rs/slimbus)
> Acked-by: Kirti Wankhede <kwankhede@nvidia.com> (For drivers/vfio)
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com> (For ulpi and=
 typec)
> Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com> (For ipac=
k)
> Reviewed-by: Tom Rix <trix@redhat.com> (For fpga)
> Acked-by: Geoff Levand <geoff@infradead.org> (For ps3)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

>  drivers/base/isa.c                        | 4 +---

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

--VOubNWsj2sFIOkFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDkzSMACgkQhvpINdm7
VJLVFhAAyxEk2xOSRC1xhJSnjLQvNeb+KeTAJr+uaSAwwExERXcbGlIryhqCZSij
fZRzkvgPIscNAegWidvmuhZlhkFJPwvPArfhB/pFIDvQ1xX0kCPH3T51Lncu35Tf
vgluc4JhAW9+1UzoKZsv8RK4uY2ETRMBBeYs7epjqK2RhCvzG8rDMD+Dy49nxrYX
eNdmcR+7EcK8RjLmb/YEfNXxcXdDW0KlU5ATAh+PKuAPKbOKpoKfKuYsOYS7VrGJ
MAk5lC5J/bqbBWM4eqm+g5NbskWMr1N5WC60R7K3isMCoaEpnKNhSD3kvYIFe2Tf
mWyIE2c7D+UWhzbp+Kq4+DHzBN4ajLBy0oMd28HrGOQmD+/chjjc1zTOK9uNBvKz
xBRbxQl7OrAnKhUqcrgVpVL30EvTNajZIOZdwtGXhQCWW+MX747JE+H291VLg3gz
a0p6IJ8TS+gOgGGvmNjVg6yHYuKv6XDbDfI7tc0dRJUOoVqfbkIHSvAQQzn0LIFn
k/Ln4D8LDFj8X3fHbfz200+nzo9gwA5ZXhWXzvTKXhSEyBoc3+i+Ihn3bgYf6rI8
j8LozqWaWpNxaLMBrLuy06ldAuzhnQ7wPw1JuGXDAY1vdMYVVRp1XcbjBSqybXMA
weoaxx4Lwh05XikzxZpXDQBx5N+5V3sYRuqGrYs7H1ZUm0rT0I0=
=yTaM
-----END PGP SIGNATURE-----

--VOubNWsj2sFIOkFX--
