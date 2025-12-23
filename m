Return-Path: <linuxppc-dev+bounces-14958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C42CDA0F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 18:11:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbM4W2t9Rz2xlP;
	Wed, 24 Dec 2025 04:11:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766509915;
	cv=none; b=geiu1kDemb4kb1Zq3F+8Hz9yDJ+IS4NsMOUDse4W1SkXL+BZRPvu8PlungU/wEF0a202EGd3yjP2OSAo6RrRwbLtMiNangopFtS7eUVv7ojNrzfbc4OiTbrqKcSIp/QV3kHzF/fcykGj1Fbf8oBVE/Hm8UicK9Ux7j3LdUYCGLW2qPGz0KVxUhxY/JkPi6Mqcqh9oP6Csa2LvbTS7EQt82l4aHvqcIbOvHkMa3RhVAoJBwy8EGwccEPPNHblJTwLwKUF4h2mxjiRZa8gK0rkMN/Q4aQMvBw0cXR4EiPa5j9gjcdZJRI1tstSP1C9jyXKnzw/us0t2oMMSAbwSfi2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766509915; c=relaxed/relaxed;
	bh=NlmwdZqhPExcGZgM/pVZiC2lUJhmTkXwAn+qNuohbBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHdD2FUqEHDsHg1NKz2B+jWRruJx7tecQLIXj8Vg1eU/sthyYbZEEaFitZsCt4MA5S6TPtcUxFvwglubrtNk6UnR+CKhrn0rBJbOhGqLexVDllU4RtFxB6t76/2LEmnaH+xxZXr8gKEx8nmFJW3cX2KMV6l7bDbynniJACvovCM3MFG97jgZeFYln8fxwTEVmWD8Cf82XHfyL8qPU7JNFfD9kP56IeABC2qu0FfFikq4I+afyuhMNmpR1xRdC+CMvMNMTdcetCl7wnOoLt7u9vXeQ7J0ccNtGvyL06BGRze9lccih5aYFwgX3pkYr6gdFVe9FZ3rXo4UV+zXm59VCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fa+0Ubgf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fa+0Ubgf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbM4V2vQJz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 04:11:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5E6C41E5B;
	Tue, 23 Dec 2025 17:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59005C113D0;
	Tue, 23 Dec 2025 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509912;
	bh=3um8NkjnKfQWblw0ttBXC1gQUUqnZlPZFVjmKn1p7PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fa+0UbgfGH0MW7oBnwI79BEfDFeL2kz26p3mGx0sCirQiG+ODvVSzIvze2Y4eZ39e
	 WIzrCovlU7u1ZaXeiidmAy+OfcAiEQyWBxBq8TEgBFblUeLzUl71pnP8IwQYxRxZtl
	 JU7DoafiH8mxnn2LoNc4c4dJAdE2oBfmG5UhDjQJJJ432y4bbFEKAVbwNtMFpz/VKJ
	 6AlMqdnjsTFz7IjJg58q5KShlRT8jwNW+ZHfTHRSECk5n7n3KNXCVAxif2wK9xXXXT
	 E+/IjLB2oCGTQ1JX1lHXV5bbVjgxm5fyavrfeDQFfoQJYkrnbzjVcvXusb6YT55ENG
	 LaGk5PAMnNqlg==
Date: Tue, 23 Dec 2025 12:11:51 -0500
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
Message-ID: <aUrNVyuSaQrQLGZP@laps>
References: <20251221104907.032abf56c67f3e50c9c94e31@linux-foundation.org>
 <20251223013045.4579-1-sj@kernel.org>
 <20251222183055.88c3cc1f0705c1dc29c7f011@linux-foundation.org>
 <aUqAcf2405H0pRW1@laps>
 <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
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
In-Reply-To: <20251223085434.a6d6ae08c3aedf420908f404@linux-foundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 08:54:34AM -0800, Andrew Morton wrote:
>On Tue, 23 Dec 2025 06:43:45 -0500 Sasha Levin <sashal@kernel.org> wrote:
>
>> >> > Yes, -stable maintainers have been asked to only backport patches where
>> >> > the MM developers asked for that, with cc:stable.  There may be
>> >> > slipups, but as far as I know this is working.
>> >> >
>> >> > I don't actually know how they determine which patches need this
>> >> > special treatment.  Pathname?  Signed-off-by:akpm?
>> >>
>> >> I guess it is pathname, based on ignore_list file [1] of stable-queue repo.
>> >>
>> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/tree/ignore_list#n16
>> >>
>> >
>> >Oh, that's a bit sad.
>> >
>> >- other trees sometimes mess with mm/ and they probably aren't aware
>> >  that they need an explicit cc:stable.
>> >
>> >- misses drivers/block/zram and probably various other things that
>> >  the MM team maintains.
>> >
>> >Oh well, I guess simple mm/* coverage is good enough.  But I do worry a
>> >little that useful fixes coming into mm/ via other trees without
>> >cc:stable will get missed.
>>
>> How should we improve the filter? mm/ AND signed off by akpm?
>
>I think just signed-off-by:akpm please.  That way, mm fixes which come
>in via other trees without cc:stable get backported.

Ack

>Obviously we'd prefer that such patches get appropriate consideration
>by the MM developers but sometimes other-tree people aren't that
>cooperative.  In this case it's better to backport the thing rather
>than missing a fix?

I tend to err on the side of taking one extra thing rather than missing
something :)

Would you be interested in trying out AUTOSEL for mm/ again? In the current
workflow I give about 2-3 weeks for review, and all it takes to have a patch
dropped is to just reply with a "no".

I can generate a series with mm/ patches from v6.18..v6.19-rc2 that don't have
a Fixes/stable tag but the LLM thinks that it should be backported as a way for
you and other mm/ folk to gauge the current state of AUTOSEL, if that helps?

-- 
Thanks,
Sasha

