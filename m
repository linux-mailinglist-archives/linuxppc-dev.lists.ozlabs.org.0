Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31091678665
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 20:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P10cH0YFnz3cCW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:32:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EzNI5XQF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EzNI5XQF;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P10bJ1Rs7z2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 06:31:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m/podwHds7JxQLCbcR8/xZsYC7Zym4+9Li/7t1BsGAU=; b=EzNI5XQFHCKDI4RmxwK5H85qS0
	6UAEG1u2YhqEZ87tlBlzCqJnVMUhWcWNWEIKOR/n5FWz2FECNBJSBX0T8LiwDOfVkvDYHlmiaPbxA
	4I/NbsDKV69v/QZwp9chVKa6zvOlWvAcU51xz5THZAKzOW/kh/weKydSwnigbjDrrWctKg42H6QPk
	b1fzz6huv7hyG/nqC1cXlZD4V7JGafLOwoac5ND3ZEtCCpvvv3o0wmwA1NBTWfWCQfT97un1xUw+c
	wkk8l8Ds+GtkptnTWKsm5oeLn7+gHZ3CXmNzIXOxvw9rV/pPUz82oqXeKmYZVB9H5pLDaFgnSfOVz
	eCAQhGqg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK2Wh-004TK7-Jr; Mon, 23 Jan 2023 19:30:43 +0000
Date: Mon, 23 Jan 2023 19:30:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <Y87gY7fhi5OJ35WQ@casper.infradead.org>
References: <Y8rQNj5dVyuxRBOf@casper.infradead.org>
 <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz>
 <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz>
 <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz>
 <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
 <Y87QjHH2aDG5XCGv@casper.infradead.org>
 <Y87djZwQpXazRd00@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87djZwQpXazRd00@dhcp22.suse.cz>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin
 @google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 08:18:37PM +0100, Michal Hocko wrote:
> On Mon 23-01-23 18:23:08, Matthew Wilcox wrote:
> > On Mon, Jan 23, 2023 at 09:46:20AM -0800, Suren Baghdasaryan wrote:
> [...]
> > > Yes, batching the vmas into a list and draining it in remove_mt() and
> > > exit_mmap() as you suggested makes sense to me and is quite simple.
> > > Let's do that if nobody has objections.
> > 
> > I object.  We *know* nobody has a reference to any of the VMAs because
> > you have to have a refcount on the mm before you can get a reference
> > to a VMA.  If Michal is saying that somebody could do:
> > 
> > 	mmget(mm);
> > 	vma = find_vma(mm);
> > 	lock_vma(vma);
> > 	mmput(mm);
> > 	vma->a = b;
> > 	unlock_vma(mm, vma);
> > 
> > then that's something we'd catch in review -- you obviously can't use
> > the mm after you've dropped your reference to it.
> 
> I am not claiming this is possible now. I do not think we want to have
> something like that in the future either but that is really hard to
> envision. I am claiming that it is subtle and potentially error prone to
> have two different ways of mass vma freeing wrt. locking. Also, don't we
> have a very similar situation during last munmaps?

We shouldn't have two ways of mass VMA freeing.  Nobody's suggesting that.
There are two cases; there's munmap(), which typically frees a single
VMA (yes, theoretically, you can free hundreds of VMAs with a single
call which spans multiple VMAs, but in practice that doesn't happen),
and there's exit_mmap() which happens on exec() and exit().

For the munmap() case, just RCU-free each one individually.  For the
exit_mmap() case, there's no need to use RCU because nobody should still
have a VMA pointer after calling mmdrop() [1]

[1] Sorry, the above example should have been mmgrab()/mmdrop(), not
mmget()/mmput(); you're not allowed to look at the VMA list with an
mmget(), you need to have grabbed.
