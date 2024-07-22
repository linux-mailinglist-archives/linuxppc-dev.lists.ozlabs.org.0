Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC9938ADE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 10:12:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pmvGwQdU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSCg36B4vz3cSN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 18:11:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pmvGwQdU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSCfN04lYz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 18:11:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7405A60AC9;
	Mon, 22 Jul 2024 08:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3697C32782;
	Mon, 22 Jul 2024 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721635881;
	bh=KbHb2ML+/qNtqrROpXFQuCOgzyU9WkoEjmRDGSn9Buc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmvGwQdUNlDOWhEh5LDwssibR/KEz7Zmmpd8mKQJ30oNCDnjOOYBrxm5QxDheiGpM
	 v2fA6aKX+vgggaKwCAygIbGfh8J+i/6ypRPQfXQm/pPLVwBpHQQ0ePGi/iWCBNnGNs
	 K6/E4TEMVX41pv99/WxiNTZpZsJ7u7AUQO0/nnACqOE2r61ablwa38hrfn24gKR7af
	 4ZwCTnQ0nxsiA1qRrmHJI/3vt9VXGn+Doo9wPFkpJ1m8ADDfzpc1fqTbeg7JemtZZV
	 hWVZyVEHXLgElOCdvOBrZYp1YKgEEly5/oGP5VPwn2hJw/yrNojdPai/kIldbMKfjo
	 Li75LtSqlZlhA==
Date: Mon, 22 Jul 2024 11:08:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 00/17] mm: introduce numa_memblks
Message-ID: <Zp4Ta31U6amqIbI1@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240719143347.000077d9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719143347.000077d9@huawei.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2024 at 02:33:47PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:29 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Hi,
> > 
> > Following the discussion about handling of CXL fixed memory windows on
> > arm64 [1] I decided to bite the bullet and move numa_memblks from x86 to
> > the generic code so they will be available on arm64/riscv and maybe on
> > loongarch sometime later.
> > 
> > While it could be possible to use memblock to describe CXL memory windows,
> > it currently lacks notion of unpopulated memory ranges and numa_memblks
> > does implement this.
> > 
> > Another reason to make numa_memblks generic is that both arch_numa (arm64
> > and riscv) and loongarch use trimmed copy of x86 code although there is no
> > fundamental reason why the same code cannot be used on all these platforms.
> > Having numa_memblks in mm/ will make it's interaction with ACPI and FDT
> > more consistent and I believe will reduce maintenance burden.
> > 
> > And with generic numa_memblks it is (almost) straightforward to enable NUMA
> > emulation on arm64 and riscv.
> > 
> > The first 5 commits in this series are cleanups that are not strictly
> > related to numa_memblks.
> > 
> > Commits 6-11 slightly reorder code in x86 to allow extracting numa_memblks
> > and NUMA emulation to the generic code.
> > 
> > Commits 12-14 actually move the code from arch/x86/ to mm/ and commit 15
> > does some aftermath cleanups.
> > 
> > Commit 16 switches arch_numa to numa_memblks.
> > 
> > Commit 17 enables usage of phys_to_target_node() and
> > memory_add_physaddr_to_nid() with numa_memblks.
> 
> Hi Mike,
> 
> I've lightly tested with emulated CXL + Generic Ports and Generic
> Initiators as well as more normal cpus and memory via qemu on arm64 and it's
> looking good.
> 
> From my earlier series, patch 4 is probably still needed to avoid
> presenting nodes with nothing in them at boot (but not if we hotplug
> memory then remove it again in which case they disappear)
> https://lore.kernel.org/all/20240529171236.32002-5-Jonathan.Cameron@huawei.com/
> However that was broken/inconsistent before your rework so I can send that
> patch separately. 

I'd appreciate it :)
 
> Thanks for getting this sorted!  I should get time to do more extensive
> testing and review in next week or so.

Thanks, you may want to wait for v2, I'm planning to send it this week.
 
