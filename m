Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC94332C0D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 17:30:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw1050KHvz3dPv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 03:30:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CfgjvL6O;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CfgjvL6O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CfgjvL6O; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CfgjvL6O; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0z911vTz3cV4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 03:29:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSaGyOLWX+NEWKQMtAmx6cE0h7h+IwRRgb4ZBbKVgjA=;
 b=CfgjvL6OhVBB4uFTP01C7DLLq8jzfUBHjnA3eFhEPn2/75kF/Q5nwOqK9j2zzk/XB/cL3z
 juii7vRTJK4iDRRFDOi7yWwC2f1MySQ8P8c6Uq/IkJgWdx5tlHY4r9lmoKo0zcEv2eBXDi
 2xhtcvwqtCyghxvCZzgADmVdLkwNxH4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSaGyOLWX+NEWKQMtAmx6cE0h7h+IwRRgb4ZBbKVgjA=;
 b=CfgjvL6OhVBB4uFTP01C7DLLq8jzfUBHjnA3eFhEPn2/75kF/Q5nwOqK9j2zzk/XB/cL3z
 juii7vRTJK4iDRRFDOi7yWwC2f1MySQ8P8c6Uq/IkJgWdx5tlHY4r9lmoKo0zcEv2eBXDi
 2xhtcvwqtCyghxvCZzgADmVdLkwNxH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-9MI7-g3zN_CJjzd-XPQQXA-1; Tue, 09 Mar 2021 11:29:17 -0500
X-MC-Unique: 9MI7-g3zN_CJjzd-XPQQXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135A2101F00D;
 Tue,  9 Mar 2021 16:29:15 +0000 (UTC)
Received: from [10.36.114.143] (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42D871A867;
 Tue,  9 Mar 2021 16:29:02 +0000 (UTC)
Subject: Re: [PATCH 6/9] virtio_balloon: remove the balloon-kvm file system
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-7-hch@lst.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <c5c1b993-d391-b689-2293-97bba22368f1@redhat.com>
Date: Tue, 9 Mar 2021 17:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-7-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.03.21 16:53, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/virtio/virtio_balloon.c | 30 +++---------------------------
>   1 file changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index cae76ee5bdd688..1efb890cd3ff09 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -6,6 +6,7 @@
>    *  Copyright 2008 Rusty Russell IBM Corporation
>    */
>   
> +#include <linux/anon_inodes.h>
>   #include <linux/virtio.h>
>   #include <linux/virtio_balloon.h>
>   #include <linux/swap.h>
> @@ -42,10 +43,6 @@
>   	(1 << (VIRTIO_BALLOON_HINT_BLOCK_ORDER + PAGE_SHIFT))
>   #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
>   
> -#ifdef CONFIG_BALLOON_COMPACTION
> -static struct vfsmount *balloon_mnt;
> -#endif
> -
>   enum virtio_balloon_vq {
>   	VIRTIO_BALLOON_VQ_INFLATE,
>   	VIRTIO_BALLOON_VQ_DEFLATE,
> @@ -805,18 +802,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
>   
>   	return MIGRATEPAGE_SUCCESS;
>   }
> -
> -static int balloon_init_fs_context(struct fs_context *fc)
> -{
> -	return init_pseudo(fc, BALLOON_KVM_MAGIC) ? 0 : -ENOMEM;
> -}
> -
> -static struct file_system_type balloon_fs = {
> -	.name           = "balloon-kvm",
> -	.init_fs_context = balloon_init_fs_context,
> -	.kill_sb        = kill_anon_super,
> -};
> -
>   #endif /* CONFIG_BALLOON_COMPACTION */
>   
>   static unsigned long shrink_free_pages(struct virtio_balloon *vb,
> @@ -909,17 +894,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
>   		goto out_free_vb;
>   
>   #ifdef CONFIG_BALLOON_COMPACTION
> -	balloon_mnt = kern_mount(&balloon_fs);
> -	if (IS_ERR(balloon_mnt)) {
> -		err = PTR_ERR(balloon_mnt);
> -		goto out_del_vqs;
> -	}
> -
>   	vb->vb_dev_info.migratepage = virtballoon_migratepage;
> -	vb->vb_dev_info.inode = alloc_anon_inode_sb(balloon_mnt->mnt_sb);
> +	vb->vb_dev_info.inode = alloc_anon_inode();
>   	if (IS_ERR(vb->vb_dev_info.inode)) {
>   		err = PTR_ERR(vb->vb_dev_info.inode);
> -		goto out_kern_unmount;
> +		goto out_del_vqs;
>   	}
>   	vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
>   #endif
> @@ -1016,8 +995,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
>   out_iput:
>   #ifdef CONFIG_BALLOON_COMPACTION
>   	iput(vb->vb_dev_info.inode);
> -out_kern_unmount:
> -	kern_unmount(balloon_mnt);
>   out_del_vqs:
>   #endif
>   	vdev->config->del_vqs(vdev);
> @@ -1070,7 +1047,6 @@ static void virtballoon_remove(struct virtio_device *vdev)
>   	if (vb->vb_dev_info.inode)
>   		iput(vb->vb_dev_info.inode);
>   
> -	kern_unmount(balloon_mnt);
>   #endif
>   	kfree(vb);
>   }
> 

... you might know what I am going to say :)

Apart from that LGTM.

-- 
Thanks,

David / dhildenb

