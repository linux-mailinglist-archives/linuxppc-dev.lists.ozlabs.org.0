Return-Path: <linuxppc-dev+bounces-5611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E962CA20443
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 07:13:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yhw2K50V0z2yq4;
	Tue, 28 Jan 2025 17:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738044793;
	cv=none; b=ba9a/0nxwZilq7THPF9W5wcf0OOUw+pJBAxXSimHkeV16MpMsBguxuqXVKzTOZScH07czJC5mYAo2xWNbRubCl3NOEieL3lCCO4MZcaXzHa51+eu2ma3/XEltXoKUGgfoLK71rlYZ/+IvI5uR8p5pRf2jBdrTXR9Iux7aK6vtcP96r/1TcFo7aosWlpLz9JDhVZeMOV+4gBKePhenedG++vDlOjwFCeteORpT6FfUwSQ93pd9nZ3UnxgV4+uFmecOU/DoJY8Bj0qr7DMX0eb3zPi15EQs9HTxLA7O1MTQ1ctnClA/7C+WuQjzaqxV8vz/ZD6m5HylAu8UvvUhGQUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738044793; c=relaxed/relaxed;
	bh=hoUZu4yDRuk2VfZjmEz/8zRM/hCM2lBpLqJp8feyiNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9prONCwakUrX9fD75H/vteSlOOWp1hU+bsEV3KKcyJGRgi1TOrJYtZgG0ZJ4+JNwnJzBO7mGxbz5xQ/20guUy0QBS0UrCniRalakML+8h6rjScV4PrbmYRzPlOJGLUyB46qkSUYgO38okEGNo0VqO3Q+pPwxskVU9l2V742TN1qUpxHsiFWhbOhogvApemuebtRve2uqZbHxbkA58lX8EUESGYMT5NCKpOXY0SNeUUBpjEkRi/fouvyqfZiE4naiUgBkeAsGtTMMnvNQ9Ldr1442Dd7oFkU6OAiwjjSUuFW2SysrekXMw1GoIyFJY31fXI+t1fCk9Gymov1KBRfxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgZDhhrv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgZDhhrv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yhw2H6qLgz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 17:13:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S20Zt7006077;
	Tue, 28 Jan 2025 06:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hoUZu4
	yDRuk2VfZjmEz/8zRM/hCM2lBpLqJp8feyiNI=; b=QgZDhhrvwIKJda838cHNY6
	rZaaLiRO39CwEKrfoK4qaz0Gft3xQnITDyy9AXsmk3jLfbQLNEj/1LuJQWk+RDKQ
	iPdKknrSVD2th4dhhTcGK3hD1YDH6BxY4OYxlSIPWJYklfIlnSO9zdEPB79QZHpC
	QzksphR/yHHEWds4JzBqUi+joWsymam9pTSN97h9M68NwXzn1/NVXi+SOIH2HrTQ
	hbol5Ei4wjOIYIYGNB+da4+h5ZwVpJCu+XFO2gKFmKOFMTPHUSAmUj5gVEwRi0qW
	OBdXfV7kj0a+NMugQyAeJaLRpvpQ95R3QPlWnfwcf5mdCt6JPT6e7iF3xLfu2Qcw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ep2ygrca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:04 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50S65nXK020191;
	Tue, 28 Jan 2025 06:13:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ep2ygrc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5R6WJ028072;
	Tue, 28 Jan 2025 06:13:03 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44dbsk9t8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 06:13:03 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50S6D06b25952808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 06:13:00 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E936458058;
	Tue, 28 Jan 2025 06:12:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4E8A5805C;
	Tue, 28 Jan 2025 06:12:58 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.33.13])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Jan 2025 06:12:58 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v3 1/6] powerpc/pseries: Define common functions for RTAS sequence calls
Date: Mon, 27 Jan 2025 22:12:45 -0800
Message-ID: <20250128061251.3718036-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250128061251.3718036-1-haren@linux.ibm.com>
References: <20250128061251.3718036-1-haren@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C3_cEm6WjVlJ82zLze4_ztLL5zi3JAJK
X-Proofpoint-GUID: ORhGP0TZZYKNEC-UVDyWAgCUpBX_O1Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280044
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The RTAS call can be normal where retrieves the data form the
hypervisor once or sequence based RTAS call which has to
issue multiple times until the complete data is obtained. For
some of these sequence RTAS calls, the OS should not interleave
calls with different input until the sequence is completed.
The data is collected for each call and copy to the buffer
for the entire sequence during ioctl() handle and then expose
this buffer to the user space with read() handle.

