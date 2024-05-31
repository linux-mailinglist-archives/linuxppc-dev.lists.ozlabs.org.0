Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA458D621C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 14:47:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=oYkuGcIQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNFH0cz9z30Wn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=oYkuGcIQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNDV0rnfz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 22:47:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E8E739C096E;
	Fri, 31 May 2024 08:46:56 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id N0Q0BSSbY1Ew; Fri, 31 May 2024 08:46:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1E8009C57BB;
	Fri, 31 May 2024 08:46:56 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1E8009C57BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717159616; bh=WZsGaXJZZy+fsZIWjtMJ5qii2e1R2StcjqgwWGh4rzM=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oYkuGcIQvuwxk6I666pfXOLWp7nkCgMUkaYIr2KQrs3bgmDsBR79pRVbnu0NEuXK8
	 q1B2ZWcMdTjnepT9d9fsPLgYpVOCHaqsGy83oO81cewL2M1hDBv8Szy8h8yXPcm7YC
	 tBsNPGu3J/wl3rmLcBWP4TTDRJcIzomA8ding+1cAd+wrKQ1eBEEtlt1EeRHwOQLIz
	 sZEKu33lVdIXMbswKBJn+98Sajqt753aE8OXfOeEbtctkIkgY1i19mb+x0kyVAssjK
	 D+vEcjxO1i116xIA3wQZodBgXfjI3joArFzWteHEidTw5afIbLsxqY/5izO0Sv7F56
	 C1tukavT0XWFg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Dx2jCPthSXWX; Fri, 31 May 2024 08:46:55 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D57F99C096E;
	Fri, 31 May 2024 08:46:55 -0400 (EDT)
Date: Fri, 31 May 2024 08:46:55 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <1660761484.701255.1717159615755.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com> <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk> <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com> <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic codec
Thread-Index: fcftgDhNt5MliZw6sGsrnH7v0rWaiA==
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
Sent: Friday, 17 May, 2024 13:17:20
> On Fri, May 17, 2024 at 05:05:35AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
>> > On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:
> 
>> >> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
>> >> +		if (!IS_ERR(cpu_sysclk)) {
>> >> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
>> >> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
>> >> +			clk_put(cpu_sysclk);
>> >> +		}
> 
>> > I don't really understand the goal here - this is just reading whatever
>> > frequency happens to be set in the hardware when the driver starts up
>> > which if nothing else seems rather fragile?
> 
>> The driver allow to set the sysclk frequency
>> of the CPU DAI through `priv->cpu_priv.sysclk_freq` when calling
>> `fsl_asoc_card_hw_params()`.
>> Currently it is hard-coded per use-case in the driver.
> 
>> My reasoning was that with a generic codec/compatible, there might
>> be use-cases needing to use this parameter, so I exposed it here via DT.
> 
>> Is it a bad idea to expose this parameter ? This is not a requirement for the
>> driver to work, most of the current compatibles do not use this parameter.
>> It is currently used only for `fsl,imx-audio-cs42888`.
>> In that case I can remove this commit.
> 
> I'm having a hard time connecting your reply here with my comment.  This
> isn't as far as I can see allowing the frequency to be explicitly
> configured, it's just using whatever value happens to be programmed in
> the clock when the driver starts.

In v3 I used parameters `cpu-sysclk-freq-rx/tx` to explicitly
set the frequency.
In its review Rob Herring said that the clock bindings should
be used, so that's why I changed it to use this `cpu_sysclk` clock.
