Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F9D763F0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 20:53:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RNkrFUcl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB32W6qBDz3cCl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 04:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RNkrFUcl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB31c6Vsvz304b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 04:52:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC97761C63;
	Wed, 26 Jul 2023 18:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDFC433C7;
	Wed, 26 Jul 2023 18:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1690397567;
	bh=CxP8YWy391Ug3Hzfo8N8jl+lKHtBCe6vTm0NgR+xnP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RNkrFUcloKc5NnzwRJDVvUvhoj6yDvBiENSJ87Cd3Bd9toX/a3lkLBZS5VyQ+7voo
	 PXSrdgkqwWLgN7+h5CX/VE3VmHAnEgNiDXyy+CErHGG6FK8L4UpqrLQ27ucpduXhko
	 SYIhAcljZnlfkqoU2ALxBcg014/dUH2dx8cuggKg=
Date: Wed, 26 Jul 2023 11:52:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v6 00/13] Add support for DAX vmemmap optimization for
 ppc64
Message-Id: <20230726115246.b6ed2a08aa7b648671107a8a@linux-foundation.org>
In-Reply-To: <47feb4fe-f461-a2c2-1368-5480d00d0f1d@linux.ibm.com>
References: <20230724190759.483013-1-aneesh.kumar@linux.ibm.com>
	<20230725122959.e9b79e7528cd3084802fa6d0@linux-foundation.org>
	<47feb4fe-f461-a2c2-1368-5480d00d0f1d@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, npiggin@gmail.com, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jul 2023 10:59:32 +0530 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> wrote:

> On 7/26/23 12:59 AM, Andrew Morton wrote:
> > On Tue, 25 Jul 2023 00:37:46 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:
> > 
> >> This patch series implements changes required to support DAX vmemmap
> >> optimization for ppc64.
> > 
> > Do we have any measurements to help us understand the magnitude
> > of this optimization?
> > 
> > And any documentation which helps users understand whether and
> > why they should enable this feature?
> 
> That is memory space optimization due to kernel reusing the tail page struct pages. The details
> of the optimization is documented in patch 11. We document there the impact with both 4k and
> 64K page size.

I suppose that with sufficient arithmetic one could use
Documentation/powerpc/vmemmap_dedup.rst to figure out the bottom-line
savings.

I was more expecting a straightforward statement in the [0/N] overview
to help people understand why they're reading this patchset at all.
Like "saves 5% of total memory on my XXX machine".


