Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167332543ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 12:41:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcfRK27f0zDqnV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 20:41:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcfNp0rDKzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 20:39:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcfNZ0lWJz9v2LH;
 Thu, 27 Aug 2020 12:39:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Q9Y-spPqxboA; Thu, 27 Aug 2020 12:39:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcfNY74dZz9v2LG;
 Thu, 27 Aug 2020 12:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 459C78B880;
 Thu, 27 Aug 2020 12:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AITriZSHb2O2; Thu, 27 Aug 2020 12:39:11 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C95298B87D;
 Thu, 27 Aug 2020 12:39:10 +0200 (CEST)
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
To: Giuseppe Sacco <giuseppe@sguazz.it>, linuxppc-dev@lists.ozlabs.org
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <498426507489f2c8e32daaf7af1105b5adba552f.camel@sguazz.it>
 <c2a89243-6135-4edd-2c1c-42c2159b5a1e@csgroup.eu>
 <e6878657490aa34b54b3daf0430073078a9840e7.camel@sguazz.it>
 <b70a6343-a380-ff08-a401-04f9ab50be6b@csgroup.eu>
 <59de290b-4b6c-a55e-9289-e640473b1382@csgroup.eu>
 <3558dadc530a60e9e3f958f0d6d4a0f28958ae86.camel@sguazz.it>
 <a62714c0-1b17-305d-577d-529e1781ec56@csgroup.eu>
 <8ce38d9bb162268f53a2292a916c44579421e552.camel@sguazz.it>
 <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
 <c707f59d379a51b83ba52e796d137887219c32fc.camel@sguazz.it>
 <f96d336d-fb81-fe9d-9890-db57c6560e85@csgroup.eu>
 <e7a620fa7521e84e2010660b87f20dd24a3b0cd4.camel@sguazz.it>
 <65baad98-79a0-5ee4-521e-5327029de459@csgroup.eu>
 <0a18fc199cef2643bd07591205a6234c2edf6c95.camel@sguazz.it>
 <afd75c134e2c4a57f8cf1f064595455e67b17e41.camel@sguazz.it>
 <cab15033beeefa317aae40370664e108f57dc050.camel@sguazz.it>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <afae7efd-0d8a-5672-7b75-9394b0ff3d3c@csgroup.eu>
Date: Thu, 27 Aug 2020 12:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cab15033beeefa317aae40370664e108f57dc050.camel@sguazz.it>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 27/08/2020 à 10:28, Giuseppe Sacco a écrit :
> Il giorno gio, 27/08/2020 alle 09.46 +0200, Giuseppe Sacco ha scritto:
>> Il giorno gio, 27/08/2020 alle 00.28 +0200, Giuseppe Sacco ha scritto:
>>> Hello Christophe,
>>>
>>> Il giorno mer, 26/08/2020 alle 15.53 +0200, Christophe Leroy ha
>>> scritto:
>>> [...]
>>>> If there is no warning, then the issue is something else, bad luck.
>>>>
>>>> Could you increase the loglevel and try again both with and without
>>>> VMAP_STACK ? Maybe we'll get more information on where it stops.
>>>
>>> The problem is related to the CPU frequency changes. This is where the
>>> system stop: cpufreq get the CPU frequency limits and then start the
>>> default governor (performance) and then calls function
>>> cpufreq_gov_performance_limits() that never returns.
>>>
>>> Rebuilding after enabling pr_debug for cpufreq.c, I've got some more
>>> lines of output:
>>>
>>> cpufreq: setting new policy for CPU 0: 667000 - 867000 kHz
>>> cpufreq: new min and max freqs are 667000 - 867000 kHz
>>> cpufreq: governor switch
>>> cpufreq: cpufreq_init_governor: for CPU 0
>>> cpufreq: cpufreq_start_governor: for CPU 0
>>> cpufreq: target for CPU 0: 867000 kHz, relation 1, requested 867000 kHz
>>> cpufreq: __target_index: cpu: 0, oldfreq: 667000, new freq: 867000
>>> cpufreq: notification 0 of frequency transition to 867000 kHz
>>> cpufreq: saving 133328 as reference value for loops_per_jiffy; freq is 667000 kHz
>>>
>>> no more lines are printed. I think this output only refers to the
>>> notification sent prior to the frequency change.
>>>
>>> I was thinking that selecting a governor that would run at 667mHz would
>>> probably skip the problem. I added cpufreq.default_governor=powersave
>>> to the command line parameters but it did not work: the selected
>>> governor was still performance and the system crashed.
>>
>> I kept following the thread and found that CPU frequency is changed in
>> function pmu_set_cpu_speed() in file drivers/cpufreq/pmac32-cpufreq.c.
>> As first thing, the function calls the macro preempt_disable() and this
>> is where it stops.
> 
> Sorry, I made a mistake. The real problem is down, on the same
> function, when it calls low_sleep_handler(). This is where the problem
> probably is.
> 


Great, you spotted the problem.

I see what it is, it is in low_sleep_handler() in 
arch/powerpc/platforms/powermac/sleep.S

All critical registers are saved on the stack. At restore, they are 
restore BEFORE re-enabling MMU (because they are needed for that). But 
when we have VMAP_STACK, the stack can hardly be accessed without the 
MMU enabled. tophys() doesn't work for virtual stack addresses.

Therefore, the low_sleep_handler() has to be reworked for using an area 
in the linear mem instead of the stack.

Christophe
