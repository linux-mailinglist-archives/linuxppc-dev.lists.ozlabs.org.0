Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 738D88EC82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 15:14:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Rjk0xK6zDqWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdBd+pw/"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Rfw3LqhzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:11:35 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id c7so5783177otp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aWL1zbH2VJ1USTtgdu/OoXb/uZfqW3otrQqJw3FR1qc=;
 b=mdBd+pw//9onzEkhqISVHciOkkTrKnqZNlail6fG9l+UxkpXDDouQl9hNnjzYypF83
 hg6eB8+e3yrjuYlLtINgMuxUJ1YQRZ56tusjbQgeCBWzXtcS51KrVH3i00OmPbybkPGM
 cIPUEUiOhk5UFOWUlnbnwbpVtTwWCSlIgOF9aqfM3s8JLLo8LUMtpfeis1Q4m3cLAqVx
 rZ672l/9Q83HhciUXhP4DwUHjPqEu+D6L3fLaiZvu+/rFhtY7buhMNxfb06VxWRHNmTe
 LwkUYwJhiOkOj+/uZ2JkP/QZrdSWMrFGPj5PAF4D9x1yTgmzzOGLfo4WGXMn6U4/lBwX
 neXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aWL1zbH2VJ1USTtgdu/OoXb/uZfqW3otrQqJw3FR1qc=;
 b=pJkFyFTh5gHakQuzV1dv2ZuPBzRWYslNxqJxj4aA+BS13ppD2Gk6BWS19fLK0z75Iv
 aSYR5eRMFGnIrn+PaLoe5NEJtJ7IblGnfwPP/qZLgt0Fwe2msu2TNLCNreWwGTwbdaer
 1CnEEajtdAlyhjzHUiNtVbTyJH+wmHqAN9jD/vVZZA3Tqp7AGUfv57pu/Q7oSeoEsnNk
 6uleBBHeLhFTU5xZ6lsO3yuKsFT804btRfQcpEAr3E0okahezPxqbvXnoDpSHpBCSwVv
 /vAIVIYkq+MTPQ8djsiitaa5C9Hypicm9pv9RrqtoTGydri53PmgykdyFUkchllXTcPu
 0JiQ==
X-Gm-Message-State: APjAAAU6Td96zI51S/QwTanDImf1LrB3QOkhJu9J5zfE0uyHDkYxqmYa
 5k0654tJYyvMruAFy/ShIFycxIijFwuUcXcPSfL/+f+K
X-Google-Smtp-Source: APXvYqwOYXilQPg25j1ibr+f45Ih/kHPjsBP+ln1Kw0z+L6HgeDCYAdckjFT/ullbwhFbQ5qP96JsZUHhHgzIPitUjA=
X-Received: by 2002:a6b:c98c:: with SMTP id z134mr316903iof.276.1565874692522; 
 Thu, 15 Aug 2019 06:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814082452.28013-1-santosh@fossix.org>
 <20190814082452.28013-4-santosh@fossix.org>
In-Reply-To: <20190814082452.28013-4-santosh@fossix.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 15 Aug 2019 23:11:21 +1000
Message-ID: <CAOSf1CFqFHqCKQ7tf1CZjucdH5UnZ_DiuqEkppwZZLc0qYY-ZQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] papr/scm: Add bad memory ranges to nvdimm bad ranges
To: Santosh Sivaraj <santosh@fossix.org>
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
Cc: Reza Arbab <arbab@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 6:25 PM Santosh Sivaraj <santosh@fossix.org> wrote:
>
> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.
>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 65 +++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index a5ac371a3f06..4d25c98a9835 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -12,6 +12,8 @@
>  #include <linux/libnvdimm.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> +#include <linux/nd.h>
> +#include <asm/mce.h>
>
>  #include <asm/plpar_wrappers.h>
>
> @@ -39,8 +41,12 @@ struct papr_scm_priv {
>         struct resource res;
>         struct nd_region *region;
>         struct nd_interleave_set nd_set;
> +       struct list_head list;

list is not a meaningful name. call it something more descriptive.

>  };
>
> +LIST_HEAD(papr_nd_regions);
> +DEFINE_MUTEX(papr_ndr_lock);

Should this be a mutex or a spinlock? I don't know what context the
mce notifier is called from, but if it's not sleepable then a mutex
will cause problems. Did you test this with lockdep enabled?

> +
>  static int drc_pmem_bind(struct papr_scm_priv *p)
>  {
>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
> @@ -364,6 +370,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>                 dev_info(dev, "Region registered with target node %d and online node %d",
>                          target_nid, online_nid);
>
> +       mutex_lock(&papr_ndr_lock);
> +       list_add_tail(&p->list, &papr_nd_regions);
> +       mutex_unlock(&papr_ndr_lock);
> +

Where's the matching remove when we unbind the driver?

>         return 0;
>
>  err:   nvdimm_bus_unregister(p->bus);
> @@ -371,6 +381,60 @@ err:       nvdimm_bus_unregister(p->bus);
>         return -ENXIO;
>  }
>
> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
> +                        void *data)
> +{
> +       struct machine_check_event *evt = data;
> +       struct papr_scm_priv *p;
> +       u64 phys_addr;
> +
> +       if (evt->error_type != MCE_ERROR_TYPE_UE)
> +               return NOTIFY_DONE;
> +
> +       if (list_empty(&papr_nd_regions))
> +               return NOTIFY_DONE;
> +
> +       phys_addr = evt->u.ue_error.physical_address +
> +               (evt->u.ue_error.effective_address & ~PAGE_MASK);

Wait what? Why is physical_address page aligned, but effective_address
not? Not a problem with this patch, but still, what the hell?

> +       if (!evt->u.ue_error.physical_address_provided ||
> +           !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
> +               return NOTIFY_DONE;
> +
> +       mutex_lock(&papr_ndr_lock);
> +       list_for_each_entry(p, &papr_nd_regions, list) {
> +               struct resource res = p->res;
> +               u64 aligned_addr;
> +

> +               if (res.start > phys_addr)
> +                       continue;
> +
> +               if (res.end < phys_addr)
> +                       continue;

surely there's a helper for this

> +
> +               aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
> +               pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
> +                        aligned_addr, aligned_addr + L1_CACHE_BYTES);
> +
> +               if (nvdimm_bus_add_badrange(p->bus,
> +                                           aligned_addr, L1_CACHE_BYTES))
> +                       pr_warn("Failed to add bad range (0x%llx -- 0x%llx)\n",
> +                               aligned_addr, aligned_addr + L1_CACHE_BYTES);
> +
> +               nvdimm_region_notify(p->region,
> +                                    NVDIMM_REVALIDATE_POISON);
> +
> +               break;

nit: you can avoid stacking indetation levels by breaking out of the
loop as soon as you've found the region you're looking for.

> +       }
> +       mutex_unlock(&papr_ndr_lock);
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +       .notifier_call = handle_mce_ue
> +};
> +
>  static int papr_scm_probe(struct platform_device *pdev)
>  {
>         struct device_node *dn = pdev->dev.of_node;
> @@ -456,6 +520,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>                 goto err2;
>
>         platform_set_drvdata(pdev, p);
> +       mce_register_notifier(&mce_ue_nb);

Either get rid of the global region list and have a notifier block in
each device's driver private data, or keep the global list and
register the notifier in module_init(). Re-registering the notifier
each time a seperate device is probed seems very sketchy.

>         return 0;
>
> --
> 2.21.0
>
