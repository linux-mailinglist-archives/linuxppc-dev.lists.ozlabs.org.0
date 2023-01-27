Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF9567E66E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 14:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3J7s5XJgz3fGD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 00:19:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pV6P8kv/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pV6P8kv/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3J6y3dZ4z3fDf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 00:18:34 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30RBflMW013141;
	Fri, 27 Jan 2023 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+0HMn9DZCfIPIozryBXImbkm31WHZVWpuCGOE2wMgik=;
 b=pV6P8kv/fYvSbOK+J5BikJZ5K6+kK9MOo5r/EfgXsBxV1QQ0UyAG+pUkEKCNbPGaVodc
 l//2tzNndSXBqJPnaMGgSq31Lhd0p09UBuxHPF7Irk+gEQGDZQ2xkGOfbxfRW2JGOjs/
 FP7i6ncfGuC0z2mS/0gjU9IwvmzjgvvvXl5XS1WX534bGw73VQRUQ/aFJCjXFgh71xPk
 ba05Gpj3KsDpm4eWtVHNINsTm3STSYNcatg7Px7oeayZMPqARFOWj5pUoX+rTDBbixqE
 k/dxaDUeZodiHgi1MBKKCCzp9EfJm64Mi2G1Zzj+7Rz75Ko+tHVVoUE3awZOwB6J2Nbe XQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncdy8jd2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 13:18:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30R4ux6G026714;
	Fri, 27 Jan 2023 13:18:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n87p6fk1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 13:18:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30RDIM4730015854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 13:18:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89C8C20040;
	Fri, 27 Jan 2023 13:18:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3CA3F20043;
	Fri, 27 Jan 2023 13:18:21 +0000 (GMT)
Received: from li-79f82dcc-27d1-11b2-a85c-9579c2333295.ibm.com.com (unknown [9.43.36.71])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jan 2023 13:18:20 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mce: log the error for all unrecoverable errors
Date: Fri, 27 Jan 2023 23:59:43 +0530
Message-Id: <20230127182943.73073-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T-npWwv46TMfawieuv1dvw8DkjZFXCr_
X-Proofpoint-ORIG-GUID: T-npWwv46TMfawieuv1dvw8DkjZFXCr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=828 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270123
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For all unrecoverable errors we are missing to log the
error, Since machine_check_log_err() is not getting called
for unrecoverable errors.

Raise irq work in save_mce_event() for unrecoverable errors,
So that we log the error from MCE event handling block in
timer handler.

Log without this change

 MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
 MCE: CPU27: Initiator CPU
 MCE: CPU27: Unknown

Log with this change

 MCE: CPU24: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
 MCE: CPU24: PID: 1589811 Comm: inject-ra-err NIP: [0000000010000e48]
 MCE: CPU24: Initiator CPU
 MCE: CPU24: Unknown
 RTAS: event: 5, Type: Platform Error (224), Severity: 3

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
V2: Rephrasing the commit message.
---
 arch/powerpc/kernel/mce.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 6c5d30fba766..a1cb2172eb7b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce->error_type == MCE_ERROR_TYPE_UE)
 		mce->u.ue_error.ignore_event = mce_err->ignore_event;
 
+	/*
+	 * Raise irq work, So that we don't miss to log the error for
+	 * unrecoverable errors.
+	 */
+	if (mce->disposition == MCE_DISPOSITION_NOT_RECOVERED)
+		mce_irq_work_queue();
+
 	if (!addr)
 		return;
 
@@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	mce_irq_work_queue();
 }
 
 /*
-- 
2.38.1

