Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC2770B35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:47:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=a4GiJzdq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHfT45vVJz3cTd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 07:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=a4GiJzdq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=mjguzik@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHfRr5bG2z3btp
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 07:46:32 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so23760675e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691185585; x=1691790385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M/pOSfgbyVT5LQxnNymgKpK05ihGgzeqo1fmPwKo4cM=;
        b=a4GiJzdqv+qk8GtXsrJmdKutL523iO/jKkD1Gd/zbu6JYYdPAn4zLqpp4/JPAO1ysS
         wtqxE8CsmEcwfV9Ove0bJCJnmMGGV6Kn/MjWnLXRYvp3B3QYpGfNBQKNrIkszewrCKHx
         c/cotekgWT4fnr7Kx08vJnKsw3SLeSGW6rFs0yWNmZgwOJhFrKOxr5Cp4ZUvkQBCEA+4
         NWcuECwaIC2nDyL6LfgMHhR6CzMuWN+vOZe3VJTKm+90ZaWdhiw4pbDdzrbAsEEKyzHz
         mpayLVtTYyHnz4GQTcbqJuZQssyMVFYpcI4D6yl+jo881L1rIzs/P8T8EURCo9UAnNcJ
         3QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691185585; x=1691790385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/pOSfgbyVT5LQxnNymgKpK05ihGgzeqo1fmPwKo4cM=;
        b=Av57hjjXEk0Y9FlxvoDGWzp8AIeQHj8IQZwmKkJ7/q46WnomAKm4vKgQrDDFrqx8Cd
         rmvruFQpEBEpoqogOYwL6NtA730HJMKKZMDxUawFqdaXZweEsXOy/mEQpb/GGCidpOKU
         MvPO8d21Y1MS72iXol9XEhLw0yehFImX352Eej/QbT+zvvjc+csTQL0nzjNzALOI/xnE
         +uiHsPO1pbCxWee9C811B33sYw3EKd6bt2wiS8xdSzl8ODLM5jVTKOLuj4wiLGVv2BHY
         4YUmQhR2SwIvqGzKJt28jua4q23LEQUa82gJlGYjofkRiHsbwoVomg1AtudD3suAP0Ta
         q6dg==
X-Gm-Message-State: AOJu0YzFk2uL2a5SLK0A9BQtHpdtt2Be78HlJn9Hhk8WYXFabb9qzLi0
	ailvPnk1M1a8YgDKq3MG9xo=
X-Google-Smtp-Source: AGHT+IGOtBUSiK39LU5+0tpNJevAeU4Xfb74Y4DRTOPaM0nN2Uvb1A/IoQQ+f7RQvAmDLiwJ9gr3Zg==
X-Received: by 2002:a1c:f603:0:b0:3fe:21b9:806 with SMTP id w3-20020a1cf603000000b003fe21b90806mr2415552wmc.0.1691185584689;
        Fri, 04 Aug 2023 14:46:24 -0700 (PDT)
Received: from f (cst-prg-21-219.cust.vodafone.cz. [46.135.21.219])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5483000000b0030ae53550f5sm3423406wrv.51.2023.08.04.14.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 14:46:24 -0700 (PDT)
Date: Fri, 4 Aug 2023 23:46:20 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
Message-ID: <20230804214620.btgwhsszsd7rh6nf@f>
References: <20230708191212.4147700-1-surenb@google.com>
 <20230708191212.4147700-3-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230708191212.4147700-3-surenb@google.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, torvalds@linux-foundation.org, linux-arm-kernel@lists.infradead.org, Holger =?utf-8?Q?Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 08, 2023 at 12:12:12PM -0700, Suren Baghdasaryan wrote:
[..]
> Lock VMAs of the parent process when forking a child, which prevents
> concurrent page faults during fork operation and avoids this issue.
> This fix can potentially regress some fork-heavy workloads. Kernel build
> time did not show noticeable regression on a 56-core machine while a
> stress test mapping 10000 VMAs and forking 5000 times in a tight loop
> shows ~5% regression. If such fork time regression is unacceptable,
> disabling CONFIG_PER_VMA_LOCK should restore its performance. Further
> optimizations are possible if this regression proves to be problematic.
> 
> ---
>  kernel/fork.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b85814e614a5..d2e12b6d2b18 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  	for_each_vma(old_vmi, mpnt) {
>  		struct file *file;
>  
> +		vma_start_write(mpnt);
>  		if (mpnt->vm_flags & VM_DONTCOPY) {
>  			vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
>  			continue;
> 

I don't see it mentioned in the discussion, so at a risk of ruffling
feathers or looking really bad I'm going to ask: is the locking of any
use if the forking process is single-threaded? The singular thread in
this case is occupied executing this very code, so it can't do any op
in parallel. Is there anyone else who could trigger a page fault? Are
these shared with other processes? Cursory reading suggests a private
copy is made here, so my guess is no. But then again, I landed here
freshly from the interwebz.

Or in short: if nobody can mess up the state if the forking process is
single-threaded, why not check for mm_users or whatever other indicator
to elide the slowdown for the (arguably) most common case?

If the state can be messed up anyway, that's a shame, but short
explanation how would be welcome.

to illustrate (totally untested):
diff --git a/kernel/fork.c b/kernel/fork.c
index d2e12b6d2b18..aac6b08a0b21 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -652,6 +652,7 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
        LIST_HEAD(uf);
        VMA_ITERATOR(old_vmi, oldmm, 0);
        VMA_ITERATOR(vmi, mm, 0);
+       bool singlethread = READ_ONCE(oldmm->mm_users) == 1;

        uprobe_start_dup_mmap();
        if (mmap_write_lock_killable(oldmm)) {
@@ -686,7 +687,8 @@ static __latent_entropy int dup_mmap(struct mm_struct *mm,
        for_each_vma(old_vmi, mpnt) {
                struct file *file;

-               vma_start_write(mpnt);
+               if (!singelthreaded)
+                       vma_start_write(mpnt);
                if (mpnt->vm_flags & VM_DONTCOPY) {
                        vm_stat_account(mm, mpnt->vm_flags, -vma_pages(mpnt));
                        continue;
