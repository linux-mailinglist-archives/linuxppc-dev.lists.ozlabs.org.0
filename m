Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900714EF216
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:49:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVNNQ2fTsz3fjW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:49:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qKem/l+i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qKem/l+i; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVNLD0s7wz3fXC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:47:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 427CA60AD8;
 Fri,  1 Apr 2022 14:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2C5C2BBE4;
 Fri,  1 Apr 2022 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824433;
 bh=92zbB0x/lQbbR39HEEkf4od6bfyiRr8ajymqPCUOB9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKem/l+iKrghwJaSQ4WPlclEAHNYjU+g9h5m7I8a3ZQasqj0EM17+d+ZEptPxrWxt
 H5kGC9Dp/wquIT/+bhoGUYHN1YYcQ2czoSwMmo1FczE+85vhnBJjvVz9zfCPNqlhVK
 Epjsi6io5XN19XacJI2bM1nAxVnVID5Hd8/M+KvfhTm3KBz+WbHVza2TfnEfggvdJZ
 pRxP2jUdiiwK+OMJ6zHwrcZ5bia9IgSH4S8NsWFLApm8Hb7Pfd9lJ6/HOZ8/5MZDbc
 eQzl6NZwfI4Vjqf0GVT9abfEFWim9EH7jFXjZ/CSNkZ676C7HIm6chYXHIrumvNSOm
 QGkBAyJaMpWSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 23/29] powerpc/code-patching: Pre-map patch area
Date: Fri,  1 Apr 2022 10:46:06 -0400
Message-Id: <20220401144612.1955177-23-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401144612.1955177-1-sashal@kernel.org>
References: <20220401144612.1955177-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 591b4b268435f00d2f0b81f786c2c7bd5ef66416 ]

Paul reported a warning with DEBUG_ATOMIC_SLEEP=y:

  BUG: sleeping function called from invalid context at include/linux/sched/mm.h:256
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 0, expected: 0
  ...
  Call Trace:
    dump_stack_lvl+0xa0/0xec (unreliable)
    __might_resched+0x2f4/0x310
    kmem_cache_alloc+0x220/0x4b0
    __pud_alloc+0x74/0x1d0
    hash__map_kernel_page+0x2cc/0x390
    do_patch_instruction+0x134/0x4a0
    arch_jump_label_transform+0x64/0x78
    __jump_label_update+0x148/0x180
    static_key_enable_cpuslocked+0xd0/0x120
    static_key_enable+0x30/0x50
    check_kvm_guest+0x60/0x88
    pSeries_smp_probe+0x54/0xb0
    smp_prepare_cpus+0x3e0/0x430
    kernel_init_freeable+0x20c/0x43c
    kernel_init+0x30/0x1a0
    ret_from_kernel_thread+0x5c/0x64

Peter pointed out that this is because do_patch_instruction() has
disabled interrupts, but then map_patch_area() calls map_kernel_page()
then hash__map_kernel_page() which does a sleeping memory allocation.

We only see the warning in KVM guests with SMT enabled, which is not
particularly common, or on other platforms if CONFIG_KPROBES is
disabled, also not common. The reason we don't see it in most
configurations is that another path that happens to have interrupts
enabled has allocated the required page tables for us, eg. there's a
path in kprobes init that does that. That's just pure luck though.

As Christophe suggested, the simplest solution is to do a dummy
map/unmap when we initialise the patching, so that any required page
table levels are pre-allocated before the first call to
do_patch_instruction(). This works because the unmap doesn't free any
page tables that were allocated by the map, it just clears the PTE,
leaving the page table levels there for the next map.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Debugged-by: Peter Zijlstra <peterz@infradead.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220223015821.473097-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/lib/code-patching.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index bb245dbf6c57..2b9a92ea2d89 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -46,9 +46,14 @@ int raw_patch_instruction(unsigned int *addr, unsigned int instr)
 #ifdef CONFIG_STRICT_KERNEL_RWX
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
+static int map_patch_area(void *addr, unsigned long text_poke_addr);
+static void unmap_patch_area(unsigned long addr);
+
 static int text_area_cpu_up(unsigned int cpu)
 {
 	struct vm_struct *area;
+	unsigned long addr;
+	int err;
 
 	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
 	if (!area) {
@@ -56,6 +61,15 @@ static int text_area_cpu_up(unsigned int cpu)
 			cpu);
 		return -1;
 	}
+
+	// Map/unmap the area to ensure all page tables are pre-allocated
+	addr = (unsigned long)area->addr;
+	err = map_patch_area(empty_zero_page, addr);
+	if (err)
+		return err;
+
+	unmap_patch_area(addr);
+
 	this_cpu_write(text_poke_area, area);
 
 	return 0;
-- 
2.34.1

