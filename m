Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 496304B365E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 17:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jwwgs6k3Zz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 03:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=diiOuL6v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=diiOuL6v; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwwgC336Gz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 03:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ps4Dpti6anPMML5DYvmxj3DVlK84HL9lrfnW5s1I7I=; b=diiOuL6v4zmcZFLQ7gZZaN9BB3
 oDxx5cZ30Fmaus1PFKW31N94BRa5pvI/DafyMb9VxVulw7aS/gMckVjYHQ7s7OAlMPCE4bju0hX9h
 +0QSM40rREXJOCDBrR7c09iOuvhD8ZQuCjYGZVhY8cH6Ura2HLhIE6F8e5vYXv7gflZ0F13Fpzxzb
 XVLT87dmvRb0/gKrvbW0sWa4oAK4TQwDrClnIfQFTSAWOlw5TzdIEduy8X+sHLA8uJ5gcpcID/FpB
 Ic0xkLP47aZfK0t7aYD9o2WLBAsMaBfxnD1ZljA3Xj9iHMxzFRDbqcc/oEEuW0b8IVnn61sBFAZwD
 fN6oGatg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57218)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nIv75-0008Hc-BQ; Sat, 12 Feb 2022 16:19:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nIv6x-0004fN-8O; Sat, 12 Feb 2022 16:18:59 +0000
Date: Sat, 12 Feb 2022 16:18:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
Message-ID: <Ygfd82QN/wmSmlHa@shell.armlinux.org.uk>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
 <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
 <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Finn Behrens <me@kloenk.de>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 12, 2022 at 04:47:33PM +0100, Miguel Ojeda wrote:
> Hi Russell,
> 
> On Sat, Feb 12, 2022 at 3:17 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > Please don't use CPU_32v6* here.
> >
> > It probably makes more sense to add a symbol "HAVE_RUST" and have the
> > appropriate architecture Kconfig files select HAVE_RUST.
> 
> We can do it whatever way arch maintainers prefer, of course. Why
> would you prefer one over the other?

It would be cleaner, rather than the "depends" line getting longer
and longer over time - and if different architecture maintainers
change it, it will lead to conflicts.

> > Does Rust support Thumb on ARMv6 and ARMv7 architectures?
> 
> Yes, the main backend is LLVM. Some built-in targets and their support
> level are listed here, if you want to take a look:

Right, so why made it dependent on CPU_32v6 || CPU_32v6K if ARMv7 is
supported? What about CPU_32v7? What about CPU_32v7M?

I think it would be saner to use the CPU_V6, CPU_V6K, CPU_V7 and maybe
CPU_V7M here - even bettern to select "HAVE_RUST" from these symbols,
since I'm sure you'd start to see the issue behind my "HAVE_RUST"
suggestion as it means having four symbols just for 32-bit ARM on your
dependency line.

>     https://doc.rust-lang.org/nightly/rustc/platform-support.html

Interestingly, it does not list arm-unknown-linux-gnueabihf, which
is the "tuple" commonly used to build 32-bit ARM kernels. 

> > Please remove every utterance of "default n" from your patch; n is the
> > default default which default defaults to, so you don't need to specify
> > default n to make the option default to n. It will default to n purely
> > because n is the default when no default is specified.
> 
> Certainly. I am curious, though: is there a reason for most of the
> other 500+ instances in the kernel tree?

Probably because people incorrectly think it's required or some other
minor reason. As I say:

config FOO
	bool/tristate ...

always defaults to 'n' without needing "default n" to be specified.

Let's do some proper research on this. There are 19148 "config"
statements in the kernel tree, 521 "default n" and 4818 that
specify any kind of "default". That means there are about 14330
config statements that do not specify any kind of default.

So, there are about 27 times more config statements that specify no
default than those that specify "default n", so using the argument
that there are "500+ instances" and therefore should be seen as
correct is completely misguided.

> > As Rust doesn't support all the architectures that the kernel supports,
> > Rust must not be used for core infrastructure.
> 
> Yeah, although I am not sure I understand what you are getting at here.

I mean, if we end up with, e.g. a filesystem coded in Rust, that
filesystem will not be available on architectures that the kernel
supports until either (a) Rust gains support for that architecture
or (b) someone re-codes the filesystem in C - at which point, what
is the point of having Rust in the kernel?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
