Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17341A3B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 01:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJJNp5M2gz2yb9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 09:14:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SpP9Ag4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=gandalf.ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SpP9Ag4c; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJJNB4lCYz2xtg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 09:13:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJJN212Dmz4xVP;
 Tue, 28 Sep 2021 09:13:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632784407;
 bh=CSBhgRacMH4wdNz2+6sz+UADE1Z/+Rt10XRo6G7F4qc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SpP9Ag4cak7uAXRzz2oEmCUoFYobVM1YDaU7H2umvim4BfissG2tOopwTVM+QWkPz
 ghgj6oLQBTg5oDf2NWjGYSmE9cyVG2OnhS4PGKCG0kZdLg1y7LnWfeAAXywPMS731F
 QZkED7zLRXNCfN+p5XJsCb/mEfuBMhjK0vBM2M/FronydUaFEXBcGAzRon4NUZDdUi
 c5+mvpDKJwLSK8UzkrhrUYXZtS7fX7Bjmd8BdVkDlYlrHSSNC7PnfeGdU05fUui1SA
 nmOZ+MwplIXOJUwftG2odSSkbquxMriRVgTLz1E8nWEaxVgFqlAtsezQzR2t7KNQX7
 ksfYi+D9EIhBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
Date: Tue, 28 Sep 2021 09:13:20 +1000
Message-ID: <87ee99lii7.fsf@mpe.ellerman.id.au>
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

Ard Biesheuvel <ardb@kernel.org> writes:
> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>>
>> The CPU field will be moved back into thread_info even when
>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>> of struct thread_info.
>>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Michael,
>
> Do you have any objections or issues with this patch or the subsequent
> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
> that he was happy with it.

No objections, it looks good to me, thanks for cleaning up that horror :)

It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
git tree with the dependencies I'd be happy to run some tests over it.

cheers
