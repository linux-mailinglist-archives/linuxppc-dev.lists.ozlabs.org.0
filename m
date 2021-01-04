Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A742E96B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 15:05:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8cpf02M9zDqNT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 01:05:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8cmc70XxzDqDG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 01:03:36 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 11D7A7F358D0;
 Mon,  4 Jan 2021 15:03:26 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 4 Jan 2021
 15:03:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d5da9b64-da8c-42c2-b526-71373a01c04d,
 E6F5FD2F8B81D51FFC90B89046B6334D311E5876) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 17/23] powerpc/watchdog: Declare soft_nmi_interrupt()
 prototype
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-18-clg@kaod.org>
 <8174a721-0407-1788-c2d1-dd4b274b314e@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8387a97a-75b6-02ec-421f-8184ff2caa03@kaod.org>
Date: Mon, 4 Jan 2021 15:03:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8174a721-0407-1788-c2d1-dd4b274b314e@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ae3e8330-5ed0-441e-8057-d9e7ae1b79b2
X-Ovh-Tracer-Id: 2318509386801712093
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeehtdeviefhgfeugfevjeeiveefvedtvdehhfejleduveejieefhfeffeetfeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/21/20 9:48 AM, Christophe Leroy wrote:
> 
> 
> Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
>> It fixes this W=1 compile error :
>>
>> ../arch/powerpc/kernel/watchdog.c:250:6: error: no previous prototype for ‘soft_nmi_interrupt’ [-Werror=missing-prototypes]
>>    250 | void soft_nmi_interrupt(struct pt_regs *regs)
>>        |      ^~~~~~~~~~~~~~~~~~
>>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h | 1 +
> 
> This is a misuse of asm/asm-prototypes.h

yes. <asm/nmi.h> is a better place.

Thanks for the review,

C. 


> This file is for prototypes of ASM functions.
> 
> See discussion at https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1463534212-4879-2-git-send-email-dja@axtens.net/
> 
> 
>>   arch/powerpc/kernel/watchdog.c            | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
>> index d0b832cbbec8..0f39eefbd5a5 100644
>> --- a/arch/powerpc/include/asm/asm-prototypes.h
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -84,6 +84,7 @@ void machine_check_exception(struct pt_regs *regs);
>>   void emulation_assist_interrupt(struct pt_regs *regs);
>>   long do_slb_fault(struct pt_regs *regs, unsigned long ea);
>>   void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
>> +void soft_nmi_interrupt(struct pt_regs *regs);
>>     /* signals, syscalls and interrupts */
>>   long sys_swapcontext(struct ucontext __user *old_ctx,
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>> index af3c15a1d41e..855716f563ac 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -27,6 +27,7 @@
>>   #include <linux/smp.h>
>>     #include <asm/paca.h>
>> +#include <asm/asm-prototypes.h>
>>     /*
>>    * The powerpc watchdog ensures that each CPU is able to service timers.
>>

