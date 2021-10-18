Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1254311DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXqJC6h8Bz30JK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:08:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NPfveTw5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NPfveTw5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXqH04wSpz306F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:07:24 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I7kvhx005360; 
 Mon, 18 Oct 2021 04:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=PjP0LVxEVD7rdZG+/WunyUrJmkQDZ0ipTCYGHQiqS9k=;
 b=NPfveTw5I3nBuzPqlze9vwA6whYvjHF5qtGNeKiU0kXRavhtMZwD4M3KYcRnAq3dAdMl
 xAMIfhAy5ADAlqUUJIcJULPqyJ4YA+cy48GdtSs7jyrAfTvW0hmiMb9TS7gtU9n136eh
 YT/66gG5BHU5KnEVELdIRJEcCyN9NP+N5llA/o12+NxS4VYhxihqDt5LMXpJCF7woeiM
 Zl3hqzhuF5IjvJrgWcUZRuszMBCQ3co5BJYZOQxa37lWnC5DkStQfenRhP3FRtXN3DKm
 weeEuwJuvvttkWS02SYlq2LDH/ml4fChM0dkklWMKaWj+YvdJFk+ynFhHkC15kRV2lWW zg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs1u53uyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:07:15 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I843kM027035;
 Mon, 18 Oct 2021 08:07:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3bqpca3ryk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:07:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I879kk45023508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:07:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F516A4059;
 Mon, 18 Oct 2021 08:07:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21A67A4051;
 Mon, 18 Oct 2021 08:07:08 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:07:07 +0000 (GMT)
Subject: [REPOST RFC PATCH v2] powerpc/papr_scm: Move duplicate definitions to
 common header files
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au
Date: Mon, 18 Oct 2021 03:07:07 -0500
Message-ID: <163454440296.431294.2368481747380790011.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UosL8jcmtyi-HL5FcCvOOKDOhYym0cep
X-Proofpoint-ORIG-GUID: UosL8jcmtyi-HL5FcCvOOKDOhYym0cep
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 clxscore=1011
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180050
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
nd_papr_pdsm_health. Presently these structs are duplicated across
papr_pdsm.h and ndtest.h header files. Since 'ndtest' is essentially
arch independent and can run on platforms other than PPC64, a way
needs to be deviced to avoid redundancy and duplication of PDSM
structs in future.

So the patch proposes moving the PDSM header from arch/powerpc/include-
-/uapi/ to the generic include/uapi/linux directory. Also, there are
some #defines common between papr_scm and ndtest which are not exported
to the user space. So, move them to a header file which can be shared
across ndtest and papr_scm via newly introduced include/linux/papr_scm.h.

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
index 5b33791bb8e97..3e78f595f3d91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10746,6 +10746,8 @@ F:	drivers/rtc/rtc-opal.c
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
index 17439925045cf..0000000000000
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
index de4cf329cfb3b..b7437c61a2704 100644
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
index 0000000000000..f116e5ffef369
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
index 0000000000000..1be9906f45400
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
index 45d42cd25e82f..6622e8adbd112 100644
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
index b9b3810213132..e18b3b006fa22 100644
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


