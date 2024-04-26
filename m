Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DD8B3FDA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 21:02:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CDwUF1ww;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR2DD69YBz3cmp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 05:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CDwUF1ww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR2CS2vBLz3cYp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 05:02:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43185CE1B30
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 19:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACF7C32781
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158127;
	bh=spHwlcTCpaNA543nwyK0H2eAD2T0c3htMv4UjyBqffA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CDwUF1wwCETAxLtRi23wdiAMyaCf927GHJuMUzch8wggRG10M/ldtSEWzl2LqT66b
	 5FaiC+JRZufcIN0qjqYB+UOPyg31sMqZvIjIad00q7zJsA+kGQwM1SxHWU7+CmyGM9
	 KbolWjcRUPZ5wAUSzSezPgU8dJnZdhbYtBzqRAN71i8ivZ1HvOzwKg7ocXRIWrVWUc
	 EmB7b+wQr7R1yyTthw9Qej1s5cDAuY8ycLn0WdOvyvhWtAXBhU5NsuE3LSBqPa7Xyj
	 a+Xy18Y8XArpz+b0LjIvvvKnrY6p5B9B3PUQaR8Dyh/cc/dfiwvF+euiak/GDCcOFj
	 VSUm0CNnF56pw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso2322099e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 12:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7q2Yfe1f0U+ZKNUf//uGjaDGyI0Nq6WzrvgsxDs7OkQZsSAiBUCEO2W4N7+DKW0tOe7R56vkd+kFZg/QuaZhkVC0r+Hmltkifzriijw==
X-Gm-Message-State: AOJu0YzcC1b6GlyNaYBWNx5iusl3G5HcaGFq/hzeoWUeJJ9plcWTvSSg
	5aGb25+ci4CLA3Fn+pnzG8UzdJsVK8kl8AwsJcUKfp4aWUmi9UkX+dG//4J2hGJuy0x6562sk6g
	LmWvbSaU+Y8Y0Z/B8PGMe/YzGSfc=
X-Google-Smtp-Source: AGHT+IF/3UI9Cwbb8z8OI8jFmskqzepU4aeg2+YglDD7FKhfHPiRdUcmMxLF73Ba/yVMMyprkxylEY00eIaasdUhAvE=
X-Received: by 2002:a05:6512:151:b0:513:c1a2:d380 with SMTP id
 m17-20020a056512015100b00513c1a2d380mr1420572lfo.31.1714158105499; Fri, 26
 Apr 2024 12:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-9-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-9-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 12:01:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Subject: Re: [PATCH v6 08/16] mm/execmem, arch: convert remaining overrides of
 module_alloc to execmem
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linu
 x.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 1:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Extend execmem parameters to accommodate more complex overrides of
> module_alloc() by architectures.
>
> This includes specification of a fallback range required by arm, arm64
> and powerpc, EXECMEM_MODULE_DATA type required by powerpc, support for
> allocation of KASAN shadow required by s390 and x86 and support for
> late initialization of execmem required by arm64.
>
> The core implementation of execmem_alloc() takes care of suppressing
> warnings when the initial allocation fails but there is a fallback range
> defined.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>

nit: We should probably move the logic for ARCH_WANTS_EXECMEM_LATE
to a separate patch.

Otherwise,

Acked-by: Song Liu <song@kernel.org>
