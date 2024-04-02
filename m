Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5409894FAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 12:12:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+uYQNkH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V83bc39xLz3vXW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 21:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l+uYQNkH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=heikki.krogerus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 02 Apr 2024 21:12:05 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V83Zs05B3z2y71
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 21:12:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712052725; x=1743588725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JeZSu8B31jDUOjALAzuYLuNiUkxwby08+7uq9G+Ehlk=;
  b=l+uYQNkHybc4Mmv42yBd+fhFcODjeSJIWHu5OEYXp2DLXkHjYtGRFTbR
   UoTiJ8/Q6KrJtJL6SccKQgh2Ay1RG33gPwxqDc9V1M4Bu95vnhPeBAjoQ
   OaJwn34yGFP78d29C9gC7vMsFKVB/yGU0LangVhv3zU/VDm2FvMFTnXE9
   l/siIAX6rvfknLYynp2HII62hz/rBy7R0Y7cvevQrseaqynT8G1zXCR1t
   6Dsihifs3QDqHDLpPjoFDD/mkgrX7xZxcVGmhHFr1HoHgCiZYncAKwwRM
   VgBKjhzNuzeO1db+Y5mKqrK1Xa1iXbZfCEvrXnkR8N4xZ+FmEvspefV+w
   g==;
X-CSE-ConnectionGUID: Zq0pNJG1RFWLvE0MG3YXag==
X-CSE-MsgGUID: Of3FCSf0SoGyBj1r++QsmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24669950"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="24669950"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083266"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083266"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:10:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:10:51 +0300
Date: Tue, 2 Apr 2024 13:10:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] usb: phy: fsl-usb: drop driver owner assignment
Message-ID: <ZgvZq6DIr1jTbezG@kuha.fi.intel.com>
References: <20240327174609.519252-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327174609.519252-1-krzysztof.kozlowski@linaro.org>
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

On Wed, Mar 27, 2024 at 06:46:08PM +0100, Krzysztof Kozlowski wrote:
> Core in platform_driver_register() already sets the .owner, so driver
> does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/phy/phy-fsl-usb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
> index 79617bb0a70e..1ebbf189a535 100644
> --- a/drivers/usb/phy/phy-fsl-usb.c
> +++ b/drivers/usb/phy/phy-fsl-usb.c
> @@ -1005,7 +1005,6 @@ struct platform_driver fsl_otg_driver = {
>  	.remove_new = fsl_otg_remove,
>  	.driver = {
>  		.name = driver_name,
> -		.owner = THIS_MODULE,
>  	},
>  };
>  
> -- 
> 2.34.1

-- 
heikki
