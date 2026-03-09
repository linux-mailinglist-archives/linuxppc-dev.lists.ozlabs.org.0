Return-Path: <linuxppc-dev+bounces-17895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CqdN2a/rmlEIgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:39:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E965238F89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTxQV1Cn2z3cBd;
	Mon, 09 Mar 2026 23:38:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773059938;
	cv=none; b=n/KwF60Xuptrg8xtZTNNT+kznfM7RHCyp8XtFJXLY3L1Dh5fvAAi3wFEOQAy7uVLa8PMA98NnCfV1cpK/XgoL3aHDxUR8C/FPKTiR/LvvO73VmT91GQP0sF1b/eUkJFl7ewY2Dt16rF8OjkbW7lXrAsXv8TzVNSn9Il6RifCft3bqSmuyOxNeAU9epiAU2f8JuLb/GAt//mFEvu7XYqF2yLdaugByJF3VZ4vX16cBhQF6x6fIij7PGd6ctfwE2gjJ8PLt7HBVZE/zlIqyOhfkVjGU4i5qYjzCPLbEstLmFmgKsiexPYhq+ADHMmgXeDxQbk2V7GqvPrP73RR7t5Eww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773059938; c=relaxed/relaxed;
	bh=nisfAIds2waJYT0R56BEFoM3l3b5O3t1RahsBzDsKqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DdUJB1FpD69hAYlJ/tJFWWpm/vrawQltmEC9Wu4uvIrdgVBb7FTJ+l3IsRabjPlMKZG3z2KkGBYMEDtdCnnQ2JZuYnTPh1PHWCB9jxbR98AzMclM3zsgpu0QFSgPhy26/b3AWjHvSY01f2D5Xj0XiOI9sW6J9jP+NIFDgifGLySQV46ynlW7sq668R3jGskALX3OZMKwqpdjNQfLjSJ8hvzGFosyF0wgqxeJlZERS8+OeqABJvOIJbQ5FCDpdGNbdbNlb/pGYbxBGvP1GKGplalETqgqRbK67RxIWW7lxLIzuzijQj4sSd2ZEuW3OQCLkru1FRiYJbGmA8z6xCkTHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cd8QWemR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cd8QWemR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTxQT3PVBz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 23:38:57 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so56305945ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773059935; x=1773664735; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nisfAIds2waJYT0R56BEFoM3l3b5O3t1RahsBzDsKqc=;
        b=Cd8QWemRqH/q4yVBK7gf9C3pjaDUMDjO6BsHqeT6lOCiHAhlwHpQN6pSO0XduJjq1n
         c9JIVegS3VXGfduH9eh194Z9upiD6xvNOkusEMBpa6FA8xeq7SP/0HRjHIERSVaBcM34
         iQr0eAQt3y0Lk5Mkuxb1gSLauNvsfZxZmXklOCGOL7lqmLDqjA/I6ARacHECe/cUjcfX
         CO5bhoVyVYo/ZQz3JiARfjFKGV7qC5VGDe17JAOheVU5JhjVB9REF2HvYi+yxu3OhP8T
         jd8rweSJSMLSQAjrG8yfUdc/XlgvPiDQo7nHl73IypOdDQwOSPqxn8eImKKMZzDoLdfi
         XEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059935; x=1773664735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nisfAIds2waJYT0R56BEFoM3l3b5O3t1RahsBzDsKqc=;
        b=ZHUGaJgwmk+G/gCEbY94dH+CUl3tyG6uhGZiWafBxxsBVUljKyA2QzB/h1m95NPALV
         d9I+7ykdFxMRzSA1uHZMTJwZ2j5qIXWaaLxgvCXQT+c+eBlc8LEL4l12snqCbUMCi5Uy
         ujUKFkt+dtNkV9Js9lRd76oJcbzjSpwjlSMcJKDgaysP7CGCsm316OhmnTWT61JGUhN3
         sAPStAqZTR/5/SQfTfau2aXhzMWqkALqdCsLzSjachjOFJfyntS+5dFRQtEwRAvztnXV
         cY7aTOtGW7zHGUqjpiSGWOJVXQNB6BIa9ySdxeNZIRPcXkDG74xF9qupp4Va51hxSu3h
         eGvg==
X-Gm-Message-State: AOJu0Yy/QvMfqoRCbyHLH2TPBzYJ5CXEdChLts42WbCA8+uvV42CJX+p
	QMHtcA1U58XtYl4vDv0GgIXvzKm1Otd9bYMk5kVUiDW5jOwLrf/eP/8js1w8nOgc
