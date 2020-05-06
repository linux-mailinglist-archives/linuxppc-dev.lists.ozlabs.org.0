Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF12B1C6837
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 08:14:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H5sR0kcHzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 16:14:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+6d584a7a2daf23bdd0a2+6100+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H5pW310kzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 16:12:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P11S868Du0HesvmsqxCwWCcyLr9HALCMySezlQJYbk0=; b=oP1hjP2OSgsVM0gfohwmDa6TcJ
 pe2nyvwO4gyPy3EogWVPUyLuJPjNyzmhpbMc6GD0yzBaUgwBJpYMZIawh2cAn7pSWJAwKcIy+N0iG
 9KkDB6HJKLdpOkO/nyh4dRaVF84SQb2vNPPhyCMtxFB0WAak2bb8S8mhB4zF3CH0ftvBkjXoHBk1j
 lXn9GQGt6AGvGJ41Jsb/VXUqUImhdk8jGfzPUaJrKaKm9H3m2LOW5RvK+roHmF5va7Rs/3C0Fi/Yg
 iNoAGMMEenG3ML28zKZZs3mCsUTgT0wAnSwGRhowW6de9Ed1X2TZvrXtds/aJBumQp91Nu+3irWcY
 Z2xba3Cw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jWDGz-0003zA-SZ; Wed, 06 May 2020 06:11:13 +0000
Date: Tue, 5 May 2020 23:11:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506061113.GA5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-6-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> During this kmap() conversion series we must maintain bisect-ability.
> To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> remain functional.
> 
> Create a temporary inline version of kmap_atomic_prot within these
> architectures so we can rework their kmap_atomic() calls and then lift
> kmap_atomic_prot() to the core.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V1:
> 	New patch
> ---
>  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
>  arch/microblaze/mm/highmem.c          | 10 ++--------
>  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
>  arch/powerpc/mm/highmem.c             |  9 ++-------
>  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
>  arch/x86/mm/highmem_32.c              | 10 ++--------
>  6 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> index 0c94046f2d58..ec9954b091e1 100644
> --- a/arch/microblaze/include/asm/highmem.h
> +++ b/arch/microblaze/include/asm/highmem.h
> @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
>  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> +void *kmap_atomic_prot(struct page *page, pgprot_t prot)

Shouldn't this be marked inline?

The rest looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
