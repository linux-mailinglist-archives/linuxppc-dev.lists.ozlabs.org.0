Return-Path: <linuxppc-dev+bounces-525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27295EC24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 10:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WskZr2Dlrz2yL5;
	Mon, 26 Aug 2024 18:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724661476;
	cv=none; b=ZsO/4ZnfMWpDPpoJUca9wNg8Bo0q9D+hNUWKopywZlYX2Q7glzMquPai/ly0p95ag6jkO4k9hWMZhBs1I+QIMVIU1u7HHWLO6CIE0zRcORNzXWaeHuSDoceqFGiFfZg2gbWszDuxw42T4vshuT1AmtdkEh0tDkkkYSerKzRAXLo86C56PPASYHekQRpxBHDXBbsNzyQCWYCsDVOjykDhIWCORFWlqwZEXF43OQfC9UOg758TqBWS1lfzB89UjG/qxQ+Q9npqZ/PbYgxozrF6tQVyLwf5hYcui4UHqd3z7D94a2i6Vln++ii4LP52yeMzxb/by7z1K7NV77CbBoBN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724661476; c=relaxed/relaxed;
	bh=PQCP88GgdkOkepkRupPeG/h7Vum0yoix8K+AR3rbeTk=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Bov+TgrT9sUfI9rKN9r+g0GThvnNmbaSu+S5ccwg48sOyWUZKXmB3q1dXFk+SptTffOvpGSU7LRTeL4w2CPpaSZ76/wy+2hl3LrD51IqObqFj53DSbLmTn5bZz/gtHfcRLpEGF4tAqV38STzbu6Mk+PjFYn3cR7RZf0BWofAOjEz7+zN607FgnXW1Nppwc6p2tdCHbStqKOSJnjyFocU8MtM7onIBGXAN4jQfeeLumezHotalBbWFFJsnmS1EFQUYHpnsJfYRchUQzuhwHBqRkxevbq3F0p9r6t3wvwazGvbmpNEpWFqtq66r/m2NBgqRKNRaDaSA8Iqy6CRUYE/PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WskZq6rLJz2yDp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:37:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WskZl5slLz9sRr;
	Mon, 26 Aug 2024 10:37:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtZt4nGFX6b0; Mon, 26 Aug 2024 10:37:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WskZl4WrZz9sRk;
	Mon, 26 Aug 2024 10:37:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85D558B773;
	Mon, 26 Aug 2024 10:37:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id g2eIkF1jnL0E; Mon, 26 Aug 2024 10:37:51 +0200 (CEST)
Received: from [192.168.233.85] (PO17705.IDSI0.si.c-s.fr [192.168.233.85])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1399C8B763;
	Mon, 26 Aug 2024 10:37:50 +0200 (CEST)
Message-ID: <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>
Date: Mon, 26 Aug 2024 10:37:49 +0200
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
Subject: Re: [PATCH v2 02/17] vdso: Clean header inclusion in getrandom
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
 <Zsw3xMoX2EI5UUs1@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zsw3xMoX2EI5UUs1@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/08/2024 à 10:07, Jason A. Donenfeld a écrit :
> On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
>>   
>> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
>> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))
> 
> If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SIZE
> instead of _PAGE_SIZE? But if that's the case, why not put the vdso
> definition of PAGE_SIZE into some vdso header included by this file?

It was working ok on powerpc but on x86 I got:

   CC      arch/x86/entry/vdso/vgetrandom.o
In file included from arch/x86/entry/vdso/vgetrandom.c:7:
arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:24: error: 
"PAGE_SIZE" redefined [-Werror]
    24 | #define PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
       |
In file included from ./arch/x86/include/asm/page.h:9,
                  from ./arch/x86/include/asm/thread_info.h:12,
                  from ./include/linux/thread_info.h:60,
                  from ./include/linux/smp.h:118,
                  from ./include/linux/alloc_tag.h:14,
                  from ./include/linux/percpu.h:5,
                  from ./arch/x86/include/asm/msr.h:15,
                  from ./arch/x86/include/asm/vdso/gettimeofday.h:19,
                  from ./include/vdso/datapage.h:164,
                  from 
arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:7,
                  from arch/x86/entry/vdso/vgetrandom.c:7:
./arch/x86/include/asm/page_types.h:11: note: this is the location of 
the previous definition
    11 | #define PAGE_SIZE  (_AC(1,UL) << PAGE_SHIFT)
       |
In file included from arch/x86/entry/vdso/vgetrandom.c:7:
arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:25: error: 
"PAGE_MASK" redefined [-Werror]
    25 | #define PAGE_MASK (~(PAGE_SIZE - 1))
       |
In file included from ./arch/x86/include/asm/page.h:9,
                  from ./arch/x86/include/asm/thread_info.h:12,
                  from ./include/linux/thread_info.h:60,
                  from ./include/linux/smp.h:118,
                  from ./include/linux/alloc_tag.h:14,
                  from ./include/linux/percpu.h:5,
                  from ./arch/x86/include/asm/msr.h:15,
                  from ./arch/x86/include/asm/vdso/gettimeofday.h:19,
                  from ./include/vdso/datapage.h:164,
                  from 
arch/x86/entry/vdso/../../../../lib/vdso/getrandom.c:7,
                  from arch/x86/entry/vdso/vgetrandom.c:7:
./arch/x86/include/asm/page_types.h:12: note: this is the location of 
the previous definition
    12 | #define PAGE_MASK  (~(PAGE_SIZE-1))
       |
cc1: all warnings being treated as errors


Christophe

