Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9345F868F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 20:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlD186rzlz3drX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 05:17:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J5FfrJnd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J5FfrJnd;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlD093YsXz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 05:16:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665253001; x=1696789001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q7YlJwn22ePcF+UsrTEOpg8IcVNJxX9fgtN3uSim9/E=;
  b=J5FfrJndrdnaETov1xAa8KX8GUdv7A7Gjw/mm7BYhXZysKcSsj4oN3dX
   S5/TlwFblPxnFkO/fLNfr6N0jMc4wOihZG/lElhk1rC+vvjoJKUC66Mlo
   XTyLa/jchBTD943/8nG+y/IN6/6GLOrZH/VDatZ7IqN6vhlIhp7L5x3v7
   /24r9jZImWaDclnIcTNEU1qToIQFam6ySl8olX9yl8Dv4OgqRu7cY+oW1
   Wp+KuKeW8RDIEpRPPK8EfKYMjWd3WPvGHyb7+SeNoQaE/NBEyWcNR1JLs
   jNkZ50CsRTPt9Us0p+R2yfn5eC0RXKBdUSmvD0Et2MqxiqCOgnG9Txz9Q
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="304985434"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; 
   d="scan'208";a="304985434"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2022 11:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10494"; a="750899918"
X-IronPort-AV: E=Sophos;i="5.95,170,1661842800"; 
   d="scan'208";a="750899918"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 08 Oct 2022 11:16:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ohEN3-0048ft-0Q;
	Sat, 08 Oct 2022 21:16:21 +0300
Date: Sat, 8 Oct 2022 21:16:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0G+dP9uGaYHSa9y@smile.fi.intel.com>
References: <53DD0148-ED15-4294-8496-9E4B4C7AD061@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53DD0148-ED15-4294-8496-9E4B4C7AD061@chromium.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com, linux-media@vger.kernel.org, linux-um@lists.infradead.org, linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org, linux-crypto@vger.kernel.org, patches@lists.linux.dev, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 08:50:43PM -0700, Kees Cook wrote:
> On October 7, 2022 7:21:28 PM PDT, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> >On Fri, Oct 07, 2022 at 03:47:44PM -0700, Kees Cook wrote:
> >> On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:

...

> >> These are more fun, but Coccinelle can still do them with a little
> >> Pythonic help:
> >> 
> >> // Find a potential literal
> >> @literal_mask@
> >> expression LITERAL;
> >> identifier randfunc =~ "get_random_int|prandom_u32|get_random_u32";
> >> position p;
> >> @@
> >> 
> >>         (randfunc()@p & (LITERAL))
> >> 
> >> // Add one to the literal.
> >> @script:python add_one@
> >> literal << literal_mask.LITERAL;
> >> RESULT;
> >> @@
> >> 
> >> if literal.startswith('0x'):
> >>         value = int(literal, 16) + 1
> >>         coccinelle.RESULT = cocci.make_expr("0x%x" % (value))
> >> elif literal[0] in '123456789':
> >>         value = int(literal, 10) + 1
> >>         coccinelle.RESULT = cocci.make_expr("%d" % (value))
> >> else:
> >>         print("I don't know how to handle: %s" % (literal))

Wouldn't Python take care about (known) prefixes itself?

	try:
		x = int(literal)
	except ValueError as ex:
		print(..., ex.error)

> >> // Replace the literal mask with the calculated result.
> >> @plus_one@
> >> expression literal_mask.LITERAL;
> >> position literal_mask.p;
> >> expression add_one.RESULT;
> >> identifier FUNC;
> >> @@
> >> 
> >> -       (FUNC()@p & (LITERAL))
> >> +       prandom_u32_max(RESULT)
> >
> >Oh that's pretty cool. I can do the saturation check in python, since
> >`value` holds the parsed result. Neat.
> 
> It is (at least how I have it here) just the string, so YMMV.

...

> >Thanks a bunch for the guidance.
> 
> Sure thing! I was pleased to figure out how to do the python bit.

I believe it can be optimized

-- 
With Best Regards,
Andy Shevchenko


