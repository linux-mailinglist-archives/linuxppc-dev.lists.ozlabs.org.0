Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8036440665
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 02:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hh0VX4jnYz2ywV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 11:27:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tSJ1RART;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=tSJ1RART; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hh0Tq6hq8z2ynb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 11:26:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=8XMSRaP9jOyh28BjfISCp2rZsrePTe87w8vCwBzdO4s=; b=tSJ1RARTk8j73HTAXCe2zaguRi
 SaEeGTPmONsYvRJgY5OHlFkQMe4otH1GqFbJQppO1UZTOJ6wTqfSolQWj+KFaKNA9kaaAtdTmGGcO
 6AfmpMtItWGSFbbOW0Qcy0iP3Ebv/YtEAvJemwgGB/dJ6ZCHcOAzTbRN3scDyRGBxbfobScyxYDbb
 4nfZ2KYQfsD4xLhYVMnGC1z/7dHal+I4n/+h2HEFPlCsuQaU8VAecnF3HScSbXlc7n/yaYnOiuHNI
 CT8Bl/L767IpfhwsIT01JZsBjKWxhc0UxhMQlZy0NUa9TNCipt7UdpKkMp3PtSmGH8Wern9iSe/zH
 b8ZnWPFA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgcCR-00CZbW-O1; Sat, 30 Oct 2021 00:26:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: fadump: correct two typos in a comment
Date: Fri, 29 Oct 2021 17:26:19 -0700
Message-Id: <20211030002619.2063-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Matthew Wilcox <willy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix typos of 'remaining' and 'those'.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Matthew Wilcox <willy@infradead.org> # 'remaining'
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/fadump.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20211029.orig/arch/powerpc/kernel/fadump.c
+++ linux-next-20211029/arch/powerpc/kernel/fadump.c
@@ -73,8 +73,8 @@ static struct cma *fadump_cma;
  * The total size of fadump reserved memory covers for boot memory size
  * + cpu data size + hpte size and metadata.
  * Initialize only the area equivalent to boot memory size for CMA use.
- * The reamining portion of fadump reserved memory will be not given
- * to CMA and pages for thoes will stay reserved. boot memory size is
+ * The remaining portion of fadump reserved memory will be not given
+ * to CMA and pages for those will stay reserved. boot memory size is
  * aligned per CMA requirement to satisy cma_init_reserved_mem() call.
  * But for some reason even if it fails we still have the memory reservation
  * with us and we can still continue doing fadump.
