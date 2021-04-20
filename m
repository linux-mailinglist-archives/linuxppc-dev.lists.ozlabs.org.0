Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDAA365122
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPVBS2nJzz2yy4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BBlX2dja;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BBlX2dja; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPVB303dxz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:52:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPVB16W3zz9vDk;
 Tue, 20 Apr 2021 13:52:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618890730;
 bh=JyUPdJZxbZgHgX4tkHtmFJhqOryC3EPN3KyRky8WqXw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BBlX2djaIi85USp/MUgi221lvmsRpNhGjSJ1EziQm782np4YWLIjeeX7AVtIuh+r2
 pC3XnF9/h7yU50pgul5lIDrS9qo4unh0rT/Mk/51s8ncPFjkMQmkFwzZxqNBl5DSmr
 ErPYGnT55M1JvzhalKvWe8ViBp+GnRaOGFec/7cX3GCWzBkw7jD2D8wFL9fOh0hQRd
 +MP7a/HhKdQngfuPXftKDTrc+ZNEf8MoZIH4tyRYfaC21WQ16mmqXHBoFu4Rg9S0Gy
 SkShzcfffQev9STnhgzC++uv0ZEZOqLeRts4hdqP3GZqa9Tn5dh29hDg7dLMEFoPxn
 RdyW+O//TSydw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v4 8/9] mm/mremap: Allow arch runtime override
In-Reply-To: <20210414085915.301189-9-aneesh.kumar@linux.ibm.com>
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
 <20210414085915.301189-9-aneesh.kumar@linux.ibm.com>
Date: Tue, 20 Apr 2021 13:52:09 +1000
Message-ID: <87bla9d34m.fsf@mpe.ellerman.id.au>
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
Cc: joel@joelfernandes.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Architectures like ppc64 support faster mremap only with radix
> translation. Hence allow a runtime check w.r.t support for fast mremap.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/tlb.h |  6 ++++++
>  mm/mremap.c                    | 15 ++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
> index 160422a439aa..058918a7cd3c 100644
> --- a/arch/powerpc/include/asm/tlb.h
> +++ b/arch/powerpc/include/asm/tlb.h
> @@ -83,5 +83,11 @@ static inline int mm_is_thread_local(struct mm_struct *mm)
>  }
>  #endif
>  
> +#define arch_supports_page_tables_move arch_supports_page_tables_move
> +static inline bool arch_supports_page_tables_move(void)
> +{
> +	return radix_enabled();
> +}

Not sure it's worth a respin on its own, but page table*s* move is
slightly strange phrasing.

arch_supports_move_page_tables() or arch_supports_page_table_move()
would be more typical.

cheers
