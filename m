Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B52E818
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 00:23:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DlcD1MGCzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 08:23:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DlZq0cxNzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 08:22:38 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4TM2eTf127157
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 18:22:34 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2st0t1msgg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 18:22:34 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <farosas@linux.ibm.com>;
 Wed, 29 May 2019 23:22:33 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 May 2019 23:22:29 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4TMMSev26411456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 22:22:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98613C6055;
 Wed, 29 May 2019 22:22:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32320C605A;
 Wed, 29 May 2019 22:22:25 +0000 (GMT)
Received: from farosas.linux.ibm.com.ibmuc.com (unknown [9.85.162.241])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 May 2019 22:22:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Report single stepping capability
Date: Wed, 29 May 2019 19:22:19 -0300
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052922-8235-0000-0000-00000EA056E7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011181; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01210457; UDB=6.00635958; IPR=6.00991489; 
 MB=3.00027107; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-29 22:22:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052922-8236-0000-0000-000045C5ED1E
Message-Id: <20190529222219.27994-1-farosas@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=995 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905290138
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
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, aik@ozlabs.ru, pbonzini@redhat.com,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling the KVM_SET_GUEST_DEBUG ioctl, userspace might request
the next instruction to be single stepped via the
KVM_GUESTDBG_SINGLESTEP control bit of the kvm_guest_debug structure.

We currently don't have support for guest single stepping implemented
in Book3S HV.

This patch adds the KVM_CAP_PPC_GUEST_DEBUG_SSTEP capability in order
to inform userspace about the state of single stepping support.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---

v1 -> v2:
 - add capability description to Documentation/virtual/kvm/api.txt

 Documentation/virtual/kvm/api.txt | 3 +++
 arch/powerpc/kvm/powerpc.c        | 5 +++++
 include/uapi/linux/kvm.h          | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/virtual/kvm/api.txt b/Documentation/virtual/kvm/api.txt
index ba6c42c576dd..a77643bfa917 100644
--- a/Documentation/virtual/kvm/api.txt
+++ b/Documentation/virtual/kvm/api.txt
@@ -2969,6 +2969,9 @@ can be determined by querying the KVM_CAP_GUEST_DEBUG_HW_BPS and
 KVM_CAP_GUEST_DEBUG_HW_WPS capabilities which return a positive number
 indicating the number of supported registers.
 
+For ppc, the KVM_CAP_PPC_GUEST_DEBUG_SSTEP capability indicates whether
+the single-step debug event (KVM_GUESTDBG_SINGLESTEP) is supported.
+
 When debug events exit the main run loop with the reason
 KVM_EXIT_DEBUG with the kvm_debug_exit_arch part of the kvm_run
 structure containing architecture specific debug information.
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 3393b166817a..fd7e7d55637e 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -538,6 +538,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IMMEDIATE_EXIT:
 		r = 1;
 		break;
+	case KVM_CAP_PPC_GUEST_DEBUG_SSTEP:
+#ifdef CONFIG_BOOKE
+		r = 1;
+		break;
+#endif
 	case KVM_CAP_PPC_PAIRED_SINGLES:
 	case KVM_CAP_PPC_OSI:
 	case KVM_CAP_PPC_GET_PVINFO:
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 2fe12b40d503..cad9fcd90f39 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -993,6 +993,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ARM_SVE 170
 #define KVM_CAP_ARM_PTRAUTH_ADDRESS 171
 #define KVM_CAP_ARM_PTRAUTH_GENERIC 172
+#define KVM_CAP_PPC_GUEST_DEBUG_SSTEP 173
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.20.1

