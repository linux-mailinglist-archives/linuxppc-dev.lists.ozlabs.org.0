Return-Path: <linuxppc-dev+bounces-1556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F76983F61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 09:40:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCWx81KxJz2yT0;
	Tue, 24 Sep 2024 17:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727163628;
	cv=none; b=LMJ/CQDGNg3wt3kCNRu7hIqsO7oADZjl365KSgLuUq59pdwdgjiQgNhU32/pX7F1w5I0i1dJ30ciwKXej+9ERDzVlDRa8cNMKNyyXQZV2zram29ISy31QZCrXATWu3cc0E7SZrltUYTg9gu6SLA/oPrd52RED6x9wHE90Ot/Vj4oLVlllwLvd8drGrg1x22Iuau+nRyL9xlXmgTgQDdPzvBpO2xMk2wyYdq4RH09cjBMZg16SxHoae+k/R1gmvfwTZvg49jEp5G/hD98dJnCUU9qWmJk8E9wW0c0nYtdA+c42ENnWWTj6gUptljwqlb+f1hZlpHk/Bvxe+fBiZ+ZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727163628; c=relaxed/relaxed;
	bh=feLnDK54jWgpehNv7jGj+iux9/EZ9Wgvx1Gm5rmvg6M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fMVW3COjlR+iurwa2JGERbz/J2brubkLyjo9orXsWE0ogxDh4OOfIqZhK5klCkG3VrxhFc+mDG7yKm8A0BpH/H+qT7r0tXHxXlhSA58OJ04/nLT/C+EZcwfSKfRSxf6Veir+7gWaCWW91MBt7DhCsqHnrvBhI9M7w7wirL1i/Jg8S8SngJmwKr59FnxSUGijPADfL6by1ClZY5kwVpDhrMcH1MQXpb2UYx17O1P6sxIs/qGbXi0PaF3qBemQNqiolpa8kCOe7uf9/TWirQDrL7XewRlf7HqK/CnDltSNEmzHHvcPS5mIaf+9J8D2NI/QM1XNCOws4KUxLwzltbO/Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YPkedyFU; dkim-atps=neutral; spf=pass (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YPkedyFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.179; helo=out-179.mta1.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCWx76F3Mz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 17:40:27 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727163606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=feLnDK54jWgpehNv7jGj+iux9/EZ9Wgvx1Gm5rmvg6M=;
	b=YPkedyFU/qRPuoy/VtaBWlSgDWI8B2BI03Y7bNfEpngs/NFa8208jLRInhPul0eFFj+VSy
	+fFZzUeFSO22eScfZyubg4GNkcVW1clL3kJLI6JpuHZpWp5k7MqrHb79qaIv206sIuK4sf
	eo9VQMecooB/ppvUQTJvAMlpDNOb2J0=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v4 09/13] mm: mremap: move_ptes() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <c7b3ba9e8e58efe7bba9d52ce30a8ff4f4298e2f.1727148662.git.zhengqi.arch@bytedance.com>
Date: Tue, 24 Sep 2024 15:39:21 +0800
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
Message-Id: <EF701BDB-5742-417C-AAC3-99EF12997DFB@linux.dev>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <c7b3ba9e8e58efe7bba9d52ce30a8ff4f4298e2f.1727148662.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 14:10, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In move_ptes(), we may modify the new_pte after acquiring the new_ptl, so
> convert it to using pte_offset_map_rw_nolock(). Now new_pte is none, so
> hpage_collapse_scan_file() path can not find this by traversing
> file->f_mapping, so there is no concurrency with retract_page_tables(). In
> addition, we already hold the exclusive mmap_lock, so this new_pte page is
> stable, so there is no need to get pmdval and do pmd_same() check.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



