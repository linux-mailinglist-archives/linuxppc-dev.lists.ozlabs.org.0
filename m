Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EBCF5F51
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 14:05:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479HS82jy1zF6QZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 00:05:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479HKX0XBrzF5vn
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:59:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 479HKV130fz8t4D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 23:59:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 479HKT6nBGz9sPT; Sat,  9 Nov 2019 23:59:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 479HKS3vpXz9sNx
 for <linuxppc-dev@ozlabs.org>; Sat,  9 Nov 2019 23:59:38 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DAB3AB023;
 Sat,  9 Nov 2019 12:59:34 +0000 (UTC)
Date: Sat, 9 Nov 2019 13:59:33 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v3 2/4] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
Message-ID: <20191109125933.GF1384@kitsune.suse.cz>
References: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
 <20191109122339.20484-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191109122339.20484-3-sourabhjain@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, mahesh@linux.vnet.ibm.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 09, 2019 at 05:53:37PM +0530, Sourabh Jain wrote:
> As the number of FADump sysfs files increases it is hard to manage all of
> them inside /sys/kernel directory. It's better to have all the FADump
> related sysfs files in a dedicated directory /sys/kernel/fadump. But in
> order to maintain the backward compatibility the /sys/kernel/fadump_*
> sysfs files are replicated inside /sys/kernel/fadump/ and eventually get
> removed in future.
> 
> As the FADump sysfs files are now part of dedicated directory there is no
> need to prefix their name with fadump_, hence sysfs file names are also
> updated. For example fadump_enabled sysfs file is now referred as enabled.
> 
> Also consolidate ABI documentation for all the FADump sysfs files in a
> single file Documentation/ABI/testing/sysfs-kernel-fadump.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-kernel-fadump | 41 +++++++++++++++++++
>  arch/powerpc/kernel/fadump.c                  | 38 +++++++++++++++++
>  arch/powerpc/platforms/powernv/opal-core.c    | 10 +++--
>  3 files changed, 86 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
> new file mode 100644
> index 000000000000..a77f1a5ba389
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
> @@ -0,0 +1,41 @@
> +What:		/sys/kernel/fadump/*
> +Date:		Nov 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:
> +		The /sys/kernel/fadump/* is a collection of FADump sysfs
> +		file provide information about the configuration status
> +		of Firmware Assisted Dump (FADump).
> +
> +What:		/sys/kernel/fadump/enabled
> +Date:		Nov 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read only
> +		Primarily used to identify whether the FADump is enabled in
> +		the kernel or not.
> +User:		Kdump service
> +
> +What:		/sys/kernel/fadump/registered
> +Date:		Nov 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	read/write
> +		Helps to control the dump collect feature from userspace.
> +		Setting 1 to this file enables the system to collect the
> +		dump and 0 to disable it.
> +User:		Kdump service
> +
> +What:		/sys/kernel/fadump/release_mem
> +Date:		Nov 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	write only
> +		This is a special sysfs file and only available when
> +		the system is booted to capture the vmcore using FADump.
> +		It is used to release the memory reserved by FADump to
> +		save the crash dump.
> +
> +What:		/sys/kernel/fadump/release_opalcore
> +Date:		Nov 2019
> +Contact:	linuxppc-dev@lists.ozlabs.org
> +Description:	write only
> +		The sysfs file is available when the system is booted to
> +		collect the dump on OPAL based machine. It used to release
> +		the memory used to collect the opalcore.
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index ed59855430b9..a9591def0c84 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1418,6 +1418,9 @@ static int fadump_region_show(struct seq_file *m, void *private)
>  	return 0;
>  }
>  
> +struct kobject *fadump_kobj;
> +EXPORT_SYMBOL_GPL(fadump_kobj);
> +
>  static struct kobj_attribute fadump_release_attr = __ATTR(fadump_release_mem,
>  						0200, NULL,
>  						fadump_release_memory_store);
> @@ -1428,6 +1431,16 @@ static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
>  						0644, fadump_register_show,
>  						fadump_register_store);
>  
> +static struct kobj_attribute release_attr = __ATTR(release_mem,
> +						0200, NULL,
> +						fadump_release_memory_store);
> +static struct kobj_attribute enable_attr = __ATTR(enabled,
> +						0444, fadump_enabled_show,
> +						NULL);
> +static struct kobj_attribute register_attr = __ATTR(registered,
> +						0644, fadump_register_show,
> +						fadump_register_store);
> +
>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>  
>  static void fadump_init_files(void)
> @@ -1435,6 +1448,11 @@ static void fadump_init_files(void)
>  	struct dentry *debugfs_file;
>  	int rc = 0;
>  
> +	fadump_kobj = kobject_create_and_add("fadump", kernel_kobj);
> +	if (!fadump_kobj) {
> +		pr_err("failed to create fadump kobject\n");
> +		return;
> +	}
>  	rc = sysfs_create_file(kernel_kobj, &fadump_attr.attr);
>  	if (rc)
>  		printk(KERN_ERR "fadump: unable to create sysfs file"
> @@ -1458,6 +1476,26 @@ static void fadump_init_files(void)
>  			printk(KERN_ERR "fadump: unable to create sysfs file"
>  				" fadump_release_mem (%d)\n", rc);
>  	}
> +	/* Replicating the following sysfs attributes under FADump kobject.
> +	 *
> +	 *	- fadump_enabled -> enabled
> +	 *	- fadump_registered -> registered
> +	 *	- fadump_release_mem -> release_mem
> +	 */
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
>  	return;
>  }
Hello,

wouldn't it make more sense to create the files in the new location and
add a symlink at the old location?

Also your error messages aren't really readeable. Without the fadump_
prefix it's not clear what's going on here. Perhaps quoting the file
name and saying fadump somewhere in the message would be useful.

Thanks

Michal
