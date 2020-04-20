Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A21B0EAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 16:39:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495TqB5cNjzDqsR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:39:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495TkZ288FzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 00:35:16 +1000 (AEST)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N8GEY-1jDDlH1rTU-014FOt for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr
 2020 16:35:11 +0200
Received: by mail-qt1-f169.google.com with SMTP id w24so8550628qts.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 07:35:10 -0700 (PDT)
X-Gm-Message-State: AGi0PuaysmT0acvOW6ysswbHEaNu9sHro+4APBZozI2rd5rIkTNHDNAX
 ptz5zwbiDBYCxw2nfpvm0vbLhwyG50j0QPIQGYg=
X-Google-Smtp-Source: APiQypJ8+eSyM92GKz+tgktc3MN8Tu0mYjJI8QaeKzhQGr6nLHXQdvHnLZbXBCSy5i2jRKmsTpsr3bDsRZBUFnm0wII=
X-Received: by 2002:ac8:6757:: with SMTP id n23mr16212594qtp.304.1587393309871; 
 Mon, 20 Apr 2020 07:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200420030538.101696-1-wenhu.wang@vivo.com>
In-Reply-To: <20200420030538.101696-1-wenhu.wang@vivo.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Apr 2020 16:34:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1ErZh6teKEC8srU5E1WmXxtTgQppt1yDoYmO7huw4gqA@mail.gmail.com>
Message-ID: <CAK8P3a1ErZh6teKEC8srU5E1WmXxtTgQppt1yDoYmO7huw4gqA@mail.gmail.com>
Subject: Re: [PATCH v2,
 RESEND] misc: new driver sram_uapi for user level SRAM access
To: Wang Wenhu <wenhu.wang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:W43FMOZC8GNxc8XRjIqPK/y7reIccZgcirU90SxBIBTKvVFY6ko
 r7Qgc8GCi9tcloIKqmgG1Ga3+h39q92gUQIwwclBEFs9UsHXeJMbU/v6RDp2qMotjtyGC4i
 HLWvXvmJKD7PgBs0QDC/GAQAoHYItAy0SUQrH3FThb1YlqAmLr5VulRwxsmHRwFff8LsScn
 WWwOyXQuawoOPy0fCnWdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lMlmaC4iy6c=:rzN2AeJB5fUFaE6l9rI9B6
 mxX8pFHPtrzSDc+S06YMqyjlsd4xz+aIcTlxTg1O4hqP6wWJhTWfeJ3ANcentleyZIOxYIgTS
 aBPmw7IxHRDG3bQ2QKqx+14vJRhFDnQ0fFMKTGvOdhYiWSCzNTo4JzuTh9v3hVnYL9qgIt0pr
 3dtAlpegf2mKNGPwuJNUIC/ra7iEcNXxfiAj/yX8ncUXWVUmb30XVumGgRuJ1qfqMkBhtEc2K
 /OSgQOhACzMaLaYW4CW/OBii2ITOL/+qwPrYQOBWM8LWhaB9DXY25cQyUGD/bZzP3ItwtbUFS
 nKoB+gN7ciQRQGMTRuVomVX+KZt+1uc9E1g7x0KVjkmV46G2TEMfB4Dv7ww2FmKY70/j3Lj28
 E40einPLkc7IZAyDB9AYQE5issQXG3ddsyoPZCKzYPlvOzBPofNT6BQZqDY+zPJcvM28hQpCQ
 3qORS5oSG5se+io5vTfWFdC7EJo81fWVqE+Kib5gzRTiTrJajs+bCu3nbDCc3+zFID4oNo+lz
 RPOFOkFw8S01OjwD6A8+LhJZAjAePyk1trh41xjnUFBx5WivjGJbnhad0LAKaXdqzNQW0r0lK
 2dICkCRnqrkcYghpG8byWaY+bgDuMt39EABGV6Yrv54SmpBdLEupDDelq1cQaYyoi0pVTP77y
 qo5evJ/jCEZFlQBgC/8NgV3ix/ZmgTmfg4HvrSiJ6bSEOM/1pN4pXoWDmp4UqOXbRbpog84Sa
 5XL74LpX8h5SXmeRgJ13yX47/c4VIMmdv1nAoS8cb9+ZIC5HJ8ViuE/V+zWgsrLo6MWg68sBM
 TyUse0L0Ky5OnJJhL0Tl8HvboPxXf8wx8VQ4JsCXz/uyScv5Is=
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
Cc: Rob Herring <robh@kernel.org>, gregkh <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 5:06 AM Wang Wenhu <wenhu.wang@vivo.com> wrote:
>
> A generic User-Kernel interface that allows a misc device created
> by it to support file-operations of ioctl and mmap to access SRAM
> memory from user level. Different kinds of SRAM alloction and free
> APIs could be registered by specific SRAM hardware level driver to
> the available list and then be chosen by users to allocate and map
> SRAM memory from user level.
>
> It is extremely helpful for the user space applications that require
> high performance memory accesses, such as embedded networking devices
> that would process data in user space, and PowerPC e500 is a case.
>
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> Changes since v1: addressed comments from Arnd
>  * Changed the ioctl cmd definitions using _IO micros
>  * Export interfaces for HW-SRAM drivers to register apis to available list
>  * Modified allocation alignment to PAGE_SIZE
>  * Use phys_addr_t as type of SRAM resource size and offset
>  * Support compat_ioctl
>  * Misc device name:sram

Looks much better already.

> Note: From this on, the SRAM_UAPI driver is independent to any hardware
> drivers, so I would only commit the patch itself as v2, while the v1 of
> it was wrapped together with patches for Freescale L2-Cache-SRAM device.
> Then after, I'd create patches for Freescale L2-Cache-SRAM device as
> another series.

What I meant to suggest was actually to tie it more closely to
the code we already have in drivers/misc/sram.c, which already
has some form of abstraction.

> +static int __init sram_uapi_init(void)
> +{
> +       int ret;
> +
> +       INIT_LIST_HEAD(&sram_api_list);
> +       mutex_init(&sram_api_list_lock);
> +
> +       ret = misc_register(&sram_uapi_miscdev);
> +       if (ret)
> +               pr_err("failed to register sram uapi misc device\n");

The mutex and listhead are already initialized, so this can
be a one-line function

    return misc_register(&sram_uapi_miscdev);

> --- /dev/null
> +++ b/include/linux/sram_uapi.h

The ioctl definitions need to be in include/uapi/linux/

> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SRAM_UAPI_H
> +#define __SRAM_UAPI_H
> +
> +/* Set SRAM type to be accessed */
> +#define SRAM_UAPI_IOC_SET_SRAM_TYPE    _IOW('S', 0, __u32)
> +
> +/* Allocate resource from SRAM */
> +#define SRAM_UAPI_IOC_ALLOC            _IOWR('S', 1, struct res_info)
> +
> +/* Free allocated resource of SRAM */
> +#define SRAM_UAPI_IOC_FREE             _IOW('S', 2, struct res_info)

struct res_info needs to also be defined here, so user applications can
see the definition, and it has to use __u64, not phys_addr_t, to ensure
the API does not depend on kernel configuraiton.

        Arnd
