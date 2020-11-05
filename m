Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 505082A8005
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 14:52:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRlM11n6jzDqyP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 00:52:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRlGC4MmnzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 00:48:03 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5DljqF176172; Thu, 5 Nov 2020 08:47:53 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m5ftekvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 08:47:52 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5DiBvH006410;
 Thu, 5 Nov 2020 13:47:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 34h0f6tt1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 13:47:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5DlNMp64487700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 13:47:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDF76A4054;
 Thu,  5 Nov 2020 13:47:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CFFBA405B;
 Thu,  5 Nov 2020 13:47:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  5 Nov 2020 13:47:23 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-56-119.uk.ibm.com [9.145.56.119])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 3776422006B;
 Thu,  5 Nov 2020 14:47:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Paul Mackerras <paulus@samba.org>
Subject: [PATCH] KVM: PPC: Book3S HV: XIVE: Fix possible oops when accessing
 ESB page
Date: Thu,  5 Nov 2020 14:47:13 +0100
Message-Id: <20201105134713.656160-1-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_07:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1034 bulkscore=0
 priorityscore=1501 mlxlogscore=648 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050088
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
Cc: kvm@vger.kernel.org, Gustavo Romero <gromero@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When accessing the ESB page of a source interrupt, the fault handler
will retrieve the page address from the XIVE interrupt 'xive_irq_data'
structure. If the associated KVM XIVE interrupt is not valid, that is
not allocated at the HW level for some reason, the fault handler will
dereference a NULL pointer leading to the oops below :

    WARNING: CPU: 40 PID: 59101 at arch/powerpc/kvm/book3s_xive_native.c:=
259 xive_native_esb_fault+0xe4/0x240 [kvm]
    CPU: 40 PID: 59101 Comm: qemu-system-ppc Kdump: loaded Tainted: G    =
    W        --------- -  - 4.18.0-240.el8.ppc64le #1
    NIP:  c00800000e949fac LR: c00000000044b164 CTR: c00800000e949ec8
    REGS: c000001f69617840 TRAP: 0700   Tainted: G        W        ------=
--- -  -  (4.18.0-240.el8.ppc64le)
    MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44044282  XER: =
00000000
    CFAR: c00000000044b160 IRQMASK: 0
    GPR00: c00000000044b164 c000001f69617ac0 c00800000e96e000 c000001f696=
17c10
    GPR04: 05faa2b21e000080 0000000000000000 0000000000000005 fffffffffff=
fffff
    GPR08: 0000000000000000 0000000000000001 0000000000000000 00000000000=
00001
    GPR12: c00800000e949ec8 c000001ffffd3400 0000000000000000 00000000000=
00000
    GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
    GPR20: 0000000000000000 0000000000000000 c000001f5c065160 c000000001c=
76f90
    GPR24: c000001f06f20000 c000001f5c065100 0000000000000008 c000001f0eb=
98c78
    GPR28: c000001dcab40000 c000001dcab403d8 c000001f69617c10 00000000000=
00011
    NIP [c00800000e949fac] xive_native_esb_fault+0xe4/0x240 [kvm]
    LR [c00000000044b164] __do_fault+0x64/0x220
    Call Trace:
    [c000001f69617ac0] [0000000137a5dc20] 0x137a5dc20 (unreliable)
    [c000001f69617b50] [c00000000044b164] __do_fault+0x64/0x220
    [c000001f69617b90] [c000000000453838] do_fault+0x218/0x930
    [c000001f69617bf0] [c000000000456f50] __handle_mm_fault+0x350/0xdf0
    [c000001f69617cd0] [c000000000457b1c] handle_mm_fault+0x12c/0x310
    [c000001f69617d10] [c00000000007ef44] __do_page_fault+0x264/0xbb0
    [c000001f69617df0] [c00000000007f8c8] do_page_fault+0x38/0xd0
    [c000001f69617e30] [c00000000000a714] handle_page_fault+0x18/0x38
    Instruction dump:
    40c2fff0 7c2004ac 2fa90000 409e0118 73e90001 41820080 e8bd0008 7c2004=
ac
    7ca90074 39400000 915c0000 7929d182 <0b090000> 2fa50000 419e0080 e89e=
0018
    ---[ end trace 66c6ff034c53f64f ]---
    xive-kvm: xive_native_esb_fault: accessing invalid ESB page for sourc=
e 8 !

Fix that by checking the validity of the KVM XIVE interrupt structure.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive_native.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
index d0c2db0e07fa..a59a94f02733 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -251,6 +251,13 @@ static vm_fault_t xive_native_esb_fault(struct vm_fa=
ult *vmf)
 	}
=20
 	state =3D &sb->irq_state[src];
+
+	/* Some sanity checking */
+	if (!state->valid) {
+		pr_devel("%s: source %lx invalid !\n", __func__, irq);
+		return VM_FAULT_SIGBUS;
+	}
+
 	kvmppc_xive_select_irq(state, &hw_num, &xd);
=20
 	arch_spin_lock(&sb->lock);
--=20
2.26.2

