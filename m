Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4060A2510D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 06:47:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbGgW51hNzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 14:47:19 +1000 (AEST)
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
 header.s=pp1 header.b=RcJNgci7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbGRT54rZzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 14:36:53 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07P4Vt8L177831; Tue, 25 Aug 2020 00:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qYW6kMBXuW2eBojnnQbWdTTvVoxBeB244/VWM8uumKg=;
 b=RcJNgci7dfbzfjDEfKLaOz3pNwr/s6kvxYgej/9QsxJHrL0McQYzPkoUUfB5ryQRJXv9
 riseU7wPeU2yWHb84LmmKsN1VVSeYtTV+mxf3l3bgfz47NEddCJFexoZpRfePJ7l/PhT
 qJQtGAn0Cs3hudxk0pu+83ZBni9WQaEmcI58VuuxINA0Pqg3IWiiJoiL02FpKfny6v+q
 oucEKiXnOtkWwbqQyrk3vEcr82Hp/ytMnWSjGEerxeohiFK7PFGyVFccDsbDVbsS+TeS
 LaXEUpqbYKCwEegPh2MOyoHCMKnVGLE2Q7UrP2Mb/WDPzokpvK0m7gddPTqbY/+XQTtH +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 334sne2p1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 00:36:46 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07P4XTnM182410;
 Tue, 25 Aug 2020 00:36:46 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 334sne2p12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 00:36:46 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07P4WhIo030814;
 Tue, 25 Aug 2020 04:36:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 332uk6b1cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 04:36:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07P4afTc26149194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 04:36:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7E2AAE045;
 Tue, 25 Aug 2020 04:36:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5431CAE051;
 Tue, 25 Aug 2020 04:36:39 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.33.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 04:36:39 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v5 6/8] powerpc/watchpoint: Add hw_len wherever missing
Date: Tue, 25 Aug 2020 10:06:15 +0530
Message-Id: <20200825043617.1073634-7-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
References: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250030
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, jniethe5@gmail.com,
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
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

