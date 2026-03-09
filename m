Return-Path: <linuxppc-dev+bounces-17926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFk0NEoOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A3F23E6FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tV4dwpz3cLG;
	Tue, 10 Mar 2026 05:15:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080114;
	cv=none; b=LJpOvTM8FuPfTDLsPggL/LR98P+HD14WSSMbJY9oiVACVhqnsrkHoldXnmZNQrwKOCRAiQBBHvi2r/imdLg6Lr3BretnbuB3KQGDjT5w2kctc3+e+YIzrilGmVTV6fJb24KydqHAZ6eUjdeZdkSeaL6psL07vZd7DFdLXuU8/3Qvrwpc+Fd3PbWGRwOQEc4UdVkHo4SbwlEZEK2XEYHKTOeV/JwTSMyGIs9lKZeSXYbXLPepkrT/o31BJBG5SJO1dN+dM1KT37QV7pqDCkPcIK66JCOVFdskGQxA7DE3rR6bb830MvqszFgl5PqBhTDmIcZDFJJ4hwb1qLOqqnvx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080114; c=relaxed/relaxed;
	bh=cI/MwWg0GpZ9Co1J48k/vUFv9ki5W8pHFf5PdMQCn+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt4L9QMJCKHLi+L0lnN1KS+g7bhLZ5wpiUnDfJjNLhsSsPfi2jgmiS0KlFwOcBvBi4/yuGE5VTsMBHYF4V61HKYWoWd2Zhj/z8i/ZA76RVVuPMXpQsBlekczNe8XaXuqEo1i3088zFYbmM2+qTAKcC31qd7lt0arE5DSOaPGcQ7JZTgWpC32GQ5lTnis9iiutHsMn7ZY1N7vHItdmIjt8vDZmLpLZCBi4g2ALWbMlMClXjnBAzG1sf9ef0OoeRi/T0TnpLseM6j/3+yV1gVsu87sN6HowckJzff9wiX2KpDNkHLJV29x237NNUy8X/xKvWWwkc6M2CyKZr7FYhb4Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EbN4PcDu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EbN4PcDu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tT5YSJz3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:13 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-829a9d08644so1827036b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080112; x=1773684912; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cI/MwWg0GpZ9Co1J48k/vUFv9ki5W8pHFf5PdMQCn+g=;
        b=EbN4PcDuzUyLrRa2iCmm0CLowG/DimWtKyw48Cq+uTpLR6q3vtztEP3QAkuiD3defd
         5pkG7Bs8o7oHx0v0cOLPwYPlxMwNeMJwqZqdMQqGu/0jpsBzPctSioU/3uroI9oxgMC6
         4RbqfBrzJq8k+e16Nx4fdLE2qCZIfNjwu0pubVirXBOgL0ufMKMOqs7GOPIk9zeGkEFH
         pQD26hAOkiAjf9IoaGYFl7Ny5HJt+p6TePxGVBOfyABlNNxiSHWPvY0cvDs4iZoZZhG9
         c/K5c5I4lEqP3O8jlwbrnB0z+p2I4Ghutj2Odv6kUbwrSg3uglMQr7u5Vk9H2gD4B/bA
         sAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080112; x=1773684912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cI/MwWg0GpZ9Co1J48k/vUFv9ki5W8pHFf5PdMQCn+g=;
        b=TdWt9++aMXTM0zFqDNSmJSKbHmN+ayxlun2lNB2k3hdj1KDY5AdPAwLePZA9cv4w4M
         2bMGuUi4mJG6nukLXQHQztaP3iWc0fDKY/jv4ToAghoXQhsxxQKeTCxzctCchJqEqXqf
         3HS1LZimVLBDvOAnREvZjIdf3gcUIKuDliQ0o1S2FAOXaE6UygRrMEWpKP2wLGGzjEu2
         JmfIyMT7JmVSKjBLFQ4TA1LKdm/x0ZHS6SvGSIaUUnMTsj56109hf+Lh8AL1r6PM4Iar
         JUAvS1mVj0+ME0PDhTmVmAAdGSMVCdg82AE21wZrCeLqGIWW7PjLJrdPrOZNktkBCHQ5
         bltw==
X-Gm-Message-State: AOJu0Yx7PAxMUzz6/fMU8NtIajhqwfqfw/9pqcrdO9qX4aZgYqnC8oGt
	np/XRVIj8uG66lLj+zEjySnK2mhh8BcZwpWM7FgMidsFiXjY3BbSHratwYPlm9BB
