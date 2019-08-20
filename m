Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470295A04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:43:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CPTK2w2wzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fud3MqWV"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CPQv1G1GzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:41:25 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id o9so10498949iom.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zdfPVCpQKbOB6BWB1KnP3j6I+X4+4oR2rukvo6YVs7E=;
 b=Fud3MqWVJzIcbSDdvAgLseOwaSEiZ/+3odadDhcdApXZYMppL8Um2VXLTEjaJ43tZO
 tfS2PDfXZXBYMGxRgz0ar6cY7E1yUB6Jx19ULyNsKy3msVQ+iE4YBtKBid7wlE7L7Dtq
 IYXZwUHZ/csV2+2m6xIsLdoFfjImUWiBLB0NnlAIJWSRmoOYg0y6uBlh0AttsBvnlRTj
 of27H2vEXrYOi+Z0YIWb9U1RK5coV7o09yVMehIXJQfEMS5CsDDTKcIYK4cdsoBR1i2O
 AvDzaTgeVwTu01n8zgfJZkNsFyLXhmGfIavBU5+Skq3rU+HwSpF5e2S1UPJlxDhdAI/h
 q6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zdfPVCpQKbOB6BWB1KnP3j6I+X4+4oR2rukvo6YVs7E=;
 b=CLloOWtHVPn2EGx2vhljzRICnyuZF0x5jMYVLO7gRgj3KlvHxWuDm0LhwZJxj2z5Q/
 yw/hLa1k0JANcDpVPlTa1UdPAc2jDhb5VeoEwC8pTzwfl4p++qs70APRI4voMCwjCR7M
 7ezW9Ar6OynZo4iqojFoH0iIlQ59VXiZjE15Gh+daNrQpaH1hjOlcLKEYZDPtdBUlk9g
 ziEjjYoq6mTae00iwCG4dVoicwAueNup7GXG1qs7IcWuf4Hzv8Otaw/LDzUNwqSOa30V
 KIdiY6z96dN3SRFOi7TJkvUEZzHmAIqaeV8GtBCdZNUvvzOtvCvtOWRnuvtqaEXK5xvE
 GufQ==
X-Gm-Message-State: APjAAAUpyZdHBJR9G4Yf4pgAPOpDEfR1PCyX6FnUp3wLdQlOBSA4GYgr
 C5vFJi0w7N5iUQVM3ZeBqN1Zbc8r895fHi4Do3I=
X-Google-Smtp-Source: APXvYqzRaJ7XDDJD1NW0/Nvdeg4AhNIo8VinQ7yGHcODmufB0O9qxvneOP6SzcAbn8IEqU8+L2jfE4gUjBfvokmzFgY=
X-Received: by 2002:a6b:fb10:: with SMTP id h16mr29478708iog.195.1566290479829; 
 Tue, 20 Aug 2019 01:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190820023030.18232-1-santosh@fossix.org>
 <20190820023030.18232-3-santosh@fossix.org>
In-Reply-To: <20190820023030.18232-3-santosh@fossix.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 20 Aug 2019 18:41:08 +1000
Message-ID: <CAOSf1CEYqY5O2RUmvh-nJwouhVZP0A3EW+_kQcz6h9d7cM8UYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] of_pmem: Add memory ranges which took a mce to bad
 range
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 12:30 PM Santosh Sivaraj <santosh@fossix.org> wrote:
>
> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.

Uh... I should have looked a bit closer at this on v1.

a) of_pmem.c isn't part of the powerpc tree. You should have CCed this
to the nvdimm list since you'll need an Ack from Dan Williams.
b) of_pmem isn't powerpc specific. Adding a pile of powerpc specific
machine check parsing means it's not going to compile on other DT
platforms.
c) all this appears to be copied and pasted from the papr_scm version of this.

