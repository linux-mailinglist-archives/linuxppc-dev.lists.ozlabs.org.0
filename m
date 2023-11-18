Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752D87EFCC0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 01:48:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IQs7w7qt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXFWX0r8Wz3dLQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 11:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IQs7w7qt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXFVd0SYFz3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 11:47:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0994CE263D;
	Sat, 18 Nov 2023 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8519BC433C9;
	Sat, 18 Nov 2023 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700268468;
	bh=t57+RslQFeKnJM3h8s2TI3ZEoZEyxEDagVoPEqzUmqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IQs7w7qtKk/3FDjQkfTHKofphFehwcjkn9sjAVqiiHlSDHnFUcUkqWO8Pgy3/zFmE
	 AYMxPhjIt2GLa120lU8rpSUpci65qybU5kUTOhFbIfkFH3RLmL0sN3R9pYs16YqCSF
	 XRxSzYGV2+s2rvQbEXVZ4MHsne/RFlWGj9KeEMZjxZdhMEnzuEyTkQv/OnyofsMWZZ
	 CaTDitfbHF8ZXhHsP7bVr9bMIlJ4g2xPv9dMUPOon34EIUZXPEStD4TybsNM0X4xAW
	 O8zkdi3a45WxLIZPa8lYBeydEX+isHSwUwieWbWg0ggRi230gqABIRCwmK0BxaEy1j
	 Q5HjtqnDzNerw==
Date: Fri, 17 Nov 2023 16:47:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231117164746.0589e955@kernel.org>
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>, lin
 uxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
>    - Removed Patches 6, 7 and 8 (patches applied)
> 
>    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
>      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

I thought someone (Mark?) asked for the networking stuff to be put 
on a branch. If that's still the preference - is it possible to factor
these out as a standalone series, too?  Will they build on their own?
