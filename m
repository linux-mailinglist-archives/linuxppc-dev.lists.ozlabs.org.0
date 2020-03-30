Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C3197A92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:20:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rVPN5WNMzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:20:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rVB12n73zDqVV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:10:33 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UB4NQL099149
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yfehhpk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:10:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 30 Mar 2020 12:10:23 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 12:10:20 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02UBAOTN42598822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 11:10:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF47A4062;
 Mon, 30 Mar 2020 11:10:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8846BA4054;
 Mon, 30 Mar 2020 11:10:21 +0000 (GMT)
Received: from vajain21.in.ibm.com.com (unknown [9.79.185.237])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 11:10:21 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH v3 3/4] powerpc/papr_scm,
 uapi: Add support for handling PAPR DSM commands
Date: Mon, 30 Mar 2020 16:39:42 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200330110943.214097-1-vaibhav@linux.ibm.com>
References: <20200330110943.214097-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033011-0012-0000-0000-0000039AE2EA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033011-0013-0000-0000-000021D7EA6D
Message-Id: <20200330110943.214097-4-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300101
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for handling PAPR DSM commands in papr_scm
module. We advertise support for ND_CMD_CALL for the dimm command mask
and implement necessary scaffolding in the module to handle ND_CMD_CALL
ioctl and DSM commands that we receive.

The layout of the DSM commands as we expect from libnvdimm/libndctl is
described in newly introduced uapi header 'papr_scm_dsm.h' which
defines a new 'struct nd_papr_scm_cmd_pkg' header. This header is used
to communicate the DSM command via 'nd_pkg_papr_scm->nd_command' and
size of payload that need to be sent/received for servicing the DSM.

The PAPR DSM commands are assigned indexes started from 0x10000 to
prevent them from overlapping ND_CMD_* values and also makes handling
dimm commands in papr_scm_ndctl() easier via a simplified switch-case
block. For this a new function cmd_to_func() is implemented that reads
the args to papr_scm_ndctl() , performs sanity tests on them and
converts them to PAPR DSM commands which can then be handled via the
switch-case block.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog:

v2..v3: Updated the nd_papr_scm_cmd_pkg to use __xx types as its
	exported to the userspace [Aneesh]

v1..v2: New patch in the series.
---
 arch/powerpc/include/uapi/asm/papr_scm_dsm.h | 161 +++++++++++++++++++
 arch/powerpc/platforms/pseries/papr_scm.c    |  87 +++++++++-
 2 files changed, 241 insertions(+), 7 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr_scm_dsm.h

