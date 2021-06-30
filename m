Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709513B81AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 14:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFKrR2Djpz2ymS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 22:08:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bLHG2ZFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bLHG2ZFF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFKqt6llJz2yM1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 22:08:26 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UC2wLM182287; Wed, 30 Jun 2021 08:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=bCQgVtIn/3fOaHjWgEBbl4KTWfUT7e03pzTc6Bodxjc=;
 b=bLHG2ZFFflHwLmpIxjjqBmcz2agtvcvtwnZI0OliFcu/knzHgzmLCE6G5zg7dTb2+4Xn
 HBYIrJyDgpUncDyIl2XvIpey/oTkAIdPcaYWTzns0v5WotgB7sU879mxVvTrG7NSj5WE
 4LA2OqwBm9wHS3L6PhGlSECQ+KpbkJ3vh9wTda9feEoZBi66jSCYW8J4t00I2Sf8TCxZ
 DGBLEQUkNluLG8CMy/OgTOvdQyOsLuHBXSNpmRZCiZR7YzlBFUT4uDgDmxDUSflQDZ3N
 P/phRf38Dw1/kUZv8qRgbBS/eZXbm21GPGZewxIqxuEzNUATT8C3ac/ka5vZ9AWl3rz2 0w== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gntrmnca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 08:08:18 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UBx0Kq016656;
 Wed, 30 Jun 2021 12:08:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 39duv8gwsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 12:08:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UC8CCn30474618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 12:08:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DF02AE092;
 Wed, 30 Jun 2021 12:08:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC56AAE0A4;
 Wed, 30 Jun 2021 12:08:10 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.40.192.207])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 12:08:10 +0000 (GMT)
Subject: [PATCH] powerpc/papr_scm: Move duplicate definitions to common header
 files
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ellerman@au1.ibm.com
Date: Wed, 30 Jun 2021 12:08:10 +0000
Message-ID: <162505488483.72147.12741153746322191381.stgit@56e104a48989>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TBkpxFmkpymLgbisinN1NS7BttYxg53v
X-Proofpoint-ORIG-GUID: TBkpxFmkpymLgbisinN1NS7BttYxg53v
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_05:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300076
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
Cc: nvdimm@lists.linux.dev, santosh@fossix.org, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The papr_scm uses PDSM structures like nd_papr_pdsm_health as the
PDSM payload which would be reused by ndtest. Since ndtest is arch
independent, move the PDSM header from arch/powerpc/include/uapi/
to the generic include/uapi/linux directory.

Also, there are some #defines common between papr_scm and ndtest
which are not exported to the user space. So, move them to a header
file which can be shared across ndtest and papr_scm via newly
introduced include/linux/papr_scm.h.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Suggested-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
---
 MAINTAINERS                               |    2 
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  147 -----------------------------
 arch/powerpc/platforms/pseries/papr_scm.c |   43 --------
 include/linux/papr_scm.h                  |   48 +++++++++
 include/uapi/linux/papr_pdsm.h            |  147 +++++++++++++++++++++++++++++
 tools/testing/nvdimm/test/ndtest.c        |    1 
 tools/testing/nvdimm/test/ndtest.h        |   31 ------
 7 files changed, 200 insertions(+), 219 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
 create mode 100644 include/linux/papr_scm.h
 create mode 100644 include/uapi/linux/papr_pdsm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 008fcad7ac008..5d2d8a6b5eb53 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10494,6 +10494,8 @@ F:	drivers/rtc/rtc-opal.c
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
index 82488b1e7276e..0000000000000
--- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
+++ /dev/null
@@ -1,147 +0,0 @@
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
-/*
- * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
- * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
- */
-enum papr_pdsm {
-	PAPR_PDSM_MIN = 0x0,
-	PAPR_PDSM_HEALTH,
-	PAPR_PDSM_MAX,
-};
-
-/* Maximal union that can hold all possible payload types */
-union nd_pdsm_payload {
-	struct nd_papr_pdsm_health health;
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
index f48e87ac89c9b..0c56db5a14276 100644
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
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
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
index 0000000000000..1ef46fe8d9052
--- /dev/null
+++ b/include/uapi/linux/papr_pdsm.h
@@ -0,0 +1,147 @@
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
+/*
+ * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
+ * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
+ */
+enum papr_pdsm {
+	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_HEALTH,
+	PAPR_PDSM_MAX,
+};
+
+/* Maximal union that can hold all possible payload types */
+union nd_pdsm_payload {
+	struct nd_papr_pdsm_health health;
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
index 6862915f1fb0c..00ec2c2130614 100644
--- a/tools/testing/nvdimm/test/ndtest.c
+++ b/tools/testing/nvdimm/test/ndtest.c
@@ -13,6 +13,7 @@
 #include <nd-core.h>
 #include <linux/printk.h>
 #include <linux/seq_buf.h>
+#include <linux/papr_scm.h>
 
 #include "../watermark.h"
 #include "nfit_test.h"
diff --git a/tools/testing/nvdimm/test/ndtest.h b/tools/testing/nvdimm/test/ndtest.h
index 2c54c9cbb90c7..8f27ad6f7319f 100644
--- a/tools/testing/nvdimm/test/ndtest.h
+++ b/tools/testing/nvdimm/test/ndtest.h
@@ -5,37 +5,6 @@
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


