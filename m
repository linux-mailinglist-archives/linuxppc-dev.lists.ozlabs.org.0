Return-Path: <linuxppc-dev+bounces-7939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC4A98FF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 17:15:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjN2s5d0sz2xKh;
	Thu, 24 Apr 2025 01:15:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745421333;
	cv=none; b=mzWThAIhahtA0ClKLgq8WfyawZdLFAEBdWPU4kbZOLEK1s4lUeizylfEnS6NUEkLVGmL1uUXjvMJ1ntmaUwNwcPsYLqar8fRqFnk/hJHZUm2+Y1ORRz6XM2rCIRd29QH17PDWZfeGwzwp2uR8vO6eI+urpgvLuVkzJjULfCMvIhiIw1Oqg43r7QEdEfosls6teFdGnTMeaSSPhLJynZ1xJtE1eXH9/4t+xn0mi1focSbQA14GCZMC6C29j5SJQSDoQEHAevgoXKMqLo34aEdRvD7Jmd5RU80y96KhZwagdv5CY4sb0u4VgV75Y6M5KfTCwp7oirMQ4GjPoB/29igbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745421333; c=relaxed/relaxed;
	bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3+I3OMS09kCsJE8nCv2GY9oSS+pwjLt5yPa4YeaVtHYuj33/tMRHuukBIQr6QPJ8bQGAKl1btiJ872Rx5Ayy7qef+04Hf+76MV/TQ03D8FdF3/1vP2WhHRH/k8jveKmjie0NSq3YEGhy+T8v8jf1/cOWvnjgGfyvXvYrmtgE/EISqnNSbrSMjEO9KqPAx3KsDlAl5aPdVZ/wp0z6Dx7xpb4oar8eKaqGfyIF+SiE7LywbMTqxj/QQcUS+3ZP/ds9P23HxUNrUFKdhIhgXIb5afNgl547ishJxD/nDEYTFNCkwiLxfUkI5CxRooog21cIL5X2O3FrcptRNUlBxKe6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qSXvsDh3; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qSXvsDh3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjN2q3S3hz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 01:15:30 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30effbfaf4aso22841fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421325; x=1746026125; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=qSXvsDh3ksci5YJXLRfYoKZhSV9GjVrZ6umTyrGZRR+3QA0xuZyU/UHuBgkJqkYyyu
         U4t4n43wltU5MKds/zWsWeiGUVhhX47ovEIucSPu5s5RqqyTX/vds1HIoKPnbbTM6ZA2
         T4ev6l7A2iRlFQoInJC1RA69dOQ9TUG2RAr1BSsdZFT0nbpnfaEsGPyLFZROhwCSHeMr
         DFgQy87JgfAQnI5jSMlUI3IBysj2qlvP0byb+11T8ZUZB2MAoUIXoF8JxaaK4hgBV8tP
         +TMtmpq92gylVzCT/9L1q2kpQZ4x/U/FGbeRzdMuQRj5Wg6IdveiybhVgKEf7UWjlmCt
         AeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421325; x=1746026125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=SbKeJWa9naTJtFzrdEW4KFBjXzfytG3+VdaR/7JYdzpHiG8kPeb1sXYd+1MX96Ya8X
         7yC7VUUiJCl5vlLO5KiDvPuMu2JQKG656GgCIihJN/d+OoOHZSPiaUpWNgZLSfCdDC16
         2NRFpdGEEtUIznj34W6EpPkqH7oXgc6BFzOU82ljpnway4rBFDayYblyjEsKeSlhR/S7
         2qXiC9aVtnW4eESNdS5jMnfsYp90XL14kn+YxUxmCO6ru/YEDKBPaptpSp2HWeVoGMqz
         vP1B9s0rw0T8/21+EPW0Gwll333lclqpHAE/INtSPvUbk/MRMnIecxRjK+wIKrkJNdbd
         JbPA==
X-Gm-Message-State: AOJu0YzKdsWipCMeQ23hnnVMOTm0fEbqJp4SPxXNmwXV1CAyopmHEn4x
	b8CvP06xf6xlyRPFtfM5NTntDbOw9Sfybby01EK9QfGfRs+YVhQDvOHW205CHILLHVuAca5HV6f
	Wt9/eFRvlwa2Eyig4FXjOqsLUJ7ZKIyO2eX3yjg==
X-Gm-Gg: ASbGncuHT5jLoUfQsfSAmUvWMlxDea1TGEjtvR94AJorclM3Svmn/8ikUMlipXzGdXq
	/mYKcMMiZQHiYsArhHwzoUYXNzYq6HOqMiGeyT4BV5Kimdz0u/9U5KHGGr+HR9wvVBVm4yA488/
	gBIZ3zLMMcEF7jyfcWZsmMCFwRlMO8egk2vo3bsMp8aINWK15BmcD3eA==
X-Google-Smtp-Source: AGHT+IEb1jIj14pt/URZReGGb6TRkHRFc9RO4pOYfh9JBEeg/z0nCu7x4tQD9PqcIWoruPNTpnessNuZbjek65SmGKg=
X-Received: by 2002:a05:651c:1603:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-310904db169mr55235771fa.13.1745421324677; Wed, 23 Apr 2025
 08:15:24 -0700 (PDT)
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
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:15:13 +0200
X-Gm-Features: ATxdqUFDwggDqgtKp-q1Zc5o_6PU2EcjPow6QZCYfHjlH6VvpL_4JmV6numGqXk
Message-ID: <CAMRc=Mdp55VX543rXmLtMHF7sCxojcs-3BqyTZu7NDMzbTqVog@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       powerpc: sysdev/gpio: use new line value setter callbacks
>       powerpc: 83xx/gpio: use new line value setter callbacks
>       powerpc: 44x/gpio: use new line value setter callbacks
>       powerpc: 52xx/gpio: use new line value setter callbacks
>       powerpc: 8xx/gpio: use new line value setter callbacks
>
>  arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
>  arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
>  arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  6 ++++--
>  arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
>  arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
>  5 files changed, 24 insertions(+), 13 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart

