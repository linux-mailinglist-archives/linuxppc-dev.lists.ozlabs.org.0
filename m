Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78A53D3FC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 01:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFKcQ3FPsz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 09:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VEpgatTq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VEpgatTq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFKbq5lMLz30BP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 09:59:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9483D60AE3;
	Fri,  3 Jun 2022 23:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56C1C385A9;
	Fri,  3 Jun 2022 23:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654300739;
	bh=0BSB0KdJ9TZOGWmSitv+cPteX1vDEFfMvQFuucYCfS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VEpgatTqZ3vbeJ6CESNEHBVV/eafdAvzizMYVPxwY2w2PrVkXxaYaoSC7STz5vN8O
	 oOYGSShPOij3kbgr/AXDqqMcdFpa6paCxFHeRks4vGIwa6LelF+o1UNbLuQxd6kVwT
	 PwedxrQ5J6a6IPpYDoE769AC/mbXl4PYsWhAm3l4TWFtQut2K+jSRM3tb0YRxZSDhz
	 LSMnN2A0xyUlfmuIocYzzl9XoLqGHRhZLalwmwmNJakY8tLC/v7+rkgoHwBh9OFuLp
	 8JjOaPsaDD/SlpHkU1ZgxVBPfzqLjIWapsO7kx8VXMO9Ix3JHmt/RvVn8Xytkl65lH
	 e+XFKCW9PVK+Q==
Date: Fri, 3 Jun 2022 18:58:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Subject: Re: [PATCH] PCI/AER: Iterate over error counters instead of error
Message-ID: <20220603235856.GA117911@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603221247.5118-1-mkhalfella@purestorage.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, ebadger@purestorage.com, oohall@gmail.com, msaggi@purestorage.com, bhelgaas@google.com, rajatja@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 03, 2022 at 10:12:47PM +0000, Mohamed Khalfella wrote:
> Is there any chance for this to land in 5.19?

Too late for v5.19, since the merge window will end in a couple days.
Remind me again if you don't see it in -next by v5.20-rc5 or so.

> On 5/10/22 14:17, Mohamed Khalfella wrote:
> > > Thanks for catching this; it definitely looks like a real issue!  I
> > > guess you're probably seeing junk in the sysfs files?
> > 
> > That is correct. The initial report was seeing junk when reading sysfs
> > files. As descibed, this is happening because we reading data past the
> > end of the stats counters array.
> > 
> > 
> > > I think maybe we should populate the currently NULL entries in the
> > > string[] arrays and simplify the code here, e.g.,
> > > 
> > > static const char *aer_correctable_error_string[] = {
> > >        "RxErr",                        /* Bit Position 0       */
> > >        "dev_cor_errs_bit[1]",
> > >	...
> > >
> > >  if (stats[i])
> > >    len += sysfs_emit_at(buf, len, "%s %llu\n", strings_array[i], stats[i]);
> > 
> > Doing it this way will change the output format. In this case we will show
> > stats only if their value is greater than zero. The current code shows all the
> > stats those have names (regardless of their value) plus those have non-zero
> > values.
> > 
> > >> @@ -1342,6 +1342,11 @@ static int aer_probe(struct pcie_device *dev)
> > >>  	struct device *device = &dev->device;
> > >>  	struct pci_dev *port = dev->port;
> > >>
> > >> +	BUILD_BUG_ON(ARRAY_SIZE(aer_correctable_error_string) <
> > >> +		     AER_MAX_TYPEOF_COR_ERRS);
> > >> +	BUILD_BUG_ON(ARRAY_SIZE(aer_uncorrectable_error_string) <
> > >> +		     AER_MAX_TYPEOF_UNCOR_ERRS);
> > >
> > > And make these check for "!=" instead of "<".
> 
> I am happy to remove these BUILD_BUG_ON() if you think it is a good
> idea to do so.

I think it's good to enforce correctness there somehow, so let's leave
them there unless somebody has a better idea.

> > This will require unnecessarily extending stats arrays to have 32 entries
> > in order to match names arrays. If you don't feel strogly about changing
> > "<" to "!=", I prefer to keep the code as it is. 