X-Gm-Gg: ATEYQzx+vKHfjO08+9HY4YJFbOKpH5RZXclLZs+sROinmQJ4HJLcQknkiexhy5aVszI
	kL7XmVm0sd5P0mETrfApcjM2kyKz6uR/Q8pr2xk5TOkGolOHIBsxfY/vOQBh3n/4Wq7B8gjynWC
	KOdUkYyGL3cLGYu2+CqY7t3zbu9z8sqYRmSh5mnFRSbs7tv7tBrrtEHN95Ol1U40u4eUDndiakH
	53be6b+5iWZXRFMQIri7LqrhtCSg4+aWDJASI3dKFgMFBCJ+8OcGoGy2ktjLs9NSfVMB0u8FTzd
	09g9kSBgLBg8TIoVmE3hwymyn6b9AZx8rg6Wy6xkVz1ZZRqj0HlNCfqxw7IorELpDCcRmiUf51z
	eAGwYqvFXoh8YtyDAw1JRQjM3dXx8/x7ux1Q9V7o8sclWGOLjpHqLKGMC9LrmvPqnczngGvYyR+
	Y8o8KSsOQ2IDQyPmGsehcABB+8SEJvWpCiQmowJmLmXKkoYN7CD3P1172YiLbQ4kpO
X-Received: by 2002:a05:6a00:2789:b0:824:374a:1404 with SMTP id d2e1a72fcca58-829a2f90a94mr10366200b3a.46.1773080111430;
        Mon, 09 Mar 2026 11:15:11 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.15.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:10 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 06/10] powerpc/64s: Kill the unused argument of exit_lazy_flush_tlb
Date: Mon,  9 Mar 2026 23:44:29 +0530
Message-ID: <6f96ea53588034312ae84f74b1e2fa9c4ce7cfd5.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 00A3F23E6FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17926-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

In previous patch we removed the only caller of exit_lazy_flush_tlb()
which was passing always_flush = false in it's second argument.

With that gone, all the callers of exit_lazy_flush_tlb() are local to
radix_pgtable.c and there is no need of an additional argument.

This patch does the required cleanup. There should not be any
functionality change in this patch.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/internal.h  |  2 --
 arch/powerpc/mm/book3s64/pgtable.c   |  2 --
 arch/powerpc/mm/book3s64/radix_tlb.c | 14 +++++---------
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index cad08d83369c..f7055251c8b7 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -31,6 +31,4 @@ static inline bool slb_preload_disabled(void)
 
 void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
 
-void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
-
 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index faec2dc71a5c..d32197d3298a 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -23,8 +23,6 @@
 #include <mm/mmu_decl.h>
 #include <trace/events/thp.h>
 
-#include "internal.h"
-
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
 EXPORT_SYMBOL_GPL(mmu_psize_defs);
 
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 9e1f6558d026..339bd276840b 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -19,8 +19,6 @@
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
 
-#include "internal.h"
-
 /*
  * tlbiel instruction for radix, set invalidation
  * i.e., r=1 and is=01 or is=10 or is=11
@@ -660,7 +658,7 @@ static bool mm_needs_flush_escalation(struct mm_struct *mm)
  * If always_flush is true, then flush even if this CPU can't be removed
  * from mm_cpumask.
  */
-void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
+static void exit_lazy_flush_tlb(struct mm_struct *mm)
 {
 	unsigned long pid = mm->context.id;
 	int cpu = smp_processor_id();
@@ -703,19 +701,17 @@ void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush)
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
 		dec_mm_active_cpus(mm);
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
-		always_flush = true;
 	}
 
 out:
-	if (always_flush)
-		_tlbiel_pid(pid, RIC_FLUSH_ALL);
+	_tlbiel_pid(pid, RIC_FLUSH_ALL);
 }
 
 #ifdef CONFIG_SMP
 static void do_exit_flush_lazy_tlb(void *arg)
 {
 	struct mm_struct *mm = arg;
-	exit_lazy_flush_tlb(mm, true);
+	exit_lazy_flush_tlb(mm);
 }
 
 static void exit_flush_lazy_tlbs(struct mm_struct *mm)
@@ -777,7 +773,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 			 * to trim.
 			 */
 			if (tick_and_test_trim_clock()) {
-				exit_lazy_flush_tlb(mm, true);
+				exit_lazy_flush_tlb(mm);
 				return FLUSH_TYPE_NONE;
 			}
 		}
@@ -823,7 +819,7 @@ static enum tlb_flush_type flush_type_needed(struct mm_struct *mm, bool fullmm)
 		if (current->mm == mm)
 			return FLUSH_TYPE_LOCAL;
 		if (cpumask_test_cpu(cpu, mm_cpumask(mm)))
-			exit_lazy_flush_tlb(mm, true);
+			exit_lazy_flush_tlb(mm);
 		return FLUSH_TYPE_NONE;
 	}
 
-- 
2.50.1 (Apple Git-155)


