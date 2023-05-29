Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6C714423
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV51m19Hmz3fFf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:18:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PnX8u4a7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PnX8u4a7;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV50t1jGcz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:17:33 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bad05c6b389so4303553276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685341050; x=1687933050;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3N9RNUACQk0rp/xTQEOUK2bEy9LceuxJNDbuu7Hdo=;
        b=PnX8u4a7nFzrI9AMI1PfJ2JIEBsc/6HUoh5hn/jeCJld2cHVyPh5B3mpoBHYP4HlDt
         huCzuvd10XbNys3q964U8F3Pwm5I1086lfw4K2KXsSdCwoHho0iYP2E/vuoTg9TJPXAw
         9Ao+OBlyjIf+ii9nemOKDnm34wjGWTWJPqiOtaDLYpgSbKG3NeKVJfh7S3pXb1pULdQN
         cjURL7J2sqlVPM4/ao36PpQzMPvierIr1dk2aTiiL2s04dhzXCN3987Ah17CrCgicXI7
         uLzuDFZr6ZrjJPk0lh0dr69aYCwSbUbiqg2JiJfrZxUW7xsSohaWtB46bIclcU6whmCj
         +nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685341050; x=1687933050;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ3N9RNUACQk0rp/xTQEOUK2bEy9LceuxJNDbuu7Hdo=;
        b=gPwS48LppmWqh1E+m6O+pPKmAeYC+39RTdnE5iXsfQqxE0hRRMTbLl4m5fB/Vu88nL
         ypuuN0A2P5xZXz1rac4QmKMUUD2Y6LHrdI3750fVsBAKnxJRYHwaAs7PsaLyn3gp9IKp
         IFESM3f9sAsNJtqqPghlGhwVDPhaNA3InsI11JgjXcrOWY6Bve4lat31Uc6JUCPlVMll
         thgBg5fszIQLS/S3rSmQb+e1UsJjARIOAYody97gHXhe9vuAz856RZj5m0ePAxIsC7C1
         /TePKbCX1JqmanAPZpy3ynstZn4Vl5+osi29HWzRsvOQ+Lphijk52NZ3yHMbkv+VJzjE
         120Q==
X-Gm-Message-State: AC+VfDw9GOAYLmr0u+g1dxv5lnboOh2hQCFV8cKu1us4YfdTIfdSeu/I
	SLtoZV7+9u6UxTgKLnRHrNmjnw==
X-Google-Smtp-Source: ACHHUZ6g2ncsiViAbUymnL1kKwlhN1cywz3Q5/8UINRdk6/z7ELyukBfTa2iPWzHzMx63rqo3lZAZA==
X-Received: by 2002:a25:fc19:0:b0:ba1:e06b:bc57 with SMTP id v25-20020a25fc19000000b00ba1e06bbc57mr9201429ybd.64.1685341049679;
        Sun, 28 May 2023 23:17:29 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t62-20020a814641000000b0054f8b201c70sm3381110ywa.108.2023.05.28.23.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:17:29 -0700 (PDT)
Date: Sun, 28 May 2023 23:17:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/12] arm: adjust_pte() use pte_offset_map_nolock()
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <94c2ebe1-6b23-1cee-4aae-22cb835776ff@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
in adjust_pte(): because it gives the not-locked ptl for precisely that
pte, which the caller can then safely lock; whereas pte_lockptr() is not
so tightly coupled, because it dereferences the pmd pointer again.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/arm/mm/fault-armv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index ca5302b0b7ee..7cb125497976 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -117,11 +117,10 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map(pmd, address);
+	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
 	if (!pte)
 		return 0;
 
-	ptl = pte_lockptr(vma->vm_mm, pmd);
 	do_pte_lock(ptl);
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
-- 
2.35.3

