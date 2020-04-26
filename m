Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 838061B8AF4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 04:07:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498rs15bHwzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 12:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498rpm6xqQzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 12:05:36 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03Q21VPj072901
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 22:05:33 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30mfbqbnv1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 22:05:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sun, 26 Apr 2020 03:04:51 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 26 Apr 2020 03:04:48 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03Q25QQf46399610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Apr 2020 02:05:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8515A4204B;
 Sun, 26 Apr 2020 02:05:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78EB542056;
 Sun, 26 Apr 2020 02:05:22 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.192.49])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 26 Apr 2020 02:05:22 +0000 (GMT)
Date: Sat, 25 Apr 2020 19:05:18 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.
References: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585211927-784-1-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20042602-0008-0000-0000-00000376F81C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042602-0009-0000-0000-00004A98CBAF
Message-Id: <20200426020518.GC5853@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-25_13:2020-04-24,
 2020-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=48 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004260010
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org, clg@fr.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From 10ea2eaf492ca3f22f67a5a63a2b7865e45299ad Mon Sep 17 00:00:00 2001
From: Ram Pai <linuxram@us.ibm.com>
Date: Mon, 24 Feb 2020 01:09:48 -0500
Subject: [PATCH v3] powerpc/XIVE: SVM: share the event-queue page with the
 Hypervisor.

XIVE interrupt controller uses an Event Queue (EQ) to enqueue event
notifications when an exception occurs. The EQ is a single memory page
provided by the O/S defining a circular buffer, one per server and
priority couple.

On baremetal, the EQ page is configured with an OPAL call. On pseries,
an extra hop is necessary and the guest OS uses the hcall
H_INT_SET_QUEUE_CONFIG to configure the XIVE interrupt controller.

The XIVE controller being Hypervisor privileged, it will not be allowed
to enqueue event notifications for a Secure VM unless the EQ pages are
shared by the Secure VM.

Hypervisor/Ultravisor still requires support for the TIMA and ESB page
fault handlers. Until this is complete, QEMU can use the emulated XIVE
device for Secure VMs, option "kernel_irqchip=off" on the QEMU pseries
machine.

Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: Michael Anderson <andmike@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cedric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>

v3: fix a minor semantics in description.
    and added reviewed-by from Cedric and Greg.
v2: better description of the patch from Cedric.
---
 arch/powerpc/sysdev/xive/spapr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 55dc61c..608b52f 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -26,6 +26,8 @@
 #include <asm/xive.h>
 #include <asm/xive-regs.h>
 #include <asm/hvcall.h>
+#include <asm/svm.h>
+#include <asm/ultravisor.h>
 
 #include "xive-internal.h"
 
@@ -501,6 +503,9 @@ static int xive_spapr_configure_queue(u32 target, struct xive_q *q, u8 prio,
 		rc = -EIO;
 	} else {
 		q->qpage = qpage;
+		if (is_secure_guest())
+			uv_share_page(PHYS_PFN(qpage_phys),
+					1 << xive_alloc_order(order));
 	}
 fail:
 	return rc;
@@ -534,6 +539,8 @@ static void xive_spapr_cleanup_queue(unsigned int cpu, struct xive_cpu *xc,
 		       hw_cpu, prio);
 
 	alloc_order = xive_alloc_order(xive_queue_shift);
+	if (is_secure_guest())
+		uv_unshare_page(PHYS_PFN(__pa(q->qpage)), 1 << alloc_order);
 	free_pages((unsigned long)q->qpage, alloc_order);
 	q->qpage = NULL;
 }
-- 
1.8.3.1

