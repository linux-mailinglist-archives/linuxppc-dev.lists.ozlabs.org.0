Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D36FB8F640
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:07:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468fCz0p6xzDr1X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:07:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="G0oO16fe"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468fB4524rzDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 07:05:42 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id a127so3298004oii.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9e+9SyZx5VjvjikBKAovwQqTND+yZ6kEHPzcscfEXE=;
 b=G0oO16fejfjWYZTvMwMXu1Cj0dJB+vzMWdZX60FZuJxsaZtB9Hh2GRTIiEvu7n/HUc
 ODziU0shukzdJhRQxjSrmbdCsOuHOl6K84hNu0OOL/dEnub2FwxcYiy+zMlUBsB1vTyI
 qRcNMwYCHL80rxe1hcCYXYOzRhr3CIQNIJf5B+XtQAwNls5Rg/NefPlxKNDE26KQUg2v
 Vy6/6grsDxl49OibXehH9M8ZdoyCw3IayUs+TEVJyVvDMb7xK0bdngQiLCcmtynC4BHR
 KS8s52/uidaXSeePXWMwQaydJttfelgy7WxMAQYx74mx6U2TyesDJIYykpZlhEB875ve
 cFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9e+9SyZx5VjvjikBKAovwQqTND+yZ6kEHPzcscfEXE=;
 b=q264wmA0/lJfj2veV86od4kgfcvqDey9Qv3/Aic+DdbQM8ATfcsq/lkprUeHgCURBp
 +ZXoYXSLDBY8NYQH5/oSBU3KkCnHRM0SPrm+uyuxeaJXukOX6oe+wDnsjFh5DzY4c96N
 B23aBmug1E87cfn+kwdcs0ST3+vkIBf0/i7xrotMbB4bLxnfkK7YJfGUElazdkN6EMwF
 9ZkclRtpcqGa8CoqpV7uJ/6P3ZxXvC4luof0PzrgrFSWV0B7JMAXoTvhUgurBoiAPJox
 QPGd1QbvKRFYlQ2t2AsCjizE79eOSphcNEHbpcBFKMjVMhIf12bKyOxII4Dt6unFxnXS
 PIOQ==
X-Gm-Message-State: APjAAAUvob8QEZVGNMa9chaTGNt3iRltZIbnyyh05HiX/okorgC5N7bC
 h463aCn8rvLC2CCB1z/yvjiHquJ8mkRTlzJKNQMORA==
X-Google-Smtp-Source: APXvYqxYSbulXo1jOKOyMJ30tBrdjOaomDGOnrp8V3xfCU7oj/pEvcII1W7WTWGA2OrnhNw6y+FgIV2qLf0CSUXVVGg=
X-Received: by 2002:a05:6808:914:: with SMTP id
 w20mr2648263oih.73.1565903140485; 
 Thu, 15 Aug 2019 14:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190809074520.27115-1-aneesh.kumar@linux.ibm.com>
 <20190809074520.27115-4-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190809074520.27115-4-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 15 Aug 2019 14:05:29 -0700
Message-ID: <CAPcyv4hc_-oGMp6jGVknnYs+rmj4W1A_gFCbmAX2LFw0hsfL5g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] mm/nvdimm: Use correct #defines instead of open
 coding
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 12:45 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Use PAGE_SIZE instead of SZ_4K and sizeof(struct page) instead of 64.
> If we have a kernel built with different struct page size the previous
> patch should handle marking the namespace disabled.

Each of these changes carry independent non-overlapping regression
risk, so lets split them into separate patches. Others might

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  drivers/nvdimm/label.c          | 2 +-
>  drivers/nvdimm/namespace_devs.c | 6 +++---
>  drivers/nvdimm/pfn_devs.c       | 3 ++-
>  drivers/nvdimm/region_devs.c    | 8 ++++----
>  4 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/nvdimm/label.c b/drivers/nvdimm/label.c
> index 73e197babc2f..7ee037063be7 100644
> --- a/drivers/nvdimm/label.c
> +++ b/drivers/nvdimm/label.c
> @@ -355,7 +355,7 @@ static bool slot_valid(struct nvdimm_drvdata *ndd,
>
>         /* check that DPA allocations are page aligned */
>         if ((__le64_to_cpu(nd_label->dpa)
> -                               | __le64_to_cpu(nd_label->rawsize)) % SZ_4K)
> +                               | __le64_to_cpu(nd_label->rawsize)) % PAGE_SIZE)

The UEFI label specification has no concept of PAGE_SIZE, so this
check is a pure Linux-ism. There's no strict requirement why
slot_valid() needs to check for page alignment and it would seem to
actively hurt cross-page-size compatibility, so let's delete the check
and rely on checksum validation.

>                 return false;
>
>         /* check checksum */
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index a16e52251a30..a9c76df12cb9 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -1006,10 +1006,10 @@ static ssize_t __size_store(struct device *dev, unsigned long long val)
>                 return -ENXIO;
>         }
>
> -       div_u64_rem(val, SZ_4K * nd_region->ndr_mappings, &remainder);
> +       div_u64_rem(val, PAGE_SIZE * nd_region->ndr_mappings, &remainder);
>         if (remainder) {
> -               dev_dbg(dev, "%llu is not %dK aligned\n", val,
> -                               (SZ_4K * nd_region->ndr_mappings) / SZ_1K);
> +               dev_dbg(dev, "%llu is not %ldK aligned\n", val,
> +                               (PAGE_SIZE * nd_region->ndr_mappings) / SZ_1K);
>                 return -EINVAL;

Yes, looks good, but this deserves its own independent patch.

>         }
>
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 37e96811c2fc..c1d9be609322 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -725,7 +725,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>                  * when populating the vmemmap. This *should* be equal to
>                  * PMD_SIZE for most architectures.
>                  */
> -               offset = ALIGN(start + SZ_8K + 64 * npfns, align) - start;
> +               offset = ALIGN(start + SZ_8K + sizeof(struct page) * npfns,

I'd prefer if this was not dynamic and was instead set to the maximum
size of 'struct page' across all archs just to enhance cross-arch
compatibility. I think that answer is '64'.
> +                              align) - start;
>         } else if (nd_pfn->mode == PFN_MODE_RAM)
>                 offset = ALIGN(start + SZ_8K, align) - start;
>         else
> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
> index af30cbe7a8ea..20e265a534f8 100644
> --- a/drivers/nvdimm/region_devs.c
> +++ b/drivers/nvdimm/region_devs.c
> @@ -992,10 +992,10 @@ static struct nd_region *nd_region_create(struct nvdimm_bus *nvdimm_bus,
>                 struct nd_mapping_desc *mapping = &ndr_desc->mapping[i];
>                 struct nvdimm *nvdimm = mapping->nvdimm;
>
> -               if ((mapping->start | mapping->size) % SZ_4K) {
> -                       dev_err(&nvdimm_bus->dev, "%s: %s mapping%d is not 4K aligned\n",
> -                                       caller, dev_name(&nvdimm->dev), i);
> -
> +               if ((mapping->start | mapping->size) % PAGE_SIZE) {
> +                       dev_err(&nvdimm_bus->dev,
> +                               "%s: %s mapping%d is not %ld aligned\n",
> +                               caller, dev_name(&nvdimm->dev), i, PAGE_SIZE);
>                         return NULL;
>                 }
>
> --
> 2.21.0
>
