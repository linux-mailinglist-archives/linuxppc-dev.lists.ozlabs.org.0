Return-Path: <linuxppc-dev+bounces-6216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE7A36C1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2025 06:14:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yvxsb23C4z3bp7;
	Sat, 15 Feb 2025 16:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739596435;
	cv=none; b=CuKP8OkJYrxgw2W1PoHGHFZF1FA1e4fPWTosxhFwsERqOiWxwsG0jB3zPOJzLKKbEq/cmRorMw+4bWl43nfu0Bup563ftiREBrxWPe8NvdgjXXF0rHFN+FQIt21/6ur/hgM9b6CmdVm1oDTUzJJvv429eD3IWLW0qX1pjTC0EMWK72JIM9GDQHvJVK+V90ZEMBODsJo2i31xEKToddIQ9pj4UZ0nMp2QsAK4TnRIUiCclywnNdRAiQaZZifHxUqlJ1XOMrOIIkT/GimVyWbRWMYCqWQ+jpq6inTaQjvMraVnJJFq1XRp/f4LYycp/ArSGcAw2G7DNfG6JiGBvc/a4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739596435; c=relaxed/relaxed;
	bh=FO4ynmktUvI9JQCs4Eyr5aDcHGxgrtdtNo5JP+iEjNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYG1C4IKqOwAO+IM0w7W3tmAFChlM7JLbvOHeIVMsrzxZgO8mUth5ZGW+PLk4qZ4NQpXArAJTUqpy9V01SQKxmojyeyfHhQ2arfvI8OEu6mgL+ELDvXU0935QEZVC4oqxL99krnp23jaKPZy/jliZlV9cGWGlBbMJbH5xMSawX7ZewVjaUtSYlfY6Hw3nsTknKpwHn18qMa8gsa+wzElcOscdRa5MVDsaB4FasmhY1DGYYQt9raT5tOr6zE3Li2M9+QSFgVLtgopy0dgPycWHf66fxpJ1UhOvlLS+XmM6ywmDqk5lxUL7G0hGn5NmlpUk0wpdznRMsCHd1NmE6HskA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PwsbwtYe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PwsbwtYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvxsZ406Jz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 16:13:54 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51F2xKhg010636;
	Sat, 15 Feb 2025 05:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FO4ynmktUvI9JQCs4
	Eyr5aDcHGxgrtdtNo5JP+iEjNw=; b=PwsbwtYe7Ag2jN9wSceDf/SmHFHDWMaGQ
	FJeJpMkV0mHouCOPG9ibr/WUCTv0lq6q5FxmPdNJpg7P1gpyE6UBlu63DFsljS+x
	1DaC27iZzJQbvHKVhz64nQubxOElXIEKFRnxW8LmcwUOskXNUopPrQvwzAZ6OYIQ
	qojNGk1e+RKf0nVUyWeurRWLvvIGqI+dqyS7YH3ulixJ2tsqlnYYgtq6qi6z99K2
	tpp9k+b0Xc+BNQnA33ZsE/+4WqQJwyFfxIGre8ovhoM4ZSK6kvr6DGV/rPUuSxE1
	TZRQSWEMtFk8sX9K77DcPdgqnmqQ0Z/hPSeDDEmejUrw4E9ILUkrg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tjkvgcn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:47 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51F5Dlvg009740;
	Sat, 15 Feb 2025 05:13:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44tjkvgcn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51F3NSnb021886;
	Sat, 15 Feb 2025 05:13:46 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44phkt7989-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 05:13:46 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51F5DggT32178786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Feb 2025 05:13:42 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 194AC58059;
	Sat, 15 Feb 2025 05:13:42 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6EC758057;
	Sat, 15 Feb 2025 05:13:39 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.107.186])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 15 Feb 2025 05:13:39 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v6 7/7] powerpc/pseries: Add a char driver for physical-attestation RTAS
Date: Fri, 14 Feb 2025 21:13:09 -0800
Message-ID: <20250215051310.243099-8-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250215051310.243099-1-haren@linux.ibm.com>
References: <20250215051310.243099-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: uV0zNfeaT-mA8SiRDOn2Uje-JEHRe9Zn
X-Proofpoint-GUID: rFv7OGhfHLK_fnkd6yqmT9BXdZUk3v71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The RTAS call ibm,physical-attestation is used to retrieve
information about the trusted boot state of the firmware and
hypervisor on the system, and also Trusted Platform Modules (TPM)
data if the system is TCG 2.0 compliant.

This RTAS interface expects the caller to define different command
structs such as RetrieveTPMLog, RetrievePlatformCertificat and etc,
in a work area with a maximum size of 4K bytes and the response
buffer will be returned in the same work area.

