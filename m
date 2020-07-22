Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD122A32E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 01:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBsPc594qzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 09:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A1cijpiU; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBsMb3mz9zDr49
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 09:37:46 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id d14so3721488qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=H8BbmRX160xyQeVFFIdlPVklsyPOWgbirdL1MMhs52A=;
 b=A1cijpiUtfu4FxFuW41K7F27e5icdy4NAmOps6rIUBiNTdyAQ/pQhZjIiCkL8iJNXx
 J1rdf5hKePDxGJjUR6xQSsJ7sp36kRtPuxWXMNykZmOkBkjyw2fbJZU1Jj9ObC4VFfB9
 rZJRTbAw2TPSSkgLCzqohsZ2QG9TWwJN+soaTTpJ5kiZ5BEIbhCCXdo5PhkVOhSTHlH6
 x9/fLgicxrPczXatLBCAu/sfeC8sqvKv2y/OefXQeGQWsaf/IYt4vB3kzIOf8gwqRTII
 xwpHG9uIqhkr5jRWh6u0tj02tUqRsEnrKe23/Eyxrzk9QoArDOjs+T5VlaYua7a8Hpk7
 l1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=H8BbmRX160xyQeVFFIdlPVklsyPOWgbirdL1MMhs52A=;
 b=jsVST+LIO72G4IZNDt7mLttjPqSn50dLCEnw3eLJRDrlQ5T+dNFbMK93fVQEIAP0GO
 DTTwNl/Wl1QmA/HGVtY6PcZhSDqT6ylfgjPK+RI8gtERj4czfvWfQl+WX7IHQdmKqIyu
 cV0uZnJjcsXAOwptJjfRKiT8v1YhaYx6Dy/KHJnb17jDVvdeYQYETAw69JfPo7p/OozQ
 XnrIIjrrq/2CB/6jQijPY1uN76fjcFORCXdLjahHIu5PTnZ1VTA4a3l1Aw6ieQ6g1DUq
 4ndwibx71nXdDX/uTNUfT1fKG6l7Byjh0qzHz/LfB5PoqKollmd5tyyDnuAdI+H3Dp6u
 vOKQ==
X-Gm-Message-State: AOAM5304dU7l1q4H4CGwDYd6PiZjOcbYRcnJBsHrEnX/hRHIiNOTE3s6
 xH6pDccFoj2yEJnGtzvbI/Y=
X-Google-Smtp-Source: ABdhPJxUn3wK41CBa+sKu5oWixw9j3f8UMBn8EM27juDma3YS+Ar9XmjwiziY9s5nsJoVr1BNeg/Uw==
X-Received: by 2002:a37:4048:: with SMTP id n69mr2386577qka.421.1595461063336; 
 Wed, 22 Jul 2020 16:37:43 -0700 (PDT)
Received: from LeoBras (179-125-153-225.dynamic.desktop.com.br.
 [179.125.153.225])
 by smtp.gmail.com with ESMTPSA id c70sm1126936qke.109.2020.07.22.16.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 16:37:42 -0700 (PDT)
Message-ID: <396d343962bb4e3b845bab4f46721a5ebed39cf6.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] powerpc/iommu: Move iommu_table cleaning routine
 to iommu_table_clean
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>
Date: Wed, 22 Jul 2020 20:37:36 -0300
In-Reply-To: <dd26d682-f013-763d-3a92-6d99633c6175@ozlabs.ru>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-6-leobras.c@gmail.com>
 <51235292-a571-8792-c693-d0dc6faeb21c@ozlabs.ru>
 <0f4c2d84d0958e98e7ada53c25750fe548cadf0b.camel@gmail.com>
 <dd26d682-f013-763d-3a92-6d99633c6175@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-07-22 at 11:28 +1000, Alexey Kardashevskiy wrote:
