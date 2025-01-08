Return-Path: <linuxppc-dev+bounces-4866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE87A06439
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 19:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSx6H49ZCz30Pn;
	Thu,  9 Jan 2025 05:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736360407;
	cv=none; b=g/q67UtVQTGTSDgwzvgLxaqumiIMlIPGrJ44PKgCI2KsMS36eu0bMYah5Qp9IS7O1wl7u/WpnugV/T8PvzSGNYFnMnEGS0nz2b5snDOb80cVb44z4qIb5p52MZw9pieAh6DC7K2xO77VDK1qdYcvkDK96UGqTUonYijR4xWElVQd6J5vmniqLyxSGIOutWnMdY+0xPsYTeJTL7oni9KSE4JTmEhAeW5r9ntSU0SJKYSCH3+6pa8Y2KNPMOqruQ9fZzNQGVNORrOmpQ6Seuk4QhnpYMqlJ8Xq/InTREWuupc/dWUe+qMHMI1E8HltoW0NtSSCnMr5zd9QwbHnQYRm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736360407; c=relaxed/relaxed;
	bh=8tjM3TfdI1BDmnFOls/6XSul5ZufMXKzimA8Ca0u7sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPSFgr36WvVHRoz06TEw2KOXpmg7pz2bEo2FSqMmkhibyAwvv2MN+e2ju6IkBJ4NocebSVvnrf3uCjIm+S5MBhelO0MtUjTKiZ4Y3E7fUuGrG0k8dDi8ey37qGcgvMhk+02QbM5/905DR4tJcYE5al5wWDhlVBjfaUs6tffWsn0WV3thXt3oYQSDYXgaEe1f3QSL8iKpXhCgz4MUFdiQIexVRpjHMvJIxe9aod2bVG35H6uyZYVmQ/5oEprsC22XDeFjurjd8fo1i9/GZVInsQLpNr6ObYAWiELZCJ0pRp0hTLCX0wFJnevg+YkUZ9dtCK5T0/gEbe61tc/uOsV+Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSx6G0YlQz300C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 05:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSwYZ4lk8z9sPd;
	Wed,  8 Jan 2025 18:55:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATU5y-duZQVG; Wed,  8 Jan 2025 18:55:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSwYZ408mz9rvV;
	Wed,  8 Jan 2025 18:55:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7853E8B783;
	Wed,  8 Jan 2025 18:55:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id JyxhuDd45FHW; Wed,  8 Jan 2025 18:55:14 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17D168B768;
	Wed,  8 Jan 2025 18:55:14 +0100 (CET)
Message-ID: <4e4ffc4f-e8dd-4771-bf97-8b372b1c97e0@csgroup.eu>
Date: Wed, 8 Jan 2025 18:55:13 +0100
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
Subject: Re: Perf doesn't display kernel symbols anymore (bisected commit
 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for
 addresses"))
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
 James Clark <james.clark@linaro.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Ian Rogers <irogers@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <719a89a5-8dff-48a0-ba8f-802c740a00a6@csgroup.eu>
 <53f3abe5-dd22-4a1a-82e6-bc88e91d1869@linaro.org> <Z217eBsXIaSgKuSs@x1>
 <5217124a-f033-4085-b9f5-a477c96728d6@csgroup.eu> <Z3bYltoidQpqtyJ_@x1>
 <48724052-4003-4140-8106-f9ea098cedcb@csgroup.eu> <Z3c4nupM-UENN5LM@x1>
 <5b8ec160-4b50-4736-8012-30ae35c45028@csgroup.eu> <Z3gPncBcCnZiNy57@x1>
 <752a31b0-4370-4f52-b7cc-45f0078c1d6c@csgroup.eu>
 <Z3xPHSrVInsc6W6I@google.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z3xPHSrVInsc6W6I@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 06/01/2025 à 22:46, Namhyung Kim a écrit :
>>
>> And in System.map I have:
>>
>> c136a000 D __start___bug_table
>> c1377c14 D __stop___bug_table
>> c1378000 B __bss_start
>> c1378000 B _edata
>> c1378000 B initcall_debug
>> c1378004 B reset_devices
>>
>> Should perf try to locate the very last symbol when it doesn't find _edata ?
>> Or should architecture's link script be modified ? Otherwise commit
>> 69a87a32f5cd ("perf machine: Include data symbols in the kernel map") is
>> just pointless.
> 
> Let's go with kallsyms__get_symbol_start().  I think it's the most
> straight-forward and simplest fix.
> 

Ok, I did that, see patch 
https://lore.kernel.org/linux-perf-users/b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu/T/#u

And for the _edata which is sometimes missing, I send patch 
https://lore.kernel.org/linux-perf-users/2fec8c50c271dff59f0177ff0884b6c374486ba5.1736327770.git.christophe.leroy@csgroup.eu/T/#u

Christophe

