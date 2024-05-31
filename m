Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679678D622D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 14:49:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=jAPZBpE5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNGz4b68z3cQM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:49:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=jAPZBpE5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNFf4VM9z3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 22:48:06 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 098449C5848;
	Fri, 31 May 2024 08:48:05 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7N-5VYmiZOoY; Fri, 31 May 2024 08:48:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5AD0E9C595F;
	Fri, 31 May 2024 08:48:04 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5AD0E9C595F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717159684; bh=h3D/uAawc+I8RbHTAiC8n84YabIXpASHjQyR/gpbrgE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jAPZBpE5nA8mMRoFEtnR1W6Zxjja92p20x6h8UBQhn2VAhdjUCUIE99bWFtrG1SZ/
	 2rgsowCsQ+qWOXBktjyvP8RHaKFXQcSvymNZ8xPQiwraAL7iv/ny7lk3Uw/65LmfMc
	 MWyOEp9aGhNxCeSA8Mu8btlz266RwXJsZCEdehRlne92gwvkwt4HF6araHi24pt5wY
	 hi8uxxjhd+7PJefByXIjys01r5vqtsBzJ8deyrqXfhIk/VcH8UJFnQWg/MlllBHreg
	 hhBfmUo92dFl7h6dXXi6sWAx6e2mzSubC4yWqwWg4v5D/lu4UsnKjSX+zbBbjQ0jp0
	 7b2bKmYaz/3LQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 14T-wh3CS_eR; Fri, 31 May 2024 08:48:04 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2249C9C58EA;
	Fri, 31 May 2024 08:48:04 -0400 (EDT)
Date: Fri, 31 May 2024 08:48:04 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com> <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk> <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com> <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: +Nt1Jr68s5Clyi+hmHO4sX8bYCaHcg==
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
Cc: devicetree <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, alsa-devel <alsa-devel@alsa-project.org>, Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound <linux-sound@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, shengjiu wang <shengjiu.wang@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Friday, 17 May, 2024 13:11:43
> On Fri, May 17, 2024 at 05:05:41AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
> 
>> > This description (and the code) don't feel like they're actually generic
>> > - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
>> > something called -generic to cope with single CODECs as well as double,
>> > and not to have any constraints on what those are.
> 
>> I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
>> the compatible "fsl,imx-audio-no-codec" instead of "generic".
>> Krzysztof thought it was too generic, but it would convey more clearly
>> that it is for cases without codec driver.
>> Would this other compatible string be more appropriate ?
> 
> No.  There is very clearly a CODEC here, it physically exists, we can
> point at it on the board and it has a software representation.  Your
> code is also very specific to the two CODEC case.

Then maybe it's not be a good idea to make this compatible generic
for this contribution.
The original intention is to bring support for the S/PDIF,
so maybe the contribution should focus on this use case?
In that case, would changing the compatible for "fsl,imx-audio-spdif-card"
be acceptable?
"fsl,imx-audio-spdif" is already used for the `imx-spdif.c`
which does not use the ASRC.
