Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561109127B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 16:28:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OBFvTQTp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fg8U6hUe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5KTt6tlFz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OBFvTQTp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fg8U6hUe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5KQ76WBLz3cbF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 00:25:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMhnR88Gj51dgjDcNyzJVzhu8osLx9zEmj3hidZ3w4E=;
	b=OBFvTQTp8UEOINw9sBFyJdIdvS7mNXFR8yPBYqkPn4GR8qYbtUgKMYXVd5k5BZo2qtWXbh
	XdSsjI/b5v9glHJGYIJIEPLfchBzP4HglAGfcLtk3RFKnhpENWxhirtDR6A0lFxKsKbgrm
	1I5Yqb8cM8dfoI5X/ch7O9Y/qjcwczw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718979918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMhnR88Gj51dgjDcNyzJVzhu8osLx9zEmj3hidZ3w4E=;
	b=fg8U6hUe/gjFQfncBwVp2fhT9BZhQpJZNaAkBVjj+I3vpwb4Sn37S359Np8ruMgyijg7gY
	TiFgxi/s3UqOlhObkr5TS0nD9u+gaBRDWNjNswNJAb8jUWZwGsthTOWoP87nkY+r2g6tV7
	mJfjw1rqOymdi90jG0WQaGDJVLECDJQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-HaToWkVmN96f1TahEqGemw-1; Fri, 21 Jun 2024 10:25:16 -0400
X-MC-Unique: HaToWkVmN96f1TahEqGemw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-797cde3c2f8so18604385a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 07:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718979916; x=1719584716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMhnR88Gj51dgjDcNyzJVzhu8osLx9zEmj3hidZ3w4E=;
        b=djgN6zhEpGeuItciTVdlLmnQeiFaDd3L9Uk3TxOP5W5l+Ni7J/2KvMIwTLbewGu9DK
         gDOtov47PH7RWvjyzLrGCdlrxQjoXcY7m1zpmaAS45ADALd15aAvnGgGfdk8111Mufov
         aGm3giPu39qYbubDdrxuwdYLSEwOrjERrC4r6PU4LHJAlFR4udrZBIRn9xE917XREEzB
         e8AA2cHS2dIY/cUsB4KonGkYvrDQakze1yQSEkodIGuaWqy6kAZI+0NUVSWHFnzmJtP3
         tDyK32h9iy8cGd/5T2lgqZqw+1P5vhCSggurcad07Gvbx8VgyvINbgHoMkk+PiMGMQnG
         g9xw==
X-Forwarded-Encrypted: i=1; AJvYcCVfCFF4dCwO+E1HezNUiuo2y2g2qYda4TdFVjhiIwi6TLEu943SL8xkzBn20OdFZ/PmT+Bzb3YY3ErYwh+zdQ1hToTj8/APfuWacpI5nw==
X-Gm-Message-State: AOJu0YxRtuCSy5XVkQfD3DUEIVy7E0AHwPsexKudwpnBa5ZTzy26muia
	pxl2LsiDMbzjcVoZXHExCC3QzS6OO8dGY29wcygsq9mMtacnXHaXamDL2oY9w3+GWmulHRztdmT
	O4R4RrKfmQBPHRREOX+xCeACXFBiXN2tevDoZ4UvYkshAUpZKHhCLDpCu4Hm2GOI=
X-Received: by 2002:a05:620a:3951:b0:79b:be0b:77e9 with SMTP id af79cd13be357-79bbe0b7cbemr703657885a.1.1718979915482;
        Fri, 21 Jun 2024 07:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKR5sMdbnn7x0tNnlB82FrZESiADWgCE3S9rPF+Z4OitOxuRlE3iKP8psvTE41pTKeNbOqHw==
X-Received: by 2002:a05:620a:3951:b0:79b:be0b:77e9 with SMTP id af79cd13be357-79bbe0b7cbemr703653085a.1.1718979914845;
        Fri, 21 Jun 2024 07:25:14 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bce944cb2sm90564785a.125.2024.06.21.07.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:25:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 4/7] mm/powerpc: Add missing pud helpers
Date: Fri, 21 Jun 2024 10:25:01 -0400
Message-ID: <20240621142504.1940209-5-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240621142504.1940209-1-peterx@redhat.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These new helpers will be needed for pud entry updates soon.  Namely:

- pudp_invalidate()
- pud_modify()

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8f9432e3855a..fc628a984669 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1108,6 +1108,7 @@ extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
 extern pud_t pfn_pud(unsigned long pfn, pgprot_t pgprot);
 extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
+extern pud_t pud_modify(pud_t pud, pgprot_t newprot);
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
 extern void set_pud_at(struct mm_struct *mm, unsigned long addr,
@@ -1368,6 +1369,8 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
 #define __HAVE_ARCH_PMDP_INVALIDATE
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pmd_t *pmdp);
+extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+			     pud_t *pudp);
 
 #define pmd_move_must_withdraw pmd_move_must_withdraw
 struct spinlock;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2975ea0841ba..c6ae969020e0 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -176,6 +176,17 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return __pmd(old_pmd);
 }
 
+pmd_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp)
+{
+	unsigned long old_pud;
+
+	VM_WARN_ON_ONCE(!pmd_present(*pmdp));
+	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
+	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
+	return __pmd(old_pmd);
+}
+
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmdp, int full)
 {
@@ -259,6 +270,15 @@ pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	pmdv &= _HPAGE_CHG_MASK;
 	return pmd_set_protbits(__pmd(pmdv), newprot);
 }
+
+pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	unsigned long pudv;
+
+	pudv = pud_val(pud);
+	pudv &= _HPAGE_CHG_MASK;
+	return pud_set_protbits(__pud(pudv), newprot);
+}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /* For use by kexec, called with MMU off */
-- 
2.45.0

