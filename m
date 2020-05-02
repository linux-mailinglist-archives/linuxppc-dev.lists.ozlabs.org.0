Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4182A1C24F6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:57:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DngF2lpdzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kp6eAYJg; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmr60hjjzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:21 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id fu13so1169745pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wftzfvearoip9hQ1Jfrm2JqetKDnSGE9kRDT1TpOP5A=;
 b=Kp6eAYJglICKSeRKhJv5ZvQlHZ9Jc32DFfidjsIeGMz9hgx7uWFj1WbPvlHSM4QgUh
 /jNxwDeEpieIldhZJlYyBQxeWsDTu/RYO8Pmqt2jvei+kBBaKLnVF7NY5sgZOW28SvqB
 CrGFN+McJKZguqMC68AnZDWtO5SynmaJeP2RSBnnVanzALw72zjji6AU2yHPf0SC4NzF
 cn8Hal2VKZws7WcZ0hNTIxzqPKuaEZiIBN7pQ00PoQVhuImIShv2NdmDLNezrW2e1gDr
 1RfzsRnocl3Jcngi1nWOJ7evyMCISMcA7M6otAiE9hHKEfWu88pW1bwazKjlCLNYfx6k
 b6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wftzfvearoip9hQ1Jfrm2JqetKDnSGE9kRDT1TpOP5A=;
 b=WrT2sQxs5YRNX0QjoEfKYNx804akc3aP3QIcKxW5nQNFrgLQiWXEqFEgFjOH/rspCW
 meRK/CvDZzoyzTU25AKrGaAbOa7oqcB/2PlryaioIb8YqDN/XerlSuVhCDe1KqvV7Fpl
 mckoSz47wJbmeXSngt+DpTYxwzsqgQQm+DVNK07pSPGA81LrbQWFQOvSpJ+PAorDbSdB
 CER4xq0lKYOlI38q/3WP6kK2JJa3hbIR/oHpDBL90M4T+R11hK8veNy/smclc842AHOI
 apkOyZNsLAFXDtxKs13rONeMDqh+UCgPosEoVDR1443sdQjZYYWTyp0++2ljqiBETd36
 0GuA==
X-Gm-Message-State: AGi0PuYvCxKWppiu/NjVel4vjAF1ax8rLqIxlyEeRlDCFm/L7xd6JXCc
 ohl+fUbDDg8hDVkbyz+2UGs31KFf
X-Google-Smtp-Source: APiQypKzFzswzR3XX2wb/2HpEwcW0qSHAd4mqG1RNrHCepgFJnhXJjjN0ocI9xeS4n4XlhG9zNQYpA==
X-Received: by 2002:a17:902:740a:: with SMTP id
 g10mr8923518pll.137.1588418419421; 
 Sat, 02 May 2020 04:20:19 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 10/10] powerpc/powernv: OPAL V4 Implement vm_map/unmap
 service
Date: Sat,  2 May 2020 21:19:14 +1000
Message-Id: <20200502111914.166578-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This implements os_vm_map, os_vm_unmap. OPAL uses EA regions that
is specifies in OPAL_FIND_VM_AREA for these mappings, so provided
the page tables are allocated at init-time and not freed, these
services can be provided without memory allocation / blocking.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/opal-api.h   |  2 +
 arch/powerpc/platforms/powernv/opal.c | 57 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 1b2f176677fc..97c5e5423827 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1205,6 +1205,8 @@ struct opal_vm_area {
 
 struct opal_os_ops {
 	__be64  os_printf; /* void printf(int32_t level, const char *str) */
+	__be64  os_vm_map; /* int64_t os_vm_map(uint64_t ea, uint64_t pa, uint64_t flags) */
+	__be64  os_vm_unmap; /* void os_vm_unmap(uint64_t ea) */
 };
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 0fbfcd088c58..93b9afaf33b3 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -1095,6 +1095,61 @@ static pgprot_t opal_vm_flags_to_prot(uint64_t flags)
 	return prot;
 }
 
+static int64_t os_vm_map(uint64_t ea, uint64_t pa, uint64_t flags)
+{
+	struct mm_struct *mm = opal_mm;
+	spinlock_t *ptl;
+	pte_t pte, *ptep;
+	pgprot_t prot;
+
+	if (WARN_ON_ONCE(!opal_mm_enabled))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(!(mfmsr() & (MSR_IR|MSR_DR))))
+		return -EINVAL;
+
+	/* mm should be active_mm if MMU is on here */
+
+//	printk("os_vm_map 0x%llx->0x%llx flags=0x%llx\n", ea, pa, flags);
+
+	prot = opal_vm_flags_to_prot(flags);
+
+	pte = pfn_pte(pa >> PAGE_SHIFT, PAGE_KERNEL_X);
+
+	ptep = get_locked_pte(mm, ea, &ptl);
+	set_pte_at(mm, ea, ptep, pte);
+	pte_unmap_unlock(ptep, ptl);
+
+	return 0;
+}
+
+static void os_vm_unmap(uint64_t ea)
+{
+	struct mm_struct *mm = opal_mm;
+	spinlock_t *ptl;
+	pte_t *ptep;
+
+	if (WARN_ON_ONCE(!opal_mm_enabled))
+		return;
+
+	if (WARN_ON_ONCE(!(mfmsr() & (MSR_IR|MSR_DR))))
+		return;
+
+//	printk("os_vm_unmap 0x%llx\n", ea);
+
+	/* mm should be active_mm if MMU is on here */
+
+	ptep = get_locked_pte(mm, ea, &ptl);
+	pte_clear(mm, ea, ptep);
+	pte_unmap_unlock(ptep, ptl);
+
+	/*
+	 * This leaves potential TLBs in other CPUs for this EA, but it is
+	 * only used by this CPU. Can't do a broadcast flush here, no IPIs.
+	 */
+	local_flush_tlb_mm(mm);
+}
+
 static int __init opal_init_mm(void)
 {
 	struct mm_struct *mm;
@@ -1174,6 +1229,8 @@ static int __init opal_init_early(void)
 
 		memset(&opal_os_ops, 0, sizeof(opal_os_ops));
 		opal_os_ops.os_printf = cpu_to_be64(&os_printf);
+		opal_os_ops.os_vm_map = cpu_to_be64(&os_vm_map);
+		opal_os_ops.os_vm_unmap = cpu_to_be64(&os_vm_unmap);
 		if (opal_register_os_ops(&opal_os_ops, sizeof(opal_os_ops))) {
 			pr_warn("OPAL register OS ops failed, firmware will run in v3 mode.\n");
 		} else {
-- 
2.23.0

