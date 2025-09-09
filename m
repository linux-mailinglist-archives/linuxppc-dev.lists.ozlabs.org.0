Return-Path: <linuxppc-dev+bounces-11909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CEEB4A5BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcnM50hFz3ccN;
	Tue,  9 Sep 2025 18:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407463;
	cv=none; b=ToCGLNluO36NBzWwPLeWCbfNEeOknfLR7hx9X1Gd9fVccbMozTU/bHNre4cSUNTt17oJX98ZrL4S4hsTSEgHtglWQEa/1mPXSEcS5pgVKa/iti3eKhWvHUT1uSxpNtlBnZULRb8atbm9yqg7gIohgcok5HurzwPwBXn54+HFzxg8xldm8xFsgWMHqxUZVtxyQ6cTWc4R7YUC+V0zU1LEIQqw0McS/QoUG1QqXF7qzhPLDOSNJLklz69PPcVcPG8RWggQcYrRA85xQsFyyss6rWdJ7aUOssh+dysJ6xNdTzOjXVh4Lc+qnYqCQL2XVX+vKfNbgUx32i4gof/Ud/N+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407463; c=relaxed/relaxed;
	bh=pXXFaMTo0/gB/VKvkPAhCjqFD5Wme0ixXOTzN4XEnRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAFnWJLm+TxQkv0Y+YpWOi6zvBozuDaoobvAnQsu1cjggCWO8In0ypwqt2w7uK85XiXwBSGTIBk8DlnNi2JNnsBWuYRzT9PX6nqvoo6mvmMSqUi5N0mmHo0B3kHlk+1S240PSwxeGTi0g6OP7bA5EpvZ9P5wv6TJ4jJ0U4779awJxblo25scdnzu1x1KZn5UuxAwvaymkLKD0+584+OheBrgbeRHGG1wMTFWhsSOSvZviEBsoqkowrIb9kAYZYMu0/6tiPVV4W4RaKSHYCdOs4rl26ix+40YexMVhD2Dz2blWmupLOsCCeKjNQ1FD7u2PK2dvPuvd9FSqjC55SrnsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TO/JZxw9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TO/JZxw9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcnL12SLz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:44:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5897BQo7011724;
	Tue, 9 Sep 2025 08:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pXXFaM
	To0/gB/VKvkPAhCjqFD5Wme0ixXOTzN4XEnRQ=; b=TO/JZxw9NHORGszOru2Pdp
	BSn8B8tZLusPKfoVedB8hqr+WOVKaQv21iBQ1jjuMXHsOEBjdRmdASiuMpCLnf+T
	4yenI85wWRt8Gh9T1JZdcI1zvsEYs0D80n+Kkz/gqSQBC2gxFLrIHZb5MTCHGhHg
	w0Bss0Nz2y0MexudvUo+oSAfFedqjPSl7vS9nC9R9Z8c3WUyDx3FTK6eT6E6bOUv
	qW4DcHW+wt/hLQSpagXObtM23WWMgo/ZlpBeOfqHqDTlhYGgB7Uh9s2LyRZyCv44
	7v8hZv8n+H0Q1H78kzG1nFNCt19zNcB+2dFEju43F5DEhxAzM6HlfpsdiVaVX2QA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:14 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5897vOQo019194;
	Tue, 9 Sep 2025 08:44:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xycueuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:14 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5895OS8w020465;
	Tue, 9 Sep 2025 08:44:13 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0tbru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:44:13 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898iA2n26739216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:44:11 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFEF758061;
	Tue,  9 Sep 2025 08:44:10 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEF3158057;
	Tue,  9 Sep 2025 08:44:09 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.139.105])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:44:09 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, shashank.gowda@in.ibm.com,
        bjking1@linux.ibm.com
Subject: [PATCH v7 3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
Date: Tue,  9 Sep 2025 01:43:55 -0700
Message-ID: <20250909084402.1488456-4-haren@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909084402.1488456-1-haren@linux.ibm.com>
References: <20250909084402.1488456-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 04aLvaCo7MRweUYo36MWOBR54TWxhZXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX88jHfSBkdm7L
 klHtMNuYADKS2bjsdpof5/FVYm5jBzW8Yn4qUDgAA3l8ZU4q3w7HLpb1HkIFZF52jfiB3IWlUxT
 Nxj4Y2Fo+jd6Bm+NzOdBnGz/8TrC+ylLBac0saZx30S5j9bXEFi1ynrlhHmHO7WCCjfUdwvqG+z
 rMQvTP/FAkmbFFZMCZM62/2YJyo6WkY0WaZGDjjWadczrue9oeu8Nv4R6c29K6xssR4QaBJ5dN4
 WaB0Dx81VozShjM2nlWS0TbnwIKOSc3msl4whEy3iTqWbjNz0+SsHAmRZT4rr64NUczjP/qsK+F
 zSU4WGpjDCapknOs7zUKz6cqn4JiPsRUKMXgFKI6qmp+N5XuSEfI2vMJE6N/57h5O3PXqmOco9u
 kSy4+0RC
X-Proofpoint-GUID: hUSTcRKGyS2IYB-L7WhFq9tVu03_JNbW
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68bfe8df cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=9X03w9twKgsaiV_2yKAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
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
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile      |   1 +
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 285 +++++++++++++++++++
 arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 +
 3 files changed, 300 insertions(+)
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
index 000000000000..aca905189cf2
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -0,0 +1,285 @@
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
+static __poll_t papr_hvpipe_handle_poll(struct file *filp,
+		struct poll_table_struct *wait)
+{
+	struct hvpipe_source_info *src_info = filp->private_data;
+
+	if (!src_info)
+		return POLLNVAL;
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
+		goto free_fd;
+	}
+
+	spin_lock(&hvpipe_src_list_lock);
+	/*
+	 * If two processes are executing ioctl() for the same
+	 * source ID concurrently, prevent the second process to
+	 * acquire FD.
+	 */
+	if (hvpipe_find_source(srcID)) {
+		spin_unlock(&hvpipe_src_list_lock);
+		err = -EALREADY;
+		goto free_file;
+	}
+	list_add(&src_info->list, &hvpipe_src_list);
+	spin_unlock(&hvpipe_src_list_lock);
+
+	fd_install(fd, file);
+	return fd;
+
+free_file:
+	fput(file);
+free_fd:
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
2.50.1


