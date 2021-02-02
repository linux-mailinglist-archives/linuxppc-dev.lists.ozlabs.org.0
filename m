Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C415B30D0D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:34:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkkd6XF2zDwpk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:34:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+78410b086ab5a19d433c+6372+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=meSQP3l8; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNyf6NZCzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:14:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Dfm4t6IzWCBDJPMpGdSuNSi4QcgFqA2qDwRcbyxPWlk=; b=meSQP3l8vTyTYW+K+VqSw+ahTJ
 IgWgZijK/yzJk+GJkTA1nnmzS+VgIxBWgpGF1YpmRy5ZRkFJTCVVlrje4myb0Nd7UgF2mEAPeycFc
 1XhdAx9rNr0wuo6uzBO9Ydlw1fy0QDTIqDGFe1iXqFlsuKzM/8REf5puUEA7+M3qT5hz+mlgJAmtV
 4uNpmSWQiYBLp0coCUlLgVMQ+4jC9LZ073kECuGnQugmsbcU+zlqqtxjmb00xjUUbO7RDKROjnk7c
 uQieKR5ydi9tOJkVQvC50ixgGsYJQ8WupFRldzFldko0RcYXevgpYHcqiHIZ6dNhiHAocZgN37tTq
 ZNx/iELw==;
Received: from [2001:4bb8:198:6bf4:7f38:755e:a6e0:73e9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l6uYs-00FAKd-RF; Tue, 02 Feb 2021 12:13:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH 01/13] powerpc/powernv: remove get_cxl_module
Date: Tue,  2 Feb 2021 13:13:22 +0100
Message-Id: <20210202121334.1361503-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202121334.1361503-1-hch@lst.de>
References: <20210202121334.1361503-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The static inline get_cxl_module function is entirely unused since commit
8bf6b91a5125a ("Revert "powerpc/powernv: Add support for the cxl kernel
api on the real phb"), so remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-cxl.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-cxl.c b/arch/powerpc/platforms/powernv/pci-cxl.c
index 8c739c94ed28d6..53172862d23bd3 100644
--- a/arch/powerpc/platforms/powernv/pci-cxl.c
+++ b/arch/powerpc/platforms/powernv/pci-cxl.c
@@ -150,25 +150,3 @@ int pnv_cxl_ioda_msi_setup(struct pci_dev *dev, unsigned int hwirq,
 	return 0;
 }
 EXPORT_SYMBOL(pnv_cxl_ioda_msi_setup);
-
-#if IS_MODULE(CONFIG_CXL)
-static inline int get_cxl_module(void)
-{
-	struct module *cxl_module;
-
-	mutex_lock(&module_mutex);
-
-	cxl_module = find_module("cxl");
-	if (cxl_module)
-		__module_get(cxl_module);
-
-	mutex_unlock(&module_mutex);
-
-	if (!cxl_module)
-		return -ENODEV;
-
-	return 0;
-}
-#else
-static inline int get_cxl_module(void) { return 0; }
-#endif
-- 
2.29.2

