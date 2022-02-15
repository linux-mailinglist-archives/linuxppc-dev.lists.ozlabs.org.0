Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD64B6F67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 15:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jykb06jzzz3cTX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 01:52:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JykZX3Ywmz3bTS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 01:52:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JykZR3vl3z9sSC;
 Tue, 15 Feb 2022 15:51:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzdyMfHEghQL; Tue, 15 Feb 2022 15:51:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JykZR2pRtz9sQv;
 Tue, 15 Feb 2022 15:51:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E19B8B778;
 Tue, 15 Feb 2022 15:51:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QWce0lNxMQK9; Tue, 15 Feb 2022 15:51:59 +0100 (CET)
Received: from [192.168.6.174] (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7DA128B763;
 Tue, 15 Feb 2022 15:51:58 +0100 (CET)
Message-ID: <5c7b5334-6071-f131-a509-9a49ca3d628c@csgroup.eu>
Date: Tue, 15 Feb 2022 15:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
 <6dc50f09-4d14-afa2-d2a1-34b72b880edf@csgroup.eu>
In-Reply-To: <6dc50f09-4d14-afa2-d2a1-34b72b880edf@csgroup.eu>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ S390 people

Le 15/02/2022 à 15:28, Christophe Leroy a écrit :
> 
> 
> Le 15/02/2022 à 14:36, Naveen N. Rao a écrit :
>> Michael Ellerman wrote:
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> Le 14/02/2022 à 16:25, Naveen N. Rao a écrit :
>>>>> Christophe Leroy wrote:
>>>>>> Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS. It accelerates the call
>>>>>> of livepatching.
>>>>>>
>>>>>> Also note that powerpc being the last one to convert to
>>>>>> CONFIG_DYNAMIC_FTRACE_WITH_ARGS, it will now be possible to remove
>>>>>> klp_arch_set_pc() on all architectures.
>>>>>>
>>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>>> ---
>>>>>>  arch/powerpc/Kconfig                 |  1 +
>>>>>>  arch/powerpc/include/asm/ftrace.h    | 17 +++++++++++++++++
>>>>>>  arch/powerpc/include/asm/livepatch.h |  4 +---
>>>>>>  3 files changed, 19 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>>> index cdac2115eb00..e2b1792b2aae 100644
>>>>>> --- a/arch/powerpc/Kconfig
>>>>>> +++ b/arch/powerpc/Kconfig
>>>>>> @@ -210,6 +210,7 @@ config PPC
>>>>>>      select HAVE_DEBUG_KMEMLEAK
>>>>>>      select HAVE_DEBUG_STACKOVERFLOW
>>>>>>      select HAVE_DYNAMIC_FTRACE
>>>>>> +    select HAVE_DYNAMIC_FTRACE_WITH_ARGS    if MPROFILE_KERNEL || 
>>>>>> PPC32
>>>>>>      select HAVE_DYNAMIC_FTRACE_WITH_REGS    if MPROFILE_KERNEL || 
>>>>>> PPC32
>>>>>>      select HAVE_EBPF_JIT
>>>>>>      select HAVE_EFFICIENT_UNALIGNED_ACCESS    if 
>>>>>> !(CPU_LITTLE_ENDIAN && POWER7_CPU)
>>>>>> diff --git a/arch/powerpc/include/asm/ftrace.h 
>>>>>> b/arch/powerpc/include/asm/ftrace.h
>>>>>> index b3f6184f77ea..45c3d6f11daa 100644
>>>>>> --- a/arch/powerpc/include/asm/ftrace.h
>>>>>> +++ b/arch/powerpc/include/asm/ftrace.h
>>>>>> @@ -22,6 +22,23 @@ static inline unsigned long 
>>>>>> ftrace_call_adjust(unsigned long addr)
>>>>>>  struct dyn_arch_ftrace {
>>>>>>      struct module *mod;
>>>>>>  };
>>>>>> +
>>>>>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>>>>>> +struct ftrace_regs {
>>>>>> +    struct pt_regs regs;
>>>>>> +};
>>>>>> +
>>>>>> +static __always_inline struct pt_regs 
>>>>>> *arch_ftrace_get_regs(struct ftrace_regs *fregs)
>>>>>> +{
>>>>>> +    return &fregs->regs;
>>>>>> +}
>>>>>
>>>>> I think this is wrong. We need to differentiate between 
>>>>> ftrace_caller() and ftrace_regs_caller() here, and only return 
>>>>> pt_regs if coming in through ftrace_regs_caller() (i.e., 
>>>>> FL_SAVE_REGS is set).
>>>>
>>>> Not sure I follow you.
>>>>
>>>> This is based on 5740a7c71ab6 ("s390/ftrace: add 
>>>> HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
>>>>
>>>> It's all the point of HAVE_DYNAMIC_FTRACE_WITH_ARGS, have the regs 
>>>> also with ftrace_caller().
>>>>
>>>> Sure you only have the params, but that's the same on s390, so what 
>>>> did I miss ?
>>
>> It looks like s390 is special since it apparently saves all registers 
>> even for ftrace_caller: 
>> https://lore.kernel.org/all/YbipdU5X4HNDWIni@osiris/
> 
> It is not what I understand from their code, see 
> https://elixir.bootlin.com/linux/v5.17-rc3/source/arch/s390/kernel/mcount.S#L37 
> 
> 
> They have a common macro called with argument 'allregs' which is set to 
> 0 for ftrace_caller() and 1 for ftrace_regs_caller().
> When allregs == 1, the macro seems to save more.
> 
> But ok, I can do like x86, but I need a trick to know whether 
> FL_SAVE_REGS is set or not, like they do with fregs->regs.cs
> Any idea what the condition can be for powerpc ?
> 

Finally, it looks like this change is done  via commit 894979689d3a 
("s390/ftrace: provide separate ftrace_caller/ftrace_regs_caller 
implementations") four hours the same day after the implementation of 
arch_ftrace_get_regs()

They may have forgotten to change arch_ftrace_get_regs() which was added 
in commit 5740a7c71ab6 ("s390/ftrace: add HAVE_DYNAMIC_FTRACE_WITH_ARGS 
support") with the assumption that ftrace_caller and ftrace_regs_caller 
where identical.

Christophe
