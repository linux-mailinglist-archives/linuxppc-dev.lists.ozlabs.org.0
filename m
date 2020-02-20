Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C4165B48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 11:15:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVnx64PLzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVXT1K5zzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 21:03:20 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KA394I094961
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 05:03:14 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ucmw842-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 05:03:14 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Thu, 20 Feb 2020 09:58:43 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:58:41 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9wbFs41943044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:58:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4378A404D;
 Thu, 20 Feb 2020 09:58:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C60B0A4051;
 Thu, 20 Feb 2020 09:58:34 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.199.53.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:58:34 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/8] powerpc/uapi: Introduce uapi header 'papr_scm_dsm.h' for
 papr_scm DSMs
Date: Thu, 20 Feb 2020 15:28:02 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220095805.197229-1-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022009-0008-0000-0000-00000354B1B8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0009-0000-0000-00004A75C110
Message-Id: <20200220095805.197229-6-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=1 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200073
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define and add a new uapi header for papr_scm describing device
specific methods (DSMs) and structs for libndctl. PAPR-SCM specific
implementation in libndctl will use these commands/structs to interact
with papr_scm kernel module. Currently only DSMs to retrieve health and
performance statistics information of a dimm are defined.

DSM Envelope
=============

The ioctl ND_CMD_CALL transfers data between user-space and kernel via
'envelopes'. An envelope consists of a header and user-defined payload
section. The primary structure describing this envelope is 'struct
nd_papr_scm_cmd_pkg' which expects a payload at the end of the envelop
pointed to by 'nd_papr_scm_cmd_pkg.payload_offset'. Currently two
payloads are defined 'struct nd_papr_scm_dimm_health_stat' and 'struct
nd_papr_scm_perf_stats'. These can be used to retrieve dimm-health and
performance stats respectively.

The header is defined as 'struct nd_cmd_pkg' which in return is
wrapped in a user defined struct called 'struct
nd_papr_scm_cmd_pkg'. This relationship is illustrated below:

     64-Bytes         8-Bytes
 +-------------+-------------------+------------------------------+
 | nd_family   |	       	   |				  |
 |             |                   |				  |
 | nd_size_out | cmd_status        |				  |
 |             |                   |         			  |
 | nd_size_in  | payload_version   |           PAYLOAD      	  |
 |             |                   |           			  |
 | nd_command  | payload_offset    |				  |
 |             |      |            |				  |
 | nd_fw_size  |      +----------> |				  |
 +-------------+-------------------+------------------------------+
 \ nd_cmd_pkg /                   /                              /
  \----------/                   /                              /
   \ 	nd_papr_scm_cmd_pkg     /			       /
    \--------------------------/      	       	       	      /
     \  	 		  Envelope	  	     /
      \-----------------------------------------------------/

Important fields to note in above illustration are:

* 'nd_command'	: DSM command sent by libndctl
* 'nd_family' 	: Id for newly introduced DSM family NVDIMM_FAMILY_PAPR_SCM
* 'nd_fw_size'	: Number of bytes that kernel wanted to copy to the
  payload but may not have copied due to limited size of the envelope.
* 'nd_size_in/out' : Number of bytes that kernel needs to copy from
  user-space (in) and copy-back to user-space (out).
* 'cmd_status' 	: Out variable indicating any error encountered while
  servicing the DSM.
* 'payload_version': Version number associated with the payload.
* 'payload_offset': Offset of the payload from start of the envelope.

libnvdimm enforces a hard limit of 256 bytes on the envelope size,
which leaves around 184 bytes for the envelope payload (ignoring any
padding that the compiler may silently introduce).

Envelope Payload Layout
=======================

The layout of the DSM Payload is defined by various structs defined in
'papr_scm_dsm.h'. Definition of these structs are shared between
papr_scm and libndctl so that contents of payload can be
interpreted. This patch-set introduces two such structs namely
'nd_papr_scm_dimm_health_stat' and 'nd_papr_scm_perf_stats' that can
be used to exchange dimm health and performance stats between papr_scm
and libndctl.

During servicing of a DSM the papr_scm module will read input args
from the payload field by casting its contents to an appropriate
struct pointer based on the DSM command. Similarly the output of
servicing the DSM command will be copied to the payload field using
the same struct.

Payload Version
===============

Since the structs associated with each DSM can evolve over time adding
more data and the definitions of these structs known to papr_scm and
libndctl may differ, hence the version number is associated with each
iteration of the struct. This version number is exchanged between
papr_scm <-> libndctl via the 'payload_version' of the DSM envelope.

When libndctl sends an envelope to papr_scm it populates the
'payload_version' field with the version number of the struct it had
copied and/or expects in the payload area. The papr_scm module when
servicing the DSM envelop checks the 'payload_version', if required
changes it to a different version number that it knows about and then
use the DSM struct associated with the new version number to process
the DSM (i.e read the args and copy the results to the payload
area). Libndctl on receiving the envelop back from papr_scm again
checks the 'payload_version' field and based on it use the appropriate
version dsm struct to parse the results.

Above scheme of exchanging different versioned DSM struct between
libndctl and papr_scm should work until following two assumptions
hold:

Let T(X) = { set of attributes of DSM struct 'T' versioned X }

1. T(X) is a proper subset of T(Y) if X > Y.
   i.e Each new version of DSM struct should retain existing struct
   attributes.

