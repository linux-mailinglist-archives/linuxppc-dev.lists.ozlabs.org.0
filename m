Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BA4018CC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 11:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H333c43Czz2yRK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 19:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gnp6jrqL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gnp6jrqL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H332n5PFjz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 19:27:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18693jq1033931; Mon, 6 Sep 2021 05:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=xFgcvn5nPlD10ZZ3gzyF69Mswa8lGnLQiyR+PnbqQwM=;
 b=gnp6jrqLxOg2hq3oLgxxsTAyhNPqU3xZ8QxbSgTArdClT3GLe4bpA/n9UVci+f5Sg9Oa
 egech/GmkDK1xQgMlVn38WaANmdJ5qEiSnxww5g/IhK/l1zsniRTc2Zbx4RAZwGEg3FT
 FVx9l1AWmIfBSUQoNne88WFDsLOi4Br9i1FHz8FfgF4SuudjKQ0jTxFgclbFgy8zMYJ1
 g8zVfV30/hCT7UA5PUoeRf2q7s/B2PkikPJIryo61kxibc3bHrNrvTLtwoqiKqC05Qld
 B3D9+WpmxWwPlvTibIEJcfdrRQ5dV4jQp6BJIuL9ug78u++fWIFVLLLG4UQ1M+8lTPDM OQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awdbem3re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:27:12 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1869DPKq023733;
 Mon, 6 Sep 2021 09:27:11 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3av0e91k3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 09:27:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1869Mucm36045262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 09:22:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39BC4C06D;
 Mon,  6 Sep 2021 09:27:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 596334C063;
 Mon,  6 Sep 2021 09:27:05 +0000 (GMT)
Received: from [172.17.0.3] (unknown [9.40.192.207])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 09:27:05 +0000 (GMT)
Subject: [RFC PATCH v2] powerpc/papr_scm: Move duplicate definitions to common
 header files
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au
Date: Mon, 06 Sep 2021 09:27:04 +0000
Message-ID: <163092037510.812.12838160593592476913.stgit@82313cf9f602>
User-Agent: StGit/1.1+40.g1b20
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QEgJ0YegGbYNyZZNX7uiZPw98Q3mJoNr
X-Proofpoint-ORIG-GUID: QEgJ0YegGbYNyZZNX7uiZPw98Q3mJoNr
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_04:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109060058
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
Cc: nvdimm@lists.linux.dev, dan.j.williams@intel.com, vaibhav@linux.ibm.com,
 sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

papr_scm and ndtest share common PDSM payload structs like
nd_papr_pdsm_health. Presently these structs are duplicated across papr_pdsm.h
and ndtest.h header files. Since 'ndtest' is essentially arch independent and can
run on platforms other than PPC64, a way needs to be deviced to avoid redundancy
and duplication of PDSM structs in future.

So the patch proposes moving the PDSM header from arch/powerpc/include/uapi/ to
the generic include/uapi/linux directory. Also, there are some #defines common
between papr_scm and ndtest which are not exported to the user space. So, move
them to a header file which can be shared across ndtest and papr_scm via newly
introduced include/linux/papr_scm.h.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Suggested-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
---
Changelog:

Since v1:
Link: https://patchwork.kernel.org/project/linux-nvdimm/patch/162505488483.72147.12741153746322191381.stgit@56e104a48989/
* Removed dependency on this patch for the other patches

 MAINTAINERS                               |    2 
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  165 -----------------------------
 arch/powerpc/platforms/pseries/papr_scm.c |   43 --------
 include/linux/papr_scm.h                  |   48 ++++++++
 include/uapi/linux/papr_pdsm.h            |  165 +++++++++++++++++++++++++++++
 tools/testing/nvdimm/test/ndtest.c        |    2 
 tools/testing/nvdimm/test/ndtest.h        |  120 ---------------------
 7 files changed, 219 insertions(+), 326 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
 create mode 100644 include/linux/papr_scm.h
 create mode 100644 include/uapi/linux/papr_pdsm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c8be735cc91..03fe0c77cefa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10661,6 +10661,8 @@ F:	drivers/rtc/rtc-opal.c
 F:	drivers/scsi/ibmvscsi/
 F:	drivers/tty/hvc/hvc_opal.c
 F:	drivers/watchdog/wdrtas.c
