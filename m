Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E4781845A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 10:24:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4EcT8ht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvWVN1bYtz3cVn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 20:24:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4EcT8ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvWTW2lV6z2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 20:23:43 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJ9HR5l011928;
	Tue, 19 Dec 2023 09:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VBLVLGidWmqFuH7WIg0j7KnZANsKBlDQID8aBmgWBIc=;
 b=F4EcT8htAd21fsFB+2BX/oUK1BvTP/8l0jISOBFWFcTGhr0qslpfzB2P3ZXCDHLkE5VG
 b0maNs6pFUdZc4S0wJJ+VfzLuYdWtR4MoNIVPMD1OKZmi7PVKENZezLCadAAo+EuDRlO
 me4TCCJRr/eA/njPJAjw6OimYC9+TdSs5efSBsSueG3LCw9E69UquzbYssWoL2MStdi7
 Mcd4kfhb0OlshuC4DN3StnjaSZ/28bGhnoAZHnLrMfU4zxI2LoeSZ+vlSMvyuYp/F65n
 Q0VgZSphLnNi3SyYBLU7s9lkLAxdwJEs9ORJrM0ZZFOs0VncEIRMCnqWGo/Uu9yZ5TlV fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v38djg4nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 09:23:33 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BJ9JBOK016229;
	Tue, 19 Dec 2023 09:23:32 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v38djg4mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 09:23:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BJ6cS6W004798;
	Tue, 19 Dec 2023 09:23:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3v1pkypspe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 09:23:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BJ9NRXV63242578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Dec 2023 09:23:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7CE02004B;
	Tue, 19 Dec 2023 09:23:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 324F020043;
	Tue, 19 Dec 2023 09:23:20 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.61.137.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 19 Dec 2023 09:23:19 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Tue, 19 Dec 2023 14:53:17 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH] powerpc/hvcall: Reorder Nestedv2 hcall opcodes
Date: Tue, 19 Dec 2023 14:52:36 +0530
Message-ID: <20231219092309.118151-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AEpyoGmXzVeDABI26oC8SHcjBQmATCEn
X-Proofpoint-ORIG-GUID: UUpaRrWN_jBKqsdBrDPaqebb87Zb7f6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-19_04,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 mlxlogscore=593
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312190069
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

This trivial patch reorders the newly introduced hcall opcodes for Nestedv2
to follow the increasing-opcode-number convention followed in
'hvcall.h'. The patch also updates the value for MAX_HCALL_OPCODE which is
at various places in arch code for range checking.

Fixes: 19d31c5f1157 ("KVM: PPC: Add support for nestedv2 guests")
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Vaibhav Jain<vaibhav@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index ddb99e982917..605ed2b58aff 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -349,7 +349,17 @@
 #define H_GET_ENERGY_SCALE_INFO	0x450
 #define H_PKS_SIGNED_UPDATE	0x454
 #define H_WATCHDOG		0x45C
-#define MAX_HCALL_OPCODE	H_WATCHDOG
+#define H_WATCHDOG		0x45C
+#define H_GUEST_GET_CAPABILITIES 0x460
+#define H_GUEST_SET_CAPABILITIES 0x464
+#define H_GUEST_CREATE		0x470
+#define H_GUEST_CREATE_VCPU	0x474
+#define H_GUEST_GET_STATE	0x478
+#define H_GUEST_SET_STATE	0x47C
+#define H_GUEST_RUN_VCPU	0x480
+#define H_GUEST_COPY_MEMORY	0x484
+#define H_GUEST_DELETE		0x488
+#define MAX_HCALL_OPCODE	H_GUEST_DELETE
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
@@ -393,15 +403,6 @@
 #define H_ENTER_NESTED		0xF804
 #define H_TLB_INVALIDATE	0xF808
 #define H_COPY_TOFROM_GUEST	0xF80C
-#define H_GUEST_GET_CAPABILITIES 0x460
-#define H_GUEST_SET_CAPABILITIES 0x464
-#define H_GUEST_CREATE		0x470
-#define H_GUEST_CREATE_VCPU	0x474
-#define H_GUEST_GET_STATE	0x478
-#define H_GUEST_SET_STATE	0x47C
-#define H_GUEST_RUN_VCPU	0x480
-#define H_GUEST_COPY_MEMORY	0x484
-#define H_GUEST_DELETE		0x488
 
 /* Flags for H_SVM_PAGE_IN */
 #define H_PAGE_IN_SHARED        0x1
-- 
2.43.0

