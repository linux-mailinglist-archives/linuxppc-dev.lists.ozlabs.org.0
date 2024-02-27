Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6416486911C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 13:58:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lbeHOiis;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkcwl1GWBz3dWC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 23:58:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lbeHOiis;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkcw13YJ9z3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 23:57:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709038654;
	bh=swDhxalnop+40QyzTwmELhQq8fYEaBd8gs0d47AC/h8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lbeHOiisvAviMzJQIz1moD9CMIwDWnyEkMBx5y4p+r5c4IjQoB18qgrlVCvB1x8lp
	 iw5qgUFtP6yhK80WEdbT7VjiMz5ok3ncpSQJrzolcOlwZxH0A6OqtUbvamzsIkn3yn
	 RBV09p6PQKg3ejTTuOeVaiqbz3dvd4in83oOIMRRq6JTZgTEUiakFeAj3srmtE6C78
	 mi6JAHZh6pFZdAUi8XVUbjcFAS71GtwQc2qeDeH5P4Xuct27XPV7LT/rxZnWTHu126
	 fiuYYKa4gKtFpVdOYRIR7pO1OxjT3IRFVQPGGzi+xxv3ckTfZSwTY4PM6V5s6Vt2Jl
	 0WyDEwagYDlRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tkcvp132Mz4wbQ;
	Tue, 27 Feb 2024 23:57:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 4/4] vdso: avoid including asm/page.h
In-Reply-To: <80bc4de5-a351-4ac0-93c8-80c8d80fb202@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-5-arnd@kernel.org>
 <80bc4de5-a351-4ac0-93c8-80c8d80fb202@csgroup.eu>
Date: Tue, 27 Feb 2024 23:57:25 +1100
Message-ID: <87h6hu5akq.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <lin
 ux-snps-arc@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linux Kernel Functional Testing <lkft@linaro.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 26/02/2024 =C3=A0 17:14, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The recent change to the vdso_data_store broke building compat VDSO
>> on at least arm64 because it includes headers outside of the include/vds=
o/
>> namespace:
>
> I understand that powerpc64 also has an issue, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20231221120410.22=
26678-1-mpe@ellerman.id.au/

Yeah, and that patch would silently conflict with this series, which is
not ideal.

I could delay merging my patch above until after this series goes in,
mine only fixes a fairly obscure build warning.

cheers
