Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF248C4EBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 12:12:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A7lfD8OZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdscD0LSmz3cTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 20:12:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A7lfD8OZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdsbR0cbfz2yvh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 20:12:02 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EA2vr8006787;
	Tue, 14 May 2024 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gGxQ91Axlxx23byS5Dc2PLh8wMyfpqwYAXQ6C5lw/9c=;
 b=A7lfD8OZI1loLA1j5kjbhnF7QF4MUkISm+EOPVZLjpDKUz0eUHYKOGPP9EgGoZMfhZGG
 CUGYzcrQ6lLVs3a4o25lRLN5rxPQ7uYsDPa89kU+04nfA4Q5+HhLsDvdFH/HzKEBV7ex
 hs/ZSX4FQxA3ACcbOSYtyfUiBwLj3ny3F9WyPEHTy4iE1vaUj2uDDBBoN418lsnWR8wC
 5bALS6LOHDaYxEncioJ11oWU20f0bsRhcxDfYOooO7ROFQn5zihrRqlgnkUllFQO0Y4J
 kUaTV5MyTYqqn1/td01Jr7gmOQetFmKR11SQYZdO6NDg8kwnJtmHmo8zDCpsY4OgfL+y Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y45urr09n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 10:05:19 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EA5JHk010137;
	Tue, 14 May 2024 10:05:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y45urr09j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 10:05:19 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44E9TM7Q029603;
	Tue, 14 May 2024 10:05:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7kmeft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 10:05:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EA5CQK45547884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 10:05:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6B1A20075;
	Tue, 14 May 2024 10:05:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57C1F20071;
	Tue, 14 May 2024 10:05:11 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 10:05:11 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH] arch/powerpc: Remove the definition of unused cede function
Date: Tue, 14 May 2024 15:35:03 +0530
Message-ID: <20240514100507.271681-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mbN2y1aKuSdvXTmoMoRmioguwuAxtATH
X-Proofpoint-GUID: RKI_YwUqWiqI5eskDM1V7UKXBGt5gC5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_04,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=598 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140071
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove extended_cede_processor() definition as it has no callers since
commit 48f6e7f6d948("powerpc/pseries: remove cede offline state for CPUs")

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index b3ee44a40c2f..6431fa1e1cb1 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -37,24 +37,6 @@ static inline long cede_processor(void)
 	return plpar_hcall_norets_notrace(H_CEDE);
 }
 
-static inline long extended_cede_processor(unsigned long latency_hint)
-{
-	long rc;
-	u8 old_latency_hint = get_cede_latency_hint();
-
-	set_cede_latency_hint(latency_hint);
-
-	rc = cede_processor();
-
-	/* Ensure that H_CEDE returns with IRQs on */
-	if (WARN_ON(IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && !(mfmsr() & MSR_EE)))
-		__hard_irq_enable();
-
-	set_cede_latency_hint(old_latency_hint);
-
-	return rc;
-}
-
 static inline long vpa_call(unsigned long flags, unsigned long cpu,
 		unsigned long vpa)
 {
-- 
2.45.0

