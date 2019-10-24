Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BAE35EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 16:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zVTc6mC3zDqVS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 01:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="JAkr+PUq"; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zVR647jJzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 01:45:34 +1100 (AEDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id x9OEj2R9006307
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 23:45:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9OEj2R9006307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1571928303;
 bh=Iz5ljsY1vmLvI0mOS7EWijhyK4tTqgM6F86vrENgiVs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JAkr+PUq9kKsmMgXUKDiELSxzwAfz2pvfK51rwBKqqM5XsvJuRk6OdRpAv/+LD6sj
 +nzaFW/HjWRo0no34WbKO8Gj1F3vjMqY+M8qnVu8HcwExdaVAFP9wZOTqwm2QC/cCm
 fm9JoQ9DxRtzwNpnCfz1qucPdCNBYoOCQCWIFPjQPezJbDssOZgS8eKRLaiy80zpqe
 yg4guSpi66+Hz6q2Dt4bOB/Skm0PxTQ0nNNaVaYS4iUAeVw6jMp2PtL86ISWn33Jz/
 oDbjUQbRkknNMoFp/R/nvbRxmm0G3YeB6Ndoc5bHc+gqAuHigjFKbbfc2WuIx4QuUH
 lv4c3bXElJCyA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id j85so7299879vsd.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 07:45:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXApUWZuuGPG5nONzH5l8UZa1P0BdfCt+lIXIaN4J/Qcw1ir/W1
 CPH4eerNtYnCCOxxrlSjN9hD1U9fsDM5AdYSZaA=
X-Google-Smtp-Source: APXvYqwMmECxCcxI186HHSlk+trzDvWmCSjS3nuXCEEC9fv9GKq3Y9CX2QuL9vFeUeY4EpiP8jJ31MuCUnUXccmWpjo=
X-Received: by 2002:a67:e290:: with SMTP id g16mr6221500vsf.54.1571928299628; 
 Thu, 24 Oct 2019 07:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571911976.git.michal.simek@xilinx.com>
 <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
In-Reply-To: <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 24 Oct 2019 23:44:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvZr48zXkyhii6E-wckYfakhh9gVD=DoBOt++TtPFEaw@mail.gmail.com>
Message-ID: <CAK7LNAQvZr48zXkyhii6E-wckYfakhh9gVD=DoBOt++TtPFEaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] asm-generic: Make msi.h a mandatory include/asm header
To: Michal Simek <michal.simek@xilinx.com>
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
Cc: Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>,
 Firoz Khan <firoz.khan@linaro.org>, Wesley Terpstra <wesley@sifive.com>,
 James Hogan <jhogan@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, git@xilinx.com,
 Paul Walmsley <paul.walmsley@sifive.com>, longman@redhat.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Vineet Gupta <vgupta@synopsys.com>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 7:13 PM Michal Simek <michal.simek@xilinx.com> wrote:
>
> msi.h is generic for all architectures expect of x86 which has own version.

Maybe a typo?  "except"


Anyway, the code looks good to me.

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


> Enabling MSI by including msi.h to architecture Kbuild is just additional
> step which doesn't need to be done.
> The patch was created based on request to enable MSI for Microblaze.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
> https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/
> ---
>  arch/arc/include/asm/Kbuild     | 1 -
>  arch/arm/include/asm/Kbuild     | 1 -
>  arch/arm64/include/asm/Kbuild   | 1 -
>  arch/mips/include/asm/Kbuild    | 1 -
>  arch/powerpc/include/asm/Kbuild | 1 -
>  arch/riscv/include/asm/Kbuild   | 1 -
>  arch/sparc/include/asm/Kbuild   | 1 -
>  include/asm-generic/Kbuild      | 1 +
>  8 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
> index 393d4f5e1450..1b505694691e 100644
> --- a/arch/arc/include/asm/Kbuild
> +++ b/arch/arc/include/asm/Kbuild
> @@ -17,7 +17,6 @@ generic-y += local64.h
>  generic-y += mcs_spinlock.h
>  generic-y += mm-arch-hooks.h
>  generic-y += mmiowb.h
> -generic-y += msi.h
>  generic-y += parport.h
>  generic-y += percpu.h
>  generic-y += preempt.h
> diff --git a/arch/arm/include/asm/Kbuild b/arch/arm/include/asm/Kbuild
> index 68ca86f85eb7..fa579b23b4df 100644
> --- a/arch/arm/include/asm/Kbuild
> +++ b/arch/arm/include/asm/Kbuild
> @@ -12,7 +12,6 @@ generic-y += local.h
>  generic-y += local64.h
>  generic-y += mm-arch-hooks.h
>  generic-y += mmiowb.h
> -generic-y += msi.h
>  generic-y += parport.h
>  generic-y += preempt.h
>  generic-y += seccomp.h
> diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
> index 98a5405c8558..bd23f87d6c55 100644
> --- a/arch/arm64/include/asm/Kbuild
> +++ b/arch/arm64/include/asm/Kbuild
> @@ -16,7 +16,6 @@ generic-y += local64.h
>  generic-y += mcs_spinlock.h
>  generic-y += mm-arch-hooks.h
>  generic-y += mmiowb.h
> -generic-y += msi.h
>  generic-y += qrwlock.h
>  generic-y += qspinlock.h
>  generic-y += serial.h
> diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
> index c8b595c60910..61b0fc2026e6 100644
> --- a/arch/mips/include/asm/Kbuild
> +++ b/arch/mips/include/asm/Kbuild
> @@ -13,7 +13,6 @@ generic-y += irq_work.h
>  generic-y += local64.h
>  generic-y += mcs_spinlock.h
>  generic-y += mm-arch-hooks.h
> -generic-y += msi.h
>  generic-y += parport.h
>  generic-y += percpu.h
>  generic-y += preempt.h
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
> index 64870c7be4a3..17726f2e46de 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -10,4 +10,3 @@ generic-y += local64.h
>  generic-y += mcs_spinlock.h
>  generic-y += preempt.h
>  generic-y += vtime.h
> -generic-y += msi.h
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 16970f246860..1efaeddf1e4b 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -22,7 +22,6 @@ generic-y += kvm_para.h
>  generic-y += local.h
>  generic-y += local64.h
>  generic-y += mm-arch-hooks.h
> -generic-y += msi.h
>  generic-y += percpu.h
>  generic-y += preempt.h
>  generic-y += sections.h
> diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
> index b6212164847b..62de2eb2773d 100644
> --- a/arch/sparc/include/asm/Kbuild
> +++ b/arch/sparc/include/asm/Kbuild
> @@ -18,7 +18,6 @@ generic-y += mcs_spinlock.h
>  generic-y += mm-arch-hooks.h
>  generic-y += mmiowb.h
>  generic-y += module.h
> -generic-y += msi.h
>  generic-y += preempt.h
>  generic-y += serial.h
>  generic-y += trace_clock.h
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index adff14fcb8e4..ddfee1bd9dc1 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -4,4 +4,5 @@
>  # (This file is not included when SRCARCH=um since UML borrows several
>  # asm headers from the host architecutre.)
>
> +mandatory-y += msi.h
>  mandatory-y += simd.h
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
