Return-Path: <linuxppc-dev+bounces-1318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E07977BCB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 11:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4pGP63Vlz2yVD;
	Fri, 13 Sep 2024 19:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726218125;
	cv=none; b=D+THAGTKVL8EeymDT/+heGgLcgbRWRtiQ54I+dokALErrhRqoEMhdwoAOACkkenrMltFekDibEPCXExxL03a6gGp1SdTHyhpYJyTsjjGkeJHXYnzU/LvjmvBr+cKcT7rRVOTx/UnE7zQ4O4hiU7nwaFpQ4eFPVavaBE4DNKCVN4gCo9SqzMzN37HUDYUdcoiXk0QuTdObQxk/uqX1wCs7TztqEqQPctwN+OD8f8CMVmKv3RrIDMClbbuYzTAUgGj7HcPmjS/alQNVJoKQ7kPinOnntzwetwCK9nQOJyomOnX3f4jfs0CniK0LXKmtR1WU/oan9+bSz/uEix7ceDUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726218125; c=relaxed/relaxed;
	bh=zZTX/LcqP2Ltu366HFPgn+H8EDB6Gxq6IWgKdqlR7NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ktb+UkHUsYu4qRC6Lte4UY3ag/x780Qqik0hjN3v9kWoK2sYDuVvBIgZ73s4e/gI4OSYvwrv+Pk++NscHImUPVQPXbJDY0i2GB3eJKpxdOxvjTs9cSQN6fAzlCVQqFYdjfAkinoMhjaL4CxsK6MUmUHf3WdED1woYhvnkQ4jyOYYZ1TjiCeG9otcxXjfv5BgMIUJUqC4SGuZQGIhpkNwrDILEdm2d7dS6QRH6bxFkTiMA3WeJQ0PkKAqLScOSVO/SIlXwWBS7uzU0Imbr1jX3PvRChZYHdtVeQ3B00wwjXBDhOfOxN9+gK0RIo8bJArp9CTq88Xnu920xOJhZ0eLeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4pGP3mgNz2xwc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 19:02:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X4pGK5xyMz9sxH;
	Fri, 13 Sep 2024 11:02:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBvfAPALQGjL; Fri, 13 Sep 2024 11:02:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X4pFq6fvmz9sxG;
	Fri, 13 Sep 2024 11:01:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D0CC18B77A;
	Fri, 13 Sep 2024 11:01:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xZzjn-Q6tBsn; Fri, 13 Sep 2024 11:01:35 +0200 (CEST)
