Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAF638DBAE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 17:54:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp4f06Zvyz3bty
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 01:54:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZKgCjfoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZKgCjfoR; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp4dX56qfz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 01:53:51 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id v14so15525539pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 May 2021 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CZYTGLN3cT3mGmoQRmYoshqpeqrdB0sYRrg/DzBKXs=;
 b=ZKgCjfoRescEm/+SvJOsEK3pJc4N8F44LeZmyfsLrX3js6puXoKU8UmpqoYJ9ZUGiX
 mCkWt4u6CikDoHafAIYXcaBKnfRKOpr75Omv3pkAkvyVxareWgumVNlMQPVMyU1zH96G
 ZuaXeDKgHDQE/zpqzkTRZecXTnt6g2ybbByveUuIaFe+y+OOsvtvuGB/PkU2AePkc59F
 AXwBLwQZgtBve3jzqttyeW4EVlJxvCf+ZsEhI/ZNhM08ElyG4H17HAdOi1ekJXuXkpnv
 WlpMF4aQInUZ1t7SJN/WuTYxLtRHzT3BWZbI3ZHacVPIA9Yx9aTsTAn2WDnXAWKir9eh
 7YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CZYTGLN3cT3mGmoQRmYoshqpeqrdB0sYRrg/DzBKXs=;
 b=QFc8fnoghY0sgJnd/iyIA2Z4Uup0DCv0D3W6gfGlF5SzRYaK138XD5hLq/qpQCmwSa
 1UQHJlXbRT4GKxkRLXoGndS8l2ewbiMi15PjNEorBUUGiiQNEuuLlzuJYuinKf0AxrfI
 SXY9QySl0H6ooNUAqKZgeDw6Xv+vkM2JIkD9Zsw+SDeCHmzt7p7AC0Uh7iyk7LYwvHsA
 L6c5reiJ2NyJLxTa10Q//5toNkjplJqxk7yKyY90ZUrAvjv6Vnp4NaUSneV1n+o/745Q
 ji/CR4a2kX/KWxOp8YTE1NqE/bWW67IXlJhahbuWrf35QOfisQqTWRNqEHVJDj8RhnQP
 xmPw==
X-Gm-Message-State: AOAM533arWNBDdLn7RugjAqBgQnuQClMl2605eIcccCStvZH1sRAupg3
 rqf5Fnwxwv7wvu/KpPQ/94k=
X-Google-Smtp-Source: ABdhPJzTjGYHjl/Wj/BzUjLWWJzQyeCwmbGkLyb1ThECh5XievJRz2FS/nnhe8WCIblzQVPBVQxs4Q==
X-Received: by 2002:a63:5052:: with SMTP id q18mr9094289pgl.349.1621785226440; 
 Sun, 23 May 2021 08:53:46 -0700 (PDT)
Received: from bobo.ibm.com ([210.185.78.224])
 by smtp.gmail.com with ESMTPSA id z19sm9720936pjq.11.2021.05.23.08.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 08:53:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix reverse map real-mode address lookup
 with huge vmalloc
Date: Mon, 24 May 2021 01:53:38 +1000
Message-Id: <20210523155338.3254465-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

real_vmalloc_addr() does not currently work for huge vmalloc, which is
what the reverse map can be allocated with for radix host, hash guest.

Add huge page awareness to the function.

Fixes: 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7af7c70f1468..5f68cb5cc009 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -26,16 +26,23 @@
 static void *real_vmalloc_addr(void *x)
 {
 	unsigned long addr = (unsigned long) x;
+	unsigned long mask;
+	int shift;
 	pte_t *p;
+
 	/*
-	 * assume we don't have huge pages in vmalloc space...
-	 * So don't worry about THP collapse/split. Called
-	 * Only in realmode with MSR_EE = 0, hence won't need irq_save/restore.
+	 * This is called only in realmode with MSR_EE = 0, hence won't need
+	 * irq_save/restore around find_init_mm_pte.
 	 */
-	p = find_init_mm_pte(addr, NULL);
+	p = find_init_mm_pte(addr, &shift);
 	if (!p || !pte_present(*p))
 		return NULL;
-	addr = (pte_pfn(*p) << PAGE_SHIFT) | (addr & ~PAGE_MASK);
+	if (!shift)
+		shift = PAGE_SHIFT;
+
+	mask = (1UL << shift) - 1;
+	addr = (pte_pfn(*p) << PAGE_SHIFT) | (addr & mask);
+
 	return __va(addr);
 }
 
-- 
2.23.0

