Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887364AB0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWHGP0lY4z3bgK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JBEj399H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JBEj399H;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWHFN6Hknz300l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:02:00 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCMoB08022679
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=vM+I6OjeqoWtjSJDHQsFHMb66iJ/1wSriDm14TpEba4=;
 b=JBEj399H/lGK4mQQVegTwlUmi9jQ1hoQp3DOQbJrKZLPSVuWjv6YD/ZrJLxdh2RpCSgw
 dOcRiHyVlzkHNQxfN6x1eK+Nej7ltvX7MNCweotmjcYgjnCr4GoGCvdTE/U94JGstdOw
 rdLOT0qFWR1NHmcApfPcCadDb7wwS8RtkM7gb9mCzaYAcOovMCbEp0IO+S262rweNzxF
 t82lac/kkryNlMkYU12zttRwfQCGfZXmmVg5Dil8QCy6hSnW3v4OUMqPqPUKz2n1A+GV
 x4VLy2Q0EVI3GQpMkowsathNHkdRGRflfObV6RUYl00mpakv23NBKZLH9cui7DyTmL76 zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3meden86xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:56 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCMrjqs002013
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 23:01:56 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3meden86x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:56 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCKrhOM011429;
	Mon, 12 Dec 2022 23:01:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6fs14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Dec 2022 23:01:55 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BCN1sZE4195046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 23:01:54 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5939580B0;
	Mon, 12 Dec 2022 23:01:54 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B43458043;
	Mon, 12 Dec 2022 23:01:54 +0000 (GMT)
Received: from localhost (unknown [9.163.54.62])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Dec 2022 23:01:54 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] RTAS function table and tracepoints
Date: Mon, 12 Dec 2022 17:01:50 -0600
Message-Id: <20221212230154.851325-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GBbWAv3OnxVPK8raUEgLBy65GhWK4HDi
X-Proofpoint-GUID: r3Rxs65C7MtvCuoeqYmWiY3qg1kerOk_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120194
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Resubmiting with revisions the remainder from the earlier "RTAS
maintenance" series[1] for further comments.

Components:
* Improved function token lookups, including efficient "reverse"
  token-to-name mappings.
* Static tracepoints for RTAS entry and exit.

Changes:
* Rebase on current powerpc/next.
* Drop unnecessary cast for xa_load() key argument. (Nick Child)
* Document RTAS_FN_FLAG_BANNED_FOR_SYSCALL_ON_LE. (Andrew Donnellan)
* Skip tracepoints in unsafe contexts (real mode, CPU
  offline). (Nicholas Piggin)
* Convert RTAS tracepoint definitions to unconditional
  variants (TRACE_EVENT_CONDITION() -> TRACE_EVENT()), dropping a
  cpu_online() check that duplicates work already done at the call
  site.

[1] https://lore.kernel.org/linuxppc-dev/20221118150751.469393-1-nathanl@linux.ibm.com/

Nathan Lynch (4):
  powerpc/rtas: improve function information lookups
  powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
  powerpc/tracing: tracepoints for RTAS entry and exit
  powerpc/rtas: add tracepoints around RTAS entry

 arch/powerpc/include/asm/rtas.h  |  87 ++++
 arch/powerpc/include/asm/trace.h | 103 ++++
 arch/powerpc/kernel/rtas.c       | 806 ++++++++++++++++++++++++++-----
 3 files changed, 874 insertions(+), 122 deletions(-)

-- 
2.37.1