The current implementation of this RTAS function is in the user
space but allocation of the work area is restricted with the system
lockdown. So this patch implements this RTAS function in the kernel
and expose to the user space with open/ioctl/read interfaces.

PAPR (2.13+ 21.3 ibm,physical-attestation) defines RTAS function:
- Pass the command struct to obtain the response buffer for the
  specific command.
- This RTAS function is sequence RTAS call and has to issue RTAS
  call multiple times to get the complete response buffer (max 64K).
  The hypervisor expects the first RTAS call with the sequence 1 and
  the subsequent calls with the sequence number returned from the
  previous calls.

Expose these interfaces to user space with a
/dev/papr-physical-attestation character device using the following
programming model:

 int devfd = open("/dev/papr-physical-attestation");
 int fd = ioctl(devfd, PAPR_PHY_ATTEST_IOC_HANDLE,
                      struct papr_phy_attest_io_block);
 - The user space defines the command struct and requests the
   response for any command.
 - Obtain the complete response buffer and returned the buffer as
   blob to the command specific FD.
 size = read(fd, buf, len);
 - Can retrieve the response buffer once or multiple times until the
   end of BLOB buffer.

Implemented this new kernel ABI support in librtas library for
system lockdown

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 arch/powerpc/include/asm/rtas.h               |   1 +
 .../uapi/asm/papr-physical-attestation.h      |  31 ++
 arch/powerpc/kernel/rtas.c                    |   2 +-
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 .../platforms/pseries/papr-phy-attest.c       | 287 ++++++++++++++++++
 6 files changed, 323 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr-physical-attestation.h
 create mode 100644 arch/powerpc/platforms/pseries/papr-phy-attest.c

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 1b661436aa7c..504d059970d4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -367,6 +367,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:linuxppc-dev>
 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
                                                                      <mailto:linuxppc-dev>
+0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
+                                                                     <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index fcd822f0e1d7..75fa0293c508 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -518,6 +518,7 @@ extern struct mutex rtas_ibm_get_vpd_lock;
 extern struct mutex rtas_ibm_get_indices_lock;
 extern struct mutex rtas_ibm_set_dynamic_indicator_lock;
 extern struct mutex rtas_ibm_get_dynamic_sensor_state_lock;
