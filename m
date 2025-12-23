Return-Path: <linuxppc-dev+bounces-14949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD9CD9254
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 12:44:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbCpY09fFz2yF1;
	Tue, 23 Dec 2025 22:44:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766490260;
	cv=none; b=HqSjqMgZ1Do9FOH3yGzEdXvQe6ZcZuI+WAb4eKSdDqvA3mgYo2h13YPCbDHXuQkZNY+a1ycPrGNCVxVX2mJNaACoBWgIa2tZJXi1uzEHslpYO+OygClsqidrcxCnIDFkeVg43Ae9txKLVdGYXhEsNoM8ddxju1vjPbd1A7XjaRw7p1+XlGkKBKpMCjPV/owgGdOEeZ6GH38CKHHBAHoinuHzgErHYrln5nMT9+6i1gAoPQ/VuPrnANaHnIK18A/HEjtWidV8uk1wCMYT8TkLWHey9+s9KYCwrulZhdmogQBu07kcXR4cilGYopv2fRnZdCYsmicZIkRDwsNFhHuYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766490260; c=relaxed/relaxed;
	bh=ZtWW4W+8FJ12YJUN/1bUcA87IwN8c1HAjU2JtJpGy7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhDoXxtpzGQ5BAttyxVOoDYP49OVDxxnApEUU7ryUpJKWKiH0aMxUI/GGgunyYZkckseL84AjwBdtlxZAgxebxafVRmv0qneam0YmYr1V3+9ehYgnBqIu/qtC/Wesa5+3cMmmRhhCBhxAvoJnOe74pISs649QzP36HWY9E0cDic5wBxPtakrfbPnnCdTSQR14jS7uulVeHQ+ksrfrSW7tkksX/bhBgjh8W82LKuhbDGJXMUzTvS9bNqfVbvmR/5S10Fj1X2wcOGwuvOQ6h5Lb/ksovV/qbPPXFL+DRvggWGcCVnlsWnFTShnD26YGGGeaKsFTGneH/jhSAFG+C5g8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bp7+0Uj5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bp7+0Uj5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbCpW6rS1z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 22:44:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACDD8600CB;
	Tue, 23 Dec 2025 11:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37179C113D0;
	Tue, 23 Dec 2025 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766490227;
	bh=Y356nykrWSoOLSfh5YSTuQ7KEeAa3+p4YJplI7gtpt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bp7+0Uj5Z6VN2PwEXcmIQc2WbkxYG8kryhsefYIJmIYPnYY8o90w6UX2JAubtYhjj
	 fBSUj5KqEJpYw8kJ81qOZlCpQls5B1SHKmUG+cp9QRjlRtPS/GxilpnVO0oeJsFhh0
	 zpt35Rfs7wEpcjroz4hRRUAfPWdl4TmZ8biix0Eni2qLTjfyXRIbVKoacsc20ADOyt
	 KtOUj3Lc0LkCMZcWCBPQjQWIkBMyhkyl0Q2SI8TqIeWkTTBxIxFgeEXzoQqUMzJ0C7
	 lSF3JsFbuzMqS9nWP3rV8QXPHDJtLQFnf0UWcxlqVQ2wqbWDUNFSH78aHXUtTl1QZZ
	 KKfmU+sjJ/a9Q==
Date: Tue, 23 Dec 2025 06:43:45 -0500
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-ID: <aUqAcf2405H0pRW1@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
 <20251223013045.4579-1-sj@kernel.org>
 <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 22, 2025 at 06:30:55PM -0800, Andrew Morton wrote:
>On Mon, 22 Dec 2025 17:30:44 -0800 SeongJae Park <sj@kernel.org> wrote:
>
>> On Sun, 21 Dec 2025 10:49:07 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> > On Sun, 21 Dec 2025 10:22:44 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
>> >
>> > > >
>> > > > My main concern was -
>> > > > A fixes tag means it might get auto backported to stable kernels too,
>> > >
>> > > Not in the MM world -- IIRC. I think there is the agreement, that we
>> > > decide what should go into stable and what not.
>> > >
>> > > Andrew can correct me if my memory is wrong.
>> >
>> > Yes, -stable maintainers have been asked to only backport patches where
>> > the MM developers asked for that, with cc:stable.  There may be
>> > slipups, but as far as I know this is working.
>> >
>> > I don't actually know how they determine which patches need this
>> > special treatment.  Pathname?  Signed-off-by:akpm?
>>
>> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
>>
>
>Oh, that's a bit sad.
>
>- other trees sometimes mess with mm/ and they probably aren't aware
>  that they need an explicit cc:stable.
>
>- misses drivers/block/zram and probably various other things that
>  the MM team maintains.
>
>Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
>little that useful fixes coming into mm/ via other trees without
>cc:stable will get missed.

How should we improve the filter? mm/ AND signed off by akpm?

-- 
Thanks,
Sasha

