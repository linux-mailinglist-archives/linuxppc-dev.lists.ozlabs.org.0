Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB2278549
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 12:39:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByT1h1Lv8zDqk9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 20:39:36 +1000 (AEST)
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
 header.s=pp1 header.b=IjFIZl2N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BySt63qzKzDqjp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 20:33:02 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08PAWIif166011; Fri, 25 Sep 2020 06:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CggmVh2+wdh9bNZPah0GT4gezQ6s4AM39RuCEbi6L8E=;
 b=IjFIZl2NgJHsF9jEdD7LZ8maPvuzYd8B0jjaOt5kZCBKcJjpNfEzLgoMlsIl36cNwz12
 Ce7Fq3+sjYrvboaPoW/evXTa2gw63Nw3Yhm9S0bcdyw/CV6/wWSFgkcp8yzsqr//nacL
 X6mdYcHfhYZnPN5vcLDVOnJOfbKfnMOaed7nI47WABa2c6EqZ/C0LjDS/N8xd+YiapIu
 Jg3nb/dxMFnFhvJlTISp/cEDCdnbIn4tfARfvF6oCV6vdySLVzMcMnVrkjd9AhZnKFH0
 72/DLePbVpqKvb3ni9VEHYKXUQdV7APVIpj1/EkRaUP8cmIRhFgk7mgQGgIYON/nPzKn 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33scu83g34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 06:32:52 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08PAWMBs166177;
 Fri, 25 Sep 2020 06:32:52 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33scu83g2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 06:32:52 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08PAWoIi016388;
 Fri, 25 Sep 2020 10:32:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 33payucx1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Sep 2020 10:32:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08PAWlZu32309594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Sep 2020 10:32:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B6664204C;
 Fri, 25 Sep 2020 10:32:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FEEF4203F;
 Fri, 25 Sep 2020 10:32:45 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.205.231])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Sep 2020 10:32:44 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/3] powerpc/mce: remove nmi_enter/exit from real mode
 handler
Date: Fri, 25 Sep 2020 16:01:21 +0530
Message-Id: <20200925103123.21102-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-25_04:2020-09-24,
 2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=792 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250068
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

