Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5786ADB3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 16:33:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RrHQ75l5zDqNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 00:33:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="gxEMwh/a"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RrDx3XLRzDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 00:30:56 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id u40so16362036qth.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=CXfqRVCQFw7xqj7AICeJBWtrNhS6pGZdKh11BOOZ9lA=;
 b=gxEMwh/a/ND2u6HYSSw+CvoCqCBHgB9WAY3kEMDTKnHS721fCqfnpsUSXC2a0oOeGf
 hS6DIyV3UJqVsob9he/lOalVvuUnlHqXfyaB6/qIu5AZdsXVBD3H5UKaA89p9ehrqtw+
 HyVJbHyy0BC20nYdMA7IvWJsrq/du8PbBCqzLf/32PujYUN1YiLrJBu2apAoILgQ2QQM
 WXN1kirG4t98s2AA6PXav/e270xdKKCBwOxaaUgq+gIL67v8Nnc7hzablBWT5tXiqNyZ
 dztk4qQJT8T3WUmUbdwsE/SUovPAHV8+d9xftGR/FzO4FcQmWQWioLNX0jmu7RnXkbMR
 l9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CXfqRVCQFw7xqj7AICeJBWtrNhS6pGZdKh11BOOZ9lA=;
 b=on8cgPQDIWZKDlOtkf0SY725tYnWsPGvrD9uWHv6mNLemn2S9mhq9zD7ODTS9stP7Y
 OTZQi24VoMTh3HGbF117GwFQxgtecGIISYSEXVpSs3YcUw3+3SkepOEZWKFlDTUpqj2o
 koBVeVsGo3knCFKTEIQH6qkPPpXl/QdfxPXUp9E62emiuOMmzTpd33kmhGut+ATEMawS
 avHcE1rSVSJu3SkSYHYp1RNrmN17YJ5zLVvDgKZhu5gpPFI95/vlVVz9Dq05I8FkM0os
 RyT0MRbdhNs78aSlBIxbW/PKS917Hu+v/VTcspMpNxtzHTajqgz6ACbr56a6DkZ2egfX
 Zaag==
X-Gm-Message-State: APjAAAVXL/UhW/Xiu9tt+35hu+GvTaJ5o2SmN5S1a7RWGYmE+SEGaPGR
 9hKGD+pXAeWR176pMXV2VgaSJw==
X-Google-Smtp-Source: APXvYqz3L3fSgl55DmtBbUTWQgR45D2JISFvfWDBJBH3PWAbVc68BgzFeZ6k0wq1m7D4qm15IYPnzA==
X-Received: by 2002:a0c:eda7:: with SMTP id h7mr14228023qvr.30.1568039452923; 
 Mon, 09 Sep 2019 07:30:52 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id w126sm6478943qkd.68.2019.09.09.07.30.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 07:30:51 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/lockdep: fix a false positive warning
