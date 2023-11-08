Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB47E6049
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 23:01:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V4wNroml;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQfDR5mrgz3wS9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 09:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V4wNroml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQT6z5Krjz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 02:10:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF810615FF;
	Wed,  8 Nov 2023 15:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8E3C433CC;
	Wed,  8 Nov 2023 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456248;
	bh=ubRWv4gCHYtZyc/7EUxKBrb1M8Jq2gNnH2Iv89hahkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V4wNromlDBNArj+XlVHbk1Tpho83VHKj4KF3u+g8D/gDHOgmbzk9TF5F0k0bfjyJ5
	 QAa+SJ1H1vdt9z6QLXRKqy3OD3OdIvi0IIM6oR9t+f/Qou1n/kmZp3N4Ld5+Em6SUX
	 C152TcjhS6BX54Dd5mExY/uqbFmfwaVKqqV5higpeeV5QYXEeI2g8nKEM8QO7JpfaW
	 oYvzN3/QTGIj+pp0Nd5j3aFNPnFwrr1RCnhA/mv97Odgb/1aJ2xdCVJdaJgtaQHSY0
	 fqhoFzKt0Xnl3SB0XmmHuBK+2Zwe0i1mRrDK0QRCpnefsPz2sjmCZbZODNGq5w3ycl
	 CDBBZ1wKet15w==
Date: Wed, 8 Nov 2023 07:10:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic
 prototype
Message-ID: <20231108071044.6abdf09e@kernel.org>
In-Reply-To: <1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
	<20231108125843.3806765-18-arnd@kernel.org>
	<1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N.
  Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick De
 saulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Nov 2023 14:18:09 +0000 Geoff Levand wrote:
> Seems good to me.  I'll test it next chance I get.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Seems like this is best routed via powerpc:

Acked-by: Jakub Kicinski <kuba@kernel.org>
