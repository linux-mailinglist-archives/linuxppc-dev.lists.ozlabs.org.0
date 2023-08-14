Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76277B79A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:31:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1mRRKzZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPXK21MxZz3cSR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 21:31:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V1mRRKzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPXGK3JCvz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 21:28:41 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EB3uvZ013795;
	Mon, 14 Aug 2023 11:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=92bQKMir7WcZSqbNFFhWsegj1x2sSvTyhOlRCcvKzMY=;
 b=V1mRRKzZ6r6nV/9enUXkMiZ0wSnMjOm80fBMU4Q2LLjOCnyk+qZkTK93LkBh4ALkV/Qv
 GEtkq1nSh9dbxtdVjMpez2ao8RKOkZhUZrWq88l8coVz+5LJem4nsJEUIQcDWv+xLYwQ
 ODtu7xTKM+vrAEWq8CM5FMGF3YjZjpDAByOUmghhK6tYL+zOYDzQqgXsufiTcCHaJIH1
 zCvn7lgym/kGZvVRECxRXT/1bz33eJdBlCwB2BD2s4mRRKOQbfIkT3F7O4WyYclPOOK8
 KGP23O9ACP7+oeDJWcLzmYffbM8zl+MyUjbQHGo5x7hnf6iu4+kjUbV68pjUqOKbCgvb rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfk2dgk03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:35 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37EBMm5A023628;
	Mon, 14 Aug 2023 11:28:35 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sfk2dgjyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:35 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37EBDNh0007832;
	Mon, 14 Aug 2023 11:28:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwjukdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 11:28:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37EBSUUa23921330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Aug 2023 11:28:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8B3420043;
	Mon, 14 Aug 2023 11:28:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AA0520040;
	Mon, 14 Aug 2023 11:28:28 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.123.95])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Aug 2023 11:28:27 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH 3/7] perf vendor events: Drop STORES_PER_INST metric event for power10 platform
Date: Mon, 14 Aug 2023 16:57:59 +0530
Message-Id: <20230814112803.1508296-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814112803.1508296-1-kjain@linux.ibm.com>
References: <20230814112803.1508296-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NFULP0xIeTt6jCPN9EtZj1bWFEekJndg
X-Proofpoint-ORIG-GUID: IsjuRQ6sFa-qvoA0mcC8iRR-64nVFYVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_06,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140102
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
Cc: irogers@google.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop STORES_PER_INST metric event for the power10 platform, as the
metric expression of STORES_PER_INST metric event using dropped event
PM_ST_FIN.

Fixes: 3ca3af7d1f23 ("perf vendor events power10: Add metric events JSON file for power10 platform")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/pmu-events/arch/powerpc/power10/metrics.json | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
index 6f53583a0c62..e3087eb1ccff 100644
--- a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
+++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
@@ -453,12 +453,6 @@
         "MetricGroup": "General",
         "MetricName": "LOADS_PER_INST"
     },
-    {
-        "BriefDescription": "Average number of finished stores per completed instruction",
-        "MetricExpr": "PM_ST_FIN / PM_RUN_INST_CMPL",
-        "MetricGroup": "General",
-        "MetricName": "STORES_PER_INST"
-    },
     {
         "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed instruction",
         "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
-- 
2.39.3

