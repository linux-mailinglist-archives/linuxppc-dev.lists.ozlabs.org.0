Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C28B1762
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 01:46:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L9aABPOn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPwcN4H0Gz3dK3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 09:46:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L9aABPOn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=prosunofficial@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPj5k3W9yz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 01:07:36 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso49921045ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713971254; x=1714576054; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFCwS+dd80ug/yeLMuHLZKf5f5L8AtiYXNjRk6IaZvk=;
        b=L9aABPOns8w2pwYBH/HGeLtCrOokA+mJX/kqf/Us9HahKoa+K7943BkRv23tYXsoGf
         BRsW2kMjBCuqCrp4irzYX0HL5Cu72JvCWm0jE1qRdsEWzWds2ssMMkHjeHh9ft7YupU5
         svOHsH8+7cO7rb5AigH5UB/npWIbeZimB/LRFdrrbcx3DUywDJzrzWk4oV/dduYaxnbM
         /PHYBlvh65/5lnuXt8tGl+zd02Vltkk5gCeBgUAmvElwBbVxdHsuCN8eU38KdD7q23KB
         DWm+9kiUuOPNn/I+5zFTmNsojZYvEKknDawsHmYXvGUpuKoO5o2ci884ZkJ9DeZUjhEX
         gdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971254; x=1714576054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFCwS+dd80ug/yeLMuHLZKf5f5L8AtiYXNjRk6IaZvk=;
        b=MxqpdDhQt6gyizM64UOYT6V/IuMfkBxcE9vjuhnVxQOwKCKTs+TYtteSvg891km5zO
         pw40htjcZzheoR3QrnJmi/Ww+cUX893tgWtk7/Xa6vUssCK/X94zNIsRD4qArx4vqx5C
         Vp/Jso5ObNWUkRlYcILHrh1WqYm2N+xoLkO+YvBGun4bDs/ms3D5E6OmtJfT8cZaE9IY
         c8+jO6WgsinBiapjIJsK0gINV7DCHuLboFDQzYuo+KY4qQGrJTXV+D8GVokfeV47tJvp
         CXJ4uUgAGU41hd2DqCLW/3I8cX8F5do+aa/r68IDGnbiqWwMLm5ES7qeQfZM+hg8KH2X
         ldFw==
X-Gm-Message-State: AOJu0YymUC2jMiHlnSj65B1XkPpVa1Jb/jRnoAbTClgW3nquXHjCNYg3
	C1TLAstZ67ySHlPhBoBTLgNWN3iFO6Z50ExjmboUamddP78QQVXc
X-Google-Smtp-Source: AGHT+IFtkfYdH0o+GqgdSpQhcrFj+BTfT78r4+LvjmauJpWP2Ck4K9u6q/dIUlv+L6bGO6qzP8NQNQ==
X-Received: by 2002:a17:902:b611:b0:1e3:c5d1:2324 with SMTP id b17-20020a170902b61100b001e3c5d12324mr2770606pls.32.1713971254266;
        Wed, 24 Apr 2024 08:07:34 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:820f:5b56:3996:5bb5])
        by smtp.gmail.com with ESMTPSA id w11-20020a1709027b8b00b001e4458831f7sm12003335pll.77.2024.04.24.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:07:33 -0700 (PDT)
From: sundar <prosunofficial@gmail.com>
To: yangyingliang@huawei.com,
	mpe@ellerman.id.au
Subject: [PATCH linux-next] macintosh/macio-adb: replace of_node_put() with __free
Date: Wed, 24 Apr 2024 20:37:18 +0530
Message-Id: <20240424150718.5006-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Apr 2024 09:45:48 +1000
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
Cc: sundar <prosunofficial@gmail.com>, javier.carrasco.cruz@gmail.com, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, skhan@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

use the new cleanup magic to replace of_node_put() with
__free(device_node) marking to auto release when they get out of scope.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: sundar <prosunofficial@gmail.com>
---
 drivers/macintosh/macio-adb.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index 779f1268286e..85d404031cf5 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -83,35 +83,32 @@ struct adb_driver macio_adb_driver = {
 
 int macio_probe(void)
 {
-	struct device_node *np;
+	struct device_node *np __free(device_node) =
+		of_find_compatible_node(NULL, "adb", "chrp,adb0");
 
-	np = of_find_compatible_node(NULL, "adb", "chrp,adb0");
-	if (np) {
-		of_node_put(np);
+	if (np)
 		return 0;
-	}
+
 	return -ENODEV;
 }
 
 int macio_init(void)
 {
-	struct device_node *adbs;
+	struct device_node *adbs __free(device_node) =
+		of_find_compatible_node(NULL, "adb", "chrp,adb0");
 	struct resource r;
 	unsigned int irq;
 
-	adbs = of_find_compatible_node(NULL, "adb", "chrp,adb0");
 	if (!adbs)
 		return -ENXIO;
 
-	if (of_address_to_resource(adbs, 0, &r)) {
-		of_node_put(adbs);
+	if (of_address_to_resource(adbs, 0, &r))
 		return -ENXIO;
-	}
+
 	adb = ioremap(r.start, sizeof(struct adb_regs));
-	if (!adb) {
-		of_node_put(adbs);
+	if (!adb)
 		return -ENOMEM;
-	}
+
 
 	out_8(&adb->ctrl.r, 0);
 	out_8(&adb->intr.r, 0);
@@ -121,7 +118,6 @@ int macio_init(void)
 	out_8(&adb->autopoll.r, APE);
 
 	irq = irq_of_parse_and_map(adbs, 0);
-	of_node_put(adbs);
 	if (request_irq(irq, macio_adb_interrupt, 0, "ADB", (void *)0)) {
 		iounmap(adb);
 		printk(KERN_ERR "ADB: can't get irq %d\n", irq);
-- 
2.34.1

