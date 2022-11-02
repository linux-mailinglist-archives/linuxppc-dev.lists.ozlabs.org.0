Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7546170D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:47:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hqc0JdWz3cGZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qjMcr3T8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qjMcr3T8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hnc6C1jz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 09:46:12 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2MdJEj012195;
	Wed, 2 Nov 2022 22:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6fY84lVQWnXDfe5/YGOfNEereqdAz0d6w9o3518OCd4=;
 b=qjMcr3T8gPyDJPrljbabK35e5Dkx00iq7P62DjkntRi/6nwUyHbBCwmTiFDtBe74pxaG
 nY+vnR8SJvJ/Ox9t4ZLFaSXu1lPgZhnz/CDAyAVf7Jo4Tk8T6XLtfJ0nedVTXthr929N
 ArUDcbQvacQxov6Ai973SO2YzE0PZ+jXdy86GIKp86Z+9QnfIx8uRTB8t9YLpquwEbpg
 ESz6+lyLumnmUlYJh9MsVfMBWZwrqeodUJRzUwi2MwFQ5iQD1tac3w1dopcmmW0ZNnpG
 5beEYbaOgFfpQ1hQAwrzIHu63RKVHdFmuj+EZkR1VfyWtiD9BbV659kedUh3YHF6K2Cq OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0u4s5y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:07 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2MdNW9012290;
	Wed, 2 Nov 2022 22:46:06 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km0u4s5x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:06 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2MZM7p021144;
	Wed, 2 Nov 2022 22:46:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3kgut9dqhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:04 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2Mk2pu47055340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:46:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BF844C046;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14B7D4C04A;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DB93360100;
	Thu,  3 Nov 2022 09:46:00 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Date: Thu,  3 Nov 2022 09:45:25 +1100
Message-Id: <20221102224528.639894-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -XmOwKMFKz1NWTHxMPPlCPMSYAtTymCh
X-Proofpoint-GUID: Zj8VZm9N9fwV0m9cNGpopIfGEZXPf3d2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=507 phishscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020149
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add Kconfig option for enabling clearing of registers on arrival in an
interrupt handler. This reduces the speculation influence of registers
on kernel internals. The option will be consumed by 64-bit systems that
feature speculation and wish to implement this mitigation.

This patch only introduces the Kconfig option, no actual mitigations.

The primary overhead of this mitigation lies in an increased number of
registers that must be saved and restored by interrupt handlers on
Book3S systems. Enable by default on Book3E systems, which prior to
this patch eagerly save and restore register state, meaning that the
mitigation when implemented will have minimal overhead.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
V5: New patch
---
 arch/powerpc/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2ca5418457ed..9d3d20c6f365 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -529,6 +529,15 @@ config HOTPLUG_CPU
 
 	  Say N if you are unsure.
 
+config INTERRUPT_SANITIZE_REGISTERS
+	bool "Clear gprs on interrupt arrival"
+	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
+	default PPC_BOOK3E_64
+	help
+	  Reduce the influence of user register state on interrupt handlers and
+	  syscalls through clearing user state from registers before handling
+	  the exception.
+
 config PPC_QUEUED_SPINLOCKS
 	bool "Queued spinlocks" if EXPERT
 	depends on SMP
-- 
2.34.1

