Return-Path: <linuxppc-dev+bounces-7706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C522A90BFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 21:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd9dy6BKxz30YZ;
	Thu, 17 Apr 2025 05:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744830774;
	cv=none; b=Ti+seqURXunHJrk8tWpnjj8vwv9sz1dcmteWWhkfz2HViTgQTRat3TrC6TSlHR0hinZe9iATCJBwF68qbp6whQPmAoveH5UlQ3+176h9TqZo4ZZ+sa/mkzZJ1oHbfPcxCrwuFJDXAATZ7g34e6YSO7gs8RwAHkvIsaVkDDVtloG5UsumtZgjDmyG/9mMCVOUjtJELgTQpqve3ZcRbsP1HTWr+wRA3rhRaOV2M7Nk7Fvgv9tb62372IP5lIshg4379Lwzue61xABMegCc2vJkFLiw8VgCXHLrlHtZOnNrIIlAqGdo31CtJwdKb5JWNKFaZMHei4sNwJY0m8w+eIKvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744830774; c=relaxed/relaxed;
	bh=5bVoQhRxSHkGr6TY9+5f66L5dBMTDsjOME//X7HjjKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHCmWs/8XKXkbsbYaq97ikOdZu7Y+Op2EATraCrUPlzPZNIbrKUCr+/rYPje5+OlUqJXpp1eE/EXyPA5ygq6p6rMdkjJCdnBKZxHtKICceAGfA4V6TNpiM12N4kym3M3UcMdiOfshkjeAuLuNNhfsKGiCdsaVOa3my4lajWYnkUON//eGSDJsvVzXLVrw8EknVV9Z93Ds2MMuWjImIVbuMdk3DwT+KOlx9J76+Oya0uSqcheX4e4IFfX2NJi22X7tWeYQX7tvVAQk7ZywkGqTak7as+gad48ZT141l9OLSZgvv1XPOQi8lkzilXtz7sUKrpZzXk/nOPP46vZUn57Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pdkOfOEv; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pdkOfOEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd9dx11tlz2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 05:12:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GFqcZe027027;
	Wed, 16 Apr 2025 19:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5bVoQhRxSHkGr6TY9+5f66L5dBMTDsjOME//X7Hjj
	KU=; b=pdkOfOEvN62aqrT7Hkd7s9tauuRJkc/949fzZgteMXnB1bQy70XneVpoS
	Py5SQEv2sOADQaHzOj89pC5Hji55F5LKas1gGXNoUe0Y5fUQwSBl20+yNaeMQV+W
	uIaHUFiGifdL5xtKSB4W/u4thi7axj6YNf4A9Lo3PhGDwbOSAws85nrRAOI5oS9u
	dBMVUjQZcuJMM5cmFBoZ3kK/3f58poY9jxpmtAz6nu7sO6msfuUVdW1BADcMPphQ
	Nt2oW+X+bFMumzty5P9n7SE0YHF+0FDs9dqv0NlKg9Hfdn9qSXGhxae5I/bQlCoY
	IxYjN3fQ04ms4JKVw5XYc8tnfJ5CA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ykt5fvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:12:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53GJ4jNR011645;
	Wed, 16 Apr 2025 19:12:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461ykt5fvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:12:34 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GGeLCC001308;
	Wed, 16 Apr 2025 19:12:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4602w024dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 19:12:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GJCV1D52691280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 19:12:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8872720043;
	Wed, 16 Apr 2025 19:12:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB8D220040;
	Wed, 16 Apr 2025 19:12:28 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.31.13])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 19:12:28 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-trace-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Viktor Malik <vmalik@redhat.com>,
        stable@vger.kernel.org
Subject: [PATCH] powerpc64/ftrace: fix clobbered r15 during livepatching
Date: Thu, 17 Apr 2025 00:42:27 +0530
Message-ID: <20250416191227.201146-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
X-Proofpoint-GUID: RExilqnc7muosd1G7WgmXGXtFx9G8IzB
X-Proofpoint-ORIG-GUID: 7BFbAqo1ZZtZryXpjuDeAOot7P7BB71v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=281 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504160155
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While r15 is clobbered always with PPC_FTRACE_OUT_OF_LINE, it is
not restored in livepatch sequence leading to not so obvious fails
like below:

  BUG: Unable to handle kernel data access on write at 0xc0000000000f9078
  Faulting instruction address: 0xc0000000018ff958
  Oops: Kernel access of bad area, sig: 11 [#1]
  ...
  NIP:  c0000000018ff958 LR: c0000000018ff930 CTR: c0000000009c0790
  REGS: c00000005f2e7790 TRAP: 0300   Tainted: G              K      (6.14.0+)
  MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2822880b  XER: 20040000
  CFAR: c0000000008addc0 DAR: c0000000000f9078 DSISR: 0a000000 IRQMASK: 1
  GPR00: c0000000018f2584 c00000005f2e7a30 c00000000280a900 c000000017ffa488
  GPR04: 0000000000000008 0000000000000000 c0000000018f24fc 000000000000000d
  GPR08: fffffffffffe0000 000000000000000d 0000000000000000 0000000000008000
  GPR12: c0000000009c0790 c000000017ffa480 c00000005f2e7c78 c0000000000f9070
  GPR16: c00000005f2e7c90 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 c00000005f3efa80 c00000005f2e7c60 c00000005f2e7c88
  GPR24: c00000005f2e7c60 0000000000000001 c0000000000f9078 0000000000000000
  GPR28: 00007fff97960000 c000000017ffa480 0000000000000000 c0000000000f9078
  ...
  Call Trace:
    check_heap_object+0x34/0x390 (unreliable)
  __mutex_unlock_slowpath.isra.0+0xe4/0x230
  seq_read_iter+0x430/0xa90
  proc_reg_read_iter+0xa4/0x200
  vfs_read+0x41c/0x510
  ksys_read+0xa4/0x190
  system_call_exception+0x1d0/0x440
  system_call_vectored_common+0x15c/0x2ec

Fix it by restoring r15 always.

Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
Reported-by: Viktor Malik <vmalik@redhat.com>
Closes: https://lore.kernel.org/lkml/1aec4a9a-a30b-43fd-b303-7a351caeccb7@redhat.com
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/trace/ftrace_entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 2c1b24100eca..3565c67fc638 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -212,10 +212,10 @@
 	bne-	1f
 
 	mr	r3, r15
+1:	mtlr	r3
 	.if \allregs == 0
 	REST_GPR(15, r1)
 	.endif
-1:	mtlr	r3
 #endif
 
 	/* Restore gprs */
-- 
2.49.0


