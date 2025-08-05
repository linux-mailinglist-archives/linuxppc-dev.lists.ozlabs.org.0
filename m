Return-Path: <linuxppc-dev+bounces-10644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30189B1B0E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 11:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx7FK5d0mz3064;
	Tue,  5 Aug 2025 19:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754385637;
	cv=none; b=XIt6timpGalwPZTm5gJIf3q1cKyWqF6mC8qChNiJxMIFeKMCqa1DA8Jnoa+tjjMc588ufJrRJd/TdNF8LBNdS+tD0USsRhbF8c4UFfFMp0UOAsLu1Ab8FEfvT/9fBFw3/Tn2GbSW7lD5hF4ixrSQnfTyPWfnkZVFhzwC8wnQMy2zQrqpoc1wUfiZ8xOT32VKoed33QbVXze9u6n3jhOIinTSJ98CAb5LtS2eYX0PIMaUiShz/OB6pn+edT+jvDDC3XoRy0WnhUlcQvrwQ0cskpHWd8VgGjW3BFhGxybuThv2uB/4Of9MltcegyK9PC9POj54wyUm27/USt0eiiszBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754385637; c=relaxed/relaxed;
	bh=CBrrvSaPA5MonzYhzA5TrnEGvQfCVf5g6Ia5pCKwZ8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UE9cvMhHYVZzZ6RoGJqt3q/QLZgm3KxPpEzmlcYcfzSYqlqmAyZEenChG+NdtWsALVw8vDytCPqMHLo/hj0CjJIUJHFTO3P3RJcRw+sMazfaUHQ9lvKVIEancJdjrU5z5wIJHuYaM4TTRUWtcg8JQrwuR8fCz6tivosc6yHp/SEfN/UI8BvNzN5HzIuSmhFB6txxmbuec+nZnLzX9mAsILj/ZevK535Mt6er7AdGWVH/2NjwoNt9eMF4xwbwNwKQxT8Muos3mMN+VPf1ojaDWbunIMUhdX/fQTAALBYIQfI9fdanlixGkhspJKBX4wNyug/7kwi1mUdTvwAAUqlXIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx7FK1R8Pz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 19:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bx57n0CXYz9tMd;
	Tue,  5 Aug 2025 09:45:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuSqCUxyKqzr; Tue,  5 Aug 2025 09:45:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bx57m6FKRz9tMS;
	Tue,  5 Aug 2025 09:45:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD7068B765;
	Tue,  5 Aug 2025 09:45:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id flY4ShmDsG9w; Tue,  5 Aug 2025 09:45:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8ACC88B763;
	Tue,  5 Aug 2025 09:45:39 +0200 (CEST)
Message-ID: <5af0d7d9-71cb-4977-b496-6046c2c64d52@csgroup.eu>
Date: Tue, 5 Aug 2025 09:45:39 +0200
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
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250805062747.3479221-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
> This patch series introduces support for the PROBE_MEM32,
> bpf_addr_space_cast and PROBE_ATOMIC instructions in the powerpc BPF JIT,
> facilitating the implementation of BPF arena and arena atomics.

This series seems to be limited to powerpc64. Please make it explicit in 
all patches subject, see exemple below:

$ git log --oneline arch/powerpc/net/bpf_jit_comp64.c
cf2a6de32cabb (tag: powerpc-6.17-2, origin/next-test, origin/next) 
powerpc64/bpf: Add jit support for load_acquire and store_release
59ba025948be2 powerpc/bpf: fix JIT code size calculation of bpf trampoline
d243b62b7bd3d powerpc64/bpf: Add support for bpf trampolines
9670f6d2097c4 powerpc64/bpf: Fold bpf_jit_emit_func_call_hlp() into 
bpf_jit_emit_func_call_rel()
fde318326daa4 powerpc64/bpf: jit support for signed division and modulo
597b1710982d1 powerpc64/bpf: jit support for sign extended mov
717756c9c8dda powerpc64/bpf: jit support for sign extended load
a71c0b09a14db powerpc64/bpf: jit support for unconditional byte swap
3c086ce222cef powerpc64/bpf: jit support for 32bit offset jmp instruction
b1e7cee961274 powerpc/bpf: enforce full ordering for ATOMIC operations 
with BPF_FETCH
61688a82e047a powerpc/bpf: enable kfunc call


> 
> The last patch in the series has fix for arena spinlock selftest
> failure.
> 
> This series is rebased on top of:
> https://lore.kernel.org/bpf/20250717202935.29018-2-puranjay@kernel.org/
> 
> All selftests related to bpf_arena, bpf_arena_atomic(except
> load_acquire/store_release) enablement are passing:
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
> 
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