> Jonathan
> 
> > 
> > [1] https://lore.kernel.org/all/20240529171236.32002-1-Jonathan.Cameron@huawei.com/
> > 
> > Mike Rapoport (Microsoft) (17):
> >   mm: move kernel/numa.c to mm/
> >   MIPS: sgi-ip27: make NODE_DATA() the same as on all other
> >     architectures
> >   MIPS: loongson64: rename __node_data to node_data
> >   arch, mm: move definition of node_data to generic code
> >   arch, mm: pull out allocation of NODE_DATA to generic code
> >   x86/numa: simplify numa_distance allocation
> >   x86/numa: move FAKE_NODE_* defines to numa_emu
> >   x86/numa_emu: simplify allocation of phys_dist
> >   x86/numa_emu: split __apicid_to_node update to a helper function
> >   x86/numa_emu: use a helper function to get MAX_DMA32_PFN
> >   x86/numa: numa_{add,remove}_cpu: make cpu parameter unsigned
> >   mm: introduce numa_memblks
> >   mm: move numa_distance and related code from x86 to numa_memblks
> >   mm: introduce numa_emulation
> >   mm: make numa_memblks more self-contained
> >   arch_numa: switch over to numa_memblks
> >   mm: make range-to-target_node lookup facility a part of numa_memblks
> > 
> >  arch/arm64/include/asm/Kbuild                 |   1 +
> >  arch/arm64/include/asm/mmzone.h               |  13 -
> >  arch/arm64/include/asm/topology.h             |   1 +
> >  arch/loongarch/include/asm/Kbuild             |   1 +
> >  arch/loongarch/include/asm/mmzone.h           |  16 -
> >  arch/loongarch/include/asm/topology.h         |   1 +
> >  arch/loongarch/kernel/numa.c                  |  21 -
> >  arch/mips/include/asm/mach-ip27/mmzone.h      |   1 -
> >  .../mips/include/asm/mach-loongson64/mmzone.h |   4 -
> >  arch/mips/loongson64/numa.c                   |  20 +-
> >  arch/mips/sgi-ip27/ip27-memory.c              |   2 +-
> >  arch/powerpc/include/asm/mmzone.h             |   6 -
> >  arch/powerpc/mm/numa.c                        |  26 +-
> >  arch/riscv/include/asm/Kbuild                 |   1 +
> >  arch/riscv/include/asm/mmzone.h               |  13 -
> >  arch/riscv/include/asm/topology.h             |   4 +
> >  arch/s390/include/asm/Kbuild                  |   1 +
> >  arch/s390/include/asm/mmzone.h                |  17 -
> >  arch/s390/kernel/numa.c                       |   3 -
> >  arch/sh/include/asm/mmzone.h                  |   3 -
> >  arch/sh/mm/init.c                             |   7 +-
> >  arch/sh/mm/numa.c                             |   3 -
> >  arch/sparc/include/asm/mmzone.h               |   4 -
> >  arch/sparc/mm/init_64.c                       |  11 +-
> >  arch/x86/Kconfig                              |   9 +-
> >  arch/x86/include/asm/Kbuild                   |   1 +
> >  arch/x86/include/asm/mmzone.h                 |   6 -
> >  arch/x86/include/asm/mmzone_32.h              |  17 -
> >  arch/x86/include/asm/mmzone_64.h              |  18 -
> >  arch/x86/include/asm/numa.h                   |  24 +-
> >  arch/x86/include/asm/sparsemem.h              |   9 -
> >  arch/x86/mm/Makefile                          |   1 -
> >  arch/x86/mm/amdtopology.c                     |   1 +
> >  arch/x86/mm/numa.c                            | 618 +-----------------
> >  arch/x86/mm/numa_internal.h                   |  24 -
> >  drivers/acpi/numa/srat.c                      |   1 +
> >  drivers/base/Kconfig                          |   1 +
> >  drivers/base/arch_numa.c                      | 223 ++-----
> >  drivers/cxl/Kconfig                           |   2 +-
> >  drivers/dax/Kconfig                           |   2 +-
> >  drivers/of/of_numa.c                          |   1 +
> >  include/asm-generic/mmzone.h                  |   5 +
> >  include/asm-generic/numa.h                    |   6 +-
> >  include/linux/numa.h                          |   5 +
> >  include/linux/numa_memblks.h                  |  58 ++
> >  kernel/Makefile                               |   1 -
> >  kernel/numa.c                                 |  26 -
> >  mm/Kconfig                                    |  11 +
> >  mm/Makefile                                   |   3 +
> >  mm/numa.c                                     |  57 ++
> >  {arch/x86/mm => mm}/numa_emulation.c          |  42 +-
> >  mm/numa_memblks.c                             | 565 ++++++++++++++++
> >  52 files changed, 847 insertions(+), 1070 deletions(-)
> >  delete mode 100644 arch/arm64/include/asm/mmzone.h
> >  delete mode 100644 arch/loongarch/include/asm/mmzone.h
> >  delete mode 100644 arch/riscv/include/asm/mmzone.h
> >  delete mode 100644 arch/s390/include/asm/mmzone.h
> >  delete mode 100644 arch/x86/include/asm/mmzone.h
> >  delete mode 100644 arch/x86/include/asm/mmzone_32.h
> >  delete mode 100644 arch/x86/include/asm/mmzone_64.h
> >  create mode 100644 include/asm-generic/mmzone.h
> >  create mode 100644 include/linux/numa_memblks.h
> >  delete mode 100644 kernel/numa.c
> >  create mode 100644 mm/numa.c
> >  rename {arch/x86/mm => mm}/numa_emulation.c (94%)
> >  create mode 100644 mm/numa_memblks.c
> > 
> > 
> > base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
> 

-- 
Sincerely yours,
Mike.
