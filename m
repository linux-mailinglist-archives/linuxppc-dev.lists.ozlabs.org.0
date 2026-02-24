Return-Path: <linuxppc-dev+bounces-17133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IiWFVIQnmlBTQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:55:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCA18C874
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 21:55:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL93d63CMz3chS;
	Wed, 25 Feb 2026 07:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771966541;
	cv=none; b=L1OvdUJJywTcUbdOkJww92JJ0fOeAVwJuW46vIkk0q7TN3jqidmBLlXWW9wML3PTUd7xjYrAc1ro471YaqR2EloDqTMuD8DgV3ESsvjUWmM4UAQP+zEVje6+roZsaZYSED8iGW9Rf2/pc98vKufdZ+70HLwPuDyqT4EI6nKRNbicrcEyldQEyLmVdmYLPJSMJRrc5LR+GdNg+X7lYI4fJeXNrS4vqppfTqPDlJriHO7+w1Thsc7tLVrd+xyQ9B/9CvY+livBnYsSn+7T1XkCPWsVncru8PnZWfSu3+xI7CTGaVt2sPZzFL/AFTJHK7a/auUvPJqoYZ6ZTsiFZtrNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771966541; c=relaxed/relaxed;
	bh=nD4+lp1M+KECx0QLG8Rln8fzr8sfcII1yyyhBAQzizQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l04IEEN0RF67hYJ2LQ5wXvcHq1NkYJAlpjvSVmKGurNpyrNO2yJra+ptXYH0DzVkuNrvS8KbXfOcLVWO8xt3BxoNtgLOjH75kLqGyZYY2GMVWtxLAqu9bsEeQ2TACLruieRgKn1azyj2L1w24e97XriXneIB1wr7Tt1w7aVnAU8Q8wuB/U//oTXWpM4ZKuW2zwijRW5xM+K2hPgMPZiq9P8FHKzmS86jJ/Q1VsxeCXY8bTDQdTCc0SnJ4UBpgYlQLD+Y/rmnuNXT726odOfagQxsNQiXRQyWb9wQubw1kgySnnoxSITriVZpX6VbjjFw6u/CE0ohR1IxeJbD/IcttQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C5QdJEhD; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C5QdJEhD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL93c5W1Bz3cgf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 07:55:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E3F942BB8;
	Tue, 24 Feb 2026 20:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21D3C116D0;
	Tue, 24 Feb 2026 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771966538;
	bh=SQcVebSSVbAr9KoKj2KkC4SNEiz7WbMDmKWz7KrYMDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5QdJEhDu3F3RiE7rGx/Dj0PuDa8L2iA78NrEvl5azZwBu4Ri8KTCOsR7pMfcmtU3
	 je0zFaQMDs14Xk47ydamr6d7K/C2mLgReCJU0eQ5t1msb9+Cr7JogPuBHz98HpmyQ7
	 FL/1gMMXhg+L00T+Kh2KO3QlEyL82mSedV36eljnS06LPHa0h3WmsQVmUdeXN3DiC9
	 cEZqkUgOnFmktJdADtpZXWkrLh5++ZoIg7vfN/CCzxHt5NfLUeQ6OdSa50D7n4i6eP
	 XnEv8Hyqpy7KHExKA4q8UQSULNu6IIGyin0jFfMRoKZyLBFOB48silsMM4b6g71d0s
	 /Yrc0O/Gx/2jA==
Date: Tue, 24 Feb 2026 13:55:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
Message-ID: <20260224205529.GB3510750@ax162>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
 <202602231432.20F3F0CF@keescook>
 <20260223225311.GA2462602@ax162>
 <202602231459.2A1DD53E0@keescook>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602231459.2A1DD53E0@keescook>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17133-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,xen0n.name,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 82BCA18C874
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:02:32PM -0800, Kees Cook wrote:
> On Mon, Feb 23, 2026 at 03:53:11PM -0700, Nathan Chancellor wrote:
> > On Mon, Feb 23, 2026 at 02:33:35PM -0800, Kees Cook wrote:
> > > Series looks good to me. One style question, why go the round-trip with
> > > Kconfig instead of doing it all with a fallback in the Makefile:
> > > 
> > > CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)
> > 
> > I might be misunderstanding how Kbuild works but
> > arch/$(SRCARCH)/Makefile may have logic for selecting CROSS_COMPILE,
> > which can impact the selection of $(CC), so I cannot use cc-option prior
> > to its inclusion but I need CC_FLAGS_DIALECT to be included before
> > arch/$(SRCARCH)/Makefile in the main build so that they can be used
> > within it, which is only possible after Kconfig has run. This is
> > probably worth more flushing out in the code or a comment since it is
> > subtle.
> 
> Will Kconfig see a different CC than Makefile? Regardless, I trust your

It shouldn't, as arch/$(SRCARCH)/Makefile is included before invoking
Kconfig; if the compiler changes, Kconfig will run again before
building.

> judgement here! I actually rather prefer having it exposed via Kconfig.
> :)
> 
> Reviewed-by: Kees Cook <kees@kernel.org>

Thanks!
Nathan

