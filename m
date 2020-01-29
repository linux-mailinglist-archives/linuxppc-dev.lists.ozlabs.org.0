Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCF14CDA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:38:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48771g05qmzDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:38:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pT0SzmzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:29:04 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFGCYn066474
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xubcsb3rp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:29:02 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:29:00 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:28:58 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00TFS5uj42467704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:28:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2489652059;
 Wed, 29 Jan 2020 15:28:57 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B0F5252069;
 Wed, 29 Jan 2020 15:28:55 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/6] powerpc/papr_scm: Add support for handling PAPR DSM
 commands
Date: Wed, 29 Jan 2020 20:58:42 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129152844.71286-1-vaibhav@linux.ibm.com>
References: <20200129152844.71286-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-0012-0000-0000-00000381CBAA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-0013-0000-0000-000021BE234F
Message-Id: <20200129152844.71286-5-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=1 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290128
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement support for handling PAPR DSM commands in papr_scm
module. We advertise support for ND_CMD_CALL for the dimm command mask
and implement necessary scaffolding in the module to handle ND_CMD_CALL
ioctl and DSM commands that we receive.

The layout of the DSM commands as we expect from libnvdimm/libndctl is
defined in 'struct nd_pkg_papr_scm' which contains a 'struct
nd_cmd_pkg' as header. This header is used to communicate the DSM
command via 'nd_pkg_papr_scm->nd_command' and size of payload that
need to be sent/received for servicing the DSM.

The PAPR DSM commands are assigned indexes started from 0x10000 to
prevent them from overlapping ND_CMD_* values and also makes handling
dimm commands in papr_scm_ndctl() easier via a simplified switch-case
block. For this a new function cmd_to_func() is implemented that reads
the args to papr_scm_ndctl() , performs sanity tests on them and
converts them to PAPR DSM commands which can then be handled via the
switch-case block.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 96 +++++++++++++++++++++--
 1 file changed, 89 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index deaece6e4d18..e1a2c0e61077 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -20,10 +20,29 @@
 #define PAPR_SCM_DIMM_CMD_MASK \
 	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
-	 (1ul << ND_CMD_SET_CONFIG_DATA))
+	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
+	 (1ul << ND_CMD_CALL))
 
 #define PAPR_SCM_MAX_PERF_STAT 4096
 
+/*
+ * Sub commands for ND_CMD_CALL. To prevent overlap from ND_CMD_*, values for
+ * these enums start at 0x10000. These values are then returned from
+ * cmd_to_func() making it easy to implement the switch-case block in
+ * papr_scm_ndctl()
+ */
+enum {
+	DSM_PAPR_MIN =  0x10000,
+	DSM_PAPR_MAX,
+};
+
+/* Payload expected with ND_CMD_CALL ioctl from libnvdimm */
+struct nd_pkg_papr_scm {
+	struct nd_cmd_pkg hdr;		/* Package header containing sub-cmd */
+	uint32_t cmd_status;		/* Out: Sub-cmd status returned back */
+	uint8_t payload[];		/* Out: Sub-cmd data buffer */
+} __packed;
+
 /* Buffer layout returned by phyp when reporting drc perf stats */
 struct papr_scm_perf_stats {
 	uint8_t version;		/* Should be 0x01 */
@@ -303,19 +322,74 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
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
+	struct nd_pkg_papr_scm *pkg = (struct nd_pkg_papr_scm *)buf;
+
+	/* Only dimm-specific calls are supported atm */
+	if (!nvdimm)
+		return -EINVAL;
+
+	if (!test_bit(cmd, &cmd_mask)) {
+
+		pr_debug("%s: Unsupported cmd=%u\n", __func__, cmd);
+		return -EINVAL;
+
+	} else if (cmd != ND_CMD_CALL) {
+
+		return cmd;
+
+	} else if (buf_len < sizeof(struct nd_pkg_papr_scm)) {
+
+		pr_debug("%s: Invalid pkg size=%u\n", __func__, buf_len);
+		return -EINVAL;
+
+	} else if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR) {
+
+		pr_debug("%s: Invalid pkg family=0x%llx\n", __func__,
+			 pkg->hdr.nd_family);
+		return -EINVAL;
+
+	} else if (pkg->hdr.nd_command <= DSM_PAPR_MIN ||
+		   pkg->hdr.nd_command >= DSM_PAPR_MAX) {
+
+		/* for unknown subcommands return ND_CMD_CALL */
+		pr_debug("%s: Unknown sub-command=0x%llx\n", __func__,
+			 pkg->hdr.nd_command);
+		return ND_CMD_CALL;
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
+	struct nd_pkg_papr_scm *call_pkg = NULL;
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
 
@@ -333,13 +407,21 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
 		*cmd_rc = papr_scm_meta_set(p, buf);
 		break;
 
+	case ND_CMD_CALL:
+		/* This happens if subcommand package sanity fails */
+		call_pkg = (struct nd_pkg_papr_scm *) buf;
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

