Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BA94AF91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 20:21:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fs+rYBQU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfJQs5Q6Lz3dGt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 04:21:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fs+rYBQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfJQC3jshz3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 04:20:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C181ACE1196;
	Wed,  7 Aug 2024 18:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF468C32781;
	Wed,  7 Aug 2024 18:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723054848;
	bh=iPtiZxg9mYFfVaMP/wI1h2AEAZxcZhi354BsRK7OzkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fs+rYBQUVp7T/qbPiJP5M3yDB/6MQZbtGhaQKvRjA1Mevvpi2N6URXoVm6Iu+rs/H
	 5E96EIlDL0oiovI1UalP4pGMxvee6uDYhAHWeNICYCTEurK07w5XNnYjIp7hBBtH+o
	 BuYSL8/k1GjAORViJw9J27QcUbojhI3Ae/34xWNzZpQoCHqR1I22VHBnMk5CVvZxw6
	 SS54CnDP9bArj1yivpeOI0pLAxkinjxlqbL5z/NWC2FfzasiBT9xJGfZMh2KPtgniu
	 UwqU0smfhLaXdoDIRZ0Xs8jOb5KYUUdKDjJmyRdFpd/cLCPX7dVpAIbbnapWdyqlxn
	 +oDN4u6kRqxgA==
Date: Wed, 7 Aug 2024 21:18:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Message-ID: <ZrO6cExVz1He_yPn@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
 <20240807064110.1003856-25-rppt@kernel.org>
 <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1befc540-8904-4c23-b0e6-e2c556fe22b9@app.fastmail.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2024 at 08:58:37AM +0200, Arnd Bergmann wrote:
> On Wed, Aug 7, 2024, at 08:41, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Until now arch_numa was directly translating firmware NUMA information
> > to memblock.
> 
> I get a link time warning from this:
> 
>     WARNING: modpost: vmlinux: section mismatch in reference: numa_set_cpumask+0x24 (section: .text.unlikely) -> early_cpu_to_node (section: .init.text)

I didn't see this neither in my build tests nor in kbuild reports :/
 
> > @@ -142,7 +144,7 @@ void __init early_map_cpu_to_node(unsigned int cpu, int nid)
> >  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
> >  EXPORT_SYMBOL(__per_cpu_offset);
> > 
> > -int __init early_cpu_to_node(int cpu)
> > +int early_cpu_to_node(int cpu)
> >  {
> >  	return cpu_to_node_map[cpu];
> >  }
> 
> early_cpu_to_node() can no longer be __init here
> 
> > +#endif /* CONFIG_NUMA_EMU */
> > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > index c32e0cf23c90..c2b046d1fd82 100644
> > --- a/include/asm-generic/numa.h
> > +++ b/include/asm-generic/numa.h
> > @@ -32,8 +32,6 @@ static inline const struct cpumask *cpumask_of_node(int node)
> > 
> >  void __init arch_numa_init(void);
> >  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> > -void __init numa_set_distance(int from, int to, int distance);
> > -void __init numa_free_distance(void);
> >  void __init early_map_cpu_to_node(unsigned int cpu, int nid);
> >  int __init early_cpu_to_node(int cpu);
> >  void numa_store_cpu_info(unsigned int cpu);
> 
> but is still declared as __init in the header, so it is
> still put in that section and discarded after boot.

I believe this should fix it

diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
index c2b046d1fd82..e063d6487f66 100644
--- a/include/asm-generic/numa.h
+++ b/include/asm-generic/numa.h
@@ -33,7 +33,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
 void __init arch_numa_init(void);
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init early_map_cpu_to_node(unsigned int cpu, int nid);
-int __init early_cpu_to_node(int cpu);
+int early_cpu_to_node(int cpu);
 void numa_store_cpu_info(unsigned int cpu);
 void numa_add_cpu(unsigned int cpu);
 void numa_remove_cpu(unsigned int cpu);
 
> I was confused by this at first, since the 'early' name
> seems to imply that you shouldn't call it once the system
> is up, but now you do.

I agree that this is confusing, but that's what x86 does and numa_emulation
uses.
 
>      Arnd
> 

-- 
Sincerely yours,
Mike.
