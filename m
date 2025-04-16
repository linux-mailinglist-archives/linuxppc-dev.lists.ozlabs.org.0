Return-Path: <linuxppc-dev+bounces-7716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F2A90F04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 00:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdGdq5ll8z3bcj;
	Thu, 17 Apr 2025 08:58:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744844287;
	cv=none; b=AJ8mmDThCyLixCNyMtSF9FmJ2hULd0OiKooJAUSqrA1y9nL0Bl/8JXYBY4NY0pYSpEZ3kSlLxUcisi5ACkDXFlfnPrDuV5VMU2ofa+gSxMVa0r2JVEMFVbt9eYcIy/HYAxzBkpnfZM/0/UrCX3DJfbof6dLmYKJaRlxLI5KyVBupWI5OVUEwKxnkVJXohoF8n49TqsfE1dU10yTi/MZX3tpGI3lasVsztHnBYLa+mPp6gd9EgSF5e3gPf4886l0weAhvd6alCj6HcjrDCupxXzFy20+oQNmt3mbg1TlrB+zMzbyXN+FRlCZM+Czn5UpZcVN7XwwjEWfvVmKd0/4FQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744844287; c=relaxed/relaxed;
	bh=ftlFl2+o201WeKx+vfkYBiSxO9/Fc3NIkFbQ3Qg7fug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGv0V8Xr021/Z/FlTRVfsCYcRgTI1/GlW9Bvl4318uKYnC4q7ofpkP5oaKOOVQaMbW1RyqRK3E7ESr576EIvSlIo8LssVo1pp+Bsn/REtU5s3fzP+KJoEJT+lbCIb+jDHtGXBYdbwVNTsjx1UCPUWrOTP3wEeJ5J2Tt0b5YBh1QzuiK/CbzCG7o0SV1aQdS9TWSlySKVsr4EK4IfNxQHzGVBpA0CNksErxnPZHreDPKQ/0HfLktITyrp1hAdYdQ+Ez2rXcRcSq/mKFd16wcWxsc4oUXZpGXbmq3r5/Ebv80fbltzbc2e43hmDnyFs2sXgN1tWKo5mk8HAJvfWVJX5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsXGYdWZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsXGYdWZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdGdn37H6z2yqp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 08:58:04 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLgPYN016270;
	Wed, 16 Apr 2025 22:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ftlFl2
	+o201WeKx+vfkYBiSxO9/Fc3NIkFbQ3Qg7fug=; b=UsXGYdWZZSCjWWZYEg9EiE
	ulzaHOAfHIFFPLpR9ZgMZOx1nvJJvepymm1/KD26afEmABotiUTaSdtWYMnASlJm
	TkUE2XwRtGBMrCfnkYwtxLWvEmehgg4MpX+Qn4h1lHrszsGymbjjrKKlv+8fRrQp
	4eYk1JjVfGWvHGwK4KNLiSg7FKpwxP5zKbMScvanQN8kSnciw+DUsyirKa+E4B02
	MyoU/65u6NGejqstn7BB/TSrlrPueNNCasv1gRBj6BKcubnYLCJ97SEK06T+uN3o
	24vs4gxepU3SdbNTVwrC4KamIzHo/qnL7o8vpvBoOmMrUCXLzy6KnNpMudtkJv/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mpv076h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:57:54 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GMnD1T016362;
	Wed, 16 Apr 2025 22:57:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mpv076e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:57:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMGxQM017199;
	Wed, 16 Apr 2025 22:57:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m2khn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:57:53 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GMvpnF7275224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 22:57:51 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CCD758058;
	Wed, 16 Apr 2025 22:57:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F99D58057;
	Wed, 16 Apr 2025 22:57:50 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.110.97])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 22:57:50 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v10 1/7] powerpc/pseries: Define common functions for RTAS sequence calls
