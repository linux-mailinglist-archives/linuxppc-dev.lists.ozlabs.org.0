Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B80358CD5D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 16:31:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CrMD0M73;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlVmD3shkz78x7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 00:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CrMD0M73;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlVlT4hDmz3wQJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 00:23:32 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f44d2b3130so3432753b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716474206; x=1717079006; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/lNADwPwr25pysfe9uC4MhtrxN5wTcZxfw/uoqzjrk=;
        b=CrMD0M73VvoPAFzqXRpigKKQ0lUo4YeLH7+QmshIEnRzIAyyrBaP9fjJPYdZr4x+Nd
         2zcx0vE9DBHzjoqkrH1MLoYty7u3HO2NI1ybroKs5SUeGcZgCyrFWJkXfYDiCrHUv+kp
         nx5SQelRVlkyxe+icWSexV4EzdW9AWkgT9sO+lePW+Sfk+dN3uCIJdq4mAAhQeMZLTIJ
         mqKDsGmrttTQNSJxYn/6wiProZU3Uxq/vMwFUzFCGV3nFWLtCk5KlG3WQ1FpR5uEOuxQ
         E397xm9mkG2PyZhCOYosaQ+9VCVZh4SfTPvx2FKBM17jiZ5sz/jVqb3cOZHkV1+d3Ka+
         xeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474206; x=1717079006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/lNADwPwr25pysfe9uC4MhtrxN5wTcZxfw/uoqzjrk=;
        b=hxW2rk31BuaHzoEVhOAjqyeWs77oVOc2sEoRjTwQ3BmRLxcITGdlqZciDqFo9NLsFj
         kwoxZFFc7CJ++pZtSOl/7Gh/0gByBXiJKVPY/HV3GRKoYRjGfNVIkBVjjFUt8nlAzwlZ
         msI/UXqyBwnOnmlIC/e8wGkm9H8EstUHMS7Jn/oQ8/7sS13A0Yrg20IIVw/PCXPRUHO4
         tCYWmRk7blxkeMNWN2j6j9foM5h3tBqkEpg/yMa7nxSDTuv4hWdXWxlNkOuKwHn3VssQ
         nIuCEcblOCywS8Zr8QY8LJzWkZqtTRlpBgOQrTQ4PRG3F073gO7gIyVSTgzNsdGLY6mg
         zqGA==
X-Forwarded-Encrypted: i=1; AJvYcCW76u1m/f4UgY+HhFdRDku31DIWI81YBTBcGK5XqQkO8GGL9mUrRaeOiuctgjSkucZyjCX2fNqqi2bHUlTN3IfNHHl/7VSb/L/YLjRcZg==
X-Gm-Message-State: AOJu0YyQGBrrnlm5WymNjwaJEJ/rIDbw4KdTfPYOFPgFvHUeS43KEDnc
	NwZkiAhVviBzkD5hmhdpi4J0iPUO/X1fZ5z+tnTddKgykT0cwzYm
X-Google-Smtp-Source: AGHT+IEWmE003niz8KfDtTyBhJFuwL9l4X+RCaG61wMtnhF90Faa7QASay0WGaxzbP5zU+5qgt+XNg==
X-Received: by 2002:a05:6a21:999b:b0:1b0:31c8:edfb with SMTP id adf61e73a8af0-1b1f8a8669dmr5803662637.60.1716474205714;
        Thu, 23 May 2024 07:23:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a665c0sm24088995b3a.3.2024.05.23.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:23:24 -0700 (PDT)
Date: Thu, 23 May 2024 07:23:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] sysfs: Unbreak the build around
 sysfs_bin_attr_simple_read()
Message-ID: <a396a2ce-656b-4525-acee-ed7c3742b2da@roeck-us.net>
References: <2024052334-nape-wanting-0a2a@gregkh>
 <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05f4290439a58730738a15b0c99cd8576c4aa0d9.1716461752.git.lukas@wunner.de>
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

On Thu, May 23, 2024 at 01:00:00PM +0200, Lukas Wunner wrote:
> Günter reports build breakage for m68k "m5208evb_defconfig" plus
> CONFIG_BLK_DEV_INITRD=y caused by commit 66bc1a173328 ("treewide:
> Use sysfs_bin_attr_simple_read() helper").
> 
> The defconfig disables CONFIG_SYSFS, so sysfs_bin_attr_simple_read()
> is not compiled into the kernel.  But init/initramfs.c references
> that function in the initializer of a struct bin_attribute.
> 
> Add an empty static inline to avoid the build breakage.
> 
> Fixes: 66bc1a173328 ("treewide: Use sysfs_bin_attr_simple_read() helper")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/r/e12b0027-b199-4de7-b83d-668171447ccc@roeck-us.net
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/linux/sysfs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index a7d725fbf739..c4e64dc11206 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -750,6 +750,15 @@ static inline int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
>  {
>  	return 0;
>  }
> +
> +static inline ssize_t sysfs_bin_attr_simple_read(struct file *file,
> +						 struct kobject *kobj,
> +						 struct bin_attribute *attr,
> +						 char *buf, loff_t off,
> +						 size_t count)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_SYSFS */
>  
>  static inline int __must_check sysfs_create_file(struct kobject *kobj,
> -- 
> 2.43.0
> 
