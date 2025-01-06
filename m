Return-Path: <linuxppc-dev+bounces-4705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344CA025F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 13:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRYtR4HFnz30NY;
	Mon,  6 Jan 2025 23:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736167807;
	cv=none; b=YTVD/rX3xLy4juhRBeBOF63lBmQP9sWaf/FqBEC8xEOF0qPRJMQnjNB/bHlPkJ1IwiF04vDb5svkA5CZ+h+rAfngdKccsBrC+RZ/MnjCXt0kZQFs6fcjG4p/d36L48IYmFLiFv6BRtPsnUKF1hGrnoUDV7n7ncSQusxKvgT5rUTmkKrtLKhU4ynmG1+XAAeZCdFxvKkmbz1JuYphm2GAuiljY+K6+6FRm2x0CCqZTTVuR01apibDrpLsdqRgXhtcj1qENBULqJv2icaHokDwvbMfNpAWTmCYZyAfWqduNTrLggW+khBXXVpJCp2l9Vy5Nm4uSZIgb39MyrT1iAjWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736167807; c=relaxed/relaxed;
	bh=N+Dw2vHnqFRsehIToPCFkqh5mXC6MAO0NC+Fk9RKv84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkSYThLP/HzVoSAvrhHTaQ0Es6Ru22/toma6d6l5AXlO2sGZnG1SnKey+RNCwVSDZI5YYmBErFPZbiv94Pu0XJZKlpc6XrBHqZhYnuF6i0SpXHIphF4RDoTMrSsbb6lDP28Gyz5tN1orRP3i6SYMM1P9HdA2uz4drrnqHl2yDEQ6cSWKWeqjpdtarAoibJelRvgu8c54YB9QXutaAjo5epXLf8aHgiICnqKT3qg+z3MGItaxw+i/mMWiVyFfvAXxphnTNEKo4IqBXqE4nnIz/k4FJa/MHtTh4MRAbl5c1crlJLzxApLztuOJl/XEyOC1TwRBJnCaPkWqtn4pK1t4eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRYtQ0wwxz305n
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 23:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRYdT2hXyz9sPd;
	Mon,  6 Jan 2025 13:38:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVLpbuyQA70k; Mon,  6 Jan 2025 13:38:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRYdT1g9Gz9rvV;
	Mon,  6 Jan 2025 13:38:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 25DFC8B76D;
	Mon,  6 Jan 2025 13:38:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BJWV85ZgAz44; Mon,  6 Jan 2025 13:38:53 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AB4BF8B763;
	Mon,  6 Jan 2025 13:38:52 +0100 (CET)
Message-ID: <752a31b0-4370-4f52-b7cc-45f0078c1d6c@csgroup.eu>
Date: Mon, 6 Jan 2025 13:38:52 +0100
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
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <719a89a5-8dff-48a0-ba8f-802c740a00a6@csgroup.eu>
 <53f3abe5-dd22-4a1a-82e6-bc88e91d1869@linaro.org> <Z217eBsXIaSgKuSs@x1>
 <5217124a-f033-4085-b9f5-a477c96728d6@csgroup.eu> <Z3bYltoidQpqtyJ_@x1>
 <48724052-4003-4140-8106-f9ea098cedcb@csgroup.eu> <Z3c4nupM-UENN5LM@x1>
 <5b8ec160-4b50-4736-8012-30ae35c45028@csgroup.eu> <Z3gPncBcCnZiNy57@x1>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z3gPncBcCnZiNy57@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 03/01/2025 à 17:26, Arnaldo Carvalho de Melo a écrit :
