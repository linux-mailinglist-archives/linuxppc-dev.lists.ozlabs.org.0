Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907E931BA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:13:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F148nSjS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WND130lkLz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 06:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F148nSjS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WND0M33RMz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 06:13:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24A5FCE1196
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 20:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68623C4AF0A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721074383;
	bh=7OmVVQobhT3hSRfGbLhcTRfJUMXmXRi2dqnL5IXZS94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F148nSjStWATTjAnDYTpC9c0XIaOxn1KvnJIj6HAtt2tSLK4GBJH0V6yQNyB6At8E
	 Dh3cmk92UReqsRsOHGHl+wlMc51+Pa7rXBDAH4A5gBFUkmKCjAx4/Nbb2OecpxJ/WZ
	 H6u6L7FXB4kNbf+l/QiqaEA+GNakZKgc+RV3FHko1ds2meoYeOYfEkb/SRDOxcokbl
	 Lia4mvNHDklhZjiMQj2WhrAVaYM7WctgK847g18BDjlWvZ5LsO7i6SnGzJSWmJusUn
	 ch23mcGe2aRrSlDluuxG0h9Q0z/GVTwTpZlsR9e3ujPY3tDhIzFYIyUHr9r67F8UaK
	 ErQGpvoWKsRlw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so53935091fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 13:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQ7CqM6obXnWEPAhWfRWbn+K9UnT7L/vsnFSF4X2J5Bu6EhER+9Ms8PBjanw2ebgOPnE7KdYVpnLWPvXJtR4/RSY7ofVFKRm6I5YERFA==
X-Gm-Message-State: AOJu0YytqdEaMXYlnSEbZBAXSZ+IX/QOFUiIyX1791mVlxegznmkvhAQ
	DYmKCa32i2imZoGtkTdAcqsokAdVV9gxgsEC0QN7vc8IdL8TkjElkZhbEJ1tgE0T+h50hm8EqKs
	roXJxUafT3jrdX4Qw+Q3rCwXqHHE=
X-Google-Smtp-Source: AGHT+IHobuX65Qnne2KlfE18leFW6GlJLHaB/JmPa66fpayvh11K/s2F89TKgZdfpv7KGVf5mpLk/XmBKYwXCMmctQY=
X-Received: by 2002:a05:6512:1282:b0:52c:e393:6634 with SMTP id
 2adb3069b0e04-52edf019b1amr10513e87.33.1721074382019; Mon, 15 Jul 2024
 13:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240613133711.2867745-1-zhengyejian1@huawei.com> <20240613133711.2867745-2-zhengyejian1@huawei.com>
In-Reply-To: <20240613133711.2867745-2-zhengyejian1@huawei.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Jul 2024 05:12:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkSnZ1nVXiZH9kg52H-A_=urcsv-W7wGXvunMGhGX8Vw@mail.gmail.com>
Message-ID: <CAK7LNAQkSnZ1nVXiZH9kg52H-A_=urcsv-W7wGXvunMGhGX8Vw@mail.gmail.com>
Subject: Re: [PATCH 1/6] kallsyms: Optimize multiple times of realloc() to one
 time of malloc()
To: Zheng Yejian <zhengyejian1@huawei.com>
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
Cc: mark.rutland@arm.com, kees@kernel.org, dave.hansen@linux.intel.com, james.clark@arm.com, hpa@zytor.com, x86@kernel.org, christophe.leroy@csgroup.eu, peterz@infradead.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, yhs@fb.com, linux-trace-kernel@vger.kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, rostedt@goodmis.org, nathan@kernel.org, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, jpoimboe@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, mcgrof@kernel.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 10:36=E2=80=AFPM Zheng Yejian <zhengyejian1@huawei.=
com> wrote:
>
> Array 'table' is used to store pointers of symbols that read from in.map
> file, and its size depends on the number of symbols. Currently 'table'
> is expanded by calling realloc() every 10000 symbols read.
>
> However, there generally are around 100000+ symbols, which means that
> the expansion is generally 10+ times.
>
> As an optimization, introduce linked list 'sym_list' to associate and
> count all symbols, then store them into 'table' at one time.
>
> Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>


I do not think this is worthwhile.

realloc() is simple.

If this is a problem, you can increase the
"+=3D 10000" to "+=3D 65536" or something.







--=20
Best Regards
Masahiro Yamada
