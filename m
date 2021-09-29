Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435641CF65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 00:46:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKWhV3ghqz2ypZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 08:46:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YxATzawC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKWgq38xxz2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 08:46:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YxATzawC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKWgd3pfqz4xLs;
 Thu, 30 Sep 2021 08:46:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632955572;
 bh=mpz+ka0h5K/JeORjuWrldvkBfYvvKVxRrDGCbb8QaxM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YxATzawCxVN5sXizjsSK6S7RmonpLlF9oJF/MzCwKjaqGOkxQU+wrsp9Aihb7q6f4
 8GmMB7JxN87gLBhYVK3Zsr6oocxO4D034AESqrL36bmLJBQR0VbKEMX1PrJ8h9V2He
 DvukSjI/bK0ghU5kui/5Qg3bKETueRQFs2qi67vi7D8p6Ikua4ZqAn+UP1pJNfYJWc
 ekBRWmi8RgDX2UCqKpuyvfscHtaX9JBMajmNaoWRV+nv1fRnYpP3UbHtKtmkepjmwr
 qKNthuRrkZuaeD0FFBoveGtnBDBa4N7MgTnXupxaZSaye1CcxW6kdWE+BJK8lh64qY
 v6XnWxPI6wDDQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au> <87pmst1rn9.fsf@mpe.ellerman.id.au>
 <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
Date: Thu, 30 Sep 2021 08:46:04 +1000
Message-ID: <878rzf0zmb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:LINUX FOR POWERPC
 \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ard Biesheuvel <ardb@kernel.org> writes:
> On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Ard Biesheuvel <ardb@kernel.org> writes:
>> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >>>
>> >>> The CPU field will be moved back into thread_info even when
>> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>> >>> of struct thread_info.
>> >>>
>> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> >>
>> >> Michael,
>> >>
>> >> Do you have any objections or issues with this patch or the subsequent
>> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
>> >> that he was happy with it.
>> >
>> > No objections, it looks good to me, thanks for cleaning up that horror :)
>> >
>> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
>> > git tree with the dependencies I'd be happy to run some tests over it.
>>
>> Actually I realised I can just drop the last patch.
>>
>> So that looks fine, passes my standard quick build & boot on qemu tests,
>> and builds with/without stack protector enabled.
>>
>
> Thanks.
>
> Do you have any opinion on how this series should be merged? Kees Cook
> is willing to take them via his cross-arch tree, or you could carry
> them if you prefer. Taking it via multiple trees at the same time is
> going to be tricky, or take two cycles, with I'd prefer to avoid.

I don't really mind. If Kees is happy to take it then that's OK by me.

If Kees put the series in a topic branch based off rc2 then I could
merge that, and avoid any conflicts.

cheers