Received: from [192.168.233.70] (unknown [192.168.233.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B9198B766;
	Fri, 13 Sep 2024 11:01:35 +0200 (CEST)
Message-ID: <87bc0aba-2984-459e-b0d6-d9bf7b9497b4@csgroup.eu>
Date: Fri, 13 Sep 2024 11:01:35 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/vpa_pmu: Add interface to expose vpa counters
 via perf
To: kajoljain <kjain@linux.ibm.com>, mpe@ellerman.id.au
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.ibm.com,
 disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hbathini@linux.ibm.com, adubey@linux.ibm.com
References: <20240828102141.1052332-1-kjain@linux.ibm.com>
 <56b53876-0838-416f-adce-b1ffbd0916fc@csgroup.eu>
 <9c18c4d4-ee60-4543-8bbb-ddc729c0a0f5@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <9c18c4d4-ee60-4543-8bbb-ddc729c0a0f5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/09/2024 à 10:35, kajoljain a écrit :
> 
> 
> On 9/13/24 12:00, Christophe Leroy wrote:
>>
>>
>> Le 28/08/2024 à 12:21, Kajol Jain a écrit :
>>> The pseries Shared Processor Logical Partition(SPLPAR) machines
>>> can retrieve a log of dispatch and preempt events from the
>>> hypervisor using data from Disptach Trace Log(DTL) buffer.
>>> With this information, user can retrieve when and why each dispatch &
>>> preempt has occurred. Added an interface to expose the Virtual Processor
>>> Area(VPA) DTL counters via perf.
>>>
>>> The following events are available and exposed in sysfs:
>>>
>>>    vpa_dtl/dtl_cede/ - Trace voluntary (OS initiated) virtual processor
>>> waits
>>>    vpa_dtl/dtl_preempt/ - Trace time slice preempts
>>>    vpa_dtl/dtl_fault/ - Trace virtual partition memory page faults.
>>>    vpa_dtl/dtl_all/ - Trace all (dtl_cede/dtl_preempt/dtl_fault)
>>>
>>> Added interface defines supported event list, config fields for the
>>> event attributes and their corresponding bit values which are exported
>>> via sysfs. User could use the standard perf tool to access perf events
>>> exposed via vpa-dtl pmu.
>>>
>>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>>> PMI interrupts. Therefore, the kernel needs to poll the counters, added
>>> hrtimer code to do that. The timer interval can be provided by user via
>>> sample_period field in nano seconds.
>>>
>>> Result on power10 SPLPAR system with 656 cpu threads.
>>> In the below perf record command with vpa_dtl pmu, -c option is used
>>> to provide sample_period whch corresponding to 1000000000ns i.e; 1sec
>>> and the workload time is also 1 second, hence we are getting 656 samples:
>>>
>>> [command] perf record -a -R -e vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>>> [ perf record: Woken up 1 times to write data ]
>>> [ perf record: Captured and wrote 0.828 MB perf.data (656 samples) ]
>>>
>>> There is one hrtimer added per vpa-dtl pmu thread. Code added to handle
>>> addition of dtl buffer data in the raw sample. Since DTL does not provide
>>> IP address for a sample and it just have traces on reason of
>>> dispatch/preempt, we directly saving DTL buffer data to perf.data file as
>>> raw sample. For each hrtimer restart call, interface will dump all the
>>> new dtl entries added to dtl buffer as a raw sample.
>>>
>>> To ensure there are no other conflicting dtl users (example: debugfs dtl
>>> or /proc/powerpc/vcpudispatch_stats), interface added code to use
>>> "down_write_trylock" call to take the dtl_access_lock. The
>>> dtl_access_lock
>>> is defined in dtl.h file. Also added global reference count variable
>>> called
>>> "dtl_global_refc", to ensure dtl data can be captured per-cpu. Code also
>>> added global lock called "dtl_global_lock" to avoid race condition.
>>>
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>> ---
>>> Notes:
>>>
>>> - Made code changes on top of recent fix sent by Michael Ellerman.
>>>     Link to the patch:
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2F20240819122401.513203-1-mpe%40ellerman.id.au%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C95cfb2842b2a44907c9108dcd3cf0b12%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638618133431151306%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=IqFjcvT9G0HYGIbuUWhCrnXkFr9yMtSC1mGFFKZ66MI%3D&reserved=0
>>>
>>>    arch/powerpc/perf/Makefile  |   2 +-
>>>    arch/powerpc/perf/vpa-pmu.c | 469 ++++++++++++++++++++++++++++++++++++
>>>    include/linux/cpuhotplug.h  |   1 +
>>>    3 files changed, 471 insertions(+), 1 deletion(-)
>>>    create mode 100644 arch/powerpc/perf/vpa-pmu.c
>>
>>
>> Seems like it doesn't build on PPC64:
>>
>> arch/powerpc/perf/vpa-pmu.c#L212
>> passing argument 1 of 'up_write' from incompatible pointer type
>> [-Wincompatible-pointer-types]
>>
>> arch/powerpc/perf/vpa-pmu.c#L261
>> passing argument 1 of 'down_write_trylock' from incompatible pointer
>> type [-Wincompatible-pointer-types]
>>
>> arch/powerpc/perf/vpa-pmu.c#L402
>> passing argument 1 of 'up_write' from incompatible pointer type
>> [-Wincompatible-pointer-types]
> 
> Hi Christophe,
>     Thanks for checking the patch. These changes are on top of fix patch
> sent by Michael Ellerman
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2F20240819122401.513203-1-mpe%40ellerman.id.au%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C95cfb2842b2a44907c9108dcd3cf0b12%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638618133431160525%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=r1vQxb%2F8IXBRffDtFMwiqbKnFZ4iiqer6cLykT00%2Bew%3D&reserved=0
> 
> Since he changed the dtl_access_lock to be a rw_semaphore.
> 
> Are you trying with Michael patch changes?

No, I only saw CI test failure here : 
https://github.com/linuxppc/linux-snowpatch/actions/runs/10594868105

Sorry I didn't see you mentioned it in a note.

Christophe

