Return-Path: <linuxppc-dev+bounces-17078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGKWAsrVnGkJLAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 23:33:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E733517E67E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 23:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKbH91sLSz3c2k;
	Tue, 24 Feb 2026 09:33:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771886021;
	cv=none; b=KALUaSC9PFXtoJdm7cEiHNSec9eUcuNrP1RNv67hV218lBk7hyFJzHo3jPRDpq1E0QZAVCiO8o6trjeV2cZrJc/gFUBPQMCEcLEVWF98HuqXdoAadf+FffCEn1KO41CjiYZ5kbnDNKprmJzy6w1JtkxF0FgVQVFTJKR6joPyC0vckYM7WDvU9/g37YK0gsIHpvdGJhi6CyGNaH4GPCkJm+I2xy9JhN6TamM4XM+mN/vdvhXyfyMGFlDzNKbw/qnwexj5wgpopG/aaei7MufuhO/zlweiAd9vJmJRKgAFgL4VpujkUJ6xJqgJZbLZEQU39TbrmlK82evHYgZQF+wIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771886021; c=relaxed/relaxed;
	bh=crCBTx8/dsPEK+OSvhTeFIW5TxLjcQhWKTP9ngyNGlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmjvfIxgchNN+vhZ8A3Jjev977MI2QZSJNhkSPtPxOVIq6VPVMYNcfaNVZCnsdENkFwBrSD3O5f73D6Bl6kPgzEaPkLM0dT1mzdAp+NMeiRMstZDtb+fhJNuGJeFaccFeNpnyP7YPpclVPs6oTlPpiEjmzUXGLMjJM210fbivaZNO7VOoKO3ErOTaEcxzql+RWKLWc212x2QERJjFvu3AxxGLsf6PVFgI+kkHbmIJTbhL4D2AvbWLWpSnKGOszfqaviyCzIuIgYaQlK7upZGj2CdnW8RKAtRmmr6Yralur+tp+d4OS0iQc1PIehtSg0abqXlj3lil+yZLvBnf4s0Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J983x/DU; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J983x/DU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKbH673QRz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 09:33:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1441643280;
	Mon, 23 Feb 2026 22:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEB5C116C6;
	Mon, 23 Feb 2026 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771886015;
	bh=6luMqdKSuq9XRD6Jc4ImEhLDZ+nlkl7La9U57PIctFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J983x/DUXe3wWA3l+3Y64rA0CyNpkzQkwiWNeGpfi4mVEVqwUoxLSa6SgDkizaiuU
	 kyf+CQXTpoeB+BorC0kiHBzbL7iajtQVbKZostEWGW0GTy+zMQ2EO0UAxWNsXvZSC3
	 pYwsPqARByxjspf6jCgBrNJRjb+aVsM3582OK2Z86dHZ4/AT3JjWfCQ7qzfd8TdDO3
	 HYeH2KFUSJokM4IASGtQF+43uR5nJAj3Me2nQddduKJWxtNjoQfmxUNtzNPpVAXvwE
	 LXapQT/2pi7TKjubvmD9ZBhqaEtpqEdZ/k1WaiC8FlfJvMknXYqOOUyAsPpsR2WUfK
	 Z3GgEPZNO4NJQ==
Date: Mon, 23 Feb 2026 14:33:35 -0800
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
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
Message-ID: <202602231432.20F3F0CF@keescook>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
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
In-Reply-To: <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17078-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[kees@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,xen0n.name,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url]
X-Rspamd-Queue-Id: E733517E67E
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 12:10:29PM -0700, Nathan Chancellor wrote:
> Clang recently added '-fms-anonymous-structs' [1] to specifically enable
> the Microsoft tagged anonymous structure / union extension, for which
> the kernel added '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions"). Switch to this more narrow option if it is
> available, which would have helped avoid the issue addressed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). GCC has talked about adding a similar flag [2] as
> well but potentially naming it differently.
> 
> Move the selection of the flag to Kconfig to make it easier to use
> cc-option (as CC_FLAGS_DIALECT may be used in arch Makefiles, which may
> be too early for cc-option in Kbuild) and customize based on compiler
> flag names.
> 
> Link: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956 [1]
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123623 [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile     | 2 +-
>  init/Kconfig | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 06ff3032a6bc..1d5c0ab9ed5c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -791,7 +791,7 @@ endif
>  
>  CC_FLAGS_DIALECT := -std=gnu11
>  # Allow including a tagged struct or union anonymously in another struct/union.
> -CC_FLAGS_DIALECT += -fms-extensions
> +CC_FLAGS_DIALECT += $(CONFIG_CC_MS_EXTENSIONS)
>  # Clang enables warnings about GNU and Microsoft extensions by default, disable
>  # them because this is expected with the above options.
>  ifdef CONFIG_CC_IS_CLANG
> diff --git a/init/Kconfig b/init/Kconfig
> index c25869cf59c1..c4282d049463 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -960,6 +960,11 @@ config CC_IMPLICIT_FALLTHROUGH
>  	default "-Wimplicit-fallthrough=5" if CC_IS_GCC && $(cc-option,-Wimplicit-fallthrough=5)
>  	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
>  
> +config CC_MS_EXTENSIONS
> +	string
> +	default "-fms-anonymous-structs" if $(cc-option,-fms-anonymous-structs)
> +	default "-fms-extensions"
> +
>  # Currently, disable gcc-10+ array-bounds globally.
>  # It's still broken in gcc-13, so no upper bound yet.
>  config GCC10_NO_ARRAY_BOUNDS

Series looks good to me. One style question, why go the round-trip with
Kconfig instead of doing it all with a fallback in the Makefile:

CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)


-- 
Kees Cook

