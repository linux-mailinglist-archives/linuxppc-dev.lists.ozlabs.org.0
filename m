Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C306991AEC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 20:06:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G8sQakLF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W962P1wb7z3cbN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 04:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G8sQakLF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W95zp2gMwz3cYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 04:04:06 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RGSejR013309;
	Thu, 27 Jun 2024 18:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=HNHlnif/jrbsv
	f6Wbg+hxJ4VwzQZ27plZqQtYFJoUVs=; b=G8sQakLFWEmTJSBvyEhBNCh74TgGw
	4FD9Xhxq6n6jFUhenUl+j4s2rNEjsZ9PyjG60KyMmpUX5bcReJJHk6xrq1isRIbW
	fo2KkRnQr/rrLdi3uGWiLw6TaDHaPAULN9VXMfYbCZVhlO9ZDZf7Ws6sCCUbR6K6
	tC6LoRzF9uzIPqThK/GvOpggNLbrnbVpHHFq0tJa4nanxEFp2jj7bai0CS3elfaB
	2t5kZFGHDaWAyun+qz+mBQGu6o7s3xnxICn23W9e5etByM4XIVdz6dzOjjBVexkO
	eW9U1qHDnCBx0le4NbMQFK1382S89r6XOE4Yw9qTz1vS6/iz7dL9Er4iQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 401bmng7yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 18:03:59 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45RHxjQw020462;
	Thu, 27 Jun 2024 18:03:59 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 401bmng7yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 18:03:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45RH1Ht6000388;
	Thu, 27 Jun 2024 18:03:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn3kpd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 18:03:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45RI3rOl39780820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 18:03:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E91BB20040;
	Thu, 27 Jun 2024 18:03:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1124220043;
	Thu, 27 Jun 2024 18:03:51 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.43.107.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jun 2024 18:03:50 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [RFC PATCH 1/2] Revert "KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1"
Date: Thu, 27 Jun 2024 23:33:35 +0530
Message-ID: <20240627180342.110238-2-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627180342.110238-1-gautam@linux.ibm.com>
References: <20240627180342.110238-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: itJqNvGUj0aejhYpca5DTjtWn8moGkaf
X-Proofpoint-ORIG-GUID: ReuSF8Zpt_luHAx5WfL7f4EjKRbKkOln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_14,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=654 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406270134
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 7c3ded5735141ff4d049747c9f76672a8b737c49.

On PowerNV, when a nested guest tries to use a feature prohibited by
HFSCR, the nested hypervisor (L1) should get a H_FAC_UNAVAILABLE trap
and then L1 can emulate the feature. But with the change introduced by
commit 7c3ded573514 ("KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1")
the L1 ends up getting a H_EMUL_ASSIST because of which, the L1 ends up
injecting a SIGILL when L2 (nested guest) tries to use doorbells.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index daaf7faf21a5..cea28ac05923 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2052,36 +2052,9 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		fallthrough; /* go to facility unavailable handler */
 #endif
 
-	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
-		u64 cause = vcpu->arch.hfscr >> 56;
-
-		/*
-		 * Only pass HFU interrupts to the L1 if the facility is
-		 * permitted but disabled by the L1's HFSCR, otherwise
-		 * the interrupt does not make sense to the L1 so turn
-		 * it into a HEAI.
-		 */
-		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
-				(vcpu->arch.nested_hfscr & (1UL << cause))) {
-			ppc_inst_t pinst;
-			vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
-
-			/*
-			 * If the fetch failed, return to guest and
-			 * try executing it again.
-			 */
-			r = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
-			vcpu->arch.emul_inst = ppc_inst_val(pinst);
-			if (r != EMULATE_DONE)
-				r = RESUME_GUEST;
-			else
-				r = RESUME_HOST;
-		} else {
-			r = RESUME_HOST;
-		}
-
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+		r = RESUME_HOST;
 		break;
-	}
 
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		vcpu->arch.trap = 0;
-- 
2.45.1

