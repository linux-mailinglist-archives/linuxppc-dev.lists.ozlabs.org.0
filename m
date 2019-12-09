Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08F1167FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 09:12:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WbWq32R8zDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 19:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WbTy0CkHzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:10:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="W4PAq+1v"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47WbTx5qMJz994t
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 19:10:29 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47WbTx5F7pz9sR1; Mon,  9 Dec 2019 19:10:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="W4PAq+1v"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47WbTx2rs9z9sPh
 for <linuxppc-dev@ozlabs.org>; Mon,  9 Dec 2019 19:10:27 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB7C8205ED;
 Mon,  9 Dec 2019 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575879025;
 bh=iTTgNq9RENesPj9dq9RXmXWCptL56RAD7KSlfOxJCCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W4PAq+1v4SGp/ZC4mYVV7bkWkkmkMeSJN+xHAOiJzVl2h/doEl1GKjIvH5q+6RYhq
 gMLOvR7IoUhVnPu8dES0A6xwdvMRlcUpogiTH7lyvohxD6WvV+UK1kZu1e5Q/qMsZJ
 T6v3PF7wMHVW2NSsTGCJpMFoQKJcGMMPH7delpuo=
Date: Mon, 9 Dec 2019 09:10:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v5 3/6] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
Message-ID: <20191209081023.GC706232@kroah.com>
References: <20191209045826.30076-1-sourabhjain@linux.ibm.com>
 <20191209045826.30076-4-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209045826.30076-4-sourabhjain@linux.ibm.com>
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

On Mon, Dec 09, 2019 at 10:28:23AM +0530, Sourabh Jain wrote:
> +#define CREATE_SYMLINK(target, symlink_name) do {\
> +	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj, \
> +						  target, symlink_name); \
> +	if (rc) \
> +		pr_err("unable to create %s symlink (%d)", symlink_name, rc); \
> +} while (0)


No need for a macro, just spell it all out.  And properly clean up if an
error happens, you are just printing it out and moving on, which is
probably NOT what you want to do, right?

> +static struct attribute_group fadump_group = {
> +	.attrs = fadump_attrs,
> +};

ATTRIBUTE_GROUPS()?

thanks,

greg k-h
