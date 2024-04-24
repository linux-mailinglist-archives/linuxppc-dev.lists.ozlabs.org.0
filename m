Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0728B0DB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 17:12:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pVGfFKG4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPjCX5l7tz3dLY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 01:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=pVGfFKG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPjBl5NN5z3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 01:11:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EkBE66CT6crj6GkqyX5V53CXIn7FtqQLU888aU+APFw=; b=pVGfFKG43UpmS74CNpKosVr5aW
	DiWq78bfE/4XpvD6h++sMM7pvdJKjA8UOxzoT7aLqgK7wZaHJ+nbEA3Nc9XKmElw8EL6cEbeyoIIm
	ccRUoz7uUY0OrHfgDHqvVw1lXK7iT7mUgNT1EQzTmRxqscWpsG207rz33DabNMrsUc9mar0BuL5Ku
	0PG8jBvtTxrk8wl80BfvKMLzUlsffHyjR/9ZpZveIqAVomDlFkK8mQzDaUM8LzboXOzb/rdONx1SY
	YFFTBziyw63gs/sXKceSMYFTE1TRYwUIdqMtNrY/bXgCF31DJfi6cJPV3sC8K5+u/BVX9o77r5qE1
	O78+0gHA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzeHV-000000018cB-3diq;
	Wed, 24 Apr 2024 15:11:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8368C30043E; Wed, 24 Apr 2024 17:11:33 +0200 (CEST)
Date: Wed, 24 Apr 2024 17:11:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH V2 04/19] math64: Tidy mul_u64_u32_shr()
Message-ID: <20240424151133.GR30852@noisy.programming.kicks-ass.net>
References: <20240325064023.2997-1-adrian.hunter@intel.com>
 <20240325064023.2997-5-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325064023.2997-5-adrian.hunter@intel.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 08:40:08AM +0200, Adrian Hunter wrote:
> Put together declaration and initialization of local variables.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Nothing wrong with this patch, but it is highly unlikely this code is
actually tested much. Most (sane) architectures will use the __int128
version.

>  include/linux/math64.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/linux/math64.h b/include/linux/math64.h
> index bf74478926d4..fd13622b2056 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -179,16 +179,12 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
>  #ifndef mul_u64_u32_shr
>  static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
>  {
> -	u32 ah, al;
> +	u32 ah = a >> 32, al = a;
>  	u64 ret;
>  
> -	al = a;
> -	ah = a >> 32;
> -
>  	ret = mul_u32_u32(al, mul) >> shift;
>  	if (ah)
>  		ret += mul_u32_u32(ah, mul) << (32 - shift);
> -
>  	return ret;
>  }
>  #endif /* mul_u64_u32_shr */
> -- 
> 2.34.1
> 
