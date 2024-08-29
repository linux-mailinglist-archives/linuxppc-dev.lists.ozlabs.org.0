Return-Path: <linuxppc-dev+bounces-727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C1963CBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 09:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvXqD5MCYz2ypm;
	Thu, 29 Aug 2024 17:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::af"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724916296;
	cv=none; b=YGco34daxNeoTbmXsYWP7vmgZMeeUN0RiM+/JPFOMhXqK2VydKoHJvoqJ3S8z1AyQ4xS4rCBHNJDRJMLYytqQOIzW+6DVE1AIlUnHYf8AqTi37iNDkA9zkzjnSSm+SlnXsWb1cV/E9tQScBR6+O5n6i2oMXP41StMsX4kg+6tVTAmzansiCLGDedM2rs7d/qDrgywNuPTlHH72nptyqs2auQ18XG9zLZrYnpVMZekBOz6QQS+vWMdmATJhPoQ0Te7l3CX9TNNaLorx1vY1d6VP6f4+XZtlZyn6v5W5PqZ7xbJdYAk4JN4OMSPVr7GfEBpJ7wZIuqkLzPoeQxbGgBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724916296; c=relaxed/relaxed;
	bh=ibRF3sJS///pheO9Cf0+PnOoPzFh6pbCWCOa8dk4b5Q=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:X-Report-Abuse:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Migadu-Flow; b=NBt9UPChoBl+XvmQbNJkojWT8VjauZcBG/300u3AdhDVCyXgCd4h0Lqb85OQtMcMwWW2cvhajQDMeR7P/LjFTngqvOqO9NcX9U2S10RD9gyZWja4B7ze/904L5sJEywXrbVcDLeA1P7FpVcDwzwt4DKFFay8WpYfJVtSmqMEnmqhWC5oXPjY9+c3WIRbNHi55xu3+5Ov8pSRqu8zp7E6EtRnlHpQPIJ3/uNz5SOupNbDr5JuDWrk9+I1GjIyo2/2XMUKCM79nvTi2/KZT+PtMFCSX4msY5/HFrp9iG1MsVQG2NWAMH5X64Ll73U9OFaRQK0O2PfnjwNwa6WWBzLnPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZKaNv4j; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZKaNv4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [IPv6:2001:41d0:1004:224b::af])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvXqD3Fx6z2ypj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 17:24:55 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724916273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ibRF3sJS///pheO9Cf0+PnOoPzFh6pbCWCOa8dk4b5Q=;
	b=AZKaNv4ju75SNUiZkk8cP05CS3tLWGtxkgBiXb0D25lMffZHabcgUima2EVYz1Mk2by9rC
	kOF3ogFkN+0Y0/yORAjtZP3nGBtY7KVuoWuDH0ZGkdWjUQFQbzTH7tvzDHvFAc8nPdYpsj
	9guwGqp5zfBuxOIrdfRqa4nOqqi+Ml0=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 04/14] mm: filemap: filemap_fault_recheck_pte_none()
 use pte_offset_map_ro_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d5d4744c87c759a53b5e115a0d59326232696f61.1724310149.git.zhengqi.arch@bytedance.com>
Date: Thu, 29 Aug 2024 15:23:32 +0800
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
Message-Id: <9FA797E4-D835-481C-81B3-7B40A9648FC4@linux.dev>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <d5d4744c87c759a53b5e115a0d59326232696f61.1724310149.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Aug 22, 2024, at 15:13, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In filemap_fault_recheck_pte_none(), we just do pte_none() check, so
> convert it to using pte_offset_map_ro_nolock().
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



