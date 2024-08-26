Return-Path: <linuxppc-dev+bounces-534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE76095EEBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 12:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsnQK4WRRz2yMk;
	Mon, 26 Aug 2024 20:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724669145;
	cv=none; b=HZrzHGvOesW7HeTHfzBWO+4RffV0jBYYxyGkZz6IBfkv/obekfvl6cC1uUCYqDLnkb/LRM6u8BBBD745ftvLqqOkw3zeFj4ZxbxqOQVGyzwBfyOFvz98K1wpya0V/Lhjf+/XRzKw5uKiObb7C+t+MloaG9tqLlNpdsMz55R/+VpKoTUc/Gb30fIaTc99DfB6hx+QCdgbBoeqEmve7dTt52NCXlbSReNaqg+u+EDlu4BNGq0bS4xze74UlPJxqK5l8GUf0e/XFTxhD2DGe2q5qPyMl3Y7BrPsO3Z/zNxwHiArUsy2etVpauYyE9bftC7t5+AJ+7qQaa2b8l0+4/nZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724669145; c=relaxed/relaxed;
	bh=A50/yQvorRWfjsuMa18+pVws/YbRAbIKMeeLk+yxZH0=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=MVby1oVzosbPc8vBXIODvNWARoHNGdau0AZYEhxgCUIITMw/KAnt8dzBOA0uWe3xUv0toLPE+coL0+s0ymxMVZGm+8H0zmX+BB0CjtUx1vwEGlvB1jbZ305NwatiDNbyLzGWhzORz+QWLZyTuIJXoR6KukmpqS3kuuZVQ/c9UbRxPxVN4sDg5PMyKKl57x/h4yjr5QREF7yqEPmplutdECGwvxp9tiAW8v860KNoTkg9kk5Osg1vIiGlNEs6Kl61zQiYlHDoNWnbwkP2W2I6zzFRQQmkjNFL7XqlqLgG3wUVx5DHDpVmrJ5aEHULZF5GleQbi+y5uDj61NGdZNQAwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsnQK1y3Kz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 20:45:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WsnQF0ZHkz9sRk;
	Mon, 26 Aug 2024 12:45:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8l3J2mPFqWI2; Mon, 26 Aug 2024 12:45:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WsnQD6mKZz9sPd;
	Mon, 26 Aug 2024 12:45:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D56398B779;
	Mon, 26 Aug 2024 12:45:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id L__8Kfk3Evvz; Mon, 26 Aug 2024 12:45:40 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 86F3C8B763;
	Mon, 26 Aug 2024 12:45:40 +0200 (CEST)
Message-ID: <51adbe91-3c3a-4baa-bb39-29df98a6eea5@csgroup.eu>
Date: Mon, 26 Aug 2024 12:45:40 +0200
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
 <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>
 <ZsxDssNPbLkcPetJ@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZsxDssNPbLkcPetJ@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/08/2024 à 10:58, Jason A. Donenfeld a écrit :
> On Mon, Aug 26, 2024 at 10:37:49AM +0200, Christophe Leroy wrote:
>>
>>
>> Le 26/08/2024 à 10:07, Jason A. Donenfeld a écrit :
>>> On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
>>>>    
>>>> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
>>>> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))
>>>
>>> If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SIZE
>>> instead of _PAGE_SIZE? But if that's the case, why not put the vdso
>>> definition of PAGE_SIZE into some vdso header included by this file?
>>
>> It was working ok on powerpc but on x86 I got:
> 
> Seems like there might be some more fiddling to do, then? Or did you
> conclude it's impossible?

Maybe someone who knows x86 in details could helps but after a first 
look I gave up because it looks very x86 specific, indeed that's 
x86/asm/vdso/gettimeofday.h that pulls several x86/asm/ headers , and 
the same type of issue might arise for any new architecture coming in.

For me it looked cleaner to just do as commit cffaefd15a8f ("vdso: Use 
CONFIG_PAGE_SHIFT in vdso/datapage.h") and not use PAGE_SIZE at all. But 
I didn't want to directly use (1UL << CONFIG_PAGE_SHIFT) and (~(1UL << 
(CONFIG_PAGE_SHIFT - 1))) in the code directly hence the new macros with 
a leading underscore to avoid any conflict with existing macros.

Christophe

