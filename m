Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CEA8AD40A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 20:33:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qA68HtY8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNYlz4Wswz3dHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 04:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qA68HtY8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNYlC67WKz3cRr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 04:32:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 308C5CE0957
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A74C116B1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713810756;
	bh=41bQmayZLa9F2TS6BjEFSDm7V8S6LLEq/o95h7wxG6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qA68HtY8VqgqRqZf2Z+BRxEGJ87lJdUCx6Osh8gSscfIYLuwih8LbbcRjgeSN72TL
	 Xw4JdoR+vqq1sJrywF+UW6jt11XxxAfhRX5vf+4P5PZXOtwSy4cCuAVWYzrkNtfZFY
	 RJi50MG1o3p5BPD9oDayagmrPVMy0EhVLAw/pglX6Uo5PAN1xX+pidD1GnidGKtKn6
	 ykB1LL+ua/PB+25yLvCBTFxFBB/U4R1LEgj+l7TftBqPQ+Ztyd7hEVqFG/2O36A5Z1
	 UjuZ6JKnGq1s27TbSA3JcyRLnCb+mXgDdhxyZJYk3N/4rAuQbLQhxxn1GV+slKtDRx
	 DyT9rgFt2Zekg==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41aa2f6ff2dso2050145e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 11:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUAaarDn8OFFR+CPN1FtCA/opT6X1jsWHR9vqDfVxG8Z1lis4YoqqjWpBTxuh4024F0EuuYe2DCUt51W7zeAQc6gpf/2eVhIido9NJ/A==
X-Gm-Message-State: AOJu0Ywp5p2pCt8PEl6kFyniAH+TIgVLZt6Xjviwg5sUugCuL60w/yNb
	rjK1ZZ/eHmiq51FFdmvDkB4adPHmpJ7xwR2iNJCaGII/pm9l+1bzEuV662WO/lPMxYH6uw5jOCO
	R6lhzxosyGznhz0LVmzAZUmlj52g=
X-Google-Smtp-Source: AGHT+IEL0FWUHmCKYIOk93aax6U4BdFHP3q3Bogcq6+CoScwmomqpj0/rB2eiX3SYQzXlZuuQSNAuqDXXtIwEOxd65Y=
X-Received: by 2002:a2e:9496:0:b0:2d8:1d29:23a8 with SMTP id
 c22-20020a2e9496000000b002d81d2923a8mr6582027ljh.29.1713810734431; Mon, 22
 Apr 2024 11:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org> <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org> <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
 <ZiNDGjkcqEPqruza@kernel.org> <20240420181121.d6c7be11a6f98dc2462f8b41@kernel.org>
In-Reply-To: <20240420181121.d6c7be11a6f98dc2462f8b41@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 22 Apr 2024 11:32:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5RYfq8FOtMkO69cdQ3Bc1p2kQPWE2crts1UMhqJr+7sQ@mail.gmail.com>
Message-ID: <CAPhsuW5RYfq8FOtMkO69cdQ3Bc1p2kQPWE2crts1UMhqJr+7sQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Masami Hiramatsu <mhiramat@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstree
 t@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Bjorn Topel <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masami and Mike,

On Sat, Apr 20, 2024 at 2:11=E2=80=AFAM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
[...]
> > >
> > > IIUC, we need to update __execmem_cache_alloc() to take a range point=
er as
> > > input. module text will use "range" for EXECMEM_MODULE_TEXT, while kp=
robe
> > > will use "range" for EXECMEM_KPROBE. Without "map to" concept or shar=
ing
> > > the "range" object, we will have to compare different range parameter=
s to check
> > > we can share cached pages between module text and kprobe, which is no=
t
> > > efficient. Did I miss something?
>
> Song, thanks for trying to eplain. I think I need to explain why I used
> module_alloc() originally.
>
> This depends on how kprobe features are implemented on the architecture, =
and
> how much features are supported on kprobes.
>
> Because kprobe jump optimization and kprobe jump-back optimization need t=
o
> use a jump instruction to jump into the trampoline and jump back from the
> trampoline directly, if the architecuture jmp instruction supports +-2GB =
range
> like x86, it needs to allocate the trampoline buffer inside such address =
space.
> This requirement is similar to the modules (because module function needs=
 to
> call other functions in the kernel etc.), at least kprobes on x86 used
> module_alloc().
>
> However, if an architecture only supports breakpoint/trap based kprobe,
> it does not need to consider whether the execmem is allocated.
>
> >
> > We can always share large ROX pages as long as they are within the corr=
ect
> > address space. The permissions for them are ROX and the alignment
> > differences are due to KASAN and this is handled during allocation of t=
he
> > large page to refill the cache. __execmem_cache_alloc() only needs to l=
imit
> > the search for the address space of the range.
>
> So I don't think EXECMEM_KPROBE always same as EXECMEM_MODULE_TEXT, it
> should be configured for each arch. Especially, if it is only used for
> searching parameter, it looks OK to me.

Thanks for the explanation!

I was thinking "we can have EXECMEM_KPROBE share the same parameters as
EXECMEM_MODULE_TEXT for all architectures". But this thought is built on to=
p
of assumptions on future changes/improvements within multiple sub systems.
At this moment, I have no objections moving forward with current execmem AP=
Is.

Thanks,
Song
