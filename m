Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63927D5C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 20:27:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C17D02L7zzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Sep 2020 04:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dATiqfln; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C179v6hdCzDq94
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Sep 2020 04:25:53 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id k25so4364123qtu.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=05cLe8W7f65PxgqgOnTUp2uE8/rLO8IRAl4FV6s+OwQ=;
 b=dATiqflnNbbqjm4fByvH+cqk6xVbnCICTeSqWCAcyhgTpgp4lzZ1as2bi+ul1UGisn
 SlmMnbU/kt74de166GxUYbcJa+ygQwPOHI3ECv5/48DD1a9gMyuKJpSbbfkGwQlHiDJI
 3NF5Tv0YrpWEKmjS6ESDi0rCBWnG6NC9+xaT99xc+CZidc5K/DnmoDeDMeaEJxcRgYe4
 gUzOfow9BavvXpFm1S1YJRKhzLSOEFK1do2TF9VatE7FunqjH2Imj9RoYxx7573XgWm4
 Zv+Xb7ye0cHng/u33W0TNgChYXb9jFfhYkW3G0IphaO5v0xTlsE5Lah7XYWUhQC3iMpq
 kA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=05cLe8W7f65PxgqgOnTUp2uE8/rLO8IRAl4FV6s+OwQ=;
 b=Zh/oDFfwJZyjBOUJJ6K7GKUetmdwOjRfCzl51C31Gp86xkvJwH0cQ1auwZrrIFO6rj
 e6o1VA40RrvnH1WO3aGEsPmDhPPpmIBs9aS+6TnAERL5QuPgeGIAl0T+86FsYBmEA33f
 P0hzTWU2iiklLawIwajQzwvfxwH+UhUAEpXnxSV/FoHT/Yv8G8AET6Q7l/UXmlsMnra+
 s0ut68FkpHKKrUb9udxxnypaLMc2U+2jl8E14pH/S2ukyU2L0mfN06taVZMNzE/EHz/+
 wdyuUmjQulpfFzOBQx3TGyF/hnJFML6LxvZaZwJGbIhiqqHqxQmRc+WaX5kuNbbbjtY5
 fI8A==
X-Gm-Message-State: AOAM532TG/w+zqw/H0FRab21m8gQjS1DrjO+hdkpR5g9MD6DL9LMsibz
 jBD2ONMmmRMgMffJTHMBjxQ=
X-Google-Smtp-Source: ABdhPJwOmtBzpslEFduFI0XK8hZxJVbqo2SX3zOX867XVixoamBOBHGwepdLc9VNxarL6IcQzZxwwg==
X-Received: by 2002:ac8:19e9:: with SMTP id s38mr4764285qtk.248.1601403949638; 
 Tue, 29 Sep 2020 11:25:49 -0700 (PDT)
Received: from LeoBras (179-125-141-251.dynamic.desktop.com.br.
 [179.125.141.251])
 by smtp.gmail.com with ESMTPSA id m6sm5338544qkh.106.2020.09.29.11.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:25:48 -0700 (PDT)
Message-ID: <9c24dbb473c1f737f327a2d606f2f93e48019b92.camel@gmail.com>
Subject: Re: [PATCH v2 01/14] powerpc/pseries/iommu: Replace hard-coded page
 shift
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Tue, 29 Sep 2020 15:25:42 -0300
In-Reply-To: <5c23f1f9-4cb5-be24-3064-258c0f68c77c@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-2-leobras.c@gmail.com>
 <5c23f1f9-4cb5-be24-3064-258c0f68c77c@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> 
> On 12/09/2020 03:07, Leonardo Bras wrote:
> > Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> 
> These normally go right before "signed-off-by".
> 

Yeah, it looks like something went wrong between git format-patch and
git send-email. I will look for in in the next series.

> 
> > Some functions assume IOMMU page size can only be 4K (pageshift == 12).
> > Update them to accept any page size passed, so we can use 64K pages.
> > 
> > In the process, some defines like TCE_SHIFT were made obsolete, and then
> > removed.
> > 
> > IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figures 3.4 and 3.5 show
> > a RPN of 52-bit, and considers a 12-bit pageshift, so there should be
> > no need of using TCE_RPN_MASK, which masks out any bit after 40 in rpn.
> > It's usage removed from tce_build_pSeries(), tce_build_pSeriesLP(), and
> > tce_buildmulti_pSeriesLP().
> > 
> > Most places had a tbl struct, so using tbl->it_page_shift was simple.
> > tce_free_pSeriesLP() was a special case, since callers not always have a
> > tbl struct, so adding a tceshift parameter seems the right thing to do.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks for reviewing!

