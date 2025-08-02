Return-Path: <linuxppc-dev+bounces-10523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E4B18A78
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Aug 2025 04:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bv6Xc4Nj7z2yGM;
	Sat,  2 Aug 2025 12:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754102512;
	cv=none; b=WMGzsSjpimZyAlrLLIRboQ4Omggk6UErTRsYBTra/flfLZ3bI1S4b8aLrMj+Prd0C7wR+TtYGmrF1nXZTR45Zr3Q/xtttZsMm/NnljvfVrcKx1O7gy9StBHtXK7zdHunnIddA2Yz6vqwCqtrM7ekGkvMr5G4Slxbf3K7hxABOWGsw+IdFaLYJX89W9nGXxe2ImWSDhitBB0q9vHsVrL1Qgp9gLWG8IWRx8Me6Eeyvh2BID8K+EZa4qgdUJ9uPg1TPL4CNCjqOYwGfuuph913UDy+kj/c7FSn5TZa/so2eBkXfHVUioPEbvQDA/PbJu3LcwlEHWRGp6MYTo6t/WTqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754102512; c=relaxed/relaxed;
	bh=KT7U+0HgKMjF8x2h9wc9fJxlPAMNVL3ymYMThd1Yb30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaaWtTzxxiSCFRSKg4uEMylS7TC00mK8tS9DupJnaC2/A30OgiGQHnORtzRNistO4a2m0DuAM/vPrZyF9cv1PsChuMJeqa48YmJ4zyhjOYbFOZn5dCdfWOa0Q62woe9Jl+wqs3D5yfwKLWBvufbTkFpp/Y73x1d80WwRrF6k6KvHq6QzTycjRet4RRKBxuM5thhdv2N3VpLCHZkIfkNOJaRoqHnkKw1Vs7q1c4j1CNzpcY4yWD9v98LnSF4CcwnMwegPMbSoftaYl+dH0xv/RSOch3wxQXKQ+iwbUFuzLrndsnaPYA8mYvnRl+ZEwHw9ZQBg9M0Mp3OjdRmjHmaKUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tY/eSmAC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tY/eSmAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bv6Xb0Kxrz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Aug 2025 12:41:50 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5720VFHp002283;
	Sat, 2 Aug 2025 02:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KT7U+0
	HgKMjF8x2h9wc9fJxlPAMNVL3ymYMThd1Yb30=; b=tY/eSmACLT+/sO1SfP4jk/
	NxhOCMU5zaztG9/qEAkRR4eclZvhEE/zMiV1+H6q0i3PbUPLOb8SqAe+RQOd9K6p
	/fLVDUo2QKuo89yql4rGkRHPCh9I4MXuxEljIwABj8HarlzBTWh+aGpvrDtPTqUy
	dHw7UeI3/x8x2pI968ZtQLj9Zp7e+lLy2KMh3TwtDGTwW3LUDwK0L7acGbtDTDYi
	ISFq/MHbZ5ksjN6SxWyrXJzFV+1ib6dUiU/Xw2ZnnlxXsOeNb3iR+A/uObjzUJ0+
	hJCe76MhoPctvv4jykKZYU2QsAzLdRiNGkA4nn1UXhPS6TDyLTjv4utgFW6SfGqg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6ja1qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571Lx1gq017950;
	Sat, 2 Aug 2025 02:41:42 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4859bu47mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Aug 2025 02:41:42 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5722feCS15991484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Aug 2025 02:41:40 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14B085805B;
	Sat,  2 Aug 2025 02:41:40 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28C775804B;
	Sat,  2 Aug 2025 02:41:39 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.171.135])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Aug 2025 02:41:39 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        haren@linux.ibm.com
