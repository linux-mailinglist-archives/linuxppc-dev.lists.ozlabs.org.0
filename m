Return-Path: <linuxppc-dev+bounces-617-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205B96153B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 19:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtZ0p61G3z2y71;
	Wed, 28 Aug 2024 03:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724778890;
	cv=none; b=Xltwa97Ci9xrobkePySrr7mNEHgt1n9t1FK19nyW39m9mSTxBYnWjTwsRuhXty9LrUpEvyBCj4Xgxvob0R4fyryp8Xo597RS+o1D9LvQWOsVgXMG3kLtIClJ+2BSgbmEcXHMdz8+L8Zgo/2odo+yN7xRCixIsglEE4NOouEOkoIQS6zdoK+MYZovde4KFKTzu/fqySfoN+osuESZe44h15dyFmbDr227PFAMkqN+fIuOLJXyNgkakXC+KTx4IpHjN5ts7bJSwus4t3iQexBqjQZpuleEqCjcmJxlsBpZy48U8oPY5Pn6Om3O66hBqMkH+1co9/COh1gv+LhQ+e3qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724778890; c=relaxed/relaxed;
	bh=3+drzwRCCJNM4lYsNtCZriCeP0U1+lSpudfpkikjviE=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=N+JjgcFFV2VQJqVq3nnVB1ydHhdSyMrOV+W9yL4XB4dk5a+DRzlOtqA/wyfMB0eOTkFTrZ3xdZ9mdmJW2tw8W0YV8LuN+TRcrPdp9u4Ge8uKIX9rwXFcjUmCRT6++e7YhZBkC+ZPWsbLwCWxRzf8dirZ5xi7sNreKWbqEQb2iS5QDdRV7Ol5A6/6chwXX26yFQ5I1JOBiFYp6yAt6pePEiKTT9JR8p31U7YjtIecDSM9d8OkykV0JBjvqHtk3sti7VFQx2OgEYDsh2FZrUXm/+S9E5yy678usQmbWagkE8kkYUnG96xn0pFyzGEJKBrPABDmfMBHDBt+hgV4BBP/Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtZ0p1HHVz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 03:14:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtZ0j6MpFz9sRy;
	Tue, 27 Aug 2024 19:14:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d700GxHyWDBb; Tue, 27 Aug 2024 19:14:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtZ0j2yPhz9sRs;
	Tue, 27 Aug 2024 19:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DF298B78B;
	Tue, 27 Aug 2024 19:14:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oI_YXMVBxxRm; Tue, 27 Aug 2024 19:14:45 +0200 (CEST)
Received: from [192.168.233.149] (unknown [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 761A68B77C;
	Tue, 27 Aug 2024 19:14:44 +0200 (CEST)
Message-ID: <272cb38a-c0e3-4e6e-89ce-b503c75c2c33@csgroup.eu>
Date: Tue, 27 Aug 2024 19:14:44 +0200
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
Subject: Re: [PATCH] random: vDSO: Redefine PAGE_SIZE and PAGE_MASK
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
 <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
 <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <17437f43-9d1f-4263-888e-573a355cb0b5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 27/08/2024 à 18:05, Vincenzo Frascino a écrit :
> Hi Christophe,
> 
> On 27/08/2024 11:49, Christophe Leroy wrote:
> 
> ...
> 
> 
>>>
>>> These are still two headers outside of the vdso/ namespace. For arm64
>>> we had concluded that this is never safe, and any vdso header should
>>> only include other vdso headers so we never pull in anything that
>>> e.g. depends on memory management headers that are in turn broken
>>> for the compat vdso.
>>>
>>> The array_size.h header is really small, so that one could
>>> probably just be moved into the vdso/ namespace. The minmax.h
>>> header is already rather complex, so it may be better to just
>>> open-code the usage of MIN/MAX where needed?
>>
>> It is used at two places only so yes can to that.
>>
> 
> Could you please clarify where minmax is needed? I tried to build Jason's master
> tree for x86, commenting the header and it seems building fine. I might be
> missing something.

Without it:

   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
In file included from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:11,
                  from <command-line>:
./arch/powerpc/include/asm/vdso/getrandom.h: In function 
'__arch_get_vdso_rng_data':
./arch/powerpc/include/asm/vdso/getrandom.h:46:9: error: implicit 
declaration of function 'BUILD_BUG' [-Werror=implicit-function-declaration]
    46 |         BUILD_BUG();
       |         ^~~~~~~~~
./arch/powerpc/include/asm/vdso/getrandom.h:47:1: error: no return 
statement in function returning non-void [-Werror=return-type]
    47 | }
       | ^
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function 
'__cvdso_getrandom_data':
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:76:23: error: implicit 
declaration of function 'min_t' [-Werror=implicit-function-declaration]
    76 |         ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = 
MAX_RW_COUNT */, len);
       |                       ^~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:76:29: error: expected 
