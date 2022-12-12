Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9400664AB11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:03:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWHHR37GJz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:03:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwRrs+Tx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwRrs+Tx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWHFP2SyGz3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:02:00 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCMLCpH030042
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lswuK4pfCT7fxKWeHkMYDYd3auI3HcoNfAmcTS4Mbt4=;
 b=gwRrs+TxPbUDYxP8u2HHo7D+b3v+W8fSKoeBOEUFkWYNe5zjFUiUNFab8hB+/DuYtfpX
 /MUtZS3jH1OBgI4uCfkWHJ3HFOUvhI3J0swemk8WsjS6rUtVsrHlKqu55VwzZCjpiN/m
 BM5ZRCYQ7uiv0McPGWxFM9jyWfBFRSWeDUYQ4kpMmqzjtAFcmY9KVzxOqfcZ3fPPMaRr
 5MgHXcRxX63aP5KK4mz6LAfRXKyZPEw38trFPDzpa3GbbrPeUaXUmT9d2FOe7Hvyt2nd
 QBat0dC+oDXYBvYfyCGkEvRBqkDHYXkojuPYFdgii2yCrPYQze1S9m9PZ/MPT0i7wQv9 VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3med158s9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:58 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMwDp6025269
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3med158s9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCKeqwH010331;
	Mon, 12 Dec 2022 23:01:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6qs3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BCN1t6u63373590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 23:01:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A08858098;
	Mon, 12 Dec 2022 23:01:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E726D58056;
	Mon, 12 Dec 2022 23:01:54 +0000 (GMT)
Received: from localhost (unknown [9.163.54.62])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Dec 2022 23:01:54 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/rtas: improve function information lookups
Date: Mon, 12 Dec 2022 17:01:51 -0600
Message-Id: <20221212230154.851325-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221212230154.851325-1-nathanl@linux.ibm.com>
References: <20221212230154.851325-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J9ZV-MQEjZxTJ8RPRzbn8BUFVPneie2o
X-Proofpoint-GUID: Ll8wwhovdulRkbKcIWhxWMGgye5SV9-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120194
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The core RTAS support code and its clients perform two types of lookup
for RTAS firmware function information.

First, mapping a known function name to a token. The typical use case
invokes rtas_token() to retrieve the token value to pass to
rtas_call(). rtas_token() relies on of_get_property(), which performs
a linear search of the /rtas node's property list under a lock with
IRQs disabled.

Second, and less common: given a token value, looking up some
information about the function. The primary example is the sys_rtas
filter path, which linearly scans a small table to match the token to
a rtas_filter struct. Another use case to come is RTAS entry/exit
tracepoints, which will require efficient lookup of function names
from token values. Currently there is no general API for this.

We need something much like the existing rtas_filters table, but more
general and organized to facilitate efficient lookups.

Introduce:

* A new rtas_function type, aggregating function name, token,
  and filter. Other function characteristics could be added in the
  future.

* An array of rtas_function, where each element corresponds to a known
  RTAS function. All information in the table is static save the token
  values, which are derived from the device tree at boot. The array is
  sorted by function name to allow binary search.

* A named constant for each known RTAS function, used to index the
  function array. These also will be used in a client-facing API to be
  added later.

* An xarray that maps valid tokens to rtas_function objects.

