Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 472D71731A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 08:16:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TLSY0jMmzDrNN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 18:16:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=XxdwK4hX; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TLR210HjzDrCG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 18:15:25 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6D562469D;
 Fri, 28 Feb 2020 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582874123;
 bh=bzqcvY1+w7p+H0tBmGUux2b6d1gIUiq/keZNLNBznKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxdwK4hX9SZG6cAVJ0xxZYzqkemDxOmWY+1cEmTnG4oE4Is+PBG7kHaRUPLcqZa6I
 d6IGDzBLr4do0Wg1pJ5rCWIJV/BjZIkr2D3Cl0iJkW8GoyZG6jjyNX/oSPJsGpkcGC
 3xXHY8ZcCXVl//QBuWTZ6yQC5BG057R15eUhlo4Q=
Date: Fri, 28 Feb 2020 08:15:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v3 25/27] powerpc/powernv/pmem: Expose the serial number
 in sysfs
Message-ID: <20200228071520.GA2897773@kroah.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-26-alastair@au1.ibm.com>
 <96687fbf-38ab-13ff-ca19-ccb67bbc4405@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96687fbf-38ab-13ff-ca19-ccb67bbc4405@linux.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, alastair@d-silva.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Alastair D'Silva <alastair@au1.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 05:25:31PM +1100, Andrew Donnellan wrote:
> On 21/2/20 2:27 pm, Alastair D'Silva wrote:
> > +int ocxlpmem_sysfs_add(struct ocxlpmem *ocxlpmem)
> > +{
> > +	int i, rc;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(attrs); i++) {
> > +		rc = device_create_file(&ocxlpmem->dev, &attrs[i]);
> > +		if (rc) {
> > +			for (; --i >= 0;)
> > +				device_remove_file(&ocxlpmem->dev, &attrs[i]);
> 
> I'd rather avoid weird for loop constructs if possible.
> 
> Is it actually dangerous to call device_remove_file() on an attr that hasn't
> been added? If not then I'd rather define an err: label and loop over the
> whole array there.

None of this should be used at all, just use attribute groups properly
and the driver core will handle this all for you.

device_create/remove_file should never be called by anyone anymore if at all
possible.

thanks,

greg k-h
