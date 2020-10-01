Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EB280603
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 19:56:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2LQd5VctzDqBW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Oct 2020 03:56:09 +1000 (AEST)
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
 header.s=pp1 header.b=iQWMZLVd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2LLd0p0TzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Oct 2020 03:52:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 091HXUfb177734; Thu, 1 Oct 2020 13:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CggmVh2+wdh9bNZPah0GT4gezQ6s4AM39RuCEbi6L8E=;
 b=iQWMZLVdNvKfVhx88GeIPwaxgsWnt8Ifvgqek+TmdKTrEin1aqFXR48Jj1iNizFPybv7
 YCn7kxbjg8uPNiXAbhUoQGICurJri1YXYNaGtWzLfXkwySm4uz3OlOSqm1lsq6JiGeaf
 giglB8VPpJAI+bwBTCqFcS53t+MKwStIlQ9epD8ih5gNcERGn5xAjy58STM1cDvdt8gl
 gYc4ko+KyLlU2Uz+0tBNlT4nZm3U30p0GYK2PoZMQw8dfmyVgXGg8feYEZ2KFTt0bnru
 UDDwaIdAPX3vAF9JgTOjOsfOW5Jtsf01N3kZhlg9r4JSxph7Ad8vmFYt+emy1n1umwGN 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33wk03sp7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:35 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 091HjJPH026037;
 Thu, 1 Oct 2020 13:52:35 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33wk03sp6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 13:52:34 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 091HcH53016278;
 Thu, 1 Oct 2020 17:52:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33v6mgtb3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Oct 2020 17:52:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 091HqTll28574142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Oct 2020 17:52:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57FB24204B;
 Thu,  1 Oct 2020 17:52:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EFBD42047;
 Thu,  1 Oct 2020 17:52:27 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.200.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Oct 2020 17:52:27 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 1/2] powerpc/mce: remove nmi_enter/exit from real mode
 handler
Date: Thu,  1 Oct 2020 23:21:43 +0530
Message-Id: <20201001175144.286189-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
References: <20201001175144.286189-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-01_06:2020-10-01,
 2020-10-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxlogscore=856 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010010147
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
 arch/powerpc/kernel/mce.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index ada59f6c4298..3bf39dd5dd43 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -591,12 +591,14 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
-	bool nested = in_nmi();
+	bool is_pseries_hpt_guest;
 	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
 
 	this_cpu_set_ftrace_enabled(0);
-
-	if (!nested)
+	is_pseries_hpt_guest = machine_is(pseries) &&
+			       mmu_has_feature(MMU_FTR_HPTE_TABLE);
+	/* Do not use nmi_enter/exit for pseries hpte guest */
+	if (!is_pseries_hpt_guest)
 		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
@@ -607,7 +609,7 @@ long notrace machine_check_early(struct pt_regs *regs)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (!nested)
+	if (!is_pseries_hpt_guest)
 		nmi_exit();
 
 	this_cpu_set_ftrace_enabled(ftrace_enabled);
-- 
2.26.2

