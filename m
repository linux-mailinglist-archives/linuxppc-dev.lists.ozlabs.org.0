Return-Path: <linuxppc-dev+bounces-4759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA96A03A30
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 09:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS4W36vLhz302W;
	Tue,  7 Jan 2025 19:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736239807;
	cv=none; b=imegoA22wQ/uUSzbUoaNLZbEzHa/+kIQ+SyB3duavG+ZlNAAlONKH78H7RBGe/Y5Yz8+iRfU93+3FWZeAmUB0PgIHhq6u6hxnam5NXdFRFU4z+yVPC18Az4vH/QEwgU+kWeSsUam+qV/TifMgzq2QFzWWuNRloJpQaLqLwNyeH7e5dmb9GBUWKpHedZN3CDy5X06kO4M7kEd7yMct51B4UjkuaCEuXD2MQ8cduNir7U4gE4eynm08QFpSB4ZHI6ZmpVLrKG9Je11QOywLdQcLu4O5A/D6qLz9+iTw7SsiRfZaIkHbh+PVT6pU/lifRuKemXG8HiWzUR1owlAzqbp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736239807; c=relaxed/relaxed;
	bh=7hmVzx8KSxHwh6ZKoGjAJkcMvNwYUG09QLg4XRX2qCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FU+FeYhxTR0yC58RZmq9pX2zv73/8RsSAfi8dlQdG5lTt+eKDeww4xqUxQEgJrafOz86J8HMgrKBlCGGU9NC65L41bDKS78TA7tQonODC9Qzi3xMpwrjuZle0kSkzGYeDqRtPC396lTKt1kIa+XpSZQUyQNvcai/OT42QBIqpxCjoxTOMvuKMGY8tTviFiZ7oJCkB1um7k1vc0ZWkRVivwkWIC/i2JbiXjpZzN911BnpNx9pelIa+F9MDpfcPNVnCqUiWbmiDm6qZJx4k669cDqYL0oSgMExdasn2AhwYkuWdAWyvw6QqcFSK05EwX9AwrPxqdbvg7lUUK2r+rwsJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS4W24BD9z2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 19:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YS45p0dpCz9sPd;
	Tue,  7 Jan 2025 09:31:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jk1VJOcVdokO; Tue,  7 Jan 2025 09:31:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YS45n6XFfz9rvV;
	Tue,  7 Jan 2025 09:31:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CAFA08B765;
	Tue,  7 Jan 2025 09:31:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id EimS5cl3j85D; Tue,  7 Jan 2025 09:31:41 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7488B8B764;
	Tue,  7 Jan 2025 09:31:41 +0100 (CET)
Message-ID: <fa5dfd6d-3b8d-4086-9604-e5abddd324c9@csgroup.eu>
Date: Tue, 7 Jan 2025 09:31:41 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libperf: Add back guard on MAX_NR_CPUS
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@redhat.com>
References: <8c8553387ebf904a9e5a93eaf643cb01164d9fb3.1736188471.git.christophe.leroy@csgroup.eu>
 <CAP-5=fWVHaVpJbDf=afn5MhZ972uEq=sGEmsULoD=LRff2Vouw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAP-5=fWVHaVpJbDf=afn5MhZ972uEq=sGEmsULoD=LRff2Vouw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 06/01/2025 à 21:05, Ian Rogers a écrit :
> On Mon, Jan 6, 2025 at 11:38 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Building perf with EXTRA_CFLAGS="-DMAX_NR_CPUS=1" fails:
>>
>>            CC      /home/chleroy/linux-powerpc/tools/perf/libperf/cpumap.o
>>          cpumap.c:16: error: "MAX_NR_CPUS" redefined [-Werror]
>>             16 | #define MAX_NR_CPUS 4096
>>                |
>>          <command-line>: note: this is the location of the previous definition
>>
>> Commit e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
>> moved definition of MAX_NR_CPUS from lib/perf/include/internal/cpumap.h
>> to lib/perf/cpumap.c but the guard surrounding that definition got lost
>> in the move.
>>
>> See commit 21b8732eb447 ("perf tools: Allow overriding MAX_NR_CPUS at
>> compile time") to see why it is needed.
>>
>> Note that MAX_NR_CPUS was initialy defined in perf/perf.h and a
>> redundant definition was added by commit 9c3516d1b850 ("libperf:
>> Add perf_cpu_map__new()/perf_cpu_map__read() functions").
>>
>> A cleaner fix would be to remove that duplicate but for the time
>> being fix the problem by bringing back the guard for when MAX_NR_CPUS
>> is already defined.
>>
>> Fixes: e8399d34d568 ("libperf cpumap: Hide/reduce scope of MAX_NR_CPUS")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> Hello,
> 
> I believe this change might be unnecessary. The only use of
> MAX_NR_CPUS is in a warning message within perf_cpu_map__new, which
> takes a string and produces a perf_cpu_map. Other similar functions
> like cpu_map__new_sysconf don't check MAX_NR_CPUS. Therefore,
> specifying a -DMAX_NR_CPUS value on the build command line has little
> effect—it only impacts a warning message for certain kinds of
> perf_cpu_map creation. It's also unclear what the intended outcome is
> on the build command line.
> 
> Given that specifying the value doesn't seem to have a clear purpose,
> allowing the build to break might be the best option. This would alert
> the person building perf that they are doing something that doesn't
> make sense.
> 

Ok so I looked at it once more and indeed it looks like it has changed 
since 2017. See commit 21b8732eb447 ("perf tools: Allow overriding 
MAX_NR_CPUS at compile time") to understand why it was required at that 
time.

Now I don't have much size difference anymore between a build with 
MAX_NR_CPUS=1 and the default MAX_NR_CPUS=4096:

$ size perf perf-1cpu
    text	   data	    bss	    dec	    hex	filename
3415908	 104164	  17148	3537220	 35f944	perf
3415904	 104164	  16124	3536192	 35f540	perf-1cpu

Apparently that was changed by commit 6a1e2c5c2673 ("perf stat: Remove a 
set of shadow stats static variables")

So I agree with you, it is apparently not worth reducing MAX_NR_CPUS 
anymore, I'll give it a try.

Thanks
Christophe

