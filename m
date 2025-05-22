Return-Path: <linuxppc-dev+bounces-8873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A23AC0A84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 13:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b35TD3GG5z3c56;
	Thu, 22 May 2025 21:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747912880;
	cv=none; b=hSkdG7Z1j0n0BmusGEWcZZjRb040RKwAiR8g4Sw4ISXgxhaqHS6KqdSbRB0FwjUyFPuSRiL0JQlgTxEanrocjGKgxmY/C5df92urg9LGLFFamUdWle+b4N99TO3l1ZgJgTK0k5PP6uA8JZp7SDJj9vjvApdTBOv08vaD+fWUbPPy0kIUiBDnKA8KS4/yl4cfbVLT13wqYWz5CDKcadLWOGzlR7Rn6j7l5LmfjCecmLJTrfRkDD2g7OXfg7/qvN15GQu9w4TTlEqibNSqC1aOXZWyi2GoclpICvOPVbkm1p9+qjC+P6ZvTY2GhEvKuaCFm61XXhmWdtBmqG/Ht3qimA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747912880; c=relaxed/relaxed;
	bh=kjtx6OoVaRX1SFz66Jy+pcBit4X/PZUN8INugdNKsc4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPnTWqKNjLKVrax10S6VxHnmDD4lIAsiI3FKOxEMNygM/3fx8hnbCGRuAVCV4J9PN7U778+X/FKaPtedxYLydWVvWvWjGIe3Y+CvtkCSRFATp3w6EnuNNY5mi9jfUNRU6Add0lwVTSHwO2J5F7K7okCnNj470pCSlHAhQ7QLkCntAl4bE3QnL1fJNeKEwwghlvT6IhWvTzbhIAkOHQCT74nLNqivYLWldCV/PHqmlLxoAyoZhys6D00eY18Dvif3BrYaIdpWBNLiHol7a08ZkzlqsMORfugFxGrTvPBoTZWOtVKt1KAK9xlegBZdP+cmmVwL9B4y+yLntuvtif9PGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b35TC3B3Rz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 21:21:19 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b35S43W3Nz6GD5w;
	Thu, 22 May 2025 19:20:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C409140142;
	Thu, 22 May 2025 19:21:16 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 22 May
 2025 13:21:15 +0200
Date: Thu, 22 May 2025 12:21:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Sathyanarayanan
 Kuppuswamy" <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver
 O'Halloran" <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, "Keith
 Busch" <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, Terry Bowman
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, Dave Jiang
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log
 ratelimits
Message-ID: <20250522122113.000030c0@huawei.com>
In-Reply-To: <20250521225942.GA1452275@bhelgaas>
References: <20250521114600.00007010@huawei.com>
	<20250521225942.GA1452275@bhelgaas>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 21 May 2025 17:59:42 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Wed, May 21, 2025 at 11:46:00AM +0100, Jonathan Cameron wrote:
> > On Tue, 20 May 2025 16:50:34 -0500
> > Bjorn Helgaas <helgaas@kernel.org> wrote:
> >   
> > > From: Jon Pan-Doh <pandoh@google.com>
> > > 
> > > Allow userspace to read/write log ratelimits per device (including
> > > enable/disable). Create aer/ sysfs directory to store them and any
> > > future aer configs.  
> > ...  
> 
> > There is some relatively new SYSFS infra that I think will help
> > make this slightly nicer by getting rid of the extra directory when
> > there is nothing to be done with it.  
> 
> > > +#define aer_ratelimit_burst_attr(name, ratelimit)			\
> > > +	static ssize_t							\
> > > +	name##_show(struct device *dev, struct device_attribute *attr,	\
> > > +		    char *buf)						\
> > > +{									\  
> > 
> > A little odd looking to indent this less than the line above.  
> 
> Yep, fixed.
> 
> > > +const struct attribute_group aer_attr_group = {
> > > +	.name = "aer",
> > > +	.attrs = aer_attrs,
> > > +	.is_visible = aer_attrs_are_visible,
> > > +};  
> > 
> > There are a bunch of macros to simplify cases where
> > a whole group is either enabled or not and make the group
> > itself go away if there is nothing to be shown.
> > 
> > DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE() combined with
> > SYSFS_GROUP_VISIBLE() around the assignment does what we
> > want here I think.
> > 
> > Whilst we can't retrofit that stuff onto existing ABI
> > as someone may be assuming directory presence, we can
> > make sysfs less cluttered for new stuff.
> > 
> > Maybe I'm missing why that doesn't work here though!  
> 
> Is this something we can fix later, or are we locking ourselves into
> user-visible ABI that's hard to change?  I'm kind of against the wall
> relative to the v6.16 merge window and haven't had time to dig into
> this part.

That comes down to Ilpo's question of whether empty directories
are ABI (specifically if anyone notices us removing them).
It seems unlikely anyone will code against requirement for an empty
dir, but you never know.

Given we probably have a bunch of these in PCI anyway that predate
that magic, one more isn't a problem even if we decide we can't
tidy it up later.

So I'm fine with not bothering to hide the dir for now (and maybe for
ever).

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


Jonathan

> 


