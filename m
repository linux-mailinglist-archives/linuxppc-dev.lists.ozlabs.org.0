Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4E199611
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:14:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s7YR5SJszDrB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 23:14:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s7Tl3QdPzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 23:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VC2okW046934; Tue, 31 Mar 2020 08:11:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022qy3ega-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02VC3oXD050972;
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022qy3efs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:11:17 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02VCALgo020830;
 Tue, 31 Mar 2020 12:11:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 301x76gnh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 12:11:16 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VCBFFF56295686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 12:11:15 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3276BC605A;
 Tue, 31 Mar 2020 12:11:15 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C828DC6055;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.71.250])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 12:11:14 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 762512E340E; Tue, 31 Mar 2020 17:41:10 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 David Gibson <david@gibson.dropbear.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Subject: [RFC/PATCH 1/3] powerpc/kvm: Handle H_FAC_UNAVAIL when guest executes
 stop.
Date: Tue, 31 Mar 2020 17:40:56 +0530
Message-Id: <1585656658-1838-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=996 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310110
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

If a guest executes a stop instruction when the hypervisor has set the
PSSCR[ESL|EC] bits, the processor will throw an Hypervisor Facility
Unavailable exception. Currently when we receive this exception, we
only check if the exeception is generated due to a doorbell
instruction, in which case we emulate it. For all other cases,
including the case when the guest executes a stop-instruction, the
hypervisor sends a PROGILL to the guest program, which results in a
guest crash.

This patch adds code to handle the case when the hypervisor receives a
H_FAC_UNAVAIL exception due to guest executing the stop
instruction. The hypervisor increments the pc to the next instruction
and resumes the guest as expected by the semantics of the
PSSCR[ESL|EC] = 0 stop instruction.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/reg.h | 1 +
 arch/powerpc/kvm/book3s_hv.c   | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index da5cab0..2568c18 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -399,6 +399,7 @@
 /* HFSCR and FSCR bit numbers are the same */
 #define FSCR_SCV_LG	12	/* Enable System Call Vectored */
 #define FSCR_MSGP_LG	10	/* Enable MSGP */
+#define FSCR_STOP_LG    9       /* Enable stop states */
 #define FSCR_TAR_LG	8	/* Enable Target Address Register */
 #define FSCR_EBB_LG	7	/* Enable Event Based Branching */
 #define FSCR_TM_LG	5	/* Enable Transactional Memory */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 33be4d9..cdb7224 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1419,7 +1419,11 @@ static int kvmppc_handle_exit_hv(struct kvm_run *run, struct kvm_vcpu *vcpu,
 		if (((vcpu->arch.hfscr >> 56) == FSCR_MSGP_LG) &&
 		    cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmppc_emulate_doorbell_instr(vcpu);
-		if (r == EMULATE_FAIL) {
+		else if (((vcpu->arch.hfscr >> 56) == FSCR_STOP_LG) &&
+			cpu_has_feature(CPU_FTR_ARCH_300)) {
+			kvmppc_set_pc(vcpu, kvmppc_get_pc(vcpu) + 4);
+			r = RESUME_GUEST;
+		} else if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 			r = RESUME_GUEST;
 		}
-- 
1.9.4

