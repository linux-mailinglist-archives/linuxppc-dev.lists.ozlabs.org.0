Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF967D32B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nlZ3dbNz3fHc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:30:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ilIqDRwk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ilIqDRwk;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2nkg3n1qz3fBf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:29:14 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-501c3a414acso32788607b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gmbLn2mGKjT9Gs0HRiDRhCerJgSSV5gpVvcCzntQ7Y=;
        b=ilIqDRwk14c77kuNcIb1Za5yA/k9MlZMjOIAG7xgew/iubgJyrG32CmDPzNNMjKVU1
         0cjAh7/cDiMlBWp7hNnSIwd1PXFNxdlppAGUU7j/d06/fdITUN8na+bPZl4T4FsheJPZ
         LWsxwR1YcK+FWW2DBQwr6IyKjvLWxbTIMc17+Fd+yndb2sMV2vZnytDbpPDmoBXRB4F7
         rleLMvYF/2o2GY6lzSau23qOOMOaf7bdkBeK/sWqCfupZvXUJjT0ZY7RKqeTong9fCDN
         p4I/CcH8n+tGdongz6ryxejse0aGlrrtzoVh6FNqLByFg1N9TkDnjINbfSncpK90ozHN
         RLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gmbLn2mGKjT9Gs0HRiDRhCerJgSSV5gpVvcCzntQ7Y=;
        b=4cEnCyFBEFPPo+RcFqb/bI1NiAYH4d35ZHFRskHrnq81fPvu5oUX5WnCKWWPFFNgfx
         iP59mAk9xc93LYCPo7PiwmLxPHZqlkNS2x6Vd/SSqVwUjghlgBicee88BhniPuSrReij
         lc/mJcCxusaAkpy73ILXtKiVSOEj+uHO7sxMoYGbGva8Cekbi9p+3EKfuR6M6kWEC6wH
         BhOSeNeAB6o02EniAXsaRjpawSC0KD6V1a6N4yO1AsKDIRPrDCCqBeAgItymVn8P7DIZ
         E9puhCmlFxzTGfjwW00WxSZjfvmfNIkD+Duri3bFeHQUvQ5LEfzo9CSBngRAOsu2e1cg
         UKoQ==
X-Gm-Message-State: AFqh2kqDqPwg5+Bcgz5CWmjnP8ln/G6qknXMMBNSI7vEuMgcmThm+Ms6
	Pv0dn3JFt3qOEFHWM0f+wDwjYHqlzEmQy//hpaOq3w==
X-Google-Smtp-Source: AMrXdXs8M6k6K1NpNfukVCVayvEghbuYahYf046uox5fJ76us0EUsA9otKxgNw134ACA+9mbXdAwd6mqx9pXaEYbxgI=
X-Received: by 2002:a81:1d2:0:b0:433:f1c0:3f1c with SMTP id
 201-20020a8101d2000000b00433f1c03f1cmr5000022ywb.438.1674754150775; Thu, 26
 Jan 2023 09:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-5-surenb@google.com>
 <20230126151015.ru2m26jkhwib6x6u@techsingularity.net> <CAJuCfpEzAbpy9rZ5KeZXQsqFTPOGYv6CZQfP9SHqcqFi0s7neg@mail.gmail.com>
 <20230126172657.bmga5hy74ifsbhun@techsingularity.net>
In-Reply-To: <20230126172657.bmga5hy74ifsbhun@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 09:28:59 -0800
Message-ID: <CAJuCfpGfH9y5NYCBtM=s0uZ5DfRbtLHP=qQHqhahSiUPLEZNgg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 9:27 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Thu, Jan 26, 2023 at 08:10:26AM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 26, 2023 at 7:10 AM Mel Gorman <mgorman@techsingularity.net> wrote:
> > >
> > > On Wed, Jan 25, 2023 at 03:35:51PM -0800, Suren Baghdasaryan wrote:
> > > > Replace direct modifications to vma->vm_flags with calls to modifier
> > > > functions to be able to track flag changes and to keep vma locking
> > > > correctness.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Acked-by: Michal Hocko <mhocko@suse.com>
> > >
> > > Acked-by: Mel Gorman <mgorman@techsingularity.net>
> > >
> > > Minor comments that are safe to ignore.
> > >
> > > I think a better name for mod_vm_flags is set_clear_vm_flags to hint that
> > > the first flags are to be set and the second flags are to be cleared.
> > > For this patch, it doesn't matter, but it might avoid accidental swapping
> > > in the future.
> > >
> > > reset_vm_flags might also be better named as reinit_vma_flags (or
> > > vma_flags_reinit). Maybe also encourage the use of [set|clear_mod]_vm_flags
> > > where possible in the comment to track exactly what is changing and
> > > why. Some cases like userfaultfd just want to clear __VM_UFFD_FLAGS but
> > > altering the flow in this patch is inappropriate and error prone. Others
> > > such as the infiniband changes and madvise are a lot more complex.
> >
> > That's a good point, but I don't want people to use mod_vm_flags() for
> > the cases when the order of set/clear really matters. In such cases
> > set_vm_flags() and clear_vm_flags() should be explicitly used. Maybe
> > to make that clear I should add a comment and rewrite the functions
> > as:
> >
> > void mod_vm_flags(vma, set, clear) {
> >     vma.vm_flags = vma.vm_flags | set & clear;
> > }
> >
>
> Offhand, I'm not thinking of a case where that really matters and as they
> are not necessarily ordered, it's raising a read flag so yes, it definitely
> it needs a comment if the ordering matters.
>
> > In this patchset it's not that obvious but mod_vm_flags() was really
> > introduced in the original per-VMA lock patchset for efficiency to
> > avoid taking extra per-VMA locks. A combo of
> > set_vm_flags()+clear_vm_flags() would try to retake the same per-VMA
> > lock in the second call while mod_vm_flags() takes the lock only once
> > and does both operations.
>
> Ok, that seems fair but still needs a comment on why a mod_vm_flags is
> not necessarily equivalent to a set_vm_flags + clear_vm_flags in terms of
> correctness if that is indeed the case.
>
> > Not a huge overhead because we check if the
> > lock is already taken and bail out early but still...
> > So, would the above modification to mod_vm_flags() address your concern?
> >
>
> My concerns are entirely with the callers, not the implementation. If
> someone is modifying a call site using mod_vm_flags, they have to read
> through all the preceding logic to ensure the final combination of flags
> is valid.  It's a code maintenance issue, not a correctness issue.

Got it. I'll modify the implementation to make a single assignment and
will add a comment to use only when order doesn't matter.
Thanks!

>
> --
> Mel Gorman
> SUSE Labs
