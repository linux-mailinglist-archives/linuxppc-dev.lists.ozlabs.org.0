Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EDE1AF421
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 21:13:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494N0v4f6yzDrNv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 05:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494MtY2y9mzDrQ1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 05:08:18 +1000 (AEST)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MTOZQ-1jpA0n2q6u-00TmEx for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr
 2020 21:08:13 +0200
Received: by mail-qt1-f172.google.com with SMTP id s30so5114091qth.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 12:08:12 -0700 (PDT)
X-Gm-Message-State: AGi0Pua8HRi3UrHWyVKKkWOjpzAaDM3cGbuJ6SOWAYOaddpUJm1XRjRG
 k48SzD0oe55ukNagEpcAxvbhYl+ScrJNX84BtTw=
X-Google-Smtp-Source: APiQypIQyXCRKSNvdaLZyvEmQlPP55qqr3ssdQ7+2edvP8fsUKvIDTOrd3u0yqw+zJY4D62C/KJ2CxmsV4AmsRa3J14=
X-Received: by 2002:ac8:296f:: with SMTP id z44mr8929296qtz.18.1587236891632; 
 Sat, 18 Apr 2020 12:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200418162157.50428-1-wenhu.wang@vivo.com>
 <20200418162157.50428-5-wenhu.wang@vivo.com>
In-Reply-To: <20200418162157.50428-5-wenhu.wang@vivo.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 18 Apr 2020 21:07:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05Rr7q_OtqqtG5hCPO3cettAJQNpmD0ULec+3PS-QPHA@mail.gmail.com>
Message-ID: <CAK8P3a05Rr7q_OtqqtG5hCPO3cettAJQNpmD0ULec+3PS-QPHA@mail.gmail.com>
Subject: Re: [PATCH v6, 4/4] drivers: misc: new driver sram_uapi for user level
 SRAM access
To: Wang Wenhu <wenhu.wang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S4r2mbWxHA0RGtii19eWHrzxivB1BkAToS0wi1kbieHqSVKmfuX
 bl9ABQN7GeM+KINku2D1LQj/CQoGZrNBvX4pOTJbeJen4V1WThJSN9Iz5+x6CeKDj8RRCIw
 H2y4CZs9Ka1gwc6irP6D1tFnm7boeBMeqQk4EArJ+JVX5I/9f5UQv4ar/TVVgpfVGx0saYt
 3+wAmbEchryxmjkPZeR4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0dTJ7hWsjf0=:95v9JpTVsYwLlF31Xz64il
 LvIREDoaoxf5xE2aRThCklMQ6/YwWmEVXnM+XFcxDN6J+XbKBnWbUFtDBM4hrrnm3LKUDcDwT
 KM5l+V2NbqAo+5M56V1q6hg1akiLs39cqlnQcDc/SgcRA9tabivrv5+KZRjM+mi6nBrOoCTR/
 weKsaXDPNd1TNFinvhkR9g3iI8lZNG8tMTFd69DHDN3YqpWbrpv0I5/i0uaeYbWni4q40NJsX
 5E5A9soZcZUojsSa/yAAwAKcyTbF7xtu0nxKQ6Mxv563nfIEjI0/hnl3mBCnS176bj1d/QB+b
 cJzohgFDfnWNgRjsy+bAQDn7POJYhQUhfWYzKR+fNnWLu+nv7Hjlce23RhLeduoiHlLTkdviA
 JBGhU2qL6kS17iOstFiGGUttK8A8Hxv5BstwbkIWmnsdlGpaIGgwM+A+/uyZvTR2BcS9IIcjj
 /S3LUFW7r1tdlZBmpHexbUoqyDszVcWgbHwpLPWuGqIN+1TJfosNiwPx7YZZdB6AQTMfgyyMG
 Gb+fnLrLjOacfhiz9B+YfXy5euOgiIIWhVbwR5D6bqb91CHKVebMsaDBD5FRIsZJBvcIN69eI
 pvhqG+5vSSfJVAFYvoKHttsUC7Inrh/fCgeCWCiR4Suw4N2DuZ0ANosklTZty4CJNLj5B9vV+
 5ZB0FQUQlmtYj++Tm8ATkOX589JjESiQ9G8Xu1uaRQ+BI9/6PjPxOikj+18bBAKiT8oAdUwL+
 I5V173SjlEk7Inbl0HDudwwZw8+OpoPBpr+q/tVCoFMf3MHwfJlXj+OIBwYLIGIdVV5l0FG+a
 0k6jf2CkrxFrE9ifnKTfQ8wQvVlfMKUyGRzQoX0rliHFnt/xvI=
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
Cc: gregkh <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 18, 2020 at 6:22 PM Wang Wenhu <wenhu.wang@vivo.com> wrote:
>
> A generic User-Kernel interface that allows a misc device created
> by it to support file-operations of ioctl and mmap to access SRAM
> memory from user level. Different kinds of SRAM alloction and free
> APIs could be added to the available array and could be configured
> from user level.

