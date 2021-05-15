Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A95381620
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 07:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhv6D604dz3086
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 15:27:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.42; helo=mail-ed1-f42.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhv3L75Tmz301k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 15:24:46 +1000 (AEST)
Received: by mail-ed1-f42.google.com with SMTP id di13so870856edb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 22:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Gp2LJL1lW12f9o9B/z7t/PXSY/mDvHIuRVwQfasUic=;
 b=lAeNjWRnVd6yqsjr44RE5nQ/ZbH6WS+7TvCRqBuqlDlbJMuDGc6uj4UF+x4fDUxW51
 7hLneS8KLY0yyidK3GYtQN0VmyuoOg5EdmkNiJCIkWajNd45bJ3yZ2gYjYTDxR4K0u4o
 EV74PMMI89QxmtyyfKoYL0jLHMxoshKpD5mdnklLAHkVlkOQ8qc5jq9FAId+GEpFGOEY
 l5H0+S9cBmIaO19lcgQMAUXteagD4dF6AwwccH8xVsbf56TwqrhN1MIxpsi/BOIncLYz
 Suv7rA3G8GVATY+5YNM/Y2dcb8ywyieQKbE0EmG9U2LsPJfu00QL/CAt2EU7yFxwTNyg
 ZzDQ==
X-Gm-Message-State: AOAM530TJSqNLYBVaoXz93hddmfqShZvYPolD3ozPenHaeBA/1L26XFX
 YXh/5wjShytrcjoAOj5t+50=
X-Google-Smtp-Source: ABdhPJygjYsZin7lnJ61Xk7tN8Ajfd+LkXB3aIY5KrQ/tbUiVN1ghVgMxSTrTAGQmmN8ZvQkot3ULQ==
X-Received: by 2002:a50:ec89:: with SMTP id e9mr59801846edr.347.1621056283909; 
 Fri, 14 May 2021 22:24:43 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id kt21sm4821487ejb.5.2021.05.14.22.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:24:43 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 08/14] PCI: switchtec: Use sysfs_emit() and sysfs_emit_at()
 in "show" functions
Date: Sat, 15 May 2021 05:24:28 +0000
Message-Id: <20210515052434.1413236-8-kw@linux.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515052434.1413236-1-kw@linux.com>
References: <20210515052434.1413236-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Vidya Sagar <vidyas@nvidia.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joe Perches <joe@perches.com>,
 Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sysfs_emit() and sysfs_emit_at() functions were introduced to make
it less ambiguous which function is preferred when writing to the output
buffer in a device attribute's "show" callback [1].

Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
latter is aware of the PAGE_SIZE buffer and correctly returns the number
of bytes written into the buffer.

No functional change intended.

[1] Documentation/filesystems/sysfs.rst

Related to:
  commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")

Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/switch/switchtec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index ba52459928f7..0b301f8be9ed 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -280,7 +280,7 @@ static ssize_t device_version_show(struct device *dev,
 
 	ver = ioread32(&stdev->mmio_sys_info->device_version);
 
-	return sprintf(buf, "%x\n", ver);
+	return sysfs_emit(buf, "%x\n", ver);
 }
 static DEVICE_ATTR_RO(device_version);
 
@@ -292,7 +292,7 @@ static ssize_t fw_version_show(struct device *dev,
 
 	ver = ioread32(&stdev->mmio_sys_info->firmware_version);
 
-	return sprintf(buf, "%08x\n", ver);
+	return sysfs_emit(buf, "%08x\n", ver);
 }
 static DEVICE_ATTR_RO(fw_version);
 
@@ -344,7 +344,7 @@ static ssize_t component_vendor_show(struct device *dev,
 
 	/* component_vendor field not supported after gen3 */
 	if (stdev->gen != SWITCHTEC_GEN3)
-		return sprintf(buf, "none\n");
+		return sysfs_emit(buf, "none\n");
 
 	return io_string_show(buf, &si->gen3.component_vendor,
 			      sizeof(si->gen3.component_vendor));
@@ -359,9 +359,9 @@ static ssize_t component_id_show(struct device *dev,
 
 	/* component_id field not supported after gen3 */
 	if (stdev->gen != SWITCHTEC_GEN3)
-		return sprintf(buf, "none\n");
+		return sysfs_emit(buf, "none\n");
 
-	return sprintf(buf, "PM%04X\n", id);
+	return sysfs_emit(buf, "PM%04X\n", id);
 }
 static DEVICE_ATTR_RO(component_id);
 
@@ -373,9 +373,9 @@ static ssize_t component_revision_show(struct device *dev,
 
 	/* component_revision field not supported after gen3 */
 	if (stdev->gen != SWITCHTEC_GEN3)
-		return sprintf(buf, "255\n");
+		return sysfs_emit(buf, "255\n");
 
-	return sprintf(buf, "%d\n", rev);
+	return sysfs_emit(buf, "%d\n", rev);
 }
 static DEVICE_ATTR_RO(component_revision);
 
@@ -384,7 +384,7 @@ static ssize_t partition_show(struct device *dev,
 {
 	struct switchtec_dev *stdev = to_stdev(dev);
 
-	return sprintf(buf, "%d\n", stdev->partition);
+	return sysfs_emit(buf, "%d\n", stdev->partition);
 }
 static DEVICE_ATTR_RO(partition);
 
@@ -393,7 +393,7 @@ static ssize_t partition_count_show(struct device *dev,
 {
 	struct switchtec_dev *stdev = to_stdev(dev);
 
-	return sprintf(buf, "%d\n", stdev->partition_count);
+	return sysfs_emit(buf, "%d\n", stdev->partition_count);
 }
 static DEVICE_ATTR_RO(partition_count);
 
-- 
2.31.1

