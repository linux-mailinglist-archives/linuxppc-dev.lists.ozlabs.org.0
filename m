Return-Path: <linuxppc-dev+bounces-14180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB2C5D677
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 14:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7JJ56Gq1z2yxl;
	Sat, 15 Nov 2025 00:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763127813;
	cv=none; b=C9YINjJxPJzbZRmWrRhf4LU65QHSy7dg12a4t5rmP1CtbUPH4VRQEXN4JczE8x8N9+0TkHFkCIYC6LGjQretXhJGZ+CXSpNJxgPU5IJ35+nVinv6Up8x0YTRm2pE77v+ldyFybkmxZXXFakBgNO+YAhvbRmG0edxWnYPjyAH15hZbkalSLqZictsorOdQWiwEhsAtZLNX7Z638SCQowX/MFPwWClmxKiXCUN0APRHCrcfKAgLWa2tCvkgPpsi726Z7S7EJxdq8fUlR7ypvPwTKlN/YRLM1PVaoLmglA8yo3sL0sSLEgMoOgfnI/JVMFKjKOF6fh3TiD0GGwteWkvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763127813; c=relaxed/relaxed;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNp801rWnJ173RXS1egAd84/c0a1yvWFwnxuPpPCGSRMbxLKVSOpI61/TcajVPpqA/jrT+XfeDBejq5ZQAsww7cGIYZ6ZXYNYM1l1WKYxty+fUaJtBsWBK4lR2J8uLez3j8tn2fhRJUJEhBXRDrjOT3tPrw510I+did13niidRMevnKfQeeorsEioy7eb6bF12Q8NY88Vaf/M1QYeGX8mJ9dz8d4lzDn98LEs741IiKm7Gws0fafFEp18lxddsFhi4RpNz85JnB8eOssAEEddbNa9CVgOACEN7J561fB72JmmXpsTHCEbkHzEfe30TvAtbXGe363udjmCz/kt2wXxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gIRir/4L; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PJp/vBSm; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gIRir/4L;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PJp/vBSm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d7JJ40DvMz2ynW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 00:43:31 +1100 (AEDT)
Date: Fri, 14 Nov 2025 14:43:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=gIRir/4Lzgj/mHOd7JZaVUa1E9UZ0Kp6SBQjTGTYc3zBB9Uccw1PDQZgKCugDD7SNkLJc4
	rWTA1bZOYnnxFBU1c3I5+6pxafi3efAKVcvOfQxa8mYLHkao6U1a+WgjquQRNJGq7KMi70
	KU9KOzGVJgkI8JKU94Xqv5bvdlgDzk5qNnnCwypNirbyc7n9xcDwwQTJr5+ysJL63QDwuN
	v4Zoxyc9j/Niyifj12WxqFysmUyas8fb1CvF8xpXQm6Uqhxo+L+tYv/l1uziRIrJw4fWPL
	jpQKVyMnpupxpF8qCOOc7QA9LHCLSTU3hyevSChE6sWIUtC5QvXQSjxHIH2nHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=PJp/vBSmzIi+3+3HURui2pgktdSqU9eraGxE64lkXGPNdO6ZlBzcYl1MFyPqJRIG+bG6hX
	hK2GxotHfbZs93BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
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
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114143845-ff0d3849-4495-469c-b9c1-bebf2e8808db@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
 <20251114042741.GA3582402@ax162>
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
In-Reply-To: <20251114042741.GA3582402@ax162>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 09:27:41PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Weiﬂschuh wrote:
> > It is possible that the kernel toolchain generates warnings when used
> > together with the system toolchain. This happens for example when the
> > older kernel toolchain does not handle new versions of sframe debug
> > information. While these warnings where ignored during the evaluation
> > of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> > will later fail.
> > 
> > Example warning:
> > 
> > .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> > error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> > collect2: error: ld returned 1 exit status
> > 
> > Make sure that the very simple example program does not generate
> > warnings already to avoid breaking the userprog compilations.
> > 
> > Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
> > Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> While this makes sense as a way to immediately fix the problem and align
> cc-can-link.sh with the other test functions like cc-option and like, it
> is rather unfortunate that this particular warning causes an error since
> the rest of the userprogs infrastructure does not care about SFrame...
> I wonder if there is a way to avoid it since I think this warning does
> not point to a fundamental problem.

I did not find any way to avoid this specific warning, unfortunately.
This patch should make sense in any case. If we find a way to avoid the
sframe warning then that should go on top.

(...)


Thomas

