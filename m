Return-Path: <linuxppc-dev+bounces-732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F32963E26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 10:14:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvYwh5tptz2xYk;
	Thu, 29 Aug 2024 18:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724919284;
	cv=none; b=Hn4YHJd836vRHrsCFvNdtcu55/UPcE9OXcIq+VEWBVfuv5NK1RnQUN0mCRuxOOjfO71q5vSWbo4O1Lv71xei42KcBZpOH8H6EPdRUSpWV/OmqaLd4VJ92HmDwd7zK5j1Ayo+O0MupqmIh15TmDZOwXctptygAYLsqiTVUHlbmK3mHQ/eHtfHpa6+BLhpu8IKAvevOW0ZUvC54kYI8mF/QjglyG9u1RaOKbSd/Desxk195DAm7YXVQ1mpHwEyePZtCKV80Q/cV+lZ+7pq6ao1x6u/xq+3w2aNM07uTRUVEV443AH9VFbiedDJ3+qIkmjbLJDYHkIbbKqWGYCEuRmtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724919284; c=relaxed/relaxed;
	bh=C1JpaO0p578z0JlRYTDlBV8oEu2LaEMO2fmkIIoTjZ8=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:X-Report-Abuse:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Migadu-Flow; b=SQM9QJGoNu0pcQBFM6au+RglbeKUIdto8yTle8W6SAf6Fc+vu69ScG+nxIs+tC1yIyNDWV2r8KXmjz/rFPaGiKPPRzaDEby3JFua+c6dfD0/TYDbW5Y0EnH90JrrwFZLmPI3ygvC9hEWimi3NkVerXi3bCecZm6R2UsDSoSoeOq7IFQFhSrLs5zzp4vWYJh+fCb5wV2XLWJ70koYLWPZ6qYG5tcDs4J6hYFWz3U4Km9n1KmNERsVDnsDGnrJ974ooJsXlO2GNnFvCNFuRfg2CyUXg5PtnYoeYNuGIQiF6FcXbTwvgPkJyqubmhMZXeSSb6K6GbOtKiaPtwxW40+EPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MZhnUD3O; dkim-atps=neutral; spf=pass (client-ip=91.218.175.180; helo=out-180.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MZhnUD3O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.180; helo=out-180.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvYwh3qRdz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:14:44 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724919265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1JpaO0p578z0JlRYTDlBV8oEu2LaEMO2fmkIIoTjZ8=;
	b=MZhnUD3OA6hfnpuCvhcT9WanxHGrxto7GxoZAz+ucJTqn5NEbWKTeExpkW7Z10o7NMM+uw
	JQ6hiuDtDCC3rIREnHZ1BAwCYMqdyDNy0YQu3Fd5b3vrMXbiqLFyZpJ570SDylBHjZqA/6
	JdhGRC8uQe4IxXbqdH48Oj+NaVM+1So=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 08/14] mm: copy_pte_range() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
Date: Thu, 29 Aug 2024 16:13:44 +0800
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
Message-Id: <A619C874-E6B9-4D07-82B9-ABBCDB39DFC2@linux.dev>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <71100c3867c4cf6f5f429ce9f2db8432066d0e99.1724310149.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Aug 22, 2024, at 15:13, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In copy_pte_range(), we may modify the src_pte entry after holding the
> src_ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
> already hold the write lock of mmap_lock, there is no need to get pmdval
> to do pmd_same() check, just pass a dummy variable to it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



