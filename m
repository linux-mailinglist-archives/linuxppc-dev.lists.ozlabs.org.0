Return-Path: <linuxppc-dev+bounces-8872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68EAC0A76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 13:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b35Np1mm4z3c4t;
	Thu, 22 May 2025 21:17:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747912650;
	cv=none; b=Eolipc7g9MMGuCTsKthtNKij7OagnPMFj5wE2vppBwgWfh6Niwqdeqq4iQnH5QEMx5qewCxF0IDYtTWvCi8MTmw1XIwmfce9Rbq6ZIxS1ARJUtLXNG0+2r6F+agG7R9Kf7bTY8wggfovurnYxPi/KyA3NbND6Ifu4tPtv2Lk/oy7bVrQShj+XS82LhzX6eyxuwCJyfouPnJyBgiqxxasOW2o6k+f53Z6YtlEro0XByNx6H1T8jMLxOlXdYpAQw3/uk/9JyyLkdQtJq9VtnDaeHyOOs/HErlqYzTTXuEXCyIAo1R+wsVCXX2s0q0lBczeala9EOP0UwdNlHQav7bzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747912650; c=relaxed/relaxed;
	bh=cnVDonnghmvx2b13EU8D0GGHIY1qOTfV6xANbDVpxdk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWcYDOECnaV8WxhIgnpFhazvXRSnP1oyiGX9fp1v7R2x5WCGKexU81TXfpIWKp9k20prbMXXIsSYItLU/4Q4GFS+ydZy22roiyGyFJ/woR0IIDlI1CkAMDq/LJOnroVjh4DdnmB5W0HL20o0Pu0xsJiwq61Sw2AcfBBGEKvA6b3Ker8XYc066OUEWY6toA46vMQmgXXkWzS5q4anvFTXaXofk1w1oo0PcU/wGyvWLNa/cX66Hmhz23Xt32k+4Nxk7vC3k2HLdz50F/mB4i9l6j+UM7csS7laFzvdzIjBCdydYvA8Mwm78u1cyFbTVTNQJgK6KPM4M/fffPDkApTETA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b35Nm4PfVz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 21:17:26 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b35Jv3sz3z6L5Fm;
	Thu, 22 May 2025 19:14:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DE1141402EE;
	Thu, 22 May 2025 19:17:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 22 May
 2025 13:17:20 +0200
Date: Thu, 22 May 2025 12:17:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan
 Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, Keith
 Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, "Terry Bowman"
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, "Dave Jiang"
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 15/17] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <20250522121718.00005fa2@huawei.com>
In-Reply-To: <20250521225430.GA1442014@bhelgaas>
References: <20250521113121.000067ce@huawei.com>
	<20250521225430.GA1442014@bhelgaas>
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

