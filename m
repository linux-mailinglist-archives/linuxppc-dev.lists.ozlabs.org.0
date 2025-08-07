Return-Path: <linuxppc-dev+bounces-10726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A235B1D8CA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 15:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bySQP1v5Bz3cRp;
	Thu,  7 Aug 2025 23:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754572685;
	cv=none; b=KlV500Mw0nMNDI/8LmR1ApsECJR5nwHU/IxOJiwfQmDo/pTQSKh9DtshnEEmofhwOD4CQeYmXep2E/GWx3rDo46als4P5DweLvPPDnsIBu1efT6wtnYv1WybCcSKWLjPHt7vqf8dlDlrv0U01iMurXxa3ZgeKRnHufvx8VDNbTgwtToe0v7sS4OBZdGJH/TBDoB+R1lQLr80jP4a9wlacB7zcgKC6+eAvjcfopLBRojsS37ayCDM9PwqdMMa4fRWRjX4wxw4fC65f/xRESfa5eHEkV5l83DQLTdkbmReacwAUYBQ7ScFgEUDerqKYgLYztH9YJYmU5NWmx/4+kn4bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754572685; c=relaxed/relaxed;
	bh=ReRMI1w5O5kV+P3X1vvXZsrm2JTNYKpxE8su60j9QmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHOoe6VZccaVPQ/CQV7Rx8wWNh0pK3m+PrJxDKlzdOeIcvlK3Db28YdUvYlpjsoii6Sp5PKW/e6Ee08xuJnpR6a4a/Lcch3zZHuA9vai4FHB1Tk1bbWLripTGOhQ8x8sNp1yRR3QuO1ZDhUc2s3WVqCGNU681xZvlAQBnz+w7KsHXemXjwYQXASrYqI08V9IBP+8/YedUHcF3599Y4l/M5m0Uu6G7+WV+WAtwul9u/EXhX870rzLdKyfpsv7o8GmzFRJr452p+D398CqSHKs+JocBZWWIc6/5JgEXwCUk/qk0X8XXOZs4fgy6ggXO2G6Y+NIBuhZjuvVRxlgcs+oJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iME6Fw4Q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iME6Fw4Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bySQN21Hjz3cRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 23:18:03 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577Cmb0p019634;
	Thu, 7 Aug 2025 13:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ReRMI1
	w5O5kV+P3X1vvXZsrm2JTNYKpxE8su60j9QmI=; b=iME6Fw4Q2AlpWBaRqruKU0
	/GUbmKqw2xwrh/F0+EI0Dco3u13BS6bex2gFBJwzTRgAtBBWHEk2ogIY1FajKvNC
	s2HHB8rzH+e9Eaa8ppYyLisNVMV5yiNYtVGJ7nYcZ+uO0+4Rs64UfQFJD73MsRTw
	kSUZbdv4cDY/7gB4ur++wcS7fza48BngaDpm47myHNy8mDmdt/WAFKUCymWiZ96w
	Z689RwinbhzWd1DyRYS4ibGuBdQj70dZrYpS+zXd0n7MGiEn+Gd0kNAlnxwxumee
	L8i0FsL5Fct/0eb8FoyTeNGAkjxt3Ug5zura4qow9J+PrighkNiI9of5zGfulfMA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26tynbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:17:32 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 577DHVaX002921;
	Thu, 7 Aug 2025 13:17:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48c26tynb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:17:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5779vWDG007960;
	Thu, 7 Aug 2025 13:17:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48bpwn0r16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 13:17:30 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 577DHQf450594166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Aug 2025 13:17:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBEC620040;
	Thu,  7 Aug 2025 13:17:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C35DA20043;
	Thu,  7 Aug 2025 13:17:19 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.43.75.32])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Aug 2025 13:17:19 +0000 (GMT)
Date: Thu, 7 Aug 2025 18:47:16 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: Re: [bpf-next 0/6] bpf,powerpc: Add support for bpf arena and arena
 atomics
