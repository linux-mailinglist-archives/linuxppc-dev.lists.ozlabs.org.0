Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CA1150B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 13:57:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tt0W0mljzDqKP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TskM2qwCzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:45:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="M9gl0sSC"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47TskL3V0Qz8wHr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:45:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47TskL0kpMz9sRG; Fri,  6 Dec 2019 23:45:14 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="M9gl0sSC"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47TskJ61M1z9sR4
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:45:12 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED01D205F4;
 Fri,  6 Dec 2019 12:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575636310;
 bh=GHMiXwT065uPwUwIIqQU+AS8Kz5f4G24qOnNzLCcVR8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M9gl0sSCJbv/ZU5qkoIHQlVe78vfB54tu/5RvIJNlSEZQtkeyvaQmDmwSUPODHIKE
 IuuuoGKl3uaJ2EDiwtpNhJ0PznME4zlZefVzyVR0ZFIb3kvz3snk3mdk2/vjZ6P0Ao
 JBjQwUoGO385uoxocK0605KJsvMdMdttKgJpGwPs=
Date: Fri, 6 Dec 2019 13:45:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v4 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
Message-ID: <20191206124508.GA1360047@kroah.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-4-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206122434.29587-4-sourabhjain@linux.ibm.com>
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 06, 2019 at 05:54:31PM +0530, Sourabh Jain wrote:
> +static struct kobj_attribute release_attr = __ATTR(release_mem,
>  						0200, NULL,
>  						fadump_release_memory_store);
> -static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
> +static struct kobj_attribute enable_attr = __ATTR(enabled,
>  						0444, fadump_enabled_show,
>  						NULL);

__ATTR_RO()?

> -static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
> +static struct kobj_attribute register_attr = __ATTR(registered,
>  						0644, fadump_register_show,
>  						fadump_register_store);

__ATTR_RW()?

And then use an ATTRIBUTE_GROUP() macro to create a group so that you
then can do:

> @@ -1452,11 +1450,47 @@ static void fadump_init_files(void)
>  		printk(KERN_ERR "fadump: unable to create debugfs file"
>  				" fadump_region\n");
>  
> +	rc = sysfs_create_file(fadump_kobj, &enable_attr.attr);
> +	if (rc)
> +		pr_err("unable to create enabled sysfs file (%d)\n",
> +		       rc);
> +	rc = sysfs_create_file(fadump_kobj, &register_attr.attr);
> +	if (rc)
> +		pr_err("unable to create registered sysfs file (%d)\n",
> +		       rc);
> +	if (fw_dump.dump_active) {
> +		rc = sysfs_create_file(fadump_kobj, &release_attr.attr);
> +		if (rc)
> +			pr_err("unable to create release_mem sysfs file (%d)\n",
> +			       rc);
> +	}

a single call to sysfs_create_groups() here instead of trying to unwind
the mess if something went wrong.

thanks,

greg k-h
