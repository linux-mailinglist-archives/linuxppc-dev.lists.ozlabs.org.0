Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2089FB39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:13:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlnG1Ifk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF5tR2q2wz3vZ9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:13:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlnG1Ifk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF5qd4jL9z3dXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:10:37 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43AE2SgW003190;
	Wed, 10 Apr 2024 15:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=goIiqaO1e1ZadVL5tmtv4UVpZpbODSAt3kyKMNXwyEY=;
 b=tlnG1IfkgPpDczlaelVaestqGHLNMYNirD81o9vWXW/y6P+tcyYyJkA5Y/RJfm9vkS8M
 lZEpxUxjscOqgysuqg4M9TNYSIHRjZQDSlbi71bjsTYxKtd79YeUSwVH03h8OBH59sCd
 a0z/KXmMU37V2A0bj4TQ8k1PMnCrG1Qh8XaT40TM8UVjyfO9TNdY/NKpyJgD99hVXnhA
 ugKVdhpWmpv/D8M1MaAOKQTdZrDi8Uwbq7BFhMHzXDqkyXLA6LbsxiAEtqszXfcEUcZr
 QAWyINq5TA5rHE4S3I6IblOR+hiuf5bJzOgrh1irV8olGLcLOga2u7QC2fJRSIl2/iiV SA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdv63g6qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:56 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43AF9ueq023382;
	Wed, 10 Apr 2024 15:09:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdv63g6qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:55 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43ACB0Br016965;
	Wed, 10 Apr 2024 15:09:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2n0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43AF9ntp47776096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 15:09:51 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2753C2004D;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 135D320040;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id CBE8FE0628; Wed, 10 Apr 2024 17:09:48 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 RESEND 1/5] sched/vtime: remove confusing arch_vtime_task_switch() declaration
Date: Wed, 10 Apr 2024 17:09:44 +0200
Message-Id: <783d7c611864f82b0fb9edf01890b9396f3a549a.1712760275.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1712760275.git.agordeev@linux.ibm.com>
References: <cover.1712760275.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -VpHnQUY1cWPNEXUu0pXzC6Op3cby8Ep
X-Proofpoint-GUID: qUKdOFIbZu7Jrmu--JI7KXOlVpdGr0OS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=849 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404100109
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Callback arch_vtime_task_switch() is only defined when
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is selected. Yet, the
function prototype forward declaration is present for
CONFIG_VIRT_CPU_ACCOUNTING_GEN variant. Remove it.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/linux/vtime.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 3684487d01e1..593466ceebed 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -18,7 +18,6 @@ extern void vtime_account_idle(struct task_struct *tsk);
 #endif /* !CONFIG_VIRT_CPU_ACCOUNTING */
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
-extern void arch_vtime_task_switch(struct task_struct *tsk);
 extern void vtime_user_enter(struct task_struct *tsk);
 extern void vtime_user_exit(struct task_struct *tsk);
 extern void vtime_guest_enter(struct task_struct *tsk);
-- 
2.40.1

