Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D82C28C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 14:53:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgQTh1VnHzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 00:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=A4hByCrE; dkim-atps=neutral
X-Greylist: delayed 309 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Nov 2020 00:50:57 AEDT
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgQQn5BCfzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 00:50:57 +1100 (AEDT)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbd0e7e0001>; Tue, 24 Nov 2020 21:45:34 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 13:45:34 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.55) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Tue, 24 Nov 2020 13:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNcmFoHh91gs4W5dCbFJK7svt1P7yWlBRSsHmqtN3+E/KFSyQLSA711XRe3Z9VLhmfC5J7KhjMP/rCjONw1FMM9Rqu9XxP7jkMVZOXvP2+ZGYvrg5BzdDi4eLFz2Z59ZqdKc79oh5eEc4NsGMtYyi6Rt8vhERBK4L7MpQYiZhcJatV+iI9cH1DqZqD/dqilvmKlpku0tdjfqoQdNAvYRXGdbYy/82Vni0OF3Ycbe4JG+I4k8Jy9BOCF0y53BSsj3y5fMUyA7G/vzmMpQrReJDuJbaWDx/qpHCG60JcY25erwfSNJvfPgNBoP7aQzA3UmyPmkUMAXIfyZlrNLYA6D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNqdf0rt58PhDMWLfZAoD9eokDwK5nL9WpAfh7ntCW8=;
 b=GjWuLKpF/7PCUwdAH15xtwnYL/gOsElXz+K1jaqe5EErRT284u+p2cdvHZQ4vaNNjOp5NrvZlEgEgYTcUMym/4/qwV1GEGZLVXVzpIMaDwnCekgDkWcr5KBOW/NkJ+KaHI8GJj142JLQTMba7mJyRlfZCWKfOMGggCIwQzlWAgJcRrTdJ1D+4CKFC7NRRlIHYpWWwVr+WMrgZLdYK4t0XqCqxBoKNn2JlAYAWhdkhJVbewEWuVBtSAzKyc5/TFIrCcLMqBJF22lk+j8eY73XlmqcNzpBAIJ6hRNfCe7ySkZr5oniLbv14xP3/gpksX2Ndn72I2IKKozB7KHaZs7QUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0108.namprd12.prod.outlook.com (2603:10b6:4:58::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Tue, 24 Nov
 2020 13:45:27 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 13:45:27 +0000
Date: Tue, 24 Nov 2020 09:45:25 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 4/5] ocxl: Add mmu notifier
Message-ID: <20201124134525.GB4800@nvidia.com>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
 <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
 <20201124091738.GA26078@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201124091738.GA26078@infradead.org>
X-ClientProxiedBy: BL1PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::22) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0107.namprd13.prod.outlook.com (2603:10b6:208:2b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 13:45:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1khYdJ-000n5S-CQ; Tue, 24 Nov 2020 09:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606225534; bh=DNqdf0rt58PhDMWLfZAoD9eokDwK5nL9WpAfh7ntCW8=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=A4hByCrEHOat7/bAusUScwS/EpvnoL1yrTmgN59c3EB/WG5rR3oyVO+fFtbl7gQBq
 5tiijfNCdk62kbUNxvgbHR4bqoOGbEf001euAXMSy5gUcYSRO/rlyk6fsFzoPqF/AM
 g2AXZeshZ54Zg3pp3wW2pNyKtx3cXpCBUxACPQUsDY2Io1YloPgOBVDuqhdpl+eJuo
 MukcB0uhrfPofH1oeEonR6yKo9udHUarjPBuiX5Lq1BdN5EQK6Rdu6NkmWU7Kz8cwD
 qnGCmTAA0vkUUFd8MGY603SKX189VLMG7/LE85GJgx0aa4tgQyTEOMdYLX1glEpZ5T
 nOFamzTfmuFRQ==
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Christophe Lombard <clombard@linux.vnet.ibm.com>, fbarrat@linux.vnet.ibm.com,
 ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24, 2020 at 09:17:38AM +0000, Christoph Hellwig wrote:

> > @@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
> >  }
> >  EXPORT_SYMBOL_GPL(ocxl_link_release);
> >  
> > +static void invalidate_range(struct mmu_notifier *mn,
> > +			     struct mm_struct *mm,
> > +			     unsigned long start, unsigned long end)
> > +{
> > +	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
> > +	struct ocxl_link *link = pe_data->link;
> > +	unsigned long addr, pid, page_size = PAGE_SIZE;

The page_size variable seems unnecessary

> > +
> > +	pid = mm->context.id;
> > +
> > +	spin_lock(&link->atsd_lock);
> > +	for (addr = start; addr < end; addr += page_size)
> > +		pnv_ocxl_tlb_invalidate(&link->arva, pid, addr);
> > +	spin_unlock(&link->atsd_lock);
> > +}
> > +
> > +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
> > +	.invalidate_range = invalidate_range,
> > +};
> > +
> >  static u64 calculate_cfg_state(bool kernel)
> >  {
> >  	u64 state;
> > @@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> >  	pe_data->mm = mm;
> >  	pe_data->xsl_err_cb = xsl_err_cb;
> >  	pe_data->xsl_err_data = xsl_err_data;
> > +	pe_data->link = link;
> > +	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
> >  
> >  	memset(pe, 0, sizeof(struct ocxl_process_element));
> >  	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
> > @@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
> >  	 * by the nest MMU. If we have a kernel context, TLBIs are
> >  	 * already global.
> >  	 */
> > -	if (mm)
> > +	if (mm) {
> >  		mm_context_add_copro(mm);
> > +		if (link->arva) {
> > +			/* Use MMIO registers for the TLB Invalidate
> > +			 * operations.
> > +			 */
> > +			mmu_notifier_register(&pe_data->mmu_notifier, mm);

Every other place doing stuff like this is de-duplicating the
notifier. If you have multiple clients this will do multiple redundant
invalidations?

The notifier get/put API is designed to solve that problem, you'd get
a single notifier for the mm and then add the impacted arva's to some
list at the notifier.

Jason
