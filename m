Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0686A67D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRQDG2q8vz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:02:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=atM6j7nQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=atM6j7nQ;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRQCJ6H9Dz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 18:02:02 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id y2so12372996pjg.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 23:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3wu5/hA45huVzW4HMjx8Pxv25mjeuJerMIQ0CD8yO0=;
        b=atM6j7nQoRJ1fx1ZnTgRJdjPFZ5QuebiC4qPDEvQBz+lBOWXyYd0SoEg1mOG6AY29/
         c5Z+UXhpjoM5M58ByHFZ7bnfeMBt6hDczwuOTIpqh1WFSLSSne49d3Msw1uLPJM4iOu/
         /xsyT0/ivvmjPEQDhOJMp/b1DSSqyqMOcLYyZJ1Luit54Ff5PhbJN2P49DbReWskMzyt
         AQAbSWmSV3rNhqJiRchUONDIi/JjBb1qaFHcZOEm/vT7LapjP61OjGibFHfgVHRcGKOR
         qVO8jOtj6tRbMle2blLi8k9Jc0Uw77wwaGOZtXyBGLcuv+SFQl5eqYDo67d/+a6seR3Y
         gxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3wu5/hA45huVzW4HMjx8Pxv25mjeuJerMIQ0CD8yO0=;
        b=5N4P8RtvPZyaDqrT+EjgoFPEM1lVrBqH8XVjjB1UyrkAurtvdRnZGBzhw7jkXC4U9t
         c8CJo928ruYUGNfs/53R2ClCcG0I0t3FNMmvN4243oWSiqjz6YN/p++AT9b3Y5WaPd4i
         MY05XIkrCvsNMgUlMjQQJ1oGeDu7QdBgFP1aBMkbCctLYQ2FTT/Yn94RHdR2kkTA15rj
         DtuA+nQyYozyE5txz5MgHusCmuGc7dPGu4A1p0aIWE00TMevPe2F/qPXGYn0HQGNvlgT
         ir84Acm0xGm/Q2yJRz2xrVQAv418YNJlobFPEJ6ui6tsB9hQITZR66qFm/i6D5MgxHGN
         0GbQ==
X-Gm-Message-State: AO0yUKWPGHN592HLWNDUrfh2OL1A8OBMWfUhvWSvSf6LSavz8EkemkxJ
	6vuSOrigwEOpaKjuebV+Oes=
X-Google-Smtp-Source: AK7set/gVrc9ripGXC/S0wswKbJY6lWDLcBFGqWvgNzQqQxJBKZiJediguAZ0r6H1m0xT+8MkCf8ZQ==
X-Received: by 2002:a17:902:dacf:b0:19c:f232:21ca with SMTP id q15-20020a170902dacf00b0019cf23221camr6828944plx.3.1677654119534;
        Tue, 28 Feb 2023 23:01:59 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id b11-20020a1709027e0b00b0019a95764e68sm7552966plm.294.2023.02.28.23.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 23:01:58 -0800 (PST)
Date: Wed, 1 Mar 2023 07:01:44 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 17/33] mm/mremap: write-lock VMA while remapping it to
 a new address range
Message-ID: <Y/74WA6JLPWAZ/G6@localhost>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-18-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227173632.3292573-18-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, Laurent Dufour <laurent.dufour@fr.ibm.com>, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.
 org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 09:36:16AM -0800, Suren Baghdasaryan wrote:
> Write-lock VMA as locked before copying it and when copy_vma produces
> a new VMA.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
> ---
>  mm/mmap.c   | 1 +
>  mm/mremap.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index e73fbb84ce12..1f42b9a52b9b 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3189,6 +3189,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>  			get_file(new_vma->vm_file);
>  		if (new_vma->vm_ops && new_vma->vm_ops->open)
>  			new_vma->vm_ops->open(new_vma);
> +		vma_start_write(new_vma);

Oh, it's to prevent handling page faults during move_page_tables().


>  		if (vma_link(mm, new_vma))
>  			goto out_vma_link;
>  		*need_rmap_locks = false;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 1ddf7beb62e9..327c38eb132e 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -623,6 +623,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  			return -ENOMEM;
>  	}
>  
> +	vma_start_write(vma);
>  	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
>  	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
>  			   &need_rmap_locks);
> -- 
> 2.39.2.722.g9855ee24e9-goog

Looks good to me.

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

> 
> 
