Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FDE93813F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 14:13:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zrgu0SuB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR56R1vdhz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 22:13:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zrgu0SuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR55k3GwWz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 22:12:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 160BD60AC0;
	Sat, 20 Jul 2024 12:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09110C2BD10;
	Sat, 20 Jul 2024 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721477557;
	bh=fwbjiZOl2jVEvkjLoIR5P7+CK/Chy3OdwVeEOh6ZuS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zrgu0SuBbpILpJBm8U5PR8XGe87tRutuy1WzG7Fmsz4VozP42z8IfYuFPMEiCO6ez
	 djid8auGU5SdaEK5v5L5Kcs3yzuWYeCcZtOzcSL3vqkCL7k8A8lfqmCMd/yVXhjtF8
	 VHhSwiU64gORZkNkAHRI6mECdB/Pr9e9NEqnu9OJaFfY/A4K+TFaCMAZSDIPmjuJXD
	 m9fyDujPC45QYgAsPUjQDHQ+rAx5rEVo8xTvK67ZSw30TE3zGPomSDzPciI4/ZXvh5
	 fjlXjrfuFyfqzBaLPEL/6dkuLr5m5vWTRuYPQWlUZ6Y2t6qDf8GDx6tPL5wdYxPr4T
	 RVe/6SLZl02bQ==
Date: Sat, 20 Jul 2024 15:09:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 14/17] mm: introduce numa_emulation
Message-ID: <Zpuo-BWxvdbun5z7@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-15-rppt@kernel.org>
 <CCB95DEB-6B72-4175-A379-7E60D89114A6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CCB95DEB-6B72-4175-A379-7E60D89114A6@nvidia.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2024 at 12:03:11PM -0400, Zi Yan wrote:
> On 16 Jul 2024, at 7:13, Mike Rapoport wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Move numa_emulation codfrom arch/x86 to mm/numa_emulation.c
> >
> > This code will be later reused by arch_numa.
> >
> > No functional changes.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/Kconfig             |  8 --------
> >  arch/x86/include/asm/numa.h  | 12 ------------
> >  arch/x86/mm/Makefile         |  1 -
> >  arch/x86/mm/numa_internal.h  | 11 -----------
> >  include/linux/numa_memblks.h | 17 +++++++++++++++++
> >  mm/Kconfig                   |  8 ++++++++
> >  mm/Makefile                  |  1 +
> >  mm/numa_emulation.c          |  4 +---
> >  8 files changed, 27 insertions(+), 35 deletions(-)
> 
> After this code move, the document of numa=fake= should be moved from
> Documentation/arch/x86/x86_64/boot-options.rst to
> Documentation/admin-guide/kernel-parameters.txt
> too.

I'll add this as a separate commit.
 
> Something like:
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index bc55fb55cd26..ce3659289b5e 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4158,6 +4158,18 @@
>                         Disable NUMA, Only set up a single NUMA node
>                         spanning all memory.
> 
> +       numa=fake=<size>[MG]
> +                       If given as a memory unit, fills all system RAM with nodes of
> +                       size interleaved over physical nodes.
> +
> +       numa=fake=<N>
> +                       If given as an integer, fills all system RAM with N fake nodes
> +                       interleaved over physical nodes.
> +
> +       numa=fake=<N>U
> +                       If given as an integer followed by 'U', it will divide each
> +                       physical node into N emulated nodes.
> +
>         numa_balancing= [KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
>                         NUMA balancing.
>                         Allowed values are enable and disable
> diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
> index 137432d34109..98d4805f0823 100644
> --- a/Documentation/arch/x86/x86_64/boot-options.rst
> +++ b/Documentation/arch/x86/x86_64/boot-options.rst
> @@ -170,18 +170,6 @@ NUMA
>      Don't parse the HMAT table for NUMA setup, or soft-reserved memory
>      partitioning.
> 
> -  numa=fake=<size>[MG]
> -    If given as a memory unit, fills all system RAM with nodes of
> -    size interleaved over physical nodes.
> -
> -  numa=fake=<N>
> -    If given as an integer, fills all system RAM with N fake nodes
> -    interleaved over physical nodes.
> -
> -  numa=fake=<N>U
> -    If given as an integer followed by 'U', it will divide each
> -    physical node into N emulated nodes.
> -
>  ACPI
>  ====
> 
> Best Regards,
> Yan, Zi



-- 
Sincerely yours,
Mike.
