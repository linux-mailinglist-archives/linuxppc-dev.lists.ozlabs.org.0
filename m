Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7916A6A20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 10:55:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRV3Q6LYCz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 20:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IsHSPoW4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IsHSPoW4;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRV2S4ZLhz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 20:54:39 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id kb15so12817719pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCmVhit3ZxUnFfJa9Eg0PdbeeaxDV2n5h2R0f8D1TDQ=;
        b=IsHSPoW4qTvdJtki81JnLpv6tsZtbF3JjQTnxZtxQVSUQGmA5m4P4l7BvzWWQoNSuS
         xSD7jhrZm5QV8FZgZVY6Vi6i2BsMnBSpJLgydkl+zYdbJIqcQndZEjqX37xcEDJgmC0c
         TPU+3aj1+91b6bEp6UBwb9eQzhY5SgGORcupta75GhZ6a8NG9EIbpze96tzJAPRaFgV3
         nfzpjnt1I7yRAJjoUQhSyjgGBPpm8B7vgKkKYJkkgb1YCHhuDWM4jaZSGVWsyg+rQzrX
         2qVI8QGugWl/wFcet/8u7+DNcMzjoJsfCBlORiD3WC6gUIsBA9ytVc3ampWd2mB3HwJw
         R46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCmVhit3ZxUnFfJa9Eg0PdbeeaxDV2n5h2R0f8D1TDQ=;
        b=m1cGAhwIaGEY5R3BHCjbKf52Z7aHKHx/2L9TQ/fSrnn+mo2C8Jwi/jESWBZNy5/orB
         m2YNMvLZP4gAxCVLgt1F1ScD7qrtfkEYvZIoMSo+em5/xeu7JbzHaUy6wAeaxQ1HOpdL
         iEqrrXK1UNJMcttMarOA7YBKh2VlQgsCOmQLYMZARlO7vkxI2ZWSfi6EdNPN7nEQpyZF
         Q8nRCXS/BA7mfN3HknHf528gHuVlXi+oZujibOH3IEaWrzmn5HZ1dL6UeacDrggO7hSe
         sxNTbGTJ5vTAbix7gvOpS/cmsw1oJZUqLIvp2aDuBZNZhwL00V1Px/MFV7nCKsSq7om/
         GmIA==
X-Gm-Message-State: AO0yUKW2qJ7yO17d8JLYgPoP96rN9FbwN7r+c6lpfqcTuS2Ko8O0Mhus
	QP6jVeBcutcuHPJW3Da2EIQ=
X-Google-Smtp-Source: AK7set9yjx1OHgmVb8mksaGcbLhfEq+vire/eemNETYF7Uujz6AR4vXtJwEeT/YvwzBAuROhUh6OKQ==
X-Received: by 2002:a17:90b:4b8d:b0:234:68d:b8ea with SMTP id lr13-20020a17090b4b8d00b00234068db8eamr6626136pjb.39.1677664476789;
        Wed, 01 Mar 2023 01:54:36 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id e18-20020a656892000000b004fbd91d9716sm7103203pgt.15.2023.03.01.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:54:35 -0800 (PST)
Date: Wed, 1 Mar 2023 09:54:21 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 24/33] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
Message-ID: <Y/8gzRg3voRhNOsM@localhost>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-25-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227173632.3292573-25-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 09:36:23AM -0800, Suren Baghdasaryan wrote:
> When vma->anon_vma is not set, page fault handler will set it by either
> reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> a compatible adjacent VMA and that requires not only the faulting VMA
> to be stable but also the tree structure and other VMAs inside that tree.
> Therefore locking just the faulting VMA is not enough for this search.
> Fall back to taking mmap_lock when vma->anon_vma is not set. This
> situation happens only on the first page fault and should not affect
> overall performance.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/memory.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index bda4c1a991f0..8855846a361b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5243,6 +5243,10 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>  	if (!vma_is_anonymous(vma))
>  		goto inval;
>  
> +	/* find_mergeable_anon_vma uses adjacent vmas which are not locked */
> +	if (!vma->anon_vma)
> +		goto inval;
> +
>  	if (!vma_start_read(vma))
>  		goto inval;

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

> -- 
> 2.39.2.722.g9855ee24e9-goog
> 
> 
