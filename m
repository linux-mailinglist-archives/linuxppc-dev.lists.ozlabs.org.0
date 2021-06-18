Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CE3AD4FF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 00:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6D5w64S4z3c62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 08:25:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=M6IVXCaf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M6IVXCaf; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6D5Q4XjKz2yXj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 08:25:28 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id f5so4364164qvu.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=AAHvvl2NgUrdPUzpOC5DwlTLWZtUu++4Ip/1oS1uyF0=;
 b=M6IVXCafFKhqyfWBbDnGtIBGlVuYa4dYsP8ed9Ol/enk7Gy0nlvKumNIrcxnH8M8qY
 rMgu3IhPVw2S7tbQLwc/3xywIiQd4DrWywlFZowoYx7+31PmvEyB8OcJ2eJn2Xf4Xbxf
 N6ifBVmEMtP7/9W4UKtSEdzZ97CLxKvkWCC9mvsgOaqOUznq8fpsvynYS5yUdGeMLwrE
 DsnUoHIZMTUYaXcQ43mOoG10hlRpoVscM5IeAHmXYJWjjCdQfuL3cV9j+D6u3q3Zos0B
 ZIeBqJnGIYqSFuVTypsE8POcjMxs26bK0YznuvEk9zJbjNdcH/3QJyO9PqrcEk3qMhiB
 fLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=AAHvvl2NgUrdPUzpOC5DwlTLWZtUu++4Ip/1oS1uyF0=;
 b=dtqZyGbjbq54bv5icB7tBBOMSJqA6lkGePnnTuPM84Z5f45+WJyg6xtj3Os+F1tEK/
 GqACnZ7Put86EbSV4NufUTl/ed+O+swnXjP9/rw7niNiNZo8FEroxi+9nl841z8H3XzY
 qZVyJfM16p6sofhGibaoVbopzs3VHMB4JxkfK/PVcRCvL49ddN9N7FACZxhMdUl3DGfp
 BVrxjkzWZgEg8zINzM9+Ff2a9yMX15r6B/zwWKJcdmxh2yz/Q8jr2ih4Sha50/YENstz
 7z7IdBAbLVnIbZsv4ZvmKsakvIgvpvZygnUxZkwrPOda5aSDdjYiJnDvzNKoRbdg2jq2
 +frw==
X-Gm-Message-State: AOAM5317Sfx4z3VlEqxYzipPFWHaUkj/uG5JZJezBm4mZGV9G+pP/mGD
 FIN+lNnLSLWifGPG8EFweVU=
X-Google-Smtp-Source: ABdhPJzCmxcmWKnnslkcAcDlPSLQN/pZqLcofwKKXWTZgOglTVFXOe9SdZ7RLd4EPC0PYtJWAg0Ysg==
X-Received: by 2002:a0c:f181:: with SMTP id m1mr8092609qvl.15.1624055124096;
 Fri, 18 Jun 2021 15:25:24 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:87bb::1001? ([2804:14c:482:87bb::1001])
 by smtp.gmail.com with ESMTPSA id v194sm4922592qkb.94.2021.06.18.15.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 15:25:23 -0700 (PDT)
