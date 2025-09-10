Return-Path: <linuxppc-dev+bounces-11983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC0B50D2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 07:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM8LV4kNVz3cjt;
	Wed, 10 Sep 2025 15:26:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757481986;
	cv=none; b=Q0/ebChcB14x0TWkrimM9Fq69ZB9HnJnEj/VyoaTM4eGka92k8mnDwrUF7Ci+3FabqFeNJvtpvfpfrEIV3M8/Aj2WuTAiYT0I5dyUBI/1Kdb/kgOjzN6AFJUOupw9Y6tBouFWUjQOwdseacpIV0OwQBayB2k4BDrV63ZPoY5TWO3ZoCnaKl2LM5RbLouo/RDQkS2muS3T4eiJ9oz5g8+RbXsCo4So4y0amoo9nCDNy5z4fR7VSsIIinXZ2QMAMjRpuIGOj04VLgi85QlTduNmteltQ5g77erDjczCmsmHeQconR/Hb5sv03e/3Ne2KKdGKm41TjAYitPHtiAUjOIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757481986; c=relaxed/relaxed;
	bh=nCgLh808zcItteVMXL9jaLEwx6dqzX8VyNuK8FSQYGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsQcZyfxMfFfA1G28hXWKwgzXQntqo7nkoeJTElEL//t9ABts+y2NzKIM7id5CKlVc2ywhrgG2oOgpc7I5D3AEWQui4R+eSRnLmb3fcEwUAP6TTjqIedefPrLiIrZlOylcwIL/fcnw7mXh6i+cWRqe4SB5M+5dBJKAuRx7f5s2Fd74/1Rov4RvF/3owo+tSLFxLBlMj1j44yy1G/Esztj8Nn1sAceIDB9XyD+qms3oeV52K1J+96mMBGUsnSt0/i/51kNepqaWQl2m7jWY6g86EdbJhekoY18BC7wmlQ+esEOpraS/+jK/HK3QcfamvVxopSOK1yv4BzxolNCtRt8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W3++ctIi; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W3++ctIi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM8LT6D70z3cjR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 15:26:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFB3041752;
	Wed, 10 Sep 2025 05:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF34CC4CEF0;
	Wed, 10 Sep 2025 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757481983;
	bh=bqpgnX0YeaX4gP4gTelyGSzbrLPxwuSSl4ugIJkeFPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3++ctIiiR7UFpzqM9AUidv9AQ1n3Dz1tKeZadPk/293ETffI9nRLBp7aQx9AFled
	 M5GCYM1B4a3jkkhLPVRESnUtwcqokI2ZK9ojJ1YPCMkJpjHT45Cl+QruyYKY3aGARs
	 FpovID2F5xbpoec1xDhgC6MFSHIrXsB7JTzFkx6nfm41N+Pm3w/y/LnuGSrU2VRkhJ
	 x7tt8kh1ACIrOtgalXRNyxNgQvord1Z8/t1JGvHRdIaRHxawPvJnDmdHHJxvC9RDqD
	 RQiYwqXBRXcawbcju2eKP99VtdepUl8ofw/258NbTAl3BVZxhNFXZSkWH5N4CtNQIn
	 DIZ8LyFL6amIQ==
Date: Wed, 10 Sep 2025 08:26:18 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250910052618.GH341237@unreal>
References: <cover.1757423202.git.leonro@nvidia.com>
 <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
 <20250909193748.GG341237@unreal>
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
In-Reply-To: <20250909193748.GG341237@unreal>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 10:37:48PM +0300, Leon Romanovsky wrote:
> On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> 
> <...>
> 
> >  include/linux/page-flags.h         |  1 +
> 
> <...>
> 
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
> >   * available at this point.
> >   */
> >  #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> > +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
> 
> This was a not so great idea to add PhysHighMem() because of "else"
> below which unfolds to maze of macros and automatically generated
> functions with "static inline int Page##uname ..." signature.
> 
> >  #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
> >  #else
> >  PAGEFLAG_FALSE(HighMem, highmem)

After sleeping over it, the following hunk will help:

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index dfbc4ba86bba2..2a1f346178024 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -614,11 +614,11 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
  * available at this point.
  */
 #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
-#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
 #define folio_test_highmem(__f)        is_highmem_idx(folio_zonenum(__f))
 #else
 PAGEFLAG_FALSE(HighMem, highmem)
 #endif
+#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))

 /* Does kmap_local_folio() only allow access to one page of the folio? */
 #ifdef CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP


> 
> Thanks
> 

