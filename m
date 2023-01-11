Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEA666208
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsZcz5dDhz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m3BZA3J4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m3BZA3J4;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsZc16sbzz306Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:36:32 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id t15so15803462ybq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQuivU7tA0j3DaNAmzqNs9rVsYSc4Mupj7zmuVm1L2o=;
        b=m3BZA3J4ZDneq6BFTfRM2gL1L4TzJkzZOzLkrvkS58q1KA44AHRGMd50Xie04FdSP5
         ojeEczPNFUxQ8YDewDrL6S+zSFr+J7b3WSZR6SU4R/rQUW5w74iF88c+IGSasO7abH6x
         kifnVki9SZyc566UQCoj/h1X1S6XVKHiRSX+hJNcIcjOUfGQyg0AAlE1S431lzUcReH9
         pnlPtplxp3n3x6AHBNd/qXxJZB1e58S2YVcFpCH5c2ODpBlgO9Js9SsygmS+jmKpjcNF
         dpG26zkfpK05TRuZ7K9wuE+i/35iSDZLI/+icLhqN/LeSRAY13ir4w4LZ2tyGVeyUPRp
         9Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQuivU7tA0j3DaNAmzqNs9rVsYSc4Mupj7zmuVm1L2o=;
        b=MBuh1X+2iFE3E/nUExlyCwDBK29oGcnfLRul+gaFkXI82KgrxEhjtlYgWqo7hh5uAw
         niWEbB2hO62isHQ7Xji0F8c1WkVBCa5C7rt05Id1RCfOT99OSv1ta3SW/Na4VPP9Z/7g
         M+vyFj+MwY261PCJTOWWgtSDxSdcuMneD6tg8rfdBJe0eQXbSsjOIjuegp1c63+RdAup
         3BUpL6c5KuiFtig2dsYq/4ggOlndylIGchidyuxvCZ+P8aFQIFLGA0O4e3Dpi5A+MkCk
         F9OBlBTEDcFAOPBkZNOxs2VeLrPBcfq50F3x5DSqFYzSyNUgNu+ARXGKDiHjphJ32lSN
         WV6A==
X-Gm-Message-State: AFqh2kqF5dfqR9G8yFSIkaf89eB90KoRaoyJuKyokN0Em80Lo5Ek7Psd
	n4DCF1khevTc4/3un0KJyox3iKCfHlbVB947jFE73Q==
X-Google-Smtp-Source: AMrXdXvUZO0oM/+ykiDhNfUl4bBGqtkVrKxNyHSrFtssvMPCUccoMfbmVDu1oZYeiMvYzVTpl4K2ounvf7p9BcdvbV8=
X-Received: by 2002:a25:1388:0:b0:7b8:6d00:ef23 with SMTP id
 130-20020a251388000000b007b86d00ef23mr2139487ybt.119.1673458589236; Wed, 11
 Jan 2023 09:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-14-surenb@google.com>
 <20230111154726.stadwtzicabwh5u5@offworld>
In-Reply-To: <20230111154726.stadwtzicabwh5u5@offworld>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 09:36:18 -0800
Message-ID: <CAJuCfpFmO310qoFJr2EKHRavLx87k6tVkHO3-JCE0s4q5g+TCw@mail.gmail.com>
Subject: Re: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, michel@lespinasse.org, 
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, willy@infradead.org, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, laurent.dufour@fr.ibm.com, 
	paulmck@kernel.org, luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, 
	david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com, 
	jannh@google.com, shakeelb@google.com, tatashin@google.com, 
	edumazet@google.com, gthelen@google.com, gurua@google.com, 
	arjunroy@google.com, soheil@google.com, hughlynch@google.com, 
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org, 
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

On Wed, Jan 11, 2023 at 8:13 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
>
> >To keep vma locking correctness when vm_flags are modified, add modifier
> >functions to be used whenever flags are updated.
>
> How about moving this patch and the ones that follow out of this series,
> into a preliminary patchset? It would reduce the amount of noise in the
> per-vma lock changes, which would then only be adding the needed
> vma_write_lock()ing.

How about moving those prerequisite patches to the beginning of the
patchset (before maple_tree RCU changes)? I feel like they do belong
in the patchset because as a standalone patchset it would be unclear
why I'm adding all these accessor functions and introducing this
churn. Would that be acceptable?

>
> Thanks,
> Davidlohr
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