Date: Wed, 16 Apr 2025 15:57:36 -0700
Message-ID: <20250416225743.596462-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250416225743.596462-1-haren@linux.ibm.com>
References: <20250416225743.596462-1-haren@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=KJVaDEFo c=1 sm=1 tr=0 ts=680035f2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=S_6iT06s0nJ9uU_WdKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: g24v9DC0Jo_S1VP1jxiktT_ixnmzEGPN
X-Proofpoint-ORIG-GUID: -vIFNZu51o-1sMP7KR5h_NXDhyZj8SJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160180
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
        void (*begin) (struct papr_rtas_sequence *);
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
Tested-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 .../platforms/pseries/papr-rtas-common.c      | 311 ++++++++++++++++
 .../platforms/pseries/papr-rtas-common.h      |  61 +++
 arch/powerpc/platforms/pseries/papr-vpd.c     | 352 +++---------------
 4 files changed, 418 insertions(+), 308 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.c
 create mode 100644 arch/powerpc/platforms/pseries/papr-rtas-common.h

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 3f3e3492e436..665dcec9ffcf 100644
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
index 000000000000..33c606e3378a
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-rtas-common.c
@@ -0,0 +1,311 @@
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
+ *
+ * Context: May sleep. Holds a mutex and an RTAS work area for its
+ *          duration. Typically performs multiple sleepable slab
+ *          allocations.
+ *
+ * Return: A populated &struct papr_rtas_blob on success. Encoded error
+ * pointer otherwise.
+ */
+static const struct papr_rtas_blob *papr_rtas_run_sequence(struct papr_rtas_sequence *seq)
+{
+	const struct papr_rtas_blob *blob;
+
+	if (seq->begin)
+		seq->begin(seq);
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
+ *
+ * Run sequences against @param until a blob is successfully
+ * instantiated, or a hard error is encountered, or a fatal signal is
+ * pending.
+ *
+ * Context: May sleep.
+ * Return: A fully populated data blob when successful. Encoded error
+ * pointer otherwise.
+ */
+const struct papr_rtas_blob *papr_rtas_retrieve(struct papr_rtas_sequence *seq)
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
+		blob = papr_rtas_run_sequence(seq);
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
+ * @fops: RTAS call specific file operations such as read().
+ * @name: RTAS call specific char device node.
+ *
+ * Return: FD handle for consumption by user space
+ */
+long papr_rtas_setup_file_interface(struct papr_rtas_sequence *seq,
+				const struct file_operations *fops,
+				char *name)
+{
+	const struct papr_rtas_blob *blob;
+	struct file *file;
+	long ret;
+	int fd;
+
+	blob = papr_rtas_retrieve(seq);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		ret = fd;
+		goto free_blob;
+	}
+
+	file = anon_inode_getfile_fmode(name, fops, (void *)blob,
+			O_RDONLY, FMODE_LSEEK | FMODE_PREAD);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto put_fd;
+	}
+
+	fd_install(fd, file);
+	return fd;
+
+put_fd:
+	put_unused_fd(fd);
+free_blob:
+	papr_rtas_blob_free(blob);
+	return ret;
+}
+
+/*
+ * papr_rtas_sequence_should_stop() - Determine whether RTAS retrieval
+ *                                    sequence should continue.
+ *
+ * Examines the sequence error state and outputs of the last call to
+ * the specific RTAS to determine whether the sequence in progress
+ * should continue or stop.
+ *
+ * Return: True if the sequence has encountered an error or if all data
+ *         for this sequence has been retrieved. False otherwise.
+ */
+bool papr_rtas_sequence_should_stop(const struct papr_rtas_sequence *seq,
+				s32 status, bool init_state)
+{
+	bool done;
+
+	if (seq->error)
+		return true;
+
+	switch (status) {
+	case RTAS_SEQ_COMPLETE:
+		if (init_state)
+			done = false; /* Initial state. */
+		else
+			done = true; /* All data consumed. */
+		break;
+	case RTAS_SEQ_MORE_DATA:
+		done = false; /* More data available. */
+		break;
+	default:
+		done = true; /* Error encountered. */
+		break;
+	}
+
+	return done;
+}
+
+/*
+ * User space read to retrieve data for the corresponding RTAS call.
+ * papr_rtas_blob is filled with the data using the corresponding RTAS
+ * call sequence API.
+ */
+ssize_t papr_rtas_common_handle_read(struct file *file,
+	       char __user *buf, size_t size, loff_t *off)
+{
+	const struct papr_rtas_blob *blob = file->private_data;
+
+	/* We should not instantiate a handle without any data attached. */
+	if (!papr_rtas_blob_has_data(blob)) {
+		pr_err_once("handle without data\n");
+		return -EIO;
+	}
+
+	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
+}
+
+int papr_rtas_common_handle_release(struct inode *inode,
+		struct file *file)
+{
+	const struct papr_rtas_blob *blob = file->private_data;
+
+	papr_rtas_blob_free(blob);
+
+	return 0;
+}
+
+loff_t papr_rtas_common_handle_seek(struct file *file, loff_t off,
+					int whence)
+{
+	const struct papr_rtas_blob *blob = file->private_data;
+
+	return fixed_size_llseek(file, off, whence, blob->len);
+}
diff --git a/arch/powerpc/platforms/pseries/papr-rtas-common.h b/arch/powerpc/platforms/pseries/papr-rtas-common.h
new file mode 100644
index 000000000000..4ceabcaf4905
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-rtas-common.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_PAPR_RTAS_COMMON_H
+#define _ASM_POWERPC_PAPR_RTAS_COMMON_H
+
+#include <linux/types.h>
+
+/*
+ * Return codes for sequence based RTAS calls.
+ * Not listed under PAPR+ v2.13 7.2.8: "Return Codes".
+ * But defined in the specific section of each RTAS call.
+ */
+#define RTAS_SEQ_COMPLETE	0 /* All data has been retrieved. */
+#define RTAS_SEQ_MORE_DATA	1 /* More data is available */
+#define RTAS_SEQ_START_OVER	-4 /* Data changed, restart call sequence. */
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
+	void (*begin)(struct papr_rtas_sequence *seq);
+	void (*end)(struct papr_rtas_sequence *seq);
+	const char *(*work)(struct papr_rtas_sequence *seq, size_t *len);
+};
+
+extern bool papr_rtas_blob_has_data(const struct papr_rtas_blob *blob);
+extern void papr_rtas_blob_free(const struct papr_rtas_blob *blob);
+extern int papr_rtas_sequence_set_err(struct papr_rtas_sequence *seq,
+		int err);
+extern const struct papr_rtas_blob *papr_rtas_retrieve(struct papr_rtas_sequence *seq);
+extern long papr_rtas_setup_file_interface(struct papr_rtas_sequence *seq,
+			const struct file_operations *fops, char *name);
+extern bool papr_rtas_sequence_should_stop(const struct papr_rtas_sequence *seq,
+				s32 status, bool init_state);
+extern ssize_t papr_rtas_common_handle_read(struct file *file,
+			char __user *buf, size_t size, loff_t *off);
+extern int papr_rtas_common_handle_release(struct inode *inode,
+					struct file *file);
+extern loff_t papr_rtas_common_handle_seek(struct file *file, loff_t off,
+					int whence);
+#endif /* _ASM_POWERPC_PAPR_RTAS_COMMON_H */
+
diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
index c86950d7105a..f38c188fc4a1 100644
--- a/arch/powerpc/platforms/pseries/papr-vpd.c
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -2,7 +2,6 @@
 
 #define pr_fmt(fmt) "papr-vpd: " fmt
 
