Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA68FB594
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 17:51:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CrGS4QdFzF6Q3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 03:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cr9L2gjTzF6c1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 03:46:30 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADGTd37097967
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:46:27 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8kmw6cc9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:46:27 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 13 Nov 2019 16:46:24 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Nov 2019 16:46:21 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xADGkK5f52297870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 16:46:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC5552052;
 Wed, 13 Nov 2019 16:46:20 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.184.11])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 96AE75204F;
 Wed, 13 Nov 2019 16:46:19 +0000 (GMT)
Subject: [PATCH v2 2/2] KVM: PPC: Book3S HV: XIVE: Fix potential page leak
 on error path
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Wed, 13 Nov 2019 17:46:19 +0100
In-Reply-To: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
References: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111316-0008-0000-0000-0000032EBB34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111316-0009-0000-0000-00004A4DC605
Message-Id: <157366357929.1026356.18181561111939034621.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=863 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911130146
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Lijun Pan <ljp@linux.ibm.com>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We need to check the host page size is big enough to accomodate the
EQ. Let's do this before taking a reference on the EQ page to avoid
a potential leak if the check fails.

Cc: stable@vger.kernel.org # v5.2
Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ configuration")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive_native.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 0e1fc5a16729..d83adb1e1490 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -630,12 +630,6 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 	gfn = gpa_to_gfn(kvm_eq.qaddr);
-	page = gfn_to_page(kvm, gfn);
-	if (is_error_page(page)) {
-		srcu_read_unlock(&kvm->srcu, srcu_idx);
-		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
-		return -EINVAL;
-	}
 
 	page_size = kvm_host_page_size(kvm, gfn);
 	if (1ull << kvm_eq.qshift > page_size) {
@@ -644,6 +638,13 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 		return -EINVAL;
 	}
 
+	page = gfn_to_page(kvm, gfn);
+	if (is_error_page(page)) {
+		srcu_read_unlock(&kvm->srcu, srcu_idx);
+		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
+		return -EINVAL;
+	}
+
 	qaddr = page_to_virt(page) + (kvm_eq.qaddr & ~PAGE_MASK);
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 

