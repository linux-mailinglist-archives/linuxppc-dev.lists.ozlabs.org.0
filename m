Return-Path: <linuxppc-dev+bounces-990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D961A96C0C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 16:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzQ6G0qpBz2yft;
	Thu,  5 Sep 2024 00:36:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725460582;
	cv=none; b=MlNEKTnfxwgAMDvbkmQzNL2PBqCTc1gpPME3pMeH3vZrgMZGXsiyVBTOFe2DpjrX7XFY3ZKRgOEODQ5pNHxx6bBFvIrw/16oz7xEwwKvV28PPPi+GT7cIb+gO+vUl1I/TXggy623YquD/mIO2OHQst/gnljPD0rXwlvKHuiB7SaNV+P0+d18FPqoDtHcpDOgu8xDmAQkqEddOCizgIqCQk85C198E1LD61A8OlOSq2XeOhlmQiBir/SLbHyzfHmbWUj/GBzhhHDoFIX6YYkCy0nws0+526RkEP96s00O9eCn9OaXKJVdl4Et1GZtFt08y553ZKs7gQlqqsU88H/Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725460582; c=relaxed/relaxed;
	bh=2ZU3hxjzzcR0KE1vLB4cYy6nfqvAuY3d0hRkBqf/TCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKBEClwDecrDUPAWy82Yfln/qtkvS6dxAoS99hhQOACEGc/3khzUlflT4Ou2Yws2C0I7hjeN3RIb5OGdswjiS/YEWmwxMGzybvBqrP4nL1neJ6HWTdOOkHt2QdzLlZ1cumUYgrwI20QPjBZeLxdlvSCL9G8/72mjxHC16DE4ximcRqULFCYPituLXbFj53i+mVHZM/groqPFu/L16JPBal/xNZd3DP9lVhn48xBtHi9MVt480fXCtuCcC2jIh5AjCqW+a0nnFQf1axT2pK5zbb+SRpPMm6jzdxX99L1uJBzs0eHylDKt3cELoZ0n/soPOjgEJ6pFh8HugwFssfMj6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzQ6F5WCrz3c5N
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 00:36:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WzQ685Z1lz9sS7;
	Wed,  4 Sep 2024 16:36:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3Oi0qoOC3QN; Wed,  4 Sep 2024 16:36:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WzQ684j7Sz9sRy;
	Wed,  4 Sep 2024 16:36:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DE208B77A;
	Wed,  4 Sep 2024 16:36:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MDg64KpQGgK2; Wed,  4 Sep 2024 16:36:16 +0200 (CEST)
Received: from [192.168.234.246] (unknown [192.168.234.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D5618B778;
	Wed,  4 Sep 2024 16:36:15 +0200 (CEST)
Message-ID: <070a2aa1-a804-4124-ad89-c43e09dc3ded@csgroup.eu>
Date: Wed, 4 Sep 2024 16:36:15 +0200
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
Subject: Re: [PATCH v5 0/5] Wire up getrandom() vDSO implementation on powerpc
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
 <Zthr1nB_RJ56YD3O@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zthr1nB_RJ56YD3O@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/09/2024 à 16:16, Jason A. Donenfeld a écrit :
> Hi Christophe, Michael,
> 
> On Mon, Sep 02, 2024 at 09:17:17PM +0200, Christophe Leroy wrote:
>> This series wires up getrandom() vDSO implementation on powerpc.
>>
>> Tested on PPC32 on real hardware.
>> Tested on PPC64 (both BE and LE) on QEMU:
>>
>> Performance on powerpc 885:
>> 	~# ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 62.938002291 seconds
>> 	   libc: 25000000 times in 535.581916866 seconds
>> 	syscall: 25000000 times in 531.525042806 seconds
>>
>> Performance on powerpc 8321:
>> 	~# ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 16.899318858 seconds
>> 	   libc: 25000000 times in 131.050596522 seconds
>> 	syscall: 25000000 times in 129.794790389 seconds
>>
>> Performance on QEMU pseries:
>> 	~ # ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 4.977777162 seconds
>> 	   libc: 25000000 times in 75.516749981 seconds
>> 	syscall: 25000000 times in 86.842242014 seconds
> 
> Looking good. I have no remaining nits on this patchset; it looks good
> to me.
> 
> A review from Michael would be nice though (in addition to the necessary
> "Ack" I need to commit this to my tree), because there are a lot of PPC
> particulars that I don't know enough about to review properly. For
> example, you use -ffixed-r30 on PPC64. I'm sure there's a good reason
> for this, but I don't know enough to assess it. And cvdso_call I have no
> idea what's going on. Etc.

You can learn a bit more about cvdso_call in commit ce7d8056e38b 
("powerpc/vdso: Prepare for switching VDSO to generic C implementation.")

About the fixed-r30, you can learn more in commit a88603f4b92e 
("powerpc/vdso: Don't use r30 to avoid breaking Go lang")


> 
> But anyway, awesome work, and I look forward to the final stretches.

Thanks, looking forward to getting this series applied.

Christophe

