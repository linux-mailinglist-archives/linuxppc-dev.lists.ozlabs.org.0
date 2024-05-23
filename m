Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B2C478CCAE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 05:01:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VgAcZW/U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlCQ65bh4z78k7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 12:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VgAcZW/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlCPM3C43z3fvS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 12:51:49 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2bd9284dd31so1547342a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 19:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716432698; x=1717037498; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2t+NNcAooBs+1uLVQmd6CHKgztQaFCVL8iN2oZTgqXk=;
        b=VgAcZW/UXwz+ZNkjKjrlZGs84v1BI8loOOu4HVvFxqXsGP5HAf5ADLYuSvFEF6PwJ2
         bJKuR+4T20JNARu8rF5ht1TqweGLBRPQGN5IF58kENYE67CIhbaF0aQ16xL42hTgAnOZ
         CmPBQqOQpoSW/huYlOwD6WUEdXrjtR/Mr7tJPs5xFccq0ex6+0pIHnJGs8K6kAK0JwoG
         ExuI5znnvJQNQgXvQXvUtBk2dgM+dAK0cBibXeIQ0C2iOZNh1Dw3F8k/XpdIbLzsRQmJ
         rB8P42jBp8vbWpp8Jh/I6eYlo5xb7LOuaHukeeo5TFFXXmKJx5P62fsn4wwMksAQF5ew
         gXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716432698; x=1717037498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2t+NNcAooBs+1uLVQmd6CHKgztQaFCVL8iN2oZTgqXk=;
        b=eKtMQiqPIdHTMxo6zRHkMW1fNanhn8zxtLPE/Q7+DZN469DmiQi/2EVS7EQtPqNWyg
         buNkc2Kw6OrkSvdhy9aValK5HNTD550VeHf4udoEXEVEsOCZCf4sGVpdoT7mAI6zX90v
         vNxY9DdbVUInP3lSTaWS/zBt/lMHYIRi0VgC669DEYP9agM8QUbR7mWhzmbSpeWVsZhM
         5M9OjI+PuyyGQ24i8KNa0LCUQqbIIiyy8vy2G8oSaEnxhhVRvTtk8Sx/HdQLOxmwMqe9
         OMoXA+CZAzcsYrFG2O1cbniAgrC3p4snt64y4JypzShHaU0EemeH9BmziadJU3azwTTa
         RBrg==
X-Forwarded-Encrypted: i=1; AJvYcCWbf21hjik1ZH+kC98JXt4CwE4AnMCJ5Dum6Dh1Rz8IyhjK8fUUJs3LSJfUnvsJqwl7ODYjRySm4Ah9l9sp8ZPQgsndlKQ/541SYOpuUA==
X-Gm-Message-State: AOJu0Yxm/9o8J94l9QMnYUXE/SF74/sN8Mn4JoGm1B61coJ8VoioM+ey
	xvuCnSxmAu62rH1ad0vx3lRGT2nLfu/IsOb2rfAdYBzNJfY5Ai0G
X-Google-Smtp-Source: AGHT+IFkp6UpIh1AGPSwzeu7PRXoylLdjeBnYEOtYMQKu1m9NKdsV0nftrMR0T4y+aBKEkMG7hxvGw==
X-Received: by 2002:a17:90a:a506:b0:2ad:6294:7112 with SMTP id 98e67ed59e1d1-2bd9f456c77mr4103774a91.14.1716432698305;
        Wed, 22 May 2024 19:51:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9f0b3d3sm575494a91.26.2024.05.22.19.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 19:51:37 -0700 (PDT)
Date: Wed, 22 May 2024 19:51:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/2] treewide: Use sysfs_bin_attr_simple_read() helper
Message-ID: <e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net>
References: <cover.1712410202.git.lukas@wunner.de>
 <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ee0a0e83a5a3f3474845db6c8575297698933a.1712410202.git.lukas@wunner.de>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Jean Delvare <jdelvare@suse.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sat, Apr 06, 2024 at 03:52:02PM +0200, Lukas Wunner wrote:
> Deduplicate ->read() callbacks of bin_attributes which are backed by a
> simple buffer in memory:
> 
> Use the newly introduced sysfs_bin_attr_simple_read() helper instead,
> either by referencing it directly or by declaring such bin_attributes
> with BIN_ATTR_SIMPLE_RO() or BIN_ATTR_SIMPLE_ADMIN_RO().
> 
> Aside from a reduction of LoC, this shaves off a few bytes from vmlinux
> (304 bytes on an x86_64 allyesconfig).
> 
> No functional change intended.
> 

Not really; see below.

> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> ---
...
> index da79760..5193fae 100644
> --- a/init/initramfs.c
> +++ b/init/initramfs.c
> @@ -575,15 +575,7 @@ static int __init initramfs_async_setup(char *str)
>  #include <linux/initrd.h>
>  #include <linux/kexec.h>
>  
> -static ssize_t raw_read(struct file *file, struct kobject *kobj,
> -			struct bin_attribute *attr, char *buf,
> -			loff_t pos, size_t count)
> -{
> -	memcpy(buf, attr->private + pos, count);
> -	return count;
> -}
> -
> -static BIN_ATTR(initrd, 0440, raw_read, NULL, 0);
> +static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
>  

sysfs_bin_attr_simple_read is only declared and available if CONFIG_SYSFS=y.
With m68k:m5208evb_defconfig + CONFIG_BLK_DEV_INITRD=y, this results in

/opt/buildbot/slave/qemu-m68k/build/init/initramfs.c:578:31:
	error: 'sysfs_bin_attr_simple_read' undeclared here (not in a function)

This happens because CONFIG_SYSFS=n and there is no dummy function for
sysfs_bin_attr_simple_read(). Presumably the problem will be seen for all
configurations with CONFIG_BLK_DEV_INITRD=y and CONFIG_SYSFS=n.

On a side note, init/initramfs.c does not directly include linux/sysfs.h.
I don't know if that might cause problems with other builds.

Guenter
