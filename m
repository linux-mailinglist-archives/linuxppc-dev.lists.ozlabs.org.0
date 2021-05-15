Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C0381B08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 22:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjHPy4pm8z3brt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 06:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nt9TYTOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=nt9TYTOO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjHPS74y1z2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 06:41:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B3D360249;
 Sat, 15 May 2021 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1621111302;
 bh=DvgZf0osZoE6IuLlR0dWRkN31mDCiFYcqBj39GpvImI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nt9TYTOOmm1beQJ4u04a+UJAJeRGfOyZg4oPsOuWHBXJgULNb5+LoW8P93OYpIKib
 8g06fUQguC7Ghni/F83pu4cJ8GBXVxDzI8wLBgl13zWWGFglFQSWNjnO41ysS+m5fW
 JTZ8JYFLvloxjz6YDr4IJtEeq+8cl7w4bzfRX1LI=
Date: Sat, 15 May 2021 13:41:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines
 to take a page walk cache flush argument
Message-Id: <20210515134141.b719412dc9dc46bdf2a8ced2@linux-foundation.org>
In-Reply-To: <20210515163525.GA1106462@roeck-us.net>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 15 May 2021 09:35:25 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> >  
> >  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >  static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>                  ^^^^
> >  				       unsigned long start, unsigned long end)
> > +{
> > +	return flush_pmd_tlb_pwc_range(vma, start, end, false);
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Doesn't that cause build warnings/errors all over the place ?

It will, thanks.  I queued a fix.