One such sequence RTAS call is ibm,get-vpd and its support is
already included in the current code. To add the similar support
for other sequence based calls, move the common functions in to
separate file and update papr_rtas_sequence struct with the
following callbacks so that RTAS call specific code will be
defined and executed to complete the sequence.

struct papr_rtas_sequence {
        int error;
        void params;
        void (*begin) (struct papr_rtas_sequence *, void *);
        void (*end) (struct papr_rtas_sequence *);
        const char * (*work) (struct papr_rtas_sequence *, size_t *);
};

params: Input parameters used to pass for RTAS call.
Begin:	RTAS call specific function to initialize data
	including work area allocation.
End:	RTAS call specific function to free up resources
	(free work area) after the sequence is completed.
Work:	The actual RTAS call specific function which collects
	the data from the hypervisor.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 .../platforms/pseries/papr-rtas-common.c      | 243 ++++++++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  45 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 270 +++---------------
 4 files changed, 335 insertions(+), 225 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 7bf506f6b8c8..697c216b70dc 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -3,7 +3,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o rtas-work-area.o papr-sysparm.o \
-			   papr-vpd.o \
+			   papr-rtas-common.o papr-vpd.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
diff --git a/arch/powerpc/platforms/pseries/papr-rtas-common.c b/arch/powerpc/platforms/pseries/papr-rtas-common.c
new file mode 100644
index 000000000000..0209ec09d1fd
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-rtas-common.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "papr-common: " fmt
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/signal.h>
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/anon_inodes.h>
+#include <linux/sched/signal.h>
+#include "papr-rtas-common.h"
+
+/*
+ * Sequence based RTAS HCALL has to issue multiple times to retrieve
+ * complete data from the hypervisor. For some of these RTAS calls,
+ * the OS should not interleave calls with different input until the
+ * sequence is completed. So data is collected for these calls during
+ * ioctl handle and export to user space with read() handle.
+ * This file provides common functions needed for such sequence based
+ * RTAS calls Ex: ibm,get-vpd and ibm,get-indices.
+ */
+
+bool papr_rtas_blob_has_data(const struct papr_rtas_blob *blob)
+{
+	return blob->data && blob->len;
+}
+
+void papr_rtas_blob_free(const struct papr_rtas_blob *blob)
+{
+	if (blob) {
+		kvfree(blob->data);
+		kfree(blob);
+	}
+}
+
+/**
+ * papr_rtas_blob_extend() - Append data to a &struct papr_rtas_blob.
+ * @blob: The blob to extend.
+ * @data: The new data to append to @blob.
+ * @len:  The length of @data.
+ *
+ * Context: May sleep.
+ * Return: -ENOMEM on allocation failure, 0 otherwise.
+ */
+static int papr_rtas_blob_extend(struct papr_rtas_blob *blob,
+				const char *data, size_t len)
+{
+	const size_t new_len = blob->len + len;
+	const size_t old_len = blob->len;
+	const char *old_ptr = blob->data;
+	char *new_ptr;
+
+	new_ptr = kvrealloc(old_ptr, new_len, GFP_KERNEL_ACCOUNT);
+	if (!new_ptr)
+		return -ENOMEM;
+
+	memcpy(&new_ptr[old_len], data, len);
+	blob->data = new_ptr;
+	blob->len = new_len;
+	return 0;
+}
+
+/**
+ * papr_rtas_blob_generate() - Construct a new &struct papr_rtas_blob.
+ * @seq: work function of the caller that is called to obtain
+ *       data with the caller RTAS call.
+ *
+ * The @work callback is invoked until it returns NULL. @seq is
+ * passed to @work in its first argument on each call. When
+ * @work returns data, it should store the data length in its
+ * second argument.
+ *
+ * Context: May sleep.
+ * Return: A completely populated &struct papr_rtas_blob, or NULL on error.
+ */
+static const struct papr_rtas_blob *
+papr_rtas_blob_generate(struct papr_rtas_sequence *seq)
+{
+	struct papr_rtas_blob *blob;
+	const char *buf;
+	size_t len;
+	int err = 0;
+
+	blob  = kzalloc(sizeof(*blob), GFP_KERNEL_ACCOUNT);
+	if (!blob)
+		return NULL;
+
+	if (!seq->work)
+		return ERR_PTR(-EINVAL);
+
+
+	while (err == 0 && (buf = seq->work(seq, &len)))
+		err = papr_rtas_blob_extend(blob, buf, len);
+
+	if (err != 0 || !papr_rtas_blob_has_data(blob))
+		goto free_blob;
+
+	return blob;
+free_blob:
+	papr_rtas_blob_free(blob);
+	return NULL;
+}
+
+int papr_rtas_sequence_set_err(struct papr_rtas_sequence *seq, int err)
+{
+	/* Preserve the first error recorded. */
+	if (seq->error == 0)
+		seq->error = err;
+
+	return seq->error;
+}
+
+/*
+ * Higher-level retrieval code below. These functions use the
+ * papr_rtas_blob_* and sequence_* APIs defined above to create fd-based
+ * handles for consumption by user space.
+ */
+
+/**
+ * papr_rtas_run_sequence() - Run a single retrieval sequence.
+ * @seq:	Functions of the caller to complete the sequence
+ * @param:	Inputs to the caller's RTAS call
+ *
+ * Context: May sleep. Holds a mutex and an RTAS work area for its
+ *          duration. Typically performs multiple sleepable slab
+ *          allocations.
+ *
+ * Return: A populated &struct papr_rtas_blob on success. Encoded error
+ * pointer otherwise.
+ */
+static const struct papr_rtas_blob *papr_rtas_run_sequence(struct papr_rtas_sequence *seq,
+							void *param)
+{
+	const struct papr_rtas_blob *blob;
+
+	if (seq->begin)
+		seq->begin(seq, param);
+
+	blob = papr_rtas_blob_generate(seq);
+	if (!blob)
+		papr_rtas_sequence_set_err(seq, -ENOMEM);
+
+	if (seq->end)
+		seq->end(seq);
+
+
+	if (seq->error) {
+		papr_rtas_blob_free(blob);
+		return ERR_PTR(seq->error);
+	}
+
+	return blob;
+}
+
+/**
+ * papr_rtas_retrieve() - Return the data blob that is exposed to
+ * user space.
+ * @seq: RTAS call specific functions to be invoked until the
+ *       sequence is completed.
+ * @param: RTAS calls specific parameters.
+ *
+ * Run sequences against @param until a blob is successfully
+ * instantiated, or a hard error is encountered, or a fatal signal is
+ * pending.
+ *
+ * Context: May sleep.
+ * Return: A fully populated data blob when successful. Encoded error
+ * pointer otherwise.
+ */
+const struct papr_rtas_blob *papr_rtas_retrieve(struct papr_rtas_sequence *seq,
+						void *param)
+{
+	const struct papr_rtas_blob *blob;
+
+	/*
+	 * EAGAIN means the sequence returns error with a -4 (data
+	 * changed and need to start the sequence) status from RTAS calls
+	 * and we should attempt a new sequence. PAPR+ (v2.13 R1–7.3.20–5
+	 * - ibm,get-vpd, R1–7.3.17–6 - ibm,get-indices) indicates that
+	 * this should be a transient condition, not something that
+	 * happens continuously. But we'll stop trying on a fatal signal.
+	 */
+	do {
+		blob = papr_rtas_run_sequence(seq, param);
+		if (!IS_ERR(blob)) /* Success. */
+			break;
+		if (PTR_ERR(blob) != -EAGAIN) /* Hard error. */
+			break;
+		cond_resched();
+	} while (!fatal_signal_pending(current));
+
+	return blob;
+}
+
+/**
+ * papr_rtas_setup_file_interface - Complete the sequence and obtain
+ * the data and export to user space with fd-based handles. Then the
+ * user spave gets the data with read() handle.
+ * @seq: RTAS call specific functions to get the data.
+ * @param: RTAS call specific input parameters.
+ * @fops: RTAS call specific file operations such as read().
+ * @name: RTAS call specific char device node.
+ *
+ * Return: FD handle for consumption by user space
+ */
+long papr_rtas_setup_file_interface(struct papr_rtas_sequence *seq,
+				void *param,
+				const struct file_operations *fops,
+				char *name)
+{
+	const struct papr_rtas_blob *blob;
+	struct file *file;
+	long ret;
+	int fd;
+
+	blob = papr_rtas_retrieve(seq, param);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto free_blob;
+	}
+
+	file = anon_inode_getfile(name, fops, (void *)blob, O_RDONLY);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto put_fd;
+	}
+
+	file->f_mode |= FMODE_LSEEK | FMODE_PREAD;
+	fd_install(fd, file);
+	return fd;
+
+put_fd:
+	put_unused_fd(fd);
+free_blob:
+	papr_rtas_blob_free(blob);
+	return ret;
+}
diff --git a/arch/powerpc/platforms/pseries/papr-rtas-common.h b/arch/powerpc/platforms/pseries/papr-rtas-common.h
new file mode 100644
index 000000000000..54e9686da04b
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-rtas-common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_PAPR_RTAS_COMMON_H
+#define _ASM_POWERPC_PAPR_RTAS_COMMON_H
+
+#include <linux/types.h>
+
+/*
+ * Internal "blob" APIs for accumulating RTAS call results into
+ * an immutable buffer to be attached to a file descriptor.
+ */
+struct papr_rtas_blob {
+	const char *data;
+	size_t len;
+};
+
+/**
+ * struct papr_sequence - State for managing a sequence of RTAS calls.
+ * @error:  Shall be zero as long as the sequence has not encountered an error,
+ *          -ve errno otherwise. Use papr_rtas_sequence_set_err() to update.
+ * @params: Parameter block to pass to rtas_*() calls.
+ * @begin: Work area allocation and initialize the needed parameter
+ *         values passed to RTAS call
+ * @end: Free the allocated work area
+ * @work: Obtain data with RTAS call and invoke it until the sequence is
+ *        completed.
+ *
+ */
+struct papr_rtas_sequence {
+	int error;
+	void *params;
+	void (*begin)(struct papr_rtas_sequence *seq, void *param);
+	void (*end)(struct papr_rtas_sequence *seq);
+	const char *(*work)(struct papr_rtas_sequence *seq, size_t *len);
+};
+
+extern bool papr_rtas_blob_has_data(const struct papr_rtas_blob *blob);
+extern void papr_rtas_blob_free(const struct papr_rtas_blob *blob);
+extern int papr_rtas_sequence_set_err(struct papr_rtas_sequence *seq,
+		int err);
+extern const struct papr_rtas_blob *papr_rtas_retrieve(struct papr_rtas_sequence *seq, void *param);
+extern long papr_rtas_setup_file_interface(struct papr_rtas_sequence *seq,
+		void *param, const struct file_operations *fops, char *name);
+
+#endif /* _ASM_POWERPC_PAPR_RTAS_COMMON_H */
+
diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index 1574176e3ffc..89b9ab64bc2f 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -2,7 +2,6 @@
 
 #define pr_fmt(fmt) "papr-vpd: " fmt
 