Fold the existing rtas_filter table into the new rtas_function array,
with the appropriate adjustments to block_rtas_call(). Remove
now-redundant fields from struct rtas_filter. Preserve the function of
the CONFIG_CPU_BIG_ENDIAN guard in the current filter table by
introducing a per-function flag that is set for the function entries
related to pseries LPAR migration. These have never had working users
via sys_rtas on ppc64le; see commit de0f7349a0dd ("powerpc/rtas:
prevent suspend-related sys_rtas use on LE").

Convert rtas_token() to use a lockless binary search on the function
table. Fall back to the old behavior for lookups against names that
are not known to be RTAS functions, but issue a warning. rtas_token()
is for function names; it is not a general facility for accessing
arbitrary properties of the /rtas node. All known misuses of
rtas_token() have been converted to more appropriate of_ APIs in
preceding changes.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  87 ++++
 arch/powerpc/kernel/rtas.c      | 741 +++++++++++++++++++++++++++-----
 2 files changed, 715 insertions(+), 113 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 479a95cb2770..14fe79217c26 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -16,6 +16,93 @@
  * Copyright (C) 2001 PPC 64 Team, IBM Corp
  */
 
+#define rtas_fnidx(x_) RTAS_FNIDX__ ## x_
+
+enum rtas_function_index {
+	rtas_fnidx(CHECK_EXCEPTION),
+	rtas_fnidx(DISPLAY_CHARACTER),
+	rtas_fnidx(EVENT_SCAN),
+	rtas_fnidx(FREEZE_TIME_BASE),
+	rtas_fnidx(GET_POWER_LEVEL),
+	rtas_fnidx(GET_SENSOR_STATE),
+	rtas_fnidx(GET_TERM_CHAR),
+	rtas_fnidx(GET_TIME_OF_DAY),
+	rtas_fnidx(IBM_ACTIVATE_FIRMWARE),
+	rtas_fnidx(IBM_CBE_START_PTCAL),
+	rtas_fnidx(IBM_CBE_STOP_PTCAL),
+	rtas_fnidx(IBM_CHANGE_MSI),
+	rtas_fnidx(IBM_CLOSE_ERRINJCT),
+	rtas_fnidx(IBM_CONFIGURE_BRIDGE),
+	rtas_fnidx(IBM_CONFIGURE_CONNECTOR),
+	rtas_fnidx(IBM_CONFIGURE_KERNEL_DUMP),
+	rtas_fnidx(IBM_CONFIGURE_PE),
+	rtas_fnidx(IBM_CREATE_PE_DMA_WINDOW),
+	rtas_fnidx(IBM_DISPLAY_MESSAGE),
+	rtas_fnidx(IBM_ERRINJCT),
+	rtas_fnidx(IBM_EXTI2C),
+	rtas_fnidx(IBM_GET_CONFIG_ADDR_INFO),
+	rtas_fnidx(IBM_GET_CONFIG_ADDR_INFO2),
+	rtas_fnidx(IBM_GET_DYNAMIC_SENSOR_STATE),
+	rtas_fnidx(IBM_GET_INDICES),
+	rtas_fnidx(IBM_GET_RIO_TOPOLOGY),
+	rtas_fnidx(IBM_GET_SYSTEM_PARAMETER),
+	rtas_fnidx(IBM_GET_VPD),
+	rtas_fnidx(IBM_GET_XIVE),
+	rtas_fnidx(IBM_INT_OFF),
+	rtas_fnidx(IBM_INT_ON),
+	rtas_fnidx(IBM_IO_QUIESCE_ACK),
+	rtas_fnidx(IBM_LPAR_PERFTOOLS),
+	rtas_fnidx(IBM_MANAGE_FLASH_IMAGE),
+	rtas_fnidx(IBM_MANAGE_STORAGE_PRESERVATION),
+	rtas_fnidx(IBM_NMI_INTERLOCK),
+	rtas_fnidx(IBM_NMI_REGISTER),
+	rtas_fnidx(IBM_OPEN_ERRINJCT),
+	rtas_fnidx(IBM_OPEN_SRIOV_ALLOW_UNFREEZE),
+	rtas_fnidx(IBM_OPEN_SRIOV_MAP_PE_NUMBER),
+	rtas_fnidx(IBM_OS_TERM),
+	rtas_fnidx(IBM_PARTNER_CONTROL),
+	rtas_fnidx(IBM_PHYSICAL_ATTESTATION),
+	rtas_fnidx(IBM_PLATFORM_DUMP),
+	rtas_fnidx(IBM_POWER_OFF_UPS),
+	rtas_fnidx(IBM_QUERY_INTERRUPT_SOURCE_NUMBER),
+	rtas_fnidx(IBM_QUERY_PE_DMA_WINDOW),
+	rtas_fnidx(IBM_READ_PCI_CONFIG),
+	rtas_fnidx(IBM_READ_SLOT_RESET_STATE),
+	rtas_fnidx(IBM_READ_SLOT_RESET_STATE2),
+	rtas_fnidx(IBM_REMOVE_PE_DMA_WINDOW),
+	rtas_fnidx(IBM_RESET_PE_DMA_WINDOWS),
+	rtas_fnidx(IBM_SCAN_LOG_DUMP),
+	rtas_fnidx(IBM_SET_DYNAMIC_INDICATOR),
+	rtas_fnidx(IBM_SET_EEH_OPTION),
+	rtas_fnidx(IBM_SET_SLOT_RESET),
+	rtas_fnidx(IBM_SET_SYSTEM_PARAMETER),
+	rtas_fnidx(IBM_SET_XIVE),
+	rtas_fnidx(IBM_SLOT_ERROR_DETAIL),
+	rtas_fnidx(IBM_SUSPEND_ME),
+	rtas_fnidx(IBM_TUNE_DMA_PARMS),
+	rtas_fnidx(IBM_UPDATE_FLASH_64_AND_REBOOT),
+	rtas_fnidx(IBM_UPDATE_NODES),
+	rtas_fnidx(IBM_UPDATE_PROPERTIES),
+	rtas_fnidx(IBM_VALIDATE_FLASH_IMAGE),
+	rtas_fnidx(IBM_WRITE_PCI_CONFIG),
+	rtas_fnidx(NVRAM_FETCH),
+	rtas_fnidx(NVRAM_STORE),
+	rtas_fnidx(POWER_OFF),
+	rtas_fnidx(PUT_TERM_CHAR),
+	rtas_fnidx(QUERY_CPU_STOPPED_STATE),
+	rtas_fnidx(READ_PCI_CONFIG),
+	rtas_fnidx(RTAS_LAST_ERROR),
+	rtas_fnidx(SET_INDICATOR),
+	rtas_fnidx(SET_POWER_LEVEL),
+	rtas_fnidx(SET_TIME_FOR_POWER_ON),
+	rtas_fnidx(SET_TIME_OF_DAY),
+	rtas_fnidx(START_CPU),
+	rtas_fnidx(STOP_SELF),
+	rtas_fnidx(SYSTEM_REBOOT),
+	rtas_fnidx(THAW_TIME_BASE),
+	rtas_fnidx(WRITE_PCI_CONFIG),
+};
+
 #define RTAS_UNKNOWN_SERVICE (-1)
 #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
 
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index deded51a7978..ac52b10a72d8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -9,10 +9,12 @@
 
 #define pr_fmt(fmt)	"rtas: " fmt
 
+#include <linux/bsearch.h>
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/init.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
@@ -26,6 +28,7 @@
 #include <linux/syscalls.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/xarray.h>
 
 #include <asm/delay.h>
 #include <asm/firmware.h>
@@ -37,6 +40,491 @@
 #include <asm/time.h>
 #include <asm/udbg.h>
 
+/**
+ * enum rtas_function_flags - Properties of RTAS functions.
+ * @RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE: Function has never had users via
+ *                                         sys_rtas on ppc64le, and we aim to
+ *                                         keep it that way.
+ */
+enum rtas_function_flags {
+	RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE = (1 << 0),
+};
+
+struct rtas_filter {
+	/* Indexes into the args buffer, -1 if not used */
+	const int buf_idx1;
+	const int size_idx1;
+	const int buf_idx2;
+	const int size_idx2;
+	/*
+	 * Assumed buffer size per the spec if the function does not
+	 * have a size parameter, e.g. ibm,errinjct. 0 if unused.
+	 */
+	const int fixed_size;
+};
+
+/**
+ * struct rtas_function - Descriptor for RTAS functions.
+ *
+ * @token: value of @name if it exists under the /rtas node
+ * @name: function name
+ * @flags: properties of the function
+ * @filter: If non-NULL and allowed by @flags, invoking this function via the
+ *          rtas syscall is allowed, and @filter describes constraints on
+ *          the arguments.
+ */
+struct rtas_function {
+	s32 token;
+	const u16 flags;
+	const char * const name;
+	const struct rtas_filter *filter;
+};
+
+static struct rtas_function rtas_function_table[] __ro_after_init = {
+	[rtas_fnidx(CHECK_EXCEPTION)] = {
+		.name = "check-exception",
+	},
+	[rtas_fnidx(DISPLAY_CHARACTER)] = {
+		.name = "display-character",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(EVENT_SCAN)] = {
+		.name = "event-scan",
+	},
+	[rtas_fnidx(FREEZE_TIME_BASE)] = {
+		.name = "freeze-time-base",
+	},
+	[rtas_fnidx(GET_POWER_LEVEL)] = {
+		.name = "get-power-level",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(GET_SENSOR_STATE)] = {
+		.name = "get-sensor-state",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(GET_TERM_CHAR)] = {
+		.name = "get-term-char",
+	},
+	[rtas_fnidx(GET_TIME_OF_DAY)] = {
+		.name = "get-time-of-day",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_ACTIVATE_FIRMWARE)] = {
+		.name = "ibm,activate-firmware",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_CBE_START_PTCAL)] = {
+		.name = "ibm,cbe-start-ptcal",
+	},
+	[rtas_fnidx(IBM_CBE_STOP_PTCAL)] = {
+		.name = "ibm,cbe-stop-ptcal",
+	},
+	[rtas_fnidx(IBM_CHANGE_MSI)] = {
+		.name = "ibm,change-msi",
+	},
+	[rtas_fnidx(IBM_CLOSE_ERRINJCT)] = {
+		.name = "ibm,close-errinjct",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_CONFIGURE_BRIDGE)] = {
+		.name = "ibm,configure-bridge",
+	},
+	[rtas_fnidx(IBM_CONFIGURE_CONNECTOR)] = {
+		.name = "ibm,configure-connector",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = -1,
+			.buf_idx2 = 1, .size_idx2 = -1,
+			.fixed_size = 4096,
+		},
+	},
+	[rtas_fnidx(IBM_CONFIGURE_KERNEL_DUMP)] = {
+		.name = "ibm,configure-kernel-dump",
+	},
+	[rtas_fnidx(IBM_CONFIGURE_PE)] = {
+		.name = "ibm,configure-pe",
+	},
+	[rtas_fnidx(IBM_CREATE_PE_DMA_WINDOW)] = {
+		.name = "ibm,create-pe-dma-window",
+	},
+	[rtas_fnidx(IBM_DISPLAY_MESSAGE)] = {
+		.name = "ibm,display-message",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_ERRINJCT)] = {
+		.name = "ibm,errinjct",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 2, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+			.fixed_size = 1024,
+		},
+	},
+	[rtas_fnidx(IBM_EXTI2C)] = {
+		.name = "ibm,exti2c",
+	},
+	[rtas_fnidx(IBM_GET_CONFIG_ADDR_INFO)] = {
+		.name = "ibm,get-config-addr-info",
+	},
+	[rtas_fnidx(IBM_GET_CONFIG_ADDR_INFO2)] = {
+		.name = "ibm,get-config-addr-info2",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_GET_DYNAMIC_SENSOR_STATE)] = {
+		.name = "ibm,get-dynamic-sensor-state",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_GET_INDICES)] = {
+		.name = "ibm,get-indices",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 2, .size_idx1 = 3,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_GET_RIO_TOPOLOGY)] = {
+		.name = "ibm,get-rio-topology",
+	},
+	[rtas_fnidx(IBM_GET_SYSTEM_PARAMETER)] = {
+		.name = "ibm,get-system-parameter",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 1, .size_idx1 = 2,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_GET_VPD)] = {
+		.name = "ibm,get-vpd",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = -1,
+			.buf_idx2 = 1, .size_idx2 = 2,
+		},
+	},
+	[rtas_fnidx(IBM_GET_XIVE)] = {
+		.name = "ibm,get-xive",
+	},
+	[rtas_fnidx(IBM_INT_OFF)] = {
+		.name = "ibm,int-off",
+	},
+	[rtas_fnidx(IBM_INT_ON)] = {
+		.name = "ibm,int-on",
+	},
+	[rtas_fnidx(IBM_IO_QUIESCE_ACK)] = {
+		.name = "ibm,io-quiesce-ack",
+	},
+	[rtas_fnidx(IBM_LPAR_PERFTOOLS)] = {
+		.name = "ibm,lpar-perftools",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 2, .size_idx1 = 3,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_MANAGE_FLASH_IMAGE)] = {
+		.name = "ibm,manage-flash-image",
+	},
+	[rtas_fnidx(IBM_MANAGE_STORAGE_PRESERVATION)] = {
+		.name = "ibm,manage-storage-preservation",
+	},
+	[rtas_fnidx(IBM_NMI_INTERLOCK)] = {
+		.name = "ibm,nmi-interlock",
+	},
+	[rtas_fnidx(IBM_NMI_REGISTER)] = {
+		.name = "ibm,nmi-register",
+	},
+	[rtas_fnidx(IBM_OPEN_ERRINJCT)] = {
+		.name = "ibm,open-errinjct",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_OPEN_SRIOV_ALLOW_UNFREEZE)] = {
+		.name = "ibm,open-sriov-allow-unfreeze",
+	},
+	[rtas_fnidx(IBM_OPEN_SRIOV_MAP_PE_NUMBER)] = {
+		.name = "ibm,open-sriov-map-pe-number",
+	},
+	[rtas_fnidx(IBM_OS_TERM)] = {
+		.name = "ibm,os-term",
+	},
+	[rtas_fnidx(IBM_PARTNER_CONTROL)] = {
+		.name = "ibm,partner-control",
+	},
+	[rtas_fnidx(IBM_PHYSICAL_ATTESTATION)] = {
+		.name = "ibm,physical-attestation",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = 1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_PLATFORM_DUMP)] = {
+		.name = "ibm,platform-dump",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 4, .size_idx1 = 5,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_POWER_OFF_UPS)] = {
+		.name = "ibm,power-off-ups",
+	},
+	[rtas_fnidx(IBM_QUERY_INTERRUPT_SOURCE_NUMBER)] = {
+		.name = "ibm,query-interrupt-source-number",
+	},
+	[rtas_fnidx(IBM_QUERY_PE_DMA_WINDOW)] = {
+		.name = "ibm,query-pe-dma-window",
+	},
+	[rtas_fnidx(IBM_READ_PCI_CONFIG)] = {
+		.name = "ibm,read-pci-config",
+	},
+	[rtas_fnidx(IBM_READ_SLOT_RESET_STATE)] = {
+		.name = "ibm,read-slot-reset-state",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_READ_SLOT_RESET_STATE2)] = {
+		.name = "ibm,read-slot-reset-state2",
+	},
+	[rtas_fnidx(IBM_REMOVE_PE_DMA_WINDOW)] = {
+		.name = "ibm,remove-pe-dma-window",
+	},
+	[rtas_fnidx(IBM_RESET_PE_DMA_WINDOWS)] = {
+		.name = "ibm,reset-pe-dma-windows",
+	},
+	[rtas_fnidx(IBM_SCAN_LOG_DUMP)] = {
+		.name = "ibm,scan-log-dump",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = 1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_SET_DYNAMIC_INDICATOR)] = {
+		.name = "ibm,set-dynamic-indicator",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 2, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_SET_EEH_OPTION)] = {
+		.name = "ibm,set-eeh-option",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_SET_SLOT_RESET)] = {
+		.name = "ibm,set-slot-reset",
+	},
+	[rtas_fnidx(IBM_SET_SYSTEM_PARAMETER)] = {
+		.name = "ibm,set-system-parameter",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_SET_XIVE)] = {
+		.name = "ibm,set-xive",
+	},
+	[rtas_fnidx(IBM_SLOT_ERROR_DETAIL)] = {
+		.name = "ibm,slot-error-detail",
+	},
+	[rtas_fnidx(IBM_SUSPEND_ME)] = {
+		.name = "ibm,suspend-me",
+		.flags = RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE,
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(IBM_TUNE_DMA_PARMS)] = {
+		.name = "ibm,tune-dma-parms",
+	},
+	[rtas_fnidx(IBM_UPDATE_FLASH_64_AND_REBOOT)] = {
+		.name = "ibm,update-flash-64-and-reboot",
+	},
+	[rtas_fnidx(IBM_UPDATE_NODES)] = {
+		.name = "ibm,update-nodes",
+		.flags = RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE,
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+			.fixed_size = 4096,
+		},
+	},
+	[rtas_fnidx(IBM_UPDATE_PROPERTIES)] = {
+		.name = "ibm,update-properties",
+		.flags = RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE,
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = 0, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+			.fixed_size = 4096,
+		},
+	},
+	[rtas_fnidx(IBM_VALIDATE_FLASH_IMAGE)] = {
+		.name = "ibm,validate-flash-image",
+	},
+	[rtas_fnidx(IBM_WRITE_PCI_CONFIG)] = {
+		.name = "ibm,write-pci-config",
+	},
+	[rtas_fnidx(NVRAM_FETCH)] = {
+		.name = "nvram-fetch",
+	},
+	[rtas_fnidx(NVRAM_STORE)] = {
+		.name = "nvram-store",
+	},
+	[rtas_fnidx(POWER_OFF)] = {
+		.name = "power-off",
+	},
+	[rtas_fnidx(PUT_TERM_CHAR)] = {
+		.name = "put-term-char",
+	},
+	[rtas_fnidx(QUERY_CPU_STOPPED_STATE)] = {
+		.name = "query-cpu-stopped-state",
+	},
+	[rtas_fnidx(READ_PCI_CONFIG)] = {
+		.name = "read-pci-config",
+	},
+	[rtas_fnidx(RTAS_LAST_ERROR)] = {
+		.name = "rtas-last-error",
+	},
+	[rtas_fnidx(SET_INDICATOR)] = {
+		.name = "set-indicator",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(SET_POWER_LEVEL)] = {
+		.name = "set-power-level",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(SET_TIME_FOR_POWER_ON)] = {
+		.name = "set-time-for-power-on",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(SET_TIME_OF_DAY)] = {
+		.name = "set-time-of-day",
+		.filter = &(const struct rtas_filter) {
+			.buf_idx1 = -1, .size_idx1 = -1,
+			.buf_idx2 = -1, .size_idx2 = -1,
+		},
+	},
+	[rtas_fnidx(START_CPU)] = {
+		.name = "start-cpu",
+	},
+	[rtas_fnidx(STOP_SELF)] = {
+		.name = "stop-self",
+	},
+	[rtas_fnidx(SYSTEM_REBOOT)] = {
+		.name = "system-reboot",
+	},
+	[rtas_fnidx(THAW_TIME_BASE)] = {
+		.name = "thaw-time-base",
+	},
+	[rtas_fnidx(WRITE_PCI_CONFIG)] = {
+		.name = "write-pci-config",
+	},
+};
+
+static int rtas_function_cmp(const void *a, const void *b)
+{
+	const struct rtas_function *f1 = a;
+	const struct rtas_function *f2 = b;
+
+	return strcmp(f1->name, f2->name);
+}
+
+/*
+ * Boot-time initialization of the function table needs the lookup to
+ * return a non-const-qualified object. Use rtas_name_to_function()
+ * in all other contexts.
+ */
+static struct rtas_function *__rtas_name_to_function(const char *name)
+{
+	const struct rtas_function key = {
+		.name = name,
+	};
+	struct rtas_function *found;
+
+	found = bsearch(&key, rtas_function_table, ARRAY_SIZE(rtas_function_table),
+			sizeof(rtas_function_table[0]), rtas_function_cmp);
+
+	return found;
+}
+
+static const struct rtas_function *rtas_name_to_function(const char *name)
+{
+	return __rtas_name_to_function(name);
+}
+
+static DEFINE_XARRAY(rtas_token_to_function_xarray);
+
+static int __init rtas_token_to_function_xarray_init(void)
+{
+	int err = 0;
+
+	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
+		const struct rtas_function *func = &rtas_function_table[i];
+		const s32 token = func->token;
+
+		if (token == RTAS_UNKNOWN_SERVICE)
+			continue;
+
+		err = xa_err(xa_store(&rtas_token_to_function_xarray,
+				      token, (void *)func, GFP_KERNEL));
+		if (err)
+			break;
+	}
+
+	return err;
+}
+arch_initcall(rtas_token_to_function_xarray_init);
+
+static const struct rtas_function *rtas_token_to_function(s32 token)
+{
+	const struct rtas_function *func;
+
+	if (WARN_ONCE(token < 0, "invalid token %d", token))
+		return NULL;
+
+	func = xa_load(&rtas_token_to_function_xarray, token);
+
+	if (WARN_ONCE(!func, "unexpected failed lookup for token %d", token))
+		return NULL;
+
+	return func;
+}
+
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
@@ -330,9 +818,25 @@ EXPORT_SYMBOL(rtas_progress);		/* needed by rtas_flash module */
 
 int rtas_token(const char *service)
 {
+	const struct rtas_function *func;
 	const __be32 *tokp;
+
 	if (rtas.dev == NULL)
 		return RTAS_UNKNOWN_SERVICE;
+
+	func = rtas_name_to_function(service);
+	if (func)
+		return func->token;
+	/*
+	 * The caller is looking up a name that is not known to be an
+	 * RTAS function. Either it's a function that needs to be
+	 * added to the table, or they're misusing rtas_token() to
+	 * access non-function properties of the /rtas node. Warn and
+	 * fall back to the legacy behavior.
+	 */
+	WARN_ONCE(1, "unknown function `%s`, should it be added to rtas_function_table?\n",
+		  service);
+
 	tokp = of_get_property(rtas.dev, service, NULL);
 	return tokp ? be32_to_cpu(*tokp) : RTAS_UNKNOWN_SERVICE;
 }
