Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8A64701A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:53:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYwk57vYz3fSb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrs09zcz3bhJ;
	Thu,  8 Dec 2022 23:49:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrj1Gmbz4xZg;
	Thu,  8 Dec 2022 23:49:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Fair <benjaminfair@google.com>, Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Patrick Venture <venture@google.com>, Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Avi Fishman <avifishman70@gmail.com>, Li Yang <leoyang.li@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Jeffery <andrew@aj.id.au>, Nicholas Piggin <npiggin@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, UNGLinuxDriver@microchip.com, Benoît Cousson <bcousson@baylibre.com>, Michael Ellerman <mpe@ellerman.id.au>, Stefan Agner <stefan@agner.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Lunn 
 <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
References: <cover.1669999298.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 00/11] Fix pca954x i2c-mux node names
Message-Id: <167050321678.1457988.4158904572849937193.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:16 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Dec 2022 17:49:15 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> According to the I2C bus multiplexer/switch DT bindings, i2c-mux nodes
> should be named "i2c-mux" (or something similar).
> This patch series renames nodes for pca954x i2c-muxes that are flagged
> by
> 
> [...]

Applied to powerpc/next.

[11/11] powerpc: dts: fsl: Fix pca954x i2c-mux node names
        https://git.kernel.org/powerpc/c/3ae7c96dd51025550c8001c6f833337f11d00807

cheers
