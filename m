Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74FB01AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:33:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6sY1HNdzF3n9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:33:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T5y74MKczF3XB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 01:52:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BFq79u020668
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:52:25 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy3s98cr2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:52:25 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Wed, 11 Sep 2019 16:52:23 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 16:52:19 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BFqI8A49741954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 15:52:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C220652063;
 Wed, 11 Sep 2019 15:52:18 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.58.141])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 832F952054;
 Wed, 11 Sep 2019 15:52:18 +0000 (GMT)
Subject: [PATCH v2] powerpc/xive: Fix bogus error code returned by OPAL
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 11 Sep 2019 17:52:18 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091115-0016-0000-0000-000002AA163A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091115-0017-0000-0000-0000330AA387
Message-Id: <156821713818.1985334.14123187368108582810.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=766 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110144
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a bug in skiboot that causes the OPAL_XIVE_ALLOCATE_IRQ call
to return the 32-bit value 0xffffffff when OPAL has run out of IRQs.
Unfortunatelty, OPAL return values are signed 64-bit entities and
errors are supposed to be negative. If that happens, the linux code
confusingly treats 0xffffffff as a valid IRQ number and panics at some
point.

A fix was recently merged in skiboot:

e97391ae2bb5 ("xive: fix return value of opal_xive_allocate_irq()")

but we need a workaround anyway to support older skiboots already
in the field.

Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
returned upon resource exhaustion.

Cc: stable@vger.kernel.org # v4.12+
Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - fix syntax error in changelog
    - Cc stable
    - rename original OPAL wrapper
    - rewrite fixup wrapper (style, use s64 and u32)
---
 arch/powerpc/include/asm/opal.h            |    2 +-
 arch/powerpc/platforms/powernv/opal-call.c |    2 +-
 arch/powerpc/sysdev/xive/native.c          |   11 +++++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 57bd029c715e..d5a0807d21db 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -272,7 +272,7 @@ int64_t opal_xive_get_vp_info(uint64_t vp,
 int64_t opal_xive_set_vp_info(uint64_t vp,
 			      uint64_t flags,
 			      uint64_t report_cl_pair);
-int64_t opal_xive_allocate_irq(uint32_t chip_id);
+int64_t opal_xive_allocate_irq_raw(uint32_t chip_id);
 int64_t opal_xive_free_irq(uint32_t girq);
 int64_t opal_xive_sync(uint32_t type, uint32_t id);
 int64_t opal_xive_dump(uint32_t type, uint32_t id);
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 29ca523c1c79..dccdc9df5213 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -257,7 +257,7 @@ OPAL_CALL(opal_xive_set_queue_info,		OPAL_XIVE_SET_QUEUE_INFO);
 OPAL_CALL(opal_xive_donate_page,		OPAL_XIVE_DONATE_PAGE);
 OPAL_CALL(opal_xive_alloc_vp_block,		OPAL_XIVE_ALLOCATE_VP_BLOCK);
 OPAL_CALL(opal_xive_free_vp_block,		OPAL_XIVE_FREE_VP_BLOCK);
-OPAL_CALL(opal_xive_allocate_irq,		OPAL_XIVE_ALLOCATE_IRQ);
+OPAL_CALL(opal_xive_allocate_irq_raw,		OPAL_XIVE_ALLOCATE_IRQ);
 OPAL_CALL(opal_xive_free_irq,			OPAL_XIVE_FREE_IRQ);
 OPAL_CALL(opal_xive_get_vp_info,		OPAL_XIVE_GET_VP_INFO);
 OPAL_CALL(opal_xive_set_vp_info,		OPAL_XIVE_SET_VP_INFO);
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 37987c815913..ad8ee7dd7f57 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -231,6 +231,17 @@ static bool xive_native_match(struct device_node *node)
 	return of_device_is_compatible(node, "ibm,opal-xive-vc");
 }
 
+static s64 opal_xive_allocate_irq(u32 chip_id)
+{
+	s64 irq = opal_xive_allocate_irq_raw(chip_id);
+
+	/*
+	 * Old versions of skiboot can incorrectly return 0xffffffff to
+	 * indicate no space, fix it up here.
+	 */
+	return irq == 0xffffffff ? OPAL_RESOURCE : irq;
+}
+
 #ifdef CONFIG_SMP
 static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
 {

