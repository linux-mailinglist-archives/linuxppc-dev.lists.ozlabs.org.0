Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66E2D6368
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:23:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLNS4y5kzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:23:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLC50bqGzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:12 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH3FcP104193; Thu, 10 Dec 2020 12:15:00 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bqnugnjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:14:59 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHCAWx009794;
 Thu, 10 Dec 2020 17:14:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svnwmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:14:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BAHEtWb55771598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DEDBAE04D;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6039AE045;
 Thu, 10 Dec 2020 17:14:54 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:14:54 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5FD332204B9;
 Thu, 10 Dec 2020 18:14:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/13] KVM: PPC: Book3S HV: XIVE: Show detailed
 configuration in debug output
Date: Thu, 10 Dec 2020 18:14:38 +0100
Message-Id: <20201210171450.1933725-2-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=3
 clxscore=1034 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100106
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is useful to track allocation of the HW resources on per guest
basis. Making sure IPIs are local to the chip of the vCPUs reduces
rerouting between interrupt controllers and gives better performance
in case of pinning. Checking the distribution of VP structures on the
chips also helps in reducing PowerBUS traffic.

Signed-off-by: Greg Kurz <groug@kaod.org>
[ clg: resurrected show_sources and reworked ouput ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.h        |  2 +
 arch/powerpc/kvm/book3s_xive.c        | 76 ++++++++++++++++++++++-----
 arch/powerpc/kvm/book3s_xive_native.c | 21 ++++++--
 3 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xiv=
e.h
index 382e3a56e789..d5d4fee7ac94 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -290,6 +290,8 @@ extern int (*__xive_vm_h_eoi)(struct kvm_vcpu *vcpu, =
unsigned long xirr);
  */
 void kvmppc_xive_disable_vcpu_interrupts(struct kvm_vcpu *vcpu);
 int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *v=
cpu);
+void kvmppc_xive_debug_show_sources(struct seq_file *m,
+				    struct kvmppc_xive_src_block *sb);
 struct kvmppc_xive_src_block *kvmppc_xive_create_src_block(
 	struct kvmppc_xive *xive, int irq);
 void kvmppc_xive_free_sources(struct kvmppc_xive_src_block *sb);
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index a0ebc29f30b2..18a6b75a3bfd 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2125,9 +2125,8 @@ int kvmppc_xive_debug_show_queues(struct seq_file *=
m, struct kvm_vcpu *vcpu)
 		if (!q->qpage && !xc->esc_virq[i])
 			continue;
=20
-		seq_printf(m, " [q%d]: ", i);
-
 		if (q->qpage) {
+			seq_printf(m, "    q[%d]: ", i);
 			idx =3D q->idx;
 			i0 =3D be32_to_cpup(q->qpage + idx);
 			idx =3D (idx + 1) & q->msk;
@@ -2141,16 +2140,54 @@ int kvmppc_xive_debug_show_queues(struct seq_file=
 *m, struct kvm_vcpu *vcpu)
 				irq_data_get_irq_handler_data(d);
 			u64 pq =3D xive_vm_esb_load(xd, XIVE_ESB_GET);
=20
-			seq_printf(m, "E:%c%c I(%d:%llx:%llx)",
-				   (pq & XIVE_ESB_VAL_P) ? 'P' : 'p',
-				   (pq & XIVE_ESB_VAL_Q) ? 'Q' : 'q',
-				   xc->esc_virq[i], pq, xd->eoi_page);
+			seq_printf(m, "    ESC %d %c%c EOI @%llx",
+				   xc->esc_virq[i],
+				   (pq & XIVE_ESB_VAL_P) ? 'P' : '-',
+				   (pq & XIVE_ESB_VAL_Q) ? 'Q' : '-',
+				   xd->eoi_page);
 			seq_puts(m, "\n");
 		}
 	}
 	return 0;
 }
