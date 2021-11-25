Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123E45D345
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 03:50:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J02Rr06w8z307C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:50:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IG7VdxhQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IG7VdxhQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J02QN6PTlz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 13:49:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP0qPWE006787; 
 Thu, 25 Nov 2021 02:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C40OB4Jccg7bkamDzO65YMLvJwNjBcaIPgub+YQyaT8=;
 b=IG7VdxhQvDts5HjBoA8G98Lu7leKleFEesCCwvXQf7pi4Vy8XqJUQM3O/0fklohQnKI3
 b4leJW+q6eQ2SqHuHkkoI9xn7O3XYU8mvD9w5mt5ezZdzZz5CwBW4iEkNctNc6bNex5H
 7PlDSb6lsyRgnG648Qx11pdpY8FBEHFXLgKbF3jXwcjM/2aQFBYmX6RvtXFzDHqZjPha
 bTBPZMYKCrUwSVbJgkiM0uoFG5DpaXuQ0iGDOJcAUD6wkKFeWHZW+woHmdZqinmcHn53
 4yfrFZE8Ic3F6gXhQN4lNyVL5l1F+mSMglrUcSlmV7R3OgHEhPiqS7oUsUaS3/Uu5NOI OA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cj0b19hfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 02:49:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AP2l1UL023426;
 Thu, 25 Nov 2021 02:49:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3cernaejws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 02:49:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AP2n50R30015834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 02:49:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85F97AE057;
 Thu, 25 Nov 2021 02:49:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23A5DAE04D;
 Thu, 25 Nov 2021 02:49:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.111.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 02:49:00 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 2/2] tools/perf: Update global/local variants for p_stage_cyc
 in powerpc
Date: Thu, 25 Nov 2021 08:18:51 +0530
Message-Id: <20211125024851.22895-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
References: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hTpYosNbS29M8sv0f6v-3T6K79djDb-Q
X-Proofpoint-GUID: hTpYosNbS29M8sv0f6v-3T6K79djDb-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250011
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
2.27.0

