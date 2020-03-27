Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091A5197428
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 07:58:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rMG21zpZzDqWY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 16:58:34 +1100 (AEDT)
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
 header.s=201810a header.b=hoY0Amw8; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48rM7b3SJKzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 16:52:59 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 7AF382DC6858;
 Mon, 30 Mar 2020 16:52:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547569;
 bh=g2tKnklWJ8nRzWz5jOb4SQnCXOC8tlA+PKeUIsvkvgs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hoY0Amw8E3jMSf124cMI1wOBWdhV16swXKrVuGoVuKJBlh/3/iI04X2bHZTflwSVT
 rXkGmTHKruF/ots8Q5MKXaWfN0FTpt6tBiDh44ZwOyTu+MjrxVmhH3f+1ZbJvqCY9T
 8p4a6Z+1e0cD086gWlUP0filTlBTCQyDL6L4ikJ5KfcZAd/WFDiTUxYmERPNcQ8LO1
 dVvD31gngYJE56oQA2OMztgkhZwDMSuUyo4rurny1G2ArnKsFgg755eAnzTE+dDBLB
 kusCv/GKPBY04EUChSAd95Z301G9lNDqGLp6YwFYrcwEk/0HugQDFLS/6em0wul/3e
 eJ1lBvVRdTCXPo2EenFtjKu9WVdT3b08+EVkoY7u01Tvsy8RUkHavAhN/EXnGBYy7b
 6teojKsAvPV4TXtwVIlKKXPgk1+euhW7uNgDbDCu4wJ6aVdak6PuZFkaydM7I/Io+x
 GIsf1TuI8RrZUBymhW1SvPuTVpH2iedMZZwDQJKIA9RByNtaLZLszsx59gxS26bFfE
 cWr0XYAzlnA2pq1V4GBMTtfvLJ2bKIFX84BVuPasQ7aB0Gwk8tem7NaxLJAp910yoF
 +lXFcuTaHlxiopdYshGLHOXT1lwOv3FyRkv/jAc2cyQrqp7AdMd/4ovUfT2+/bYZ/C
 er5boYLjD7a0hnoy9MFr6D50=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4At045934;
 Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 20/25] nvdimm/ocxl: Add an IOCTL to request controller
 health & perf data
Date: Fri, 27 Mar 2020 18:11:57 +1100
Message-Id: <20200327071202.2159885-21-alastair@d-silva.org>
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

When health & performance data is requested from the controller,
it responds with an error log containing the requested information.

This patch allows the request to be issued via an IOCTL, the data
can later be collected in userspace via the error log IOCTL introduced
in a previous patch. Userspace will be notified of pending error
logs via an event.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/main.c     | 16 ++++++++++++++++
 include/uapi/nvdimm/ocxlpmem.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index cb6cdc9eb899..a4315472683c 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -991,6 +991,18 @@ static int ioctl_event_check(struct ocxlpmem *ocxlpmem, u64 __user *uarg)
 	return rc;
 }
 
+/**
+ * req_controller_health_perf() - Request controller health & performance data
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+int req_controller_health_perf(struct ocxlpmem *ocxlpmem)
+{
+	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
+				      OCXL_LITTLE_ENDIAN,
+				      GLOBAL_MMIO_HCI_REQ_HEALTH_PERF);
+}
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -1028,6 +1040,10 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 	case IOCTL_OCXLPMEM_EVENT_CHECK:
 		rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
 		break;
+
+	case IOCTL_OCXLPMEM_REQUEST_HEALTH:
+		rc = req_controller_health_perf(ocxlpmem);
+		break;
 	}
 
 	return rc;
diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
index d573bd307e35..9c5c8585c1c2 100644
--- a/include/uapi/nvdimm/ocxlpmem.h
+++ b/include/uapi/nvdimm/ocxlpmem.h
@@ -91,5 +91,6 @@ struct ioctl_ocxlpmem_eventfd {
 #define IOCTL_OCXLPMEM_CONTROLLER_STATS			_IO(OCXLPMEM_MAGIC, 0x34)
 #define IOCTL_OCXLPMEM_EVENTFD				_IOW(OCXLPMEM_MAGIC, 0x35, struct ioctl_ocxlpmem_eventfd)
 #define IOCTL_OCXLPMEM_EVENT_CHECK			_IOR(OCXLPMEM_MAGIC, 0x36, __u64)
+#define IOCTL_OCXLPMEM_REQUEST_HEALTH			_IO(OCXLPMEM_MAGIC, 0x37)
 
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

