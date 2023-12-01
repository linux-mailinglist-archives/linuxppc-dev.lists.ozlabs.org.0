Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58799800BF1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:28:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3IvISyq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShYmB5vl0z3dSW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 00:28:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3IvISyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShYkT3Xdkz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 00:26:57 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1DCLa6031369;
	Fri, 1 Dec 2023 13:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=A/ZDY3iMXTmlBTkd0T3nTIBxZ02YQ1nU+CkMmTJwzDQ=;
 b=b3IvISyq/i4tQwQwdMCAZ6vAFo4l5iVkevRCc7hYFohDi5REiLQYN/zx7EtIUqkzn8tj
 P9R9t+hO+880JaA6cAAY+m7fUWVWEb/RZEBSh0CG/vER5l46TUf8HmyT4EOFCyYpXJV1
 dqRz0ZgiIjnnDOPG/Vov2IDqakwqb8s/VL3h6EjRbx5zw8e0XuTDPKDXGwtCp8HMVgRP
 O9xgzP/GY7+D0EROdXE4P33UEHfBHHbiqzc1lv5qWf6ezRhMWSPWGSnxXHf28Ga9+H84
 SXIuMvQqARN9j4DYKCqOLffXKDgwtdHvQTtTcPlG3VO858pyT9+oGj6dw/8nRKzAhNJJ LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg5pgas2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:26:42 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B1DNCjG004385;
	Fri, 1 Dec 2023 13:26:41 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uqg5pgard-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:26:41 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B1AXo7a006360;
	Fri, 1 Dec 2023 13:26:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfkmu5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 13:26:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B1DQXfL43450710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 13:26:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D93E20043;
	Fri,  1 Dec 2023 13:26:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C20E20040;
	Fri,  1 Dec 2023 13:26:29 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.33.138])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  1 Dec 2023 13:26:29 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 01 Dec 2023 18:56:28 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: [PATCH 01/12] KVM: PPC: Book3S HV nestedv2: Invalidate RPT before deleting a guest
Date: Fri,  1 Dec 2023 18:56:06 +0530
Message-ID: <20231201132618.555031-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201132618.555031-1-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1FsD7gW8GMcu76CTNudWKZfhyK5ZJnxd
X-Proofpoint-ORIG-GUID: 1yVRbjODkfjdMlILvYtysiI1THkeTetq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_11,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=802 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010092
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

From: Jordan Niethe <jniethe5@gmail.com>

An L0 must invalidate the L2's RPT during H_GUEST_DELETE if this has not
already been done. This is a slow operation that means H_GUEST_DELETE
must return H_BUSY multiple times before completing. Invalidating the
tables before deleting the guest so there is less work for the L0 to do.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s.h | 1 +
 arch/powerpc/kvm/book3s_hv.c          | 6 ++++--
 arch/powerpc/kvm/book3s_hv_nested.c   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 4f527d09c92b..a37736ed3728 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -302,6 +302,7 @@ void kvmhv_nested_exit(void);
 void kvmhv_vm_nested_init(struct kvm *kvm);
 long kvmhv_set_partition_table(struct kvm_vcpu *vcpu);
 long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu);
+void kvmhv_flush_lpid(u64 lpid);
 void kvmhv_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1);
 void kvmhv_release_all_nested(struct kvm *kvm);
 long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1ed6ec140701..5543e8490cd9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5691,10 +5691,12 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
 			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
 	}
 
-	if (kvmhv_is_nestedv2())
+	if (kvmhv_is_nestedv2()) {
+		kvmhv_flush_lpid(kvm->arch.lpid);
 		plpar_guest_delete(0, kvm->arch.lpid);
-	else
+	} else {
 		kvmppc_free_lpid(kvm->arch.lpid);
+	}
 
 	kvmppc_free_pimap(kvm);
 }
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 3b658b8696bc..5c375ec1a3c6 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -503,7 +503,7 @@ void kvmhv_nested_exit(void)
 	}
 }
 
-static void kvmhv_flush_lpid(u64 lpid)
+void kvmhv_flush_lpid(u64 lpid)
 {
 	long rc;
 
-- 
2.42.0

