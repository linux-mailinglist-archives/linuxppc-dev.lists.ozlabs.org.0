Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D152A7F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 18:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2hSq1vN6z3cFP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 02:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OHCcMmA1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OHCcMmA1; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2hS54T7Lz3bhK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 02:30:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652805029; x=1684341029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0NqJ5VwhtJ3tBjditXPJfSf+c2F9/tHzdRAp1qZ01bI=;
 b=OHCcMmA1qITj2beSCllK2hJ6483/Gr12fmCF93rg6mYbzeCDFU/HFnFY
 4Gj5d/MSE2wHPa4nw5XkeXNyuK31ZnfHyXKt/wfnzLROr0bx2KMl+h2uO
 YkQXWZMHPxXcIkah5kSygD8UaXRJKuNoxId+pPC6akrHUpEr2NKTUsWDj
 EoIkI9kB+bMJXhDZBLV6NzW0oPDxu1m5NhchA9zx7yxK+UTosSp91Fxse
 q/iS5NrB96RTZOhQRQKJ1x6oCdswW7Duje55nqaQoQlOrUMaCcWR4a1AL
 oIrfA2Ar8XSR4gwiUj1t6teQbKtByGydBysAx0W1+cub0l5osOzM93854 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="258802649"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="258802649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 09:30:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="626561602"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 09:30:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nr05E-0008C4-Vy; Tue, 17 May 2022 19:30:04 +0300
Date: Tue, 17 May 2022 19:30:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/4] powerpc/52xx: Convert to use fwnode API
Message-ID: <YoPNjPp3LMF2+qKS@smile.fi.intel.com>
References: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
 <20220507100147.5802-4-andriy.shevchenko@linux.intel.com>
 <877d6l7fmy.fsf@mpe.ellerman.id.au>
 <YoJaGGwfoSYhaT13@smile.fi.intel.com>
 <YoJbaTNJFV2A1Etw@smile.fi.intel.com>
 <874k1p6oa7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k1p6oa7.fsf@mpe.ellerman.id.au>
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

On Tue, May 17, 2022 at 09:38:56AM +1000, Michael Ellerman wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > On Mon, May 16, 2022 at 05:05:12PM +0300, Andy Shevchenko wrote:
> >> On Mon, May 16, 2022 at 11:48:05PM +1000, Michael Ellerman wrote:
> >> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> >> > > We may convert the GPT driver to use fwnode API for the sake
> >> > > of consistency of the used APIs inside the driver.
> >> > 
> >> > I'm not sure about this one.
> >> > 
> >> > It's more consistent to use fwnode in this driver, but it's very
> >> > inconsistent with the rest of the powerpc code. We have basically no
> >> > uses of the fwnode APIs at the moment.
> >> 
> >> Fair point!
> >> 
> >> > It seems like a pretty straight-forward conversion, but there could
> >> > easily be a bug in there, I don't have any way to test it. Do you?
> >> 
> >> Nope, only compile testing. The important part of this series is to
> >> clean up of_node from GPIO library, so since here it's a user of
> >> it I want to do that. This patch is just ad-hoc conversion that I
> >> noticed is possible. But there is no any requirement to do so.
> >> 
> >> Lemme drop this from v3.
> >
> > I just realize that there is no point to send a v3. You can just apply
> > first 3 patches. Or is your comment against entire series?
> 
> No, my comment is just about this patch.
> 
> I don't mind converting to new APIs when it's blocking some other
> cleanup. But given the age of this code I think it's probably better to
> just leave the rest of it as-is, unless someone volunteers to test it.
> 
> So yeah I'll just take patches 1-3 of this v2 series, no need to resend.

Thanks!

One note though, the fwnode_for_each_parent_node() is not yet available in
upstream, but will be after v5.19-rc1. It means the patch 3 can't be applied
without that. That's why LKP complained on patch 4 in this series.

That said, the easiest way is to postpone it till v5.19-rc1 is out.

-- 
With Best Regards,
Andy Shevchenko


