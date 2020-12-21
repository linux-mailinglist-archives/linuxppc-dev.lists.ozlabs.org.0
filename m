Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A22DF9A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 08:58:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzsKw5N5vzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 18:58:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzrzX4LbkzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL7WsGd052076; Mon, 21 Dec 2020 02:42:41 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35jq5xrhew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:41 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7b5p9010493;
 Mon, 21 Dec 2020 07:42:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 35h9588wtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BL7gZkD24248704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 544C352091;
 Mon, 21 Dec 2020 07:42:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 226345206D;
 Mon, 21 Dec 2020 07:42:36 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 86E5E220198;
 Mon, 21 Dec 2020 08:42:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/23] KVM: PPC: Make the VMX instruction emulation routines
 static
Date: Mon, 21 Dec 2020 08:42:17 +0100
Message-Id: <20201221074222.403894-19-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221074222.403894-1-clg@kaod.org>
References: <20201221074222.403894-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1034 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=833 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210053
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It fixes these W=3D1 compile errors :

../arch/powerpc/kvm/powerpc.c:1521:5: error: no previous prototype for =E2=
=80=98kvmppc_get_vmx_dword=E2=80=99 [-Werror=3Dmissing-prototypes]
 1521 | int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int index, u64 *v=
al)
      |     ^~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/powerpc.c:1539:5: error: no previous prototype for =E2=
=80=98kvmppc_get_vmx_word=E2=80=99 [-Werror=3Dmissing-prototypes]
 1539 | int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int index, u64 *va=
l)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/powerpc.c:1557:5: error: no previous prototype for =E2=
=80=98kvmppc_get_vmx_hword=E2=80=99 [-Werror=3Dmissing-prototypes]
 1557 | int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int index, u64 *v=
al)
      |     ^~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/powerpc.c:1575:5: error: no previous prototype for =E2=
=80=98kvmppc_get_vmx_byte=E2=80=99 [-Werror=3Dmissing-prototypes]
 1575 | int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *va=
l)
      |     ^~~~~~~~~~~~~~~~~~~

Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/powerpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cf52d26f49cd..25966ae3271e 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1518,7 +1518,7 @@ int kvmppc_handle_vmx_load(struct kvm_vcpu *vcpu,
 	return emulated;
 }
=20
-int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int index, u64 *val)
+static int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int index, u64 *v=
al)
 {
 	union kvmppc_one_reg reg;
 	int vmx_offset =3D 0;
@@ -1536,7 +1536,7 @@ int kvmppc_get_vmx_dword(struct kvm_vcpu *vcpu, int=
 index, u64 *val)
 	return result;
 }
=20
-int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int index, u64 *val)
+static int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int index, u64 *va=
l)
 {
 	union kvmppc_one_reg reg;
 	int vmx_offset =3D 0;
@@ -1554,7 +1554,7 @@ int kvmppc_get_vmx_word(struct kvm_vcpu *vcpu, int =
index, u64 *val)
 	return result;
 }
=20
-int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int index, u64 *val)
+static int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int index, u64 *v=
al)
 {
 	union kvmppc_one_reg reg;
 	int vmx_offset =3D 0;
@@ -1572,7 +1572,7 @@ int kvmppc_get_vmx_hword(struct kvm_vcpu *vcpu, int=
 index, u64 *val)
 	return result;
 }
=20
-int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *val)
+static int kvmppc_get_vmx_byte(struct kvm_vcpu *vcpu, int index, u64 *va=
l)
 {
 	union kvmppc_one_reg reg;
 	int vmx_offset =3D 0;
--=20
2.26.2

