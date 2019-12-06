Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604C1150DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 14:14:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TtNM3wcfzDqDx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:14:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tsng4v2mzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:48:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="z8O3FTtm"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Tsng027Qz8vjT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:48:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Tsnf4rbZz9sRm; Fri,  6 Dec 2019 23:48:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="z8O3FTtm"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Tsnd6zBdz9sR0
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:48:05 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7EDF2205F4;
 Fri,  6 Dec 2019 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575636484;
 bh=EAvEnkkvOACU3sTjJ8LJHC33CNAeqgd5O8xnbCoNGHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z8O3FTtmds3NfL0eaaWrqVeGod4cU1RlRvmbinaGEBGCryDrHEwCwnlYbf+obER7t
 NZ2fuZzcu+QqnQ4prBoCUXSYl5tu4VTpw+sFElujF01j5Pu/roVLspvkaTgQiY/2qM
 FyBeH+cjRSlklEAmeczWsCeoERj0ST+BpF7W6A6k=
Date: Fri, 6 Dec 2019 13:48:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v4 4/6] powerpc/powernv: move core and
 fadump_release_opalcore under new kobject
Message-ID: <20191206124801.GD1360047@kroah.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-5-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206122434.29587-5-sourabhjain@linux.ibm.com>
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

On Fri, Dec 06, 2019 at 05:54:32PM +0530, Sourabh Jain wrote:
> The /sys/firmware/opal/core and /sys/kernel/fadump_release_opalcore sysfs
> files are used to export and release the OPAL memory on PowerNV platform.
> let's organize them into a new kobject under /sys/firmware/opal/mpipl/
> directory.
> 
> A symlink is added to maintain the backward compatibility for
> /sys/firmware/opal/core sysfs file.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  .../sysfs-kernel-fadump_release_opalcore      |  2 ++
>  .../powerpc/firmware-assisted-dump.rst        | 15 +++++----
>  arch/powerpc/platforms/powernv/opal-core.c    | 31 ++++++++++++++-----
>  3 files changed, 34 insertions(+), 14 deletions(-)
>  rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (82%)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
> similarity index 82%
> rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
> rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
> index 53313c1d4e7a..a8d46cd0f4e6 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
> +++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
> @@ -1,3 +1,5 @@
> +This ABI is moved to /sys/firmware/opal/mpipl/release_core.
> +
>  What:		/sys/kernel/fadump_release_opalcore
>  Date:		Sep 2019
>  Contact:	linuxppc-dev@lists.ozlabs.org
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> index 0455a78486d5..345a3405206e 100644
> --- a/Documentation/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> @@ -112,13 +112,13 @@ to ensure that crash data is preserved to process later.
>  
>  -- On OPAL based machines (PowerNV), if the kernel is build with
>     CONFIG_OPAL_CORE=y, OPAL memory at the time of crash is also
> -   exported as /sys/firmware/opal/core file. This procfs file is
> +   exported as /sys/firmware/opal/mpipl/core file. This procfs file is
>     helpful in debugging OPAL crashes with GDB. The kernel memory
>     used for exporting this procfs file can be released by echo'ing
> -   '1' to /sys/kernel/fadump_release_opalcore node.
> +   '1' to /sys/firmware/opal/mpipl/release_core node.
>  
>     e.g.
> -     # echo 1 > /sys/kernel/fadump_release_opalcore
> +     # echo 1 > /sys/firmware/opal/mpipl/release_core
>  
>  Implementation details:
>  -----------------------
> @@ -283,14 +283,17 @@ Here is the list of files under kernel sysfs:
>      enhanced to use this interface to release the memory reserved for
>      dump and continue without 2nd reboot.
>  
> - /sys/kernel/fadump_release_opalcore
> +Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
> +      /sys/firmware/opal/mpipl/release_core
> +
> + /sys/firmware/opal/mpipl/release_core
>  
>      This file is available only on OPAL based machines when FADump is
>      active during capture kernel. This is used to release the memory
> -    used by the kernel to export /sys/firmware/opal/core file. To
> +    used by the kernel to export /sys/firmware/opal/mpipl/core file. To
>      release this memory, echo '1' to it:
>  
> -    echo 1  > /sys/kernel/fadump_release_opalcore
> +    echo 1  > /sys/firmware/opal/mpipl/release_core
>  
>  Here is the list of files under powerpc debugfs:
>  (Assuming debugfs is mounted on /sys/kernel/debug directory.)
> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
> index ed895d82c048..7fcc092d065e 100644
> --- a/arch/powerpc/platforms/powernv/opal-core.c
> +++ b/arch/powerpc/platforms/powernv/opal-core.c
> @@ -589,7 +589,8 @@ static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
>  	return count;
>  }
>  
> -static struct kobj_attribute opalcore_rel_attr = __ATTR(fadump_release_opalcore,
> +struct kobject *mpipl_kobj;
> +static struct kobj_attribute opalcore_rel_attr = __ATTR(release_core,
>  						0200, NULL,
>  						fadump_release_opalcore_store);

__ATTR_WO()?

>  
> @@ -609,7 +610,7 @@ static int __init opalcore_init(void)
>  	 * then capture the dump.
>  	 */
>  	if (!(is_opalcore_usable())) {
> -		pr_err("Failed to export /sys/firmware/opal/core\n");
> +		pr_err("Failed to export /sys/firmware/opal/mpipl/core\n");
>  		opalcore_cleanup();
>  		return rc;
>  	}
> @@ -617,18 +618,32 @@ static int __init opalcore_init(void)
>  	/* Set OPAL core file size */
>  	opal_core_attr.size = oc_conf->opalcore_size;
>  
> +	mpipl_kobj = kobject_create_and_add("mpipl", opal_kobj);
> +	if (!mpipl_kobj) {
> +		pr_err("unable to create mpipl kobject\n");
> +		return -ENOMEM;
> +	}
> +
>  	/* Export OPAL core sysfs file */
> -	rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
> +	rc = sysfs_create_bin_file(mpipl_kobj, &opal_core_attr);

Again, create an attribute group and add everything all at once, makes
it much simpler and your error cleanup logic will actually work :)

thanks,

greg k-h
