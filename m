Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF0785FCA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:40:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aVgLxUHG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgcly42SXz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aVgLxUHG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgclF3HHCz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 02:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708616377; x=1740152377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VwHg7LUdcIrFoPjrcD5ddqTta7KlIaNL26jH4Yy3jIM=;
  b=aVgLxUHGD4jgZjUAvYZplOaJnuy5VVx0kZtoFmtGk468lD+v9nEdXnop
   cO3CxecxzQ4ToeXO5NIRRsZZFv91nGQyjOyoFx9dMHcsYwR7fkcszxqGF
   WdW5785sS6uiqWCLim88sgXWONPWH+WGW0kqi2yxMME5vPSUxp2FalMDJ
   GSQDU689vIpbeNrP8vD2+WMMecJd2tXMtFpfXdrc0ruJOs6zzPUAggebw
   nMtUe/F1buhZewxu7xDloAOvowcBVVJ0ijVhonSyBEt+AWRKIJQqfztyh
   9Dn6nbpDTdpfgu69qUaY7pQ3dxeH5R/2DUr8DgyNzU3IEA1Hh2jambR7v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2985503"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2985503"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:39:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913544289"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913544289"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:39:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdBAV-00000006fLv-3ofM;
	Thu, 22 Feb 2024 17:39:27 +0200
Date: Thu, 22 Feb 2024 17:39:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <Zddqr3aN4rU-upai@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222142219.441767-4-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 03:22:16PM +0100, Herve Codina wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> These helpers scatters or gathers a bitmap with the help of the mask
> position bits parameter.
> 
> bitmap_scatter() does the following:
>   src:  0000000001011010
>                   ||||||
>            +------+|||||
>            |  +----+||||
>            |  |+----+|||
>            |  ||   +-+||
>            |  ||   |  ||
>   mask: ...v..vv...v..vv
>         ...0..11...0..10
>   dst:  0000001100000010
> 
> and bitmap_gather() performs this one:
>    mask: ...v..vv...v..vv
>    src:  0000001100000010
>             ^  ^^   ^   0
>             |  ||   |  10
>             |  ||   > 010
>             |  |+--> 1010
>             |  +--> 11010
>             +----> 011010
>    dst:  0000000000011010
> 
> bitmap_gather() can the seen as the reverse bitmap_scatter() operation.

> The original work was done by Andy Shevchenko.

Mine SoB is enough for a credit, but thank you :-)

...

> +/**
> + * bitmap_gather - Gather a bitmap according to given mask
> + * @dst: gathered bitmap
> + * @src: scattered bitmap
> + * @mask: mask representing bits to extract from in the scattered bitmap
> + * @nbits: number of bits in each of these bitmaps
> + *
> + * Gathers bitmap with sparse bits according to the given @mask.
> + *
> + * Example:
> + * If @src bitmap = 0x0302, with @mask = 0x1313, @dst will be 0x001a.
> + *
> + * Or in binary form
> + * @src			@mask			@dst
> + * 0000001100000010	0001001100010011	0000000000011010
> + *
> + * (Bits 0, 1, 4, 8, 9, 12 are copied to the bits 0, 1, 2, 3, 4, 5)
> + *
> + * A more 'visual' description of the operation:
> + * mask: ...v..vv...v..vv
> + * src:  0000001100000010
> + *          ^  ^^   ^   0
> + *          |  ||   |  10
> + *          |  ||   > 010
> + *          |  |+--> 1010
> + *          |  +--> 11010
> + *          +----> 011010
> + * dst:  0000000000011010

Cool!

> + * A relationship exists between bitmap_gather() and bitmap_scatter() (See

Either '... (see'
or '(). See'

> + * bitmap_scatter() for the bitmap scatter detailed operations).

> + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> + * equal or equivalent to src.

This paragraph...

> + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> + * are not bijective.


> + * The result and src values are equivalent in that sense that a call to
> + * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
> + * mask, n) will lead to the same res value.

...seems duplicating this one.

I would drop the latter one.

> + */

-- 
With Best Regards,
Andy Shevchenko


