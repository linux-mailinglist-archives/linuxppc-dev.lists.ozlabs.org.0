Return-Path: <linuxppc-dev+bounces-1552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F89D983D1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:25:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCVGm39Nnz2yQL;
	Tue, 24 Sep 2024 16:25:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727159136;
	cv=none; b=dK9a2VmXwo8JqMrUWRZqpMZp9hpvGdwtpiKDFBnDM2HCeCAy7iMQEDo/nLQ/fFAVDir/3j/TJ0GXnZZM8Ymkler4zNZbBBAoNWt4ALLUeorXfMXCZjgy4MObHoeLZykv6g7fjMin4UE08PEBFBq/b4EwzuRY9cFmABeoLos4Q3e6lPItoMX1HDGpIrXY6vJ7DY1Q0YjsxN+5xjWxXfBpW1n7PI4md+sMN5EK+ehEG8PZ6ADuYXFwZvtTyKvnjjf9qYd7b0YWWJU0D5hwRhnpRJ+PEiLLYY6WAfFNR9ZoxrJBOENU339O665EhfVq0eFcRxqe+3B7JTO0eIm6mFT21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727159136; c=relaxed/relaxed;
	bh=/aYhado5OwzZFYPAS8E74g3IrdHqPgkubeEg7xLGfQY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=onUxq0cMXIcxDEHklPhjbQ2VBW5rMN8HCpazHytfrn4nXRi4tuK+okID54MRJNKPM1WR7PArMVmplGN5SL6mIjyELJppylEBV3wln4b8rDR+/7Axg+2h0V9/t6H0FafXkWh20TgALXlDG+n0dx05Lv+GZFrBfSeJE0AozGr5yOBMZAyLtNdaMTs1zteu+0PF/cN/vf7zWA60WaoYO1U2C/rqLiMsWPPEisO1Wivmw1xvMozKv/H8dN1tAF2Q9Q2JTw2LIWeZzsUAEGCdWi1y99u5Vl6iArVkhX+E4gsHczLe6YLRP6sPtSmlvXPOeipZSagQuht5ZiuFHqqwC/p7Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vTZjTUVf; dkim-atps=neutral; spf=pass (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vTZjTUVf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCVGk0Kfbz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:25:31 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727159110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYhado5OwzZFYPAS8E74g3IrdHqPgkubeEg7xLGfQY=;
	b=vTZjTUVfu5HZHc+3wl9pLaAy6KGDor9B0L2oxER/ntkzITpVy7bWliohhRheobOThq/tnF
	HL4sONWWsPMW0ncQWMe9LLqRPKyHktICgGU+zUczbRyzISml4fMsH0chtX9RyvIJ4B26wX
	MZMt2nLfnJDnEtbaottDuuXxiTsw1nk=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v4 01/13] mm: pgtable: introduce
 pte_offset_map_{ro|rw}_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1a4fea06f8cada72553a8d8992a92e9c09f2c9d4.1727148662.git.zhengqi.arch@bytedance.com>
Date: Tue, 24 Sep 2024 14:24:27 +0800
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
Message-Id: <4D6AAB88-6BA9-4F7E-9EEA-829640D1BDDF@linux.dev>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
 <1a4fea06f8cada72553a8d8992a92e9c09f2c9d4.1727148662.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 14:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Currently, the usage of pte_offset_map_nolock() can be divided into the
> following two cases:
> 
> 1) After acquiring PTL, only read-only operations are performed on the PTE
>   page. In this case, the RCU lock in pte_offset_map_nolock() will ensure
>   that the PTE page will not be freed, and there is no need to worry
>   about whether the pmd entry is modified.
> 
> 2) After acquiring PTL, the pte or pmd entries may be modified. At this
>   time, we need to ensure that the pmd entry has not been modified
>   concurrently.
> 
> To more clearing distinguish between these two cases, this commit
> introduces two new helper functions to replace pte_offset_map_nolock().
> For 1), just rename it to pte_offset_map_ro_nolock(). For 2), in addition
> to changing the name to pte_offset_map_rw_nolock(), it also outputs the
> pmdval when successful. It is applicable for may-write cases where any
> modification operations to the page table may happen after the
> corresponding spinlock is held afterwards. But the users should make sure
> the page table is stable like checking pte_same() or checking pmd_same()
> by using the output pmdval before performing the write operations.
> 
> Note: "RO" / "RW" expresses the intended semantics, not that the *kmap*
> will be read-only/read-write protected.
> 
> Subsequent commits will convert pte_offset_map_nolock() into the above
> two functions one by one, and finally completely delete it.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



