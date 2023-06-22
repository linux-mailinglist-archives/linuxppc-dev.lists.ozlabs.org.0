Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845173A148
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 14:55:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EUKbw71g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn0hz21gHz30P6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 22:55:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EUKbw71g;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn0h40zHRz30Cg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 22:54:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qn0h26KQPz4wjC;
	Thu, 22 Jun 2023 22:54:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687438484;
	bh=1uqAqd7E1mYRn4Hw08gznafI4P/jkHGbir/cHIP+J0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EUKbw71gyLzEoTX4SMGZPeTH77XsfNUB7NtwNtJTixOoCVJCNB7SFdue96RoJ9UKo
	 BpKh1xEcXyWYsQ9CPeh4vOOOfqx3L/Blom/09DWgwR8RYJ8FuMl/ZG/+/dzGDxKr4U
	 j1c9mHvNlJ0ZI980ZaFLLqXbmtVjYSthZN6XB5lEG0GF7Hr591Pq6zDB/1NnnRfXPc
	 4d6UPjkGFW2rhdksG56eBXwaCxKGsYj/QyMa+XxLJig8oF5b1L3MMrC8wMFETbjBY3
	 YnUFRn6fBZg0qkAgpCMk9FQl/T/eLoypFkXRF0wMtj6sD0OOTB1X5YUMJKUwEXG+bi
	 4rq/w36aIN38g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Bad linux-next merge? (was Re: [6.4.0-rc7-next-20230620] Boot
 failure on IBM Power LPAR)
In-Reply-To: <568F6E65-DBDF-43F2-8B3E-E783AE5A2B6C@linux.ibm.com>
References: <E6B3DD9B-8577-450E-A043-E4B307CE379C@linux.ibm.com>
 <87edm5pj4u.fsf@mail.lhotse>
 <568F6E65-DBDF-43F2-8B3E-E783AE5A2B6C@linux.ibm.com>
Date: Thu, 22 Jun 2023 22:54:42 +1000
Message-ID: <87jzvvodwt.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
>>> The problem was introduced in 6.4.0-rc7-next-20230619. I tried git bisect, but unsure of the
>>> result reported by it. Bisect points to following patch
>>> 
>>> # git bisect bad
>>> 70c94cc2eefd4f98d222834cbe7512804977c2d4 is the first bad commit
>>> commit 70c94cc2eefd4f98d222834cbe7512804977c2d4
>>> Merge: 48f5ee5c48c3 3fe08f7d5e80
>>> Author: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date:   Tue Jun 20 09:43:25 2023 +1000
>>> 
>>>    Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>>         # Conflicts:
>>>         #       mm/mmap.c
>> 
>> Usually bisect pointing to a merge means something has gone wrong with
>> the bisect. It's not impossible for a merge to be the cause of a bug,
>> but IME it's rare.
>
> I have tried the bisect 3 times and the result was same. It always
> points to this merge commit.
>
> Is there anything else I can try to help debug this issue?

Looks like it's been reported, debugged and fixed over here:

  https://lore.kernel.org/linux-next/20230619204309.GA13937@willie-the-truck/

So it should be resolved in today/tomorrow's linux-next hopefully.

cheers
