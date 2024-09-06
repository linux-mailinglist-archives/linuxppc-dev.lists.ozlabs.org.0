Return-Path: <linuxppc-dev+bounces-1127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4822C96F647
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 16:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0dNC6r1nz2yvn;
	Sat,  7 Sep 2024 00:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725631659;
	cv=none; b=bdQrhd/EAntRLgzGzS79ROpqDOJLYvVMrv5+5B4ta0bVWr3asGj9VOm8ABWscgh4166YPwbFWMmrytYCckj9c+DhFmA8TgBka8+3obMLlB7xQjyj9UIUV/Y4ZRRB2ucQhw1DgPIsfet2w4/+4xaTbPQNlD07Vv4uERE+Y6TUF5M2EtppefCkIpHP7pFoPHEtSJLG5L5tqzMnQAMSMaX7FtwgyEbCCrcGbHE5SpgBXMPOsX/shTAibCGwKVrF8dzMHX/VhttTU+BhgMjaOdmw0BKxbojp+yQs+hNtZJjUDwd79tzE0J725Oau3OOLpU/JBNfNnMsJe9OPdlsaNcr1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725631659; c=relaxed/relaxed;
	bh=K7LZVi58f5+Ti3Nfy7VxoI0NsxNh8KDlsMzkNiEZ9Yk=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=knG97NFMAOqmiezK1nowuVvcHpCA4vyw3cZvfwK2XlOrIISmUevpDBDOOo+ZEKwU7CUaz6pnBSIMkNsTl3SYXtHgLGAmmNttkmLDlozKaPdzMgcLuk7SI4j9PzvpZZDYM42jTp3o8/g5gAAEPIHwm1abNC/T1o0QvKitKrCQ+bm4/trXhRMPxIi+HB6+bN98WUOooIaO+KjVZsMWnEXLtB4MoWXrvlvAnNkPTqbmFv1pKMURpjO+K44k0S0g7FgvZPTrVadM2C4mC6ZvlmRifmrCiWO4lqcGO7sL1UhaydoCiGqMIlB4FxY9u/JwfFdOMLpwEaMxOESz48KGerb6QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kb3mgg1n; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kb3mgg1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0dNC51Knz2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 00:07:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43F8FA44F67;
	Fri,  6 Sep 2024 14:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687A5C4CEC4;
	Fri,  6 Sep 2024 14:07:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kb3mgg1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725631654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K7LZVi58f5+Ti3Nfy7VxoI0NsxNh8KDlsMzkNiEZ9Yk=;
	b=kb3mgg1nzwso9U2S0XpYDSKHzzaZU8sY1+QG+AOH6fmtua4/8SGO9R/Yn8yKtybHBsVTte
	uk7W61bNNgvvmVeSHggy8z9wnnuO5dFHZKa1puxHAhjUNce6wdintCj+nNuVxgGKpPRmbo
	JMbP+WjmbZSJE9CE/Sj+lFiO3PHlMXw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f920a885 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 14:07:34 +0000 (UTC)
Date: Fri, 6 Sep 2024 16:07:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 2/2] Fixup for 3279be36b671 ("powerpc/vdso: Wire up
 getrandom() vDSO implementation on VDSO32")
Message-ID: <ZtsMpcV7iLYoytdJ@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>

On Fri, Sep 06, 2024 at 10:33:44AM +0200, Christophe Leroy wrote:
> Use the new get_realdatapage macro instead of get_datapage
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/vdso/getrandom.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
> index a957cd2b2b03..f3bbf931931c 100644
> --- a/arch/powerpc/kernel/vdso/getrandom.S
> +++ b/arch/powerpc/kernel/vdso/getrandom.S
> @@ -31,7 +31,7 @@
>  	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
>    .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
>  #endif
> -	get_datapage	r8
> +	get_realdatapage	r8, r11
>  	addi		r8, r8, VDSO_RNG_DATA_OFFSET
>  	bl		CFUNC(DOTSYM(\funct))
>  	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)

I tested that this is working as intended on powerpc, powerpc64, and
powerpc64le. Thanks for writing the patch so quickly.

Jason

