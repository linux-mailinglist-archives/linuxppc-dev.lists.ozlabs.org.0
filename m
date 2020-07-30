Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2695233350
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:47:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWtH5hVjzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:47:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q44ah9gk; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHWb604f7zDqfM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 23:33:53 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh1so1031491plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gJ5naNEgoyLscFRkBieJowy1N1nzNQK0XWDFe9z+itg=;
 b=Q44ah9gkeBtVyMPcbk0BKMJEayy6bI+N2KysmrwIa6pOabAPL04/62XtzkVzYFDl0F
 vo1kMy5OHXrzddFrgD7f5jwHKgNHAjcJ1CgDOAqRNQ+dDO+OdlNyfVBnd4alVnVKW7vB
 zhoewb6SvoUWnMxIB8nGYr41BjjkXpfz87kUnbWkubgfyLiEzCkTbRDbMakAy3MsOQLh
 NyVDX0XUPeBb1F6zwFx0/6xXAT7QwdTDEf4RT0gSiLsaMJfBUIDZieEldB3CFSuOFbjE
 dB+qE8enQd+oghuvX+Nczw/jWjhH+g0h/r5Z/x97D6aHzHQbAwBuaLVTHtNVCv4HgUjY
 /YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gJ5naNEgoyLscFRkBieJowy1N1nzNQK0XWDFe9z+itg=;
 b=rziaTDjVtF5gdpzkCQbLZ50RUtPdWfnXz6KpQInf+MBZBkfkA/47RUNpNEMIwuY2uX
 nCACN1jMbsrCo67OGDDXg1nFAVw5ApUDda6HEiL79aDOsA6aTvIWwrltW3/olnVOtfmP
 0UTUf11ZAdraKtMijrYb+V58HBx/DWHVKKKOxAJZn/CFtq2b/1HbmTGECRtV0zLejOI1
 zPi9LJ699DCZhtriAoVGu5mgKHXaHv69QoXP9HJYp91Nfs0VosmUKq52oOwzJhQ5JBjR
 DeDK1heRn7xfRQ/Y26YwC73hy4XlhPHBI2Oc27qH5t28J0+dQSTwKJ9uSOlY/FAnVGje
 GFFg==
X-Gm-Message-State: AOAM5303syliNRl6CSEomvuC7JqRwAb2aFMr6nJkZH9i+a312SlteSUc
 PbsAgkviHgCUlsBA5x1Hj0Mk2Hw=
X-Google-Smtp-Source: ABdhPJxrFId9fUA0R6RhiMVaoehBetzQwPlt4nS9kpFZu8F6te4u2r+lS2Av0Bvfg3EqMkbk1sOiAA==
X-Received: by 2002:a62:7b4e:: with SMTP id w75mr3267366pfc.130.1596116030201; 
 Thu, 30 Jul 2020 06:33:50 -0700 (PDT)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f89sm5981313pjg.5.2020.07.30.06.33.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:33:49 -0700 (PDT)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv4 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
Date: Thu, 30 Jul 2020 21:33:25 +0800
Message-Id: <1596116005-27511-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
References: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kexec@lists.infradead.org,
 Pingfan Liu <kernelfans@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A bug is observed on pseries by taking the following steps on rhel:
-1. drmgr -c mem -r -q 5
-2. echo c > /proc/sysrq-trigger

And then, the failure looks like:
kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
kdump: saving vmcore-dmesg.txt
kdump: saving vmcore-dmesg.txt complete
kdump: saving vmcore
 Checking for memory holes                         : [  0.0 %] /                   Checking for memory holes                         : [100.0 %] |                   Excluding unnecessary pages                       : [100.0 %] \                   Copying data                                      : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
