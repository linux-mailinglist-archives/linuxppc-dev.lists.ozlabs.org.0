Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9D43D94F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 04:25:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfqDH1bCRz3c70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 13:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqwXy5n9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EqwXy5n9; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfqCW4nMZz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 13:25:10 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso3526899pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GRC3oKU5t8MNbDIRrWo3mHgF77PLmBHPiD3xo6WI7U=;
 b=EqwXy5n9i8RiU1Vqj5mkd6XKFXv/7pY4aSKYpOAzquPYCEy3yMTtku9UkfYIVBtyYK
 9+AzS1vhmGcTxOt56eLm3ysI8mBYn7XgwsbTeaLuOBI4UctuckQbRHz/8WaZ85CP231X
 fwUbh5i8MWFMzXBeOl6BavkZuzxO4vOsyDhKidTYhxRly+qPrnNtxChJDle40rRcyclD
 cJzNhCFliUnPwUx7OisY/NxQehcMQvtP+oJh+QjpnYJbBOMdM1D496JuP72FSAoLC4xj
 V/XUcLyUFQaCHL+VYPW57va/GfcqBQtrVyJiNkEUfLmwj2o85jIzaoT1/IMKWwxECb6U
 INcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GRC3oKU5t8MNbDIRrWo3mHgF77PLmBHPiD3xo6WI7U=;
 b=DVvID9FAPEjqX6CUOMNhhBgFDsC5uO1Sk107Dp96TWPEjxtmLhGHEAMdkIjmxl1X38
 qsyzbpVPO1NmxlSDHebGZlkj4iX4/yNECzKOCTxm5JoanyKXhSfUYeWep3VO+fa5be7I
 5YI5YonYhm+okt/2BZrWc/+jpWq8WNBr5q9r6mUmNq2w/7HurvXyWZsUw2sOEadzGt9D
 R3it8PWH0bcwdgvO6EFqr/xcwLhOmkrxQixDSUFeMB64xyBQVMAFBoAEVeyVU71iYY1k
 xgr7pHPDw1T9Vs58/VjTDc/3coLDeo4iK1Udjuqyty3mcmI017HZOc/lzPhmWvls/P4d
 0I2w==
X-Gm-Message-State: AOAM531AoITKhV6sqQB/rqaOvJ5vbIqCObsAiExe45+okLYwAQwvt/AU
 ZObgB/bPNXuihSwQC27hb/DlD3MvINU=
X-Google-Smtp-Source: ABdhPJyaUMQa33s9XhiwDfXb5v0/Ivv7x0V/Uwo58Yx3uqZUxdP2E0LU5ZcBtVYvQUYiZ7PK9AgPdQ==
X-Received: by 2002:a17:902:9348:b0:141:5862:28b4 with SMTP id
 g8-20020a170902934800b00141586228b4mr1352384plp.17.1635387908677; 
 Wed, 27 Oct 2021 19:25:08 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id c8sm1224790pfv.150.2021.10.27.19.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:25:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: tyreld@linux.ibm.com
Subject: [PATCH] scsi: ibmvfc: replace scnprintf in show functions with
 sysfs_emit
Date: Thu, 28 Oct 2021 02:24:59 +0000
Message-Id: <20211028022459.9076-1-deng.changcheng@zte.com.cn>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the coccicheck warning:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index a4b0a12f8a97..7f39a965677b 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3402,8 +3402,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.partition_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.partition_name);
 }
 
 static ssize_t ibmvfc_show_host_device_name(struct device *dev,
@@ -3412,8 +3411,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.device_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.device_name);
 }
 
 static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
@@ -3422,8 +3420,7 @@ static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.port_loc_code);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.port_loc_code);
 }
 
 static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
@@ -3432,8 +3429,7 @@ static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			vhost->login_buf->resp.drc_name);
+	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.drc_name);
 }
 
 static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
@@ -3441,7 +3437,7 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
+	return sysfs_emit(buf, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
 }
 
 static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
@@ -3449,7 +3445,7 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
+	return sysfs_emit(buf, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
 }
 
 /**
-- 
2.25.1

