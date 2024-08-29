Return-Path: <linuxppc-dev+bounces-774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0DC9652E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 00:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvwwt2CQpz2ypj;
	Fri, 30 Aug 2024 08:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.141
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724958228;
	cv=none; b=BxMl582Hg7ofEo+EUYHGrmNWp7DmG7xxIQ3YCdQJ1KSTQgf/PvZI3+6mE9/757QG57Xar9mMTEY8EPtO9VK2x/vp+whoVVITgqSFyex86/NVivEmG8kM7ksfehY99nPegfN8kUNAa4dnVjXLuWUeCckbN+z6ARKnzN2u2cFV/Ke0O+FGZcHs2aNUdiVUjKY1M32aMS+KTPeGcKSbrNgQRqVVxm+6owKVi9ioWnc1UizbzGRl00Z/mET+9ixX7n2SycpeSm3ldUDkY7cEPYTfQ2Ra00EYjbClcyj/cklFepkI0sZiSfoAXaikJM0Pc5XOOMbBJPjQXOPCNr108qYDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724958228; c=relaxed/relaxed;
	bh=wi86ZH7xmqdnGu1sxbaNDApyldso9uas/PyZiPRTSkA=;
	h=X-Greylist:Received:DKIM-Signature:Received:Received:Received:
	 Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EXCLAIMER-MD-CONFIG; b=DJMPJRCVo3f0orFsU2T20ArMs38pAbBr0xFlxcks1ggny6S8sf+Geq9enL5l+FDKW6J2SLxxhbVRZO8onMhsjQbhq2ruzZ0gRpRDa0KBVs38kMaG/K/wl7vndbPkXtKIn8X9HBAMkJK7Cus+tg5zoH4V2N/7sQgfMB9ij1+bApMdLi1sdSlTySWekUMhjTJQueSpv8maNc2gC2mlUCW5f6TdSfOXusmrsnip7XJ7u6GwWl9J6Mi3hvRAeDQ1DPE9d/7xSQJD3XegzWXFdxoKFEyUyqgx509NR09TyrTEiR9kgaEWQ3PDuNm1H+O1+WPz4lPGlzTiUrwqhnFHc25MZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=l/3SQIGe; dkim-atps=neutral; spf=pass (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=nm@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=l/3SQIGe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=nm@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3403 seconds by postgrey-1.37 at boromir; Fri, 30 Aug 2024 05:03:46 AEST
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvrKZ3TyRz2y0B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 05:03:44 +1000 (AEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47TI6DLN117367;
	Thu, 29 Aug 2024 13:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724954773;
	bh=wi86ZH7xmqdnGu1sxbaNDApyldso9uas/PyZiPRTSkA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=l/3SQIGeZsyLNLqE7Q8eoxW8LbWkxH5BoY2HW2CjM2BV4vGgIFegJJV2ViWS9mYGP
	 EeYozapcSXDMa6MJBN3lXAu/eUlQB7v6C2yq1UkIe1tc3FVoDNeUWRumzx+vhGCdg2
	 PD6+EL7f13yT2BUlk4OoO1sPvslP1jjXVnZwlMFM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47TI6DGn072897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Aug 2024 13:06:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Aug 2024 13:06:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Aug 2024 13:06:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47TI6D9c076122;
	Thu, 29 Aug 2024 13:06:13 -0500
Date: Thu, 29 Aug 2024 13:06:13 -0500
From: Nishanth Menon <nm@ti.com>
To: Kousik Sanagavarapu <five231003@gmail.com>
CC: Jinjie Ruan <ruanjinjie@huawei.com>, <andrew@lunn.ch>,
        <sebastian.hesselbarth@gmail.com>, <gregory.clement@bootlin.com>,
        <herve.codina@bootlin.com>, <qiang.zhao@nxp.com>,
        <christophe.leroy@csgroup.eu>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ssantosh@kernel.org>, <petlozup@nvidia.com>,
        <pshete@nvidia.com>, <christophe.jaillet@wanadoo.fr>,
        <ulf.hansson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-tegra@vger.kernel.org>, <krzk@kernel.org>, <jic23@kernel.org>
Subject: Re: [PATCH -next 8/8] soc: ti: knav_qmss_queue: Simplify with scoped
 for each OF child loop
Message-ID: <20240829180613.upc6xpe7jnhb6eo7@puppy>
References: <20240827114607.4019972-9-ruanjinjie@huawei.com>
 <ZtCapIwWZolY7oMH@five231003>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZtCapIwWZolY7oMH@five231003>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 21:28-20240829, Kousik Sanagavarapu wrote:
> Jinjie Ruan <ruanjinjie@huawei.com> writes:
> > @@ -1080,17 +1080,13 @@ static int knav_queue_setup_regions(struct knav_device *kdev,
> >  {
> >  	struct device *dev = kdev->dev;
> >  	struct knav_region *region;
> > -	struct device_node *child;
> >  	u32 temp[2];
> >  	int ret;
> >  
> > -	for_each_child_of_node(regions, child) {
> > +	for_each_child_of_node_scoped(regions, child) {
> 
> Are you sure using *_scoped() is better here?  Since it seems that we
> need the memory pointed to by "child" in cases where we don't go into an
> error path.
> 
> >  		region = devm_kzalloc(dev, sizeof(*region), GFP_KERNEL);
> > -		if (!region) {
> > -			of_node_put(child);
> > -			dev_err(dev, "out of memory allocating region\n");
> > -			return -ENOMEM;
> > -		}
> > +		if (!region)
> > +			return dev_err_probe(dev, -ENOMEM, "out of memory allocating region\n");
> >  
> >  		region->name = knav_queue_find_name(child);
> >  		of_property_read_u32(child, "id", &region->id);
> 
> Similarly in most of the other cases in this series where a similar
> change is done.
> 
> Also FYI, as for dev_err_probe(), I think I covered all of them in this
> file and a patch for it is currently sitting in ti-drivers-soc-next.
> 

Thanks Kousik. yeah - it will probably help with a rebase to latest
next.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

