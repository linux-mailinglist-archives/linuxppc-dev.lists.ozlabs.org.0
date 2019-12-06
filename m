Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB131150EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 14:17:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TtRs0WsZzDqGh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tspk3MmczDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mq6KZ0gL"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Tspj67fBz8t6V
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:49:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Tspj3Bjdz9sRR; Fri,  6 Dec 2019 23:49:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mq6KZ0gL"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Tsph1zXNz9sNx
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:49:00 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6665205F4;
 Fri,  6 Dec 2019 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575636538;
 bh=RcAid3Q85jwRgv30uwm5l3b6o2yOnXW3SLXq6APNSfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mq6KZ0gLrxaZO23IUL/dIcoNXVplyKO2N1F/AmlUgbvXsbymiL7rtfoxlvtt6CkB9
 hxPxNmzW0R4BOePNeBwnH3okTWl8xlBcu2bF4WG+RH4rBWLBRISiqp3jRAN6bIVbxQ
 6W4/DcMJ9YNECSVgkaECzhfCgTzccVdw5YVVfBZE=
Date: Fri, 6 Dec 2019 13:48:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v4 6/6] powerpc/fadump: sysfs for fadump memory reservation
Message-ID: <20191206124855.GE1360047@kroah.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-7-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206122434.29587-7-sourabhjain@linux.ibm.com>
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

On Fri, Dec 06, 2019 at 05:54:34PM +0530, Sourabh Jain wrote:
> Add a sys interface to allow querying the memory reserved by FADump for
> saving the crash dump.
> 
> Also added Documentation/ABI for the new sysfs file.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-kernel-fadump    |  7 +++++++
>  Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
>  arch/powerpc/kernel/fadump.c                     | 15 +++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
> index 5d988b919e81..8f7a64a81783 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-fadump
> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> @@ -31,3 +31,10 @@ Description:	write only
>  		the system is booted to capture the vmcore using FADump.
>  		It is used to release the memory reserved by FADump to
>  		save the crash dump.
> +
> +What:		/sys/kernel/fadump/mem_reserved
> +Date:		Dec 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read only
> +		Provide information about the amount of memory reserved by
> +		FADump to save the crash dump in bytes.
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> index 365c10209ef3..04993eaf3113 100644
> --- a/Documentation/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> @@ -268,6 +268,11 @@ Here is the list of files under kernel sysfs:
>      be handled and vmcore will not be captured. This interface can be
>      easily integrated with kdump service start/stop.
>  
> + /sys/kernel/fadump/mem_reserved
> +
> +   This is used to display the memory reserved by FADump for saving the
> +   crash dump.
> +
>   /sys/kernel/fadump_release_mem
>      This file is available only when FADump is active during
>      second kernel. This is used to release the reserved memory
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 41a3cda81791..b2af51b7c750 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1357,6 +1357,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
>  	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
>  }
>  
> +static ssize_t fadump_mem_reserved_show(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					char *buf)
> +{
> +	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
> +}
> +
>  static ssize_t fadump_register_show(struct kobject *kobj,
>  					struct kobj_attribute *attr,
>  					char *buf)
> @@ -1430,6 +1437,10 @@ static struct kobj_attribute enable_attr = __ATTR(enabled,
>  static struct kobj_attribute register_attr = __ATTR(registered,
>  						0644, fadump_register_show,
>  						fadump_register_store);
> +static struct kobj_attribute mem_reserved_attr = __ATTR(mem_reserved,
> +						0444, fadump_mem_reserved_show,
> +						NULL);

__ATTRI_RO()?

> +
>  
>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>  
> @@ -1464,6 +1475,10 @@ static void fadump_init_files(void)
>  			pr_err("unable to create release_mem sysfs file (%d)\n",
>  			       rc);
>  	}
> +	rc = sysfs_create_file(fadump_kobj, &mem_reserved_attr.attr);
> +	if (rc)
> +		pr_err("unable to create mem_reserved sysfs file (%d)\n",
> +		       rc);

Again, put it in an attribute group, that would have only required one
line, and not this mess of not cleaning up if something went wrong.

thanks,

greg k-h
