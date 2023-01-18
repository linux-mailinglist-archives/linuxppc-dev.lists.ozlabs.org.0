Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B5671813
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxgnm14pTz3fBS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:44:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oQppwSHR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=oQppwSHR;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxgms0s1Nz3bM7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:43:24 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 858B02107A;
	Wed, 18 Jan 2023 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674035001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xwj2L+9GHMXRMvC0PXKAy4Vi7OOq14XSvOdqanVYA8Y=;
	b=oQppwSHRZn9nA7psyaLGFQs/n7yu4DC1JHVfljgHkXtLq+DOkvXYVpC0pxpoUjYBm0HTcS
	BkONlwtTDH8AHIFUQOLXiSJJ2S7HX+NBVrdprdVQ79j6ABRRpBWxtQ58jldQ8maq5weOoW
	FQcHNE9i90gdNQSHN34UWvlnl2fB3Is=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5923C139D2;
	Wed, 18 Jan 2023 09:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eEGoFDm/x2OYPwAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 18 Jan 2023 09:43:21 +0000
Date: Wed, 18 Jan 2023 10:43:19 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 26/41] kernel/fork: assert no VMA readers during its
 destruction
Message-ID: <Y8e/N1m+YGFmxy+L@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-27-surenb@google.com>
 <Y8bB3TFLQV2HJZQ+@dhcp22.suse.cz>
 <CAJuCfpH8-wNiPXQcS=0j-Ex7iMqoBkUhjSN8QiAvq6FdXudRGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpH8-wNiPXQcS=0j-Ex7iMqoBkUhjSN8QiAvq6FdXudRGQ@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-01-23 17:53:00, Suren Baghdasaryan wrote:
> On Tue, Jan 17, 2023 at 7:42 AM 'Michal Hocko' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > On Mon 09-01-23 12:53:21, Suren Baghdasaryan wrote:
> > > Assert there are no holders of VMA lock for reading when it is about to be
> > > destroyed.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  include/linux/mm.h | 8 ++++++++
> > >  kernel/fork.c      | 2 ++
> > >  2 files changed, 10 insertions(+)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 594e835bad9c..c464fc8a514c 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -680,6 +680,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > >       VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
> > >  }
> > >
> > > +static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> > > +{
> > > +     VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
> > > +                   vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
> > > +                   vma);
> >
> > Do we really need to check for vm_lock_seq? rwsem_is_locked should tell
> > us something is wrong on its own, no? This could be somebody racing with
> > the vma destruction and using the write lock. Unlikely but I do not see
> > why to narrow debugging scope.
> 
> I wanted to ensure there are no page fault handlers (read-lockers)
> when we are destroying the VMA and rwsem_is_locked(&vma->lock) alone
> could trigger if someone is concurrently calling vma_write_lock(). But
> I don't think we expect someone to be write-locking the VMA while we

That would be UAF, no?

> are destroying it, so you are right, I'm overcomplicating things here.
> I think I can get rid of vma_assert_no_reader() and add
> VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock)) directly in
> __vm_area_free(). WDYT?

Yes, that adds some debugging. Not sure it is really necessary buyt it
is VM_BUG_ON so why not.
-- 
Michal Hocko
SUSE Labs
