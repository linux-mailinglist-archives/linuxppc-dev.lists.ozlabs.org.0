Return-Path: <linuxppc-dev+bounces-7717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138F1A90F05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 00:58:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdGdr3ygQz2yqp;
	Thu, 17 Apr 2025 08:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744844288;
	cv=none; b=Rp9XwM27LlaqLeuIbpXRoOcYmDFKKYRkR52qxzYybnW3IP6wcMIeAPU97HKkS80csP85MzAXp4XD24RBLhQzeqDLHbgEAPZY4ZLtYUKoiX9tni5PtN3IiDofD5/Z7p1rYiCjWwSR/pOHfHRGYf8XTIlRkyl14kRIsSJAIOF0V2rmH1MKFaDbumGCzifOl3/OYb1nywalAw2yma4IAIvo+JF6A+UcAzyjzapVtkKqCwDMd76s19YvwV1XbU3PTDjehkX5JUYzG1G9ZmNxncfCUSI0NjsN+IqgIFkQMgT7HHVKUdK/RIGvH46w8mAl+3OjcsY8IiYRSY5d/JR43rDtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744844288; c=relaxed/relaxed;
	bh=F+EniN6/FA8yT824N7U1/W2AWCaXWtwshUSlvUiCYG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBYBymhd1gBIswyy8WQrO7mL+O3Xlngr20I52zlNAH6MPwH8YKiaQ1RqR9Ui362DjPU5FKjrz9psPzObA+eAGiRP2j2dnEkM+zIqQZTbtqWsdTbcYue9Bg0SU9pU8iO1wklzOs+OET4V2JRFPAWZeAUei7aAXVO7mkCYBeMGC2t+Ey9mRcFHLSL4UR+hrfIJCDyx+N0XGRPei+HbguL6vVc0Ieff69RgEhIb3RLmxhlFYpmR0m6hNSmyCy0wtmwNpEQ5d7ESxXMlWgOhPWs3PF0/ksi7POYdjlU5JCPUVgfj4dmYIJE6wv8ifqIcZq1URpN4liv+iR9Ma5hqVNDquA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fwby2oM1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fwby2oM1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdGdp6vHzz3bn8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 08:58:06 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLcix3014910;
	Wed, 16 Apr 2025 22:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=F+EniN6/FA8yT824N
	7U1/W2AWCaXWtwshUSlvUiCYG4=; b=Fwby2oM1/Y4x2RNfCZbhR+yGEAYU+aEEm
	O9lcnjqkoUNWm9cJ45sTnBmE+/bF5qmuPhq4N1/Y3LGwM8Q2ezEYYNGgIhEAmu2Z
	GQukeqPVM741NLRPSD+dUR4SDSn57AvjocfLLzLyMQs3r6OdPTwyztlJivmeQ3sb
	qFy/Kl2zyuJxtbccMX3r/y1jHWu/eyAPLDLitz/dldbWeRDbtZzj0IUOs9jquLzr
	gAoF7lEk5ARjc/MOTvq54uMkGiJcBlhFT5TxgnRz3L2rJKAejrywbUE/F3zFrz/m
	0FZDZp3XJ0hlUpQBcb5FfHo6Sxr5UWwX1eLAeFcuL30ZagoeRdkNw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mn7r7yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:58:00 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GMvxWF004717;
	Wed, 16 Apr 2025 22:57:59 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462mn7r7y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:57:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLtVZv030899;
	Wed, 16 Apr 2025 22:57:58 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gntscm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 22:57:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GMvte043778458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 22:57:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6924E58058;
	Wed, 16 Apr 2025 22:57:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8869858057;
	Wed, 16 Apr 2025 22:57:54 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.110.97])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 22:57:54 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com, sv@linux.ibm.com
Subject: [PATCH v10 3/7] powerpc/pseries: Add papr-indices char driver for ibm,get-indices
Date: Wed, 16 Apr 2025 15:57:38 -0700
Message-ID: <20250416225743.596462-4-haren@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=ANnAolku c=1 sm=1 tr=0 ts=680035f8 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=IBseYD8dxIKCk1hyJvAA:9
X-Proofpoint-GUID: R99y25z5kL95wf7VBdYH-Fu4WAH3R3Dj
X-Proofpoint-ORIG-GUID: fg1rrGQ73-ZePSx_3-XZzE_RUnwnnXKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160180
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The RTAS call ibm,get-indices is used to obtain indices and
location codes for a specified indicator or sensor token. The
current implementation uses rtas_get_indices() API provided by
librtas library which allocates RMO buffer and issue this RTAS
call in the user space. But writable mapping /dev/mem access by
the user space is prohibited under system lockdown.