+F:	include/linux/papr_scm.h
+F:	include/uapi/linux/papr_pdsm.h
 F:	tools/testing/selftests/powerpc
 N:	/pmac
 N:	powermac
diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
deleted file mode 100644
index 17439925045c..000000000000
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ /dev/null
@@ -1,165 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
- *
- * (C) Copyright IBM 2020
- *
- * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
- */
-
-#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_
-#define _UAPI_ASM_POWERPC_PAPR_PDSM_H_
-
-#include <linux/types.h>
-#include <linux/ndctl.h>
-
-/*
- * PDSM Envelope:
- *
- * The ioctl ND_CMD_CALL exchange data between user-space and kernel via
- * envelope which consists of 2 headers sections and payload sections as
- * illustrated below:
- *  +-----------------+---------------+---------------------------+
- *  |   64-Bytes      |   8-Bytes     |       Max 184-Bytes       |
- *  +-----------------+---------------+---------------------------+
- *  | ND-HEADER       |  PDSM-HEADER  |      PDSM-PAYLOAD         |
- *  +-----------------+---------------+---------------------------+
- *  | nd_family       |               |                           |
- *  | nd_size_out     | cmd_status    |                           |
- *  | nd_size_in      | reserved      |     nd_pdsm_payload       |
- *  | nd_command      | payload   --> |                           |
- *  | nd_fw_size      |               |                           |
- *  | nd_payload ---> |               |                           |
- *  +---------------+-----------------+---------------------------+
- *
- * ND Header:
- * This is the generic libnvdimm header described as 'struct nd_cmd_pkg'
- * which is interpreted by libnvdimm before passed on to papr_scm. Important
- * member fields used are:
- * 'nd_family'		: (In) NVDIMM_FAMILY_PAPR_SCM
- * 'nd_size_in'		: (In) PDSM-HEADER + PDSM-IN-PAYLOAD (usually 0)
- * 'nd_size_out'        : (In) PDSM-HEADER + PDSM-RETURN-PAYLOAD
- * 'nd_command'         : (In) One of PAPR_PDSM_XXX
- * 'nd_fw_size'         : (Out) PDSM-HEADER + size of actual payload returned
- *
- * PDSM Header:
- * This is papr-scm specific header that precedes the payload. This is defined
- * as nd_cmd_pdsm_pkg.  Following fields aare available in this header:
- *
- * 'cmd_status'		: (Out) Errors if any encountered while servicing PDSM.
- * 'reserved'		: Not used, reserved for future and should be set to 0.
- * 'payload'            : A union of all the possible payload structs
- *
- * PDSM Payload:
- *
- * The layout of the PDSM Payload is defined by various structs shared between
- * papr_scm and libndctl so that contents of payload can be interpreted. As such
- * its defined as a union of all possible payload structs as
- * 'union nd_pdsm_payload'. Based on the value of 'nd_cmd_pkg.nd_command'
- * appropriate member of the union is accessed.
- */
-
-/* Max payload size that we can handle */
-#define ND_PDSM_PAYLOAD_MAX_SIZE 184
-
-/* Max payload size that we can handle */
-#define ND_PDSM_HDR_SIZE \
-	(sizeof(struct nd_pkg_pdsm) - ND_PDSM_PAYLOAD_MAX_SIZE)
-
-/* Various nvdimm health indicators */
-#define PAPR_PDSM_DIMM_HEALTHY       0
-#define PAPR_PDSM_DIMM_UNHEALTHY     1
-#define PAPR_PDSM_DIMM_CRITICAL      2
-#define PAPR_PDSM_DIMM_FATAL         3
-
-/* struct nd_papr_pdsm_health.extension_flags field flags */
-
-/* Indicate that the 'dimm_fuel_gauge' field is valid */
-#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
-
-/* Indicate that the 'dimm_dsc' field is valid */
-#define PDSM_DIMM_DSC_VALID 2
-
-/*
- * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
- * Various flags indicate the health status of the dimm.
- *
- * extension_flags	: Any extension fields present in the struct.
- * dimm_unarmed		: Dimm not armed. So contents wont persist.
- * dimm_bad_shutdown	: Previous shutdown did not persist contents.
- * dimm_bad_restore	: Contents from previous shutdown werent restored.
- * dimm_scrubbed	: Contents of the dimm have been scrubbed.
- * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
- * dimm_encrypted	: Contents of dimm are encrypted.
- * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
- * dimm_fuel_gauge	: Life remaining of DIMM as a percentage from 0-100
- */
-struct nd_papr_pdsm_health {
-	union {
-		struct {
-			__u32 extension_flags;
-			__u8 dimm_unarmed;
-			__u8 dimm_bad_shutdown;
-			__u8 dimm_bad_restore;
-			__u8 dimm_scrubbed;
-			__u8 dimm_locked;
-			__u8 dimm_encrypted;
-			__u16 dimm_health;
-
-			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
-			__u16 dimm_fuel_gauge;
-
-			/* Extension flag PDSM_DIMM_DSC_VALID */
-			__u64 dimm_dsc;
-		};
-		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-	};
-};
-
-/* Flags for injecting specific smart errors */
-#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
-#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
-
-struct nd_papr_pdsm_smart_inject {
-	union {
-		struct {
-			/* One or more of PDSM_SMART_INJECT_ */
-			__u32 flags;
-			__u8 fatal_enable;
-			__u8 unsafe_shutdown_enable;
-		};
-		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-	};
-};
-
-/*
- * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
- * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
- */
-enum papr_pdsm {
-	PAPR_PDSM_MIN = 0x0,
-	PAPR_PDSM_HEALTH,
-	PAPR_PDSM_SMART_INJECT,
-	PAPR_PDSM_MAX,
-};
-
-/* Maximal union that can hold all possible payload types */
-union nd_pdsm_payload {
-	struct nd_papr_pdsm_health health;
-	struct nd_papr_pdsm_smart_inject smart_inject;
-	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-} __packed;
-
-/*
- * PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm
- * Valid member of union 'payload' is identified via 'nd_cmd_pkg.nd_command'
- * that should always precede this struct when sent to papr_scm via CMD_CALL
- * interface.
- */
-struct nd_pkg_pdsm {
-	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
-	__u16 reserved[2];	/* Ignored and to be set as '0' */
-	union nd_pdsm_payload payload;
-} __packed;
-
-#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index de4cf329cfb3..b7437c61a270 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -16,7 +16,8 @@
 #include <linux/nd.h>
 
 #include <asm/plpar_wrappers.h>
