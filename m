Return-Path: <linuxppc-dev+bounces-1783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3809923E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 07:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMSg640Spz2yMt;
	Mon,  7 Oct 2024 16:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728279650;
	cv=none; b=Y9SC6YU4woeEBdYiijCCiKIEOLjY9OoVB+LqYS4frYDarxRrHP2nW6ALQbXQknwYwnoq87k1M5z9Dp+AwdhbzRqWnruyZRU325zPfbc4gSleNYczuvuGSIrnj+NL9QIVc9ND6MrfVtrwmzc4Biba650rvivDUbWnHEbu8vsfD+Lt2XVdg1NEu7nzJNr4u2e0hAhJ4I/bwnlaxVsbsJJEqZEzif6JPj1V5lGS9qDPvRpir6W0463fuUZ5k74+xM1qNiHeV0fEED0WJkyFkcj39QDWpXaNk8D+rzCOagz9nkCU/ze3yKhp/GSxwydK330o13HCtKgn8hSiXlkl4NCyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728279650; c=relaxed/relaxed;
	bh=YVpQRnzWLCjGXCfVMKGoRaXUhi59IGwbCEnH+odbRp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNJ1FC/KHhoDIMvuCjmOhUwCnC0U2BEzZbp1M2fvQU/KTSvQb0sV7JGzeDLfvwi+c9MYXX2ULspK8Ff3JEEK/tVcGyF4ud9xEQY87Az4y5fYO9LrhUvIqS7gT43mHqPn7/OvRQgXtLooZTvDrwOJ7wDJBLLZDHohS30M5jIS90NVmiMgkwXUzodJf594NqhpHbj2RM3f2iVsV6tTiN9TPqtmMAuxF67YpH9ZKxnjPerAfoAfYKyWIUtcxn90P6F5t6ng/dJDAW1fdALyuBCwUz3F2EaYVomKiWWqz844ZeV+lIHZLGF+pFFLaGsfZBJTTYiqrrnXi2fkZq+7OqbRhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNjhjZjB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNjhjZjB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMSg51Bmpz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 16:40:48 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974JsDb024539;
	Mon, 7 Oct 2024 05:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=YVpQRnzWLCjGXCfVMKGoRaXUhi
	59IGwbCEnH+odbRp8=; b=sNjhjZjBre5eDLD4BD2645IxK4qQNaLlwbxKLv/+LL
	Hi72lwAV2EB1nQxoa3Ypgaxsu5XKwc2qT0h/g2xEVSytan2q7gIqpx6ewvBXwRtX
	7FR6WDlC4sz/iR0QCsCj0jbJKaboCJNcPsaivhdKMDYpTgQSNfPzLeUZFPIWS8Hi
	YTkV/sYgFRfInqhLcIIoT8mARaD8pQ36EjWOq9EbLFleHljs0rCx6pWE2IeKLRtr
	tsaRLjnTkDmJ1YgF0N7EATT0LNFNIrMVUNDgqOZFgqthZIrO03Ex8+Ro01SEtc++
	eH02l4eL26NRuiuzJqsJbwkrEiE0YjVY9CPe7Ra9IL2A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4248h1g8u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 05:40:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4975eNpI021204;
	Mon, 7 Oct 2024 05:40:23 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4248h1g8u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 05:40:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49751H2a022867;
	Mon, 7 Oct 2024 05:40:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg0mf3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 05:40:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4975eIKp52756846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2024 05:40:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6750A20049;
	Mon,  7 Oct 2024 05:40:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B53920040;
	Mon,  7 Oct 2024 05:40:15 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.43.47.32])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Oct 2024 05:40:14 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A" <nysal@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] sched/membarrier: Fix redundant load of membarrier_state
Date: Mon,  7 Oct 2024 11:09:32 +0530
Message-ID: <20241007053936.833392-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q1mO7SjCHn1YLn4pkYaKQsvL8C9UN_Cd
X-Proofpoint-GUID: _-4VV4ZENx6hWaATop6qUVBBWxVEMWij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_21,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070036
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Nysal Jan K.A" <nysal@linux.ibm.com>

On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
is not selected, sync_core_before_usermode() is a no-op.
In membarrier_mm_sync_core_before_usermode() the compiler does not
eliminate redundant branches and the load of mm->membarrier_state
for this case as the atomic_read() cannot be optimized away.

Here's a snippet of the code generated for finish_task_switch() on powerpc:

1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
.......
1b78c8:   cmpdi   cr7,r26,0
1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
1b78d0:   ld      r9,2312(r13)    # current
1b78d4:   ld      r9,1888(r9)     # current->mm
1b78d8:   cmpd    cr7,r26,r9
1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
1b78e0:   hwsync
1b78e4:   cmplwi  cr7,r27,128
.......
1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
1b7a74:   b       1b78e0 <finish_task_switch+0xcc>

This was found while analyzing "perf c2c" reports on kernels prior
to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
where mm_count was false sharing with membarrier_state.

There is a minor improvement in the size of finish_task_switch().
The following are results from bloat-o-meter:

GCC 7.5.0:
----------
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
Function                                     old     new   delta
finish_task_switch                           884     852     -32

GCC 12.2.1:
-----------
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
Function                                     old     new   delta
finish_task_switch.isra                      852     820     -32

LLVM 17.0.6:
------------
add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
Function                                     old     new   delta
rt_mutex_schedule                            120     104     -16
finish_task_switch                           792     772     -20

Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
---
 include/linux/sched/mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 07bb8d4181d7..042e60ab853a 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -540,6 +540,8 @@ enum {
 
 static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
 {
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
+		return;
 	if (current->mm != mm)
 		return;
 	if (likely(!(atomic_read(&mm->membarrier_state) &
-- 
2.35.3


