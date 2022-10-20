Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C712260670E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtZQD50WJz3dwZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 04:31:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ay/4fvJX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ay/4fvJX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtZNM3v9rz3cBS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 04:29:39 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KHGF1N013838;
	Thu, 20 Oct 2022 17:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BgLXOeh3J9OwnAd5HXuf84ndTWq4sGB8lNJNo4cBBgI=;
 b=Ay/4fvJXQlyj4KEUMohP7UMAKsrQe2B5Tu58PMe5Eu0BdOUjYZpKQq9nuhy46CAAlWYK
 Y2nQJ9PBu4ZBxitbM3YFpx6rzampilQkQ2/BMKlxHGbZcrua+PbG/cHqAUdIMI+TrZhh
 Jgo1QqGmvpYQDJQUEmm7JLbJCZ4lwKMOdqOEv/WB7jz59v/xYPxQeqC9I6YW4Yrs2Jik
 ff4HdsAYWPzzlOsPayK0z/VXNwnBuenJWECiau0E4ORduRVlcZoMjndnp02GsPQ+8AWT
 cGwdwFTVRnI/dKwvQg/Vc5VqRQBfCYrkWbRNVs+MSTEahhQs5+tIs+93jFKKj7KfWaip xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbak4gcjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:29 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29KHLRdi012083;
	Thu, 20 Oct 2022 17:29:29 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbak4gcj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:29 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29KHQaOO028167;
	Thu, 20 Oct 2022 17:29:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3k99fn4ft9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 17:29:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29KHTPJo58655192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 17:29:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B36542042;
	Thu, 20 Oct 2022 17:29:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 432444203F;
	Thu, 20 Oct 2022 17:29:23 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.39.233])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 17:29:23 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/5] powerpc/kprobes: Remove preempt disable around call to get_kprobe() in arch_prepare_kprobe()
Date: Thu, 20 Oct 2022 22:58:57 +0530
Message-Id: <1043d06a0affed83a4a46dd29466e72820ee215d.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R0Pvy52R4LCeLcRCxkTZxFaLaWEjchZC
X-Proofpoint-ORIG-GUID: UVB_mJd3HxgZMpWfMrDEuX4QbNezVhZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_08,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=580 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210200101
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

arch_prepare_kprobe() is called from register_kprobe() via
prepare_kprobe(), or through register_aggr_kprobe(), both with the
kprobe_mutex held. Per the comment for get_kprobe():
  /*
   * This routine is called either:
   *	- under the 'kprobe_mutex' - during kprobe_[un]register().
   *				OR
   *	- with preemption disabled - from architecture specific code.
   */

As such, there is no need to disable preemption around the call to
get_kprobe(). Drop the same.

Reported-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index bd7b1a03545948..88f42de681e1f8 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -158,9 +158,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
 		ret = -EINVAL;
 	}
-	preempt_disable();
 	prev = get_kprobe(p->addr - 1);
-	preempt_enable_no_resched();
 
 	/*
 	 * When prev is a ftrace-based kprobe, we don't have an insn, and it
-- 
2.38.0

