Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C03102DCEEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 10:56:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxS7d4qwfzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 20:56:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxS5p55ZPzDqNV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 20:54:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CxS5X2DHlz9v0PW;
 Thu, 17 Dec 2020 10:54:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1Zv_-zH0n3ZU; Thu, 17 Dec 2020 10:54:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CxS5X19YGz9v0PP;
 Thu, 17 Dec 2020 10:54:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 65DAC8B7EB;
 Thu, 17 Dec 2020 10:54:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qEOXafSG18AY; Thu, 17 Dec 2020 10:54:41 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 540E18B7CD;
 Thu, 17 Dec 2020 10:54:40 +0100 (CET)
Subject: Re: [RFC PATCH v1 7/7] powerpc/bpf: Implement extended BPF on PPC32
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <cover.1608112796.git.christophe.leroy@csgroup.eu>
 <1fed5e11ba08ee28d12f3f57986e5b143a6aa937.1608112797.git.christophe.leroy@csgroup.eu>
 <20201217061133.lnfnhbzvikgtjb3i@ast-mbp>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <854404a0-1951-91d9-2ebb-208390a64c77@csgroup.eu>
Date: Thu, 17 Dec 2020 10:54:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201217061133.lnfnhbzvikgtjb3i@ast-mbp>
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
Cc: songliubraving@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, ast@kernel.org, naveen.n.rao@linux.ibm.com,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, kpsingh@chromium.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/12/2020 à 07:11, Alexei Starovoitov a écrit :
> On Wed, Dec 16, 2020 at 10:07:37AM +0000, Christophe Leroy wrote:
>> Implement Extended Berkeley Packet Filter on Powerpc 32
>>
>> Test result with test_bpf module:
>>
>> 	test_bpf: Summary: 378 PASSED, 0 FAILED, [354/366 JIT'ed]
> 
> nice!
> 
>> Registers mapping:
>>
>> 	[BPF_REG_0] = r11-r12
>> 	/* function arguments */
>> 	[BPF_REG_1] = r3-r4
>> 	[BPF_REG_2] = r5-r6
>> 	[BPF_REG_3] = r7-r8
>> 	[BPF_REG_4] = r9-r10
>> 	[BPF_REG_5] = r21-r22 (Args 9 and 10 come in via the stack)
>> 	/* non volatile registers */
>> 	[BPF_REG_6] = r23-r24
>> 	[BPF_REG_7] = r25-r26
>> 	[BPF_REG_8] = r27-r28
>> 	[BPF_REG_9] = r29-r30
>> 	/* frame pointer aka BPF_REG_10 */
>> 	[BPF_REG_FP] = r31
>> 	/* eBPF jit internal registers */
>> 	[BPF_REG_AX] = r19-r20
>> 	[TMP_REG] = r18
>>
>> As PPC32 doesn't have a redzone in the stack,
>> use r17 as tail call counter.
>>
>> r0 is used as temporary register as much as possible. It is referenced
>> directly in the code in order to avoid misuse of it, because some
>> instructions interpret it as value 0 instead of register r0
>> (ex: addi, addis, stw, lwz, ...)
>>
>> The following operations are not implemented:
>>
>> 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
>> 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
>> 		case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) += src */
>>
>> The following operations are only implemented for power of two constants:
>>
>> 		case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %= imm */
>> 		case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
> 
> Those are sensible limitations. MOD and DIV are rare, but XADD is common.
> Please consider doing it as a cmpxchg loop in the future.
> 
> Also please run test_progs. It will give a lot better coverage than test_bpf.ko
> 

I'm having hard time cross building test_progs:

~/linux-powerpc/tools/testing/selftests/bpf/$ make CROSS_COMPILE=ppc-linux-
...
   GEN 
/home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/build/bpftool/Documentation/bpf-helpers.7
   INSTALL  eBPF_helpers-manpage
   INSTALL  Documentation-man
   GEN      vmlinux.h
/bin/sh: /home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/sbin/bpftool: cannot execute 
binary file
make: *** [/home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/include/vmlinux.h] Error 126
make: *** Deleting file `/home/chr/linux-powerpc/tools/testing/selftests/bpf/tools/include/vmlinux.h'

Looks like it builds bpftool for powerpc and tries to run it on my x86.
How should I proceed ?

Thanks
Christophe
