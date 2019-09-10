Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84210AEC8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 15:58:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SRTK087wzF0c7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 23:58:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SRMm5t9jzF0ZD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 23:53:55 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ADkqa5071748
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 09:53:52 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uxcdu21xn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 09:53:52 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <groug@kaod.org>;
 Tue, 10 Sep 2019 14:53:50 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 14:53:47 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8ADrLQw40173978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 13:53:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ADAF42041;
 Tue, 10 Sep 2019 13:53:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDBC442047;
 Tue, 10 Sep 2019 13:53:45 +0000 (GMT)
Received: from bahia.tls.ibm.com (unknown [9.101.4.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 13:53:45 +0000 (GMT)
Subject: [PATCH] powerpc/xive: Fix bogus error code returned by OPAL
From: Greg Kurz <groug@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Sep 2019 15:53:45 +0200
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091013-0012-0000-0000-00000349863E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091013-0013-0000-0000-00002183EB19
Message-Id: <156812362556.1866243.7399893138425681517.stgit@bahia.tls.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=799 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100136
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
on the field.

Internally convert 0xffffffff to OPAL_RESOURCE which is the usual error
returned upon resource exhaustion.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 arch/powerpc/sysdev/xive/native.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 37987c815913..c35583f84f9f 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -231,6 +231,15 @@ static bool xive_native_match(struct device_node *node)
 	return of_device_is_compatible(node, "ibm,opal-xive-vc");
 }
 
+static int64_t opal_xive_allocate_irq_fixup(uint32_t chip_id)
+{
+	s64 irq = opal_xive_allocate_irq(chip_id);
+
+#define XIVE_ALLOC_NO_SPACE	0xffffffff /* No possible space */
+	return
+		irq == XIVE_ALLOC_NO_SPACE ? OPAL_RESOURCE : irq;
+}
+
 #ifdef CONFIG_SMP
 static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
@@ -238,7 +247,7 @@ static int xive_native_get_ipi(unsigned int cpu, struct xive_cpu *xc)
 
 	/* Allocate an IPI and populate info about it */
 	for (;;) {
-		irq = opal_xive_allocate_irq(xc->chip_id);
+		irq = opal_xive_allocate_irq_fixup(xc->chip_id);
 		if (irq == OPAL_BUSY) {
 			msleep(OPAL_BUSY_DELAY_MS);
 			continue;
@@ -259,7 +268,7 @@ u32 xive_native_alloc_irq(void)
 	s64 rc;
 
 	for (;;) {
-		rc = opal_xive_allocate_irq(OPAL_XIVE_ANY_CHIP);
+		rc = opal_xive_allocate_irq_fixup(OPAL_XIVE_ANY_CHIP);
 		if (rc != OPAL_BUSY)
 			break;
 		msleep(OPAL_BUSY_DELAY_MS);

