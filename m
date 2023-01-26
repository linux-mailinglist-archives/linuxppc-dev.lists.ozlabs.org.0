Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D038E67C4AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 08:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Wyx5prdz3fDW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2WyK4nsjz3cgw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 18:08:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P2WyB0M6Yz9sd7;
	Thu, 26 Jan 2023 08:08:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zR25zrkcDSUr; Thu, 26 Jan 2023 08:08:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P2Wy863Mpz9sdB;
	Thu, 26 Jan 2023 08:08:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BF56E8B76D;
	Thu, 26 Jan 2023 08:08:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2SJtYN5JNx8I; Thu, 26 Jan 2023 08:08:16 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.5.2])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 800A48B763;
	Thu, 26 Jan 2023 08:08:16 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 30Q74xEu2764291
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 08:04:59 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 30Q74uJB2764288;
	Thu, 26 Jan 2023 08:04:56 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] kasan: Fix Oops due to missing calls to kasan_arch_is_ready()
Date: Thu, 26 Jan 2023 08:04:47 +0100
Message-Id: <150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674716683; l=7054; s=20211009; h=from:subject:message-id; bh=GpOaHGWHkRLK3w+qELfaGMG8mIxKwVDUBSOVaCUA3e0=; b=ur0fVC6TvQtoPHkKCNrcuxg4+ha3+GW2lsw3we8TWNoDIr2bcKf4t9U+usHU28Jq1T1cwH+xi8we gQ/xU8BbDUDZD3kTNEGCjWsEj23j+wSD3T9zmXq7qSmIg6Q5Wby+
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc64, you can build a kernel with KASAN as soon as you build it
with RADIX MMU support. However if the CPU doesn't have RADIX MMU,
KASAN isn't enabled at init and the following Oops is encountered.

  [    0.000000][    T0] KASAN not enabled as it requires radix!

  [    4.484295][   T26] BUG: Unable to handle kernel data access at 0xc00e000000804a04
  [    4.485270][   T26] Faulting instruction address: 0xc00000000062ec6c
  [    4.485748][   T26] Oops: Kernel access of bad area, sig: 11 [#1]
  [    4.485920][   T26] BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  [    4.486259][   T26] Modules linked in:
  [    4.486637][   T26] CPU: 0 PID: 26 Comm: kworker/u2:2 Not tainted 6.2.0-rc3-02590-gf8a023b0a805 #249
  [    4.486907][   T26] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
  [    4.487445][   T26] Workqueue: eval_map_wq .tracer_init_tracefs_work_func
  [    4.488744][   T26] NIP:  c00000000062ec6c LR: c00000000062bb84 CTR: c0000000002ebcd0
  [    4.488867][   T26] REGS: c0000000049175c0 TRAP: 0380   Not tainted  (6.2.0-rc3-02590-gf8a023b0a805)
  [    4.489028][   T26] MSR:  8000000002009032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 44002808  XER: 00000000
  [    4.489584][   T26] CFAR: c00000000062bb80 IRQMASK: 0
  [    4.489584][   T26] GPR00: c0000000005624d4 c000000004917860 c000000001cfc000 1800000000804a04
  [    4.489584][   T26] GPR04: c0000000003a2650 0000000000000cc0 c00000000000d3d8 c00000000000d3d8
  [    4.489584][   T26] GPR08: c0000000049175b0 a80e000000000000 0000000000000000 0000000017d78400
  [    4.489584][   T26] GPR12: 0000000044002204 c000000003790000 c00000000435003c c0000000043f1c40
  [    4.489584][   T26] GPR16: c0000000043f1c68 c0000000043501a0 c000000002106138 c0000000043f1c08
  [    4.489584][   T26] GPR20: c0000000043f1c10 c0000000043f1c20 c000000004146c40 c000000002fdb7f8
  [    4.489584][   T26] GPR24: c000000002fdb834 c000000003685e00 c000000004025030 c000000003522e90
  [    4.489584][   T26] GPR28: 0000000000000cc0 c0000000003a2650 c000000004025020 c000000004025020
  [    4.491201][   T26] NIP [c00000000062ec6c] .kasan_byte_accessible+0xc/0x20
  [    4.491430][   T26] LR [c00000000062bb84] .__kasan_check_byte+0x24/0x90
  [    4.491767][   T26] Call Trace:
  [    4.491941][   T26] [c000000004917860] [c00000000062ae70] .__kasan_kmalloc+0xc0/0x110 (unreliable)
  [    4.492270][   T26] [c0000000049178f0] [c0000000005624d4] .krealloc+0x54/0x1c0
  [    4.492453][   T26] [c000000004917990] [c0000000003a2650] .create_trace_option_files+0x280/0x530
  [    4.492613][   T26] [c000000004917a90] [c000000002050d90] .tracer_init_tracefs_work_func+0x274/0x2c0
  [    4.492771][   T26] [c000000004917b40] [c0000000001f9948] .process_one_work+0x578/0x9f0
  [    4.492927][   T26] [c000000004917c30] [c0000000001f9ebc] .worker_thread+0xfc/0x950
  [    4.493084][   T26] [c000000004917d60] [c00000000020be84] .kthread+0x1a4/0x1b0
  [    4.493232][   T26] [c000000004917e10] [c00000000000d3d8] .ret_from_kernel_thread+0x58/0x60
  [    4.495642][   T26] Code: 60000000 7cc802a6 38a00000 4bfffc78 60000000 7cc802a6 38a00001 4bfffc68 60000000 3d20a80e 7863e8c2 792907c6 <7c6348ae> 20630007 78630fe0 68630001
  [    4.496704][   T26] ---[ end trace 0000000000000000 ]---

The Oops is due to kasan_byte_accessible() not checking the readiness
of KASAN. Add missing call to kasan_arch_is_ready() and bail out when
not ready. The same problem is observed with ____kasan_kfree_large()
so fix it the same.

Also, as KASAN is not available and no shadow area is allocated for
linear memory mapping, there is no point in allocating shadow mem for
vmalloc memory as shown below in /sys/kernel/debug/kernel_page_tables

  ---[ kasan shadow mem start ]---
  0xc00f000000000000-0xc00f00000006ffff  0x00000000040f0000       448K         r  w       pte  valid  present        dirty  accessed
  0xc00f000000860000-0xc00f00000086ffff  0x000000000ac10000        64K         r  w       pte  valid  present        dirty  accessed
  0xc00f3ffffffe0000-0xc00f3fffffffffff  0x0000000004d10000       128K         r  w       pte  valid  present        dirty  accessed
  ---[ kasan shadow mem end ]---

So, also verify KASAN readiness before allocating and poisoning
shadow mem for VMAs.

Reported-by: Nathan Lynch <nathanl@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/kasan/common.c  |  3 +++
 mm/kasan/generic.c |  7 ++++++-
 mm/kasan/shadow.c  | 12 ++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 833bf2cfd2a3..21e66d7f261d 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -246,6 +246,9 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object,
 
 static inline bool ____kasan_kfree_large(void *ptr, unsigned long ip)
 {
+	if (!kasan_arch_is_ready())
+		return false;
+
 	if (ptr != page_address(virt_to_head_page(ptr))) {
 		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
 		return true;
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index b076f597a378..cb762982c8ba 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -191,7 +191,12 @@ bool kasan_check_range(unsigned long addr, size_t size, bool write,
 
 bool kasan_byte_accessible(const void *addr)
 {
-	s8 shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
+	s8 shadow_byte;
+
+	if (!kasan_arch_is_ready())
+		return true;
+
+	shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
 
 	return shadow_byte >= 0 && shadow_byte < KASAN_GRANULE_SIZE;
 }
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 2fba1f51f042..15cfb34d16a1 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -291,6 +291,9 @@ int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
 	unsigned long shadow_start, shadow_end;
 	int ret;
 
+	if (!kasan_arch_is_ready())
+		return 0;
+
 	if (!is_vmalloc_or_module_addr((void *)addr))
 		return 0;
 
@@ -459,6 +462,9 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
 	unsigned long region_start, region_end;
 	unsigned long size;
 
+	if (!kasan_arch_is_ready())
+		return;
+
 	region_start = ALIGN(start, KASAN_MEMORY_PER_SHADOW_PAGE);
 	region_end = ALIGN_DOWN(end, KASAN_MEMORY_PER_SHADOW_PAGE);
 
@@ -502,6 +508,9 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	 * with setting memory tags, so the KASAN_VMALLOC_INIT flag is ignored.
 	 */
 
+	if (!kasan_arch_is_ready())
+		return (void *)start;
+
 	if (!is_vmalloc_or_module_addr(start))
 		return (void *)start;
 
@@ -524,6 +533,9 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
  */
 void __kasan_poison_vmalloc(const void *start, unsigned long size)
 {
+	if (!kasan_arch_is_ready())
+		return;
+
 	if (!is_vmalloc_or_module_addr(start))
 		return;
 
-- 
2.38.1

