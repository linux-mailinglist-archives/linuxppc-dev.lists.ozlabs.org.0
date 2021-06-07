Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFD39E506
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 19:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzKhT3Mfvz306w
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 03:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzKh51LDdz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 03:13:07 +1000 (AEST)
IronPort-SDR: v3scyBd8Q/9ClOGss+sc2Tsl10+F0HjFzI7iduInPXxElByxp1U0Zgztb69sgov1O96cx7K2SD
 9Bs57zCKQqxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202803866"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="202803866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:13:03 -0700
IronPort-SDR: 1oAeD0K29r2CbuCU96LJZYqgyd4nulaV92oTSx455D5i4oBr8ORmmtXYMVeawaVfpqpBW8BAii
 Ct6ykYBm2aAA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="401748140"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:13:01 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lqIo7-000JPs-1T; Mon, 07 Jun 2021 20:12:59 +0300
Date: Mon, 7 Jun 2021 20:12:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] powerpc/prom_init: Move custom isspace() to its
 own namespace
Message-ID: <YL5Tm7jZaaQ0POH5@smile.fi.intel.com>
References: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510144925.58195-1-andriy.shevchenko@linux.intel.com>
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
Cc: Paul Mackerras <paulus@samba.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 05:49:25PM +0300, Andy Shevchenko wrote:
> If by some reason any of the headers will include ctype.h
> we will have a name collision. Avoid this by moving isspace()
> to the dedicate namespace.
> 
> First appearance of the code is in the commit cf68787b68a2
> ("powerpc/prom_init: Evaluate mem kernel parameter for early allocation").

Any comments on this?

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 41ed7e33d897..6845cbbc0cd4 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -701,13 +701,13 @@ static int __init prom_setprop(phandle node, const char *nodename,
>  }
>  
>  /* We can't use the standard versions because of relocation headaches. */
> -#define isxdigit(c)	(('0' <= (c) && (c) <= '9') \
> -			 || ('a' <= (c) && (c) <= 'f') \
> -			 || ('A' <= (c) && (c) <= 'F'))
> +#define prom_isxdigit(c)	(('0' <= (c) && (c) <= '9') \
> +				 || ('a' <= (c) && (c) <= 'f') \
> +				 || ('A' <= (c) && (c) <= 'F'))
>  
> -#define isdigit(c)	('0' <= (c) && (c) <= '9')
> -#define islower(c)	('a' <= (c) && (c) <= 'z')
> -#define toupper(c)	(islower(c) ? ((c) - 'a' + 'A') : (c))
> +#define prom_isdigit(c)		('0' <= (c) && (c) <= '9')
> +#define prom_islower(c)		('a' <= (c) && (c) <= 'z')
> +#define prom_toupper(c)		(prom_islower(c) ? ((c) - 'a' + 'A') : (c))
>  
>  static unsigned long prom_strtoul(const char *cp, const char **endp)
>  {
> @@ -716,14 +716,14 @@ static unsigned long prom_strtoul(const char *cp, const char **endp)
>  	if (*cp == '0') {
>  		base = 8;
>  		cp++;
> -		if (toupper(*cp) == 'X') {
> +		if (prom_toupper(*cp) == 'X') {
>  			cp++;
>  			base = 16;
>  		}
>  	}
>  
> -	while (isxdigit(*cp) &&
> -	       (value = isdigit(*cp) ? *cp - '0' : toupper(*cp) - 'A' + 10) < base) {
> +	while (prom_isxdigit(*cp) &&
> +	       (value = prom_isdigit(*cp) ? *cp - '0' : prom_toupper(*cp) - 'A' + 10) < base) {
>  		result = result * base + value;
>  		cp++;
>  	}
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


