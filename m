Return-Path: <linuxppc-dev+bounces-5166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF4A0BD7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWyQf1r9Bz30V2;
	Tue, 14 Jan 2025 03:29:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736785786;
	cv=none; b=D9KJi64HbD8bjJukZmcvYqVT5nJpA7q1r6U2MQs9MHRBRwVAEK1mr0O0Pfgit9u1d6hIqYfWmkLwkGJ3rebEgh/kkLka5NrxxRFsNmU3KX5bogI1Shq0ZY5Jn5faRiNOdjjwvonqywRETxgq9w8WpjLv31ymye6b9YB917ccsUvJNI8XWz4bBjDMoEiRMEmOitR4yXVUdddLeOCaJp145m+ZToJv2py3AGnlHQpP4pQLflhebJQgJIYvpPGAz6uOUitFjS5nTXYRCbb45oBjpxaijWtOuPBNR+Spgis19KseFISZfNebSAs4U0Xp+rq9RAV86BjzrYTFE4O/YG0Buw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736785786; c=relaxed/relaxed;
	bh=Vgd/0g+LaWmef5gDX62Sg126yqP4bAmhxx9nw+tAZek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pqg7c7whl758ljf+R48rjUq7/KHCAAWhIc+cfbn9tnSbG9zU3qPmTT+1Ha4VgfTRKjn64+AMxAajmkkLgQoh2O7Zt3dDkbu6VC+KjdJwlgyPrgliOv3bTZrG6TU8kmIELHWtjsmhLVMYWWasoPLI6T55FFb8DpxeyvzfWRcna12i/0CPYpcWyIQXqQAt29CZw49PHZORcx4MyzF1q/POkWVk3g8gfDEPB9BTQzakh1NQmR70hFUzgNtBxaEQuIEa74t31YVCSZb8xCfbaiTqdRs7soWF10yq33Cw1KcWRRi0fGLrCoiT8nLgYAAQOqIdj+JClQV1aHQBd1Z2QIqNcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPMzoMzo; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lPMzoMzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWyQd0bvdz30V0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:29:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D37DA5C56E5;
	Mon, 13 Jan 2025 16:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749DDC4CED6;
	Mon, 13 Jan 2025 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736785782;
	bh=G/WL7za6/FhMEJQUPPYaVa5AR3im6p6zdx508VpTd8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPMzoMzonmm2uaOFLfrdzxlqYEZB9gyC4UNDIA7tmVyD1CdeiDw/0q7HTvvJaEdU9
	 O8zfvzFkV7uaD3Eeih9wt9NYEMgB9jFV0IHWkVr1H3T/eBEPpuOfFcMO/Ou4iLVDWQ
	 Hml2UsTpltlAGqg8dCV2vjov8Jfdy8hAWDfRY3MLkqHK6jF+OtTwqCUS2Mr7UtQJAG
	 LdHkSaSmCjlHGRuBlI0oL1FiCdYRvc0JfAH5RdDfH6z1lRwE3aqHCLNuC9IujuiGvW
	 +MOXpYRLwV7Hg46tyDx5cj6hTBCHBY3taAzyPWeFgdxktJaT7Of+Zg4hhGTcDn07vF
	 bC7Um3/mpT7aQ==
Date: Mon, 13 Jan 2025 16:29:32 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 09/17] arm64: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Message-ID: <20250113162931.GB14101@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 02:57:25PM +0800, Qi Zheng wrote:
> Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
> table pages can be freed together (regardless of whether RCU is used).
> This prevents the use-after-free problem where the ptlock is freed
> immediately but the page table pages is freed later via RCU.
> 
> Page tables shouldn't have swap cache, so use pagetable_free() instead of
> free_page_and_swap_cache() to free page table pages.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/include/asm/tlb.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