Having a generic user level interface seem reasonable, but it would
be helpful to list one or more particular use cases.

> +if SRAM_UAPI
> +
> +config FSL_85XX_SRAM_UAPI
> +       bool "Freescale MPC85xx Cache-SRAM UAPI support"
> +       depends on FSL_SOC_BOOKE && PPC32
> +       select FSL_85XX_CACHE_SRAM
> +       help
> +         This adds the Freescale MPC85xx Cache-SRAM memory allocation and
> +         free interfaces to the available SRAM API array, which finally could
> +         be used from user level to access the Freescale MPC85xx Cache-SRAM
> +         memory.

Why do you need  a hardware specific Kconfig option here, shouldn't
this just use the generic kernel abstraction for the sram?

> +struct sram_api {
> +       u32 type;
> +       long (*sram_alloc)(u32 size, phys_addr_t *phys, u32 align);
> +       void (*sram_free)(void *ptr);
> +};
> +
> +struct sram_uapi {
> +       struct list_head        res_list;
> +       struct sram_api         *sa;
> +};
> +
> +enum SRAM_TYPE {
> +#ifdef FSL_85XX_CACHE_SRAM
> +       SRAM_TYPE_FSL_85XX_CACHE_SRAM,
> +#endif
> +       SRAM_TYPE_MAX,
> +};
> +
> +/* keep the SRAM_TYPE value the same with array index */
> +static struct sram_api srams[] = {
> +#ifdef FSL_85XX_CACHE_SRAM
> +       {
> +               .type           = SRAM_TYPE_FSL_85XX_CACHE_SRAM,
> +               .sram_alloc     = mpc85xx_cache_sram_alloc,
> +               .sram_free      = mpc85xx_cache_sram_free,
> +       },
> +#endif
> +};

If there is a indeed a requirement for hardware specific functions,
I'd say these should be registered from the hardware specific driver
rather than the generic driver having to know about every single
instance.

> +static long sram_uapi_ioctl(struct file *filp, unsigned int cmd,
> +                           unsigned long arg)
> +{
> +       struct sram_uapi *uapi = filp->private_data;
> +       struct sram_resource *res;
> +       struct res_info info;
> +       long ret = -EINVAL;
> +       int size;
> +       u32 type;
> +
> +       if (!uapi)
> +               return ret;
> +
> +       switch (cmd) {
> +       case SRAM_UAPI_IOCTL_SET_SRAM_TYPE:
> +               size = copy_from_user((void *)&type, (const void __user *)arg,
> +                                     sizeof(type));

This could be a simpler get_user().

> +static const struct file_operations sram_uapi_ops = {
> +       .owner = THIS_MODULE,
> +       .open = sram_uapi_open,
> +       .unlocked_ioctl = sram_uapi_ioctl,
> +       .mmap = sram_uapi_mmap,
> +       .release = sram_uapi_release,
> +};

If you have a .unlocked_ioctl callback, there should also be a
.compat_ioctl one. This can normally point to compat_ptr_ioctl().

> +
> +static struct miscdevice sram_uapi_miscdev = {
> +       MISC_DYNAMIC_MINOR,
> +       "sram-uapi",
> +       &sram_uapi_ops,
> +};

The name of the character device should not contain "uapi", that
is kind of implied here.


        Arnd
