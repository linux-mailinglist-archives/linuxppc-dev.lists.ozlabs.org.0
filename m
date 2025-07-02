Return-Path: <linuxppc-dev+bounces-10056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C6AF64E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 00:15:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXZ2j1X9zz30Pn;
	Thu,  3 Jul 2025 08:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751494509;
	cv=none; b=IW4lFmvBiLbhzuhCKrZg0TroolYEi6DWPirB9sI7jF7KSjig3kkWMyMQSe76DlGls/2XmYJnzCL8fIVeZqQMNiKpMw4OfBLTc2CB5fVTRlajd/Stvfnlvm6nk4Bf5YPreChK1rOzEayDL/a7VXsdKnjnBlIJiUYcW3oj1Zw/Z33UtSxnJOopV5P+zSiAiG9vYGY+ZGvu5+kG7W/N6vBqXv9VQ9rzWiMWcScNXLFbWh/6DG3eQpYz+MixZWyl/p0xScdYSfbKVwwVSfJ9bBs0sCg2G4YXC1oPIk7TZGv7wzl2aiaUr+I6da7L8V+Eu1LUXAOTo4lW5eWSZ3zxFqv17A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751494509; c=relaxed/relaxed;
	bh=KT7U+0HgKMjF8x2h9wc9fJxlPAMNVL3ymYMThd1Yb30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkR0MsuBSx+ZpoErWwedDBmbFgGK1lg1a+UKXHwrt3me8S8eB4KJdzuQi49/yLx7H3oHj7zwlYgs+Z6KhKscAmoSHwZ+/yX0MlKH9ikiPcm6N9F9wvcydiIFJbz34tKaKWOi82yW30+CIXcWBiKlEgzzUlKzQpAQv4+KxqmKSro+SJWPNQXNInQYxS4qjKrsPLwhPmfmIyP3/t7YYCJdCYUcJPl7RnYF7bkzR5TUnwXSCS23yoU/OeO2vRFxjIM5X3bwYV9v+qy74dzqXSrLUhuyU4LsttZl44O618lpiyVCCYZ63o6COczKkrl8fh4NPCSjdkQsE6zwFkbDOSe3dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+ht8BD7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+ht8BD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXZ2f2bwFz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 08:15:05 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562KT8DT031002;
	Wed, 2 Jul 2025 22:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=KT7U+0
	HgKMjF8x2h9wc9fJxlPAMNVL3ymYMThd1Yb30=; b=X+ht8BD7uxu816n8p76da5
	PBvsJAILy3gXiH85S1beBurb7bWoRV4PSXCNQmBzuUbSQb0btOl7evinrOPk2yRz
	5KZLwAawDNgEA9+BSS1qTOwyWneb77SlN6XfK8k26zOMy+jswVuB2zpEigGibiQH
	lQ9d26VUxKZHEAFIXh53Z8/EaLRGJJdqAq6sz7k3HwEdfkqHwqvTNnnix1HJjIx5
	E7rrdLcuTyqQjGvAjH8YZFbpEuzHAyHPiSY4LLThWg863TpWZq0SvMZGZoCOt75N
	i8UonH/ObNh3gO7Eld2zDlKOwOEbmRwNNEqsV17uQXXLUXddWmMgbhMT24j26QPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1yy7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 562MEt2n008447;
	Wed, 2 Jul 2025 22:14:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j6u1yy7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562JTFVH021361;
	Wed, 2 Jul 2025 22:14:55 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3hfrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 22:14:55 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562MEq8x14025296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 22:14:52 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC54D58056;
	Wed,  2 Jul 2025 22:14:52 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CECD5803F;
	Wed,  2 Jul 2025 22:14:52 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.17.45])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Jul 2025 22:14:51 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH RFC 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
Date: Wed,  2 Jul 2025 15:14:37 -0700
Message-ID: <20250702221444.879256-4-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250702221444.879256-1-haren@linux.ibm.com>
References: <20250702221444.879256-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: bmDJQcTmCamPUTBs3U0pTBwPGACZlPrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4MSBTYWx0ZWRfXybqxz1caztkL JyBvvAMksVE9Rbk9rriRJU0vZSwKsRXKhnIzqWk/Cn/nqa993HSDMPKS0TpQspdosnmZKwH2cMF cjDCG0JA2uHVXO7J5HK5Z3qKIZe2NnDxIrAwe5FKTdi16FHt9U6mBso61zoUlVIzzAR6Kmm9V/N
 PYxJqmlGsGRmtiAcaCyPCfskNHVB6UZ6DDAKdqXU8xW07rpA/elCYsc/LSoartLNpXv6Er82oCY TJZes84rJo9HsgP8gKWLi41tF5kxEPMb0AJm8sDyaj3mXkWkVCulu8qaC1wJaqB/Qgt5Mt1Ldda QP6BZq1Y4vZcUbYydj+T6ANlXiXV+oO+bf3I1kbomZ34nWLN/fEJmMPpqGDY11wRnjkW3hd47HJ
 SOwB1Vr1tyTsVBw8wB/1dqsq7hUZwjvm9C/wcS6IPom9sWFpmX66RGd3Dxq5E/vCtBgUYLp4
X-Proofpoint-GUID: pArV08TXLjUhxy9HlBdWgOOVBzVdB4yx
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=6865af60 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=9X03w9twKgsaiV_2yKAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020181
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


