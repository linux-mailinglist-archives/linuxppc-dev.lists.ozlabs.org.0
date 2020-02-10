Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7815A156E81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 05:46:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GCzL3stfzDqQr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 15:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GCxY0z6BzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 15:44:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Tk+C+i2S; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48GCxX3gB1z9sRl; Mon, 10 Feb 2020 15:44:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48GCxV4nP4z9sRh;
 Mon, 10 Feb 2020 15:44:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1581309888;
 bh=eC7Vr4qMU4DoQXk5j0w+V5swoIMqa+xLz/r2Lpz2x4M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Tk+C+i2SmiBkigHAQ6Fk9UeoYKVM2UomMO5RmbB1dJHzQeq4WDXIWYi4SJKXZlg0F
 NrKCOIy9jb0nTUAIZF9HMrZ5pOx/xIqfBeXVElYyStaguNIBkGNtweJX7yVnQEMpkb
 DrHuj/qp7c6GliUgZAjKsM6oo+CGy7WGFRRs7O9wO/0DxpSbv+l8m/nXDTr65Rn1GW
 q016z92JCimTRS+xzo3aF1fLRVF3nAxIjiZTRaW1bJ+7WVAdE4ATP+aY8eJbVClUCx
 ZqqROhVAhk/3AmYt08uqTHQWTBsSZAc3GqU5RWXt3A+YFIm4t2F7ShzvkBy339sQPp
 hdrVQzNtjWNgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v6 2/6] sysfs: wrap __compat_only_sysfs_link_entry_to_kobj
 function to change the symlink name
In-Reply-To: <20191211160910.21656-3-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
 <20191211160910.21656-3-sourabhjain@linux.ibm.com>
Date: Mon, 10 Feb 2020 15:44:42 +1100
Message-ID: <878slb126d.fsf@mpe.ellerman.id.au>
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, gregkh@linuxfoundation.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:
> The __compat_only_sysfs_link_entry_to_kobj function creates a symlink to a
> kobject but doesn't provide an option to change the symlink file name.
>
> This patch adds a wrapper function compat_only_sysfs_link_entry_to_kobj
> that extends the __compat_only_sysfs_link_entry_to_kobj functionality
> which allows function caller to customize the symlink name.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  fs/sysfs/group.c      | 28 +++++++++++++++++++++++++---
>  include/linux/sysfs.h | 12 ++++++++++++
>  2 files changed, 37 insertions(+), 3 deletions(-)

I'll assume no one has any objections to this and merge it via the
powerpc tree with the rest of the series.

cheers

> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index d41c21fef138..0993645f0b59 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -424,6 +424,25 @@ EXPORT_SYMBOL_GPL(sysfs_remove_link_from_group);
>  int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
>  				      struct kobject *target_kobj,
>  				      const char *target_name)
> +{
> +	return compat_only_sysfs_link_entry_to_kobj(kobj, target_kobj,
> +						target_name, NULL);
> +}
> +EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
> +
> +/**
> + * compat_only_sysfs_link_entry_to_kobj - add a symlink to a kobject pointing
> + * to a group or an attribute
> + * @kobj:		The kobject containing the group.
> + * @target_kobj:	The target kobject.
> + * @target_name:	The name of the target group or attribute.
> + * @symlink_name:	The name of the symlink file (target_name will be
> + *			considered if symlink_name is NULL).
> + */
> +int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
> +					 struct kobject *target_kobj,
> +					 const char *target_name,
> +					 const char *symlink_name)
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
> +EXPORT_SYMBOL_GPL(compat_only_sysfs_link_entry_to_kobj);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 5420817ed317..15b195a4529d 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -300,6 +300,10 @@ void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
>  int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
>  				      struct kobject *target_kobj,
>  				      const char *target_name);
> +int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
> +					 struct kobject *target_kobj,
> +					 const char *target_name,
> +					 const char *symlink_name);
>  
>  void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);
>  
> @@ -508,6 +512,14 @@ static inline int __compat_only_sysfs_link_entry_to_kobj(
>  	return 0;
>  }
>  
> +static int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
> +						struct kobject *target_kobj,
> +						const char *target_name,
> +						const char *symlink_name)
> +{
> +	return 0;
> +}
> +
>  static inline void sysfs_notify(struct kobject *kobj, const char *dir,
>  				const char *attr)
>  {
> -- 
> 2.17.2
