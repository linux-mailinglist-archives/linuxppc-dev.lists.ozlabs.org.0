Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F39606710
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtZRF7459z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 04:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNRQDYwl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bNRQDYwl;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtZNQ02Tvz3cfX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 04:29:41 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KHHofE002689;
	Thu, 20 Oct 2022 17:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xo2Bdoz2C5Kpdz9c8nWn61vVn+Ck1rCa3VBFs6+sayU=;
 b=bNRQDYwl0yn/n540juITarSDUeh+a3TKCFGBieDoBVl8NncdCl4GzBhf+DpLoJQRaCOI
 8RTsfEm1XAp2nNmcH3nVVGbiU/RZD6C9N/D+J8/XT4KVJqUDstPMqIhaekASKwN8Ml7c
 mxjoUto45OizYVVYkkvuKzbZPX5pIKWR+kN4VsHxd7xrcBjB612Rn3B7m74ViywvA4EV
 72eeUAQDfVStIesL1gugPahN6XPI43KAXFLAGOi5sAEnbUIvvzdLijFaoSNsHCSPVElm
 6LKsORh3iHFKUaTfNQHant7RHDz5dQ0WbzDcYStnxKeKl8a1WSOfj588iIFIhgtyBKxm 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbakrgav5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KHJ9cG007024;
	Thu, 20 Oct 2022 17:29:32 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbakrgauf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KHPFIs001112;
	Thu, 20 Oct 2022 17:29:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3k7mg99ac0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KHTSjc3342910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 17:29:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66DEE42041;
	Thu, 20 Oct 2022 17:29:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ECB34203F;
	Thu, 20 Oct 2022 17:29:26 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.39.233])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 17:29:26 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/5] powerpc/kprobes: Have optimized_callback() use preempt_enable()
Date: Thu, 20 Oct 2022 22:58:58 +0530
Message-Id: <1885bab182626c33d9bf6421f430abf924c521a5.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qvBBeEvkmnIqvL56mtmgNuUY_xpWPHQF
X-Proofpoint-GUID: tBRO53VxRts5c5yvV-p96FlltDD6DRV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_08,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=930 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200101
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to x86 commit 2e62024c265aa6 ("kprobes/x86: Use preempt_enable()
in optimized_callback()"), change powerpc optprobes to use
preempt_enable() rather than preempt_enable_no_resched() since powerpc
also removed irq disabling for optprobes in commit f72180cc93a2c6
("powerpc/kprobes: Do not disable interrupts for optprobes and
kprobes_on_ftrace").

Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/optprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 3b1c2236cbee57..004fae2044a3e0 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -112,7 +112,7 @@ static void optimized_callback(struct optimized_kprobe *op,
 		__this_cpu_write(current_kprobe, NULL);
 	}
 
-	preempt_enable_no_resched();
+	preempt_enable();
 }
 NOKPROBE_SYMBOL(optimized_callback);
 
-- 
2.38.0

