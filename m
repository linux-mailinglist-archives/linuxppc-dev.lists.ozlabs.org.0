Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D22561AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 21:57:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdVk02nDbzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 05:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ACBUpLaE; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdVhB36WyzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 05:55:37 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id j10so190935qvo.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=o36Cmr3OXJRZce0uBQNiBVYMiMoOxeo0YMfigbFdEdo=;
 b=ACBUpLaE0lbdBO+MnjckyQnvzPNXul4bx+ZnJUyXquia/RquuXx0k/zhf/enUJ9TuF
 /qY8kAJksifVdcveboVRaQ4bB7cU87H+Z8fMOGqqjysDKn0UaiCYo360+ukJwBLiCtry
 E2TgQxvtgRbAMMzCPiPHE4zJai2+Nlh843HqcrSsNx8Ao1xdvq+HNzjlCQX1zS1QC/Rn
 fjIzUGGOXUWcDimqJVTUjYprlc91fINI5S4FQV7InogjGk4wJoDFz6Sb8uOH1fExbUFQ
 lgBXeQl+QPS3LeY9RajrKzrVOrtdJ5/Fi6EVn0CHAePp0We7MaqJzcfYJnlJi68l1Zs0
 PDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=o36Cmr3OXJRZce0uBQNiBVYMiMoOxeo0YMfigbFdEdo=;
 b=H68Kc57lpl58hQbJH2iMZF4SBBUNNwTU2SsEkdF/rkjBGx0pmm1bjxAWv0UfSRmv7V
 y+GZA2IxdvcEhSKfTFy5ODE1ad6Cu3UGYBG/n2IRnwfoEpxlHPyuXArkO+9KiUMACaiN
 3w5GD8MsFdQeCsBRuS3BjZLCbjH7AeRm+hhDP+mPG4G2Hzr1lJGjIIqvGy9IRlSdiE+S
 iC6tJ6QdjCOlP2Ulun5rAnPbptFd/YwXbMbOdbXxp6dmqNsPW85arKo99eHIpRGhZcQY
 nvw6jkM8YEthqGqEe486wuSuAzfq++FSgtv1aXo3O1ybZs0feuFL6gd/ZNV7Gg2eWcm+
 RrRg==
X-Gm-Message-State: AOAM531bS/crCTMJffFTPxz/KS1AbBPDjIC4QptdIlzLsp7Q++3f/ENa
 RDMZe/Egy56jMp1PVP9QwdI=
X-Google-Smtp-Source: ABdhPJy+1wXwwXL37YnXQ0Wc+ya5tWXF5b4c/zouuVbAKyu5qc5wQZhg+IWmw+TtRRA9WBAGHB/F8g==
X-Received: by 2002:a05:6214:954:: with SMTP id
 dn20mr199304qvb.122.1598644533555; 
 Fri, 28 Aug 2020 12:55:33 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id z10sm150980qtb.17.2020.08.28.12.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 12:55:32 -0700 (PDT)
Message-ID: <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
Subject: Re: [PATCH v1 01/10] powerpc/pseries/iommu: Replace hard-coded page
 shift
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,  Joel Stanley <joel@jms.id.au>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,  Brian
 King <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini
 <muvic@linux.ibm.com>, David Dai <zdai@linux.vnet.ibm.com>
Date: Fri, 28 Aug 2020 16:55:25 -0300
In-Reply-To: <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
 <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
 <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
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