-#include <linux/anon_inodes.h>
 #include <linux/build_bug.h>
 #include <linux/file.h>
 #include <linux/fs.h>
@@ -20,6 +19,7 @@
 #include <asm/rtas-work-area.h>
 #include <asm/rtas.h>
 #include <uapi/asm/papr-vpd.h>
+#include "papr-rtas-common.h"
 
 /*
  * Function-specific return values for ibm,get-vpd, derived from PAPR+
@@ -93,6 +93,7 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
 		break;
 	case RTAS_IBM_GET_VPD_START_OVER:
 		ret = -EAGAIN;
+		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
 		break;
 	case RTAS_IBM_GET_VPD_MORE_DATA:
 		params->sequence = rets[0];
@@ -118,91 +119,6 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
 	return ret;
 }
 
-/*
- * Internal VPD "blob" APIs for accumulating ibm,get-vpd results into
- * an immutable buffer to be attached to a file descriptor.
- */
-struct vpd_blob {
-	const char *data;
-	size_t len;
-};
-
-static bool vpd_blob_has_data(const struct vpd_blob *blob)
-{
-	return blob->data && blob->len;
-}
-
-static void vpd_blob_free(const struct vpd_blob *blob)
-{
-	if (blob) {
-		kvfree(blob->data);
-		kfree(blob);
-	}
-}
-
-/**
- * vpd_blob_extend() - Append data to a &struct vpd_blob.
- * @blob: The blob to extend.
- * @data: The new data to append to @blob.
- * @len:  The length of @data.
- *
- * Context: May sleep.
- * Return: -ENOMEM on allocation failure, 0 otherwise.
- */
-static int vpd_blob_extend(struct vpd_blob *blob, const char *data, size_t len)
-{
-	const size_t new_len = blob->len + len;
-	const size_t old_len = blob->len;
-	const char *old_ptr = blob->data;
-	char *new_ptr;
-
-	new_ptr = kvrealloc(old_ptr, new_len, GFP_KERNEL_ACCOUNT);
-	if (!new_ptr)
-		return -ENOMEM;
-
-	memcpy(&new_ptr[old_len], data, len);
-	blob->data = new_ptr;
-	blob->len = new_len;
-	return 0;
-}
-
-/**
- * vpd_blob_generate() - Construct a new &struct vpd_blob.
- * @generator: Function that supplies the blob data.
- * @arg:       Context pointer supplied by caller, passed to @generator.
- *
- * The @generator callback is invoked until it returns NULL. @arg is
- * passed to @generator in its first argument on each call. When
- * @generator returns data, it should store the data length in its
- * second argument.
- *
- * Context: May sleep.
- * Return: A completely populated &struct vpd_blob, or NULL on error.
- */
-static const struct vpd_blob *
-vpd_blob_generate(const char * (*generator)(void *, size_t *), void *arg)
-{
-	struct vpd_blob *blob;
-	const char *buf;
-	size_t len;
-	int err = 0;
-
-	blob  = kzalloc(sizeof(*blob), GFP_KERNEL_ACCOUNT);
-	if (!blob)
-		return NULL;
-
-	while (err == 0 && (buf = generator(arg, &len)))
-		err = vpd_blob_extend(blob, buf, len);
-
-	if (err != 0 || !vpd_blob_has_data(blob))
-		goto free_blob;
-
-	return blob;
-free_blob:
-	vpd_blob_free(blob);
-	return NULL;
-}
-
 /*
  * Internal VPD sequence APIs. A VPD sequence is a series of calls to
  * ibm,get-vpd for a given location code. The sequence ends when an
@@ -210,21 +126,10 @@ vpd_blob_generate(const char * (*generator)(void *, size_t *), void *arg)
  * returned.
  */
 
