Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4649B824
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 17:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjs5x4h0xz3dcn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 03:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EL/bPzWl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EL/bPzWl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjs2K2XlRz3bZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 02:58:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PF4BRn013454; 
 Tue, 25 Jan 2022 15:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NSPHZmKHXg/5l8RMTTFnk0IS/q43vkXPPdOgzj1eDmk=;
 b=EL/bPzWlFhR+R6hx9zaZi7Bb83Oya8jrbaRtVO8r1fYc4JQ/ykw5nJnHvhVW8iW1AxEF
 GsfafjbR0NkJhoiRvPxymRM5RRL5kLS4/ysdfDfBcF9C0QoxjwhETUeZBolR3V+KPdla
 xiMqzMgRwSVoTfgtv2X0/IPXslo0TfHk60D/sGFWE2fRyicSHcLkgNIOyL8Cu6yhgc6R
 RccC420FN4UuG0/we7XoRi6EBNQUmYmdOBSxcIlzqAWeZFSWp+BZcAYKQ1O7jUtEYtIN
 XmDD2UbGBwE0a39cgyx4BQX31bIxIrvRyhzFXJg46zlTf+dqS0JIik2SFJOMsErbZDFe uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtk6qt20g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:54 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20PFk4gZ030564;
 Tue, 25 Jan 2022 15:57:53 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dtk6qt1yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:53 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20PFvZGs004441;
 Tue, 25 Jan 2022 15:57:52 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9ja86qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jan 2022 15:57:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20PFvp7d28443008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 15:57:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E21B9C607E;
 Tue, 25 Jan 2022 15:57:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1342FC607C;
 Tue, 25 Jan 2022 15:57:49 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.21.20])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jan 2022 15:57:48 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 4/4] KVM: PPC: Decrement module refcount if init_vm fails
Date: Tue, 25 Jan 2022 12:57:35 -0300
Message-Id: <20220125155735.1018683-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125155735.1018683-1-farosas@linux.ibm.com>
References: <20220125155735.1018683-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DRrXYJsvWdvw7HgszklXWj7ewigCnO9R
X-Proofpoint-GUID: ULIhAa0LTgrnLuDbREGJ_ZuG_R8Uq94q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_03,2022-01-25_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=978 priorityscore=1501 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250100
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We increment the reference count for KVM-HV/PR before the call to
kvmppc_core_init_vm. If that function fails we need to decrement the
refcount.

Also remove the check on kvm_ops->owner because try_module_get can
handle a NULL module.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/powerpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ad0ccd202d5..a6d6d452243f 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -431,6 +431,8 @@ int kvm_arch_check_processor_compat(void *opaque)
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	struct kvmppc_ops *kvm_ops = NULL;
+	int r;
+
 	/*
 	 * if we have both HV and PR enabled, default is HV
 	 */
@@ -452,11 +454,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	} else
 		goto err_out;
 
-	if (kvm_ops->owner && !try_module_get(kvm_ops->owner))
+	if (!try_module_get(kvm_ops->owner))
 		return -ENOENT;
 
 	kvm->arch.kvm_ops = kvm_ops;
-	return kvmppc_core_init_vm(kvm);
+	r = kvmppc_core_init_vm(kvm);
+	if (r)
+		module_put(kvm_ops->owner);
+	return r;
 err_out:
 	return -EINVAL;
 }
-- 
2.34.1

