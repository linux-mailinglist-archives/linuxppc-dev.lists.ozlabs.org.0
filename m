Return-Path: <linuxppc-dev+bounces-11491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE1B3C132
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD47p4s0jz2xnv;
	Sat, 30 Aug 2025 02:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756486358;
	cv=none; b=R+PRTa2qcJq5liYorTmg2kpHhjCTAWtukZkMS6NquJx+t6/HXbUpEnbevFrHxZ/pgc+0rmDETvqu+rrn2uZdiwXTIPMQwxVjfS0CDC1QtVVzIhm7iLhrRlTG6BPh8Tf2GuPEE6/W84/siXKqIEzfkHC/JXAudC6m4pp35fqOMYNDC6w7NvxnkbgNpY/sl4gIZK9hUOrinc/7TnR2/IDIbTV8VwcDoC6HRgAExaz78nbZAVJRRW1Gvibd5b9nFzaD6T2PUjUQ8w3F6gCKr9KwUP0BCoDGgIlpL9DYBUrUUIgHvv0o+oy/GjPxEoHAD6TJiQ3WNIAzD4PJTqiGsyBddg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756486358; c=relaxed/relaxed;
	bh=c8SHqim3/SaVNQk5asDCwT4jClyRt7JLZlbeSe5TIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqnCSA9i/nNmwkRsHRTWY4NzHVNz5OYKGZfjgGDYT/8PvAxiw2T7VLLrXUNwF5yom6AbTzdOhqimKShatcl1c7PMZkGkbznOd2eA8amLoKHcVXD33yer3/A6L3qK+XjOrMQIllOtOS7qw1J/5BlZ9+LtHbM+es/yn4NeXqGjLnGM2Yh4R8xbuaKd8/JHiLuS02IQlj5LHDVvev1Mc8DmEGt14ZrhjTeaQcsvd+qkI0fiHzJW+ITRZeRunnUxHTDgau5QxBiaEOedu1XIUoBuxSBZGEsHxvR66BAXgx0flxPRVB2dUxJvNzhGabYYLiCi0pbcU65gVUTqDqx7aA6bfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KU0o8w6j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KU0o8w6j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD47n4w3jz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:52:36 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HQvx006069;
	Fri, 29 Aug 2025 16:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=c8SHqim3/SaVNQk5asDCwT4jClyRt7JLZlbeSe5TI
	H0=; b=KU0o8w6jDR1olDqX3bHen+kp+23kMNPJk+teCJK4LxHEZj2wVIrTJRddi
	0xtHvJXrtpWA38o6vXYxi51L7Q4vLdp68XopBSp8XddsZ9Nyggzg2kVHy69Nr7iB
	JCBW0zxOtuv39pMKDa/x4UxgXP7zMPZh3nJFw+M4k+ysFf63qD3R6yjw5NuK2NpN
	PmYuHJ5a84YAhyU4nqB8dWHTzE+awlBaa082PxpeBspZxGDZ3vYxkoeM5GdG2st+
	xTKcuReGQFiOKfeJtxZZ420YTXRzmHZtp1JLA3vU/LlGwR44j7WticrGxjRxRrcF
	5MBQgNOkX/14HJGjomuq1q/IVkUHA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj5d7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:00 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TGe2Hg005069;
	Fri, 29 Aug 2025 16:52:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj5d7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGJsUW002612;
	Fri, 29 Aug 2025 16:51:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mtgcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:51:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TGptIu40173934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:51:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 504992004B;
	Fri, 29 Aug 2025 16:51:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9E772004D;
	Fri, 29 Aug 2025 16:51:42 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.115.92])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 16:51:42 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [bpf-next v2 0/5] powerpc64/bpf: Add support for bpf arena and arena atomics
Date: Fri, 29 Aug 2025 22:21:30 +0530
Message-ID: <20250829165135.1273071-1-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eIvg7BVF2e0ZLGaTL43BuaQXJGTQZtVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDE0MCBTYWx0ZWRfX8J72g+sxb4tK
 8tRmeIRLhgCzybAVwkfu0iJL0FB67/NKwDhiuPZFOYH6XAaAY0mGffn5AvZrM/lgo7ebzyTP5bH
 oO1Y8FSEDNLVW4H7OfWfuxFlfI15wHMzSwbsw4yhfa29F8NcOFN7ImOOKg2saLPYEP5U1ieCEKq
 zGQCUqCoaBmYTuXf0Rugp8Pl1gE9MbYfFCa6WdIaWvYn5QcjWrCnltnQ8rVJ5dGAtLwu8UpmlSe
 SSdg7bb/0KOuGn8g4Aep+saxYOchXelEyqOYFZqnn6HNff9IuI4NFTms+9SnaXKJGjy9agmT1rJ
 Ppi4EOHXUhzWUO2ht0dpdap/GX26ol1X7q/C7iJ8vTtyXaEfpi/+lt2GUIV+WvKUKSmOVIfnaQo
 S4iQs8BE
