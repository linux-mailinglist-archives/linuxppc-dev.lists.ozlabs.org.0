Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAB35D97B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 09:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJ056zsqz3byf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 17:59:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ld8uha2M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ld8uha2M; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKHzf62bJz2xdL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 17:58:37 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id f12so12068066qtf.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=d+GybzXqZcJwe47I0NMFUGTYtUTAR10GNWt1L3a/IC0=;
 b=Ld8uha2MZxm/06eIlfkjLI09QGhLFnciaOy/brRvR/FzGEG42G/AwVYGCX6tIjCG1o
 AM8bqERHjxoDhladQrh3FlUjA5d1cRbBAxWbiDxXxQdL9v5MCQ93KDyjKd+reZqbjT/z
 YaUOgcVukHVjhtWzw2oM3Iu/veCV0cwAn84tWzCJxBgpKKwX5NMBTbProyzUYTJNrzct
 I0EiyBLnz8X4KKhpMfYrrt0VIv1lYwQkzuIKVPge/GNZOe/QF92rVOMYUtvxpWDo5pd8
 0BymsHzBYfzh6WdS/aOLrBLkOQ2VOjPv6HGKo7X47GsRhSwImnBCFPDZdxJWZjFKZe96
 HMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=d+GybzXqZcJwe47I0NMFUGTYtUTAR10GNWt1L3a/IC0=;
 b=VlqVqf4dy9DdlwmEWfIvH4AW8Z6GUTdXzcjna6/UtIG64TA3ypXIFZw/WALnwPlYPj
 zk6XkNZYYTkYoAMESP9Mr2II/cDNuKpW2hdeQ7JWs6EfA4bXo/feeoNGBxpJV4MXKvzj
 jzNL3EuMtU8s14ttAwM8sApI84z3ZgiqYwQyCCAoZ4ReFdbg9dPWZaaa7O8xE3WCSIZU
 frCf/GW+6xvhR1sWvh6ZmiTTFMOggL3zZRKHxsYP27v4/AnX29rdHZ5biLQEnjbw1pBN
 Y6THO3qpFUkzsxSzsilEc8VsP7Vx52wnBnR7rcZrojJSFNSD+TKXRspHDLbEraMlNmAB
 yLzQ==
X-Gm-Message-State: AOAM532Kl3MwoZChx7fFOrzCWizjiB1FPguw9UIHLWqehC3dbfrnBkOW
 KyenTD9BW25Qc6LLEaD4Fzo=
X-Google-Smtp-Source: ABdhPJzsVuA0BLzyyU8UzrJ9R0QJwb4aCAkIuzW8lkSHVRhwZhFBZNDp8iYGkcSAui6jX6sDp8MQNQ==
X-Received: by 2002:ac8:70da:: with SMTP id g26mr11935478qtp.229.1618300714258; 
 Tue, 13 Apr 2021 00:58:34 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id 62sm4008281qtg.70.2021.04.13.00.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:58:33 -0700 (PDT)
Message-ID: <7e2a7e3abb4e7df492fcb4209e7b1f2021ff17c5.camel@gmail.com>
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
Date: Tue, 13 Apr 2021 04:58:29 -0300
In-Reply-To: <e518d514-5f76-c88f-d38e-fb8a46a41597@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
 <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
 <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
 <e8789bb568c9cae99f07b1e6021f85c39d92f7ea.camel@gmail.com>
 <e518d514-5f76-c88f-d38e-fb8a46a41597@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2021-04-13 at 17:41 +1000, Alexey Kardashevskiy wrote:
> 
> On 13/04/2021 17:33, Leonardo Bras wrote:
> > On Tue, 2021-04-13 at 17:18 +1000, Alexey Kardashevskiy wrote:
> > > 
> > > On 13/04/2021 15:49, Leonardo Bras wrote:
> > > > Thanks for the feedback!
> > > > 
> > > > On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> > > > > > -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> > > > > > +static phys_addr_t ddw_memory_hotplug_max(void)
> > > > > 
> > > > > 
> > > > > Please, forward declaration or a separate patch; this creates
> > > > > unnecessary noise to the actual change.
> > > > > 
> > > > 
> > > > Sure, done!
> > > > 
> > > > > 
> > > > > > +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
> > > > > > +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
> > > > > > +		iommu_init_table(tbl, pci->phb->node, 0, 0);
> > > > > 
> > > > > 
> > > > > It is 0,0 only if win_addr>0 which is not the QEMU case.
> > > > > 
> > > > 
> > > > Oh, ok.
> > > > I previously though it was ok to use 0,0 here as any other usage in
> > > > this file was also 0,0.
> > > > 
> > > > What should I use to get the correct parameters? Use the previous tbl
> > > > it_reserved_start and tbl->it_reserved_end is enough?
> > > 
> > > depends on whether you carry reserved start/end even if they are outside
> > > of the dma window.
> > > 
> > 
> > Oh, that makes sense.
> > On a previous patch (5/14 IIRC), I changed the behavior to only store
> > the valid range on tbl, but now I understand why it's important to
> > store the raw value.
> > 
> > Ok, I will change it back so the reserved range stays in tbl even if it
> > does not intersect with the DMA window. This way I can reuse the values
> > in case of indirect mapping with DDW.
> > 
> > Is that ok? Are the reserved values are supposed to stay the same after
> > changing from Default DMA window to DDW?
> 
> I added them to know what bits in it_map to ignore when checking if 
> there is any active user of the table. If you have non zero reserved 
> start/end but they do not affect it_map, then it is rather weird way to 
> carry reserved start/end from DDW to no-DDW.
> 

Ok, agreed.

>  May be do not set these at 
> all for DDW with window start at 1<<59 and when going back to no-DDW (or 
> if DDW starts at 0) - just set them from MMIO32, just as they are 
> initialized in the first place.
> 

If I get it correctly from pci_of_scan.c, MMIO32 = {0, 32MB}, is that
correct?

So, if DDW starts at any value in this range (most probably at zero),
we should remove the rest, is that correct?

Could it always use iommu_init_table(..., 0, 32MB) here, so it always
reserve any part of the DMA window that's in this range? Ot there may
be other reserved values range?

> and when going back to no-DDW 

After iommu_init_table() there should be no failure, so it looks like
there is no 'going back to no-DDW'. Am I missing something?

Thanks for helping!

Best regards,
Leonardo Bras

