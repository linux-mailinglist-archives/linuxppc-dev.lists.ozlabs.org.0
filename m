Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B535E965
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 01:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKh295vxlz3bvQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 09:02:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m5k6vOAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m5k6vOAM; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKh1j1DSNz302p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 09:01:44 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id o5so19710080qkb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=OCkP5AHNiha8/R6QxJA+sGxnbipzDLqBjSi74rMzmhI=;
 b=m5k6vOAMSVU72Sbi3nQga0F/+zWR9gTQqmKtYegyoeGD+ZSwPHVG5v/5pmy3YuZETs
 0UQsiULdSNiSadB1rPqgJa7bYRo/qf1aR2Jt3uptNQZk0GYw4fQibM7rkhfRFaJL/pUv
 EnpfKRkC4wck93yXrYGEr0qxW/Ywo40244JUBN2g+BIXFaK/MQ/PRNYeeFf5QUbzldGr
 GavFssbDjpDD9eAAFvyxuovtlCc4BldO4Lc9ldYQD7Yglct3j/x+X1LHSrF/TJmz0+A1
 B3oqKODF5xY2ozT3zNg+8xYi56OcigWfgrKh1i7Xii2WF2Ou1qqqOj1iD9F2IquhZ/r1
 JDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=OCkP5AHNiha8/R6QxJA+sGxnbipzDLqBjSi74rMzmhI=;
 b=PFppFAUpdMG7p//4qBgxM/csf9T8zR+KfEeDvmY1BVLkx5l4CVXm5gGQFXzobqiO0H
 BN/3Kjq0pV+NTCUNRocn7/HCKfitpN1DJZhBn2eDF5oNhLP2RMeTp0t2Ri6f9NESqF8l
 HnVwbfJ9+PowGlzMAv9Nt59CS2hCQOWzT/2SD7H6+NfpIc3zfAfkOwtwgw6+ybuKSuUL
 dLdeST8kMxxRlt1TxtTR5H+6lfI3jNKR/1PqYJ0tKP7m/hEu7+07d3sKbHynM+rPKpU2
 AiGhuOxfCFZuKNEcL1JlzVkWQIjgZSztJzTFcastzBApQb+dyCVwBV8oceKzAYCX+FDb
 zq8w==
X-Gm-Message-State: AOAM532086uyWYMFIdFTorzPQLTriAphpHuYgaf+JDug/mnDvvQwCaKK
 0WIpX14JxgYdM7YcKcUr2+M=
X-Google-Smtp-Source: ABdhPJyvJaUtoclmLCPQ17y6gqmkxTML9nSi3QpiLjQ1p24d6Z/J1GnGRx8q1SKkrVwMGAUCrWKCQA==
X-Received: by 2002:a37:a2c3:: with SMTP id l186mr3476447qke.495.1618354900224; 
 Tue, 13 Apr 2021 16:01:40 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id o189sm1960630qka.86.2021.04.13.16.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 16:01:39 -0700 (PDT)
Message-ID: <108c6fa11f0037bd4379fe28a11f3a16e624bc63.camel@gmail.com>
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 13 Apr 2021 20:01:34 -0300
In-Reply-To: <5d7c85a1-967c-9ad3-e984-bd57fca3cb77@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
 <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
 <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
 <e8789bb568c9cae99f07b1e6021f85c39d92f7ea.camel@gmail.com>
 <e518d514-5f76-c88f-d38e-fb8a46a41597@ozlabs.ru>
 <7e2a7e3abb4e7df492fcb4209e7b1f2021ff17c5.camel@gmail.com>
 <5d7c85a1-967c-9ad3-e984-bd57fca3cb77@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-04-13 at 18:24 +1000, Alexey Kardashevskiy wrote:
