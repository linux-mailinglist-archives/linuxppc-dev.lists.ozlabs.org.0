Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD8695E76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 10:11:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGFnT32HPz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:11:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=AhilTieb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xen0n.name (client-ip=115.28.160.31; helo=mailbox.box.xen0n.name; envelope-from=kernel@xen0n.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=AhilTieb;
	dkim-atps=neutral
X-Greylist: delayed 461 seconds by postgrey-1.36 at boromir; Tue, 14 Feb 2023 20:07:40 AEDT
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGFj84fcyz3fS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 20:07:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1676365191; bh=i0XIzR1Y5NYJLkaxQFngDX1j91Olf/QjeHaXDd3DD/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AhilTiebsZniB4h/3TCzhrMAQ0m1fI8D/hKY2T+4ArseJ+m3Ze12b64a7BZ4L0BhC
	 Cbii2w7OdAf8LC8paKh0dS4uxyxEGslyDxyzPafGMqQIX/0BH2c+SoMYy+3DyDz8fs
	 BbZrEFqt55X8c4cMx2sqOxvYHoYE3tKQfpxZHtYc=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B491D600F8;
	Tue, 14 Feb 2023 16:59:47 +0800 (CST)
Message-ID: <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
Date: Tue, 14 Feb 2023 16:59:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-11-alexghiti@rivosinc.com>
 <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/2/14 16:50, Sergey Shtylyov wrote:
> On 2/14/23 10:49 AM, Alexandre Ghiti wrote:
> 
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   arch/sparc/include/asm/setup.h      | 6 +++++-
>>   arch/sparc/include/uapi/asm/setup.h | 7 -------
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
>> index 72205684e51e..d1384ed92547 100644
>> --- a/arch/sparc/include/asm/setup.h
>> +++ b/arch/sparc/include/asm/setup.h
>> @@ -7,7 +7,11 @@
>>   
>>   #include <linux/interrupt.h>
>>   
>> -#include <uapi/asm/setup.h>
>> +#if defined(__sparc__) && defined(__arch64__)
> 
>     Mhm, I don't think these two can be #define'd simulaneously...

I believe it's just a SPARC-ism [1] [2] that may look strange and be 
easily confused for __aarch64__ (notice the extra 'a')...

[1]: 
https://github.com/gcc-mirror/gcc/blob/basepoints/gcc-12/gcc/config/sparc/sparc.h#L301
[2]: 
https://github.com/llvm/llvm-project/blob/llvmorg-17-init/clang/lib/Basic/Targets/Sparc.cpp#L241

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

