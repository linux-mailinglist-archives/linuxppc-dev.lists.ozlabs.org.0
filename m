Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A45AF674FDA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 09:53:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NytZR3NYDz3bVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:53:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rVOftAen;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rVOftAen;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NytYW4fXFz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 19:52:46 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4440228BD;
	Fri, 20 Jan 2023 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674204763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NPjXf88ZU8FVuBa4GWfXY3q6lH6kqoJUTnCqbetZU5Y=;
	b=rVOftAenNnA8PiL17Z4Pvgxr3PGI5zIZDNJZhTWOuwjNH7ZF8duaDITjsCCPVYUUl+4mAF
	SsZLXg+YuWZWmpQYKnBigdv+oOwpwP8b3sMrIOZpOAVevFZTdzxUdshJBulqHxA0CeorJN
	JV/cNcPxjm+c/YD6MkjUZzLm2MN4Cno=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B24EA13251;
	Fri, 20 Jan 2023 08:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hsl6K1tWymP+HQAAMHmgww
	(envelope-from <mhocko@suse.com>); Fri, 20 Jan 2023 08:52:43 +0000
Date: Fri, 20 Jan 2023 09:52:43 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
 <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
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

On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > call_rcu() can take a long time when callback offloading is enabled.
> > > Its use in the vm_area_free can cause regressions in the exit path when
> > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > a list and free them in groups using one call_rcu() call per group.
> >
> > After some more clarification I can understand how call_rcu might not be
> > super happy about thousands of callbacks to be invoked and I do agree
> > that this is not really optimal.
> >
> > On the other hand I do not like this solution much either.
> > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > much with processes with a huge number of vmas either. It would still be
> > in housands of callbacks to be scheduled without a good reason.
> >
> > Instead, are there any other cases than remove_vma that need this
> > batching? We could easily just link all the vmas into linked list and
> > use a single call_rcu instead, no? This would both simplify the
> > implementation, remove the scaling issue as well and we do not have to
> > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> 
> Yes, I agree the solution is not stellar. I wanted something simple
> but this is probably too simple. OTOH keeping all dead vm_area_structs
> on the list without hooking up a shrinker (additional complexity) does
> not sound too appealing either.

I suspect you have missed my idea. I do not really want to keep the list
around or any shrinker. It is dead simple. Collect all vmas in
remove_vma and then call_rcu the whole list at once after the whole list
(be it from exit_mmap or remove_mt). See?

-- 
Michal Hocko
SUSE Labs
