Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 125081991A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:20:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s3j319BSzDr0L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:20:55 +1100 (AEDT)
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
 header.s=201810a header.b=U1kOlzbc; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s3DX2ZVYzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:59:40 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id B7AE42DC6862;
 Mon, 30 Mar 2020 16:52:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547577;
 bh=4KPkiBrQsWsmYoMNYfJ6CRmop/RAcelGM+uqf1omm5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U1kOlzbcYmJhAT6doXL3ZKT3NhzezXd8Adxt/k4bk3c5thHUwDs4uREOOI27nDbjV
 kz7wvAggzCzWys4yKv+Ogcmt6/5Xdt9SsfLHWQF8grRtdLRT0WX/t5vVGNP4IKLfmd
 0OJ6goSBTWtgeELXe2wvVXCEBP8BPlBWhnarkWKw2TBMkblAjgbBrXi6MX+n4yYihQ
 dmDNxIcQsURnxUxNDaqYNmWSf8sX9jYzxgEr9mOcOdh+ftNrra5tB4sEvIoRSwUlDw
 uMFeVRAM8uPL/gLJDsihGP+IwD/CNrHB+LUCWkgTvZXFavZo/9B9iQxb3DaBImYffQ
 jo7EPoX5eiZwotzQVqXUFxRvkM+fZfQ74YOsi/XxTetqDGOUGjafjGqU19V4ebr5jm
 HWOTZq4PS7Q7pbrdYwUnOijgKH8UQtksQChY1yHdcL4NGjFA5Y1UGeCuX85c2XJ9B0
 KpGqivVPZaBjc0uhHo6Js2SVbTCI+fzt/dayrT+l1foyzt4RyFv94nEU1mFlS4WU+W
 LU30wVxtLy7xCwMpJZSq5+OPSiqbwuSc4Bxgsy1k3iHqIweQig/kC7sPU9skD2N3gm
 1GfzJKiT1EdnZZe7fvViYU5C11/8T7ZHhoNrCFR8YehNvbOj0S07rLu3M1BOGZ26rG
 Y1QXb2QA0t6LcEx40ICwDKDY=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Aq045934;
 Fri, 27 Mar 2020 18:12:18 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 17/25] nvdimm/ocxl: Add controller dump IOCTLs
Date: Fri, 27 Mar 2020 18:11:54 +1100
Message-Id: <20200327071202.2159885-18-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:18 +1100 (AEDT)
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

This patch adds IOCTLs to allow userspace to request & fetch dumps
of the internal controller state.

This is useful during debugging or when a fatal error on the controller
has occurred.

The expected flow of operations are:
1. IOCTL_OCXL_PMEM_CONTROLLER_DUMP to request the controller to take
   a dump. This IOCTL will complete after the dump is available for
   collection.
2. IOCTL_OCXL_PMEM_CONTROLLER_DUMP_DATA called repeatedly to fetch
   chunks from the buffer
3. IOCTL_OCXL_PMEM_CONTROLLER_DUMP_COMPLETE to notify the controller
   that it can free any internal resources used for the dump

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/main.c     | 161 +++++++++++++++++++++++++++++++++
 include/uapi/nvdimm/ocxlpmem.h |  16 ++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index e6be0029f658..d0db358ded43 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -566,6 +566,153 @@ static int ioctl_error_log(struct ocxlpmem *ocxlpmem,
 	return 0;
 }
 
