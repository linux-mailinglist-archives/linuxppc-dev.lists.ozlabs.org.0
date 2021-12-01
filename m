Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66057465099
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:55:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42FP2Vnxz3f12
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:55:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdWrlO0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YdWrlO0z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J425f0k1Xz3f1p
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:48:37 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B1ETXV2016192; 
 Wed, 1 Dec 2021 14:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=paR6oh+fIvGU/r1Ml8ZH7fE0dd7V0JVbRLg+TaRBQzs=;
 b=YdWrlO0zFvJGv4g1eKxt9SD8kGbXDyfRniW6+MJkvMk9ZIp7CFeTpxihCOujZNqJbQey
 J9dB8pV9NzNxQSCgcCFw9QlXoAizz6+TmKhgxb46oIEu2O7SqSM8ZswUwZs89p5wSTi8
 85r8bOe/KoBTUj2BnAG5K/UnKlmoSaWxe1Nel3IUcniGGQaXvIJ4OnWshGir+NNaeAbX
 2DFsvz9Y7Bly+rq3+iWwSKg8Noy0yXU/RH0+FyM1noULcNIDSRaMG8S2n6G94zA0l4nb
 CoMU48xBish9UnjMt6pjetYGB02qP3+APODP9HNjU/tHwoWdbBA/jKctqjKPP35k9clo +A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cp9tc9ym6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 14:48:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B1ElmG1021215;
 Wed, 1 Dec 2021 14:48:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3ckbxkayyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 14:48:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B1EmRcA15860176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Dec 2021 14:48:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D022BA4060;
 Wed,  1 Dec 2021 14:48:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDFEA405B;
 Wed,  1 Dec 2021 14:48:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.175.48])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Dec 2021 14:48:27 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: read the lpar name from the firmware
Date: Wed,  1 Dec 2021 15:48:26 +0100
Message-Id: <20211201144826.45342-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AaquU0FgRPGwwlkYv3zpyZ3ITJENZlbG
X-Proofpoint-ORIG-GUID: AaquU0FgRPGwwlkYv3zpyZ3ITJENZlbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112010082
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
Cc: nathanl@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LPAR name may be changed after the LPAR has been started in the HMC.
In that case lparstat command is not reporting the updated value because it
reads it from the device tree which is read at boot time.

However this value could be read from RTAS.

Adding this value in the /proc/powerpc/lparcfg output allows to read the
updated value.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..b597b132ce32 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -311,6 +311,55 @@ static void parse_mpp_x_data(struct seq_file *m)
 		seq_printf(m, "coalesce_pool_spurr=%ld\n", mpp_x_data.pool_spurr_cycles);
 }
 
+/*
+ * PAPR defines no maximum for the LPAR name, and defines that the maximum
+ * length of the get-system-parameter's output buffer is 4000 plus 2 bytes for
+ * the length. Limit LPAR's name size to 1024
+ */
+#define SPLPAR_LPAR_NAME_MAXLEN	1026
+#define SPLPAR_LPAR_NAME_TOKEN	55
+static void parse_lpar_name(struct seq_file *m)
+{
+	int call_status, len;
+	unsigned char *local_buffer;
+
+	local_buffer = kmalloc(SPLPAR_LPAR_NAME_MAXLEN, GFP_KERNEL);
+	if (!local_buffer) {
+		pr_err("%s %s kmalloc failure at line %d\n",
+		       __FILE__, __func__, __LINE__);
+		return;
+	}
+
+	spin_lock(&rtas_data_buf_lock);
+	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
+	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
+				NULL,
+				SPLPAR_LPAR_NAME_TOKEN,
+				__pa(rtas_data_buf),
+				RTAS_DATA_BUF_SIZE);
+	memcpy(local_buffer, rtas_data_buf, SPLPAR_LPAR_NAME_MAXLEN);
+	spin_unlock(&rtas_data_buf_lock);
+
+	if (call_status != 0) {
+		pr_err("%s %s Error calling get-system-parameter (0x%x)\n",
+		       __FILE__, __func__, call_status);
+	} else {
+		local_buffer[SPLPAR_LPAR_NAME_MAXLEN - 1] = '\0';
+		len = local_buffer[0] * 256 + local_buffer[1];
+
+		/*
+		 * Forces an empty string in the weird case fw reports no data.
+		 */
+		if (!len)
+			local_buffer[2] = '\0';
+
+		seq_printf(m, "lpar_name=%s\n", local_buffer + 2);
+	}
+
+	kfree(local_buffer);
+}
+
+
 #define SPLPAR_CHARACTERISTICS_TOKEN 20
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
 
@@ -496,6 +545,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 
 	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
 		/* this call handles the ibm,get-system-parameter contents */
+		parse_lpar_name(m);
 		parse_system_parameter_string(m);
 		parse_ppp_data(m);
 		parse_mpp_data(m);
-- 
2.34.1

