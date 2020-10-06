Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD8284587
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 07:42:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C55vc19pMzDqJV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Oct 2020 16:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C55sq3FbHzDqHx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Oct 2020 16:40:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qzl2wg01; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4C55sq1vYHz9sSG; Tue,  6 Oct 2020 16:40:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C55sq0WLrz9s1t;
 Tue,  6 Oct 2020 16:40:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1601962847;
 bh=Lwz8K6TqGkpjhFowP1aU9yF/FoNKtSq4LekTgmiz8o0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qzl2wg01BEk+MCcAtl/e26oK3+ZTq1WwVRsuDg9XLsLY6Jd4FiH4v2ZFVKUgwMum8
 +7cMJEkno9yk4y5LjMur/MnE518Q+VjbSJZhTrjlp7jYbY/Wsrkvp3/8H5s9tKhi1p
 HOtOeN5W2J3lBliufyiPfJyqL9fnm/OH9JNo9gYfEpuIFaFH5pnAAbqP+MNE3iU/xW
 mM9Cna3MJG3gyjWg9dKdYiN+cY2yjsVlVLcvQtzJZ3fv27dwUAetWNk+UQcfa0yDIt
 W6VzW7ZewX1zIOOVEPXMYf56DZpxOOD2aU3VgmnR4K7eyctSBMMBFpQlawkzOnGn/3
 BF2xaKNNk+3/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v2] powernv/elog: Fix the race while processing OPAL error
 log event.
In-Reply-To: <160187115555.1589942.2124270585910076829.stgit@jupiter>
References: <160187115555.1589942.2124270585910076829.stgit@jupiter>
Date: Tue, 06 Oct 2020 16:40:44 +1100
Message-ID: <87v9fn3o9v.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> Every error log reported by OPAL is exported to userspace through a sysfs
> interface and notified using kobject_uevent(). The userspace daemon
> (opal_errd) then reads the error log and acknowledges it error log is saved
> safely to disk. Once acknowledged the kernel removes the respective sysfs
> file entry causing respective resources getting released including kobject.
>
> However there are chances where user daemon may already be scanning elog
> entries while new sysfs elog entry is being created by kernel. User daemon
> may read this new entry and ack it even before kernel can notify userspace
> about it through kobject_uevent() call. If that happens then we have a
> potential race between elog_ack_store->kobject_put() and kobject_uevent
> which can lead to use-after-free issue of a kernfs object resulting into a
> kernel crash. This patch fixes this race by protecting a sysfs file
> creation/notification by holding an additional reference count on kobject
> until we safely send kobject_uevent().
>
> Reported-by: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
> Change in v2:
> - Instead of mutex and use extra reference count on kobject to avoid the
>   race.
> ---
>  arch/powerpc/platforms/powernv/opal-elog.c |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
> index 62ef7ad995da..230f102e87c0 100644
> --- a/arch/powerpc/platforms/powernv/opal-elog.c
> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
> @@ -222,13 +222,28 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
>  		return NULL;
>  	}
>  
> +	/*
> +	 * As soon as sysfs file for this elog is created/activated there is
> +	 * chance opal_errd daemon might read and acknowledge this elog before
> +	 * kobject_uevent() is called. If that happens then we have a potential
> +	 * race between elog_ack_store->kobject_put() and kobject_uevent which
> +	 * leads to use-after-free issue of a kernfs object resulting into
> +	 * kernel crash. To avoid this race take an additional reference count
> +	 * on kobject until we safely send kobject_uevent().
> +	 */
> +
> +	kobject_get(&elog->kobj);  /* extra reference count */

It's not really an "extra" reference.

The way the code is currently written there's one reference and it's
given to (moved into) sysfs_create_bin_file(). (Because elog_ack_store()
drops that reference).

So after that call this function no longer has a valid reference to
kobj.

If this function wants to continue to use kobj (which it does) it needs
its own reference.

Or the other way to think about it is that this code owns the initial
reference, and it needs to take a reference on behalf of the bin file
before creating the bin file.

So the patch is not wrong, but I think the comments are a bit
misleading.


>  	rc = sysfs_create_bin_file(&elog->kobj, &elog->raw_attr);
>  	if (rc) {
> +		kobject_put(&elog->kobj);
> +		/* Drop the extra reference count  */
>  		kobject_put(&elog->kobj);
>  		return NULL;
>  	}
>  
>  	kobject_uevent(&elog->kobj, KOBJ_ADD);
> +	/* Drop the extra reference count  */
> +	kobject_put(&elog->kobj);
>  
>  	return elog;

And it is bogus that we return elog here, because we no longer have a
valid reference to it, so it may already be freed.

>  }

So please send a v3 with updated comments and the return dropped.

cheers
