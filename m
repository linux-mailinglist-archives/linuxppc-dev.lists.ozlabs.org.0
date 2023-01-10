Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1E66382F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 05:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrdBY06mtz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 15:29:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAf/dSvB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lAf/dSvB;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrd9Z57F4z3c8P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 15:28:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A2Tg4t007804
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RYY0ZbDEM4N7VNpAhXymuznJ6ckaY1vQ4razg4P3Tw4=;
 b=lAf/dSvBnbx931qxVPcw75TfrmssEGi5eeUIu2bNhzAjFA/QP9cxSUPnEXKJXeGNkl5Q
 nRKqnR3P4sNG+yVLIXwFoDwKGhikSzHWYFagVICkvLZ0a1FGt25aCZnimmE27/NwVv62
 Cm3uu3udd2tl7Mj/NwsJQbfofGjd9bIvrjEr6QmTsaGcFs7fMV+q1+oS2GFWwTtCGWnS
 GNbPN5oZogp7QwiNXsCYBBucxhTWOw760/ssqlRUTL+2pIjPjXjr0Mu0HGFd83mumjUL
 oNFRWhijHifDos75F00CxUCgmsNmigAL2n1UvxxvTeN/O9XDWuHWDj4Mg1KhY1Q6PdBn 3g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjw410yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:47 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30A3ei7s007709
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3my0c7kjjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:46 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30A4SjaV11141740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:45 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A0A858061
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35F7058060
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:45 +0000 (GMT)
Received: from localhost (unknown [9.163.4.210])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:28:45 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: drop RTAS-based timebase synchronization
Date: Mon,  9 Jan 2023 22:28:45 -0600
Message-Id: <20230110042845.121792-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qT26BJz2dpNMMzY_xgdk0hkeoBJK2hHd
X-Proofpoint-GUID: qT26BJz2dpNMMzY_xgdk0hkeoBJK2hHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=870 phishscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100024
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pseries platform has been LPAR-only for several generations, and
the PAPR spec:

* Guarantees that timebase synchronization is performed by
  the platform ("The timebase registers are synchronized by the
  platform before CPUs are given to the OS" - 7.3.8 SMP Support).

* Completely omits the RTAS freeze-time-base and thaw-time-base RTAS
  functions, which are CHRP artifacts.

This code is effectively unused on currently supported models, so drop
it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index fd2174edfa1d..2bcfee86ff87 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -278,11 +278,5 @@ void __init smp_init_pseries(void)
 		cpumask_clear_cpu(boot_cpuid, of_spin_mask);
 	}
 
-	/* Non-lpar has additional take/give timebase */
-	if (rtas_token("freeze-time-base") != RTAS_UNKNOWN_SERVICE) {
-		smp_ops->give_timebase = rtas_give_timebase;
-		smp_ops->take_timebase = rtas_take_timebase;
-	}
-
 	pr_debug(" <- smp_init_pSeries()\n");
 }
-- 
2.37.1

