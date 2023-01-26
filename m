Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB067D324
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:27:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nhq1nr8z3fH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=techsingularity.net (client-ip=81.17.249.41; helo=outbound-smtp21.blacknight.com; envelope-from=mgorman@techsingularity.net; receiver=<UNKNOWN>)
Received: from outbound-smtp21.blacknight.com (outbound-smtp21.blacknight.com [81.17.249.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2nhF2C9hz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:27:07 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp21.blacknight.com (Postfix) with ESMTPS id 060CBCCB31
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 17:27:02 +0000 (GMT)
Received: (qmail 17492 invoked from network); 26 Jan 2023 17:27:01 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.198.246])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Jan 2023 17:27:01 -0000
Date: Thu, 26 Jan 2023 17:26:57 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-ID: <20230126172657.bmga5hy74ifsbhun@techsingularity.net>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-5-surenb@google.com>
 <20230126151015.ru2m26jkhwib6x6u@techsingularity.net>
 <CAJuCfpEzAbpy9rZ5KeZXQsqFTPOGYv6CZQfP9SHqcqFi0s7neg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <CAJuCfpEzAbpy9rZ5KeZXQsqFTPOGYv6CZQfP9SHqcqFi0s7neg@mail.gmail.com>
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

On Thu, Jan 26, 2023 at 08:10:26AM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 26, 2023 at 7:10 AM Mel Gorman <mgorman@techsingularity.net> wrote:
> >
> > On Wed, Jan 25, 2023 at 03:35:51PM -0800, Suren Baghdasaryan wrote:
> > > Replace direct modifications to vma->vm_flags with calls to modifier
> > > functions to be able to track flag changes and to keep vma locking
> > > correctness.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Acked-by: Michal Hocko <mhocko@suse.com>
> >
> > Acked-by: Mel Gorman <mgorman@techsingularity.net>
> >
> > Minor comments that are safe to ignore.
> >
> > I think a better name for mod_vm_flags is set_clear_vm_flags to hint that
> > the first flags are to be set and the second flags are to be cleared.
> > For this patch, it doesn't matter, but it might avoid accidental swapping
> > in the future.
> >
> > reset_vm_flags might also be better named as reinit_vma_flags (or
> > vma_flags_reinit). Maybe also encourage the use of [set|clear_mod]_vm_flags
> > where possible in the comment to track exactly what is changing and
> > why. Some cases like userfaultfd just want to clear __VM_UFFD_FLAGS but
> > altering the flow in this patch is inappropriate and error prone. Others
> > such as the infiniband changes and madvise are a lot more complex.
> 
> That's a good point, but I don't want people to use mod_vm_flags() for
> the cases when the order of set/clear really matters. In such cases
> set_vm_flags() and clear_vm_flags() should be explicitly used. Maybe
> to make that clear I should add a comment and rewrite the functions
> as:
> 
> void mod_vm_flags(vma, set, clear) {
>     vma.vm_flags = vma.vm_flags | set & clear;
> }
> 

Offhand, I'm not thinking of a case where that really matters and as they
are not necessarily ordered, it's raising a read flag so yes, it definitely
it needs a comment if the ordering matters.

> In this patchset it's not that obvious but mod_vm_flags() was really
> introduced in the original per-VMA lock patchset for efficiency to
> avoid taking extra per-VMA locks. A combo of
> set_vm_flags()+clear_vm_flags() would try to retake the same per-VMA
> lock in the second call while mod_vm_flags() takes the lock only once
> and does both operations.

Ok, that seems fair but still needs a comment on why a mod_vm_flags is
not necessarily equivalent to a set_vm_flags + clear_vm_flags in terms of
correctness if that is indeed the case.

> Not a huge overhead because we check if the
> lock is already taken and bail out early but still...
> So, would the above modification to mod_vm_flags() address your concern?
> 

My concerns are entirely with the callers, not the implementation. If
someone is modifying a call site using mod_vm_flags, they have to read
through all the preceding logic to ensure the final combination of flags
is valid.  It's a code maintenance issue, not a correctness issue.

-- 
Mel Gorman
SUSE Labs
