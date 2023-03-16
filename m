Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB56BC582
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 06:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pcb4155Vhz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 16:12:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aSKZTeFz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aSKZTeFz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pcb230v0Jz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 16:10:50 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G20879023441;
	Thu, 16 Mar 2023 05:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w7kzrilWFP4sDM2Srq08g9Zen19nGkiKEcTeLhcUtpw=;
 b=aSKZTeFznFK5aV5q5XJlGkD+O9RU0Ij8HE1xG7FjIaPSrGdIMULPMysCfFDP1YvetjPM
 DP0g5f3rAXe9lUwscrPyR7K+kfXTQUIKGkWwLGU6E3d6SEEDvAPnI+HNHe1Y9sLk+MJU
 2RrVhnWGjc+NjaX1B8g67lk/mv8F5bEVuxqwyUPAuMROjz/4wAJE2aB9YOfSVpTcFFx/
 kh1UpfnFw+VJ3mtrUG3LDvURa8Hd3Xbk0KEfWgn9VUa54TOnOaC7tr6nW21zTfSnG4Yf
 Y2a5ot4Hc6pRbwENvIuxyc+vTgIpvj/u9cTFpUuWh7sDENJuyucZLl4SvYQuBQ5T2ORI gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbyg8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32G4aep3005976;
	Thu, 16 Mar 2023 05:10:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbpwbyg7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1b6Ir029164;
	Thu, 16 Mar 2023 05:10:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pbskt05y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 05:10:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32G5AaLh48890288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 05:10:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FB2520040;
	Thu, 16 Mar 2023 05:10:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9FDE20043;
	Thu, 16 Mar 2023 05:10:34 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Mar 2023 05:10:34 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH v3 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4 argument
Date: Thu, 16 Mar 2023 01:10:25 -0400
Message-Id: <20230316051025.1424093-3-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 53gzW6OOhnW_zYXgAFjSmH6PYTEaNrFq
X-Proofpoint-GUID: HAMAzp7pLRo1YJEbmft9gnVXrUuo5aHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160042
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
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index b81ba4ee0521..b61f0b2c677b 100644
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
@@ -524,6 +521,10 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
 	li	r6, KVM_GUEST_MODE_HOST_HV
 	stb	r6, HSTATE_IN_GUEST(r13)
 
+	/* Order load of vcpu after load of vcore */
+	lwsync
+	ld	r4, HSTATE_KVM_VCPU(r13)
+
 #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Store initial timestamp */
 	cmpdi	r4, 0
-- 
2.39.2