Date: Mon,  9 Sep 2019 10:30:33 -0400
Message-Id: <1568039433-10176-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-arch@vger.kernel.org, bvanassche@acm.org, arnd@arndb.de,
 peterz@infradead.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 paulus@samba.org, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 108c14858b9e ("locking/lockdep: Add support for dynamic
keys") introduced a boot warning on powerpc below, because since the
commit 2d4f567103ff ("KVM: PPC: Introduce kvm_tmp framework") adds
kvm_tmp[] into the .bss section and then free the rest of unused spaces
back to the page allocator.

kernel_init
  kvm_guest_init
    kvm_free_tmp
      free_reserved_area
        free_unref_page
          free_unref_page_prepare

Later, alloc_workqueue() happens to allocate some pages from there and
trigger the warning at,

if (WARN_ON_ONCE(static_obj(key)))

Fix it by adding a generic helper arch_is_bss_hole() to skip those areas
in static_obj(). Since kvm_free_tmp() is only done early during the
boot, just go lockless to make the implementation simple for now.

WARNING: CPU: 0 PID: 13 at kernel/locking/lockdep.c:1120
Workqueue: events work_for_cpu_fn
Call Trace:
  lockdep_register_key+0x68/0x200
  wq_init_lockdep+0x40/0xc0
  trunc_msg+0x385f9/0x4c30f (unreliable)
  wq_init_lockdep+0x40/0xc0
  alloc_workqueue+0x1e0/0x620
  scsi_host_alloc+0x3d8/0x490
  ata_scsi_add_hosts+0xd0/0x220 [libata]
  ata_host_register+0x178/0x400 [libata]
  ata_host_activate+0x17c/0x210 [libata]
  ahci_host_activate+0x84/0x250 [libahci]
  ahci_init_one+0xc74/0xdc0 [ahci]
  local_pci_probe+0x78/0x100
  work_for_cpu_fn+0x40/0x70
  process_one_work+0x388/0x750
  process_scheduled_works+0x50/0x90
  worker_thread+0x3d0/0x570
  kthread+0x1b8/0x1e0
  ret_from_kernel_thread+0x5c/0x7c

Fixes: 108c14858b9e ("locking/lockdep: Add support for dynamic keys")
Signed-off-by: Qian Cai <cai@lca.pw>
---

v3: Change arch_is_bss_hole() to return a "bool".
    Rearrange variables in kvm.c a bit.
v2: No need to actually define arch_is_bss_hole() powerpc64 only.

 arch/powerpc/include/asm/sections.h | 11 +++++++++++
 arch/powerpc/kernel/kvm.c           |  8 +++++++-
 include/asm-generic/sections.h      |  7 +++++++
 kernel/locking/lockdep.c            |  3 +++
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 4a1664a8658d..6e9e39ebbb27 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -5,8 +5,19 @@
 
 #include <linux/elf.h>
 #include <linux/uaccess.h>
+
+#define arch_is_bss_hole arch_is_bss_hole
+
 #include <asm-generic/sections.h>
 
+extern void *bss_hole_start, *bss_hole_end;
+
+static inline bool arch_is_bss_hole(unsigned long addr)
+{
+	return addr >= (unsigned long)bss_hole_start &&
+	       addr < (unsigned long)bss_hole_end;
+}
+
 extern char __head_end[];
 
 #ifdef __powerpc64__
diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index b7b3a5e4e224..e3c3b076ff07 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -64,9 +64,11 @@
 #define KVM_INST_MTSRIN		0x7c0001e4
 
 static bool kvm_patching_worked = true;
-char kvm_tmp[1024 * 1024];
 static int kvm_tmp_index;
 
+char kvm_tmp[1024 * 1024];
+void *bss_hole_start, *bss_hole_end;
+
 static inline void kvm_patch_ins(u32 *inst, u32 new_inst)
 {
 	*inst = new_inst;
@@ -707,6 +709,10 @@ static __init void kvm_free_tmp(void)
 	 */
 	kmemleak_free_part(&kvm_tmp[kvm_tmp_index],
 			   ARRAY_SIZE(kvm_tmp) - kvm_tmp_index);
+
+	bss_hole_start = &kvm_tmp[kvm_tmp_index];
+	bss_hole_end = &kvm_tmp[ARRAY_SIZE(kvm_tmp)];
+
 	free_reserved_area(&kvm_tmp[kvm_tmp_index],
 			   &kvm_tmp[ARRAY_SIZE(kvm_tmp)], -1, NULL);
 }
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index d1779d442aa5..28a7a56e7c8a 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -91,6 +91,13 @@ static inline int arch_is_kernel_initmem_freed(unsigned long addr)
 }
 #endif
 
+#ifndef arch_is_bss_hole
+static inline bool arch_is_bss_hole(unsigned long addr)
+{
+	return false;
+}
+#endif
+
 /**
  * memory_contains - checks if an object is contained within a memory region
  * @begin: virtual address of the beginning of the memory region
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 4861cf8e274b..cd75b51f15ce 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -675,6 +675,9 @@ static int static_obj(const void *obj)
 	if (arch_is_kernel_initmem_freed(addr))
 		return 0;
 
+	if (arch_is_bss_hole(addr))
+		return 0;
+
 	/*
 	 * static variable?
 	 */
-- 
1.8.3.1

