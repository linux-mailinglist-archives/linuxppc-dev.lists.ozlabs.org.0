Return-Path: <linuxppc-dev+bounces-9209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F6AD1669
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 02:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFtq86Fdbz2yZS;
	Mon,  9 Jun 2025 10:59:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749430756;
	cv=none; b=XTWu1WRkkOqt7l4/L1LQecoy971HClP4Ua+ADmw/xJKRbwOuntAfcjkNfue59PMcII2soFK+6MfkrQD6L2oPM8/mYsy8Bqg0sQPFGXfmYGpSvLB/VNqlvjoZA5Egyonv75z7D5GkRMkdTLbAh8e/T75Z0h/iaUiAGTveSWllArdbSC0k5eRB7z1zYk3eW6s48JuAhA0JiHHBvQl2qmak+chyCIxgvqfH7JWXWvDcy6FDubylG6qoqza1YP7cg0YB31phguXjwCzwilis1+0UxpKh5yZdPsKcQLGwdL2YvFLgjQq2b3HJUipv82xfrlGyBDDnB22uFqn/PFV1KWHZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749430756; c=relaxed/relaxed;
	bh=4/H+TmUR2tygGIxwAez9mPf8QusglDEHcU7sswYD2R8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V91TDWbtQ8tbemnWPPXrv+Gy3RYaarLgBBmLATh0aC0wjOIXKeFnyrhx/hovVvxwG65WiDzjUroUpZPdJVJOieKyZyYdiXe8/dBUidTSlsx4oecdN0N+XDHS7IGkUXA5kdLQNLebRo0PCnHkqnHMAyxD6IeyxdKzrpJxJ5sJC2KuTJo01dU6/SUC23UdUQcn/nPfKHL7z6ZU0cIHVqUwLyt6fbyVOgMpTHb7up+cthPruPPiyO0y0QXD1krqkgyhXruV/K0rxXURmg0vxeXpQGIeDZH80n6/OFVirSLcn6fns7KaH6TOvoHd2vfSc/6xUiAboTOhxUcNpA5t7e6U1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ke5VAEJ9; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ke5VAEJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 553 seconds by postgrey-1.37 at boromir; Mon, 09 Jun 2025 10:59:16 AEST
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bFtq82VLWz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 10:59:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1749430756;
	bh=4/H+TmUR2tygGIxwAez9mPf8QusglDEHcU7sswYD2R8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ke5VAEJ9Rwl5k9l3Doyp2lyQPAXjZY+2EQgYBxN/OHBA5sWtCWLY9tam0W86gfFRa
	 uIGLkLtjQAcitx3RJDcXQZunVLEn4q2J82Qq2+uNXHZFAUL6QMw1nsZaObRHg/YznW
	 zX+6cw9oSghPnxd/Mbf1DZUdV9n4vz/BGCFWwWAOodA7OiwF7m2ZasakbIdh8SbbO+
	 S7eQc+KJodiuFLzGAj43Df+k7qkfOp0qqRQZyPHF173GcsAfDr262oPs8EwJ4ELuds
	 zC9WJAccmYlY62nJoxKP3T5FzBSKlB3qopRRkN2LusgB+SxbXdkBAwxT6gUwDxAhAK
	 lY+GQpHtv1Mrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bFtq8008Mz4wcZ;
	Mon,  9 Jun 2025 10:59:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
In-Reply-To: <20250607102005.1965409-1-masahiroy@kernel.org>
References: <20250607102005.1965409-1-masahiroy@kernel.org>
Date: Mon, 09 Jun 2025 10:59:12 +1000
Message-ID: <875xh5wx0f.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> choice block.
>
> I guess the intent is to display a different prompt depending on
> CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> endian, and "Generic (POWER8 and above)" for little endian.

Yeah.

> I stumbled on this tricky use case, and worked around it on Kconfig with
> commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> However, I doubt that supporting multiple entries with the same symbol
> in a choice block is worth the complexity - this is the only such case
> in the kernel tree.
>
> This commit merges the two entries. Once this cleanup is accepted in
> the powerpc subsystem, I will proceed to refactor the Kconfig parser.

OK. Sorry for the trouble.

It could be split into two symbols to keep the separate prompts, but it's
probably not worth the trouble.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 613b383ed8b3..7b527d18aa5e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -122,16 +122,11 @@ choice
>  	  If unsure, select Generic.
>  
>  config POWERPC64_CPU
> -	bool "Generic (POWER5 and PowerPC 970 and above)"
> -	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	bool "Generic 64 bits powerpc"
> +	depends on PPC_BOOK3S_64
> +	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
>  	select PPC_64S_HASH_MMU
> -
> -config POWERPC64_CPU
> -	bool "Generic (POWER8 and above)"
> -	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_FAST_MULTIPLIER
> -	select PPC_64S_HASH_MMU
> -	select PPC_HAS_LBARX_LHARX
> +	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
>  
>  config POWERPC_CPU
>  	bool "Generic 32 bits powerpc"
> -- 
> 2.43.0

