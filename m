Return-Path: <linuxppc-dev+bounces-10163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4637AFE105
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jul 2025 09:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bcThq5TKSz2y8p;
	Wed,  9 Jul 2025 17:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=49.212.243.89
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752041309;
	cv=none; b=mraZD+ezKbeAfhmX1KzBs71J+6Hygv808+EBrtDig09USCikjW7jp8TUQvdA2e+TwRyclSiTyh8yfvmHcpk/YeS9oPz/vEFon5E2R7bM8uU2oDpf315sPsZ7Xoj8LMHshGWYfD/o2xKnqXyR/hZJQmV8ef+vQ14SjwJJygpOcWAo9C4G+fUQQFd6uUJtPmQ3IpaxNtSrp2r/p9BKUKuaiH0e1OOux9/EFrm09+dTXCPbQpDFaiW0/mPNE4uA2F7eFpbLVkaGe/Svao2ktldNpbWAJL95hRn2lavVf89GWiHqBpOqZQ5agVUvcBK0BcQfGSEmEVRoxucnlMAcvEo2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752041309; c=relaxed/relaxed;
	bh=4clTUl4sMeFn+3+ZKeZuCK2i1/1ZYbUuPzsuXuco86k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YJjLd/LYH4pCeqKWh6XYHwqG5uTn7cHC6CAodSG4dH0hBcvAswnIj1ewGMS/SSaC7gLFvgzLHr+O5NRMSo3o2PuP2nJBKm40dACDPtZ6teiQdCd/vhSKbK1w/KXEfm6/qesnyxbbCH/vXK9jre/YObSH+1ZF9EiXlGgRX15Od1varCu2DLLz8ERw+8btb/1gi4DJXx8244ypneMZcf84CAZjTk45GzxkEllLYUe+EXluBKhBySFcqO7CYa4CU3KdzHO+UBhAMZYdTBK4COZ+dOoOCzEf6eU1ftMcevRfqVA7gyzrhq3bewvIJOj3neoAEjqwNw4wg2AdAXUycHcL4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; dkim=fail header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=P+9TWd4x reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=49.212.243.89; helo=www3579.sakura.ne.jp; envelope-from=odaki@rsg.ci.i.u-tokyo.ac.jp; receiver=lists.ozlabs.org) smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=P+9TWd4x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp (client-ip=49.212.243.89; helo=www3579.sakura.ne.jp; envelope-from=odaki@rsg.ci.i.u-tokyo.ac.jp; receiver=lists.ozlabs.org)
X-Greylist: delayed 3579 seconds by postgrey-1.37 at boromir; Wed, 09 Jul 2025 16:08:26 AEST
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bcSG23jyYz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jul 2025 16:08:26 +1000 (AEST)
Received: from [157.82.206.39] ([157.82.206.39])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 56955rZV065688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Jul 2025 14:05:53 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=4clTUl4sMeFn+3+ZKeZuCK2i1/1ZYbUuPzsuXuco86k=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1752037554; v=1;
        b=P+9TWd4xgbOJt4IAGxHHsFZCUP5mU2LruCqB6XvGSTxPuNiG88lEdFqKSI5e8GV9
         IZQ027gIzqE6R884yIAbqFDeeb+QV4d98ETFvdXUnoX+FYopiMFnNscVsB2zI9Wa
         2l2RcZyKqEBQDUjGZTaMI0r6Rf5IedBu6hCBpXk/895FEVdR2zQg58ehwJmyxgfF
         XT9yXnMK/B98pfOeSBYxC5A9B18qaCU6AclyvtM00Ovo46CMOeuPcCCb07Ssut/I
         yGZrAOC9hnteaFT0HuEm66QoaIAFlJenYdCL8L9SlWdVr/Lxm01+5vFw0NVbVwNR
         jKgFire83dealgPIcgL8rg==
