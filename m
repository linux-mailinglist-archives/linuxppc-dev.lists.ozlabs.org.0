Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C818301B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 13:22:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dSd32nklzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 23:22:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dSY73ssrzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 23:18:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NJk9WkVN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dSY504TYz9sP7;
 Thu, 12 Mar 2020 23:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584015530;
 bh=uzPQHcKFUKJMHkfBDqG3/L/YcmfDrTWlBQVsywQ7YR0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NJk9WkVNueZQ8JdTLd9cdYNpSN2l6FT4LixC6H90elMVVUziqXUwM3RZoMTQAiKml
 0XILov+55gYBGdg8UkJjOdPWCJeY7LTUyBuOoYDF4L/lyfe4Ed7uQpd6XvohxIZ2Fu
 hTIQkj/+zL2Oi9JUlzURBepA/uzEBhlnZGodbw5XVMSaXrodPbv2Fe3/3M/mBL5K+s
 WNI5yQJAJtWKbH31lUb4g/3lVpIZOXhi5fiHqOGBebL2V2V/DXWIGZ4X7Qsxddzi4K
 kRsBDzdH9twBbOzDAKozBKyUeMLfPTe0zpgk7dWPLH8zgbViB75ySHi9KhHuu+NxK9
 9pJJQwPX+9vEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Hocko <mhocko@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
In-Reply-To: <20200310150114.GO8447@dhcp22.suse.cz>
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz>
Date: Thu, 12 Mar 2020 23:18:42 +1100
Message-ID: <87a74lix5p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Hocko <mhocko@kernel.org> writes:
> On Thu 27-02-20 19:26:54, Michal Hocko wrote:
>> [Cc ppc maintainers]
> [...]
>> Please have a look at http://lkml.kernel.org/r/52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com
>> for the boot log with the debugging patch which tracks set_numa_mem.
>> This seems to lead to a crash in the slab allocator bebcause
>> node_to_mem_node(0) for memory less node resolves to the memory less
>> node http://lkml.kernel.org/r/dd450314-d428-6776-af07-f92c04c7b967@suse.cz.
>> The original report is http://lkml.kernel.org/r/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com
>
> ping 

The obvious fix is:

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 37c12e3bab9e..33b1fca0b258 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -892,6 +892,7 @@ void smp_prepare_boot_cpu(void)
 	paca_ptrs[boot_cpuid]->__current = current;
 #endif
 	set_numa_node(numa_cpu_lookup_table[boot_cpuid]);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[boot_cpuid]));
 	current_set[boot_cpuid] = current;
 }


But that doesn't work because smp_prepare_boot_cpu() is called too
early:

asmlinkage __visible void __init start_kernel(void)
{
	...
	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
	boot_cpu_hotplug_init();

	build_all_zonelists(NULL);


And local_memory_node() uses first_zones_zonelist() which doesn't work
prior to build_all_zonelists() being called.


The patch below might work. Sachin can you test this? I tried faking up
a system with a memoryless node zero but couldn't get it to even start
booting.

cheers


diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9b4f5fb719e0..d1f11437f6c4 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -282,6 +282,9 @@ void __init mem_init(void)
 	 */
 	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
 
+	BUG_ON(smp_processor_id() != boot_cpuid);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[boot_cpuid]));
+
 #ifdef CONFIG_SWIOTLB
 	/*
 	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
