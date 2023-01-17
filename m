Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5566E1CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxC8F65ymz2xjw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=vKJK0oUh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=vKJK0oUh;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxC7M0zWtz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 02:12:46 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA6466891D;
	Tue, 17 Jan 2023 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673968362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5NTI5PSLTfCDe6gQVpoy+iwpEywbgMbai5Jcy4OtFUQ=;
	b=vKJK0oUhU26xmRrTy9EJrTe/vSwWuUEHbdOXYccjfeTnTiR5NwQ2XMngZr63M/b1WVe2AX
	juTB2Dy3SsizgKPcu0nnUM13rX04ilIO9rd02mk5W48x9S7RhqDjCVVmrzVsQbp6PCDA5l
	o7gyTFLzV7Fd2V2UwjRPwAw3AmeEGos=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE7761390C;
	Tue, 17 Jan 2023 15:12:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HSTwLeq6xmOPQwAAMHmgww
	(envelope-from <mhocko@suse.com>); Tue, 17 Jan 2023 15:12:42 +0000
Date: Tue, 17 Jan 2023 16:12:42 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
 <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz>
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

On Tue 17-01-23 16:04:26, Michal Hocko wrote:
> On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > instead of mmap_lock. Because there are cases when multiple VMAs need
> > to be exclusively locked during VMA tree modifications, instead of the
> > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > locked.
> 
> I have to say I was struggling a bit with the above and only understood
> what you mean by reading the patch several times. I would phrase it like
> this (feel free to use if you consider this to be an improvement).
> 
> Introduce a per-VMA rw_semaphore. The lock implementation relies on a
> per-vma and per-mm sequence counters to note exclusive locking:
>         - read lock - (implemented by vma_read_trylock) requires the the
>           vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
>           differ. If they match then there must be a vma exclusive lock
>           held somewhere.
>         - read unlock - (implemented by vma_read_unlock) is a trivial
>           vma->lock unlock.
>         - write lock - (vma_write_lock) requires the mmap_lock to be
>           held exclusively and the current mm counter is noted to the vma
>           side. This will allow multiple vmas to be locked under a single
>           mmap_lock write lock (e.g. during vma merging). The vma counter
>           is modified under exclusive vma lock.

Didn't realize one more thing.
	    Unlike standard write lock this implementation allows to be
	    called multiple times under a single mmap_lock. In a sense
	    it is more of mark_vma_potentially_modified than a lock.

>         - write unlock - (vma_write_unlock_mm) is a batch release of all
>           vma locks held. It doesn't pair with a specific
>           vma_write_lock! It is done before exclusive mmap_lock is
>           released by incrementing mm sequence counter (mm_lock_seq).
> 	- write downgrade - if the mmap_lock is downgraded to the read
> 	  lock all vma write locks are released as well (effectivelly
> 	  same as write unlock).
-- 
Michal Hocko
SUSE Labs
