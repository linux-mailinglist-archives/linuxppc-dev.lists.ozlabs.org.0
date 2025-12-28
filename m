Return-Path: <linuxppc-dev+bounces-15073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C933CE5812
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Dec 2025 23:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfZ1n4NKwz2yDk;
	Mon, 29 Dec 2025 09:35:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766961341;
	cv=none; b=e/76XMq4FcEDzxcvU4n9o5HofnGhhSyl4rbytWWcGxHm+VJMRznLweBa6cUJJoB485FnrxWuP29rEkFdesEvjITinVUvFapM071Kd9Yka1ucTQwwQwQZbl4n3FeHTt4JEo7PdYMcMRejOZbcItB6mjgCJRpyanjTmkO+/V/fOI6qE7IjK6OFdzibBQQ30+zfYlCDRXE5nSan8UylfKRP2YetbRSF4jz0KNBEjQ9DdOrCM78c/hWDqVETNpcVeO4vM4emm4YF+bPTpoEyUQJtjK+mwkwXtIEqPrNVAUEAw1CF0/pW2yCpEDagseipiarYZS/bS7/JkXy7TSGbAikgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766961341; c=relaxed/relaxed;
	bh=WX4Noz/n1laWlBKp/F6l3H3S4jFd7v24aGogVxWXj+8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lEHqKUGhVW/Hhfo/IfGLuicBYBRP/0SK3gH4auoYhzL7ck6nE1EgvCHwWesbyUqIbwGzwKqoiE0jnm+Zb0+eTXhYPwvaEVR+FC4tPZc0n0CCzj0LYqh2figkDey53RF+mh3DEFlwxZoyeidIsKo7YOottUMYNKb+CrwVZlAWtdyEpnlrQdTuMpXe2EJazMZV9sRTqgiizjSHBdBy7d2MvXt7UnmQNfnjOCEe7lyXm5Yvv3hMhDr+E2ZOdRcXW2pjdm8Q9qjAZbB4JuVDTyJz8QY3+II5o/PWEUSsbCef4/zMCZWnL8wC1UIATyji+flQ2svplbH5dVP2HjA1sZZ/NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nOPuJZfl; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nOPuJZfl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfZ1m0qtgz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 09:35:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CA2643B59;
	Sun, 28 Dec 2025 22:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A93BC4CEFB;
	Sun, 28 Dec 2025 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766961335;
	bh=CCaq+l+K6wsYD/FHpHvOEK+EvLHkFgdijLHqm1YV+20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nOPuJZfl2av023bRQoktGLNCM+COk5pIMCL3h5ynU6rPF27c4c3qUu5AOfYvG7vuD
	 XUd0EqFI/LwVzvFi4U2RqsdgzyWfl4udZmt5/fIM8f5wWAzzZTy33cyo/WkHWrmA3m
	 dygVpmyLfSYEdyA81KLsG4iO0eh6iw9YBanxpO3E=
Date: Sun, 28 Dec 2025 14:35:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v7] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
Message-Id: <20251228143533.33e2be2d6282d036f55e12cb@linux-foundation.org>
In-Reply-To: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
References: <20251224115524.1272010-1-sourabhjain@linux.ibm.com>
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 24 Dec 2025 17:25:24 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> Note for backporting: This fix is a partial retrieval of the commit
> mentioned in the Fixes tag. It is only valid once the change referenced
> by the Depends-on tag is present. When backporting this patch, the
> commit mentioned in the Depends-on tag must be included first.
> 
> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
> Depends-on: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")

This will be the first "Depends-on:" in history.  Which is a hint that
we're doing something wrong.  This innovation will surely fool any
downstream automation.  Let's use existing tools if possible.

What if we just said "Fixes: 2354ad252b66"?  That would tell people
that 2354ad252b66 is required for use of this patch.

Is there any kernel which has 2354ad252b66 but which doesn't have
c2833a5bf75b?  Probably there is, as neither had cc:stable.

2354ad252b66 is from 2020 and c2833a5bf75b is from 2022.  I'm thinking
the reliable thing to do here is to simply use Fixes:c2833a5bf75b. 
This will tell the world "please add this patch to any kernel which
contains c2833a5bf75b", which I suspect will be good enough?

