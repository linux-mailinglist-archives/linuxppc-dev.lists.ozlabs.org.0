Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB366E81F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxLxZ3G7Yz3bXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:04:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ugmy2ZqK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ugmy2ZqK;
	dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxLwf2sCDz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:04:01 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id 203so4851600iou.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nhao4yhxvo1b0ca4/4XXHiPX2DFuPMAuoXXjxRqWTzk=;
        b=Ugmy2ZqKnLRTOnr8n+vgJmW7jKcWi4hXccBOn2Gki6Zrag7MoLWtZ+TwC6KAa1rMXw
         wXpyQ8nmNJOrUrseDG9EzHysaXMjM04aS5x2xNylWaAN9xvvdISifj6fE++htaLmbddR
         j81VjCX2xsB852mW5SqUWN0nd9IvIVdfgHX33Hh2tu0XchQY05liQxtto9CUhXsnf9k7
         f6y6oOhGyoxCPLOEL45q+HGd9pmFyOS5F/LZR7OgkHsj8ga1IKTsgBSDZYIAGdZSdz8P
         SnaqeJ4jBFGrrKdUvkPzy7SEBae8MWN4qiEkG94kK43jVC7Q6PfwYVJUCo/XaiKekGkY
         8s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhao4yhxvo1b0ca4/4XXHiPX2DFuPMAuoXXjxRqWTzk=;
        b=yx0fPGRoGp0lZZQNjoZwGgHe7FYLVKysIpjWFEJS8vIhaa9QnJp3KEBNeFp4JPHFnF
         9aFia6TAHwVzVG4rDr0EU5k5GB5LeW2VMyolxBmvPD3xaeNrcowR8fkjxu96/DUGiHJz
         xl7XUAumrL7EjG+8cl/GOzOOgKyVThgaP+a1yIySgueYlC9yknVD8sW8bRnnwHh5HQRZ
         nJQ/6CPMG+yYp5UYxvBdOsuFWAsoSUnSKQSLxJofBGANMaCHUo1kL6c8K5XukdUj4B8k
         l1JfMlzUVQUdq1UIOMv8jzcUymrH6mqrVPdk/wvD6uMz7vqU1OS76mhSsC3E1glp++x2
         rr9w==
X-Gm-Message-State: AFqh2koQ8SIVF6hVsz5mBDTzMFaXGCHtrlw72oQNyX21pV4veL0o4Oww
	Aumey9cWT84Ns9tXJN7U/EIUHwK9Qad9Be+fMXGhJg==
X-Google-Smtp-Source: AMrXdXsMeP8M6U4I8iASTh2mqrZYLm+ikxBgVtUSVf76IGFGfS0Npq61yI+0jkuo5OgGYf5QPFQKrSgcpAZ1h7kJHBc=
X-Received: by 2002:a02:cb45:0:b0:39e:6dd8:6c96 with SMTP id
 k5-20020a02cb45000000b0039e6dd86c96mr345507jap.246.1673989436533; Tue, 17 Jan
 2023 13:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-29-surenb@google.com>
In-Reply-To: <20230109205336.3665937-29-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 22:03:20 +0100
Message-ID: <CAG48ez2cK1M=fgkYi4bPdWX7uOm15Omv6EjFgXUkS2QsqiwGSg@mail.gmail.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
To: Suren Baghdasaryan <surenb@google.com>, willy@infradead.org, liam.howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> page fault handling. When VMA is not found, can't be locked or changes
> after being locked, the function returns NULL. The lookup is performed
> under RCU protection to prevent the found VMA from being destroyed before
> the VMA lock is acquired. VMA lock statistics are updated according to
> the results.
> For now only anonymous VMAs can be searched this way. In other cases the
> function returns NULL.
[...]
> +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> +                                         unsigned long address)
> +{
> +       MA_STATE(mas, &mm->mm_mt, address, address);
> +       struct vm_area_struct *vma, *validate;
> +
> +       rcu_read_lock();
> +       vma = mas_walk(&mas);
> +retry:
> +       if (!vma)
> +               goto inval;
> +
> +       /* Only anonymous vmas are supported for now */
> +       if (!vma_is_anonymous(vma))
> +               goto inval;
> +
> +       if (!vma_read_trylock(vma))
> +               goto inval;
> +
> +       /* Check since vm_start/vm_end might change before we lock the VMA */
> +       if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
> +               vma_read_unlock(vma);
> +               goto inval;
> +       }
> +
> +       /* Check if the VMA got isolated after we found it */
> +       mas.index = address;
> +       validate = mas_walk(&mas);

Question for Maple Tree experts:

Are you allowed to use mas_walk() like this? If the first mas_walk()
call encountered a single-entry tree, it would store mas->node =
MAS_ROOT, right? And then the second call would go into
mas_state_walk(), mas_start() would return NULL, mas_is_ptr() would be
true, and then mas_state_walk() would return the result of
mas_start(), which is NULL? And we'd end up with mas_walk() returning
NULL on the second run even though the tree hasn't changed?

> +       if (validate != vma) {
> +               vma_read_unlock(vma);
> +               count_vm_vma_lock_event(VMA_LOCK_MISS);
> +               /* The area was replaced with another one. */
> +               vma = validate;
> +               goto retry;
> +       }
> +
> +       rcu_read_unlock();
> +       return vma;
> +inval:
> +       rcu_read_unlock();
> +       count_vm_vma_lock_event(VMA_LOCK_ABORT);
> +       return NULL;
> +}
