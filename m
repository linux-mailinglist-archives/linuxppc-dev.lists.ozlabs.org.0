Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDE6A11CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:17:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN5T419VWz3chv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 08:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fOZe/etv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fOZe/etv;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN5S95BfQz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 08:16:41 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-536c02c9dfbso218129287b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndbjrFZ9GSZE0VRCf9RR1AX4PdczliTx2DTBUnXjBAE=;
        b=fOZe/etv+sd4bjNAksYDFrOZg/TXHF0ZFee94D/FMNLSiu1oT3zVfj9vXDPN1OXHfC
         oGpNm/0bUQSCD40wazC4yNQtwIUaBRFGc6ChZr9+zqHL5JCnTHKtfE/y1CKAytTCh8ud
         YgvLztPGCWRwHZnl00ai1khB8xrR3uwMyFgbBw9S3xWwoIbrtPJIq/IsLnmZNQ95q7Aa
         DB4GcBJakRFaW2aeyli9AXrO/MPhf8f0AXph6Di7Wamlw9ozMqaHYvh7IuVETCAVYHF2
         gu2S4EG23EVj9ag0ipdONVOC95C+FrB0EpQCzvxAEO3UkcRHV5DhFjKHRAP66CsyUt+6
         LHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndbjrFZ9GSZE0VRCf9RR1AX4PdczliTx2DTBUnXjBAE=;
        b=rHIjji9uC8oV+6deLatxD7V2tHecf+4l/9smQAKK0XH6pLjjEAfWb7fGjqibOFpnIH
         4QCwd4sY32kqGl/1JKLKafIPSRYR4kUSQizh2Wfxi/tmzR3OWXW3bJx0JgY86AI6efun
         Xy7J74M95HGqHe2qw+b7Ejhefna7BJl4bezjbh/RWybbvjMgh30U9pwWtlfNXsyiLkWO
         Ip1Cxv7QUxc88DVmFK2u7qurjV63kweKAsZf2pN5NqVStG3dota2QpjlPHIBqJXcnoTz
         vWsELhOufMjL4DTeKEO7vAuSfEFG5AcIUKrWYsv+nDfQjjsdnmTqhWGV9QM1kx2Lyo5n
         /aBA==
X-Gm-Message-State: AO0yUKXK3MsV5apq29jVJ8oqSSE0yqJkWt+GE8Y0bEi93SKk/O+b1/K1
	Wp073t0ZJw0HcHDBFlkF5cHSsfQZEkSaHVZuyCerFA==
X-Google-Smtp-Source: AK7set+cwRVt+nMfGVc9n+QUpRmsobXIvsJ4diFjxtv+Lveh827iF3Klb3XyKdd370ajPY2MbPYibo7hGyB9Z9jW5Oc=
X-Received: by 2002:a5b:b07:0:b0:9fe:1493:8b8 with SMTP id z7-20020a5b0b07000000b009fe149308b8mr2486525ybp.6.1677186996282;
 Thu, 23 Feb 2023 13:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-18-surenb@google.com>
 <20230223202011.dahh6cidqxhzoxne@revolver> <20230223202844.noant5suylne3dnh@revolver>
In-Reply-To: <20230223202844.noant5suylne3dnh@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 23 Feb 2023 13:16:25 -0800
Message-ID: <CAJuCfpE3YtSQuXJwOYWKe1z9O4GASS9pA_FTWGkdveHb3bcMXA@mail.gmail.com>
Subject: Re: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	mingo@redhat.com, will@kernel.org, luto@kernel.org, songliubraving@fb.com, 
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	chriscli@google.com, axelrasmussen@google.com, joelaf@google.com, 
	minchan@google.com, rppt@kernel.org, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, leewalsh@google.com, 
	posk@google.com, michalechner92@googlemail.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 12:28 PM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
>
> Wait, I figured a better place to do this.
>
> init_multi_vma_prep() should vma_start_write() on any VMA that is passed
> in.. that we we catch any modifications here & in vma_merge(), which I
> think is missed in this patch set?

Hmm. That looks like a good idea but in that case, why not do the
locking inside vma_prepare() itself? From the description of that
function it sounds like it was designed to acquire locks before VMA
modifications, so would be the ideal location for doing that. WDYT?
The only concern is vma_adjust_trans_huge() being called before
vma_prepare() but I *think* that's safe because
vma_adjust_trans_huge() does its modifications after acquiring PTL
lock, which page fault handlers also have to take. Does that sound
right?

>
>
> * Liam R. Howlett <Liam.Howlett@Oracle.com> [230223 15:20]:
> > Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> >
> > * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > > vma_expand and vma_shrink change VMA boundaries. Expansion might also
> > > result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
> > > concurrent page faults.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  mm/mmap.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index ec2f8d0af280..f079e5bbcd57 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >             ret = dup_anon_vma(vma, next);
> > >             if (ret)
> > >                     return ret;
> > > +
> > > +           /* Lock the VMA  before removing it */
> > > +           vma_start_write(next);
> > >     }
> > >
> > >     init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
> > > @@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >     if (vma_iter_prealloc(vmi))
> > >             goto nomem;
> > >
> > > +   vma_start_write(vma);
> > >     vma_adjust_trans_huge(vma, start, end, 0);
> > >     /* VMA iterator points to previous, so set to start if necessary */
> > >     if (vma_iter_addr(vmi) != start)
> > > @@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > >     if (vma_iter_prealloc(vmi))
> > >             return -ENOMEM;
> > >
> > > +   vma_start_write(vma);
> > >     init_vma_prep(&vp, vma);
> > >     vma_adjust_trans_huge(vma, start, end, 0);
> > >     vma_prepare(&vp);
> > > --
> > > 2.39.1
> > >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
