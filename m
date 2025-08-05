Return-Path: <linuxppc-dev+bounces-10649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6DB1B309
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 14:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxByH60tPz3069;
	Tue,  5 Aug 2025 22:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754395671;
	cv=none; b=m9PVIOxpiD2fwOYTDbSxI73MmXdrHV5Qt1dmERK60Jtn1pyJzGev1iTT88eHM2bLKw+N4KkKFJbojRntfXPM4UrILzIu8bg3C56Z+aM335gaLMxZRGFOaLcN20MWteKAPA7IVFE9YP5MQildrsor/+kESdsMHEa4SuEGK6FwUzm1vCvulj6XA/DJdByO9dqbVY0agqk+Ty4nQMHPkdf0xgCt4He9WOmRo5Z660sfgoJHkJXYGUPPoVHTpOIuJM76A7a9fZUIHBjdGm4h4aaYqooaMhEP8sUzulXsRnmHnz3ZmQA2zXRP8b+ucZeR38vUfg+hJMPqGQlpwFYsfJDikg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754395671; c=relaxed/relaxed;
	bh=dmBbf3vsbAhxRKAWpIUpnCOU2+QWNz069W2N+Af6Ybc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLj+YFOl17fM9pEGkdkX3bsTeMkBg1S83mdq8EJuA7UOdERraD2Jnr7k/AtvSs1NzeFpxUXd/HeEoUY1DHIxZUaPGPEDDI+RqwC9htwhYZghiEJXehuvLoIfnTZv+429SpWLnNjyCLeDANBL75wxzukLFzbUP5+iFryTcqvGeDSTZSY12zRksuZOIh2ThnJj+6cUMynvlFZiT3NHtmWCZrvNvqawwqHNdh+lrsWVbCrAkfsB1GNZaw7NNbBA9GtvGDE/0qBxWKIRsRsU20gdOFd/CnfZTUmP/6nebPvMIPaMgWWCqicWqRN+cGXP2/5ttBbaOkrpjI1mdbkuMyFOCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ab8b0Ynt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ab8b0Ynt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxByG68hzz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 22:07:50 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758wBMq025323;
	Tue, 5 Aug 2025 12:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dmBbf3
	vsbAhxRKAWpIUpnCOU2+QWNz069W2N+Af6Ybc=; b=Ab8b0YntlZLZOZXC2PHEtf
	1ysW3ggWrBFahvWuZt+H2eyWlcf89ZQ7/ZkPkcPMogier67m0KgIfwKKl9hX3DCj
	nTHLHUw0aiw6unk8qRS8Y3C33SMIySwRjy6oTcE1RGVUqORxwJIbxgRVYBSvig/b
	lYe78X73b8YyLWoz3PafJT1RHVXR3pHwodRdBwc6k36RuSChFOJyIxyI8cLzOUor
	dOIHgYO7ZSQWbDW5P/0lXkl2ozedD88mIJKjqcfThrd9gNWiDO9UtkUPTKsunuiK
	/JPS0HaoTyQ6d8MMH7OppLG+L5kgBpmmqS+WPb8gYQ2bnWgO+UybLOqv3IQqYMQA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48983t6mf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 12:07:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 575C2feI004587;
	Tue, 5 Aug 2025 12:07:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48983t6mf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 12:07:11 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5759ekUc001936;
	Tue, 5 Aug 2025 12:07:10 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 489y7kt3sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 12:07:10 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 575C79bZ30212698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Aug 2025 12:07:09 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAD195805D;
	Tue,  5 Aug 2025 12:07:08 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7279C58057;
	Tue,  5 Aug 2025 12:07:01 +0000 (GMT)
Received: from [9.61.255.245] (unknown [9.61.255.245])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Aug 2025 12:07:01 +0000 (GMT)
Message-ID: <e918bef7-5f9b-4591-b671-fe3c0f681862@linux.ibm.com>
Date: Tue, 5 Aug 2025 17:37:00 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next 0/6] bpf,powerpc: Add support for bpf arena and arena
 atomics
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250805062747.3479221-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4NiBTYWx0ZWRfX596WOsv8t2Nu
 6Ti0/7opO+/Q8aMNLWnOFfmjUNBB/zcIhHpT/MY5JSMv5Nk0fuL6essvF7IZ44Nh+PrH/2ckgaA
 LED6BNdCtHpuKc36EO0J1jVW1dDKSAFO8keFj9eTnSHIq9lm8mxQGUMgnY4qCW8K02H2tCxfsRb
 tBasacKbua117Y8aFxj1//ekizsGEEvS89PwaMUe13SMV8LOQGqQdQRQx/WfJXoOvx44AaV3GiD
 uaDVm66KmSL0IyB1qs2oYAS9yzErO4bSuNu7xHhgrlBh2SSWSNmQESSbdjyfgPdomNjg67sbY9o
 NYlLxtEYnOiJpq3/FY8J+cn2h4US8slemUKV9QY2YQRjGJLE+sOIYJKKDUa6sg9yK5aFwMAUFgN
 +Sqg5bbCgqALo5I5pW5aOkVCKsPHaznm/pYRNFF+70tXbeLkAanhLzw0JdscY3XgSdWf78Ai
