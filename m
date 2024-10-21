Return-Path: <linuxppc-dev+bounces-2471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49979A92FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 00:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXTvr4yMfz2yLT;
	Tue, 22 Oct 2024 09:08:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729517028;
	cv=none; b=AvB183cvFMyEqdlvjOMGS8W63zcbDASAOctUt6g99kCWL0Ftqs4SrLyLxCyADyURyDMDoB+qnE/syDLlrIeJrXEVi6be7TiUJIoMAvY3yPhv4Ex0BSdmRz+PLOLibAKefxL9S7I0r2Q+IDrT+CBMOt/CV2fZ2ZFGfqsITNxPSlza0jnGjrmd5yanvNSGNkLtX2Y4tg7wT7dOxO6yP0o7svZHHh+frTVcrwb0Pa3GGtIRs6SXgRtGFRggBqnoPKWKBmwxJRyqx4Jvt4harXOGtlJ9phAM3ZzuSpaiz/A7JSEc5aigUEq2Rok9wshZfgYe+6U3F8lTqNmjTMgyv0t01g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729517028; c=relaxed/relaxed;
	bh=iF1qVfbrTRtpSgxM/EnORS8lS3vKqXn/rHlPgeo+5Wg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LzX6TQGCexnneYClTjoyuHJXz5n/9QWTSdNzJ/dj2HAc59PCdC/6xszf+6HuE73b7LF0uCRX5V8u8XK0eqLfPwc2vlWqqhx0WJD/1NvGFxVpGeRl1XOuOpkIWpoSWj7z0Ed818nqBOYNLjxqF/n4Q94uU9osGK34QpovWbnHLEWTdA5TEyvPIlqhqutT31zgQAMunjQxbXRcIMLlFM4DP7EFopz/a71aMzkT/mJshh6y2z1e9I4aBqxtEYr2RxXfEFlkR50/0y70Zt+JUarQq+G4NwtHR5FQjywVyo4Xtg/VgiaqA6TV+Pd/dSH2NjSUQ8e6WPuhjFgJO/pxj79z+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXGGp2l6Sz2xJy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 00:23:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B4ADA7;
	Mon, 21 Oct 2024 06:23:40 -0700 (PDT)
Received: from [10.57.24.27] (unknown [10.57.24.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8DCB3F73B;
	Mon, 21 Oct 2024 06:22:59 -0700 (PDT)
Message-ID: <b6ca55b7-4de2-4085-97bd-619f91d9fcb8@arm.com>
Date: Mon, 21 Oct 2024 14:22:56 +0100
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
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
 <Ztnp3OAIRz/daj7s@ghost>
 <pbotlphw77fkfacldtpxfjcs2w5nhb2uvxszv5rmlrhjm42akd@4pvcqb7ojq4v>
Content-Language: en-GB
In-Reply-To: <pbotlphw77fkfacldtpxfjcs2w5nhb2uvxszv5rmlrhjm42akd@4pvcqb7ojq4v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 09/09/2024 10:46, Kirill A. Shutemov wrote:
> On Thu, Sep 05, 2024 at 10:26:52AM -0700, Charlie Jenkins wrote:
>> On Thu, Sep 05, 2024 at 09:47:47AM +0300, Kirill A. Shutemov wrote:
>>> On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
>>>> Some applications rely on placing data in free bits addresses allocated
>>>> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
>>>> address returned by mmap to be less than the 48-bit address space,
>>>> unless the hint address uses more than 47 bits (the 48th bit is reserved
>>>> for the kernel address space).
>>>>
>>>> The riscv architecture needs a way to similarly restrict the virtual
>>>> address space. On the riscv port of OpenJDK an error is thrown if
>>>> attempted to run on the 57-bit address space, called sv57 [1].  golang
>>>> has a comment that sv57 support is not complete, but there are some
>>>> workarounds to get it to mostly work [2].
> 
> I also saw libmozjs crashing with 57-bit address space on x86.
> 
>>>> These applications work on x86 because x86 does an implicit 47-bit
>>>> restriction of mmap() address that contain a hint address that is less
>>>> than 48 bits.
>>>>
>>>> Instead of implicitly restricting the address space on riscv (or any
>>>> current/future architecture), a flag would allow users to opt-in to this
>>>> behavior rather than opt-out as is done on other architectures. This is
>>>> desirable because it is a small class of applications that do pointer
>>>> masking.
> 
> You reiterate the argument about "small class of applications". But it
> makes no sense to me.

Sorry to chime in late on this - I had been considering implementing
something like MAP_BELOW_HINT and found this thread.

While the examples of applications that want to use high VA bits and get
bitten by future upgrades is not very persuasive. It's worth pointing
out that there are a variety of somewhat horrid hacks out there to work
around this feature not existing.

E.g. from my brief research into other code:

  * Box64 seems to have a custom allocator based on reading 
    /proc/self/maps to allocate a block of VA space with a low enough 
    address [1]

  * PHP has code reading /proc/self/maps - I think this is to find a 
    segment which is close enough to the text segment [2]

  * FEX-Emu mmap()s the upper 128TB of VA on Arm to avoid full 48 bit
    addresses [3][4]

  * pmdk has some funky code to find the lowest address that meets 
    certain requirements - this does look like an ALSR alternative and 
    probably couldn't directly use MAP_BELOW_HINT, although maybe this 
    suggests we need a mechanism to map without a VA-range? [5]

  * MIT-Scheme parses /proc/self/maps to find the lowest mapping within 
    a range [6]

  * LuaJIT uses an approach to 'probe' to find a suitable low address 
    for allocation [7]

The biggest benefit I see of MAP_BELOW_HINT is that it would allow a
library to get low addresses without causing any problems for the rest
of the application. The use case I'm looking at is in a library and 
therefore a personality mode wouldn't be appropriate (because I don't 
want to affect the rest of the application). Reading /proc/self/maps
is also problematic because other threads could be allocating/freeing
at the same time.

Thanks,
Steve


[1] https://sources.debian.org/src/box64/0.3.0+dfsg-1/src/custommem.c/
[2] https://sources.debian.org/src/php8.2/8.2.24-1/ext/opcache/shared_alloc_mmap.c/#L62
[3] https://github.com/FEX-Emu/FEX/blob/main/FEXCore/Source/Utils/Allocator.cpp
[4] https://github.com/FEX-Emu/FEX/commit/df2f1ad074e5cdfb19a0bd4639b7604f777fb05c
[5] https://sources.debian.org/src/pmdk/1.13.1-1.1/src/common/mmap_posix.c/?hl=29#L29
[6] https://sources.debian.org/src/mit-scheme/12.1-3/src/microcode/ux.c/#L826
[7] https://sources.debian.org/src/luajit/2.1.0+openresty20240815-1/src/lj_alloc.c/

> With full address space by default, this small class of applications is
> going to *broken* unless they would handle RISC-V case specifically.
> 
> On other hand, if you limit VA to 128TiB by default (like many
> architectures do[1]) everything would work without intervention.
> And if an app needs wider address space it would get it with hint opt-in,
> because it is required on x86-64 anyway. Again, no RISC-V-specific code.
> 
> I see no upside with your approach. Just worse user experience.
> 
> [1] See va_high_addr_switch test case in https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/mm/Makefile#n115
> 


