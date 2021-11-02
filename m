Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A792244275D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 08:00:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk14N4Q6Zz2ynt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 18:00:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lneso4Ay;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lneso4Ay; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk13k6FMvz2xYM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 17:59:28 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id f8so14511828plo.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Nov 2021 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vqXwOUNI4/IijAlpWAo12uhMUJZ0tnXr5EHJzFt7VTI=;
 b=lneso4AyG+tGq8owgQRSmatMK3IUeSPdI90ZQgFfY757rx79Q4gYgWf8mSwll4IBee
 zn/Xfsn/z8MB5jpN35Gq7EOzjX8X49ah8k2IYpxYK7hi5MOLrzfdJ4wE78cM6gMTV/6l
 ZPSUjm8NAcWZNXnpISUyWpNFF5NpiXVg6PVwurlJgxUxtLvN3wiXvSf9LwFthVeEFR0F
 ILs1U2SlKMZN+yyuIyHWyLroKVb40R5ysqMP31UbFsNuIVNQS6c6mXfptGN7zToWzhWF
 T+uoJVObXQLMHPC4mhJdsRED6da/IYlpasL90jwH1OxqFO+fkrl7vTOakAS4eNXiLHOO
 tnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vqXwOUNI4/IijAlpWAo12uhMUJZ0tnXr5EHJzFt7VTI=;
 b=b8EzDqduMzMSdMlGCpVYB7yoOxKYeL9faKWsxeFcaiQgHJ4rvtLqbSyMoBjRKMju1u
 S3nYWa34HAodO+qXlwzlwsXrCeMG9QQBNjdeyJTDKzOrin5BkNRHOZuwRvcEulQiYaiw
 7hW2XwEaR4FTlBohBhsyBMBHPOYYT7zXt7zkeJHtjcWmwyjx/0XF2NVxh2a4yRRPlHo4
 v4BA1U4koqs8oibfxlqtkpbbDh/J/tVyDOqMHd9BBa96y6ptuL0zRTJgwUvWam+Fzzeq
 zA29bhbSkD1t/juG7zsaGdjLDBzbdBdbm577i1Kt19mPLwltrSVe4d8EAyVR6ItJPkVo
 mS+A==
X-Gm-Message-State: AOAM530pzi2ZoG2Bhu703t/VnjsNYGM1P0vIiHBeRMBxJBL+KQWwl6FR
 6J8pc2BwPSbOjRWbBHLPkTE=
X-Google-Smtp-Source: ABdhPJyZwE+1coELcVY3xbl84n48ESpJ+5RLjdIi/ksHkVEOoBlelvQsQw/eCDp7BkzvDbomG0bpQw==
X-Received: by 2002:a17:90a:df96:: with SMTP id
 p22mr3153842pjv.129.1635836364229; 
 Mon, 01 Nov 2021 23:59:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id v14sm17611914pff.199.2021.11.01.23.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 23:59:23 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: tyreld@linux.ibm.com
Subject: [PATCH v2] drivers: scsi: replace snprintf in show functions with
 sysfs_emit
Date: Tue,  2 Nov 2021 06:59:16 +0000
Message-Id: <20211102065916.4164-1-yao.jing2@zte.com.cn>
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
2.25.1