@@ -1063,56 +1567,12 @@ noinstr struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log
  *
  * Accordingly, we filter RTAS requests to check that the call is
  * permitted, and that provided pointers fall within the RMO buffer.
- * The rtas_filters list contains an entry for each permitted call,
- * with the indexes of the parameters which are expected to contain
- * addresses and sizes of buffers allocated inside the RMO buffer.
+ * If a function is allowed to be invoked via the syscall, then its
+ * entry in the rtas_functions table points to a rtas_filter that
+ * describes its constraints, with the indexes of the parameters which
+ * are expected to contain addresses and sizes of buffers allocated
+ * inside the RMO buffer.
  */
-struct rtas_filter {
-	const char *name;
-	int token;
-	/* Indexes into the args buffer, -1 if not used */
-	int buf_idx1;
-	int size_idx1;
-	int buf_idx2;
-	int size_idx2;
-
-	int fixed_size;
-};
-
-static struct rtas_filter rtas_filters[] __ro_after_init = {
-	{ "ibm,activate-firmware", -1, -1, -1, -1, -1 },
-	{ "ibm,configure-connector", -1, 0, -1, 1, -1, 4096 },	/* Special cased */
-	{ "display-character", -1, -1, -1, -1, -1 },
-	{ "ibm,display-message", -1, 0, -1, -1, -1 },
-	{ "ibm,errinjct", -1, 2, -1, -1, -1, 1024 },
-	{ "ibm,close-errinjct", -1, -1, -1, -1, -1 },
-	{ "ibm,open-errinjct", -1, -1, -1, -1, -1 },
-	{ "ibm,get-config-addr-info2", -1, -1, -1, -1, -1 },
-	{ "ibm,get-dynamic-sensor-state", -1, 1, -1, -1, -1 },
-	{ "ibm,get-indices", -1, 2, 3, -1, -1 },
-	{ "get-power-level", -1, -1, -1, -1, -1 },
-	{ "get-sensor-state", -1, -1, -1, -1, -1 },
-	{ "ibm,get-system-parameter", -1, 1, 2, -1, -1 },
-	{ "get-time-of-day", -1, -1, -1, -1, -1 },
-	{ "ibm,get-vpd", -1, 0, -1, 1, 2 },
-	{ "ibm,lpar-perftools", -1, 2, 3, -1, -1 },
-	{ "ibm,platform-dump", -1, 4, 5, -1, -1 },		/* Special cased */
-	{ "ibm,read-slot-reset-state", -1, -1, -1, -1, -1 },
-	{ "ibm,scan-log-dump", -1, 0, 1, -1, -1 },
-	{ "ibm,set-dynamic-indicator", -1, 2, -1, -1, -1 },
-	{ "ibm,set-eeh-option", -1, -1, -1, -1, -1 },
-	{ "set-indicator", -1, -1, -1, -1, -1 },
-	{ "set-power-level", -1, -1, -1, -1, -1 },
-	{ "set-time-for-power-on", -1, -1, -1, -1, -1 },
-	{ "ibm,set-system-parameter", -1, 1, -1, -1, -1 },
-	{ "set-time-of-day", -1, -1, -1, -1, -1 },
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	{ "ibm,suspend-me", -1, -1, -1, -1, -1 },
-	{ "ibm,update-nodes", -1, 0, -1, -1, -1, 4096 },
-	{ "ibm,update-properties", -1, 0, -1, -1, -1, 4096 },
-#endif
-	{ "ibm,physical-attestation", -1, 0, 1, -1, -1 },
-};
 
 static bool in_rmo_buf(u32 base, u32 end)
 {
@@ -1126,63 +1586,76 @@ static bool in_rmo_buf(u32 base, u32 end)
 static bool block_rtas_call(int token, int nargs,
 			    struct rtas_args *args)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
-		struct rtas_filter *f = &rtas_filters[i];
-		u32 base, size, end;
-
-		if (token != f->token)
-			continue;
-
-		if (f->buf_idx1 != -1) {
-			base = be32_to_cpu(args->args[f->buf_idx1]);
-			if (f->size_idx1 != -1)
-				size = be32_to_cpu(args->args[f->size_idx1]);
-			else if (f->fixed_size)
-				size = f->fixed_size;
-			else
-				size = 1;
-
-			end = base + size - 1;
-
-			/*
-			 * Special case for ibm,platform-dump - NULL buffer
-			 * address is used to indicate end of dump processing
-			 */
-			if (!strcmp(f->name, "ibm,platform-dump") &&
-			    base == 0)
-				return false;
-
-			if (!in_rmo_buf(base, end))
-				goto err;
-		}
-
-		if (f->buf_idx2 != -1) {
-			base = be32_to_cpu(args->args[f->buf_idx2]);
-			if (f->size_idx2 != -1)
-				size = be32_to_cpu(args->args[f->size_idx2]);
-			else if (f->fixed_size)
-				size = f->fixed_size;
-			else
-				size = 1;
-			end = base + size - 1;
-
-			/*
-			 * Special case for ibm,configure-connector where the
-			 * address can be 0
-			 */
-			if (!strcmp(f->name, "ibm,configure-connector") &&
-			    base == 0)
-				return false;
-
-			if (!in_rmo_buf(base, end))
-				goto err;
-		}
-
-		return false;
+	const struct rtas_function *func;
+	const struct rtas_filter *f;
+	u32 base, size, end;
+
+	/*
+	 * If this token doesn't correspond to a function the kernel
+	 * understands, you're not allowed to call it.
+	 */
+	func = rtas_token_to_function(token);
+	if (!func)
+		goto err;
+	/*
+	 * And only functions with filters attached are allowed.
+	 */
+	f = func->filter;
+	if (!f)
+		goto err;
+	/*
+	 * And some functions aren't allowed on LE.
+	 */
+	if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) &&
+	    (func->flags & RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE))
+		goto err;
+
+	if (f->buf_idx1 != -1) {
+		base = be32_to_cpu(args->args[f->buf_idx1]);
+		if (f->size_idx1 != -1)
+			size = be32_to_cpu(args->args[f->size_idx1]);
+		else if (f->fixed_size)
+			size = f->fixed_size;
+		else
+			size = 1;
+
+		end = base + size - 1;
+
+		/*
+		 * Special case for ibm,platform-dump - NULL buffer
+		 * address is used to indicate end of dump processing
+		 */
+		if (!strcmp(func->name, "ibm,platform-dump") &&
+		    base == 0)
+			return false;
+
+		if (!in_rmo_buf(base, end))
+			goto err;
+	}
+
+	if (f->buf_idx2 != -1) {
+		base = be32_to_cpu(args->args[f->buf_idx2]);
+		if (f->size_idx2 != -1)
+			size = be32_to_cpu(args->args[f->size_idx2]);
+		else if (f->fixed_size)
+			size = f->fixed_size;
+		else
+			size = 1;
+		end = base + size - 1;
+
+		/*
+		 * Special case for ibm,configure-connector where the
+		 * address can be 0
+		 */
+		if (!strcmp(func->name, "ibm,configure-connector") &&
+		    base == 0)
+			return false;
+
+		if (!in_rmo_buf(base, end))
+			goto err;
 	}
 
