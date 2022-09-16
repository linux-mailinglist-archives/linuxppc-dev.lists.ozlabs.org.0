Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0475BA59D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLDX54Vxz3cdL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:09:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=au6qXo8m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=au6qXo8m;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCH2XQTz2yYL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:10 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id q3so19794304pjg.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HQWmPgcG9K9dWkqcXsV/N4w2BTo24yF4jhvx5rNhVXk=;
        b=au6qXo8mYWMi0LjJjBefffiIIyyyrwnl42NP1QHvr2l+RYktDtPTlNkfCBirbSVDUd
         hoGhW4AgPb8zeLPDe+1XQhKIkP5m8DgwWRAinaFYbA3Ea+G3sPcxhDhmdStwgJsQTCjD
         1oj/cL7oeTAmYPpa60mGTsQWqHiZBRQaXP7bZpGc2IFMptQXwDVMCj5rhg9tjnnNLNWm
         BwYoxk8UA4cOpVgUz+TmQX2/nhvJz9BereM+zlz2KeWXu0PqvsU3XVHMV5WDLUllSmc3
         Q8ddi/dmywXbFhds+Gy1RqqdD3mfNYk4fkEjNdsxsERwJRGYXR7PFAJQICgveqJlhYUc
         qtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HQWmPgcG9K9dWkqcXsV/N4w2BTo24yF4jhvx5rNhVXk=;
        b=dOJMob6o7iOcwJ/ghUnDWI16cjOphI2+aDuP19gCPH8ZR8Pqymn5vPFfu4NM02qEV1
         fGcgYuz35KSXlaYDtXinghwpbAoh87UFgrsyNE/S56IfyzWqb5dXYHVWR6L5wzJxKM1U
         59nZj2+ocrh6jbZL2P95lenekL/sRvX8c7FLudd4zo8z5thV48Zyyy1UdmnJPpQB8/q1
         LLqBA2Ho+XDuNG9vieBfkmFO9IdvYIUWSfkuRWiHr1lPNABdJwhXP3SrJbnzmtaVrFVN
         L3XI0Vq5pGbDIomc1SX92vnCFnYPkL0Q12EyF1RCtvjlFkT4o7PQvq6nLd0ymv55tgwD
         6Kow==
X-Gm-Message-State: ACrzQf0mCMFeE4COZli6dWzQmrQyWpq/RoVYBiSsCTrC2mEATCPEToFh
	RVc2hr+wP+lwqw7lx+lMjxAy57dh15A=
X-Google-Smtp-Source: AMsMyM4g/0x2u7tDt6u1p+8dCvURuzu36t5NO/r96BJiIGGEbGTRL/Ok+SrFoHelsnGjwG76Qm38zg==
X-Received: by 2002:a17:902:d4c1:b0:176:b795:c639 with SMTP id o1-20020a170902d4c100b00176b795c639mr2832025plg.154.1663301288295;
        Thu, 15 Sep 2022 21:08:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/7] powerpc: move __end_rodata to cover arch read-only sections
Date: Fri, 16 Sep 2022 14:07:49 +1000
Message-Id: <20220916040755.2398112-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc has a number of read-only sections and tables that are put after
RO_DATA(). Move the __end_rodata symbol to cover these as well.

Setting memory to read-only at boot is done using __init_begin, change
that that to use __end_rodata. This removes the requirement for the init
section to follow read-only data.

This makes is_kernel_rodata() exactly cover the read-only region, as
well as other things using __end_rodata (e.g., kernel/dma/debug.c).
Boot dmesg also prints the rodata size more accurately.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S        | 3 +++
 arch/powerpc/mm/book3s32/mmu.c           | 2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 6 +++---
 arch/powerpc/mm/pgtable_32.c             | 7 ++++---
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index fe22d940412f..d81e4392da26 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -210,6 +210,9 @@ SECTIONS
 	}
 #endif
 
+	. = ALIGN(STRICT_ALIGN_SIZE);
+	__end_rodata = .;
+
 /*
  * Init sections discarded at runtime
  */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a96b73006dfb..e13b883e4e5b 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -240,7 +240,7 @@ void mmu_mark_rodata_ro(void)
 	for (i = 0; i < nb; i++) {
 		struct ppc_bat *bat = BATS[i];
 
-		if (bat_addrs[i].start < (unsigned long)__init_begin)
+		if (bat_addrs[i].start < (unsigned long)__end_rodata)
 			bat[1].batl = (bat[1].batl & ~BPP_RW) | BPP_RX;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ae008b9df0e6..28332001bd87 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -541,7 +541,7 @@ void hash__mark_rodata_ro(void)
 	unsigned long start, end, pp;
 
 	start = (unsigned long)_stext;
-	end = (unsigned long)__init_begin;
+	end = (unsigned long)__end_rodata;
 
 	pp = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL_ROX), HPTE_USE_KERNEL_KEY);
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 698274109c91..eb3c56975c37 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -228,7 +228,7 @@ void radix__mark_rodata_ro(void)
 	unsigned long start, end;
 
 	start = (unsigned long)_stext;
-	end = (unsigned long)__init_begin;
+	end = (unsigned long)__end_rodata;
 
 	radix__change_memory_range(start, end, _PAGE_WRITE);
 }
@@ -259,8 +259,8 @@ print_mapping(unsigned long start, unsigned long end, unsigned long size, bool e
 static unsigned long next_boundary(unsigned long addr, unsigned long end)
 {
 #ifdef CONFIG_STRICT_KERNEL_RWX
-	if (addr < __pa_symbol(__init_begin))
-		return __pa_symbol(__init_begin);
+	if (addr < __pa_symbol(__end_rodata))
+		return __pa_symbol(__end_rodata);
 #endif
 	return end;
 }
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 3ac73f9fb5d5..5c02fd08d61e 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -158,10 +158,11 @@ void mark_rodata_ro(void)
 	}
 
 	/*
-	 * mark .text and .rodata as read only. Use __init_begin rather than
-	 * __end_rodata to cover NOTES and EXCEPTION_TABLE.
+	 * mark text and rodata as read only. __end_rodata is set by
+	 * powerpc's linker script and includes tables and data
+	 * requiring relocation which are not put in RO_DATA.
 	 */
-	numpages = PFN_UP((unsigned long)__init_begin) -
+	numpages = PFN_UP((unsigned long)__end_rodata) -
 		   PFN_DOWN((unsigned long)_stext);
 
 	set_memory_ro((unsigned long)_stext, numpages);
-- 
2.37.2

