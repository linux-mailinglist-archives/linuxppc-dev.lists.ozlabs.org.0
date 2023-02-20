Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE569C574
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 07:52:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKtPq5yYtz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 17:51:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L6DVQ46s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L6DVQ46s;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKrSs1l91z3bjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 16:24:29 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K48tp6008440;
	Mon, 20 Feb 2023 05:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cxpRmD1r/l0y73gtwE8LvDnfk8MOnVYk4pVujUt8NHQ=;
 b=L6DVQ46soHmA439J2M+X0/WfMDk6gWB5PpPzSJ5Fn+1TDcB9GPRyZH10i3g6KyqcQYPb
 bMtwBkHQ53D+IAC5yKKalDEJctjO5A9uE/L6vRCvwkPtjs/3YrG3VBDOyI4OVJaH+iJY
 gIKZXCuVU+nYyL2a+c3uydfTyrhsoDXgG4Px9PvVV6Pyy3aQBCEjMZ5j4bqmznJdnn3Z
 l3/8uPzebu5R9D1UA7fvr2yWo8DJ321KHPxzLn94SyfR4lIHEyi14eeuEY9VLcSVU8s0
 t+xvvFPl/d0hoZxK19otrhWy+tJs62CiHOOILY9BKA3VOesfGumAUEoPNU0nDUvfCAj2 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nuyk6bdj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 05:24:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31K5ArOG020121;
	Mon, 20 Feb 2023 05:24:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nuyk6bdhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 05:24:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31JKUJWc025548;
	Mon, 20 Feb 2023 05:24:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ntnxf267u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 05:24:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K5OCcE25493812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 05:24:12 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95F852004B;
	Mon, 20 Feb 2023 05:24:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5714A20043;
	Mon, 20 Feb 2023 05:24:10 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.in.ibm.com (unknown [9.109.216.99])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Feb 2023 05:24:10 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [PATCH 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4 argument
Date: Mon, 20 Feb 2023 10:53:55 +0530
Message-Id: <20230220052355.109033-3-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hK3-2RJh0dfC1BT7p9uajZkZllkHjEPK
X-Proofpoint-ORIG-GUID: uZ8vqrY6yx2aef1nlp0aTGthPC-QsrHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_02,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200046
X-Mailman-Approved-At: Mon, 20 Feb 2023 17:49:25 +1100
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
index 7e063fde7adc..922667b09168 100644
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
@@ -506,7 +504,6 @@ kvmppc_hv_entry:
 
 	/* Required state:
 	 *
-	 * R4 = vcpu pointer (or NULL)
 	 * MSR = ~IR|DR
 	 * R13 = PACA
 	 * R1 = host R1
@@ -524,6 +521,8 @@ kvmppc_hv_entry:
 	li	r6, KVM_GUEST_MODE_HOST_HV
 	stb	r6, HSTATE_IN_GUEST(r13)
 
+	ld	r4, HSTATE_KVM_VCPU(r13)
+
 #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
 	/* Store initial timestamp */
 	cmpdi	r4, 0
-- 
2.31.1