diff --git a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
new file mode 100644
index 000000000000..c039a49b41b4
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * PAPR SCM Device specific methods and struct for libndctl and ndctl
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
+ * DSM Envelope:
+ *
+ * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
+ * 'envelopes' which consists of a header and user-defined payload sections.
+ * The header is described by 'struct nd_papr_scm_cmd_pkg' which expects a
+ * payload following it and offset of which relative to the struct is provided
+ * by 'nd_papr_scm_cmd_pkg.payload_offset'. *
+ *
+ *  +-------------+---------------------+---------------------------+
+ *  |   64-Bytes  |       8-Bytes       |       Max 184-Bytes       |
+ *  +-------------+---------------------+---------------------------+
+ *  |               nd_papr_scm_cmd_pkg |                           |
+ *  |-------------+                     |                           |
+ *  |  nd_cmd_pkg |                     |                           |
+ *  +-------------+---------------------+---------------------------+
+ *  | nd_family   |			|			    |
+ *  | nd_size_out | cmd_status          |			    |
+ *  | nd_size_in  | payload_version     |      PAYLOAD		    |
+ *  | nd_command  | payload_offset ----->			    |
+ *  | nd_fw_size  |                     |			    |
+ *  +-------------+---------------------+---------------------------+
+ *
+ * DSM Header:
+ *
+ * The header is defined as 'struct nd_papr_scm_cmd_pkg' which embeds a
+ * 'struct nd_cmd_pkg' instance. The DSM command is assigned to member
+ * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelop which is
+ * contained in 'struct nd_cmd_pkg', the header also has members following
+ * members:
+ *
+ * 'cmd_status'		: (Out) Errors if any encountered while servicing DSM.
+ * 'payload_version'	: (In/Out) Version number associated with the payload.
+ * 'payload_offset'	: (In)Relative offset of payload from start of envelope.
+ *
+ * DSM Payload:
+ *
+ * The layout of the DSM Payload is defined by various structs shared between
+ * papr_scm and libndctl so that contents of payload can be interpreted. During
+ * servicing of a DSM the papr_scm module will read input args from the payload
+ * field by casting its contents to an appropriate struct pointer based on the
+ * DSM command. Similarly the output of servicing the DSM command will be copied
+ * to the payload field using the same struct.
+ *
+ * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
+ * leaves around 184 bytes for the envelope payload (ignoring any padding that
+ * the compiler may silently introduce).
+ *
+ * Payload Version:
+ *
+ * A 'payload_version' field is present in DSM header that indicates a specific
+ * version of the structure present in DSM Payload for a given DSM command. This
+ * provides backward compatibility in case the DSM Payload structure evolves
+ * and different structures are supported by 'papr_scm' and 'libndctl'.
+ *
+ * When sending a DSM Payload to 'papr_scm', 'libndctl' should send the version
+ * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
+ * module when servicing the DSM envelop checks the 'payload_version' and then
+ * uses 'payload struct version' == MIN('payload_version field',
+ * 'max payload-struct-version supported by papr_scm') to service the DSM. After
+ * servicing the DSM, 'papr_scm' put the negotiated version of payload struct in
+ * returned 'payload_version' field.
+ *
+ * Libndctl on receiving the envelop back from papr_scm again checks the
+ * 'payload_version' field and based on it use the appropriate version dsm
+ * struct to parse the results.
+ *
+ * Backward Compatibility:
+ *
+ * Above scheme of exchanging different versioned DSM struct between libndctl
+ * and papr_scm should provide backward compatibility until following two
+ * assumptions/conditions when defining new DSM structs hold:
+ *
+ * Let T(X) = { set of attributes in DSM struct 'T' versioned X }
+ *
+ * 1. T(X) is a proper subset of T(Y) if X > Y.
+ *    i.e Each new version of DSM struct should retain existing struct
+ *    attributes from previous version
+ *
+ * 2. If an entity (libndctl or papr_scm) supports a DSM struct T(X) then
+ *    it should also support T(1), T(2)...T(X - 1).
+ *    i.e When adding support for new version of a DSM struct, libndctl
+ *    and papr_scm should retain support of the existing DSM struct
+ *    version they support.
+ */
+
+/* Papr-scm-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
+struct nd_papr_scm_cmd_pkg {
+	struct nd_cmd_pkg hdr;		/* Package header containing sub-cmd */
+	__s32 cmd_status;		/* Out: Sub-cmd status returned back */
+	__u16 payload_offset;	/* In: offset from start of struct */
+	__u16 payload_version;	/* In/Out: version of the payload */
+	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
+};
+
+/*
+ * Sub commands for ND_CMD_CALL. To prevent overlap from ND_CMD_*, values for
+ * these enums start at 0x10000. These values are then returned from
+ * cmd_to_func() making it easy to implement the switch-case block in
+ * papr_scm_ndctl(). These commands are sent to the kernel via
+ * 'nd_papr_scm_cmd_pkg.hdr.nd_command'
+ */
+enum dsm_papr_scm {
+	DSM_PAPR_SCM_MIN =  0x10000,
+	DSM_PAPR_SCM_MAX,
+};
+
+/* Helpers to evaluate the size of PAPR_SCM envelope */
+/* Calculate the papr_scm-header size */
+#define ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE \
+	(sizeof(struct nd_papr_scm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
+
+/* Given a type calculate envelope-content size (papr_scm-header + payload) */
+#define ND_PAPR_SCM_ENVELOPE_CONTENT_SIZE(_type_)	\
+	(sizeof(_type_) + ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE)
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
+		return (void *)((__u8 *) pcmd + pcmd->payload_offset);
+}
+#endif /* _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index aaf2e4ab1f75..9a2614aaae88 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -15,13 +15,15 @@
 
 #include <asm/plpar_wrappers.h>
 #include <asm/papr_scm.h>
+#include <asm/papr_scm_dsm.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
 #define PAPR_SCM_DIMM_CMD_MASK \
 	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
-	 (1ul << ND_CMD_SET_CONFIG_DATA))
+	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
+	 (1ul << ND_CMD_CALL))
 
 struct papr_scm_priv {
 	struct platform_device *pdev;
@@ -283,19 +285,82 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
 	return 0;
 }
 
