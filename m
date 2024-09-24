Return-Path: <linuxppc-dev+bounces-1555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A088983F3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 09:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCWrq01Byz2xjb;
	Tue, 24 Sep 2024 17:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727163402;
	cv=none; b=QTkr9mphZsxAup/Mz3biU0UYL/rCjtzqgX6rC9SdID2Sdx4LtIEh8PlHgQpjmN9ogzXMidbD648roKwCWSekEdROVhYxmof3JeY+Z0JTMds+1Lv36ulZwZNdh58pSr0alfRBx95uEoWFKEbzO4n7S+qm4rw7yThumtyl+pJK1yJiKrSqLNzVa7yTaAmla3pVLKR+J2rB2/YEuc3gPkB6gPEIqokA5RpQQNQbJGi3XaEhjzNjcBVnhVELR8lgFFTL/a2ltPtoNGmPWO0KS4JAalM5HwTXFxXax0KzOs0QzUd0WDdyq5RNUOQuC/44/Cho2O5ZHJ96xK+PivpdQzrxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727163402; c=relaxed/relaxed;
	bh=DoLXxu3sHCyM5uOz8aZIUvfdOpT8jMclqRj2gZrUUOM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ilLgkwbRNhhkfCEriB4ltWxdzuajBbSJXBO9tdpkBSsA63ICPS7YeECvsaDKrA8e/Lu8IDy3+kCHGGYPcu6hRquG/Om4ehbRYK1Ik9aJzqE5GvOfQDQa095m4VLfKgSYcic5YFiN3J5bzLKY7PmG1PY2cv4bQOS3thWjzmOqTTD9knb39cpO0AxUKkdia/pGfGOvKIkffbyBb9W/S2GkeYADaNxUazET+t5jCeslFEcQW5/gRBLg5mdXni9SFNYbnmxEp73GPHl6S20MRvNYYToyT3aRFOaFPkLPjjxJswnLIiaevgucKnW79Tdbyssz7qPwfZXz6C684vKL5ShRfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TeIzHIRw; dkim-atps=neutral; spf=pass (client-ip=95.215.58.181; helo=out-181.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TeIzHIRw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.181; helo=out-181.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 1269 seconds by postgrey-1.37 at boromir; Tue, 24 Sep 2024 17:36:41 AEST
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCWrn0hwkz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 17:36:38 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727163378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DoLXxu3sHCyM5uOz8aZIUvfdOpT8jMclqRj2gZrUUOM=;
	b=TeIzHIRwa9J+AAi/w/MnUrNvnJp4eggEJopgtjtdGBDKCoMm28m+up3f3+siiMNxstukd/
	sRci7QOJMrJjuYp1XIEk17HMgvkqe9hLfpxdl0GvCaoKIW4HaxGHx1o9ZOHh2/3Wtf1x4o
	qUwgrE28b9B2kx+PKH4ccRCtzch7RJA=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v4 08/13] mm: copy_pte_range() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <b70b7cb91e000d540773a0e892789da64ab6c108.1727148662.git.zhengqi.arch@bytedance.com>
Date: Tue, 24 Sep 2024 15:35:37 +0800
Cc: david@redhat.com,
 hughd@google.com,
 willy@infradead.org,
 vbabka@kernel.org,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Message-Id: <65E61995-5C32-48D4-ACB4-761EEAE7A585@linux.dev>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <b70b7cb91e000d540773a0e892789da64ab6c108.1727148662.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 14:10, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In copy_pte_range(), we may modify the src_pte entry after holding the
> src_ptl, so convert it to using pte_offset_map_rw_nolock(). Since we
> already hold the exclusive mmap_lock, and the copy_pte_range() and
> retract_page_tables() are using vma->anon_vma to be exclusive, so the PTE
> page is stable, there is no need to get pmdval and do pmd_same() check.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



