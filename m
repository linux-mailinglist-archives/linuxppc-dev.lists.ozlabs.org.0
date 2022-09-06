Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527115AF86F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMhZc13mQz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 09:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VE9G55kF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMhZ3300lz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 09:34:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VE9G55kF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MMhYq38SZz4xD3;
	Wed,  7 Sep 2022 09:34:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662507291;
	bh=4US3THlCO1EMb1gSb9ztork5wBimNJa/nZMcdS+Fg/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VE9G55kF0YvBPTmfEKRNLaOLD928FpPFqAcNpL+f8KrrJ98Z6/s7Ls4ACxDbQLjiz
	 E4hCICN6PrT1JV2Doci74i6u8iUELHz6WKa8weEmztx+WhmmFKzJcxoPtF0rjggIKm
	 BxWXqa3X6MefPexoJt+3HkCQG+lj0E3/25I9+R69dkW0ybhEIbZYoAeJYlfHpx/47O
	 +OsAyVQq2IrWk3kDEj8NBKVhMDl9QoQPtrUhII0czRT5IizvjFTt7liWxxkcoVacqF
	 jNKoxW2w8uKB9ovSNUnPneATOBtcgGJn4FyjeS4nZe4Px07FEr1ktrhp2CX3Vu8dGP
	 TTu5Vt4Ozw+Sg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
In-Reply-To: <CAK7LNARTX+2Z=pnGbbUepxskE+KZ1f5YsfQukJ88ijPBQt9_GA@mail.gmail.com>
References: <20220802015052.10452-1-ojeda@kernel.org>
 <20220802015052.10452-28-ojeda@kernel.org>
 <CAK7LNARTX+2Z=pnGbbUepxskE+KZ1f5YsfQukJ88ijPBQt9_GA@mail.gmail.com>
Date: Wed, 07 Sep 2022 09:34:38 +1000
Message-ID: <8735d4t6up.fsf@mpe.ellerman.id.au>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, rust-for-linux@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.in
 fradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Michal Marek <michal.lkml@markovi.net>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Tiago Lam <tiagolam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Tue, Aug 2, 2022 at 10:53 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>>
>> Having all the new files in place, we now enable Rust support
>> in the build system, including `Kconfig` entries related to Rust,
>> the Rust configuration printer, the target specification
>> generation script, the version detection script and a few
>> other bits.
...
>> +
>> +config RUSTC_VERSION_TEXT
>> +       string
>> +       depends on RUST
>> +       default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) --version || echo n)
>> +
>> +config BINDGEN_VERSION_TEXT
>> +       string
>> +       depends on RUST
>> +       default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGEN) --version || echo n)
>> +
>
> Where are these config options used?
>
> I grep'ed but no hit.
>
> masahiro@zoe:~/ref/linux-next$ git grep RUSTC_VERSION_TEXT
> init/Kconfig:config RUSTC_VERSION_TEXT
> masahiro@zoe:~/ref/linux-next$ git grep BINDGEN_VERSION_TEXT
> init/Kconfig:config BINDGEN_VERSION_TEXT

That came up before in a review by Nick:

Miguel wrote:
> Nick wrote:
> > Are these two kconfigs used anywhere?
> 
> Not for the moment, but it could still be useful when getting
> `.config` reports (and we could add it to `LINUX_COMPILER` etc. in the
> future).

https://lore.kernel.org/all/CANiq72n2bU3LSGu-4v66nif_95EVq--z2X_F2V7JBPU8v=h8EA@mail.gmail.com/


cheers
