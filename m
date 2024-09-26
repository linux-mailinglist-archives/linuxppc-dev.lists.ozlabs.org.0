Return-Path: <linuxppc-dev+bounces-1619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED4986D45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 09:10:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDl972J63z2ykc;
	Thu, 26 Sep 2024 17:10:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334603;
	cv=none; b=Drp1O6I+KUbRbZdUqcH/CT3B2PhqIkChqQieL8w1C+m0GW7P+DF4Mp05vjrcMsuxfBZSV64Snj/B0qVLFjU0ddidQwkoC3Upt/x5Z0MYt1tnlEEMXP02ldt8yrHXW99NqyM3oV1dvhj/ONfolSPxM+TIi4hVVZjVgl1PBGXjIrrNM1bMcLoYpkBH/CubF0QNqCDQ4gv1EnYbJg57ExIRemSXN5x231h5KGl90LK7I/5vFpo7NdWTsl7HxKjfxkbzmuSwUPy+U/CfU0cjIcBegd7g/NSs+rhov0LS6yD3OxKSWiMDO19S33uAS+IAg7cMv6sDTbIoghmq4PbyVs7s4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334603; c=relaxed/relaxed;
	bh=wu2H9oCzBNDNFygmuv4LIUDixIi3SoCczsdVGINmQ6s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BY3cxYNhSY0hE6t1Y2PEz7ERv34pNhreQomWYi1MFariJUKV78BXbEf+jpG6dsD5Pe1PesWrAswn83uILXIOeHH8oIN183VR/7/RmShnZCd+uBlRUiFGYuIFZJ10iSqO3qJbWc964HkbWJbvgfGiFy+JC7TJeLZKJkw09GwrM5uiM01SmWN1jbr7ifPGu/XvA+WBKQ1p4kA+RIa57SRRjkZgGkDVUGKBkrVzEtL17JCouZ5dhEKkQFBGnmynG9FyZ8BIWa4z9JQiwbABts+MmkD+6plmGbC/hKeFuUZ0oD+vEC3DWqm5jZav4X9ews1hpl7IUFK3xt/RhJ6IXofnZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FzQRxgPk; dkim-atps=neutral; spf=pass (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FzQRxgPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDl970KMyz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 17:10:02 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727334582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wu2H9oCzBNDNFygmuv4LIUDixIi3SoCczsdVGINmQ6s=;
	b=FzQRxgPkVajfTnEaxLqPfGqDVOfaRFQk/aaj96WnwiNRuSD6XzWL6p+fBCgWivm8eRCkW+
	p5VdhJ9DuZIiQ6LAYVdc5Eil/kT1FnKsE46cPPHRIyLEslkFmE/OSJN4y44g6o3jboFkj8
	nWiW64JSBFfY1euJ7276ockRhHozJQg=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v5 10/13] mm: page_vma_mapped_walk: map_pte() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <2620a48f34c9f19864ab0169cdbf253d31a8fcaa.1727332572.git.zhengqi.arch@bytedance.com>
Date: Thu, 26 Sep 2024 15:08:38 +0800
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
Message-Id: <2C926DC1-AE51-42CD-8351-62A130D0BC4A@linux.dev>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
 <2620a48f34c9f19864ab0169cdbf253d31a8fcaa.1727332572.git.zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 26, 2024, at 14:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> In the caller of map_pte(), we may modify the pvmw->pte after acquiring
> the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
> this time, the pte_same() check is not performed after the pvmw->ptl held,
> so we should get pmdval and do pmd_same() check to ensure the stability of
> pvmw->pmd.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.