+	return false;
 err:
 	pr_err_ratelimited("sys_rtas: RTAS call blocked - exploit attempt?\n");
 	pr_err_ratelimited("sys_rtas: token=0x%x, nargs=%d (called by %s)\n",
@@ -1190,14 +1663,6 @@ static bool block_rtas_call(int token, int nargs,
 	return true;
 }
 
-static void __init rtas_syscall_filter_init(void)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++)
-		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
-}
-
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
@@ -1297,6 +1762,54 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	return 0;
 }
 
+static void __init rtas_function_table_init(void)
+{
+	struct property *prop;
+
+	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
+		struct rtas_function *curr = &rtas_function_table[i];
+		struct rtas_function *prior;
+		int cmp;
+
+		curr->token = RTAS_UNKNOWN_SERVICE;
+
+		if (i == 0)
+			continue;
+		/*
+		 * Ensure table is sorted correctly for binary search
+		 * on function names.
+		 */
+		prior = &rtas_function_table[i - 1];
+
+		cmp = strcmp(prior->name, curr->name);
+		if (cmp < 0)
+			continue;
+
+		if (cmp == 0) {
+			pr_err("'%s' has duplicate function table entries\n",
+			       curr->name);
+		} else {
+			pr_err("function table unsorted: '%s' wrongly precedes '%s'\n",
+			       prior->name, curr->name);
+		}
+	}
+
+	for_each_property_of_node(rtas.dev, prop) {
+		struct rtas_function *func;
+
+		if (prop->length != sizeof(u32))
+			continue;
+
+		func = __rtas_name_to_function(prop->name);
+		if (!func)
+			continue;
+
+		func->token = be32_to_cpup((__be32 *)prop->value);
+
+		pr_debug("function %s has token %u\n", func->name, func->token);
+	}
+}
+
 /*
  * Call early during boot, before mem init, to retrieve the RTAS
  * information from the device-tree and allocate the RMO buffer for userland
@@ -1330,6 +1843,9 @@ void __init rtas_initialize(void)
 
 	init_error_log_max();
 
+	/* Must be called before any function token lookups */
+	rtas_function_table_init();
+
 	/*
 	 * Discover these now to avoid device tree lookups in the
 	 * panic path.
@@ -1355,7 +1871,6 @@ void __init rtas_initialize(void)
 #endif
 	ibm_open_errinjct_token = rtas_token("ibm,open-errinjct");
 	ibm_errinjct_token = rtas_token("ibm,errinjct");
-	rtas_syscall_filter_init();
 }
 
 int __init early_init_dt_scan_rtas(unsigned long node,
-- 
2.37.1