To overcome the restricted access in the user space, the kernel
provide interfaces to collect indices data from the hypervisor.
This patch adds papr-indices character driver and expose standard
interfaces such as open / ioctl/ read to user space in ways that
are compatible with lockdown.

PAPR (2.13 7.3.17 ibm,get-indices RTAS Call) describes the
following steps to retrieve all indices data:
- User input parameters to the RTAS call: sensor or indicator,
  and indice type
- ibm,get-indices is sequence RTAS call which means has to issue
  multiple times to get the entire list of indicators or sensors
  of a particular type. The hypervisor expects the first RTAS call
  with the sequence 1 and the subsequent calls with the sequence
  number returned from the previous calls.
- The OS may not interleave calls to ibm,get-indices for different
  indicator or sensor types. Means other RTAS calls with different
  type should not be issued while the previous type sequence is in
  progress. So collect the entire list of indices and copied to
  buffer BLOB during ioctl() and expose this buffer to the user
  space with the file descriptor.
- The hypervisor fills the work area with a specific format but
  does not return the number of bytes written to the buffer.
  Instead of parsing the data for each call to determine the data
  length, copy the work area size (RTAS_GET_INDICES_BUF_SIZE) to
  the buffer. Return work-area size of data to the user space for
  each read() call.

Expose these interfaces to user space with a /dev/papr-indices
character device using the following programming model:

 int devfd = open("/dev/papr-indices", O_RDONLY);
 int fd = ioctl(devfd, PAPR_INDICES_IOC_GET,
		struct papr_indices_io_block)
  - Collect all indices data for the specified token to the buffer
 char *buf = malloc(RTAS_GET_INDICES_BUF_SIZE);
 length = read(fd, buf,  RTAS_GET_INDICES_BUF_SIZE)
  - RTAS_GET_INDICES_BUF_SIZE of data is returned to the user
    space.
  - The user space retrieves the indices and their location codes
    from the buffer
  - Should issue multiple read() calls until reaches the end of
    BLOB buffer.

The read() should use the file descriptor obtained from ioctl to
get the data that is exposed to file descriptor. Implemented
support in librtas (rtas_get_indices()) for this new ABI for
system lockdown.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Tested-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h               |   1 +
 arch/powerpc/kernel/rtas.c                    |   2 +-
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 arch/powerpc/platforms/pseries/papr-indices.c | 301 ++++++++++++++++++
 4 files changed, 304 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/papr-indices.c

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 04406162fc5a..7dc527a5aaac 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -515,6 +515,7 @@ extern char rtas_data_buf[RTAS_DATA_BUF_SIZE];
 extern unsigned long rtas_rmo_buf;
 
 extern struct mutex rtas_ibm_get_vpd_lock;
