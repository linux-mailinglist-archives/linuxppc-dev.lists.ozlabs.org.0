Return-Path: <linuxppc-dev+bounces-9627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E82AE36FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 09:34:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQfw95y2Jz2yDk;
	Mon, 23 Jun 2025 17:34:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750664041;
	cv=none; b=TQtTXZWRMscwqPQmmupATuzWCggxsset0U15bnUo/oITHy6InWjXWF1T8vNeAKE2vgCt2m56W9xhaUwGGNwktyjDhokJ6cI5JJRJJLGuKj406Yf9duet6SWxb2OMIn78IWWn10GnJ9DAd4FYkKn3sp+zlwkDPiwq3+U4N0YLGRROoPoRSY7KgKDsefhsBlDTAeb5TEmAXKTe96ZF4SLTMlHchwih4bAcPvj/zkese4KeJAUrhg1Y2aqrwFovwHJuSQdIeSkVwH/Q1sO7o525Gg0vd9MH9F0ZQow1/yjRtlF2FiOoxdY0CZlcb1t1D3tUNgzD44LW4D4ZmUkRIqJ47A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750664041; c=relaxed/relaxed;
	bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjVGMgHS9qg3KthL2wQjtrVXuymoN4U7/iupbSPegtFGf24lpKSEXamBO7uBltBp1uPsPdZvyhevxhmMjTw8feFsLNry+Dsg4rsu+2LYdOdgzacOjhXP4B6jcG3KTLY6/po4v9BLPYH3mEPF8ktvEQiXFpo/efS3Z24goeMF5MrBWwt0S3zcblzFxuGh32NRVRXCgb8+xoZd45KZ38tez6JITgUpl25WCvFG/9xkJV9lCM6VU32j8t5EBMdY3uKxKLdgrofVfzJelbDj7pb4+/ozQuo4ms2DMzjt0cXJs1MR2xx4aOyuLsn7FK0BHmYzcdybQEyygcSRWZYI6b/6ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qWNE5+1x; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qWNE5+1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQfw75PdLz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 17:33:57 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54d98aa5981so5114966e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750664032; x=1751268832; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=qWNE5+1xp+C8nFywJgiTOjTmcxGds+gLJYB4NncVOBap+wL9JgiEGsNGYtzkSg4/5W
         C9n3fW3cBqDZEC/RAEu1A5gVmDA3bZdvrkAO4/g4lXgoCUg2Z92Szalgm7GD8Y+zY6E/
         UPgh60xvfJEkRO54PiNptLts4nOrIWUWZpUOlciS1KuSodQn3EipB2pdDfdp92CxQr3c
         hi1k343avSoAKq8ICHKhti7r3H5ojjUUy6NEDJnPB6nxmtw+8bOjJEJEfoHaRrWmxSs7
         uEDQC5Z7DvvN4xvpsoMRilOY2jKHBTh4i4Qn1sfz1pMKw+Z/LMRG2kG0lBYGztjURg53
         3vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664032; x=1751268832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/FmDVYFDGwW5KMGc8hcV6hExdC2WI6OVDkBnOBtebc=;
        b=LVRtOKw63Lqd78Jc0dU0XKHWE1wYUEXKPIMtQ/MO0aR6ZPkykaMPCJ9+eiL8tWCcPl
         wYLiMC3eWwAdGxRzNaXMzKRV9w6I46hyHbMpHZC1aJgqN7YB7f7uQ+ZPCDYOvsF0QObp
         OSRl6oPT4FsA6hQ3jaz6C22kF3Ok8KBnpcjGesDSwA2w+1+mJvgqB5FQnV+VLnjKk5GJ
         K/MXQC5o1W7qAPuf6soy+4+zOLhPToOr+MPkIrWsn2dLumuGjcpPQJY3tmdcNTIwEYEp
         Fg4Zbf75E70v9Ai2CJ2g8diMes+9ACK9lSyk2ZkVGtJEQk2sNGiu+2aZMPy9BYA3AQ6H
         oOmw==
X-Gm-Message-State: AOJu0YxljuadYiQes2w4S4ynqrtK162J0iUXHVYkfpMFskcMKi4eeq+3
	AeJwABLefIz5PipXQn66TZHxheO3u9YIM+HuR19aWw4MoKrbb/SexzguHFHo7aTXjCNlFBhFtqf
	i1isBjndva417iV1ny5OYNtkjugkBZcVQTxb7vnlcPw==
X-Gm-Gg: ASbGncuNn+ZSw4OCUj1hkN8PArPrExAO8nVaUQPlBWo1Mz4QryFcObcHK/HEBaFrD61
	fdsZT5tEdQbihiFMRcnMD4L2pVEHii65IWeVGoQS0xPUhu9Oe550yEFO0DlbjCLtqBUHsBN31/n
	EMTeN14RIYWasUYdZSNMqgJzDsf544sxxfXXAAjrhUXTdcGoLngowm43UbVbYLjNHl3JBARMnkt
	w==
X-Google-Smtp-Source: AGHT+IHXbQ1G61S6XTmap3R9KFxqdYburMPb7gYbxhsdAd+vhJ5pZrPzhPGsI5r9CHk6R8GllO6W7NbS7Xfzhgc6R0U=
X-Received: by 2002:a05:6512:1153:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-553e3af3b66mr3432565e87.0.1750664031428; Mon, 23 Jun 2025
 00:33:51 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 09:33:40 +0200
X-Gm-Features: AX0GCFvZI7j6aCfaYMvSqKv_YVgtIm3etGx79fDwp0jhT33AUgmaBnK_549jfVI
Message-ID: <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips implemented under drivers/soc/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       soc: fsl: qe: use new GPIO line value setter callbacks
>       soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>
>  drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>  drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>  2 files changed, 9 insertions(+), 5 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

I see Geert queued patch 2/2, who would take patch 1/2?

Bart

