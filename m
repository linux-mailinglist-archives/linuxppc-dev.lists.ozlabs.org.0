Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94A466FB1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 03:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xR20nBCz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 13:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nqidfk5T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nqidfk5T; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xQD3s3Wz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 13:21:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B31Idpk033995; 
 Fri, 3 Dec 2021 02:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yaixhyjv29iIVGHfr1cMju6oywxs6+Q44ihuiU5tfQc=;
 b=Nqidfk5TWM0xYCe9yf4XXJmHn9TPxvmvK3Ff1jC9sUfQ0XTJTFBjcVF1Kk+BCSME/6z7
 GklJxIGubu0JoS7gqZRGZs5l145SbVjXP4zgKbvQDz+vhuqWbvmIjONo3HwIpqNKTYGE
 sNFO6PxZmZ7aRf+e+u5YddHidyHyDRUtjAjSX2hEAEp1p6locE7gtfE7atkssF6TglzX
 qTkBAGCXBNefNsgEI9RMwmzQ2r0dQn0vMFec4rBIrwY0C8pRPBzj/sAW0alJrByS9RB8
 wQPcVhimlBpWQdRwn0ejK/3fonzk8HUQF4ik3LCWRs62MWEOsYbC+J2EiP+ydvdhzQQx Pw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq9eu8wgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:20:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B32IYuN005668;
 Fri, 3 Dec 2021 02:20:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3ckcaapr27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 02:20:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B32DMkV28901692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 02:13:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3D3F11C054;
 Fri,  3 Dec 2021 02:20:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AFEC11C05E;
 Fri,  3 Dec 2021 02:20:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.109.106])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 02:20:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V2 2/2] tools/perf: Update global/local variants for
 p_stage_cyc in powerpc
Date: Fri,  3 Dec 2021 07:50:38 +0530
Message-Id: <20211203022038.48240-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
References: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P3ZaHHjRHbE67_r3-2YGURwRPidryqdI
X-Proofpoint-ORIG-GUID: P3ZaHHjRHbE67_r3-2YGURwRPidryqdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_16,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030012
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, namhyung@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the arch_support_sort_key() function in powerpc
to enable presenting local and global variants of sort
key: p_stage_cyc. Update the "se_header" strings for
these in arch_perf_header_entry() function along with
instruction latency.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reported-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/arch/powerpc/util/event.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/powerpc/util/event.c b/tools/perf/arch/powerpc/util/event.c
index 3bf441257466..cf430a4c55b9 100644
--- a/tools/perf/arch/powerpc/util/event.c
+++ b/tools/perf/arch/powerpc/util/event.c
@@ -40,8 +40,12 @@ const char *arch_perf_header_entry(const char *se_header)
 {
 	if (!strcmp(se_header, "Local INSTR Latency"))
 		return "Finish Cyc";
-	else if (!strcmp(se_header, "Pipeline Stage Cycle"))
+	else if (!strcmp(se_header, "INSTR Latency"))
+		return "Global Finish_cyc";
+	else if (!strcmp(se_header, "Local Pipeline Stage Cycle"))
 		return "Dispatch Cyc";
+	else if (!strcmp(se_header, "Pipeline Stage Cycle"))
+		return "Global Dispatch_cyc";
 	return se_header;
 }
 
@@ -49,5 +53,7 @@ int arch_support_sort_key(const char *sort_key)
 {
 	if (!strcmp(sort_key, "p_stage_cyc"))
 		return 1;
+	if (!strcmp(sort_key, "local_p_stage_cyc"))
+		return 1;
 	return 0;
 }
-- 
2.33.0

