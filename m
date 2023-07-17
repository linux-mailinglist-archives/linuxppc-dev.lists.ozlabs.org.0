Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A775661F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 16:15:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucKzLgH+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4PHk6ng5z2yq0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:15:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ucKzLgH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4PGq1Zfcz2xgw;
	Tue, 18 Jul 2023 00:14:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0E6061083;
	Mon, 17 Jul 2023 14:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E21C433C7;
	Mon, 17 Jul 2023 14:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689603280;
	bh=DsVLgJx2JovG0BwaBnx+6xFRFrkyvGDsH0nInttVSzE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ucKzLgH+gYQ2yeRHpjUzVozbucN60bF3TCnu8zVxmvt8XM4guK8u2YW5zz40XNW+o
	 SxXAUnD8/tyKAjpZlzccK3s6pV7RsqSrUHQ6zBDGWZHqyIrsQF5rF+DKseMQK7glYr
	 hFurZA14yZingf2xQNYQX6dlkCD/9ymz80dMUmsNMgX7mXuNMKJJjePpZpkoCS5cnd
	 smDDnAFsvX7prND8pXk6QtXkaXkujMCGgjleIxOmNa8cZsuhMAbE77VWF8Bv19rQZK
	 Z2F4xFH/0IJyUjraJg5PAlTtOnr7xTJ045g27ztrz6BTnuPcKNMwNJdSZhKfFjGCrs
	 zFF3/nXHR/bYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Jul 2023 14:14:30 +0000
Message-Id: <CU4IDETDBZ0C.1N1XJ58T5O5K3@seitikki>
Subject: Re: [PATCH] char: Explicitly include correct DT includes
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Rob Herring" <robh@kernel.org>, "David Airlie" <airlied@redhat.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@microchip.com>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui" <rjui@broadcom.com>,
 "Scott Branden" <sbranden@broadcom.com>, "Avi Fishman"
 <avifishman70@gmail.com>, "Tomer Maimon" <tmaimon77@gmail.com>, "Tali
 Perry" <tali.perry1@gmail.com>, "Patrick Venture" <venture@google.com>,
 "Nancy Yuen" <yuenn@google.com>, "Benjamin Fair" <benjaminfair@google.com>,
 "Deepak Saxena" <dsaxena@plexity.net>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy" <christophe.leroy@csgroup.eu>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Corey Minyard" <minyard@acm.org>, "Joel
 Stanley" <joel@jms.id.au>, "Andrew Jeffery" <andrew@aj.id.au>, "Peter
 Huewe" <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>
