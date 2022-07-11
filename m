Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C9570D78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhf1j1Twqz3f3k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:38:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FqeFKQ6Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FqeFKQ6Z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhdzc6fcYz2yMf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:37:00 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BMLKfs028276;
	Mon, 11 Jul 2022 22:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=83AsqHW/hz04+yVhSQAjYvfRnJUYzAK2Nps6/JJhHA0=;
 b=FqeFKQ6Z1eaRT0PxnS9GpjciGulgfhZGiCs9JYGaBq1KJI0KZ9tSjxTAtEhXDETGM/O6
 Z6wJ4KlBenTWh2srckpXBbDeDhPChK3/i2Uij4uJWcsw5hTcILwkROcZcWW7W7LCuJl8
 z3RU32KhnpiXIBBH2e/6AAGagAWNGNRdh/ww9bLQm2ZnbKUPLaRGSi5pbcSFc3Mc8XRj
 J4mlUX3JfDd4Y29iV2IgKgUiFQiLh49MTqCClTq8sOoSmMeYzbmPEXrK4bub/Mt1q3mC
 Z8iNHvMoarFsLL0kt3b6ixiU6kPAc52UyxJzsTixKgegqZ5SWo7/dW4kBpQAfedwDZs6 PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8vk787gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:41 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BMW7GS015351;
	Mon, 11 Jul 2022 22:36:41 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8vk787gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:41 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BMaWUn014312;
	Mon, 11 Jul 2022 22:36:40 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 3h71a9en7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26BMacVX10158804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 22:36:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5E95C606E;
	Mon, 11 Jul 2022 22:36:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F974C606C;
	Mon, 11 Jul 2022 22:36:38 +0000 (GMT)
Received: from localhost (unknown [9.163.4.84])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Jul 2022 22:36:38 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] KVM: PPC: Book3s HV: Remove unused function kvmppc_bad_interrupt
Date: Mon, 11 Jul 2022 19:36:17 -0300
Message-Id: <20220711223617.63625-3-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711223617.63625-1-muriloo@linux.ibm.com>
References: <20220711223617.63625-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1Uxz7iXWTUOaighp92SzCzsb-dk-1nZf
X-Proofpoint-GUID: V-2XOTwGw2xa7y-qT6mFnoXWeNKeaaul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_25,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 spamscore=0 mlxlogscore=757 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110091
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
Cc: Juergen Gross <jgross@suse.com>, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com, Paul Mackerras <paulus@samba.org>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1
support from P7/8 path") removed the last reference to the function.

Fixes: fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path")
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h |  1 -
 arch/powerpc/kvm/book3s_hv_builtin.c  | 18 ------------------
 2 files changed, 19 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index ff1336ab4c47..bbf5e2c5fe09 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -280,7 +280,6 @@ extern void kvmppc_copy_to_svcpu(struct kvm_vcpu *vcpu);
 extern void kvmppc_copy_from_svcpu(struct kvm_vcpu *vcpu);
 
 long kvmppc_read_intr(void);
-void kvmppc_bad_interrupt(struct pt_regs *regs);
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr);
 void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
 
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 88a8f6473c4e..c15c6faedce5 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -489,24 +489,6 @@ static long kvmppc_read_one_intr(bool *again)
 	return kvmppc_check_passthru(xisr, xirr, again);
 }
 
-void kvmppc_bad_interrupt(struct pt_regs *regs)
-{
-	/*
-	 * 100 could happen at any time, 200 can happen due to invalid real
-	 * address access for example (or any time due to a hardware problem).
-	 */
-	if (TRAP(regs) == 0x100) {
-		get_paca()->in_nmi++;
-		system_reset_exception(regs);
-		get_paca()->in_nmi--;
-	} else if (TRAP(regs) == 0x200) {
-		machine_check_exception(regs);
-	} else {
-		die("Bad interrupt in KVM entry/exit code", regs, SIGABRT);
-	}
-	panic("Bad KVM trap");
-}
-
 static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.ceded = 0;
-- 
2.36.1

