Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD544B35A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 15:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwtDf0r5pz3cCK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 01:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=D//rq9qQ;
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
 header.s=pandora-2019 header.b=D//rq9qQ; 
 dkim-atps=neutral
X-Greylist: delayed 675 seconds by postgrey-1.36 at boromir;
 Sun, 13 Feb 2022 01:29:32 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwtCw5WpFz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 01:29:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7QnIJw6JxaPkGqXMTz2fgzVx+1VOgBcJilFzsMI0nk0=; b=D//rq9qQ1yPFmlYSJjfJ++UitW
 R94LxHUfU/lsbdZfaToI/2ib1NTyBPeNKo1yFNy2Y1f7kcAqCrAQVaOGZb0nsKkGU9sqUA1+SfsBs
 KyU/D3XEyfxKVQ7mapp2Oe/TT5cgDUaRPhWNav+Be8ZDacTeFQkP1XztQpdM9itfvkHhb5mEmPWO0
 556GGN7mb9mocAJcfJgB8OKFKolIjqv3dMwdMuqanrr1V7ikWk3aYXNZ2jTIgHtC2KwTWoL3vd51B
 TJrrw6fdLn1YJ+hl4nrIVIJ8Z5p/vaFek2FShZlHl1yeexKsqOYealYzAWVuHigBVTsLLwcOjBssJ
 IRhawmdQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57216)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nItCy-0008Cj-25; Sat, 12 Feb 2022 14:17:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nItCk-0004bI-1s; Sat, 12 Feb 2022 14:16:50 +0000
Date: Sat, 12 Feb 2022 14:16:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
Message-ID: <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220212130410.6901-17-ojeda@kernel.org>
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
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Xu <dxu@dxuuu.xyz>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Finn Behrens <me@kloenk.de>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 12, 2022 at 02:03:42PM +0100, Miguel Ojeda wrote:
> +config RUST
> +	bool "Rust support"
> +	depends on RUST_IS_AVAILABLE
> +	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV

Please don't use CPU_32v6* here.

It probably makes more sense to add a symbol "HAVE_RUST" and have the
appropriate architecture Kconfig files select HAVE_RUST.

Does Rust support Thumb on ARMv6 and ARMv7 architectures?

> +	depends on !MODVERSIONS
> +	depends on !GCC_PLUGIN_RANDSTRUCT
> +	select CONSTRUCTORS
> +	default n

Please remove every utterance of "default n" from your patch; n is the
default default which default defaults to, so you don't need to specify
default n to make the option default to n. It will default to n purely
because n is the default when no default is specified.

> +	help
> +	  Enables Rust support in the kernel.
> +
> +	  This allows other Rust-related options, like drivers written in Rust,
> +	  to be selected.

As Rust doesn't support all the architectures that the kernel supports,
Rust must not be used for core infrastructure.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
