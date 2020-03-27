Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AE199232
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:25:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s3pK4fJlzDqKq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:25:29 +1100 (AEDT)
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
 header.s=201810a header.b=WEAkgqy8; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s3Dd4SgJzDqnR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 19:59:45 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 709922DC6863;
 Mon, 30 Mar 2020 16:52:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585547579;
 bh=/ca1KYpFanyYMVbs68dr19xdKxkz41V0vgTQ9aYJwrk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WEAkgqy8sYoMNXNSHtEMHgFyUhgF7eswqGIzw5cTL9d8Ce/mAiuF+j3x6UsLKfeCJ
 sKdZc2iP7tvcfSfPjHmM5V72eHMWyvPdp7/ls+jgJF3WTd81TsaF4PPVObcERiLV61
 hiNs5FJcPjagQHqbTXyR15J5ngFd+eo6SsOLV0X8YkpTsMEm0ICDvFiSfEiuay91kn
 4ohxvdABPi+smiQm+O9dLWUxRXXz3jk1VFkHIcC+iC8yftoAlg/6XGbxqSs08xQu9A
 55RvHF+bmzPvzR3igzK2spwG9M3j9SURWqI7vlJXLMHk9HAlN1q/5Jdh/G5VOSaHJ1
 88QkO+qFKB48gAQ8Z9DkVMS5xIXff17UEwjngE3ppAKkQotDdHDo6o7O8ksTciapJW
 djlsNB+lf1rFQLBA29PqyfwXkZwEFhVhgTDCCbc0a8ga7B0O85V+VqzuT4ODU2bPdd
 ocBKT+GnvkXD3nwPqVZ39v0lOsGIAb5Bgly9fNCf1+DugXZQMjoBHNinZ1XefGz02V
 93blURIhnMD1Nk1FodnmCjbywYdB6f2mRb+jEwqvcQogdJN7xE+qxXW3kpuvBeU5dX
 NrokEv2reY/lK0p+vku/YE1ZckI+CDcB+Tjt2inhEyRDDJftojDu7CjT6J9Q/6B0rn
 VwiJrr14r7AX8jm6PdMRVxvc=
Received: from localhost.lan ([10.0.1.179])
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTP id 02R7C4Av045934;
 Fri, 27 Mar 2020 18:12:19 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: alastair@d-silva.org
Subject: [PATCH v4 22/25] nvdimm/ocxl: Add debug IOCTLs
Date: Fri, 27 Mar 2020 18:11:59 +1100
Message-Id: <20200327071202.2159885-23-alastair@d-silva.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327071202.2159885-1-alastair@d-silva.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 27 Mar 2020 18:12:20 +1100 (AEDT)
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

These IOCTLs provide low level access to the card to aid in debugging
controller/FPGA firmware.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/nvdimm/ocxl/Kconfig    |   6 +
 drivers/nvdimm/ocxl/main.c     | 198 +++++++++++++++++++++++++++++++++
 drivers/nvdimm/ocxl/ocxlpmem.h |   2 +-
 include/uapi/nvdimm/ocxlpmem.h |  31 ++++++
 4 files changed, 236 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/ocxl/Kconfig b/drivers/nvdimm/ocxl/Kconfig
index c5d927520920..3f44429d70c9 100644
--- a/drivers/nvdimm/ocxl/Kconfig
+++ b/drivers/nvdimm/ocxl/Kconfig
@@ -12,4 +12,10 @@ config OCXL_PMEM
 
 	  Select N if unsure.
 
+config OCXL_PMEM_DEBUG
+	bool "OpenCAPI Persistent Memory debugging"
+	depends on OCXL_PMEM
+	help
+	  Enables low level IOCTLs for OpenCAPI Persistent Memory firmware development
+
 endif
diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
index 2fbe3f2f77d9..2811bf7efbab 100644
--- a/drivers/nvdimm/ocxl/main.c
+++ b/drivers/nvdimm/ocxl/main.c
@@ -1027,6 +1027,183 @@ int req_controller_health_perf(struct ocxlpmem *ocxlpmem)
 				      GLOBAL_MMIO_HCI_REQ_HEALTH_PERF);
 }
 