expression before 'size_t'
    76 |         ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = 
MAX_RW_COUNT */, len);
       |                             ^~~~~~
In file included from ./include/linux/array_size.h:5,
                  from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:6:
./include/linux/compiler.h:243:33: error: implicit declaration of 
function 'BUILD_BUG_ON_ZERO' [-Werror=implicit-function-declaration]
   243 | #define __must_be_array(a) 
BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
       |                                 ^~~~~~~~~~~~~~~~~
./include/linux/array_size.h:11:59: note: in expansion of macro 
'__must_be_array'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | 
^~~~~~~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: note: in 
expansion of macro 'ARRAY_SIZE'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                        ^~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:196:27: error: expected 
expression before 'size_t'
   196 |         batch_len = min_t(size_t, sizeof(state->batch) - 
state->pos, len);
       |                           ^~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:247:9: error: implicit 
declaration of function 'BUILD_BUG_ON' 
[-Werror=implicit-function-declaration]
   247 |         BUILD_BUG_ON(sizeof(state->batch_key) % 
CHACHA_BLOCK_SIZE != 0);
       |         ^~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [arch/powerpc/kernel/vdso/Makefile:93: 
arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
make: *** [Makefile:224: __sub-make] Error 2


> 
>> Same for ARRAY_SIZE(->reserved) by the way, easy to do opencode, we also have it
>> only once
>>
> 
> I have a similar issue to figure out why linux/array_size.h and
> uapi/linux/random.h are needed. It seems that I can build the object without
> them. Could you please explain?

Without linux/array_size.h:

   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
In file included from <command-line>:
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function 
'__cvdso_getrandom_data':
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: error: implicit 
declaration of function 'ARRAY_SIZE' [-Werror=implicit-function-declaration]
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                        ^~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [arch/powerpc/kernel/vdso/Makefile:93: 
arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
make: *** [Makefile:224: __sub-make] Error 2

Without uapi/linux/random.h:

   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
In file included from <command-line>:
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c: In function 
'__cvdso_getrandom_data':
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:86:23: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    86 |                 params->size_of_opaque_state = sizeof(*state);
       |                       ^~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:87:23: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    87 |                 params->mmap_prot = PROT_READ | PROT_WRITE;
       |                       ^~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:88:23: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    88 |                 params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
       |                       ^~
In file included from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:6:
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:57: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                                         ^~
./include/linux/array_size.h:11:33: note: in definition of macro 
'ARRAY_SIZE'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       |                                 ^~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:57: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                                         ^~
./include/linux/array_size.h:11:48: note: in definition of macro 
'ARRAY_SIZE'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       |                                                ^~~
In file included from ./include/linux/minmax.h:5,
                  from /home/chleroy/linux-powerpc/lib/vdso/getrandom.c:7:
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:57: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                                         ^~
./include/linux/build_bug.h:16:62: note: in definition of macro 
'BUILD_BUG_ON_ZERO'
    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
int:(-!!(e)); })))
       |                                                              ^
./include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
   243 | #define __must_be_array(a) 
BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
       |                                                   ^~~~~~~~~~~
./include/linux/array_size.h:11:59: note: in expansion of macro 
'__must_be_array'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | 
^~~~~~~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: note: in 
expansion of macro 'ARRAY_SIZE'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                        ^~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:57: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                                         ^~
./include/linux/build_bug.h:16:62: note: in definition of macro 
'BUILD_BUG_ON_ZERO'
    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
int:(-!!(e)); })))
       |                                                              ^
./include/linux/compiler.h:243:51: note: in expansion of macro '__same_type'
   243 | #define __must_be_array(a) 
BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
       |                                                   ^~~~~~~~~~~
./include/linux/array_size.h:11:59: note: in expansion of macro 
'__must_be_array'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | 
^~~~~~~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: note: in 
expansion of macro 'ARRAY_SIZE'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                        ^~~~~~~~~~
./include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width 
not an integer constant
    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { 
int:(-!!(e)); })))
       |                                                   ^
