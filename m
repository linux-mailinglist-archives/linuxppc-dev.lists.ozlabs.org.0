Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5798C3AE54E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 10:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7jwb069Nz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 18:53:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=daT2h+uC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=daT2h+uC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7jsg3ZFVz306T
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 18:50:31 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15L8Xs30004362; Mon, 21 Jun 2021 04:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ISvNcEd2JsrCWWL1NU7em9702MqvULuOz+DzNlwjbWg=;
 b=daT2h+uClSzGx61Pe8eQCAOdR/vGLPBY2Q46SEQZG94JHkiDCVKgHN0FUbmWJ/ZFG6ez
 07ETjZFPcFjXfYxNErrTrWxdojRAqI2wV/eI/ipXFblPLsWy/byig9QGp3d85/oxHXmy
 Wg78IH0spf44f2FmVjTZJddtlPyHMrkY/UbwH68X3pmv+N+BzrtCAiNlxNm2xZF7tkM7
 oD70aaR+eWtKkTlITnFsBKU3OXoiLf9E+Vx18gUxjs/a+Gb2nIYmFhbA+xAspg1MD3RP
 Vmpf6jmhZ3LEtTkaNYxu7okLOtMQFFtMFW6bGkxfBlK1R/feiOXjelyISWVrzqBjhSa3 ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39am8kdxw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:25 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15L8YE3r005694;
 Mon, 21 Jun 2021 04:50:24 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39am8kdxv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 04:50:24 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15L8n2Zl001869;
 Mon, 21 Jun 2021 08:50:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 399878rdw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 08:50:22 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15L8oJaX34013662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 08:50:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CF97A4051;
 Mon, 21 Jun 2021 08:50:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECBE5A4040;
 Mon, 21 Jun 2021 08:50:17 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.82.83])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 08:50:17 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 5/6] KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE
 capability
Date: Mon, 21 Jun 2021 14:20:02 +0530
Message-Id: <20210621085003.904767-6-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621085003.904767-1-bharata@linux.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rHKxfEGi3fQFvNIGGtbf_GdN3i2FdkbO
X-Proofpoint-GUID: LJrkrrceybHqRQp_JTa5fPuh9LjPCck2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_03:2021-06-20,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=990
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210049
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we have H_RPT_INVALIDATE fully implemented, enable
support for the same via KVM_CAP_PPC_RPT_INVALIDATE KVM capability

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
 arch/powerpc/kvm/powerpc.c     |  3 +++
 include/uapi/linux/kvm.h       |  1 +
 3 files changed, 22 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 7fcb2fd38f42..9977e845633f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6362,6 +6362,24 @@ default.
 
 See Documentation/x86/sgx/2.Kernel-internals.rst for more details.
 
+7.26 KVM_CAP_PPC_RPT_INVALIDATE
+-------------------------------
+
+:Capability: KVM_CAP_PPC_RPT_INVALIDATE
+:Architectures: ppc
+:Type: vm
+
+This capability indicates that the kernel is capable of handling
+H_RPT_INVALIDATE hcall.
+
+In order to enable the use of H_RPT_INVALIDATE in the guest,
+user space might have to advertise it for the guest. For example,
+IBM pSeries (sPAPR) guest starts using it if "hcall-rpt-invalidate" is
+present in the "ibm,hypertas-functions" device-tree property.
+
+This capability is enabled for hypervisors on platforms like POWER9
+that support radix MMU.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index a2a68a958fa0..be33b5321a76 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -682,6 +682,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = !!(hv_enabled && kvmppc_hv_ops->enable_dawr1 &&
 		       !kvmppc_hv_ops->enable_dawr1(NULL));
 		break;
+	case KVM_CAP_PPC_RPT_INVALIDATE:
+		r = 1;
+		break;
 #endif
 	default:
 		r = 0;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 79d9c44d1ad7..9016e96de971 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1083,6 +1083,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SGX_ATTRIBUTE 196
 #define KVM_CAP_VM_COPY_ENC_CONTEXT_FROM 197
 #define KVM_CAP_PTP_KVM 198
+#define KVM_CAP_PPC_RPT_INVALIDATE 199
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.31.1