Message-ID: <36c0213c-6b14-4ad2-969e-3d8e356bb680@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 9 Jul 2025 14:05:53 +0900
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] binfmt_elf,arch/*: Use elf.h for coredump note
 names
To: Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin"
 <hpa@zytor.com>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Andreas Larsson <andreas@gaisler.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dinh Nguyen
 <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonas Bonn <jonas@southpole.se>, Kees Cook <kees@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Max Filippov
 <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
References: <20250701135616.29630-1-Dave.Martin@arm.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/07/01 22:55, Dave Martin wrote:
> This series aims to clean up an aspect of coredump generation:
> 
> ELF coredumps contain a set of notes describing the state of machine
> registers and other information about the dumped process.
> 
> Notes are identified by a numeric identifier n_type and a "name"
> string, although this terminology is somewhat misleading.  Officially,
> the "name" of a note is really an "originator" or namespace identifier
> that indicates how to interpret n_type [1], although in practice it is
> often used more loosely.
> 
> Either way, each kind of note needs _both_ a specific "name" string and
> a specific n_type to identify it robustly.
> 
> To centralise this knowledge in one place and avoid the need for ad-hoc
> code to guess the correct name for a given note, commit 7da8e4ad4df0
> ("elf: Define note name macros") [2] added an explicit NN_<foo> #define
> in elf.h to give the name corresponding to each named note type
> NT_<foo>.
> 
> Now that the note name for each note is specified explicitly, the
> remaining guesswork for determining the note name for common and
> arch-specific regsets in ELF core dumps can be eliminated.
> 
> This series aims to do just that:
> 
>   * Patch 2 adds a user_regset field to specify the note name, and a
>     helper macro to populate it correctly alongside the note type.
> 
>   * Patch 3 ports away the ad-hoc note names in the common coredump
>     code.
> 
>   * Patches 4-22 make the arch-specific changes.  (This is pretty
>     mechanical for most arches.)
> 
>   * The final patch adds a WARN() when no note name is specified,
>     and simplifies the fallback guess.  This should only be applied
>     when all arches have ported across.
> 
> See the individual patches for details.
> 
> 
> Testing:
> 
>   * x86, arm64: Booted in a VM and triggered a core dump with no WARN(),
>     and verified that the dumped notes are the same.
> 
>   * arm: Build-tested only (for now).
> 
>   * Other arches: not tested yet
> 
> Any help with testing is appreciated.  If the following generates the
> same notes (as dumped by readelf -n core) and doesn't trigger a WARN,
> then we are probably good.
> 
> $ sleep 60 &
> $ kill -QUIT $!
> 
> (Register content might differ between runs, but it should be safe to
> ignore that -- this series only deals with the note names and types.)
> 
> Cheers
> ---Dave
> 
> 
> [1] System V Application Binary Interface, Edition 4.1,
> Section 5 (Program Loading and Dynamic Linking) -> "Note Section"
> 
> https://refspecs.linuxfoundation.org/elf/gabi41.pdf
> 
> [2] elf: Define note name macros
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/uapi/linux/elf.h?id=7da8e4ad4df0dd12f37357af62ce1b63e75ae2e6
> 
> 
> Dave Martin (23):
>    regset: Fix kerneldoc for struct regset_get() in user_regset
>    regset: Add explicit core note name in struct user_regset
>    binfmt_elf: Dump non-arch notes with strictly matching name and type
>    ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    hexagon: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    openrisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    s390/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    sh: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
>    xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note
>      names
>    binfmt_elf: Warn on missing or suspicious regset note names
> 
>   arch/arc/kernel/ptrace.c                 |  4 +-
>   arch/arm/kernel/ptrace.c                 |  6 +-
>   arch/arm64/kernel/ptrace.c               | 52 ++++++++---------
>   arch/csky/kernel/ptrace.c                |  4 +-
>   arch/hexagon/kernel/ptrace.c             |  2 +-
>   arch/loongarch/kernel/ptrace.c           | 16 ++---
>   arch/m68k/kernel/ptrace.c                |  4 +-
>   arch/mips/kernel/ptrace.c                | 20 +++----
>   arch/nios2/kernel/ptrace.c               |  2 +-
>   arch/openrisc/kernel/ptrace.c            |  4 +-
>   arch/parisc/kernel/ptrace.c              |  8 +--
>   arch/powerpc/kernel/ptrace/ptrace-view.c | 74 ++++++++++++------------
>   arch/riscv/kernel/ptrace.c               | 12 ++--
>   arch/s390/kernel/ptrace.c                | 42 +++++++-------
>   arch/sh/kernel/ptrace_32.c               |  4 +-
>   arch/sparc/kernel/ptrace_32.c            |  4 +-
>   arch/sparc/kernel/ptrace_64.c            |  8 +--
>   arch/x86/kernel/ptrace.c                 | 22 +++----
>   arch/x86/um/ptrace.c                     | 10 ++--
>   arch/xtensa/kernel/ptrace.c              |  4 +-
>   fs/binfmt_elf.c                          | 36 +++++++-----
>   fs/binfmt_elf_fdpic.c                    | 17 +++---
>   include/linux/regset.h                   | 12 +++-
>   23 files changed, 194 insertions(+), 173 deletions(-)
> 
> 
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841

For the whole series:
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Regards,
Akihiko Odaki