Message-ID: <aJSnXO62QRglnNsw@linux.ibm.com>
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
 <e918bef7-5f9b-4591-b671-fe3c0f681862@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e918bef7-5f9b-4591-b671-fe3c0f681862@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YXGzjED4pJhXligsrAzBvBlxy0HdLnrb
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6894a76c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=alihBsh1ZAGIVrIkydwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: 6kbce07YtCxIaLhugwtQhO4aIFlYDmMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDEwMyBTYWx0ZWRfX4IsiQ9WBU6y2
 730rC1TJZQZvrnmYLmcctkvELPG9Ir9+k1xV0LCmmDwFZPHtUJQVUFuotTz0tkwZJTROc1TnoMO
 mqeXIuP2v8cgnspXRlQzjrKT3ZV/DyHY7uMJmyNQ0GaR7r0XTfCYS3zxykukzQsIb21U/E7LEU9
 h5vcEDlvr1rWF/wViHhmEEH9eIb22oAXPCPI/OeYJhmQAxjQcgloGRNdbwAjccQLaynVLE+UQi+
 aPuG2RSH71pzS2DOfEIwjbhsdzI2jc8+56bPCZPaHnrbxkC3uoe4uyNbjDgWXamUZ3yMxkfwfTD
 kF4YG+5AMOpmuOMoKcLqIv5VM9zXwwsEdkoCynpBBDwHsyWQeydAL2Y8adqd02yJT8xS2/n9C2N
 WYMm/vBkT9JSDhz1Ww2dQnUmvU39rGXpO2SULE+ZdoOILjjCtwdHOQnI0GssfxeZNWwALFPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508070103
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 05:37:00PM +0530, Venkat Rao Bagalkote wrote:
> 
> On 05/08/25 11:57 am, Saket Kumar Bhaskar wrote:
> > This patch series introduces support for the PROBE_MEM32,
> > bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
> > facilitating the implementation of BPF arena and arena atomics.
> > 
> > The last patch in the series has fix for arena spinlock selftest
> > failure.
> > 
> > This series is rebased on top of:
> > https://lore.kernel.org/bpf/20250717202935.29018-2-puranjay@kernel.org/
> > 
> > All selftests related to bpf_arena, bpf_arena_atomic(except
> > load_acquire/store_release) enablement are passing:
> 
> 
> Hello Saket,
> 
> 
> I see couple of selftests are failing on my set up.
> 
> > 
> > # ./test_progs -t arena_list
> > #5/1     arena_list/arena_list_1:OK
> > #5/2     arena_list/arena_list_1000:OK
> > #5       arena_list:OK
> > Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
> > 
> > # ./test_progs -t arena_htab
> > #4/1     arena_htab/arena_htab_llvm:OK
> > #4/2     arena_htab/arena_htab_asm:OK
> > #4       arena_htab:OK
> > Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED
> > 
> > # ./test_progs -t verifier_arena
> > #464/1   verifier_arena/basic_alloc1:OK
> > #464/2   verifier_arena/basic_alloc2:OK
> > #464/3   verifier_arena/basic_alloc3:OK
> > #464/4   verifier_arena/iter_maps1:OK
> > #464/5   verifier_arena/iter_maps2:OK
> > #464/6   verifier_arena/iter_maps3:OK
> > #464     verifier_arena:OK
> > #465/1   verifier_arena_large/big_alloc1:OK
> > #465/2   verifier_arena_large/big_alloc2:OK
> > #465     verifier_arena_large:OK
> > Summary: 2/8 PASSED, 0 SKIPPED, 0 FAILED
> 
> 
> All error logs:
> tester_init:PASS:tester_log_buf 0 nsec
> process_subtest:PASS:obj_open_mem 0 nsec
> process_subtest:PASS:specs_alloc 0 nsec
> run_subtest:PASS:obj_open_mem 0 nsec
> run_subtest:PASS:unexpected_load_failure 0 nsec
> do_prog_test_run:PASS:bpf_prog_test_run 0 nsec
> run_subtest:FAIL:1103 Unexpected retval: 4 != 0
> #513/7   verifier_arena/reserve_invalid_region:FAIL
> #513     verifier_arena:FAIL
> Summary: 1/14 PASSED, 0 SKIPPED, 1 FAILED
> 
> 
Hi Venkat,

