Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E04706D98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 18:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLyb51Z65z3fXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 02:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HRIrO/lv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HRIrO/lv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLyYy1wvLz3fGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 02:03:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0C7A611D0;
	Wed, 17 May 2023 16:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BEAC433D2;
	Wed, 17 May 2023 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684339379;
	bh=XEUGLjgsvQzAyDLKC/1cWemgrt9p4X70cKwfQqfNFVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HRIrO/lvsge46jtx3D/H5ni/QHrwKrq+SQbPcWG3gfZaAb0LI4MU0eeaPh8eGezoa
	 eKMW44oZXF2MVrmMTK6JEhL9V9WW4TJSa/xrFVwyIeWkTky7xJAvm45RXgQ8Oe5KCr
	 eOJZpp4wblXyIhuUksLv/Wp3yP0r5ixHunJzxn02L22Zx+1or1j1ZnFoOf4U9b9q6z
	 GxpjHFiKPBj2eRjX0sHjDSdTTaaTQkRmlKCCwPWcTjmxupgYPiO7GtMnP4+HeJjdDP
	 lJvPtuzxrv9ZvBtMMHGIj/uMqUhiFh1NyNdHJ2enAlodykiOMNBG2iGtYNPsIQ7QC+
	 j4wcboCC7NIaA==
Date: Wed, 17 May 2023 11:02:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Grant Grundler <grundler@chromium.org>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
Message-ID: <ZGT6sTOtk+WY3aYt@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANEJEGsE6KS484iSLkKV8hx2nNThZGfaaz+u+R-A3X5nRev6Gg@mail.gmail.com>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 07, 2023 at 04:46:03PM -0700, Grant Grundler wrote:
> On Fri, Apr 7, 2023 at 12:46 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > > On Thu, Apr 6, 2023 at 12:50 PM Bjorn Helgaas <helgaas@kernel.org>
> > wrote:
> > > > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > > > >
> > > > > There are many instances where correctable errors tend to inundate
> > > > > the message buffer. We observe such instances during thunderbolt PCIe
> > > > > tunneling.
> > > ...
> >
> > > > >               if (info->severity == AER_CORRECTABLE)
> > > > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
> > > > > -                             info->first_error == i ? " (First)" :
> > "");
> > > > > +                     pci_info_ratelimited(dev, "   [%2d]
> > %-22s%s\n", i, errmsg,
> > > > > +                                          info->first_error == i ?
> > " (First)" : "");
> > > >
> > > > I don't think this is going to reliably work the way we want.  We have
> > > > a bunch of pci_info_ratelimited() calls, and each caller has its own
> > > > ratelimit_state data.  Unless we call pci_info_ratelimited() exactly
> > > > the same number of times for each error, the ratelimit counters will
> > > > get out of sync and we'll end up printing fragments from error A mixed
> > > > with fragments from error B.
> > >
> > > Ok - what I'm reading between the lines here is the output should be
> > > emitted in one step, not multiple pci_info_ratelimited() calls. if the
> > > code built an output string (using sprintnf()), and then called
> > > pci_info_ratelimited() exactly once at the bottom, would that be
> > > sufficient?
> > >
> > > > I think we need to explicitly manage the ratelimiting ourselves,
> > > > similar to print_hmi_event_info() or print_extlog_rcd().  Then we can
> > > > have a *single* ratelimit_state, and we can check it once to determine
> > > > whether to log this correctable error.
> > >
> > > Is the rate limiting per call location or per device? From above, I
> > > understood rate limiting is "per call location".  If the code only
> > > has one call location, it should achieve the same goal, right?
> >
> > Rate-limiting is per call location, so yes, if we only have one call
> > location, that would solve it.  It would also have the nice property
> > that all the output would be atomic so it wouldn't get mixed with
> > other stuff, and it might encourage us to be a little less wordy in
> > the output.
> >
> 
> +1 to all of those reasons. Especially reducing the number of lines output.
> 
> I'm going to be out for the next week. If someone else (Rajat Kendalwal
> maybe?) wants to rework this to use one call location it should be fairly
> straight forward. If not, I'll tackle this when I'm back (in 2 weeks
> essentially).

Ping?  Really hoping to merge this for v6.5.

Bjorn