-#include <linux/anon_inodes.h>
 #include <linux/build_bug.h>
 #include <linux/file.h>
 #include <linux/fs.h>
@@ -20,14 +19,7 @@
 #include <asm/rtas-work-area.h>
 #include <asm/rtas.h>
 #include <uapi/asm/papr-vpd.h>
-
-/*
- * Function-specific return values for ibm,get-vpd, derived from PAPR+
- * v2.13 7.3.20 "ibm,get-vpd RTAS Call".
- */
-#define RTAS_IBM_GET_VPD_COMPLETE    0 /* All VPD has been retrieved. */
-#define RTAS_IBM_GET_VPD_MORE_DATA   1 /* More VPD is available. */
-#define RTAS_IBM_GET_VPD_START_OVER -4 /* VPD changed, restart call sequence. */
+#include "papr-rtas-common.h"
 
 /**
  * struct rtas_ibm_get_vpd_params - Parameters (in and out) for ibm,get-vpd.
@@ -91,13 +83,14 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
 	case RTAS_INVALID_PARAMETER:
 		ret = -EINVAL;
 		break;
-	case RTAS_IBM_GET_VPD_START_OVER:
+	case RTAS_SEQ_START_OVER:
 		ret = -EAGAIN;
+		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
 		break;
-	case RTAS_IBM_GET_VPD_MORE_DATA:
+	case RTAS_SEQ_MORE_DATA:
 		params->sequence = rets[0];
 		fallthrough;
-	case RTAS_IBM_GET_VPD_COMPLETE:
+	case RTAS_SEQ_COMPLETE:
 		params->written = rets[1];
 		/*
 		 * Kernel or firmware bug, do not continue.
@@ -118,91 +111,6 @@ static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
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
@@ -210,31 +118,15 @@ vpd_blob_generate(const char * (*generator)(void *, size_t *), void *arg)
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
- *
- * Initializes @seq with the resources necessary to carry out a VPD
- * sequence. Callers must pass @seq to vpd_sequence_end() regardless
- * of whether the sequence succeeds.
+ * @seq: vpd call parameters from sequence struct
  *
  * Context: May sleep.
  */