Message-ID: <97626d3883ed207b818760a8239babb08a6b5c59.camel@gmail.com>
Subject: Re: [PATCH v4 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Date: Fri, 18 Jun 2021 19:26:07 -0300
In-Reply-To: <e4984fa0-2afe-a987-4fb8-61b878431b1f@ozlabs.ru>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-8-leobras.c@gmail.com>
 <e4984fa0-2afe-a987-4fb8-61b878431b1f@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey, thanks for this feedback!

On Mon, 2021-05-10 at 17:34 +1000, Alexey Kardashevskiy wrote:
> 
> 
> This does not apply anymore as it conflicts with my 4be518d838809e2135.

ok, rebasing on top of torvalds/master

> 
> 
> > ---
> >   arch/powerpc/platforms/pseries/iommu.c | 100 ++++++++++++----------
> > ---
> >   1 file changed, 50 insertions(+), 50 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c
> > b/arch/powerpc/platforms/pseries/iommu.c
> > index 5a70ecd579b8..89cb6e9e9f31 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -53,6 +53,11 @@ enum {
> >         DDW_EXT_QUERY_OUT_SIZE = 2
> >   };
> >   
> > +#ifdef CONFIG_IOMMU_API
> > +static int tce_exchange_pseries(struct iommu_table *tbl, long index,
> > unsigned long *tce,
> > +                               enum dma_data_direction *direction,
> > bool realmode);
> > +#endif
> 
> 
> Instead of declaring this so far from the the code which needs it, may 
> be add
> 
> struct iommu_table_ops iommu_table_lpar_multi_ops;
> 
> right before iommu_table_setparms() (as the sctruct is what you
> actually 
> want there),
>  and you won't need to move iommu_table_pseries_ops as well.

Oh, I was not aware I could declare a variable and then define it
statically. 
I mean, it does make sense, but I never thought of that.

I will change that :)

> 
> 
> > +
> >   static struct iommu_table *iommu_pseries_alloc_table(int node)
> >   {
> >         struct iommu_table *tbl;
> > @@ -501,6 +506,28 @@ static int
> > tce_setrange_multi_pSeriesLP_walk(unsigned long start_pfn,
> >         return tce_setrange_multi_pSeriesLP(start_pfn, num_pfn, arg);
> >   }
> >   
> > +static inline void _iommu_table_setparms(struct iommu_table *tbl,
> > unsigned long busno,
> 
> 
> The underscore is confusing, may be iommu_table_do_setparms()? 
> iommu_table_setparms_common()? Not sure. I cannot recall a single 
> function with just one leading underscore, I suspect I was pushed back 
> when I tried adding one ages ago :) "inline" seems excessive, the 
> compiler will probably figure it out anyway.
> 
> 

sure, done.


> 
> > +                                        unsigned long liobn,
> > unsigned long win_addr,
> > +                                        unsigned long window_size,
> > unsigned long page_shift,
> > +                                        unsigned long base, struct
> > iommu_table_ops *table_ops)
> 
> 
> Make "base" a pointer. Or, better, just keep setting it directly in 
> iommu_table_setparms() rather than passing 0 around.
> 
> The same comment about "liobn" - set it in iommu_table_setparms_lpar().
> The reviewer will see what field atters in what situation imho.
> 

The idea here was to keep all tbl parameters setting in
_iommu_table_setparms (or iommu_table_setparms_common).

I understand the idea that each one of those is optional in the other
case, but should we keep whatever value is present in the other
variable (not zeroing the other variable), or do someting like:

tbl->it_index = 0;
tbl->it_base = basep;
(in iommu_table_setparms)

tbl->it_index = liobn;
tbl->it_base = 0;
(in iommu_table_setparms_lpar)


