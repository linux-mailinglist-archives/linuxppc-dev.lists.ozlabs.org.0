Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D861118C18A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 21:39:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jzK968gkzDrN4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 07:39:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RJtNiJ3k; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jssf6482zDr5J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 03:33:24 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id z12so3080063wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EV0H/xHTVbYqHl2SwE3LQu0p/ZfnWJaxt/btO6HNCKc=;
 b=RJtNiJ3k6sAQDNVAqFF3d2CVXcvwFgvzjPC0w+H5R7gWQps28vhYZy7GgZRM06MHya
 QQToYt3EjmXhucEHTTvjR2hIFJxawkijfrEt8iN8LtDMLt+j6AwONiJSxTULhlCNicK/
 +2o07B+kQGc/5U0zBOnKomsAAPEA1SyHhbaxhsqSEVcs2J5aIsAF/b3hnElTY5l/yVGY
 FW3tBOTVHWiCiVxbKsIH2UfwuUwtau3dd3Z0YMgmaG/L4gaSLfteA3UF0aZQWm1E4kin
 XVSYSvYkEtok8vrKTtSzm+rcUV6j7CmguoLOaJTsGftxMjOZcOw2ChsJlGdiHRtOWKFj
 C8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EV0H/xHTVbYqHl2SwE3LQu0p/ZfnWJaxt/btO6HNCKc=;
 b=evy3aOiiv2IXGaKY3t2QkNA0c7ktP+Ut9qa/IkJ2zwBK7uzkIlx5fWhGn3nflxqpfZ
 X0NlYRKJIgEDdrU+I5S5+t5iIBr++6S5Gj+kU9nEvttdblJxL2+2O4kKBTzlSTqUKC4B
 sd0onFM0f7sDVTGknHXStftmErPGVbVP8023v681Gd+wJDZdlKS6KAJNcYaeXkmW6di7
 iTz+ZmQjeW70T1+Ap6sPdNa3efBcPYGZ0KSSAFwCDvtJPmfzJ0OqqnsJyGxTchsd3vJH
 0mlm8JHHsm5E8bNmk+WRHAC7vFMM+6dNgMLIxf04PWu6YPpTiLP9GeiIixK/4CA/Y4Ka
 Tapw==
X-Gm-Message-State: ANhLgQ1OJ6z8teGWOl9aAPlyYGm7QvVA6PpM9TZel+wZPxIDD3+c83Ok
 vC1nRWe5aTGB2UHnOdYGpkY7aUtEDLF5YCxuZ9o=
X-Google-Smtp-Source: ADFU+vumPc/wa4n9qWnBfWoVelrKk4kAGib5WSrNdiwqlrFqLF1BlylJKsfGJ5rFJXKaGKbYD3+R/QLpQgtoSmTw7E4=
X-Received: by 2002:a1c:1fc7:: with SMTP id f190mr4567359wmf.2.1584635599696; 
 Thu, 19 Mar 2020 09:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200319131221.14044-1-david@redhat.com>
 <20200319131221.14044-4-david@redhat.com>
In-Reply-To: <20200319131221.14044-4-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Mar 2020 17:33:08 +0100
Message-ID: <CAM9Jb+i-idWyxCX1vPow3VPGBbqTQEAbzLio0vn1QLHrpGJSSg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drivers/base/memory: store mapping between MMOP_*
 and string in an array
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Mar 2020 07:34:17 +1100
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
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
>  #define MEMORY_CLASS_NAME      "memory"
>
> +static const char *const online_type_to_str[] = {
> +       [MMOP_OFFLINE] = "offline",
> +       [MMOP_ONLINE] = "online",
> +       [MMOP_ONLINE_KERNEL] = "online_kernel",
> +       [MMOP_ONLINE_MOVABLE] = "online_movable",
> +};
> +
> +static int memhp_online_type_from_str(const char *str)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(online_type_to_str); i++) {
> +               if (sysfs_streq(str, online_type_to_str[i]))
> +                       return i;
> +       }
> +       return -EINVAL;
> +}
> +
>  #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
>
>  static int sections_per_block;
> @@ -236,26 +254,17 @@ static int memory_subsys_offline(struct device *dev)
>  static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>                            const char *buf, size_t count)
>  {
> +       const int online_type = memhp_online_type_from_str(buf);
>         struct memory_block *mem = to_memory_block(dev);
> -       int ret, online_type;
> +       int ret;
> +
> +       if (online_type < 0)
> +               return -EINVAL;
>
>         ret = lock_device_hotplug_sysfs();
>         if (ret)
>                 return ret;
>
> -       if (sysfs_streq(buf, "online_kernel"))
> -               online_type = MMOP_ONLINE_KERNEL;
> -       else if (sysfs_streq(buf, "online_movable"))
> -               online_type = MMOP_ONLINE_MOVABLE;
> -       else if (sysfs_streq(buf, "online"))
> -               online_type = MMOP_ONLINE;
> -       else if (sysfs_streq(buf, "offline"))
> -               online_type = MMOP_OFFLINE;
> -       else {
> -               ret = -EINVAL;
> -               goto err;
> -       }
> -
>         switch (online_type) {
>         case MMOP_ONLINE_KERNEL:
>         case MMOP_ONLINE_MOVABLE:
> @@ -271,7 +280,6 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>                 ret = -EINVAL; /* should never happen */
>         }
>
> -err:
>         unlock_device_hotplug();
>
>         if (ret < 0)
> --

Nice cleanup patch.
Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

> 2.24.1
>
>
