Return-Path: <linuxppc-dev+bounces-14634-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18865CA6428
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 07:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN27j0bqBz2xrk;
	Fri, 05 Dec 2025 17:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764917424;
	cv=none; b=h9opcH4cFlcrUb7IAEuWDtLZjWG/cpzvAUXFTV55utlubP0DhGzaz7FgH1kCCLydaes+FkBUwTWj4weyHcNkZCwR+hCEhwEOFgMTsIg8qPb0e4qj3OcuZfhmgPYN5Dwf0jcx/DUFsplwjf4QMwn5wn+Ig5lMu3OpjMaglxN5CL6sI0Xnzk5jwTVEdqULFrHn2kevJKvCMdC1yxN8iJDHP9SESsJtNqMgqBQEAuSPYaelxGcnAFXvG53gxkBYwLT1Ogx6kgkGMNa/EOvijSM7jOSL0OA6AfrzMqFUBwaoN+NMiVm+BABYbJ/8xlwBtRuKYF3kuWIpO/UcsICPJ/5sbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764917424; c=relaxed/relaxed;
	bh=AoFU+G3ETpikbd4tlQOFE+VGY07S6NOxc28n31sv80k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ef1w9xn9nd+24obK3X4lNpMMv5C+lfmz01VcbLb2BcRPkm6xpaOb0nArVGCm8X5cZyexnJkt+aV3w81MGflXV3H3vATRU27taUCk4Cg8PXmxIoNNla0U84HXyUMtOJsnLOq/Y+YIz31+DmYqx4CqePnZn/GZxRtWxMjG8Sk0Nd6BM0q/pLBV3k8gxjA0nqvf0mug4kD9AT0vbkKepL2zKWxk4MKmjX94a2fIjuVT2Pn4/CxRtwEdx88t/m20MuR6pku9o7HDB4Rwx1uByWHaTrTCsuFy+Z/+PQFRcYTe73uFirFpQiVtzwYxScutrp7IVQoUp1WMCFcDq1hNn1IisA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0/gasT4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0/gasT4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN27g44PZz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 17:50:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E480D60010;
	Fri,  5 Dec 2025 06:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C914AC4CEF1;
	Fri,  5 Dec 2025 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764917420;
	bh=S12eGI1G5jc9G6bd6xh6G1FfM4cBPXqRWNEFnudR6ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0/gasT4PM94cnt9hTymN+xKW2QeSvwLLZJ+lE1/Q6hr2fQ1OazfISnRCo4/WOuyh
	 MgyJFyIZgY+gzz8hFHtCCbaJepb+I9pMlhqzu3zHh822yhpeHs6kCKgFVtDoPbymYL
	 iAo6lYItJpG2A1jOh8mvNzOpKq9WTPoA1EOgyORSmTc681MtFcGl8XLSetO8blOBxi
	 sDdB5/7KsrFA91H0al7RIsXNsLy0JlJnvajYvURGv2EYGBjw9bvzRaXYAthdEkzz2y
	 npWyCqJ/BTEJCdXcvFNpWOrREg9HxWoPKpjBXS3YIEzHxlM7kzJ1VipPGKkBPSi8gz
	 Ny3McT+zL/YAw==
Date: Fri, 5 Dec 2025 08:50:11 +0200
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
Message-ID: <aTKAo7JgBX0X_pBl@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <51d8549e-b084-498e-84c0-76fd3de116cb@kernel.org>
 <317deba2-e560-44ed-a9f7-3c6fdc446b6d@linuxfoundation.org>
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
In-Reply-To: <317deba2-e560-44ed-a9f7-3c6fdc446b6d@linuxfoundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 04:23:36PM -0700, Shuah Khan wrote:
> On 12/4/25 15:16, David Hildenbrand (Red Hat) wrote:
> > On 12/4/25 03:33, Shuah Khan wrote:
> > > This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
> > > 
> > > Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> > > systems. git fetch-pack fails when cloning large repos and make hangs
> > > or errors out of Makefile.build with Error: 139.
> > 
> > Looking at the last part, "Error 139" was confirmed to be fixed in 6.18, right? At least reading [1] there I find
> > 
> > "it was issue of 6.18.0-rc6 kernel itself. After switching to default Arch Linux kernel build went without problem and I'm now on 6.18 stable kernel."
> > 
> > Did you mange to report the make issue you reported here [2] on 6.18 as well, or only pre 6.18-rc7?
> 
> The problems I saw were on rc6. See below.
> 
> Repeating what I said on the thread so we are all in the
> loop and on the same page. It took me a bit of time to
> retest on two systems.
> 
> Both my systems were running rc6 - I was stuck in a state
> where I was able to rebase to rc7 and then 6.18, but could
> never build either one.
> 
> When I suspected rc6 to be the problem, I booted rc5 and compiled 6.18
> after reverting 39231e8d6ba based on config file changes between rc5
> and rc6.
> 
> I retested on both systems on 6.18 making sure I have 5bebe8de19264
> and 39231e8d6ba in there. I cloned linux_next and built it on both.
> 
> I didn't see any problems on 6.18. Having said that, It might make
> sense to hold off on including 39231e8d6ba in 6.18 so there is more
> time to test beyond 2 rc cycles. That is for you all to decide.

I am able to reproduce both git and make issues on v6.18-rc6 with
39231e8d6ba reverted. If I apply 5bebe8de19264 on top of v6.18-rc6 the
issues do not reproduce.

The issues do not reproduce on 6.18 that has both 39231e8d6ba and
5bebe8de19264 that again confirms that 39231e8d6ba has nothing to do with
those issues.
 
> 
> thanks,
> -- Shuah

-- 
Sincerely yours,
Mike.

