Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BF6702C13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 13:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKdCx5vxfz3f7c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 21:57:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AXMAwOnf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AXMAwOnf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKcyj6Xh0z3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 21:46:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34FBbsdi020591;
	Mon, 15 May 2023 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tlHLvQfS2Lw4oH6NbLNsIrYdEwhzwAdihNFnGyiErJ8=;
 b=AXMAwOnfN+zQFkNi/DxJmPdiZfNknXmZmgqu07He/kJWsVkt0a+IiacCkya5zpYohpMA
 MlkEcwoMv2/s9PB1Qv3SryztzSA+S11YibyzEeKDj/IyO2ZBfQEn3NjQ2nsFn4H3AtAK
 3EVaKkwD7NyBbu8th6TQ7nJ0Viplws1uyaoOkrpjxKJtn4EnDOsIOVM5W96nHRPQfMLC
 RDeOSwxRADAGgsA7qYHIdyKjk2jN6BwKPkTYWqBpoJGRViXsvGbwGCvvKUoRYmhoKrGf
 789BTPcKX4Rr/TJO7HseLQO8dJNkthcHTh4rp8bP22ynOV2dUwd3XRhaqwANCauYXSje kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkk9r1tp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 11:46:09 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34FBbotv020160;
	Mon, 15 May 2023 11:46:09 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkk9r1tn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 11:46:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F9cB68011878;
	Mon, 15 May 2023 11:46:05 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3qj264rv97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 11:46:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34FBk33U21365154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 May 2023 11:46:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290212004B;
	Mon, 15 May 2023 11:46:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E29DC20040;
	Mon, 15 May 2023 11:46:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.138.156])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 May 2023 11:46:02 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 0/1] sched/fair: Consider asymmetric scheduler groups in load balancer
Date: Mon, 15 May 2023 13:46:00 +0200
Message-Id: <20230515114601.12737-1-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X6fKw2QlsyZYC5bDBABfUmopguXhi4Re
X-Proofpoint-ORIG-GUID: QNgqIe5mT4XFrn3-NtQl1SQQj8dDGLG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=736 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150100
X-Mailman-Approved-At: Mon, 15 May 2023 21:57:07 +1000
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current load balancer implementation implies that scheduler groups,
within the same scheduler domain, all host the same number of CPUs. 

This appears to be valid for non-s390 architectures. Nevertheless, s390
can actually have scheduler groups of unequal size.
The current scheduler behavior causes some s390 configs to use SMT
while some cores are still idle, leading to a performance degredation 
under certain levels of workload.

Please refer to the patch's commit message for more details and an
example. This patch is a proposal on how to integrate the size of
scheduler groups into the decision process.

This patch is the most basic approach to address this issue and does 
not claim to be perfect as-is.

Other ideas that also proved to address the problem but are more 
complex but also potentially more precise:
  1. On scheduler group building, count the number of CPUs within each 
     group that are first in their sibling mask. This represents the 
     number of CPUs that can be used before running into SMT. This 
     should be slightly more accurate than using the full group weight 
     if the number of available SMT threads per core varies.
  2. Introduce a new scheduler group classification (smt_busy) in
     between of fully_busy and has_spare. This classification would  
     indicate that a group still has spare capacity, but will run 
     into SMT when using that capacity. This would make the load 
     balancer prefer groups with fully idle CPUs over ones that are 
     about to run into SMT.

Feedback would be greatly appreciated.

Tobias Huschle (1):
  sched/fair: Consider asymmetric scheduler groups in load balancer

 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

