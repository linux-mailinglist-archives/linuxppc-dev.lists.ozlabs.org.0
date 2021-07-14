Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F933C8BA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 21:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ6sc2dVxz3bYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 05:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MINw0efa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MINw0efa; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ6s66bPRz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 05:24:57 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id h4so3537023pgp.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=N+JKQJqwCl0d6bUKiCh0PgpItsPMqUhVfYdVbCoV6oQ=;
 b=MINw0efaLc4wJ0CtFKxIpr9crzGyoIWHvKyAgHMOHiEaLA38w6/psshHzlCRXKKiIV
 ENLi5dHSoAqVy8qEbg887PK4YQlUD35rqAyvuEbwWK5mJ+ZMRIyGPODT0I8eFhfAkv9F
 /V+bPuffgS6OgQiryLJBN/b5WMr1dWwLV1IKPd5Jj9/bdXAMUqQcPong+g9yxwgWdnDK
 7MIpswHhqVOCiXYvOsz/dLaD0npb/WiTgWNUm0Dp5vYVgwq59i/dt7j/h51JlvmO78K+
 xdHm012kB8M3gYgTIEBl+KS3/8ErGG4iQ0auG96vmR6MYo6pBE/Ikyv9iTkLTNwF3YX+
 0C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=N+JKQJqwCl0d6bUKiCh0PgpItsPMqUhVfYdVbCoV6oQ=;
 b=qvl5bVoKN6X8ohGrl8FIuGIlT/vlc+Ce0we40Gz7JsEonNVLl3NaNCMZOblgOYWLEx
 s8hGDulU9Is4xAFKNR1pD0A5H2njKbSxiO7bUznzBSOBHUbZufZwV0QML8n8HvxvRP9n
 8DbsayUjkYqekWZU4CIO25ggx2EdUirWz8INV0y2vAzAScZrvxnL0xXymItQtU6chqnu
 oQfdZ3oGd/ELOzHvEuGxR0BofYISVHDgLhT+ofi2PfI/paqAOxLyYmNBA8dbfBbuVk+X
 w2tersfoIcQwfPNoP3s2R6Wv5LWoL0QC0iM7yMyOJxWxyltdMBwb3u/K5dXNgc17bYaM
 7gkQ==
X-Gm-Message-State: AOAM533H0bvtVJgQWo4e7DOdXZ3ZOeq2Dj0EqLdhamqH0DmZV4+ZdWMB
 zwMsH6QuLB44FT9m7cUTcA0=
X-Google-Smtp-Source: ABdhPJzF83cjPp09lpMg1ZcXTznOOTKxL4kSSVgzF9In5JrWzPIbWNFh5lLTX+GfZItdJ9nCriUk+Q==
X-Received: by 2002:a63:5d52:: with SMTP id o18mr11120911pgm.440.1626290695918; 
 Wed, 14 Jul 2021 12:24:55 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id o3sm6548755pjp.27.2021.07.14.12.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:24:55 -0700 (PDT)
Message-ID: <3951d2c425daa7b05e209a6fc8a550c2fca1645f.camel@gmail.com>
Subject: Re: [PATCH v4 10/11] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Date: Wed, 14 Jul 2021 16:25:08 -0300
In-Reply-To: <2e88a275-3379-6f14-3c93-d2919bee2142@ozlabs.ru>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-11-leobras.c@gmail.com>
 <95ac11e9-a709-e0a2-9690-ef13c4a2cd43@ozlabs.ru>
 <5b8676140f495dbbe3e28ce261e449b885dbae66.camel@gmail.com>
 <2e88a275-3379-6f14-3c93-d2919bee2142@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
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

