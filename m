Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18667BFB35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 14:21:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z6owfJjL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4ZlL4yQZz3cR9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 23:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=z6owfJjL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4ZkS0WMYz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 23:21:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B3602B81C0F;
	Tue, 10 Oct 2023 12:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE79C433C9;
	Tue, 10 Oct 2023 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696940457;
	bh=UxKiOjwRVBO8hPyVUUWzczAVTUMRjFlQkrN/ltCYT8k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=z6owfJjLMQIFX2uC9sV/8w0Sqo46Pwrls0o6HMuGNTLpJ6j2UenvrZZUZyQPOk4e4
	 J3ULbbvJmYW9SamstV3gX+7XoWSBjLaIAkObsItWXbwj4B3BwNurPGM/XAYXjZVith
	 +in/PsQQCypXf3oYXYGwsK8NbTcgAuJuaCoH/RRg=
Date: Tue, 10 Oct 2023 14:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Khalid Aziz <khalid@gonehiking.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v3 0/9] video: screen_info cleanups
Message-ID: <2023101007-retread-spyglass-4b8c@gregkh>
References: <20231009211845.3136536-1-arnd@kernel.org>
 <ZSU59yPUO_Fu39o5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSU59yPUO_Fu39o5@phenom.ffwll.local>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 01:48:07PM +0200, Daniel Vetter wrote:
> On Mon, Oct 09, 2023 at 11:18:36PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > v3 changelog
> > 
> > No real changes, just rebased for context changes, and picked up the Acks.
> > 
> > This now conflicts with the ia64 removal and introduces one new dependency
> > on IA64, but that is harmless and trivial to deal with later.
> > 
> > Link: https://lore.kernel.org/lkml/20230719123944.3438363-1-arnd@kernel.org/
> > ---
> > v2 changelog
> > 
> > I refreshed the first four patches that I sent before with very minor
> > updates, and then added some more to further disaggregate the use
> > of screen_info:
> > 
> >  - I found that powerpc wasn't using vga16fb any more
> > 
> >  - vgacon can be almost entirely separated from the global
> >    screen_info, except on x86
> > 
> >  - similarly, the EFI framebuffer initialization can be
> >    kept separate, except on x86.
> > 
> > I did extensive build testing on arm/arm64/x86 and the normal built bot
> > testing for the other architectures.
> > 
> > Which tree should this get merged through?
> 
> I guess if no one else volunteers (Greg maybe?) I can stuff this into
> drm-misc ...

Oh, hey, console code is for me, I keep forgetting.

I can take it, looks like we have enough acks now, thanks for reminding
me!

greg k-h
