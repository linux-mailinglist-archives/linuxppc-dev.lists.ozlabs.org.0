Return-Path: <linuxppc-dev+bounces-768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9DB964E28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 20:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvr2L52lmz2yvv;
	Fri, 30 Aug 2024 04:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724957434;
	cv=none; b=h0Wnxx2CnhFar1PyHMKHUkyflW8lvLyJhih5Ny5+e2w8YvtoWJ8i0WBZDH38a4P4m5bzRJeI+rzbqBqT4GQ7BlQT4ttIFOnAmAkPlFT75fxq5DYXXiCzu9OgCTSmn7vYtS46qxU8rHQ8rwLCyMzyAq2qykAxf+nnK5RpM0rUz4fTcx3QzkPQ5k/I45iRMLwINebC9GMxbfj/rOiR44X+BvC8z0wDX7jLhIdGxdAZeLXHw18MjuTZAZu14gQvCTswtovvd1AUVSIrUws5LugoQyuTZptN1rRlD8QmXcDqdelFB1CWYMl1ckO8EL1TMOGHWdyOnXF4IgGJ8DB2zXiSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724957434; c=relaxed/relaxed;
	bh=uxCQbqrddr+gtcXCikK5aViz0kR/6Fgx4nWli0b8w/4=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=D3PjPCuwH83yeBveUVf7Ybm1cR6qgtxLA7ZeQ2H5zQhiUZ+BK8Fgiyxci9CaYj+k+C0MZlN2HN/CsSWPWZi3sOCIqaiq8A9IcNefWzYEelGpKFchOiQZ8lIUkrivaDO31glQAcSWTmXLK46Y94TVnfLxaevmrbuxhsjYMkYLcYBLJItq4tIl1xommYbJWQDJqdEbmdC1yaQWm388E9bxRvOyAWupJmkq8BQiGRJWCF1Vdu8BH08BcLEGPYlp49LE171dKJmKn3vgmeyxDQVmOL3M3gpClvhYyAlnECEbQAWp6QkhrzkfdpqURKsJOnamOre2BPpXI9a6RIhHevh0Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wvr2L2S1dz2yFL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 04:50:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wvr2G19nBz9sS8;
	Thu, 29 Aug 2024 20:50:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xnbi20xoF7or; Thu, 29 Aug 2024 20:50:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wvr2G0DSsz9sRs;
	Thu, 29 Aug 2024 20:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E7E898B794;
	Thu, 29 Aug 2024 20:50:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3gsZv-SyUxEW; Thu, 29 Aug 2024 20:50:29 +0200 (CEST)
Received: from [192.168.234.66] (unknown [192.168.234.66])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A97138B764;
	Thu, 29 Aug 2024 20:50:28 +0200 (CEST)
Message-ID: <eb7fdc6b-889f-4934-814f-f0572f4b089a@csgroup.eu>
Date: Thu, 29 Aug 2024 20:50:28 +0200
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
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Theodore Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com>
 <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
 <20240828124519.GE29862@gate.crashing.org>
 <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
 <20240828162025.GG29862@gate.crashing.org>
 <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
 <20240828172538.GI29862@gate.crashing.org>
 <e5a36d98-c880-4d33-954a-2a05240ef02f@csgroup.eu>
 <20240829180241.GJ29862@gate.crashing.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240829180241.GJ29862@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/08/2024 à 20:02, Segher Boessenkool a écrit :
> On Thu, Aug 29, 2024 at 07:36:38PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 28/08/2024 à 19:25, Segher Boessenkool a écrit :
>>>
>>>> Not sure about static binaries, though: do those even use the VDSO?
>>>
>>> With "static binary" people usually mean "a binary not using any DSOs",
>>> I think the VDSO is a DSO, also in this respect?  As always, -static
>>> builds are *way* less problematic (and faster and smaller :-) )
>>>
>>
>> AFAIK on powerpc even static binaries use the vDSO, otherwise signals
>> don't work.
> 
> How can that work?  Non-dynamic binaries do not use ld.so (that is the
> definition of a dynamic binary, even).  So they cannot link (at runtime)
> to any DSO (unless that is done manually?!)
> 
> Maybe there is something at a fixed offset in the vDSO, or something
> like that?  Is this documented somewhere?
> 

You've got some explanation here : 
https://github.com/torvalds/linux/blob/master/Documentation/ABI/stable/vdso

