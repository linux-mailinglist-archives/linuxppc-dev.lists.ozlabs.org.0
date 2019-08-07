Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F09842CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 05:12:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Gl55g36zDr72
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 13:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463GjR2W4GzDqyH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 13:10:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 463GjP0xBvz9sNk;
 Wed,  7 Aug 2019 13:10:49 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/fadump: sysfs for fadump memory reservation
In-Reply-To: <20190806031242.30749-1-sourabhjain@linux.ibm.com>
References: <20190806031242.30749-1-sourabhjain@linux.ibm.com>
Date: Wed, 07 Aug 2019 13:10:35 +1000
Message-ID: <87lfw5vff8.fsf@concordia.ellerman.id.au>
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
Cc: mahesh@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Sourabh Jain <sourabhjain@linux.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> Add a sys interface to allow querying the memory reserved by fadump
> for saving the crash dump.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
>  arch/powerpc/kernel/fadump.c                     | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
> index 9ca12830a48e..4a7f6dc556f5 100644
> --- a/Documentation/powerpc/firmware-assisted-dump.rst
> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
> @@ -222,6 +222,11 @@ Here is the list of files under kernel sysfs:
>      be handled and vmcore will not be captured. This interface can be
>      easily integrated with kdump service start/stop.
>  
> +/sys/kernel/fadump_mem_reserved
> +
> +   This is used to display the memory reserved by fadump for saving the
> +   crash dump.
> +
>   /sys/kernel/fadump_release_mem
>      This file is available only when fadump is active during
>      second kernel. This is used to release the reserved memory

Dumping these in /sys/kernel is pretty gross, but I guess that ship has
sailed.

But please add it to Documentation/ABI, and Cc the appropriate lists/people.

cheers

> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4eab97292cc2..70d49013ebec 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1514,6 +1514,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
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
> @@ -1632,6 +1639,9 @@ static struct kobj_attribute fadump_attr = __ATTR(fadump_enabled,
>  static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
>  						0644, fadump_register_show,
>  						fadump_register_store);
> +static struct kobj_attribute fadump_mem_reserved_attr =
> +			__ATTR(fadump_mem_reserved, 0444,
> +			fadump_mem_reserved_show, NULL);
>  
>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>  
> @@ -1663,6 +1673,10 @@ static void fadump_init_files(void)
>  			printk(KERN_ERR "fadump: unable to create sysfs file"
>  				" fadump_release_mem (%d)\n", rc);
>  	}
> +	rc = sysfs_create_file(kernel_kobj, &fadump_mem_reserved_attr.attr);
> +	if (rc)
> +		pr_err("unable to create sysfs file fadump_mem_reserved (%d)\n",
> +			rc);
>  	return;
>  }
>  
> -- 
> 2.17.2
