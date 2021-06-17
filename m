Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD73AB9D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 18:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5SNg4gznz308Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 02:36:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5SNG4BgQz2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 02:35:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G5SN65Hk0zBFHn;
 Thu, 17 Jun 2021 18:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uK1ZQBeUIsl9; Thu, 17 Jun 2021 18:35:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G5SN64Md9zBFHk;
 Thu, 17 Jun 2021 18:35:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B1E78B819;
 Thu, 17 Jun 2021 18:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VmdzIM2qLhKQ; Thu, 17 Jun 2021 18:35:34 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBDBC8B801;
 Thu, 17 Jun 2021 18:35:33 +0200 (CEST)
Subject: Re: Oops (NULL pointer) with 'perf record' of selftest 'null_syscall'
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <c141a18c-b18d-b775-1848-527c35a1c433@csgroup.eu>
 <3388922c-0224-e4aa-f7b7-4fea43e060f9@linux.ibm.com>
 <6102EF12-AFB2-48B1-B707-D3F5471EADDB@linux.vnet.ibm.com>
 <bc2dac10-9e60-e4b7-c376-5ed00f6e227c@csgroup.eu>
 <2F349581-2E44-4C63-A75C-966FA32F26C2@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <549cda2e-a7cf-5c69-d459-02ac62e75f24@csgroup.eu>
Date: Thu, 17 Jun 2021 18:35:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2F349581-2E44-4C63-A75C-966FA32F26C2@linux.vnet.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/06/2021 à 08:36, Athira Rajeev a écrit :
> 
> 
>> On 16-Jun-2021, at 11:56 AM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 16/06/2021 à 05:40, Athira Rajeev a écrit :
>>>> On 16-Jun-2021, at 8:53 AM, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>>>>
>>>>
>>>> On 6/15/21 8:35 PM, Christophe Leroy wrote:
>>>>> For your information, I'm getting the following Oops. Detected with 5.13-rc6, it also oopses on 
>>>>> 5.12 and 5.11.
>>>>> Runs ok on 5.10. I'm starting bisecting now.
>>>>
>>>>
>>>> Thanks for reporting, got the issue. What has happened in this case is that, pmu device is not 
>>>> registered
>>>> and trying to access the instruction point which will land in perf_instruction_pointer(). And 
>>>> recently I have added
>>>> a workaround patch for power10 DD1 which has caused this breakage. My bad. We are working on a 
>>>> fix patch
>>>> for the same and will post it out. Sorry again.
>>>>
>>> Hi Christophe,
>>> Can you please try with below patch in your environment and test if it works for you.
>>> From 55d3afc9369dfbe28a7152c8e9f856c11c7fe43d Mon Sep 17 00:00:00 2001
>>> From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> Date: Tue, 15 Jun 2021 22:28:11 -0400
>>> Subject: [PATCH] powerpc/perf: Fix crash with 'perf_instruction_pointer' when
>>> pmu is not set
>>> On systems without any specific PMU driver support registered, running
>>> perf record causes oops:
>>> [   38.841073] NIP [c00000000013af54] perf_instruction_pointer+0x24/0x100
>>> [   38.841079] LR [c0000000003c7358] perf_prepare_sample+0x4e8/0x820
>>> [   38.841085] --- interrupt: 300
>>> [   38.841088] [c00000001cf03440] [c0000000003c6ef8] perf_prepare_sample+0x88/0x820 (unreliable)
>>> [   38.841096] [c00000001cf034a0] [c0000000003c76d0] perf_event_output_forward+0x40/0xc0
>>> [   38.841104] [c00000001cf03520] [c0000000003b45e8] __perf_event_overflow+0x88/0x1b0
>>> [   38.841112] [c00000001cf03570] [c0000000003b480c] perf_swevent_hrtimer+0xfc/0x1a0
>>> [   38.841119] [c00000001cf03740] [c0000000002399cc] __hrtimer_run_queues+0x17c/0x380
>>> [   38.841127] [c00000001cf037c0] [c00000000023a5f8] hrtimer_interrupt+0x128/0x2f0
>>> [   38.841135] [c00000001cf03870] [c00000000002962c] timer_interrupt+0x13c/0x370
>>> [   38.841143i] [c00000001cf038d0] [c000000000009ba4] decrementer_common_virt+0x1a4/0x1b0
>>> [   38.841151] --- interrupt: 900 at copypage_power7+0xd4/0x1c0
>>> During perf record session, perf_instruction_pointer() is called to
>>> capture the sample ip. This function in core-book3s accesses ppmu->flags.
>>> If a platform specific PMU driver is not registered, ppmu is set to NULL
>>> and accessing its members results in a crash. Fix this crash by checking
>>> if ppmu is set.
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>> Fixes: 2ca13a4cc56c ("powerpc/perf: Use regs->nip when SIAR is zero")
>> Cc: stable@vger.kernel.org
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Hi Christophe,
> 
> Thanks for testing with the change. I have a newer version where I have added braces around the check.
> Can you please check once and can I add your tested-by for the below patch.

Yes it works, you can add my Tested-by:
Please also add Cc: stable@vger.kernel.org, this needs to be backported as soon as possible.

Thanks
Christophe
