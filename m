Return-Path: <linuxppc-dev+bounces-11121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198EB2C48C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 15:05:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5qYx1gRtz3d2w;
	Tue, 19 Aug 2025 23:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755608709;
	cv=none; b=AlMo2qjxzri8X5jBcBopqbmd9oqMc21jtCbUPtshXL1DVObG2990Op07ul8PgJ0qkLAZ8AFniWoPnnO/4a83xKK8OyvLhwMmQcs7cNSFkP9lA7aX2KAB5SFwk69HhOfz/htV2Wu2R8RPWop45/gbTUfgsD1qwnxK91ymarZVsZlpe8/QOGqq8XECtaaHmwZltgTIJiqlnTTqra2aN0yHo+hi4Ix2O6vXLPWcN13qG9lJqsMYiEpSxVchVGAptXGQOtca9rYr9h/7cnO53kzQJVZ3ubc9YgJVf+U0l/BwInfuPxOnAK1Y1xdD1xuXKEJFHVWnDQ5dUhVp6180ZDocfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755608709; c=relaxed/relaxed;
	bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bysOwGtMJxa4pzNNA4AZXoDk0fV9wceoBk5hbdR35LUQHfvlP2AW7ldfkHmEmbUNKEopr63OWT7BZSc07kYPXXHOhUXLdji0XhFQ2Wq0kG3sh6GNynugdTlFXEE/3Pl4yyvMUqQQuY+Be5s2n93WfsJLRKuzgyQXzYEIWxDmk5BuUEX6m5rqBc2seHVGxzP0gFubEXWdqYRlMaVccRg7PUXYY8048cMVfvqFhXAcxdQwxFIHGvYS0X/y//YSPklzrpqrzEa0lrOZFgY0+itudWA43ry8DpnuxbsbnJKut0RtpuWTgBUMI5ICB0ESD3qgy3xKWhQHsG5ckj1GbHvi8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOlc5hOI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOlc5hOI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5qYv5MNdz3d1B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:05:06 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f8d39e94so39997771fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608702; x=1756213502; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
        b=nOlc5hOI/fm6Jh9nQPQ+zOoy12ObFnCycN+A9BSSfU6tDxya2NX0KPpjD44D6bSIMd
         3A7oDoh3rx9Dwei8zq6FsNzBqXuee2y5nPQaFiRTXz+K1VI4hkgGTpAIfTrx2wX4+Z48
         BBAlQz2H5sghQbHDXv7a2YD9YKSChQnMCB01ul848Yjv0mOV8ajhwNBsL9ksgR8Hflvs
         22i3rmFhMeVGjV1BlaUV0guToWKKDqDdDYzktDJJvI11pcTLctKFMIT5y0ycplfNSj6p
         Vz/s1M5VQdfzvkXC06eKsXsKj/y3cEB8dUmGscWRWJkEmMftBdb8SLO3l0Ju52YxssF5
         h1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608702; x=1756213502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
        b=kpgdsXXPzSJVU2GxdSihujkJwkLsyonprwo+ec2fBw07RZqU0wzkcOdX77Xvd3RG+c
         tnqBnufNYTQ4ntdebz7SMvTIGZUkmgL+r/TL8os7yG1+CK2m1HUnhTR6ebDo24nrTwsN
         e3pvb7QgOHzGQr53gwA8rv6PzmJrOZo4vvB1zCg1tprG8fZ2RgJOYjanF6XZsBMxKGy7
         uYnH+qgzfqiZ3IQSzSZkmC3Vx7fFrg7qW+4h+muK2IEWGYsHTt9I6ZcRD5t99di6uhmh
         /xsfURW4sPBIOKzxicZs40i0AbhAZsmabWNm3vwrA/xYTYRlLMWdJIjISJhpTETBruAV
         i9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuiXc7R8m7pYvySTr4W2bFrfsSWyKL26B8YuXhkzrlqKkT5KqRs6ny/4xoL9Sjn+I59ZyuAdvVAG937oY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqvKKVy73mz2zjd1D1Q1hO9OSBm+6FdZcqAmrLI8moWdjDAzo+
	nNtuI51hcivC+XlXDQrJ9/L/64YzgodXmuFzrVok1vUCeb+U4IarjzNYb839e1F95btYai4hnxH
	U/WaNu8sYDroNBX0Rqky4rPyCbHLZ3+hNNqCVvGHkqA==
X-Gm-Gg: ASbGncuZTedi3fY5sK8csMRB5ru2Me/9vkyXi3MfMeqtFcSkjNorUpy/WJoW5yVlDiD
	Bfgi2nmevUDbEwmu4FoZodr7nfK29e6e3XJGawN/q+z0ukBxcG8ce/p95qUkS8mdMIMMH2SHgbj
	v3AaZMs9wVEVLFBu7Ie52RPVWp0FChOeyVOAz1qWU0m9GzAgE4OYMIynpZ0OVZZXQ7B1wVOJcFN
	19vGur8qxEY
X-Google-Smtp-Source: AGHT+IHKSCc3BRRWgi/b6UYlklkIt3JL2+XoqGQiac4wdYUlvtkEDiwhts0vXrUKD+OM1NJ41pIR4yVIK8ii7tqOrrE=
X-Received: by 2002:a05:651c:553:b0:332:440d:43bf with SMTP id
 38308e7fff4ca-3353072126emr7293841fa.30.1755608701684; Tue, 19 Aug 2025
 06:05:01 -0700 (PDT)
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
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:04:50 +0200
X-Gm-Features: Ac12FXzPE0z4aQDnczniJjhXVKo7ubVWbJ4EdzLUQpWqZoam6Goakc9VHrWgbMg
Message-ID: <CACRpkdZcoT-hotYikqC1thmiOB_tc20tvXVrrOwu_ymgW=g3Dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 2:17=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> In order to drop legacy-of-mm-gpiochip dependency, first change the
> 44x GPIO driver to a proper platform driver.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

