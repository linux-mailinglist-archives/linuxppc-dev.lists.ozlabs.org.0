Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F55286AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 16:13:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L21Sv4Yt6z3byG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 00:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cn5VNekr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cn5VNekr; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L21SG42m3z2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 00:13:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652710398; x=1684246398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q8T0jBh7cGQQ4AUWl+1aBVbwpP+Txn2+ZD1GDsXUmwY=;
 b=Cn5VNekrEnPPa9Jsye535dFObXMGdnFUTS0DqPSdpoK9LrA3CK4gWRXY
 rsQvi4YLiKZqgBv84VuiFGfEhXg+sIC6TjkNGZWgz/DZjw1sTME40Nx8W
 4YlS3PF1+NlROWP9ROT/LjgJXSNKRg/jnIu+gm2OirH3FbXzCBNtau6C2
 ZQqO7NxAMEW6sCGt9VguPE70Ix0K812vL2We0Yi8JLbnS8keCLSPbGot0
 +oS0lofJiY/cqk55LmTxNlHH4FK8mBCo/9O0koGzBOLIYe5flW1syIK18
 rRMWln3OF86HOTLUBaTKwHXg3rXB+0xn9RzwaZk9ftLVlzWBtndkFRh/U A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333897358"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="333897358"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 07:13:12 -0700
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="638258613"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 07:13:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nqbQv-0006ib-VU; Mon, 16 May 2022 17:10:49 +0300
Date: Mon, 16 May 2022 17:10:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/4] powerpc/52xx: Convert to use fwnode API
Message-ID: <YoJbaTNJFV2A1Etw@smile.fi.intel.com>
References: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
 <20220507100147.5802-4-andriy.shevchenko@linux.intel.com>
 <877d6l7fmy.fsf@mpe.ellerman.id.au>
 <YoJaGGwfoSYhaT13@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoJaGGwfoSYhaT13@smile.fi.intel.com>
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
Cc: linux-ide@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>,
 linux-can@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 chris.packham@alliedtelesis.co.nz, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 05:05:12PM +0300, Andy Shevchenko wrote:
> On Mon, May 16, 2022 at 11:48:05PM +1000, Michael Ellerman wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > > We may convert the GPT driver to use fwnode API for the sake
> > > of consistency of the used APIs inside the driver.
> > 
> > I'm not sure about this one.
> > 
> > It's more consistent to use fwnode in this driver, but it's very
> > inconsistent with the rest of the powerpc code. We have basically no
> > uses of the fwnode APIs at the moment.
> 
> Fair point!
> 
> > It seems like a pretty straight-forward conversion, but there could
> > easily be a bug in there, I don't have any way to test it. Do you?
> 
> Nope, only compile testing. The important part of this series is to
> clean up of_node from GPIO library, so since here it's a user of
> it I want to do that. This patch is just ad-hoc conversion that I
> noticed is possible. But there is no any requirement to do so.
> 
> Lemme drop this from v3.

I just realize that there is no point to send a v3. You can just apply
first 3 patches. Or is your comment against entire series?

-- 
With Best Regards,
Andy Shevchenko


