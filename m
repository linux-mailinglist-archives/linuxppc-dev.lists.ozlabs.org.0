Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EF1894FB3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 12:13:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buugL1es;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V83cN6w44z3vZw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 21:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=buugL1es;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=heikki.krogerus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V83bY04hRz3h05
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 21:12:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712052762; x=1743588762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Os6fVasxSxEfgD/AHz8TpcoCEaHcsoZy8kQLOOFg1WY=;
  b=buugL1eshg8aHr9GKq5q3MOybfbU9mExvuI9mg2VxkuBY8OMvO9+iRcT
   qENNCGyqdG8VvE91F7MwhQU8v6FreXgFYvJpK83kGPgv43aDVEjJqqZyp
   9WE2EEkTvPPSZVrwFB+Wu2aaf06B+VgJ/A38pisyUdgFIYrF2u7U1zflA
   N53WlQ+3WKSY7yWwRW9BYew9F6LpNXL0CFDdnbV0lNuCy72XFF/CVPwyv
   Ti4TtuLY9geXYUuiRmA+n1k09KlAqafBtpQh84i+60hUZvYyIv9kEkynw
   pVPqoiGlkP+WSsjqbQbb6XTwtiDBHcMyWSvvsOhserC+XTp4jiSoWLRzT
   w==;
X-CSE-ConnectionGUID: +PCWpFr/RuWMKA+D4P5+3w==
X-CSE-MsgGUID: kA5aRt9NR+WEas6+a/wD7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24669994"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="24669994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083267"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083267"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:11:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:11:31 +0300
Date: Tue, 2 Apr 2024 13:11:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] usb: typec: nvidia: drop driver owner assignment
Message-ID: <ZgvZ07U+DFcPATII@kuha.fi.intel.com>
References: <20240327174609.519252-1-krzysztof.kozlowski@linaro.org>
 <20240327174609.519252-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327174609.519252-2-krzysztof.kozlowski@linaro.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 06:46:09PM +0100, Krzysztof Kozlowski wrote:
> Core in typec_altmode_register_driver() already sets the .owner, so
> driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/nvidia.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
> index c36769736405..fe70b36f078f 100644
> --- a/drivers/usb/typec/altmodes/nvidia.c
> +++ b/drivers/usb/typec/altmodes/nvidia.c
> @@ -35,7 +35,6 @@ static struct typec_altmode_driver nvidia_altmode_driver = {
>  	.remove = nvidia_altmode_remove,
>  	.driver = {
>  		.name = "typec_nvidia",
> -		.owner = THIS_MODULE,
>  	},
>  };
>  module_typec_altmode_driver(nvidia_altmode_driver);
> -- 
> 2.34.1

-- 
heikki
