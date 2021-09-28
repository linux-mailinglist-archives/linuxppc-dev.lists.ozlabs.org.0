Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A141A417
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 02:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJKnF4WsVz2xYd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 10:16:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YE4vK5P9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YE4vK5P9; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJKmd0zljz2xWf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:16:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJKmX5spJz4xLs;
 Tue, 28 Sep 2021 10:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632788176;
 bh=40Qjcb8alQIKNQ7ovWDvb3uMDNOj6u2mSouvybd+c8U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YE4vK5P9YiusbQolaISGGqbw4MSmlgr0kC9O4dDE4vhOWZ2Fmo0BVq9wmxsDcZ3hV
 W80h/uxllRg+IcULCeIMjbu3sqqPuAPrhZu9NMVfNoCPQsrpi2y4ER2uyYZY/53m0D
 fzEBhgCmKTGrvLM/c7bXFjD8K1vu/5nMylk9VLD1Z2g4eAhWey750rJgPZlLTesnu1
 rIaQj9Am5NVESisHbWmUMdEJgSwf5cPVGlWxWbpytvh99D8VzQKASAnBo3Awc53QqK
 yX8rx2Tk57NXkKKqSY+WGSvevVjmx5jEYC5fZ/F48e11+PeLesWlKR8my9tSeWcRt+
 yTiwhk81hk9gQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <87ee99lii7.fsf@mpe.ellerman.id.au>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au>
Date: Tue, 28 Sep 2021 10:16:10 +1000
Message-ID: <87pmst1rn9.fsf@mpe.ellerman.id.au>
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Ard Biesheuvel <ardb@kernel.org> writes:
>> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>>>
>>> The CPU field will be moved back into thread_info even when
>>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>>> of struct thread_info.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>
>> Michael,
>>
>> Do you have any objections or issues with this patch or the subsequent
>> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
>> that he was happy with it.
>
> No objections, it looks good to me, thanks for cleaning up that horror :)
>
> It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> git tree with the dependencies I'd be happy to run some tests over it.

Actually I realised I can just drop the last patch.

So that looks fine, passes my standard quick build & boot on qemu tests,
and builds with/without stack protector enabled.

cheers
