Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48B871955
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 10:16:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmsBxzaD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpqgS3SpKz3bs2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 20:16:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WmsBxzaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpqff0tGdz3dTx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 20:15:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630138; x=1741166138;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=hMKs0ciZCs4Sa96j2l4fRH7HRRb+NS8yKx3L+577Xis=;
  b=WmsBxzaDGbFoDmCIT2r1GZNiJjsN+TIEzfUPI844k1sNkHWOukt80IhZ
   hURxFPYPIUM5gBn7BEt3ZNORbAjeLF3GUuBK1sxYBKvPgEAk30R7zErRG
   gw2RoDZXssf++19tfnJU6QaL3DcI4IP1F3ILxIVSlSojhye7TwpDmv7VE
   oqTQPTqkOCyCUGkRGwtsjeuqMQMCAYVqfylG7VoBGIU3L3mVW1bwOCLE+
   2xFpFSzEsCDoZehSGNQBMJIQ21sJIlkhwS+2hdIzxcUcvCx9byHX8iXs6
   2iLGSnTCZaT1ukZ450pUlq4knzpu5keghCBfEnF46x73TpxPfo3bRAmnY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14885908"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="14885908"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9724146"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost) ([10.252.51.143])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:15:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
In-Reply-To: <20240305090910.26742-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-4-tzimmermann@suse.de>
Date: Tue, 05 Mar 2024 11:15:27 +0200
Message-ID: <87msrd2g5s.fsf@intel.com>
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
> Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
> resolves an unnecessary dependency. Remove pmac_backlight_curve_lookup()

*resolve

> and struct fb_info from source and header files. The function and the
> framebuffer struct is unused. No functional changes.

*are

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/powerpc/include/asm/backlight.h        |  5 ++--
>  arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
>  2 files changed, 2 insertions(+), 29 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
> index 1b5eab62ed047..061a910d74929 100644
> --- a/arch/powerpc/include/asm/backlight.h
> +++ b/arch/powerpc/include/asm/backlight.h
> @@ -10,15 +10,14 @@
>  #define __ASM_POWERPC_BACKLIGHT_H
>  #ifdef __KERNEL__
>  
> -#include <linux/fb.h>
>  #include <linux/mutex.h>
>  
> +struct backlight_device;
> +
>  /* For locking instructions, see the implementation file */
>  extern struct backlight_device *pmac_backlight;
>  extern struct mutex pmac_backlight_mutex;
>  
> -extern int pmac_backlight_curve_lookup(struct fb_info *info, int value);
> -
>  extern int pmac_has_backlight_type(const char *type);
>  
>  extern void pmac_backlight_key(int direction);
> diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> index aeb79a8b3e109..12bc01353bd3c 100644
> --- a/arch/powerpc/platforms/powermac/backlight.c
> +++ b/arch/powerpc/platforms/powermac/backlight.c
> @@ -9,7 +9,6 @@
>   */
>  
>  #include <linux/kernel.h>
> -#include <linux/fb.h>
>  #include <linux/backlight.h>
>  #include <linux/adb.h>
>  #include <linux/pmu.h>
> @@ -72,31 +71,6 @@ int pmac_has_backlight_type(const char *type)
>  	return 0;
>  }
>  
> -int pmac_backlight_curve_lookup(struct fb_info *info, int value)
> -{
> -	int level = (FB_BACKLIGHT_LEVELS - 1);
> -
> -	if (info && info->bl_dev) {
> -		int i, max = 0;
> -
> -		/* Look for biggest value */
> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++)
> -			max = max((int)info->bl_curve[i], max);
> -
> -		/* Look for nearest value */
> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++) {
> -			int diff = abs(info->bl_curve[i] - value);
> -			if (diff < max) {
> -				max = diff;
> -				level = i;
> -			}
> -		}
> -
> -	}
> -
> -	return level;
> -}
> -
>  static void pmac_backlight_key_worker(struct work_struct *work)
>  {
>  	if (atomic_read(&kernel_backlight_disabled))

-- 
Jani Nikula, Intel
