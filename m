Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A7123A06B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 09:37:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKqTT5ryvzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 17:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mavAQ4BT; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKqRf4HvQzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 17:35:23 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id u126so286086iod.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qC7Eorsl9zkF3gmLSSjlCkDc4Lqwlol5oKVC+pduNKE=;
 b=mavAQ4BTdqmKtvTTp4cHnMJ452k/MceL6zJM/REw/MAxxK6JlOdb2LrjJ6B0JW606s
 vwCGNbvU+pDkpg5wL4udYpYYvsGrdbqShJcoC8/AbFruvl+RRtMqpTnT8lESd73Rw2ap
 ydAfiYC/Ra0tLcUvUmaT371Lo8OeqZz+pykYrqodzdJnLYATWlfAeLyABB+ujfYs8zVw
 2ufZPeFTRbopMPgXd88ulGgdMmgfBpXE9pMEcM3KGgF1s0fI3DdpV43eFJNlBugGgsgD
 GzazFKfB0IEWUqQtgklYLYLOxRHSkhZv8jRT6VyFY7A6p68JvGSgo807iAGARC2bUjRP
 VzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qC7Eorsl9zkF3gmLSSjlCkDc4Lqwlol5oKVC+pduNKE=;
 b=PlrHhUPWqLAczTkVJcHlRImH7StBLCvEi9ZPZjXgbW9GcC69qJcX4mlbakw5lsl1lY
 745rfzehlhgxYjhtI6eiimMBzNvsfFn8S8dhi917Ipo1Ctrq58W4WFMhAhBt73JbQKU5
 KGM8HBuqQlYgFzj57TM3H6c7ivKMo7RxT3KufJJPvHka4PUEPiauTPSuuFAilFLv1SZr
 6BF6BAxmOiHwN+ler1tHB+9yoMv+1uc7Kz5cX19bLge/F94ji9lzMBl5rMw1AfXAjMoP
 OBPZOkkFunVANBZvfh3TtI/KPDzW9Fo4yjKj/nmYgMdEx3CU8PW04gV0nwRv7550SdRi
 j8fQ==
X-Gm-Message-State: AOAM533AzmkK9wPTdO7lWt0SyfoSj2pFotBw6CXiBHQa8gBf2Q2Fch5I
 ZiwvN/5zQoe5iaz4ECScK2WXio93ybQ7yKcnNcE=
X-Google-Smtp-Source: ABdhPJzPHgQu3pu5237f85qkNjWwqL+VLtML/cwrs+ApJ+7SanaQnlgKHAXRK6SwLpWKYBWLuwC0reitsDOY6+AgCjg=
X-Received: by 2002:a5d:848d:: with SMTP id t13mr3720345iom.73.1596440120745; 
 Mon, 03 Aug 2020 00:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131520.51211-1-maxg@mellanox.com>
 <20200430131520.51211-2-maxg@mellanox.com>
