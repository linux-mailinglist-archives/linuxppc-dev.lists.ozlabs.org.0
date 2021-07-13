Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9873C697A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 06:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP7CH2bYqz305v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 14:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VW6TGlpY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VW6TGlpY; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP7Bl6rXlz2yXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 14:36:46 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id o201so13359070pfd.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 21:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=82m03D0s+VMudJouCH7xODKkU6rRtZkgh42oOQDO16A=;
 b=VW6TGlpY06/w5pkT7TxeM2WTODkXJh5X54KrtuYOFbiQ4cJR4UOEQq/3J77uAa4K9o
 r7IWudEirM1J2yeVWKv5dGC6hCQpQONyWEQBnJNvrkXGi53dpr7IHhRLRmSdafqUMba6
 yC2qrM3ZoaoZoH9Rx+nXf+ueLuGsDYIDwjAkytOPK0D+BZw5TO8iYERyHKWmQc7/321i
 JmaeSiWUV2v539BKivflxc6bU2UusUPT2BFzdljqE6VnSxisQBgud1zv14n/onez2fBj
 5HX7OF42GOsvE0s8drqycKBE56kjgIG3eqW//7OXR80RoM+Rh/5W/BDvoPV9ErJKMlf0
 CYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=82m03D0s+VMudJouCH7xODKkU6rRtZkgh42oOQDO16A=;
 b=XucPawFrwHRPzkch7F39CcxBqvdLZJcqbtRrdZooqf337mp3kfAUQx9LpggA6S9p55
 P7v6MTJRUK1APuRteExn/L0E7GxnSEZW0hNopkHjazqm0Xy+kNXt1n2wWPUeUKNz3jBK
 4gJ0+nNt+P+ZvWHoAHyOznruTxCz/qcSpE8bIIRncy8xUrb5B3Y6guC5bqrMcXkXCDav
 iQ3xwoHAT6Gzp6bG+HWoe6IPFyqUbJLdge+g+VCydjcawMB0tc5yJC77sHCLUc/iY2JA
 VjVRfSyOWBq9zXTvSmgUruJtHW1i6eNhNkcI4UybJyHDiVb2G0tDIuCpF4v3QgT9sISX
 BgqA==
X-Gm-Message-State: AOAM530agJN3jEbfSVGTgd0Ap5oFf0DuH2aT0ed9wybY9AAcuYnzCy5I
 1YziaGmQNj8P5EBHV1+PwJQ=
X-Google-Smtp-Source: ABdhPJwSS4qHGmIytrzwPKmqhB2ndXwHOn3ihpE6aC1jNtjFxE+StfykewwJZNQ72Oncr1gendG2DA==
X-Received: by 2002:a05:6a00:21c6:b029:2ff:e9:94f0 with SMTP id
 t6-20020a056a0021c6b02902ff00e994f0mr2536260pfj.73.1626151002354; 
 Mon, 12 Jul 2021 21:36:42 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id j20sm14700424pfc.203.2021.07.12.21.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 21:36:41 -0700 (PDT)