./include/linux/compiler.h:243:33: note: in expansion of macro 
'BUILD_BUG_ON_ZERO'
   243 | #define __must_be_array(a) 
BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
       |                                 ^~~~~~~~~~~~~~~~~
./include/linux/array_size.h:11:59: note: in expansion of macro 
'__must_be_array'
    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + 
__must_be_array(arr))
       | 
^~~~~~~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:89:40: note: in 
expansion of macro 'ARRAY_SIZE'
    89 |                 for (size_t i = 0; i < 
ARRAY_SIZE(params->reserved); ++i)
       |                                        ^~~~~~~~~~
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:90:31: error: invalid 
use of undefined type 'struct vgetrandom_opaque_params'
    90 |                         params->reserved[i] = 0;
       |                               ^~
In file included from ./include/linux/array_size.h:5:
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:99:32: error: 
'GRND_NONBLOCK' undeclared (first use in this function); did you mean 
'MAP_NONBLOCK'?
    99 |         if (unlikely(flags & ~(GRND_NONBLOCK | GRND_RANDOM | 
GRND_INSECURE)))
       |                                ^~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
    77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |                                             ^
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:99:32: note: each 
undeclared identifier is reported only once for each function it appears in
    99 |         if (unlikely(flags & ~(GRND_NONBLOCK | GRND_RANDOM | 
GRND_INSECURE)))
       |                                ^~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
    77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |                                             ^
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:99:48: error: 
'GRND_RANDOM' undeclared (first use in this function)
    99 |         if (unlikely(flags & ~(GRND_NONBLOCK | GRND_RANDOM | 
GRND_INSECURE)))
       |                                                ^~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
    77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |                                             ^
/home/chleroy/linux-powerpc/lib/vdso/getrandom.c:99:62: error: 
'GRND_INSECURE' undeclared (first use in this function)
    99 |         if (unlikely(flags & ~(GRND_NONBLOCK | GRND_RANDOM | 
GRND_INSECURE)))
       | 
^~~~~~~~~~~~~
./include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
    77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |                                             ^
make[2]: *** [arch/powerpc/kernel/vdso/Makefile:93: 
arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
make: *** [Makefile:224: __sub-make] Error 2


> 
> In general, the philosophy adopted to split the headers is to extract the set of
> functions used by vDSOs from the linux headers and place them in the vdso headers.
> Consequently the linux header includes to vdso one. E.g.: linux/time64.h
> includes vdso/time64.h.
> 
> IMHO we should follow the same approach, if at all for consistency, unless there
> is a valid reason.

Indeed I started with something that didn't build and I did the simplest 
I could to get it build. I agree with you at the end that would be a 
best, can be done in follow-up patches I guess.

> 
> ...
> 
>>>
>>> Including uapi/linux/mman.h may still be problematic on
>>> some architectures if they change it in a way that is
>>> incompatible with compat vdso, but at least that can't
>>> accidentally rely on CONFIG_64BIT or something else that
>>> would be wrong there.
>>
>> Yes that one is tricky. Because uapi/linux/mman.h includes asm/mman.h with the
>> intention to include uapi/asm/mman.h but when built from the kernel in reality
>> you get arch/powerpc/include/asm/mman.h and I had to add some ifdefery to
>> kick-out kernel oddities it contains that pull additional kernel headers.
>>
>> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
>> index 17a77d47ed6d..42a51a993d94 100644
>> --- a/arch/powerpc/include/asm/mman.h
>> +++ b/arch/powerpc/include/asm/mman.h
>> @@ -6,7 +6,7 @@
>>
>>   #include <uapi/asm/mman.h>
>>
>> -#ifdef CONFIG_PPC64
>> +#if defined(CONFIG_PPC64) && !defined(BUILD_VDSO)
>>
>>   #include <asm/cputable.h>
>>   #include <linux/mm.h>
>>
> 
> I agree with Arnd here. uapi/linux/mman.h can cause us problems in the long run.

Fully agree.

> 
> I am attaching a patch to provide my view on how to minimize the headers
> included and use only the vdso/ namespace. Please, before using the code,
> consider that I conducted very limited testing.
> 
> Note: It should apply clean on Jason's tree.
> 
> Let me know your thoughts.
> 
>>
>> Christophe
> 

