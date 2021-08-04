Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C41B3E01EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfsyS3DMBz3cXN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 23:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfsy56nsKz3bNv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 23:28:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gfsxx5dt9z9sWr;
 Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNwnHIadWABF; Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gfsxx4PqTz9sWq;
 Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 722F78B7A7;
 Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MTAWowFn5j68; Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 303FE8B7A1;
 Wed,  4 Aug 2021 15:28:21 +0200 (CEST)
Subject: Re: [PATCH] powerpc/32s: Fix napping restore in data storage
 interrupt (DSI)
To: Nicholas Piggin <npiggin@gmail.com>
References: <731694e0885271f6ee9ffc179eb4bcee78313682.1628003562.git.christophe.leroy@csgroup.eu>
 <ce20d16c-b0b2-94c-3e22-794d95c376b@linux-m68k.org>
 <b04a90a9-9d62-2192-f896-ea99be911604@csgroup.eu>
 <8fb08f68-ed01-65f9-fb9e-66abf2b18a00@csgroup.eu>
 <1628068469.gv4bl1fw7w.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d8e1f924-ca60-4dcc-ac5f-3801ea226edf@csgroup.eu>
Date: Wed, 4 Aug 2021 15:28:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628068469.gv4bl1fw7w.astroid@bobo.none>
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
Cc: userm57@yahoo.com, Finn Thain <fthain@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/08/2021 à 13:36, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of August 4, 2021 4:21 pm:
>> Hi Nic,
>>
>> I think I'll need your help on that one.
>>
>> Le 04/08/2021 à 08:07, Christophe Leroy a écrit :
>>>
>>>
>>> Le 04/08/2021 à 06:04, Finn Thain a écrit :
> 
> Hi Finn!
> 
>>>> On Tue, 3 Aug 2021, Christophe Leroy wrote:
>>>>
>> ...
>>>>
>>>> ------------[ cut here ]------------
>>>> kernel BUG at arch/powerpc/kernel/interrupt.c:49!
>>>> Oops: Exception in kernel mode, sig: 5 [#1]
>>>> BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
>>>> Modules linked in:
>>>> CPU: 0 PID: 1859 Comm: xfce4-session Not tainted 5.13.0-pmac-VMAP #10
>>>> NIP:  c0011474 LR: c0011464 CTR: 00000000
>>>> REGS: e2f75e40 TRAP: 0700   Not tainted  (5.13.0-pmac-VMAP)
>>>> MSR:  00021032 <ME,IR,DR,RI>  CR: 2400446c  XER: 20000000
>>>>
>>>> GPR00: c001604c e2f75f00 ca284a60 00000000 00000000 a5205eb0 00000008 00000020
>>>> GPR08: ffffffc0 00000001 501200d9 ce030005 ca285010 00c1f778 00000000 00000000
>>>> GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a6a6aecc
>>>> GPR24: 00000000 ffffffc0 00000020 00000008 a5205eb0 00000000 e2f75f40 000000ae
>>>> NIP [c0011474] system_call_exception+0x60/0x164
>>>> LR [c0011464] system_call_exception+0x50/0x164
>>>> Call Trace:
>>>> [e2f75f00] [00009000] 0x9000 (unreliable)
>>>> [e2f75f30] [c001604c] ret_from_syscall+0x0/0x28
>>>> --- interrupt: c00 at 0xa69d6cb0
>>>> NIP:  a69d6cb0 LR: a69d6c3c CTR: 00000000
>>>> REGS: e2f75f40 TRAP: 0c00   Not tainted  (5.13.0-pmac-VMAP)
>>>> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2400446c  XER: 20000000
>>>>
>>>> GPR00: 000000ae a5205de0 a5687ca0 00000000 00000000 a5205eb0 00000008 00000020
>>>> GPR08: ffffffc0 401201ea 401200d9 ffffffff c158f230 00c1f778 00000000 00000000
>>>> GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a6a6aecc
>>>> GPR24: afb72fc8 00000000 00000001 a5205f30 afb733dc 00000000 a6b85ff4 a5205eb0
>>>> NIP [a69d6cb0] 0xa69d6cb0
>>>> LR [a69d6c3c] 0xa69d6c3c
>>>> --- interrupt: c00
>>>> Instruction dump:
>>>> 7cdb3378 93810020 7cbc2b78 93a10024 7c9d2378 93e1002c 7d3f4b78 4800d629
>>>> 817e0084 931e0088 69690002 5529fffe <0f090000> 69694000 552997fe 0f090000
>>>> ---[ end trace c66c6c3c44806276 ]---
>>>>
>>
>> Getting a BUG at arch/powerpc/kernel/interrupt.c:49 meaning MSR_RI is not set, but the c00 interrupt
>> frame shows MSR_RI properly set, so what ?
> 
> Could the stack be correct but regs pointer incorrect?
> 
> Instruction dump is
> 
>     0:   78 33 db 7c     mr      r27,r6
>     4:   20 00 81 93     stw     r28,32(r1)
>     8:   78 2b bc 7c     mr      r28,r5
>     c:   24 00 a1 93     stw     r29,36(r1)
>    10:   78 23 9d 7c     mr      r29,r4
>    14:   2c 00 e1 93     stw     r31,44(r1)
>    18:   78 4b 3f 7d     mr      r31,r9
>    1c:   29 d6 00 48     bl      0xd644
>    20:   84 00 7e 81     lwz     r11,132(r30)
>    24:   88 00 1e 93     stw     r24,136(r30)
>    28:   02 00 69 69     xori    r9,r11,2
>    2c:   fe ff 29 55     rlwinm  r9,r9,31,31,31
>    30:   00 00 09 0f     twnei   r9,0
>    34:   00 40 69 69     xori    r9,r11,16384
>    38:   fe 97 29 55     rlwinm  r9,r9,18,31,31
>    3c:   00 00 09 0f     twnei   r9,0
> 
> regs->msr is in r11 == 0xce030005 so some kernel address?
> 
> r1  == 0xe2f75f00
> r30 == 0xe2f75f40
> 
> I think that matches if the function allocates 48 bytes of stack.
> STACK_FRAME_OVERHEAD is 16, so the difference would be 0x40 in that
> case. Seems okay.
> 
> I'm not sure then. Can you get a hash fault interrupt come in here
> because of the vmap stack access and clobber r11? Hmm...
> 
> fast_hash_page_return:
>          andis.  r10, r9, SRR1_ISI_NOPT@h        /* Set on ISI, cleared on DSI */
> 
> Is that really right? DSI can set this bit for NOHPTE as well no?

On DSI, the error bits are in DSISR while they are in SRR1 on ISI.

r9 is supposed to contain SRR1 in both cases. Powerpc 32 bits programming manual explicitely says 
that bits 1-4 and 10-15 of SRR1 are cleared on DSI.

Thanks,
Christophe
