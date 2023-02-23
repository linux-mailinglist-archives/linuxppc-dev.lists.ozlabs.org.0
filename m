Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21336A031E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 08:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMkXM3kbwz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxY5zSb4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cxY5zSb4;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMkTP2wfjz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:01:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6eyKcKxeMsYYmm98/NS8k7jDKjha+yov5mDRD5bGFDU=; b=cxY5zSb4hUqUbspjYybU6JKQmb
	WTdtv8C1po4tIfjgCCs0LbsZDScsTx4CnpPlToHW3PPJmcje/wc47WZqD56/urWAJ43oAVZQEW4eE
	ZVafpPBbR44MKIfyTicylpB+Yu2Mn76CCkf7guxG7rQSX7plYsCGWrY4ans2nXoUG7obCFxnKRXVf
	grymJooQjDMyZr2FIZ8WXS3SPdZ74khjJJEhCy9E3sQES0ayZWmZKFs9ZZjhgCAaHYozVW0xAw/1M
	nqpPKpCY+nc1/spw/cDDBjn+00yspZkSMT6N9RCwCSx6X6kn0m/9Utraaa3WEqeeatzCv5QgEOFWy
	0Gnn31HQ==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV5bT-00FMG2-OI; Thu, 23 Feb 2023 07:01:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] powerpc/pseries: RTAS work area requires GENERIC_ALLOCATOR
Date: Wed, 22 Feb 2023 23:01:15 -0800
Message-Id: <20230223070116.660-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223070116.660-1-rdunlap@infradead.org>
References: <20230223070116.660-1-rdunlap@infradead.org>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The RTAS work area allocator uses code that is built by
GENERIC_ALLOCATOR, so the PSERIES Kconfig should select the
required Kconfig symbol to fix multiple build errors.

powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.rtas_work_area_allocator_init':
rtas-work-area.c:(.init.text+0x288): undefined reference to `.gen_pool_create'
powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x2dc): undefined reference to `.gen_pool_set_algo'
powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x310): undefined reference to `.gen_pool_add_owner'
powerpc64-linux-ld: rtas-work-area.c:(.init.text+0x43c): undefined reference to `.gen_pool_destroy'
powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o:(.toc+0x0): undefined reference to `gen_pool_first_fit_order_align'
powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.__rtas_work_area_alloc':
rtas-work-area.c:(.ref.text+0x14c): undefined reference to `.gen_pool_alloc_algo_owner'
powerpc64-linux-ld: rtas-work-area.c:(.ref.text+0x238): undefined reference to `.gen_pool_alloc_algo_owner'
powerpc64-linux-ld: arch/powerpc/platforms/pseries/rtas-work-area.o: in function `.rtas_work_area_free':
rtas-work-area.c:(.ref.text+0x44c): undefined reference to `.gen_pool_free_owner'

Fixes: 43033bc62d34 ("powerpc/pseries: add RTAS work area allocator")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/pseries/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -7,6 +7,7 @@ config PPC_PSERIES
 	select OF_DYNAMIC
 	select FORCE_PCI
 	select PCI_MSI
+	select GENERIC_ALLOCATOR
 	select PPC_XICS
 	select PPC_XIVE_SPAPR
 	select PPC_ICP_NATIVE
