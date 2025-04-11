Return-Path: <linuxppc-dev+bounces-7601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91281A85787
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 11:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYrVs0MK1z3btn;
	Fri, 11 Apr 2025 19:10:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744362612;
	cv=none; b=W2DU45SFu+sszajeXIn+V+2PuMziTDbQmDTJQ2tW31hIfk1JMpMci3KZvvpA/b+59zu7SwuoAqCfwNdbGsh3ldJ7wmvhGOeXCYc4dvlBC2ZZ819JP3LLo8flgfn3pZIRcxze6gcWld+o1mZAjqFouuxCr+L6js40pF0Rpy5uKYePKrtzeuYEtNSmzB1uNw9FCtsvY1JGVZHQkZfhMIUxOy0pCZ0h498VRtReB/hPua4/jbCUkZ6qkU3VlPbi/cmH4Zp6DuQNix1KO6DUJ8X3rEmrJAIGaRZ0Obs7OgXrs9sdWT6Xfs3Po77XxZtQ2nZkWO3jYsyv7n/1gNJVSW3pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744362612; c=relaxed/relaxed;
	bh=mJk8oJWZoNTTd4On2KCVVk2OTo+TigBo7qJMvAZpZjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9b3yxrTmayYxO2MDcnyDjPEDwmQ7NHGJNLkMc44n8D1XVsHeCgGDqFmiOxD3SPF1lv4IUHmGMJavx7yKZzDPFhkQ5PVhfUNFjZBT3XVLlXqtVn3a/XZZ6zZvBP0DF2FdrazsYqRUp6WFFxvJMNz6IQJ3y9lcjYjgxadOKk/BLOqqkoWuaRkG/sjGnn1YUqeTcFN9ecaAyKQ1jwusWdemqTNW9h0ITI6Oiq0MHPBto5vX63HtS5WQAzbwaEU0BPYqk4yYxR8uMB64plMpigC2ko2dOjHhgLSByTIMrBp1kSUdGzlkrYTrxBQ4hgWo6WZh9d+cRhDNjKaBR+xSC6fpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NpaUQ7D7; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NpaUQ7D7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYrVp4kfWz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 19:10:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F75439A1;
	Fri, 11 Apr 2025 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED85FC4CEE2;
	Fri, 11 Apr 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362605;
	bh=8Zf1l8FhhOvmDcUrwydoQzHxR+9Hs6zytjuZjgAOCFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpaUQ7D7fXnA5CFSGpmPhrBob5/1s31V2Xekejj1hAORbvFeQbeIf8k7X2YJa4p4+
	 BiTxwRcHep9f5AZNUoEb0/k1GrbpavmRGU5KhbJgEXGSXTge/P/F3u/kkd4oKPTHFf
	 61EeLOenMgRZdkUnnNjVnao6HH9jNc6eScn7ZrfBcKgNdFi4Aou6YKVLHJ3eJhgm2Y
	 fEXDXXKA5tCoVYbZhtnSv6RWHciOO3GYEduGiKLpBDdznMarlfpaXG3uE79VVJcqFA
	 U6CATX8gDE7XYNOJRzrNfygVtr9kGiU1vi5fZAGt0HzNkMHc4ovCN6KV5Ij2WF+80C
	 Zed1ahSEbtH5w==
Date: Fri, 11 Apr 2025 11:10:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v14 00/11] Support page table check on PowerPC
Message-ID: <Z_jcaCdMFENW8KSG@gmail.com>
References: <20250411054354.511145-1-ajd@linux.ibm.com>
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
In-Reply-To: <20250411054354.511145-1-ajd@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


* Andrew Donnellan <ajd@linux.ibm.com> wrote:

> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
> 
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, separate set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

>  arch/x86/include/asm/pgtable.h               | 22 +++----

For all the x86 <asm/pgtable.h> function parameter extensions changes:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

