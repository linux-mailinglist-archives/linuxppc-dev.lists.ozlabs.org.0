Return-Path: <linuxppc-dev+bounces-598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F79607CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 12:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtPSZ0c85z2yNR;
	Tue, 27 Aug 2024 20:49:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724755790;
	cv=none; b=RddqvouRrbPLHD7gzJ6m4d57c0XPXpEP4fg51DIOqoFyOiZXJkHlsekzouThSxrr/jkv1UJxGhd2B0W8ZFJh/dzbkqqd3Ye0J0AaXV4TDyj9CRXoP5YdpFM4JrGcmlf7xDWhZyaY+byW2uO77DdFdNG4aavZjYKTga3RrHcwVuqUoo+3XVw1qUnLDAryZ1r/oIqeaZvOCBOWCHGq0bMHHJrC2uQE6eDvRu+4DtLou8A5vDqcAMUdlH4HOfutEHpVMR2C852vcxsIbI2IYcT7aGbgNuTBHXCnUq4BaxAS4KdiSOprxWtG2esEs6ZjpGth7m/TiV8WN2Z+xYzUDpCIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724755790; c=relaxed/relaxed;
	bh=LgP/1Ba6rEKCpv+qpwIeejazPrRuJZHMqPyuonehE4I=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=TAchtLrxiRxwHxSHb7dX1MFUrNQdBrR4o4hsAN0onakze4pe9sKrGW0pFZhS9HbGH+IUz8Wb270I1vv0HLA5UvaI7eA0McX+xP+oTyxmcP59qz8CfCY2dFmbaNo+E8zaLKzqTZbnJNhqVKYCIYVqwl6pEc++6udYCCiCzcHiyXrETtyMPREXlz6uAKA7KUDFoWcDwvXUhuAy08VPc+S5K0rOmzB0RGe06Vp5nFLRmD9DBFPkgrMlA7k3bxOFUiIv6ON1OP23Wy/bw49l835Mre3Wb8lhtv9W2+hcQ5WZBQGRa+/NcHPuC7cG1KBwIHccT6V4gyrKYCWjIE6LguOA3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtPSY5Gvfz2yLY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 20:49:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtPSS2j9wz9sPd;
	Tue, 27 Aug 2024 12:49:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6VbwRGJyrl0; Tue, 27 Aug 2024 12:49:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtPSS1j1pz9rvV;
	Tue, 27 Aug 2024 12:49:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 277298B783;
	Tue, 27 Aug 2024 12:49:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id upuflTr8zwv6; Tue, 27 Aug 2024 12:49:44 +0200 (CEST)