X-Proofpoint-GUID: zwSgSe2PW3c_zdAjZHzvfg7IXhpW-4Nw
X-Proofpoint-ORIG-GUID: h9GzZ1uOk1OkDlOyj5wXqG3a1SKTHaOc
X-Authority-Analysis: v=2.4 cv=AZSxH2XG c=1 sm=1 tr=0 ts=6891f3f0 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=bY9AdTtUMlb7YCNkD7QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 05/08/25 11:57 am, Saket Kumar Bhaskar wrote:
> This patch series introduces support for the PROBE_MEM32,
> bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
> facilitating the implementation of BPF arena and arena atomics.
>
> The last patch in the series has fix for arena spinlock selftest
> failure.
>
> This series is rebased on top of:
> https://lore.kernel.org/bpf/20250717202935.29018-2-puranjay@kernel.org/
>
> All selftests related to bpf_arena, bpf_arena_atomic(except
> load_acquire/store_release) enablement are passing:


Hello Saket,


I see couple of selftests are failing on my set up.

>
> # ./test_progs -t arena_list
> #5/1     arena_list/arena_list_1:OK
> #5/2     arena_list/arena_list_1000:OK
> #5       arena_list:OK
> Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
>
> # ./test_progs -t arena_htab
> #4/1     arena_htab/arena_htab_llvm:OK
> #4/2     arena_htab/arena_htab_asm:OK
> #4       arena_htab:OK
> Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
>
> # ./test_progs -t verifier_arena
> #464/1   verifier_arena/basic_alloc1:OK
> #464/2   verifier_arena/basic_alloc2:OK
> #464/3   verifier_arena/basic_alloc3:OK
> #464/4   verifier_arena/iter_maps1:OK
> #464/5   verifier_arena/iter_maps2:OK
> #464/6   verifier_arena/iter_maps3:OK
> #464     verifier_arena:OK
> #465/1   verifier_arena_large/big_alloc1:OK
> #465/2   verifier_arena_large/big_alloc2:OK
> #465     verifier_arena_large:OK
> Summary: 2/8 PASSED, 0 SKIPPED, 0 FAILED


All error logs:
tester_init:PASS:tester_log_buf 0 nsec
process_subtest:PASS:obj_open_mem 0 nsec
process_subtest:PASS:specs_alloc 0 nsec
run_subtest:PASS:obj_open_mem 0 nsec
run_subtest:PASS:unexpected_load_failure 0 nsec
do_prog_test_run:PASS:bpf_prog_test_run 0 nsec
run_subtest:FAIL:1103 Unexpected retval: 4 != 0
#513/7   verifier_arena/reserve_invalid_region:FAIL
#513     verifier_arena:FAIL
Summary: 1/14 PASSED, 0 SKIPPED, 1 FAILED


>
> # ./test_progs -t arena_atomics
> #3/1     arena_atomics/add:OK
> #3/2     arena_atomics/sub:OK
> #3/3     arena_atomics/and:OK
> #3/4     arena_atomics/or:OK
> #3/5     arena_atomics/xor:OK
> #3/6     arena_atomics/cmpxchg:OK
> #3/7     arena_atomics/xchg:OK
> #3/8     arena_atomics/uaf:OK
> #3/9     arena_atomics/load_acquire:SKIP
> #3/10    arena_atomics/store_release:SKIP
> #3       arena_atomics:OK (SKIP: 2/10)
> Summary: 1/8 PASSED, 2 SKIPPED, 0 FAILED
>
> All selftests related to arena_spin_lock are passing:
>
> # ./test_progs -t arena_spin_lock
> #6/1     arena_spin_lock/arena_spin_lock_1:OK
> #6/2     arena_spin_lock/arena_spin_lock_1000:OK
> #6/3     arena_spin_lock/arena_spin_lock_50000:OK
> #6       arena_spin_lock:OK
> Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
test_arena_spin_lock_size:FAIL:check counter value unexpected check 
counter value: actual 15999 != expected 16000
#6/1     arena_spin_lock/arena_spin_lock_1:FAIL
#6       arena_spin_lock:FAIL
Summary: 0/2 PASSED, 0 SKIPPED, 1 FAILED
> Saket Kumar Bhaskar (6):
>    bpf,powerpc: Introduce bpf_jit_emit_probe_mem_store() to emit store
>      instructions
>    bpf,powerpc: Implement PROBE_MEM32 pseudo instructions
>    bpf,powerpc: Implement bpf_addr_space_cast instruction
>    bpf,powerpc: Introduce bpf_jit_emit_atomic_ops() to emit atomic
>      instructions
>    bpf,powerpc: Implement PROBE_ATOMIC instructions
>    selftests/bpf: Fix arena_spin_lock selftest failure
>
>   arch/powerpc/net/bpf_jit.h                    |   6 +-
>   arch/powerpc/net/bpf_jit_comp.c               |  32 +-
>   arch/powerpc/net/bpf_jit_comp32.c             |   2 +-
>   arch/powerpc/net/bpf_jit_comp64.c             | 378 +++++++++++++-----
>   .../bpf/prog_tests/arena_spin_lock.c          |  23 +-
>   .../selftests/bpf/progs/arena_spin_lock.c     |   8 +-
>   .../selftests/bpf/progs/bpf_arena_spin_lock.h |   4 +-
>   7 files changed, 348 insertions(+), 105 deletions(-)
>
> base-commit: ea2aecdf7a954a8c0015e185cc870c4191d1d93f


Regards,

Venkat.


