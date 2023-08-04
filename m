Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237D76FD7A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 11:37:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLGS3kk2z3dwQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:37:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLFf5r7Xz3dhB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:36:37 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qRrDk-003baN-9J; Fri, 04 Aug 2023 17:35:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 04 Aug 2023 17:35:44 +0800
Date: Fri, 4 Aug 2023 17:35:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] hwrng: Explicitly include correct DT includes
Message-ID: <ZMzGcMJh6TA+V+p5@gondor.apana.org.au>
References: <20230728134828.3224218-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728134828.3224218-1-robh@kernel.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Benjamin Fair <benjaminfair@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, Deepak Saxena <dsaxena@plexity.net>, Ray Jui <rjui@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, Olivia Mackall <olivia@selenic.com>, linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea
  <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28, 2023 at 07:48:27AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>  - Split out hw_random, ipmi and tpm
> v2:
>  - Fix build for pic32-rng.c dropping of_match_ptr()
> ---
>  drivers/char/hw_random/atmel-rng.c     | 2 +-
>  drivers/char/hw_random/bcm2835-rng.c   | 3 +--
>  drivers/char/hw_random/ingenic-trng.c  | 2 +-
>  drivers/char/hw_random/iproc-rng200.c  | 3 +--
>  drivers/char/hw_random/npcm-rng.c      | 3 +--
>  drivers/char/hw_random/omap-rng.c      | 2 --
>  drivers/char/hw_random/omap3-rom-rng.c | 1 -
>  drivers/char/hw_random/pasemi-rng.c    | 3 +--
>  drivers/char/hw_random/pic32-rng.c     | 5 ++---
>  drivers/char/hw_random/stm32-rng.c     | 3 ++-
>  drivers/char/hw_random/xgene-rng.c     | 5 ++---
>  drivers/char/hw_random/xiphera-trng.c  | 1 -
>  12 files changed, 12 insertions(+), 21 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