+#ifdef CONFIG_OCXL_PMEM_DEBUG
+/**
+ * enable_fwdebug() - Enable FW debug on the controller
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+static int enable_fwdebug(const struct ocxlpmem *ocxlpmem)
+{
+	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
+				      OCXL_LITTLE_ENDIAN,
+				      GLOBAL_MMIO_HCI_FW_DEBUG);
+}
+
+/**
+ * disable_fwdebug() - Disable FW debug on the controller
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+static int disable_fwdebug(const struct ocxlpmem *ocxlpmem)
+{
+	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCIC,
+				      OCXL_LITTLE_ENDIAN,
+				      GLOBAL_MMIO_HCI_FW_DEBUG);
+}
+
+static int ioctl_fwdebug(struct ocxlpmem *ocxlpmem,
+			 struct ioctl_ocxl_pmem_fwdebug __user *uarg)
+{
+	struct ioctl_ocxl_pmem_fwdebug args;
+	u64 val;
+	int i;
+	int rc;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	// Buffer size must be a multiple of 8
+	if ((args.buf_size & 0x07))
+		return -EINVAL;
+
+	if (args.buf_size > ocxlpmem->admin_command.data_size)
+		return -EINVAL;
+
+	mutex_lock(&ocxlpmem->admin_command.lock);
+
+	rc = enable_fwdebug(ocxlpmem);
+	if (rc)
+		goto out;
+
+	// Write DebugAction & FunctionCode
+	val = ((u64)args.debug_action << 56) | ((u64)args.function_code << 40);
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
+				      ocxlpmem->admin_command.request_offset + 0x08,
+				      OCXL_LITTLE_ENDIAN, val);
+	if (rc)
+		goto out;
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
+				      ocxlpmem->admin_command.request_offset + 0x10,
+				      OCXL_LITTLE_ENDIAN,
+				      args.debug_parameter_1);
+	if (rc)
+		goto out;
+
+	rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
+				      ocxlpmem->admin_command.request_offset + 0x18,
+				      OCXL_LITTLE_ENDIAN,
+				      args.debug_parameter_2);
+	if (rc)
+		goto out;
+
+	// Populate admin command buffer
+	if (args.buf_size) {
+		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
+			u64 val;
+
+			if (copy_from_user(&val, &args.buf[i], sizeof(u64))) {
+				rc = -EFAULT;
+				goto out;
+			}
+
+			rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
+						      ocxlpmem->admin_command.data_offset + i,
+						      OCXL_HOST_ENDIAN, val);
+			if (rc)
+				goto out;
+		}
+	}
+
+	rc = admin_command_execute(ocxlpmem,
+				   ocxlpmem->timeouts[ADMIN_COMMAND_FW_DEBUG]);
+	if (rc < 0)
+		goto out;
+	if (rc != STATUS_SUCCESS) {
+		warn_status(ocxlpmem, "Unexpected status from FW Debug", rc);
+		goto out;
+	}
+
+	if (args.buf_size) {
+		for (i = 0; i < args.buf_size; i += sizeof(u64)) {
+			u64 val;
+
+			rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
+						     ocxlpmem->admin_command.data_offset + i,
+						     OCXL_HOST_ENDIAN, &val);
+			if (rc)
+				goto out;
+
+			if (copy_to_user(&args.buf[i], &val, sizeof(u64))) {
+				rc = -EFAULT;
+				goto out;
+			}
+		}
+	}
+
+	rc = admin_response_handled(ocxlpmem);
+	if (rc)
+		goto out;
+
+	rc = disable_fwdebug(ocxlpmem);
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
+static int ioctl_shutdown(struct ocxlpmem *ocxlpmem)
+{
+	int rc;
+
+	mutex_lock(&ocxlpmem->admin_command.lock);
+
+	rc = admin_command_execute(ocxlpmem, ADMIN_COMMAND_SHUTDOWN);
+	if (rc)
+		goto out;
+
+	rc = admin_response_handled(ocxlpmem);
+
+out:
+	mutex_unlock(&ocxlpmem->admin_command.lock);
+	return rc;
+}
+
+static int ioctl_mmio_write(struct ocxlpmem *ocxlpmem,
+			    struct ioctl_ocxl_pmem_mmio __user *uarg)
+{
+	struct scm_ioctl_mmio args;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	return ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, args.address,
+					OCXL_LITTLE_ENDIAN, args.val);
+}
+
+static int ioctl_mmio_read(struct ocxlpmem *ocxlpmem,
+			   struct ioctl_ocxl_pmem_mmio __user *uarg)
+{
+	struct ioctl_ocxl_pmem_mmio args;
+	int rc;
+
+	if (copy_from_user(&args, uarg, sizeof(args)))
+		return -EFAULT;
+
+	rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, args.address,
+				     OCXL_LITTLE_ENDIAN, &args.val);
+	if (rc)
+		return rc;
+
+	if (copy_to_user(uarg, &args, sizeof(args)))
+		return -EFAULT;
+
+	return 0;
+}
+#endif /* CONFIG_OCXL_PMEM_DEBUG */
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -1068,6 +1245,27 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 	case IOCTL_OCXLPMEM_REQUEST_HEALTH:
 		rc = req_controller_health_perf(ocxlpmem);
 		break;
