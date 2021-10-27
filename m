Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BFD43C466
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 09:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfLXP3g5Zz2yg1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 18:53:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfLWz65mCz2xDl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 18:52:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HfLWv2XvYz9sSp;
 Wed, 27 Oct 2021 09:52:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nELBF9Gp1kl; Wed, 27 Oct 2021 09:52:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HfLWv1S8Vz9sSX;
 Wed, 27 Oct 2021 09:52:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DAB48B76D;
 Wed, 27 Oct 2021 09:52:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XQM_XwLyO2yc; Wed, 27 Oct 2021 09:52:43 +0200 (CEST)
Received: from [192.168.203.162] (unknown [192.168.203.162])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9660C8B763;
 Wed, 27 Oct 2021 09:52:42 +0200 (CEST)
Message-ID: <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
Date: Wed, 27 Oct 2021 09:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: instruction storage exception handling
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>,
 Jacques de Laval <jacques.delaval@protonmail.com>,
 Scott Wood <oss@buserror.net>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
 <1635318932.od1ierwsis.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1635318932.od1ierwsis.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/10/2021 à 09:47, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of October 27, 2021 3:51 pm:
>>
>>
>> Le 27/10/2021 à 07:25, Nicholas Piggin a écrit :
>>> Excerpts from Christophe Leroy's message of October 27, 2021 3:00 pm:
>>>>
>>>>
>>>> Le 27/10/2021 à 06:10, Nicholas Piggin a écrit :
>>>>> Excerpts from Jacques de Laval's message of October 26, 2021 6:07 am:
>>>>>> Hi,
>>>>>>
>>>>>> We are trying to upgrade kernel from 5.10 to 5.14.11. We have a Freescale/NXP
>>>>>> T1023 SOC with two e5500 cores, and are running in 32-bit mode:
>>>>>>
>>>>>> 	CONFIG_PPC32=y
>>>>>> 	# CONFIG_PPC64 is not set
>>>>>>
>>>>>> 	#
>>>>>> 	# Processor support
>>>>>> 	#
>>>>>> 	# CONFIG_PPC_BOOK3S_32 is not set
>>>>>> 	CONFIG_PPC_85xx=y
>>>>>> 	# CONFIG_PPC_8xx is not set
>>>>>> 	# CONFIG_40x is not set
>>>>>> 	# CONFIG_44x is not set
>>>>>> 	CONFIG_GENERIC_CPU=y
>>>>>> 	# CONFIG_E5500_CPU is not set
>>>>>> 	# CONFIG_E6500_CPU is not set
>>>>>> 	CONFIG_E500=y
>>>>>> 	CONFIG_PPC_E500MC=y
>>>>>> 	CONFIG_PPC_FPU_REGS=y
>>>>>> 	CONFIG_PPC_FPU=y
>>>>>> 	CONFIG_FSL_EMB_PERFMON=y
>>>>>> 	CONFIG_FSL_EMB_PERF_EVENT=y
>>>>>> 	CONFIG_FSL_EMB_PERF_EVENT_E500=y
>>>>>> 	CONFIG_BOOKE=y
>>>>>> 	CONFIG_FSL_BOOKE=y
>>>>>> 	CONFIG_PPC_FSL_BOOK3E=y
>>>>>> 	CONFIG_PTE_64BIT=y
>>>>>> 	CONFIG_PHYS_64BIT=y
>>>>>> 	CONFIG_PPC_MMU_NOHASH=y
>>>>>> 	CONFIG_PPC_BOOK3E_MMU=y
>>>>>> 	# CONFIG_PMU_SYSFS is not set
>>>>>> 	CONFIG_SMP=y
>>>>>> 	CONFIG_NR_CPUS=2
>>>>>> 	CONFIG_PPC_DOORBELL=y
>>>>>> 	# end of Processor support
>>>>>>
>>>>>> We compile using 32-bit Bootlin PPC toolchain:
>>>>>>
>>>>>> 	powerpc-e500mc glibc bleeding-edge 2020.08-1.
>>>>>>
>>>>>> When booting, and starting PID 1 we sometimes get a hang. Nothing but our init
>>>>>> process is running, and for debugging purposes our init currently looks like
>>>>>> this:
>>>>>>
>>>>>> 	int main(int argc, char *argv[]){
>>>>>> 		for (int i = 0; ; i++) {
>>>>>> 			FILE *fp = fopen("/dev/kmsg", "w");
>>>>>> 			if (fp) {
>>>>>> 				fprintf(fp, "%d\n", i);
>>>>>> 				fclose(fp);
>>>>>> 			}
>>>>>> 			sleep(1);
>>>>>> 		}
>>>>>> 		return 0;
>>>>>> 	}
>>>>>>
>>>>>> When the hangup occur we don't get any output at all from our PID 1.
>>>>>> The last output is from the kernel:
>>>>>>
>>>>>> 	Run /sbin/init as init process
>>>>>> 	  with arguments:
>>>>>> 	    /sbin/init
>>>>>> 	  with environment:
>>>>>> 	    HOME=/
>>>>>> 	    TERM=linux
>>>>>> 	    kgdboc=ttyS0,115200
>>>>>>
>>>>>> When issuing a backtrace on all active cpus we can see that the kernel is
>>>>>> handling an instruction storage exception:
>>>>>>
>>>>>> 	sysrq: Show backtrace of all active CPUs
>>>>>> 	sysrq: CPU0:
>>>>>> 	CPU: 0 PID: 1 Comm: init Not tainted 5.14.11 #1
>>>>>> 	NIP:  c02aac78 LR: c02aac2c CTR: 00000000
>>>>>> 	REGS: c1907d40 TRAP: 0500   Not tainted  (5.14.11)
>>>>>> 	MSR:  00029002 <CE,EE,ME>  CR: 82244284  XER: 20000000
>>>>>> 	GPR00: 0000000f c1907e20 c1910000 0065a000 000001d0 01100cca c1907e84 0000000c
>>>>>> 	GPR08: d39a8000 000001d3 0000000c c1907f10 42244284 00000000 00740514 bfb71670
>>>>>> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7c1c478
>>>>>> 	GPR24: 00708558 00701698 d3994040 00029002 c1907f20 0065a238 00000355 d39a2790
>>>>>> 	NIP [c02aac78] handle_mm_fault+0xf8/0x11f0
>>>>>> 	LR [c02aac2c] handle_mm_fault+0xac/0x11f0
>>>>>> 	Call Trace:
>>>>>> 	[c1907e20] [c02aac10] handle_mm_fault+0x90/0x11f0 (unreliable)
>>>>>> 	[c1907ec0] [c003078c] ___do_page_fault+0x26c/0x780
>>>>>> 	[c1907ef0] [c0030cd4] do_page_fault+0x34/0x100
>>>>>> 	[c1907f10] [c0000988] InstructionStorage+0x108/0x120
>>>>>> 	--- interrupt: 400 at 0x65a238
>>>>>> 	NIP:  0065a238 LR: 0052f26c CTR: 0052f260
>>>>>> 	REGS: c1907f20 TRAP: 0400   Not tainted  (5.14.11)
>>>>>> 	MSR:  0002d002 <CE,EE,PR,ME>  CR: 42242284  XER: 00000000
>>>>>> 	GPR00: b7be9914 bfb71620 b7c203a0 8c008000 0070400d b7c182a0 000b8260 0052f260
>>>>>> 	GPR08: 0047d448 0052f260 0000000a 00000003 42242284 00000000 00740514 bfb71670
>>>>>> 	GPR16: 007040e6 00701418 b7c1a5f0 00702f18 00000000 bfb71690 0000fff1 b7c1c478
>>>>>> 	GPR24: 00708558 00701698 00700000 00000015 b7c1c2b0 00707e20 b7c1b8a8 bfb71660
>>>>>> 	NIP [0065a238] 0x65a238
>>>>>> 	LR [0052f26c] 0x52f26c
>>>>>> 	--- interrupt: 400
>>>>>> 	Instruction dump:
>>>>>> 	60a500c0 811f0020 57aa6cfa 813f0000 57a30026 809f004c 81080024 7d29e850
>>>>>> 	90a1002c 5529a33e 93c10038 7d244a14 <90610034> 7d485215 91210030 41c203dc
>>>>>>
>>>>>> We have also observed that the CPU is continuously servicing the same interrupt
>>>>>> (north of 140k times per sec), it is not deadlocked.
>>>>>>
>>>>>> We have not yet been able to reproduce this behavior under QEMU system
>>>>>> emulation.
>>>>>>
>>>>>> When bisecting between 5.10 and 5.14.11 we can see that this behavior started
>>>>>> with commit a01a3f2ddbcda83e8572787c0ec1dcbeba86915a:
>>>>>>
>>>>>> 	powerpc: remove arguments from fault handler functions
>>>>>
>>>>> Thank you for the excellent work to investigate and report this.
>>>>>
>>>>>>
>>>>>> Our best guess that the instruction storage exception is not properly handled
>>>>>> and the kernel is never able to recover from the page fault, but we don't
>>>>>> really know how to proceed. Does anyone have any suggestions or insights?
>>>>>
>>>>> Before my patch, zero was passed to the page fault error code, after
>>>>> my patch it passes the contents of ESR SPR.
>>>>>
>>>>> It looks like the BookE instruction access interrupt does not set ESR
>>>>> (except for BO interrupts maybe?) so you're getting what was in the ESR
>>>>> register from a previous interrupt, and maybe if that was a store then
>>>>> access_error won't cause a segfault because is_exec is true so that
>>>>> test bails out early, then it might just keep retrying the interrupt.
>>>>>
>>>>> That could explain why you don't always see the same thing.
>>>>>
>>>>> Now previous code still saved ESR in regs->esr/dsisr for some reason.
>>>>> I can't quite see why that should have been necessary though. Does
>>
>> According to the e500 Reference Manual, on ISI:
>>
>> BO is set if the instruction fetch caused a byte-ordering exception;
>> otherwise cleared. *All* other defined ESR bits are *cleared*.
> 
> You're right. In that case it shouldn't change anything unless there
> was a BO fault. I'm not sure what the problem is then. Guessing based
> on the NIP and instructions, it looks like it's probably got the correct
> user address that it's storing into vmf on the stack, so it has got past
> the access checks so my theory would be wrong anyway.
> 
> Must be something simple but I can't see it yet.
> 

Anyway, I think it is still worth doing the check with setting 0 in 
_ESR(r11), maybe the Reference Manual is wrong.

So Jacques, please do the test anyway if you can.

Thanks
Christophe
