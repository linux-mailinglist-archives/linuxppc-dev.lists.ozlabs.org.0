Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A587A390
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 08:27:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBUhrqtc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvhtP35jyz3vYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 18:27:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EBUhrqtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvhsh1T6dz3dXD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 18:27:03 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D7257n005155;
	Wed, 13 Mar 2024 07:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=rOor7RYeGfCOqux28AEV5i5j/WIDmKriNbgjbkQ8YKQ=;
 b=EBUhrqtc3UDjCknmr7gvBw4Y6++4O/Du8j0GvqBpIL8W+yvZ9MCgtDRn8V9LgfIMVkLT
 lDCzpcfNkPAysAIbDscs7bhnhDFiZ0GMXcJTkBJF+ajeW1rjTTXQI76XRVCTasgnRrK8
 v2MiVDykNyAyttbfVccST9/vao6SAI94kOVeH4DvyRCy6v/Z4e5NRu8iSBeiFPHwHa4o
 +DOc8jDTu+ZFqOxEScPBz176+SHuh0xlRLJaOsYWVIT27UK1/I0tHmQR2f/g+n20QVw+
 6/hVNwPO3SHS4P00avNURtBtdgbyzK5rQyBqNLrMS6B9UieNJP3kwI1aPq5GQRH6We5k AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu7d58ac3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 07:26:52 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42D783ob018909;
	Wed, 13 Mar 2024 07:26:51 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu7d58ab5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 07:26:51 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D5VakQ018621;
	Wed, 13 Mar 2024 07:26:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t23tr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 07:26:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D7QjJB29753626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Mar 2024 07:26:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E87A920040;
	Wed, 13 Mar 2024 07:26:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DDA520043;
	Wed, 13 Mar 2024 07:26:37 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.89.57])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 13 Mar 2024 07:26:36 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 13 Mar 2024 12:56:29 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC exception
Date: Wed, 13 Mar 2024 12:56:23 +0530
Message-ID: <20240313072625.76804-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7-uVPKZHgdkelGTF0ILsAB7_BnaOOr58
X-Proofpoint-ORIG-GUID: wBtPzTAxrU-_ZDuPAwchNsQUVA7Ghuey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804 phishscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1011 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403130054
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

This reverts commit 180c6b072bf360b686e53d893d8dcf7dbbaec6bb ("KVM: PPC:
Book3S HV nestedv2: Do not cancel pending decrementer exception") which
prevented cancelling a pending HDEC exception for nestedv2 KVM guests. It
was done to avoid overhead of a H_GUEST_GET_STATE hcall to read the 'HDEC
expiry TB' register which was higher compared to handling extra decrementer
exceptions.

This overhead of reading 'HDEC expiry TB' register has been mitigated
recently by the L0 hypervisor(PowerVM) by putting the value of this
register in L2 guest-state output buffer on trap to L1. From there the
value of this register is cached, made available in kvmhv_run_single_vcpu()
to compare it against host(L1) timebase and cancel the pending hypervisor
decrementer exception if needed.

Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0b921704da45..e47b954ce266 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4856,7 +4856,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	 * entering a nested guest in which case the decrementer is now owned
 	 * by L2 and the L1 decrementer is provided in hdec_expires
 	 */
-	if (!kvmhv_is_nestedv2() && kvmppc_core_pending_dec(vcpu) &&
+	if (kvmppc_core_pending_dec(vcpu) &&
 			((tb < kvmppc_dec_expires_host_tb(vcpu)) ||
 			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
-- 
2.44.0