[   44.337663] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
[   44.337677] hash-mmu: mm: Hashing failure ! EA=0x7fffba400000 access=0x8000000000000004 current=makedumpfile
[   44.337692] hash-mmu:     trap=0x300 vsid=0x13a109c ssize=1 base psize=2 psize 2 pte=0xc000000050000504
[   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba400000 nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
[   44.338548] Core dump to |/bin/false pipe failed
/lib/kdump-lib-initramfs.sh: line 98:   469 Bus error               $CORE_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-incomplete
kdump: saving vmcore failed

* Root cause *
  After analyzing, it turns out that in the current implementation,
when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updating as
the code __remove_memory() comes before drmem_update_dt().
So in kdump kernel, when read_from_oldmem() resorts to
pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, as it
can be observed "Bus error"

From a viewpoint of listener and publisher, the publisher notifies the
listener before data is ready.  This introduces a problem where udev
launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
updating. And in capture kernel, makedumpfile will access the memory based
on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.

* Fix *
This bug is introduced by commit 063b8b1251fd
("powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR
request"), which tried to combine all the dt updating into one.

To fix this issue, meanwhile not to introduce a quadratic runtime
complexity by the model:
  dlpar_memory_add_by_count
    for_each_drmem_lmb             <--
      dlpar_add_lmb
        drmem_update_dt(_v1|_v2)
          for_each_drmem_lmb       <--
The dt should still be only updated once, and just before the last memory
online/offline event is ejected to user space. Achieve this by tracing the
num of lmb added or removed.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Cc: kexec@lists.infradead.org
To: linuxppc-dev@lists.ozlabs.org
---
v3 -> v4: resolve a quadratic runtime complexity issue.
          This series is applied on next-test branch
 arch/powerpc/platforms/pseries/hotplug-memory.c | 88 ++++++++++++++++++-------
 1 file changed, 66 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 1a3ac3b..e07d5b1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -350,13 +350,13 @@ static bool lmb_is_removable(struct drmem_lmb *lmb)
 	return true;
 }
 
-static int dlpar_add_lmb(struct drmem_lmb *);
+static int dlpar_add_lmb(struct drmem_lmb *lmb, bool dt_update);
 
-static int dlpar_remove_lmb(struct drmem_lmb *lmb)
+static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
 {
 	unsigned long block_sz;
 	phys_addr_t base_addr;
-	int rc, nid;
+	int rc, ret, nid;
 
 	if (!lmb_is_removable(lmb))
 		return -EINVAL;
@@ -372,6 +372,11 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+	if (dt_update) {
+		ret = drmem_update_dt();
+		if (ret)
+			pr_warn("%s fail to update dt, but continue\n", __func__);
+	}
 
 	__remove_memory(nid, base_addr, block_sz);
 
@@ -387,6 +392,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 	int lmbs_removed = 0;
 	int lmbs_available = 0;
 	int rc;
+	bool dt_update = false;
 
 	pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
 
@@ -409,7 +415,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 	}
 
 	for_each_drmem_lmb(lmb) {
-		rc = dlpar_remove_lmb(lmb);
+		rc = dlpar_remove_lmb(lmb, dt_update);
 		if (rc)
 			continue;
 
@@ -421,16 +427,27 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		lmbs_removed++;
 		if (lmbs_removed == lmbs_to_remove)
 			break;
+		/* combine dt updating */
+		else if (lmbs_removed == lmbs_to_remove - 1)
+			dt_update = true;
 	}
 
 	if (lmbs_removed != lmbs_to_remove) {
+		bool rollback_dt_update = false;
+
 		pr_err("Memory hot-remove failed, adding LMB's back\n");
 
 		for_each_drmem_lmb(lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
-			rc = dlpar_add_lmb(lmb);
+			/*
+			 * Even if dlpar_remove_lmb() fails to update dt, it is
+			 * harmless to update dt here.
+			 */
+			if (--lmbs_removed == 0 && dt_update)
+				rollback_dt_update = true;
+			rc = dlpar_add_lmb(lmb, rollback_dt_update);
 			if (rc)
 				pr_err("Failed to add LMB back, drc index %x\n",
 				       lmb->drc_index);
@@ -468,7 +485,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 	for_each_drmem_lmb(lmb) {
 		if (lmb->drc_index == drc_index) {
 			lmb_found = 1;
-			rc = dlpar_remove_lmb(lmb);
+			rc = dlpar_remove_lmb(lmb, true);
 			if (!rc)
 				dlpar_release_drc(lmb->drc_index);
 
@@ -493,6 +510,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
 	int lmbs_available = 0;
 	int rc;
+	bool dt_update = false;
 
 	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
 		lmbs_to_remove, drc_index);
@@ -519,7 +537,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			continue;
 
-		rc = dlpar_remove_lmb(lmb);
+		if (lmb == end_lmb)
+			dt_update = true;
+		rc = dlpar_remove_lmb(lmb, dt_update);
 		if (rc)
 			break;
 
@@ -527,14 +547,17 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	}
 
 	if (rc) {
-		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
+		bool rollback_dt_update = false;
 
+		pr_err("Memory indexed-count-remove failed, adding any removed LMBs\n");
 
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
-
-			rc = dlpar_add_lmb(lmb);
+			/* Since in removing path, dt is only updated if lmb == end_lmb */
+			if (lmb == end_lmb)
+				rollback_dt_update = true;
+			rc = dlpar_add_lmb(lmb, rollback_dt_update);
 			if (rc)
 				pr_err("Failed to add LMB, drc index %x\n",
 				       lmb->drc_index);
@@ -572,7 +595,7 @@ static inline int dlpar_memory_remove(struct pseries_hp_errorlog *hp_elog)
 {
 	return -EOPNOTSUPP;
 }
-static int dlpar_remove_lmb(struct drmem_lmb *lmb)
+static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
 {
 	return -EOPNOTSUPP;
 }
@@ -591,10 +614,10 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 }
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
-static int dlpar_add_lmb(struct drmem_lmb *lmb)
+static int dlpar_add_lmb(struct drmem_lmb *lmb, bool dt_update)
 {
 	unsigned long block_sz;
-	int rc;
+	int rc, ret;
 
 	if (lmb->flags & DRCONF_MEM_ASSIGNED)
 		return -EINVAL;
@@ -607,6 +630,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 
 	lmb_set_nid(lmb);
 	lmb->flags |= DRCONF_MEM_ASSIGNED;
+	if (dt_update) {
+		ret = drmem_update_dt();
+		if (ret)
+			pr_warn("%s fail to update dt, but continue\n", __func__);
+	}
 
 	block_sz = memory_block_size_bytes();
 
@@ -625,7 +653,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
 		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
-
+		if (dt_update) {
+			ret = drmem_update_dt();
+			if (ret)
+				pr_warn("%s fail to update dt during rollback, but continue\n", __func__);
+		}
 		__remove_memory(nid, base_addr, block_sz);
 	}
 
@@ -638,6 +670,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 	int lmbs_available = 0;
 	int lmbs_added = 0;
 	int rc;
+	bool dt_update = false;
 
 	pr_info("Attempting to hot-add %d LMB(s)\n", lmbs_to_add);
 
@@ -664,7 +697,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 		if (rc)
 			continue;
 
-		rc = dlpar_add_lmb(lmb);
+		rc = dlpar_add_lmb(lmb, dt_update);
 		if (rc) {
 			dlpar_release_drc(lmb->drc_index);
 			continue;
@@ -678,16 +711,23 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 		lmbs_added++;
 		if (lmbs_added == lmbs_to_add)
 			break;
+		else if (lmbs_added == lmbs_to_add - 1)
+			dt_update = true;
 	}
 
 	if (lmbs_added != lmbs_to_add) {
+		bool rollback_dt_update = false;
+
 		pr_err("Memory hot-add failed, removing any added LMBs\n");
 
 		for_each_drmem_lmb(lmb) {
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
-			rc = dlpar_remove_lmb(lmb);
+			if (--lmbs_added == 0 && dt_update)
+				rollback_dt_update = true;
+
+			rc = dlpar_remove_lmb(lmb, rollback_dt_update);
 			if (rc)
 				pr_err("Failed to remove LMB, drc index %x\n",
 				       lmb->drc_index);
@@ -725,7 +765,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
 			lmb_found = 1;
 			rc = dlpar_acquire_drc(lmb->drc_index);
 			if (!rc) {
-				rc = dlpar_add_lmb(lmb);
+				rc = dlpar_add_lmb(lmb, true);
 				if (rc)
 					dlpar_release_drc(lmb->drc_index);
 			}
@@ -751,6 +791,7 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
 	int lmbs_available = 0;
 	int rc;
+	bool dt_update = false;
 
 	pr_info("Attempting to hot-add %u LMB(s) at index %x\n",
 		lmbs_to_add, drc_index);
@@ -781,7 +822,9 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 		if (rc)
 			break;
 
-		rc = dlpar_add_lmb(lmb);
+		if (lmb == end_lmb)
+			dt_update = true;
+		rc = dlpar_add_lmb(lmb, dt_update);
 		if (rc) {
 			dlpar_release_drc(lmb->drc_index);
 			break;
@@ -794,10 +837,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
 		pr_err("Memory indexed-count-add failed, removing any added LMBs\n");
 
 		for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+			bool rollback_dt_update = false;
+
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
-			rc = dlpar_remove_lmb(lmb);
+			if (lmb == end_lmb)
+				rollback_dt_update = true;
+			rc = dlpar_remove_lmb(lmb, rollback_dt_update);
 			if (rc)
 				pr_err("Failed to remove LMB, drc index %x\n",
 				       lmb->drc_index);
@@ -877,9 +924,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 		break;
 	}
 
-	if (!rc)
-		rc = drmem_update_dt();
-
 	unlock_device_hotplug();
 	return rc;
 }
-- 
2.7.5

