Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0551150CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 14:05:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tt9c302vzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 00:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tsm84K6QzDqJk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:46:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="bvhYDo2l"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Tsm80mCVz8t6V
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:46:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Tsm76pRGz9sRK; Fri,  6 Dec 2019 23:46:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="bvhYDo2l"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Tsm70xXBz9sR0
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:46:47 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2891205F4;
 Fri,  6 Dec 2019 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575636405;
 bh=SiHbrHvdA3rQHB7384b21HC7KlecqzAg0pEqLEmEU+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bvhYDo2l759TzwwMNJLmF2Upiy+Z2dSlP5KZtcVmlnmshB0fLqoxbBswp4UckLaGT
 vTPUiOopAy4WPsaIpb7t5X32xmR8tMNG0qF2AaRpTQ0acMimrlD6kB14SwXO/O10SA
 lESz9K0w2rqU90/c66FvdbnAaj9KbNvXrb2s2lvk=
Date: Fri, 6 Dec 2019 13:46:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v4 2/6] sysfs: wrap
 __compat_only_sysfs_link_entry_to_kobj function to change the symlink name
Message-ID: <20191206124642.GB1360047@kroah.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-3-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206122434.29587-3-sourabhjain@linux.ibm.com>
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

On Fri, Dec 06, 2019 at 05:54:30PM +0530, Sourabh Jain wrote:
> The __compat_only_sysfs_link_entry_to_kobj function creates a symlink to a
> kobject but doesn't provide an option to change the symlink file name.
> 
> This patch adds a wrapper function create_sysfs_symlink_entry_to_kobj that
> extends the __compat_only_sysfs_link_entry_to_kobj functionality which
> allows function caller to customize the symlink name.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  fs/sysfs/group.c      | 28 +++++++++++++++++++++++++---
>  include/linux/sysfs.h | 12 ++++++++++++
>  2 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index d41c21fef138..5eb38145b957 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -424,6 +424,25 @@ EXPORT_SYMBOL_GPL(sysfs_remove_link_from_group);
>  int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
>  				      struct kobject *target_kobj,
>  				      const char *target_name)
> +{
> +	return create_sysfs_symlink_entry_to_kobj(kobj, target_kobj,
> +						target_name, NULL);
> +}
> +EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
> +
> +/**
> + * create_sysfs_symlink_entry_to_kobj - add a symlink to a kobject pointing
> + * to a group or an attribute
> + * @kobj:		The kobject containing the group.
> + * @target_kobj:	The target kobject.
> + * @target_name:	The name of the target group or attribute.
> + * @symlink_name:	The name of the symlink file (target_name will be
> + *			considered if symlink_name is NULL).
> + */
> +int create_sysfs_symlink_entry_to_kobj(struct kobject *kobj,
> +				       struct kobject *target_kobj,
> +				       const char *target_name,
> +				       const char *symlink_name)
>  {
>  	struct kernfs_node *target;
>  	struct kernfs_node *entry;
> @@ -448,12 +467,15 @@ int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
>  		return -ENOENT;
>  	}
>  
> -	link = kernfs_create_link(kobj->sd, target_name, entry);
> +	if (!symlink_name)
> +		symlink_name = target_name;
> +
> +	link = kernfs_create_link(kobj->sd, symlink_name, entry);
>  	if (IS_ERR(link) && PTR_ERR(link) == -EEXIST)
> -		sysfs_warn_dup(kobj->sd, target_name);
> +		sysfs_warn_dup(kobj->sd, symlink_name);
>  
>  	kernfs_put(entry);
>  	kernfs_put(target);
>  	return PTR_ERR_OR_ZERO(link);
>  }
> -EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
> +EXPORT_SYMBOL_GPL(create_sysfs_symlink_entry_to_kobj);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 5420817ed317..123c6f10333a 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -300,6 +300,10 @@ void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
>  int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
>  				      struct kobject *target_kobj,
>  				      const char *target_name);
> +int create_sysfs_symlink_entry_to_kobj(struct kobject *kobj,
> +				       struct kobject *target_kobj,
> +				       const char *target_name,
> +				       const char *symlink_name);

sysfs_create_symlink_entry_to_kobj()?

I can't remember why we put __compat_only there, perhaps because we do
not want people to really use this unless you really really have to?

So then keep compat_only here as well?

What breaks if you remove those undocumented sysfs files?  What
userspace tool do you have that will even notice?

thanks,

greg k-h
