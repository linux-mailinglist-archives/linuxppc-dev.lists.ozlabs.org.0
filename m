Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25D48677B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 17:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVBJ70sklz30Lr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 03:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YFnTdoTU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YFnTdoTU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVBHM1KFhz2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 03:13:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206EbCbi000345; 
 Thu, 6 Jan 2022 16:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=M236Z2TBaBwKO1irAKzWxmDNxZ6IyGDotrQxPcwRSSU=;
 b=YFnTdoTUI1D+wjzjH6de+oxx1sbuEU1eJWT45rp1qwqiaRMlSrpXNVIuPJfyD3hAZ2ej
 vtbaEDKShtDGJvgmHJUAZhQSklkfYgI3Ag6ok3xcHaNfq1Hd3L4pChhUiLW/4a9fkP0T
 y6izWC7UATc7+uJVJiWPn31ruR2iQgYuh86OUZ85adL8kp/YbcyD0vkJ1vFBqrPTpRq+
 eiCbbf4j/OVAqj76k3Fqa/8DRB7SLN0U/kY6724oFSBfTi/pzJI1Z/TfVpMa8ARr4d5B
 jfqS6vuhFIkElp4X26PBgOScn+OR1DIzFuD4WN0KyTHgYahjcpYHjtThEpndaVcI2O1O OA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de1hj3nkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 16:13:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206G9Fi3024040;
 Thu, 6 Jan 2022 16:13:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3ddmrr6vjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 16:13:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206GDgef36700442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 16:13:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21C7C42045;
 Thu,  6 Jan 2022 16:13:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D62F342042;
 Thu,  6 Jan 2022 16:13:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.164.165])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 16:13:41 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
Date: Thu,  6 Jan 2022 17:13:39 +0100
Message-Id: <20220106161339.74656-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tdYeJyteI3OpmBfnlxuuErlnDwEGMpk9
X-Proofpoint-ORIG-GUID: tdYeJyteI3OpmBfnlxuuErlnDwEGMpk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_06,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060112
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LPAR name may be changed after the LPAR has been started in the HMC.
In that case lparstat command is not reporting the updated value because it
reads it from the device tree which is read at boot time.

However this value could be read from RTAS.

Adding this value in the /proc/powerpc/lparcfg output allows to read the
updated value.

However the hypervisor, like Qemu/KVM, may not support this RTAS
parameter. In that case the value reported in lparcfg is read from the
device tree and so is not updated accordingly.

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
v5:
 fallback to the device tree value if RTAS is not providing the value.
v4:
 address Nathan's new comments limiting size of the buffer.
v3:
 address Michael's comments.
v2:
 address Nathan's comments.
 change title to partition_name aligning with existing partition_id
---
 arch/powerpc/platforms/pseries/lparcfg.c | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index c7940fcfc911..8ca08fc306e7 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -311,6 +311,98 @@ static void parse_mpp_x_data(struct seq_file *m)
 		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
 }
 
+/*
+ * PAPR defines, in section "7.3.16 System Parameters Option", the token 55 to
+ * read the LPAR name, and the largest output data to 4000 + 2 bytes length.
+ */
+#define SPLPAR_LPAR_NAME_TOKEN	55
+#define GET_SYS_PARM_BUF_SIZE	4002
+#if GET_SYS_PARM_BUF_SIZE > RTAS_DATA_BUF_SIZE
+#error "GET_SYS_PARM_BUF_SIZE is larger than RTAS_DATA_BUF_SIZE"
+#endif
+
+/**
+ * Read the lpar name using the RTAS ibm,get-system-parameter call.
+ *
+ * The name read through this call is updated if changes are made by the end
+ * user on the hypervisor side.
+ *
+ * Some hypervisor (like Qemu) may not provide this value. In that case, a non
+ * null value is returned.
+ */
+static int read_RTAS_lpar_name(struct seq_file *m)
+{
+	int rc, len, token;
+	union {
+		char raw_buffer[GET_SYS_PARM_BUF_SIZE];
+		struct {
+			__be16 len;
+			char name[GET_SYS_PARM_BUF_SIZE-2];
+		};
+	} *local_buffer;
+
+	token = rtas_token("ibm,get-system-parameter");
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return -EINVAL;
+
+	local_buffer = kmalloc(sizeof(*local_buffer), GFP_KERNEL);
+	if (!local_buffer)
+		return -ENOMEM;
+
+	do {
+		spin_lock(&rtas_data_buf_lock);
+		memset(rtas_data_buf, 0, sizeof(*local_buffer));
+		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
+			       __pa(rtas_data_buf), sizeof(*local_buffer));
+		if (!rc)
+			memcpy(local_buffer->raw_buffer, rtas_data_buf,
+			       sizeof(local_buffer->raw_buffer));
+		spin_unlock(&rtas_data_buf_lock);
+	} while (rtas_busy_delay(rc));
+
+	if (!rc) {
+		/* Force end of string */
+		len = min((int) be16_to_cpu(local_buffer->len),
+			  (int) sizeof(local_buffer->name)-1);
+		local_buffer->name[len] = '\0';
+
+		seq_printf(m, "partition_name=%s\n", local_buffer->name);
+	} else
+		rc = -ENODATA;
+
+	kfree(local_buffer);
+	return rc;
+}
+
+/**
+ * Read the LPAR name from the Device Tree.
+ *
+ * The value read in the DT is not updated if the end-user is touching the LPAR
+ * name on the hypervisor side.
+ */
+static int read_DT_lpar_name(struct seq_file *m)
+{
+	struct device_node *rootdn;
+	const char *name;
+
+	rootdn = of_find_node_by_path("/");
+	if (!rootdn)
+		return -ENOENT;
+
+	name = of_get_property(rootdn, "ibm,partition-name", NULL);
+	if (!name)
+		return -ENOENT;
+
+	seq_printf(m, "partition_name=%s\n", name);
+	return 0;
+}
+
+static void read_lpar_name(struct seq_file *m)
+{
+	if (read_RTAS_lpar_name(m) && read_DT_lpar_name(m))
+		pr_err_once("Error can't get the LPAR name");
+}
+
 #define SPLPAR_CHARACTERISTICS_TOKEN 20
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
 
@@ -496,6 +588,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 
 	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
 		/* this call handles the ibm,get-system-parameter contents */
+		read_lpar_name(m);
 		parse_system_parameter_string(m);
 		parse_ppp_data(m);
 		parse_mpp_data(m);
-- 
2.34.1

