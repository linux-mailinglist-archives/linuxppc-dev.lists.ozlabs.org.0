Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFE66E743
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:52:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxKL45K6cz3fCQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oK5gCq5x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oK5gCq5x;
	dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxKKB23MHz3cFH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 06:51:40 +1100 (AEDT)
Received: by mail-il1-x129.google.com with SMTP id u8so15921014ilq.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 11:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OSFcPHbwPU7VuQqTvb7CRygx4qEQJSCX4opQ3eOpE/E=;
        b=oK5gCq5xbP6niBRqF/QRL7Bq2gVthVqJQbspwhXXQ7OnRSHWI5AiE5QK1LTqtcMGRn
         HeyRbfCQAKtC4T3gzbb8Wzg7491gbqjvpVBGSplHQdv+8mbaq/6L7WWL28izPBjIqoix
         RcZwdqu/IkMGD9/tcQk+epsczoRPYFq75Ly73PSeVqekeXO1isqgk/+r+nTbDSVMXuGR
         7D+jZPUfzbSoBt77De0gD6WjMDA5N64/6EgjY16694eHJ1oNyDGZlC2jU7fD9KrrnhM9
         KHzaaaT+da49MDKCEZDrLz7ulbS8/gmsAhEEGJNDyRrKINMsAmuavctzqCV6f7UGaTFS
         kFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSFcPHbwPU7VuQqTvb7CRygx4qEQJSCX4opQ3eOpE/E=;
        b=DlQ0/OUo3+ep/e3TjMA2xTXg4E5cN5MsK3wE2sJgZUFp9zaaPOylIs8KQP215FHt5Q
         CLwDjjztxsYWxWxRd+bSIE9IEArUnHV8UjXaZXaHhtlrUJMnd+lsn6BHM88gO5URU8jm
         YfyNNXhs4gIwkOCFaUDIrs5wNvVXNZG7LF6sjjgw4rrOtAiTzKXXQLALGTf2GGT355VK
         I/Idv1bx/jNFSKLsdfDZG/beEVzzBRp8xiXhyzBzjYnyI9CHMxZOPih45Bp+sIx69skN
         BV4BjCIl6B/WUBO28dkLkUo8xoDCvetXzcSJgVQcfvr0PmaczbYdD/AxyuaJQPNRzYYQ
         uztQ==
X-Gm-Message-State: AFqh2kplOg/HE+z6/AlT9CKBxvljck5Iiq/lzIKlnuGENUHYYNmOmj2Y
	TMb/LE8puHZvyOQKlO77NDYxO6i8Q1vbGM4fU7RkUQ==
X-Google-Smtp-Source: AMrXdXtN2czWy7s7z6riYeL+TaWTkUjkEXdbo5Qe/e5v9zxAXm+Abj+Br8dn7RO1A0aNN2qhpP5AND12ti3Cn4146c8=
X-Received: by 2002:a92:c5c6:0:b0:30c:877:db26 with SMTP id
 s6-20020a92c5c6000000b0030c0877db26mr453316ilt.101.1673985097438; Tue, 17 Jan
 2023 11:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-33-surenb@google.com>
In-Reply-To: <20230109205336.3665937-33-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 20:51:01 +0100
Message-ID: <CAG48ez0Z-wnBLzCNDHgTviV0Ws+s4grX-sFRZ-43dxhJg+GzfA@mail.gmail.com>
Subject: Re: [PATCH 32/41] mm: prevent userfaults to be handled under per-vma lock
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
> handling under VMA lock and retry holding mmap_lock. This can be handled
> more gracefully in the future.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Suggested-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/memory.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 20806bc8b4eb..12508f4d845a 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5273,6 +5273,13 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
>         if (!vma->anon_vma)
>                 goto inval;
>
> +       /*
> +        * Due to the possibility of userfault handler dropping mmap_lock, avoid
> +        * it for now and fall back to page fault handling under mmap_lock.
> +        */
> +       if (userfaultfd_armed(vma))
> +               goto inval;

This looks racy wrt concurrent userfaultfd_register(). I think you'll
want to do the userfaultfd_armed(vma) check _after_ locking the VMA,
and ensure that the userfaultfd code write-locks the VMA before
changing the __VM_UFFD_FLAGS in vma->vm_flags.

>         if (!vma_read_trylock(vma))
>                 goto inval;
>
> --
> 2.39.0
>
