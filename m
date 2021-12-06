Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D546923D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6yc75c0Qz30RK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkQDirIj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VkQDirIj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yYT2G8Xz2ywp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:19:25 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B66ia67024611; 
 Mon, 6 Dec 2021 09:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=j1OqVax9cNTADXgCBChqDMYVMmFtNd9k35FrpvVQRoE=;
 b=VkQDirIjLYp99yU+KocEFYv9YoU7VE3SxSMqJk9Q684YEvFFNPVoJVernTVcNTsvcuvM
 Vu6jfLV+b19CucUhYMKZZ5hg9ROCIob5df5SizD7aQtwqaAjkiL8FQQrS6EWQ5fcAh4E
 zs01qYsH4BjxIU3i/QBaQLFJdx+vniPZ61BcYpWrdAHUd0uJx9I+Uy0hIIKvbWRWVBXt
 q8wWQSZouvJSzA78+sFOkgZQYhqxnZsjQes/43ZG3lId/40+UYy8DqsxmMLDjfiyA0P+
 ECfm8QTZpbDcsVUPuS9u7vZoTxKOlckyRXjNfpahI/JQ8G9QgayvEMPUKb0flBQJmEHX hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cs9nme18q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:19:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B68wwWY027010;
 Mon, 6 Dec 2021 09:19:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cs9nme186-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:19:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69CxDb025467;
 Mon, 6 Dec 2021 09:18:59 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyaafr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:18:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B69BD6727525546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:11:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E940A406D;
 Mon,  6 Dec 2021 09:18:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C6FCA4059;
 Mon,  6 Dec 2021 09:18:44 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.39.249]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:18:44 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 3/4] powerpc/perf: Add encodings to represent data based on
 newer composite PERF_MEM_LVLNUM* fields
Date: Mon,  6 Dec 2021 14:47:48 +0530
Message-Id: <20211206091749.87585-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2WXUQMUJtj8gRK9mH3oBVDnRCB1y1OQ4
X-Proofpoint-GUID: z0wq5gkXnBT3-BO3u0I-qLzrjW1ZqDEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060054
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

The code represent data coming from L1/L2/L3 cache hits based on
PERF_MEM_LVL_* namespace, which is in the process of deprecation in
the favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_}
fields.

Add data source encodings to represent L1/L2/L3 cache hits based on
newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_} fields for
power10 and older platforms

Result in power9 system without patch changes:

localhost:# ./perf mem report --sort="mem,sym,dso" --stdio
 # Overhead       Samples  Memory access             Symbol                             Shared Object
 # ........  ............  ........................  .................................  ................
 #
    29.51%             1  L2 hit                    [k] perf_event_exec                [kernel.vmlinux]
    27.05%             1  L1 hit                    [k] perf_ctx_unlock                [kernel.vmlinux]
    13.93%             1  L1 hit                    [k] vtime_delta                    [kernel.vmlinux]
    13.11%             1  L1 hit                    [k] prepend_path.isra.11           [kernel.vmlinux]
     8.20%             1  L1 hit                    [.] 00000038.plt_call.__GI_strlen  libc-2.28.so
     8.20%             1  L1 hit                    [k] perf_event_interrupt           [kernel.vmlinux]

Result in power9 system with patch changes:

localhost:# ./perf mem report --sort="mem,sym,dso" --stdio
 # Overhead       Samples  Memory access             Symbol                      Shared Object
 # ........  ............  ........................  ..........................  ................
 #
    36.63%             1  L2 or L2 hit              [k] perf_event_exec         [kernel.vmlinux]
    25.50%             1  L1 or L1 hit              [k] vtime_delta             [kernel.vmlinux]
    13.12%             1  L1 or L1 hit              [k] unmap_region            [kernel.vmlinux]
    12.62%             1  L1 or L1 hit              [k] perf_sample_event_took  [kernel.vmlinux]
     6.93%             1  L1 or L1 hit              [k] perf_ctx_unlock         [kernel.vmlinux]
     5.20%             1  L1 or L1 hit              [.] __memcpy_power7         libc-2.28.so

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 7ea873ab2e6f..6c6bc8b7d887 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -220,13 +220,13 @@ static inline u64 isa207_find_source(u64 idx, u32 sub_idx)
 		/* Nothing to do */
 		break;
 	case 1:
-		ret = PH(LVL, L1);
+		ret = PH(LVL, L1) | LEVEL(L1) | P(SNOOP, HIT);
 		break;
 	case 2:
-		ret = PH(LVL, L2);
+		ret = PH(LVL, L2) | LEVEL(L2) | P(SNOOP, HIT);
 		break;
 	case 3:
-		ret = PH(LVL, L3);
+		ret = PH(LVL, L3) | LEVEL(L3) | P(SNOOP, HIT);
 		break;
 	case 4:
 		if (sub_idx <= 1)
-- 
2.27.0

