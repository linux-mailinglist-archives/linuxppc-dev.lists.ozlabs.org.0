Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D812301B96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 12:53:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNrxF3vBrzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 22:53:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+340bc88fe697da228867+6363+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=TIp1qmX+; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNrgK227bzDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 22:41:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M3FSAWCV2zmyTdtnVy67d93WEezl2jaS3Y+9V7bxgfg=; b=TIp1qmX+Wc+PSElTTUMYQCiVsq
 byjIKNxpCDGZTlBLtYSCfzzBQ/svyQIdDu8hmDtW57KcoQgW4aMH8avBI7mkjFI66OoQe4tP6TXY+
 VntHOHWgpyQaw54rxeyxKYBsI4YiaNhltMoEV3QvqI+fYWJOLY+uZsHc97xgSqpC+RFRUzNVB+Dal
 4ucRF9Z02bGcU7dN2MBNgHSDeanSSmIEuyLn1FMgjM5GYDzQL6dd0R9c+ur3uNZHpHYf3faGylVML
 qd31reJoqDmyOsc47wypl/AVuY1rQoeVIPwisZOoFAY3IKgbNNtBUVwdUf5XD4bi9xxwtQn9Vh4zg
 /VGZlMAg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3dkW-002v8C-GD; Sun, 24 Jan 2021 11:40:29 +0000
Date: Sun, 24 Jan 2021 11:40:08 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 05/12] mm: HUGE_VMAP arch support cleanup
Message-ID: <20210124114008.GE694255@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124082230.2118861-6-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Ding Tianhong <dingtianhong@huawei.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Zefan Li <lizefan@huawei.com>, Borislav Petkov <bp@alien8.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 2ca708ab9b20..597b40405319 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -1,4 +1,12 @@
>  #ifndef _ASM_ARM64_VMALLOC_H
>  #define _ASM_ARM64_VMALLOC_H
>  
> +#include <asm/page.h>
> +
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +bool arch_vmap_p4d_supported(pgprot_t prot);
> +bool arch_vmap_pud_supported(pgprot_t prot);
> +bool arch_vmap_pmd_supported(pgprot_t prot);
> +#endif

Shouldn't the be inlines or macros?  Also it would be useful
if the architectures would not have to override all functions
but just those that are it actually implements?

Also lots of > 80 char lines in the patch.
