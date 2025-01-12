Return-Path: <linuxppc-dev+bounces-5100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DD7A0ABAA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 20:21:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWQGq64Qhz30Sw;
	Mon, 13 Jan 2025 06:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736709667;
	cv=none; b=HLE1PK/8HfZp/xwIbXAPri1nPC0LnETFZb5t5qOa2lO+WWPyKLUIh6S7yhDp/OZD8i4U9A3o2TVAM94hbVFqcuILAVd7F4MuxIHpjbxrICYtl2u15DSIRKCybQsWVhG3e6wnK5Xwbrb1TNOzf5BvmvvqAYlT98np0VnXS54yaoVfooWr7MRInG1gBaeP0OEQdFhJYpvfJ5/5V98p5GzWER7fntbdYX/wbap5tYeL7Cjh4KWmDVXiT4kxTftRJ+HsBEmy7NfYDfO8RTGkrwQ/mOazP0AzU6XXGzmim+xytAWdtB8EWzAQvXs5lTyk04JXoXE5SoeWQ9R9BEu+rd708Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736709667; c=relaxed/relaxed;
	bh=wsAmiSSbEEfyIjEs4CBNhqUDStWdLlryb3CPRW9ZMYo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=ETK+wjZdrSP5zi21fvAH9FVBJQt0QcXPys1VhTbz05EFQx+WiFX0i1HNiImdV4H5ZawPjnjQAElj71DIZCI9eh8ZDdlpjpW0LIXjaRe6f0KZkihbupY5XAt225ejKidA96jf1VUxbjqfAP2TBE+304GzcVjvi09ooAqFuOlZ3EpzV75QWaSyHkBSMims5rfim1rkTOgREPTEQ0TnOb8RlmbHy4jO/HnGp6J48hnPibuvGfuilmfyx1knWiY347zBV5Ua0oly1exx5RIeE1sF6r26mUAjsVjyg+zCnvy0uziwXFFlK6Faejypw8TmjTN+PVdU4t792efTfO0cQ3kmRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QpnBfAk8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QpnBfAk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWQGk21svz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 06:21:01 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2163dc5155fso64491165ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 11:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736709654; x=1737314454; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsAmiSSbEEfyIjEs4CBNhqUDStWdLlryb3CPRW9ZMYo=;
        b=QpnBfAk8ivnpVbn37awkpMRxiP5ovtePDhH/EwLXTC3EWCK3SCbAjXE4P29cThBnkj
         t+SeFblfYzky3OLPNQPgS+GCaZRIx8Ol++RvTFkrYc5WYAiANukph4n1QUFOCCUbCAav
         46jZSTUiM2MTVrDtpBAyhpbIM9A6VjNahDRVB9ojqG+Qxjj2v17D+SUo7pdLxFuJwdGH
         QjQcKC+yIHv6oNE2hbI32Y+y/hFzh+h5sCWmTQ/XDHk+YFBgiJQj0tlPpazM+AVqkBjF
         uxomMsXYCurEilTLf+kVEunvg7DY7TNEVDQ5ZwHHUT2Sxd14lmb/veJP3HS+T5UVsPql
         kfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736709654; x=1737314454;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsAmiSSbEEfyIjEs4CBNhqUDStWdLlryb3CPRW9ZMYo=;
        b=iMq1H9mRguWJK3eznC2yNAIE0KXXuryVsMexZzeWZvy8BCjglrJrExHvnqpzbOAh4r
         Vb1Vv/Zx9mnXS7xJDR8OPISiSRNBo0Km+fVsvJlZ96yOxjId/dDtkBdsPAYaaPsKeQiy
         pIdsfNep61jl43PbfPTA9ot4BQKQDb3mRcYPHr2XVuMnRK6bdh8PzpUFMcQrcIyiB/si
         J0uoGD2WEvf5py+1+GE4DMJ4zxJJavKHPTL5UF31uxAuO3bUWOznRQgJDfZR8QWdVjxm
         38S1VvpwF1kmKYrvshzc8IOKZCNH2fCenzDObGXBpVcZu1LCO/Mo7mI/irL1GTRk8ai3
         Kpyw==
