Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DE412D2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 05:13:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD61k6R2Tz2ypP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 13:12:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aM5/RGR9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aM5/RGR9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD60z2xHvz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 13:12:18 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L1iLKZ021226
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LLTkiXzF7swHtnsnx46FjpmZEjnjbWu3M0vn/YMuz40=;
 b=aM5/RGR9PXoHqKeXLJ43tWBR02xJMIR3gCBwoolVKTXj27wrmP5wUiNGhNiFk0C8A4a+
 QIZNDd79AOGrpn3clCXl2LMDCn6LKYd2G3bRLZB8SNIMJh8vROiBd20Unvg9POmHLaSe
 GGHXhMONSogYzj3BpDLkZl+yHIcBGogQwVXdM82vJS/rqe7sHW2jEABswvKRjxewtuc3
 WR4WBVYWWwzTejSZrR8fL2lWhwD6hefk9GsSDqLb5jo579TmwbiZjmyJHc1H+Z5tFBSo
 JLZd0ezvaoItos1hsiOcGiE66evVIAjTLRlllkXYCZdHqit53LwgZN4UhrXReXcmHGBk YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w69rvrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:12:16 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18L3CFce012325
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:12:15 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w69rvr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 23:12:15 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18L378Z7022814;
 Tue, 21 Sep 2021 03:12:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3b57rah5nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 03:12:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18L3CEil16974140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 03:12:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41EB9124055;
 Tue, 21 Sep 2021 03:12:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9A5A12405A;
 Tue, 21 Sep 2021 03:12:13 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Sep 2021 03:12:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Date: Mon, 20 Sep 2021 22:12:13 -0500
Message-Id: <20210921031213.2029824-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -rOQtpARxrfV2IFgvEJnJylD5n6doH-d
X-Proofpoint-ORIG-GUID: dA1KM9dTEBAlxufnTO-h7zCyjuR69Av8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_11,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=814 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109210017
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vcpu_is_preempted() can be used outside of preempt-disabled critical
sections, yielding warnings such as:

BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
caller is rwsem_spin_on_owner+0x1cc/0x2d0
CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
Call Trace:
[c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
[c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
[c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
[c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
[c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
[c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
[c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
[c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
[c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250

The result of vcpu_is_preempted() is always subject to invalidation by
events inside and outside of Linux; it's just a best guess at a point in
time. Use raw_smp_processor_id() to avoid such warnings.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")
---
 arch/powerpc/include/asm/paravirt.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index bcb7b5f917be..e429aca566de 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -97,7 +97,14 @@ static inline bool vcpu_is_preempted(int cpu)
 
 #ifdef CONFIG_PPC_SPLPAR
 	if (!is_kvm_guest()) {
-		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
+		int first_cpu;
+
+		/*
+		 * This is only a guess at best, and this function may be
+		 * called with preemption enabled. Using raw_smp_processor_id()
+		 * does not damage accuracy.
+		 */
+		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());
 
 		/*
 		 * Preemption can only happen at core granularity. This CPU
-- 
2.31.1

