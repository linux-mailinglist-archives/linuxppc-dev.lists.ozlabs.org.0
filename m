Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BEA7F2422
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 03:40:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oWW1QkZz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ7sB31fFz3d8J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 13:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oWW1QkZz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ5mh0Jcbz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 12:06:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700528778;
	bh=a1oDztLoqCcees2awcLjiaomu8bb0ZU8fyFhFCJHT4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oWW1QkZze+kq8dXCMwzP9xmtsiBPKW/hq5HCmqkQq67lD/f/fkTpd/U8FMenAoeLl
	 J1jHM3vpiqO6+SZ8oTRmtfdXJh/kl4ccKcHX93lWk6Fma5jYDgW+qHGJ9G1c3wWEWD
	 7wf1DanMy/hBgRK5n8rOjbSflcR7GKDrM1MFeaKqqOQQlvcOByEoS81ZnH8kRCiVRW
	 Sitlo5WEKfvTkyRjxvm6DcVAjGDg3Q0vGj0AeAoNLiUIP8cnYZXsQFMSjypuMtAUTc
	 2SzMvY2J7oKCYA9k2z45igYP3WpwqyzkKDLwx57xpFYnZrXJC9CTNoEySocvsKn9xW
	 xnByzdpmU0vWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ5mB3sycz4wd7;
	Tue, 21 Nov 2023 12:06:02 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ignat Korchagin <ignat@cloudflare.com>, eric.devolder@oracle.com
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
In-Reply-To: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
Date: Tue, 21 Nov 2023 12:05:59 +1100
Message-ID: <87y1er6hl4.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 21 Nov 2023 13:39:48 +1100
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, kernel-team <kernel-team@cloudflare.com>, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, Ingo Molnar <mingo@redhat.com>, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, Ard Biesheuvel <ardb@kernel.org>, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, go
 r@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, bhe@redhat.com, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel <linux-kernel@vger.kernel.org>, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ignat Korchagin <ignat@cloudflare.com> writes:
> Good day!
>
> We have recently started to evaluate Linux 6.6 and noticed that we
> cannot disable CONFIG_KEXEC anymore, but keep CONFIG_CRASH_DUMP
> enabled. It seems to be related to commit 89cde455 ("kexec:
> consolidate kexec and crash options into kernel/Kconfig.kexec"), where
> a CONFIG_KEXEC dependency was added to CONFIG_CRASH_DUMP.
>
> In our current kernel (Linux 6.1) we only enable CONFIG_KEXEC_FILE
> with enforced signature check to support the kernel crash dumping
> functionality and would like to keep CONFIG_KEXEC disabled for
> security reasons [1].
>
> I was reading the long commit message, but the reason for adding
> CONFIG_KEXEC as a dependency for CONFIG_CRASH_DUMP evaded me. And I
> believe from the implementation perspective CONFIG_KEXEC_FILE should
> suffice here (as we successfully used it for crashdumps on Linux 6.1).
>
> Is there a reason for adding this dependency or is it just an
> oversight? Would some solution of requiring either CONFIG_KEXEC or
> CONFIG_KEXEC_FILE work here?

I don't actually see any reason for CRASH_DUMP to depend on KEXEC or
KEXEC_FILE.

None of the old CRASH_DUMP symbols depended on KEXEC AFAICS. Using
something like:

 $ git diff 89cde455..95d1fef5 | grep -A 3 "^-.*config CRASH_DUMP"

It's reasonable to want to build a kernel that supports CRASH_DUMP (ie.
can be a dump kernel), but doesn't support kexec and requires a regular
reboot. Though I doubt anyone does that in practice?

cheers
