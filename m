Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A8186F89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 17:03:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1Kt03pSzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 03:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.65; helo=mail-wr1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h0PM3ljMzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 02:20:55 +1100 (AEDT)
Received: by mail-wr1-f65.google.com with SMTP id s1so2374wrv.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 08:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PHFwU/9Gwprc+RyvAszebJ6mggkLL/7mXQpDoqU9oeU=;
 b=glswJs2tznD7pJ8iiXGwDg736ExYYLrHdaJ40wWRuQbWa3xE9qB2HAi7lr1ehmlBUm
 hshR0aSCMXXdA7BehZPqKlnVMRp73Ti9Z+gaGmoFWueeInyt5gyBUAeVI3kbOs1GIXLT
 xDb/7IlnafU3PUK8FjAAxhN3nefwBrzyZ5KglCEMAIjQ/wdTeRHA5q1A9Dx7DHY6F7aS
 aYKS7a1SG/yGvr7HCT6WZR11LKYaosAGK955IxAK/l8UflLFFQ8a8PJaMajECVF1fAP9
 CX3RIFvtt44cWeADDSOLrFJPxAljfL0BREbYW6jfKAwRSxJX9mkOFpI7tSNjoH77B36p
 HiOA==
X-Gm-Message-State: ANhLgQ226Z7PIJsmp33DP1IWTY5TmSqBOsiJjv33yove7lNrPzE6KYpu
 RNdnf6yTWsDMa9iPbJaeDEA=
X-Google-Smtp-Source: ADFU+vuaSBhAghb7CaWtuVCz1nkuUiUyxqyZeuHdtukKOxs3qogmtqhAePyHD4CPFq9QAfjmqizbvA==
X-Received: by 2002:adf:db49:: with SMTP id f9mr15327113wrj.145.1584372051365; 
 Mon, 16 Mar 2020 08:20:51 -0700 (PDT)
Received: from localhost ([37.188.132.163])
 by smtp.gmail.com with ESMTPSA id b187sm18218wmb.42.2020.03.16.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:20:50 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:20:47 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/5] drivers/base/memory: store mapping between MMOP_*
 and string in an array
Message-ID: <20200316152047.GU11482@dhcp22.suse.cz>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-4-david@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 11-03-20 13:30:24, David Hildenbrand wrote:
> Let's use a simple array which we can reuse soon. While at it, move the
> string->mmop conversion out of the device hotplug lock.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

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

-- 
Michal Hocko
SUSE Labs
