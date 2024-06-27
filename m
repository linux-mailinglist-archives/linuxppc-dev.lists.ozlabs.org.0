Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA191A80A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 15:38:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcOuoApZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W905q08VWz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 23:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcOuoApZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W90551bLtz3cSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 23:38:16 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RDQu3M028935;
	Thu, 27 Jun 2024 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=EexzgJBj+tt6+l2+7cxvFAJb/k
	4mJCbDy4YUYm3EaMQ=; b=gcOuoApZuwcjzFaPJjnKzH1qsGVTK+efOHkjlI3Lro
	AwWI4v/o9+J42IqllmJtZv4n+OWXxjdHgT0z8g3gSgC/jLuAF43FrdqkwGoVVZ3v
	yEFSh6WDBKBQtBfPaEgcDDPI7NMMcdZNB/Ka//AOsBMaGoLJOufEABKni4yVI24S
	fKruT1SWXX1YF6o5o8lF4xSl0BxnESsl2hyRId1bnBriR7a1qrt4qqYTmtsvmqux
	Ce7+nV7hVqsqenWSuku1xs9l5udXyl8tzZoxDOpaRwfpRyrZAwsDZ3I1q/Xqxnmy
	fSGo6i+jSYYQqmt67OzFWPARub6orJVWOuc1CyyBingQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4018jhr2vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:37:54 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45RDUG8N003475;
	Thu, 27 Jun 2024 13:37:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4018jhr2vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:37:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45RBJQn3000564;
	Thu, 27 Jun 2024 13:37:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yxaenaue2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:37:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45RDbmjT55116164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 13:37:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A4D20043;
	Thu, 27 Jun 2024 13:37:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19E8320040;
	Thu, 27 Jun 2024 13:37:46 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jun 2024 13:37:45 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Perf: Calling available function for stats printing
Date: Thu, 27 Jun 2024 09:37:43 -0400
Message-ID: <20240627133743.407048-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T10gs8bLWGzO1eEpJxWH5rJm_0T4n-kz
X-Proofpoint-ORIG-GUID: UiLTGOdyY01ZP8Y-FWMaq8WXAY4Bg9cg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_08,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270101
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
Cc: mark.rutland@arm.com, irogers@google.com, peterz@infradead.org, adrian.hunter@intel.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, alexander.shishkin@linux.intel.com, mingo@redhat.com, jolsa@kernel.org, namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com, Abhishek Dubey <adubey@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For printing dump_trace, just use existing stats_print()
function.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 tools/perf/builtin-report.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 69618fb0110b..8678eebc49e6 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1089,10 +1089,7 @@ static int __cmd_report(struct report *rep)
 			perf_session__fprintf_dsos(session, stdout);
 
 		if (dump_trace) {
-			perf_session__fprintf_nr_events(session, stdout,
-							rep->skip_empty);
-			evlist__fprintf_nr_events(session->evlist, stdout,
-						  rep->skip_empty);
+			stats_print(rep);
 			return 0;
 		}
 	}
-- 
2.44.0

