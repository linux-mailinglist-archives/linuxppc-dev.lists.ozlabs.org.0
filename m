Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADC58A4759
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 05:58:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SDSjxo+9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHtgz1zlZz3vYV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 13:58:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SDSjxo+9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHtgC5TG5z3blb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 13:57:58 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43F3b8uu024529;
	Mon, 15 Apr 2024 03:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LH5DJNYYRIwBYdQr5hD/5/ZEM0s2lZ3DPWKSjhEy4eM=;
 b=SDSjxo+9SO6A4V/iuI0Sfy4qvVyPfARevKo1fLHnITszbFMOD+4VBn1yRVbk219utQJX
 6XybwiDmpHE+ak3JPukMijKg6+dlOTyEagIvM73lgTqM7aZHXtMLIW0wS0D1+F4YpDtm
 afBJWXLF8poahiTo8ZrjXEvQD2NMzww3yjyu5TQKW2KRBz3q6blGD95PEE42GEtuaTb3
 X1Ky8ZaQ5r66ol36JN6XFYwhQqffSOtZImROUOuNi4uPiXs3J6Inq8jqpBv0lh12u8Am
 4yw/5CDBteaOEgtDnQ0Wp/HvjDPKQ/JGXsahmsLi/k/by+d4EGBjpGWqmoS6cvU2XZTj eA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xffft348a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 03:57:45 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43F3vjYI019638;
	Mon, 15 Apr 2024 03:57:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xffft3488-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 03:57:45 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43F2KeZ5015826;
	Mon, 15 Apr 2024 03:57:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vkwhye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Apr 2024 03:57:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43F3vcxj50725288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Apr 2024 03:57:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9609D2004F;
	Mon, 15 Apr 2024 03:57:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D227220040;
	Mon, 15 Apr 2024 03:57:33 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.83.6])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 15 Apr 2024 03:57:33 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 15 Apr 2024 09:27:32 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Book3S HV nestedv2: Cancel pending DEC exception
Date: Mon, 15 Apr 2024 09:27:29 +0530
Message-ID: <20240415035731.103097-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WPNLM_2foBYKkOraUg4G1NggAJs3LbHO
X-Proofpoint-ORIG-GUID: 1h7ihF_tx5b1liYC28XZwnX3_FyRnvxh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404150024
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

This reverts commit 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not
cancel pending decrementer exception") [1] which prevented canceling a
pending HDEC exception for nestedv2 KVM guests. It was done to avoid
overhead of a H_GUEST_GET_STATE hcall to read the 'DEC expiry TB' register
which was higher compared to handling extra decrementer exceptions.

However recent benchmarks indicate that overhead of not handling 'DECR'
expiry for Nested KVM Guest(L2) is higher and results in much larger exits
to Pseries Host(L1) as indicated by the Unixbench-arithoh bench[2]

Metric	    	      | Current upstream    | Revert [1]  | Difference %
========================================================================
arithoh-count (10)    |	3244831634	    | 3403089673  | +04.88%
kvm_hv:kvm_guest_exit |	513558		    | 152441	  | -70.32%
probe:kvmppc_gsb_recv |	28060		    | 28110	  | +00.18%

N=1

As indicated by the data above that reverting [1] results in substantial
reduction in number of L2->L1 exits with only slight increase in number of
H_GUEST_GET_STATE hcalls to read the value of 'DEC expiry TB'. This results
in an overall ~4% improvement of arithoh[2] throughput.

[1] commit 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
[2] https://github.com/kdlucas/byte-unixbench/

Fixes: 180c6b072bf3 ("KVM: PPC: Book3S HV nestedv2: Do not cancel pending decrementer exception")
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog:
Since v1: https://lore.kernel.org/all/20240313072625.76804-1-vaibhav@linux.ibm.com
* Updated/Corrected patch title and description
* Included data on test benchmark results for Unixbench-arithoh bench.
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8e86eb577eb8..692a7c6f5fd9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4857,7 +4857,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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