Received: from [192.168.233.149] (unknown [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C5778B77C;
	Tue, 27 Aug 2024 12:49:43 +0200 (CEST)
Message-ID: <0f9255f1-5860-408c-8eaa-ccb4dd3747fa@csgroup.eu>
Date: Tue, 27 Aug 2024 12:49:43 +0200
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
To: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>
References: <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <defab86b7fb897c88a05a33b62ccf38467dda884.1724747058.git.christophe.leroy@csgroup.eu>
 <Zs2RCfMgfNu_2vos@zx2c4.com>
 <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cb66b582-ba63-4a5a-9df8-b07288f1f66d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 27/08/2024 à 11:59, Arnd Bergmann a écrit :
> On Tue, Aug 27, 2024, at 10:40, Jason A. Donenfeld wrote:
>> I don't love this, but it might be the lesser of evils, so sure, let's
>> do it.
>>
>> I think I'll combine these header fixups so that the whole operation is
>> a bit more clear. The commit is still pretty small. Something like
>> below:
>>
>>  From 0d9a3d68cd6222395a605abd0ac625c41d4cabfa Mon Sep 17 00:00:00 2001
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Date: Tue, 27 Aug 2024 09:31:47 +0200
>> Subject: [PATCH] random: vDSO: clean header inclusion in getrandom
>>
>> Depending on the architecture, building a 32-bit vDSO on a 64-bit kernel
>> is problematic when some system headers are included.
>>
>> Minimise the amount of headers by moving needed items, such as
>> __{get,put}_unaligned_t, into dedicated common headers and in general
>> use more specific headers, similar to what was done in commit
>> 8165b57bca21 ("linux/const.h: Extract common header for vDSO") and
>> commit 8c59ab839f52 ("lib/vdso: Enable common headers").
>>
>> On some architectures this results in missing PAGE_SIZE, as was
>> described by commit 8b3843ae3634 ("vdso/datapage: Quick fix - use
>> asm/page-def.h for ARM64"), so define this if necessary, in the same way
>> as done prior by commit cffaefd15a8f ("vdso: Use CONFIG_PAGE_SHIFT in
>> vdso/datapage.h").
>>
>> Removing linux/time64.h leads to missing 'struct timespec64' in
>> x86's asm/pvclock.h. Add a forward declaration of that struct in
>> that file.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> This is clearly better, but there are still a couple of inaccuracies
> that may end up biting us again later. Not sure whether it's worth
> trying to fix it all at once or if we want to address them when that
> happens:
> 
>>   #include <linux/array_size.h>
>> -#include <linux/cache.h>
>> -#include <linux/kernel.h>
>> -#include <linux/time64.h>
>> +#include <linux/minmax.h>
> 
> These are still two headers outside of the vdso/ namespace. For arm64
> we had concluded that this is never safe, and any vdso header should
> only include other vdso headers so we never pull in anything that
> e.g. depends on memory management headers that are in turn broken
> for the compat vdso.
> 
> The array_size.h header is really small, so that one could
> probably just be moved into the vdso/ namespace. The minmax.h
> header is already rather complex, so it may be better to just
> open-code the usage of MIN/MAX where needed?

It is used at two places only so yes can to that.

Same for ARRAY_SIZE(->reserved) by the way, easy to do opencode, we also 
have it only once


> 
>>   #include <vdso/datapage.h>
>>   #include <vdso/getrandom.h>
>> +#include <vdso/unaligned.h>
>>   #include <asm/vdso/getrandom.h>
>> -#include <asm/vdso/vsyscall.h>
>> -#include <asm/unaligned.h>
>>   #include <uapi/linux/mman.h>
>> +#include <uapi/linux/random.h>
>> +
>> +#undef PAGE_SIZE
>> +#undef PAGE_MASK
>> +#define PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
>> +#define PAGE_MASK (~(PAGE_SIZE - 1))
> 
> Since these are now the same across all architectures, maybe we
> can just have the PAGE_SIZE definitions a vdso header instead
> and include that from asm/page.h.

I gave it a quick look yesterday, there are still some subtleties 
between architectures.

For instance, most architectures use 1UL for the shift but powerpc use 1 
and has the following comment:

/*
  * Subtle: (1 << PAGE_SHIFT) is an int, not an unsigned long. So if we
  * assign PAGE_MASK to a larger type it gets extended the way we want
  * (i.e. with 1s in the high bits)
  */

So we'll have to look at all this carefully when we want something 
common, or am I missing something ?

> 
> Including uapi/linux/mman.h may still be problematic on
> some architectures if they change it in a way that is
> incompatible with compat vdso, but at least that can't
> accidentally rely on CONFIG_64BIT or something else that
> would be wrong there.

Yes that one is tricky. Because uapi/linux/mman.h includes asm/mman.h 
with the intention to include uapi/asm/mman.h but when built from the 
kernel in reality you get arch/powerpc/include/asm/mman.h and I had to 
add some ifdefery to kick-out kernel oddities it contains that pull 
additional kernel headers.

diff --git a/arch/powerpc/include/asm/mman.h 
b/arch/powerpc/include/asm/mman.h
index 17a77d47ed6d..42a51a993d94 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -6,7 +6,7 @@

  #include <uapi/asm/mman.h>

-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) && !defined(BUILD_VDSO)

  #include <asm/cputable.h>
  #include <linux/mm.h>


Christophe

