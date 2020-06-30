Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE720F479
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 14:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x3QH1wbTzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x3Lx0R7xzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 22:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JjuHWXCZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49x3Lw0Rx0z9sQx;
 Tue, 30 Jun 2020 22:19:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593519560;
 bh=3PRruPOb1PjVwCieCZBL1YzAa3mDNPa38rW2fGTtJvA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JjuHWXCZMzKAAtyLwAY7taFCSzf69zyJos5GV5QPIjuN3qrhZqm05h9F1PGTIE5uM
 1fj7l058T1eKa9qt5wYnc0KqD+Feddd0JSH+PQGoirFlapZzNAOimwENufz10GfYw7
 J92+B5OJ/Wk14ssPbF97EDa+A9FhQMKxlKUhOLly9001TX9rmbSa012rNggQTZ67o6
 ApzwjA55BDCMoclbNzhIuiwHD19a5/Pn1F7rDunqQz6VNTZBJI6XHcNtY0gh3qLXod
 lc/SOJWJ1zumjLq6P2j3z3aQF4zej4Or+cC0gQo83tFs2IqcYVW88FUv3eN0/KMBTI
 4bUXQdM58zCGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/mm/books64/pkeys: Rename is_pkey_enabled()
In-Reply-To: <20200627070147.297535-2-aneesh.kumar@linux.ibm.com>
References: <20200627070147.297535-1-aneesh.kumar@linux.ibm.com>
 <20200627070147.297535-2-aneesh.kumar@linux.ibm.com>
Date: Tue, 30 Jun 2020 22:21:34 +1000
Message-ID: <87wo3o7nht.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Rename is_pkey_enabled() to is_pkey_masked() to better indicates that
> this check is to make sure the key is available for userspace usage.

I don't think the new name makes that any clearer. Unless you know that
"masked" means not "available for userspace".

It's also not clear if masked means 00 or 11.

Now that there's only one caller why not just fold it in, that way it
doesn't need a name at all.

> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index ca5fcb4bff32..70d760ade922 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -206,18 +206,16 @@ static inline void write_uamor(u64 value)
>  	mtspr(SPRN_UAMOR, value);
>  }
>  
> -static bool is_pkey_enabled(int pkey)
> +static bool is_pkey_masked(int pkey)
>  {
>  	u64 uamor = read_uamor();
>  	u64 pkey_bits = 0x3ul << pkeyshift(pkey);
>  	u64 uamor_pkey_bits = (uamor & pkey_bits);
>  
>  	/*
> -	 * Both the bits in UAMOR corresponding to the key should be set or
> -	 * reset.
> +	 * Both the bits in UAMOR corresponding to the key should be set
>  	 */
> -	WARN_ON(uamor_pkey_bits && (uamor_pkey_bits != pkey_bits));
> -	return !!(uamor_pkey_bits);
> +	return (uamor_pkey_bits != pkey_bits);
>  }
>  
>  static inline void init_amr(int pkey, u8 init_bits)
> @@ -246,7 +244,7 @@ int __arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
>  	u64 new_amr_bits = 0x0ul;
>  	u64 new_iamr_bits = 0x0ul;
>  
> -	if (!is_pkey_enabled(pkey))
> +	if (is_pkey_masked(pkey))
>  		return -EINVAL;

eg:
	u64 pkey_bits = 0x3ul << pkeyshift(pkey);

	if ((read_uamor() & pkey_bits) != pkey_bits)
        	return -EINVAL;

>  
>  	if (init_val & PKEY_DISABLE_EXECUTE) {


cheers