2. If an entity (libndctl or papr_scm) supports a DSM struct T(X) then
   it should also support T(1), T(2)...T(X - 1).
   i.e When adding support for new version of a DSM struct, libndctl
   and papr_scm should retain support of the existing DSM struct
   version they support.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr_scm_dsm.h | 143 +++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 arch/powerpc/include/uapi/asm/papr_scm_dsm.h

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
new file mode 100644
index 000000000000..aacced453579
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * PAPR SCM Device specific methods for libndctl and ndctl
+ *
+ * (C) Copyright IBM 2020
+ *
+ * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_
+#define _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_
+
+#include <linux/types.h>
+
+#ifdef __KERNEL__
+#include <linux/ndctl.h>
+#else
+#include <ndctl.h>
+#endif
+
+/*
+ * Sub commands for ND_CMD_CALL. To prevent overlap from ND_CMD_*, values for
+ * these enums start at 0x10000. These values are then returned from
+ * cmd_to_func() making it easy to implement the switch-case block in
+ * papr_scm_ndctl()
+ */
+enum dsm_papr_scm {
+	DSM_PAPR_SCM_MIN =  0x10000,
+	DSM_PAPR_SCM_HEALTH,
+	DSM_PAPR_SCM_STATS,
+	DSM_PAPR_SCM_MAX,
+};
+
+enum dsm_papr_scm_dimm_health {
+	DSM_PAPR_SCM_DIMM_HEALTHY,
+	DSM_PAPR_SCM_DIMM_UNHEALTHY,
+	DSM_PAPR_SCM_DIMM_CRITICAL,
+	DSM_PAPR_SCM_DIMM_FATAL,
+};
+
+/* Papr-scm-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
+struct nd_papr_scm_cmd_pkg {
+	struct nd_cmd_pkg hdr;		/* Package header containing sub-cmd */
+	int32_t cmd_status;		/* Out: Sub-cmd status returned back */
+	uint16_t payload_offset;	/* In: offset from start of struct */
+	uint16_t payload_version;	/* In/Out: version of the payload */
+	uint8_t payload[];		/* In/Out: Sub-cmd data buffer */
+};
+
+/* Helpers to evaluate the size of PAPR_SCM envelope */
+/* Calculate the papr_scm-header size */
+#define ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE \
+	(sizeof(struct nd_papr_scm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
+/*
+ * Given a type calculate the envelope size
+ * (nd-header + papr_scm-header + payload)
+ */
+#define ND_PAPR_SCM_ENVELOPE_SIZE(_type_)	\
+	(sizeof(_type_) + sizeof(struct nd_papr_scm_cmd_pkg))
+
+/* Given a type envelope-content size (papr_scm-header + payload) */
+#define ND_PAPR_SCM_ENVELOPE_CONTENT_SIZE(_type_)	\
+	(sizeof(_type_) + ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE)
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_DSM_PAPR_SMART_HEALTH
+ * Various bitflags indicate the health status of the dimm.
+ */
+struct nd_papr_scm_dimm_health_stat_v1 {
+	/* Dimm not armed. So contents wont persist */
+	bool dimm_unarmed;
+	/* Previous shutdown did not persist contents */
+	bool dimm_bad_shutdown;
+	/* Contents from previous shutdown werent restored */
+	bool dimm_bad_restore;
+	/* Contents of the dimm have been scrubbed */
+	bool dimm_scrubbed;
+	/* Contents of the dimm cant be modified until CEC reboot */
+	bool dimm_locked;
+	/* Contents of dimm are encrypted */
+	bool dimm_encrypted;
+
+	enum dsm_papr_scm_dimm_health dimm_health;
+};
+
+/*
+ * Typedef the current struct for dimm_health so that any application
+ * or kernel recompiled after introducing a new version autometically
+ * supports the new version.
+ */
+#define nd_papr_scm_dimm_health_stat nd_papr_scm_dimm_health_stat_v1
+
+/* Current version number for the dimm health struct */
+#define ND_PAPR_SCM_DIMM_HEALTH_VERSION 1
+
+/* Struct holding a single performance metric */
+struct nd_papr_scm_perf_stat {
+	u64 statistic_id;
+	u64 statistic_value;
+};
+
+/* Struct exchanged between kernel and ndctl reporting drc perf stats */
+struct nd_papr_scm_perf_stats_v1 {
+	/* Number of stats following */
+	u32 num_statistics;
+
+	/* zero or more performance matrics */
+	struct nd_papr_scm_perf_stat scm_statistics[];
+};
+
+/*
+ * Typedef the current struct for dimm_stats so that any application
+ * or kernel recompiled after introducing a new version autometically
+ * supports the new version.
+ */
+#define nd_papr_scm_perf_stats nd_papr_scm_perf_stats_v1
+#define ND_PAPR_SCM_DIMM_PERF_STATS_VERSION 1
+
+/* Convert a libnvdimm nd_cmd_pkg to papr_scm specific pkg */
+static struct nd_papr_scm_cmd_pkg *nd_to_papr_cmd_pkg(struct nd_cmd_pkg *cmd)
+{
+	return (struct nd_papr_scm_cmd_pkg *) cmd;
+}
+
+/* Return the payload pointer for a given pcmd */
+static void *papr_scm_pcmd_to_payload(struct nd_papr_scm_cmd_pkg *pcmd)
+{
+	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
+		return NULL;
+	else
+		return (void *)((u8 *) pcmd + pcmd->payload_offset);
+}
+#endif /* _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_ */
-- 
2.24.1

