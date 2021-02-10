Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02D315EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:21:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db7Qd0tJ4zDsfM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:21:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=pankaj.gupta.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rKd/EBgj; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db7MX21sNzDskX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:18:27 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id e133so643123iof.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 21:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QyQ76yM+DRGQIWWpBtZtC+km5KE0GD76W/nCu9/S+0=;
 b=rKd/EBgjCCDOJ6y0MmK+J+IIhH+emTDln0WBMqk5Ga+nP9hQuEJXy30zORZMmvO6CC
 slRGUxFBDg6G3ijaR+YblWEtMn4zINr0uRsTQrLjZ6zD+XFog4ktVfaozxrVRgPjzZ6A
 6EscNGkb+hZt9b8pB6T5eowKbVqVThgCTR3Is0XV1Hq/KfIc+AtYbbHszi+5PIHuhzle
 R/ka2jLiwTfrrnldXoi2GGYZn4MKf/C5p0PioeOJl+P6EAekwSWZcXI5xMnrKB4pN4vd
 CDKeSz+4/kLoQfDLJzwtPt2XvaHWJ2uz5eVHzNxE93pPxNYRiRjLBHHjEu2ZiLw3RaIE
 er7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QyQ76yM+DRGQIWWpBtZtC+km5KE0GD76W/nCu9/S+0=;
 b=OvV6uqgbQJmsNss7YGccArr7lwAtBAFsVyXnc+Ze+sOLKyHtgaYwtYEZrFhrI2dvTq
 0hGFuCavCMgxwe9TXlPcW85eI4PtoiUBzuQLJqq1tgrdzwUnrTW0+FIBfhwkBb19cu7b
 Xc4M/S9E4ngkuBYZcep6hrxJKQdilcoZpXYPI7Msi1hNGzSp5SLzt7VqLfG7IAeKNwXt
 RnIoHCmIcMShz3iMC4Sq+B8I2MSf3v+cr6QhOixh9TybdtRBfTrOh7X6qOvDUJVYnj/G
 8yilyOVIM3vIo8OjznXNMsTxU7sECBA8gbkkhM+AZDNdF9pFwgosQtbYNyc08UqetC0A
 2TQQ==
X-Gm-Message-State: AOAM532dAgvZ1aSCdJahsrK5sh8ccqk9OoB/a+yXd+7x5pkxEk8tKi9A
 lpxv+h1qpJEFREDwdjygfbgw3O4RE1aJWtiphc8=
X-Google-Smtp-Source: ABdhPJx0u/s2yMDJCXGg5GpW8Icb6Q+HLJYgJm+ywZibSvppqJS6F1A6PXlRgWFuBlu6qleS949cAy5jAjahVQkOyd4=
X-Received: by 2002:a6b:c8d0:: with SMTP id y199mr1085841iof.162.1612934302741; 
 Tue, 09 Feb 2021 21:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210205023956.417587-1-aneesh.kumar@linux.ibm.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 10 Feb 2021 06:18:11 +0100
Message-ID: <CAM9Jb+gS22vbRrSLfTG=9VhJfrMOGvm4r8HB1nBMS4RK9W06FQ@mail.gmail.com>
Subject: Re: [PATCH] mm/pmem: Avoid inserting hugepage PTE entry with fsdax if
 hugepage support is disabled
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux MM <linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Differentiate between hardware not supporting hugepages and user disabling THP
> via 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
>
> For the devdax namespace, the kernel handles the above via the
> supported_alignment attribute and failing to initialize the namespace
> if the namespace align value is not supported on the platform.
>
> For the fsdax namespace, the kernel will continue to initialize
> the namespace. This can result in the kernel creating a huge pte
> entry even though the hardware don't support the same.
>
> We do want hugepage support with pmem even if the end-user disabled THP
> via sysfs file (/sys/kernel/mm/transparent_hugepage/enabled). Hence
> differentiate between hardware/firmware lacking support vs user-controlled
> disable of THP and prevent a huge fault if the hardware lacks hugepage
> support.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  include/linux/huge_mm.h | 15 +++++++++------
>  mm/huge_memory.c        |  6 +++++-
>  2 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 6a19f35f836b..ba973efcd369 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -78,6 +78,7 @@ static inline vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn,
>  }
>
>  enum transparent_hugepage_flag {
> +       TRANSPARENT_HUGEPAGE_NEVER_DAX,
>         TRANSPARENT_HUGEPAGE_FLAG,
>         TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
>         TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
> @@ -123,6 +124,13 @@ extern unsigned long transparent_hugepage_flags;
>   */
>  static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
>  {
> +
> +       /*
> +        * If the hardware/firmware marked hugepage support disabled.
> +        */
> +       if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_NEVER_DAX))
> +               return false;
> +
>         if (vma->vm_flags & VM_NOHUGEPAGE)
>                 return false;
>
> @@ -134,12 +142,7 @@ static inline bool __transparent_hugepage_enabled(struct vm_area_struct *vma)
>
>         if (transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_FLAG))
>                 return true;
> -       /*
> -        * For dax vmas, try to always use hugepage mappings. If the kernel does
> -        * not support hugepages, fsdax mappings will fallback to PAGE_SIZE
> -        * mappings, and device-dax namespaces, that try to guarantee a given
> -        * mapping size, will fail to enable
> -        */
> +
>         if (vma_is_dax(vma))
>                 return true;
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9237976abe72..d698b7e27447 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -386,7 +386,11 @@ static int __init hugepage_init(void)
>         struct kobject *hugepage_kobj;
>
>         if (!has_transparent_hugepage()) {
> -               transparent_hugepage_flags = 0;
> +               /*
> +                * Hardware doesn't support hugepages, hence disable
> +                * DAX PMD support.
> +                */
> +               transparent_hugepage_flags = 1 << TRANSPARENT_HUGEPAGE_NEVER_DAX;
>                 return -EINVAL;
>         }

 Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
