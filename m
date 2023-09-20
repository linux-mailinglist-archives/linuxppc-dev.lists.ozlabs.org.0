Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD857A77A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 11:35:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hHW7X4m7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrD0g3cG3z3cDg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 19:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hHW7X4m7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrCzr1S2Jz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 19:34:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6E0ACCE1AA7;
	Wed, 20 Sep 2023 09:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BA7C433C8;
	Wed, 20 Sep 2023 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695202484;
	bh=QRqraJthrB8s9rPFRvGC6l5CWWwWQnee/47O8rOjCCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hHW7X4m7KYpDH5gfY61PdqOpjN3Y7rHvb8kCZPi2x4QeZ4282xmLjtH/VG98fLLt2
	 nnMOFneixT9add37HLtFNJq4cPxFz0G0CYiPYBF4mfuu0Wd7Ylcic2Yyig9S88zxI/
	 wZ1y138LMKQb3ZE6Dc99cRaKauE718Qsi7GkZqONwyB7rIFvccLpXII9v54328Y5Xf
	 QMXEZusEupYfBMolEIdWaI69MR1OWSs30AEjcVl3TLDIdedsK3IFxjtHA+Oc2h17Q8
	 HkBgJqIzsp7+r3Xf1XkVKFMg6EwaPxvbBnArHbwZ0wuxPx8VLJEKw6szjW+9BTpb7T
	 nXEayUPV2CyBA==
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>, 
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v4 23/28] mfd: core: Ensure disabled devices
 are skiped without aborting
Message-Id: <169520247904.3353856.9378855807085829647.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 10:34:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Aug 2023 18:39:17 +0200, Christophe Leroy wrote:
> The loop searching for a matching device based on its compatible
> string is aborted when a matching disabled device is found.
> This abort prevents to add devices as soon as one disabled device
> is found.
> 
> Continue searching for an other device instead of aborting on the
> first disabled one fixes the issue.
> 
> [...]

Applied, thanks!

[23/28] mfd: core: Ensure disabled devices are skiped without aborting
        commit: 36d139dc63db18eb95165fcc2bd3c670c948d605

--
Lee Jones [李琼斯]

