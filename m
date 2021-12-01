Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08634465627
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 20:07:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J47rK6bf3z3cNB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 06:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JX4HgIoq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JX4HgIoq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J47qc6WBZz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 06:06:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B1IHNw0001048; 
 Wed, 1 Dec 2021 19:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qX2wfw0M06LVvuZl5qfJjkfTCvWNE8LjAca34Yw8j+0=;
 b=JX4HgIoqUTDXshxFskX1nk5yKWckOu2xl422L6Cl5RlaON5nQmKn40fAkrjuAD3dvHAv
 gCmCp5Wd2OzRfEbBLZFwQZZEYMgVj5gsP53wy9dKa2nonZU8rivuaq1D9AwKNNrDYzP9
 8jfqK2jKMt596e/2x/bJPyvdfx93+NysfgfSrUdyLs+ax6pM5cwK0EUUUbM+Zvf4LqdA
 l/pUrRThqAnBLr9lrtsyPzR2lXQQgOG095wXr2/fSaIqfute7IjLZYUD2Ljn7ZNsri2E
 Hqr5AQlUKEiaWsROJvvIntEfOhD/T5ucdoZ0Tz0c0oW3dW+o1cEBmZvWCHIZQFPMlNHs lw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cpe6s8yk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 19:06:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B1J3PsF025405;
 Wed, 1 Dec 2021 19:06:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3cncgmj0a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Dec 2021 19:06:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B1J6ivD29819316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Dec 2021 19:06:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2950A4054;
 Wed,  1 Dec 2021 19:06:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4789A4062;
 Wed,  1 Dec 2021 19:06:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.175.48])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Dec 2021 19:06:43 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: read the lpar name from the firmware
Date: Wed,  1 Dec 2021 20:06:42 +0100
Message-Id: <20211201190642.49897-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: orZY7vxqrOnrp6yuC8Og36RUH1hy330J
X-Proofpoint-ORIG-GUID: orZY7vxqrOnrp6yuC8Og36RUH1hy330J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112010102
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LPAR name may be changed after the LPAR has been started in the HMC.
In that case lparstat command is not reporting the updated value because it
reads it from the device tree which is read at boot time.

However this value could be read from RTAS.

Adding this value in the /proc/powerpc/lparcfg output allows to read the
updated value.

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
v2:
 address Nathan's comments.
 change title to partition_name aligning with existing partition_id
---
 arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..0deca7b4cd81 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -311,6 +311,58 @@ static void parse_mpp_x_data(struct seq_file *m)
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
+	int rc, len, token;
+	unsigned char *local_buffer;
+
+	token = rtas_token("ibm,get-system-parameter");
+	if (token == RTAS_UNKNOWN_SERVICE)
+		return;
+
+	local_buffer = kmalloc(SPLPAR_LPAR_NAME_MAXLEN, GFP_KERNEL);
+	if (!local_buffer)
+		return;
+
+	do {
+		spin_lock(&rtas_data_buf_lock);
+
+		memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
+		rc = rtas_call(token, 3, 1, NULL, SPLPAR_LPAR_NAME_TOKEN,
+			       __pa(rtas_data_buf), RTAS_DATA_BUF_SIZE);
+		memcpy(local_buffer, rtas_data_buf, SPLPAR_LPAR_NAME_MAXLEN);
+
+		spin_unlock(&rtas_data_buf_lock);
+	} while (rtas_busy_delay(rc));
+
+	if (rc != 0) {
+		pr_err_once(
+			"%s %s Error calling get-system-parameter (0x%x)\n",
+			__FILE__, __func__, rc);
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
+		seq_printf(m, "partition_name=%s\n", local_buffer + 2);
+	}
+
+	kfree(local_buffer);
+}
+
+
 #define SPLPAR_CHARACTERISTICS_TOKEN 20
 #define SPLPAR_MAXLENGTH 1026*(sizeof(char))
 
@@ -496,6 +548,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 
 	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
 		/* this call handles the ibm,get-system-parameter contents */
+		parse_lpar_name(m);
 		parse_system_parameter_string(m);
 		parse_ppp_data(m);
 		parse_mpp_data(m);
-- 
2.34.1

