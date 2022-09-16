Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7D5BA671
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNHn5Ycgz3fWH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iU4Am+Kj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iU4Am+Kj;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5l17fYz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G4kY5Y011676;
	Fri, 16 Sep 2022 05:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QOuFx07w+bv9ChT/Ijs90x387nUCOvn7eQpp37AQoUg=;
 b=iU4Am+KjcFQKzjCBbdXvLi7q83XanW2cs0DpfEFM6Emm7zdGA6YXOl/No7RRCWILKG+0
 95KYtaWqWu8wX2HOjwniLepPyTpsXmlX4zvlqQUkDEIht+CdsBkgQWlf+5OJi7NBXKl9
 w0fp0E1mKNMbb9Fw646OGcIvygia1HA5NxCgLPObwl+VudvW2o5pKpPQlIOJJMGoAY7M
 vXIe4YwTQtGCxoLdEhQAkRqz5aSsieREkxAleFYk9vWBZclPdc2pBA4ZRuFNo58r+Sr5
 pxcjBD54nczQEWp1Pvv2jnLrIovLBvE2X+CVSsMkN1oTHjJIhYvr9JiHLyt+RvdE7YyI Tg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmjdg99sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5LIi8017465;
	Fri, 16 Sep 2022 05:33:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crcnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5XKmC42664396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:33:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0F7A4C04E;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C21C4C046;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ADC67605A6;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 21/23] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Date: Fri, 16 Sep 2022 15:32:58 +1000
Message-Id: <20220916053300.786330-22-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WYgadOQcnlli2o5Ik-xuDzebUmszVZnF
X-Proofpoint-ORIG-GUID: WYgadOQcnlli2o5Ik-xuDzebUmszVZnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=417
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
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
---
V4 -> V5: New patch
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

