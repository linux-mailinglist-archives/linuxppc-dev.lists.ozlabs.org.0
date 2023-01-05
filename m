Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085465EA90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 13:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnlrC5Q1Wz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 23:18:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLaa3iaa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLaa3iaa;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnlqH6nyLz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 23:18:03 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 305C7fWc029794;
	Thu, 5 Jan 2023 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qQIDhv4SblcyzJ28wo0BRJrosT1DrVJ/BznvnyM5KYs=;
 b=XLaa3iaa+W0hcgW17J0OOGG4u8YhLngbND1TUt1Nd/XveCG2XZ6FmijxyiriHpVLxCqp
 VpGTbb+nX6hUNDxvvBDXJEghmq4N288yIIFdunuiWrKJ7+2ju6PybQW5EJTRNuWb+vXj
 8mwdf1GHB8PfypchkeT5XtbYnzRQQ1wUjji/LmPs2oTbBaWjlQvprA+JMd5U1/Jp9TGU
 PUndsDm4heZ6GheHo+1cE/N6jCiOZ2u2DWrKDOJT/+I1ysm/miHbpVE+6bmC15fGvtI/
 MgGp+l8mC1zPnv/AzYD7R6o2eIiMSb9XljUZj9yaiCJjIskoCDQaFydBswlUJap3xGNg DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mww14hu74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:17:53 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305CALpd012230;
	Thu, 5 Jan 2023 12:17:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mww14hu60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:17:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3054pLvS001428;
	Thu, 5 Jan 2023 12:17:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mtcbfer9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jan 2023 12:17:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 305CHks622479288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Jan 2023 12:17:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4ACF720040;
	Thu,  5 Jan 2023 12:17:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BEAE20043;
	Thu,  5 Jan 2023 12:17:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.85])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 12:17:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 1/2] tools/perf: Update the exit error codes in function try_to_find_probe_trace_event
Date: Thu,  5 Jan 2023 17:47:41 +0530
Message-Id: <20230105121742.92249-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -PQhjVe_5CGKITODRmhk8TJNdZ69RQBY
X-Proofpoint-GUID: mCdIIwhOqgeGroRnjJHtPmWMNgJ91wt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050095
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function "try_to_find_probe_trace_events" uses return
error code as ENOENT in two places. First place is after
"open_debuginfo" when opening debuginfo fails and secondly,
after when not finding the probe point. This function is
invoked during bpf load and there are other exit points in
this code path which returns ENOENT. This makes it difficult
to understand the exact reason for exit.

Patches changes the exit code from ENOENT to:
- ENODATA when it fails to find debuginfo
- ENODEV when it fails to find probe point

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/probe-event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index 0c24bc7afbca..881d94f65a6b 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -917,7 +917,7 @@ static int try_to_find_probe_trace_events(struct perf_probe_event *pev,
 	dinfo = open_debuginfo(pev->target, pev->nsi, !need_dwarf);
 	if (!dinfo) {
 		if (need_dwarf)
-			return -ENOENT;
+			return -ENODATA;
 		pr_debug("Could not open debuginfo. Try to use symbols.\n");
 		return 0;
 	}
@@ -956,7 +956,7 @@ static int try_to_find_probe_trace_events(struct perf_probe_event *pev,
 	if (ntevs == 0)	{	/* No error but failed to find probe point. */
 		pr_warning("Probe point '%s' not found.\n",
 			   synthesize_perf_probe_point(&pev->point));
-		return -ENOENT;
+		return -ENODEV;
 	} else if (ntevs < 0) {
 		/* Error path : ntevs < 0 */
 		pr_debug("An error occurred in debuginfo analysis (%d).\n", ntevs);
-- 
2.31.1

