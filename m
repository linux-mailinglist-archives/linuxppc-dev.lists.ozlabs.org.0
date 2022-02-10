Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845634B0AB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 11:34:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvY5v19C5z3cCv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:34:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PXSYfz1z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PXSYfz1z; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvY5F5hzMz3bP1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 21:34:08 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id l19so3642091pfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 02:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZrnHVGdRb2E3LKqHBhEp3nq9Ei2BPCgAdM7PxxwMUI=;
 b=PXSYfz1zlVDEi9sS6GcnqRPXe6uYTBJ9eWKA+Lz9jSghUhglwdFclzfXxQyE3j/5yJ
 825mmWLFHknGcmPg8a471WS8c+Rr1LFzJiJ12GpN8vwGUTfx0mEzrhYJCwrNCA3PJ1I7
 /k8med1t4oqKWNDv0et45hVWUgsLCFIxG3SRD7nurNmnIvgdi8L9SLL+OlIixTgMscd2
 h+CtSTrwCrToMb1Jk4YWSPRjxuqkGaSRLUs+wRmKXxbmPa1KaTRR0OjIqkozDvTht89m
 ZsMMZYvdQSzX2V7X5miQUOtXopp+4Z6W0tsz6yKvygUnTeOES3VhwXXLGAPLE5uKtaFb
 DHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yZrnHVGdRb2E3LKqHBhEp3nq9Ei2BPCgAdM7PxxwMUI=;
 b=OK9vVY2lNcdBoT7DNet7oDN8d5UWzmODVgrUJXQ0KxySVjLn39069/RHuilzrXn0ZE
 wxs9AjLH7PvO4YOhN+GRgY0sBXPH0HamZdjU3hZRXWLdC/qaeZq2JDTsbknJ7YsnAhSH
 9Qhr5UoJOff6A/n8vozUZUVo+LrXmksO8iftwBzfHGOqd9OYlXVTID3VVNFiWd6s12+6
 xOWpeT8tJBV/6DI9L2t1bOPczhl2J2EnWg4w7JDIbs94sDLHuxpn6PAvItLlfz8fqQaj
 RBp1CeNdTXa3DNXf9+HA/uOXFQXiWDryG5Tg+x0He+LhVLEn+9n32fmSnJJ5VaOpJ3Kl
 0ZKg==
X-Gm-Message-State: AOAM531Gb5BEVTG4ElnDVKNUv0Yd1kwYjfJ1uf6mWofPjcaR89ST7YYt
 DBE+NqyXl2TQtQt0YQ9At/A=
X-Google-Smtp-Source: ABdhPJz+7MqFtDttNvkV2X42b/qYinotvqOCw91RqjewAExO8EGpTeo1aV5tFMRxmG3VHYU0H1nRfQ==
X-Received: by 2002:a63:358c:: with SMTP id c134mr5647595pga.116.1644489247124; 
 Thu, 10 Feb 2022 02:34:07 -0800 (PST)
Received: from localhost.localdomain (192.243.120.166.16clouds.com.
 [192.243.120.166])
 by smtp.gmail.com with ESMTPSA id p21sm10044134pfo.97.2022.02.10.02.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 02:34:06 -0800 (PST)
From: davidcomponentone@gmail.com
To: tyreld@linux.ibm.com
Subject: [PATCH v2] scsi: ibmvfc: replace snprintf with sysfs_emit
Date: Thu, 10 Feb 2022 18:33:51 +0800
Message-Id: <6e673c1aeb3140ab7ac89a56e79be624e713f152.1644397683.git.yang.guang5@zte.com.cn>
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
Change from v1-v2:
- Adjust some format

---
 drivers/scsi/ibmvscsi/ibmvfc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..ec63c45bf66b 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3403,8 +3403,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.partition_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.partition_name);
 }
 
 static ssize_t ibmvfc_show_host_device_name(struct device *dev,
@@ -3413,8 +3412,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.device_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.device_name);
 }
 
 static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
@@ -3423,8 +3421,7 @@ static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.port_loc_code);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.port_loc_code);
 }
 
 static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
@@ -3433,8 +3430,7 @@ static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.drc_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.drc_name);
 }
 
 static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
@@ -3442,7 +3438,8 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
+
+	return sysfs_emit(buf, "%u\n", be32_to_cpu(vhost->login_buf->resp.version));
 }
 
 static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
@@ -3450,7 +3447,8 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
+
+	return sysfs_emit(buf, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
 }
 
 /**
@@ -3471,7 +3469,7 @@ static ssize_t ibmvfc_show_log_level(struct device *dev,
 	int len;
 
 	spin_lock_irqsave(shost->host_lock, flags);
-	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->log_level);
+	len = sysfs_emit(buf, "%d\n", vhost->log_level);
 	spin_unlock_irqrestore(shost->host_lock, flags);
 	return len;
 }
@@ -3509,7 +3507,7 @@ static ssize_t ibmvfc_show_scsi_channels(struct device *dev,
 	int len;
 
 	spin_lock_irqsave(shost->host_lock, flags);
-	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->client_scsi_channels);
+	len = sysfs_emit(buf, "%d\n", vhost->client_scsi_channels);
 	spin_unlock_irqrestore(shost->host_lock, flags);
 	return len;
 }
-- 
2.30.2