-#include <asm/papr_pdsm.h>
+#include <uapi/linux/papr_pdsm.h>
+#include <linux/papr_scm.h>
 #include <asm/mce.h>
 #include <asm/unaligned.h>
 
@@ -28,46 +29,6 @@
 	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_CALL))
 
-/* DIMM health bitmap bitmap indicators */
-/* SCM device is unable to persist memory contents */
-#define PAPR_PMEM_UNARMED                   (1ULL << (63 - 0))
-/* SCM device failed to persist memory contents */
-#define PAPR_PMEM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
-/* SCM device contents are persisted from previous IPL */
-#define PAPR_PMEM_SHUTDOWN_CLEAN            (1ULL << (63 - 2))
-/* SCM device contents are not persisted from previous IPL */
-#define PAPR_PMEM_EMPTY                     (1ULL << (63 - 3))
-/* SCM device memory life remaining is critically low */
-#define PAPR_PMEM_HEALTH_CRITICAL           (1ULL << (63 - 4))
-/* SCM device will be garded off next IPL due to failure */
-#define PAPR_PMEM_HEALTH_FATAL              (1ULL << (63 - 5))
-/* SCM contents cannot persist due to current platform health status */
-#define PAPR_PMEM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
-/* SCM device is unable to persist memory contents in certain conditions */
-#define PAPR_PMEM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
-/* SCM device is encrypted */
-#define PAPR_PMEM_ENCRYPTED                 (1ULL << (63 - 8))
-/* SCM device has been scrubbed and locked */
-#define PAPR_PMEM_SCRUBBED_AND_LOCKED       (1ULL << (63 - 9))
-
-/* Bits status indicators for health bitmap indicating unarmed dimm */
-#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED |		\
-				PAPR_PMEM_HEALTH_UNHEALTHY)
-
-/* Bits status indicators for health bitmap indicating unflushed dimm */
-#define PAPR_PMEM_BAD_SHUTDOWN_MASK (PAPR_PMEM_SHUTDOWN_DIRTY)
-
-/* Bits status indicators for health bitmap indicating unrestored dimm */
-#define PAPR_PMEM_BAD_RESTORE_MASK  (PAPR_PMEM_EMPTY)
-
-/* Bit status indicators for smart event notification */
-#define PAPR_PMEM_SMART_EVENT_MASK (PAPR_PMEM_HEALTH_CRITICAL | \
-				    PAPR_PMEM_HEALTH_FATAL |	\
-				    PAPR_PMEM_HEALTH_UNHEALTHY)
-
-#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
-#define PAPR_SCM_PERF_STATS_VERSION 0x1
-
 /* Use bitblt method to override specific bits in the '_bitmap_' */
 #define BITBLT_BITMAP(_bitmap_, _mask_, _override_)		\
 	(((_bitmap_) & ~(_mask_)) | ((_mask_) & (_override_)))
