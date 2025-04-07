Return-Path: <linuxppc-dev+bounces-7500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71BA7EA84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 20:35:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWdFJ6Lnkz2yr0;
	Tue,  8 Apr 2025 04:35:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744050948;
	cv=none; b=TvAdgQ5J4COgSBeX7KsZEm1kFACGDTLdrcRfRuwFTF2agHGj96TIOx/c864qNDqLJQcPyFvGORfLatUv1RqJkOUNkdNcP9DvfU6vX/E7rHhY9MKymA1ZMvPgfzx99l8VKw/ui5am7STUFSOo+zfzxMgEUoLMYg21j1m4bTWAtErm5TQ+qQ4b9ljt7kcGInm7jdHQybb3LOPo6KG2MHg03ngqumo6fmi05Wq6Wi01OXBG1GEll2pLD0pzlapamguv76qUsEw86NTzgdXT9CXJRkBTUIEGgaHk7VqKRQovZsciGU3epT56HApljQJycJs/V23eNdrlsnYIleOJnsZj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744050948; c=relaxed/relaxed;
	bh=HVIx6+rqr4ZJl0FP7/CBLnJxACqBspcG+IcI+UcewN0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DQJOUoyHPKYdFTeiZ2H60bbqy41w7z4dPfX+OEAwUeu9piIb4YeEwp0YSv+uv3sGarQFqrHkqUBn9HBMNY7bA7bRr2jWfuWc2hdxAgP//Ll+ulbalpYtHQE6WyCemr+x2VrRPsRT6kRh+zbeo4tDWd+M6JdcHsSx/reKOlysCCTMtQD4SLfUrpU1VH16JvcAtxTfRB4Ie10jTf8cPOlfNsVVQQi6Jt7pnERD6RL9TA3RxyRRQ5lgn4VOKdloHWxYDwj9UC8muXBBQekdYQ/n+t7oTwYWE03nzgIfC//sf+/FewyJTmk7E5hzEEq2D19Pswuxn1v1yjTQE06rficrRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kwvaeD/a; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=kwvaeD/a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWdFH56h8z2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 04:35:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF9495C276A;
	Mon,  7 Apr 2025 18:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B551C4CEDD;
	Mon,  7 Apr 2025 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744050944;
	bh=QiTncCnd55Ia4eac1kyaB9blDFvntz5XPVt6W64q1n0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kwvaeD/akigjGI7ZXDY52hZRNE3FRFEN6Uc6iHtJlTKxoE0UMkjLxBOD/fgvDHGq1
	 W4Ni/q9ZjLctOHi6rmPtAnUuHHHe57o4rpfiv0IL8Pp6Z02ulY8lFGXBs6yBBc7eYu
	 XifDovhU5NidAqljsBlmq7svSzYrmQnQBYrtwkdo=
Date: Mon, 7 Apr 2025 11:35:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge
 <jeremy@goop.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
Message-Id: <20250407113543.6a43461e397d58471e407323@linux-foundation.org>
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon,  7 Apr 2025 17:11:26 +0200 Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> This series is an attempt to fix the violation of lazy MMU mode context
> requirement as described for arch_enter_lazy_mmu_mode():
> 
>     This mode can only be entered and left under the protection of
>     the page table locks for all page tables which may be modified.
> 
> On s390 if I make arch_enter_lazy_mmu_mode() -> preempt_enable() and
> arch_leave_lazy_mmu_mode() -> preempt_disable() I am getting this:
>
> ...
>

Could you please reorganize this into two series?  One series which
should be fast-tracked into 6.15-rcX and one series for 6.16-rc1?

And in the first series, please suggest whether its patches should be
backported into -stable and see if we can come up with suitable Fixes:
targets?

Thanks.

