Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E609C6FD52B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGMqJ5cRKz3fM3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:43:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ATuPznBP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ATuPznBP;
	dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGMpT5PHsz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:42:57 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9d7659d89fso8780067276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683693775; x=1686285775;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YvWeTkG3kfP7WDkFLxY3Kk7w85fUEyISH4lFagFGGw=;
        b=ATuPznBP6lohY0dnWFYXaaNOQNunJEFtD7eF3OFa8KJJUXbFYwyofisXF7mtL2ymFH
         oTBz56agCcLhFx8YonoqBW6ZmAtrhlvPrmdJAcSpRqyP2mLR5Z/WoSQhVEg2s8MVqDuy
         Ip95cEIMx73t6Gdt8YSQEVRJTa89FntSD+Di4V6VUK9+4KRIMxTr8+RCmD6ANZu4Rjel
         BJF/aQ9/sAdSWOQreL897UcsYcMJJWTONr2aX5YmKG/bIAxUtAEn1GX4Jh5f4y/r990Z
         htjctO7o35ZbKLLksPTYN1h3aK5mSo9ZrVIIV1mS/G/Fv32O9W6ivMXImV5mGNDY0z+m
         21CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683693775; x=1686285775;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YvWeTkG3kfP7WDkFLxY3Kk7w85fUEyISH4lFagFGGw=;
        b=l8XkfsfGd63CqNeWw4NS86ZtyB2MvxQlEnFntxmSLrvwM26jKQZSeOgBtS9BkKJyha
         CPJcoWBF6l29mHT6G+rKspEyw10jU+rB98OrNglrO9qvON42OXQOKzti5wBntDmAoMQw
         +o1e0kVosm9fWsVLHVNWB17tf8tfcm+SV9jFajq+pP6LoNixQm/L2PvplCMcF/IrTvKp
         Rso/qdA4PkPw/xNm4raZWc+ECF0SYSLSdxHG2EIo8aktVenM2+VWz0j77d1v4JEZ84gT
         yaiKVIvMyD7R+bG8JQ4uBl5VBzol0//hCjNl2VwvSvU0+dVa3VxLymjWYwu7XrcaVoJs
         LclA==
X-Gm-Message-State: AC+VfDyakk+RxTUNLWR068oHNDL7hoP3u7pp6id29HnQFlSw1ZjJZyvQ
	foQ5IvbR52G9BmOigZ5Bg6TuTA==
X-Google-Smtp-Source: ACHHUZ7fYX2z0RAKmyNqdeM/8QuAhHW9rcUGOaUpv5crEQfaAc/gCUyRWpV2+01J2c8XG3m8+G8szg==
X-Received: by 2002:a25:ad98:0:b0:b9d:a8fa:fd6d with SMTP id z24-20020a25ad98000000b00b9da8fafd6dmr17660831ybi.12.1683693775053;
        Tue, 09 May 2023 21:42:55 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id x4-20020a056902102400b00b9def138173sm3425234ybt.1.2023.05.09.21.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:42:54 -0700 (PDT)
Date: Tue, 9 May 2023 21:42:44 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/23] arm: allow pte_offset_map[_lock]() to fail
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <5011977-d876-6a24-a3fc-c7e6a02877b8@google.com>
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm/lib/uaccess_with_memcpy.c | 3 +++
 arch/arm/mm/fault-armv.c           | 5 ++++-
 arch/arm/mm/fault.c                | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/lib/uaccess_with_memcpy.c b/arch/arm/lib/uaccess_with_memcpy.c
index e4c2677cc1e9..2f6163f05e93 100644
--- a/arch/arm/lib/uaccess_with_memcpy.c
+++ b/arch/arm/lib/uaccess_with_memcpy.c
@@ -74,6 +74,9 @@ pin_page_for_write(const void __user *_addr, pte_t **ptep, spinlock_t **ptlp)
 		return 0;
 
 	pte = pte_offset_map_lock(current->mm, pmd, addr, &ptl);
+	if (unlikely(!pte))
+		return 0;
+
 	if (unlikely(!pte_present(*pte) || !pte_young(*pte) ||
 	    !pte_write(*pte) || !pte_dirty(*pte))) {
 		pte_unmap_unlock(pte, ptl);
diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 0e49154454a6..ca5302b0b7ee 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -117,8 +117,11 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	ptl = pte_lockptr(vma->vm_mm, pmd);
 	pte = pte_offset_map(pmd, address);
+	if (!pte)
+		return 0;
+
+	ptl = pte_lockptr(vma->vm_mm, pmd);
 	do_pte_lock(ptl);
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2418f1efabd8..83598649a094 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -85,6 +85,9 @@ void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr)
 			break;
 
 		pte = pte_offset_map(pmd, addr);
+		if (!pte)
+			break;
+
 		pr_cont(", *pte=%08llx", (long long)pte_val(*pte));
 #ifndef CONFIG_ARM_LPAE
 		pr_cont(", *ppte=%08llx",
-- 
2.35.3

