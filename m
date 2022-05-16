Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430C528676
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 16:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L21KF15shz3bxh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 00:07:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nor0SPPy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Nor0SPPy; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L21JY3x7rz2xnN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 00:06:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652709997; x=1684245997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pFt4HO1TD5VHhoCWTbjb6hXEj0azWY0q/flWLQdVPx8=;
 b=Nor0SPPyGoE3jax5tkui7Fx3nm/s0iomETxX1JFefglL6NQ9ktTMN4tn
 zf0C9stYzhmvTEfAiZ1il0UuV/6Zmqbx2paMIXV9WHDUTWozQ77bmU09Z
 4Vavgoc+ugOrxLVWljN3xfiLYCJ2SbtU6rlrLafrXwQ/zh1e2e3fdkYGW
 wLwMCUSwB6+iQFlHxZykX94KJMhYtSdoBJtTM+Jd+yX7gbMUJv3lyrksc
 3sac9OHJxXBv5/NiyDTyh5buhCW321bi4Ggo5EpZce6AlvzxiB3I4njyb
 T2XPL8lbXtZRYRwjHFyTgkMBbLl1178FKwCJXDTNwPyhTL4vpNJ5gDe/V Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="251354708"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="251354708"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 07:05:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="574028618"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 07:05:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nqbLU-0006iR-9q; Mon, 16 May 2022 17:05:12 +0300
Date: Mon, 16 May 2022 17:05:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/4] powerpc/52xx: Convert to use fwnode API
Message-ID: <YoJaGGwfoSYhaT13@smile.fi.intel.com>
References: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
 <20220507100147.5802-4-andriy.shevchenko@linux.intel.com>
 <877d6l7fmy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d6l7fmy.fsf@mpe.ellerman.id.au>
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

On Mon, May 16, 2022 at 11:48:05PM +1000, Michael Ellerman wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> > We may convert the GPT driver to use fwnode API for the sake
> > of consistency of the used APIs inside the driver.
> 
> I'm not sure about this one.
> 
> It's more consistent to use fwnode in this driver, but it's very
> inconsistent with the rest of the powerpc code. We have basically no
> uses of the fwnode APIs at the moment.

Fair point!

> It seems like a pretty straight-forward conversion, but there could
> easily be a bug in there, I don't have any way to test it. Do you?

Nope, only compile testing. The important part of this series is to
clean up of_node from GPIO library, so since here it's a user of
it I want to do that. This patch is just ad-hoc conversion that I
noticed is possible. But there is no any requirement to do so.

Lemme drop this from v3.


-- 
With Best Regards,
Andy Shevchenko


