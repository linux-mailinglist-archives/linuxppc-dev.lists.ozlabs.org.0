Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25336F6EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlSM50m7z3fMq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJl4mH5z3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:39 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U840v6087781; Fri, 30 Apr 2021 04:04:25 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388cek2u5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U7xFWw030828;
 Fri, 30 Apr 2021 08:04:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8jy9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84Kx621299580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0948A405B;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1137A4060;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:19 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 20BF7220193;
 Fri, 30 Apr 2021 10:04:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 15/31] KVM: PPC: Book3S HV: XIVE: Fix mapping of passthrough
 interrupts
Date: Fri, 30 Apr 2021 10:03:51 +0200
Message-Id: <20210430080407.4030767-16-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5OwiyfrCFyu080MC75KCxXaCZI0XaEaZ
X-Proofpoint-ORIG-GUID: 5OwiyfrCFyu080MC75KCxXaCZI0XaEaZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1034 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=720 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300056
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI MSI interrupt numbers are now mapped in a PCI-MSI domain but the
underlying calls handling the passthrough of the interrupt in the
guest need a number in the XIVE IRQ domain.

Use the IRQ data mapped in the XIVE IRQ domain and not the one in the
PCI-MSI domain.

Exporting irq_get_default_host() might not be the best solution.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c | 3 ++-
 kernel/irq/irqdomain.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
index 3a7da42bed57..81b9f4fc3978 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -861,7 +861,8 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned =
long guest_irq,
 	struct kvmppc_xive *xive =3D kvm->arch.xive;
 	struct kvmppc_xive_src_block *sb;
 	struct kvmppc_xive_irq_state *state;
-	struct irq_data *host_data =3D irq_get_irq_data(host_irq);
+	struct irq_data *host_data =3D
+		irq_domain_get_irq_data(irq_get_default_host(), host_irq);
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(host_data);
 	u16 idx;
 	u8 prio;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index d10ab1d689d5..8a073d1ce611 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -481,6 +481,7 @@ struct irq_domain *irq_get_default_host(void)
 {
 	return irq_default_domain;
 }
+EXPORT_SYMBOL_GPL(irq_get_default_host);
=20
 static void irq_domain_clear_mapping(struct irq_domain *domain,
 				     irq_hw_number_t hwirq)
--=20
2.26.3