-static void vpd_sequence_begin(struct vpd_sequence *seq,
-			       const struct papr_location_code *loc_code)
+static void vpd_sequence_begin(struct papr_rtas_sequence *seq)
 {
+	struct rtas_ibm_get_vpd_params *vpd_params;
 	/*
 	 * Use a static data structure for the location code passed to
 	 * RTAS to ensure it's in the RMA and avoid a separate work
@@ -242,6 +134,7 @@ static void vpd_sequence_begin(struct vpd_sequence *seq,
 	 */
 	static struct papr_location_code static_loc_code;
 
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
 	/*
 	 * We could allocate the work area before acquiring the
 	 * function lock, but that would allow concurrent requests to
@@ -249,14 +142,12 @@ static void vpd_sequence_begin(struct vpd_sequence *seq,
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
+	static_loc_code = *(struct papr_location_code *)vpd_params->loc_code;
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
+	vpd_params->work_area = rtas_work_area_alloc(SZ_4K);
+	vpd_params->loc_code = &static_loc_code;
+	vpd_params->sequence = 1;
+	vpd_params->status = 0;
 }
 
 /**
@@ -265,180 +156,39 @@ static void vpd_sequence_begin(struct vpd_sequence *seq,
  *
  * Releases resources obtained by vpd_sequence_begin().
  */
-static void vpd_sequence_end(struct vpd_sequence *seq)
+static void vpd_sequence_end(struct papr_rtas_sequence *seq)
 {
-	rtas_work_area_free(seq->params.work_area);
-	mutex_unlock(&rtas_ibm_get_vpd_lock);
-}
-
-/**
- * vpd_sequence_should_stop() - Determine whether a VPD retrieval sequence
- *                              should continue.
- * @seq: VPD sequence state.
- *
- * Examines the sequence error state and outputs of the last call to
- * ibm,get-vpd to determine whether the sequence in progress should
- * continue or stop.
- *
- * Return: True if the sequence has encountered an error or if all VPD for
- *         this sequence has been retrieved. False otherwise.
- */
-static bool vpd_sequence_should_stop(const struct vpd_sequence *seq)
-{
-	bool done;
-
-	if (seq->error)
-		return true;
+	struct rtas_ibm_get_vpd_params *vpd_params;
 
-	switch (seq->params.status) {
-	case 0:
-		if (seq->params.written == 0)
-			done = false; /* Initial state. */
-		else
-			done = true; /* All data consumed. */
-		break;
-	case 1:
-		done = false; /* More data available. */
-		break;
-	default:
-		done = true; /* Error encountered. */
-		break;
-	}
-
-	return done;
-}
-
-static int vpd_sequence_set_err(struct vpd_sequence *seq, int err)
-{
-	/* Preserve the first error recorded. */
-	if (seq->error == 0)
-		seq->error = err;
-
-	return seq->error;
+	vpd_params =  (struct rtas_ibm_get_vpd_params *)seq->params;
+	rtas_work_area_free(vpd_params->work_area);
+	mutex_unlock(&rtas_ibm_get_vpd_lock);
 }
 
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
+	bool init_state;
 
-	if (vpd_sequence_should_stop(seq))
+	p = (struct rtas_ibm_get_vpd_params *)seq->params;
+	init_state = (p->written == 0) ? true : false;
+
+	if (papr_rtas_sequence_should_stop(seq, p->status, init_state))
 		return NULL;
-	if (vpd_sequence_set_err(seq, rtas_ibm_get_vpd(p)))
+	if (papr_rtas_sequence_set_err(seq, rtas_ibm_get_vpd(p)))
 		return NULL;
 	*len = p->written;
 	return rtas_work_area_raw_buf(p->work_area);
 }
 