-/**
- * struct vpd_sequence - State for managing a VPD sequence.
- * @error:  Shall be zero as long as the sequence has not encountered an error,
- *          -ve errno otherwise. Use vpd_sequence_set_err() to update this.
- * @params: Parameter block to pass to rtas_ibm_get_vpd().
- */
-struct vpd_sequence {
-	int error;
-	struct rtas_ibm_get_vpd_params params;
-};
-
 /**
  * vpd_sequence_begin() - Begin a VPD retrieval sequence.
- * @seq:      Uninitialized sequence state.
- * @loc_code: Location code that defines the scope of the VPD to return.
+ * @seq:   Uninitialized sequence state.
+ * @param: Location code that defines the scope of the VPD to return.
  *
  * Initializes @seq with the resources necessary to carry out a VPD
  * sequence. Callers must pass @seq to vpd_sequence_end() regardless
@@ -232,9 +137,9 @@ struct vpd_sequence {
  *
  * Context: May sleep.
  */
-static void vpd_sequence_begin(struct vpd_sequence *seq,
-			       const struct papr_location_code *loc_code)
+static void vpd_sequence_begin(struct papr_rtas_sequence *seq, void *param)
 {
+	struct rtas_ibm_get_vpd_params *vpd_params;
 	/*
 	 * Use a static data structure for the location code passed to
 	 * RTAS to ensure it's in the RMA and avoid a separate work
@@ -249,14 +154,12 @@ static void vpd_sequence_begin(struct vpd_sequence *seq,
 	 * allocate the work area under the lock.
 	 */
 	mutex_lock(&rtas_ibm_get_vpd_lock);
-	static_loc_code = *loc_code;
-	*seq = (struct vpd_sequence) {
-		.params = {
-			.work_area = rtas_work_area_alloc(SZ_4K),
-			.loc_code = &static_loc_code,
-			.sequence = 1,
-		},
-	};
+	static_loc_code = *(struct papr_location_code *)param;
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
+	vpd_params->work_area = rtas_work_area_alloc(SZ_4K);
+	vpd_params->loc_code = &static_loc_code;
+	vpd_params->sequence = 1;
+	vpd_params->status = 0;
 }
 
 /**
@@ -265,9 +168,12 @@ static void vpd_sequence_begin(struct vpd_sequence *seq,
  *
  * Releases resources obtained by vpd_sequence_begin().
  */
