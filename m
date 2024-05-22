Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 221978CBD10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 10:36:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pylsohzq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vkkxp1p2yz3vc9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 18:29:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pylsohzq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vkkx137BNz3fxk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 18:29:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44M7b7XW031016;
	Wed, 22 May 2024 08:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fYoR7iiLcArZtU74aSNT/rc2QYYoMKNLjO+XV8CNcUo=;
 b=pylsohzqdyFVQwiM+iERvLNd2+IDMezd1NgPPVRzxu0n4HvX5Iw9ul8TwMlElOnlrUOY
 wKn895KEQuUj+WGzkUWvvNzIXTjIR+EyGwqxCP4QPWCXRWDxWB2oMLNtbJ5FQLYGRiEH
 4BtkcPhCVeDfdv+dHqrg/BjvIq2Y1yXDkLi7gFzog6+6dn1nlDOc8/Va6Lgx3yUDVXLl
 QV/FVCZfrsbcSm/A3REEyL5CmEqiyuT3Kbj1HbTBH4QE+K4Zf3AgP4ENqK52W8IdwdJU
 6JAlpKjSQqJr5mUOfxn7HUApiNWw+QzQ26wXeSErTA8VwW+mIcJLsdi4G/FORE7VQJ6S Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9c1xg739-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 08:28:54 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44M8ORQP010376;
	Wed, 22 May 2024 08:28:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y9c1xg736-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 08:28:54 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44M73xHZ023565;
	Wed, 22 May 2024 08:28:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npawv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 08:28:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44M8Sl3D50528600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 May 2024 08:28:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 531642004D;
	Wed, 22 May 2024 08:28:47 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 297FD20040;
	Wed, 22 May 2024 08:28:45 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 May 2024 08:28:44 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, corbet@lwn.net
Subject: [PATCH] arch/powerpc/kvm: Fix doorbell emulation by adding DPDES support
Date: Wed, 22 May 2024 13:58:20 +0530
Message-ID: <20240522082838.121769-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: grk0eM8ItSChuzW7eKwq1BlMjSNV81hm
X-Proofpoint-GUID: Im1o3r3rcrkjg4qz4uyhGHNhWtcAIdWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_03,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=586
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405220060
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doorbell emulation is broken for KVM on PowerVM guests as support for
DPDES was not added in the initial patch series. Due to this, a KVM on
PowerVM guest cannot be booted with the XICS interrupt controller as
doorbells are to be setup in the initial probe path when using XICS
(pSeries_smp_probe()). Add DPDES support in the host KVM code to fix
doorbell emulation.

Fixes: 6ccbbc33f06a ("KVM: PPC: Add helper library for Guest State Buffers")
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 Documentation/arch/powerpc/kvm-nested.rst     |  4 +++-
 arch/powerpc/include/asm/guest-state-buffer.h |  3 ++-
 arch/powerpc/include/asm/kvm_book3s.h         |  1 +
 arch/powerpc/kvm/book3s_hv.c                  | 14 +++++++++++++-
 arch/powerpc/kvm/book3s_hv_nestedv2.c         |  7 +++++++
 arch/powerpc/kvm/test-guest-state-buffer.c    |  2 +-
 6 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/arch/powerpc/kvm-nested.rst
index 630602a8aa00..5defd13cc6c1 100644
--- a/Documentation/arch/powerpc/kvm-nested.rst
+++ b/Documentation/arch/powerpc/kvm-nested.rst
@@ -546,7 +546,9 @@ table information.
 +--------+-------+----+--------+----------------------------------+
 | 0x1052 | 0x08  | RW |   T    | CTRL                             |
 +--------+-------+----+--------+----------------------------------+
-| 0x1053-|       |    |        | Reserved                         |
+| 0x1053 | 0x08  | RW |   T    | DPDES                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1054-|       |    |        | Reserved                         |
 | 0x1FFF |       |    |        |                                  |
 +--------+-------+----+--------+----------------------------------+
 | 0x2000 | 0x04  | RW |   T    | CR                               |
diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
index 808149f31576..d107abe1468f 100644
--- a/arch/powerpc/include/asm/guest-state-buffer.h
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -81,6 +81,7 @@
 #define KVMPPC_GSID_HASHKEYR			0x1050
 #define KVMPPC_GSID_HASHPKEYR			0x1051
 #define KVMPPC_GSID_CTRL			0x1052
