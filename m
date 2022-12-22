Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9462C654151
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 13:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nd9993BQjz3bgv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 23:48:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HwtA9Sb0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HwtA9Sb0;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nd98F3bPvz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 23:47:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671713277; x=1703249277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UPM8RDFaM30ZmFrIb8CKMZ1JANhWUp662jbH45qLr6M=;
  b=HwtA9Sb0YmYexIIvfZrVLOPaC9tv8SAlwOAy1EWvD2spPC7GTqOtwKgT
   /j671UHExTBQ3NCbZdGEA+JY2+kTPy1ZyFkK4NlM40/KF4grf2aB1PWWO
   w84SWAssgQlPE2N+DHDNV/8fqERpJJmPAmR2MjVsc6vfLZU53CFH+3hix
   kAsfzDlZy2r9hgI8xCImCP6hVehMXPVokTebPZcYbh8S7Sr5s0NdlgQLQ
   Ei37k8ksnEpda11PFh0lew7i+u1GB4WLbYZGJwnIc9ApSLc1pxiQCnFz1
   FuzsHBH/RBgJy5g0nHvBrQBfpKxhVCQ2PY6md4TiUnrrW3ikdiIjhNfMM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="322031551"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="322031551"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 04:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="897213732"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="897213732"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 22 Dec 2022 04:47:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1p8Kz8-00Duf4-1e;
	Thu, 22 Dec 2022 14:47:42 +0200
Date: Thu, 22 Dec 2022 14:47:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 18/19] linux/include: add non-atomic version of xchg
Message-ID: <Y6RR7hPZUN22ytap@smile.fi.intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222114635.1251934-19-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222114635.1251934-19-andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 22, 2022 at 12:46:34PM +0100, Andrzej Hajda wrote:
> The pattern of setting variable with new value and returning old
> one is very common in kernel. Usually atomicity of the operation
> is not required, so xchg seems to be suboptimal and confusing in
> such cases.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  include/linux/non-atomic/xchg.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/linux/non-atomic/xchg.h
> 
> diff --git a/include/linux/non-atomic/xchg.h b/include/linux/non-atomic/xchg.h
> new file mode 100644
> index 00000000000000..f7fa5dd746f37d
> --- /dev/null
> +++ b/include/linux/non-atomic/xchg.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_NON_ATOMIC_XCHG_H
> +#define _LINUX_NON_ATOMIC_XCHG_H
> +
> +/**
> + * __xchg - set variable pointed by @ptr to @val, return old value
> + * @ptr: pointer to affected variable
> + * @val: value to be written
> + *
> + * This is non-atomic variant of xchg.
> + */
> +#define __xchg(ptr, val) ({		\
> +	__auto_type __ptr = ptr;	\
> +	__auto_type __t = *__ptr;	\
> +	*__ptr = (val);			\
> +	__t;				\
> +})
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


