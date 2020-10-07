Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75373285F54
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5v7c3GwMzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 23:40:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+47a0ee7340e53641f5ce+6254+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=m/UGZtLZ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5v3p4Gp2zDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 23:37:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7xZSyQPWnxLgrh1E9TtQ37I9TBQZo5pqOmu3lCWY/iI=; b=m/UGZtLZn/vN4y9M1nZ2Zjl0b5
 r4S7hsMn5sTBt2bmtoc40cZm4Efl/3LvrLn+d4lq/R+BfXSr0QbkaUI09EE0yR0VInpGzv3o79/II
 uBhFyWyfkV9sNAlEmUsk8FsNl4rxtjMGElFM3s8f4URICAxq43ok4C/T1+sb24V4vYRihpMzlOrKN
 5r/6EMNqG84CGgm2bOjQyhA91w57Xu4lZsyPEq6pthgdsyKg+R04KH919HPs1obLNqsJGyQT13m3F
 Eaadx2Mxm9FWD9V4lc8SBdo56njL3PvNoxXbRWKanjehqpl+NgfGpELV3eXDObpuR9Y2m+0twAcAu
 Ri99tb6g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kQ8gg-0003hn-4Q; Wed, 07 Oct 2020 12:36:54 +0000
Date: Wed, 7 Oct 2020 13:36:54 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 2/2] sparc: Check VMA range in sparc_validate_prot()
Message-ID: <20201007123654.GB11433@infradead.org>
References: <20201007073932.865218-1-jannh@google.com>
 <20201007073932.865218-2-jannh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007073932.865218-2-jannh@google.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +++ b/arch/sparc/include/asm/mman.h
> @@ -60,31 +60,41 @@ static inline int sparc_validate_prot(unsigned long prot, unsigned long addr,
>  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_ADI))
>  		return 0;
>  	if (prot & PROT_ADI) {
> +		struct vm_area_struct *vma, *next;
> +

I'd split all the ADI logic into a separate, preferable out of line
helper.

> +			/* reached the end of the range without errors? */
> +			if (addr+len <= vma->vm_end)

missing whitespaces around the arithmetic operator.
