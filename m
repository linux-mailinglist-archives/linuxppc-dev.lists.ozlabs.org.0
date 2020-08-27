Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF85254A24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:03:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcnb1682RzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CYWdIOg3; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcmw26G5fzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:33:21 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id t23so4839452qto.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=E5IRRkGc1AhclJ6Um81LWbYPnMwL582+X2bSm2+mckg=;
 b=CYWdIOg31Ru+q3WsqzZ+IiG0IABWdiaweROVTwUnjSI44Nde6JFWxpzz9KOgGfQbI+
 uFSRPr+0q/8jTcCE4fl7mKZuk8r/5CSX97kao5FEfvSW7oZ1vekVrnFTnSCX32Nbuue4
 UYg63Oq5gsgHCegmefJeP9b4mqLwjXtOpHOLuXrB1TXg/nE1DbDsnOMj7VT9TM39wLGi
 gDdO0Vxl+4h8IpmS7GESBpUFvXaDaYIypqBgFtffwj5fHc4ObW3krjAv+pCgYgYRraVH
 pCHsJTopEHecs7Xvb4483qGigoSNqUWmnCkxzHskXpF7UhAcZ7GSZzkUEeOVMLSx7NEW
 pOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=E5IRRkGc1AhclJ6Um81LWbYPnMwL582+X2bSm2+mckg=;
 b=C4xaMdQUt+/wvaSjeaqH5+JUn1D1TEg5di5tWBmslo1fzyKhKEp8Tjnk41roKMUdbu
 66Hf8++EW+g4TCkc/n/KlfOeVxYajjmlB3Tkli1HRnMESrJutTLb/Shuf3XlVDMNixbj
 Xk8O4E6Hn/FFNNTlI5vAe327SaHcMfUUUUW6ijFFqz0sZX3iO9vtczUnlZ7/kOEYycYr
 b7yqoqXW6Nr7yS1qlzrMRrKT6o6bKJQxyxBMYz0YQ/YPXIo4iokmt8tHD3TJTfdZPlbY
 2vJMy2G1PfFKP7u/B9PtCTkBmm9k3AhVjGEGFp4AqSF9a0QbleQL6rj6xny/iwf6MbQg
 dvrQ==
X-Gm-Message-State: AOAM533r8oX1QfNpVVsx+j124hqrzTgcr9t/kkrX+zoxGHLsr0gHidSr
 hqFFZC3oo6QkzjNXT1ENdLw=
X-Google-Smtp-Source: ABdhPJxQOy8z2tpz1ix5dHQc5fNnoO5W3POhV+lw0/IW1KMQm/iA/K4WQYEcLQkVmx48Q14mGSDYGw==
X-Received: by 2002:ac8:550f:: with SMTP id j15mr19283657qtq.26.1598542385460; 
 Thu, 27 Aug 2020 08:33:05 -0700 (PDT)
Received: from LeoBras ([2804:14d:8084:8e41:9b0d:571e:a65:b5d8])
 by smtp.gmail.com with ESMTPSA id t11sm270862qtp.32.2020.08.27.08.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 08:33:04 -0700 (PDT)
Message-ID: <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
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
Date: Thu, 27 Aug 2020 12:32:57 -0300
In-Reply-To: <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
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

Hello Alexey, thank you for this feedback!

On Sat, 2020-08-22 at 19:33 +1000, Alexey Kardashevskiy wrote:
> > +#define TCE_RPN_BITS		52		/* Bits 0-51 represent RPN on TCE */
> 
> Ditch this one and use MAX_PHYSMEM_BITS instead? I am pretty sure this
> is the actual limit.

I understand this MAX_PHYSMEM_BITS(51) comes from the maximum physical memory addressable in the machine. IIUC, it means we can access physical address up to (1ul << MAX_PHYSMEM_BITS). 

This 52 comes from PAPR "Table 9. TCE Definition" which defines bits
0-51 as the RPN. By looking at code, I understand that it means we may input any address < (1ul << 52) to TCE.

In practice, MAX_PHYSMEM_BITS should be enough as of today, because I suppose we can't ever pass a physical page address over 
(1ul << 51), and TCE accepts up to (1ul << 52).
But if we ever increase MAX_PHYSMEM_BITS, it doesn't necessarily means that TCE_RPN_BITS will also be increased, so I think they are independent values. 

Does it make sense? Please let me know if I am missing something.

> 
> 
> > +#define TCE_RPN_MASK(ps)	((1ul << (TCE_RPN_BITS - (ps))) - 1)
> >  #define TCE_VALID		0x800		/* TCE valid */
> >  #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
> >  #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index e4198700ed1a..8fe23b7dff3a 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -107,6 +107,9 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
> >  	u64 proto_tce;
> >  	__be64 *tcep;
> >  	u64 rpn;
> > +	const unsigned long tceshift = tbl->it_page_shift;
> > +	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
> > +	const u64 rpn_mask = TCE_RPN_MASK(tceshift);
> 
> Using IOMMU_PAGE_SIZE macro for the page size and not using
> IOMMU_PAGE_MASK for the mask - this incosistency makes my small brain
> explode :) I understand the history but maaaaan... Oh well, ok.
> 

Yeah, it feels kind of weird after two IOMMU related consts. :)
But sure IOMMU_PAGE_MASK() would not be useful here :)

And this kind of let me thinking:
> > +		rpn = __pa(uaddr) >> tceshift;
> > +		*tcep = cpu_to_be64(proto_tce | (rpn & rpn_mask) << tceshift);
Why not:
	rpn_mask =  TCE_RPN_MASK(tceshift) << tceshift;
	
	rpn = __pa(uaddr) & rpn_mask;
	*tcep = cpu_to_be64(proto_tce | rpn)

I am usually afraid of changing stuff like this, but I think it's safe.

> Good, otherwise. Thanks,

Thank you for reviewing!
 


