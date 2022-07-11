Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F956D38E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8ys4BB7z3f4y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:49:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nTf9L3OC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nTf9L3OC;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8vs02xWz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:47:04 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso3804561pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IhrKX64Q/Z6V/1v+K+JVKP0KaAJzbrmRGjpirKbhJY=;
        b=nTf9L3OC40YJpmHflFSmz6KTAFSTaaZQ/S1ioxVsgmxptGp0IiaRp8EmBLD2A/gyAa
         xCxhqU4FrY/lAvJTq2moA9lgpqjoUbWVxt9jLxPCj3p706ca9EfduK+9ZEqASUp+iSn4
         EAQGxSVUN0yLRZXgqjdbfj5Fmtrix3Zcu+LFvg4y16WF7hkCA9xAsOqzQxEjWd454u2h
         XE+9+f9Iud7s2Mj28twbgXcE2SL3KUqGtSOKhI9wUKt1VHNuIkvy6yU2jFaWI5VZAN/G
         f94VxtVlrnt015VrVBiB2PQUM0RSK74qAsmnUwlhXwOzhhh3WvHkY5vJB3bG/9C0lVRi
         fgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IhrKX64Q/Z6V/1v+K+JVKP0KaAJzbrmRGjpirKbhJY=;
        b=hnMXZL1qVuYKoa0p9l5GuwRFu4Hh38xqFoRtrQsBKYr8FbyxuAV+syLG+6Plr3UD2O
         XcTAYi2aHXtrCShgpcRc3wWTCcPflLfPvba/R73D9lBbHQykKV4QLfTZZ42q9Gf2kqZu
         qqoP8yt0HZ6f8jUDAJZa+Dapvjbt2dcXbcPXA6+w1oUncM0yNPPrIdT0GeCYu0aVlZUC
         RfLzM2QMCcfvRpCnmV8NdsXHPD8Fhq6YFm/0nLTJrKJ2v+R+tRniU4bHrGR3yTYoB9IA
         IySgABtXpm8QpMgdlXtwjKjPTubk8d6V9O5Kee9l56w7i9eJd/mdbu1uB2CvOwAEBTPS
         f0IA==
X-Gm-Message-State: AJIora8JYqUfV0CMpmjqi9+RE5W73jzHQ21Fa0BK4QQ4AJpstc0LRIEz
	GHvZ9HBlD/h6jltHhDQ2IuY=
X-Google-Smtp-Source: AGRyM1tGbLroqairLqOJOtLQAbkOgD2oJX4eg7rNXG45d2PB1rwtsYjv7Fwlc1lyPAUr+54PmfGNUg==
X-Received: by 2002:a17:902:8344:b0:16a:6e99:de2c with SMTP id z4-20020a170902834400b0016a6e99de2cmr16521282pln.130.1657511224541;
        Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:47:04 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/4] mm: rmap: Extend tlbbatch APIs to fit new platforms
Date: Mon, 11 Jul 2022 15:46:14 +1200
Message-Id: <20220711034615.482895-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, yangyicong@hisilicon.com, Nadav Amit <namit@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, darren@os.amperecomputing.com, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Barry Song <v-songbaohua@oppo.com>

Add uaddr to tlbbatch APIs so that platforms like ARM64 are
able to apply this on their specific hardware features. For
ARM64, this could be sending tlbi into hardware queues for
the page with this particular uaddr.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Mel Gorman <mgorman@suse.de>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/x86/include/asm/tlbflush.h |  3 ++-
 mm/rmap.c                       | 10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 4af5579c7ef7..1b32f4b999c7 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -251,7 +251,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 }
 
 static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
-					struct mm_struct *mm)
+					struct mm_struct *mm,
+					unsigned long uaddr)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index 13d4f9a1d4f1..a52381a680db 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -642,12 +642,13 @@ void try_to_unmap_flush_dirty(void)
 #define TLB_FLUSH_BATCH_PENDING_LARGE			\
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch, nbatch;
 
-	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm);
+	arch_tlbbatch_add_mm(&tlb_ubc->arch, mm, uaddr);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -736,7 +737,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 	}
 }
 #else
-static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
+static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable,
+				      unsigned long uaddr)
 {
 }
 
@@ -1599,7 +1601,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval));
+				set_tlb_ubc_flush_pending(mm, pte_dirty(pteval), address);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.25.1

