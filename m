Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1BA558D5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 04:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LThMH1s5Jz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 12:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WyfAml4N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LThLk3s0jz3blX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 12:45:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WyfAml4N;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LThLd09Mpz4xDK;
	Fri, 24 Jun 2022 12:45:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656038729;
	bh=FsNPhLyLQp+amgbFWjLHPt/TWXWo4hOyqccddO50Dxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WyfAml4Niz8W3LAIUYtA3TTVSHHKZOsJJJu5kLv4FtmDCD1eYxS+W4sEcCet1QKHj
	 0IMrTzdYHLZGaCGCRZRTzn4pxrV4fV/3/6M1lVzlJdYTu+jjalxzCTY+2i3+eWKUzV
	 xO+/aq/1RKTo5wBveuVudeVekc1sx7NizVAbYz2xtDCU/0KcHwrtKcEqQ31ZNxLcCS
	 jRsbzVNbIrDEAfOsy2MeQCb+/ZYsb3EBxlGdItXwiAKTMjRQ7iBJLsc16ATQxaogMb
	 u+JKXyXS8U6W6ahPkXtSkanQFfcRa6CQ0yT3iPv/0C/AnD+wGZG35hkyPYQ9Pc0Xot
	 36vN0bG94jESA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] powerpc/mm: Use VMALLOC_START to validate addr
In-Reply-To: <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
References: <20220623122922.640980-1-aneesh.kumar@linux.ibm.com>
 <20220623122922.640980-3-aneesh.kumar@linux.ibm.com>
Date: Fri, 24 Jun 2022 12:45:24 +1000
Message-ID: <87bkui6apn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Instead of high_memory use VMALLOC_START to validate that the address is
> not in the vmalloc range.
>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Isn't this really the fix for ffa0b64e3be5 ("powerpc: Fix
virt_addr_valid() for 64-bit Book3E & 32-bit") ?

cheers

> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index e5f75c70eda8..256cad69e42e 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -134,7 +134,7 @@ static inline bool pfn_valid(unsigned long pfn)
>  
>  #define virt_addr_valid(vaddr)	({					\
>  	unsigned long _addr = (unsigned long)vaddr;			\
> -	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
> +	_addr >= PAGE_OFFSET && _addr < (unsigned long)VMALLOC_START &&	\
>  	pfn_valid(virt_to_pfn(_addr));					\
>  })
>  
> -- 
> 2.36.1
