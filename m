Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B53729DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZJZ92ZK9z30FJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:10:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tckQoMf4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tckQoMf4; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZJYd1wGgz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:09:40 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id e190so2258051ybb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
 b=tckQoMf463vNPurJ8/DE4FlF1sR1Nq0y0BGfCjVf8H5j3Et6hVbvUaiODNjIcMs8Mt
 /jviFaGyjUN7LjTPIxRHFL6MbcW/qsfvx7daHYGdThRFhwx1eXpFdf80lgbrdZv5XAjV
 q4gQ4TPa7fL+vnbwn0z/rAJc/sZkrwddRBwa++gDz+AHI7QIQYmqAdOtMto9fFmvT2bc
 fVvw/3LRWi+nbFtSTZbFEIN/PYyaBpsjosnuewLM9WmkMpdXmIGMx9D0R9AaZW8PuyET
 eTYCcWQ8qBfkV4daDjJf5RPZUriDmdZ2ym+kRWtgTKy71x49yqybOjhVhEz2ORMPpte6
 O99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
 b=EXnHnrcpl0xLQqI2SMeHlRC08pcB2HAx9jTsrI+wM8G0COO7zrCMm0qAhkGnLx6xxI
 OeQViB8Y/c8m9HvI07LVXt99Cbw5iDV7PLQdQLZWM8CkPBLeDSO8ET73An7qKdkCjPYa
 8ySNx6jLPY572tybOHybdrg81AtmVtnuPcc29x6sB4EzPpMRrSTMPM4Av+azFdhRoRQ8
 S6q6lLGzL6P1tdt0RMLHQPWBOF83xuxiv9mAat5Yf8lpBgiBbV0X/pv4H9SYmypFkXcB
 mEc7X8e78zM7Fmq5vt6YvTO+825gAYXRd2COyqkWRK9sY81oInj5V5sn18Y0w70lzoVl
 42GQ==
X-Gm-Message-State: AOAM530Oij/DNpwCAkck9qhnp4PUONAmHCKoKuPWFZMlauNp/r4BUqQz
 6ZiVhBFkpXmwzFG8oo1I4iypyEE4AEtfNNMJjl8=
X-Google-Smtp-Source: ABdhPJyVieeZ40YfvrO3ib1FXeZbp8MAXFqo0Q4vUyeRjydd2sG818ixSt8PiKN39BRhtEFPC21X4DYHtphGIkl2Kro=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr34501993ybk.115.1620130175246; 
 Tue, 04 May 2021 05:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
In-Reply-To: <20210504092225.GS6564@kitsune.suse.cz>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 May 2021 14:09:24 +0200
Message-ID: <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches <joe@perches.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 11:22 AM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> Except it makes answering the question "Is this bug we see on this
> ancient system still present in upstream?" needlessly more difficult to
> answer.

Can you please provide some details? If you are talking about testing
a new kernel image in the ancient system "as-is", why wouldn't you
build it in a newer system? If you are talking about  particular
problems about bisecting (kernel, compiler) pairs etc., details would
also be welcome.

> Sure, throwing out old compiler versions that are known to cause
> problems makes sense. Updating to latest just because much less so.

I definitely did not argue for "latest compiler" or "updating just because"=
.

> One of the selling point of C in general and gcc in particular is
> stability. If we need the latest compiler we can as well rewrite the
> kernel in Rust which has a required update cycle of a few months.

Rust does not have a "required update cycle" and it does not break old
code unless really required, just like C and common compilers.

Concerning GCC, they patch releases for ~2.5 years, sure, but for many
projects that is not nearly enough. So you still need custom support,
which is anyway what most people care about.

> Because some mainline kernel features rely on bleeding edge tools I end
> up building mainline with current tools anyway but if you do not need
> BTF or whatever other latest gimmick older toolchains should do.

It would be better to hear concrete arguments about why "older
toolchains should do", rather than calling things a gimmick.

Cheers,
Miguel
