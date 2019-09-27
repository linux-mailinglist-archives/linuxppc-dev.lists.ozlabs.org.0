Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3CC04BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 13:57:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fqzc6hgyzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 21:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fqvN31x5zDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 21:53:52 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RBkgau109691
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 07:53:46 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v9gejb92j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 07:53:45 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Fri, 27 Sep 2019 12:53:44 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 12:53:39 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RBrcum42008656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 11:53:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C77C0A4060;
 Fri, 27 Sep 2019 11:53:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 636E5A405C;
 Fri, 27 Sep 2019 11:53:38 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.172.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 11:53:38 +0000 (GMT)
Subject: [PATCH v2 1/6] KVM: PPC: Book3S HV: XIVE: Set kvm->arch.xive when
 VPs are allocated
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Fri, 27 Sep 2019 13:53:38 +0200
In-Reply-To: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092711-4275-0000-0000-0000036BC508
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092711-4276-0000-0000-0000387E46FB
Message-Id: <156958521804.1503771.3961610486487789036.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270112
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?b?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we cannot allocate the XIVE VPs in OPAL, the creation of a XIVE or
XICS-on-XIVE device is aborted as expected, but we leave kvm->arch.xive
set forever since the release method isn't called in this case. Any
subsequent tentative to create a XIVE or XICS-on-XIVE for this VM will
thus always fail (DoS). This is a problem for QEMU since it destroys
and re-creates these devices when the VM is reset: the VM would be
restricted to using the much slower emulated XIVE or XICS forever.

As an alternative to adding rollback, do not assign kvm->arch.xive before
making sure the XIVE VPs are allocated in OPAL.

Cc: stable@vger.kernel.org # v5.2
Fixes: 5422e95103cf ("KVM: PPC: Book3S HV: XIVE: Replace the 'destroy' method by a 'release' method")
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c        |   11 +++++------
 arch/powerpc/kvm/book3s_xive_native.c |    2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 591bfb4bfd0f..99884662facb 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1997,6 +1997,10 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 
 	pr_devel("Creating xive for partition\n");
 
+	/* Already there ? */
+	if (kvm->arch.xive)
+		return -EEXIST;
+
 	xive = kvmppc_xive_get_device(kvm, type);
 	if (!xive)
 		return -ENOMEM;
@@ -2006,12 +2010,6 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 	xive->kvm = kvm;
 	mutex_init(&xive->lock);
 
-	/* Already there ? */
-	if (kvm->arch.xive)
-		ret = -EEXIST;
-	else
-		kvm->arch.xive = xive;
-
 	/* We use the default queue size set by the host */
 	xive->q_order = xive_native_default_eq_shift();
 	if (xive->q_order < PAGE_SHIFT)
@@ -2031,6 +2029,7 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
 	if (ret)
 		return ret;
 
+	kvm->arch.xive = xive;
 	return 0;
 }
 
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 248c1ea9e788..6b91c74839d5 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1079,7 +1079,6 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
 	dev->private = xive;
 	xive->dev = dev;
 	xive->kvm = kvm;
-	kvm->arch.xive = xive;
 	mutex_init(&xive->mapping_lock);
 	mutex_init(&xive->lock);
 
@@ -1100,6 +1099,7 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
 	if (ret)
 		return ret;
 
+	kvm->arch.xive = xive;
 	return 0;
 }
 

