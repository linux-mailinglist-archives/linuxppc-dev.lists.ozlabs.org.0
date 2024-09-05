Return-Path: <linuxppc-dev+bounces-1055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2E96D85A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzz79224Tz2yvx;
	Thu,  5 Sep 2024 22:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725539045;
	cv=none; b=mKgM5PQNsDyldho/rNVkf8eWEcn9Y0NZj94iVOxQPyEkiI100vXkB/mj1u4JAjvbG4+tWPrBnGLF+95dwl0trrH2IK/rGIOcn7r6cVkzZlMsX6KtAX3E5iBzOs5s0lBvVwTMQkIyvNdoMl1gnLIvv7ArrANw7JMmIb3D63fu/GgM/9ye234jce4yJGyTRBu/f6FkU5nk8YPkrjoRFrAjPYrat4nDzZnUknjNAVtsZvY/xFXUT9aVEMOR54FAC2R4b0aUSVGMtW2GwGeM7hkqF5nvgWURKolSbp//6+GFVKukER2S9Gsiys01KupP60P0p5BLiY6ZNzKX5KFSgxFA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725539045; c=relaxed/relaxed;
	bh=lLByLv8rw/zOL3j4lfqH8Y8PpLKTX3K0pHjcs2rvP4s=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:Message-Id:References:To; b=cXVEcYHrTUOMNPujzNlTl/+cJmRFW+fg3YW8m/wocXQnx4p0BAfnqaUZatQ2KlwKhu/L5DeqKEGcnOCKsoLTgagN+0wntrsTNAJg+wMJ2yzvjBfNNONijPNu8NJ/ETGKK8lNloV9wyJv0kQxBiWVEHEXVd7hdo7xGY7RRfpxXJSd1GAPfMaCeWsciUDFWYN9dRD34nBadHUdDX88JbzD4Lm+kMFP5hPVhp39qCN3uyQev0vRZmIHB7gEjKz1PwJ+Y5l3eijOTSpPqnBCbePxcsNgMh9p9OYIkAO3+qeciqjfjHVtfKixJ9z8PTdt+qmDVYOimS0vKN6COX/zwINSMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qIprDKky; dkim-atps=neutral; spf=pass (client-ip=91.218.175.181; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qIprDKky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.181; helo=out-181.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzz7873fXz2ysg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:24:04 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725539026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lLByLv8rw/zOL3j4lfqH8Y8PpLKTX3K0pHjcs2rvP4s=;
	b=qIprDKky84jYBcTOlWU0VsCg3PCkUABBoUNoabNnPl/kHYtmLYn6JrjyHwQZD2PlANABeN
	SWQT3EbNY1AeZs6F/KKpmrJh7OKyFFzsvYVx4NEjaerCpC5YiPojpdrWYArdGSJX3H6yJE
	rdLsViLeoTGcKRE4dGRvnpDBrtxgxck=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v3 12/14] mm: multi-gen LRU: walk_pte_range() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20240904084022.32728-13-zhengqi.arch@bytedance.com>
Date: Thu, 5 Sep 2024 20:23:05 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
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
Message-Id: <6867F624-A83C-4A3C-947D-ECFA4925130F@linux.dev>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
 <20240904084022.32728-13-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 4, 2024, at 16:40, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In walk_pte_range(), we may modify the pte entry after holding the ptl, so
> convert it to using pte_offset_map_rw_nolock(). At this time, the
> pte_same() check is not performed after the ptl held, so we should get
> pmdval and do pmd_same() check to ensure the stability of pmd entry.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


