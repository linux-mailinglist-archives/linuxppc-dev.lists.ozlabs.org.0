Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7010A3A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 18:54:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ms3n2GMnzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 04:54:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=leonardo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ms1d1nb6zDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:52:36 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQHnISc145507; Tue, 26 Nov 2019 12:52:24 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wh4yrb92v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 12:52:24 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAQHnNLg145900;
 Tue, 26 Nov 2019 12:52:24 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wh4yrb92c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 12:52:23 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQHpCNQ029315;
 Tue, 26 Nov 2019 17:52:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2wevd6mk8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:52:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQHqLow36438320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 17:52:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C22A0C6055;
 Tue, 26 Nov 2019 17:52:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E9B2C6059;
 Tue, 26 Nov 2019 17:52:19 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.137])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Nov 2019 17:52:19 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after release' of
 kvm
Date: Tue, 26 Nov 2019 14:52:12 -0300
Message-Id: <20191126175212.377171-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_05:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=2
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911260149
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
Cc: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Leonardo Bras <leonardo@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes a possible 'use after free' of kvm variable.
It does use mutex_unlock(&kvm->lock) after possible freeing a variable
with kvm_put_kvm(kvm).

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_64_vio.c | 3 +--
 virt/kvm/kvm_main.c              | 8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 5834db0a54c6..a402ead833b6 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -316,14 +316,13 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 
 	if (ret >= 0)
 		list_add_rcu(&stt->list, &kvm->arch.spapr_tce_tables);
-	else
-		kvm_put_kvm(kvm);
 
 	mutex_unlock(&kvm->lock);
 
 	if (ret >= 0)
 		return ret;
 
+	kvm_put_kvm(kvm);
 	kfree(stt);
  fail_acct:
 	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 13efc291b1c7..f37089b60d09 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2744,10 +2744,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	/* Now it's all set up, let userspace reach it */
 	kvm_get_kvm(kvm);
 	r = create_vcpu_fd(vcpu);
-	if (r < 0) {
-		kvm_put_kvm(kvm);
+	if (r < 0)
 		goto unlock_vcpu_destroy;
-	}
 
 	kvm->vcpus[atomic_read(&kvm->online_vcpus)] = vcpu;
 
@@ -2771,6 +2769,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
 	mutex_unlock(&kvm->lock);
+	if (r < 0)
+		kvm_put_kvm(kvm);
 	return r;
 }
 
@@ -3183,10 +3183,10 @@ static int kvm_ioctl_create_device(struct kvm *kvm,
 	kvm_get_kvm(kvm);
 	ret = anon_inode_getfd(ops->name, &kvm_device_fops, dev, O_RDWR | O_CLOEXEC);
 	if (ret < 0) {
-		kvm_put_kvm(kvm);
 		mutex_lock(&kvm->lock);
 		list_del(&dev->vm_node);
 		mutex_unlock(&kvm->lock);
+		kvm_put_kvm(kvm);
 		ops->destroy(dev);
 		return ret;
 	}
-- 
2.23.0

