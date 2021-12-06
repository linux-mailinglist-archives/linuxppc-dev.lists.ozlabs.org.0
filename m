Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B54946923C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6ybL74Jyz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:21:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2WQu/aT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q2WQu/aT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yYC3fQjz2yfn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:19:11 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B68Mcwr018083; 
 Mon, 6 Dec 2021 09:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WfeT5DQOxs0al1WEuh7Vb8FC2j7czIvygmqgen7+fI8=;
 b=Q2WQu/aTqwq0nvkDGHO56i+YMNvA1LuJ7RjYxYQvwOjZkZRLqZLHqAdSiss1eQX4xn+R
 j7Cu94TdXjSbRy6Ev07jXDGFdbnKuprp+WbER3vgbTdfYB+smizkWHo3HaMyuS8zcqvg
 BwPgXpM/lVmUEbQNC4BChUqNvyGI7CWe4fU7KZjccYEVKtikqQ5ADhbE9uiqI1533NAk
 +TeNMX6dtOokBMA60siv726JMS3Yj4RnTU+umRkrLdFZ2aFYcpcCrf3m/BCG1liyImYu
 3Hnhq/ZvCoOPCI1z4B1klU9LydLNf2O19rslW8jsGxkZ3bhcFXDhANUfOOj0Tg8Mbs/y 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csey2s0ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:46 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B68Q0eJ025856;
 Mon, 6 Dec 2021 09:18:46 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csey2s0e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69CaP9024600;
 Mon, 6 Dec 2021 09:18:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykhtju8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B69IfXi19136846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:18:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20FEAA4065;
 Mon,  6 Dec 2021 09:18:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54D83A405E;
 Mon,  6 Dec 2021 09:18:34 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.39.249]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:18:34 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 2/4] tools/perf: Add new macros for mem_hops field
Date: Mon,  6 Dec 2021 14:47:47 +0530
Message-Id: <20211206091749.87585-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LODHfGWl7sSLbNIDyUeAoldYZfrKqpiW
X-Proofpoint-GUID: -DKKhDggT6iu9rpCNN6ztHOYtU_-S-3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060054
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new macros for mem_hops field which can be used to
represent remote-node, socket and board level details.

Currently the code had macro for HOPS_0 which, corresponds
to data coming from another core but same node.
Add new macros for HOPS_1 to HOPS_3 to represent
remote-node, socket and board level data.

Also add corresponding strings in the mem_hops array to
represent mem_hop field data in perf_mem__lvl_scnprintf function

Incase mem_hops field is used, PERF_MEM_LVLNUM field also need
to be set inorder to represent the data source. Hence printing
data source via PERF_MEM_LVL field can be skip in that scenario.

For ex: Encodings for mem_hops fields with L2 cache:

L2                      - local L2
L2 | REMOTE | HOPS_0    - remote core, same node L2
L2 | REMOTE | HOPS_1    - remote node, same socket L2
L2 | REMOTE | HOPS_2    - remote socket, same board L2
L2 | REMOTE | HOPS_3    - remote board L2

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/include/uapi/linux/perf_event.h |  5 ++++-
 tools/perf/util/mem-events.c          | 29 +++++++++++++++++----------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index bd8860eeb291..4cd39aaccbe7 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1332,7 +1332,10 @@ union perf_mem_data_src {
 
 /* hop level */
 #define PERF_MEM_HOPS_0		0x01 /* remote core, same node */
-/* 2-7 available */
+#define PERF_MEM_HOPS_1         0x02 /* remote node, same socket */
+#define PERF_MEM_HOPS_2         0x03 /* remote socket, same board */
+#define PERF_MEM_HOPS_3         0x04 /* remote board */
+/* 5-7 available */
 #define PERF_MEM_HOPS_SHIFT	43
 
 #define PERF_MEM_S(a, s) \
diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 3167b4628b6d..ed0ab838bcc5 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -309,6 +309,9 @@ static const char * const mem_hops[] = {
 	 * to be set with mem_hops field.
 	 */
 	"core, same node",
+	"node, same socket",
+	"socket, same board",
+	"board",
 };
 
 int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
@@ -316,7 +319,7 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
 	size_t i, l = 0;
 	u64 m =  PERF_MEM_LVL_NA;
 	u64 hit, miss;
-	int printed;
+	int printed = 0;
 
 	if (mem_info)
 		m  = mem_info->data_src.mem_lvl;
@@ -335,18 +338,22 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
 		l += 7;
 	}
 
-	if (mem_info && mem_info->data_src.mem_hops)
+	/*
+	 * Incase mem_hops field is set, we can skip printing data source via
+	 * PERF_MEM_LVL namespace.
+	 */
+	if (mem_info && mem_info->data_src.mem_hops) {
 		l += scnprintf(out + l, sz - l, "%s ", mem_hops[mem_info->data_src.mem_hops]);
-
-	printed = 0;
-	for (i = 0; m && i < ARRAY_SIZE(mem_lvl); i++, m >>= 1) {
-		if (!(m & 0x1))
-			continue;
-		if (printed++) {
-			strcat(out, " or ");
-			l += 4;
+	} else {
+		for (i = 0; m && i < ARRAY_SIZE(mem_lvl); i++, m >>= 1) {
+			if (!(m & 0x1))
+				continue;
+			if (printed++) {
+				strcat(out, " or ");
+				l += 4;
+			}
+			l += scnprintf(out + l, sz - l, mem_lvl[i]);
 		}
-		l += scnprintf(out + l, sz - l, mem_lvl[i]);
 	}
 
 	if (mem_info && mem_info->data_src.mem_lvl_num) {
-- 
2.27.0

