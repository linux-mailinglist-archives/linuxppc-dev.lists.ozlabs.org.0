Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55486CCB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:18:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgq7K4fT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlvxP1Bg0z3vcL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kgq7K4fT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlvwg5gGFz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 02:17:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709219860; x=1740755860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLRc3WhRkuCv1lTZmfKgUONC6J83KWsGVD8/2oxXDPE=;
  b=kgq7K4fTVpOD7QR9ZhAE9xnR+/idvL3vau4J7KEtzByBnekoy4vQs1f5
   Y0ViCdS62l4PQGU2YKHFb7fyD2qX5KFpjQsV8e/rmSa+8EDFBf1tWwLag
   umPj5GJBFZv67X8XqWsExx6atk5b7BpGVt3YPkYtS2sAlwS7fe2+4RQxf
   S9TtBb/MgDjdvF7tpjrhHgReVRex4nYnNFakPJI73Ugai14MRW+rNq2S2
   RgsIPVfcQYSmm93m9Df0JGYzmy8YsBl9M0kQp8sNvP+CaF5MDAD0z4nVe
   2kM2W37yPvCAZjL6ymT27dGcqzZ4ZKxcewUJvte/R/ANltpvkeaunxw45
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3574298"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3574298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913984318"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913984318"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:17:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfiA5-00000008he7-36Q0;
	Thu, 29 Feb 2024 17:17:29 +0200
Date: Thu, 29 Feb 2024 17:17:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <ZeCgCWND06rD2KvD@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
 <20240229141554.836867-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229141554.836867-4-herve.codina@bootlin.com>
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

On Thu, Feb 29, 2024 at 03:15:51PM +0100, Herve Codina wrote:
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

As I said, it's too much credit :-)

...

> + * A relationship exists between bitmap_gather() and bitmap_scatter(). See
> + * bitmap_scatter() for the bitmap scatter detailed operations.
> + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> + * equal or equivalent to src.
> + *
> + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> + * are not bijective.
> + * The result and src values are equivalent in that sense that a call to

> + * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
> + * mask, n) will lead to the same res value.

For better readability I wouldn't break API calls, hence

 The result and src values are equivalent in that sense that a call to
 bitmap_scatter(res, src, mask, n) and a call to
 bitmap_scatter(res, result, mask, n) will lead to the same res value.

-- 
With Best Regards,
Andy Shevchenko