+
+#ifdef CONFIG_OCXL_PMEM_DEBUG
+	case IOCTL_OCXL_PMEM_FWDEBUG:
+		rc = ioctl_fwdebug(ocxlpmem,
+				   (struct ioctl_ocxl_pmem_fwdebug __user *)args);
+		break;
+
+	case IOCTL_OCXL_PMEM_SHUTDOWN:
+		rc = ioctl_shutdown(ocxlpmem);
+		break;
+
+	case IOCTL_OCXL_PMEM_MMIO_WRITE:
+		rc = ioctl_mmio_write(ocxlpmem,
+				      (struct ioctl_ocxl_pmem_mmio __user *)args);
+		break;
+
+	case IOCTL_OCXL_PMEM_MMIO_READ:
+		rc = ioctl_mmio_read(ocxlpmem,
+				     (struct ioctl_ocxl_pmem_mmio __user *)args);
+		break;
+#endif
 	}
 
 	return rc;
diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
index 01721596f982..c8794e7775ec 100644
--- a/drivers/nvdimm/ocxl/ocxlpmem.h
+++ b/drivers/nvdimm/ocxl/ocxlpmem.h
@@ -158,7 +158,7 @@ int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi);
  *
  * @ocxlpmem: the device metadata
  * @op_code: the code for the admin command
- * Returns 0 on success, -EINVAL for a bad op code, -EBUSY on timeout
+// * Returns 0 on success, -EINVAL for a bad op code, -EBUSY on timeout
  */
 int admin_command_execute(struct ocxlpmem *ocxlpmem, u8 op_code);
 
diff --git a/include/uapi/nvdimm/ocxlpmem.h b/include/uapi/nvdimm/ocxlpmem.h
index 9c5c8585c1c2..374b70690b3a 100644
--- a/include/uapi/nvdimm/ocxlpmem.h
+++ b/include/uapi/nvdimm/ocxlpmem.h
@@ -93,4 +93,35 @@ struct ioctl_ocxlpmem_eventfd {
 #define IOCTL_OCXLPMEM_EVENT_CHECK			_IOR(OCXLPMEM_MAGIC, 0x36, __u64)
 #define IOCTL_OCXLPMEM_REQUEST_HEALTH			_IO(OCXLPMEM_MAGIC, 0x37)
 
+/*
+ * Debug IOCTLs, these are only available if the kernel is compiled with
+ * CONFIG_OCXLPMEM_DEBUG
+ */
+
+#define	OCXLPMEM_FWDEBUG_READ_CONTROLLER_MEMORY	0x01
+#define	OCXLPMEM_FWDEBUG_WRITE_CONTROLLER_MEMORY	0x02
+#define	OCXLPMEM_FWDEBUG_ENABLE_FUNCTION		0x03
+#define	OCXLPMEM_FWDEBUG_DISABLE_FUNCTION		0x04
+#define	OCXLPMEM_FWDEBUG_GET_PEL			0x05 /* Retrieve Persistent Error Log */
+
+struct ioctl_ocxlpmem_fwdebug { /* All args are inputs */
+	__u64 debug_parameter_1;
+	__u64 debug_parameter_2;
+	__u64 buf; /* Coerced pointer to optional in/out data buffer */
+	__u16 debug_action; /* OCXLPMEM_FWDEBUG_... */
+	__u16 function_code;
+	__u16 buf_size; /* Size of optional data buffer */
+	__u16 reserved;
+};
+
+struct ioctl_ocxlpmem_mmio {
+	__u64 address; /* Offset in global MMIO space */
+	__u64 val; /* value to write/was read */
+};
+
+#define IOCTL_OCXLPMEM_FWDEBUG		_IOWR(OCXLPMEM_MAGIC, 0xf0, struct ioctl_ocxlpmem_fwdebug)
+#define IOCTL_OCXLPMEM_MMIO_WRITE	_IOW(OCXLPMEM_MAGIC, 0xf1, struct ioctl_ocxlpmem_mmio)
+#define IOCTL_OCXLPMEM_MMIO_READ	_IOWR(OCXLPMEM_MAGIC, 0xf2, struct ioctl_ocxlpmem_mmio)
+#define IOCTL_OCXLPMEM_SHUTDOWN	_IO(OCXLPMEM_MAGIC, 0xf3)
+
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

