Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3234AD19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 18:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6T2h70Dmz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 04:08:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6T2N1Vxfz3btl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 04:08:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6T2C1KLlz9v0NF;
 Fri, 26 Mar 2021 18:08:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rDVdr6z5uMnq; Fri, 26 Mar 2021 18:08:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6T2C04MNz9v0ND;
 Fri, 26 Mar 2021 18:08:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1E138B8D7;
 Fri, 26 Mar 2021 18:08:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YBCh2D0tTF4r; Fri, 26 Mar 2021 18:08:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB47E8B8C7;
 Fri, 26 Mar 2021 18:08:18 +0100 (CET)
Subject: Re: VDSO ELF header
To: Dmitry Safonov <0x7f454c46@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Laurent Dufour <ldufour@linux.ibm.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
 <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
 <e8c2b4b5-f0b6-945e-4a42-c2308dd719a2@gmail.com>
 <3ce8811a-9216-6164-cdf2-974b13e400d3@csgroup.eu>
 <edf2547f-4705-764b-dadd-3ec1d2a6b8b3@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4904769a-be42-cdd2-1d97-8b1889f7f723@csgroup.eu>
Date: Fri, 26 Mar 2021 18:07:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <edf2547f-4705-764b-dadd-3ec1d2a6b8b3@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/03/2021 à 17:32, Dmitry Safonov a écrit :
> On 3/26/21 4:11 PM, Christophe Leroy wrote:
> [..]
>>>>
>>>> Dmitry proposed the same, see
>>>> https://github.com/0x7f454c46/linux/commit/783c7a2532d2219edbcf555cc540eab05f698d2a
>>>>
>>>>
>>>>
>>>> Discussion at https://github.com/checkpoint-restore/criu/issues/1417
>>>
>>> Yeah, I didn't submit it officially to lkml because I couldn't test it
>>> yet (and I usually don't send untested patches). The VM I have fails to
>>> kexec and there's some difficulty to get serial console working, so I'd
>>> appreciate if someone could either pick it up, or add tested-by.
>>>
>>
>> Just to let everyone know, while testing your patch with selftest I
>> encountered the following Oops. But I also have it without your patch
>> thought.
> 
> Thank you, Christophe!
> 
>>
>> root@vgoip:~# ./sigreturn_vdso
>> test: sigreturn_vdso
>> tags: git_version:v5.12-rc4-1553-gc31141d460e6
>> VDSO is at 0x104000-0x10bfff (32768 bytes)
>> Signal delivered OK with VDSO mapped
>> VDSO moved to 0x77bf4000-0x77bfbfff (32768 bytes)
>> Signal delivered OK with VDSO moved
>> Unmapped VDSO
>> [ 1855.444371] Kernel attempted to read user page (7ff9ff30) - exploit
>> attempt? (uid: 0)
>> [ 1855.459404] BUG: Unable to handle kernel data access on read at
>> 0x7ff9ff30
>> [ 1855.466188] Faulting instruction address: 0xc00111d4
>> [ 1855.471099] Oops: Kernel access of bad area, sig: 11 [#1]
>> [ 1855.476428] BE PAGE_SIZE=16K PREEMPT CMPC885
>> [ 1855.480702] SAF3000 DIE NOTIFICATION
>> [ 1855.484184] CPU: 0 PID: 362 Comm: sigreturn_vdso Not tainted
>> 5.12.0-rc4-s3k-dev-01553-gc31141d460e6 #4811
>> [ 1855.493644] NIP:  c00111d4 LR: c0005a28 CTR: 00000000
>> [ 1855.498634] REGS: cadb3dd0 TRAP: 0300   Not tainted
>> (5.12.0-rc4-s3k-dev-01553-gc31141d460e6)
>> [ 1855.507068] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48000884  XER: 20000000
>> [ 1855.513866] DAR: 7ff9ff30 DSISR: 88000000
>> [ 1855.513866] GPR00: c0007788 cadb3e90 c28dc000 7ff9ff30 7ff9ff40
>> 000004e0 7ff9fd50 00000000
>> [ 1855.513866] GPR08: 00000001 00000001 7ff9ff30 00000000 28000282
>> 1001b7e8 100a0920 00000000
>> [ 1855.513866] GPR16: 100cac0c 100b0000 102883a4 10289685 100d0000
>> 100d0000 100d0000 100b2e9e
>> [ 1855.513866] GPR24: ffffffff 102883c8 00000000 7ff9ff38 cadb3f40
>> cadb3ec8 c28dc000 00000000
>> [ 1855.552767] NIP [c00111d4] flush_icache_range+0x90/0xb4
>> [ 1855.557932] LR [c0005a28] handle_signal32+0x1bc/0x1c4
>> [ 1855.562925] Call Trace:
>> [ 1855.565332] [cadb3e90] [100d0000] 0x100d0000 (unreliable)
>> [ 1855.570666] [cadb3ec0] [c0007788] do_notify_resume+0x260/0x314
>> [ 1855.576432] [cadb3f20] [c000c764] syscall_exit_prepare+0x120/0x184
>> [ 1855.582542] [cadb3f30] [c00100b4] ret_from_syscall+0xc/0x28
>> [ 1855.588050] --- interrupt: c00 at 0xfe807f8
>> [ 1855.592183] NIP:  0fe807f8 LR: 10001048 CTR: c0139378
>> [ 1855.597174] REGS: cadb3f40 TRAP: 0c00   Not tainted
>> (5.12.0-rc4-s3k-dev-01553-gc31141d460e6)
>> [ 1855.605607] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000282  XER:
>> 20000000
>> [ 1855.612664]
>> [ 1855.612664] GPR00: 00000025 7ffa0230 77c09690 00000000 0000000a
>> 28000282 00000001 0ff03a38
>> [ 1855.612664] GPR08: 0000d032 00000328 c28dc000 00000009 88000282
>> 1001b7e8 100a0920 00000000
>> [ 1855.612664] GPR16: 100cac0c 100b0000 102883a4 10289685 100d0000
>> 100d0000 100d0000 100b2e9e
>> [ 1855.612664] GPR24: ffffffff 102883c8 00000000 77bff628 10002358
>> 10010000 1000210c 00008000
>> [ 1855.648894] NIP [0fe807f8] 0xfe807f8
>> [ 1855.652426] LR [10001048] 0x10001048
>> [ 1855.655954] --- interrupt: c00
>> [ 1855.658969] Instruction dump:
>> [ 1855.661893] 38630010 7c001fac 38630010 4200fff0 7c0004ac 4c00012c
>> 4e800020 7c001fac
>> [ 1855.669811] 2c0a0000 38630010 4082ffcc 4bffffe4 <7c00186c> 2c070000
>> 39430010 4082ff8c
>> [ 1855.677910] ---[ end trace f071a5587092b3aa ]---
>> [ 1855.682462]
>> Remapped the stack executable
>> !! child died by signal 11
>> failure: sigreturn_vdso
> 
> Yes, it seems unrelated.
> Probably, a bit hacky solution to this one could be:
> 
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -911,7 +911,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t
> *oldset,
>          }
>          user_write_access_end();
> 
> -       if (tramp == (unsigned long)mctx->mc_pad)
> +       if ((tramp == (unsigned long)mctx->mc_pad) && access_ok(tramp,
> 2*sizeof(unsigned long)))
>                  flush_icache_range(tramp, tramp + 2 * sizeof(unsigned
> long));
> 
>          regs->link = tramp;
> --
> 
> But it's up to you, it seems power-related.
> 


No, the problem is that user access has to be allowed for the flush()

A hacky solution would be to call user_access_begin() , will test that later


Christophe
