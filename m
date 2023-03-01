Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1B6A685B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:44:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRR8X2W7Gz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IVuk/FRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IVuk/FRr;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRR7Z1msYz3bg5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 18:43:52 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id i10so13087685plr.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 23:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OWjpqnVGFtJHppOeTMNCvEvJYUpqOyji4irq19gGZLo=;
        b=IVuk/FRrQ1cnFEOcjIQKxmcSCAt5b8wwU30o9yvRkxkrtthfUWs4MWtfnshVW22vWV
         pxG7b/5dfs+C8VjLBFS2wkbt+qjSk/VFBUxhrhScOhmkgtuOxWtfEZ7FDF4YbhxoAFtf
         7gzmv/O9XC6bNpz8jWth4nLzBG5TX1M3DpJwR/F6ix9wK7nDrcJRXJwbYBcHxJ6nQxIO
         oKgj/wJ7qANmcszJOk0mIbf1NFi3ht5tlJJFxVMGizGnLGMRMrUCqn8HsKJVjxYaKXxL
         yj9Gd18KbPAo0nhLRBZR9E9/M4icHsh7OZm9uWzuOXch9CRasHUAL1sLbYZFSM3W/ZFj
         yFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWjpqnVGFtJHppOeTMNCvEvJYUpqOyji4irq19gGZLo=;
        b=AO80ItD8k92DX8mQrfu68m+xioDcHONVwtIrVG0h23qrc+aqdBiPIlYvjI/0/qNIfI
         TY3jGdOSI9FMvvq74UK3D3494iwaiWg5OVRD52ILQ/zXZBlaKX7G8QkQXDrMgD6Vya7y
         g8zAPbuaah4E5XLjJV2sgD4xg4VJ9gzN+YJ9/rLTz36g7afKld6+wcDAVYh/EUwkZA8d
         nirBkhaCbm1EDQeFtKtI6GHlHr08XLMwxDNx5fyXUh75YkRG7zw/6AIPtIO1DbQXZfMy
         YLdCAARnztPsSQQIJXV9VAEkIBZnR5lMCjpoclsqnkOxL6Cr5Jvya+bp7yo2LFlRHk6U
         1bKw==
X-Gm-Message-State: AO0yUKURlKT3sM4efEGGnWeiyUqyALieH8OSn6lvuv3u+U400on4WlUD
	d98qFf2jEzIxzuYDdVO0e2OHMeXXYdQOnA==
X-Google-Smtp-Source: AK7set/NzwkQJ1R6EDT0Imnsgt3x8Nd6NQY8wcxlk07k0GJDQu1OIK3Vxc/SLHh5JSP6hXwMeNFAfQ==
X-Received: by 2002:a17:90b:1c8d:b0:233:eba7:10c0 with SMTP id oo13-20020a17090b1c8d00b00233eba710c0mr6319388pjb.1.1677656629419;
        Tue, 28 Feb 2023 23:43:49 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090a304600b00231261061a5sm7206661pjl.5.2023.02.28.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 23:43:48 -0800 (PST)
Date: Wed, 1 Mar 2023 07:43:33 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 18/33] mm: write-lock VMAs before removing them from
 VMA tree
Message-ID: <Y/8CJQGNuMUTdLwP@localhost>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-19-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227173632.3292573-19-surenb@google.com>
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

On Mon, Feb 27, 2023 at 09:36:17AM -0800, Suren Baghdasaryan wrote:
> Write-locking VMAs before isolating them ensures that page fault
> handlers don't operate on isolated VMAs.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c  | 1 +
>  mm/nommu.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 1f42b9a52b9b..f7ed357056c4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  static inline int munmap_sidetree(struct vm_area_struct *vma,
>  				   struct ma_state *mas_detach)
>  {
> +	vma_start_write(vma);
>  	mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);

I may be missing something, but have few questions:

	1) Why does a writer need to both write-lock a VMA and mark the VMA detached
	   when unmapping it, isn't it enough to just only write-lock a VMA?

	2) as VMAs that are going to be removed are already locked in vma_prepare(),
	   so I think this hunk could be dropped?

>  	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
>  		return -ENOMEM;
> diff --git a/mm/nommu.c b/mm/nommu.c
> index 57ba243c6a37..2ab162d773e2 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -588,6 +588,7 @@ static int delete_vma_from_mm(struct vm_area_struct *vma)
>  		       current->pid);
>  		return -ENOMEM;
>  	}
> +	vma_start_write(vma);
>  	cleanup_vma_from_mm(vma);

	3) I think this hunk could be dropped as Per-VMA lock depends on MMU anyway.

Thanks,
Hyeonggon

>  
>  	/* remove from the MM's tree and list */
> @@ -1519,6 +1520,10 @@ void exit_mmap(struct mm_struct *mm)
>  	 */
>  	mmap_write_lock(mm);
>  	for_each_vma(vmi, vma) {
> +		/*
> +		 * No need to lock VMA because this is the only mm user and no
> +		 * page fault handled can race with it.
> +		 */
>  		cleanup_vma_from_mm(vma);
>  		delete_vma(mm, vma);
>  		cond_resched();
> -- 
> 2.39.2.722.g9855ee24e9-goog
> 
> 
