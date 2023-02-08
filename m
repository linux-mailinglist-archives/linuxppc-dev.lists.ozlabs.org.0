Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B3768E58E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:47:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBNDY2YRWz3f3K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T3Rnvod+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T3Rnvod+;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBNCZ3Rsvz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 12:47:05 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id bg10-20020a17090b0d8a00b00230c7f312d4so725906pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 17:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjZgcroriwsEugk9weWmwBjNRJc6RS0hv55s25nO4rI=;
        b=T3Rnvod+sGjsj4Tp/F4rNsfDkPXTVmQKBueGwJ6rbffiNG3ks34G1SvONwjbbpKSLx
         K+aMl/olK6iozVZB51N7ov4qxoGCUcZBbDcc1w7U8kKQLGvoStlIamTHhU3Y3tMVXsQ2
         dwJV0Ik729AAGrh3WdwN1AMG+YeI6rvaleYvbndhh1/CGcVapI9TA7J8GqdJ+71qYHNv
         IN9Y5weECLfx5f0egpHIdWT3WSoDownqAQoNz1uTzumQKUU7zFyxshcwHYxy1z7YKEd5
         Trx94brejc8JavIrW8fWP36rkAMfgMsI0utsNzWJSsd0mzipVcsuKJSCJxgFNlUbpAXr
         DElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjZgcroriwsEugk9weWmwBjNRJc6RS0hv55s25nO4rI=;
        b=UQ6qNQAT7KBZYf/1VG3grye01LZYSACwweHvYHtsIrBfJYI94wia1To8fgWum0E8Ah
         YbXXt+mH34Nw1nv62vkh8gIVQzNIQmTdHhJWuas+DxG2Td4SQUu8yi7x3bYkLUTDV4+i
         DQqbkGDsy7A72Pb9r86LFs7IaD6PvL0xSBubOUvv9udUK7WfP97qjuNcqg1II6m4zbH0
         WkIJPWmWYhmgRl/T/19soEo6wlPt/W/wuNlc7O4hWIpVjwaXMOZwj2gowG9XFBPCFRx0
         W0SXl2L/VCyDv9Cx78BNx/v8LmmcbiIVbRuVbbqBSeuFXNbSQSpspKZ356WtzcT9zcAT
         d89A==
X-Gm-Message-State: AO0yUKX7bQeULJiYoFfXK3sGU76YGPStnFSWGCGsTB2+Qd7QVaBvPg2f
	zejdwCHh/k0M+4x3TMHN6/Y=
X-Google-Smtp-Source: AK7set+Rx8bwFJXZPUypnmLEaScqNCFoHUGKQdnDDCzWzsSJ8ehu9pZaOgXwJDEoM4zRSDGCA3KG3A==
X-Received: by 2002:a17:90b:1652:b0:22c:46a1:67ca with SMTP id il18-20020a17090b165200b0022c46a167camr6033526pjb.37.1675820821100;
        Tue, 07 Feb 2023 17:47:01 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090a2dcc00b00230a50e6eadsm198397pjm.24.2023.02.07.17.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 17:46:58 -0800 (PST)
Date: Wed, 8 Feb 2023 01:46:46 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/1] mm: introduce vm_flags_reset_once to replace
 WRITE_ONCE vm_flags updates
Message-ID: <Y+L/BubSzdbpTS4P@localhost>
References: <20230201000116.1333160-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201000116.1333160-1-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 31, 2023 at 04:01:16PM -0800, Suren Baghdasaryan wrote:
> Provide vm_flags_reset_once() and replace the vm_flags updates which used
> WRITE_ONCE() to prevent compiler optimizations.
> 
> Fixes: 0cce31a0aa0e ("mm: replace vma->vm_flags direct modifications with modifier calls")
> Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
> Notes:
> - The patch applies cleanly over mm-unstable
> - The SHA in Fixes: line is from mm-unstable, so is... unstable
> 
>  include/linux/mm.h | 7 +++++++
>  mm/mlock.c         | 4 ++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5bf0ad48faaa..23ce04f6e91e 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -648,6 +648,13 @@ static inline void vm_flags_reset(struct vm_area_struct *vma,
>  	vm_flags_init(vma, flags);
>  }
>  
> +static inline void vm_flags_reset_once(struct vm_area_struct *vma,
> +				       vm_flags_t flags)
> +{
> +	mmap_assert_write_locked(vma->vm_mm);
> +	WRITE_ONCE(ACCESS_PRIVATE(vma, __vm_flags), flags);
> +}
> +
>  static inline void vm_flags_set(struct vm_area_struct *vma,
>  				vm_flags_t flags)
>  {
> diff --git a/mm/mlock.c b/mm/mlock.c
> index ed49459e343e..617469fce96d 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> -	vm_flags_reset(vma, newflags);
> +	vm_flags_reset_once(vma, newflags);
>  
>  	lru_add_drain();
>  	walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
> @@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  
>  	if (newflags & VM_IO) {
>  		newflags &= ~VM_IO;
> -		vm_flags_reset(vma, newflags);
> +		vm_flags_reset_once(vma, newflags);
>  	}
>  }

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

>  
> -- 
> 2.39.1.456.gfc5497dd1b-goog
> 
