Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F046FD5C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 07:03:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGNG43Cgdz3fNn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:03:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MZLldLeo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MZLldLeo;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGNFD4X3yz2ynB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 15:02:39 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-55a8019379fso62689947b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 22:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694956; x=1686286956;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuPIUnxI15Nal18dmzcm2R5Hbe23rg/L/N54Quf1VSM=;
        b=MZLldLeoTchJRg8ULRaH6L2y47XhBLxMJs1Go7faNFAGJ60D+vvC/iJb0Buc77Bpr6
         JAiUBm+hO4tciOyskyTHDu8zHoxcS+nRd9yRDDrgu8RadfICeTJTrI6xGxTJWG3gg8GE
         GihvOxn2/FrCq9mvWrB4PViVv+smaQj46irSMOCeG8hhbs3XZFgG9gfnNhAREX7BTIuo
         FwBNusKFw2CdGBlovtbF9aK1ipGeDHjgN+1rN8m5K9X1QHfWeGyfS7n8ZLK61yxirERs
         wzLOW0oOQaCrKrTFBkqyll9ZBkBC8WcWqedcyO11Xuqtw+I5+Pp9ph9gkiqNZDE1+7z0
         OmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694956; x=1686286956;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuPIUnxI15Nal18dmzcm2R5Hbe23rg/L/N54Quf1VSM=;
        b=P9AWQQJCclqBRlKwV0I/QTC5NUXsnhxbg3ioonXqYbwJ2ktuAXs6Fk9QJ/uNhXrsY0
         pefYDVrokaQ0REni+E/rP3jdWl3ma8FHWtdArkfD5xNIPmj0vifuVRfzBvTlJz+BuuqV
         wOG0t9aAQBrA7sefgEMDchbD9TgViMwHbXCP9pfkq9EC4tiun+LJYhYfb+fapu6rqETG
         lNRDatey8yYpJ+dFkStsFqVSxG3dWZbLOaFj6310RcuZRdTnHCt1SzDH3g3LUhFDDkvq
         jBhOOSWvLWB10OdGF6i1ttCtmgPc0/saGHIepwstA7S2ckfr54T71nkfiprB5+ej9f9R
         EyBg==
X-Gm-Message-State: AC+VfDwdJeNWx/u1c7CY9kcmZ39b1HclSg1Ez5xovZCxufZulRQka49M
	c0LxijpxjxO/sH/aKj7vEpxCew==
X-Google-Smtp-Source: ACHHUZ4mq7HDDHYHVt/QFmXvmAJMqlmdCFbymB1fCkEy74WyI9jP3Nyoly+MUZg8u6u5wehMYgk8Zg==
X-Received: by 2002:a0d:c4c2:0:b0:556:d398:870f with SMTP id g185-20020a0dc4c2000000b00556d398870fmr16786959ywd.47.1683694956234;
        Tue, 09 May 2023 22:02:36 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v133-20020a81618b000000b00545b02d4af5sm3822297ywb.48.2023.05.09.22.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:02:35 -0700 (PDT)
Date: Tue, 9 May 2023 22:02:32 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 16/23] s390: gmap use pte_unmap_unlock() not spin_unlock()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <5579873-d7b-65e-5de0-a2ba8a144e7@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <mons
 tr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pte_alloc_map_lock() expects to be followed by pte_unmap_unlock(): to
keep balance in future, pass ptep as well as ptl to gmap_pte_op_end(),
and use pte_unmap_unlock() instead of direct spin_unlock() (even though
ptep ends up unused inside the macro).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/s390/mm/gmap.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index d198fc9475a2..638dcd9bc820 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -895,12 +895,12 @@ static int gmap_pte_op_fixup(struct gmap *gmap, unsigned long gaddr,
 
 /**
  * gmap_pte_op_end - release the page table lock
- * @ptl: pointer to the spinlock pointer
+ * @ptep: pointer to the locked pte
+ * @ptl: pointer to the page table spinlock
  */
-static void gmap_pte_op_end(spinlock_t *ptl)
+static void gmap_pte_op_end(pte_t *ptep, spinlock_t *ptl)
 {
-	if (ptl)
-		spin_unlock(ptl);
+	pte_unmap_unlock(ptep, ptl);
 }
 
 /**
@@ -1011,7 +1011,7 @@ static int gmap_protect_pte(struct gmap *gmap, unsigned long gaddr,
 {
 	int rc;
 	pte_t *ptep;
-	spinlock_t *ptl = NULL;
+	spinlock_t *ptl;
 	unsigned long pbits = 0;
 
 	if (pmd_val(*pmdp) & _SEGMENT_ENTRY_INVALID)
@@ -1025,7 +1025,7 @@ static int gmap_protect_pte(struct gmap *gmap, unsigned long gaddr,
 	pbits |= (bits & GMAP_NOTIFY_SHADOW) ? PGSTE_VSIE_BIT : 0;
 	/* Protect and unlock. */
 	rc = ptep_force_prot(gmap->mm, gaddr, ptep, prot, pbits);
-	gmap_pte_op_end(ptl);
+	gmap_pte_op_end(ptep, ptl);
 	return rc;
 }
 
@@ -1154,7 +1154,7 @@ int gmap_read_table(struct gmap *gmap, unsigned long gaddr, unsigned long *val)
 				/* Do *NOT* clear the _PAGE_INVALID bit! */
 				rc = 0;
 			}
-			gmap_pte_op_end(ptl);
+			gmap_pte_op_end(ptep, ptl);
 		}
 		if (!rc)
 			break;
@@ -1248,7 +1248,7 @@ static int gmap_protect_rmap(struct gmap *sg, unsigned long raddr,
 			if (!rc)
 				gmap_insert_rmap(sg, vmaddr, rmap);
 			spin_unlock(&sg->guest_table_lock);
-			gmap_pte_op_end(ptl);
+			gmap_pte_op_end(ptep, ptl);
 		}
 		radix_tree_preload_end();
 		if (rc) {
@@ -2156,7 +2156,7 @@ int gmap_shadow_page(struct gmap *sg, unsigned long saddr, pte_t pte)
 			tptep = (pte_t *) gmap_table_walk(sg, saddr, 0);
 			if (!tptep) {
 				spin_unlock(&sg->guest_table_lock);
-				gmap_pte_op_end(ptl);
+				gmap_pte_op_end(sptep, ptl);
 				radix_tree_preload_end();
 				break;
 			}
@@ -2167,7 +2167,7 @@ int gmap_shadow_page(struct gmap *sg, unsigned long saddr, pte_t pte)
 				rmap = NULL;
 				rc = 0;
 			}
-			gmap_pte_op_end(ptl);
+			gmap_pte_op_end(sptep, ptl);
 			spin_unlock(&sg->guest_table_lock);
 		}
 		radix_tree_preload_end();
@@ -2495,7 +2495,7 @@ void gmap_sync_dirty_log_pmd(struct gmap *gmap, unsigned long bitmap[4],
 				continue;
 			if (ptep_test_and_clear_uc(gmap->mm, vmaddr, ptep))
 				set_bit(i, bitmap);
-			spin_unlock(ptl);
+			pte_unmap_unlock(ptep, ptl);
 		}
 	}
 	gmap_pmd_op_end(gmap, pmdp);
-- 
2.35.3

