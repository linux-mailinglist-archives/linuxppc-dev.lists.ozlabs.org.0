Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEC800C49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:36:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=orgAuGSX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShYx13dXKz3vqP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 00:36:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=orgAuGSX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShYrG10Rfz3vfR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 00:31:57 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1DRSMW002351;
	Fri, 1 Dec 2023 13:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tPQP1B7Rs46uEMXocI245+eClgoW4erBlOchtLxnHns=;
 b=orgAuGSXMlmOQdukqiKOnlFKOxagIrqBW/sY3GA9Bpk+NZIR1icHNKtC/RtIGggmo701
 2mNavmepm1Ghm3h033WpFHNt2lV10cR8g6fnq1KS3aH6anxma7QLU04quXFEDf55/eFn
 lwYibgOERJfwBjcdRjXzZgQh0wVDSf/eFFYFGC462ekT2+Sheq+5Xe/tQMhesF6IFTRI
 bkr85OIGzAwlRxDuuthUT48WngSCChaOOYEXctTeK0GU9rYrrdrIPL3pbc07Fj3B/4gC
 w2+uClmY9ML1VOxahyIXeCLJ0lCkWK+sEAJgSzTHBwblGLaoauKHbTFwM/NxNk8198Ib Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqgcqr4tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:31:50 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B1DT0Oi008587;
	Fri, 1 Dec 2023 13:31:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqgcqr4sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:31:49 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1AY1fZ020448;
	Fri, 1 Dec 2023 13:27:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrm52yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:27:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B1DRQ8926149536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 13:27:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D51220040;
	Fri,  1 Dec 2023 13:27:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A24D20043;
	Fri,  1 Dec 2023 13:27:22 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.33.138])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  1 Dec 2023 13:27:22 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 01 Dec 2023 18:57:21 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH 12/12] KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception
Date: Fri,  1 Dec 2023 18:56:17 +0530
Message-ID: <20231201132618.555031-13-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201132618.555031-1-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WVajB8kqc2AABsFzp7QCx3rBoju0YPp5
X-Proofpoint-ORIG-GUID: 2dHyFuBFDcjndRv4bN73b6FdisHMmF_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=725
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010092
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

In the nestedv2 case, if there is a pending decrementer exception, the
L1 must get the L2's timebase from the L0 to see if the exception should
be cancelled. This adds the overhead of a H_GUEST_GET_STATE call to the
likely case in which the decrementer should not be cancelled.

Avoid this logic for the nestedv2 case.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2ee3f2478570..e48126a59ba7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4834,7 +4834,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * entering a nested guest in which case the decrementer is now owned
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
-	if (kvmppc_core_pending_dec(vcpu) &&
+	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
 			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
-- 
2.42.0

