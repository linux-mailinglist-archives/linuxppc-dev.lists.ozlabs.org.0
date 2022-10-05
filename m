Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DE5F5B68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 23:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjRw06Vn4z3bvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 08:06:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nYuWKbRh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nYuWKbRh;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjRv14l7tz2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 08:06:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665003965; x=1696539965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XPc4iUrJQ2pmk/YLXD4nx2V2D8aelG5jLWY8aoFlCP0=;
  b=nYuWKbRhnNouD7dOyF12Ploe1ItXNqcYPI1p8dEMUPoYMi7p6MwzyHIO
   1vR0jVdZduPAge3pXXIVXUk2AQOjE0kB3GCN4PRYjP0C8HZGDDFlyNGck
   kFdRzjfXvK2Ju8P9XcwyGFDd9k3bCeUEbHdLvEZWUqc4AyEiWBw3dTM1X
   ctJEPb6HyKdae+YClwHF7q8v+u3aFcprFmX7LfW2r9bXxK9AMvwf1qia2
   fG0OwbjbuLpi8A3+4f3E5B/5/qVn6FFtHwwBllrmJtOH3Z3OIk80qUs3F
   jKgZjpwxr0sn6XcgEibLs99UIl0G0Lm2mS9ADff4ePAcXPN1QUQvzrLJh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="304266753"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="304266753"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 14:05:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="624475355"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="624475355"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 14:05:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id 0E57520352;
	Thu,  6 Oct 2022 00:05:54 +0300 (EEST)
Date: Wed, 5 Oct 2022 21:05:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] device property: Introduce
 fwnode_device_is_compatible() helper
Message-ID: <Yz3xsmy/3wlntStv@paasikivi.fi.intel.com>
References: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
 <20221005152947.71696-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005152947.71696-2-andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Wed, Oct 05, 2022 at 06:29:46PM +0300, Andy Shevchenko wrote:
> The fwnode_device_is_compatible() helper searches for the
> given string in the "compatible" string array property and,
> if found, returns true.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/property.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 1c26d263d5e4..701570423943 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -55,7 +55,6 @@ int device_property_read_string(struct device *dev, const char *propname,
>  int device_property_match_string(struct device *dev,
>  				 const char *propname, const char *string);
>  
> -bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
>  bool fwnode_property_present(const struct fwnode_handle *fwnode,
>  			     const char *propname);
>  int fwnode_property_read_u8_array(const struct fwnode_handle *fwnode,
> @@ -77,6 +76,15 @@ int fwnode_property_read_string(const struct fwnode_handle *fwnode,
>  				const char *propname, const char **val);
>  int fwnode_property_match_string(const struct fwnode_handle *fwnode,
>  				 const char *propname, const char *string);
> +
> +bool fwnode_device_is_available(const struct fwnode_handle *fwnode);
> +
> +static inline
> +bool fwnode_device_is_compatible(const struct fwnode_handle *fwnode, const char *compat)
> +{
> +	return fwnode_property_match_string(fwnode, "compatible", compat) >= 0;

fwnode_property_match_string() returns zero on success, therefore >= 0 is
not needed. I'd just use !fwnode_property_match_string(...).

For both patches:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +}
> +
>  int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
>  				       const char *prop, const char *nargs_prop,
>  				       unsigned int nargs, unsigned int index,

-- 
Regards,

Sakari Ailus