> On Fri, Jan 03, 2025 at 01:40:24PM +0100, Christophe Leroy wrote:
>> Le 03/01/2025 à 02:08, Arnaldo Carvalho de Melo a écrit :
>>>>      PerfTop:     524 irqs/sec  kernel:51.1%  exact:  0.0% lost: 0/0 drop: 0/0
>>>> [4000Hz cpu-clock:ppp],  (all, 1 CPU)
>>>> -------------------------------------------------------------------------------
> 
>>>>       17.18%  [unknown]      [k] 0xc0891c14
>>>>        7.63%  [unknown]      [k] 0xc005f11c
> 
>>> I think I hadn't notice this '[unknown]' one bit before :-\ the [k] is
>>> there, so having unknown is odd
>   
>> Problem found, it's in maps__find_next_entry(), this leads to both
>> map->start and map->end of kernel map being set to 0xc0000000, which leads
>> to the failure of bsearch() in maps__find().
> 
> Right, and since you don't have any module (CONFIG_MODULES not set),
> and most machines do, that is when the buggy function is called:
> 
> machine__create_kernel_maps()
> 	if (!machine__get_running_kernel_start(machine, &name, &start, &end))
> <SNIP>
>          if (end == ~0ULL) {
>                  /* update end address of the kernel map using adjacent module address */
>                  struct map *next = maps__find_next_entry(machine__kernel_maps(machine),
>                                                           machine__kernel_map(machine));
> 
>                  if (next) {
>                          machine__set_kernel_mmap(machine, start, map__start(next));
>                          map__put(next);
>                  }
>          }
> <SNIP>
> 
> So machine__get_running_kernel_start() doesn't manage to fill end with
> either because it doesn't find the ref_reloc_sym, one of:
> 
> const char *ref_reloc_sym_names[] = {"_text", "_stext", NULL}
> 
> And returns -1, so that first if block fails, and then start also
> doesn't get set and remains 0, which doesn't seem to be the case, as you
> get 0xc0000000 in it, or this fails:
> 
>          err = kallsyms__get_symbol_start(filename, "_edata", &addr);
>          if (err)
>                  err = kallsyms__get_function_start(filename, "_etext", &addr);
>          if (!err)
>                  *end = addr;
> 

Indeed yes that one fails, because:

~# grep -e _stext -e _etext -e _edata /proc/kallsyms
c0000000 T _stext
c08b8000 D _etext

So there is no _edata and _etext is not text

$ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
c0000000 g       .head.text	00000000 _stext
c08b8000 g       .rodata	00000000 _etext
c1378000 g       .sbss	00000000 _edata

Changing

	kallsyms__get_function_start(filename, "_etext", &addr);

to

	kallsyms__get_symbol_start(filename, "_etext", &addr);

works.


The following change works as well:

diff --git a/arch/powerpc/kernel/vmlinux.lds.S 
b/arch/powerpc/kernel/vmlinux.lds.S
index b4c9decc7a75..b7b2cd7e2a20 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -123,10 +123,11 @@ SECTIONS
  		 */
  		*(.sfpr);
  		*(.text.asan.* .text.tsan.*)
+
+		. = ALIGN(PAGE_SIZE);
+		_etext = .;
  	} :text

-	. = ALIGN(PAGE_SIZE);
-	_etext = .;
  	PROVIDE32 (etext = .);

  	/* Read-only data */

As it leads to:

~# grep -e _stext -e _etext -e _edata /proc/kallsyms
c0000000 T _stext
c08b8000 T _etext

$ ppc-linux-objdump -x vmlinux | grep -e _stext -e _etext -e _edata
c0000000 g       .head.text	00000000 _stext
c08b8000 g       .text	00000000 _etext
c1378000 g       .sbss	00000000 _edata

So what is the most correct fix ? Change architectures link script or 
make perf _etext lookup more flexible, allowing non-text ?

Looking at vmlinux.lds.S from various architectures, I have the feeling 
several of them are affected.

Now, regarding _edata, what I see is:

~# tail -2 /proc/kallsyms
c136a000 D __start___bug_table
c1377c14 D __stop___bug_table

And in System.map I have:

c136a000 D __start___bug_table
c1377c14 D __stop___bug_table
c1378000 B __bss_start
c1378000 B _edata
c1378000 B initcall_debug
c1378004 B reset_devices

Should perf try to locate the very last symbol when it doesn't find 
_edata ? Or should architecture's link script be modified ? Otherwise 
commit 69a87a32f5cd ("perf machine: Include data symbols in the kernel 
map") is just pointless.

Christophe

