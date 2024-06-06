Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7B8FF0E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:40:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=MNHRvRGF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw7nQ3pqVz3fnx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 01:40:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=MNHRvRGF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw7mg0J8Pz3fn4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 01:39:29 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2698D9C2AA2;
	Thu,  6 Jun 2024 11:39:25 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id HrID-BG8ze49; Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 888079C5ABA;
	Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 888079C5ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717688364; bh=rYRVIIw22ZVkSQXnTBWHvN7qfAPVVfCh/LRBnQMA1mw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=MNHRvRGFyj67QeHiozGPa24sXXRlCMyLfd7jNHNA5jveZIw1fEh2VzMUM8F1eT+rD
	 lwk4iYhNLjA70F5wA6ZGWuYV1MwyONWNZ2Q1TL0NzdGiF/A9Coxc95tA+hAB7T/QgI
	 kmBgd1NfRVqUpiQYsNGpvBhNTskeGmFZiWy5RGkC1qoLweYdojg5mUdmi+fAy0oLpN
	 M0eDRwuz8BImBwfN/U453mrzZAC6ZxfpCbriv2KLdHhPn7ez/mfuhAFaKY/4oA/lBe
	 s9Ra9Q6ckJDy1JDMXHijrmuj7Hm4RpGtGTPK5RfzonZdM6fnBRN9O9STLBPYkp7KoY
	 gbNO0HthXgqYw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ijXDkcF8BT_c; Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 457D19C2AA2;
	Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Date: Thu, 6 Jun 2024 11:39:24 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <1976575756.1264121.1717688364234.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk> <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com> <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk> <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com> <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk> <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com> <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: M+CiOw9Z1pP82SMivcOcvVDKOApGiw==
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

> From: "Mark Brown" <broonie@kernel.org>
> Sent: Friday, 31 May, 2024 18:06:30

> On Fri, May 31, 2024 at 10:48:14AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
> 
>> > Why not just use the existing compatible - why would someone not want to
>> > be able to use the ASRC if it's available in their system?
> 
>> That's true but it will be a problem if both `fsl-asoc-card.c` and
>> `imx-spdif.c` drivers have the same compatible, and they don't
>> have the same DT properties.
> 
> So merge the two then?

It would avoid having duplicate drivers yes, I will do this for the v5 of this contribution.
Thank you for the review.