Considering this is pretty similar in spirit to what's done on x86
today (drivers/acpi/nfit/mce.c) I think you would get more milage out
of moving the address matching into libnvdimm itself. Machine check
handling is always going to be arch specific, but memory errors could
be re-emitted by the arch code into a more generic notifier chain that
libnvdimm use. There's probably other uses in mm/ for such a chain
too.

Oliver


> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  drivers/nvdimm/of_pmem.c | 151 +++++++++++++++++++++++++++++++++------
>  1 file changed, 131 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
> index a0c8dcfa0bf9..155e56862fdf 100644
> --- a/drivers/nvdimm/of_pmem.c
> +++ b/drivers/nvdimm/of_pmem.c
> @@ -8,6 +8,9 @@
>  #include <linux/module.h>
>  #include <linux/ioport.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/nd.h>
> +#include <asm/mce.h>
>
>  static const struct attribute_group *region_attr_groups[] = {
>         &nd_region_attribute_group,
> @@ -25,11 +28,77 @@ struct of_pmem_private {
>         struct nvdimm_bus *bus;
>  };
>
> +struct of_pmem_region {
> +       struct of_pmem_private *priv;
> +       struct nd_region_desc *region_desc;
> +       struct nd_region *region;
> +       struct list_head region_list;
> +};
> +
> +LIST_HEAD(pmem_regions);
> +DEFINE_MUTEX(pmem_region_lock);
> +
> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
> +                        void *data)
> +{
> +       struct machine_check_event *evt = data;
> +       struct of_pmem_region *pmem_region;
> +       u64 aligned_addr, phys_addr;
> +       bool found = false;
> +
> +       if (evt->error_type != MCE_ERROR_TYPE_UE)
> +               return NOTIFY_DONE;
> +
> +       if (list_empty(&pmem_regions))
> +               return NOTIFY_DONE;
> +
> +       phys_addr = evt->u.ue_error.physical_address +
> +               (evt->u.ue_error.effective_address & ~PAGE_MASK);
> +
> +       if (!evt->u.ue_error.physical_address_provided ||
> +           !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
> +               return NOTIFY_DONE;
> +
> +       mutex_lock(&pmem_region_lock);
> +       list_for_each_entry(pmem_region, &pmem_regions, region_list) {
> +               struct resource *res = pmem_region->region_desc->res;
> +
> +               if (phys_addr >= res->start && phys_addr <= res->end) {
> +                       found = true;
> +                       break;
> +               }
> +       }
> +       mutex_unlock(&pmem_region_lock);
> +
> +       if (!found)
> +               return NOTIFY_DONE;
> +
> +       aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
> +
> +       if (nvdimm_bus_add_badrange(pmem_region->priv->bus, aligned_addr,
> +                                   L1_CACHE_BYTES))
> +               return NOTIFY_DONE;
> +
> +       pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
> +                aligned_addr, aligned_addr + L1_CACHE_BYTES);
> +
> +
> +       nvdimm_region_notify(pmem_region->region, NVDIMM_REVALIDATE_POISON);
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +       .notifier_call = handle_mce_ue
> +};
> +
>  static int of_pmem_region_probe(struct platform_device *pdev)
>  {
>         struct of_pmem_private *priv;
>         struct device_node *np;
>         struct nvdimm_bus *bus;
> +       struct of_pmem_region *pmem_region;
> +       struct nd_region_desc *ndr_desc;
>         bool is_volatile;
>         int i;
>
> @@ -58,32 +127,49 @@ static int of_pmem_region_probe(struct platform_device *pdev)
>                         is_volatile ? "volatile" : "non-volatile",  np);
>
>         for (i = 0; i < pdev->num_resources; i++) {
> -               struct nd_region_desc ndr_desc;
>                 struct nd_region *region;
>
> -               /*
> -                * NB: libnvdimm copies the data from ndr_desc into it's own
> -                * structures so passing a stack pointer is fine.
> -                */
> -               memset(&ndr_desc, 0, sizeof(ndr_desc));
> -               ndr_desc.attr_groups = region_attr_groups;
> -               ndr_desc.numa_node = dev_to_node(&pdev->dev);
> -               ndr_desc.target_node = ndr_desc.numa_node;
> -               ndr_desc.res = &pdev->resource[i];
> -               ndr_desc.of_node = np;
> -               set_bit(ND_REGION_PAGEMAP, &ndr_desc.flags);
> +               ndr_desc = kzalloc(sizeof(struct nd_region_desc), GFP_KERNEL);
> +               if (!ndr_desc) {
> +                       nvdimm_bus_unregister(priv->bus);
> +                       kfree(priv);
> +                       return -ENOMEM;
> +               }
> +
> +               ndr_desc->attr_groups = region_attr_groups;
> +               ndr_desc->numa_node = dev_to_node(&pdev->dev);
> +               ndr_desc->target_node = ndr_desc->numa_node;
> +               ndr_desc->res = &pdev->resource[i];
> +               ndr_desc->of_node = np;
> +               set_bit(ND_REGION_PAGEMAP, &ndr_desc->flags);
>
>                 if (is_volatile)
> -                       region = nvdimm_volatile_region_create(bus, &ndr_desc);
> +                       region = nvdimm_volatile_region_create(bus, ndr_desc);
>                 else
> -                       region = nvdimm_pmem_region_create(bus, &ndr_desc);
> +                       region = nvdimm_pmem_region_create(bus, ndr_desc);
>
> -               if (!region)
> +               if (!region) {
>                         dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
> -                                       ndr_desc.res, np);
> -               else
> -                       dev_dbg(&pdev->dev, "Registered region %pR from %pOF\n",
> -                                       ndr_desc.res, np);
> +                                       ndr_desc->res, np);
> +                       continue;
> +               }
> +
> +               dev_dbg(&pdev->dev, "Registered region %pR from %pOF\n",
> +                       ndr_desc->res, np);
> +
> +               pmem_region = kzalloc(sizeof(struct of_pmem_region),
> +                                     GFP_KERNEL);
> +               if (!pmem_region)
> +                       continue;
> +
> +               pmem_region->region_desc = ndr_desc;
> +               pmem_region->region = region;
> +               pmem_region->priv = priv;
> +
> +               /* Save regions registered for use by the notification code */
> +               mutex_lock(&pmem_region_lock);
> +               list_add_tail(&pmem_region->region_list, &pmem_regions);
> +               mutex_unlock(&pmem_region_lock);
>         }
>
>         return 0;
> @@ -92,6 +178,13 @@ static int of_pmem_region_probe(struct platform_device *pdev)
>  static int of_pmem_region_remove(struct platform_device *pdev)
>  {
>         struct of_pmem_private *priv = platform_get_drvdata(pdev);
> +       struct of_pmem_region *r, *t;
> +
> +       list_for_each_entry_safe(r, t, &pmem_regions, region_list) {
> +               list_del(&(r->region_list));
> +               kfree(r->region_desc);
> +               kfree(r);
> +       }
>
>         nvdimm_bus_unregister(priv->bus);
>         kfree(priv);
> @@ -113,7 +206,25 @@ static struct platform_driver of_pmem_region_driver = {
>         },
>  };
>
> -module_platform_driver(of_pmem_region_driver);
> +static int __init of_pmem_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_driver_register(&of_pmem_region_driver);
> +       if (!ret)
> +               mce_register_notifier(&mce_ue_nb);
> +
> +       return ret;
> +}
> +module_init(of_pmem_init);
> +
> +static void __exit of_pmem_exit(void)
> +{
> +       mce_unregister_notifier(&mce_ue_nb);
> +       platform_driver_unregister(&of_pmem_region_driver);
> +}
> +module_exit(of_pmem_exit);
> +
>  MODULE_DEVICE_TABLE(of, of_pmem_region_match);
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("IBM Corporation");
> --
> 2.21.0
>
