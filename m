Return-Path: <linuxppc-dev+bounces-1054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958596D841
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzz4M6qv9z2yvs;
	Thu,  5 Sep 2024 22:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725538899;
	cv=none; b=bENlgG+XAvL1nme/lT1TT7bQNhG3OXeVk/X6vFFdNbu881mBdyIiUx2z/lB33EZHkxrev5vrBXKdesp8u6yfIhqz2FpLJZ37E9bONS/aw75w6Gg8mQVU5Kczt1lx3zOZ9FjYnj/Y66KXGR7cBFpxvGmbketHZZ9Gv1zNxEESPPWCiNMTfK3UwcEZVr2W9ymer2jlHN0k3TIEjRPCxsic3zWtB3lT+3QODnllweIYP2oh8jNaeAkAW/zYEkuRNvKkhjhN3SRfTCFL+7/QAO1/T9jACcuOxrjKfBlWqeyMZUY2QoK71RGgAJ4Iguc0bgt9QOZDgNkJbc/GSiGcaeNtrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725538899; c=relaxed/relaxed;
	bh=RG+B9RQMt9wqZwEFGQtC9HihmbtSol0+CD88scwrr1g=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:Message-Id:References:To; b=c77OuJuZiC1w/dm42tULMwSY9qjcK6YzkguqYzifdSgrjOgsukQz+jjVwvHgWjUiENwlHVL9bUsFRteoxq0q7cMQvqzFBbtxk9ScQEu6qLD2knN2n9lc52QWgGFsZE7bXUnd2hJjvNH9cTZmHR3r3ksDPvUzBhrFDv0FvBn+jdjlEmcy5ZyCd9R6avcTOi7M188Wfr/HBmO152xpzlhVU2rZ98IOkE4ShT71mPojowfwfU4wkdmR8+FF1of9ipbuRyF8to1UtnNRRTYmL5A6w3AkhbJF85IlOSPe1kV8mcr+XJOOencH6mQs8+lKFz2dM+ZoBb0VSaCuXMv66hNbpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qn2XqsEe; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qn2XqsEe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzz4L2dCQz2yjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:21:36 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725538876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RG+B9RQMt9wqZwEFGQtC9HihmbtSol0+CD88scwrr1g=;
	b=qn2XqsEevTtNsm0C0CHtnQmRNmZ+AVm0hM6Uy5e3u/BOaVmtKVjJpC/c0EPxHY7wdVSgju
	4dwEvwrBRPQycogduv5yry7QUbkmrGoUawtvZQ+t0uqSe0k35+sSKbVAwOxBxyj3bIsXqz
	qtdbnn5qyiTt19S2z5SyP1ZsF5TaLO4=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3 11/14] mm: userfaultfd: move_pages_pte() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240904084022.32728-12-zhengqi.arch@bytedance.com>
Date: Thu, 5 Sep 2024 20:20:30 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Vishal Moola <vishal.moola@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 christophe.leroy2@cs-soprasteria.com,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <7FEBE447-2635-4BA9-83F1-89A3F0CB3BD6@linux.dev>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-12-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 4, 2024, at 16:40, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In move_pages_pte(), we may modify the dst_pte and src_pte after acquiring
> the ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
> already do the pte_same() check, there is no need to get pmdval to do
> pmd_same() check, just pass a dummy variable to it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


