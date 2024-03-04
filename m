Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA986FE43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 11:02:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HddLkMcj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpDl96pVgz3d4H
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 21:02:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HddLkMcj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpDkS1LlKz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 21:01:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709546513; x=1741082513;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jQFmwXYrCiO+fSgyXF1439DdxKJeLh5hmRnQ7FNWVbk=;
  b=HddLkMcjppQrPnPaUVvgz61mdGhKnrsRLEPcrjEP/vnY1tKL6Pg2ZQbN
   ZtvbUJ+3QOx5tuPlRm1DTlVs5Fxm/xPtEvsNtOayygXZtWlRwod46GfRY
   Th1xh7RzT1aPlU9okeFFlnmhZBkTP8zROiVSYiwHi5T7jQ9Fsig0oqWC4
   XXqYsPYlOtLO879jVqbyVNz++A0cE8Cor7wksC7VBP8oSEUgHkLxyuPWe
   CKXanT//q4SWxm2DUbpG8f7jG3oy7ZISwF868OhLEGZiZcX5SMtIknJnA
   s+iw3h7mlS3fMgB9HahZ41MdGESsBliFmDhTakqP3oH41S/BXjdsvCJXY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7799980"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7799980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="39935146"
Received: from syakovle-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.51.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:01:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
In-Reply-To: <20240304095512.742348-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com>
Date: Mon, 04 Mar 2024 12:01:30 +0200
Message-ID: <87bk7u5n9h.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 04 Mar 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Removal of the backlight include from fb.h uncovered an implicit
> dependency in powerpc asm/backlight.h. Add the explicit include.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com
> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Not even compile tested!

Naresh, please try this patch!

Michael, if this is fine by you, ack to merge via the drm subsystem
along with the regressing commit?

BR,
Jani.

> ---
>  arch/powerpc/include/asm/backlight.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
> index 1b5eab62ed04..275d5bb9aa04 100644
> --- a/arch/powerpc/include/asm/backlight.h
> +++ b/arch/powerpc/include/asm/backlight.h
> @@ -10,6 +10,7 @@
>  #define __ASM_POWERPC_BACKLIGHT_H
>  #ifdef __KERNEL__
>  
> +#include <linux/backlight.h>
>  #include <linux/fb.h>
>  #include <linux/mutex.h>

-- 
Jani Nikula, Intel
