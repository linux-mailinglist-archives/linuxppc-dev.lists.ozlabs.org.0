Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B213D7288CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZJk3Ywgz3flT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:38:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IGMMSO5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IGMMSO5m;
	dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcZDj3WpRz3fmM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:35:17 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-392116b8f31so42197b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252914; x=1688844914;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0PEHV5OnE+EEUWt8DnaCebmsfgt0XKMU/SCuO3z3o=;
        b=IGMMSO5mseD7tMe+rRtOIzITR5LLF6gSj6DDkJB5GA4sfv+l0xQcNm+4SRn9cSTA+K
         bzPDoNl4QAtanNBNtw4EO4Jh9TOBqBvtAeMzqVR0kpqSUA/L/bvTchhidEBh3MP4oHsE
         7zzo3x/NewiOg3sZOatxsUi0TcVM8A38QB4oSQfrmI5m9Mp6eOh1v9F27aPIV0BM3Y9m
         jqm85o0LQ0rhNRucFZ0i7HQcaeWJpsz64iPtGPt0XsZOnDRNlY3xajIra5PnrJSK9OoE
         jKjJyQ6PxwcJN3nFoobZxXBieXcQTT3OQ2VZ4F5eEeV/iMRllpjt6DpnkAeaktGC324Y
         dn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252914; x=1688844914;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0PEHV5OnE+EEUWt8DnaCebmsfgt0XKMU/SCuO3z3o=;
        b=Vn0RnlNH/oPHjuUZomH8JWqN+9+Ado0RgxOWOyYuAVykGojTz/SeRFhSkJA3ukuE6e
         FcmQPkZQxyDKX/Bu+jzpLgP4Qb4oY/mId7Z7MI71/r3zOGvKTc+60X7ihIdefZXW+Jzv
         Rgsj55qMZA6br0lUjt0WWRH6wD0kMTuvTJIvWqaHgHRjPA2jNCWZuMmz/VoQw6qI5f9x
         WF67Gex7bzfo+j0Z6h089uQ40bQCYKq4C5xooPzQJ4uNva/l9aL5bIRJyVZezGUTsRzB
         E3QUF9Ifwodpabz1Ri9MlHQTO8T7dl9bqViM6mvJT1fAhfkAVcaUJGKzqaQwnD7dZjsF
         CeRg==
X-Gm-Message-State: AC+VfDwmEg2di4SJVXtN+adSasrA4dABIwC+TRWdm9OK9ecvOT/OsB7E
	QIRlFXR2b8gUzwgwnC9i8OVZqA==
X-Google-Smtp-Source: ACHHUZ7gdIjuH/6E76ySqRN8WufhpANLQ+j2jIa26lg+ERfDlrQvd+huECUh9/LluoEXiOqTeuRs9w==
X-Received: by 2002:a05:6808:cd:b0:39a:519c:2a6a with SMTP id t13-20020a05680800cd00b0039a519c2a6amr6836715oic.43.1686252914190;
        Thu, 08 Jun 2023 12:35:14 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g137-20020a0ddd8f000000b0055d8768408dsm108055ywe.105.2023.06.08.12.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:35:13 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:35:09 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 21/23] x86: Allow get_locked_pte() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <b7fa8547-4f28-ec82-9893-1b2eb58e40b4@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/x86/kernel/ldt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/ldt.c b/arch/x86/kernel/ldt.c
index 525876e7b9f4..adc67f98819a 100644
--- a/arch/x86/kernel/ldt.c
+++ b/arch/x86/kernel/ldt.c
@@ -367,8 +367,10 @@ static void unmap_ldt_struct(struct mm_struct *mm, struct ldt_struct *ldt)
 
 		va = (unsigned long)ldt_slot_va(ldt->slot) + offset;
 		ptep = get_locked_pte(mm, va, &ptl);
-		pte_clear(mm, va, ptep);
-		pte_unmap_unlock(ptep, ptl);
+		if (!WARN_ON_ONCE(!ptep)) {
+			pte_clear(mm, va, ptep);
+			pte_unmap_unlock(ptep, ptl);
+		}
 	}
 
 	va = (unsigned long)ldt_slot_va(ldt->slot);
-- 
2.35.3

