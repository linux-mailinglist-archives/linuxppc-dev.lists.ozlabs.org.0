Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 780637D7460
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 21:33:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NNjzDaSG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFzc325z8z3cC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 06:33:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NNjzDaSG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFzbB1DnVz3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 06:32:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 327CFCE37DB;
	Wed, 25 Oct 2023 19:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A68C433C7;
	Wed, 25 Oct 2023 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698262338;
	bh=ZEC6SiD956fvl4s5yXxFlRFIaaeMysUnrTT9R0rL6uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NNjzDaSGX6Xm/ojy0S9ANDFMlr6eKMq9gQjnX+RSpD7B6pmXp9N1HZQcj7PnMXOaI
	 FPlk4cYKswApKmXKwZtFkLHe8Wd/MGYdolE+3ljriPunliyXP8I6vwS6kAryW675n0
	 w/YJ6ecaLbusz7GPBlZLWXa9nVVhQt+FCaqUj3I0522oj4hgjjsfiT7CU/6YwIxKv6
	 OBBMTyKRN8L2N3992/sREdR/vhMVZ/pCX7XS1EACF7/FZ1FaIqIV7XziFecwMyGOws
	 k2n7E3UYYAEQWd4eT7A7Ot5Gnu5jV3LmcJLia/oW/bjKXaWWcLXjfbX3XZgi/vuvgS
	 jaj/Vm8Qz315A==
Date: Wed, 25 Oct 2023 12:32:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231025123215.5caca7d4@kernel.org>
In-Reply-To: <20231025170051.27dc83ea@bootlin.com>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
	<20231013164647.7855f09a@kernel.org>
	<20231025170051.27dc83ea@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Simon Horman <horms@kerne
 l.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > Which way will those patches go? Via some FSL SoC tree?  
> 
> This series seems mature now.
> What is the plan next in order to have it applied ?
> 
> Don't hesitate to tell me if you prefer split series.

FWIW we are happy to take the drivers/net/ parts if there is no hard
dependency. But there's no point taking that unless the SoC bits
also go in for 6.7.

Li Yang, what are your expectations WRT merging this series?
