Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A712783EF99
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 19:58:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5F4575T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TMkNF4KDQz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 05:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5F4575T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMkMQ6Flmz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jan 2024 05:57:22 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40RFf0v4010065;
	Sat, 27 Jan 2024 18:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=9agy8MCVX/WtbIvWGsE51gPASNWqFL9RNca4nEqECZE=;
 b=C5F4575TWf6xqOucfN3uGO/DTze55cW0TK6UJoHZpvcdC1xmUkJbIGqXAo+SJwRx2mZd
 q0n0CUeSulnM2swxsMK2iJA2KDM+Qb+pYEBUDg75nzGhvmnByM/2kWJFfwGKyBM2P2i5
 kp033ehGvccZKfzrgb+3MpJnE4HKlTBa/q5m5yLRs6Ta36r7A/8YXhO4jZS6yIuhOTMr
 s4cz5BZAhA4EsHsu+V4JYzbVfAu8CgAiGMbCCzAgiVw9GKnTrV4X+TLcFf+OS+o+y73r
 M44Q2ZXYdfwFJwiVGLo/bmMioV+JreVoQkshZKhchDRp5GGhN0RQPqXY3kXy7LrmFnmm SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vw209csd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 18:57:08 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40RIV3Vs013870;
	Sat, 27 Jan 2024 18:57:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vw209csct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 18:57:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40RH0E6S026507;
	Sat, 27 Jan 2024 18:57:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgu2ym2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 18:57:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40RIv3QG27198152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Jan 2024 18:57:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86FCC20040;
	Sat, 27 Jan 2024 18:57:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E383520043;
	Sat, 27 Jan 2024 18:57:00 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglab.ibm.com (unknown [9.3.101.175])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Jan 2024 18:57:00 +0000 (GMT)
Subject: [REPOST PATCH v3] powerpc/papr_scm: Move duplicate definitions to
 common header files
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        nvdimm@lists.linux.dev
Date: Sat, 27 Jan 2024 12:57:00 -0600
Message-ID:  <170638176942.112443.2937254675538057083.stgit@ltcd48-lp2.aus.stglab.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cN0r3r8uJbuWiLBjHPNbTqnNj2Mg9Yyi
X-Proofpoint-ORIG-GUID: pFDvBdDL9J_9Y01_zIu725jCFvEVZGc-
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401270143
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
Cc: dave.jiang@intel.com, sbhat@linux.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vishal.l.verma@intel.com, benjamin.tissoires@redhat.com, npiggin@gmail.com, yi.zhang@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

papr_scm and ndtest share common PDSM payload structs like
nd_papr_pdsm_health. Presently these structs are duplicated across
papr_pdsm.h and ndtest.h header files. Since 'ndtest' is essentially
arch independent and can run on platforms other than PPC64, a way
needs to be deviced to avoid redundancy and duplication of PDSM
structs in future.

So the patch proposes moving the PDSM header from arch/powerpc/include-
-/uapi/ to the generic include/uapi/linux directory. Also, there
are some #defines common between papr_scm and ndtest which are not
exported to the user space. So, move them to a header file which
can be shared across ndtest and papr_scm via newly introduced
include/linux/papr_scm.h.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Suggested-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
---
Changelog:
Repost of v3:
Link: https://lore.kernel.org/all/165763948558.3501667.16230079003621326755.stgit@ltc-boston123.aus.stglabs.ibm.com/
Rebased again, no changes.

Repost of v3:
Link: https://lore.kernel.org/nvdimm/165025666388.2927278.9540058958498766114.stgit@lep8c.aus.stglabs.ibm.com/
Rebased and no changes.

Since v2:
Link: https://patchwork.kernel.org/project/linux-nvdimm/patch/163454440296.431294.2368481747380790011.stgit@lep8c.aus.stglabs.ibm.com/
* Made it like v1, and rebased.
* Fixed repeating words in comments of the header file papr_scm.h

Since v1:
Link: https://patchwork.kernel.org/project/linux-nvdimm/patch/162505488483.72147.12741153746322191381.stgit@56e104a48989/
* Removed dependency on this patch for the other patches

 MAINTAINERS                               |    2
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  165 -----------------------------
 arch/powerpc/platforms/pseries/papr_scm.c |   43 --------
 include/linux/papr_scm.h                  |   49 +++++++++
 include/uapi/linux/papr_pdsm.h            |  165 +++++++++++++++++++++++++++++
 tools/testing/nvdimm/test/ndtest.c        |    2
 tools/testing/nvdimm/test/ndtest.h        |   31 -----
 7 files changed, 220 insertions(+), 237 deletions(-)
 delete mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
 create mode 100644 include/linux/papr_scm.h
 create mode 100644 include/uapi/linux/papr_pdsm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 39219b144c23..70da9aa81654 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12393,6 +12393,8 @@ F:	drivers/rtc/rtc-opal.c
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
index 1a53e048ceb7..362f1c77ccbb 100644
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
 #include <linux/perf_event.h>
@@ -29,46 +30,6 @@
 	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
 	 (1ul << ND_CMD_CALL))

-/* DIMM health bitmap indicators */
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
index 000000000000..eb36453813db
--- /dev/null
+++ b/include/linux/papr_scm.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __LINUX_PAPR_SCM_H
+#define __LINUX_PAPR_SCM_H
+
+/* DIMM health bitmap indicators */
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
+#define PAPR_PMEM_SAVE_FAILED               (1ULL << (63 - 10))
+
+/* Bits status indicators for health bitmap indicating unarmed dimm */
+#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED |            \
+				PAPR_PMEM_HEALTH_UNHEALTHY)
+
+/* Bits status indicators for health bitmap indicating unflushed dimm */
+#define PAPR_PMEM_BAD_SHUTDOWN_MASK (PAPR_PMEM_SHUTDOWN_DIRTY)
+
+/* Bits status indicators for health bitmap indicating unrestored dimm */
+#define PAPR_PMEM_BAD_RESTORE_MASK  (PAPR_PMEM_EMPTY)
+
+/* Bit status indicators for smart event notification */
+#define PAPR_PMEM_SMART_EVENT_MASK (PAPR_PMEM_HEALTH_CRITICAL | \
+					PAPR_PMEM_HEALTH_FATAL | \
+					PAPR_PMEM_HEALTH_UNHEALTHY)
+
+#define PAPR_PMEM_SAVE_MASK                (PAPR_PMEM_SAVE_FAILED)
+
+#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
+#define PAPR_SCM_PERF_STATS_VERSION 0x1
+
+#endif /* __LINUX_PAPR_SCM_H */
diff --git a/include/uapi/linux/papr_pdsm.h b/include/uapi/linux/papr_pdsm.h
new file mode 100644
index 000000000000..17439925045c
--- /dev/null
+++ b/include/uapi/linux/papr_pdsm.h
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
+ *
+ * (C) Copyright IBM 2020
+ *
+ * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
+ */
+
+#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_
+#define _UAPI_ASM_POWERPC_PAPR_PDSM_H_
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
+#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
diff --git a/tools/testing/nvdimm/test/ndtest.c b/tools/testing/nvdimm/test/ndtest.c
index b8419f460368..fa9d1327fc71 100644
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
index 2c54c9cbb90c..8f27ad6f7319 100644
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


