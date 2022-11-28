Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CD63AEFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 18:36:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLXhT0JQwz3f32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 04:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q8jadwcy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Q8jadwcy;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLXgW3qnqz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 04:35:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7E18B80E81;
	Mon, 28 Nov 2022 17:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E604C433D6;
	Mon, 28 Nov 2022 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669656943;
	bh=gCQQIVDuLlgnkd/wMx8t1XoFRlWkAu6H8eCpOzaxNTY=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8jadwcyItgqNSVdGgWn4dD6mnSLk0RjTC3JneC33GrMjo7Ld4ScWAuOffBZCufYy
	 qIq/TA7M6X2jz8kZj4T2tK5KsDbnuPOooxzKv/JOIj7V31GsL6qSMBa/Ca+nYXZRBj
	 fzdWxqG4pkqSrtAMzZMTa5zjnULNBNw0ynKbEglE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: fix up some missing class.devnode() conversions.
Date: Mon, 28 Nov 2022 18:35:39 +0100
Message-Id: <20221128173539.3112234-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=gregkh@linuxfoundation.org; h=from:subject; bh=gCQQIVDuLlgnkd/wMx8t1XoFRlWkAu6H8eCpOzaxNTY=; b=owGbwMvMwCRo6H6F97bub03G02pJDMktHzPtTGNUnO41nU+2WdRstsJTXGKd1H6lJvX3Yd/EInji lb91xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwEReujEs2C2uVdn0duUV12hRgf6U94 scetZHMsyzl/n8xOqf2BvTsjVFN6Za+FarVDYCAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit ff62b8e6588f ("driver core: make struct class.devnode() take a
const *") the ->devnode callback changed the pointer to be const, but a
few instances of PowerPC drivers were not caught for some reason.

Fix this up by changing the pointers to be const.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: ff62b8e6588f ("driver core: make struct class.devnode() take a const *")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 drivers/misc/cxl/file.c                 | 2 +-
 drivers/misc/ocxl/file.c                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 40f5ae5e1238..eb5bed333750 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -53,7 +53,7 @@ struct coproc_instance {
 	struct vas_window *txwin;
 };
 
-static char *coproc_devnode(struct device *dev, umode_t *mode)
+static char *coproc_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "crypto/%s", dev_name(dev));
 }
diff --git a/drivers/misc/cxl/file.c b/drivers/misc/cxl/file.c
index 3dbdce96fae0..5878329b011a 100644
--- a/drivers/misc/cxl/file.c
+++ b/drivers/misc/cxl/file.c
@@ -546,7 +546,7 @@ static const struct file_operations afu_master_fops = {
 };
 
 
-static char *cxl_devnode(struct device *dev, umode_t *mode)
+static char *cxl_devnode(const struct device *dev, umode_t *mode)
 {
 	if (cpu_has_feature(CPU_FTR_HVMODE) &&
 	    CXL_DEVT_IS_CARD(dev->devt)) {
diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index d46dba2df5a1..d96be36405a0 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -581,7 +581,7 @@ void ocxl_file_unregister_afu(struct ocxl_afu *afu)
 	device_unregister(&info->dev);
 }
 
-static char *ocxl_devnode(struct device *dev, umode_t *mode)
+static char *ocxl_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "ocxl/%s", dev_name(dev));
 }
-- 
2.38.1

