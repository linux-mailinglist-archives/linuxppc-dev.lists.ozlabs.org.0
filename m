Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B353201980
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 19:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pQry6LQMzDrQH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 03:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pNCG6RDxzDrQm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 01:34:27 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JFVvHe039114
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 11:34:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rmmf4f7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 11:34:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JFJPv5022759
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:34:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31q6c8v16m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:34:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JFYIFJ7995834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 15:34:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA35DC605B;
 Fri, 19 Jun 2020 15:34:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E36BC6057;
 Fri, 19 Jun 2020 15:34:19 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 15:34:19 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
Date: Fri, 19 Jun 2020 10:34:19 -0500
Message-Id: <20200619153419.3676392-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_16:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=1 phishscore=0 clxscore=1011 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648
 impostorscore=0 mlxscore=0 mlxlogscore=824 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190111
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The H_GetPerformanceCounterInfo PHYP hypercall has a subcall,
Affinity_Domain_Info_By_Partition, which returns, among other things,
a "partition affinity score" for a given LPAR.  This score, a value on
[0-100], represents the processor-memory affinity for the LPAR in
question.  A score of 0 indicates the worst possible affinity while a
score of 100 indicates perfect affinity.  The score can be used to
reason about performance.

This patch adds the score for the local LPAR to the lparcfg procfile
under a new 'partition_affinity_score' key.

The H_GetPerformanceCounterInfo hypercall is already used elsewhere in
the kernel, in powerpc/perf/hv-gpci.c.  Refactoring that code and this
code into a more general API might be worthwhile if additional modules
require the hypercall in the future.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index b8d28ab88178..b75151eee0f0 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -136,6 +136,57 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
 	return rc;
 }
 
+/*
+ * Based on H_GetPerformanceCounterInfo v1.10.
+ */
+static void show_gpci_data(struct seq_file *m)
+{
+	struct perf_counter_info_params {
+		__be32 counter_request;
+		__be32 starting_index;
+		__be16 secondary_index;
+		__be16 returned_values;
+		__be32 detail_rc;
+		__be16 counter_value_element_size;
+		u8     counter_info_version_in;
+		u8     counter_info_version_out;
+		u8     reserved[0xC];
+	} __packed;
+	struct hv_gpci_request_buffer {
+		struct perf_counter_info_params params;
+		u8 output[4096 - sizeof(struct perf_counter_info_params)];
+	} __packed;
+	struct hv_gpci_request_buffer *buf;
+	long ret;
+	unsigned int affinity_score;
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (buf == NULL)
+		return;
+
+	/*
+	 * Show the local LPAR's affinity score.
+	 *
+	 * 0xB1 selects the Affinity_Domain_Info_By_Partition subcall.
+	 * The score is at byte 0xB in the output buffer.
+	 */
+	memset(&buf->params, 0, sizeof(buf->params));
+	buf->params.counter_request = cpu_to_be32(0xB1);
+	buf->params.starting_index = cpu_to_be32(-1);	/* local LPAR */
+	buf->params.counter_info_version_in = 0x5;	/* v5+ for score */
+	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO, virt_to_phys(buf),
+				 sizeof(*buf));
+	if (ret != H_SUCCESS) {
+		pr_debug("hcall failed: H_GET_PERF_COUNTER_INFO: %ld, %x\n",
+			 ret, be32_to_cpu(buf->params.detail_rc));
+		goto out;
+	}
+	affinity_score = buf->output[0xB];
+	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
+out:
+	kfree(buf);
+}
+
 static unsigned h_pic(unsigned long *pool_idle_time,
 		      unsigned long *num_procs)
 {
@@ -487,6 +538,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 			   partition_active_processors * 100);
 	}
 
+	show_gpci_data(m);
+
 	seq_printf(m, "partition_active_processors=%d\n",
 		   partition_active_processors);
 
-- 
2.24.1

