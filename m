Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DA5B4D0C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 11:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQPkC6C6vz3c23
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 19:36:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=MaJLVWPQ;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8akfSuHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=MaJLVWPQ;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8akfSuHi;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQPjW3xr6z2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 19:35:42 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7F7521E99;
	Sun, 11 Sep 2022 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662888938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Lc3vR3minJtB/44lBRTyQejWooVRYylPWrQ2JvEp1c=;
	b=MaJLVWPQsh71YKDB3HnJgYZcoRFq3u90TGLqyadSycRXOfbpdLNOhF7jYJ7wCymnlaOQfy
	tQ9Y98dwJx0BjGNKItq1K2MZZWqZ7VjFqT/UMwLPtJBlcJA4fTEPB3DeUWXQySouftTEmC
	Ky8YnNCvqPf8JLLUmYNl5CYA/YY/50M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662888938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Lc3vR3minJtB/44lBRTyQejWooVRYylPWrQ2JvEp1c=;
	b=8akfSuHi78TNqxzhhYCqjW2GfEzFez7f2C0WbZ30IncNuZEB6firo2r44VOcgN+jYzwA67
	5vTZ6qN3UH8IbODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41DC6133E6;
	Sun, 11 Sep 2022 09:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Jd4fD+qrHWN3VwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Sun, 11 Sep 2022 09:35:38 +0000
Message-ID: <b5db3353-8aae-22d8-9598-eaa5eeb77cfc@suse.cz>
Date: Sun, 11 Sep 2022 11:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901205819.emxnnschszqv4ahy@moria.home.lan>
 <CAJuCfpGNcZovncozo+Uxfhjwqh3BtGXsws+4QeT6Zy1mcQRJbQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAJuCfpGNcZovncozo+Uxfhjwqh3BtGXsws+4QeT6Zy1mcQRJbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andr
 ew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/2/22 01:26, Suren Baghdasaryan wrote:
> On Thu, Sep 1, 2022 at 1:58 PM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
>>
>> On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
>> > Resending to fix the issue with the In-Reply-To tag in the original
>> > submission at [4].
>> >
>> > This is a proof of concept for per-vma locks idea that was discussed
>> > during SPF [1] discussion at LSF/MM this year [2], which concluded with
>> > suggestion that “a reader/writer semaphore could be put into the VMA
>> > itself; that would have the effect of using the VMA as a sort of range
>> > lock. There would still be contention at the VMA level, but it would be an
>> > improvement.” This patchset implements this suggested approach.
>> >
>> > When handling page faults we lookup the VMA that contains the faulting
>> > page under RCU protection and try to acquire its lock. If that fails we
>> > fall back to using mmap_lock, similar to how SPF handled this situation.
>> >
>> > One notable way the implementation deviates from the proposal is the way
>> > VMAs are marked as locked. Because during some of mm updates multiple
>> > VMAs need to be locked until the end of the update (e.g. vma_merge,
>> > split_vma, etc). Tracking all the locked VMAs, avoiding recursive locks
>> > and other complications would make the code more complex. Therefore we
>> > provide a way to "mark" VMAs as locked and then unmark all locked VMAs
>> > all at once. This is done using two sequence numbers - one in the
>> > vm_area_struct and one in the mm_struct. VMA is considered locked when
>> > these sequence numbers are equal. To mark a VMA as locked we set the
>> > sequence number in vm_area_struct to be equal to the sequence number
>> > in mm_struct. To unlock all VMAs we increment mm_struct's seq number.
>> > This allows for an efficient way to track locked VMAs and to drop the
>> > locks on all VMAs at the end of the update.
>>
>> I like it - the sequence numbers are a stroke of genuius. For what it's doing
>> the patchset seems almost small.
> 
> Thanks for reviewing it!
> 
>>
>> Two complaints so far:
>>  - I don't like the vma_mark_locked() name. To me it says that the caller
>>    already took or is taking the lock and this function is just marking that
>>    we're holding the lock, but it's really taking a different type of lock. But
>>    this function can block, it really is taking a lock, so it should say that.
>>
>>    This is AFAIK a new concept, not sure I'm going to have anything good either,
>>    but perhaps vma_lock_multiple()?
> 
> I'm open to name suggestions but vma_lock_multiple() is a bit
> confusing to me. Will wait for more suggestions.

Well, it does act like a vma_write_lock(), no? So why not that name. The
checking function for it is even called vma_assert_write_locked().

We just don't provide a single vma_write_unlock(), but a
vma_mark_unlocked_all(), that could be instead named e.g.
vma_write_unlock_all().
But it's called on a mm, so maybe e.g. mm_vma_write_unlock_all()?


