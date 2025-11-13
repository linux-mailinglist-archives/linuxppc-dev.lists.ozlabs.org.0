Return-Path: <linuxppc-dev+bounces-14145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B099C568F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 10:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6ZZ36jZGz2yvY;
	Thu, 13 Nov 2025 20:23:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763025787;
	cv=none; b=j3TCkUePWMoYrxL9z5fHymYLyBmf1zcgHUuxcivexr2eY9QQi91ijtCLXHFPWUsv7xYjFzEzc1zF8H1ucXJ90KSHZz31q6uB7YfreIFgBb/3QulGZtCefoapqMxf5X+WtfNzXhnj4KU+6AJWXdm6abmKc/du9+OTexsyZX5/Gy+aRyVo0XAHbB9mhBfhKMWXbBmSdUyjLdr6JTZoRAicdaFzzisSQZWlY87rybpL6ImF2MMJBHd+VBKTl0U1PPeupQx9vIlqSrljsC+bdMkcGlqTgxIAKz0O2j4b02ZMyWObVkwtxO2dPbEd8bRnBPw6Ae0SS3crXQ37rfwmQabWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763025787; c=relaxed/relaxed;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2uVD6dW6+vQnKF5suNG9b6jTpDzB8vJJ/mCEvIqCOXh0hzYHoMFsg5sMpyHq+zQBvIn1qYnKyiWaR4j3Zd7l4vLnyFvE/gp0QWpRnCYNZDW2VLntDCSjof2+SVgRHzq1gIFkGyV4r9BoYbt1TqsuKMtR2dkcE/f8fI+7fLu+Awr76AsKeGc5RkhT3h7jtNKsymhWlPFzMaKjSLtVx4Tk8TOlySepACS6omaiyOAOv/K+8p7ksJcDdbNKNJJXTBFt5sO/7N4D5iWdFUh03NX88fEXJGvVNsedjiP+Jcwtwp/q1mFfJ7JXxWtjiO/mwTQFxvmCCS3fHICbiQ1VbBfiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ju37J1p2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yj3MpOVf; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ju37J1p2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yj3MpOVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d6ZZ209wfz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 20:23:05 +1100 (AEDT)
Date: Thu, 13 Nov 2025 10:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=ju37J1p2hCJon7Dq3EBdc85zXolYmJpQFCDTDD8FHlvRoEjSOjlt4Yp4KTbgB+KXM8NcYf
	x3XTLgFMg7s207AYx4nl33y1T7AsXPupY2fLhI04LI5i9mGt07hV5/LXgVSxjC9NWmgQAa
	KqW1OH6sg1WZuym+vr+IuqGfgMbqLdr1tI/aw1wSpW86G2aLwk2MCJCFBMALz4sjVRNETn
	KkDa1CbmU1hyAhZyUbsikCLXiGWtupPq5TLM5m+oNtPlFP+wYSHVn6OyRIyBbZiK4RDRII
	854zE6FXH9KIsYP0DkrSuQU61CL7NMT2DNoYB6l8S3LyjnomxgvlNoDIEVa5SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763025779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMXftlIRLs0I4I5KBEH91u2IIAB76cPs2+aj/P7XaXI=;
	b=yj3MpOVfBn1X0F5np7dHo4NQ2EaJr+XO2eqbf3c6nh3gZeHlyNtkeRsYccVi0YEIjMy8Pj
	TA7I+NuN5tR4vTBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Message-ID: <20251113102236-1954dc76-ad1b-423d-ad29-104c3e07db17@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
 <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
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
In-Reply-To: <aRTmXJVXlbkF2rI4@derry.ads.avm.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 08:56:12PM +0100, Nicolas Schier wrote:
> On Tue, Oct 14, 2025 at 03:05:18PM +0200, Thomas Weiﬂschuh wrote:
> > The generic test for CC_CAN_LINK assumes that all architectures use -m32
> > and -m64 to switch between 32-bit and 64-bit compilation. This is overly
> > simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
> > also require byte order handling (-mlittle-endian, -EL). Expressing all
> > of the different possibilities will be very complicated and brittle.
> > Instead allow architectures to supply their own logic which will be
> > easy to understand and evolve.
> > 
> > Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
> > to be implemented as kconfig does not allow the reuse of string options.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  Makefile     | 13 +++++++++++--
> >  init/Kconfig |  4 ++++
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> >  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> >  endif
> >  
> > -# Align the bit size of userspace programs with the kernel
> > -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> > +# Align the architecture of userspace programs with the kernel
> > +USERFLAGS_FROM_KERNEL := --target=%
> > +
> > +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> 
> Is this some left-over from a previous version?
> 
> s/CONFIG_ARCH_USERPROGS_CFLAGS/CONFIG_ARCH_USERFLAGS/

Indeed. Thanks.