=20
+void kvmppc_xive_debug_show_sources(struct seq_file *m,
+				    struct kvmppc_xive_src_block *sb)
+{
+	int i;
+
+	seq_puts(m, "    LISN      HW/CHIP   TYPE    PQ      EISN    CPU/PRIO\n=
");
+	for (i =3D 0; i < KVMPPC_XICS_IRQ_PER_ICS; i++) {
+		struct kvmppc_xive_irq_state *state =3D &sb->irq_state[i];
+		struct xive_irq_data *xd;
+		u64 pq;
+		u32 hw_num;
+
+		if (!state->valid)
+			continue;
+
+		kvmppc_xive_select_irq(state, &hw_num, &xd);
+
+		pq =3D xive_vm_esb_load(xd, XIVE_ESB_GET);
+
+		seq_printf(m, "%08x  %08x/%02x", state->number, hw_num,
+			   xd->src_chip);
+		if (state->lsi)
+			seq_printf(m, " %cLSI", state->asserted ? '^' : ' ');
+		else
+			seq_puts(m, "  MSI");
+
+		seq_printf(m, " %s  %c%c  %08x   % 4d/%d",
+			   state->ipi_number =3D=3D hw_num ? "IPI" : " PT",
+			   pq & XIVE_ESB_VAL_P ? 'P' : '-',
+			   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
+			   state->eisn, state->act_server,
+			   state->act_priority);
+
+		seq_puts(m, "\n");
+	}
+}
+
 static int xive_debug_show(struct seq_file *m, void *private)
 {
 	struct kvmppc_xive *xive =3D m->private;
@@ -2171,7 +2208,7 @@ static int xive_debug_show(struct seq_file *m, void=
 *private)
 	if (!kvm)
 		return 0;
=20
-	seq_printf(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D\nVCPU state\n=3D=3D=3D=3D=3D=
=3D=3D=3D=3D\n");
+	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D\nVCPU state\n=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
=20
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		struct kvmppc_xive_vcpu *xc =3D vcpu->arch.xive_vcpu;
@@ -2179,11 +2216,12 @@ static int xive_debug_show(struct seq_file *m, vo=
id *private)
 		if (!xc)
 			continue;
=20
-		seq_printf(m, "cpu server %#x VP:%#x CPPR:%#x HWCPPR:%#x"
-			   " MFRR:%#x PEND:%#x h_xirr: R=3D%lld V=3D%lld\n",
-			   xc->server_num, xc->vp_id, xc->cppr, xc->hw_cppr,
-			   xc->mfrr, xc->pending,
-			   xc->stat_rm_h_xirr, xc->stat_vm_h_xirr);
+		seq_printf(m, "VCPU %d: VP:%#x/%02x\n"
+			 "    CPPR:%#x HWCPPR:%#x MFRR:%#x PEND:%#x h_xirr: R=3D%lld V=3D%lld=
\n",
+			 xc->server_num, xc->vp_id, xc->vp_chip_id,
+			 xc->cppr, xc->hw_cppr,
+			 xc->mfrr, xc->pending,
+			 xc->stat_rm_h_xirr, xc->stat_vm_h_xirr);
=20
 		kvmppc_xive_debug_show_queues(m, vcpu);
=20
@@ -2199,13 +2237,25 @@ static int xive_debug_show(struct seq_file *m, vo=
id *private)
 		t_vm_h_ipi +=3D xc->stat_vm_h_ipi;
 	}
=20
-	seq_printf(m, "Hcalls totals\n");
+	seq_puts(m, "Hcalls totals\n");
 	seq_printf(m, " H_XIRR  R=3D%10lld V=3D%10lld\n", t_rm_h_xirr, t_vm_h_x=
irr);
 	seq_printf(m, " H_IPOLL R=3D%10lld V=3D%10lld\n", t_rm_h_ipoll, t_vm_h_=
ipoll);
 	seq_printf(m, " H_CPPR  R=3D%10lld V=3D%10lld\n", t_rm_h_cppr, t_vm_h_c=
ppr);
 	seq_printf(m, " H_EOI   R=3D%10lld V=3D%10lld\n", t_rm_h_eoi, t_vm_h_eo=
i);
 	seq_printf(m, " H_IPI   R=3D%10lld V=3D%10lld\n", t_rm_h_ipi, t_vm_h_ip=
i);
=20
+	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D\nSources\n=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
+
+	for (i =3D 0; i <=3D xive->max_sbid; i++) {
+		struct kvmppc_xive_src_block *sb =3D xive->src_blocks[i];
+
+		if (sb) {
+			arch_spin_lock(&sb->lock);
+			kvmppc_xive_debug_show_sources(m, sb);
+			arch_spin_unlock(&sb->lock);
+		}
+	}
+
 	return 0;
 }
=20
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
index 6aaaa4bedaaf..9b395381179d 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1257,18 +1257,31 @@ static int xive_native_debug_show(struct seq_file=
 *m, void *private)
 		if (!xc)
 			continue;
=20
-		seq_printf(m, "cpu server %#x VP=3D%#x NSR=3D%02x CPPR=3D%02x IBP=3D%0=
2x PIPR=3D%02x w01=3D%016llx w2=3D%08x\n",
-			   xc->server_num, xc->vp_id,
+		seq_printf(m, "VCPU %d: VP=3D%#x/%02x\n"
+			   "    NSR=3D%02x CPPR=3D%02x IBP=3D%02x PIPR=3D%02x w01=3D%016llx w=
2=3D%08x\n",
+			   xc->server_num, xc->vp_id, xc->vp_chip_id,
 			   vcpu->arch.xive_saved_state.nsr,
 			   vcpu->arch.xive_saved_state.cppr,
 			   vcpu->arch.xive_saved_state.ipb,
 			   vcpu->arch.xive_saved_state.pipr,
-			   vcpu->arch.xive_saved_state.w01,
-			   (u32) vcpu->arch.xive_cam_word);
+			   be64_to_cpu(vcpu->arch.xive_saved_state.w01),
+			   be32_to_cpu(vcpu->arch.xive_cam_word));
=20
 		kvmppc_xive_debug_show_queues(m, vcpu);
 	}
=20
+	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D\nSources\n=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
+
+	for (i =3D 0; i <=3D xive->max_sbid; i++) {
+		struct kvmppc_xive_src_block *sb =3D xive->src_blocks[i];
+
+		if (sb) {
+			arch_spin_lock(&sb->lock);
+			kvmppc_xive_debug_show_sources(m, sb);
+			arch_spin_unlock(&sb->lock);
+		}
+	}
+
 	return 0;
 }
=20
--=20
2.26.2

