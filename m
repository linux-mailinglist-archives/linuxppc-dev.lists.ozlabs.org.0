Return-Path: <linuxppc-dev+bounces-14626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91315CA5654
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 21:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMn1l4QCwz2xJT;
	Fri, 05 Dec 2025 07:59:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764881963;
	cv=none; b=gzc50U0WxB2F6ZLnU9KyXt3r/1BhjShNpHc94p0Ssco0pIuYRtwCMWto4p74dte2OQ05qQhSYuLgG2rzBC1Yyi62hMg0/CRMidL58oVW88sCJZejNYSLhXoKTC7Fvdr7puYONqLrDiM5apNHvbACoCjz9GZAzcCg5tYGLdRCYDXKYzOMVUFBzKzha2t8lw/2DYWavCpLVVUreHcThysk5WAbizBNdRM6A4C9vAUv9K+W5FOTZFMPuuwA7nn6yhdC6tvw3zzaiRHNreaHPIMGYllauexA1+Z/FL5bYd3qjUoCPrTTd8VzJ1lUVYSWLBR/KurLKS+w2kbOjsfyOGUwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764881963; c=relaxed/relaxed;
	bh=41V0btNF7KA2O1dznjGGyHba5bnZAFC6fB5jUVf1x/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Um2dKBm1Me2VhXfUyqcyypM510RODp2cSWmVHv7WjNueA7G1zqtFvjU9jE2IcUpzuN7gUKHWWMaWET50Wlc+cfz3SHKb/hmOCZSaZXE3TqQ+21EOjfTqGVkKWh8LMsOOteN7C/Pj0EspFimUTUtQrgB1d3JRBqOZkvGlxftyHysZVvZi+2ZUBVo7B/fteh8WNNfNopd4/rwU35vqjDvUq+uApkZx2FCRvCHiNJSxLu29/97LarsFLBI6dHtVov+FUzqc+XUDpGNpFdu1qsSKCDcAwWBzktisIoG/H3BJohIRkvWxIMqe1BkZQmR4hx3jBtuNsop7AhlRBgga9/8Pfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tA78S6gr; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tA78S6gr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMn1k0LsNz2xHG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 07:59:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4FA443A6E;
	Thu,  4 Dec 2025 20:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90672C113D0;
	Thu,  4 Dec 2025 20:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764881958;
	bh=4O9Ah99qQTol32t/P1TpxoZv82j3pnx84+70Fb5YdUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tA78S6gr+Qh7bTbz1ZeQsKn2yGl8q4Zf+nVGht3F99N8vJ/cfaY3BEbh1wNMwik04
	 6yI4dWNE7oOeGtCS8nDKTWo023FfpA2DYMkTLCkIv2pNSHah+uEDPIdVrQ37UbYhHa
	 PEmBvcA84WFCfGaks4Q6Kk3d796ZNH8pgOvqH3/bZLB/x2gqMu5lY17lL5C+mbbxG0
	 l+fkHGM4GZfABuGw+vc9NNNnO7Zn6vH+qVtRfH9DEqIMQF0/UAxuZKXiAqcoKofPwq
	 t5jjTTwFiUSnt6w8ox3aYTVelANQ+D9kaLir7yFW1Pta6MLisJFL68Lpv0Cijor3wI
	 xZH0ghAZwUgMQ==
Date: Thu, 4 Dec 2025 22:59:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
	akpm@linux-foundation.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, masahiroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
Message-ID: <aTH2HqxZjmFHWlSJ@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <0b007374-1058-487c-8033-4f0d2830dc89@kernel.org>
 <aTErsX-wfnxkNJ1G@kernel.org>
 <78af7da4-d213-42c6-8ca6-c2bdca81f233@linuxfoundation.org>
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
In-Reply-To: <78af7da4-d213-42c6-8ca6-c2bdca81f233@linuxfoundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 10:03:09AM -0700, Shuah Khan wrote:
> On 12/3/25 23:35, Mike Rapoport wrote:
> > On Thu, Dec 04, 2025 at 07:17:06AM +0100, David Hildenbrand (Red Hat) wrote:
> > > >
> > > > The blow is is one of the git clone failures:
> > > > 
> > > > git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
> > > > Cloning into 'linux_6.19'...
> > > > remote: Enumerating objects: 11173575, done.
> > > > remote: Counting objects: 100% (785/785), done.
> > > > remote: Compressing objects: 100% (373/373), done.
> > > > remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
> > > > Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
> > > > Resolving deltas: 100% (9195212/9195212), done.
> > > > fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> > > > fatal: fetch-pack: invalid index-pack output
> > > 
> > > If I would have to guess, these symptoms match what we saw between commit
> > > adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
> > > and commit 5bebe8de1926 ("mm/huge_memory: Fix initialization of huge zero folio").
> > > 
> > > 5bebe8de1926 went into v6.18-rc7.
> > > 
> > > Just to be sure, are you sure we were able to reproduce this issue with a
> > > v6.18-rc7 or even v6.18 that contains 5bebe8de1926?
> > > 
> > > Bisecting might give you wrong results, as the problems of adfb6609c680 do not
> > > reproduce reliably.
> > I can confirm that bisecting gives odd results between v6.18-rc5 and
> > v6.18-rc6. I was seeing failures in some tests, bisected a few times and
> > got a bunch of bogus commits including 3470715e5c22 ("MAINTAINERS: update
> > David Hildenbrand's email address") :)
> 
> I am sure this patch is the cause oh the problems I have seen on my two
> systems. Reverting this commit solved issues since this commit does
> impact all architectures enabling HAVE_GIGANTIC_FOLIOS if the conditions
> are right.

The issue reproduces for me with 39231e8d6ba7 reverted as well.
If I run git clone <linux repo> in a VM with 2G of ram it becomes
unresponsive at about 40% of "Receiving objects" and than git errors out
with "invalid index-pack output"

-- 
Sincerely yours,
Mike.

