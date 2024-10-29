Return-Path: <linuxppc-dev+bounces-2671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E49B41F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 06:52:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xcztf0YRxz2y7M;
	Tue, 29 Oct 2024 16:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730181162;
	cv=none; b=LnMQMoBd+OcCLGmn0AAWCNEW92C4D9B3A4Z1KBHjSty5RDul35NMPgOSLAN+Z+lQs3nmjD9tFxsKpKF/6rpqc1gHAocdDlYPYbHOrZKdQcgSkkji2UyubpYIuV81JCPUmOrc1Db1sWadb7PH0kKvedqqTRBAd4a2vHU0ju2y0pf7wMTCasa3XQxA2HFvIQCsyiP1d5jqxTh+FSuIETdPNbyRRN30IEhVjeTJ9gtSB1/6oOxJdH2vQL+qykGNqfvjDvlcT3BIBxywHlukUGU1+J2Nyzn3xElsexiJrFSRMoOKXyi9rwzb8Lev2g6E/hbvuAnMPwCRxloZ8BooBCal+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730181162; c=relaxed/relaxed;
	bh=6t54aD/32hX5Qw1Lx0tqHuKvgXcgkOx84tdY0auHSZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ze3tmr+1inQNDIewetDKIq+sdMj30eKWEpjTwbcmwKBY3z20UiIGhzUOJWJQBY9GZRQQ2PaEZMsir2wyqRn/PslKCrT4gTt4prjIvWxRw8BZ2Dd4lNx0hVjL0OTxaP1wBdhIgKUiC/qt4l6SvZgFb/YMvVReRLcyfFhfgY2n79Ky9ghIRzxlS/BIvfLbmMVkT8xMqBQP76tihXwOSddjtfR9YXnVPDnkgE4POnD/XR9aCb0I1CD6pTW3jKvSZ/bp0Gy/nwzR6ER5/JZc53jT5nnBYXarn/SRTou1lLYDbOITNu36TvFuv/niGsnwPRKEMkt2u0r/9w7HG0fMC04Xsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASi8Gopg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASi8Gopg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xcztc4wDRz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 16:52:40 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T4mqJ3029148;
	Tue, 29 Oct 2024 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6t54aD/32hX5Qw1Lx
	0tqHuKvgXcgkOx84tdY0auHSZ0=; b=ASi8GopgDBKyvgT+pGszjfymZviBPYkmE
	+Hg/A/V+0EXDXo4KhkKWXR9fbCZ3Eu8J0EuhEZ7/m7ABCOtbczbKEgW4z3E+ekZI
	3HRXGJBWXBIY+0g2pYBoEE23EbbzQZfMAK2yOKf0bI5FNPK3ePEWyl83ewqMJ0n/
	S4z866yUO2Nzf2lwSzwikUzYKCt/3g8j1NUWFR4F3BIsr4DwLbKLomeDyENeY5nw
	4EVzwUpMMBOaqLEKN2omRcPvaivBfXHsyGHq34kfYDCuGBMAmaeZ1GVgHaUp8uYx
	SjcwwsnkIsInUssGjuFSwQA3whJNk4QKU7KgeeN1UsYWJHqpvDA9Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h08d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 05:51:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49T5puiO025957;
	Tue, 29 Oct 2024 05:51:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42js0h08d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 05:51:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49T52xAK017353;
	Tue, 29 Oct 2024 05:51:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42hars9va2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 05:51:55 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49T5prjX41222510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 05:51:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 806A42004B;
	Tue, 29 Oct 2024 05:51:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 699AD20040;
	Tue, 29 Oct 2024 05:51:49 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.43.45.219])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Oct 2024 05:51:49 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
        "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v2] sched/membarrier: Fix redundant load of membarrier_state
Date: Tue, 29 Oct 2024 11:21:28 +0530
Message-ID: <20241029055133.121418-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241007053936.833392-1-nysal@linux.ibm.com>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
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
X-Proofpoint-GUID: u3SpnuL4HkuRvdYn_IP68QVGMeDyWORP
X-Proofpoint-ORIG-GUID: tx5WfK36He4FnRHCA8VkcfitRgnwHnOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290042
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
2.47.0


