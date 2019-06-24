Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CC518E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 18:45:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XZsc1CzlzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 02:45:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.54.143; helo=18.mo4.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3595 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Jun 2019 02:43:54 AEST
Received: from 18.mo4.mail-out.ovh.net (18.mo4.mail-out.ovh.net
 [188.165.54.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XZqt70XtzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 02:43:50 +1000 (AEST)
Received: from player799.ha.ovh.net (unknown [10.108.42.239])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A8B131F867D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 17:24:58 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 4139972B5D3C;
 Mon, 24 Jun 2019 15:24:53 +0000 (UTC)
Date: Mon, 24 Jun 2019 17:24:52 +0200
From: Greg Kurz <groug@kaod.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH] ocxl: Fix concurrent AFU open and device removal
Message-ID: <20190624172452.7e217596@bahia.lan>
In-Reply-To: <20190624144148.32022-1-fbarrat@linux.ibm.com>
References: <20190624144148.32022-1-fbarrat@linux.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16954363747624524133
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, alastair@au1.ibm.com,
 andrew.donnellan@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Jun 2019 16:41:48 +0200
Frederic Barrat <fbarrat@linux.ibm.com> wrote:

> If an ocxl device is unbound through sysfs at the same time its AFU is
> being opened by a user process, the open code may dereference freed
> stuctures, which can lead to kernel oops messages. You'd have to hit a
> tiny time window, but it's possible. It's fairly easy to test by
> making the time window bigger artificially.
> 
> Fix it with a combination of 2 changes:
> - when an AFU device is found in the IDR by looking for the device
> minor number, we should hold a reference on the device until after the
> context is allocated. A reference on the AFU structure is kept when
> the context is allocated, so we can release the reference on the
> device after the context allocation.
> - with the fix above, there's still another even tinier window,
> between the time the AFU device is found in the IDR and the reference
> on the device is taken. We can fix this one by removing the IDR entry
> earlier, when the device setup is removed, instead of waiting for the
> 'release' device callback. With proper locking around the IDR.
> 
> Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> mpe: this fixes a commit merged in v5.2-rc1. It's late, and I don't think it's that important. If it's for the next merge window, I would add:
> Cc: stable@vger.kernel.org      # v5.2
> 
> 
> drivers/misc/ocxl/file.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 2870c25da166..4d1b44de1492 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -18,18 +18,15 @@ static struct class *ocxl_class;
>  static struct mutex minors_idr_lock;
>  static struct idr minors_idr;
>  
> -static struct ocxl_file_info *find_file_info(dev_t devno)
> +static struct ocxl_file_info *find_and_get_file_info(dev_t devno)
>  {
>  	struct ocxl_file_info *info;
>  
> -	/*
> -	 * We don't declare an RCU critical section here, as our AFU
> -	 * is protected by a reference counter on the device. By the time the
> -	 * info reference is removed from the idr, the ref count of
> -	 * the device is already at 0, so no user API will access that AFU and
> -	 * this function can't return it.
> -	 */
> +	mutex_lock(&minors_idr_lock);
>  	info = idr_find(&minors_idr, MINOR(devno));
> +	if (info)
> +		get_device(&info->dev);
> +	mutex_unlock(&minors_idr_lock);
>  	return info;
>  }
>  
> @@ -58,14 +55,16 @@ static int afu_open(struct inode *inode, struct file *file)
>  
>  	pr_debug("%s for device %x\n", __func__, inode->i_rdev);
>  
> -	info = find_file_info(inode->i_rdev);
> +	info = find_and_get_file_info(inode->i_rdev);
>  	if (!info)
>  		return -ENODEV;
>  
>  	rc = ocxl_context_alloc(&ctx, info->afu, inode->i_mapping);
> -	if (rc)
> +	if (rc) {
> +		put_device(&info->dev);

You could have a single call site for put_device() since it's
needed for both branches. No big deal.

>  		return rc;
> -
> +	}
> +	put_device(&info->dev);
>  	file->private_data = ctx;
>  	return 0;
>  }
> @@ -487,7 +486,6 @@ static void info_release(struct device *dev)
>  {
>  	struct ocxl_file_info *info = container_of(dev, struct ocxl_file_info, dev);
>  
> -	free_minor(info);
>  	ocxl_afu_put(info->afu);
>  	kfree(info);
>  }
> @@ -577,6 +575,7 @@ void ocxl_file_unregister_afu(struct ocxl_afu *afu)
>  
>  	ocxl_file_make_invisible(info);
>  	ocxl_sysfs_unregister_afu(info);
> +	free_minor(info);

Since the IDR entry is added by ocxl_file_register_afu(), it seems to make
sense to undo that in ocxl_file_unregister_afu(). Out of curiosity, was there
any historical reason to do this in info_release() in the first place ?

Reviewed-by: Greg Kurz <groug@kaod.org>

>  	device_unregister(&info->dev);
>  }
>  

