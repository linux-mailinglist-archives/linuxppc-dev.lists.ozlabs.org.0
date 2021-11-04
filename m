Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E7445290
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 12:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlMWL72l9z3054
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 22:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YtSkQW2/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YtSkQW2/; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlMVh3lL8z2xCj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 22:54:02 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id o12so3807251qtv.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koH6vD7SVMVKyJH/PJVBm1PhjwmEcK7v9ZicEy7lRJE=;
 b=YtSkQW2/I77tbpJo4uN2ee+ONJYmLMsvnxshoPFe1mj2VbXd2YBMaYW4XI+2hmSzEU
 LpaZYTD8gRTIha/f76p9pBNXwBQns5TNXDZxE+3+gDDX6CaTnvpJlRMRI/NFFbVyArUW
 O6KwCq66rAnlpZYaLqcqycGMRS0Zy8QhkHGFOniMwYIexHAJRwLEmJF2KRgZI6T50Acu
 Bgi1e9h6B5O89yADCL7Fc75RqlrR14aHQO6C5JbQYP9Fsqilmpfu4CFSVNw9YIOTTN0N
 Yzwnbd/LnfJefyJZ5/QJ0ljkghvctSbPltICGQ8uuFeHsLSn5hxUkRXXuOXuDs/G58np
 BXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=koH6vD7SVMVKyJH/PJVBm1PhjwmEcK7v9ZicEy7lRJE=;
 b=JoVcWXejpQPVSoO0Gm5AlPFFh5ZHCMtj+NW58id9MhMkh5jerPHnav316bTz2GoPvg
 jjj3sKVv34WVg4q6wUswn/vk5zwOE2uVy2ONQES0zVxIlndvdyh4gkxMFLEZ0jcrgRFx
 hQVLLSG95FPdre8a/Avl4zipF2p023LGnP94Sd9hbRlV1uQu/JGyfD1ST1MIbdIhLWAr
 LTTssA9ubszGXEUnwVfe1zur2kHkS7w5qGZy27bNaYestZ9wh0whlyW73rpBAbBzpuuH
 y5O1FrrGIhu+WWGp/DgZub8JjIrcgaFPDGhzm7s6XWKtBkOMQgZfrNNSLzx4vQhhHzr/
 3yOQ==
X-Gm-Message-State: AOAM533o3xwB2jPzPpRE5y6RkjSY5JiMOhb+u+CfvXM0Ix/Nh4gokeSX
 ssx6VOVERwyKfKrFnGr6Hs0=
X-Google-Smtp-Source: ABdhPJx1NEHVvXxK5z5l9KHyTun2FQnkWIAKijzYgaZxce7qhxR1ugu8xlAj6P+I1f9eR8XJWJfEBA==
X-Received: by 2002:ac8:4e03:: with SMTP id c3mr14763885qtw.148.1636026839036; 
 Thu, 04 Nov 2021 04:53:59 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id m1sm3548561qkp.124.2021.11.04.04.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 04:53:58 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: tyreld@linux.ibm.com
Subject: [PATCH] scsi: ibmvfc: replace snprintf in show functions with
 sysfs_emit
Date: Thu,  4 Nov 2021 11:53:49 +0000
Message-Id: <20211104115349.32073-1-yao.jing2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Jing Yao <yao.jing2@zte.com.cn>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
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
2.25.1

