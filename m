Return-Path: <linuxppc-dev+bounces-14111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD3C4FE45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 22:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5g4X6Zqyz2xnh;
	Wed, 12 Nov 2025 08:42:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762897372;
	cv=none; b=VbMPSddGLqpf2RBoePoZxecAayPzoJennMQAj45EK2K7lfixKRzzv0KVF+E1gMfRwPtBYsc8zV7iIOrDY/+aKH264sG9suGXuVZ2iixFpmf6YXL++QwEs1WrABNvNBITystob7mdbuljL7FscXisfci+IRlyLaNkTUvqBlgkuLRL5vlxzHZHdQuhsYxjHSu8lzkaE88J2YTdDO5575yBJdXcdt6BaH9saXS4A/GwJt796Fmi6obS04VvUqLDoj5gfj+KywNKQ5s+e175fYukSq8FJh8BDRzeqlwwcRreFrS4693nIpaN5tWZ9NQX3jZt9gsazrMXwEezP+APHNdTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762897372; c=relaxed/relaxed;
	bh=37+7hBkhzuE7kcjBfybqxVC8HAYgIXzyLEuWgJ3dqEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gys9QQjlBnryRE9mIDOUh6psCKE5tU2EFfmxHf0D6/gGLchfdEc31GE05r9LHzNK0heCpOLdj/oJFBRc4vX3Iqy6O3kNbcdSes46a0D+2VnSuuH6moHhQRzpRLpciT3JBCsODoGrzm5lbGbTYjyTupKRLPLs0PUOHwp+QVm11pJ42/NtvQdbsHRb+PQtx+wgz8ow/6OdCd6gPIhwk35gtN/mFbcXjiR7g+fZ46LEpLu+MnPTqT7mRVqO/pQXp+IhwH1eOt8iCZPrT5tylwJq8SWUz7fSEzedUmdZ1TDgsAft+sdUz0Vh0va4TBtxVd4wVWjBkZO2YuMfSrk2BuuBmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.222.174; helo=mail-qk1-f174.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.174; helo=mail-qk1-f174.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5g4W1tl4z2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 08:42:50 +1100 (AEDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b25dd7ab33so14968085a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 13:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897366; x=1763502166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37+7hBkhzuE7kcjBfybqxVC8HAYgIXzyLEuWgJ3dqEM=;
        b=qWKnFi9kTcCfYPEUTTukk4Qz8SZ0pgwguSXZuMTJ4i8Ogln2ZiNMX4k3ZSo2KTSQWD
         w3dlzPDxdqhIb/E8Tv9C3wJNloVLpXNIJrI9sPgmc3PGxvVCXOy8dP6KgajNvVf2e6yC
         OVeR5r7OOONJCpB/hSoWY3ToviHKCN/Kqc+oEiQU7rPCTeClkPiRLokX4v+O3pvjTcUx
         ZcMlL7eWiVzBzcLIqpFk4Y1cqcgkmfgWfCfPXDij4sm/OWKBOEmU1i3NE083pRMDlUJ7
         1JGydwM6VSfKZYKrDDxQA6LTHk+Q4NSZ+iJLNB82q2B+PBuCs2jlz6MdMy04sjN9J0GT
         w/YA==
X-Gm-Message-State: AOJu0Yx5yW3IQC4iZfDSmQ6dPt13pxkxQJIyZq/eqHgDlXgBW5372ygu
	bSg8eprs4dgEDvqYhZ7fY1QgMFrApXBZm4ajvcmpxzuc7UayTSmhJgPN
X-Gm-Gg: ASbGnctJscGJV4eYbK2lj+mL8vVI3GXqZSVeJ4OFaQnYkWZzD8QoX9bXpMSy8xPFuWj
	AmEtupHRvuhSi9JvtiIsDP0GTEQTeE5igaVUS2r0Xx3DZN4KOVg4hysiA4EQfMXUU9cnYtTC6hU
	c1yLCNCMnTZbcxWlFZFEpt2omU+9QCC6lU6941Y2iCvPn+X7Gb1K3DwfuNtBpXp0DFLluY5EJZk
	JQT1STSJ8Y4OUz33BANWv0rnqNoL5Ib1xBmcJbMyphNCxsnavwVvQkx1Q/YkB9wNsNyN4WWuHG0
	74FRoTldpzg+nQ7VleUUw/I/lT/x8nevox4MxXtl8JTolwQcWndOBPPXQZJy3L03uAJSnhHaAe7
	fvsefW1HOxBl7M6hhnJ3gXyCwldZJL2J/9fc7V40ttJJ1QDmgr1RYOQ8udvG3mfG5LyboU89Qg7
	Ogi5/9JSdWLXnbKyxINdvozUa1uan/NdXMUJP0ZNiintSjZKHVlp3a0YhM3xAb9h8=
X-Google-Smtp-Source: AGHT+IG3pd8H8cinV9KY2sxGF9Lqdw5K5u9F1WzBYcrYijYiG5sk7Zas84UeYzEmg+TDrSyPXJndow==
X-Received: by 2002:a05:620a:40c1:b0:8b1:ac18:acc9 with SMTP id af79cd13be357-8b29b77ad4bmr110215985a.32.1762897366312;
        Tue, 11 Nov 2025 13:42:46 -0800 (PST)
Received: from [192.168.2.45] (bras-base-mtrlpq3141w-grc-10-65-95-13-196.dsl.bell.ca. [65.95.13.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29a9e6e6asm59918585a.35.2025.11.11.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:42:45 -0800 (PST)
From: Dave Vasilevsky <dave@vasilevsky.ca>
Date: Tue, 11 Nov 2025 16:42:41 -0500
Subject: [PATCH v2] powerpc, mm: Fix mprotect on book3s 32-bit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca>
X-B4-Tracking: v=1; b=H4sIANCtE2kC/32NQQ6DIBBFr2Jm3WkAJdKueo/GBcFBJ23VACE1x
 rsXPUCX7+f/9zeIFJgi3KsNAmWOPE8F1KUCN9ppIOS+MCihtBSqxWwj42cJcyKXcKjRG69Va/p
 GNgLKbAnk+Xsqn13hkWOaw3o+ZHmkf2RZosTaaWlaYbS/2cdReVOOr/XqLHT7vv8A7zcQxrQAA
 AA=
X-Change-ID: 20251027-vasi-mprotect-g3-f8f5278d4140
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Nadav Amit <nadav.amit@gmail.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-mm@kvack.org, 
 Dave Vasilevsky <dave@vasilevsky.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762897365; l=3254;
 i=dave@vasilevsky.ca; s=20251027; h=from:subject:message-id;
 bh=Zit10IcjEQgZrlYn+H0pI2muI6sNj2U/B2zs6yrH+H8=;
 b=dn4omO7A8DZD+V7wNR4W4X80lGIpHjLAHsjIoZ421FOXmVeJST9kiGMlzTgaFTHCkeKQGUtcc
 o99hIiot/c+D1dhxLbSDf+lTXlQ2Eq/JmuM7PJ3WbD/2uIodH6yvTEe
X-Developer-Key: i=dave@vasilevsky.ca; a=ed25519;
 pk=Jsd1btZeqqg6x6y73Dx0YrleQb3A3pCBnUeE0qmoKq4=
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
unnoticed because all uses until recently were for unmaps, and thus
handled by __tlb_remove_tlb_entry().

After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
tlb_gather_mmu() started being used for mprotect as well. This caused
mprotect to simply not work on these machines:

  int *ptr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
                  MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  *ptr = 1; // force HPTE to be created
  mprotect(ptr, 4096, PROT_READ);
  *ptr = 2; // should segfault, but succeeds

Fixed by making tlb_flush() actually flush TLB pages. This finally
agrees with the behaviour of boot3s64's tlb_flush().

Fixes: 4a18419f71cd ("mm/mprotect: use mmu_gather")
Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: stable@vger.kernel.org
---
Changes in v2:
- Flush entire TLB if full mm is requested.
- Link to v1: https://lore.kernel.org/r/20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 8 ++++++--
 arch/powerpc/mm/book3s32/tlb.c                | 9 +++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index e43534da5207aa3b0cb3c07b78e29b833c141f3f..b8c587ad2ea954f179246a57d6e86e45e91dcfdc 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -11,6 +11,7 @@
 void hash__flush_tlb_mm(struct mm_struct *mm);
 void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
+void hash__flush_gather(struct mmu_gather *tlb);
 
 #ifdef CONFIG_SMP
 void _tlbie(unsigned long address);
@@ -28,9 +29,12 @@ void _tlbia(void);
  */
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
-	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		hash__flush_gather(tlb);
+	} else {
+		/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
 		_tlbia();
+	}
 }
 
 static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 9ad6b56bfec96e989b96f027d075ad5812500854..e54a7b0112322e5818d80facd2e3c7722e6dd520 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -105,3 +105,12 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
 EXPORT_SYMBOL(hash__flush_tlb_page);
+
+void hash__flush_gather(struct mmu_gather *tlb)
+{
+	if (tlb->fullmm || tlb->need_flush_all)
+		hash__flush_tlb_mm(tlb->mm);
+	else
+		hash__flush_range(tlb->mm, tlb->start, tlb->end);
+}
+EXPORT_SYMBOL(hash__flush_gather);

---
base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
change-id: 20251027-vasi-mprotect-g3-f8f5278d4140

Best regards,
-- 
Dave Vasilevsky <dave@vasilevsky.ca>