On Wed, 2021-07-14 at 18:38 +1000, Alexey Kardashevskiy wrote:
> >           for (i = 0; i <
> > > > ARRAY_SIZE(pci->phb->mem_resources);
> > > > i++) {
> > > > +                       const unsigned long mask =
> > > > IORESOURCE_MEM_64
> > > > > IORESOURCE_MEM;
> > > > +
> > > > +                       /* Look for MMIO32 */
> > > > +                       if ((pci->phb->mem_resources[i].flags &
> > > > mask)
> > > > == IORESOURCE_MEM)
> > > > +                               break;
> > > 
> > > What if there is no IORESOURCE_MEM? pci->phb-
> > > >mem_resources[i].start
> > > below will have garbage.
> > 
> > 
> > 
> > Yeah, that makes sense. I will add this lines after 'for':
> > 
> > if (i == ARRAY_SIZE(pci->phb->mem_resources)) {
> >   iommu_tce_table_put(newtbl);
> >   goto out_del_list;
> > }
> > 
> > What do you think?
> 
> 
> Move this and that "for" before iommu_pseries_alloc_table() so you
> won't 
> need to free if there is no IORESOURCE_MEM.

Done!

> 
> 
> > 
> > 
> > > 
> > > 
> > > > +               }
> > > > +
> > > > +               _iommu_table_setparms(newtbl, pci->phb->bus-
> > > > >number,
> > > > create.liobn, win_addr,
> > > > +                                     1UL << len, page_shift,
> > > > 0,
> > > > &iommu_table_lpar_multi_ops);
> > > > +               iommu_init_table(newtbl, pci->phb->node, pci-
> > > > >phb-
> > > > > mem_resources[i].start,
> > > > +                                pci->phb-
> > > > >mem_resources[i].end);
> > > > +
> > > > +               if (default_win_removed)
> > > > +                       iommu_tce_table_put(tbl);
> > > 
> > > 
> > > iommu_tce_table_put() should have been called when the window was
> > > removed.
> > > 
> > > Also after some thinking - what happens if there were 2 devices
> > > in the
> > > PE and one requested 64bit DMA? This will only update
> > > set_iommu_table_base() for the 64bit one but not for the other.
> > > 
> > > I think the right thing to do is:
> > > 
> > > 1. check if table[0] is in use, if yes => fail (which this does
> > > already)
> > > 
> > > 2. remove default dma window but keep the iommu_table struct with
> > > one
> > > change - set it_size to 0 (and free it_map) so the 32bit device
> > > won't
> > > look at a stale structure and think there is some window
> > > (imaginery
> > > situation for phyp but easy to recreate in qemu).
> > > 
> > > 3. use table[1] for newly created indirect DDW window.
> > > 
> > > 4. change get_iommu_table_base() to return a usable table (or may
> > > be
> > > not
> > > needed?).
> > > 
> > > If this sounds reasonable (does it?),
> > 
> > Looks ok, I will try your suggestion.
> > I was not aware of how pci->table_group->tables[] worked, so I
> > replaced
> > pci->table_group->tables[0] with the new tbl, while moving the
> > older in
> > pci->table_group->tables[1].
> 
> 
> pci->table_group->tables[0] is window#0 at @0.
> pci->table_group->tables[1] is window#1 at 0x0800.0000.0000.0000.
> That 
> is all :)
> 
> pseries does not use tables[1] but powernv does (by VFIO only
> though).

Thanks! This helped a lot!

> 
> 
> > (4) get_iommu_table_base() does not seem to need update, as it
> > returns
> > the tlb set by set_iommu_table_base() which is already called in
> > the
> > !direct_mapping path in current patch.
> 
> Sounds right.
> 
> > 
> > >   the question is now if you have
> > > time to do that and the hardware to test that, or I'll have to
> > > finish
> > > the work :)
> > 
> > Sorry, for some reason part of this got lost in Evolution mail
> > client.
> > 
> > If possible, I do want to finish this work, and I am talking to IBM
> > Virt people in order to get testing HW.
> 
> 
> Even I struggle to find a powervm machine :)

> 
> > > 
> > > 
> > > > +               else
> > > > +                       pci->table_group->tables[1] = tbl;
> > > 
> > > 
> > > What is this for?
> > 
> > I was thinking of adding the older table to pci->table_group-
> > >tables[1]
> > while keeping the newer table on pci->table_group->tables[0].
> > This did work, but I think your suggestion may work better.
> > 
> > Best regards,
> > Leonardo Bras
> > 
> > 
> 


Thanks a lot for reviewing Alexey!
I will send a v5 soon.
Best regards,

Leonardo Bras