+/*
+ * Validate the input to dimm-control function and return papr_scm specific
+ * commands. This does sanity validation to ND_CMD_CALL sub-command packages.
+ */
+static int cmd_to_func(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
+		       unsigned int buf_len)
+{
+	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
+	struct nd_papr_scm_cmd_pkg *pkg = nd_to_papr_cmd_pkg(buf);
+
+	/* Only dimm-specific calls are supported atm */
+	if (!nvdimm)
+		return -EINVAL;
+
+	if (!test_bit(cmd, &cmd_mask)) {
+		pr_debug("%s: Unsupported cmd=%u\n", __func__, cmd);
+		return -EINVAL;
+	} else if (cmd != ND_CMD_CALL) {
+		return cmd;
+	}
+
+	/* cmd == ND_CMD_CALL so verify the envelop package */
+
+	if (!buf || buf_len < sizeof(struct nd_papr_scm_cmd_pkg)) {
+		pr_debug("%s: Invalid pkg size=%u\n", __func__, buf_len);
+		return -EINVAL;
+	}
+
+	if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR_SCM) {
+		pr_debug("%s: Invalid pkg family=0x%llx\n", __func__,
+			 pkg->hdr.nd_family);
+		return -EINVAL;
+
+	}
+
+	if (pkg->hdr.nd_command <= DSM_PAPR_SCM_MIN ||
+	    pkg->hdr.nd_command >= DSM_PAPR_SCM_MAX) {
+
+		/* for unknown subcommands return ND_CMD_CALL */
+		pr_debug("%s: Unknown sub-command=0x%llx\n", __func__,
+			 pkg->hdr.nd_command);
+		return ND_CMD_CALL;
+	}
+
+	/* We except a payload with all DSM commands */
+	if (papr_scm_pcmd_to_payload(pkg) == NULL) {
+		pr_debug("%s: Empty patload for sub-command=0x%llx\n", __func__,
+			 pkg->hdr.nd_command);
+		return -EINVAL;
+	}
+
+	/* Return the DSM_PAPR_SCM_* command */
+	return pkg->hdr.nd_command;
+}
+
 int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
 {
 	struct nd_cmd_get_config_size *get_size_hdr;
 	struct papr_scm_priv *p;
+	struct nd_papr_scm_cmd_pkg *call_pkg = NULL;
+	int cmd_in, rc;
 
-	/* Only dimm-specific calls are supported atm */
-	if (!nvdimm)
-		return -EINVAL;
+	/* Use a local variable in case cmd_rc pointer is NULL */
+	if (cmd_rc == NULL)
+		cmd_rc = &rc;
+
+	cmd_in = cmd_to_func(nvdimm, cmd, buf, buf_len);
+	if (cmd_in < 0) {
+		pr_debug("%s: Invalid cmd=%u. Err=%d\n", __func__, cmd, cmd_in);
+		return cmd_in;
+	}
 
 	p = nvdimm_provider_data(nvdimm);
 
-	switch (cmd) {
+	switch (cmd_in) {
 	case ND_CMD_GET_CONFIG_SIZE:
 		get_size_hdr = buf;
 
@@ -313,13 +378,21 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		*cmd_rc = papr_scm_meta_set(p, buf);
 		break;
 
+	case ND_CMD_CALL:
+		/* This happens if subcommand package sanity fails */
+		call_pkg = nd_to_papr_cmd_pkg(buf);
+		call_pkg->cmd_status = -ENOENT;
+		*cmd_rc = 0;
+		break;
+
 	default:
-		return -EINVAL;
+		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd_in);
+		*cmd_rc = -EINVAL;
 	}
 
 	dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
 
-	return 0;
+	return *cmd_rc;
 }
 
 static inline int papr_scm_node(int node)
-- 
2.24.1

