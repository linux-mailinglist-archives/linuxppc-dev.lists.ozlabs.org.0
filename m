Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48734A6A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 12:55:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6L571sQ0z3c2Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 22:55:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OE282vqP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.12; helo=m12-12.163.com;
 envelope-from=dingsenjie@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=OE282vqP; dkim-atps=neutral
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6L4g0m5Cz2yy5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 22:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qmOVU
 bBT6UUgOqC+nqtqAfxo5EXyRbjGxCrrXHUkSkY=; b=OE282vqPxehvpHcP6Jnt0
 vHSIkxXunmFunj6W+2fuUnDATpyvtlgT4Kr9GJ+XkLACOwJnJquDnIVmkpNT3wLJ
 0o1jZfOSeYG71T1uy8RMrnMM9gxR7MQ6lfsZkFKYOToCCV0pTcI17BaN372LlrUL
 m/mmoiVvuyeNFdKQLiPFxE=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp8 (Coremail) with SMTP id DMCowACXG5hNy11gTlIqWg--.38911S2;
 Fri, 26 Mar 2021 19:53:52 +0800 (CST)
From: dingsenjie@163.com
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: powernv: Remove unneeded variable: "rc"
Date: Fri, 26 Mar 2021 19:53:56 +0800
Message-Id: <20210326115356.12444-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowACXG5hNy11gTlIqWg--.38911S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1kJw4kAFykWr1UAw4UXFb_yoWkuFg_Jw
 48t3yYkrs7trWqy3s8Cw1fXryDA39agr1Utr1aga1akrnxKasxGrWDury3ZayxXr1jyFWD
 GFn8GrZ0kFyxAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8imRUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiThFhyFUDIa1M6gAAsK
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
Cc: dingsenjie <dingsenjie@yulong.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: dingsenjie <dingsenjie@yulong.com>

Remove unneeded variable: "rc".

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index deddaeb..a191f4c 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -105,7 +105,6 @@ static int opal_prd_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	size_t addr, size;
 	pgprot_t page_prot;
-	int rc;
 
 	pr_devel("opal_prd_mmap(0x%016lx, 0x%016lx, 0x%lx, 0x%lx)\n",
 			vma->vm_start, vma->vm_end, vma->vm_pgoff,
@@ -121,10 +120,8 @@ static int opal_prd_mmap(struct file *file, struct vm_area_struct *vma)
 	page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
 					 size, vma->vm_page_prot);
 
-	rc = remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, size,
+	return remap_pfn_range(vma, vma->vm_start, vma->vm_pgoff, size,
 				page_prot);
-
-	return rc;
 }
 
 static bool opal_msg_queue_empty(void)
-- 
1.9.1


