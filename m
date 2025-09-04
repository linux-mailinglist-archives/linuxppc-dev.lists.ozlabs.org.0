Return-Path: <linuxppc-dev+bounces-11725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60DB43AD4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 13:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHdGH4qg3z303F;
	Thu,  4 Sep 2025 21:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756986935;
	cv=none; b=cwxamQCTIEn/hNmtOqkksQyI5+LFsPJXFDOD5FsHILV3eo2CbXKlyP2zN7uPq04l1pv27xPe3zY7O1zhk6JNbI+lF+79TyUMLDtDb8MoK/4J2Pb/VDYXZapsI6k49XT4rlUh6ccdeIWvNRlANiPp/ns13IJmuQd+vQbWhqP6adO72CQs+0pw3PmUR+rOBdIe2gmLmaSHXN3eEOCBePbh+LLT9aiYaE+lvWMpmMa2z5AQ4//EYTHREQlZwugTKchdq6GNgRgwRcFvL8xOUFPG8TVjtmvDzSJalgUzMoaYW4xhTMGk6HOY5LM3yw1x84DOtRhU0+hC5nqkaiZgZ71KTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756986935; c=relaxed/relaxed;
	bh=jgcDdqOqUi/8D0xc5CjYvzb5Vi4Dqd8Gi3YciLv8nXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F17JjMbpcgy4iDOeGiYHXhSPtQbJCQUwDQyuByN/nuN8up9RRB9lUcv1TqRpzqszb9yRi+nE5GmHDMQWXRAWengG53wtNQjykyMfwjtniiCQvFoLmRd3fODNKQuTRDR3oZ72JrUtRpKDhlkNf5uSrDveCRm0BCo0CekW4IjNHbdQs4dAvyEu1DYrjHEoJCZAX+oXkF90QhJvbz6gB3yC9HUJp/RkMOcw5yti7EjZjUXf2NnUWUJBADVoA+PD0ThKF1DIpluIzrXO46letANu+4zKA7YAw0jwPzol0RmhCNwt44D5ddBAsJd4NPCom4h58w/mMZAFLp1c2FRUx/DHJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a6mjvK+4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a6mjvK+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHdGH0Y20z3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 21:55:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 235AD60212;
	Thu,  4 Sep 2025 11:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A6DC4CEF0;
	Thu,  4 Sep 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986932;
	bh=L9cH6bNwYJRlk6FzxhgqsLMYSpGTEmwCEBwi3x9KT/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6mjvK+469qhzIL3ZY7OLkZG43jt44zcrcpC0SLg+x90jVrWCN4wHiXo7MpMy7adT
	 rFtCuOtKzPv3SCl+1a8iA9VpOzMBrPDZJJ1d9Vgu/n0MZO+y/Z28JeLMsddhB0cWea
	 RleDBDLnf3OLJlwClV84wBgTsGkZkS81LNVCy38Ye4/7nOnd4gE/t0eSwIeO5ttp3B
	 H+owTOKY2NwyL6jQxgmnOxrwFpmn6Ou6pQwbhAXkR9KUmS6EjJSZ5jPtIfC8BuANMa
	 8R3iX32k2EwaEj3QR0QO5ZPrGtPX/z8LW7tiqgfBgjIhl4xmzLimlzEm30SP6ANOKo
	 kaDVgda/8+bIA==
Date: Thu, 4 Sep 2025 14:55:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Justin Sanders <justin@coraid.com>, Jens Axboe <axboe@kernel.dk>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/7] Cleanup free_pages() misuse
Message-ID: <aLl-Kd4nmgSEr8WV@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 03, 2025 at 11:59:14AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() is supposed to be called when we only have a virtual address.
> __free_pages() is supposed to be called when we have a page.
> 
> There are a number of callers that use page_address() to get a page's
> virtual address then call free_pages() on it when they should just call
> __free_pages() directly.
> 
> Add kernel-docs for free_pages() to help callers better understand which
> function they should be calling, and replace the obvious cases of
> misuse.
> 
> Vishal Moola (Oracle) (7):
>   mm/page_alloc: Add kernel-docs for free_pages()
>   aoe: Stop calling page_address() in free_page()
>   x86: Stop calling page_address() in free_pages()
>   riscv: Stop calling page_address() in free_pages()
>   powerpc: Stop calling page_address() in free_pages()
>   arm64: Stop calling page_address() in free_pages()
>   virtio_balloon: Stop calling page_address() in free_pages()

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/arm64/mm/mmu.c                      | 2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  arch/riscv/mm/init.c                     | 4 ++--
>  arch/x86/mm/init_64.c                    | 2 +-
>  arch/x86/platform/efi/memmap.c           | 2 +-
>  drivers/block/aoe/aoecmd.c               | 2 +-
>  drivers/virtio/virtio_balloon.c          | 8 +++-----
>  mm/page_alloc.c                          | 9 +++++++++
>  8 files changed, 19 insertions(+), 12 deletions(-)
> 
> -- 
> 2.51.0
> 
> 

-- 
Sincerely yours,
Mike.

