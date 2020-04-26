Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 959291B8D71
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 09:28:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498zzn0XVFzDqFG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 17:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b4ccdff4e5217ceee7c0+6090+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=Re1ECLpO; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498zxl3Jd1zDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 17:27:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CWSwm8Yeluzm8cpwZm/62btaRJCyoviiCLbacfabnGM=; b=Re1ECLpOnjCxMnMxw3nbFwqX2n
 aoIEpiDwCOhSXjRFQsAtKAUzFPfcZvScmnluhdPrGcpB4A73YnCcAK3X1/Udnt463gXZiWTPz/hdY
 Zm1qsK/TTQvahB8trR8xHhgpUygnDRg+nIVFpopoPErU2kCehwboKE+gZgzOWx7tGiBfdqF+7XjLQ
 nXGbVkpLeDiFJyDIB00acjlEnat0Goyv5mEX0AfFgXOl9BLdSgCkmDQwkWJK/Ym/oifDtpOlRDYDp
 XopgAFXT0HVE//Q7QrX3iZhO0PVRR0c/B26jlIRviJj+L4KI9zh60oN87/iGag0hjjm6rgmN2bu1K
 JDzqUHOw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jSbgY-00048J-Cx; Sun, 26 Apr 2020 07:26:42 +0000
Date: Sun, 26 Apr 2020 00:26:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200426072642.GB22024@infradead.org>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426055406.134198-5-ira.weiny@intel.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> index 4db13a6b9f3b..1cae4b911a33 100644
> --- a/arch/arc/mm/highmem.c
> +++ b/arch/arc/mm/highmem.c
> @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
>  {
>  	int idx, cpu_idx;
>  	unsigned long vaddr;
> +	void *addr = kmap_atomic_fast(page);
>  
> -	preempt_disable();
> -	pagefault_disable();
> -	if (!PageHighMem(page))
> -		return page_address(page);
> +	if (addr)
> +		return addr;

Wouldn't it make sense to just move kmap_atomic itelf to common code,
and call out to a kmap_atomic_high for the highmem case, following the
scheme in kmap?  Same for the unmap side.  That might require to support
kmap_atomic_prot everywhere first, which sounds like a really good
idea anyway, and would avoid the need for strange workaround in drm.
