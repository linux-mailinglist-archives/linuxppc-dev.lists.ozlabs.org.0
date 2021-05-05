Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EE93748C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 21:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb6V325sMz3bTP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 05:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.130; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb6Tf4p3Bz2xZD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 05:39:00 +1000 (AEST)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d16 with ME
 id 17es2500B21Fzsu037eswd; Wed, 05 May 2021 21:38:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 May 2021 21:38:55 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mpe@ellerman.id.au, imunsie@au1.ibm.com,
 mikey@neuling.org
Subject: [PATCH] cxl: Fix an error message
Date: Wed,  5 May 2021 21:38:49 +0200
Message-Id: <fa2b2c9c72335ab4c3d5e6a33415e7f020b1d51b.1620243401.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'rc' is known to be 0 here.
Initialize 'rc' with the expected error code before using it.

While at it, avoid the affectation of 'rc' in a 'if' to make things more
obvious and linux style.

Fixes: f204e0b8ce ("cxl: Driver code for powernv PCIe based cards for userspace access")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/cxl/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/file.c b/drivers/misc/cxl/file.c
index bd3bd32333c5..3dbdce96fae0 100644
--- a/drivers/misc/cxl/file.c
+++ b/drivers/misc/cxl/file.c
@@ -569,7 +569,8 @@ static int cxl_add_chardev(struct cxl_afu *afu, dev_t devt, struct cdev *cdev,
 	int rc;
 
 	cdev_init(cdev, fops);
-	if ((rc = cdev_add(cdev, devt, 1))) {
+	rc = cdev_add(cdev, devt, 1);
+	if (rc) {
 		dev_err(&afu->dev, "Unable to add %s chardev: %i\n", desc, rc);
 		return rc;
 	}
@@ -577,8 +578,8 @@ static int cxl_add_chardev(struct cxl_afu *afu, dev_t devt, struct cdev *cdev,
 	dev = device_create(cxl_class, &afu->dev, devt, afu,
 			"afu%i.%i%s", afu->adapter->adapter_num, afu->slice, postfix);
 	if (IS_ERR(dev)) {
-		dev_err(&afu->dev, "Unable to create %s chardev in sysfs: %i\n", desc, rc);
 		rc = PTR_ERR(dev);
+		dev_err(&afu->dev, "Unable to create %s chardev in sysfs: %i\n", desc, rc);
 		goto err;
 	}
 
-- 
2.30.2

