Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E295E34AA52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:42:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6Pnt6bfvz3d4q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 01:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6PnY64qTz2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 01:42:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6PnR4Ky0z9v0Nc;
 Fri, 26 Mar 2021 15:42:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id CVOEt96TWs_n; Fri, 26 Mar 2021 15:42:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6PnR3NyVz9v0NB;
 Fri, 26 Mar 2021 15:42:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E5CD8B8D9;
 Fri, 26 Mar 2021 15:42:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PwkSzDQZPpbn; Fri, 26 Mar 2021 15:42:05 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25D228B8D7;
 Fri, 26 Mar 2021 15:42:04 +0100 (CET)
Subject: Re: [PATCH v2 0/8] Implement EBPF on powerpc32
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
References: <cover.1616430991.git.christophe.leroy@csgroup.eu>
 <CAEf4BzZjNK_La1t5FGyie02FCABBieZJod49rW4=WtMs7ELLSw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <86028d25-c3fe-3765-f7c3-12448523405a@csgroup.eu>
Date: Fri, 26 Mar 2021 15:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAEf4BzZjNK_La1t5FGyie02FCABBieZJod49rW4=WtMs7ELLSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 john fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, naveen.n.rao@linux.ibm.com,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Martin Lau <kafai@fb.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/03/2021 à 18:53, Andrii Nakryiko a écrit :
> On Mon, Mar 22, 2021 at 9:37 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> This series implements extended BPF on powerpc32. For the implementation
>> details, see the patch before the last.
>>
>> The following operations are not implemented:
>>
>>                  case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
>>                  case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
>>                  case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) += src */
>>
>> The following operations are only implemented for power of two constants:
>>
>>                  case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %= imm */
>>                  case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
>>
>> Below are the results on a powerpc 885:
>> - with the patch, with and without bpf_jit_enable
>> - without the patch, with bpf_jit_enable (ie with CBPF)
>>
>> With the patch, with bpf_jit_enable = 1 :
>>
>> [   60.826529] test_bpf: Summary: 378 PASSED, 0 FAILED, [354/366 JIT'ed]
>> [   60.832505] test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
>>
>> With the patch, with bpf_jit_enable = 0 :
>>
>> [   75.186337] test_bpf: Summary: 378 PASSED, 0 FAILED, [0/366 JIT'ed]
>> [   75.192325] test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
>>
>> Without the patch, with bpf_jit_enable = 1 :
>>
>> [  186.112429] test_bpf: Summary: 371 PASSED, 7 FAILED, [119/366 JIT'ed]
>>
>> Couldn't run test_progs because it doesn't build (clang 11 crashes during the build).
> 
> Can you please try checking out the latest clang from sources and use
> that one instead?

The crash is fixed, it builds one step more, then fails at:

[root@PC-server-ldb bpf]# make CROSS_COMPILE=ppc-linux- ARCH=powerpc V=1
/root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/host-tools/sbin/bpftool gen skeleton 
/root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/atomic_bounds.o > 
/root/gen_ldb/linux-powerpc/tools/testing/selftests/bpf/atomic_bounds.skel.h
libbpf: elf: endianness mismatch in atomic_bounds.
Error: failed to open BPF object file: Endian mismatch

I'm cross-building on x86 for powerpc/32

[root@PC-server-ldb bpf]# file atomic_bounds.o
atomic_bounds.o: ELF 64-bit MSB relocatable, eBPF, version 1 (SYSV), with debug_info, not stripped

Christophe