> 
> 
> > ---
> >   arch/powerpc/include/asm/tce.h         |  8 ------
> >   arch/powerpc/platforms/pseries/iommu.c | 39 +++++++++++++++-----------
> >   2 files changed, 23 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/tce.h b/arch/powerpc/include/asm/tce.h
> > index db5fc2f2262d..0c34d2756d92 100644
> > --- a/arch/powerpc/include/asm/tce.h
> > +++ b/arch/powerpc/include/asm/tce.h
> > @@ -19,15 +19,7 @@
> >   #define TCE_VB			0
> >   #define TCE_PCI			1
> >   
> > -/* TCE page size is 4096 bytes (1 << 12) */
> > -
> > -#define TCE_SHIFT	12
> > -#define TCE_PAGE_SIZE	(1 << TCE_SHIFT)
> > -
> >   #define TCE_ENTRY_SIZE		8		/* each TCE is 64 bits */
> > -
> > -#define TCE_RPN_MASK		0xfffffffffful  /* 40-bit RPN (4K pages) */
> > -#define TCE_RPN_SHIFT		12
> >   #define TCE_VALID		0x800		/* TCE valid */
> >   #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
> >   #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index e4198700ed1a..9db3927607a4 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -107,6 +107,8 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
> >   	u64 proto_tce;
> >   	__be64 *tcep;
> >   	u64 rpn;
> > +	const unsigned long tceshift = tbl->it_page_shift;
> > +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
> >   
> >   	proto_tce = TCE_PCI_READ; // Read allowed
> >   
> > @@ -117,10 +119,10 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
> >   
> >   	while (npages--) {
> >   		/* can't move this out since we might cross MEMBLOCK boundary */
> > -		rpn = __pa(uaddr) >> TCE_SHIFT;
> > -		*tcep = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
> > +		rpn = __pa(uaddr) >> tceshift;
> > +		*tcep = cpu_to_be64(proto_tce | rpn << tceshift);
> >   
> > -		uaddr += TCE_PAGE_SIZE;
> > +		uaddr += pagesize;
> >   		tcep++;
> >   	}
> >   	return 0;
> > @@ -146,7 +148,7 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
> >   	return be64_to_cpu(*tcep);
> >   }
> >   
> > -static void tce_free_pSeriesLP(unsigned long liobn, long, long);
> > +static void tce_free_pSeriesLP(unsigned long liobn, long, long, long);
> >   static void tce_freemulti_pSeriesLP(struct iommu_table*, long, long);
> >   
> >   static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
> > @@ -166,12 +168,12 @@ static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
> >   		proto_tce |= TCE_PCI_WRITE;
> >   
> >   	while (npages--) {
> > -		tce = proto_tce | (rpn & TCE_RPN_MASK) << tceshift;
> > +		tce = proto_tce | rpn << tceshift;
> >   		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, tce);
> >   
> >   		if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
> >   			ret = (int)rc;
> > -			tce_free_pSeriesLP(liobn, tcenum_start,
> > +			tce_free_pSeriesLP(liobn, tcenum_start, tceshift,
> >   			                   (npages_start - (npages + 1)));
> >   			break;
> >   		}
> > @@ -205,10 +207,11 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >   	long tcenum_start = tcenum, npages_start = npages;
> >   	int ret = 0;
> >   	unsigned long flags;
> > +	const unsigned long tceshift = tbl->it_page_shift;
> >   
> >   	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_PUT_TCE_IND)) {
> >   		return tce_build_pSeriesLP(tbl->it_index, tcenum,
> > -					   tbl->it_page_shift, npages, uaddr,
> > +					   tceshift, npages, uaddr,
> >   		                           direction, attrs);
> >   	}
> >   
> > @@ -225,13 +228,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >   		if (!tcep) {
> >   			local_irq_restore(flags);
> >   			return tce_build_pSeriesLP(tbl->it_index, tcenum,
> > -					tbl->it_page_shift,
> > +					tceshift,
> >   					npages, uaddr, direction, attrs);
> >   		}
> >   		__this_cpu_write(tce_page, tcep);
> >   	}
> >   
> > -	rpn = __pa(uaddr) >> TCE_SHIFT;
> > +	rpn = __pa(uaddr) >> tceshift;
> >   	proto_tce = TCE_PCI_READ;
> >   	if (direction != DMA_TO_DEVICE)
> >   		proto_tce |= TCE_PCI_WRITE;
> > @@ -245,12 +248,12 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >   		limit = min_t(long, npages, 4096/TCE_ENTRY_SIZE);
> >   
> >   		for (l = 0; l < limit; l++) {
> > -			tcep[l] = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
> > +			tcep[l] = cpu_to_be64(proto_tce | rpn << tceshift);
> >   			rpn++;
> >   		}
> >   
> >   		rc = plpar_tce_put_indirect((u64)tbl->it_index,
> > -					    (u64)tcenum << 12,
> > +					    (u64)tcenum << tceshift,
> >   					    (u64)__pa(tcep),
> >   					    limit);
> >   
> > @@ -277,12 +280,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >   	return ret;
> >   }
> >   
> > -static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long npages)
> > +static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
> > +			       long npages)
> >   {
> >   	u64 rc;
> >   
> >   	while (npages--) {
> > -		rc = plpar_tce_put((u64)liobn, (u64)tcenum << 12, 0);
> > +		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, 0);
> >   
> >   		if (rc && printk_ratelimit()) {
> >   			printk("tce_free_pSeriesLP: plpar_tce_put failed. rc=%lld\n", rc);
> > @@ -301,9 +305,11 @@ static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long n
> >   	u64 rc;
> >   
> >   	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
> > -		return tce_free_pSeriesLP(tbl->it_index, tcenum, npages);
> > +		return tce_free_pSeriesLP(tbl->it_index, tcenum,
> > +					  tbl->it_page_shift, npages);
> >   
> > -	rc = plpar_tce_stuff((u64)tbl->it_index, (u64)tcenum << 12, 0, npages);
> > +	rc = plpar_tce_stuff((u64)tbl->it_index,
> > +			     (u64)tcenum << tbl->it_page_shift, 0, npages);
> >   
> >   	if (rc && printk_ratelimit()) {
> >   		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
> > @@ -319,7 +325,8 @@ static unsigned long tce_get_pSeriesLP(struct iommu_table *tbl, long tcenum)
> >   	u64 rc;
> >   	unsigned long tce_ret;
> >   
> > -	rc = plpar_tce_get((u64)tbl->it_index, (u64)tcenum << 12, &tce_ret);
> > +	rc = plpar_tce_get((u64)tbl->it_index,
> > +			   (u64)tcenum << tbl->it_page_shift, &tce_ret);
> >   
> >   	if (rc && printk_ratelimit()) {
> >   		printk("tce_get_pSeriesLP: plpar_tce_get failed. rc=%lld\n", rc);
> > 

