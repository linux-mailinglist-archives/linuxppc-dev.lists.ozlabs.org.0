Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2755EF422
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 13:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdW8k5k4Wz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 21:19:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=STn+xmbi;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SuyCQFom;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=STn+xmbi;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SuyCQFom;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdW832nfvz3bms
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 21:18:43 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 900C21F8AC;
	Thu, 29 Sep 2022 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1664450306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urbGd3LAjOpWbVvqm9mfXm+G/l17iKcXVGqxKpMeX5Q=;
	b=STn+xmbiPxhW9r5zgAt4bVEVNMMc6jd8rXGxswLPtnG5S2JBWy+cHnwGMBxW3BMNKCorOe
	YPkVb/Na44IdzaxsKDPsDLGNiqHjN7SMN600D2Yqjcqw4ds9zwz8aa4vFJb6qPzIMAx4M8
	17ZMI733Payhh1jz/YlaxJYfEKQuciQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1664450306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=urbGd3LAjOpWbVvqm9mfXm+G/l17iKcXVGqxKpMeX5Q=;
	b=SuyCQFompQd0ZYx14elDUVk3xibRIRatzprS4Kx0v/d0SRop9JvAWHCXFnZb057DzgPIfa
	rxqwRV1K/SGhTACg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34C991348E;
	Thu, 29 Sep 2022 11:18:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id s8pSDAJ/NWMiagAAMHmgww
	(envelope-from <vbabka@suse.cz>); Thu, 29 Sep 2022 11:18:26 +0000
Message-ID: <621612d7-c537-3971-9520-a3dec7b43cb4@suse.cz>
Date: Thu, 29 Sep 2022 13:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901205819.emxnnschszqv4ahy@moria.home.lan>
 <CAJuCfpGNcZovncozo+Uxfhjwqh3BtGXsws+4QeT6Zy1mcQRJbQ@mail.gmail.com>
 <b5db3353-8aae-22d8-9598-eaa5eeb77cfc@suse.cz>
 <CAJuCfpEcTv5crNumhMTCf2yAJ5+86ph78-B+eyk_N84Ce=nr5w@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAJuCfpEcTv5crNumhMTCf2yAJ5+86ph78-B+eyk_N84Ce=nr5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <
 linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/28/22 04:28, Suren Baghdasaryan wrote:
> On Sun, Sep 11, 2022 at 2:35 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 9/2/22 01:26, Suren Baghdasaryan wrote:
>> >
>> >>
>> >> Two complaints so far:
>> >>  - I don't like the vma_mark_locked() name. To me it says that the caller
>> >>    already took or is taking the lock and this function is just marking that
>> >>    we're holding the lock, but it's really taking a different type of lock. But
>> >>    this function can block, it really is taking a lock, so it should say that.
>> >>
>> >>    This is AFAIK a new concept, not sure I'm going to have anything good either,
>> >>    but perhaps vma_lock_multiple()?
>> >
>> > I'm open to name suggestions but vma_lock_multiple() is a bit
>> > confusing to me. Will wait for more suggestions.
>>
>> Well, it does act like a vma_write_lock(), no? So why not that name. The
>> checking function for it is even called vma_assert_write_locked().
>>
>> We just don't provide a single vma_write_unlock(), but a
>> vma_mark_unlocked_all(), that could be instead named e.g.
>> vma_write_unlock_all().
>> But it's called on a mm, so maybe e.g. mm_vma_write_unlock_all()?
> 
> Thank you for your suggestions, Vlastimil! vma_write_lock() sounds
> good to me. For vma_mark_unlocked_all() replacement, I would prefer
> vma_write_unlock_all() which keeps the vma_write_XXX naming pattern to

OK.

> indicate that these are operating on the same locks. If the fact that
> it accepts mm_struct as a parameter is an issue then maybe
> vma_write_unlock_mm() ?

Sounds good!

>>
>>