X-Mailer: aerc 0.14.0
References: <20230714174315.4052438-1-robh@kernel.org>
In-Reply-To: <20230714174315.4052438-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-integrity@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jul 14, 2023 at 5:43 PM UTC, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/char/agp/uninorth-agp.c        | 1 +
>  drivers/char/bsr.c                     | 3 +--
>  drivers/char/hw_random/atmel-rng.c     | 2 +-
>  drivers/char/hw_random/bcm2835-rng.c   | 3 +--
>  drivers/char/hw_random/ingenic-trng.c  | 2 +-
>  drivers/char/hw_random/iproc-rng200.c  | 3 +--
>  drivers/char/hw_random/npcm-rng.c      | 3 +--
>  drivers/char/hw_random/omap-rng.c      | 2 --
>  drivers/char/hw_random/omap3-rom-rng.c | 1 -
>  drivers/char/hw_random/pasemi-rng.c    | 3 +--
>  drivers/char/hw_random/pic32-rng.c     | 3 +--
>  drivers/char/hw_random/stm32-rng.c     | 3 ++-
>  drivers/char/hw_random/xgene-rng.c     | 5 ++---
>  drivers/char/hw_random/xiphera-trng.c  | 1 -
>  drivers/char/ipmi/kcs_bmc_aspeed.c     | 1 -
>  drivers/char/tpm/tpm_ftpm_tee.c        | 1 -
>  drivers/char/tpm/tpm_tis.c             | 1 -
>  drivers/char/tpm/tpm_tis_spi_main.c    | 2 +-
>  drivers/char/tpm/tpm_tis_synquacer.c   | 1 -
>  19 files changed, 14 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-=
agp.c
> index 62de7f4ba864..84411b13c49f 100644
> --- a/drivers/char/agp/uninorth-agp.c
> +++ b/drivers/char/agp/uninorth-agp.c
> @@ -3,6 +3,7 @@
>   * UniNorth AGPGART routines.
>   */
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/init.h>
> diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
> index 12143854aeac..70d31aed9011 100644
> --- a/drivers/char/bsr.c
> +++ b/drivers/char/bsr.c
> @@ -6,11 +6,10 @@
>   * Author: Sonny Rao <sonnyrao@us.ibm.com>
>   */
> =20
> +#include <linux/device.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
> -#include <linux/of_platform.h>
>  #include <linux/fs.h>
>  #include <linux/module.h>
>  #include <linux/cdev.h>
> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/=
atmel-rng.c
> index b8effe77d80f..a37367ebcbac 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -15,7 +15,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/hw_random.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> =20
> diff --git a/drivers/char/hw_random/bcm2835-rng.c b/drivers/char/hw_rando=
m/bcm2835-rng.c
> index e98fcac578d6..e19b0f9f48b9 100644
> --- a/drivers/char/hw_random/bcm2835-rng.c
> +++ b/drivers/char/hw_random/bcm2835-rng.c
> @@ -8,8 +8,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
>  #include <linux/clk.h>
> diff --git a/drivers/char/hw_random/ingenic-trng.c b/drivers/char/hw_rand=
om/ingenic-trng.c
> index 0eb80f786f4d..759445d4f65a 100644
> --- a/drivers/char/hw_random/ingenic-trng.c
> +++ b/drivers/char/hw_random/ingenic-trng.c
> @@ -11,8 +11,8 @@
>  #include <linux/hw_random.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> =20
> diff --git a/drivers/char/hw_random/iproc-rng200.c b/drivers/char/hw_rand=
om/iproc-rng200.c
> index 06bc060534d8..34df3f0d3e45 100644
> --- a/drivers/char/hw_random/iproc-rng200.c
> +++ b/drivers/char/hw_random/iproc-rng200.c
> @@ -12,8 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> =20
> diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/n=
pcm-rng.c
> index 9903d0357e06..8a304b754217 100644
> --- a/drivers/char/hw_random/npcm-rng.c
> +++ b/drivers/char/hw_random/npcm-rng.c
> @@ -8,12 +8,11 @@
>  #include <linux/init.h>
>  #include <linux/random.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/hw_random.h>
>  #include <linux/delay.h>
> -#include <linux/of_irq.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/of_device.h>
> =20
>  #define NPCM_RNGCS_REG		0x00	/* Control and status register */
>  #define NPCM_RNGD_REG		0x04	/* Data register */
> diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/o=
map-rng.c
> index 00ff96703dd2..be03f76a2a80 100644
> --- a/drivers/char/hw_random/omap-rng.c
> +++ b/drivers/char/hw_random/omap-rng.c
> @@ -26,8 +26,6 @@
>  #include <linux/slab.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> -#include <linux/of_address.h>
>  #include <linux/interrupt.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
> diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_ran=
dom/omap3-rom-rng.c
> index f06e4f95114f..18dc46b1b58e 100644
> --- a/drivers/char/hw_random/omap3-rom-rng.c
> +++ b/drivers/char/hw_random/omap3-rom-rng.c
> @@ -20,7 +20,6 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> =20
> diff --git a/drivers/char/hw_random/pasemi-rng.c b/drivers/char/hw_random=
/pasemi-rng.c
> index 2498d4ef9fe2..6959d6edd44c 100644
> --- a/drivers/char/hw_random/pasemi-rng.c
> +++ b/drivers/char/hw_random/pasemi-rng.c
> @@ -9,11 +9,10 @@
> =20
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/hw_random.h>
>  #include <linux/delay.h>
> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>
>  #include <linux/io.h>
> =20
>  #define SDCRNG_CTL_REG			0x00
> diff --git a/drivers/char/hw_random/pic32-rng.c b/drivers/char/hw_random/=
pic32-rng.c
> index 99c8bd0859a1..728b68b1a496 100644
> --- a/drivers/char/hw_random/pic32-rng.c
> +++ b/drivers/char/hw_random/pic32-rng.c
> @@ -12,9 +12,8 @@
>  #include <linux/hw_random.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> =20
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/=
stm32-rng.c
> index a6731cf0627a..efb6a9f9a11b 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -10,8 +10,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/=
xgene-rng.c
> index 7c8f3cb7c6af..c25bb169563d 100644
> --- a/drivers/char/hw_random/xgene-rng.c
> +++ b/drivers/char/hw_random/xgene-rng.c
> @@ -15,9 +15,8 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_irq.h>
> -#include <linux/of_address.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
>  #include <linux/timer.h>
> =20
>  #define RNG_MAX_DATUM			4
> diff --git a/drivers/char/hw_random/xiphera-trng.c b/drivers/char/hw_rand=
om/xiphera-trng.c
> index 2a9fea72b2e0..2c586d1fe8a9 100644
> --- a/drivers/char/hw_random/xiphera-trng.c
> +++ b/drivers/char/hw_random/xiphera-trng.c
> @@ -7,7 +7,6 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/hw_random.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> =20
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_b=
mc_aspeed.c
> index 2dea8cd5a09a..72640da55380 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -14,7 +14,6 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/poll.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_=
tee.c
> index 528f35b14fb6..76adb108076c 100644
> --- a/drivers/char/tpm/tpm_ftpm_tee.c
> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
> @@ -11,7 +11,6 @@
> =20
>  #include <linux/acpi.h>
>  #include <linux/of.h>
> -#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/tee_drv.h>
>  #include <linux/tpm.h>
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 7db3593941ea..e4030404c64e 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -25,7 +25,6 @@
>  #include <linux/acpi.h>
>  #include <linux/freezer.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/kernel.h>
>  #include <linux/dmi.h>
>  #include "tpm.h"
> diff --git a/drivers/char/tpm/tpm_tis_spi_main.c b/drivers/char/tpm/tpm_t=
is_spi_main.c
> index 1f5207974a17..c6101914629d 100644
> --- a/drivers/char/tpm/tpm_tis_spi_main.c
> +++ b/drivers/char/tpm/tpm_tis_spi_main.c
> @@ -28,7 +28,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
> =20
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/spi/spi.h>
>  #include <linux/tpm.h>
> =20
> diff --git a/drivers/char/tpm/tpm_tis_synquacer.c b/drivers/char/tpm/tpm_=
tis_synquacer.c
> index 49278746b0e2..7f9b4bfceb6e 100644
> --- a/drivers/char/tpm/tpm_tis_synquacer.c
> +++ b/drivers/char/tpm/tpm_tis_synquacer.c
> @@ -9,7 +9,6 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/kernel.h>
>  #include "tpm.h"
>  #include "tpm_tis_core.h"
> --=20
> 2.40.1

drivers/char/tpm/**

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
