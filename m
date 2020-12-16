Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EC82DBEFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 11:50:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwsN05j8bzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 21:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DfzmxFdj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwsDT5Xj8zDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 21:43:37 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BGAX7dL056766; Wed, 16 Dec 2020 05:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3tnHLPjh9qpDIqfh7R6GMQ3xavAW0IZ7Ihe8oP/GnlE=;
 b=DfzmxFdjFM7ks0MTchkSLecgU2jy3hKORQu3qDRuM3aCr1fRB4lSMG/mL9k7WKDR4acT
 KrDNDE9upRWJ+2V70EMAzWaqvbzt6ZQ5A90SY31yJtGU/9mtDUHUvXXxERZV/iz9WPBQ
 RgzeZt62mWkaRfjqK8WV0/J01+jJIbaFhGkpNfyW/OXOZAbcy/jN1PY02/iVNvaLK5yz
 gTPup1g1EgTj2o7qKyoRB7sRGwlL3D2q1qno4DpUuOSCHmBLgLcpBHWjz4s3kmwu1Hcj
 8nhBlI27D4UPk989lrc96LuhqZ8oqpP9kwY36wXyI0JeDE87Iaskv1OGJwEMglyyvq9+ 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fe53md6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:30 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BGAXa8d058460;
 Wed, 16 Dec 2020 05:43:30 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fe53md64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 05:43:29 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BGAghOt016789;
 Wed, 16 Dec 2020 10:43:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 35cng846en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 10:43:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BGAhPOt18612528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 10:43:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94C6711C052;
 Wed, 16 Dec 2020 10:43:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 895C311C04C;
 Wed, 16 Dec 2020 10:43:22 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.249])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 10:43:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, paulus@samba.org
Subject: [PATCH v3 4/4] KVM: PPC: Introduce new capability for 2nd DAWR
Date: Wed, 16 Dec 2020 16:12:19 +0530
Message-Id: <20201216104219.458713-5-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216104219.458713-1-ravi.bangoria@linux.ibm.com>
References: <20201216104219.458713-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_04:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160067
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 kvm@vger.kernel.org, leobras.c@gmail.com, jniethe5@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org,
 pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce KVM_CAP_PPC_DAWR1 which can be used by Qemu to query whether
kvm supports 2nd DAWR or not. The capability is by default disabled
even when the underlying CPU supports 2nd DAWR. Qemu needs to check
and enable it manually to use the feature.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 Documentation/virt/kvm/api.rst     | 10 ++++++++++
 arch/powerpc/include/asm/kvm_ppc.h |  1 +
 arch/powerpc/kvm/book3s_hv.c       | 12 ++++++++++++
 arch/powerpc/kvm/powerpc.c         | 10 ++++++++++
 include/uapi/linux/kvm.h           |  1 +
 tools/include/uapi/linux/kvm.h     |  1 +
 6 files changed, 35 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index abb24575bdf9..049f07ebf197 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6016,6 +6016,16 @@ KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit notifications which user space
 can then handle to implement model specific MSR handling and/or user notifications
 to inform a user that an MSR was not handled.
 
+7.22 KVM_CAP_PPC_DAWR1
+----------------------
+
+:Architectures: ppc
+:Parameters: none
+:Returns: 0 on success, -EINVAL when CPU doesn't support 2nd DAWR
+
+This capability can be used to check / enable 2nd DAWR feature provided
+by POWER10 processor.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317..13c39d24dda5 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -314,6 +314,7 @@ struct kvmppc_ops {
 			      int size);
 	int (*enable_svm)(struct kvm *kvm);
 	int (*svm_off)(struct kvm *kvm);
+	int (*enable_dawr1)(struct kvm *kvm);
 };
 
 extern struct kvmppc_ops *kvmppc_hv_ops;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b7a30c0692a7..04c02344bd3f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5625,6 +5625,17 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	return ret;
 }
 
+static int kvmhv_enable_dawr1(struct kvm *kvm)
+{
+	if (!cpu_has_feature(CPU_FTR_DAWR1))
+		return -ENODEV;
+
+	/* kvm == NULL means the caller is testing if the capability exists */
+	if (kvm)
+		kvm->arch.dawr1_enabled = true;
+	return 0;
+}
+
 static struct kvmppc_ops kvm_ops_hv = {
 	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
 	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
@@ -5668,6 +5679,7 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.store_to_eaddr = kvmhv_store_to_eaddr,
 	.enable_svm = kvmhv_enable_svm,
 	.svm_off = kvmhv_svm_off,
+	.enable_dawr1 = kvmhv_enable_dawr1,
 };
 
 static int kvm_init_subcore_bitmap(void)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 13999123b735..380656528b5b 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -678,6 +678,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = hv_enabled && kvmppc_hv_ops->enable_svm &&
 			!kvmppc_hv_ops->enable_svm(NULL);
 		break;
+	case KVM_CAP_PPC_DAWR1:
+		r = !!(hv_enabled && kvmppc_hv_ops->enable_dawr1 &&
+		       !kvmppc_hv_ops->enable_dawr1(NULL));
+		break;
 #endif
 	default:
 		r = 0;
@@ -2187,6 +2191,12 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			break;
 		r = kvm->arch.kvm_ops->enable_svm(kvm);
 		break;
+	case KVM_CAP_PPC_DAWR1:
+		r = -EINVAL;
+		if (!is_kvmppc_hv_enabled(kvm) || !kvm->arch.kvm_ops->enable_dawr1)
+			break;
+		r = kvm->arch.kvm_ops->enable_dawr1(kvm);
+		break;
 #endif
 	default:
 		r = -EINVAL;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index ca41220b40b8..f1210f99a52d 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_PPC_DAWR1 191
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index ca41220b40b8..f1210f99a52d 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_X86_USER_SPACE_MSR 188
 #define KVM_CAP_X86_MSR_FILTER 189
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
+#define KVM_CAP_PPC_DAWR1 191
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

