Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FAD41AFDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 15:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJg8f4mFZz301F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 23:19:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ccs7XIjx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ccs7XIjx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJg7y6HWHz2yNM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 23:19:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB6ED61159
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632835147;
 bh=VeB5GXPFGYAi+MDx0ZEO0Lyx1tXoFrq/FrWnMOweEWQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ccs7XIjxXrIgaTUmo/h1V5wzdF3a0jAk0iTbETr1F6rsd8qX6moThIJSBSjGgRk3v
 s+nCx52LqL7r3C17qq1zt3GP/GlWEXm2kW86RuFqbhj2etiRcmIqNe4vA+I+W4aBIR
 mobB0a9I5yDSB3Xga2i9ooyu842EJMFZ3XBfW1mDgSWKR7KJw8z371s8T8uI/rGnUd
 N3ktpLUhjh5O+w3P2MmvH/d32FSZttYpGOfnQEEZ3fTVBp5xCAORolIpK2X+DoAv8D
 TsAIb6/ZP2nYlkBCFX9siljASoyMdzXltzBvgvBKTN/t4H0qD17jczNAGzYT0DeFqF
 mLb3o/x05aF/A==
Received: by mail-oi1-f178.google.com with SMTP id s24so27325296oij.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 06:19:07 -0700 (PDT)
X-Gm-Message-State: AOAM5339BfbAeqkceITgDBekdqOUhLGABVLeFbZ/XSc8H7gzxcvBWQSS
 tCHXyzJcgJXTpGS316o2i2iB/ClaVWXagl4H15A=
X-Google-Smtp-Source: ABdhPJyep3Pw1Kqo5huUAuGsrpllZ2c8nSuyzA6EOwJFgMmmBzpyy+vZsyEyrP7TXFbetznr+4dx/vVu8duHYpn76tM=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr3509831oiu.33.1632835136613; 
 Tue, 28 Sep 2021 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au> <87pmst1rn9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmst1rn9.fsf@mpe.ellerman.id.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Sep 2021 15:18:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
Message-ID: <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Ard Biesheuvel <ardb@kernel.org> writes:
> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> >>>
> >>> The CPU field will be moved back into thread_info even when
> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> >>> of struct thread_info.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Michael,
> >>
> >> Do you have any objections or issues with this patch or the subsequent
> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
> >> that he was happy with it.
> >
> > No objections, it looks good to me, thanks for cleaning up that horror :)
> >
> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> > git tree with the dependencies I'd be happy to run some tests over it.
>
> Actually I realised I can just drop the last patch.
>
> So that looks fine, passes my standard quick build & boot on qemu tests,
> and builds with/without stack protector enabled.
>

Thanks.

Do you have any opinion on how this series should be merged? Kees Cook
is willing to take them via his cross-arch tree, or you could carry
them if you prefer. Taking it via multiple trees at the same time is
going to be tricky, or take two cycles, with I'd prefer to avoid.

-- 
Ard.
