Return-Path: <linuxppc-dev+bounces-14591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002ECA28CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 07:35:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMPs93jBsz2xHG;
	Thu, 04 Dec 2025 17:35:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764830141;
	cv=none; b=ggDsfKK+2werKWLKP1B2T9T5HYRTqBY6TxzF693AySBTnMHXitK76W8ggJI+0zL2gmEZS4g+nurZ8zOVNWDZZVTJr+cuQnpkjk5z7D7J4wQRhV10XEuMw+8PqvMDESGtcpydOeMnXmfo644858+g5zSi/4P9bRguq4aNKP1yu8nnuYG2+9K6qO7gJjIj2dnBXRBOr847pnkX+WDU4c1ebwr5gYHg0yP7WXhHmVP5/Xu4VCZWT2HBStuj3KxLIt19v+IfzHSNzt0ILhmp+nZiTBW3JhZlWZbs2+qPeIISSOAwzKqsNBE1xUKkAUyuwq+CXz9yVJhJvhQOWpBb2y5DCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764830141; c=relaxed/relaxed;
	bh=VMNWtiG2wLZCiiTb8hWON6DA6cKjLvUOMbNv7bwc9vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mdy7R5i2NQDfIljFGiookg6srwDmz7pCiuX/mkcuQEw1tXlXHA6aDnIXVbHVqZMERUcc42CSKtu7dscPzrK5yJc6e31VJWzZrJPY6SQ2RZ0QJV+zTUnBg4jKJ4+VU2rdRnq2M+Ctuo5gb4QurOIdS+T4FydrbFYo6soIOVPyKUQxeWRd+BBC2U3WdHCA+6V6AqUJb4V0qY0+yqsf2ncncR4okrV8HyKKPCWA5gSsyPKNpHcJspHawNFICNaz4CASUlTvColFd/uq6TLtfcD0dgJvFYTVfjipLRJQzUOpDUYGPDv/S6UwaSuRW2Z2LnGYo+KlzNrj3xLGN9Xb1otKQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R+ldRRBi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R+ldRRBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMPs837yyz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 17:35:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7596440C8;
	Thu,  4 Dec 2025 06:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D98AC116B1;
	Thu,  4 Dec 2025 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764830138;
	bh=qq3I0S0VU3J5LrRdFM+Ka9HFuuLq+p5MynEaJa1wcxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+ldRRBi6aiMJPPSDQZU9HBz0zY9HhoA71Pc9+FYL+UMbj5AI8j89CjK9UWMCqU5O
	 1Uunf3lmic+ZUt8pEkCXfUyQQwXMVGWNrp0AfLUv/YYd2HarhxyP3pPfirJ+TdegG/
	 P/u4g6mTJ2sG2nBTonoGHuwwsEWXWRdfsxeEG8XVkhdvUfngY2EMcav0A67BYFWXtz
	 +S7NaS1uT3fF0BDvECrj6CKUj7Ty16yHcv4HVgiCcitWEmb45pVUsEQTqdKzbiGJmr
	 nz1Mr7AYPjXr0d8Ck5IPPH72P5qqpggCBKVd4MP6tekBbWBHhOsjAETnKvAQjEfWdp
	 qGTUFJX85CPxw==
Date: Thu, 4 Dec 2025 08:35:29 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, akpm@linux-foundation.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, masahiroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
Message-ID: <aTErsX-wfnxkNJ1G@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <0b007374-1058-487c-8033-4f0d2830dc89@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b007374-1058-487c-8033-4f0d2830dc89@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 07:17:06AM +0100, David Hildenbrand (Red Hat) wrote:
> Hi,
> 
> On 12/4/25 03:33, Shuah Khan wrote:
> > This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
> 
> That was supposed to fix powerpc handling though. So I think we have to
> understand what is happening here.
> 
> > 
> > Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> > systems. git fetch-pack fails when cloning large repos and make hangs
> > or errors out of Makefile.build with Error: 139. These failures are
> > random with git clone failing after fetching 1% of the objects, and
> > make hangs while compiling random files.
> 
> On which architecture do we see these issues and with which kernel configs?
> Can you share one?
> 
> > 
> > The blow is is one of the git clone failures:
> > 
> > git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
> > Cloning into 'linux_6.19'...
> > remote: Enumerating objects: 11173575, done.
> > remote: Counting objects: 100% (785/785), done.
> > remote: Compressing objects: 100% (373/373), done.
> > remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
> > Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
> > Resolving deltas: 100% (9195212/9195212), done.
> > fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> > fatal: fetch-pack: invalid index-pack output
> 
> If I would have to guess, these symptoms match what we saw between commit
> adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
> and commit 5bebe8de1926 ("mm/huge_memory: Fix initialization of huge zero folio").
> 
> 5bebe8de1926 went into v6.18-rc7.
> 
> Just to be sure, are you sure we were able to reproduce this issue with a
> v6.18-rc7 or even v6.18 that contains 5bebe8de1926?
> 
> Bisecting might give you wrong results, as the problems of adfb6609c680 do not
> reproduce reliably.
 
I can confirm that bisecting gives odd results between v6.18-rc5 and
v6.18-rc6. I was seeing failures in some tests, bisected a few times and
got a bunch of bogus commits including 3470715e5c22 ("MAINTAINERS: update
David Hildenbrand's email address") :)

And 5bebe8de1926 actually solved the issue for me.

-- 
Sincerely yours,
Mike.

