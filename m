Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0036544703
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 18:56:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Pqdh01BBzDrLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 02:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=ego.lkml@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCrD/VlF"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PqYY0YQtzDrJf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 02:53:01 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id k8so18483287iot.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=hR0Z89ObZTJEiQmmcpyW15UpSZ5qBuJglP5jTjxmzJc=;
 b=RCrD/VlF/abpNohw1MDJvw9Gu7/+lnrTAV8fY1Gi3h0PbObxFaDeLezlLkAFRo0X1b
 vBMP0m8UiSHfxWn/E599YqEtFJAoE97/zMcEQB9UfMJenH3572mp1sVFuICpn+pTq9ii
 E4NXDwSIzRjpkGZhFs+nAvbwTHDtzGQtiyQbpjfQj6bIcqyufdcp99lriX/y5x2Eazc4
 o4EeuFyyzNOfR0cDn3TSyItd1TrWVUYA0uhHMNtX+iThZvf1cfPVw0G5uXGxn69T26e7
 Ghq7RrNB6z4OyS0w+9uFHD+Dh8AcYzoVQiBqymAV167vSO4igWc75XFxNOxC9T7PocW6
 /IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=hR0Z89ObZTJEiQmmcpyW15UpSZ5qBuJglP5jTjxmzJc=;
 b=jNRA0HTYF1Y4uJyVnEnyWb1NCBmWELYocAetlW91pnnC/DSBmNz0eFb9KWHadAFqtT
 cMACsl26v2vmSJnKCbVVjyVmbOTdte1jCQnbUXqKE4rafgiPGMgpgIxSbWcMzHuh0nHA
 OFVhs+z2OxrRsfsfpciKxlwgrRd62vyqYOW+a6y9wacvrTQFrqSC81X9XlShD36bS4GI
 9Dwns0oukbuU/KK6LwB3P9Q5Oj/pF57I2RmJ8PJZ98lhFxeYEBwLXvt7A6i6N8QRHGcc
 ezmCNHUstbkBkTlcaMSalJcUMHDzJvtVVT7H+ly1EHTTsS8OoqWYBtiQm5mQMMvBLTK5
 CMhQ==
X-Gm-Message-State: APjAAAWHx3Z3EH91IGqq6K+aqmD6OvHccUEpaVqXR7+qE6vbG3v9rVMN
 QaDeFtImGSISOShuCtZk868iSWz3MaZ+1/ryLrM=
X-Google-Smtp-Source: APXvYqy/fw3p8MVAHAAmnQIlmD0OgApsV5lwPeXsXWgqD4TlPG8dT9tj02Y81t3NB4FFtLFCtqGmf/F7cN65FdamzS4=
X-Received: by 2002:a6b:e315:: with SMTP id u21mr52359809ioc.14.1560444777706; 
 Thu, 13 Jun 2019 09:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190612044506.16392-1-nathanl@linux.ibm.com>
 <20190612044506.16392-3-nathanl@linux.ibm.com>
In-Reply-To: <20190612044506.16392-3-nathanl@linux.ibm.com>
From: Gautham R Shenoy <ego.lkml@gmail.com>
Date: Thu, 13 Jun 2019 22:22:46 +0530
Message-ID: <CAHZ_5Wz+7=R+NcBic2BwVppBRgps8=+BP2CK2JOg8Omto3Nydw@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc/pseries/mobility: prevent cpu hotplug during
 DT update
To: Nathan Lynch <nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: ego@linux.vnet.ibm.com
Cc: ego@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nathan,

On Wed, Jun 12, 2019 at 10:19 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> CPU online/offline code paths are sensitive to parts of the device
> tree (various cpu node properties, cache nodes) that can be changed as
> a result of a migration.
>
> Prevent CPU hotplug while the device tree potentially is inconsistent.
>
> Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Audited the callbacks of of_reconfig_notify(). We are fine with
respect to CPU-Hotplug locking.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/platforms/pseries/mobility.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index 88925f8ca8a0..edc1ec408589 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -9,6 +9,7 @@
>   * 2 as published by the Free Software Foundation.
>   */
>
> +#include <linux/cpu.h>
>  #include <linux/kernel.h>
>  #include <linux/kobject.h>
>  #include <linux/smp.h>
> @@ -338,11 +339,19 @@ void post_mobility_fixup(void)
>         if (rc)
>                 printk(KERN_ERR "Post-mobility activate-fw failed: %d\n", rc);
>
> +       /*
> +        * We don't want CPUs to go online/offline while the device
> +        * tree is being updated.
> +        */
> +       cpus_read_lock();
> +
>         rc = pseries_devicetree_update(MIGRATION_SCOPE);
>         if (rc)
>                 printk(KERN_ERR "Post-mobility device tree update "
>                         "failed: %d\n", rc);
>
> +       cpus_read_unlock();
> +
>         /* Possibly switch to a new RFI flush type */
>         pseries_setup_rfi_flush();
>
> --
> 2.20.1
>


-- 
Thanks and Regards
gautham.
