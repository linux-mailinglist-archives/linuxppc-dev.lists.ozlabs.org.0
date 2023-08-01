Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6142676A638
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:22:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YZtw3KlA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHQn286gz3cP2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:22:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YZtw3KlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL421Y3z2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:19 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711C3ab014225
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lZtec7glKqwpb0Em7ZPL5pLT9BT0Msrll4JW6lmACFE=;
 b=YZtw3KlAFiK2S6vReDKHpeuFF14nNUgqyieH5yR5WSSh00htmVnAUu4pn7IZOuPU9zAp
 S124E0C3/c0fcOgqK5snULE8gtesN5MrK6yQfOsDZWT1l1K3Hmx2fRJEZLP+YgZX7AYf
 1TxuiCo44NZoBqKHp+If+WOTQtJhj2PUXHepri4NFoaCAWViejgZi8z6mBLaloOyKJWU
 sqYDWELEOt57xP650oaihQ3UfjmNXGJuaY21HX27le0li2BXl+Ogq2wODkKbcquMLydx
 UMByNxysUagPY51uLyx5Eze+MKyBJYT0OVd1V95wupJG1EWUfq4ipVahsEQcoSbXN4C/ ZA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6r6584jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:17 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37100LQt017116
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5fajfag9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IFE223265886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0933120049
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DBA22004B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:14 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A8A306063E;
	Tue,  1 Aug 2023 11:18:11 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/watchpoints: Simplify watchpoint reinsertion
Date: Tue,  1 Aug 2023 11:17:41 +1000
Message-ID: <20230801011744.153973-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NAalqrKPBeR7ZxjU_TR83NXNT0lnprSK
X-Proofpoint-ORIG-GUID: NAalqrKPBeR7ZxjU_TR83NXNT0lnprSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We only remove watchpoints when they have the perf_single_step flag set,
so we can reinsert them during the first iteration.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 624375c18882..bf8dda1a7e04 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -772,16 +772,6 @@ static int single_step_dabr_instruction(struct die_args *args)
 			perf_bp_event(bp, regs);
 
 		info->perf_single_step = false;
-	}
-
-	if (!found)
-		return NOTIFY_DONE;
-
-	for (int i = 0; i < nr_wp_slots(); i++) {
-		struct perf_event *bp = __this_cpu_read(bp_per_reg[i]);
-		if (!bp)
-			continue;
-
 		__set_breakpoint(i, counter_arch_bp(bp));
 	}
 
@@ -789,7 +779,7 @@ static int single_step_dabr_instruction(struct die_args *args)
 	 * If the process was being single-stepped by ptrace, let the
 	 * other single-step actions occur (e.g. generate SIGTRAP).
 	 */
-	if (test_thread_flag(TIF_SINGLESTEP))
+	if (!found || test_thread_flag(TIF_SINGLESTEP))
 		return NOTIFY_DONE;
 
 	return NOTIFY_STOP;
-- 
2.41.0

