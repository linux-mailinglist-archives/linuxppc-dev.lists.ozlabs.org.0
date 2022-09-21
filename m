Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383EE5BF749
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV435hf8z3fkp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:12:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fq7YyWA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fq7YyWA8;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTmS57NCz3f3l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:20 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L5WI1b012156;
	Wed, 21 Sep 2022 06:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qU1xC2e+jGlnG7iSxMUNXqddjL2u6Zd9D6VbLaXP9uc=;
 b=fq7YyWA8C0Jkk3u/uaGcv5kYiPR/WWAa1hQ21pLXOhn24w51XFPnvYsSpCrng0MyYQDx
 veUtDSU2bdyALw11OXOtynuJA76+LLFISm2RM28MKM/LiXV2z7UFRGyS8qKEf4idMA01
 16p7IIQFgwhDB7/TihMguM4NSTSLsolPCsAZ5gQoQ/ZBP4SHC81qusL3DMFgLoFfLUUd
 rzBX+8AVBqk7Bc3LN0mwFwltlbV6kTPQFh0B6LCNd+/cZf469utBAAeAUq96ThjDdAci
 DVvyZfFGD7ABPcP8oMZZUuk72i1NOdq52AW90pXEIoSGvZvgmorIXubwvpGEOkK1wxwo +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6txbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:15 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L5YVNE023718;
	Wed, 21 Sep 2022 06:59:15 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6txa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:15 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6qtGt015934;
	Wed, 21 Sep 2022 06:59:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3jn5v8kk81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6xBbd12386702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:59:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37C1A42041;
	Wed, 21 Sep 2022 06:59:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D65454203F;
	Wed, 21 Sep 2022 06:59:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:59:10 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6B14B60060;
	Wed, 21 Sep 2022 16:59:07 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 23/25] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Date: Wed, 21 Sep 2022 16:56:03 +1000
Message-Id: <20220921065605.1051927-24-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MH9J9gaXq-9e7akn065pZMFLpOkpsF4i
X-Proofpoint-GUID: hKha0IieMXhlFJ05V_DRx8Ps5i-tbJbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=431 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
V5: New patch
---
 arch/powerpc/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ef6c83e79c9b..a643ebd83349 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -528,6 +528,15 @@ config HOTPLUG_CPU
 
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