Subject: [PATCH 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
Date: Fri,  1 Aug 2025 19:41:13 -0700
Message-ID: <20250802024121.955274-4-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250802024121.955274-1-haren@linux.ibm.com>
References: <20250802024121.955274-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vuLy0yZO6WKwsI_9j0UNCizkXBBqfE2M
X-Authority-Analysis: v=2.4 cv=Mbtsu4/f c=1 sm=1 tr=0 ts=688d7ae7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=9X03w9twKgsaiV_2yKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vuLy0yZO6WKwsI_9j0UNCizkXBBqfE2M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDAxOCBTYWx0ZWRfX5+ajDsLWDODo
 wtFWB6zbyR93DPEsxlZWyzFSJ+7sgn3q6yg2OEGqv0nfhnWjMglfMYzmBEaeTdeTWRplWCF6y80
 oCx5TuT9d6lL44FM6ZStrWy00FcNV8NtNgeq3phzcD8gdr80cL5fcPdPBVuD8uHEenpXLQTvLPn
 DoHDGjT7rJS/Q/zK8eTbomQqZBNlUJyLd278qq5o0g7lLeO2hIXyirSUGK/a47y8x5uRZ+lDEEx
 ltBy2d+P5gey/UDcExn1McbTBFKmHHXbZGNSyYG76q4iy7ezkKBir3IMxrvaL/yfOnVU27HJOvz
 3lmJemOMRxdl+Yu1seX5+c32Fj22aFqkE1bR4pnk20VQQDOXyPSq70OLe3RtNbYWspkOJqsL3Ud
 sOgX53F94LJBVSdi0QY1R7TJypgZaazc0lv+GCRUMkLzLbDnH32G7FdSY+GfpXA3i+7bA/Q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The hypervisor provides ibm,send-hvpipe-msg and
ibm,receive-hvpipe-msg RTAS calls which can be used by the
partition to communicate through an inband hypervisor channel with
different external sources such as Hardware Management Console
(HMC). The information exchanged, whether it be messages, raw or
formatted data, etc., is only known to between applications in the
OS and the source (HMC). This patch adds papr-hvpipe character
driver and provides the standard interfaces such as open / ioctl/
read / write to user space for exchanging information with HMC
using send/recevive HVPIPE RTAS functions.

PAPR (7.3.32 Hypervisor Pipe Information Exchange) defines the
HVPIPE usage:
- The hypervisor has one HVPIPE per partition for all sources.
- OS can determine this feature’s availability by detecting the
  “ibm,hypervisor-pipe-capable” property in the /rtas node of the
  device tree.
- Each source is represented by the source ID which is used in
  send / recv HVPIPE RTAS. (Ex: source ID is the target for the
  payload in send RTAS).
- Return status of ibm,send-hvpipe-msg can be considered as
  delivered the payload.
- Return status of ibm,receive-hvpipe-msg can be considered as
  ACK to source.
- The hypervisor generates hvpipe message event interrupt when
  the partition has the payload to receive.

Provide the interfaces to the user space with /dev/papr-hvpipe
character device using the following programming model:

int devfd = open("/dev/papr-hvpipe")
int fd = ioctl(devfd, PAPR_HVPIPE_IOC_CREATE_HANDLE, &srcID);
- Restrict the user space to use the same source ID and do not
  expect more than one process access with the same source.
char *buf = malloc(size);
- SIZE should be 4K and the buffer contains header and the
  payload.
length = write(fd, buf, size);
- OS issues ibm,send-hvpipe-msg RTAS and returns the RTAS status
  to the user space.
ret = poll(fd,...)
- The HVPIPE event message IRQ wakes up for any waiting FDs.
length = read(fd, buf, size);
- OS issues ibm,receive-hvpipe-msg to receive payload from the
  hypervisor.
release(fd);
- OS issues ibm,receive-hvpipe-msg if any payload is pending so
  that pipe is not blocked.

The actual implementation of these calls are added in the
next patches.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile      |   1 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 274 +++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 +
 3 files changed, 289 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 57222678bb3f..931ebaa474c8 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -5,6 +5,7 @@ obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o rtas-work-area.o papr-sysparm.o \
 			   papr-rtas-common.o papr-vpd.o papr-indices.o \
 			   papr-platform-dump.o papr-phy-attest.o \
+			   papr-hvpipe.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
new file mode 100644
index 000000000000..5768d072859d
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "papr-hvpipe: " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/delay.h>
+#include <linux/anon_inodes.h>
+#include <linux/miscdevice.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/poll.h>
+#include <linux/of.h>
+#include <asm/machdep.h>
+#include <asm/rtas.h>
+#include <uapi/asm/papr-hvpipe.h>
+#include "pseries.h"
+#include "papr-hvpipe.h"
+
+static DEFINE_SPINLOCK(hvpipe_src_list_lock);
+static LIST_HEAD(hvpipe_src_list);
+
+/*
+ * New PowerPC FW provides support for partitions and various
+ * sources (Ex: remote hardware management console (HMC)) to
+ * exchange information through an inband hypervisor channel
+ * called HVPIPE. Only HMCs are supported right now and
+ * partitions can communicate with multiple HMCs and each
+ * source represented by source ID.
+ *
+ * FW introduces send HVPIPE and recv HVPIPE RTAS calls for
+ * partitions to send and receive payloads respectively.
+ *
+ * These RTAS functions have the following certain requirements
+ * / limitations:
+ * - One hvpipe per partition for all sources.
+ * - Assume the return status of send HVPIPE as delivered to source
+ * - Assume the return status of recv HVPIPE as ACK to source
+ * - Generates HVPIPE event message when the payload is ready
+ *   for the partition. The hypervisor will not deliver another
+ *   event until the partition read the previous payload which
+ *   means the pipe is blocked for any sources.
+ *
+ * Linux implementation:
+ * Follow the similar interfaces that the OS has for other RTAS calls.
+ * ex: /dev/papr-indices, /dev/papr-vpd, etc.
+ * - /dev/papr-hvpipe is available for the user space.
+ * - devfd = open("/dev/papr-hvpipe", ..)
+ * - fd = ioctl(fd,HVPIPE_IOC_CREATE_HANDLE,&srcID)-for each source
+ * - write(fd, buf, size) --> Issue send HVPIPE RTAS call and
+ *   returns size for success or the corresponding error for RTAS
+ *   return code for failure.
+ * - poll(fd,..) -> wakeup FD if the payload is available to read.
+ *   HVPIPE event message handler wakeup FD based on source ID in
+ *   the event message
+ * - read(fd, buf, size) --> Issue recv HVPIPE RTAS call and
+ *   returns size for success or the corresponding error for RTAS
+ *   return code for failure.
+ */
+
+static struct hvpipe_source_info *hvpipe_find_source(u32 srcID)
+{
+	struct hvpipe_source_info *src_info;
+
+	list_for_each_entry(src_info, &hvpipe_src_list, list)
+		if (src_info->srcID == srcID)
+			return src_info;
+
+	return NULL;
+}
+
+/*
+ * papr_hvpipe_handle_write -  Issue send HVPIPE RTAS and return
+ * the RTAS status to the user space
+ */
+static ssize_t papr_hvpipe_handle_write(struct file *file,
+	const char __user *buf, size_t size, loff_t *off)
+{
+	struct hvpipe_source_info *src_info = file->private_data;
+
+	if (!src_info)
+		return -EIO;
+
+	return 0;
+}
+
+/*
+ * papr_hvpipe_handle_read - If the payload for the specific
+ * source is pending in the hypervisor, issue recv HVPIPE RTAS
+ * and return the payload to the user space.
+ *
+ * When the payload is available for the partition, the
+ * hypervisor notifies HVPIPE event with the source ID
+ * and the event handler wakeup FD(s) that are waiting.
+ */
+static ssize_t papr_hvpipe_handle_read(struct file *file,
+		char __user *buf, size_t size, loff_t *off)
+{
+
+	struct hvpipe_source_info *src_info = file->private_data;
+
+	if (!src_info)
+		return -EIO;
+
+	return 0;
+}
+
+/*
+ * The user space waits for the payload to receive.
+ * The hypervisor sends HVPIPE event message to the partition
+ * when the payload is available. The event handler wakeup FD
+ * depends on the source ID in the message event.
+ */
+static unsigned int papr_hvpipe_handle_poll(struct file *filp,
+		struct poll_table_struct *wait)
+{
+	struct hvpipe_source_info *src_info = filp->private_data;
+
+	if (!src_info)
+		return -EIO;
+
+	return 0;
+}
+
+static int papr_hvpipe_handle_release(struct inode *inode,
+				struct file *file)
+{
+	struct hvpipe_source_info *src_info;
+
+	/*
+	 * Hold the lock, remove source from src_list, reset the
+	 * hvpipe status and release the lock to prevent any race
+	 * with message event IRQ.
+	 */
+	spin_lock(&hvpipe_src_list_lock);
+	src_info = file->private_data;
+	list_del(&src_info->list);
+	file->private_data = NULL;
+	spin_unlock(&hvpipe_src_list_lock);
+	kfree(src_info);
+	return 0;
+}
+
+static const struct file_operations papr_hvpipe_handle_ops = {
+	.read		=	papr_hvpipe_handle_read,
+	.write		=	papr_hvpipe_handle_write,
+	.release	=	papr_hvpipe_handle_release,
+	.poll		=	papr_hvpipe_handle_poll,
+};
+
+static int papr_hvpipe_dev_create_handle(u32 srcID)
+{
+	struct hvpipe_source_info *src_info;
+	struct file *file;
+	long err;
+	int fd;
+
+	spin_lock(&hvpipe_src_list_lock);
+	/*
+	 * Do not allow more than one process communicates with
+	 * each source.
+	 */
+	src_info = hvpipe_find_source(srcID);
+	if (src_info) {
+		spin_unlock(&hvpipe_src_list_lock);
+		pr_err("pid(%d) is already using the source(%d)\n",
+				src_info->tsk->pid, srcID);
+		return -EALREADY;
+	}
+	spin_unlock(&hvpipe_src_list_lock);
+
+	src_info = kzalloc(sizeof(*src_info), GFP_KERNEL_ACCOUNT);
+	if (!src_info)
+		return -ENOMEM;
+
+	src_info->srcID = srcID;
+	src_info->tsk = current;
+	init_waitqueue_head(&src_info->recv_wqh);
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		err = fd;
+		goto free_buf;
+	}
+
+	file = anon_inode_getfile("[papr-hvpipe]",
+			&papr_hvpipe_handle_ops, (void *)src_info,
+			O_RDWR);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto put_fd;
+	}
+
+	fd_install(fd, file);
+
+	spin_lock(&hvpipe_src_list_lock);
+	list_add(&src_info->list, &hvpipe_src_list);
+	spin_unlock(&hvpipe_src_list_lock);
+
+	return fd;
+
+put_fd:
+	put_unused_fd(fd);
+free_buf:
+	kfree(src_info);
+	return err;
+}
+
+/*
+ * Top-level ioctl handler for /dev/papr_hvpipe
+ *
+ * Use separate FD for each source (exa :HMC). So ioctl is called
+ * with source ID which returns FD.
+ */
+static long papr_hvpipe_dev_ioctl(struct file *filp, unsigned int ioctl,
+		unsigned long arg)
+{
+	u32 __user *argp = (void __user *)arg;
+	u32 srcID;
+	long ret;
+
+	if (get_user(srcID, argp))
+		return -EFAULT;
+
+	/*
+	 * Support only HMC source right now
+	 */
+	if (!(srcID & HVPIPE_HMC_ID_MASK))
+		return -EINVAL;
+
+	switch (ioctl) {
+	case PAPR_HVPIPE_IOC_CREATE_HANDLE:
+		ret = papr_hvpipe_dev_create_handle(srcID);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations papr_hvpipe_ops = {
+	.unlocked_ioctl	=	papr_hvpipe_dev_ioctl,
+};
+
+static struct miscdevice papr_hvpipe_dev = {
+	.minor	=	MISC_DYNAMIC_MINOR,
+	.name	=	"papr-hvpipe",
+	.fops	=	&papr_hvpipe_ops,
+};
+
+static int __init papr_hvpipe_init(void)
+{
+	int ret;
+
+	if (!of_find_property(rtas.dev, "ibm,hypervisor-pipe-capable",
+		NULL))
+		return -ENODEV;
+
+	if (!rtas_function_implemented(RTAS_FN_IBM_SEND_HVPIPE_MSG) ||
+		!rtas_function_implemented(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG))
+		return -ENODEV;
+
+	ret = misc_register(&papr_hvpipe_dev);
+	if (ret) {
+		pr_err("misc-dev registration failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+machine_device_initcall(pseries, papr_hvpipe_init);
diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.h b/arch/powerpc/platforms/pseries/papr-hvpipe.h
new file mode 100644
index 000000000000..3b6f9e737913
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _PAPR_HVPIPE_H
+#define _PAPR_HVPIPE_H
+
+#define	HVPIPE_HMC_ID_MASK	0x02000000 /*02-HMC,00-reserved and HMC ID */
+
+struct hvpipe_source_info {
+	struct list_head list;	/* list of sources */
+	u32 srcID;
+	wait_queue_head_t recv_wqh;	 /* wake up poll() waitq */
+	struct task_struct *tsk;
+};
+
+#endif /* _PAPR_HVPIPE_H */
-- 
2.43.5


