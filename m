Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF72C6F44
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:22:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjjcp59L3zF13G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dxuJANHv; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjJ356N1zDscV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:08:03 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id w16so5996193pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qAGXGhZOkIdFFBO04RIdpG9EnNWWB0bGWD/He/uQeSM=;
 b=dxuJANHv9DbG/4V/byjc0cuJwNoQCGJeyHowxFT8FN67M0jXr/b6cJzxr9rEFPrmOz
 HxFEA55Cn8becjEnNzqMfu8Ven8hzKuxrPFe6pyTfIYkYMelduCrLgkywlTMO4if7sEw
 DlsvSf62i1IvDwUOovgUSVGcaec1Ig3ztuLiaeUq8uoRaRfvNyaUGDtr9wFShhgNfkn3
 vARwC4NVbA9CejtOhV36joH/1FGW0q/eKrgM7/5N1C5uMcPrAdaYpv+vt9aBzlJZYtDj
 IWGGX0PhrRXPMAVWpZd40+kS25aNo8pWpjlgUzwnQP4gCN4X4LzZxyoERvTWWofatn6r
 FGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qAGXGhZOkIdFFBO04RIdpG9EnNWWB0bGWD/He/uQeSM=;
 b=TGClTennP3jobVnQsrEDblynn67UvCPH6hpI5QjGKt0Wsy9+YGUahWxQBSvSOWUqc8
 Q+OvnZ2wh1c4I0Tglc0px7oSj4dCF3P6277JPa9Cbm2kBdrszt2HEf1oNPxjFQ2llBSH
 EzABewyOI4El7WQHXrYFLyCe9KJ2HLQ7ChuOnJUME31B9zTfMw4Tpg8PEYgxm5VJhMCg
 ezo7XfdAokdvBYTBvBKJYOp8Ml34imq+g6EIQzxXx6z+2J4wxIZVM2NOJUQDwgLs9K6t
 9sla+uVVGAv/L9rTu7W+/QNRzcbTwzaehU+Yst8xQA+4KIh4NicSauPvQtSl0Xoo1vz0
 yukA==
X-Gm-Message-State: AOAM530gDw5ropc2BBh3YkCSp87e+nPX2+9O7ziJukn802KrqWTCEB8k
 MDpr+XCBtZH6AXjPojjisvbouN1ufbM=
X-Google-Smtp-Source: ABdhPJyUPNrZD/lDiwp46hqVhHnI5BcdXLkMk+aAYn7uh4NFPxCof92TEaMkzHmMS0FJCo5QsBxdKA==
X-Received: by 2002:a17:90b:88b:: with SMTP id
 bj11mr14632617pjb.229.1606547281596; 
 Fri, 27 Nov 2020 23:08:01 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:08:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 8/8] powerpc/64s: tidy machine check SLB logging
Date: Sat, 28 Nov 2020 17:07:28 +1000
Message-Id: <20201128070728.825934-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since ISA v3.0, SLB no longer uses the slb_cache, and stab_rr is no
longer correlated with SLB allocation. Move those to pre-3.0.

While here, improve some alignments and reduce whitespace.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/slb.c | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c30fcbfa0e32..6d720c1c08a4 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -255,7 +255,6 @@ void slb_dump_contents(struct slb_entry *slb_ptr)
 		return;
 
 	pr_err("SLB contents of cpu 0x%x\n", smp_processor_id());
-	pr_err("Last SLB entry inserted at slot %d\n", get_paca()->stab_rr);
 
 	for (i = 0; i < mmu_slb_size; i++) {
 		e = slb_ptr->esid;
@@ -265,34 +264,38 @@ void slb_dump_contents(struct slb_entry *slb_ptr)
 		if (!e && !v)
 			continue;
 
-		pr_err("%02d %016lx %016lx\n", i, e, v);
+		pr_err("%02d %016lx %016lx %s\n", i, e, v,
+				(e & SLB_ESID_V) ? "VALID" : "NOT VALID");
 
-		if (!(e & SLB_ESID_V)) {
-			pr_err("\n");
+		if (!(e & SLB_ESID_V))
 			continue;
-		}
+
 		llp = v & SLB_VSID_LLP;
 		if (v & SLB_VSID_B_1T) {
-			pr_err("  1T  ESID=%9lx  VSID=%13lx LLP:%3lx\n",
+			pr_err("     1T ESID=%9lx VSID=%13lx LLP:%3lx\n",
 			       GET_ESID_1T(e),
 			       (v & ~SLB_VSID_B) >> SLB_VSID_SHIFT_1T, llp);
 		} else {
-			pr_err(" 256M ESID=%9lx  VSID=%13lx LLP:%3lx\n",
+			pr_err("   256M ESID=%9lx VSID=%13lx LLP:%3lx\n",
 			       GET_ESID(e),
 			       (v & ~SLB_VSID_B) >> SLB_VSID_SHIFT, llp);
 		}
 	}
-	pr_err("----------------------------------\n");
-
-	/* Dump slb cache entires as well. */
-	pr_err("SLB cache ptr value = %d\n", get_paca()->slb_save_cache_ptr);
-	pr_err("Valid SLB cache entries:\n");
-	n = min_t(int, get_paca()->slb_save_cache_ptr, SLB_CACHE_ENTRIES);
-	for (i = 0; i < n; i++)
-		pr_err("%02d EA[0-35]=%9x\n", i, get_paca()->slb_cache[i]);
-	pr_err("Rest of SLB cache entries:\n");
-	for (i = n; i < SLB_CACHE_ENTRIES; i++)
-		pr_err("%02d EA[0-35]=%9x\n", i, get_paca()->slb_cache[i]);
+
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_300)) {
+		/* RR is not so useful as it's often not used for allocation */
+		pr_err("SLB RR allocator index %d\n", get_paca()->stab_rr);
+
+		/* Dump slb cache entires as well. */
+		pr_err("SLB cache ptr value = %d\n", get_paca()->slb_save_cache_ptr);
+		pr_err("Valid SLB cache entries:\n");
+		n = min_t(int, get_paca()->slb_save_cache_ptr, SLB_CACHE_ENTRIES);
+		for (i = 0; i < n; i++)
+			pr_err("%02d EA[0-35]=%9x\n", i, get_paca()->slb_cache[i]);
+		pr_err("Rest of SLB cache entries:\n");
+		for (i = n; i < SLB_CACHE_ENTRIES; i++)
+			pr_err("%02d EA[0-35]=%9x\n", i, get_paca()->slb_cache[i]);
+	}
 }
 
 void slb_vmalloc_update(void)
-- 
2.23.0

