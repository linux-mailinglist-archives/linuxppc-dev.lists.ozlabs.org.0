Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB9722F87B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 20:52:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFpp10XpbzF1d9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 04:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFpgN6l7XzF1Tn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:46:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFpgN3HT8z8t44
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:46:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFpgN1wGwz9sSt; Tue, 28 Jul 2020 04:46:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFpgM4mTkz9sSn
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jul 2020 04:46:39 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RIWYZv087265
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 14:46:37 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32htsc8cnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 14:46:37 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RIkJpZ032197
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 18:46:36 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 32gcq10aw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 18:46:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RIkZJx51052962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 18:46:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A484D124058;
 Mon, 27 Jul 2020 18:46:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C57E124052;
 Mon, 27 Jul 2020 18:46:35 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 18:46:35 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/2] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
Date: Mon, 27 Jul 2020 13:46:05 -0500
Message-Id: <20200727184605.2945095-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200727184605.2945095-1-cheloha@linux.ibm.com>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_13:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=1 priorityscore=1501 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=845 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270125
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Tyrel Datwylder <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The H_GetPerformanceCounterInfo (GPCI) PHYP hypercall has a subcall,
Affinity_Domain_Info_By_Partition, which returns, among other things,
a "partition affinity score" for a given LPAR.  This score, a value on
[0-100], represents the processor-memory affinity for the LPAR in
question.  A score of 0 indicates the worst possible affinity while a
score of 100 indicates perfect affinity.  The score can be used to
reason about performance.

This patch adds the score for the local LPAR to the lparcfg procfile
under a new 'partition_affinity_score' key.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index b8d28ab88178..e278390ab28d 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -136,6 +136,39 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
 	return rc;
 }
 
+static void show_gpci_data(struct seq_file *m)
+{
+	struct hv_gpci_request_buffer *buf;
+	unsigned int affinity_score;
+	long ret;
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
+	affinity_score = buf->bytes[0xB];
+	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
+out:
+	kfree(buf);
+}
+
 static unsigned h_pic(unsigned long *pool_idle_time,
 		      unsigned long *num_procs)
 {
@@ -487,6 +520,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 			   partition_active_processors * 100);
 	}
 
+	show_gpci_data(m);
+
 	seq_printf(m, "partition_active_processors=%d\n",
 		   partition_active_processors);
 
-- 
2.24.1