It is known failure. This selftest was added recently. We are working on it to
fix this. Will post the fix for this selftest separately.
> > 
> > # ./test_progs -t arena_atomics
> > #3/1     arena_atomics/add:OK
> > #3/2     arena_atomics/sub:OK
> > #3/3     arena_atomics/and:OK
> > #3/4     arena_atomics/or:OK
> > #3/5     arena_atomics/xor:OK
> > #3/6     arena_atomics/cmpxchg:OK
> > #3/7     arena_atomics/xchg:OK
> > #3/8     arena_atomics/uaf:OK
> > #3/9     arena_atomics/load_acquire:SKIP
> > #3/10    arena_atomics/store_release:SKIP
> > #3       arena_atomics:OK (SKIP: 2/10)
> > Summary: 1/8 PASSED, 2 SKIPPED, 0 FAILED
> > 
> > All selftests related to arena_spin_lock are passing:
> > 
> > # ./test_progs -t arena_spin_lock
> > #6/1     arena_spin_lock/arena_spin_lock_1:OK
> > #6/2     arena_spin_lock/arena_spin_lock_1000:OK
> > #6/3     arena_spin_lock/arena_spin_lock_50000:OK
> > #6       arena_spin_lock:OK
> > Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED
> test_arena_spin_lock_size:FAIL:check counter value unexpected check counter
> value: actual 15999 != expected 16000
> #6/1     arena_spin_lock/arena_spin_lock_1:FAIL
> #6       arena_spin_lock:FAIL
> Summary: 0/2 PASSED, 0 SKIPPED, 1 FAILED

This too, with llvm-19 the failure is known to us, where llvm doesn't have support for
may_goto insn https://github.com/llvm/llvm-project/commit/0e0bfacff71859d1f9212205f8f873d47029d3fb.
Though, there is else condition which is envoked incase llvm doesn't have support for may_goto insn,
which we are looking into.

Since llvm-20 has support for may_goto, we are not seeing this failure there(the selftest passes).
So we are planning to fix this in separate patch for llvm-19 for now.

Regards,
Saket
> > Saket Kumar Bhaskar (6):
> >    bpf,powerpc: Introduce bpf_jit_emit_probe_mem_store() to emit store
> >      instructions
> >    bpf,powerpc: Implement PROBE_MEM32 pseudo instructions
> >    bpf,powerpc: Implement bpf_addr_space_cast instruction
> >    bpf,powerpc: Introduce bpf_jit_emit_atomic_ops() to emit atomic
> >      instructions
> >    bpf,powerpc: Implement PROBE_ATOMIC instructions
> >    selftests/bpf: Fix arena_spin_lock selftest failure
> > 
> >   arch/powerpc/net/bpf_jit.h                    |   6 +-
> >   arch/powerpc/net/bpf_jit_comp.c               |  32 +-
> >   arch/powerpc/net/bpf_jit_comp32.c             |   2 +-
> >   arch/powerpc/net/bpf_jit_comp64.c             | 378 +++++++++++++-----
> >   .../bpf/prog_tests/arena_spin_lock.c          |  23 +-
> >   .../selftests/bpf/progs/arena_spin_lock.c     |   8 +-
> >   .../selftests/bpf/progs/bpf_arena_spin_lock.h |   4 +-
> >   7 files changed, 348 insertions(+), 105 deletions(-)
> > 
> > base-commit: ea2aecdf7a954a8c0015e185cc870c4191d1d93f
> 
> 
> Regards,
> 
> Venkat.
> 

