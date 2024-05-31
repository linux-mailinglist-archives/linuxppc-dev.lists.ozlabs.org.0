Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B4D8D6226
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 14:48:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FzJMj/lB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrNGC0yrNz30T0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 22:48:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FzJMj/lB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrNDr4VlBz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 22:47:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E16039C096E;
	Fri, 31 May 2024 08:47:22 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id RoyjbGfD5dWH; Fri, 31 May 2024 08:47:22 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5C8FF9C57BB;
	Fri, 31 May 2024 08:47:22 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5C8FF9C57BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717159642; bh=EgSdYLrxxil3DM2ZfEl9AZaBLurlfnS7atm+wMgVU5M=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=FzJMj/lBQgsaylMZozyQI2kIuLdeUCa2HURR7HPzGXXXZVlJTOgmNAMKseJ2KzE0e
	 j+LJ0vqdOFwvAfgJvmAh6/1qIre+43sFCrAVETVmoS971gpKsOryyb3kPVx9pr5xKI
	 5lQnazBd19NEpCjTdgkIF5rU6fAUAGcEa5ISXITdEkGEFregawm7Sto3AwQE0W4wjk
	 XMmxUw46cr1Ec/RiCHKwDDSHhIJ+YhSIInROB0kSDCCCbCfM+5/txtbKhbo1wFuM12
	 OmcgGSObwusX8pOV4FXRcKXLsb+He224rFMi976Vn2s+tQiLILQIK5h3Ia3xOO8TiG
	 7/7/A26s54wKw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 30jGWh-XiV8C; Fri, 31 May 2024 08:47:22 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2911D9C096E;
	Fri, 31 May 2024 08:47:22 -0400 (EDT)
Date: Fri, 31 May 2024 08:47:22 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <477405270.701257.1717159642136.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com> <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com> <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk> <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com> <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: fsl-asoc-card: add DT property "cpu-system-clock-direction-out"
Thread-Index: fy+ROOUy4SJ9oY7KJCX4xYYvCNq6Yw==
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
Sent: Friday, 17 May, 2024 13:06:03
> On Fri, May 17, 2024 at 05:05:38AM -0400, Elinor Montmasson wrote:
> 
>> This new compatible is intended to be used when there is no codec
>> device/driver. There is technically no codec device/driver for which
>> the clock input can be set.
> 
> This is obviously not true, there clearly is a driver.
> 
>> Is it a bad idea to allow setting the cpu sysclk direction only ?
>> Should the compatible be limited to use-cases where the cpu sysclk
>> direction cannot be set by the machine driver ?
> 
> When I said "this should use the clock bindings" I meant that we should
> use the clock bindings for configuration here.

As far I as know, it's not possible to set the direction with
the clock bindings, but maybe there is and I missed something ?
