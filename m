Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93BBADD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 08:31:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cDxN5bNmzDqGt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 16:31:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cDvL2HS6zDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 16:29:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8N6RdHg026707
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 02:29:46 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6nf0wmn0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 02:29:46 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Mon, 23 Sep 2019 07:29:44 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 07:29:41 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8N6TevJ38666358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 06:29:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F5524C046;
 Mon, 23 Sep 2019 06:29:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FA1E4C04A;
 Mon, 23 Sep 2019 06:29:40 +0000 (GMT)
Received: from bahia.lan (unknown [9.145.22.84])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 06:29:40 +0000 (GMT)
Subject: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
From: Greg Kurz <groug@kaod.org>
To: Sasha Levin <sashal@kernel.org>
Date: Mon, 23 Sep 2019 08:29:40 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092306-4275-0000-0000-00000369E8E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092306-4276-0000-0000-0000387C5BA7
Message-Id: <156922009207.910857.10785273696571088534.stgit@bahia.lan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=967 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230063
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
Cc: Greg KH <greg@kroah.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/156821713818.1985334.14123187368108582810.stgit@bahia.lan
(cherry picked from commit 6ccb4ac2bf8a35c694ead92f8ac5530a16e8f2c8,
 groug: fix arch/powerpc/platforms/powernv/opal-wrappers.S instead of
        non-existing arch/powerpc/platforms/powernv/opal-call.c)
Signed-off-by: Greg Kurz <groug@kaod.org>
---

This is for 4.14 and 4.19.

 arch/powerpc/include/asm/opal.h                |    2 +-
 arch/powerpc/platforms/powernv/opal-wrappers.S |    2 +-
 arch/powerpc/sysdev/xive/native.c              |   11 +++++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 8eb3ebca02df..163970c56e2f 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -266,7 +266,7 @@ int64_t opal_xive_get_vp_info(uint64_t vp,
 int64_t opal_xive_set_vp_info(uint64_t vp,
 			      uint64_t flags,
 			      uint64_t report_cl_pair);
-int64_t opal_xive_allocate_irq(uint32_t chip_id);
+int64_t opal_xive_allocate_irq_raw(uint32_t chip_id);
 int64_t opal_xive_free_irq(uint32_t girq);
 int64_t opal_xive_sync(uint32_t type, uint32_t id);
 int64_t opal_xive_dump(uint32_t type, uint32_t id);
diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
index 8c1ede2d3f7e..b12a75a0ee8b 100644
--- a/arch/powerpc/platforms/powernv/opal-wrappers.S
+++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
@@ -301,7 +301,7 @@ OPAL_CALL(opal_xive_set_queue_info,		OPAL_XIVE_SET_QUEUE_INFO);
 OPAL_CALL(opal_xive_donate_page,		OPAL_XIVE_DONATE_PAGE);
 OPAL_CALL(opal_xive_alloc_vp_block,		OPAL_XIVE_ALLOCATE_VP_BLOCK);
 OPAL_CALL(opal_xive_free_vp_block,		OPAL_XIVE_FREE_VP_BLOCK);
-OPAL_CALL(opal_xive_allocate_irq,		OPAL_XIVE_ALLOCATE_IRQ);
+OPAL_CALL(opal_xive_allocate_irq_raw,		OPAL_XIVE_ALLOCATE_IRQ);
 OPAL_CALL(opal_xive_free_irq,			OPAL_XIVE_FREE_IRQ);
 OPAL_CALL(opal_xive_get_vp_info,		OPAL_XIVE_GET_VP_INFO);
 OPAL_CALL(opal_xive_set_vp_info,		OPAL_XIVE_SET_VP_INFO);
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 0f89ee557b04..aac61374afeb 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -234,6 +234,17 @@ static bool xive_native_match(struct device_node *node)
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

