Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42B3A2A6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 13:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G124V2gswz3bsf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 21:36:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G12446pMKz306C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 21:36:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G123v3DB9zBC5V;
 Thu, 10 Jun 2021 13:36:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSoijWmDdUVV; Thu, 10 Jun 2021 13:36:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G123v2F7dzBC5R;
 Thu, 10 Jun 2021 13:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 391C38B80F;
 Thu, 10 Jun 2021 13:36:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6_f0uI08IMWG; Thu, 10 Jun 2021 13:36:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACD238B815;
 Thu, 10 Jun 2021 13:36:10 +0200 (CEST)
Subject: Re: [PATCH] powerpc/vdso: Fix multiple issues with sys_call_table
To: Michael Ellerman <mpe@ellerman.id.au>, Anton Blanchard
 <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20200306135705.7f80fcad@kryten.localdomain>
 <87pnd9duac.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bd19e9b8-a96b-90f8-5a0a-2643a1d860e4@csgroup.eu>
Date: Thu, 10 Jun 2021 13:36:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87pnd9duac.fsf@mpe.ellerman.id.au>
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
Cc: christophe.leroy@c-s.fr, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/03/2020 à 02:10, Michael Ellerman a écrit :
> Anton Blanchard <anton@ozlabs.org> writes:
>> The VDSO exports a bitmap of valid syscalls. vdso_setup_syscall_map()
>> sets this up, but there are both little and big endian bugs. The issue
>> is with:
>>
>>         if (sys_call_table[i] != sys_ni_syscall)
>>
>> On little endian, instead of comparing pointers to the two functions,
>> we compare the first two instructions of each function. If a function
>> happens to have the same first two instructions as sys_ni_syscall, then
>> we have a spurious match and mark the instruction as not implemented.
>> Fix this by removing the inline declarations.
>>
>> On big endian we have a further issue where sys_ni_syscall is a function
>> descriptor and sys_call_table[] holds pointers to the instruction text.
>> Fix this by using dereference_kernel_function_descriptor().
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> 
> That's some pretty epic breakage.
> 
> Is it even worth keeping, or should we just rip it out and declare that
> the syscall map is junk? Userspace can hardly rely on it given it's been
> this broken for so long.
> 
> If not it would be really nice to have a selftest of this stuff so we
> can verify it works and not break it again in future.
> 

The problem on little endian is fixed by https://github.com/linuxppc/linux/commit/bc9d5bfc4 I think.

On big endian, I can't see any problem. Looks like sys_call_table in a vmlinux generated with 
ppc64_defconfig contains addresses of items in the opd. So it should be ok, shoudln't it ?

[root@po9473vm linux-powerpc]# powerpc64-linux-objdump -x vmlinux | grep -e " sys_call_table" -e 
ni_syscall
c000000000fc0748 g       .rodata	0000000000000000 sys_call_table
c00000000019fd90 g     F .text	0000000000000028 .sys_ni_syscall
c000000001cc3678 g     F .opd	0000000000000018 sys_ni_syscall

[root@po9473vm linux-powerpc]# powerpc64-linux-objdump -s -j .rodata vmlinux
Contents of section .rodata:
...
  c000000000fc0740 a610e9ee a3f43156 c0000000 01cc0888  ......1V........
  c000000000fc0750 c0000000 01cbf5c8 c0000000 01cbe788  ................
  c000000000fc0760 c0000000 01cf6768 c0000000 01cf6798  ......gh......g.
  c000000000fc0770 c0000000 01cf6240 c0000000 01cf5dd8  ......b@......].
  c000000000fc0780 c0000000 01cbf670 c0000000 01cf61e0  .......p......a.
  c000000000fc0790 c0000000 01cf8490 c0000000 01cf8580  ................
  c000000000fc07a0 c0000000 01cf7890 c0000000 01cf5e50  ......x.......^P
  c000000000fc07b0 c0000000 01ccf120 c0000000 01cf8358  ....... .......X
  c000000000fc07c0 c0000000 01cf6060 c0000000 01cf6108  ......``......a.
  c000000000fc07d0 c0000000 01cc3678 c0000000 01cc3678  ......6x......6x
  c000000000fc07e0 c0000000 01cf63a8 c0000000 01cc1680  ......c.........
  c000000000fc07f0 c0000000 01cfac50 c0000000 01cc3678  .......P......6x
...


Do you agree ?

Christophe
