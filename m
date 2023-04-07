Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A629E6DAAE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 11:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtCpK1djMz3fXK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 19:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HE8uj2pF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HE8uj2pF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtCnP0W63z3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 19:32:08 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379FR8I003538;
	Fri, 7 Apr 2023 09:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=q6v290gwEr1Tf/U83pfpXlcYWWoo5GrnSG72w+O/ClU=;
 b=HE8uj2pFe4nosWM5Ag8W78KIN6mes0oW6vmubneucgOyO//KwjO/ZzzxafHSYmK6cafI
 6hxA0cczewpdpgqKLyDSs6Oz/QsJYAzVDJEYOZVf2vXrdNXEqN4AnOYpjDMsAQyH9YDu
 HvPmP03m1jClid9yeRzRiuTdr7/ilwKdfRfxbfeE3rkMtui2em7tWBXRqdLuJsi4J57i
 Ix6Ze67zvmzqvNs6hx+v9GoWccMznN3HJUCSK0cIpUDHaZkcAzsx9IGako/PW0a20sLy
 vl1+tXdSvxQ2rVOOuYG9/OAWebhpM84wywwy11PCjI1lCyxmMXQZjjqeGW0F27qeGVxa Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pta9wyfgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Apr 2023 09:31:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3379MJGN025481;
	Fri, 7 Apr 2023 09:31:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pta9wyfg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Apr 2023 09:31:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336MqZPF009513;
	Fri, 7 Apr 2023 09:31:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc874vjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Apr 2023 09:31:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3379Vq6s14680578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Apr 2023 09:31:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C3920043;
	Fri,  7 Apr 2023 09:31:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 429FF20040;
	Fri,  7 Apr 2023 09:31:50 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Apr 2023 09:31:50 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>
Subject: [PATCH] KVM: PPC: BOOK3S: book3s_hv_nested.c: improve branch prediction for k.alloc
Date: Fri,  7 Apr 2023 05:31:47 -0400
Message-Id: <20230407093147.3646597-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4ZX3ELC14ZsoMEP1vDLm98ZtYz6ZrGba
X-Proofpoint-ORIG-GUID: Fa8FAEec0Xy9rlrTrcIHqtEQ19diXjYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070084
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

I used the unlikely() macro on the return values of the k.alloc
calls and found that it changes the code generation a bit.
Optimize all return paths of k.alloc calls by improving
branch prediction on return value of k.alloc.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 5a64a1341e6f..dbf2dd073e1f 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -446,7 +446,7 @@ long kvmhv_nested_init(void)
 		ptb_order = 12;
 	pseries_partition_tb = kmalloc(sizeof(struct patb_entry) << ptb_order,
 				       GFP_KERNEL);
-	if (!pseries_partition_tb) {
+	if (unlikely(!pseries_partition_tb)) {
 		pr_err("kvm-hv: failed to allocated nested partition table\n");
 		return -ENOMEM;
 	}
@@ -575,7 +575,7 @@ long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu)
 		return H_PARAMETER;
 
 	buf = kzalloc(n, GFP_KERNEL | __GFP_NOWARN);
-	if (!buf)
+	if (unlikely(!buf))
 		return H_NO_MEM;
 
 	gp = kvmhv_get_nested(vcpu->kvm, l1_lpid, false);
@@ -689,7 +689,7 @@ static struct kvm_nested_guest *kvmhv_alloc_nested(struct kvm *kvm, unsigned int
 	long shadow_lpid;
 
 	gp = kzalloc(sizeof(*gp), GFP_KERNEL);
-	if (!gp)
+	if (unlikely(!gp))
 		return NULL;
 	gp->l1_host = kvm;
 	gp->l1_lpid = lpid;
@@ -1633,7 +1633,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	/* 4. Insert the pte into our shadow_pgtable */
 
 	n_rmap = kzalloc(sizeof(*n_rmap), GFP_KERNEL);
-	if (!n_rmap)
+	if (unlikely(!n_rmap))
 		return RESUME_GUEST; /* Let the guest try again */
 	n_rmap->rmap = (n_gpa & RMAP_NESTED_GPA_MASK) |
 		(((unsigned long) gp->l1_lpid) << RMAP_NESTED_LPID_SHIFT);
-- 
2.39.2

