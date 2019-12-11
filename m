Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD811B894
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 17:23:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y2L30RYrzDqBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 03:23:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cEvdccc7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y14s0tYczDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:27:09 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC7812465B;
 Wed, 11 Dec 2019 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078027;
 bh=a/ouf4EpDGmZqFeyJWekK7dS7ijCAZoN0vTGv41RCSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cEvdccc7PLYbO9ub/6HJwLoiZitWY+HJGJawPu3MoH06y4nwTozfU76hauTU96Z2u
 GN51kUhpF2fo3hN47hoPfohgzS6lM0Z9WcjSMGeCUELttP9xRJoVulovDx7S2pAYdA
 0E1N1PY9/3xF1HlE8sztvDzA+vV1/hN+RF0HB+CM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 22/79] powerpc/book3s64/hash: Add cond_resched to
 avoid soft lockup warning
Date: Wed, 11 Dec 2019 10:25:46 -0500
Message-Id: <20191211152643.23056-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152643.23056-1-sashal@kernel.org>
References: <20191211152643.23056-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit 16f6b67cf03cb43db7104acb2ca877bdc2606c92 ]

With large memory (8TB and more) hotplug, we can get soft lockup
warnings as below. These were caused by a long loop without any
explicit cond_resched which is a problem for !PREEMPT kernels.

Avoid this using cond_resched() while inserting hash page table
entries. We already do similar cond_resched() in __add_pages(), see
commit f64ac5e6e306 ("mm, memory_hotplug: add scheduling point to
__add_pages").

  rcu:     3-....: (24002 ticks this GP) idle=13e/1/0x4000000000000002 softirq=722/722 fqs=12001
   (t=24003 jiffies g=4285 q=2002)
  NMI backtrace for cpu 3
  CPU: 3 PID: 3870 Comm: ndctl Not tainted 5.3.0-197.18-default+ #2
  Call Trace:
    dump_stack+0xb0/0xf4 (unreliable)
    nmi_cpu_backtrace+0x124/0x130
    nmi_trigger_cpumask_backtrace+0x1ac/0x1f0
    arch_trigger_cpumask_backtrace+0x28/0x3c
    rcu_dump_cpu_stacks+0xf8/0x154
    rcu_sched_clock_irq+0x878/0xb40
    update_process_times+0x48/0x90
    tick_sched_handle.isra.16+0x4c/0x80
    tick_sched_timer+0x68/0xe0
    __hrtimer_run_queues+0x180/0x430
    hrtimer_interrupt+0x110/0x300
    timer_interrupt+0x108/0x2f0
    decrementer_common+0x114/0x120
  --- interrupt: 901 at arch_add_memory+0xc0/0x130
      LR = arch_add_memory+0x74/0x130
    memremap_pages+0x494/0x650
    devm_memremap_pages+0x3c/0xa0
    pmem_attach_disk+0x188/0x750
    nvdimm_bus_probe+0xac/0x2c0
    really_probe+0x148/0x570
    driver_probe_device+0x19c/0x1d0
    device_driver_attach+0xcc/0x100
    bind_store+0x134/0x1c0
    drv_attr_store+0x44/0x60
    sysfs_kf_write+0x64/0x90
    kernfs_fop_write+0x1a0/0x270
    __vfs_write+0x3c/0x70
    vfs_write+0xd0/0x260
    ksys_write+0xdc/0x130
    system_call+0x5c/0x68

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191001084656.31277-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/hash_utils_64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/hash_utils_64.c b/arch/powerpc/mm/hash_utils_64.c
index 11b41383e1672..8894c8f300eac 100644
--- a/arch/powerpc/mm/hash_utils_64.c
+++ b/arch/powerpc/mm/hash_utils_64.c
@@ -307,6 +307,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 		if (ret < 0)
 			break;
 
+		cond_resched();
 #ifdef CONFIG_DEBUG_PAGEALLOC
 		if (debug_pagealloc_enabled() &&
 			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
-- 
2.20.1

