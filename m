Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463784AE634
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 01:44:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jth2x73RTz3bZg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 11:44:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VhrPBaW9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VhrPBaW9; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jth2D31mNz2xsr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 11:43:31 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id z13so1421046pfa.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Feb 2022 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fMOnOpTGKn9/jVrcDzClYggaX4u+eL9NpYQ7bzh9GdY=;
 b=VhrPBaW9Pd7tSs4NlnRE27lUVYOlLlE6vXz5Tgjv+0TtyrRrh8+9fB/ddGQblRsR3X
 Pyuovi/mmJE0lZxnk/y4Qdp+sMcVsfqpkbJ2dlLOiWIkRrXVeePBfglBxOEeM0mC7MCH
 ZQhuKSysbxnPNF7Jdnt5x9cZijs/gw9FqPXWy/uyFzw22fOx73dCciWdd9NT1hhWA6xY
 aaHh0shXwOHETOlYJSXDqsw0jEpyxNmoKYyAWmsqcz0QhbpUDpWc24kxkNpksKamO13V
 0bI9S3GcfULUayOPY2ARCDwyaHYqyHzAno9GPxpBdTTSKrx7n019ZSWC7Ok4KJ/p+mIi
 lPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fMOnOpTGKn9/jVrcDzClYggaX4u+eL9NpYQ7bzh9GdY=;
 b=lSkq6llAeYl+a/NYwCInIc8gInqPf57tFung0pKayRmskD8M40LB0CuqV5Wp3ClEvB
 NR1J/jrZWRICirthLBImcAdk6Y1Cfrk+RbKW2WU8B8bC1qIx0QGAkGJt4j5U3BB2T2ek
 Ar8pC18pYONcQwVk2VzyKpI9nM7LgSKVt5oagE1X4D0kvl2qXO/Y000dL82W9ywzeSqx
 9nLLix27EvnUWGMyNcLERKuGqmWdLZgHOAN3NkG7InJ6yhFfsASbi2sy0Qci3nzOIM8Y
 0Lf29AGlXko6OFE919hF0jtiVTjkZBYqcBn8ikZdSEUHxIhZ/CoMbZuqt1KnGOHcd/zl
 HBBw==
X-Gm-Message-State: AOAM533JuwxivyEFzs8TS5VJKgwaTDo3/Gxt5n/xu10yyh7G/aOHAxVf
 CtiBlJYs7rvhNs4aAfdn+g0=
X-Google-Smtp-Source: ABdhPJxztLUaN8ctWe7jK8i2Ne76K3cV0pjkNHm76KdEOQhk6tD3/DaipquI7XsjKgga/7Jp9/9BZA==
X-Received: by 2002:a65:4b8f:: with SMTP id t15mr5718920pgq.140.1644367408679; 
 Tue, 08 Feb 2022 16:43:28 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id f22sm17352169pfj.206.2022.02.08.16.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 16:43:28 -0800 (PST)
From: davidcomponentone@gmail.com
To: tyreld@linux.ibm.com
Subject: [PATCH] scsi: ibmvfc: replace snprintf with sysfs_emit
Date: Wed,  9 Feb 2022 08:43:15 +0800
Message-Id: <b4c150c86f539d3bac3fc8885252adb9f24ee48f.1644286482.git.yang.guang5@zte.com.cn>
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
Signed-off-by: David Yang <davidcomponentone@gmail.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..d5a197d17e0a 100644
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
@@ -3471,7 +3471,7 @@ static ssize_t ibmvfc_show_log_level(struct device *dev,
 	int len;
 
 	spin_lock_irqsave(shost->host_lock, flags);
-	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->log_level);
+	len = sysfs_emit(buf, "%d\n", vhost->log_level);
 	spin_unlock_irqrestore(shost->host_lock, flags);
 	return len;
 }
@@ -3509,7 +3509,7 @@ static ssize_t ibmvfc_show_scsi_channels(struct device *dev,
 	int len;
 
 	spin_lock_irqsave(shost->host_lock, flags);
-	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->client_scsi_channels);
+	len = sysfs_emit(buf, "%d\n", vhost->client_scsi_channels);
 	spin_unlock_irqrestore(shost->host_lock, flags);
 	return len;
 }
-- 
2.30.2

