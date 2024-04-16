Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 125338A6B5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VtFixmNY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJkGj6LV5z3vZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VtFixmNY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJkG13n0Mz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 22:42:31 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a51b008b3aeso533704866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713271347; x=1713876147; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUOtU228tYtJyPue/rn/IW891GZXpSSOmG4AvHGZ5go=;
        b=VtFixmNYMjkKcK7iSnr6V54vX8ovF9FPL95yGlQE6UUenBgZIgUxIQlTLI602qAtRW
         +nkJ3z5UuUSX4/bf8Famj3Yfn4/QEuKWUHZ3/ezmKKnDiXjtW9ZR0amdlILy7B1ug6X4
         g3FKvjaSeCJPVU4PldzPQFAkIsjIlG1jYOe0uwpyHNXrNYqbe7weqcH22fxyjj4QqdjP
         zFadZdft7xxW/Tesouw9uLwliU/bwmegtp50d4CzHHTAFPyazSEb9ANjK9fFfMBGOCQw
         zlWGH4cgAYKZV/x/jQORviwk3ywnSM0n/aqJjkEKgyTKblhIGhfrMKzPcUBtgn+3If5U
         i6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271347; x=1713876147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUOtU228tYtJyPue/rn/IW891GZXpSSOmG4AvHGZ5go=;
        b=IusBsg9tqpl14SpYllXtnUrkBVA8cjMzehQ4jeyUbh3SnSrmAyYEerPiNPX5LBWdpm
         pFPryObVmZmfLFwu6XjnysmTdw6cEQhjD9KkjWgPCIxrW4R6I6nbQG6XRs8LjxNyPOYU
         iow2WWpoTndUoShu4DXaZkexRE1hYoaLaSbgtO0XZawQHIAu79wejer08t4NEfRuTB+5
         mUhAd80aSuYU5zvOImsJq9qS3aXeaegP/ag3UPI9Iy0uXgfid4YBMQP2bfB8SJluHXnW
         saOfxVlbxm9pFR+Hj1SlUvbSBTb+5Jub/29CTcXDpc0YG492lMYnrzVpERdvj3pnyVx8
         e+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXXhvAyuX8vjmxnoEJZtKq58OkdvhBkxZIlbqck+UjRkywCeGz1aBxfwrgmUGMcRId4adoxkp+9q61vryIjjXgpwjo+sZTmeV8bmYSFyg==
X-Gm-Message-State: AOJu0YzvkTqrv1uRQLd/6knDpmJA+1LZwozMzIl7WTJsYe842pjmWUMt
	/L60P0z8gdQG5xtgZYexQ+2uRlNEpZdPCjcpACqEqsrKOJe+xLzowXShpAqo2Ho=
X-Google-Smtp-Source: AGHT+IFJ6u/xajiCUpxE33tmeqjHHiAL2wmL+dnoci+VQnEehXgtJ/Q5xPBX57jTU1Obt4QXb9tI5g==
X-Received: by 2002:a17:907:940e:b0:a52:277d:c1c9 with SMTP id dk14-20020a170907940e00b00a52277dc1c9mr12180603ejc.50.1713271347185;
        Tue, 16 Apr 2024 05:42:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id go36-20020a1709070da400b00a51fea47897sm6775453ejc.214.2024.04.16.05.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:42:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:42:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on
 a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
Message-ID: <402a5e3b-bdb5-40a4-8a44-2de497849c3f@moroto.mountain>
References: <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
 <3d139886-9549-4384-918a-2d18480eb758@app.fastmail.com>
 <f7d8cd55-5a14-4391-884f-0b072790fa41@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d8cd55-5a14-4391-884f-0b072790fa41@app.fastmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Linux Regressions <regressions@lists.linux.dev>, Niklas Schnelle <schnelle@linux.ibm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jeff Xu <jeffxu@chromium.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024 at 01:55:57PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 16, 2024, at 13:01, Arnd Bergmann wrote:
> > On Tue, Apr 16, 2024, at 11:32, Naresh Kamboju wrote:
> >> The Powerpc clang builds failed due to following warnings / errors on the
> >> Linux next-20240416 tag.
> >>
> >> Powerpc:
> >>  - tqm8xx_defconfig + clang-17 - Failed
> >>  - allnoconfig + clang-17 - Failed
> >>  - tinyconfig + clang-17 - Failed
> >>
> >> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > I'm not sure why this showed up now, but there is a series from
> > in progress that will avoid this in the future, as the same
> > issue is present on a couple of other architectures.
> >
> 
> I see now, it was introduced by my patch to turn on -Wextra
> by default. I had tested that patch on all architectures
> with allmodconfig and defconfig, but I did not test any
> powerpc configs with PCI disabled.

I think this warning is clang specific as well...  (Maybe clang was
included in all architectures but I'm not sure).

regards,
dan carpenter

