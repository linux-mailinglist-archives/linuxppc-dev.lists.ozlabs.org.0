Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B967D33E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nqN090Dz3fJK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=techsingularity.net (client-ip=46.22.139.247; helo=outbound-smtp20.blacknight.com; envelope-from=mgorman@techsingularity.net; receiver=<UNKNOWN>)
Received: from outbound-smtp20.blacknight.com (outbound-smtp20.blacknight.com [46.22.139.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2npq4lFxz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:32:51 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp20.blacknight.com (Postfix) with ESMTPS id 2D96C1C37A2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 17:32:47 +0000 (GMT)
Received: (qmail 32726 invoked from network); 26 Jan 2023 17:32:46 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.198.246])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Jan 2023 17:32:46 -0000
Date: Thu, 26 Jan 2023 17:32:45 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 6/7] mm: introduce mod_vm_flags_nolock and use it in
 untrack_pfn
Message-ID: <20230126173245.cf3jcfw5s2a77s5v@techsingularity.net>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-7-surenb@google.com>
 <20230126154740.j3a3lu4x557c56yi@techsingularity.net>
 <CAJuCfpHP6hQAWZr2exZEXOzLbMNU_c9qNNc7pa2NYAhYLe=EKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <CAJuCfpHP6hQAWZr2exZEXOzLbMNU_c9qNNc7pa2NYAhYLe=EKQ@mail.gmail.com>
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

On Thu, Jan 26, 2023 at 08:18:31AM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 26, 2023 at 7:47 AM Mel Gorman <mgorman@techsingularity.net> wrote:
> >
> > On Wed, Jan 25, 2023 at 03:35:53PM -0800, Suren Baghdasaryan wrote:
> > > In cases when VMA flags are modified after VMA was isolated and mmap_lock
> > > was downgraded, flags modifications would result in an assertion because
> > > mmap write lock is not held.
> >
> > Add note that it's also used during exit when the locking of the VMAs
> > becomes irrelevant (mm users is 0, should be no VMA modifications taking
> > place other than zap).
> 
> Ack.
> 
> >
> > The typical naming pattern when a caller either knows it holds the necessary
> > lock or knows it does not matter is __mod_vm_flags()
> 
> Ok. It sounds less explicit but plenty of examples, so I'm fine with
> such rename. Will apply in the next version.
> 

It might be a personal thing. nolock to me is ambigious because it might
mean "lock is already held", "no lock is necessary" or "no lock is acquired"
where as *for me*, calling foo vs __foo *usually* means "direct callers of
__foo take care of the locking, memory ordering, per-cpu pinning details etc"
depending on the context. Of course, this convention is not universally true.

> > > Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
> > > flags modification and to avoid assertion.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Patch itself looks ok. It strays close to being "conditional locking"
> > though which might attract some complaints.
> 
> The description seems to accurately describe what's done here but I'm
> open to better suggestions.

I don't have alternative suggestions but if someone else reads the patch and
says "this is conditional locking", you can at least claim that someone
else considered "conditional locking" and didn't think it was a major
problem in this specific patch.

-- 
Mel Gorman
SUSE Labs
