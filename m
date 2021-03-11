Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802D336E15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 09:43:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx2XD1P4Kz3dmG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 19:43:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VVDF62TE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VVDF62TE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx2Sr2n86z3cJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 19:40:12 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B8Y1Qn076146; Thu, 11 Mar 2021 03:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0Iib0G42t4KiYX1XmZhbH+ui13/8tYrPjPJwWTnWAhQ=;
 b=VVDF62TENB/GBCsRFCmY3n6BAaQvrUDJUPXJcw0rM11/2GzgHpOv5GhW68n5Mg3GfUat
 +dpY5pC1jFjuRMHRJZUmI1dPeD06q+WfMCnTjw0sEwy3ZuHjkiKENPTjO28H0wxqLs9u
 YHoVy0tjl76fgpf/QcRdFXzBv4Avfc+0KpglKOQB7Es4T4IMfNmKX/RwYOUtyFlTR5fP
 RLt7Y1gWvcnMnmH1fs88dOUn/egusmuvktL5+Msti3HdYBaC8lm1ieH6D7epEWygJjrt
 qUfGqa0PakX77mQAi/JnN1kxgpYwjqTTkT0Uh/2h+jKlNipjfTxjT/9h8Ds1lrr/Uz2z gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774m5ftyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:40:02 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12B8Z15e079397;
 Thu, 11 Mar 2021 03:40:02 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774m5ftxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 03:40:01 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12B8XQ1M006098;
 Thu, 11 Mar 2021 08:40:00 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 376agr0v4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 08:40:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12B8dvfK31523128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 08:39:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21A1852051;
 Thu, 11 Mar 2021 08:39:57 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.77.205.2])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7272752050;
 Thu, 11 Mar 2021 08:39:55 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 5/6] KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE
 capability
Date: Thu, 11 Mar 2021 14:09:38 +0530
Message-Id: <20210311083939.595568-6-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311083939.595568-1-bharata@linux.ibm.com>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_02:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=888 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103110047
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
---
 Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
 arch/powerpc/kvm/powerpc.c     |  3 +++
 include/uapi/linux/kvm.h       |  1 +
 3 files changed, 22 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 1a2b5210cdbf..d769cef5f904 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6227,6 +6227,24 @@ KVM_RUN_BUS_LOCK flag is used to distinguish between them.
 This capability can be used to check / enable 2nd DAWR feature provided
 by POWER10 processor.
 
+7.24 KVM_CAP_PPC_RPT_INVALIDATE
+------------------------------
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
index f6afee209620..2b2370475cec 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1078,6 +1078,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_DIRTY_LOG_RING 192
 #define KVM_CAP_X86_BUS_LOCK_EXIT 193
 #define KVM_CAP_PPC_DAWR1 194
+#define KVM_CAP_PPC_RPT_INVALIDATE 195
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

