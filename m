Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CD51A142
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 15:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtdRR09fqz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:46:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KfOxdHdv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KfOxdHdv; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtdQl5MNQz2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 23:46:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651671983; x=1683207983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KZ4vphBXVfB/HfWb5Clb91wOAr0PLx69sTjqh3lXPSw=;
 b=KfOxdHdvdMyrnCAo/0ESDcRw3UAtRqrhI3wBb3RnG8/7ltlxTC5ujMeA
 6c85J2WT83rA7bpOejT63ml56Tp8KAXy18li0f2dkDrrY4SNDuVLzCnQV
 OPo/NxnzgB0Exe2esI+IO6Ttyi5v6/+AwZ8Ru9Axl/JUnNu91n1n0AD2U
 uOQiPyekjNN45FmKaGTEcya9K5Ub/UYmpRQKfbGjbJ1VOcJLFqbZFKLEg
 goFeyQnm98BR2B67osaOP2l4K2hSbej7AWgt84h3KTDIvHDvRbvfqn6FQ
 kNUNdQd2TCzt+PwZqHQG06mPvSX74hrfGA7qX3zTu1pPGYQa/dLikp42Y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267923634"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="267923634"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:45:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="734403682"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:45:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nmFJZ-00Btne-Fp; Wed, 04 May 2022 16:45:13 +0300
Date: Wed, 4 May 2022 16:45:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
Message-ID: <YnKDaTVDoqgFeQHz@smile.fi.intel.com>
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
 <Yk2PE7+oEEtGri95@smile.fi.intel.com>
 <CACRpkdbqfNiWQG6ayqMXACby4xkW0pY6JhdYE-x+pWkSxJU5TQ@mail.gmail.com>
 <87fsm7fkbt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsm7fkbt.fsf@mpe.ellerman.id.au>
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 08:42:30AM +1000, Michael Ellerman wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
> > On Wed, Apr 6, 2022 at 3:02 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >> On Mon, Mar 28, 2022 at 03:16:08PM +0200, Linus Walleij wrote:
> >> > On Wed, Mar 23, 2022 at 6:43 PM Andy Shevchenko
> >> > <andriy.shevchenko@linux.intel.com> wrote:
> >> >
> >> > > Let GPIO library to assign of_node from the parent device.
> >> > > This allows to move GPIO library and drivers to use fwnode
> >> > > APIs instead of being stuck with OF-only interfaces.
> >> > >
> >> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >
> >> > That's a nice patch.
> >> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> Thanks!
> >>
> >> Can we have this applied now?
> >
> > I think Michael Ellerman could help with this?
> >
> > Michael?
> 
> Yep, I'll pick it up when I start putting things into next.
> 
> That's usually the week after rc2, but I had a break for Easter.

Any new on this? I haven't seen it yet in Linux Next.

-- 
With Best Regards,
Andy Shevchenko


