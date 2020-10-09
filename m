Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE65288199
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 07:07:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6x0R2sTvzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 16:07:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6wyx4lrszDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 16:06:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UGj9q5W1; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4C6wyx4JYdz9sTK; Fri,  9 Oct 2020 16:06:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6wyx22WYz9sSC;
 Fri,  9 Oct 2020 16:06:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602219993;
 bh=u/tC6kBNuTt1DLx2MDnVvp5ksb9SRbHet77yVS5sp94=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=UGj9q5W1y29ncbaf5d9vHMAsq7u4kBtOrW4Ly3fqLPyMjqPkuI4CI9bCbTJ2yTYtc
 v5Vj38kfbQlwdWX+cEfbTy0FzovBVHI12wQcWl+9Bp8atKTpnwQpsx22cLaPN4IgeG
 kWk43Ikxbt3GEWeZ2oF75vXMWB7U5EGd/WXl21ftOesFTwWRL2DaECtSLa8ywjX2sF
 7QUEIsw2NEOSICj7lVt8ZfPct3d8qXpDaF/CWkX5LDq80qVWGpuJsvLL16/oyLoeio
 LXX2t8aUhGz6FeJSsIYxKtO4dxd1disgHrLfkzEaa+jqJXbPAdgHl+5lNiT1xNx/4l
 0+8tNmsw0MpMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/dump: Fix race while processing OPAL dump
In-Reply-To: <20201007101742.40757-1-hegdevasant@linux.vnet.ibm.com>
References: <20201007101742.40757-1-hegdevasant@linux.vnet.ibm.com>
Date: Fri, 09 Oct 2020 16:06:32 +1100
Message-ID: <87a6ww0yzr.fsf@mpe.ellerman.id.au>
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
> diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
> index 543c816fa99e..7e6eeedec32b 100644
> --- a/arch/powerpc/platforms/powernv/opal-dump.c
> +++ b/arch/powerpc/platforms/powernv/opal-dump.c
> @@ -346,21 +345,39 @@ static struct dump_obj *create_dump_obj(uint32_t id, size_t size,
>  	rc = kobject_add(&dump->kobj, NULL, "0x%x-0x%x", type, id);
>  	if (rc) {
>  		kobject_put(&dump->kobj);
> -		return NULL;
> +		return;
>  	}
>  
> +	/*
> +	 * As soon as the sysfs file for this dump is created/activated there is
> +	 * a chance the opal_errd daemon (or any userspace) might read and
> +	 * acknowledge the dump before kobject_uevent() is called. If that
> +	 * happens then there is a potential race between
> +	 * dump_ack_store->kobject_put() and kobject_uevent() which leads to a
> +	 * use-after-free of a kernfs object resulting in a kernel crash.
> +	 *
> +	 * To avoid that, we need to take a reference on behalf of the bin file,
> +	 * so that our reference remains valid while we call kobject_uevent().
> +	 * We then drop our reference before exiting the function, leaving the
> +	 * bin file to drop the last reference (if it hasn't already).
> +	 */
> +
> +	/* Take a reference for the bin file */
> +	kobject_get(&dump->kobj);
>  	rc = sysfs_create_bin_file(&dump->kobj, &dump->dump_attr);
>  	if (rc) {
>  		kobject_put(&dump->kobj);
> -		return NULL;
> +		/* Drop reference count taken for bin file */
> +		kobject_put(&dump->kobj);
> +		return;
>  	}
>  
>  	pr_info("%s: New platform dump. ID = 0x%x Size %u\n",
>  		__func__, dump->id, dump->size);
>  
>  	kobject_uevent(&dump->kobj, KOBJ_ADD);
> -
> -	return dump;
> +	/* Drop reference count taken for bin file */
> +	kobject_put(&dump->kobj);
>  }

I think this would be better if it was reworked along the lines of:

aea948bb80b4 ("powerpc/powernv/elog: Fix race while processing OPAL error log event.")

cheers