X-Gm-Gg: ATEYQzzYkAYrpcOBpcvh+c0mMEdq+CsCqqx+in5hnrVsozOQUIBg5m0PSF0k5NSuUIh
	xjJQdIHGfKTtIx2pk8S4+9mr+ZXpzy37+FxLLp7HgZ+tKeUHdrv9AVEJVrs27h4g08GPG3/H662
	5sB7fCJmyrVjXxMEw2EaePSF0dyQiYc7nWgU0LZ8OdecjThbYT7MigggjuZSZ/M+dyLNPHKHMD2
	RtUOxaLPm38ZLMZFfN2zzsp+Nscx9OmJXMmD7JjYGtZDKFmnwrKv194xA5Ntd8pSDGSB498amE0
	+XBwUIo/TVMOKobggfZJWsYiE0nt7jzMPtWpgT+vqqtcbBePgrTm3Xrlq4WI2WqmND65PkJc78a
	2kmyqpqvspJdfsAm72CfBDCI4k2MeV4tO8pVC4hpXVDFriymyPamZ6if6sQ+Hm+QlRKX463vIbq
	Wp4KfyYiZXMbso3XYsXKfDfUvvF8ky
X-Received: by 2002:a17:903:390f:b0:2ae:48a0:33e3 with SMTP id d9443c01a7336-2ae82480337mr132396235ad.45.1773059935096;
        Mon, 09 Mar 2026 05:38:55 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83eafc64sm154867375ad.40.2026.03.09.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:38:54 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	Alex Williamson <alex@shazbot.org>,
	Peter Xu <peterx@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 2/2] powerpc/64s: Add support for huge pfnmaps
Date: Mon,  9 Mar 2026 18:08:38 +0530
Message-Id: <6fca726574236f556dd4e1e259692e82a4c29e85.1773058761.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <b155e19993ee1f5584c72050192eb468b31c5029.1773058761.git.ritesh.list@gmail.com>
References: <b155e19993ee1f5584c72050192eb468b31c5029.1773058761.git.ritesh.list@gmail.com>
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
X-Rspamd-Queue-Id: 3E965238F89
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
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,kvack.org,vger.kernel.org,shazbot.org,redhat.com,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17895-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

This uses _RPAGE_SW2 bit for the PMD and PUDs similar to PTEs.
This also adds support for {pte,pmd,pud}_pgprot helpers needed for
follow_pfnmap APIs.

This allows us to extend the PFN mappings, e.g. PCI MMIO bars where
it can grow as large as 8GB or even bigger, to map at PMD / PUD level.
VFIO PCI core driver already supports fault handling at PMD / PUD level
for more efficient BAR mappings.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
v1 -> v2:
1. Added CONFIG_PPC64 #ifdef blocks around p{u|m}d_pgprot()
2. Retained the RB from Christophe.

 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h | 23 ++++++++++++++++++++
 arch/powerpc/include/asm/pgtable.h           | 14 ++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad7a2fe63a2a..cf9283757e5d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -172,6 +172,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_HUGE_PFNMAP	if PPC_BOOK3S_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK	if !HUGETLB_PAGE
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
 	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 1a91762b455d..639cbf34f752 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1289,6 +1289,29 @@ static inline pud_t pud_mkhuge(pud_t pud)
 	return pud;
 }

+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+static inline bool pmd_special(pmd_t pmd)
+{
+	return pte_special(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_mkspecial(pmd_t pmd)
+{
+	return pte_pmd(pte_mkspecial(pmd_pte(pmd)));
+}
+#endif
+
+#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
+static inline bool pud_special(pud_t pud)
+{
+	return pte_special(pud_pte(pud));
+}
+
+static inline pud_t pud_mkspecial(pud_t pud)
+{
+	return pte_pud(pte_mkspecial(pud_pte(pud)));
+}
+#endif

 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 extern int pmdp_set_access_flags(struct vm_area_struct *vma,
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index dcd3a88caaf6..97ccfa6e3dde 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -63,6 +63,20 @@ static inline pgprot_t pte_pgprot(pte_t pte)
 	return __pgprot(pte_flags);
 }

+#ifdef CONFIG_PPC64
+#define pmd_pgprot pmd_pgprot
+static inline pgprot_t pmd_pgprot(pmd_t pmd)
+{
+	return pte_pgprot(pmd_pte(pmd));
+}
+
+#define pud_pgprot pud_pgprot
+static inline pgprot_t pud_pgprot(pud_t pud)
+{
+	return pte_pgprot(pud_pte(pud));
+}
+#endif /* CONFIG_PPC64 */
+
 static inline pgprot_t pgprot_nx(pgprot_t prot)
 {
 	return pte_pgprot(pte_exprotect(__pte(pgprot_val(prot))));
--
2.39.5