+#define KVMPPC_GSID_DPDES			0x1053
 
 #define KVMPPC_GSID_CR				0x2000
 #define KVMPPC_GSID_PIDR			0x2001
@@ -110,7 +111,7 @@
 #define KVMPPC_GSE_META_COUNT (KVMPPC_GSE_META_END - KVMPPC_GSE_META_START + 1)
 
 #define KVMPPC_GSE_DW_REGS_START KVMPPC_GSID_GPR(0)
-#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_CTRL
+#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_DPDES
 #define KVMPPC_GSE_DW_REGS_COUNT \
 	(KVMPPC_GSE_DW_REGS_END - KVMPPC_GSE_DW_REGS_START + 1)
 
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 3e1e2a698c9e..10618622d7ef 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -594,6 +594,7 @@ static inline u##size kvmppc_get_##reg(struct kvm_vcpu *vcpu)		\
 
 
 KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64, KVMPPC_GSID_VTB)
+KVMPPC_BOOK3S_VCORE_ACCESSOR(dpdes, 64, KVMPPC_GSID_DPDES)
 KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(arch_compat, 32, KVMPPC_GSID_LOGICAL_PVR)
 KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(lpcr, 64, KVMPPC_GSID_LPCR)
 KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(tb_offset, 64, KVMPPC_GSID_TB_OFFSET)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 35cb014a0c51..cf285e5153ba 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4116,6 +4116,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 	int trap;
 	long rc;
 
+	if (vcpu->arch.doorbell_request) {
+		vcpu->arch.doorbell_request = 0;
+		kvmppc_set_dpdes(vcpu, 1);
+	}
+
 	io = &vcpu->arch.nestedv2_io;
 
 	msr = mfmsr();
@@ -4278,9 +4283,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (kvmhv_on_pseries()) {
 		if (kvmhv_is_nestedv1())
 			trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
-		else
+		else {
 			trap = kvmhv_vcpu_entry_nestedv2(vcpu, time_limit, lpcr, tb);
 
+			/* Remember doorbell if it is pending  */
+			if (kvmppc_get_dpdes(vcpu)) {
+				vcpu->arch.doorbell_request = 1;
+				kvmppc_set_dpdes(vcpu, 0);
+			}
+		}
+
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !nested &&
 		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index 8e6f5355f08b..36863fff2a99 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -311,6 +311,10 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
 			rc = kvmppc_gse_put_u64(gsb, iden,
 						vcpu->arch.vcore->vtb);
 			break;
+		case KVMPPC_GSID_DPDES:
+			rc = kvmppc_gse_put_u64(gsb, iden,
+						vcpu->arch.vcore->dpdes);
+			break;
 		case KVMPPC_GSID_LPCR:
 			rc = kvmppc_gse_put_u64(gsb, iden,
 						vcpu->arch.vcore->lpcr);
@@ -543,6 +547,9 @@ static int gs_msg_ops_vcpu_refresh_info(struct kvmppc_gs_msg *gsm,
 		case KVMPPC_GSID_VTB:
 			vcpu->arch.vcore->vtb = kvmppc_gse_get_u64(gse);
 			break;
+		case KVMPPC_GSID_DPDES:
+			vcpu->arch.vcore->dpdes = kvmppc_gse_get_u64(gse);
+			break;
 		case KVMPPC_GSID_LPCR:
 			vcpu->arch.vcore->lpcr = kvmppc_gse_get_u64(gse);
 			break;
diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kvm/test-guest-state-buffer.c
index 4720b8dc8837..91ae660cfe21 100644
--- a/arch/powerpc/kvm/test-guest-state-buffer.c
+++ b/arch/powerpc/kvm/test-guest-state-buffer.c
@@ -151,7 +151,7 @@ static void test_gs_bitmap(struct kunit *test)
 		i++;
 	}
 
-	for (u16 iden = KVMPPC_GSID_GPR(0); iden <= KVMPPC_GSID_CTRL; iden++) {
+	for (u16 iden = KVMPPC_GSID_GPR(0); iden <= KVMPPC_GSID_DPDES; iden++) {
 		kvmppc_gsbm_set(&gsbm, iden);
 		kvmppc_gsbm_set(&gsbm1, iden);
 		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
-- 
2.45.0