> 
> > +{
> > +       tbl->it_busno = busno;
> > +       tbl->it_index = liobn;
> > +       tbl->it_offset = win_addr >> page_shift;
> > +       tbl->it_size = window_size >> page_shift;
> > +       tbl->it_page_shift = page_shift;
> > +       tbl->it_base = base;
> > +       tbl->it_blocksize = 16;
> > +       tbl->it_type = TCE_PCI;
> > +       tbl->it_ops = table_ops;
> > +}
> > +
> > +struct iommu_table_ops iommu_table_pseries_ops = {
> > +       .set = tce_build_pSeries,
> > +       .clear = tce_free_pSeries,
> > +       .get = tce_get_pseries
> > +};
> > +
> >   static void iommu_table_setparms(struct pci_controller *phb,
> >                                  struct device_node *dn,
> >                                  struct iommu_table *tbl)
> > @@ -509,8 +536,13 @@ static void iommu_table_setparms(struct
> > pci_controller *phb,
> >         const unsigned long *basep;
> >         const u32 *sizep;
> >   
> > -       node = phb->dn;
> > +       /* Test if we are going over 2GB of DMA space */
> > +       if (phb->dma_window_base_cur + phb->dma_window_size > SZ_2G)
> > {
> > +               udbg_printf("PCI_DMA: Unexpected number of IOAs under
> > this PHB.\n");
> > +               panic("PCI_DMA: Unexpected number of IOAs under this
> > PHB.\n");
> > +       }
> >   
> > +       node = phb->dn;
> >         basep = of_get_property(node, "linux,tce-base", NULL);
> >         sizep = of_get_property(node, "linux,tce-size", NULL);
> >         if (basep == NULL || sizep == NULL) {
> > @@ -519,33 +551,25 @@ static void iommu_table_setparms(struct
> > pci_controller *phb,
> >                 return;
> >         }
> >   
> > -       tbl->it_base = (unsigned long)__va(*basep);
> > +       _iommu_table_setparms(tbl, phb->bus->number, 0, phb-
> > >dma_window_base_cur,
> > +                             phb->dma_window_size,
> > IOMMU_PAGE_SHIFT_4K,
> > +                             (unsigned long)__va(*basep),
> > &iommu_table_pseries_ops);
> >   
> >         if (!is_kdump_kernel())
> >                 memset((void *)tbl->it_base, 0, *sizep);
> >   
> > -       tbl->it_busno = phb->bus->number;
> > -       tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> > -
> > -       /* Units of tce entries */
> > -       tbl->it_offset = phb->dma_window_base_cur >> tbl-
> > >it_page_shift;
> > -
> > -       /* Test if we are going over 2GB of DMA space */
> > -       if (phb->dma_window_base_cur + phb->dma_window_size >
> > 0x80000000ul) {
> > -               udbg_printf("PCI_DMA: Unexpected number of IOAs under
> > this PHB.\n");
> > -               panic("PCI_DMA: Unexpected number of IOAs under this
> > PHB.\n");
> > -       }
> > -
> >         phb->dma_window_base_cur += phb->dma_window_size;
> > -
> > -       /* Set the tce table size - measured in entries */
> > -       tbl->it_size = phb->dma_window_size >> tbl->it_page_shift;
> > -
> > -       tbl->it_index = 0;
> > -       tbl->it_blocksize = 16;
> > -       tbl->it_type = TCE_PCI;
> >   }
> >   
> > +struct iommu_table_ops iommu_table_lpar_multi_ops = {
> > +       .set = tce_buildmulti_pSeriesLP,
> > +#ifdef CONFIG_IOMMU_API
> > +       .xchg_no_kill = tce_exchange_pseries,
> > +#endif
> > +       .clear = tce_freemulti_pSeriesLP,
> > +       .get = tce_get_pSeriesLP
> > +};
> > +
> >   /*
> >    * iommu_table_setparms_lpar
> >    *
> > @@ -557,28 +581,17 @@ static void iommu_table_setparms_lpar(struct
> > pci_controller *phb,
> >                                       struct iommu_table_group
> > *table_group,
> >                                       const __be32 *dma_window)
> >   {
> > -       unsigned long offset, size;
> > +       unsigned long offset, size, liobn;
> >   
> > -       of_parse_dma_window(dn, dma_window, &tbl->it_index, &offset,
> > &size);
> > +       of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
> >   
> > -       tbl->it_busno = phb->bus->number;
> > -       tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> > -       tbl->it_base   = 0;
> > -       tbl->it_blocksize  = 16;
> > -       tbl->it_type = TCE_PCI;
> > -       tbl->it_offset = offset >> tbl->it_page_shift;
> > -       tbl->it_size = size >> tbl->it_page_shift;
> > +       _iommu_table_setparms(tbl, phb->bus->number, liobn, offset,
> > size, IOMMU_PAGE_SHIFT_4K, 0,
> > +                             &iommu_table_lpar_multi_ops);
> >   
> >         table_group->tce32_start = offset;
> >         table_group->tce32_size = size;
> >   }
> >   
> > -struct iommu_table_ops iommu_table_pseries_ops = {
> > -       .set = tce_build_pSeries,
> > -       .clear = tce_free_pSeries,
> > -       .get = tce_get_pseries
> > -};
> > -
> >   static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
> >   {
> >         struct device_node *dn;
> > @@ -647,7 +660,6 @@ static void pci_dma_bus_setup_pSeries(struct
> > pci_bus *bus)
> >         tbl = pci->table_group->tables[0];
> >   
> >         iommu_table_setparms(pci->phb, dn, tbl);
> > -       tbl->it_ops = &iommu_table_pseries_ops;
> >         iommu_init_table(tbl, pci->phb->node, 0, 0);
> >   
> >         /* Divide the rest (1.75GB) among the children */
> > @@ -664,7 +676,7 @@ static int tce_exchange_pseries(struct
> > iommu_table *tbl, long index, unsigned
> >                                 bool realmode)
> >   {
> >         long rc;
> > -       unsigned long ioba = (unsigned long) index << tbl-
> > >it_page_shift;
> > +       unsigned long ioba = (unsigned long)index << tbl-
> > >it_page_shift;
> 
> 
> Unrelated change, why, did checkpatch.pl complain?

My bad, this one could pass my git-add unnoticed.
Reverting.

> 
> >         unsigned long flags, oldtce = 0;
> >         u64 proto_tce = iommu_direction_to_tce_perm(*direction);
> >         unsigned long newtce = *tce | proto_tce;
> > @@ -686,15 +698,6 @@ static int tce_exchange_pseries(struct
> > iommu_table *tbl, long index, unsigned
> >   }
> >   #endif
> >   
> > -struct iommu_table_ops iommu_table_lpar_multi_ops = {
> > -       .set = tce_buildmulti_pSeriesLP,
> > -#ifdef CONFIG_IOMMU_API
> > -       .xchg_no_kill = tce_exchange_pseries,
> > -#endif
> > -       .clear = tce_freemulti_pSeriesLP,
> > -       .get = tce_get_pSeriesLP
> > -};
> > -
> >   static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
> >   {
> >         struct iommu_table *tbl;
> > @@ -729,7 +732,6 @@ static void pci_dma_bus_setup_pSeriesLP(struct
> > pci_bus *bus)
> >                 tbl = ppci->table_group->tables[0];
> >                 iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
> >                                 ppci->table_group, dma_window);
> > -               tbl->it_ops = &iommu_table_lpar_multi_ops;
> >                 iommu_init_table(tbl, ppci->phb->node, 0, 0);
> >                 iommu_register_group(ppci->table_group,
> >                                 pci_domain_nr(bus), 0);
> > @@ -758,7 +760,6 @@ static void pci_dma_dev_setup_pSeries(struct
> > pci_dev *dev)
> >                 PCI_DN(dn)->table_group =
> > iommu_pseries_alloc_group(phb->node);
> >                 tbl = PCI_DN(dn)->table_group->tables[0];
> >                 iommu_table_setparms(phb, dn, tbl);
> > -               tbl->it_ops = &iommu_table_pseries_ops;
> >                 iommu_init_table(tbl, phb->node, 0, 0);
> >                 set_iommu_table_base(&dev->dev, tbl);
> >                 return;
> > @@ -1436,7 +1437,6 @@ static void
> > pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
> >                 tbl = pci->table_group->tables[0];
> >                 iommu_table_setparms_lpar(pci->phb, pdn, tbl,
> >                                 pci->table_group, dma_window);
> > -               tbl->it_ops = &iommu_table_lpar_multi_ops;
> >                 iommu_init_table(tbl, pci->phb->node, 0, 0);
> >                 iommu_register_group(pci->table_group,
> >                                 pci_domain_nr(pci->phb->bus), 0);
> > 
> 

Best regards,
Leonardo Bras