-/*
- * Higher-level VPD retrieval code below. These functions use the
- * vpd_blob_* and vpd_sequence_* APIs defined above to create fd-based
- * VPD handles for consumption by user space.
- */
-
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
-static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t size, loff_t *off)
-{
-	const struct vpd_blob *blob = file->private_data;
-
-	/* bug: we should not instantiate a handle without any data attached. */
-	if (!vpd_blob_has_data(blob)) {
-		pr_err_once("handle without data\n");
-		return -EIO;
-	}
-
-	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
-}
-
-static int papr_vpd_handle_release(struct inode *inode, struct file *file)
-{
-	const struct vpd_blob *blob = file->private_data;
-
-	vpd_blob_free(blob);
-
-	return 0;
-}
-
-static loff_t papr_vpd_handle_seek(struct file *file, loff_t off, int whence)
-{
-	const struct vpd_blob *blob = file->private_data;
-
-	return fixed_size_llseek(file, off, whence, blob->len);
-}
-
-
 static const struct file_operations papr_vpd_handle_ops = {
-	.read = papr_vpd_handle_read,
-	.llseek = papr_vpd_handle_seek,
-	.release = papr_vpd_handle_release,
+	.read = papr_rtas_common_handle_read,
+	.llseek = papr_rtas_common_handle_seek,
+	.release = papr_rtas_common_handle_release,
 };
 
 /**
@@ -460,10 +210,9 @@ static const struct file_operations papr_vpd_handle_ops = {
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
@@ -472,30 +221,19 @@ static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
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
+	vpd_params.loc_code = &klc;
+	seq.params = (void *)&vpd_params;
+
+	fd = papr_rtas_setup_file_interface(&seq, &papr_vpd_handle_ops,
+			"[papr-vpd]");
 
-	file = anon_inode_getfile_fmode("[papr-vpd]", &papr_vpd_handle_ops,
-				  (void *)blob, O_RDONLY,
-				  FMODE_LSEEK | FMODE_PREAD);
-	if (IS_ERR(file)) {
-		err = PTR_ERR(file);
-		goto put_fd;
-	}
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


