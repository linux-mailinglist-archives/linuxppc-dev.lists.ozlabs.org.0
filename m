Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55207321F3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 19:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkrZx2Wxgz3cVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 05:40:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RstLjHPK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RstLjHPK; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkrZR5JZfz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 05:39:42 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id f17so13637920qkl.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 10:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=od8xjbhWU//2qvygw5xYiLYM6AW25uxuxJW5aBCxv3k=;
 b=RstLjHPKF5SVtwd0PYhyC8OWPMRqxFNJXfuFCb21fMwIX+rReijz0aZPMAmeeMDqdh
 D4fIEqDxJ0QfAjFqQa/xbl3M8IoeXeLLNgWL98SkDYRQ1uFAKVfobPn9ikWH6J4wyi1t
 3+34Lc604YV6KfCQ3rPAwZr29HzmAePmy0eKAMWyn0ae7+1fRRJmpkaZP9EpQ6KrW604
 /YXvTeB88e+6X1/WnwNdqaHGYl/8cZw2NHkorpYU/36zKU6JOxl8br9ABFJA1VyudIuA
 be9/6lRzhYJYtHk9aFU5z4FEOCut4zbvnBKTWRlF+/NWjYgEECM/wzSGsiaVaw8xDaDT
 rq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=od8xjbhWU//2qvygw5xYiLYM6AW25uxuxJW5aBCxv3k=;
 b=sCcfkwxpwCK2AwVuN9nBkPXwHPBlI4jDjGzrhH/dsy+BHPaMyGCXUzN+BmdItfvNZS
 +1e6nO9HFP8WwmOZ5I0rIU+gaPUBZqmOcvn+5HU3W4mN4QumkcjtPJXmyW6On/HL2nCT
 7KhGn77hUBdVl3CgoZbo4Ukvcju4NoXJooA5tp6kBb4sXWjaFw+GJmIxDYIrqereECky
 SezaiHFtKKTu/VSMFhOu2/oPqMIOYTBepl9hFDPkZev6mpUQZAvJLAD7qc5sWDA4eQxQ
 f5XDJwkZFX26oWR7CNwd5ijzSS9IuD1hxz1trCuBncmtKl7aN/bNBEI7sVeuKsWrONQ8
 ifVA==
X-Gm-Message-State: AOAM533uIJ2M21ylkw9AXbO2bhgoUF+ySUztPQyByuLPCwM8CUpuCnN3
 IISo6xz4jKEIEWtLii+zT6g=
X-Google-Smtp-Source: ABdhPJwvDI7zFPvZ9qZKN3ylBuEfF+No5r9NR/4vakvvcEL4mKwnhcs9kmeGPrLi+I0qetaGpXkGpg==
X-Received: by 2002:a05:620a:1ef:: with SMTP id
 x15mr21540142qkn.209.1614019178668; 
 Mon, 22 Feb 2021 10:39:38 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (179-125-179-237.dynamic.desktop.com.br. [179.125.179.237])
 by smtp.gmail.com with ESMTPSA id f26sm12799254qkh.80.2021.02.22.10.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 10:39:38 -0800 (PST)
Message-ID: <6b4bed6881f66d9ebb45486042966f78593ac240.camel@gmail.com>
Subject: Re: [PATCH kernel 2/2] powerpc/iommu: Do not immediately panic when
 failed IOMMU table allocation
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 22 Feb 2021 15:39:34 -0300
In-Reply-To: <0ae74efe-8b9a-566a-d984-8e5b662ff330@ozlabs.ru>
References: <20210216033307.69863-1-aik@ozlabs.ru>
 <20210216033307.69863-3-aik@ozlabs.ru>
 <433396d9ef216aa090e32bb344d42f60de1fb9aa.camel@gmail.com>
 <0ae74efe-8b9a-566a-d984-8e5b662ff330@ozlabs.ru>
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-02-22 at 16:24 +1100, Alexey Kardashevskiy wrote:
> 
> On 18/02/2021 06:32, Leonardo Bras wrote:
> > On Tue, 2021-02-16 at 14:33 +1100, Alexey Kardashevskiy wrote:
> > > Most platforms allocate IOMMU table structures (specifically it_map)
> > > at the boot time and when this fails - it is a valid reason for panic().
> > > 
> > > However the powernv platform allocates it_map after a device is returned
> > > to the host OS after being passed through and this happens long after
> > > the host OS booted. It is quite possible to trigger the it_map allocation
> > > panic() and kill the host even though it is not necessary - the host OS
> > > can still use the DMA bypass mode (requires a tiny fraction of it_map's
> > > memory) and even if that fails, the host OS is runnnable as it was without
> > > the device for which allocating it_map causes the panic.
> > > 
> > > Instead of immediately crashing in a powernv/ioda2 system, this prints
> > > an error and continues. All other platforms still call panic().
> > > 
> > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > 
> > Hello Alexey,
> > 
> > This looks like a good change, that passes panic() decision to platform
> > code. Everything looks pretty straightforward, but I have a question
> > regarding this:
> > 
> > > @@ -1930,16 +1931,16 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
> > >   		res_start = pe->phb->ioda.m32_pci_base >> tbl->it_page_shift;
> > >   		res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
> > >   	}
> > > -	iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end);
> > > -	rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
> > > 
> > > +	if (iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end))
> > > +		rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
> > > +	else
> > > +		rc = -ENOMEM;
> > >   	if (rc) {
> > > -		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n",
> > > -				rc);
> > > +		pe_err(pe, "Failed to configure 32-bit TCE table, err %ld\n", rc);
> > >   		iommu_tce_table_put(tbl);
> > > -		return rc;
> > > +		tbl = NULL; /* This clears iommu_table_base below */
> > >   	}
> > > -
> > >   	if (!pnv_iommu_bypass_disabled)
> > >   		pnv_pci_ioda2_set_bypass(pe, true);
> > >   
> > > 
> > > 
> > > 
> > > 
> > 
> > If I could understand correctly, previously if iommu_init_table() did
> > not panic(), and pnv_pci_ioda2_set_window() returned something other
> > than 0, it would return rc in the if (rc) clause, but now it does not
> > happen anymore, going through if (!pnv_iommu_bypass_disabled) onwards.
> > 
> > Is that desired?
> 
> 
> Yes. A PE (==device, pretty much) has 2 DMA windows:
> - the default one which requires some RAM to operate
> - a bypass mode which tells the hardware that PCI addresses are 
> statically mapped to RAM 1:1.
> 
> This bypass mode does not require extra memory to work and is used in 
> the most cases on the bare metal as long as the device supports 64bit 
> DMA which is everything except GPUs. Since it is cheap to enable and 
> this what we prefer anyway, no urge to fail.
> 
> 
> > As far as I could see, returning rc there seems a good procedure after
> > iommu_init_table returning -ENOMEM.
> 
> This change is intentional and yes it could be done by a separate patch 
> but I figured there is no that much value in splitting.

Ok then, thanks for clarifying.
FWIW:

Reviewed-by: Leonardo Bras <leobras.c@gmail.com>


