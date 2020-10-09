Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B322882E3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6z7x63qczDqYK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e9Moicjt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6z3h6wznzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:40:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0996VoDB064777; Fri, 9 Oct 2020 02:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RcU9cCLeloNzWKkaPg6QiEYLBNxFd4bCVdHNf5L49IE=;
 b=e9MoicjtzuKCtI2oLO7zyN7mG3SkIXpIqR20I20g4AlSUT9cAFulBQ1g7ClwvCr8VK7I
 vJGMN8xaMgFmlxVykSVc7frRYn338Ta/LgWQ1+yLAG+o90g7DGUH2+fHFEtMACMs3uYw
 k2DtXFbko93rJiqhEITC3Dnw2AWQDCDE2ZqsjlC+hcDslPaZbXp7wY2+/sk/OCO2j0p7
 r4+Ow21L3vg5Gx+X+dYjYj/Ta6RG6XI6fNDz1fn0wKombIDcq8JF/ClTKJCSTO1I51E5
 tShXqjaZZEmUuLLyTC2FVQ57tVo3OIr9WS6BU3YIPj0xffU6dgsFibnmmOHZGGP6dVwx bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342frfcgs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 02:40:42 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0996WOJ4066685;
 Fri, 9 Oct 2020 02:40:42 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 342frfcgqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 02:40:42 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0996RNrU025637;
 Fri, 9 Oct 2020 06:40:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3429hj06f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 06:40:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0996eaSf29753710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Oct 2020 06:40:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE69411C050;
 Fri,  9 Oct 2020 06:40:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF8E111C04C;
 Fri,  9 Oct 2020 06:40:34 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.89.116])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Oct 2020 06:40:34 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 1/2] powerpc/mce: remove nmi_enter/exit from real mode
 handler
Date: Fri,  9 Oct 2020 12:10:04 +0530
Message-Id: <20201009064005.19777-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
References: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_02:2020-10-09,
 2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=899 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010090044
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
Cc: msuchanek@suse.de, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of nmi_enter/exit in real mode handler causes the kernel to panic
and reboot on injecting slb mutihit on pseries machine running in hash
mmu mode, As these calls try to accesses memory outside RMO region in
real mode handler where translation is disabled.

Add check to not to use these calls on pseries machine running in hash
mmu mode.

Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index ada59f6c4298..63702c0badb9 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -591,12 +591,11 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
-	bool nested = in_nmi();
 	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
 
 	this_cpu_set_ftrace_enabled(0);
-
-	if (!nested)
+	/* Do not use nmi_enter/exit for pseries hpte guest */
+	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
 		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
@@ -607,7 +606,7 @@ long notrace machine_check_early(struct pt_regs *regs)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (!nested)
+	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
 		nmi_exit();
 
 	this_cpu_set_ftrace_enabled(ftrace_enabled);
-- 
2.26.2

