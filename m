Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5F871947
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 10:14:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e03rf2/c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpqd519Fqz3vZt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 20:14:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e03rf2/c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpqcL25DRz2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 20:13:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630019; x=1741166019;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3mXN8KKW4waYOcWzjRN9oSLaIcwuzNcqm3YSkZxcpzY=;
  b=e03rf2/cqM2P0ok41exl59H6wytKKIx7JFpmVe1r7Mm0cFITvE5NiX7A
   zFyvYbB5QJbfp+Sy5EWg/nSsi28yAUrbcQ1bNbiGSd5hm2oKxYCbXCoxg
   jJjS7r0PjcLAULjf6nFvWcD/4AGllEk7ijKPynVi9ZXBB/eJzpMnrha0H
   mQWPMLtyRQIaMzCav8XVYTbgE6GVfF8zJOq+DIL6ePg5AM4e3+XqRMhxc
   MmqHMM43pGqiKKrySo8F7R19e9h4Ii1Etj+NvcqRFMWnrMuaWR76s6EA7
   u65HoVIcP284IhbBnFwh+JmMYVz7WDrXGPFSt9LnL1dJa8yJ4uiDf9IsE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4031545"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4031545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="46836038"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost) ([10.252.51.143])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:13:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH v2 2/3] macintosh/via-pmu-backlight: Include
 <linux/backlight.h>
In-Reply-To: <20240305090910.26742-3-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-3-tzimmermann@suse.de>
Date: Tue, 05 Mar 2024 11:13:20 +0200
Message-ID: <87plw92g9b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 05 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for the
> backlight header has recently been removed from <linux/fb.h>. Add it to
> via-pmu-backlight.c to get the necessary symbols.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/macintosh/via-pmu-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
> index c2d87e7fa85be..89450645c2305 100644
> --- a/drivers/macintosh/via-pmu-backlight.c
> +++ b/drivers/macintosh/via-pmu-backlight.c
> @@ -10,6 +10,7 @@
>  
>  #include <asm/ptrace.h>
>  #include <linux/adb.h>
> +#include <linux/backlight.h>
>  #include <linux/pmu.h>
>  #include <asm/backlight.h>

-- 
Jani Nikula, Intel