X-Authority-Analysis: v=2.4 cv=YfW95xRf c=1 sm=1 tr=0 ts=68b1dab0 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=2OwXVqhp2XgA:10 a=NlV2FhzisVifXC3_P1sA:9
X-Proofpoint-ORIG-GUID: gu0QOT9AvOPte3FWcTY5ebvVom2qsnhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series introduces support for the PROBE_MEM32,
bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
facilitating the implementation of BPF arena and arena atomics.

The last patch in the series has fix for arena spinlock selftest
failure.

All selftests related to bpf_arena, bpf_arena_atomic(except
load_acquire/store_release) enablement are passing:

# ./test_progs -t arena_list
#5/1     arena_list/arena_list_1:OK
#5/2     arena_list/arena_list_1000:OK
#5       arena_list:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t arena_htab
#4/1     arena_htab/arena_htab_llvm:OK
#4/2     arena_htab/arena_htab_asm:OK
#4       arena_htab:OK
Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t verifier_arena
#464/1   verifier_arena/basic_alloc1:OK
#464/2   verifier_arena/basic_alloc2:OK
#464/3   verifier_arena/basic_alloc3:OK
#464/4   verifier_arena/iter_maps1:OK
#464/5   verifier_arena/iter_maps2:OK
#464/6   verifier_arena/iter_maps3:OK
#464     verifier_arena:OK
#465/1   verifier_arena_large/big_alloc1:OK
#465/2   verifier_arena_large/big_alloc2:OK
#465     verifier_arena_large:OK
Summary: 2/8 PASSED, 0 SKIPPED, 0 FAILED

# ./test_progs -t arena_atomics
#3/1     arena_atomics/add:OK
#3/2     arena_atomics/sub:OK
#3/3     arena_atomics/and:OK
#3/4     arena_atomics/or:OK
#3/5     arena_atomics/xor:OK
#3/6     arena_atomics/cmpxchg:OK
#3/7     arena_atomics/xchg:OK
#3/8     arena_atomics/uaf:OK
#3/9     arena_atomics/load_acquire:SKIP
#3/10    arena_atomics/store_release:SKIP
#3       arena_atomics:OK (SKIP: 2/10)
Summary: 1/8 PASSED, 2 SKIPPED, 0 FAILED

All selftests related to arena_spin_lock are passing:

# ./test_progs -t arena_spin_lock
#6/1     arena_spin_lock/arena_spin_lock_1:OK
#6/2     arena_spin_lock/arena_spin_lock_1000:OK
#6/3     arena_spin_lock/arena_spin_lock_50000:OK
#6       arena_spin_lock:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED

Changes since v1:

Addressed comments from Chris:
* Squashed introduction of bpf_jit_emit_probe_mem_store() and its usage in
  one patch.
* Defined and used PPC_RAW_RLDICL_DOT to avoid the CMPDI.
* Removed conditional statement for fixup[0] = PPC_RAW_LI(dst_reg, 0);
* Indicated this change is limited to powerpc64 in subject.

Addressed comments from Alexei:
* Removed skel->rodata->nr_cpus = get_nprocs() and its usage to get
  currently online cpus(as it needs to be updated from userspace).

Saket Kumar Bhaskar (5):
  powerpc64/bpf: Implement PROBE_MEM32 pseudo instructions
  powerpc64/bpf: Implement bpf_addr_space_cast instruction
  powerpc64/bpf: Introduce bpf_jit_emit_atomic_ops() to emit atomic
    instructions
  powerpc64/bpf: Implement PROBE_ATOMIC instructions
  selftests/bpf: Fix arena_spin_lock selftest failure

 arch/powerpc/include/asm/ppc-opcode.h         |   1 +
 arch/powerpc/net/bpf_jit.h                    |   6 +-
 arch/powerpc/net/bpf_jit_comp.c               |  32 +-
 arch/powerpc/net/bpf_jit_comp32.c             |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c             | 401 +++++++++++++-----
 .../bpf/prog_tests/arena_spin_lock.c          |  13 +
 .../selftests/bpf/progs/arena_spin_lock.c     |   5 +-
 7 files changed, 347 insertions(+), 113 deletions(-)

-- 
2.43.5


