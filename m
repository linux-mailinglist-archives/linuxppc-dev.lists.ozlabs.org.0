Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 874666717F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxgk72zDFz3fC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:41:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=XXI0e3SJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=XXI0e3SJ;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxgjD6kJdz3c96
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:40:15 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D418521066;
	Wed, 18 Jan 2023 09:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674034811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qkSsxdGDhi7OFnoEmmEI+/6UTMsWfEo5f5xKht27nUU=;
	b=XXI0e3SJYUfmbTv7Egu/VOj5qe2veVpfQOCo54bZ/6FeH0dQKnz5D55LikQtuGQQuUNqfI
	Gn7IKTKaqjbGrtd1XZzr4g/KpxDTk79Mv+uc0zAiZxKfI8Y788ts0MzsC3fxrwN4O4u8pN
	Wa2w/A2JXRQ13PjgVrmAhrdegohLoFI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9B3F139D2;
	Wed, 18 Jan 2023 09:40:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GwnzKHu+x2MPPgAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 18 Jan 2023 09:40:11 +0000
Date: Wed, 18 Jan 2023 10:40:09 +0100
From: Michal Hocko <mhocko@suse.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 18/41] mm/khugepaged: write-lock VMA while collapsing a
 huge page
Message-ID: <Y8e+efbJ4rw9goF0@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-19-surenb@google.com>
 <Y8a9+ywh65fmuKvv@dhcp22.suse.cz>
 <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgor
 man@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-01-23 21:28:06, Jann Horn wrote:
> On Tue, Jan 17, 2023 at 4:25 PM Michal Hocko <mhocko@suse.com> wrote:
> > On Mon 09-01-23 12:53:13, Suren Baghdasaryan wrote:
> > > Protect VMA from concurrent page fault handler while collapsing a huge
> > > page. Page fault handler needs a stable PMD to use PTL and relies on
> > > per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
> > > set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
> > > not be detected by a page fault handler without proper locking.
> >
> > I am struggling with this changelog. Maybe because my recollection of
> > the THP collapsing subtleties is weak. But aren't you just trying to say
> > that the current #PF handling and THP collapsing need to be mutually
> > exclusive currently so in order to keep that assumption you have mark
> > the vma write locked?
> >
> > Also it is not really clear to me how that handles other vmas which can
> > share the same thp?
> 
> It's not about the hugepage itself, it's about how the THP collapse
> operation frees page tables.
> 
> Before this series, page tables can be walked under any one of the
> mmap lock, the mapping lock, and the anon_vma lock; so when khugepaged
> unlinks and frees page tables, it must ensure that all of those either
> are locked or don't exist. This series adds a fourth lock under which
> page tables can be traversed, and so khugepaged must also lock out that one.
> 
> There is a codepath in khugepaged that iterates through all mappings
> of a file to zap page tables (retract_page_tables()), which locks each
> visited mm with mmap_write_trylock() and now also does
> vma_write_lock().

OK, I see. This would be a great addendum to the changelog.
 
> I think one aspect of this patch that might cause trouble later on, if
> support for non-anonymous VMAs is added, is that retract_page_tables()
> now does vma_write_lock() while holding the mapping lock; the page
> fault handling path would probably take the locks the other way
> around, leading to a deadlock? So the vma_write_lock() in
> retract_page_tables() might have to become a trylock later on.

This, right?
#PF			retract_page_tables
vma_read_lock
			i_mmap_lock_write
i_mmap_lock_read
			vma_write_lock


I might be missing something but I have only found huge_pmd_share to be
called from the #PF path. That one should be safe as it cannot be a
target for THP. Not that it would matter much because such a dependency
chain would be really subtle.
-- 
Michal Hocko
SUSE Labs
