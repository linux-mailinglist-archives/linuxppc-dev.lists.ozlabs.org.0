Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F97570D77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:38:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhf0y2jRlz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 08:38:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d4WkUxPp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d4WkUxPp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhdzb4mTDz2yMf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 08:36:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BLnqkb003180;
	Mon, 11 Jul 2022 22:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=S77giycYHiAK0rW6G4dbdV9pyTKH+T/m3K7mJjGBARw=;
 b=d4WkUxPprGslzmOiL/QNnwH8SimHAXUoKqwC+Qi7nfuGDiccCT3SJtptDSbGlGIZnXtq
 a+a1Z4pqu12ercWUJmmdh9nTWQwCB9b5/uEKXcoyn/HOdsPneWD3vYK+4xOoyZqhImJ0
 BqfbpbRnsm9piN/+e/eaT/SOTJ74okFxDcYtyTA8IBsuTGbUTpP0oen7fbT5paGo4ZiM
 SdQ4OTa4ZzO41vKG3pCYmT+1sp4yruYUXtapVNIk2cZ39iDi9/U6BzOXPU0ZnQcfeSqf
 EqP7nl3MuxFyKuWMaeUeYT6aswqKOJY/apTp91CNVjUr5jVRNkLoRPME3Jm/6GGhQxL6 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8v4e8uy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:38 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BMZT7g035555;
	Mon, 11 Jul 2022 22:36:37 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8v4e8uxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BMKonA021115;
	Mon, 11 Jul 2022 22:36:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma04dal.us.ibm.com with ESMTP id 3h71a9pkrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 22:36:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26BMaZDb33948106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 22:36:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107A8C606C;
	Mon, 11 Jul 2022 22:36:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E9F6C606D;
	Mon, 11 Jul 2022 22:36:34 +0000 (GMT)
Received: from localhost (unknown [9.163.4.84])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Mon, 11 Jul 2022 22:36:34 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] KVM: PPC: Book3S HV: Remove kvmhv_p9_[set,restore]_lpcr declarations
Date: Mon, 11 Jul 2022 19:36:16 -0300
Message-Id: <20220711223617.63625-2-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711223617.63625-1-muriloo@linux.ibm.com>
References: <20220711223617.63625-1-muriloo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QISkGP2H8xZ8DmEGi7np9CNYOs1G_X6h
X-Proofpoint-ORIG-GUID: eCOQx-TFV3ZjevCrEQinXu0E-bDoM1Dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_25,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxlogscore=852 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110091
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

The commit b1b1697ae0cc ("KVM: PPC: Book3S HV: Remove support for
running HPT guest on RPT host without mixed mode support") removed the
last references to these functions.

Fixes: b1b1697ae0cc ("KVM: PPC: Book3S HV: Remove support for running HPT guest on RPT host without mixed mode support")
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 91c9f937edcd..ff1336ab4c47 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -281,8 +281,6 @@ extern void kvmppc_copy_from_svcpu(struct kvm_vcpu *vcpu);
 
 long kvmppc_read_intr(void);
 void kvmppc_bad_interrupt(struct pt_regs *regs);
-void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip);
-void kvmhv_p9_restore_lpcr(struct kvm_split_mode *sip);
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr);
 void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u64 srr1_flags);
 
-- 
2.36.1

