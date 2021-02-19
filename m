Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0131F3E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 03:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhZkx3QRrz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 13:09:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=MXNuASox;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=MXNuASox; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhZkV0RBDz30JL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 13:08:47 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id a4so2592772pgc.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 18:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rb6hQrGASZMQuqqqY6sU+3ZTAJiw5k5xT06+VRCXl60=;
 b=MXNuASoxWigJ5F00irSauvBp7PeaDX+1nJDpKfbc0Y8iEol/vdar4mR2eeZEdSu8Nd
 WL7omdjunTwbgw2pR00uPGlxypGdZru9pV6a482AJNllT95MUliCE8MfH19Guvx9K8z2
 VKAHxR/lVFMcUDW7ol10wwB/6MAohKCRfBfMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rb6hQrGASZMQuqqqY6sU+3ZTAJiw5k5xT06+VRCXl60=;
 b=NVo9bbBNJWMrPD1luiJeAsrUbJmn8O2J+NB1qLoA8ZVXumXzQUaS14oUULgKKuPRF8
 3UTPiFSkPTiEYxV9pfYpRqGSJ2V6hgmREGkVmPbKW4DSkMUzF0k/YEFpG6fRHt1AexO6
 MZ13FyXwJbc9p1gWIf10i+t9n7yETjl5ghgJaUA5wSqw3MlKaXUv/cv3y8NX+RwqQWq1
 FTRbSxnOxoRF18nXBm1E3sJAejQqp0BrWH4blNltrVPHOGDnOlqG0NMBJAmsDJOZ/FMh
 ZvTH/QkjMjsVlmkKAxUDPtzZSpOZ4OuSuKeRbQCcSv2qVvmNO6OF6jpLbBrdUjtc33H7
 0KeA==
X-Gm-Message-State: AOAM533BzFptEaRMJqG/kFkHpkRySbIfG7Vj9jxM2eXHfgcbYDPVV9ED
 imNSpK58cnWcaZWDBtEjeoo7tPWXzc+jucTt
X-Google-Smtp-Source: ABdhPJzAgdCt8SoAJIlX3J1QPEddoCeyP4Sca4EEVmVgt0VGKw8hx8TZr6sr8mL4+DdT2k1qIVX4+Q==
X-Received: by 2002:a63:7d13:: with SMTP id y19mr6435440pgc.369.1613700523339; 
 Thu, 18 Feb 2021 18:08:43 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7c23-3019-42a1-bee8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7c23:3019:42a1:bee8])
 by smtp.gmail.com with ESMTPSA id c15sm7478282pjc.9.2021.02.18.18.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 18:08:42 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
In-Reply-To: <20210211135130.3474832-4-mpe@ellerman.id.au>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-4-mpe@ellerman.id.au>
Date: Fri, 19 Feb 2021 13:08:39 +1100
Message-ID: <87k0r4q060.fsf@dja-thinkpad.axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Pull the loop calling hpte_updateboltedpp() out of
> hash__change_memory_range() into a helper function. We need it to be a
> separate function for the next patch.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/book3s64/hash_pgtable.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
> index 03819c259f0a..3663d3cdffac 100644
> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> @@ -400,10 +400,23 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> +static void change_memory_range(unsigned long start, unsigned long end,
> +				unsigned int step, unsigned long newpp)

Looking at the call paths, this gets called only in bare metal, not
virtualised: should the name reflect that?

> +{
> +	unsigned long idx;
> +
> +	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
> +		 start, end, newpp, step);
> +
> +	for (idx = start; idx < end; idx += step)
> +		/* Not sure if we can do much with the return value */

Hmm, I realise this comment isn't changed, but it did make me wonder
what the return value!

It turns out that the function doesn't actually return anything.

Tracking back the history of hpte_updateboltedpp, it looks like it has
not had a return value since the start of git history:

^1da177e4c3f4 include/asm-ppc64/machdep.h    void            (*hpte_updateboltedpp)(unsigned long newpp, 
3c726f8dee6f5 include/asm-powerpc/machdep.h                                         unsigned long ea,
1189be6508d45 include/asm-powerpc/machdep.h                                        int psize, int ssize);

The comment comes from commit cd65d6971334 ("powerpc/mm/hash: Implement
mark_rodata_ro() for hash") where Balbir added the comment, but again I
can't figure out what sort of return value there would be to ignore.

Should we drop the comment? (or return something from hpte_updateboltedpp)

> +		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
> +							mmu_kernel_ssize);
> +}
> +
>  static bool hash__change_memory_range(unsigned long start, unsigned long end,
>  				      unsigned long newpp)
>  {
> -	unsigned long idx;
>  	unsigned int step, shift;
>  
>  	shift = mmu_psize_defs[mmu_linear_psize].shift;
> @@ -415,13 +428,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
>  	if (start >= end)
>  		return false;
>  
> -	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
> -		 start, end, newpp, step);
> -
> -	for (idx = start; idx < end; idx += step)
> -		/* Not sure if we can do much with the return value */
> -		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
> -							mmu_kernel_ssize);
> +	change_memory_range(start, end, step, newpp);

Looking at how change_memory_range is called, step is derived by:

	shift = mmu_psize_defs[mmu_linear_psize].shift;
	step = 1 << shift;

We probably therefore don't really need to pass step in to
change_memory_range. Having said that, I'm not sure it would really be that
much tidier to compute step in change_memory_range, especially since we
also need step for the other branch in hash__change_memory_range.

Beyond that it all looks reasonable to me!

I also checked that the loop operations made sense, I think they do - we
cover from start inclusive to end exclusive and the alignment is done
before we call into change_memory_range.

Regards,
Daniel

>  	return true;
>  }
> -- 
> 2.25.1