diff --git a/include/linux/papr_scm.h b/include/linux/papr_scm.h
new file mode 100644
index 000000000000..f116e5ffef36
--- /dev/null
+++ b/include/linux/papr_scm.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_PAPR_SCM_H
+#define __LINUX_PAPR_SCM_H
+
+/* DIMM health bitmap bitmap indicators */
+/* SCM device is unable to persist memory contents */
+#define PAPR_PMEM_UNARMED                   (1ULL << (63 - 0))
+/* SCM device failed to persist memory contents */
+#define PAPR_PMEM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
+/* SCM device contents are persisted from previous IPL */
+#define PAPR_PMEM_SHUTDOWN_CLEAN            (1ULL << (63 - 2))
+/* SCM device contents are not persisted from previous IPL */
+#define PAPR_PMEM_EMPTY                     (1ULL << (63 - 3))
+/* SCM device memory life remaining is critically low */
+#define PAPR_PMEM_HEALTH_CRITICAL           (1ULL << (63 - 4))
+/* SCM device will be garded off next IPL due to failure */
+#define PAPR_PMEM_HEALTH_FATAL              (1ULL << (63 - 5))
+/* SCM contents cannot persist due to current platform health status */
+#define PAPR_PMEM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
+/* SCM device is unable to persist memory contents in certain conditions */
+#define PAPR_PMEM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
+/* SCM device is encrypted */
+#define PAPR_PMEM_ENCRYPTED                 (1ULL << (63 - 8))
+/* SCM device has been scrubbed and locked */
+#define PAPR_PMEM_SCRUBBED_AND_LOCKED       (1ULL << (63 - 9))
+
+#define PAPR_PMEM_SAVE_FAILED                (1ULL << (63 - 10))
+
+/* Bits status indicators for health bitmap indicating unarmed dimm */
+#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED | PAPR_PMEM_HEALTH_UNHEALTHY)
+
+/* Bits status indicators for health bitmap indicating unflushed dimm */
+#define PAPR_PMEM_BAD_SHUTDOWN_MASK (PAPR_PMEM_SHUTDOWN_DIRTY)
+
+/* Bits status indicators for health bitmap indicating unrestored dimm */
+#define PAPR_PMEM_BAD_RESTORE_MASK  (PAPR_PMEM_EMPTY)
+
+/* Bit status indicators for smart event notification */
+#define PAPR_PMEM_SMART_EVENT_MASK (PAPR_PMEM_HEALTH_CRITICAL | \
+				    PAPR_PMEM_HEALTH_FATAL    | \
+				    PAPR_PMEM_HEALTH_UNHEALTHY)
+
+#define PAPR_PMEM_SAVE_MASK                (PAPR_PMEM_SAVE_FAILED)
+
+#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
+#define PAPR_SCM_PERF_STATS_VERSION 0x1
+
+#endif /* __LINUX_PAPR_SCM_H */
diff --git a/include/uapi/linux/papr_pdsm.h b/include/uapi/linux/papr_pdsm.h
new file mode 100644
index 000000000000..1be9906f4540
--- /dev/null
+++ b/include/uapi/linux/papr_pdsm.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
+ *
+ * (C) Copyright IBM 2020-2021
+ *
+ * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
+ */
+
+#ifndef _UAPI_LINUX_PAPR_PDSM_H_
+#define _UAPI_LINUX_PAPR_PDSM_H_
+
+#include <linux/types.h>
+#include <linux/ndctl.h>
+
+/*
+ * PDSM Envelope:
+ *
+ * The ioctl ND_CMD_CALL exchange data between user-space and kernel via
+ * envelope which consists of 2 headers sections and payload sections as
+ * illustrated below:
+ *  +-----------------+---------------+---------------------------+
+ *  |   64-Bytes      |   8-Bytes     |       Max 184-Bytes       |
+ *  +-----------------+---------------+---------------------------+
+ *  | ND-HEADER       |  PDSM-HEADER  |      PDSM-PAYLOAD         |
+ *  +-----------------+---------------+---------------------------+
+ *  | nd_family       |               |                           |
+ *  | nd_size_out     | cmd_status    |                           |
+ *  | nd_size_in      | reserved      |     nd_pdsm_payload       |
+ *  | nd_command      | payload   --> |                           |
+ *  | nd_fw_size      |               |                           |
+ *  | nd_payload ---> |               |                           |
+ *  +---------------+-----------------+---------------------------+
+ *
+ * ND Header:
+ * This is the generic libnvdimm header described as 'struct nd_cmd_pkg'
+ * which is interpreted by libnvdimm before passed on to papr_scm. Important
+ * member fields used are:
+ * 'nd_family'		: (In) NVDIMM_FAMILY_PAPR_SCM
+ * 'nd_size_in'		: (In) PDSM-HEADER + PDSM-IN-PAYLOAD (usually 0)
+ * 'nd_size_out'        : (In) PDSM-HEADER + PDSM-RETURN-PAYLOAD
+ * 'nd_command'         : (In) One of PAPR_PDSM_XXX
+ * 'nd_fw_size'         : (Out) PDSM-HEADER + size of actual payload returned
+ *
+ * PDSM Header:
+ * This is papr-scm specific header that precedes the payload. This is defined
+ * as nd_cmd_pdsm_pkg.  Following fields aare available in this header:
+ *
+ * 'cmd_status'		: (Out) Errors if any encountered while servicing PDSM.
+ * 'reserved'		: Not used, reserved for future and should be set to 0.
+ * 'payload'            : A union of all the possible payload structs
+ *
+ * PDSM Payload:
+ *
+ * The layout of the PDSM Payload is defined by various structs shared between
+ * papr_scm and libndctl so that contents of payload can be interpreted. As such
+ * its defined as a union of all possible payload structs as
+ * 'union nd_pdsm_payload'. Based on the value of 'nd_cmd_pkg.nd_command'
+ * appropriate member of the union is accessed.
+ */
+
+/* Max payload size that we can handle */
+#define ND_PDSM_PAYLOAD_MAX_SIZE 184
+
+/* Max payload size that we can handle */
+#define ND_PDSM_HDR_SIZE \
+	(sizeof(struct nd_pkg_pdsm) - ND_PDSM_PAYLOAD_MAX_SIZE)
+
+/* Various nvdimm health indicators */
+#define PAPR_PDSM_DIMM_HEALTHY       0
+#define PAPR_PDSM_DIMM_UNHEALTHY     1
+#define PAPR_PDSM_DIMM_CRITICAL      2
+#define PAPR_PDSM_DIMM_FATAL         3
+
+/* struct nd_papr_pdsm_health.extension_flags field flags */
+
+/* Indicate that the 'dimm_fuel_gauge' field is valid */
+#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
+
+/* Indicate that the 'dimm_dsc' field is valid */
+#define PDSM_DIMM_DSC_VALID 2
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
+ * Various flags indicate the health status of the dimm.
+ *
+ * extension_flags	: Any extension fields present in the struct.
+ * dimm_unarmed		: Dimm not armed. So contents wont persist.
+ * dimm_bad_shutdown	: Previous shutdown did not persist contents.
+ * dimm_bad_restore	: Contents from previous shutdown werent restored.
+ * dimm_scrubbed	: Contents of the dimm have been scrubbed.
+ * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
+ * dimm_encrypted	: Contents of dimm are encrypted.
+ * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
+ * dimm_fuel_gauge	: Life remaining of DIMM as a percentage from 0-100
+ */
+struct nd_papr_pdsm_health {
+	union {
+		struct {
+			__u32 extension_flags;
+			__u8 dimm_unarmed;
+			__u8 dimm_bad_shutdown;
+			__u8 dimm_bad_restore;
+			__u8 dimm_scrubbed;
+			__u8 dimm_locked;
+			__u8 dimm_encrypted;
+			__u16 dimm_health;
+
+			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
+			__u16 dimm_fuel_gauge;
+
+			/* Extension flag PDSM_DIMM_DSC_VALID */
+			__u64 dimm_dsc;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+};
+
+/* Flags for injecting specific smart errors */
+#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
+#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
+
+struct nd_papr_pdsm_smart_inject {
+	union {
+		struct {
+			/* One or more of PDSM_SMART_INJECT_ */
+			__u32 flags;
+			__u8 fatal_enable;
+			__u8 unsafe_shutdown_enable;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+};
+
+/*
+ * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
+ * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
+ */
+enum papr_pdsm {
+	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_HEALTH,
+	PAPR_PDSM_SMART_INJECT,
+	PAPR_PDSM_MAX,
+};
+
+/* Maximal union that can hold all possible payload types */
+union nd_pdsm_payload {
+	struct nd_papr_pdsm_health health;
+	struct nd_papr_pdsm_smart_inject smart_inject;
+	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+} __packed;
+
+/*
+ * PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm
+ * Valid member of union 'payload' is identified via 'nd_cmd_pkg.nd_command'
+ * that should always precede this struct when sent to papr_scm via CMD_CALL
+ * interface.
+ */
+struct nd_pkg_pdsm {
+	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
+	__u16 reserved[2];	/* Ignored and to be set as '0' */
+	union nd_pdsm_payload payload;
+} __packed;
+
+#endif /* _UAPI_LINUX_PAPR_PDSM_H_ */
diff --git a/tools/testing/nvdimm/test/ndtest.c b/tools/testing/nvdimm/test/ndtest.c
index 45d42cd25e82..6622e8adbd11 100644
--- a/tools/testing/nvdimm/test/ndtest.c
+++ b/tools/testing/nvdimm/test/ndtest.c
@@ -13,6 +13,8 @@
 #include <nd-core.h>
 #include <linux/printk.h>
 #include <linux/seq_buf.h>
+#include <linux/papr_scm.h>
+#include <uapi/linux/papr_pdsm.h>
 
 #include "../watermark.h"
 #include "nfit_test.h"
diff --git a/tools/testing/nvdimm/test/ndtest.h b/tools/testing/nvdimm/test/ndtest.h
index b9b381021313..e18b3b006fa2 100644
--- a/tools/testing/nvdimm/test/ndtest.h
+++ b/tools/testing/nvdimm/test/ndtest.h
@@ -5,39 +5,6 @@
 #include <linux/platform_device.h>
 #include <linux/libnvdimm.h>
 
-/* SCM device is unable to persist memory contents */
-#define PAPR_PMEM_UNARMED                   (1ULL << (63 - 0))
-/* SCM device failed to persist memory contents */
-#define PAPR_PMEM_SHUTDOWN_DIRTY            (1ULL << (63 - 1))
-/* SCM device contents are not persisted from previous IPL */
-#define PAPR_PMEM_EMPTY                     (1ULL << (63 - 3))
-#define PAPR_PMEM_HEALTH_CRITICAL           (1ULL << (63 - 4))
-/* SCM device will be garded off next IPL due to failure */
-#define PAPR_PMEM_HEALTH_FATAL              (1ULL << (63 - 5))
-/* SCM contents cannot persist due to current platform health status */
-#define PAPR_PMEM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
-/* SCM device is unable to persist memory contents in certain conditions */
-#define PAPR_PMEM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
-
-/* Bits status indicators for health bitmap indicating unarmed dimm */
-#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED |		\
-				PAPR_PMEM_HEALTH_UNHEALTHY)
-
-#define PAPR_PMEM_SAVE_FAILED                (1ULL << (63 - 10))
-
-/* Bits status indicators for health bitmap indicating unflushed dimm */
-#define PAPR_PMEM_BAD_SHUTDOWN_MASK (PAPR_PMEM_SHUTDOWN_DIRTY)
-
-/* Bits status indicators for health bitmap indicating unrestored dimm */
-#define PAPR_PMEM_BAD_RESTORE_MASK  (PAPR_PMEM_EMPTY)
-
-/* Bit status indicators for smart event notification */
-#define PAPR_PMEM_SMART_EVENT_MASK (PAPR_PMEM_HEALTH_CRITICAL | \
-				    PAPR_PMEM_HEALTH_FATAL |	\
-				    PAPR_PMEM_HEALTH_UNHEALTHY)
-
-#define PAPR_PMEM_SAVE_MASK                (PAPR_PMEM_SAVE_FAILED)
-
 struct ndtest_config;
 
 struct ndtest_priv {
@@ -107,93 +74,6 @@ struct ndtest_region {
 	u8 range_index;
 };
 
-#define ND_PDSM_PAYLOAD_MAX_SIZE 184
-/*
- * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
- * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
- */
-enum papr_pdsm {
-	PAPR_PDSM_MIN = 0x0,
-	PAPR_PDSM_HEALTH,
-	PAPR_PDSM_SMART_INJECT,
-	PAPR_PDSM_MAX,
-};
-
-/* Various nvdimm health indicators */
-#define PAPR_PDSM_DIMM_HEALTHY       0
-#define PAPR_PDSM_DIMM_UNHEALTHY     1
-#define PAPR_PDSM_DIMM_CRITICAL      2
-#define PAPR_PDSM_DIMM_FATAL         3
-
-/* struct nd_papr_pdsm_health.extension_flags field flags */
-
-/* Indicate that the 'dimm_fuel_gauge' field is valid */
-#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
-
-/* Indicate that the 'dimm_dsc' field is valid */
-#define PDSM_DIMM_DSC_VALID 2
-
-/*
- * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
- * Various flags indicate the health status of the dimm.
- */
-struct nd_papr_pdsm_health {
-	union {
-		struct {
-			__u32 extension_flags;
-			__u8 dimm_unarmed;
-			__u8 dimm_bad_shutdown;
-			__u8 dimm_bad_restore;
-			__u8 dimm_scrubbed;
-			__u8 dimm_locked;
-			__u8 dimm_encrypted;
-			__u16 dimm_health;
-
-			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
-			__u16 dimm_fuel_gauge;
-
-			/* Extension flag PDSM_DIMM_DSC_VALID */
-			__u64 dimm_dsc;
-		};
-		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-	};
-};
-
-/* Flags for injecting specific smart errors */
-#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
-#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
-
-struct nd_papr_pdsm_smart_inject {
-	union {
-		struct {
-			/* One or more of PDSM_SMART_INJECT_ */
-			__u32 flags;
-			__u8 fatal_enable;
-			__u8 unsafe_shutdown_enable;
-		};
-		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-	};
-};
-
-/* Maximal union that can hold all possible payload types */
-union nd_pdsm_payload {
-	struct nd_papr_pdsm_health health;
-	struct nd_papr_pdsm_smart_inject smart_inject;
-	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
-} __packed;
-
-/*
- * PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm
- * Valid member of union 'payload' is identified via 'nd_cmd_pkg.nd_command'
- * that should always precede this struct when sent to papr_scm via CMD_CALL
- * interface.
- */
-struct nd_pkg_pdsm {
-	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
-	__u16 reserved[2];	/* Ignored and to be set as '0' */
-	union nd_pdsm_payload payload;
-} __packed;
-
 struct ndtest_config {
 	struct ndtest_dimm *dimms;
 	struct ndtest_region *regions;