-static void vpd_sequence_end(struct vpd_sequence *seq)
+static void vpd_sequence_end(struct papr_rtas_sequence *seq)
 {
-	rtas_work_area_free(seq->params.work_area);
+	struct rtas_ibm_get_vpd_params *vpd_params;
+
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
+	rtas_work_area_free(vpd_params->work_area);
 	mutex_unlock(&rtas_ibm_get_vpd_lock);
 }
 
@@ -283,16 +189,19 @@ static void vpd_sequence_end(struct vpd_sequence *seq)
  * Return: True if the sequence has encountered an error or if all VPD for
  *         this sequence has been retrieved. False otherwise.
  */
-static bool vpd_sequence_should_stop(const struct vpd_sequence *seq)
+static bool vpd_sequence_should_stop(const struct papr_rtas_sequence *seq)
 {
+	struct rtas_ibm_get_vpd_params *vpd_params;
 	bool done;
 
 	if (seq->error)
 		return true;
 
-	switch (seq->params.status) {
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
+
+	switch (vpd_params->status) {
 	case 0:
-		if (seq->params.written == 0)
+		if (vpd_params->written == 0)
 			done = false; /* Initial state. */
 		else
 			done = true; /* All data consumed. */
@@ -308,26 +217,19 @@ static bool vpd_sequence_should_stop(const struct vpd_sequence *seq)
 	return done;
 }
 
-static int vpd_sequence_set_err(struct vpd_sequence *seq, int err)
-{
-	/* Preserve the first error recorded. */
-	if (seq->error == 0)
-		seq->error = err;
-
-	return seq->error;
-}
-
 /*
- * Generator function to be passed to vpd_blob_generate().
+ * Generator function to be passed to papr_rtas_blob_generate().
  */
-static const char *vpd_sequence_fill_work_area(void *arg, size_t *len)
+static const char *vpd_sequence_fill_work_area(struct papr_rtas_sequence *seq,
+						size_t *len)
 {
-	struct vpd_sequence *seq = arg;
-	struct rtas_ibm_get_vpd_params *p = &seq->params;
+	struct rtas_ibm_get_vpd_params *p;
+
+	p = (struct rtas_ibm_get_vpd_params *)seq->params;
 
 	if (vpd_sequence_should_stop(seq))
 		return NULL;
-	if (vpd_sequence_set_err(seq, rtas_ibm_get_vpd(p)))
+	if (papr_rtas_sequence_set_err(seq, rtas_ibm_get_vpd(p)))
 		return NULL;
 	*len = p->written;
 	return rtas_work_area_raw_buf(p->work_area);
@@ -335,82 +237,16 @@ static const char *vpd_sequence_fill_work_area(void *arg, size_t *len)
 
 /*
  * Higher-level VPD retrieval code below. These functions use the
- * vpd_blob_* and vpd_sequence_* APIs defined above to create fd-based
+ * papr_rtas_blob_* and vpd_sequence_* APIs defined above to create fd-based
  * VPD handles for consumption by user space.
  */
 
-/**
- * papr_vpd_run_sequence() - Run a single VPD retrieval sequence.
- * @loc_code: Location code that defines the scope of VPD to return.
- *
- * Context: May sleep. Holds a mutex and an RTAS work area for its
- *          duration. Typically performs multiple sleepable slab
- *          allocations.
- *
- * Return: A populated &struct vpd_blob on success. Encoded error
- * pointer otherwise.
- */
-static const struct vpd_blob *papr_vpd_run_sequence(const struct papr_location_code *loc_code)
-{
-	const struct vpd_blob *blob;
-	struct vpd_sequence seq;
-
-	vpd_sequence_begin(&seq, loc_code);
-	blob = vpd_blob_generate(vpd_sequence_fill_work_area, &seq);
-	if (!blob)
-		vpd_sequence_set_err(&seq, -ENOMEM);
-	vpd_sequence_end(&seq);
-
-	if (seq.error) {
-		vpd_blob_free(blob);
-		return ERR_PTR(seq.error);
-	}
-
-	return blob;
-}
-
-/**
- * papr_vpd_retrieve() - Return the VPD for a location code.
- * @loc_code: Location code that defines the scope of VPD to return.
- *
- * Run VPD sequences against @loc_code until a blob is successfully
- * instantiated, or a hard error is encountered, or a fatal signal is
- * pending.
- *
- * Context: May sleep.
- * Return: A fully populated VPD blob when successful. Encoded error
- * pointer otherwise.
- */
-static const struct vpd_blob *papr_vpd_retrieve(const struct papr_location_code *loc_code)
-{
-	const struct vpd_blob *blob;
-
-	/*
-	 * EAGAIN means the sequence errored with a -4 (VPD changed)
-	 * status from ibm,get-vpd, and we should attempt a new
-	 * sequence. PAPR+ v2.13 R1–7.3.20–5 indicates that this
-	 * should be a transient condition, not something that happens
-	 * continuously. But we'll stop trying on a fatal signal.
-	 */
-	do {
-		blob = papr_vpd_run_sequence(loc_code);
-		if (!IS_ERR(blob)) /* Success. */
-			break;
-		if (PTR_ERR(blob) != -EAGAIN) /* Hard error. */
-			break;
-		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
-		cond_resched();
-	} while (!fatal_signal_pending(current));
-
-	return blob;
-}
-
 static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t size, loff_t *off)
 {
-	const struct vpd_blob *blob = file->private_data;
+	const struct papr_rtas_blob *blob = file->private_data;
 
 	/* bug: we should not instantiate a handle without any data attached. */
-	if (!vpd_blob_has_data(blob)) {
+	if (!papr_rtas_blob_has_data(blob)) {
 		pr_err_once("handle without data\n");
 		return -EIO;
 	}
@@ -420,16 +256,16 @@ static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t
 
 static int papr_vpd_handle_release(struct inode *inode, struct file *file)
 {
-	const struct vpd_blob *blob = file->private_data;
+	const struct papr_rtas_blob *blob = file->private_data;
 
-	vpd_blob_free(blob);
+	papr_rtas_blob_free(blob);
 
 	return 0;
 }
 
 static loff_t papr_vpd_handle_seek(struct file *file, loff_t off, int whence)
 {
-	const struct vpd_blob *blob = file->private_data;
+	const struct papr_rtas_blob *blob = file->private_data;
 
 	return fixed_size_llseek(file, off, whence, blob->len);
 }
@@ -460,10 +296,9 @@ static const struct file_operations papr_vpd_handle_ops = {
  */
 static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
 {
+	struct rtas_ibm_get_vpd_params vpd_params = {};
+	struct papr_rtas_sequence seq = {};
 	struct papr_location_code klc;
-	const struct vpd_blob *blob;
-	struct file *file;
-	long err;
 	int fd;
 
 	if (copy_from_user(&klc, ulc, sizeof(klc)))
@@ -472,31 +307,18 @@ static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
 	if (!string_is_terminated(klc.str, ARRAY_SIZE(klc.str)))
 		return -EINVAL;
 
-	blob = papr_vpd_retrieve(&klc);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
+	seq = (struct papr_rtas_sequence) {
+		.begin = vpd_sequence_begin,
+		.end = vpd_sequence_end,
+		.work = vpd_sequence_fill_work_area,
+	};
 
-	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
-	if (fd < 0) {
-		err = fd;
-		goto free_blob;
-	}
+	seq.params = (void *)&vpd_params;
 
-	file = anon_inode_getfile("[papr-vpd]", &papr_vpd_handle_ops,
-				  (void *)blob, O_RDONLY);
-	if (IS_ERR(file)) {
-		err = PTR_ERR(file);
-		goto put_fd;
-	}
+	fd = papr_rtas_setup_file_interface(&seq, &klc,
+			&papr_vpd_handle_ops, "[papr-vpd]");
 
-	file->f_mode |= FMODE_LSEEK | FMODE_PREAD;
-	fd_install(fd, file);
 	return fd;
-put_fd:
-	put_unused_fd(fd);
-free_blob:
-	vpd_blob_free(blob);
-	return err;
 }
 
 /*
-- 
2.43.5


