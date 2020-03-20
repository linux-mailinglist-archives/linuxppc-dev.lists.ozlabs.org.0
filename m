Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C718C848
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 08:38:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kFy53XjRzDrcd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 18:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YLldNI9a; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kFwR2bW4zDrbv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 18:37:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584689827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1gum1vAgnk9ohf+zv7pJnapCaZq6wcMIaHYE+lE4nY=;
 b=YLldNI9aNF6eZYVqh/9elfdrkL+4Tj6O1M6gPUJzcIz44etgLRM/opfCfMW119GRIjEWkP
 sqqKxgMf/DT9cpkCB88L6Vx8xXWKyaA1r7VjDwE1vjCssPniV4GxaAERACRPXZPLdYEKRj
 xq+BuYjowsdvNSCj+YwHQCcP77dNt8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-3-PS3H37ND6CvYBdStjOow-1; Fri, 20 Mar 2020 03:37:03 -0400
X-MC-Unique: 3-PS3H37ND6CvYBdStjOow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 120D88010D9;
 Fri, 20 Mar 2020 07:37:00 +0000 (UTC)
Received: from localhost (ovpn-13-97.pek2.redhat.com [10.72.13.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00D1460BF1;
 Fri, 20 Mar 2020 07:36:56 +0000 (UTC)
Date: Fri, 20 Mar 2020 15:36:53 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 3/8] drivers/base/memory: store mapping between MMOP_*
 and string in an array
Message-ID: <20200320073653.GE2987@MiWiFi-R3L-srv>
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319131221.14044-4-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/19/20 at 02:12pm, David Hildenbrand wrote:
> Let's use a simple array which we can reuse soon. While at it, move the
> string->mmop conversion out of the device hotplug lock.
> 
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/memory.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index e7e77cafef80..8a7f29c0bf97 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -28,6 +28,24 @@
>  
>  #define MEMORY_CLASS_NAME	"memory"
>  
> +static const char *const online_type_to_str[] = {
> +	[MMOP_OFFLINE] = "offline",
> +	[MMOP_ONLINE] = "online",
> +	[MMOP_ONLINE_KERNEL] = "online_kernel",
> +	[MMOP_ONLINE_MOVABLE] = "online_movable",
> +};
> +
> +static int memhp_online_type_from_str(const char *str)
> +{
> +	int i;

I would change it as: 

	for (int i = 0; i < ARRAY_SIZE(online_type_to_str); i++) {

> +
> +	for (i = 0; i < ARRAY_SIZE(online_type_to_str); i++) {
> +		if (sysfs_streq(str, online_type_to_str[i]))
> +			return i;
> +	}
> +	return -EINVAL;
> +}
> +
>  #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
>  
>  static int sections_per_block;
> @@ -236,26 +254,17 @@ static int memory_subsys_offline(struct device *dev)
>  static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>  			   const char *buf, size_t count)
>  {
> +	const int online_type = memhp_online_type_from_str(buf);
>  	struct memory_block *mem = to_memory_block(dev);
> -	int ret, online_type;
> +	int ret;
> +
> +	if (online_type < 0)
> +		return -EINVAL;
>  
>  	ret = lock_device_hotplug_sysfs();
>  	if (ret)
>  		return ret;
>  
> -	if (sysfs_streq(buf, "online_kernel"))
> -		online_type = MMOP_ONLINE_KERNEL;
> -	else if (sysfs_streq(buf, "online_movable"))
> -		online_type = MMOP_ONLINE_MOVABLE;
> -	else if (sysfs_streq(buf, "online"))
> -		online_type = MMOP_ONLINE;
> -	else if (sysfs_streq(buf, "offline"))
> -		online_type = MMOP_OFFLINE;
> -	else {
> -		ret = -EINVAL;
> -		goto err;
> -	}
> -
>  	switch (online_type) {
>  	case MMOP_ONLINE_KERNEL:
>  	case MMOP_ONLINE_MOVABLE:
> @@ -271,7 +280,6 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>  		ret = -EINVAL; /* should never happen */
>  	}
>  
> -err:
>  	unlock_device_hotplug();
>  
>  	if (ret < 0)
> -- 
> 2.24.1
> 

