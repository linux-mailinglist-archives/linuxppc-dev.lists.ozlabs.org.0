Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B1175BD97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 07:00:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vz9fUc/R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6cnW1fdZz3cCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vz9fUc/R;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6cmZ2ph1z2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 14:59:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689915579;
	bh=E8y/g9Khd0fFkgBzOo2hgfNC9FxKvpUwWSNkgdFASms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vz9fUc/RXTu27vyeQvrCGoaE8JdmFqjso1U7IKft3F4+AMIPMbJxbd6+vpUogCok2
	 jjqvREfJvYqz3QSGYRTfM9NbVcZw6ETTGk+G5ORy8Ef27KmVipGpAru/++iMcP0ZIY
	 irL63A70ZpZtpSAA842FIXFsBi3K9pkiGHMiMA9uGES1k6AQTlIav7DvOXvaXW5lr1
	 +C0AtN1LzNzfZWs6cqLKzQSLR9CakXGeTo5RmwHO24fURCoJ28UFMNlTF5RfwYFygo
	 JIBkIXyWk0zwzOR6aKsdnuJSg4XvmCPd8c6HNDSu/dKGG51lsM7dl8r9XMYvtkwX6A
	 gBrLXrGghZj8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6cmH4jNJz4wqW;
	Fri, 21 Jul 2023 14:59:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>, Javier
 Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/9] vgacon: rework Kconfig dependencies
In-Reply-To: <20230719123944.3438363-2-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
 <20230719123944.3438363-2-arnd@kernel.org>
Date: Fri, 21 Jul 2023 14:59:24 +1000
Message-ID: <87pm4lj1w3.fsf@mail.lhotse>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Bor
 islav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did

Not disputing this, but how did you come to that conclusion? I grepped
around and couldn't convince myself whether it can work on powerpc or
not. ie. currently it's possible to enable CONFIG_VGA_CONSOLE and
powerpc does have a struct screen_info defined which seems like it would
allow vgacon_startup() to complete.

My only concern is that someone could be using it with Qemu?

cheers
