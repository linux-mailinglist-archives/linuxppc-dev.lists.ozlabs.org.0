Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA8667E18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 19:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtCd44nYZz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 05:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6GRHU5n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t6GRHU5n;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtCc95mKgz30gk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 05:23:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 35F08B81FBD;
	Thu, 12 Jan 2023 18:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2664C433EF;
	Thu, 12 Jan 2023 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673547829;
	bh=Ay2RHNSirNXT1GRYS649GDJxRxbYFyfkrxZhR76Dcdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=t6GRHU5n/jOOlQVw5AFv3Vy11HGk01Af1l9tE4nx9BqMXZ+cT1RXa74QtWz4jAx6Q
	 xYiHTKDWPMBJCF2GOOzwEwsWjDSxYs3Rc8+CVOHIt53NAAgM+tXG3LdV3MtPCR46cu
	 +qw7+PID8uRVIdpVfl7V4KLjTVOwdocGNkZCaA1cWoIipmKACW0QMhrJ9mi7vxP+Lb
	 u1P2+accYtP0VlTWq8Ct7k3m1P43iVrwSNdmdf+lUM5gFVFBMj6DMHv84y9FZ7bV9O
	 NdSgrh2jC20ftj6e4dA8aZ3TLXcHe2Yd3bhxrtb4PwiV3Zt5Oja7HVGASJW3S3kZgq
	 g6ptCYbczlG8w==
Date: Thu, 12 Jan 2023 12:23:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Message-ID: <20230112182348.GA1777363@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
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
Cc: treding@nvidia.com, mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, Vidya Sagar <vidyas@nvidia.com>, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 03:27:51PM -0800, Sathyanarayanan Kuppuswamy wrote:
> On 1/11/23 3:10 PM, Bjorn Helgaas wrote:
> > On Wed, Jan 11, 2023 at 01:42:21PM -0800, Sathyanarayanan Kuppuswamy wrote:
> >> On 1/11/23 12:31 PM, Vidya Sagar wrote:
> >>> As the ECRC configuration bits are part of AER registers, configure
> >>> ECRC only if AER is natively owned by the kernel.
> >>
> >> ecrc command line option takes "bios/on/off" as possible options. It
> >> does not clarify whether "on/off" choices can only be used if AER is
> >> owned by OS or it can override the ownership of ECRC configuration 
> >> similar to pcie_ports=native option. Maybe that needs to be clarified.
> > 
> > Good point, what do you think of an update like this:
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 6cfa6e3996cf..f7b40a439194 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -4296,7 +4296,9 @@
> >  				specified, e.g., 12@pci:8086:9c22:103c:198f
> >  				for 4096-byte alignment.
> >  		ecrc=		Enable/disable PCIe ECRC (transaction layer
> > -				end-to-end CRC checking).
> > +				end-to-end CRC checking).  Only effective
> > +				if OS has native AER control (either granted by
> > +				ACPI _OSC or forced via "pcie_ports=native").
> >  				bios: Use BIOS/firmware settings. This is the
> >  				the default.
> >  				off: Turn ECRC off
> 
> Looks fine. But do we even need "bios" option? Since it is the default
> value, I am not sure why we need to list that as an option again. IMO
> this could be removed.

I agree, it seems pointless.

> > I don't know whether the "ecrc=" parameter is really needed.  If we
> > were adding it today, I would ask "why not enable ECRC wherever it is
> > supported?"  If there are devices where it's broken, we could always
> > add quirks to disable it on a case-by-case basis.
> 
> Checking the original patch which added it, it looks like the intention
> is to give option to boost performance over integrity.
> 
> commit 43c16408842b0eeb367c23a6fa540ce69f99e347
> Author: Andrew Patterson <andrew.patterson@hp.com>
> Date:   Wed Apr 22 16:52:09 2009 -0600
> 
>     PCI: Add support for turning PCIe ECRC on or off
>     
>     Adds support for PCI Express transaction layer end-to-end CRC checking
>     (ECRC).  This patch will enable/disable ECRC checking by setting/clearing
>     the ECRC Check Enable and/or ECRC Generation Enable bits for devices that
>     support ECRC.
>     
>     The ECRC setting is controlled by the "pci=ecrc=<policy>" command-line
>     option. If this option is not set or is set to 'bios", the enable and
>     generation bits are left in whatever state that firmware/BIOS set them to.
>     The "off" setting turns them off, and the "on" option turns them on (if the
>     device supports it).
>     
>     Turning ECRC on or off can be a data integrity versus performance
>     tradeoff.  In theory, turning it on will catch more data errors, turning
>     it off means possibly better performance since CRC does not need to be
>     calculated by the PCIe hardware and packet sizes are reduced.

Ah, right, and I think I was even part of the conversation when this
was added :)

I'm not sure I would make the same choice today, though.  IMHO it's
kind of hard to defend choosing performance over data integrity.

If a platform really wants to sacrifice integrity for performance, it
could retain control of AER, and after Vidya's patch, Linux will leave
the ECRC configuration alone.

Straw-man: If Linux owns AER and ECRC is supported, enable ECRC by
default.  Retain "ecrc=off" to turn it off, but drop a note in dmesg
and taint the kernel.

Bjorn
