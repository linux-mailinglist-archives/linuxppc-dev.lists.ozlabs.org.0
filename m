Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2372E981F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 16:12:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8fHj14v9zDqjx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 02:12:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8dQc2L1zzDqL0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:33:12 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104E2eLo003979; Mon, 4 Jan 2021 09:33:00 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v3svsqxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 09:33:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104EVeoW031839;
 Mon, 4 Jan 2021 14:32:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 35u3pmhat0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 14:32:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 104EWJdm31326570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 14:32:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FDE34C046;
 Mon,  4 Jan 2021 14:32:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45D934C044;
 Mon,  4 Jan 2021 14:32:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  4 Jan 2021 14:32:22 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-4-90.uk.ibm.com [9.145.4.90])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9233D220073;
 Mon,  4 Jan 2021 15:32:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/23] KVM: PPC: Book3S HV: Declare some prototypes
Date: Mon,  4 Jan 2021 15:32:03 +0100
Message-Id: <20210104143206.695198-21-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104143206.695198-1-clg@kaod.org>
References: <20210104143206.695198-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_08:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1034 suspectscore=0 mlxlogscore=641 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040091
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes these W=3D1 compile errors:

../arch/powerpc/kvm/book3s_hv_builtin.c:425:6: error: no previous prototy=
pe for =E2=80=98kvmppc_read_intr=E2=80=99 [-Werror=3Dmissing-prototypes]
  425 | long kvmppc_read_intr(void)
      |      ^~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_hv_builtin.c:652:6: error: no previous prototy=
pe for =E2=80=98kvmppc_bad_interrupt=E2=80=99 [-Werror=3Dmissing-prototyp=
es]
  652 | void kvmppc_bad_interrupt(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_hv_builtin.c:695:6: error: no previous prototy=
pe for =E2=80=98kvmhv_p9_set_lpcr=E2=80=99 [-Werror=3Dmissing-prototypes]
  695 | void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
      |      ^~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_hv_builtin.c:740:6: error: no previous prototy=
pe for =E2=80=98kvmhv_p9_restore_lpcr=E2=80=99 [-Werror=3Dmissing-prototy=
pes]
  740 | void kvmhv_p9_restore_lpcr(struct kvm_split_mode *sip)
      |      ^~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_hv_builtin.c:768:6: error: no previous prototy=
pe for =E2=80=98kvmppc_set_msr_hv=E2=80=99 [-Werror=3Dmissing-prototypes]
  768 | void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
      |      ^~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_hv_builtin.c:817:6: error: no previous prototy=
pe for =E2=80=98kvmppc_inject_interrupt_hv=E2=80=99 [-Werror=3Dmissing-pr=
ototypes]
  817 | void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u=
64 srr1_flags)

Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/kvm_book3s.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
index d32ec9ae73bd..2f5f919f6cd3 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -277,6 +277,13 @@ extern int kvmppc_hcall_impl_hv_realmode(unsigned lo=
ng cmd);
 extern void kvmppc_copy_to_svcpu(struct kvm_vcpu *vcpu);
 extern void kvmppc_copy_from_svcpu(struct kvm_vcpu *vcpu);
=20
+long kvmppc_read_intr(void);
+void kvmppc_bad_interrupt(struct pt_regs *regs);
+void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip);
+void kvmhv_p9_restore_lpcr(struct kvm_split_mode *sip);
+void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr);
+void kvmppc_inject_interrupt_hv(struct kvm_vcpu *vcpu, int vec, u64 srr1=
_flags);
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 void kvmppc_save_tm_pr(struct kvm_vcpu *vcpu);
 void kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu);
--=20
2.26.2

