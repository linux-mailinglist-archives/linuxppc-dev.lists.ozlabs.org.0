Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197A7F5229
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 22:12:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0JUg+VK8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbDTl2KPGz3dT6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 08:12:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0JUg+VK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbDSv4yRrz3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 08:11:43 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507a5edc2ebso148e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 13:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700687499; x=1701292299; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mINXLXrq9/oLpdA6Yk/sy1UPcvyskcwNgTwzkZ9kBzs=;
        b=0JUg+VK8t+SAH+8oAezmSCqLd+oaa+oQr1tPEl+s7F/G9zAi7P8/VgUB6BHG4CwU22
         Gr3rm/oLEQL8/T2sR9qz0Qo+w9ICTyfxJr9mS1juznkoMzxggxfQtfRhfCdUxq4AwxOH
         bzCARE7VauqZNtp6vE66qZW7IqJBMHoigBLHwMepdtEpwBhbLwWszMYO8N2Qpl0n3QUr
         GyY5AODy8ewGHiUwvu66J7MfIi1EqVm2MztzP29djoxvmxLXkOy9KOqYBd0F1xTAEevH
         XveK0Sh7btue7+cE6Mv4Tn1R7rU07VG9BZEuXlZBcdow/IXkWCRdspThJz+Ay/va1hpS
         4qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700687499; x=1701292299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mINXLXrq9/oLpdA6Yk/sy1UPcvyskcwNgTwzkZ9kBzs=;
        b=cV8p/TZo4G0LY5a47bpXGAB+4C0DOF6pcFOUCBUoKIgcan32Uk+8IvY6gJ3EhCqx8V
         FCE6h/PNLZ2hLPGwEaFjYdkDb8Ec7mTMXeHVnmuzi9KDQcSHUsX0xK9wuL1zsMNIS0B5
         S5h5CuuD8MCckfDrjwxxniY5qRQb7nK6FZTyP6uc48YZGptvU31hctO/LQBGlmCLFCWe
         yPYpj3Panv66/mGOFm8UPBghhJ10FxQAUudxY5iyQqtOgkNJQAafmDfOZZIbILWYPfSb
         Hz6N5bCgNVITcOufVwWl2vqu99ipsmbnP56HJU21IiBucg/8MltjxcGUM2zzk7LVQPoq
         b3dQ==
X-Gm-Message-State: AOJu0YzKrDNHj2UPoBuXteKt8Qs8S6vj50cjtgSi6u2UN9gSQuVgpeCN
	XTKEng2D6AxbFhHGw4Bsn9/qPwZeTI2+gENTA6WWQQpe4YiShL9XsfnhZQ==
X-Google-Smtp-Source: AGHT+IEGm9MLKZeGbPnej8xX4u8eiSlbh1Mqb8POBm36fW5cFOc334Fc5wDrn2GxrY0UsMNCzK9qE0nvCl+hpFusPUw=
X-Received: by 2002:a05:6402:d67:b0:548:c1b1:96b2 with SMTP id
 ec39-20020a0564020d6700b00548c1b196b2mr225540edb.6.1700687061263; Wed, 22 Nov
 2023 13:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com> <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
In-Reply-To: <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 22 Nov 2023 13:04:09 -0800
Message-ID: <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
To: Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> So, even if you enable CONFIG_MODVERSIONS,
> nothing is checked for Rust.
> Genksyms computes a CRC from "int foo", and
> the module subsystem confirms it is a "int"
> variable.
>
> We know this check always succeeds.
>
> Why is this useful?
The reason this is immediately useful is that it allows us to have Rust
in use with a kernel where C modules are able to benefit from MODVERSIONS
checking. The check would effectively be a no-op for now, as you have correctly
determined, but we could refine it to make it more restrictive later.
Since the
existing C approach errs on the side of "it could work" rather than "it will
work", I thought being more permissive was the correct initial solution.

If we want to err on the other side (modversions passes, so we're pretty sure
it will work), I could add to the last patch support for using .rmeta files as
the CRC source for Rust symbols. This would essentially say that the interface
for the entire compilation unit has to stay the same rather than just that one
function. We could potentially loosen this requirement in the future.

With regards to future directions that likely won't work for loosening it:
Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
teach genksyms to open it up and split out the pieces for specific functions.
Extending genksyms to parse Rust would also not solve the situation -
layouts are allowed to differ across compiler versions or even (in rare
cases) seemingly unrelated code changes.

Future directions that might work for loosening it:
* Generating crcs from debuginfo + compiler + flags
* Adding a feature to the rust compiler to dump this information. This
is likely to
  get pushback because Rust's current stance is that there is no ability to load
  object code built against a different library.

Would setting up Rust symbols so that they have a crc built out of .rmeta be
sufficient for you to consider this useful? If not, can you help me understand
what level of precision would be required?
