Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4667CA5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 13:00:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2fRY21wsz3fFt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 23:00:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=techsingularity.net (client-ip=46.22.136.244; helo=outbound-smtp60.blacknight.com; envelope-from=mgorman@techsingularity.net; receiver=<UNKNOWN>)
X-Greylist: delayed 452 seconds by postgrey-1.36 at boromir; Thu, 26 Jan 2023 23:00:10 AEDT
Received: from outbound-smtp60.blacknight.com (outbound-smtp60.blacknight.com [46.22.136.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2fQy0FW9z3fBf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 23:00:09 +1100 (AEDT)
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
	by outbound-smtp60.blacknight.com (Postfix) with ESMTPS id 6B9C5FAAF2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:52:29 +0000 (GMT)
Received: (qmail 32236 invoked from network); 26 Jan 2023 11:52:28 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.198.246])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Jan 2023 11:52:28 -0000
Date: Thu, 26 Jan 2023 11:52:24 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
Message-ID: <20230126115224.3urhskf35eomk7xl@techsingularity.net>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
 <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
 <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, linuxppc-dev@lists.
 ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 05:34:49PM -0800, Andrew Morton wrote:
> On Wed, 25 Jan 2023 16:50:01 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > > > errors when we add a const modifier to vma->vm_flags.
> > > >
> > > > ...
> > > >
> > > > --- a/kernel/fork.c
> > > > +++ b/kernel/fork.c
> > > > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > > >                * orig->shared.rb may be modified concurrently, but the clone
> > > >                * will be reinitialized.
> > > >                */
> > > > -             *new = data_race(*orig);
> > > > +             memcpy(new, orig, sizeof(*new));
> > >
> > > The data_race() removal is unchangelogged?
> > 
> > True. I'll add a note in the changelog about that. Ideally I would
> > like to preserve it but I could not find a way to do that.
> > 
> 
> Perhaps Paul can comment?
> 
> I wonder if KCSAN knows how to detect this race, given that it's now in
> a memcpy.  I assume so.

data_race() is just wrapping an expression around
__kcsan_[en|dis]able_current and ensuring the expression is evaluated once
and returning the correct type. I believe the following should be sufficient.

diff --git a/kernel/fork.c b/kernel/fork.c
index 9f7fe3541897..1b30ee568e02 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -472,7 +472,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
 		 * orig->shared.rb may be modified concurrently, but the clone
 		 * will be reinitialized.
 		 */
-		*new = data_race(*orig);
+		data_race(memcpy(new, orig, sizeof(*new)));
 		INIT_LIST_HEAD(&new->anon_vma_chain);
 		dup_anon_vma_name(orig, new);
 	}

I don't see how memcpy could automagically figure out whether the memcpy
is prone to races or not in an arbitrary context.

Assuming using data_race this way is ok then

Acked-by: Mel Gorman <mgorman@techsingularity.net>

-- 
Mel Gorman
SUSE Labs
