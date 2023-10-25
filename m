Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5E57D7045
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 17:01:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Q3kFInjh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFsb85Qjnz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 02:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Q3kFInjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFsZF2KNlz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 02:01:05 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8F43C000F;
	Wed, 25 Oct 2023 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698246054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yH7ih/sENBHheaY4sC23vjZWR5QPhO2FB5uDgGmBUEE=;
	b=Q3kFInjh7UIlv2i9yjPV+QU4V85L5o5uVFoPjbdjL//6+E7uHPH6qKo6VtFDApky9mvBZR
	DLu9NkXUD5OxfTo6itNQvOGypacNFCTLN9WVTaPz0FqcOhRwPMyGfxtOcSfDuL7/skp8vX
	Xi0TkyJYpNrsUrKOLGJVtQuYOi+gWoYdjSS/UVjEa2e22L9HGWc4DrymLHD7I/JWSwkFqm
	89zhexE6c2ltXbqig51XVG6K1DOiQZZDzAVHFzwstX5/KXfaw66BE90pcuR8wCZ76roTNp
	RW+shC4dBtvTe/L6r6lvIDt4EzZod8+c2krxeBAs7QIBUwZpDZyN+x2UlhjNHw==
Date: Wed, 25 Oct 2023 17:00:51 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231025170051.27dc83ea@bootlin.com>
In-Reply-To: <20231013164647.7855f09a@kernel.org>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
	<20231013164647.7855f09a@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

Hi All, Maintainers

On Fri, 13 Oct 2023 16:46:47 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 11 Oct 2023 08:14:04 +0200 Herve Codina wrote:
> > Compare to the previous iteration
> >   https://lore.kernel.org/linux-kernel/20230928070652.330429-1-herve.codina@bootlin.com/
> > This v8 series:
> >  - Fixes a race condition
> >  - Uses menuconfig instead of menu and hides CONFIG_GENERIC_FRAMER
> >  - Performs minor changes  
> 
> Which way will those patches go? Via some FSL SoC tree?

This series seems mature now.
What is the plan next in order to have it applied ?

Don't hesitate to tell me if you prefer split series.

Best regards,
Hervé
