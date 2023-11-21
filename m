Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925D7F33B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 17:30:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=akn0TQ1t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZVGQ6v3Kz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 03:30:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=akn0TQ1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZVFV4WXMz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 03:29:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 478C461A81;
	Tue, 21 Nov 2023 16:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914BEC433C7;
	Tue, 21 Nov 2023 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584148;
	bh=I7rTz58KR+S4gPSJUCHMuvvrAgbVHDd5w5snGcC6fmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=akn0TQ1tx9tIwVVjKiVUiShOxIyrgDS6HtWnmTgRUnnSklSjnfnhzl6+GuCsg5RjU
	 9SptLlLrBWaCEUXZt0ADSJ8CEKkqk2wF9KzP8cpzH4Gx09Owg9SZqDfyLEIg5QoKtl
	 yQghzy2Lc/VM67gqmGXGWcz4FaVbhGzQPssRmIrwgDrV26t4om/KFBJPyKHznpDeiP
	 wuqu+EX+sVaxwVH4N3+S5L9cHSc3CZb/Ev9j42UeMW/BbZmfG/VtCndmMqUDv495E7
	 YkCJYcWckqEaSJD5gcvnhn23OD3MEoSCXL9FZ8InCUW36S86FsgcPUYQUVaL1QHMTK
	 eeh5PRJrW3VzQ==
Date: Tue, 21 Nov 2023 08:29:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231121082906.354c9a7e@kernel.org>
In-Reply-To: <20231121084330.4064bf14@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
	<20231117164746.0589e955@kernel.org>
	<573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
	<20231121084330.4064bf14@bootlin.com>
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

On Tue, 21 Nov 2023 08:43:30 +0100 Herve Codina wrote:
> I plan to send the v10 with the patch 23 fixed.
> Based on that v10, some patches (21 to 25 at least) could be applied and
> I will remove them for the future v11.
> I think it will be easier to follow if I iterate on the series removing
> patches as soon as they are applied.

It'd be helpful if you only reposted the patches you expect
to be applied, as a standalone series.
