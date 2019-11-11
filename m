Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BAF7135
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 10:51:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BR3c0zSXzF4fd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 20:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BR1J4fdNzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 20:49:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAB9laoe191657
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 04:49:34 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w74dmt668-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 04:49:33 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Mon, 11 Nov 2019 09:49:32 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 11 Nov 2019 09:49:28 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAB9nRvh35520728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 09:49:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 777474C059;
 Mon, 11 Nov 2019 09:49:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 181CF4C044;
 Mon, 11 Nov 2019 09:49:27 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.184.11])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Nov 2019 09:49:27 +0000 (GMT)
Subject: [PATCH] KVM: PPC: Book3S HV: XIVE: Free previous EQ page when
 setting up a new one
From: Greg Kurz <groug@kaod.org>
To: Paul Mackerras <paulus@ozlabs.org>
Date: Mon, 11 Nov 2019 10:49:26 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19111109-4275-0000-0000-0000037CAF98
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111109-4276-0000-0000-00003890081E
Message-Id: <157346576671.818016.10401178701091199969.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-11_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911110097
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
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
But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG several times
to reset the EQ (vCPU hot unplug) or set a new EQ (guest reboot). In both
cases the EQ page reference is leaked. This is especially visible when
the guest memory is backed with huge pages: start a VM up to the guest
userspace, either reboot it or unplug a vCPU, quit QEMU. The leak is
observed by comparing the value of HugePages_Free in /proc/meminfo before
and after the VM is run.

Note that the EQ reset path seems to be calling put_page() but this is
done after xive_native_configure_queue() which clears the qpage field
in the XIVE queue structure, ie. the put_page() block is a nop and the
previous page pointer was just overwritten anyway. In the other case of
configuring a new EQ page, nothing seems to be done to release the old
one.

Fix both cases by always calling put_page() on the existing EQ page in
kvmppc_xive_native_set_queue_config(). This is a seemless change for the
EQ reset case. However this causes xive_native_configure_queue() to be
called twice for the new EQ page case: one time to reset the EQ and another
time to configure the new page. This is needed because we cannot release
the EQ page before calling xive_native_configure_queue() since it may still
be used by the HW. We cannot modify xive_native_configure_queue() to drop
the reference either because this function is also used by the XICS-on-XIVE
device which requires free_pages() instead of put_page(). This isn't a big
deal anyway since H_INT_SET_QUEUE_CONFIG isn't a hot path.

Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: stable@vger.kernel.org # v5.2
Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ configuration")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/kvm/book3s_xive_native.c |   21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 34bd123fa024..8ab908d23dc2 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -570,10 +570,12 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 		 __func__, server, priority, kvm_eq.flags,
 		 kvm_eq.qshift, kvm_eq.qaddr, kvm_eq.qtoggle, kvm_eq.qindex);
 
-	/* reset queue and disable queueing */
-	if (!kvm_eq.qshift) {
-		q->guest_qaddr  = 0;
-		q->guest_qshift = 0;
+	/*
+	 * Reset queue and disable queueing. It will be re-enabled
+	 * later on if the guest is configuring a new EQ page.
+	 */
+	if (q->guest_qshift) {
+		page = virt_to_page(q->qpage);
 
 		rc = xive_native_configure_queue(xc->vp_id, q, priority,
 						 NULL, 0, true);
@@ -583,12 +585,13 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 			return rc;
 		}
 
-		if (q->qpage) {
-			put_page(virt_to_page(q->qpage));
-			q->qpage = NULL;
-		}
+		put_page(page);
 
-		return 0;
+		if (!kvm_eq.qshift) {
+			q->guest_qaddr  = 0;
+			q->guest_qshift = 0;
+			return 0;
+		}
 	}
 
 	/*

