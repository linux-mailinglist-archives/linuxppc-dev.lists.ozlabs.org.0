Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D241F97F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:11:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lsCV0K5LzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrdx5X1kzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:45:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FC377u138621; Mon, 15 Jun 2020 08:44:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31mtxew9ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:44:50 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FCcvsg043478;
 Mon, 15 Jun 2020 08:44:49 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31mtxew9ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:44:49 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FCf5Z9010471;
 Mon, 15 Jun 2020 12:44:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 31mpe7sewb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:44:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05FChRxt52232574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 12:43:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD1B511C05B;
 Mon, 15 Jun 2020 12:44:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C78F11C04A;
 Mon, 15 Jun 2020 12:44:41 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.96.47])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 15 Jun 2020 12:44:41 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 15 Jun 2020 18:14:40 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v13 5/6] ndctl/papr_scm,
 uapi: Add support for PAPR nvdimm specific methods
Date: Mon, 15 Jun 2020 18:14:06 +0530
Message-Id: <20200615124407.32596-6-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615124407.32596-1-vaibhav@linux.ibm.com>
References: <20200615124407.32596-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 cotscore=-2147483648
 bulkscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150098
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce support for PAPR NVDIMM Specific Methods (PDSM) in papr_scm
module and add the command family NVDIMM_FAMILY_PAPR to the white list
of NVDIMM command sets. Also advertise support for ND_CMD_CALL for the
nvdimm command mask and implement necessary scaffolding in the module
to handle ND_CMD_CALL ioctl and PDSM requests that we receive.

The layout of the PDSM request as we expect from libnvdimm/libndctl is
described in newly introduced uapi header 'papr_pdsm.h' which
defines a 'struct nd_pkg_pdsm' and a maximal union named
'nd_pdsm_payload'. These new structs together with 'struct nd_cmd_pkg'
for a pdsm envelop thats sent by libndctl to libnvdimm and serviced by
papr_scm in 'papr_scm_service_pdsm()'. The PDSM request is
communicated by member 'struct nd_cmd_pkg.nd_command' together with
other information on the pdsm payload (size-in, size-out).

The patch also introduces 'struct pdsm_cmd_desc' instances of which
are stored in an array __pdsm_cmd_descriptors[] indexed with PDSM cmd
and corresponding access function pdsm_cmd_desc() is
introduced. 'struct pdsm_cdm_desc' holds the service function for a
given PDSM and corresponding payload in/out sizes.

A new function papr_scm_service_pdsm() is introduced and is called from
papr_scm_ndctl() in case of a PDSM request is received via ND_CMD_CALL
command from libnvdimm. The function performs validation on the PDSM
payload based on info present in corresponding PDSM descriptor and if
valid calls the 'struct pdcm_cmd_desc.service' function to service the
PDSM.

Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

v12..v13:
* s/struct nd_pdsm_cmd_pkg/struct nd_pkg_pdsm/
* Removed instance of 'struct nd_cmd_pkg hdr' from 'struct
  nd_pdsm_cmd_pkg'.
* Introduced 'union nd_pdsm_payload' thats a maximal union of all
  possible payload structs.
* Instead of having flexible 'payload' member 'struct nd_pdsm_cmd_pkg'
  replace it with a 'union nd_pdsm_payload'.
* Introduce pdsm descriptor 'struct pdsm_cmd_desc' and its array
  __pdsm_cmd_descriptors[] that holds a payload 'size_[in|out]' and
  service function for each pdsm. This is analogus to
  '__nd_cmd_dimm_descs[]'
* Introduce function 'pdsm_cmd_desc()' to fetch the corrosponding pdsm
  descriptor for each valid pdsm.
* Updated papr_scm_service_pdsm() to use 'pdsm_cmd_desc()' and apply
  checks on 'nd_cmd_pkg' payload based on psdm descriptor members and
  finally service the pdsm using the 'service' member of the
  descriptor.
* Updated 'papr_scm_ndctl()' to send the 'struct nd_cmd_pkg*' instance
  to papr_scm_service_pdsm() instead of a 'struct nd_pdsm_cmd_pkg*'.
* Updated documentation in 'papr_psdm.h' to reflect new pdsm envelope
  layout.
* Update patch description.

v11..v12:
* Updated a misleading comment in 'papr_pdsm.h' regarding payload
  size. [ Ira ]

