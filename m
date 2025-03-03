Return-Path: <linuxppc-dev+bounces-6612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D4A4B7C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 07:06:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5pGv1bTTz2yD8;
	Mon,  3 Mar 2025 17:06:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740981991;
	cv=none; b=cka9v1m6eRBKa0eBkG++74VT9eU/dYUgNtVR5cqpyOWuGvUOuwNR2Q5/d8YDPNFkuId20/tLH3n1FTcgoemK4P3nPNG+wfqi2uRhUJibpht7TitmquZlFQfC4JmeHCEm9hqSIRK0rqhxDyUKy5UkrGlka5Za+i6IfIwJLbYNHsxwSKhA9KCzvoN0+6gz4n8LeDXCmpjkvFc18AXyzCburSbFG9UKaUqS1iuzzvG59YEtnlJXWiPAD76OKfF63SR9GeSkcnH0fkkrGI9Yyv4JYWO+HLAjsm2nPALwc6/EMgd0l6IpCkZah44VKYtwq8dWnIxKVbsYtsFbHGPVZG3urg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740981991; c=relaxed/relaxed;
	bh=iDyZnbw6q3m26QApS6v/kxgI2ZGZQYcS8SKc10ZKlnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJAgaR0OVMP5HDBmqEp5H0tccwMs1AsHjEKfiYfXyIqJ1CP99IgkSgxraLHsGcQMnlRZHVrJ0qyRVZ4vfP3aaEGjGwOkKHde7hN58G6jYz9jWCqQFRpZcexTSUXFuQimn9CrcezgKPlJEjxLHSgZiPL4qDCitA60rz8GaVpojVhxPEaCf7qG+qCyXjidTVxAC2dMr8G5JWljBAWmqeROl+mZUWkNr22oLfeVmHw0TkUN0fHqP6JooHsVhr6REK6m3nXue0ENZaOTbC6ZJuasvNIbMcAvw6e12La8tpxbKT6OF2NhjyloehmgniSEDlIX3uK6lJR2zOfXzmUEdY5MKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aAYvj18k; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aAYvj18k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5pGs6rwsz2y34
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 17:06:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522KZxQP002167;
	Mon, 3 Mar 2025 06:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=iDyZnbw6q3m26QApS
	6v/kxgI2ZGZQYcS8SKc10ZKlnk=; b=aAYvj18ke2sGH3XXXYGkeB5yT0ifxSgOA
	4iA8tlp0S6a/HoyxJeeOfwxajlv/8HmYwE0m5vewgn3Rfqxpz4fu/IWtvFSuFlyd
	9t4rUPCzfz0jMd/TrcyFX48JdVb9vb2ay3RfX7LpsnAjiD5bfJaTE8HipjFA5RAz
	U8baOlET56D1+yFDbC5aVtsFUJgFQgolWrRETFma4HM5nStW+h1534C3L1ZoV7uo
	ZT8YJBTtHYqg9n0PhYsoDhirJEpoAadiN+zkr3Y0VeXmz2GTuH0Gk1k7zbFR12/K
	99zdV+NKeLYZH4Ttx48CFZ+ve5VtdaLPPzzcQNqhTFXSYYR0T6k5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454xgp9mk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:05:33 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52365WZX017056;
	Mon, 3 Mar 2025 06:05:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 454xgp9mjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:05:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5234DE5k013784;
	Mon, 3 Mar 2025 06:05:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2kdm93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 06:05:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52365Tkk58130720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Mar 2025 06:05:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE4820040;
	Mon,  3 Mar 2025 06:05:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37D9C20043;
	Mon,  3 Mar 2025 06:05:25 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.in.ibm.com (unknown [9.199.156.78])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Mar 2025 06:05:24 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
        "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH v2 RESEND] sched/membarrier: Fix redundant load of membarrier_state
Date: Mon,  3 Mar 2025 11:34:50 +0530
Message-ID: <20250303060457.531293-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>
References: <20241029055133.121418-1-nysal@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UOAZLirGGRJNyCiUHQl3oF-vv_RPPjQN
X-Proofpoint-ORIG-GUID: Rgov3vtjYDdJBNTDqz-k0DfKqnlP3zmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503030040
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
is not selected, sync_core_before_usermode() is a no-op.
In membarrier_mm_sync_core_before_usermode() the compiler does not
eliminate redundant branches and load of mm->membarrier_state
for this case as the atomic_read() cannot be optimized away.

Here's a snippet of the code generated for finish_task_switch() on powerpc
prior to this change:

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
The following are results from bloat-o-meter for ppc64le:

GCC 7.5.0
---------
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
Function                                     old     new   delta
finish_task_switch                           884     852     -32

GCC 12.2.1
----------
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
Function                                     old     new   delta
finish_task_switch.isra                      852     820     -32

LLVM 17.0.6
-----------
add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-36 (-36)
Function                                     old     new   delta
rt_mutex_schedule                            120     104     -16
finish_task_switch                           792     772     -20

Results on aarch64:

GCC 14.1.1
----------
add/remove: 0/2 grow/shrink: 1/1 up/down: 4/-60 (-56)
Function                                     old     new   delta
get_nohz_timer_target                        352     356      +4
e843419@0b02_0000d7e7_408                      8       -      -8
e843419@01bb_000021d2_868                      8       -      -8
finish_task_switch.isra                      592     548     -44

Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
---
V1 -> V2:
- Add results for aarch64
- Add a comment describing the changes
---
 include/linux/sched/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..b13474825130 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -531,6 +531,13 @@ enum {
 
 static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
 {
+	/*
+	 * The atomic_read() below prevents CSE. The following should
+	 * help the compiler generate more efficient code on architectures
+	 * where sync_core_before_usermode() is a no-op.
+	 */
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
+		return;
 	if (current->mm != mm)
 		return;
 	if (likely(!(atomic_read(&mm->membarrier_state) &
-- 
2.48.1


