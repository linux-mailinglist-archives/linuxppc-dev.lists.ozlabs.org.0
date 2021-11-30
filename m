Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD44628DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 01:07:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J32bP6Sryz3bWT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 11:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dbimWW9g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dbimWW9g; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J32Zg4J6Mz2yPN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 11:06:51 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id p13so11003065pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EzaxcIY5royQHN5xoXfZ35t2h3OBMnvlOC7rpJ9geNk=;
 b=dbimWW9gB8wJlLfjWTb78/MzsnhGlNhemdzZFVzUkIlvmNlTFT5fPJXcPj51zxfoyV
 VSb6Ztdx09Cm7QOCeZQ6zKY1YHfXoJW9i5OvPW8tgv4QNV6L05rMI4f8777qKuLwV2ss
 UQ4P8DjB4WfuAq6/zi5ZdS4an2o/4W9cmkVkJC7EDLG2d5RETz8s0drfBcJYpagfyQJy
 6BpUWV/A5uMgfFXouyrVnWu2wbdAlH/hK8h88tZdWDmjji2pmy6hu9nbdh5JfLULa5qN
 WvbRjlgy2elDKFIa0Ycovy5dY5r+L1xeRra6jAMD1KgkUQx4Ux9LhBXnASdRmUjg3leq
 uDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EzaxcIY5royQHN5xoXfZ35t2h3OBMnvlOC7rpJ9geNk=;
 b=HCJLTxT9TB7cpxYZCQ+YPjIR6XnvakDI6xIMX83QNGKlbNPBId+CRkO8TzpuHHLiwZ
 eg9o/PK6+Bnutq36iU/48JDm7EhOILEjfqF+0icmj4J99RrjzDdeKbxOL5YKYde8ck7l
 VLLQ6TX9Wyc5bsPBBavlNuj9hGNU6J0YMor0rEUBY0y8JRKYKei1tHiEMIXuDfBtYCIX
 jwp/416i9XMzTYRfEQkQMYH5fpIzYFzZUQFO+iypx6r9g6M9zfwcOcN5u+UVa/lwK9gr
 QcwBklX2OqfEaB3s1Cam6XJtWkiZOy7nnGxDtr2VyYXjZJxc4RxDhL8++eRTY+aWT7lq
 hYtw==
X-Gm-Message-State: AOAM531zGMDw3q0kPddXPJvu1vVaNYZUrf/AMZPZH+6SwO2N7OP9By+a
 JR7LtCiFKiGe48//og63Os8=
X-Google-Smtp-Source: ABdhPJypnMItEAw3uRBbEUbGdiIRonmaVfX9GMtHOHZavbW1dFGiq/gM25pzztQR7UT7Wq2c5PywWQ==
X-Received: by 2002:a63:4244:: with SMTP id p65mr37945736pga.440.1638230809236; 
 Mon, 29 Nov 2021 16:06:49 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id lx15sm415227pjb.44.2021.11.29.16.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:06:49 -0800 (PST)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: tyreld@linux.ibm.com
Subject: [PATCH] scsi: ibmvfc: replace snprintf with sysfs_emit
Date: Tue, 30 Nov 2021 08:06:37 +0800
Message-Id: <eb06c0df4ef4b4786cbafbbe4d74c890dc50fa7b.1638185169.git.yang.guang5@zte.com.cn>
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, jejb@linux.ibm.com,
 davidcomponentone@gmail.com, linux-kernel@vger.kernel.org,
 Yang Guang <yang.guang5@zte.com.cn>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/scsi/ibmvscsi/ibmvfc.c:3453:8-16:
WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3416:8-16:
WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3436:8-16:
WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3426:8-16:
WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3445:8-16:
WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3406:8-16:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..69bf55c037a5 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3403,7 +3403,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			vhost->login_buf->resp.partition_name);
 }
 
@@ -3413,7 +3413,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			vhost->login_buf->resp.device_name);
 }
 
@@ -3423,7 +3423,7 @@ static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			vhost->login_buf->resp.port_loc_code);
 }
 
@@ -3433,7 +3433,7 @@ static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			vhost->login_buf->resp.drc_name);
 }
 
@@ -3442,7 +3442,7 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
+	return sysfs_emit(buf, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
 }
 
 static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
@@ -3450,7 +3450,7 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
+	return sysfs_emit(buf, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
 }
 
 /**
-- 
2.30.2

