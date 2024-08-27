Return-Path: <linuxppc-dev+bounces-594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB89604F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtLx03SgZz2yVX;
	Tue, 27 Aug 2024 18:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724748948;
	cv=none; b=FP4rGlXTnReWojAigr+COn1IaMQrELNVZoCIR/k7rF2GSYVSF9TmhUFKnQSAqFIZk3TtLPmQwYzxht0Y3bL6l8qNE6jTbZ1SphblJYcw82ev2IVUlI6TkaS/a6Ev3SE/KB5WG/vTcofIsc5xK76PneSdVFgZ1/VMeazvvT3wpv1NXnBCGZhs6LYYEWLoGZYBy8qqiOqh7QdAXfIWKDmqLeyCkub5ypaQQ6RuNaQK5fUgslpd1Ys39ic1v2Nf8cJlknK87lY2EOkbgptbc3HQ8fMtkLOwYo60uEg2xiYBufEVybtf0I9bO5WwbAl5/RQC+S4yut1sZG+6ZizPJnAoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724748948; c=relaxed/relaxed;
	bh=edrvj8N6roPKYMjXImydBvCzJkV/SgZcOb26fB0+T6A=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l0X35Xi6YZSkcDssL7lJSlffvvYZ6y2rMjDxM24AAJg2GA83R3WfDPfI+GUzLqSfuWMXIb18v8YnK/kvxZ49wSKXUpKlEd6Pw3ano9s3WS62eAecGa1uNjhO/hX1l+ayK2ekqnq4FPmwTX3owcq5cCk4Hm5MMOjVAHupIT3UFK17Fvk59fUaUCvmo6vK2ys3tfWMP2SfbwSjVsLEXmqIKRRxmFLXAblXjPC1efu9NDKbRt1gfqo8gkx6YuI3c3C2uvxZgzTbDrqHW4qqsGutFLMJwIWFOyZ4Hjqt9QFS1zDel9m3C+PLwMn0BW5GuCBUAILQ86eMPjCLV3HFHTj9Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DusVZnZ7; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DusVZnZ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtLwz5kHtz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:55:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CEDCA4168D;
	Tue, 27 Aug 2024 08:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E362BC8B7A5;
	Tue, 27 Aug 2024 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724748944;
	bh=WLyDwKrTLwxUKO9wLuHMkEx2eqbtMQG2RDk7GrJYDXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DusVZnZ7wV2iULh/1avLL75JPrhMhQlBqoECiJtic0bUtwgwuIxQeD5hzgO3OPkyS
	 dpl+eK1bBgzJJ35WOwwwbfdgq1YQrY2eHAEWUAKnv8OixY+PRJYPtQH9Uh4KDOOHgD
	 2/VI5iJPwBhdC5LsFDFX73FW+2wIcx/umVi6Bv43EvELDrk40xPn4mIuDGkezsnKRA
	 xbs+ZNNQqQDTYUIePAvIqd1K0l/VrmBAarQw0NUQwiKK+jAlMR+ifUUyK+I6EB0ATl
	 0IqZzSdRMeIajz+pVDlkeyPLq3GoGX7ttE4pCEa3ZuqwGkXktl0F6ooJc0ev3A8Yxa
	 2+SfAAZCXhU+Q==
Date: Tue, 27 Aug 2024 11:52:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Bruno Faccini <bfaccini@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Message-ID: <Zs2T5wkSYO9MGcab@kernel.org>
References: <MW4PR12MB72616723E1A090E315681FF6A38B2@MW4PR12MB7261.namprd12.prod.outlook.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR12MB72616723E1A090E315681FF6A38B2@MW4PR12MB7261.namprd12.prod.outlook.com>

Hi,

On Mon, Aug 26, 2024 at 06:17:22PM +0000, Bruno Faccini wrote:
> > On 7 Aug 2024, at 2:41, Mike Rapoport wrote:
> > 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Until now arch_numa was directly translating firmware NUMA information
> > to memblock.
> > 
> > Using numa_memblks as an intermediate step has a few advantages:
> > * alignment with more battle tested x86 implementation
> > * availability of NUMA emulation
> > * maintaining node information for not yet populated memory
> > 
> > Adjust a few places in numa_memblks to compile with 32-bit phys_addr_t
> > and replace current functionality related to numa_add_memblk() and
> > __node_distance() in arch_numa with the implementation based on
> > numa_memblks and add functions required by numa_emulation.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via
> > QEMU]
> > Acked-by: Dan Williams <dan.j.williams@intel.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> >   drivers/base/Kconfig       |   1 +
> >   drivers/base/arch_numa.c   | 201 +++++++++++--------------------------
> >   include/asm-generic/numa.h |   6 +-
> >   mm/numa_memblks.c          |  17 ++--
> >   4 files changed, 75 insertions(+), 150 deletions(-)
> >  
> > <snip>
> > 
> > +
> > +u64 __init numa_emu_dma_end(void)
> > +{
> > +             return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
> > +}
> > +
> 
> PFN_PHYS() translation is unnecessary here, as
> memblock_start_of_DRAM() + SZ_4G is already a
> memory size.
> 
> This should fix it:
>  
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 8d49893c0e94..e18701676426 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -346,7 +346,7 @@ void __init numa_emu_update_cpu_to_node(int
> *emu_nid_to_phys,
> 
> u64 __init numa_emu_dma_end(void)
> {
> -              return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
> +             return memblock_start_of_DRAM() + SZ_4G;
> }
> 
> void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)

Right, I've missed that. Thanks for the fix!

Andrew, can you please apply this (with fixed formatting)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 8d49893c0e94..e18701676426 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -346,7 +346,7 @@ void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
 
 u64 __init numa_emu_dma_end(void)
 {
-	return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
+	return memblock_start_of_DRAM() + SZ_4G;
 }
 
 void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)

-- 
Sincerely yours,
Mike.