On Wed, 21 May 2025 17:54:30 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Wed, May 21, 2025 at 11:31:21AM +0100, Jonathan Cameron wrote:
> > On Tue, 20 May 2025 16:50:32 -0500
> > Bjorn Helgaas <helgaas@kernel.org> wrote:
> >   
> > > From: Jon Pan-Doh <pandoh@google.com>
> > > 
> > > Spammy devices can flood kernel logs with AER errors and slow/stall
> > > execution. Add per-device ratelimits for AER correctable and non-fatal
> > > uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
> > > fatal errors is not ratelimited.  
> > 
> > See below. I'm not sure that logging of fatal error should affect the rate
> > for non fatal errors + the rate limit infrastructure kind of assumes
> > that you only call it if you are planning to respect it's decision.
> > 
> > Given overall aim is to restrict rates, maybe we don't care if we sometimes
> > throttle earlier that we might expect with a simpler separation of what
> > is being limited.
> > 
> > I don't mind strongly either way.  
> 
> > > @@ -593,7 +593,8 @@ struct aer_err_info {
> > >  	unsigned int id:16;
> > >  
> > >  	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
> > > -	unsigned int __pad1:5;
> > > +	unsigned int ratelimit:1;	/* 0=skip, 1=print */  
> > 
> > That naming is less than intuitive.  Maybe expand it to ratelimit_print or
> > something like that.  
> 
> True, although it does match uses like "if (aer_ratelimit(...))"
> 
> I'll try ratelimit_print and see how you like it :)
> 
> > > +	unsigned int __pad1:4;
> > >  	unsigned int multi_error_valid:1;
> > >  
> > >  	unsigned int first_error:5;
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index 4f1bff0f000f..f9e684ac7878 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c  
> >   
> > > @@ -815,8 +843,19 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
> > >   */
> > >  static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
> > >  {
> > > +	/*
> > > +	 * Ratelimit AER log messages.  "dev" is either the source
> > > +	 * identified by the root's Error Source ID or it has an unmasked
> > > +	 * error logged in its own AER Capability.  If any of these devices
> > > +	 * has not reached its ratelimit, log messages for all of them.
> > > +	 * Messages are emitted when "e_info->ratelimit" is non-zero.
> > > +	 *
> > > +	 * Note that "e_info->ratelimit" was already initialized to 1 for the
> > > +	 * ERR_FATAL case.
> > > +	 */
> > >  	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
> > >  		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
> > > +		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);  
> > 
> > So this is a little odd.  I think it works but there is code inside
> > __ratelimit that I think we should not be calling for that
> > ERROR_FATAL case (whether we should call lots of times for each
> > device isn't obvious either but maybe that is more valid).
> > 
> > In the event of it already being 1 due to ERROR_FATAL you will
> > falsely trigger a potential print from inside __ratelimit() if we
> > were rate limited and no longer are but only skipped FATAL prints.
> > My concern is that function is kind of assuming it's only called in
> > cases where a rate limit decision is being made and the
> > implementation may change in future).  
> 
> Hmmm.  That's pretty subtle, thanks for catching this.
> 
> In the light of day, ".ratelimit = fatal ? 1 : 0" looks a bit sketchy.
> If we want to avoid ratelimiting AER_FATAL, maybe aer_ratelimit()
> should just return 1 ("print") unconditionally in that case, without
> calling __ratelimit():
> 
>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>   {
>     struct ratelimit_state *ratelimit;
> 
>     if (severity == AER_FATAL)
>       return 1;       /* AER_FATAL not ratelimited */
> 
>     if (severity == AER_CORRECTABLE)
>       ratelimit = &dev->aer_info->cor_log_ratelimit;
>     else
>       ratelimit = &dev->aer_info->uncor_log_ratelimit;
> 
>     return __ratelimit(ratelimit);
>   }

Neat solution so go with that.

> 
> That still leaves this question of how to deal with info->dev[] when
> there's more than one entry, which is kind of an annoying case that
> only happens for the native AER path.
> 
> I think it's because for a single AER interrupt from an RP/RCEC, we
> collect the root info in one struct aer_err_info and scrape all the
> downstream devices for anything interesting.  We visit each downstream
> device and is_error_source() reads its status register, but we only
> keep the pci_dev pointer, so aer_get_device_error_info() has to read
> the status registers *again*.  This all seems kind of obtuse.
> 
> The point of the OR above in add_error_device() was to try to match up
> RP/RCEC logging with downstream device logging so they're ratelimited
> the same.  If we ratelimit the Error Source ID based on the RP/RCEC
> and the details based on the downstream devices individually, they'll
> get out of sync, so sometimes we'll print an Error Source ID and elide
> the details and vice versa.
> 
> I wanted to make it so that if we log downstream details, we also log
> the Error Source ID.  But maybe we should ratelimit downstream devices
> individually (instead of doing this weird union) and make the RP/RCEC
> part more explicit, e.g.,
> 
>   add_error_device(...)
>   {
>     int i = e_info->error_dev_num;
> 
>     e_info->dev[i] = pci_dev_get(dev);
>     e_info->error_dev_num++;
> 
>     if (aer_ratelimit(dev, e_info->severity)) {
>       e_info->root_ratelimit_print = 1;
>       e_info->ratelimit_print[i] = 1;
>     }
>   }

As it's a weird corner case, I don't really mind how you handle it.
I'm not sure I grasp this last suggestion fully but can look at the full
code if you do go with something like that.

Jonathan

> 
> > https://elixir.bootlin.com/linux/v6.14.7/source/lib/ratelimit.c#L56
> > 
> > Maybe, 
> > 		if (!info->ratelimit)
> > 			e_info->ratelimit = aer_ratelimit(dev, e_info->severity);
> > is an alternative option.
> > That allows a multiplication factor on the rate as all device count for 1.  


