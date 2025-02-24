Return-Path: <linuxppc-dev+bounces-6422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC6FA421CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:48:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1hsZ5f0sz2yPG;
	Tue, 25 Feb 2025 00:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8:216:3eff:fe9d:e7b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740404930;
	cv=none; b=Jx6JXkmoWap1j5My/0TqX9YDXjAP/2B5wnMLkAZXrhV4E2kkJ2BFLVFFekG8olalMQGPp0WV0u3829Mw5F86hCkKdHwVwO2HCZdPs6tl3oHrp1oeflXjNN+Pe6loV0D0nzQPPGPrgK7EaYxrWMxH9nvBHeVHNvESFD8QJNhl4AfsIukquqRVlbqNgWafJKkwAzPQOmhLTxhqnCnV1NUZXT2LZQyxjAopBw7YL0z4xER/C/X0FnQPTP/zXSRv4mXtvTFyzvAy6EJ3OHZQjrBajczceseQtM00kJkgTAqHpY155h1w1OZQZldOv1Z4c5WNku8ssPGzR18e643xCun4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740404930; c=relaxed/relaxed;
	bh=cIagspXsyAvHsd8swjUvOQxymK0QzUmAeQhYVXlxXmw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdkEHaJnoYmWPV5gi4fIo41btshA6P4VN8vv5CA8zQE4M2xkQANCzCJG+WSZxUgK3nS/VJuzv0JAlShyMuwnw+9/rlp4a9T9mQu10/6eH6QiEkwdcQcuOjWd7rsP/73klI8hi+kN+oW4JZGc2hbIBS8yfKxDybDYO09q9BbprDtrons0vuPDzkmnmGCZ8e8LWJXnoMPI7DCpclaHrGFVBnx8IsRsJTWqe5+09Mam/ACK8PXnynl7soYFHDQAA0xzOeWJ7WFIgwnB2fKNF3EVM1t05ZUlVNJAmD3NCe7/aGoqHt5cE1osVaOKP5jl4HKy4u3EHNpnzfoJHY2T1uGUNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bkRLBWZS; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bkRLBWZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8:216:3eff:fe9d:e7b4; helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 899 seconds by postgrey-1.37 at boromir; Tue, 25 Feb 2025 00:48:48 AEDT
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [IPv6:2001:4b98:dc4:8:216:3eff:fe9d:e7b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1hsX6kXbz3050
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:48:48 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 962C658648C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 13:33:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5874E432EB;
	Mon, 24 Feb 2025 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740404018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIagspXsyAvHsd8swjUvOQxymK0QzUmAeQhYVXlxXmw=;
	b=bkRLBWZSZYwEnqDK+klu7rd0l1E+6IiG/EYUYbESdAfhkj4M9ALlTJHtr+pVyFDLerKsE/
	T1hopPA/Z0C32ITyH4ZsnAWWStf9Bpeyx2lXc+mvhad48M4ewoWgz7gZI2oG6TgsE3k+Sd
	98JOcpeli4mW61IPIk8R4h+AvcFEzVKQbtp9S4hp4l0qvqhNsJm8VXZMqdGi0vfnTE4XSg
	Nh9cOR7gZ/e0+9Rgw6KF05mjQv4hBr1iclFE18TVDRfwt+b6CCmKgMajR5bofvM6vNmcss
	My0CYfv4Gl0NhQFesREjV+1ixiwIf0wkPDsC0oIAeGSmrd9hEKAWWwYConETxA==
Date: Mon, 24 Feb 2025 14:33:36 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove unnecessary bool
 conversions
Message-ID: <20250224143336.75fe1e10@bootlin.com>
In-Reply-To: <20250223202741.1916-2-thorsten.blum@linux.dev>
References: <20250223202741.1916-2-thorsten.blum@linux.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepthhhohhrshhtvghnrdgslhhumheslhhinhhugidruggvvhdprhgtphhtthhopehshhgvnhhgjhhiuhdrfigrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepighiuhgsohdrnfgvvgesghhmrghilhdrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghothhsuhhkrgesghhmrghilhdrtghomhdprhgtphhtthhop
 ehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 23 Feb 2025 21:27:41 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> Remove unnecessary bool conversions and simplify the code.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  sound/soc/fsl/fsl_qmc_audio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
> index e257b8adafe0..b2979290c973 100644
> --- a/sound/soc/fsl/fsl_qmc_audio.c
> +++ b/sound/soc/fsl/fsl_qmc_audio.c

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

