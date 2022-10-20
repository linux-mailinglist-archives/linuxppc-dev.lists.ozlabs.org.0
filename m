Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F2C606765
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mtb0Q12tnz3dqc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 04:57:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+bZZVbO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g+bZZVbO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtZzQ6S0Cz3042
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 04:56:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KHi2gt009713;
	Thu, 20 Oct 2022 17:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3hiT01nD5TtLtMwsv2ShIrj5BOX8BSgatv+rX0KVDU4=;
 b=g+bZZVbOXhBfyxO67Cx22658yN3D3jFuhXV6WwWfj1ygCQeu1TmYmdspFeU7S4S8dZtP
 L3KlAH2H+Rui9S5mTr5DSyUDf+07IoS/TZ78CKCAubwdn4erOifPHieyg3bzNo3eWI1O
 Gl10Q7CkcqOpL9AEzngUxCUTf48xN4E3RgB+YV5BaYiunSC73XKVY04zXAqSsN9qwGFc
 eZ/nNnliKEXcqdKzOJdhLRIG5lhhI+79mppjxTN0F3uGm35boGMQPr2QlyILIQaExXBX
 b9szwc/OwEgJVGiyktWnSmPh1p0yQmfRAiWwTARKJOUY2uzXtMUNXjoP0P1kFR7f8JVT Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbb07g968-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:56:25 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KHk8SG015893;
	Thu, 20 Oct 2022 17:56:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbb07g93q-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:56:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KHQbxh032019;
	Thu, 20 Oct 2022 17:29:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3kajmrt0k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KHTUCt60293550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 17:29:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97BE242041;
	Thu, 20 Oct 2022 17:29:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C50704203F;
	Thu, 20 Oct 2022 17:29:28 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.39.233])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 17:29:28 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/5] powerpc/kprobes: Use preempt_enable() rather than the no_resched variant
Date: Thu, 20 Oct 2022 22:58:59 +0530
Message-Id: <72639f75fe66f931ec8c2165276ffbfb0fe1006f.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Sr32IqmDhloJzX0dIwmI9KGGpbU-NZtN
X-Proofpoint-ORIG-GUID: 0jBnZRdE4x06VlImNqSdRj1Hu3MosLvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_09,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=820 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210200105
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

preempt_enable_no_resched() is just the same as preempt_enable() when we
are in a irqs disabled context. kprobe_handler() and the post/fault
handlers are all called with irqs disabled. As such, convert those to
just use preempt_enable().

Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 88f42de681e1f8..86ca5a61ea9afb 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -369,7 +369,7 @@ int kprobe_handler(struct pt_regs *regs)
 
 			if (ret > 0) {
 				restore_previous_kprobe(kcb);
-				preempt_enable_no_resched();
+				preempt_enable();
 				return 1;
 			}
 		}
@@ -382,7 +382,7 @@ int kprobe_handler(struct pt_regs *regs)
 	if (p->pre_handler && p->pre_handler(p, regs)) {
 		/* handler changed execution path, so skip ss setup */
 		reset_current_kprobe();
-		preempt_enable_no_resched();
+		preempt_enable();
 		return 1;
 	}
 
@@ -395,7 +395,7 @@ int kprobe_handler(struct pt_regs *regs)
 
 			kcb->kprobe_status = KPROBE_HIT_SSDONE;
 			reset_current_kprobe();
-			preempt_enable_no_resched();
+			preempt_enable();
 			return 1;
 		}
 	}
@@ -404,7 +404,7 @@ int kprobe_handler(struct pt_regs *regs)
 	return 1;
 
 no_kprobe:
-	preempt_enable_no_resched();
+	preempt_enable();
 	return ret;
 }
 NOKPROBE_SYMBOL(kprobe_handler);
@@ -490,7 +490,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 	}
 	reset_current_kprobe();
 out:
-	preempt_enable_no_resched();
+	preempt_enable();
 
 	/*
 	 * if somebody else is singlestepping across a probe point, msr
@@ -529,7 +529,7 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 			restore_previous_kprobe(kcb);
 		else
 			reset_current_kprobe();
-		preempt_enable_no_resched();
+		preempt_enable();
 		break;
 	case KPROBE_HIT_ACTIVE:
 	case KPROBE_HIT_SSDONE:
-- 
2.38.0

