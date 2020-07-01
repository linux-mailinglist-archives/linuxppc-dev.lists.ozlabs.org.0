Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8832113F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 21:59:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xsWg1NwfzDqkD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 05:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WCnakP/X; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xsTd1GQczDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 05:57:57 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id k18so23417321qke.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 12:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=P2xXya0vmfcuml5Lq07kKdDHnBOYeeXGCdjYEYzukXs=;
 b=WCnakP/Xu1KPP+ci5vTdXDmdqpN8Z/kb3IUXHmLW15aI15vSeLPGHbZj4JlNLonKWw
 hwz52bg3N0SP0ZDU1YWOKnQezOcP6DJgqMDVdZVGQbQ5kPmgq6gfPyeW6o18vUxPBye4
 sFXGY4k3zUgUftA/aBOzwm3PtEf13KeYSQJntO3+cAGEuo/vR3NK0qWqB+HxDzibnk5B
 aTNTimPuSmYf1Ct9y75ppLdvffYZevTdvqSYb3B9RYq//Lx+Ar3W9+MY14UUw0Gi3FQT
 Bwr+cggqJdbO8l3VffzPEpjNZi91Up8iZ/5i3DPzDVXfYHKqHYlgnkeYHAYlI2HN/cGM
 L5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=P2xXya0vmfcuml5Lq07kKdDHnBOYeeXGCdjYEYzukXs=;
 b=hba6dfC/I8eANqlHMjFJf5VjMEPC9fPxznG9ji38zCTqMEiMhOs3czfq07BqocodFv
 cVH6OoBIx5EkNmEs/pGP3LG3ICFwQaS8H/MwZAyFHHskwq8jFKYUCQdZEV8IrJAPk2Eg
 mXTFz38VUw7bcQuix9Q31Usxc1YYjdvmi31UeL70ob5PDtDystZdk3zItUK2JBnLuIvA
 qUp1zHHN0mQ3yCL9VBEE1IlS7yW85yiJxHBcfDWaOK7uvyWxg/Qq3e+gp3L8hPmDV7E0
 pjMKxhjWnA8cT5Z6RmVo8ZJHnNUf6Yjy5RZER3l6OyWUXRMGAKoP0hNqPwkAQ9UDtZpZ
 xS1w==
X-Gm-Message-State: AOAM532QWGa+yK7uu1iIs5/+u1dr4pJK6bd7ZrMjI5kqElX5GUOcVqtZ
 tKvoPKdvz6EGqhOwLFoEtyc=
X-Google-Smtp-Source: ABdhPJz2Q1ryYJBEVe3jfg97Uhhv90ytvOvhr3w9z07qMByGII19RpkENExpkqJerQ4m1Rf9PToofA==
X-Received: by 2002:a05:620a:12fa:: with SMTP id
 f26mr27515688qkl.38.1593633473572; 
 Wed, 01 Jul 2020 12:57:53 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id k2sm6643807qkf.127.2020.07.01.12.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 12:57:52 -0700 (PDT)
Message-ID: <0e8bcc38614ec80c7816c07dd4dc70854c2b901d.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 16:57:48 -0300
In-Reply-To: <18df09c0-ef83-a0d8-1143-1cb4d50bf6b7@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-6-leobras.c@gmail.com>
 <18df09c0-ef83-a0d8-1143-1cb4d50bf6b7@ozlabs.ru>
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

On Wed, 2020-07-01 at 18:16 +1000, Alexey Kardashevskiy wrote:
> 
> On 24/06/2020 16:24, Leonardo Bras wrote:
> > As of today, if a DDW is created and can't map the whole partition, it's
> > removed and the default DMA window "ibm,dma-window" is used instead.
> > 
> > Usually this DDW is bigger than the default DMA window, so it would be
> > better to make use of it instead.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 28 +++++++++++++++++---------
> >  1 file changed, 19 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 4fcf00016fb1..2d217cda4075 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -685,7 +685,7 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
> >  	struct iommu_table *tbl;
> >  	struct device_node *dn, *pdn;
> >  	struct pci_dn *ppci;
> > -	const __be32 *dma_window = NULL;
> > +	const __be32 *dma_window = NULL, *alt_dma_window = NULL;
> >  
> >  	dn = pci_bus_to_OF_node(bus);
> >  
> > @@ -699,8 +699,13 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
> >  			break;
> >  	}
> >  
> > +	/* If there is a DDW available, use it instead */
> > +	alt_dma_window = of_get_property(pdn, DIRECT64_PROPNAME, NULL);
> 
> It is not necessarily "direct" anymore as the name suggests, you may
> want to change that. DMA64_PROPNAME, may be. Thanks,
> 

Yeah, you are right.
I will change this for next version, also changing the string name to
reflect this.

-#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"

Is that ok?

Thank you for helping!


