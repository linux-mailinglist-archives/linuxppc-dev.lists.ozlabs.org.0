Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C018671C92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 13:52:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxlyQ6Stcz3fCr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 23:51:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DhsG3zM8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=DhsG3zM8;
	dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxlxW6L00z3c4x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 23:51:10 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id q130so3394653iod.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7Rqiin9Kbad8ru/LcIchuAOUvYmmUjlYJik2JJBLXA=;
        b=DhsG3zM8wnA8HofZfhQ4706XMhy790XGUqogcXCqHX85Tk8zZYxt5jMYu+eLJpJd0W
         WeZPMkDrbovMJNBWiALe2hNQO8RzVtnNL439Lg2lNDDkCN2JbO2/orikCzbM4nXJ7Ric
         pxfkouKT613poEWiZM0/S3Q0O76EFSePCk6Wx7nVSwD2fTxP6JpqrPF+F0bbjgoXhdSo
         JRONC1h0hiGS5i3GPDsY5q0sJr2GonkT+Yc4S8N+6WB4gZtHvq+jv8OZ5eQyCbLl1GpR
         opC+QyjARoxP8394hD2OHnWQsI8rTlz89//+DOWhBL6cmnhWRNKu2nd1HuPty+PyYUI0
         rVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7Rqiin9Kbad8ru/LcIchuAOUvYmmUjlYJik2JJBLXA=;
        b=0M3m0h7l9Z0x6FB6Qkbq9AC0JU8x/oPqPUukUqWOb7CxULGbz38LE2fkN487u/NikG
         8kVV8L4aekxM1ci12nC4PSKtzZSfdQrgLZhYEwqwY0LngAt0uVQUP0v54Mdb73u/3vmt
         7BrmhKN1DEo3Lq9ZlwPp+MdcOSBCfapfSsa+CphWLaWmfouupvqRfMOoGmbN4Buuoo3G
         wFopk4lNmRzc3iKd+i+rZYyzR/nOPlU0UbPhOp9P71yM55aM04LpLxt3kmLHETK4HzfD
         LgOTdUaAqAmVqJgB7Lj6MSRS4GxReEKdpwWRv4epevmPGdLRlCdspig4/H0oh57/1uCP
         GDjg==
X-Gm-Message-State: AFqh2kqlMEOz1qgqZVuSJCKhywQmddeiYv0UyT+nL05M3w6f0C59ZWUW
	g1Hd9olOPCJPBgjAdXc044IFCtc3BQsj9Q2tL6iw7Q==
X-Google-Smtp-Source: AMrXdXubEhuDA02ILCkh7B1Dp3y4Bt1fmHskBAwMDp3qrJV2IDmWe32RqObGG2ZP8z4nawtc1f2Tp/05rwFtfOAFxMY=
X-Received: by 2002:a02:c884:0:b0:39e:9d33:a47 with SMTP id
 m4-20020a02c884000000b0039e9d330a47mr496380jao.58.1674046267428; Wed, 18 Jan
 2023 04:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-28-surenb@google.com>
In-Reply-To: <20230109205336.3665937-28-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Jan 2023 13:50:31 +0100
Message-ID: <CAG48ez3EAai=1ghnCMF6xcgUebQRm-u2xhwcpYsfP9=r=oVXig@mail.gmail.com>
Subject: Re: [PATCH 27/41] mm/mmap: prevent pagefault handler from racing with
 mmu_notifier registration
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

On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Page fault handlers might need to fire MMU notifications while a new
> notifier is being registered. Modify mm_take_all_locks to write-lock all
> VMAs and prevent this race with fault handlers that would hold VMA locks.
> VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
> locking order as in page fault handlers.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 30c7d1c5206e..a256deca0bc0 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3566,6 +3566,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
>   * of mm/rmap.c:
>   *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
>   *     hugetlb mapping);
> + *   - all vmas marked locked

The existing comment above says that this is an *ordered* listing of
which locks are taken.

>   *   - all i_mmap_rwsem locks;
>   *   - all anon_vma->rwseml
>   *
> @@ -3591,6 +3592,7 @@ int mm_take_all_locks(struct mm_struct *mm)
>         mas_for_each(&mas, vma, ULONG_MAX) {
>                 if (signal_pending(current))
>                         goto out_unlock;
> +               vma_write_lock(vma);
>                 if (vma->vm_file && vma->vm_file->f_mapping &&
>                                 is_vm_hugetlb_page(vma))
>                         vm_lock_mapping(mm, vma->vm_file->f_mapping);

Note that multiple VMAs can have the same ->f_mapping, so with this,
the lock ordering between VMA locks and the mapping locks of hugetlb
VMAs is mixed: If you have two adjacent hugetlb VMAs with the same
->f_mapping, then the following operations happen:

1. lock VMA 1
2. lock mapping of VMAs 1 and 2
3. lock VMA 2
4. [second vm_lock_mapping() is a no-op]

So for VMA 1, we ended up taking the VMA lock first, but for VMA 2, we
took the mapping lock first.

The existing code has one loop per lock type to ensure that the locks
really are taken in the specified order, even when some of the locks
are associated with multiple VMAs.

If we don't care about the ordering between these two, maybe that's
fine and you just have to adjust the comment; but it would be clearer
to add a separate loop for the VMA locks.

> @@ -3677,6 +3679,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
>                 if (vma->vm_file && vma->vm_file->f_mapping)
>                         vm_unlock_mapping(vma->vm_file->f_mapping);
>         }
> +       vma_write_unlock_mm(mm);
>
>         mutex_unlock(&mm_all_locks_mutex);
>  }
> --
> 2.39.0
>
