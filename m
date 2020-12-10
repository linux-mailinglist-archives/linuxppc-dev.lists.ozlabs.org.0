Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EDF2D63E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:46:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLtq4X6wzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:46:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLFz48R0zDr0t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:17:43 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH2LXJ164130; Thu, 10 Dec 2020 12:17:31 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bqqp0jse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:17:31 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHCdTk005875;
 Thu, 10 Dec 2020 17:17:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8rvjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:17:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BAHEtA549218026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98ADE11C05B;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EE4111C052;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DD2C922012A;
 Thu, 10 Dec 2020 18:14:54 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/13] powerpc/xive: Rename XIVE_IRQ_NO_EOI to show its a
 flag
Date: Thu, 10 Dec 2020 18:14:39 +0100
Message-Id: <20201210171450.1933725-3-clg@kaod.org>
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
 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=1 clxscore=1034
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=625 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100105
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

This is a simple cleanup to identify easily all flags of the XIVE
interrupt structure. The interrupts flagged with XIVE_IRQ_FLAG_NO_EOI
are the escalations used to wake up vCPUs in KVM. They are handled
very differently from the rest.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xive.h   | 2 +-
 arch/powerpc/kvm/book3s_xive.c    | 4 ++--
 arch/powerpc/sysdev/xive/common.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index 309b4d65b74f..d332dd9a18de 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -66,7 +66,7 @@ struct xive_irq_data {
 #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
=20
 /* Special flag set by KVM for excalation interrupts */
-#define XIVE_IRQ_NO_EOI		0x80
+#define XIVE_IRQ_FLAG_NO_EOI	0x80
=20
 #define XIVE_INVALID_CHIP_ID	-1
=20
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index 18a6b75a3bfd..fae1c2e8da29 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -219,7 +219,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vc=
pu, u8 prio,
 	/* In single escalation mode, we grab the ESB MMIO of the
 	 * interrupt and mask it. Also populate the VCPU v/raddr
 	 * of the ESB page for use by asm entry/exit code. Finally
-	 * set the XIVE_IRQ_NO_EOI flag which will prevent the
+	 * set the XIVE_IRQ_FLAG_NO_EOI flag which will prevent the
 	 * core code from performing an EOI on the escalation
 	 * interrupt, thus leaving it effectively masked after
 	 * it fires once.
@@ -231,7 +231,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vc=
pu, u8 prio,
 		xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_01);
 		vcpu->arch.xive_esc_raddr =3D xd->eoi_page;
 		vcpu->arch.xive_esc_vaddr =3D (__force u64)xd->eoi_mmio;
-		xd->flags |=3D XIVE_IRQ_NO_EOI;
+		xd->flags |=3D XIVE_IRQ_FLAG_NO_EOI;
 	}
=20
 	return 0;
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index a80440af491a..65af34ac1fa2 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -416,7 +416,7 @@ static void xive_irq_eoi(struct irq_data *d)
 	 * been passed-through to a KVM guest
 	 */
 	if (!irqd_irq_disabled(d) && !irqd_is_forwarded_to_vcpu(d) &&
-	    !(xd->flags & XIVE_IRQ_NO_EOI))
+	    !(xd->flags & XIVE_IRQ_FLAG_NO_EOI))
 		xive_do_source_eoi(irqd_to_hwirq(d), xd);
 	else
 		xd->stale_p =3D true;
--=20
2.26.2

