Return-Path: <linuxppc-dev+bounces-12352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B65B807C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 17:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRjCt5SxQz2yPd;
	Thu, 18 Sep 2025 01:21:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758122490;
	cv=none; b=m3dboPPrpp1s02LQSiC+xlDJ9xnHxUQ8i+ozLpHXPbnaPEG3ewOA75FJtqIEk+MisQ+S1EjUbfKbqOXJu+D7IKqt/9NRvqkrB/slNJtdAcv+vcUoPYL3sELn8mytIs7sGiwHuu+dkFm6C1v+OpTPRonfL7eRe8L2MOjC+Y4Et6/xhDZTdrq0uE8c1RuFKs+vzJRDnT0cIq1f2tFziRUdbmePkMEauKiPGehNmzQAcmUO+oSmt2YYZGq94KgPQ+g471FWft6ym2TFr8Q0hzcScVAFWE2j/bPMvfWMNYpWrD49mkmKN68SaThH9TPi8uyK6oXR75AJnBsiW5+NlcDCQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758122490; c=relaxed/relaxed;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVhviup4qLTAyedFv8qy4cMkHHWc/09D2c+Arb8GNSofriuHz7QdXaFuuTPhqLgNnUZquDdWZId3ketU6njyL1emp4kxmt+7fiyJSfiayUf286ffaEsi80iLl8ctb4D2J38+ft6WG+PhOhR9bgUufHFZ7+vYDxKU5PhmlWYkyqYaz2BWGQOa4WfsvtVcLivYbAltCDaA0LTw/oogMtzjutl8ZpqW2N6lTAkzm6d7wSG5WF/u9ytjalGxK871kT5tEVI37/Tzfd+bhD8iD3oNVhFGpc3/Hs412KDUsOypfuqkHlZ7wjHpuiTBufuehqtQOfgsaJnCJckjARj+7tvslg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3nhivmng; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ob8EioHS; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3nhivmng;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ob8EioHS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRjCs3zGQz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 01:21:29 +1000 (AEST)
Date: Wed, 17 Sep 2025 17:21:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758122483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=;
	b=3nhivmngd6+PmA3+eV33THTVRq9jhpe+HBt/O4eCUY3Xh5mSatPaAakAkLSiN/PgvcAopM
	y0Vf/JBYg9oMJuBPbUW8p3kfUkXUykpOTcPsUyVMjVq1GXYPIMNETdFVpFy8Dq/WubWuCF
	s78V7VLCyrlgSlUS4fRKO9Jc+yrd1jlMFKyXuxYp5AiWpIVOuskTy+86RTMbqukB7HkVfE
	7tOkUXZcX2xRhQyZwhU66M/r+VdJA/P0eIRfDbHpsj4zJHjLjz1urRGJEwwhNOxhg3HUFu
	gLLrhHi+vVShPn758ZvkO2UBIFtcaaRzj0ag6ZXNqRNipr1zS9Npoc4oLzCXjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758122483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/sWpX1d0FqUQZmJaMW2nRnPQMp56EHFIU2k1H50MYU=;
	b=ob8EioHSqHCIf/3CBZz5Tz2bb9bzFkW7kWflQdESNktBSVsvxeZSnY6E6RONhA6DbGeGkn
	5sDsyosGlBsU7rDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
Message-ID: <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 17, 2025 at 04:41:49PM +0200, Christophe Leroy wrote:
> 
> 
> Le 17/09/2025 ‡ 16:00, Thomas Weiﬂschuh a Ècrit†:
> > The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
> > asm/feature-fixups.h. Currently these headers are included transitively,
> > but that transitive inclusion is about to go away.
> 
> Hum ...
> 
> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make
> POWER10 and later use pause_short in cpu_relax loops")
> 
> In theory, vdso/ headers shouldn't include any headers outside of vdso/

I am aware. But this is the dependency as it exists today and I don't really
want to make this series larger than it already is. This is by far not the
only such layering violation in the vDSO headers. I have some patches prepared...

> > Explicitly include the headers.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >   arch/powerpc/include/asm/vdso/processor.h | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
> > index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
> > --- a/arch/powerpc/include/asm/vdso/processor.h
> > +++ b/arch/powerpc/include/asm/vdso/processor.h
> > @@ -4,6 +4,9 @@
> >   #ifndef __ASSEMBLY__
> 
> __ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit
> 74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
> headers")

Ack. I'll have to rebase this series after -rc1 in any case. Right now I am
hoping to collect some Acks.

> > +#include <asm/cputable.h>
> > +#include <asm/feature-fixups.h>
> > +
> >   /* Macros for adjusting thread priority (hardware multi-threading) */
> >   #ifdef CONFIG_PPC64
> >   #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
> > 
> 

