Return-Path: <linuxppc-dev+bounces-1063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F396E076
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 18:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X058T4JSHz2yYn;
	Fri,  6 Sep 2024 02:55:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725555337;
	cv=none; b=O2EvFfeSBkgbsXXotbM5e6or8k41PgZnkKSVNuHh3n/DD6bZA52oBicbZRrzWi1IERgb+POZXN9wxceB2JpX532wN+CiOQgO6KuwCDlkOFhpKlcKmHT3++u7ch5tdZaD/fxL5O/H7v5aC/GFPadvMiQx1QDjYnSdQjuFb+DaG5nBQTJvnOAr/mvNL/L/gIB45xOxA5VzjhKCHeqMNwLjMw5vNDukFdwPR7BXys5Tz0ZRY6CH8B7nQxM+WppV0KC3jRIniqN2REKLlZ/KPgSbxeiZ8bQh7J805fG5wk26oRQiOgtIrmyQt+7Kv5mDvWCnrCsS4NyWPDLtCk665qagWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725555337; c=relaxed/relaxed;
	bh=aOdfcFQetM01+z8mECluqz2SOuHThTJ5QWdrVy+40ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jw2HAs/tb8ohX8dZS6nLmlaAqJ8cdCrcDTbTrzo6w1X46juVGNcbr9ZIxy5zofcwPMcHkJMWaoBFMhqkG1EEmBtDKnkro1hOQKn1IjwMQFtJXYlZpZb0TTgbOqCIO9Wf8zWnvJroQi2MPzyfRDVHXbnuD/ZDfct6YlPsRz5rJzXc0O7xbcDFi8Q0OGIjXIIPOKKjBVy3LMv3mrBWC1Brg1Q+snZVUdlEjZU2Krk+jLK05v2M56xyzCRwryA8ppJWpWvAQYSlXaoWNqUPu5ACacIejDbOtuhsa7Nmf2g6N6jka3q6MnNlrqv27IpYxbnpBxhfpkk9PcChmENLGGXKug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X058T1sJJz2yWy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 02:55:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X058M1gffz9sRs;
	Thu,  5 Sep 2024 18:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utC0CxKuXD61; Thu,  5 Sep 2024 18:55:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X058M0gPbz9sRr;
	Thu,  5 Sep 2024 18:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 046AF8B77C;
	Thu,  5 Sep 2024 18:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ScrEPCzszJ3z; Thu,  5 Sep 2024 18:55:30 +0200 (CEST)
Received: from [192.168.235.60] (unknown [192.168.235.60])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EB2C58B778;
	Thu,  5 Sep 2024 18:55:29 +0200 (CEST)
Message-ID: <85c02620-e8b2-4c97-9905-685a9a4e556d@csgroup.eu>
Date: Thu, 5 Sep 2024 18:55:27 +0200
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
Subject: Re: [PATCH v5 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on VDSO32
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
 <ZtnYqZI-nrsNslwy@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtnYqZI-nrsNslwy@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/09/2024 à 18:13, Jason A. Donenfeld a écrit :
>> +/*
>> + * The macro sets two stack frames, one for the caller and one for the callee
>> + * because there are no requirement for the caller to set a stack frame when
>> + * calling VDSO so it may have omitted to set one, especially on PPC64
>> + */
>> +
>> +.macro cvdso_call funct
>> +  .cfi_startproc
>> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>> +	mflr		r0
>> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>> +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>> +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
>> +	get_datapage	r8
>> +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
>> +	bl		CFUNC(DOTSYM(\funct))
>> +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>> +	cmpwi		r3, 0
>> +	mtlr		r0
>> +	addi		r1, r1, 2 * PPC_MIN_STKFRM
>> +  .cfi_restore lr
>> +  .cfi_def_cfa_offset 0
>> +	crclr		so
>> +	bgelr+
>> +	crset		so
>> +	neg		r3, r3
>> +	blr
>> +  .cfi_endproc
>> +.endm
> 
> You wrote in an earlier email that this worked with time namespaces, but
> in my testing that doesn't seem to be the case.

Did I write that ? I can't remember and neither can I remember testing 
it with time namespaces.

> 
>  From my test harness [1]:
> 
> Normal single thread
>     vdso: 25000000 times in 12.494133131 seconds
>     libc: 25000000 times in 69.594625188 seconds
> syscall: 25000000 times in 67.349243972 seconds
> Time namespace single thread
>     vdso: 25000000 times in 71.673057436 seconds
>     libc: 25000000 times in 71.712774121 seconds
> syscall: 25000000 times in 66.902318080 seconds
> 
> I'm seeing this on ppc, ppc64, and ppc64le.

What is the command to use to test with time namespace ?

> 
> Can you figure out what's going on and send a fix, which I'll squash
> into this commit?

Sure

> 
> Jason
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.zx2c4.com%2Flinux-rng%2Fcommit%2F%3Fh%3Djd%2Fvdso-test-harness&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C59fa9061064945c73a1608dccdc5b51c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638611496253413014%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=ZUJqhcnZL7SYkuXUIt9Nlo46sZj26VYW%2F8I%2BrBLRpBE%3D&reserved=0

