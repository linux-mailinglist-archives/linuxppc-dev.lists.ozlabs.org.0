Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C1FFBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 20:29:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tqnD6xtpzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 04:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+bf8c129080048abe2a13+5728+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="Kj+a9JEt"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tqll3MlMzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 04:28:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cyKJjVA2Cr8WCry47+rheDa1iIA4vvvEFATneZj3baQ=; b=Kj+a9JEtHb2JRJdjRCUovQa9x
 ifwHmX+AMEvLWdnYaa0wOP/BH/d4KbQPcso5WTGaMGOBS/O+CTUws+LaIMARhIDqHsgMbDMt1YOJY
 0AmDdNUUU4rpwk46OSJYWc3G24F1YjcYkUEiVfIBPLl4e3abxgj2BEQKkzdmblmEhQrGIkN3YNINC
 6IcwhFMKntDocHBbxFiHFFJFHLQctcU2164fIrYfzosiwhv8rZ06yqL3n/3FA4wNtKF97JhylKR5f
 6AGSsLzoZ5Aa6Vv7t7j3w3hDTo+h/OF0lm1MHrBrjOHWlWBpV6EoDrlEodpN7bLywvOgAivxymybd
 MMA6/VkbA==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLXUF-0004So-GU; Tue, 30 Apr 2019 18:28:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: mpe@ellerman.id.au,
	aneesh.kumar@linux.ibm.com
Subject: [PATCH v2] powerpc: remove the __kernel_io_end export
Date: Tue, 30 Apr 2019 14:27:39 -0400
Message-Id: <20190430182739.21961-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This export was added in this merge window, but without any actual
user, or justification for a modular user.

Fixes: a35a3c6f6065 ("powerpc/mm/hash64: Add a variable to track the end of IO mapping")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---

Chanes since v1:

 - actually compiles now..

 arch/powerpc/mm/pgtable_64.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 72f58c076e26..dd610dab98e0 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -97,7 +97,6 @@ EXPORT_SYMBOL(__vmalloc_end);
 unsigned long __kernel_io_start;
 EXPORT_SYMBOL(__kernel_io_start);
 unsigned long __kernel_io_end;
-EXPORT_SYMBOL(__kernel_io_end);
 struct page *vmemmap;
 EXPORT_SYMBOL(vmemmap);
 unsigned long __pte_frag_nr;
-- 
2.20.1

