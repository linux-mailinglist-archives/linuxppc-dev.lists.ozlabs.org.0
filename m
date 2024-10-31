Return-Path: <linuxppc-dev+bounces-2744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A293A9B79D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 12:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfMRl38KGz2yF7;
	Thu, 31 Oct 2024 22:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730374659;
	cv=none; b=Q5W3mMgbxPgWRmCbqyS7fC2kdMhkdHN0boMfmfyQCJbKtqCMr7ONcXUVlnDbaE8IuMRp1nPux7IOpd6rce9E0PWFsF+F5IWlAESZT78KBc8UtI5Rx/VkwzWRN3AWJxbQ9MlH6JetqY8bE0tI9+1FId1738wVUZI4KqBiqXIyA2MpJ4dDmbDm97E0pWBduMI1lhk/Vf96lWnOfifNbRQ/Gi9JWe3nIaZKGT3KqAPr3wThLnIzzycZdnZZygU22KAN87Qf1JLDZ1Nz1JFCOYPsep0KAbFRM/ToSF5gBy0dCQ9oDneD4ekHNaAEgt0qjjsINud422JzxY/kPTcoRuYoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730374659; c=relaxed/relaxed;
	bh=+hm/zwAZohFX5pez0fbPaxqBqPIF9fMMnVUS+RxiqbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWdm8roP5pawEyG/WWeaegBjNnIAy4suVaVtiEzLt2mZfTGgfa/c51kqoSmt/masZDuig83E/2SLY3EujgMBhJSgGJwDAnZyhuFj5KfqCsYOeS1mvZL5+4yApTZJ1UrKLAxNemQ3HcfOW7TVHu/T3Vqrkfd3lCc7qz/So36heI6OSGtMjIfQySJiiUqILsuTKim8HzT66iA1Z53fBDibrc23Vsy9nckYzGGGtm7NPVpX3UNyn5p8+4qc8MtAfy+wm7fEJQ9q9ZCtqTbczhRZHTpkvERTFCipgZRACfvy3VrHsAMiaES7FJBikcZaH7a0SCxE+P05kGw0QfUar8AHYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B9Kj6Qg/; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B9Kj6Qg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfMRk2z3Lz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 22:37:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3BC29A44136;
	Thu, 31 Oct 2024 11:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17210C4CEFD;
	Thu, 31 Oct 2024 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730374653;
	bh=HOxK+wU9eU048sXFB2KXeqhmmHOku3kZEDARKwtJaRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9Kj6Qg/BXn6D6IPkaWUMa+vq7gBra4scklcDDT+p2gfmB/VQMGx3bOdKA78aOZCx
	 DpbXWWBb1246u7S4JbuMLGXzfDd1uLbDth9aAMVMq+rce8Wx5+ayP4g44HHejtJsDn
	 1ce3k7ILlPN4dEYm9tKEZouqLxNZijqqEPiHC6SQckAL+/Ep8wvgjBbzoqM1qcNVdm
	 P7WFB7HBgMoxeipm2LmZkdDnJRHuWZAHajaIkKvjjwD7C2mySauNlTKTd8/tXdopQd
	 20VEqB6CFuZiWOTs6CoWBS+ZvX/e4yWfMcgJcyfLUWG/s3V0wWg6Q3YFMpxm3UBIdp
	 ikZX6VRNMZPOA==
Date: Thu, 31 Oct 2024 04:37:31 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 11:05:03PM +0000, Matthew Maurer wrote:
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index e6b2427e5c190aacf7b9c5c1bb57fca39d311564..a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -208,6 +208,16 @@ config ASM_MODVERSIONS
>  	  assembly. This can be enabled only when the target architecture
>  	  supports it.
>  
> +config EXTENDED_MODVERSIONS
> +	bool "Extended Module Versioning Support"
> +	depends on MODVERSIONS
> +	help
> +	  This enables extended MODVERSIONs support, allowing long symbol
> +	  names to be versioned.
> +
> +	  The most likely reason you would enable this is to enable Rust
> +	  support. If unsure, say N.
> +

The question is, if only extended moversions are used, what new tooling
requirements are there? Can you test using only extended modversions?

  Luis

