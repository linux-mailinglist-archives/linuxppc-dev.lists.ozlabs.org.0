Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889063EA2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:13:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN6k266LYz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:13:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mLdB+ptM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mLdB+ptM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN6g143yKz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:10:53 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B16mhpe011546;
	Thu, 1 Dec 2022 07:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=K6icbkdI7eUcdR0z2gvEebF7qRtRTbrhXhvPaPCYZkM=;
 b=mLdB+ptMh0NSrk6Onbggelge6xbfGWr9rN3jI/0HG1cNffO1Ju0vndIYaa1ToKhJzuwK
 44wNoHLWURmZttt3s890ggiLHQQm0LbBebTagx4sAvRhGswW1Mv5yYcdMkVMS/Y2rngC
 dDsNQRskziv7ngyUT6aH7wtyI/Ug0RI5H42hViUcjD+1I49eS/QWwgTslmw1UZMBfUDg
 ZKlplCHH6K94SQ0Al8+VIFpnRRZgkI5OKOAAmLVrNe9E9pFxNqhDhDRk5Fi10QufI1Sq
 jiNUH8poi0m7hxgZ6HjUDTYERXNx2NtmCK4wE7I/59xx/n8/m1DhFu5otcwcMo/VD7ZH sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qb10fwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:46 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B16sm7o015644;
	Thu, 1 Dec 2022 07:10:46 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qb10fv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:46 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B175Zwo027362;
	Thu, 1 Dec 2022 07:10:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3m3ae950y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:43 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B17AfFL65405438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 07:10:41 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5243211C050;
	Thu,  1 Dec 2022 07:10:41 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1C8311C04A;
	Thu,  1 Dec 2022 07:10:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Dec 2022 07:10:40 +0000 (GMT)
Received: from civic.. (unknown [9.177.92.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 09B29600F0;
	Thu,  1 Dec 2022 18:10:30 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/7] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS Kconfig
Date: Thu,  1 Dec 2022 18:10:13 +1100
Message-Id: <20221201071019.1953023-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u8kCoUewj_mPxzjFJlYvEl8nIWyrv-un
X-Proofpoint-GUID: qqLDPIKS7CLq71faMU447dVkELuVP2Cq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=504 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010048
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

Acked-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
---
 arch/powerpc/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4fd4924f6d50..280c797e0f30 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -531,6 +531,15 @@ config HOTPLUG_CPU
 
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
2.37.2

