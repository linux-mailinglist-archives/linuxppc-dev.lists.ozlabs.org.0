Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB0B7E7455
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 23:26:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JOE+Y96n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRGkx3CPZz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 09:26:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JOE+Y96n;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SR1MQ3jNDz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 23:23:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699532610;
	bh=R2IIgl4ZRFgwipCQ4ZBWquxZCbtnLxeQT8yMzVcSClk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JOE+Y96nQb0g0fD7YjgIsTtXOrsQ0zdJ9Xit6bae239vdgrtE8Xe20tGEjOEwp6b5
	 bBGasTtN2qhciM6Vxj5gO1APMLHXfhhNabxTTxDpDoDz6AXcIv0hdu9+rRXuZNmSj3
	 PriUuPEOny5OCaNxYhuQeMYyhW0D7Uuip11fA5kii4KmxM9zaRV2MnEviCDpMHy6zq
	 fUfZ9elCA6bj44/a3P1CQqNaCruTVzrNA2B2UxDQEd/EBpaSM5DHluHgXy74J1JLYp
	 rlgnpTfcT5fdD0htnPYkbVFENF7DqxPzxI5N3NUPYBgm/lUlPDoiySV3dJVovZ01Br
	 M0UtCQNJ+RaEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SR1MD6jtmz4wd2;
	Thu,  9 Nov 2023 23:23:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Arnd
 Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
In-Reply-To: <886df4e4-9fc2-ca52-e7e9-53688e6e821a@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
 <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
 <87o7g3qlf5.fsf@mail.lhotse>
 <886df4e4-9fc2-ca52-e7e9-53688e6e821a@csgroup.eu>
Date: Thu, 09 Nov 2023 23:23:20 +1100
Message-ID: <87il6bqfnr.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 10 Nov 2023 09:25:33 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Netdev <netdev@vger.kernel.org>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kerne
 l.org>, Russell King <linux@armlinux.org.uk>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Ard Biesheuvel <ardb@kernel.org>, "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tg
 lx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, "David S . Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 09/11/2023 =C3=A0 11:18, Michael Ellerman a =C3=A9crit=C2=A0:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>> On Wed, Nov 8, 2023, at 19:31, Christophe Leroy wrote:
>>>> Le 08/11/2023 =C3=A0 13:58, Arnd Bergmann a =C3=A9crit=C2=A0:
>>>
>>>> powerpc has functions doing more or less the same, they are called
>>>> __c_kernel_clock_gettime() and alike with their prototypes siting in
>>>> arch/powerpc/include/asm/vdso/gettimeofday.h
>>>>
>>>> Should those prototypes be moved to include/vdso/gettime.h too and
>>>> eventually renamed, or are they considered too powerpc specific ?
>>>
>>> I don't actually know, my initial interpretation was that
>>> these function names are part of the user ABI for the vdso,
>>> but I never looked closely enough at how vdso works to
>>> be sure what the actual ABI is.
>>=20
>> AFAIK the ABI is just the symbols we export, as defined in the linker
>> script:
>>=20
>> /*
>>   * This controls what symbols we export from the DSO.
>>   */
>> VERSION
>> {
>> 	VDSO_VERSION_STRING {
>> 	global:
>> 		__kernel_get_syscall_map;
>> 		__kernel_gettimeofday;
>> 		__kernel_clock_gettime;
>> 		__kernel_clock_getres;
>> 		__kernel_get_tbfreq;
>> 		__kernel_sync_dicache;
>> 		__kernel_sigtramp_rt64;
>> 		__kernel_getcpu;
>> 		__kernel_time;
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/powerpc/kernel/vdso/vdso64.lds.S?h=3Dv6.6&#n117
>>=20
>>> If __c_kernel_clock_gettime() etc are not part of the user-facing
>>> ABI, I think renaming them for consistency with the other
>>> architectures would be best.
>>=20
>> The __c symbols are not part of the ABI, so we could rename them.
>>=20
>> At the moment though they don't have the same prototype as the generic
>> versions, because we find the VDSO data in asm and pass it to the C
>> functions, eg:
>>=20
>> int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct time=
zone *tz,
>> 			    const struct vdso_data *vd);
>>=20
>> I think we can rework that though, by implementing
>> __arch_get_vdso_data() and getting the vdso_data in C. Then we'd be able
>> to share the prototypes.
>
> I think it would not a been good idea, it would be less performant, for=20
> explanation see commit=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De876f0b69dc993e86ca7795e63e98385aa9a7ef3

Ah thanks. I was wondering why you had done it in asm.

It's a pity but you're right that's probably a measurable performance
hit for some of those calls.

cheers
