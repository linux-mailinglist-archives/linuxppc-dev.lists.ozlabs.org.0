Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAB4D7329
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 08:00:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGVtj1v28z3bl8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 18:00:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h40sZ+Kj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=h40sZ+Kj; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGVsR5jd3z3bVq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 17:59:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TXfzceAStKfRWW5SY5h7OZXN9kLSLV3yQCvecqnCkVU=; b=h40sZ+KjtiZzznLAHbOtKlkAHk
 nwANXLoMXHLKo7CrAjQA+tW+7zZN1g/vk8w3nWRWdeUYYM+mzINUSuGfqmupwvv12QjoAYdtfw7P0
 Z537z04yLlppkailK+ydEjM/v5vFJ+y/Ml3j4GJVaoxtPPjp47n1SdzedUvB95ulu7B7I67BAzLcF
 kEOkQSAmFVVpdAd7s0RGEYPIdUSjHRSHK2FW0U6O+D6XTi7TNBzv82nqzYPS1oUO+3bTPBjIxcF6A
 WBzw/OREDWO+/yYXuc5j0yynI2uePRBNSnhlPqu7W9mDVvvDSrgI4zlMExfHGIo9wIaSHY13JhfvQ
 dZBTy49Q==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTICW-002Hbv-UH; Sun, 13 Mar 2022 06:59:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xive: fix return value of __setup handler
Date: Sat, 12 Mar 2022 22:59:36 -0800
Message-Id: <20220313065936.4363-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) argument or environment
strings. Also, error return codes don't mean anything to
obsolete_checksetup() -- only non-zero (usually 1) or zero.
So return 1 from xive_off() and xive_store_eoi_cmdline().

Fixes: 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE interrupt controller")
Fixes: c21ee04f11ae ("powerpc/xive: Add a kernel parameter for StoreEOI")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
From: Igor Zhbanov <i.zhbanov@omprussia.ru>
Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Paul Mackerras <paulus@samba.org>
---
 arch/powerpc/sysdev/xive/common.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20220310.orig/arch/powerpc/sysdev/xive/common.c
+++ linux-next-20220310/arch/powerpc/sysdev/xive/common.c
@@ -1708,20 +1708,20 @@ __be32 *xive_queue_page_alloc(unsigned i
 static int __init xive_off(char *arg)
 {
 	xive_cmdline_disabled = true;
-	return 0;
+	return 1;
 }
 __setup("xive=off", xive_off);
 
 static int __init xive_store_eoi_cmdline(char *arg)
 {
 	if (!arg)
-		return -EINVAL;
+		return 1;
 
 	if (strncmp(arg, "off", 3) == 0) {
 		pr_info("StoreEOI disabled on kernel command line\n");
 		xive_store_eoi = false;
 	}
-	return 0;
+	return 1;
 }
 __setup("xive.store-eoi=", xive_store_eoi_cmdline);
 
