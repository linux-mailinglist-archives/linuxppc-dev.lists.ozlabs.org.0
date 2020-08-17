Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF63E246494
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:34:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVm23yrqzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kTrv2vh1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVWz2hNYzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:24:15 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HA5VuT011566; Mon, 17 Aug 2020 06:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qYW6kMBXuW2eBojnnQbWdTTvVoxBeB244/VWM8uumKg=;
 b=kTrv2vh1BkosJmZwR2sm2xLQ4D7bbKMHIC75MLME38g/BQEAppx54E8rNqcC6P2VMYUE
 TF0nw7NzgKssmMYan0HK5VaTXcZdSP/9uImcEM05pIiuUr6Xb4bZWYai4uPfyulY6z3J
 HZeauWsDYNu01ZR+Xc7iYCK3BAYCwLRF51G+xouL3RjrOT5PELIlyA74S8FQj8EAerqu
 mJM5cbsMEDegXzOpLshpq9egVGRRXzSVKN+jJdmZuaVMUTogV1xL8V7A8O2isUwm0FDK
 djLvHUehQqX2T6Iec8U/sInedqMpqst+RF9EPcCtkI4ZuXBokXKfOYkSiXi1OTkdZtpL MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7tpkdsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:07 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HA8htf021775;
 Mon, 17 Aug 2020 06:24:07 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7tpkdrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:07 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HALMeo020969;
 Mon, 17 Aug 2020 10:24:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32x7b824fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:24:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAO11228574084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:24:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F066E4C040;
 Mon, 17 Aug 2020 10:24:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93B334C046;
 Mon, 17 Aug 2020 10:23:58 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.13])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:23:58 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v4 4/6] powerpc/watchpoint: Add hw_len wherever missing
Date: Mon, 17 Aug 2020 15:53:28 +0530
Message-Id: <20200817102330.777537-5-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
References: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170071
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, rogealve@br.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jniethe5@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are couple of places where we set len but not hw_len. For
ptrace/perf watchpoints, when CONFIG_HAVE_HW_BREAKPOINT=Y, hw_len
will be calculated and set internally while parsing watchpoint.
But when CONFIG_HAVE_HW_BREAKPOINT=N, we need to manually set
'hw_len'. Similarly for xmon as well, hw_len needs to be set
directly.

Fixes: b57aeab811db ("powerpc/watchpoint: Fix length calculation for unaligned target")
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 1 +
 arch/powerpc/xmon/xmon.c                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 866597b407bc..081c39842d84 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -219,6 +219,7 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	brk.address = ALIGN_DOWN(bp_info->addr, HW_BREAKPOINT_SIZE);
 	brk.type = HW_BRK_TYPE_TRANSLATE | HW_BRK_TYPE_PRIV_ALL;
 	brk.len = DABR_MAX_LEN;
+	brk.hw_len = DABR_MAX_LEN;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
 		brk.type |= HW_BRK_TYPE_READ;
 	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index df7bca00f5ec..55c43a6c9111 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -969,6 +969,7 @@ static void insert_cpu_bpts(void)
 			brk.address = dabr[i].address;
 			brk.type = (dabr[i].enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
 			brk.len = 8;
+			brk.hw_len = 8;
 			__set_breakpoint(i, &brk);
 		}
 	}
-- 
2.26.2

