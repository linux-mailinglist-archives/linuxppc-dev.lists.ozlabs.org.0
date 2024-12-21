Return-Path: <linuxppc-dev+bounces-4383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC69FA120
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:48:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGM0bYbz2yhR;
	Sun, 22 Dec 2024 01:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792507;
	cv=none; b=melCgx6fBj1tYgQSWCVPmx7d+wAgS8LXgjMmsXsBm6DbfU5MNXdl9jXT8YhNRCF8MIddLAHV6QUqhVvYV+RHs9aBBg4/niTLc69BQkGnxkW4+IbOvhJMCArWa2+pPQ7KNjexDD8uMhqtkXZi7d8+5uk5YICpksD/IgFmH9nzP89bkw+UeCrzoXu+e/XDwPp4xYfm1OQjMRveO3ICQ3LbntSDM1EL3L5CB0IykT4qcGzeYxIzR+tBOeOFVfV1xZIO9VOwo98grdJl9Mdg1ewkR1NZOhCQjSAW8wW8iDvfekb1SmDxotVZzkCk1EIcgVBRI8VpGsttbjJToO39rsBJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792507; c=relaxed/relaxed;
	bh=XBL3ttK644uD2MwFxgPi+QzNqrertWW4xLvR7iCSUZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkBjOXjJgttTpJ3FMKothuPWx3dEaUkhimloTuWGhryVxXRN0ZFZHbOqRQtNwAn0wXf9oFD2MnkhZ+G558P1/8ay/iTCMQPDoR0y+GHEvTzsHFK6kMRkNnUa1AYejlmFEKZac/EkhZIsDS63VtsxL+ykfu5rWngQrDzXGIkZU4agbIfG6CSFYn5l67gVzZU9QHZe+V5tGLVvpRQhNJDg3seDaf10sTFNENLY+L5IKtRZ0OhG4S5soDLLrNlJojFbRebACQKm+5a/5UIQUuEzEKMdH0b3pph2H8454DViYBuh5jqc7s21GLXnm97A6sn1pgfwlKM4ZDct2GQPs7wtiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BYWrCwnE; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BYWrCwnE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGL31cYz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=SGNU5IH45oWd8l2/U8DWBMgp52g/CAQH5eqzkYxnU98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BYWrCwnEkn0QHxatyy8rZTjh4Iq0endZnyBkLvR4dJY+RPmT+pSThMIA1VQGAenM/
	 7CS3e3STgGwan9cQT9P4oaqoN2vSXl/xZ3ik5i3X5oMIyRpT1wcgJxYgEEwoU/KAqY
	 Ct0A+8BrBH8ROREFUysqC6o9TIh24e2OaWWF9tdU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 21 Dec 2024 15:48:13 +0100
Subject: [PATCH v2 7/9] misc: eeprom/idt_89hpesx: Constify 'struct
 bin_attribute'
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-7-ba5e79fe8771@weissschuh.net>
References: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
In-Reply-To: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1790;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SGNU5IH45oWd8l2/U8DWBMgp52g/CAQH5eqzkYxnU98=;
 b=QNNWabCGxYdXGIaopmxDFnMFSHHSbTjQvdcOUBaTQYvRsIoPHmXFwwCwl2o+0S2E1qKiWVKVD
 B9JJWLcfMQICjSaIrvp4H0cDOrl3beHSgRgZ1W6PewNC25s/IpIV8dt
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/misc/eeprom/idt_89hpesx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 43421fe37d338874ff1c2949497c64ebf0143106..1fc632ebf22f560088084519e5ad8e8b37958368 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -847,7 +847,7 @@ static int idt_csr_read(struct idt_89hpesx_dev *pdev, u16 csraddr, u32 *data)
  * @count:	Number of bytes to write
  */
 static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *attr,
+			    const struct bin_attribute *attr,
 			    char *buf, loff_t off, size_t count)
 {
 	struct idt_89hpesx_dev *pdev;
@@ -871,7 +871,7 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
  * @count:	Number of bytes to write
  */
 static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
-			   struct bin_attribute *attr,
+			   const struct bin_attribute *attr,
 			   char *buf, loff_t off, size_t count)
 {
 	struct idt_89hpesx_dev *pdev;
@@ -1017,7 +1017,7 @@ static ssize_t idt_dbgfs_csr_read(struct file *filep, char __user *ubuf,
  * NOTE Size will be changed in compliance with OF node. EEPROM attribute will
  * be read-only as well if the corresponding flag is specified in OF node.
  */
-static BIN_ATTR_RW(eeprom, EEPROM_DEF_SIZE);
+static const BIN_ATTR_RW(eeprom, EEPROM_DEF_SIZE);
 
 /*
  * csr_dbgfs_ops - CSR debugfs-node read/write operations

-- 
2.47.1


