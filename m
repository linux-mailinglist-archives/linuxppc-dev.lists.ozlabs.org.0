Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A542222A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 11:21:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNsXy32h8z30QW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 20:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DVUUVAXx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DVUUVAXx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNsW16G0Gz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 20:20:13 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1958gBuk024366; 
 Tue, 5 Oct 2021 05:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eOPEefFddRaBayf58oH90vGMUYF6SyRxA+nfxkPpTxk=;
 b=DVUUVAXx6AnyjA4Ddg69/MXO5UowsW9DJ7rjqptl84YbQ/xK2dAQjtQbmdjcuud68DhB
 rM3ujxrLg2zKhQ0H5ONZRh2pnnRrJfk5bXMVwID4urwYjhhYnZd4LdFgfmJjhW6ICfH0
 TNz8AW6W9sk6F74KHJYffMjC4e5wQPdUNILBbzpuNOboprcANQ7qn8cmnhlvdVZ2azBQ
 s3/fRJCLUTa604L/w8bwsreOoKy++QfRrRKz4H0ua8vfI/i+bEl4wU3DoyrtQByuHGEW
 1CAyimNBM5uSpbYpaVvzVAsac++xNHc956bUEOM2tKgbh/lOUAW03zBCJSwSk8atR8ge FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgkdw8s60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:19:51 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195936PW009019;
 Tue, 5 Oct 2021 05:19:50 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgkdw8s5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:19:50 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1959DcWY025863;
 Tue, 5 Oct 2021 09:19:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3bef29xag8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 09:19:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1959Je4v59703582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 09:19:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE38FA406A;
 Tue,  5 Oct 2021 09:19:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BCB0A405F;
 Tue,  5 Oct 2021 09:19:32 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.64.84])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 09:19:31 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 3/4] tools/perf: Add mem_hops field in perf_mem_data_src
 structure
Date: Tue,  5 Oct 2021 14:48:36 +0530
Message-Id: <20211005091837.250044-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211005091837.250044-1-kjain@linux.ibm.com>
References: <20211005091837.250044-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q2HJ2QQMfcrDN-v8_t3OMjBYirN958xA
X-Proofpoint-GUID: P_jVUczgTesC5FxIesfbS4nxYJj0w2lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050052
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

Going forward, future generation systems can have more hierarchy
within the chip/package level but currently we don't have any data source
encoding field in perf, which can be used to represent this level of data.

Add a new field called 'mem_hops' in the perf_mem_data_src structure
which can be used to represent intra-chip/package or inter-chip/off-package
details. This field is of size 3 bits where PERF_MEM_HOPS_{NA, 0..6} value
can be used to present different hop levels data.

Also add corresponding macros to define mem_hop field values
and shift value.

Currently we define macro for HOPS_0 which corresponds
to data coming from another core but same chip.

Add functionality to represent mem_hop field data in
perf_mem__lvl_scnprintf function with the help of added string
array called mem_hops.

For ex: Encodings for mem_hops fields with L2 cache:

L2                      - local L2
L2 | REMOTE | HOPS_0    - remote core, same chip L2

Since with the addition of HOPS field, now remote can be used to
denote cache access from the same chip but different core, a check
is added in the c2c_decode_stats function to set mrem only when HOPS
is zero along with set remote field.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/include/uapi/linux/perf_event.h | 11 +++++++++--
 tools/perf/util/mem-events.c          | 19 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index e1701e9c7858..42680563228c 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1210,14 +1210,16 @@ union perf_mem_data_src {
 			mem_remote:1,   /* remote */
 			mem_snoopx:2,	/* snoop mode, ext */
 			mem_blk:3,	/* access blocked */
-			mem_rsvd:21;
+			mem_hops:3,	/* hop level */
+			mem_rsvd:18;
 	};
 };
 #elif defined(__BIG_ENDIAN_BITFIELD)
 union perf_mem_data_src {
 	__u64 val;
 	struct {
-		__u64	mem_rsvd:21,
+		__u64	mem_rsvd:18,
+			mem_hops:3,	/* hop level */
 			mem_blk:3,	/* access blocked */
 			mem_snoopx:2,	/* snoop mode, ext */
 			mem_remote:1,   /* remote */
@@ -1313,6 +1315,11 @@ union perf_mem_data_src {
 #define PERF_MEM_BLK_ADDR	0x04 /* address conflict */
 #define PERF_MEM_BLK_SHIFT	40
 
+/* hop level */
+#define PERF_MEM_HOPS_0		0x01 /* remote core, same chip */
+/* 2-7 available */
+#define PERF_MEM_HOPS_SHIFT	43
+
 #define PERF_MEM_S(a, s) \
 	(((__u64)PERF_MEM_##a##_##s) << PERF_MEM_##a##_SHIFT)
 
diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index ff7289e28192..585b29592a24 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -301,6 +301,16 @@ static const char * const mem_lvlnum[] = {
 	[PERF_MEM_LVLNUM_NA] = "N/A",
 };
 
+static const char * const mem_hops[] = {
+	"N/A",
+	/*
+	 * While printing, 'Remote' will be added to represent
+	 * 'Remote core, same chip' accesses as remote field need
+	 * to be set with mem_hops field.
+	 */
+	"core, same chip",
+};
+
 int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
 {
 	size_t i, l = 0;
@@ -325,6 +335,9 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
 		l += 7;
 	}
 
+	if (mem_info && mem_info->data_src.mem_hops)
+		l += scnprintf(out + l, sz - l, "%s ", mem_hops[mem_info->data_src.mem_hops]);
+
 	printed = 0;
 	for (i = 0; m && i < ARRAY_SIZE(mem_lvl); i++, m >>= 1) {
 		if (!(m & 0x1))
@@ -471,8 +484,12 @@ int c2c_decode_stats(struct c2c_stats *stats, struct mem_info *mi)
 	/*
 	 * Skylake might report unknown remote level via this
 	 * bit, consider it when evaluating remote HITMs.
+	 *
+	 * Incase of power, remote field can also be used to denote cache
+	 * accesses from the another core of same chip. Hence, setting
+	 * mrem only when HOPS is zero along with set remote field.
 	 */
-	bool mrem  = data_src->mem_remote;
+	bool mrem  = (data_src->mem_remote && !data_src->mem_hops);
 	int err = 0;
 
 #define HITM_INC(__f)		\
-- 
2.26.2

