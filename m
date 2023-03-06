Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1A6ABFBD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 13:40:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVdTc3HWjz3cj2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:40:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BAujClC7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BAujClC7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVdQg0B3Nz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 23:38:02 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326BhE6Z006039;
	Mon, 6 Mar 2023 12:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R1U7SyqWhhzQ7EUd4N4lJYeJovzYyLC22E78S79AsGc=;
 b=BAujClC7y+Jps97mSSICQgdk6+BLK4VPCAmyRyG95janVDT+C1fCCjUB/kUfeEbIsSXu
 hS3jqnGPTRDnbObKt/JPaJF97x1opSAzUqRBh9zN1snJ140dhvz6VTkvdYh4BbAtY5M2
 sT9vyDpXD7Tqzf9Ej8BI5twJ5lCAJ33epJO7+LGAyi8wqcJRJd/d5jG+2kBG5whixj1F
 3qMVoGnfjtx+cro/7vEKTNYwTrGHy3FWxGdIh38b4SPKdP1T1+p1S1C+QAij/iOjmVRD
 Ly/ffmSakLr4+jEDPO5zBOg34p378Fad+PnOvsjs6JDTFmR5QL2DYEcKP4UF+9/5EzLO uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50n42psa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:37:55 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326CbtBo007101;
	Mon, 6 Mar 2023 12:37:55 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50n42prr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:37:55 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 325HrOxT002413;
	Mon, 6 Mar 2023 12:37:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3p41b0t5b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:37:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326CbnmO56885638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 12:37:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87DFE20043;
	Mon,  6 Mar 2023 12:37:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D62AC20040;
	Mon,  6 Mar 2023 12:37:47 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 12:37:47 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH v2 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4 argument
Date: Mon,  6 Mar 2023 07:37:40 -0500
Message-Id: <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WVkXl4b2cNRf5OetEr6ms_gU1R04UvYs
X-Proofpoint-GUID: pSNHkpJoCVKfMobnxgC1s0l6eqXUDyaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060110
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmppc_hv_entry is called from only 2 locations within
book3s_hv_rmhandlers.S. Both of those locations set r4
as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
So, shift the r4 load instruction to kvmppc_hv_entry and
thus modify the calling convention of this function.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index b81ba4ee0521..da9a15db12fe 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
 	RFI_TO_KERNEL
 
 kvmppc_call_hv_entry:
-	ld	r4, HSTATE_KVM_VCPU(r13)
+	/* Enter guest. */
 	bl	kvmppc_hv_entry
 
 	/* Back from guest - restore host state and return to caller */
@@ -352,9 +352,7 @@ kvm_secondary_got_guest:
 	mtspr	SPRN_LDBAR, r0
 	isync
 63:
-	/* Order load of vcpu after load of vcore */
-	lwsync
-	ld	r4, HSTATE_KVM_VCPU(r13)
+	/* Enter guest. */
 	bl	kvmppc_hv_entry
 
 	/* Back from the guest, go back to nap */
@@ -506,7 +504,6 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
 
 	/* Required state:
 	 *
-	 * R4 = vcpu pointer (or NULL)
 	 * MSR = ~IR|DR
 	 * R13 = PACA
 	 * R1 = host R1
@@ -524,6 +521,8 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
 	li	r6, KVM_GUEST_MODE_HOST_HV
 	stb	r6, HSTATE_IN_GUEST(r13)
 
+	ld	r4, HSTATE_KVM_VCPU(r13)
+
 #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Store initial timestamp */
 	cmpdi	r4, 0
-- 
2.36.1

