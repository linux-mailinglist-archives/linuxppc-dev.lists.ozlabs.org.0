Return-Path: <linuxppc-dev+bounces-14182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FAC5EEF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 19:55:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7RCh4cJTz2yx7;
	Sat, 15 Nov 2025 05:55:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763146512;
	cv=none; b=BC4jfuqf30aj7woWbkTotkQn+jG4bSMyiNwzGAALfAShBB0vfR10J/N4DaNe8U/V/avyozRLyMlJqq7ng3Ga1M885Sa1iGVPBa/rPxwXfywhleIO2Jr01HrXs2ON0vrOMzsIFOWHi18Q0Y2gvVBE+ILJtd8ojSGvhTfA5xSZkpaMUDHf7mLcyBgiIXAGfQhx4N1FkmoLgQhT96ZVzjsseRR5HFu0gQhAUWaGKB4u8cjO3TCWgrBbOId6uCK9rrC/qHTMp+M9HloXmQanLzaF0BR+ZJwpyjvJlgdVUVQenPyXzjVueADyn93Xow3JReci4V/kLKlejZkEQ7jt2+ZEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763146512; c=relaxed/relaxed;
	bh=BSZ7Nwx1AvWu7mAZVmuradqomXtKIHLL0ikfemFoO2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWDZ1g2P5vgtQSZeeIEu66aDaNWtw26dhouRax6HYojgAa9WJzxbezvE+ZWfKBM8qjoqOJW2Eu2RG/sut71VnPvgXgw7sB07xElrCwP/APa3idZ1W6rbMThJrTJlqLs2IJ6hYwOal8k/bK+77B9rbbM9JIclbu8AAOtuyirCYmZUnA30Rg3xW5OVJc2qDtMxtRBVrL3r5ZupusS2HUBm2wunP6GOYhLgJRLxGpE5YBrRZ+jud8G+1TuXRM0/MWFgOHkAMjlHzVYY+nbQxaYPzsfu8/TMahz5QbFZN6T8F2s6WywV6RgR+Ho30mX4ytHGiaHlcN9wqd5WIfMFLZpd0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EXyj+jX/; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EXyj+jX/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7RCX3yS6z2ynW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 05:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BSZ7Nwx1AvWu7mAZVmuradqomXtKIHLL0ikfemFoO2w=; b=EXyj+jX/BCty3AsVD6q8QioIyM
	2Tu4hXDLT6tK2iLl7v3D8NpDemFXta54A9KS5c/9JTbl/kaYZYgeBcKsuY3S69miBq2y4AXmAv2bL
	YQD4NgIM7YIim3b0UHSaUhNRz/WimQx7WxGquDaJwIo7MVXyCTLDLjft8/UOa06x5up7w8+pMGpSw
	y68/Lux4D98y4TT/21m/3RbtLpiIPdbbkbKvR1UMPg15Onw3LD/mL7F2ndcPS9PxptjRtDtDfcio6
	/OGLs9hEtShvsTvCwTvfTocOLOwo5T+6WGd0vxdCn+uu4DRkTSGzyn6Pz7xZpcmyTbVwWnoXBj/An
	lkpE5YmQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJywa-00000009mlh-00u6;
	Fri, 14 Nov 2025 18:54:48 +0000
Date: Fri, 14 Nov 2025 18:54:47 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
Message-ID: <aRd69_c1pULRoKOU@casper.infradead.org>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162>
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
In-Reply-To: <20251114182956.GD2566209@ax162>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
> > >> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
> >     1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
> >          |                       ^~~~~~~~~~~~~~~~~~
> >    include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
> >     2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
> >          |                                         ^~~~~~~~~~~~~~~
> >    include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
> >     2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
> >          |                                 ~~~~~~~~~ ^~~~~~
> >    include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
> >       56 | #define SZ_16G                          _AC(0x400000000, ULL)
> >          |                                         ^~~~~~~~~~~~~~~~~~~~~

Clearly this is a 32-bit build, since otherwise a conversion from
"unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
support 16GB folios!

I say this is a bug in powerpc32's config.

#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
#define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
...
#else
#define MAX_FOLIO_ORDER         PUD_ORDER

(PUD_ORDER is 16GB, so I think this will be what's being picked up)

but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
clearly dependent on 64bit ...

config PPC_RADIX_MMU
        bool "Radix MMU Support"
        depends on PPC_BOOK3S_64
        select ARCH_HAS_GIGANTIC_PAGE

so I'm a bit stuck about how this comes to be.  Adding the PPC people
for thoughts.


