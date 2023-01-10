Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20E5663EF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 12:08:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrp2L4ddDz3c81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 22:08:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HJTwXCTY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HJTwXCTY;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrp1N5fNgz3bhW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 22:07:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673348841; x=1704884841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVhJmEIPGip77/doSmIyFH6N4wuSe2EOVqkHy4zJTJM=;
  b=HJTwXCTY5f6tdFtMCjqQbepLlvh/nqWOGWDBtPaVyj7GBG0LCOR0W9Ak
   rnHgcYqlvhgT4lSgMx3im3NVFt8y7xLfMjlh2M8BsUtdVcRIiISWwMSS0
   BxQKxRpGIA9PUTHmSgsh7/cFh8wr4h4zj2iRZYOsntLOUaCQmJihP3bAo
   +DEBtmNzUqI77DbxeO8l7msf/SY7QkLYLlg9DEaVEhSzqDI6iPi9BnKxu
   zaJy/kOPOfoho6vBSWilgoeYBWoS4YZRJ3eFn3muT/oiv6iFLTMkB6JNy
   C4kNADG2Ufod1rHNae/XBxuTcWshB78aC4gmsBjpd9rOmUiGqjE3sDAp1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="325123963"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="325123963"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 03:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="745739146"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="745739146"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2023 03:07:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pFCT8-006ztV-3A;
	Tue, 10 Jan 2023 13:07:02 +0200
Date: Tue, 10 Jan 2023 13:07:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [RFC DO NOT MERGE] treewide: use __xchg in most obvious places
Message-ID: <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
References: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
 <20230110105306.3973122-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110105306.3973122-1-andrzej.hajda@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 10, 2023 at 11:53:06AM +0100, Andrzej Hajda wrote:
> This patch tries to show usability of __xchg helper.
> It is not intended to be merged, but I can convert
> it to proper patchset if necessary.
> 
> There are many more places where __xchg can be used.
> This demo shows the most spectacular cases IMHO:
> - previous value is returned from function,
> - temporary variables are in use.
> 
> As a result readability is much better and diffstat is quite
> nice, less local vars to look at.
> In many cases whole body of functions is replaced
> with __xchg(ptr, val), so as further refactoring the whole
> function can be removed and __xchg can be called directly.

...

>  arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
>  				  struct pt_regs *regs)
>  {
> -	unsigned long orig_ret_vaddr;
> -
> -	orig_ret_vaddr = regs->ARM_lr;
> -	/* Replace the return addr with trampoline addr */
> -	regs->ARM_lr = trampoline_vaddr;
> -	return orig_ret_vaddr;
> +	return __xchg(&regs->ARM_lr, trampoline_vaddr);
>  }

If it's not a callback, the entire function can be killed.
And this is a good example of the function usage.
OTOH, these places might have a side effect (if it's in deep CPU
handlers), means we need to do this carefully.

...

>  static inline void *qed_chain_produce(struct qed_chain *p_chain)
>  {
> -	void *p_ret = NULL, *p_prod_idx, *p_prod_page_idx;
> +	void *p_prod_idx, *p_prod_page_idx;
>  
>  	if (is_chain_u16(p_chain)) {
>  		if ((p_chain->u.chain16.prod_idx &
> @@ -390,11 +391,8 @@ static inline void *qed_chain_produce(struct qed_chain *p_chain)
>  		p_chain->u.chain32.prod_idx++;
>  	}
>  
> -	p_ret = p_chain->p_prod_elem;
> -	p_chain->p_prod_elem = (void *)(((u8 *)p_chain->p_prod_elem) +
> -					p_chain->elem_size);
> -
> -	return p_ret;
> +	return __xchg(&p_chain->p_prod_elem,
> +		      (void *)(((u8 *)p_chain->p_prod_elem) + p_chain->elem_size));

Wondering if you still need a (void *) casting after the change. Ditto for the
rest of similar cases.

>  }

...

Btw, is it done by coccinelle? If no, why not providing the script?

-- 
With Best Regards,
Andy Shevchenko


