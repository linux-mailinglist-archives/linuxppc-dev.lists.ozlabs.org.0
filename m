Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC3914568
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 10:53:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ZF75jHtR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W71vQ2BSNz3cQD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:53:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ZF75jHtR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W71sx51mNz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 18:51:49 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B13679C5B22;
	Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Yay1jmjOC1gx; Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 124E39C5B37;
	Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 124E39C5B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719219108; bh=+ewUDykI/UOo/DB+dq3CVz3C8NuvvWDy733CasIbz4A=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ZF75jHtRyN/E+RU5Ga21+MkO2BXXJSV6H2W+pCjcTgNujcFmOIXVqY7JjqZ9vwvFO
	 M6t28Bvegah97B/e3A6ci9Tuz9FC4Fz45HTdnASJQ/UYgSECWsk9QNtKhyKmXi67QN
	 ZGHHMYMKF84OOipXbCu5stuV+2k9KLWMFKXFrRTaat2k1Py1ktCbIZ+pyBdx5RFFCf
	 r4q/lCcpIdaPfshIVVcj+KE4UhRPzv3wjWC9dxMMu4bhDseYxbJ3EdkjIpRg4jMJMI
	 m+W7Cp2+7l7erRK0wqedzzhmDLFHVkqSE+wtSjyWoEQzpPzEufpPSXy1x8m4ZTGK6b
	 B8k0VV056KtmA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id m5StIy1xy9No; Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CA5529C5B22;
	Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
Date: Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <1566099232.1714447.1719219107779.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <17a0efe3-72fa-4d13-b3b0-90e6640308f3@kernel.org>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com> <20240620132511.4291-8-elinor.montmasson@savoirfairelinux.com> <17a0efe3-72fa-4d13-b3b0-90e6640308f3@kernel.org>
Subject: Re: [PATCHv5 7/9] ASoC: dt-bindings: imx-audio-spdif: remove
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: imx-audio-spdif: remove binding
Thread-Index: SJweIeCS/c+5zCPba7GA4ZNFgX6eoA==
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
Cc: imx <imx@lists.linux.dev>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>, shengjiu wang <shengjiu.wang@gmail.com>, Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-sound <linux-sound@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Krzysztof Kozlowski" <krzk@kernel.org>
Sent: Sunday, 23 June, 2024 13:09:33
> On 20/06/2024 15:25, Elinor Montmasson wrote:
>> imx-audio-spdif was merged into the fsl-asoc-card driver, and therefore
>> removed.
> 
> So what happens with all existing users (e.g. DTS)? They become
> invalid/not supported?


Next commits, 8/9 and 9/9, update all DTS files that currently use
the "fsl,imx-audio-spdif" compatible.
From the users point of view, currently configured spdif audio cards
will behave just the same.


> After quick look, I do not see backwards compatibility in the driver and
> above commit msg tells me nothing about ABI break.


For the next version I will state in this commit message the upcoming modifications to DTS
and compatibility, why it will be done, and that support for existing DTS is not dropped.

Previous `imx-spdif` driver used the dummy codec instead of
using declared spdif codecs. It was discussed in previous version of this contribution
that using the dummy codec isn't good practice. So one to one backward compatibility
isn't really possible.


Best regards,
Elinor Montmasson
