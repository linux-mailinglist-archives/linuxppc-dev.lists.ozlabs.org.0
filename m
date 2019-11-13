Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01567FB58A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 17:48:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CrCd57bDzF3Dl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 03:48:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cr9H18s2zF6c1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 03:46:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xADGTHgr024912
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:46:21 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w8nb18yvy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:46:21 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 13 Nov 2019 16:46:18 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Nov 2019 16:46:15 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xADGkEVo46203060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 16:46:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48D984C050;
 Wed, 13 Nov 2019 16:46:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFA974C044;
 Wed, 13 Nov 2019 16:46:13 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.184.11])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Nov 2019 16:46:13 +0000 (GMT)
Subject: [PATCH v2 1/2] KVM: PPC: Book3S HV: XIVE: Free previous EQ page
 when setting up a new one
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Wed, 13 Nov 2019 17:46:13 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111316-0008-0000-0000-0000032EBB32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111316-0009-0000-0000-00004A4DC604
Message-Id: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
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

The EQ page is allocated by the guest and then passed to the hypervisor
with the H_INT_SET_QUEUE_CONFIG hcall. A reference is taken on the page
before handing it over to the HW. This reference is dropped either when
the guest issues the H_INT_RESET hcall or when the KVM device is released.
But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG several times,
either to reset the EQ (vCPU hot unplug) or to set a new EQ (guest reboot).
In both cases the existing EQ page reference is leaked because we simply
overwrite it in the XIVE queue structure without calling put_page().

This is especially visible when the guest memory is backed with huge pages:
start a VM up to the guest userspace, either reboot it or unplug a vCPU,
quit QEMU. The leak is observed by comparing the value of HugePages_Free in
/proc/meminfo before and after the VM is run.

Ideally we'd want the XIVE code to handle the EQ page de-allocation at the
platform level. This isn't the case right now because the various XIVE
drivers have different allocation needs. It could maybe worth introducing
hooks for this purpose instead of exposing XIVE internals to the drivers,
but this is certainly a huge work to be done later.

In the meantime, for easier backport, fix both vCPU unplug and guest reboot
leaks by introducing a wrapper around xive_native_configure_queue() that
does the necessary cleanup.

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: stable@vger.kernel.org # v5.2
Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ configuration")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: use wrapper as suggested by Cedric
---
 arch/powerpc/kvm/book3s_xive_native.c |   31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 34bd123fa024..0e1fc5a16729 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -50,6 +50,24 @@ static void kvmppc_xive_native_cleanup_queue(struct kvm_vcpu *vcpu, int prio)
 	}
 }
 
+static int kvmppc_xive_native_configure_queue(u32 vp_id, struct xive_q *q,
+					      u8 prio, __be32 *qpage,
+					      u32 order, bool can_escalate)
+{
+	int rc;
+	__be32 *qpage_prev = q->qpage;
+
+	rc = xive_native_configure_queue(vp_id, q, prio, qpage, order,
+					 can_escalate);
+	if (rc)
+		return rc;
+
+	if (qpage_prev)
+		put_page(virt_to_page(qpage_prev));
+
+	return rc;
+}
+
 void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
@@ -575,19 +593,14 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 		q->guest_qaddr  = 0;
 		q->guest_qshift = 0;
 
-		rc = xive_native_configure_queue(xc->vp_id, q, priority,
-						 NULL, 0, true);
+		rc = kvmppc_xive_native_configure_queue(xc->vp_id, q, priority,
+							NULL, 0, true);
 		if (rc) {
 			pr_err("Failed to reset queue %d for VCPU %d: %d\n",
 			       priority, xc->server_num, rc);
 			return rc;
 		}
 
-		if (q->qpage) {
-			put_page(virt_to_page(q->qpage));
-			q->qpage = NULL;
-		}
-
 		return 0;
 	}
 
@@ -646,8 +659,8 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 	  * OPAL level because the use of END ESBs is not supported by
 	  * Linux.
 	  */
-	rc = xive_native_configure_queue(xc->vp_id, q, priority,
-					 (__be32 *) qaddr, kvm_eq.qshift, true);
+	rc = kvmppc_xive_native_configure_queue(xc->vp_id, q, priority,
+					(__be32 *) qaddr, kvm_eq.qshift, true);
 	if (rc) {
 		pr_err("Failed to configure queue %d for VCPU %d: %d\n",
 		       priority, xc->server_num, rc);