+extern struct mutex rtas_ibm_physical_attestation_lock;
 
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
diff --git a/arch/powerpc/include/uapi/asm/papr-physical-attestation.h b/arch/powerpc/include/uapi/asm/papr-physical-attestation.h
new file mode 100644
index 000000000000..ea746837bb9a
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-physical-attestation.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_PHYSICAL_ATTESTATION_H_
+#define _UAPI_PAPR_PHYSICAL_ATTESTATION_H_
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+#include <asm/papr-miscdev.h>
+
+#define PAPR_PHYATTEST_MAX_INPUT 4084 /* Max 4K buffer: 4K-12 */
+
+/*
+ * Defined in PAPR 2.13+ 21.6 Attestation Command Structures.
+ * User space pass this struct and the max size should be 4K.
+ */
+struct papr_phy_attest_io_block {
+	__u8 version;
+	__u8 command;
+	__u8 TCG_major_ver;
+	__u8 TCG_minor_ver;
+	__be32 length;
+	__be32 correlator;
+	__u8 payload[PAPR_PHYATTEST_MAX_INPUT];
+};
+
+/*
+ * ioctl for /dev/papr-physical-attestation. Returns a attestation
+ * command fd handle
+ */
+#define PAPR_PHY_ATTEST_IOC_HANDLE _IOW(PAPR_MISCDEV_IOC_ID, 8, struct papr_phy_attest_io_block)
+
+#endif /* _UAPI_PAPR_PHYSICAL_ATTESTATION_H_ */
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index a4848e7f248e..d097007fb80b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -93,7 +93,7 @@ struct rtas_function {
  */
 static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
 static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
-static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
+DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
 DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
 DEFINE_MUTEX(rtas_ibm_get_indices_lock);
 DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index c82c94e0a73c..dec45d0cdc2e 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -4,7 +4,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o rtas-work-area.o papr-sysparm.o \
 			   papr-rtas-common.o papr-vpd.o papr-indices.o \
-			   papr-platform-dump.o \
+			   papr-platform-dump.o papr-phy-attest.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
diff --git a/arch/powerpc/platforms/pseries/papr-phy-attest.c b/arch/powerpc/platforms/pseries/papr-phy-attest.c
new file mode 100644
index 000000000000..e51e2ed58ac3
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-phy-attest.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "papr-phy-attest: " fmt
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
+#include <uapi/asm/papr-physical-attestation.h>
+#include "papr-rtas-common.h"
+
+/**
+ * struct rtas_phy_attest_params - Parameters (in and out) for
+ * ibm,physical-attestation.
+ *
+ * @cmd:  In: Caller-provided attestation command buffer. Must be
+ *        RTAS-addressable.
+ * @work_area: In: Caller-provided work area buffer for attestation
+ *             command structure
+ *             Out: Caller-provided work area buffer for the response
+ * @cmd_len:   In: Caller-provided attestation command structure
+ *             length
+ * @sequence:  In: Sequence number. Out: Next sequence number.
+ * @written:   Out: Bytes written by ibm,physical-attestation to
+ *             @work_area.
+ * @status:    Out: RTAS call status.
+ */
+struct rtas_phy_attest_params {
+	struct papr_phy_attest_io_block cmd;
+	struct rtas_work_area *work_area;
+	u32 cmd_len;
+	u32 sequence;
+	u32 written;
+	s32 status;
+};
+
+/**
+ * rtas_physical_attestation() - Call ibm,physical-attestation to
+ * fill a work area buffer.
+ * @params: See &struct rtas_phy_attest_params.
+ *
+ * Calls ibm,physical-attestation until it errors or successfully
+ * deposits data into the supplied work area. Handles RTAS retry
+ * statuses. Maps RTAS error statuses to reasonable errno values.
+ *
+ * The caller is expected to invoke rtas_physical_attestation()
+ * multiple times to retrieve all the data for the provided
+ * attestation command. Only one sequence should be in progress at
+ * any time; starting a new sequence will disrupt any sequence
+ * already in progress. Serialization of attestation retrieval
+ * sequences is the responsibility of the caller.
+ *
+ * The caller should inspect @params.status to determine whether more
+ * calls are needed to complete the sequence.
+ *
+ * Context: May sleep.
+ * Return: -ve on error, 0 otherwise.
+ */
+static int rtas_physical_attestation(struct rtas_phy_attest_params *params)
+{
+	struct rtas_work_area *work_area;
+	s32 fwrc, token;
+	u32 rets[2];
+	int ret;
+
+	work_area = params->work_area;
+	token = rtas_function_token(RTAS_FN_IBM_PHYSICAL_ATTESTATION);
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -ENOENT;
+
+	lockdep_assert_held(&rtas_ibm_physical_attestation_lock);
+
+	do {
+		fwrc = rtas_call(token, 3, 3, rets,
+				 rtas_work_area_phys(work_area),
+				 params->cmd_len,
+				 params->sequence);
+	} while (rtas_busy_delay(fwrc));
+
+	switch (fwrc) {
+	case RTAS_HARDWARE_ERROR:
+		ret = -EIO;
+		break;
+	case RTAS_INVALID_PARAMETER:
+		ret = -EINVAL;
+		break;
+	case RTAS_SEQ_MORE_DATA:
+		params->sequence = rets[0];
+		fallthrough;
+	case RTAS_SEQ_COMPLETE:
+		params->written = rets[1];
+		/*
+		 * Kernel or firmware bug, do not continue.
+		 */
+		if (WARN(params->written > rtas_work_area_size(work_area),
+			 "possible write beyond end of work area"))
+			ret = -EFAULT;
+		else
+			ret = 0;
+		break;
+	default:
+		ret = -EIO;
+		pr_err_ratelimited("unexpected ibm,get-phy_attest status %d\n", fwrc);
+		break;
+	}
+
+	params->status = fwrc;
+	return ret;
+}
+
+/*
+ * Internal physical-attestation sequence APIs. A physical-attestation
+ * sequence is a series of calls to get ibm,physical-attestation
+ * for a given attestation command. The sequence ends when an error
+ * is encountered or all data for the attestation command has been
+ * returned.
+ */
+
+/**
+ * phy_attest_sequence_begin() - Begin a response data for attestation
+ * command retrieval sequence.
+ *
+ * Context: May sleep.
+ */
+static void phy_attest_sequence_begin(struct papr_rtas_sequence *seq)
+{
+	struct rtas_phy_attest_params *param;
+
+	/*
+	 * We could allocate the work area before acquiring the
+	 * function lock, but that would allow concurrent requests to
+	 * exhaust the limited work area pool for no benefit. So
+	 * allocate the work area under the lock.
+	 */
+	mutex_lock(&rtas_ibm_physical_attestation_lock);
+	param =  (struct rtas_phy_attest_params *)seq->params;
+	param->work_area = rtas_work_area_alloc(SZ_4K);
+	memcpy(rtas_work_area_raw_buf(param->work_area), &param->cmd,
+			param->cmd_len);
+	param->sequence = 1;
+	param->status = 0;
+}
+
+/**
+ * phy_attest_sequence_end() - Finalize a attestation command
+ * response retrieval sequence.
+ * @seq: Sequence state.
+ *
+ * Releases resources obtained by phy_attest_sequence_begin().
+ */
+static void phy_attest_sequence_end(struct papr_rtas_sequence *seq)
+{
+	struct rtas_phy_attest_params *param;
+
+	param =  (struct rtas_phy_attest_params *)seq->params;
+	rtas_work_area_free(param->work_area);
+	mutex_unlock(&rtas_ibm_physical_attestation_lock);
+	kfree(param);
+}
+
+/*
+ * Generator function to be passed to papr_rtas_blob_generate().
+ */
+static const char *phy_attest_sequence_fill_work_area(struct papr_rtas_sequence *seq,
+						size_t *len)
+{
+	struct rtas_phy_attest_params *p;
+	bool init_state;
+
+	p = (struct rtas_phy_attest_params *)seq->params;
+	init_state = (p->written == 0) ? true : false;
+
+	if (papr_rtas_sequence_should_stop(seq, p->status, init_state))
+		return NULL;
+	if (papr_rtas_sequence_set_err(seq, rtas_physical_attestation(p)))
+		return NULL;
+	*len = p->written;
+	return rtas_work_area_raw_buf(p->work_area);
+}
+
+static const struct file_operations papr_phy_attest_handle_ops = {
+	.read = papr_rtas_common_handle_read,
+	.llseek = papr_rtas_common_handle_seek,
+	.release = papr_rtas_common_handle_release,
+};
+
+/**
+ * papr_phy_attest_create_handle() - Create a fd-based handle for
+ * reading the response for the given attestation command.
+ * @ulc: Attestation command in user memory; defines the scope of
+ *       data for the attestation command to retrieve.
+ *
+ * Handler for PAPR_PHYSICAL_ATTESTATION_IOC_CREATE_HANDLE ioctl
+ * command. Validates @ulc and instantiates an immutable response
+ * "blob" for attestation command. The blob is attached to a file
+ * descriptor for reading by user space. The memory backing the blob
+ * is freed when the file is released.
+ *
+ * The entire requested response buffer for the attestation command
+ * retrieved by this call and all necessary RTAS interactions are
+ * performed before returning the fd to user space. This keeps the
+ * read handler simple and ensures that kernel can prevent
+ * interleaving ibm,physical-attestation call sequences.
+ *
+ * Return: The installed fd number if successful, -ve errno otherwise.
+ */
+static long papr_phy_attest_create_handle(struct papr_phy_attest_io_block __user *ulc)
+{
+	struct rtas_phy_attest_params *params;
+	struct papr_rtas_sequence seq = {};
+	int fd;
+
+	/*
+	 * Freed in phy_attest_sequence_end().
+	 */
+	params =  kzalloc(sizeof(*params), GFP_KERNEL_ACCOUNT);
+	if (!params)
+		return -ENOMEM;
+
+	if (copy_from_user(&params->cmd, ulc,
+			sizeof(struct papr_phy_attest_io_block)))
+		return -EFAULT;
+
+	params->cmd_len = be32_to_cpu(params->cmd.length);
+	seq = (struct papr_rtas_sequence) {
+		.begin = phy_attest_sequence_begin,
+		.end = phy_attest_sequence_end,
+		.work = phy_attest_sequence_fill_work_area,
+	};
+
+	seq.params = (void *)params;
+
+	fd = papr_rtas_setup_file_interface(&seq,
+			&papr_phy_attest_handle_ops,
+			"[papr-physical-attestation]");
+
+	return fd;
+}
+
+/*
+ * Top-level ioctl handler for /dev/papr-physical-attestation.
+ */
+static long papr_phy_attest_dev_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+{
+	void __user *argp = (__force void __user *)arg;
+	long ret;
+
+	switch (ioctl) {
+	case PAPR_PHY_ATTEST_IOC_HANDLE:
+		ret = papr_phy_attest_create_handle(argp);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+	return ret;
+}
+
+static const struct file_operations papr_phy_attest_ops = {
+	.unlocked_ioctl = papr_phy_attest_dev_ioctl,
+};
+
+static struct miscdevice papr_phy_attest_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "papr-physical-attestation",
+	.fops = &papr_phy_attest_ops,
+};
+
+static __init int papr_phy_attest_init(void)
+{
+	if (!rtas_function_implemented(RTAS_FN_IBM_PHYSICAL_ATTESTATION))
+		return -ENODEV;
+
+	return misc_register(&papr_phy_attest_dev);
+}
+machine_device_initcall(pseries, papr_phy_attest_init);
-- 
2.43.5


