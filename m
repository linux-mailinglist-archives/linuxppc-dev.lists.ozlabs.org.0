Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC33833A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 05:59:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kph26BTtzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 13:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AhmsPY6n"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KpfB6xnBzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 13:58:09 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c5so275900pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 20:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YC0pFYA+cb67+XEqZ1TqteuvJbww8i3LiUiYW17QScI=;
 b=AhmsPY6np1q+EG3W1DqnOuM68jaX8C/EPjdzaU2TBPLeg+Qs9x6ANedrFTK53ktASy
 lX2OFt9rFE8HsDgsI0wrRPkaodovXX86oIUkHuOUAShN1txvhA7Fq+iYZU4jT6wtp3w1
 MQgdSaTdnGDV3vE/9LkBCNJMWK+olvQUPhBtA4FdjI+sFMo+JylD7iNJkEux/TMMI2tZ
 7CMJGRpX6X/FLDMPASXbxn2FF0iHALaJhjoxzpbbP748GjXaj78NXuZFzTJS1w5q4WR0
 Of6oiCv9+cQyjcSBPNI+Qujf5EvtjFebAqvmTbqKVrxwMf+Bx1DWhCmjYtFr+coP2z5/
 +tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YC0pFYA+cb67+XEqZ1TqteuvJbww8i3LiUiYW17QScI=;
 b=P9GzP5xFz2ax1oqIrdmI2Rh1mtWFo5zGR2QIrDVh//z59CnKmBFgXe5q7Sqrurrz4Q
 pqkslCYbwno/DKAstAmis/W7k9DN8Rpbb5NQtVsfO3y3oN2ThmYOW1te1Wh2LgHbsk3r
 q9LJA+QOSUQUAMuidVUIAOllAcuWnT2EQurz0YVNJO+9SvrQGX/YKo0d6+GrQ73YPA/E
 PXragntxWQmBnO7QLIYpb3/IUln3YxHaK9TZM0REEw4CD6wgsmylGJPNFkdmmngh7+oH
 efH3gM5tiBIXxezgJYJceD/bOW99AimH8TCfk4EzLWqCKC9Pmps6oeqeym7OcTgkjHAt
 bbLA==
X-Gm-Message-State: APjAAAVtgR7ws5q2nxK3w2HYArh0O/UTd2HAdznsofiBiWWNCIuBOfOB
 pqB0oE1o+CXVdoZHCF7oeEO2f7c4
X-Google-Smtp-Source: APXvYqzB1cBHv4dAQKFkAn8V261tZVCTzOrR4OoaDoy/U/rvfS3RialLAYZNDY8IQB7/li7jeXiz0g==
X-Received: by 2002:a17:902:a708:: with SMTP id
 w8mr50968255plq.162.1559879886416; 
 Thu, 06 Jun 2019 20:58:06 -0700 (PDT)
Received: from bobo.local0.net (193-116-93-94.tpgi.com.au. [193.116.93.94])
 by smtp.gmail.com with ESMTPSA id p63sm611660pfb.70.2019.06.06.20.58.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 20:58:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: Fix THP PMD collapse serialisation
Date: Fri,  7 Jun 2019 13:56:35 +1000
Message-Id: <20190607035636.5446-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
in pte helpers") changed the actual bitwise tests in pte_access_permitted
by using pte_write() and pte_present() helpers rather than raw bitwise
testing _PAGE_WRITE and _PAGE_PRESENT bits.

The pte_present change now returns true for ptes which are !_PAGE_PRESENT
and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
synchronize access from lock-free lookups. pte_access_permitted is used by
pmd_access_permitted, so allowing GUP lock free access to proceed with
such PTEs breaks this synchronisation.

This bug has been observed on HPT host, with random crashes and corruption
in guests, usually together with bad PMD messages in the host.

Fix this by adding an explicit check in pmd_access_permitted, and
documenting the condition explicitly.

The pte_write() change should be okay, and would prevent GUP from falling
back to the slow path when encountering savedwrite ptes, which matches
what x86 (that does not implement savedwrite) does.

Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

I accounted for Aneesh's and Christophe's feedback, except I couldn't
find a good way to replace the ifdef with IS_ENABLED because of
_PAGE_INVALID etc., but at least cleaned that up a bit nicer.

Patch 1 solves a problem I can hit quite reliably running HPT/HPT KVM.
Patch 2 was noticed by Aneesh when inspecting code for similar bugs.
They should probably both be merged in stable kernels after upstream.

 arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c           |  3 ++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 7dede2e34b70..ccf00a8b98c6 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -876,6 +876,23 @@ static inline int pmd_present(pmd_t pmd)
 	return false;
 }
 
+static inline int pmd_is_serializing(pmd_t pmd)
+{
+	/*
+	 * If the pmd is undergoing a split, the _PAGE_PRESENT bit is clear
+	 * and _PAGE_INVALID is set (see pmd_present, pmdp_invalidate).
+	 *
+	 * This condition may also occur when flushing a pmd while flushing
+	 * it (see ptep_modify_prot_start), so callers must ensure this
+	 * case is fine as well.
+	 */
+	if ((pmd_raw(pmd) & cpu_to_be64(_PAGE_PRESENT | _PAGE_INVALID)) ==
+						cpu_to_be64(_PAGE_INVALID))
+		return true;
+
+	return false;
+}
+
 static inline int pmd_bad(pmd_t pmd)
 {
 	if (radix_enabled())
@@ -1092,6 +1109,19 @@ static inline int pmd_protnone(pmd_t pmd)
 #define pmd_access_permitted pmd_access_permitted
 static inline bool pmd_access_permitted(pmd_t pmd, bool write)
 {
+	/*
+	 * pmdp_invalidate sets this combination (which is not caught by
+	 * !pte_present() check in pte_access_permitted), to prevent
+	 * lock-free lookups, as part of the serialize_against_pte_lookup()
+	 * synchronisation.
+	 *
+	 * This also catches the case where the PTE's hardware PRESENT bit is
+	 * cleared while TLB is flushed, which is suboptimal but should not
+	 * be frequent.
+	 */
+	if (pmd_is_serializing(pmd))
+		return false;
+
 	return pte_access_permitted(pmd_pte(pmd), write);
 }
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 16bda049187a..ff98b663c83e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -116,6 +116,9 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	/*
 	 * This ensures that generic code that rely on IRQ disabling
 	 * to prevent a parallel THP split work as expected.
+	 *
+	 * Marking the entry with _PAGE_INVALID && ~_PAGE_PRESENT requires
+	 * a special case check in pmd_access_permitted.
 	 */
 	serialize_against_pte_lookup(vma->vm_mm);
 	return __pmd(old_pmd);
-- 
2.20.1