> 
> On 22/07/2020 08:13, Leonardo Bras wrote:
> > On Tue, 2020-07-21 at 14:59 +1000, Alexey Kardashevskiy wrote:
> > > On 16/07/2020 17:16, Leonardo Bras wrote:
> > > > Move the part of iommu_table_free() that does struct iommu_table cleaning
> > > > into iommu_table_clean, so we can invoke it separately.
> > > > 
> > > > This new function is useful for cleaning struct iommu_table before
> > > > initializing it again with a new DMA window, without having it freed and
> > > > allocated again.
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > > ---
> > > >  arch/powerpc/kernel/iommu.c | 30 ++++++++++++++++++------------
> > > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > > > index 9704f3f76e63..c3242253a4e7 100644
> > > > --- a/arch/powerpc/kernel/iommu.c
> > > > +++ b/arch/powerpc/kernel/iommu.c
> > > > @@ -735,21 +735,10 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
> > > >  	return tbl;
> > > >  }
> > > >  
> > > > -static void iommu_table_free(struct kref *kref)
> > > > +static void iommu_table_clean(struct iommu_table *tbl)
> > > 
> > > iommu_table_free() + iommu_init_table() + set_iommu_table_base() should
> > > work too, why new helper?
> > 
> > iommu_table_free() also frees the tbl, which would need allocate it
> > again (new address) and to fill it up again, unnecessarily. 
> 
> It is a new table in fact, everything is new there. You are only saving
> kfree+kzalloc which does not seem a huge win.
> 
> Also, iommu_table_update() simply assumes 64bit window by passing
> res_start=res_end=0 to iommu_init_table() which is not horribly robust
> either. Yeah, I know, iommu_init_table() is always called with zeroes in
> pseries but this is somewhat ok as those tables are from the device tree
> and those windows don't overlap with 32bit MMIO but under KVM they will
> (well, if we hack QEMU to advertise a single window).
> 
> I suggest removing iommu_pseries_table_update() from 6/7 and do
> iommu_table_free() + iommu_init_table() + set_iommu_table_base() with a
> WARN_ON(pdev->dev.archdata.dma_offset>=SZ_4G), may be even do this all
> in enable_ddw() where we know for sure if it is 1:1 mapping or just a
> big window.

Sure, I have yet to understand the full impact of this change, but I
will implement this and give it a try.

> 
> Out of curiosity - what page sizes does pHyp advertise in "query"?

64kB (page shift 0x10)

> 
> 
> > I think it's a better approach to only change what is needed.
> > 
> > > There is also iommu_table_clear() which does a different thing so you
> > > need a better name.
> > 
> > I agree.
> > I had not noticed this other function before sending the patchset. What
> > would be a better name though? __iommu_table_free()? 
> > 
> > > Second, iommu_table_free
> > > use and it would be ok as we would only see this when hot-unplugging a
> > > PE because we always kept the default window.
> > > Btw you must be seeing these warnings now every time you create DDW with
> > > these patches as at least the first page is reserved, do not you?
> > 
> > It does not print a warning.
> > I noticed other warnings,
> 
> And what are these?

tce_freemulti_pSeriesLP: plpar_tce_stuff failed
[...]

It's regarding the change in pagesize. 
Some places have the tceshift hardcoded as 12, tce_freemulti_pSeriesLP
is one of them, and that is causing some errors.

I wrote a patch fixing this, and I will include it in the next series.

> 
> > but not this one from iommu_table_free():
> > /* verify that table contains no entries */
> > if (!bitmap_empty(tbl->it_ma
> > p, tbl->it_size))
> > 	pr_warn("%s: Unexpected TCEs\n", __func__);
> > 
> > Before that, iommu_table_release_pages(tbl) is supposed to clear the 
> > bitmap, so this only tests for a tce that is created in this short period.
> 
> iommu_table_release_pages() only clears reserved pages - page 0 (just a
> protection against NULL DMA pointers) and 32bit MMIO (these should not
> be set for 64bit window). The "%s: Unexpected TCEs\n" is what checks for
> actual mapped TCEs.
> 

Oh, I haven't noticed that. Thanks for pointing!

> > > Since we are replacing a table for a device which is still in the
> > > system, we should not try messing with its DMA if it already has
> > > mappings so the warning should become an error preventing DDW. It is
> > > rather hard to trigger in practice but I could hack a driver to ask for
> > > 32bit DMA mask first, map few pages and then ask for 64bit DMA mask, it
> > > is not illegal, I think. So this needs a new helper - "bool
> > > iommu_table_in_use(tbl)" - to use in enable_ddw(). Or I am overthinking
> > > this?... Thanks,
> > 
> > As of today, there seems to be nothing like that happening in the
> > driver I am testing. 
> > I spoke to Brian King on slack, and he mentioned that at the point DDW
> > is created there should be no allocations in place.
> 
> Correct, there should not be. But it is also not a huge effort to fall
> back if there are.

True.

> 
> > But I suppose some driver could try to do this.
> > 
> > Maybe a better approach would be removing the mapping only if the
> > default window is removed (at the end of enable_ddw, as an else to
> > resetting the default DMA window), and having a way to add more
> > mappings to those pools. But this last part doesn't look so simple, and
> > it would be better to understand if it's necessary investing work in
> > this.
> > 
> > What do you think?
> 
> Add iommu_table_in_use(tbl) and fail DDW if that says "yes".

Seems good, I will include that on the next patchset.

Still, I will try to implement that more complex approach in a future
patchset, as it may come to be useful.

Thank you for the feedback!