+/**
+ * controller_dump_header_parse() - Parse the first 64 bits of the controller dump command response
+ * @ocxlpmem: the device metadata
+ * @length: out, returns the number of bytes in the response (excluding the 64 bit header)
+ */
+static int controller_dump_header_parse(struct ocxlpmem *ocxlpmem, u16 *length)
+{
+	int rc;
+	u64 val;
+	u16 data_identifier;
+	u32 data_length;
+
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+				     ocxlpmem->admin_command.data_offset,
+				     OCXL_LITTLE_ENDIAN, &val);
+	if (rc)
+		return rc;
+
+	data_identifier = val >> 48;
+	data_length = val & 0xFFFF;
+
+	if (data_identifier != 0x4344) { // 'CD'
+		dev_err(&ocxlpmem->dev,
+			"Bad data identifier for error log data, expected 'CD', got '%2s' (%#x), data_length=%u\n",
+			(char *)&data_identifier,
+			(unsigned int)data_identifier, data_length);
+		return -EINVAL;
+	}
+
+	*length = data_length;
+	return 0;
+}
+
+static int ioctl_controller_dump_data(struct ocxlpmem *ocxlpmem,
+				      struct ioctl_ocxlpmem_controller_dump_data __user *uarg)
+{
+	struct ioctl_ocxlpmem_controller_dump_data args;
+	u64 __user *buf;
+	u16 i, buf_size;
+	u64 val;
+	int rc;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	if (args.buf_size % sizeof(u64))
+		return -EINVAL;
+
+	if (args.buf_size > ocxlpmem->admin_command.data_size)
+		return -EINVAL;
+
+	buf = (u64 *)args.buf_ptr;
+
+	mutex_lock(&ocxlpmem->admin_command.lock);
+
+	val = ((u64)args.offset) << 32;
+	val |= args.buf_size;
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
+				      ocxlpmem->admin_command.request_offset + 0x08,
+				      OCXL_LITTLE_ENDIAN, val);
+	if (rc)
+		goto out;
+
+	rc = admin_command_execute(ocxlpmem, ADMIN_COMMAND_CONTROLLER_DUMP);
+	if (rc)
+		goto out;
+	if (rc != STATUS_SUCCESS) {
+		warn_status(ocxlpmem,
+			    "Unexpected status from controller dump",
+			    rc);
+		goto out;
+	}
+
+	rc = controller_dump_header_parse(ocxlpmem, &buf_size);
+	if (rc)
+		goto out;
+
+	buf_size = min((u16)(buf_size + sizeof(u64)), args.buf_size);
+
+	for (i = 0; i < buf_size / sizeof(u64); i++) {
+		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+					     ocxlpmem->admin_command.data_offset +
+							i * sizeof(u64),
+					     OCXL_HOST_ENDIAN, &val);
+		if (rc)
+			goto out;
+
+		if (copy_to_user(&buf[i], &val, sizeof(u64))) {
+			rc = -EFAULT;
+			goto out;
+		}
+	}
+
+	args.buf_size = buf_size;
+
+	if (copy_to_user(uarg, &args, sizeof(args))) {
+		rc = -EFAULT;
+		goto out;
+	}
+
+	rc = admin_response_handled(ocxlpmem);
+	if (rc)
+		goto out;
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
+int request_controller_dump(struct ocxlpmem *ocxlpmem)
+{
+	int rc;
+	u64 busy = 1;
+
+	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIC,
+				    OCXL_LITTLE_ENDIAN,
+				    GLOBAL_MMIO_CHI_CDA);
+	if (rc)
+		return rc;
+
+	rc = ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
+				    OCXL_LITTLE_ENDIAN,
+				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP);
+	if (rc)
+		return rc;
+
+	while (busy) {
+		rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+					     GLOBAL_MMIO_HCI,
+					     OCXL_LITTLE_ENDIAN, &busy);
+		if (rc)
+			return rc;
+
+		busy &= GLOBAL_MMIO_HCI_CONTROLLER_DUMP;
+		cond_resched();
+	}
+
+	return 0;
+}
+
+static int ioctl_controller_dump_complete(struct ocxlpmem *ocxlpmem)
+{
+	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
+				    OCXL_LITTLE_ENDIAN,
+				    GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED);
+}
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -576,7 +723,21 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 		rc = ioctl_error_log(ocxlpmem,
 				     (struct ioctl_ocxlpmem_error_log __user *)args);
 		break;
+
+	case IOCTL_OCXLPMEM_CONTROLLER_DUMP:
+		rc = request_controller_dump(ocxlpmem);
+		break;
+
+	case IOCTL_OCXLPMEM_CONTROLLER_DUMP_DATA:
+		rc = ioctl_controller_dump_data(ocxlpmem,
+						(struct ioctl_ocxlpmem_controller_dump_data __user *)args);
+		break;
+
+	case IOCTL_OCXLPMEM_CONTROLLER_DUMP_COMPLETE:
+		rc = ioctl_controller_dump_complete(ocxlpmem);
+		break;
 	}
+
 	return rc;
 }
 
diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
index 5d3a03ea1e08..05e2b3f7b27c 100644
--- a/include/uapi/nvdimm/ocxlpmem.h
+++ b/include/uapi/nvdimm/ocxlpmem.h
@@ -38,9 +38,25 @@ struct ioctl_ocxlpmem_error_log {
 	__u64 reserved2[2];
 };
 
+struct ioctl_ocxlpmem_controller_dump_data {
+	__u64 buf_ptr; /* coerced pointer to output buffer */
+	__u16 buf_size; /* in/out, buffer size provided/required.
+			 * If required is greater than provided, the buffer
+			 * will be truncated to the amount provided. If its
+			 * less, then only the required bytes will be populated.
+			 * If it is 0, then there is no more dump data available.
+			 */
+	__u16 reserved0;
+	__u32 offset; /* in, Offset within the dump */
+	__u64 reserved[8];
+};
+
 /* ioctl numbers */
 #define OCXLPMEM_MAGIC 0xCA
 /* OpenCAPI Persistent memory devices */
 #define IOCTL_OCXLPMEM_ERROR_LOG			_IOWR(OCXLPMEM_MAGIC, 0x30, struct ioctl_ocxlpmem_error_log)
+#define IOCTL_OCXLPMEM_CONTROLLER_DUMP			_IO(OCXLPMEM_MAGIC, 0x31)
+#define IOCTL_OCXLPMEM_CONTROLLER_DUMP_DATA		_IOWR(OCXLPMEM_MAGIC, 0x32, struct ioctl_ocxlpmem_controller_dump_data)
+#define IOCTL_OCXLPMEM_CONTROLLER_DUMP_COMPLETE		_IO(OCXLPMEM_MAGIC, 0x33)
 
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

