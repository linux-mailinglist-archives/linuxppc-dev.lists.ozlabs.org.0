Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B695E8C82F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 11:07:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=QNEjG5K0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgh1r16VFz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:07:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=QNEjG5K0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VggzW0BCtz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 19:05:41 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 68ACA9C57A6;
	Fri, 17 May 2024 05:05:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id j0EVtTFCV_in; Fri, 17 May 2024 05:05:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A809E9C5864;
	Fri, 17 May 2024 05:05:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A809E9C5864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715936738; bh=8SLwMepymaYZWEVQR9qjp1ldhDA0f4QIis7dKy4nHYQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QNEjG5K0CVnFA9ZM/PRvc2Zh6zP52Jks46QB+HzouGEwR8al3i5mGFG0E5hvkLxtW
	 jfJ0SmCrlxlkZjINYMKaDg0MzSgXZF+dWcIR+U5mF1YLwKUQqxSR/rNglVfpOYRRHe
	 Q8j7N0STKjp3oer40wADQ2Z3ri5pzW/8IgB9iMEWVcZtBZvRiCaSlT5SxwyLb18z3l
	 jb4pS4ZMdyOkK+SG2G5CSZn3dOpF0dtrQ4GGm5L2T2yGSMa1QovS+6jG5alPggxGy1
	 bRttWhmsfaminOQaDm/e93JkQ62jvrh3sCo/c3AU/rSd1IcYreNd6bkHhTYfERy/ds
	 epm+dfcegME8w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ydHCeB7dNc_i; Fri, 17 May 2024 05:05:38 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7254F9C57A6;
	Fri, 17 May 2024 05:05:38 -0400 (EDT)
Date: Fri, 17 May 2024 05:05:38 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com> <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT property "cpu-system-clock-direction-out"
Thread-Index: GFI3lOelC49AXb+0LrXDbBRGlEMPdA==
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
Sent: Thursday, 16 May, 2024 14:18:00
> On Wed, May 15, 2024 at 03:54:10PM +0200, Elinor Montmasson wrote:
>> Add new optional DT property "cpu-system-clock-direction-out" to set
>> sysclk direction as "out" for the CPU DAI when using the generic codec.
>> It is set for both Tx and Rx.
>> If not set, the direction is "in".
>> The way the direction value is used is up to the CPU DAI driver
>> implementation.
> 
> This feels like we should be using the clock bindings to specify the
> clock input of whatever is using the output from the SoC, though that's
> a lot more work.

Similarly to patch 7/9, I exposed this parameter because the driver has it, and
because there might be CPU DAIs needing this parameter.
Otherwise the cpu sysclk direction will always be IN as a default.
This parameter could be needed for cases with CPU DAIs, such as an SAI,
which can provide or consume Tx/Rx clocks.
For these devices I know the sysclk direction should correspond to
what was set in the dai format.

This new compatible is intended to be used when there is no codec
device/driver. There is technically no codec device/driver for which
the clock input can be set.

Is it a bad idea to allow setting the cpu sysclk direction only ?
Should the compatible be limited to use-cases where the cpu sysclk
direction cannot be set by the machine driver ?

Best regards,
Elinor Montmasson