X-Forwarded-Encrypted: i=1; AJvYcCW2NwJ/9DX6rWq9QSybVSLAAci6r2/5s9Knd6M2zQyDCsXNWQ8wu2Los7Mxy/umNZbkDPInB7XpBVL2f2o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YycK+l7hMVAou7g4+W/mpwdbXeVmXYrD0E/H2bsLYSogyfM+Cas
	rxcaX/jLyyH9PghuA+Ce5/lwDpf6TZc0Exdb9zjHzmkSA5Z5Amnc
X-Gm-Gg: ASbGncsAWKRdKGOBIU9nn0A1ZeR4ewPe1YKBuU/3J8CE3bJoS4adugv7hcLnayHQbtL
	fNrFBY2Z9LcYh8YQ4/A6OE7l1Zj1Ti6Asbnz2vzHDJvtCx1Ceih3tTZETo3VwrO05tgGPMvs2mH
	KVIDvBYwxla5rseiQqxiSPWtu0J+L88mJv4NCduBMVG5dBaNILsN1wkPMYwtyvhV2arAaoFGj8/
	D7g8l4Iof2A8SRi6Yn+Mt6QICJuYc09cMBd4pmHS7TAN8Vd
X-Google-Smtp-Source: AGHT+IFlTFXztgnfomDANQsLXoOOUGzpWHCKbCDM7RLfo+Gb7ONbz/UOs4zB+DaT8wStm0uuC5eViQ==
X-Received: by 2002:a17:902:ccc8:b0:215:a05d:fb05 with SMTP id d9443c01a7336-21a83f72d92mr293549275ad.32.1736709654304;
        Sun, 12 Jan 2025 11:20:54 -0800 (PST)
Received: from dw-tp ([171.76.81.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047ce4sm5728247a12.52.2025.01.12.11.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 11:20:53 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
In-Reply-To: <e0d340a5b7bd478ecbf245d826e6ab2778b74e06.1736706263.git.christophe.leroy@csgroup.eu>
Date: Mon, 13 Jan 2025 00:43:19 +0530
Message-ID: <87ldvfvoa8.fsf@gmail.com>
References: <e0d340a5b7bd478ecbf245d826e6ab2778b74e06.1736706263.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Rewrite __real_pte() and __rpte_to_hidx() as static inline in order to
> avoid following warnings/errors when building with 4k page size:
>
> 	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
> 	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
> 	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
> 	   49 |         int i, offset;
> 	      |                ^~~~~~
>
> 	  CC      arch/powerpc/mm/book3s64/hash_native.o
> 	arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
> 	arch/powerpc/mm/book3s64/hash_native.c:782:29: error: variable 'index' set but not used [-Werror=unused-but-set-variable]
> 	  782 |         unsigned long hash, index, hidx, shift, slot;
> 	      |                             ^~~~~
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/
> Fixes: ff31e105464d ("powerpc/mm/hash64: Store the slot information at the right offset for hugetlb")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Also inline __rpte_to_hidx() for the same reason

Thanks for addressing the other warning too in v2. I also tested the
changes on my system and this fixes both the reported warnings.

The changes looks good to me. Please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


> ---
>  arch/powerpc/include/asm/book3s/64/hash-4k.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> index c3efacab4b94..aa90a048f319 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
> @@ -77,9 +77,17 @@
>  /*
>   * With 4K page size the real_pte machinery is all nops.
>   */
> -#define __real_pte(e, p, o)		((real_pte_t){(e)})
> +static inline real_pte_t __real_pte(pte_t pte, pte_t *ptep, int offset)
> +{
> +	return (real_pte_t){pte};
> +}
> +
>  #define __rpte_to_pte(r)	((r).pte)
> -#define __rpte_to_hidx(r,index)	(pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
> +
> +static inline unsigned long __rpte_to_hidx(real_pte_t rpte, unsigned long index)
> +{
> +	return pte_val(__rpte_to_pte(rpte)) >> H_PAGE_F_GIX_SHIFT;
> +}
>  
>  #define pte_iterate_hashed_subpages(rpte, psize, va, index, shift)       \
>  	do {							         \
> -- 
> 2.47.0