In-Reply-To: <20200430131520.51211-2-maxg@mellanox.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 3 Aug 2020 17:35:09 +1000
Message-ID: <CAOSf1CGv=0bwShzzK5zP3dtKg=RxeTFvq52j-Vi4GDfZ4UpBJA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] powerpc/powernv: Enable and setup PCI P2P
To: Max Gurtovoy <maxg@mellanox.com>
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
Cc: vladimirk@mellanox.com, Carol L Soto <clsoto@us.ibm.com>,
 linux-pci <linux-pci@vger.kernel.org>, shlomin@mellanox.com,
 israelr@mellanox.com, Frederic Barrat <fbarrat@linux.ibm.com>,
 idanw@mellanox.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>, aneela@mellanox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 30, 2020 at 11:15 PM Max Gurtovoy <maxg@mellanox.com> wrote:
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 57d3a6a..9ecc576 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -3706,18 +3706,208 @@ static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
>         }
>  }
>
> +#ifdef CONFIG_PCI_P2PDMA
> +static DEFINE_MUTEX(p2p_mutex);
> +
> +static bool pnv_pci_controller_owns_addr(struct pci_controller *hose,
> +                                        phys_addr_t addr, size_t size)
> +{
> +       int i;
> +
> +       /*
> +        * It seems safe to assume the full range is under the same PHB, so we
> +        * can ignore the size.
> +        */
> +       for (i = 0; i < ARRAY_SIZE(hose->mem_resources); i++) {
> +               struct resource *res = &hose->mem_resources[i];
> +
> +               if (res->flags && addr >= res->start && addr < res->end)
> +                       return true;
> +       }
> +       return false;
> +}
> +
> +/*
> + * find the phb owning a mmio address if not owned locally
> + */
> +static struct pnv_phb *pnv_pci_find_owning_phb(struct pci_dev *pdev,
> +                                              phys_addr_t addr, size_t size)
> +{
> +       struct pci_controller *hose;
> +
> +       /* fast path */
> +       if (pnv_pci_controller_owns_addr(pdev->bus->sysdata, addr, size))
> +               return NULL;

Do we actually need this fast path? It's going to be slow either way.
Also if a device is doing p2p to another device under the same PHB
then it should not be happening via the root complex. Is this a case
you've tested?

> +       list_for_each_entry(hose, &hose_list, list_node) {
> +               struct pnv_phb *phb = hose->private_data;
> +
> +               if (phb->type != PNV_PHB_NPU_NVLINK &&
> +                   phb->type != PNV_PHB_NPU_OCAPI) {
> +                       if (pnv_pci_controller_owns_addr(hose, addr, size))
> +                               return phb;
> +               }
> +       }
> +       return NULL;
> +}
> +
> +static u64 pnv_pci_dma_dir_to_opal_p2p(enum dma_data_direction dir)
> +{
> +       if (dir == DMA_TO_DEVICE)
> +               return OPAL_PCI_P2P_STORE;
> +       else if (dir == DMA_FROM_DEVICE)
> +               return OPAL_PCI_P2P_LOAD;
> +       else if (dir == DMA_BIDIRECTIONAL)
> +               return OPAL_PCI_P2P_LOAD | OPAL_PCI_P2P_STORE;
> +       else
> +               return 0;
> +}
> +
> +static int pnv_pci_ioda_enable_p2p(struct pci_dev *initiator,
> +                                  struct pnv_phb *phb_target,
> +                                  enum dma_data_direction dir)
> +{
> +       struct pci_controller *hose;
> +       struct pnv_phb *phb_init;
> +       struct pnv_ioda_pe *pe_init;
> +       u64 desc;
> +       int rc;
> +
> +       if (!opal_check_token(OPAL_PCI_SET_P2P))
> +               return -ENXIO;
> +

> +       hose = pci_bus_to_host(initiator->bus);
> +       phb_init = hose->private_data;

You can use the pci_bus_to_pnvhb() helper

> +
> +       pe_init = pnv_ioda_get_pe(initiator);
> +       if (!pe_init)
> +               return -ENODEV;
> +
> +       if (!pe_init->tce_bypass_enabled)
> +               return -EINVAL;
> +
> +       /*
> +        * Configuring the initiator's PHB requires to adjust its TVE#1
> +        * setting. Since the same device can be an initiator several times for
> +        * different target devices, we need to keep a reference count to know
> +        * when we can restore the default bypass setting on its TVE#1 when
> +        * disabling. Opal is not tracking PE states, so we add a reference
> +        * count on the PE in linux.
> +        *
> +        * For the target, the configuration is per PHB, so we keep a
> +        * target reference count on the PHB.
> +        */

This irks me a bit because configuring the DMA address limits for the
TVE is the kernel's job. What we really should be doing is using
opal_pci_map_pe_dma_window_real() to set the bypass-mode address limit
for the TVE to something large enough to hit the MMIO ranges rather
than having set_p2p do it as a side effect. Unfortunately, for some
reason skiboot doesn't implement support for enabling 56bit addressing
using opal_pci_map_pe_dma_window_real() and we do need to support
older kernel's which used this stuff so I guess we're stuck with it
for now. It'd be nice if we could fix this in the longer term
though...

> +       mutex_lock(&p2p_mutex);
> +
> +       desc = OPAL_PCI_P2P_ENABLE | pnv_pci_dma_dir_to_opal_p2p(dir);
> +       /* always go to opal to validate the configuration */
> +       rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id, desc,
> +                             pe_init->pe_number);
> +       if (rc != OPAL_SUCCESS) {
> +               rc = -EIO;
> +               goto out;
> +       }
> +
> +       pe_init->p2p_initiator_count++;
> +       phb_target->p2p_target_count++;
> +
> +       rc = 0;
> +out:
> +       mutex_unlock(&p2p_mutex);
> +       return rc;
> +}
> +
> +static int pnv_pci_dma_map_resource(struct pci_dev *pdev,
> +                                   phys_addr_t phys_addr, size_t size,
> +                                   enum dma_data_direction dir)
> +{
> +       struct pnv_phb *target_phb;
> +
> +       target_phb = pnv_pci_find_owning_phb(pdev, phys_addr, size);
> +       if (!target_phb)
> +               return 0;
> +
> +       return pnv_pci_ioda_enable_p2p(pdev, target_phb, dir);
> +}
> +
> +static int pnv_pci_ioda_disable_p2p(struct pci_dev *initiator,
> +               struct pnv_phb *phb_target)
> +{
> +       struct pci_controller *hose;
> +       struct pnv_phb *phb_init;
> +       struct pnv_ioda_pe *pe_init;
> +       int rc;
> +
> +       if (!opal_check_token(OPAL_PCI_SET_P2P))
> +               return -ENXIO;

This should probably have a WARN_ON() since we can't hit this path
unless the initial map succeeds.

> +       hose = pci_bus_to_host(initiator->bus);
> +       phb_init = hose->private_data;

pci_bus_to_pnvhb()

> +       pe_init = pnv_ioda_get_pe(initiator);
> +       if (!pe_init)
> +               return -ENODEV;
> +
> +       mutex_lock(&p2p_mutex);
> +
> +       if (!pe_init->p2p_initiator_count || !phb_target->p2p_target_count) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       if (--pe_init->p2p_initiator_count == 0)
> +               pnv_pci_ioda2_set_bypass(pe_init, true);
> +
> +       if (--phb_target->p2p_target_count == 0) {
> +               rc = opal_pci_set_p2p(phb_init->opal_id, phb_target->opal_id,
> +                                     0, pe_init->pe_number);
> +               if (rc != OPAL_SUCCESS) {
> +                       rc = -EIO;
> +                       goto out;
> +               }
> +       }
> +
> +       rc = 0;
> +out:
> +       mutex_unlock(&p2p_mutex);
> +       return rc;
> +}
> +
> +static void pnv_pci_dma_unmap_resource(struct pci_dev *pdev,
> +                                      dma_addr_t addr, size_t size,
> +                                      enum dma_data_direction dir)
> +{
> +       struct pnv_phb *target_phb;
> +       int rc;
> +
> +       target_phb = pnv_pci_find_owning_phb(pdev, addr, size);
> +       if (!target_phb)
> +               return;
> +
> +       rc = pnv_pci_ioda_disable_p2p(pdev, target_phb);
> +       if (rc)
> +               dev_err(&pdev->dev, "Failed to undo PCI peer-to-peer setup for address %llx: %d\n",
> +                       addr, rc);

Use pci_err() or pe_err().
