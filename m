Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 964401F8159
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 08:49:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kSqZ473zzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 16:48:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kSn85tZ5zDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 16:46:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49kSmy5MQRz9twtx;
 Sat, 13 Jun 2020 08:46:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sNXi3cRrh7Ub; Sat, 13 Jun 2020 08:46:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49kSmy3vdrz9twtw;
 Sat, 13 Jun 2020 08:46:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF5FF8B771;
 Sat, 13 Jun 2020 08:46:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o_sKFmexd0LZ; Sat, 13 Jun 2020 08:46:43 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E6A0B8B76A;
 Sat, 13 Jun 2020 08:46:42 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
To: Nick Desaulniers <ndesaulniers@google.com>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <49YBKY13Szz9sT4@ozlabs.org>
 <20200611224355.71174-1-ndesaulniers@google.com>
 <20200611235256.GL31009@gate.crashing.org>
 <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1d1f9aee-ff13-d18b-9454-1580067d7c71@csgroup.eu>
Date: Sat, 13 Jun 2020 06:46:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkKywb1KZ-SDwwuvQEmbsaAzJj9mEPqVG=qw1F5Ogv8rw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/12/2020 09:33 PM, Nick Desaulniers wrote:
> 
> IIUC the bug report correctly, it looks like LLVM is failing for the
> __put_user_asm2_goto case for -m32.  A simple reproducer:
> https://godbolt.org/z/jBBF9b
> 
> void foo(long long in, long long* out) {
> asm volatile(
>    "stw%X1 %0, %1\n\t"
>    "stw%X1 %L0, %L1"
>    ::"r"(in), "m"(*out));
> }
> prints (in GCC):
> foo:
>    stw 3, 0(5)
>    stw 4, 4(5)
>    blr
> (first time looking at ppc assembler, seems constants and registers
> are not as easy to distinguish,
> https://developer.ibm.com/technologies/linux/articles/l-ppc/ say "Get
> used to it." LOL, ok).

When I do ppc-linux-objdump -d vmlinux, registers and constants are 
easily distinguished, see below.

c0002284 <start_here>:
c0002284:	3c 40 c0 3c 	lis     r2,-16324
c0002288:	60 42 45 00 	ori     r2,r2,17664
c000228c:	3c 82 40 00 	addis   r4,r2,16384
c0002290:	38 84 04 30 	addi    r4,r4,1072
c0002294:	7c 93 43 a6 	mtsprg  3,r4
c0002298:	3c 20 c0 3e 	lis     r1,-16322
c000229c:	38 21 e0 00 	addi    r1,r1,-8192
c00022a0:	38 00 00 00 	li      r0,0
c00022a4:	94 01 1f f0 	stwu    r0,8176(r1)
c00022a8:	48 35 e7 41 	bl      c03609e8 <early_init>
c00022ac:	38 60 00 00 	li      r3,0
c00022b0:	7f e4 fb 78 	mr      r4,r31
c00022b4:	48 35 e7 8d 	bl      c0360a40 <machine_init>
c00022b8:	48 35 eb e1 	bl      c0360e98 <MMU_init>
c00022bc:	3c c0 c0 3c 	lis     r6,-16324
c00022c0:	3c c6 40 00 	addis   r6,r6,16384
c00022c4:	7c df c3 a6 	mtspr   799,r6
c00022c8:	3c 80 c0 00 	lis     r4,-16384
c00022cc:	60 84 22 e4 	ori     r4,r4,8932
c00022d0:	3c 84 40 00 	addis   r4,r4,16384
c00022d4:	38 60 10 02 	li      r3,4098
c00022d8:	7c 9a 03 a6 	mtsrr0  r4
c00022dc:	7c 7b 03 a6 	mtsrr1  r3
c00022e0:	4c 00 00 64 	rfi
c00022e4:	7c 00 02 e4 	tlbia
c00022e8:	7c 00 04 ac 	hwsync
c00022ec:	3c c6 c0 00 	addis   r6,r6,-16384
c00022f0:	3c a0 c0 3c 	lis     r5,-16324
c00022f4:	60 a5 40 00 	ori     r5,r5,16384
c00022f8:	90 a0 00 f0 	stw     r5,240(0)
c00022fc:	3c a5 40 00 	addis   r5,r5,16384
c0002300:	90 c5 00 00 	stw     r6,0(r5)
c0002304:	38 80 10 32 	li      r4,4146
c0002308:	3c 60 c0 35 	lis     r3,-16331
c000230c:	60 63 d6 a8 	ori     r3,r3,54952
c0002310:	7c 7a 03 a6 	mtsrr0  r3
c0002314:	7c 9b 03 a6 	mtsrr1  r4
c0002318:	4c 00 00 64 	rfi

For GCC, I think you call tell you want register names with -mregnames

Christophe
