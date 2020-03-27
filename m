Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7BC197424
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:57:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMDF1vklzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=iMjl+0uX; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7T5VcTzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:52:53 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 277FA2DC684C;
 Mon, 30 Mar 2020 16:52:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547567;
 bh=/c0sygyGptvZJ7mjxJ2I2ERy9RY2BO4lgAUmGcAOvOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iMjl+0uXIk2WsRYFK7QMnoeZwiXtbQvngMc30HklM7M/UaYiwbRU0QE9+G/GnjCpF
 6TnIi2bluBUjI33oB/IGG++wI53XGTIwCq5K0VlcVhmAbh8fhf/pZM4Ced6P4QxUan
 4mCoqUpqEQuPXCesRSY06c5qvKiv1LsP8cfIca3WUYgQYOJ/q/s8LwSNJX9HBkkIhn
 gDlQa2bD02tm9GPOYMeF42o7Bj/XBxnHbDvb+sZWgfzyMO+XkIa7CR1jZ4i6HRAFM+
 YbdnR295TH0kUDCjW5WeNmhPseRb1h1xcrGkr1E7ZJs7ZsylKwzALmMvOAhH9LL5vq
 3sSEcN0wjhm82H8oqQYmkz6pFE9Ngz7Yk7lRcCnGpzQVRWYRpVTksaPYJsbD/6F8t2
 MetLhu1IrJSl7OBndz4jJBgg6mmUQXdE5qPmzLqjrTwMXPbnNkvRn55MI0MKPAsiA2
 v3UhZHqDsS3yj8k9ftzhbgmpM9o3tilShHFLuLa6EEPGAyGhkC0JmK4UJSSU4vuBsl
 DAAPAo9W0AH+Quua6imoMGuoYzJ2F3ro6L2zDSZSLZw6BC3GtyzRpLXvgZ5C/FjG+f
 tIZ+HRu9YYQm06ECg8BUrm41v1jxxG21JM4D7E34KQMuRdIJeivVBNTbxAwVDV35Ax
 wfbVKJDpJWOjuCjbEN7nnoZA=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Au045934;
 Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 21/25] nvdimm/ocxl: Implement the heartbeat command
Date: Fri, 27 Mar 2020 18:11:58 +1100
Message-Id: <20200327071202.2159885-22-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The heartbeat admin command is a simple admin command that exercises
the communication mechanisms within the controller.

This patch issues a heartbeat command to the card during init to ensure
we can communicate with the card's controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 drivers/nvdimm/ocxl/main.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index a4315472683c..2fbe3f2f77d9 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -272,6 +272,30 @@ static int setup_command_metadata(struct ocxlpmem *ocxlpmem)
 	return 0;
 }
 
+/**
+ * heartbeat() - Issue a heartbeat command to the controller
+ * @ocxlpmem: the device metadata
+ * Return: 0 if the controller responded correctly, negative on error
+ */
+static int heartbeat(struct ocxlpmem *ocxlpmem)
+{
+	int rc;
+
+	mutex_lock(&ocxlpmem->admin_command.lock);
+
+	rc = admin_command_execute(ocxlpmem, ADMIN_COMMAND_HEARTBEAT);
+	if (rc < 0)
+		goto out;
+	if (rc != STATUS_SUCCESS)
+		warn_status(ocxlpmem, "Unexpected status from heartbeat", rc);
+
+	(void)admin_response_handled(ocxlpmem);
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
 /**
  * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
  * @ocxlpmem: the device metadata
@@ -1460,6 +1484,12 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err;
 	}
 
+	rc = heartbeat(ocxlpmem);
+	if (rc) {
+		dev_err(&pdev->dev, "Heartbeat failed\n");
+		goto err;
+	}
+
 	elapsed = 0;
 	timeout = ocxlpmem->readiness_timeout +
 		  ocxlpmem->memory_available_timeout;
-- 
2.24.1