> 
> On 13/04/2021 17:58, Leonardo Bras wrote:
> > On Tue, 2021-04-13 at 17:41 +1000, Alexey Kardashevskiy wrote:
> > > 
> > > On 13/04/2021 17:33, Leonardo Bras wrote:
> > > > On Tue, 2021-04-13 at 17:18 +1000, Alexey Kardashevskiy wrote:
> > > > > 
> > > > > On 13/04/2021 15:49, Leonardo Bras wrote:
> > > > > > Thanks for the feedback!
> > > > > > 
> > > > > > On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> > > > > > > > -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> > > > > > > > +static phys_addr_t ddw_memory_hotplug_max(void)
> > > > > > > 
> > > > > > > 
> > > > > > > Please, forward declaration or a separate patch; this creates
> > > > > > > unnecessary noise to the actual change.
> > > > > > > 
> > > > > > 
> > > > > > Sure, done!
> > > > > > 
> > > > > > > 
> > > > > > > > +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
> > > > > > > > +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> > > > > > > > +		iommu_init_table(tbl, pci->phb->node, 0, 0);
> > > > > > > 
> > > > > > > 
> > > > > > > It is 0,0 only if win_addr>0 which is not the QEMU case.
> > > > > > > 
> > > > > > 
> > > > > > Oh, ok.
> > > > > > I previously though it was ok to use 0,0 here as any other usage in
> > > > > > this file was also 0,0.
> > > > > > 
> > > > > > What should I use to get the correct parameters? Use the previous tbl
> > > > > > it_reserved_start and tbl->it_reserved_end is enough?
> > > > > 
> > > > > depends on whether you carry reserved start/end even if they are outside
> > > > > of the dma window.
> > > > > 
> > > > 
> > > > Oh, that makes sense.
> > > > On a previous patch (5/14 IIRC), I changed the behavior to only store
> > > > the valid range on tbl, but now I understand why it's important to
> > > > store the raw value.
> > > > 
> > > > Ok, I will change it back so the reserved range stays in tbl even if it
> > > > does not intersect with the DMA window. This way I can reuse the values
> > > > in case of indirect mapping with DDW.
> > > > 
> > > > Is that ok? Are the reserved values are supposed to stay the same after
> > > > changing from Default DMA window to DDW?
> > > 
> > > I added them to know what bits in it_map to ignore when checking if
> > > there is any active user of the table. If you have non zero reserved
> > > start/end but they do not affect it_map, then it is rather weird way to
> > > carry reserved start/end from DDW to no-DDW.
> > > 
> > 
> > Ok, agreed.
> > 
> > >   May be do not set these at
> > > all for DDW with window start at 1<<59 and when going back to no-DDW (or
> > > if DDW starts at 0) - just set them from MMIO32, just as they are
> > > initialized in the first place.
> > > 
> > 
> > If I get it correctly from pci_of_scan.c, MMIO32 = {0, 32MB}, is that
> > correct?
> 
> No, under QEMU it is 0x8000.0000-0x1.0000.0000:
> 
> /proc/device-tree/pci@800000020000000/ranges
> 
> 7 cells for each resource, the second one is MMIO32 (the first is IO 
> ports, the last is 64bit MMIO).
> > 
> > So, if DDW starts at any value in this range (most probably at zero),
> > we should remove the rest, is that correct?
> > 
> > Could it always use iommu_init_table(..., 0, 32MB) here, so it always
> > reserve any part of the DMA window that's in this range? Ot there may
> > be other reserved values range?
> > 
> > > and when going back to no-DDW
> > 
> > After iommu_init_table() there should be no failure, so it looks like
> > there is no 'going back to no-DDW'. Am I missing something?
> 
> Well, a random driver could request 32bit DMA and if the new window is 
> 1:1, then it would break but this does not seem to happen and we do not 
> support it anyway so no loss here.
> 

So you would recommend reading "ranges" with of_get_property() and
using the second entry (cells 7 - 13) in this point, get base & size to
make sure it does not map anything here? (should have no effect if the
value does not intersect with the DMA window)

Thank you for reviewing!
Leonardo Bras