On Fri, 2020-08-28 at 12:27 +1000, Alexey Kardashevskiy wrote:
> 
> On 28/08/2020 01:32, Leonardo Bras wrote:
> > Hello Alexey, thank you for this feedback!
> > 
> > On Sat, 2020-08-22 at 19:33 +1000, Alexey Kardashevskiy wrote:
> > > > +#define TCE_RPN_BITS		52		/* Bits 0-51 represent RPN on TCE */
> > > 
> > > Ditch this one and use MAX_PHYSMEM_BITS instead? I am pretty sure this
> > > is the actual limit.
> > 
> > I understand this MAX_PHYSMEM_BITS(51) comes from the maximum physical memory addressable in the machine. IIUC, it means we can access physical address up to (1ul << MAX_PHYSMEM_BITS). 
> > 
> > This 52 comes from PAPR "Table 9. TCE Definition" which defines bits
> > 0-51 as the RPN. By looking at code, I understand that it means we may input any address < (1ul << 52) to TCE.
> > 
> > In practice, MAX_PHYSMEM_BITS should be enough as of today, because I suppose we can't ever pass a physical page address over 
> > (1ul << 51), and TCE accepts up to (1ul << 52).
> > But if we ever increase MAX_PHYSMEM_BITS, it doesn't necessarily means that TCE_RPN_BITS will also be increased, so I think they are independent values. 
> > 
> > Does it make sense? Please let me know if I am missing something.
> 
> The underlying hardware is PHB3/4 about which the IODA2 Version 2.4
> 6Apr2012.pdf spec says:
> 
> "The number of most significant RPN bits implemented in the TCE is
> dependent on the max size of System Memory to be supported by the platform".
> 
> IODA3 is the same on this matter.
> 
> This is MAX_PHYSMEM_BITS and PHB itself does not have any other limits
> on top of that. So the only real limit comes from MAX_PHYSMEM_BITS and
> where TCE_RPN_BITS comes from exactly - I have no idea.

Well, I created this TCE_RPN_BITS = 52 because the previous mask was a
hardcoded 40-bit mask (0xfffffffffful), for hard-coded 12-bit (4k)
pagesize, and on PAPR+/LoPAR also defines TCE as having bits 0-51
described as RPN, as described before.

IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figure 3.4 and 3.5.
shows system memory mapping into a TCE, and the TCE also has bits 0-51
for the RPN (52 bits). "Table 3.6. TCE Definition" also shows it.

In fact, by the looks of those figures, the RPN_MASK should always be a
52-bit mask, and RPN = (page >> tceshift) & RPN_MASK.

Maybe that's it?

> 
> 
> > > 
> > > > +#define TCE_RPN_MASK(ps)	((1ul << (TCE_RPN_BITS - (ps))) - 1)
> > > >  #define TCE_VALID		0x800		/* TCE valid */
> > > >  #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
> > > >  #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
> > > > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > > > index e4198700ed1a..8fe23b7dff3a 100644
> > > > --- a/arch/powerpc/platforms/pseries/iommu.c
> > > > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > > > @@ -107,6 +107,9 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
> > > >  	u64 proto_tce;
> > > >  	__be64 *tcep;
> > > >  	u64 rpn;
> > > > +	const unsigned long tceshift = tbl->it_page_shift;
> > > > +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
> > > > +	const u64 rpn_mask = TCE_RPN_MASK(tceshift);
> > > 
> > > Using IOMMU_PAGE_SIZE macro for the page size and not using
> > > IOMMU_PAGE_MASK for the mask - this incosistency makes my small brain
> > > explode :) I understand the history but maaaaan... Oh well, ok.
> > > 
> > 
> > Yeah, it feels kind of weird after two IOMMU related consts. :)
> > But sure IOMMU_PAGE_MASK() would not be useful here :)
> > 
> > And this kind of let me thinking:
> > > > +		rpn = __pa(uaddr) >> tceshift;
> > > > +		*tcep = cpu_to_be64(proto_tce | (rpn & rpn_mask) << tceshift);
> > Why not:
> > 	rpn_mask =  TCE_RPN_MASK(tceshift) << tceshift;
> 
> A mask for a page number (but not the address!) hurts my brain, masks
> are good against addresses but numbers should already have all bits
> adjusted imho, may be it is just me :-/
> 
> 
> > 	
> > 	rpn = __pa(uaddr) & rpn_mask;
> > 	*tcep = cpu_to_be64(proto_tce | rpn)
> > 
> > I am usually afraid of changing stuff like this, but I think it's safe.
> > 
> > > Good, otherwise. Thanks,
> > 
> > Thank you for reviewing!
> >  
> > 
> > 

