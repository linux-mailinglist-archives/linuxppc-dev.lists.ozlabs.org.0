Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB78C82F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 11:06:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=oG1T2vdH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgh0H1j7gz30Vl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:06:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=oG1T2vdH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VggzX3lvpz30TW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 19:05:44 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8B8DB9C58EA;
	Fri, 17 May 2024 05:05:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ycSku0e4je0q; Fri, 17 May 2024 05:05:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E1D8D9C591F;
	Fri, 17 May 2024 05:05:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E1D8D9C591F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715936741; bh=cx6CQV5YfxghVjmPjejucL2olCe90bCSbFqa4g71+0M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oG1T2vdHJ7olkf/IEQ4rw1h56wPiTy9nafFlLPsGCZwsqEJt/hBQwoXKYfPbmqn2h
	 qZu2NlE4sQ8A4gbFeK5DUxGaN4+8TNLmbIKDfM5+i/QQN7IS+ya2Uh+JmKsmsSkqf5
	 MBGTtuIp7xLTlE+3yW/sFKWA4LY7drC0AoeY8TdAT7jSKPSGqa4jIqgy8pHLsrqkyh
	 yAcrOiTjeSJLLtXbpZhHcSON6ooFo3JQVIidV1+HLSXl00uXRf6t6r0H3XspC0vWKO
	 wEcQ2mrCYmQ0xuC6DEzFord8S+Lfc/I7cQ++SWegOi5kEYBQ0bQ2PDnlLdkJZIuoH9
	 7VWRve/a3Uxng==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UkPCSXxrdA7W; Fri, 17 May 2024 05:05:41 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id ABB829C58EA;
	Fri, 17 May 2024 05:05:41 -0400 (EDT)
Date: Fri, 17 May 2024 05:05:41 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com> <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic codec
Thread-Index: 5nXwooIVrjUMUfEG3TeQl8yJKNJb9Q==
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
Sent: Thursday, 16 May, 2024 14:11:11
> On Wed, May 15, 2024 at 03:54:11PM +0200, Elinor Montmasson wrote:
> 
>> Add documentation about new dts bindings following new support
>> for compatible "fsl,imx-audio-generic".
> 
>>    audio-codec:
>> -    $ref: /schemas/types.yaml#/definitions/phandle
>> -    description: The phandle of an audio codec
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      The phandle of an audio codec.
>> +      If using the "fsl,imx-audio-generic" compatible, give instead a pair of
>> +      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
>> +      spdif_receiver second (driver SPDIF DIR).
>> +    items:
>> +      maxItems: 1
> 
> This description (and the code) don't feel like they're actually generic
> - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
> something called -generic to cope with single CODECs as well as double,
> and not to have any constraints on what those are.

I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
the compatible "fsl,imx-audio-no-codec" instead of "generic".
Krzysztof thought it was too generic, but it would convey more clearly
that it is for cases without codec driver.
Would this other compatible string be more appropriate ?

Best regards,
Elinor Montmasson
