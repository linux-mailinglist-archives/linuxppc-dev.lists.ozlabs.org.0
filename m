Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB30896C36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 12:25:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVEntZaB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8gqy0Z1Bz3vpk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 21:25:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVEntZaB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=heikki.krogerus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8gqB5SKcz3vdC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 21:24:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712139896; x=1743675896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ESt8CZC/Qd2eEHRQmlwIpFHD3SOwTUjqLs41t4VZMsQ=;
  b=bVEntZaBTN+wgVg21LpbC2AKZFEmmH18bON8JH82LztMKs8ZfXnlRJJH
   V4WyVXJQgJr5G4z7dKQeLJg+LCmSdK4wQdEga2ZSg0GOEhO6xeryb1F3v
   JXl7cTnfg8cEPoWDmLsevqvv7yiBvY++4EIDkSeDMjjIYkkYaLPGbz0xM
   Nr5a1u3EpSCw1WP7hWsnfwM9He8M066+X2Ir/qu20hcfbxjNH0nczaTWS
   BcHbMR5FAYNs9jfPZSkcByfMBFSxGqDxa/zy7jG4+QStddf1oa86hpAgz
   8NRKPy4O5yOFQ+8XEM+DPWUQbWijLqB8hxumWq241E9zdKH4t86G0ONIa
   g==;
X-CSE-ConnectionGUID: PicjuoaTSXGuS+ZdqqCgig==
X-CSE-MsgGUID: x048m4+JTFWkBNvLA2n/qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7282967"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7282967"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="937084818"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="937084818"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 03 Apr 2024 03:24:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 03 Apr 2024 13:24:45 +0300
Date: Wed, 3 Apr 2024 13:24:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/3] usb: typec: nvidia: drop driver owner assignment
Message-ID: <Zg0ubZ9P9sCVLOrX@kuha.fi.intel.com>
References: <20240331091737.19836-1-krzk@kernel.org>
 <20240331091737.19836-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240331091737.19836-2-krzk@kernel.org>
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

On Sun, Mar 31, 2024 at 11:17:36AM +0200, Krzysztof Kozlowski wrote:
> Core in typec_altmode_register_driver() already sets the .owner, so
> driver does not need to.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v2:
> 1. None
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
