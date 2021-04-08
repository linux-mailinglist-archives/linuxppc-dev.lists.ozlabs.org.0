Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F9357C74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 08:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGB372T7fz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 16:20:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ibKlH86r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ibKlH86r; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGB2h47VFz309X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 16:20:27 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id x14so1120126qki.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 23:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=+YK8S5Mo/rZbKbyRFAI8qgheI4iNBgcGprTWWKxT3Xs=;
 b=ibKlH86rK64gYyXGVAeO0ewn6CJPIERqnFl8K+8RDkFsUHVOaU5OFHKR4q/+yr8yNY
 fEZdndjtpzahnlaf2NkNbsSvKwPm04TjmDj7Ta26obwlNczVmOsXjSKCAttFAHFmzzJj
 pWt1LZSL/lbjnUkRa5BrFEAu7HF21mfAYk+of8bTtiM09Pyg4wQCEc9/HaNZ+iId6I+q
 7oUm0bVtFfMu5Vuok3Fqvt0fy/9Mf0tRI92Bo/o+6e3TzmbUVh4vAaD5SpBI6DtNcSxI
 mJOHO7/P9Qblynn06+Ou68OvDfwmcK8F5+LjeiQIJqfklMgykK4x93cBb7SwyMsw7dlf
 b22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+YK8S5Mo/rZbKbyRFAI8qgheI4iNBgcGprTWWKxT3Xs=;
 b=ejAIlz6rFvjGzLeGAfScZpQKgDLYdEB4r9zJ1pjIBIMpcNmZMg2fHH16wWI8CqSwss
 46bR9npI8XulVIz6d7IyhGlsLLx30ScVr9AFrnBPJEHmzscrb4MbFBAt8jTZ/4IE3QSV
 9EEwG4i2iHW/6RIls9v+uEYthAlLVqrHVjO9UZ4KIS4PcFD8xuERVw1sFUw4TttGmrpQ
 +DiUOFOW07y0Hlsiqq18lfM2ZaxftXwQDha2BtjWgZn5jiHVcRtLJQTRoZgxgtI/zxpB
 Kzb4ymsRg24OtYni/a+5LLrqsUwOI7fCzbz0o6o0og3zDueDAZQ8CWVoj/4k/lc5n2yG
 vsmg==
X-Gm-Message-State: AOAM531TSUR8BzHnQtmEAQPdL6ujXZC9iHpY8nAP7y8o3Js12Tk3KQNL
 1CNpOJguaHTYvxYCuv4fnVo=
X-Google-Smtp-Source: ABdhPJypY9Tv73D0Y+wnyc9nm9yRRwHDN044agKYv/vNiYYSNDDt+GYQZ7b/47sSEGJoQWWpCAH3eQ==
X-Received: by 2002:a37:9a96:: with SMTP id c144mr6981972qke.221.1617862823753; 
 Wed, 07 Apr 2021 23:20:23 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id s19sm19698402qks.130.2021.04.07.23.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 23:20:23 -0700 (PDT)
Message-ID: <942acb9b23d87594d0b758cc0daf713be836f8e6.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, brking@linux.vnet.ibm.com
Date: Thu, 08 Apr 2021 03:20:19 -0300
In-Reply-To: <87im4xe3pk.fsf@mpe.ellerman.id.au>
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael, thank you for this feedback!
Comments inline:

On Thu, 2021-04-08 at 15:37 +1000, Michael Ellerman wrote:
> Leonardo Bras <leobras.c@gmail.com> writes:
> > According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
> > will let the OS know all possible pagesizes that can be used for creating a
> > new DDW.
> > 
> > Currently Linux will only try using 3 of the 8 available options:
> > 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
> > 128M, 256M and 16G.
> 
> Do we know of any hardware & hypervisor combination that will actually
> give us bigger pages?
> 
> > Enabling bigger pages would be interesting for direct mapping systems
> > with a lot of RAM, while using less TCE entries.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 49 ++++++++++++++++++++++----
> >  1 file changed, 42 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 9fc5217f0c8e..6cda1c92597d 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -53,6 +53,20 @@ enum {
> >  	DDW_EXT_QUERY_OUT_SIZE = 2
> >  };
> 
> A comment saying where the values come from would be good.

Sure, I will add the information about LoPAR.

> 
> > +#define QUERY_DDW_PGSIZE_4K	0x01
> > +#define QUERY_DDW_PGSIZE_64K	0x02
> > +#define QUERY_DDW_PGSIZE_16M	0x04
> > +#define QUERY_DDW_PGSIZE_32M	0x08
> > +#define QUERY_DDW_PGSIZE_64M	0x10
> > +#define QUERY_DDW_PGSIZE_128M	0x20
> > +#define QUERY_DDW_PGSIZE_256M	0x40
> > +#define QUERY_DDW_PGSIZE_16G	0x80
> 
> I'm not sure the #defines really gain us much vs just putting the
> literal values in the array below?

My v1 did not use the define approach, what do you think of that?
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210322190943.715368-1-leobras.c@gmail.com/

> 
> > +struct iommu_ddw_pagesize {
> > +	u32 mask;
> > +	int shift;
> > +};
> > +
> >  static struct iommu_table_group *iommu_pseries_alloc_group(int node)
> >  {
> >  	struct iommu_table_group *table_group;
> > @@ -1099,6 +1113,31 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
> >  			 ret);
> >  }
> >  
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > +/* Returns page shift based on "IO Page Sizes" output at ibm,query-pe-dma-window. See LoPAR */
> > +static int iommu_get_page_shift(u32 query_page_size)
> > +{
> > +	const struct iommu_ddw_pagesize ddw_pagesize[] = {
> > +		{ QUERY_DDW_PGSIZE_16G,  __builtin_ctz(SZ_16G)  },
> > +		{ QUERY_DDW_PGSIZE_256M, __builtin_ctz(SZ_256M) },
> > +		{ QUERY_DDW_PGSIZE_128M, __builtin_ctz(SZ_128M) },
> > +		{ QUERY_DDW_PGSIZE_64M,  __builtin_ctz(SZ_64M)  },
> > +		{ QUERY_DDW_PGSIZE_32M,  __builtin_ctz(SZ_32M)  },
> > +		{ QUERY_DDW_PGSIZE_16M,  __builtin_ctz(SZ_16M)  },
> > +		{ QUERY_DDW_PGSIZE_64K,  __builtin_ctz(SZ_64K)  },
> > +		{ QUERY_DDW_PGSIZE_4K,   __builtin_ctz(SZ_4K)   }
> > +	};
> 
> 
> cheers

Best regards,
Leonardo Bras