v10..v11:
* Moved in-lines 'nd_pdsm_cmd_pkg()' and 'pdsm_cmd_to_payload()' from
  'papr_pdsm.h' header to 'papr_scm.c'. The avoids a potential license
  incompatibility issue with non-GPL-2.0 user-space code trying to
  include the header in its code. [ Ira ]
* Verified papr_pdsm.h with UAPI_HEADER_TEST config.
* Moved the is_cmd_valid() check in papr_scm_ndctl() before check for
  cmd_rc == NULL. This prevents cmd_rc to be updated in case the
  nd-cmd is invalid or unknown.

v9..v10:
* Simplified 'struct nd_pdsm_cmd_pkg' by removing the
  'payload_version' field.
* Removed the corrosponding documentation on versioning and backward
  compatibility from 'papr_pdsm.h'
* Reduced the size of reserved fields to 4-bytes making 'struct
  nd_pdsm_cmd_pkg' 64 + 8 bytes long.
* Updated is_cmd_valid() to enforce validation checks on pdsm
  commands. [ Dan Williams ]
* Added check for reserved fields being set to '0' in is_cmd_valid()
  [ Ira ]
* Moved changes for checking cmd_rc == NULL and logging improvements
  to a separate prelim patch [ Ira ].
* Moved  pdsm package validation checks from papr_scm_service_pdsm()
  to is_cmd_valid().
* Marked papr_scm_service_pdsm() return type as 'void' since errors
  are reported in nd_pdsm_cmd_pkg.cmd_status field.

Resend:
* Added ack from Aneesh.

v8..v9:
* Reduced the usage of term SCM replacing it with appropriate
  replacement [ Dan Williams, Aneesh ]
* Renamed 'papr_scm_pdsm.h' to 'papr_pdsm.h'
* s/PAPR_SCM_PDSM_*/PAPR_PDSM_*/g
* s/NVDIMM_FAMILY_PAPR_SCM/NVDIMM_FAMILY_PAPR/g
* Minor updates to 'papr_psdm.h' to replace usage of term 'SCM'.
* Minor update to patch description.

v7..v8:
* Removed the 'payload_offset' field from 'struct
  nd_pdsm_cmd_pkg'. Instead command payload is always assumed to start
  at 'nd_pdsm_cmd_pkg.payload'. [ Aneesh ]
* To enable introducing new fields to 'struct nd_pdsm_cmd_pkg',
  'reserved' field of 10-bytes is introduced. [ Aneesh ]
* Fixed a typo in "Backward Compatibility" section of papr_scm_pdsm.h
  [ Ira ]

Resend:
* None

v6..v7 :
* Removed the re-definitions of __packed macro from papr_scm_pdsm.h
  [Mpe].
* Removed the usage of __KERNEL__ macros in papr_scm_pdsm.h [Mpe].
* Removed macros that were unused in papr_scm.c from papr_scm_pdsm.h
  [Mpe].
* Made functions defined in papr_scm_pdsm.h as static inline. [Mpe]

v5..v6 :
* Changed the usage of the term DSM to PDSM to distinguish it from the
  ACPI term [ Dan Williams ]
* Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various struct
  to reflect the new terminology.
* Updated the patch description and title to reflect the new terminology.
* Squashed patch to introduce new command family in 'ndctl.h' with
  this patch [ Dan Williams ]
* Updated the papr_scm_pdsm method starting index from 0x10000 to 0x0
  [ Dan Williams ]
* Removed redundant license text from the papr_scm_psdm.h file.
  [ Dan Williams ]
* s/envelop/envelope/ at various places [ Dan Williams ]
* Added '__packed' attribute to command package header to gaurd
  against different compiler adding paddings between the fields.
  [ Dan Williams]
* Converted various pr_debug to dev_debug [ Dan Williams ]

v4..v5 :
* None

v3..v4 :
* None

v2..v3 :
* Updated the patch prefix to 'ndctl/uapi' [Aneesh]

v1..v2 :
* None
---
 arch/powerpc/include/uapi/asm/papr_pdsm.h |  95 +++++++++++
 arch/powerpc/platforms/pseries/papr_scm.c | 193 +++++++++++++++++++++-
 include/uapi/linux/ndctl.h                |   1 +
 3 files changed, 285 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h

diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
new file mode 100644
index 000000000000..28115152aa4e
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
@@ -0,0 +1,95 @@
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
+/*
+ * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
+ * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
+ */
+enum papr_pdsm {
+	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_MAX,
+};
+
+/* Maximal union that can hold all possible payload types */
+union nd_pdsm_payload {
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
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 692ad3d79826..d3bbf9940ba4 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -15,13 +15,15 @@
 #include <linux/seq_buf.h>
 
 #include <asm/plpar_wrappers.h>
+#include <asm/papr_pdsm.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
 #define PAPR_SCM_DIMM_CMD_MASK \
 	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
-	 (1ul << ND_CMD_SET_CONFIG_DATA))
+	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
+	 (1ul << ND_CMD_CALL))
 
 /* DIMM health bitmap bitmap indicators */
 /* SCM device is unable to persist memory contents */
@@ -349,17 +351,195 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
 	return 0;
 }
 
+/*
+ * Do a sanity checks on the inputs args to dimm-control function and return
+ * '0' if valid. Validation of PDSM payloads happens later in
+ * papr_scm_service_pdsm.
+ */
+static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
+			unsigned int buf_len)
+{
+	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
+	struct nd_cmd_pkg *nd_cmd;
+	struct papr_scm_priv *p;
+	enum papr_pdsm pdsm;
+
+	/* Only dimm-specific calls are supported atm */
+	if (!nvdimm)
+		return -EINVAL;
+
+	/* get the provider data from struct nvdimm */
+	p = nvdimm_provider_data(nvdimm);
+
+	if (!test_bit(cmd, &cmd_mask)) {
+		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
+		return -EINVAL;
+	}
+
+	/* For CMD_CALL verify pdsm request */
+	if (cmd == ND_CMD_CALL) {
+		/* Verify the envelope and envelop size */
+		if (!buf ||
+		    buf_len < (sizeof(struct nd_cmd_pkg) + ND_PDSM_HDR_SIZE)) {
+			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
+				buf_len);
+			return -EINVAL;
+		}
+
+		/* Verify that the nd_cmd_pkg.nd_family is correct */
+		nd_cmd = (struct nd_cmd_pkg *)buf;
+
+		if (nd_cmd->nd_family != NVDIMM_FAMILY_PAPR) {
+			dev_dbg(&p->pdev->dev, "Invalid pkg family=0x%llx\n",
+				nd_cmd->nd_family);
+			return -EINVAL;
+		}
+
+		pdsm = (enum papr_pdsm)nd_cmd->nd_command;
+
+		/* Verify if the pdsm command is valid */
+		if (pdsm <= PAPR_PDSM_MIN || pdsm >= PAPR_PDSM_MAX) {
+			dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Invalid PDSM\n",
+				pdsm);
+			return -EINVAL;
+		}
+
+		/* Have enough space to hold returned 'nd_pkg_pdsm' header */
+		if (nd_cmd->nd_size_out < ND_PDSM_HDR_SIZE) {
+			dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Invalid payload\n",
+				pdsm);
+			return -EINVAL;
+		}
+	}
+
+	/* Let the command be further processed */
+	return 0;
+}
+
+/*
+ * 'struct pdsm_cmd_desc'
+ * Identifies supported PDSMs' expected length of in/out payloads
+ * and pdsm service function.
+ *
+ * size_in	: Size of input payload if any in the PDSM request.
+ * size_out	: Size of output payload if any in the PDSM request.
+ * service	: Service function for the PDSM request. Return semantics:
+ *		  rc < 0 : Error servicing PDSM and rc indicates the error.
+ *		  rc >=0 : Serviced successfully and 'rc' indicate number of
+ *			bytes written to payload.
+ */
+struct pdsm_cmd_desc {
+	u32 size_in;
+	u32 size_out;
+	int (*service)(struct papr_scm_priv *dimm,
+		       union nd_pdsm_payload *payload);
+};
+
+/* Holds all supported PDSMs' command descriptors */
+static const struct pdsm_cmd_desc __pdsm_cmd_descriptors[] = {
+	[PAPR_PDSM_MIN] = {
+		.size_in = 0,
+		.size_out = 0,
+		.service = NULL,
+	},
+	/* New PDSM command descriptors to be added below */
+
+	/* Empty */
+	[PAPR_PDSM_MAX] = {
+		.size_in = 0,
+		.size_out = 0,
+		.service = NULL,
+	},
+};
+
+/* Given a valid pdsm cmd return its command descriptor else return NULL */
+static inline const struct pdsm_cmd_desc *pdsm_cmd_desc(enum papr_pdsm cmd)
+{
+	if (cmd >= 0 || cmd < ARRAY_SIZE(__pdsm_cmd_descriptors))
+		return &__pdsm_cmd_descriptors[cmd];
+
+	return NULL;
+}
+
+/*
+ * For a given pdsm request call an appropriate service function.
+ * Returns errors if any while handling the pdsm command package.
+ */
+static int papr_scm_service_pdsm(struct papr_scm_priv *p,
+				 struct nd_cmd_pkg *pkg)
+{
+	/* Get the PDSM header and PDSM command */
+	struct nd_pkg_pdsm *pdsm_pkg = (struct nd_pkg_pdsm *)pkg->nd_payload;
+	enum papr_pdsm pdsm = (enum papr_pdsm)pkg->nd_command;
+	const struct pdsm_cmd_desc *pdsc;
+	int rc;
+
+	/* Fetch corresponding pdsm descriptor for validation and servicing */
+	pdsc = pdsm_cmd_desc(pdsm);
+
+	/* Validate pdsm descriptor */
+	/* Ensure that reserved fields are 0 */
+	if (pdsm_pkg->reserved[0] || pdsm_pkg->reserved[1]) {
+		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Invalid reserved field\n",
+			pdsm);
+		return -EINVAL;
+	}
+
+	/* If pdsm expects some input, then ensure that the size_in matches */
+	if (pdsc->size_in &&
+	    pkg->nd_size_in != (pdsc->size_in + ND_PDSM_HDR_SIZE)) {
+		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Mismatched size_in=%d\n",
+			pdsm, pkg->nd_size_in);
+		return -EINVAL;
+	}
+
+	/* If pdsm wants to return data, then ensure that  size_out matches */
+	if (pdsc->size_out &&
+	    pkg->nd_size_out != (pdsc->size_out + ND_PDSM_HDR_SIZE)) {
+		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Mismatched size_out=%d\n",
+			pdsm, pkg->nd_size_out);
+		return -EINVAL;
+	}
+
+	/* Service the pdsm */
+	if (pdsc->service) {
+		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Servicing..\n", pdsm);
+
+		rc = pdsc->service(p, &pdsm_pkg->payload);
+
+		if (rc < 0) {
+			/* error encountered while servicing pdsm */
+			pdsm_pkg->cmd_status = rc;
+			pkg->nd_fw_size = ND_PDSM_HDR_SIZE;
+		} else {
+			/* pdsm serviced and 'rc' bytes written to payload */
+			pdsm_pkg->cmd_status = 0;
+			pkg->nd_fw_size = ND_PDSM_HDR_SIZE + rc;
+		}
+	} else {
+		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Unsupported PDSM request\n",
+			pdsm);
+		pdsm_pkg->cmd_status = -ENOENT;
+		pkg->nd_fw_size = ND_PDSM_HDR_SIZE;
+	}
+
+	return pdsm_pkg->cmd_status;
+}
+
 static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 			  unsigned int buf_len, int *cmd_rc)
 {
 	struct nd_cmd_get_config_size *get_size_hdr;
+	struct nd_cmd_pkg *call_pkg = NULL;
 	struct papr_scm_priv *p;
 	int rc;
 
-	/* Only dimm-specific calls are supported atm */
-	if (!nvdimm)
-		return -EINVAL;
+	rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
+	if (rc) {
+		pr_debug("Invalid cmd=0x%x. Err=%d\n", cmd, rc);
+		return rc;
+	}
 
 	/* Use a local variable in case cmd_rc pointer is NULL */
 	if (!cmd_rc)
@@ -385,6 +565,11 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 		*cmd_rc = papr_scm_meta_set(p, buf);
 		break;
 
+	case ND_CMD_CALL:
+		call_pkg = (struct nd_cmd_pkg *)buf;
+		*cmd_rc = papr_scm_service_pdsm(p, call_pkg);
+		break;
+
 	default:
 		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
 		return -EINVAL;
diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
index de5d90212409..0e09dc5cec19 100644
--- a/include/uapi/linux/ndctl.h
+++ b/include/uapi/linux/ndctl.h
@@ -244,6 +244,7 @@ struct nd_cmd_pkg {
 #define NVDIMM_FAMILY_HPE2 2
 #define NVDIMM_FAMILY_MSFT 3
 #define NVDIMM_FAMILY_HYPERV 4
+#define NVDIMM_FAMILY_PAPR 5
 
 #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
 					struct nd_cmd_pkg)
-- 
2.26.2

