Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A567C54F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 09:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Y6Y71S4z3fDx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 19:00:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qTWifsp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qTWifsp9;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Y5f1xs7z3cfh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 18:59:48 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 702451FEC1;
	Thu, 26 Jan 2023 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674719984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8phw8z9lSY7iQJCq6VYkn4UUEHCEZ7ZXKi1c7gTwrM4=;
	b=qTWifsp9kR6tUF5RbmZkPrFSDZSuoNzYFU4i42xM+2e0bl32CICy762Ehn1A7cN9EuqmJ0
	AZkmevMfJIwKOy1HC8U/GL4eP9OHTN67Q3TI95rlLJfzptW0842juEEEyO6mRIlygvAJd6
	Y1BtkkMiEmx1HmgPqlW1Wt0jsVYn2mI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42F671358A;
	Thu, 26 Jan 2023 07:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rFjmD/Ay0mMFJwAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 26 Jan 2023 07:59:44 +0000
Date: Thu, 26 Jan 2023 08:59:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 2/7] mm: introduce vma->vm_flags wrapper functions
Message-ID: <Y9Iy7zhJsaHCzdF/@dhcp22.suse.cz>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-3-surenb@google.com>
 <20230125162810.ec222773d13cd26c55991fde@linux-foundation.org>
 <CAJuCfpFWTNpz7LB+931Gc+yYwBq3-y+_doH2WdtjhTGnxLxvig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpFWTNpz7LB+931Gc+yYwBq3-y+_doH2WdtjhTGnxLxvig@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, mg
 orman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 25-01-23 16:56:17, Suren Baghdasaryan wrote:
> On Wed, Jan 25, 2023 at 4:28 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 25 Jan 2023 15:35:49 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -491,7 +491,15 @@ struct vm_area_struct {
> > >        * See vmf_insert_mixed_prot() for discussion.
> > >        */
> > >       pgprot_t vm_page_prot;
> > > -     unsigned long vm_flags;         /* Flags, see mm.h. */
> > > +
> > > +     /*
> > > +      * Flags, see mm.h.
> > > +      * To modify use {init|reset|set|clear|mod}_vm_flags() functions.
> > > +      */
> > > +     union {
> > > +             const vm_flags_t vm_flags;
> > > +             vm_flags_t __private __vm_flags;
> > > +     };
> >
> > Typically when making a change like this we'll rename the affected
> > field/variable/function/etc.  This will reliably and deliberately break
> > unconverted usage sites.
> >
> > This const trick will get us partway there, by breaking setters.  But
> > renaming it will break both setters and getters.
> 
> My intent here is to break setters but to allow getters to keep
> reading vma->vm_flags directly. We could provide get_vm_flags() and
> convert all getters as well but it would introduce a huge additional
> churn (800+ hits) with no obvious benefits, I think. Does that clarify
> the intent of this trick?

I think that makes sense at this stage. The conversion patch is quite
large already. Maybe the final renaming could be done on top of
everything and patch generated by coccinele. The const union is a neat
trick but a potential lockdep assert is a nice plus as well. I wouldn't
see it as a top priority though.
-- 
Michal Hocko
SUSE Labs
