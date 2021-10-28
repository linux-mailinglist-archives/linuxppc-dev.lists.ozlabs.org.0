Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD543DEAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 12:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg1kg456Yz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 21:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oxgzxeTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oxgzxeTr; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg1jx0j0gz2xCt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 21:18:42 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso4313810pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AtRMwbZy5HFLEPgyWN1+wEtHlSPg79vWQXM45h0t10c=;
 b=oxgzxeTrN+TYAcnoVkWvO74cRWoGFvMFKYQDZ8W6fMJQeyG7t4p+JZkYdbKNn43Fs8
 ezL2e29zimjGZ9gGRseCM3rLlNAM4ozEZKEzpxVJ6K6TF/s6DcrJ2COcVz0QsAgqHGxb
 pNk2hj7W3wdZkMtQJj3zxNBtmSO2sWz02V4br3wRzpjtmV/5cQzOTQrFOXPmM4r0ys46
 rrTtLNzJAXNr+ixnmyitix+R/PbtCBGsSBm2YBsq6Z4QaQ+lhdTNzTNl7jDzUtQfub01
 aIT6YZJsDLaPmR5JITYPAcgfwbkXHvHWkgIlWY0jtOG7GjuX0j/ARb2i3WNUD9y64elM
 3YGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AtRMwbZy5HFLEPgyWN1+wEtHlSPg79vWQXM45h0t10c=;
 b=2B0qWcJRW9iRcXHz0/WOlNbrA0svp41VTlR4hQhhnH6oNs0ENNnOCKUWquNNCCCOh5
 RXh78YDxAmdHlGhUv9dJX065bTt7HrHCzfdc7RVws0b70YIbCvvhattam8cYVofu5A2G
 zox/cE97fFPEiIwqHWuvxTbLOIRQvhQmuon2cgN8CrPKd9rz0RY1FdQLsw9MJbO12VKo
 wWAQRptvuVIMcl6+maR801++joQi47hyKoJJ1URkDlRtvuLlvbSXOMYhR6egko71pJdr
 45RCB/X6I2cqgukXBfTJH7tL8DDR70lkYVshYWk0rwhnssPV6bOpXScpsjvg4wCjJjrG
 NQBA==
X-Gm-Message-State: AOAM531iRyhGw5MKTJzP8BUuUUNz2pVJtErG52btw7j4To4fod6xVWCC
 bjtz9wBx3+jZ4gFA6Ox1V20/hJWknsU=
X-Google-Smtp-Source: ABdhPJz7xIwmNa3Y3CFRxLmGY5vvdUVSMta4nlpfTYIzMnKDtZuK8/U1rVWjSsZ+c9d0o4i9zUx6WQ==
X-Received: by 2002:a17:90a:7a81:: with SMTP id q1mr33172pjf.1.1635416321121; 
 Thu, 28 Oct 2021 03:18:41 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id g13sm3167115pfv.20.2021.10.28.03.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 03:18:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: tyreld@linux.ibm.com
Subject: [PATCH] drivers: scsi: replace snprintf in show functions with
 sysfs_emit
Date: Thu, 28 Oct 2021 10:18:22 +0000
Message-Id: <20211028101822.14278-1-yao.jing2@zte.com.cn>
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

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index d0eab5700dc5..9f20fefc2c02 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3403,7 +3403,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n",
 			vhost->login_buf->resp.partition_name);
 }
 
@@ -3413,7 +3413,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n",
 			vhost->login_buf->resp.device_name);
 }
 
@@ -3423,7 +3423,7 @@ static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n",
 			vhost->login_buf->resp.port_loc_code);
 }
 
@@ -3433,7 +3433,7 @@ static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, PAGE_SIZE, "%s\n",
 			vhost->login_buf->resp.drc_name);
 }
 
@@ -3442,7 +3442,7 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
+	return sysfs_emit(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
 }
 
 static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
@@ -3450,7 +3450,7 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
 {
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct ibmvfc_host *vhost = shost_priv(shost);
-	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
+	return sysfs_emit(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
 }
 
 /**
-- 
2.25.1

