Return-Path: <linuxppc-dev+bounces-2105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6099A11F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:18:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ2d63wq0z3bvf;
	Fri, 11 Oct 2024 21:18:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728641882;
	cv=none; b=leXy1SFVQWsPTAjlChKpIKQ6DlA7gXFenptg8EkYRFCw3/8+oV7heXgL4VcloKmmWEBfj+MTbaVnqtyBXa1D35WzPWe9ccvCiwyoSKaNvJvZl857Xhai4I6oQJhYpMZgDhwRLkNiL4vwaBKh4iF0MDqgwsGoe8WpY5T2Cf9M6Jlo5hJMbr1l51NKe4qa4Srn0J77zvyCbIEY+RsUWJP1fOID6opc6YsNk2Lfbg1TygFPjnE6wANkxrYD7oDu8LRT4MA248t1MSGrK30zb4jiJJsfJozbBfXM52OLANUOWh38rzio3YVUTFZ4OlEZhGzXKzVqeHz/0OLxIQfQAd5/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728641882; c=relaxed/relaxed;
	bh=Aow3TJ3nQrfV5JgcQs4n2GrgOqvsaJyLKOJ0CQrSIuo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Owspf+1Qz3nnOPWKXRVLr1z+3ZlTLW2ouXO7sb4AErIYzUl1LGB7pnyhYjpk26DJJcRgS2B9Ys1J4EVq01flLQm6c+VHhMf5r9bnl6u9pGRmm033qTK2gr11GWfj8JJ7zQbXhQ+lmN6L8iEZf38z0ULgMziCcy0ccJChpd9izZeL1zRa3ZI6dm8PJAasgTTjvCF5YJy154JKV73rYn5EWnQoprueEHGLA6qEXnpeA23g6/0A5qgX4w6WwjJnOMQhZ9yans1xjXYXkJOxY1fooldkOAm60UnsPDwti3ESBd5chdKjW/6G/N5zFpibw1gfaJfLvf4dSxmIMOlminH8eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FN6XZub1; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FN6XZub1;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ2d42S2Pz3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:18:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728641879;
	bh=Aow3TJ3nQrfV5JgcQs4n2GrgOqvsaJyLKOJ0CQrSIuo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FN6XZub1+7a2gjiGz5Hf+T9MJ4IoX4p03XA5woNlICEXJ0lIeT2ixVvGPGFPX4sTs
	 Afe83MGI5VycnY9lLOLtoaiHTN3V7LG2mNWR5xP/sjqi52g5Cd5NwLTuf0Dze5iAyE
	 Qycm8kM71TNb8POMqtJQ4Qns8nKYmhGKGnBOmhzRhL7FzhbQU/7zNAUT+ENGK4rUkU
	 SVeBZW49JVuJhq4259LD1JuyLUMbr1IKsw/mmP3JjpLn6pKMSUoxzVj22cZgWvWAee
	 qe+u21ow9ReqFx/UQkCDPkmzEOJcicQwbEjhOZh/DK11BXHTLpHrjCH6aHgnCgI8+Z
	 aaPsRBeZOLu2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQ2d30BPSz4x89;
	Fri, 11 Oct 2024 21:17:58 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari
 Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, David
 Hildenbrand <david@redhat.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh
 Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom
 <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin
 P Bappalige <sachinpb@linux.ibm.com>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: Re: [RFC v2 0/4] cma: powerpc fadump fixes
In-Reply-To: <cover.1728585512.git.ritesh.list@gmail.com>
References: <cover.1728585512.git.ritesh.list@gmail.com>
Date: Fri, 11 Oct 2024 21:17:57 +1100
Message-ID: <87zfnb54fe.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
> Please find the v2 of cma related powerpc fadump fixes.
>
> Patch-1 is a change in mm/cma.c to make sure we return an error if someone uses
> cma_init_reserved_mem() before the pageblock_order is initalized.
>
> I guess, it's best if Patch-1 goes via mm tree and since rest of the changes
> are powerpc fadump fixes hence those should go via powerpc tree. Right?

Yes I think that will work.

Because there's no actual dependency on patch 1, correct?

Let's see if the mm folks are happy with the approach, and if so you
should send patch 1 on its own, and patches 2-4 as a separate series.

Then I can take the series (2-4) as fixes, and patch 1 can go via the mm
tree (probably in next, not as a fix).

cheers

> v1 -> v2:
> =========
> 1. Review comments from David to call fadump_cma_init() after the
>    pageblock_order is initialized. Also to catch usages if someone tries
>    to call cma_init_reserved_mem() before pageblock_order is initialized.
>
> [v1]: https://lore.kernel.org/linuxppc-dev/c1e66d3e69c8d90988c02b84c79db5d9dd93f053.1728386179.git.ritesh.list@gmail.com/
>
> Ritesh Harjani (IBM) (4):
>   cma: Enforce non-zero pageblock_order during cma_init_reserved_mem()
>   fadump: Refactor and prepare fadump_cma_init for late init
>   fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
>   fadump: Move fadump_cma_init to setup_arch() after initmem_init()
>
>  arch/powerpc/include/asm/fadump.h  |  7 ++++
>  arch/powerpc/kernel/fadump.c       | 55 +++++++++++++++---------------
>  arch/powerpc/kernel/setup-common.c |  6 ++--
>  mm/cma.c                           |  9 +++++
>  4 files changed, 48 insertions(+), 29 deletions(-)
>
> --
> 2.46.0

