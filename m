Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AC67C1FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2MZy3Zlnz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 11:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MtM+z+b2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MtM+z+b2;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2MZ110yyz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:50:15 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 129so355461ybb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 16:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bhyBo7al6IFmy67jCXlva3rHybPAJSM2yEaUOJQ4lY=;
        b=MtM+z+b219UdUN5lbkQzQQnmyWFomgsL3YuR13gv40KQ7Z6imWKFubK5PpZWnKIy3T
         xfC6X4kZcmtmqwVrzMLVgUxUgYbHpPIUqo4GbeLXH2hwmuacvcRxaK5XCk+38ngUpeRm
         OiyHjmJYgqhNUoWa8Y9RQe+riUKMFsHSMhqvggzBKD7a+b+ApUk4a2ktz0CFkfxjg4XO
         vA75Cr2KDO+xZ7pA2CHHDwW2Dl6J1NE5oBEaYoKraasDQ97TyKgvjajRCl0m6zIxunOG
         97NpIrOCHzHlpx/Qpmmt3dZ0d2w5grPaoLPoSzhBYi81S8YO0KrVcyJiqVyCY35hmVWz
         Uhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bhyBo7al6IFmy67jCXlva3rHybPAJSM2yEaUOJQ4lY=;
        b=imXe0cRYoeffnEUBPtvhx8nUahj6y09SNxy2PHDZrW9UDXSSj53/WVjV2oz7phiM6l
         Kse95BBYfQkpoGu3eMtm1no2VTpTT2T3lTbepGYyE3zqixBn6DhDowqfV4chjC8XP/WO
         Y0NUu7LjqJRkp7A38n/U6+93zqOq37OkTEwttkG3+As9jl1oCHmF0FPmwuV889XSJ8RT
         gjStp8Bd74gvZvKLqYxKd4JORTeyOX/qLz3SjCc0+xtDf2+OC2C4VXCg98wUIpw938hA
         8/MkKWw4uhR/lHaDrbl+EEYCNt4NQ+B5BGVkGrJk2f3Vb24jkS5hgUruP5/EuW4HxFpf
         8VHg==
X-Gm-Message-State: AFqh2krN2BpVsWXWJphoYX3Lo19iu/DN/F0TNxzNEUxSBDmTlMYPMMAe
	+8En8X3u6MbpsiefhZqw9d+/Xdj8Z4BV8/0qCpRTAg==
X-Google-Smtp-Source: AMrXdXvTA5PhW5zsIFLrGos4xAsLGsOemtNo62tdUEyPmQhzs2vfsnov8+FaF7brmdc4+MYKWjG1pVrfUgIsQlq4xVw=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr3047541ybo.380.1674694213026; Wed, 25
 Jan 2023 16:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
In-Reply-To: <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 16:50:01 -0800
Message-ID: <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > errors when we add a const modifier to vma->vm_flags.
> >
> > ...
> >
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> >                * orig->shared.rb may be modified concurrently, but the clone
> >                * will be reinitialized.
> >                */
> > -             *new = data_race(*orig);
> > +             memcpy(new, orig, sizeof(*new));
>
> The data_race() removal is unchangelogged?

True. I'll add a note in the changelog about that. Ideally I would
like to preserve it but I could not find a way to do that.

>
> >               INIT_LIST_HEAD(&new->anon_vma_chain);
> >               dup_anon_vma_name(orig, new);
> >       }
>
