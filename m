Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB1223BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 16:44:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455nxc6XmGzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 May 2019 00:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455nWy00NJzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 00:26:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 455nWx4J90z8tTb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 00:26:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 455nWx1wStz9sB8; Sun, 19 May 2019 00:26:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 455nWw4zlCz9sPS
 for <linuxppc-dev@ozlabs.org>; Sun, 19 May 2019 00:26:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4IEHg9D102677
 for <linuxppc-dev@ozlabs.org>; Sat, 18 May 2019 10:26:02 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sjdxggxwe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sat, 18 May 2019 10:26:02 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Sat, 18 May 2019 15:26:01 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 18 May 2019 15:25:59 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4IEPw4d64684096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 May 2019 14:25:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17ECF7805E;
 Sat, 18 May 2019 14:25:58 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E42C7805C;
 Sat, 18 May 2019 14:25:55 +0000 (GMT)
Received: from rino.ibm.com (unknown [9.85.168.40])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 18 May 2019 14:25:55 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 kvm-ppc@vger.kernel.org, linuxppc-dev@ozlabs.org
Subject: [RFC PATCH v2 09/10] KVM: PPC: Book3S HV: Fixed for running secure
 guests
Date: Sat, 18 May 2019 11:25:23 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518142524.28528-1-cclaudio@linux.ibm.com>
References: <20190518142524.28528-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051814-8235-0000-0000-00000E9900B1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011118; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01205121; UDB=6.00632701; IPR=6.00986061; 
 MB=3.00026948; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-18 14:26:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051814-8236-0000-0000-0000459E050A
Message-Id: <20190518142524.28528-10-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-18_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905180103
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Paul Mackerras <paulus@ozlabs.org>

- Pass SRR1 in r11 for UV_RETURN because SRR0 and SRR1 get set by
  the sc 2 instruction. (Note r3 - r10 potentially have hcall return
  values in them.)

- Fix kvmppc_msr_interrupt to preserve the MSR_S bit.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d89efa0783a2..1b44c85956b9 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1160,6 +1160,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 ret_to_ultra:
 	lwz	r6, VCPU_CR(r4)
 	mtcr	r6
+	mfspr	r11, SPRN_SRR1
 	LOAD_REG_IMMEDIATE(r0, UV_RETURN)
 	ld	r7, VCPU_GPR(R7)(r4)
 	ld	r6, VCPU_GPR(R6)(r4)
@@ -3360,13 +3361,16 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
  *   r0 is used as a scratch register
  */
 kvmppc_msr_interrupt:
+	andis.	r0, r11, MSR_S@h
 	rldicl	r0, r11, 64 - MSR_TS_S_LG, 62
-	cmpwi	r0, 2 /* Check if we are in transactional state..  */
+	cmpwi	cr1, r0, 2 /* Check if we are in transactional state..  */
 	ld	r11, VCPU_INTR_MSR(r9)
-	bne	1f
+	bne	cr1, 1f
 	/* ... if transactional, change to suspended */
 	li	r0, 1
 1:	rldimi	r11, r0, MSR_TS_S_LG, 63 - MSR_TS_T_LG
+	beqlr
+	oris	r11, r11, MSR_S@h		/* preserve MSR_S bit setting */
 	blr
 
 /*
-- 
2.20.1