+extern struct mutex rtas_ibm_get_indices_lock;
 
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d7a738f1858d..039ac5099aed 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -93,11 +93,11 @@ struct rtas_function {
  */
 static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
 static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
-static DEFINE_MUTEX(rtas_ibm_get_indices_lock);
 static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
 static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
 static DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
 DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
+DEFINE_MUTEX(rtas_ibm_get_indices_lock);
 
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 665dcec9ffcf..7ea293c7c5b6 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -3,7 +3,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o rtas-work-area.o papr-sysparm.o \
-			   papr-rtas-common.o papr-vpd.o \
+			   papr-rtas-common.o papr-vpd.o papr-indices.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
new file mode 100644
index 000000000000..a0b3c9a61c5c
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "papr-indices: " fmt
+
+#include <linux/build_bug.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/lockdep.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/signal.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/string_helpers.h>
+#include <linux/uaccess.h>
+#include <asm/machdep.h>
+#include <asm/rtas-work-area.h>
+#include <asm/rtas.h>
+#include <uapi/asm/papr-indices.h>
+#include "papr-rtas-common.h"
+
+/**
+ * struct rtas_get_indices_params - Parameters (in and out) for
+ *                                      ibm,get-indices.
+ * @is_sensor:	In: Caller-provided whether sensor or indicator.
+ * @indice_type:In: Caller-provided indice (sensor or indicator) token
+ * @work_area:	In: Caller-provided work area buffer for results.
+ * @next:	In: Sequence number. Out: Next sequence number.
+ * @status:	Out: RTAS call status.
+ */
+struct rtas_get_indices_params {
+	u8 is_sensor;
+	u32 indice_type;
+	struct rtas_work_area *work_area;
+	u32 next;
+	s32 status;
+};
+
+/*
+ * rtas_ibm_get_indices() - Call ibm,get-indices to fill a work area buffer.
+ * @params: See &struct rtas_ibm_get_indices_params.
+ *
+ * Calls ibm,get-indices until it errors or successfully deposits data
+ * into the supplied work area. Handles RTAS retry statuses. Maps RTAS
+ * error statuses to reasonable errno values.
+ *
+ * The caller is expected to invoke rtas_ibm_get_indices() multiple times
+ * to retrieve all indices data for the provided indice type. Only one
+ * sequence should be in progress at any time; starting a new sequence
+ * will disrupt any sequence already in progress. Serialization of
+ * indices retrieval sequences is the responsibility of the caller.
+ *
+ * The caller should inspect @params.status to determine whether more
+ * calls are needed to complete the sequence.
+ *
+ * Context: May sleep.
+ * Return: -ve on error, 0 otherwise.
+ */
+static int rtas_ibm_get_indices(struct rtas_get_indices_params *params)
+{
+	struct rtas_work_area *work_area = params->work_area;
+	const s32 token = rtas_function_token(RTAS_FN_IBM_GET_INDICES);
+	u32 rets;
+	s32 fwrc;
+	int ret;
+
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	lockdep_assert_held(&rtas_ibm_get_indices_lock);
+
+	do {
+		fwrc = rtas_call(token, 5, 2, &rets, params->is_sensor,
+				params->indice_type,
+				rtas_work_area_phys(work_area),
+				rtas_work_area_size(work_area),
+				params->next);
+	} while (rtas_busy_delay(fwrc));
+
+	switch (fwrc) {
+	case RTAS_HARDWARE_ERROR:
+		ret = -EIO;
+		break;
+	case RTAS_INVALID_PARAMETER: /* Indicator type is not supported */
+		ret = -EINVAL;
+		break;
+	case RTAS_SEQ_START_OVER:
+		ret = -EAGAIN;
+		pr_info_ratelimited("Indices changed during retrieval, retrying\n");
+		params->next = 1;
+		break;
+	case RTAS_SEQ_MORE_DATA:
+		params->next = rets;
+		ret = 0;
+		break;
+	case RTAS_SEQ_COMPLETE:
+		params->next = 0;
+		ret = 0;
+		break;
+	default:
+		ret = -EIO;
+		pr_err_ratelimited("unexpected ibm,get-indices status %d\n", fwrc);
+		break;
+	}
+
+	params->status = fwrc;
+	return ret;
+}
+
+/*
+ * Internal indices sequence APIs. A sequence is a series of calls to
+ * ibm,get-indices for a given location code. The sequence ends when
+ * an error is encountered or all indices for the input has been
+ * returned.
+ */
+
+/*
+ * indices_sequence_begin() - Begin a indices retrieval sequence.
+ *
+ * Context: May sleep.
+ */
+static void indices_sequence_begin(struct papr_rtas_sequence *seq)
+{
+	struct rtas_get_indices_params  *param;
+
+	param = (struct rtas_get_indices_params *)seq->params;
+	/*
+	 * We could allocate the work area before acquiring the
+	 * function lock, but that would allow concurrent requests to
+	 * exhaust the limited work area pool for no benefit. So
+	 * allocate the work area under the lock.
+	 */
+	mutex_lock(&rtas_ibm_get_indices_lock);
+	param->work_area = rtas_work_area_alloc(RTAS_GET_INDICES_BUF_SIZE);
+	param->next = 1;
+	param->status = 0;
+}
+
+/*
+ * indices_sequence_end() - Finalize a indices retrieval sequence.
+ *
+ * Releases resources obtained by indices_sequence_begin().
+ */
+static void indices_sequence_end(struct papr_rtas_sequence *seq)
+{
+	struct rtas_get_indices_params *param;
+
+	param =  (struct rtas_get_indices_params *)seq->params;
+	rtas_work_area_free(param->work_area);
+	mutex_unlock(&rtas_ibm_get_indices_lock);
+}
+
+/*
+ * Work function to be passed to papr_rtas_blob_generate().
+ *
+ * ibm,get-indices RTAS call fills the work area with the certain
+ * format but does not return the bytes written in the buffer. So
+ * instead of kernel parsing this work area to determine the buffer
+ * length, copy the complete work area (RTAS_GET_INDICES_BUF_SIZE)
+ * to the blob and let the user space to obtain the data.
+ * Means RTAS_GET_INDICES_BUF_SIZE data will be returned for each
+ * read().
+ */
+
+static const char *indices_sequence_fill_work_area(struct papr_rtas_sequence *seq,
+						size_t *len)
+{
+	struct rtas_get_indices_params *p;
+	bool init_state;
+
+	p = (struct rtas_get_indices_params *)seq->params;
+	init_state = (p->next == 1) ? true : false;
+
+	if (papr_rtas_sequence_should_stop(seq, p->status, init_state))
+		return NULL;
+	if (papr_rtas_sequence_set_err(seq, rtas_ibm_get_indices(p)))
+		return NULL;
+
+	*len = RTAS_GET_INDICES_BUF_SIZE;
+	return rtas_work_area_raw_buf(p->work_area);
+}
+
+/*
+ * papr_indices_handle_read - returns indices blob data to the user space
+ *
+ * ibm,get-indices RTAS call fills the work area with the certian
+ * format but does not return the bytes written in the buffer and
+ * copied RTAS_GET_INDICES_BUF_SIZE data to the blob for each RTAS
+ * call. So send RTAS_GET_INDICES_BUF_SIZE buffer to the user space
+ * for each read().
+ */
+static ssize_t papr_indices_handle_read(struct file *file,
+		char __user *buf, size_t size, loff_t *off)
+{
+	const struct papr_rtas_blob *blob = file->private_data;
+
+	/* we should not instantiate a handle without any data attached. */
+	if (!papr_rtas_blob_has_data(blob)) {
+		pr_err_once("handle without data\n");
+		return -EIO;
+	}
+
+	if (size < RTAS_GET_INDICES_BUF_SIZE) {
+		pr_err_once("Invalid buffer length %ld, expect %d\n",
+				size, RTAS_GET_INDICES_BUF_SIZE);
+		return -EINVAL;
+	} else if (size > RTAS_GET_INDICES_BUF_SIZE)
+		size = RTAS_GET_INDICES_BUF_SIZE;
+
+	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
+}
+
+static const struct file_operations papr_indices_handle_ops = {
+	.read = papr_indices_handle_read,
+	.llseek = papr_rtas_common_handle_seek,
+	.release = papr_rtas_common_handle_release,
+};
+
+/*
+ * papr_indices_create_handle() - Create a fd-based handle for reading
+ *                                indices data
+ * @ubuf: Input parameters to RTAS call such as whether sensor or indicator
+ *        and indice type in user memory
+ *
+ * Handler for PAPR_INDICES_IOC_GET ioctl command. Validates @ubuf
+ * and instantiates an immutable indices "blob" for it. The blob is
+ * attached to a file descriptor for reading by user space. The memory
+ * backing the blob is freed when the file is released.
+ *
+ * The entire requested indices is retrieved by this call and all
+ * necessary RTAS interactions are performed before returning the fd
+ * to user space. This keeps the read handler simple and ensures that
+ * the kernel can prevent interleaving of ibm,get-indices call sequences.
+ *
+ * Return: The installed fd number if successful, -ve errno otherwise.
+ */
+static long papr_indices_create_handle(struct papr_indices_io_block __user *ubuf)
+{
+	struct papr_rtas_sequence seq = {};
+	struct rtas_get_indices_params params = {};
+	int fd;
+
+	if (get_user(params.is_sensor, &ubuf->indices.is_sensor))
+		return -EFAULT;
+
+	if (get_user(params.indice_type, &ubuf->indices.indice_type))
+		return -EFAULT;
+
+	seq = (struct papr_rtas_sequence) {
+		.begin = indices_sequence_begin,
+		.end = indices_sequence_end,
+		.work = indices_sequence_fill_work_area,
+	};
+
+	seq.params = &params;
+	fd = papr_rtas_setup_file_interface(&seq,
+			&papr_indices_handle_ops, "[papr-indices]");
+
+	return fd;
+}
+
+/*
+ * Top-level ioctl handler for /dev/papr-indices.
+ */
+static long papr_indices_dev_ioctl(struct file *filp, unsigned int ioctl,
+				unsigned long arg)
+{
+	void __user *argp = (__force void __user *)arg;
+	long ret;
+
+	switch (ioctl) {
+	case PAPR_INDICES_IOC_GET:
+		ret = papr_indices_create_handle(argp);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations papr_indices_ops = {
+	.unlocked_ioctl = papr_indices_dev_ioctl,
+};
+
+static struct miscdevice papr_indices_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "papr-indices",
+	.fops = &papr_indices_ops,
+};
+
+static __init int papr_indices_init(void)
+{
+	if (!rtas_function_implemented(RTAS_FN_IBM_GET_INDICES))
+		return -ENODEV;
+
+	return misc_register(&papr_indices_dev);
+}
+machine_device_initcall(pseries, papr_indices_init);
-- 
2.43.5