Message-ID: <5b8676140f495dbbe3e28ce261e449b885dbae66.camel@gmail.com>
Subject: Re: [PATCH v4 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Date: Tue, 13 Jul 2021 01:36:52 -0300
In-Reply-To: <95ac11e9-a709-e0a2-9690-ef13c4a2cd43@ozlabs.ru>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-11-leobras.c@gmail.com>
 <95ac11e9-a709-e0a2-9690-ef13c4a2cd43@ozlabs.ru>
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

On Tue, 2021-05-11 at 17:57 +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 01/05/2021 02:31, Leonardo Bras wrote:
> > [...]
> >       pmem_present = dn != NULL;
> > @@ -1218,8 +1224,12 @@ static bool enable_ddw(struct pci_dev *dev,
> > struct device_node *pdn)
> >   
> >         mutex_lock(&direct_window_init_mutex);
> >   
> > -       if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset,
> > &len))
> > -               goto out_unlock;
> > +       if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset,
> > &len)) {
> > +               direct_mapping = (len >= max_ram_len);
> > +
> > +               mutex_unlock(&direct_window_init_mutex);
> > +               return direct_mapping;
> 
> Does not this break the existing case when direct_mapping==true by 
> skipping setting dev->dev.bus_dma_limit before returning?
> 

Yes, it does. Good catch!
I changed it to use a flag instead of win64 for return, and now I can
use the same success exit path for both the new config and the config
found in list. (out_unlock)

> 
> 
> > +       }
> >   
> >         /*
> >          * If we already went through this for a previous function of
> > @@ -1298,7 +1308,6 @@ static bool enable_ddw(struct pci_dev *dev,
> > struct device_node *pdn)
> >                 goto out_failed;
> >         }
> >         /* verify the window * number of ptes will map the partition
> > */
> > -       /* check largest block * page size > max memory hotplug addr
> > */
> >         /*
> >          * The "ibm,pmemory" can appear anywhere in the address
> > space.
> >          * Assuming it is still backed by page structs, try
> > MAX_PHYSMEM_BITS
> > @@ -1320,6 +1329,17 @@ static bool enable_ddw(struct pci_dev *dev,
> > struct device_node *pdn)
> >                         1ULL << len,
> >                         query.largest_available_block,
> >                         1ULL << page_shift);
> > +
> > +               len = order_base_2(query.largest_available_block <<
> > page_shift);
> > +               win_name = DMA64_PROPNAME;
> 
> [1] ....
> 
> 
> > +       } else {
> > +               direct_mapping = true;
> > +               win_name = DIRECT64_PROPNAME;
> > +       }
> > +
> > +       /* DDW + IOMMU on single window may fail if there is any
> > allocation */
> > +       if (default_win_removed && !direct_mapping &&
> > iommu_table_in_use(tbl)) {
> > +               dev_dbg(&dev->dev, "current IOMMU table in use, can't
> > be replaced.\n");
> 
> 
> ... remove !direct_mapping and move to [1]?


sure, done!

> 
> 
> >                 goto out_failed;
> >         }
> >   
> > @@ -1331,8 +1351,7 @@ static bool enable_ddw(struct pci_dev *dev,
> > struct device_node *pdn)
> >                   create.liobn, dn);
> >   
> >         win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> > -       win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn,
> > win_addr,
> > -                                   page_shift, len);
> > +       win64 = ddw_property_create(win_name, create.liobn, win_addr,
> > page_shift, len);
> >         if (!win64) {
> >                 dev_info(&dev->dev,
> >                          "couldn't allocate property, property name,
> > or value\n");
> > @@ -1350,12 +1369,47 @@ static bool enable_ddw(struct pci_dev *dev,
> > struct device_node *pdn)
> >         if (!window)
> >                 goto out_del_prop;
> >   
> > -       ret = walk_system_ram_range(0, memblock_end_of_DRAM() >>
> > PAGE_SHIFT,
> > -                       win64->value,
> > tce_setrange_multi_pSeriesLP_walk);
> > -       if (ret) {
> > -               dev_info(&dev->dev, "failed to map direct window for
> > %pOF: %d\n",
> > -                        dn, ret);
> > -               goto out_del_list;
> > +       if (direct_mapping) {
> > +               /* DDW maps the whole partition, so enable direct DMA
> > mapping */
> > +               ret = walk_system_ram_range(0, memblock_end_of_DRAM()
> > >> PAGE_SHIFT,
> > +                                           win64->value,
> > tce_setrange_multi_pSeriesLP_walk);
> > +               if (ret) {
> > +                       dev_info(&dev->dev, "failed to map direct
> > window for %pOF: %d\n",
> > +                                dn, ret);
> > +                       goto out_del_list;
> > +               }
> > +       } else {
> > +               struct iommu_table *newtbl;
> > +               int i;
> > +
> > +               /* New table for using DDW instead of the default DMA
> > window */
> > +               newtbl = iommu_pseries_alloc_table(pci->phb->node);
> > +               if (!newtbl) {
> > +                       dev_dbg(&dev->dev, "couldn't create new IOMMU
> > table\n");
> > +                       goto out_del_list;
> > +               }
> > +
> > +               for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources);
> > i++) {
> > +                       const unsigned long mask = IORESOURCE_MEM_64
> > | IORESOURCE_MEM;
> > +
> > +                       /* Look for MMIO32 */
> > +                       if ((pci->phb->mem_resources[i].flags & mask)
> > == IORESOURCE_MEM)
> > +                               break;
> 
> What if there is no IORESOURCE_MEM? pci->phb->mem_resources[i].start 
> below will have garbage.



Yeah, that makes sense. I will add this lines after 'for':

if (i == ARRAY_SIZE(pci->phb->mem_resources)) {
 iommu_tce_table_put(newtbl);
 goto out_del_list;
}

What do you think?


> 
> 
> > +               }
> > +
> > +               _iommu_table_setparms(newtbl, pci->phb->bus->number,
> > create.liobn, win_addr,
> > +                                     1UL << len, page_shift, 0,
> > &iommu_table_lpar_multi_ops);
> > +               iommu_init_table(newtbl, pci->phb->node, pci->phb-
> > >mem_resources[i].start,
> > +                                pci->phb->mem_resources[i].end);
> > +
> > +               if (default_win_removed)
> > +                       iommu_tce_table_put(tbl);
> 
> 
> iommu_tce_table_put() should have been called when the window was
> removed.
> 
> Also after some thinking - what happens if there were 2 devices in the 
> PE and one requested 64bit DMA? This will only update 
> set_iommu_table_base() for the 64bit one but not for the other.
>
> I think the right thing to do is:
> 
> 1. check if table[0] is in use, if yes => fail (which this does
> already)
> 
> 2. remove default dma window but keep the iommu_table struct with one
> change - set it_size to 0 (and free it_map) so the 32bit device won't
> look at a stale structure and think there is some window (imaginery 
> situation for phyp but easy to recreate in qemu).
> 
> 3. use table[1] for newly created indirect DDW window.
> 
> 4. change get_iommu_table_base() to return a usable table (or may be
> not 
> needed?).
> 
> If this sounds reasonable (does it?),

Looks ok, I will try your suggestion. 
I was not aware of how pci->table_group->tables[] worked, so I replaced
pci->table_group->tables[0] with the new tbl, while moving the older in
pci->table_group->tables[1].
(4) get_iommu_table_base() does not seem to need update, as it returns
the tlb set by set_iommu_table_base() which is already called in the
!direct_mapping path in current patch.

>  the question is now if you have
> time to do that and the hardware to test that, or I'll have to finish
> the work :)

Sorry, for some reason part of this got lost in Evolution mail client.

If possible, I do want to finish this work, and I am talking to IBM
Virt people in order to get testing HW.

> 
> 
> > +               else
> > +                       pci->table_group->tables[1] = tbl;
> 
> 
> What is this for?

I was thinking of adding the older table to pci->table_group->tables[1]
while keeping the newer table on pci->table_group->tables[0].
This did work, but I think your suggestion may work better.

Best regards,
Leonardo Bras


