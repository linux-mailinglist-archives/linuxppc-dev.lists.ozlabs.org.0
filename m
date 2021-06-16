Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C083A926D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:28:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4ZyJ4zChz3cPh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:28:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Zwb1XHwz3cFm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 16:27:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G4ZwR5hyPzBDp5;
 Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mokktGxeEX1d; Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G4ZwR4n3bzBDnw;
 Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4FFA8B7CC;
 Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cT32hOg5FNXZ; Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E1538B7CA;
 Wed, 16 Jun 2021 08:27:03 +0200 (CEST)
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
 <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
Date: Wed, 16 Jun 2021 08:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/06/2021 à 05:40, Athira Rajeev a écrit :
> 
> 
>> On 16-Jun-2021, at 8:53 AM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>>
>>
>> On 6/15/21 8:35 PM, Christophe Leroy wrote:
>>> For your information, I'm getting the following Oops. Detected with 5.13-rc6, it also oopses on 5.12 and 5.11.
>>> Runs ok on 5.10. I'm starting bisecting now.
>>
>>
>> Thanks for reporting, got the issue. What has happened in this case is that, pmu device is not registered
>> and trying to access the instruction point which will land in perf_instruction_pointer(). And recently I have added
>> a workaround patch for power10 DD1 which has caused this breakage. My bad. We are working on a fix patch
>> for the same and will post it out. Sorry again.
>>
> 
> Hi Christophe,
> 
> Can you please try with below patch in your environment and test if it works for you.
> 
>  From 55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 2001
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Date: Tue, 15 Jun 2021 22:28:11 -0400
> Subject: [PATCH] powerpc/perf: Fix crash with 'perf_instruction_pointer' when
>   pmu is not set
> 
> On systems without any specific PMU driver support registered, running
> perf record causes oops:
> 
> [   38.841073] NIP [c00000000013af54] perf_instruction_pointer+0x24/0x100
> [   38.841079] LR [c0000000003c7358] perf_prepare_sample+0x4e8/0x820
> [   38.841085] --- interrupt: 300
> [   38.841088] [c00000001cf03440] [c0000000003c6ef8] perf_prepare_sample+0x88/0x820 (unreliable)
> [   38.841096] [c00000001cf034a0] [c0000000003c76d0] perf_event_output_forward+0x40/0xc0
> [   38.841104] [c00000001cf03520] [c0000000003b45e8] __perf_event_overflow+0x88/0x1b0
> [   38.841112] [c00000001cf03570] [c0000000003b480c] perf_swevent_hrtimer+0xfc/0x1a0
> [   38.841119] [c00000001cf03740] [c0000000002399cc] __hrtimer_run_queues+0x17c/0x380
> [   38.841127] [c00000001cf037c0] [c00000000023a5f8] hrtimer_interrupt+0x128/0x2f0
> [   38.841135] [c00000001cf03870] [c00000000002962c] timer_interrupt+0x13c/0x370
> [   38.841143i] [c00000001cf038d0] [c000000000009ba4] decrementer_common_virt+0x1a4/0x1b0
> [   38.841151] --- interrupt: 900 at copypage_power7+0xd4/0x1c0
> 
> During perf record session, perf_instruction_pointer() is called to
> capture the sample ip. This function in core-book3s accesses ppmu->flags.
> If a platform specific PMU driver is not registered, ppmu is set to NULL
> and accessing its members results in a crash. Fix this crash by checking
> if ppmu is set.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Fixes: 2ca13a4cc56c ("powerpc/perf: Use regs->nip when SIAR is zero")
Cc: stable@vger.kernel.org
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/perf/core-book3s.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 16d4d1b6a1ff..816756588cb7 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2254,7 +2254,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   	bool use_siar = regs_use_siar(regs);
>   	unsigned long siar = mfspr(SPRN_SIAR);
>   
> -	if (ppmu->flags & PPMU_P10_DD1) {
> +	if (ppmu && ppmu->flags & PPMU_P10_DD1) {
>   		if (siar)
>   			return siar;
>   		else
> 
