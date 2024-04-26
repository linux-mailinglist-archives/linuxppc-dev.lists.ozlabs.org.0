Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F38B3FB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 20:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G31cPiC6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR1zG35rMz3cbL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 04:51:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G31cPiC6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR1yW6f6jz3cXy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 04:50:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01D15620EE
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E95CC2BD10
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157457;
	bh=qzSv2gnEZ82yuyykHlGJGrukq6yL7NdagG67pBjWhfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G31cPiC6TK9kOZfS+7vIsvfHb7uuZNOwj55DutBKEwvj1ZktMpti079oDLoQepzqx
	 wVszL7O0AJVxtjaOjY0n9kY4/Bve7m6gE0ic4Iybrzklpad4O8Ro4Zf5m6HkkhiJ2+
	 w3461SEnX9aUsT6TIAtdY2xAhX4Y1lrXomoRm91/r6VXYAPdqg/BAUR9Ku0+ffN2fF
	 +m/rEaMDw+oIuNEa2S2MKLtCa+l5O0n2aCdo6H2uhPypnxbndLUx0bGMePJQhqLBqn
	 5LBIsT64XdigQdLAx2qvxJDfAfqchkz63z7zPloWzIi6w7OHWw93PJ1yRE7jC7BXYK
	 k1xLvs7Vr7U6Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57232e47a81so4230829a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 11:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXT9rKEdt/QNSats+lyYBNY5EAGRxC0XlolssAGBXPKJS/KH6Nvh4X8HB8IRTNUCaPsU6Y+H2AUEKJWiWRSN2gksprqtJ2IwWnitN7Z6Q==
X-Gm-Message-State: AOJu0YzRdnhEYVOSAKFD1p4Li20wPs9RWhWmoiUfaeCQEjzejFb8LE0t
	8RZks52NbsBbAPHrwsCIeJydpsFB5Z5gWofxhaaWLZYgHO+YEYZvch4lX8alv4tBZ8toN6gJxQp
	pH3DgEaVML1CxTRbd1g+6Hs8guy8=
X-Google-Smtp-Source: AGHT+IEtbFUWWfDryHUamYvitrmf8tAKbyELfuzd/vDmOPU4uvcIS74lAE+iFPq4wKESZs2zgaxMHYvoVHUDPQWBV9c=
X-Received: by 2002:a05:6512:3116:b0:516:ce34:e4fc with SMTP id
 n22-20020a056512311600b00516ce34e4fcmr167995lfb.31.1714157435505; Fri, 26 Apr
 2024 11:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-7-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:50:24 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Message-ID: <CAPhsuW6FZqYXvk4anxby8MccwejPPK5DNU-NGmg7_6T1XDU=Hg@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] mm: introduce execmem_alloc() and execmem_free()
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
> module_alloc() is used everywhere as a mean to allocate memory for code.
>
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules an=
d
> puts the burden of code allocation to the modules code.
>
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
>
> Start splitting code allocation from modules by introducing execmem_alloc=
()
> and execmem_free() APIs.
>
> Initially, execmem_alloc() is a wrapper for module_alloc() and
> execmem_free() is a replacement of module_memfree() to allow updating all
> call sites to use the new APIs.
>
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used b=
y
> different subsystems that allocate executable memory, execmem_alloc() tak=
es
> a type argument, that will be used to identify the calling subsystem and =
to
> allow architectures define parameters for ranges suitable for that
> subsystem.
>
> No functional changes.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Acked-by: Song Liu <song@kernel.org>
