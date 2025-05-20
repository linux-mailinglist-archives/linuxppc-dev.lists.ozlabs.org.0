Return-Path: <linuxppc-dev+bounces-8766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C22ABE3D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 21:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b24bj5Pbbz3bYx;
	Wed, 21 May 2025 05:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747769905;
	cv=none; b=S+ihkvKGruQgoTOycCsD+6R9nxN1PXOjnQbWOy4dEdni4lIG6C9qM1tV7t6Yq2jpoW1qmKmmh1sXlPNgRWWQD+u0t7K5l47ZsIYDbgK4OTvvI0R3efZhf7n3Re/mE7l2cbw6aTLqLelhlRdwFE/NvL8Zwf8+YH+uBQpl03hMxrdWwSC0qKwH9yqaWeqUab7tTq1qc88ZemCtZh2Diuga6JCeT2+NcG9PC0pSxGKVc72W47psZZVkPGR+iluFgKaETaLKEwAAHgnrxRUSd1h294f7iTgY4Lnm/0wnldmFGjYl8pG70bA2grMnwZisWkJCN06ppmY/qYuJva2OMPQnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747769905; c=relaxed/relaxed;
	bh=w6EHCl0Gs8wmGRDrG6xvWJdf+hLhYpTze823rTqSW1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dXynzEyV3FXHHchN/EFpFuk0Kdrlp87pijIVMtVeqPjDHVo/VPDxhMWBYzm0ktBqxjeUp4EbXAf3AVOHN8+bBZcgfFIFxkiHaYrjVtIHLMkhlH/5zwnZSQ4iwQGBSL5leEiC6io9K+8oUhBhVJlhpmmu0nfTzdJGQv/2kOtQBjd7bY1BRqlW1ZiCgfb7LMOzN3cIG4tKB39YRgDLp50SecgfUfz9gIcy1rezuw0qahcAuAiLWgOaiBI3otD1HEpwxEb6hB4/u2ZEKv79LXR7Yk6WBKKJWHV0ZQ7Hb7lQtmlnBCrjkWHx873/RlX5ny9KZ3s/ewN5UsyYkJI/qwWhNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IAU8LXRP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IAU8LXRP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b24bh1gyLz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 05:38:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78EBA629E5;
	Tue, 20 May 2025 19:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB804C4CEE9;
	Tue, 20 May 2025 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769901;
	bh=YtynzzOjmtbSgflGVRNroS8xiOdA61c9iv0Eb1pXHsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IAU8LXRPLq8n2P+sOZB+ws0nPRSX8pkj5PY+JNtGXH7t10US27FGmOh4dfDUb6kT/
	 5n2Fj9Q6y5rYwA44U/T7OSUv5XSaJsbWuR1ZpP8SJgLxw6bXj2A+Uy3zZZqNhZqXJj
	 hGfb5FGaoJwDgnS/jnKp596+PZLPm4xgctVAxPfziliuvt597Ky1axMJrQEzB6595q
	 c8XrS1Xz/W/FkdVm8UqwgGjOnTsjrgoqP1u5nYQd7YHUSJmT3RguNwHqCrJ6tMtgYf
	 Ey5hatKp0J+he1918aDcyhhNm9Csz27wwrYiVA5XkZL3YKo7j31nBe2+Seho6u/Yem
	 wSw07Zq4mIJIQ==
Date: Tue, 20 May 2025 14:38:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 14/16] PCI/AER: Introduce ratelimit for error logs
Message-ID: <20250520193819.GA1318016@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a983acbd-bf6e-63df-a3cc-e4d61a602537@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 02:55:32PM +0300, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Bjorn Helgaas wrote:
> 
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Spammy devices can flood kernel logs with AER errors and slow/stall
> > execution. Add per-device ratelimits for AER correctable and uncorrectable
> > errors that use the kernel defaults (10 per 5s).
> > 
> > There are two AER logging entry points:
> > 
> >   - aer_print_error() is used by DPC and native AER
> > 
> >   - pci_print_aer() is used by GHES and CXL
> > 
> > The native AER aer_print_error() case includes a loop that may log details
> > from multiple devices.  This is ratelimited by the union of ratelimits for
> > these devices, set by add_error_device(), which collects the devices.  If
> > no such device is found, the Error Source message is ratelimited by the
> > Root Port or RCEC that received the ERR_* message.
> > 
> > The DPC aer_print_error() case is currently not ratelimited.
> > 
> > The GHES and CXL pci_print_aer() cases are ratelimited by the Error Source
> > device.

> >  static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
> >  {
> > +	/*
> > +	 * Ratelimit AER log messages.  Generally we add the Error Source
> > +	 * device, but there are is_error_source() cases that can result in
> > +	 * multiple devices being added here, so we OR them all together.
> 
> I can see the code uses OR ;-) but I wasn't helpful because this comment 
> didn't explain why at all. As this ratelimit thing is using reverse logic 
> to begin with, this is a very tricky bit.
> 
> Perhaps something less vague like:
> 
> ... we ratelimit if all devices have reached their ratelimit.
> 
> Assuming that was the intention here? (I'm not sure.)

My intention was that if there's any downstream device that has an
unmasked error logged and it has not reached its ratelimit, we should
log messages for all devices with errors logged.  Does something like
this help?

  /*
   * Ratelimit AER log messages.  "dev" is either the source
   * identified by the root's Error Source ID or it has an unmasked
   * error logged in its own AER Capability.  If any of these devices
   * has not reached its ratelimit, log messages for all of them.
   * Messages are emitted when e_info->ratelimit is non-zero.
   *
   * Note that e_info->ratelimit was already initialized to 1 for the
   * ERR_FATAL case.
   */

The ERR_FATAL case is from this post-v6 change that I haven't posted
yet:

  aer_isr_one_error(...)
  {
    ...
    if (status & PCI_ERR_ROOT_UNCOR_RCV) {
      int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
      struct aer_err_info e_info = {
        ...
 +      .ratelimit = fatal ? 1 : 0;


> > +	 */
> >  	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
> >  		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
> > +		e_info->ratelimit |= aer_ratelimit(dev, e_info->severity);
> >  		e_info->error_dev_num++;
> >  		return 0;
> >  	}

> > @@ -1147,9 +1183,10 @@ static void aer_recover_work_func(struct work_struct *work)
> >  		pdev = pci_get_domain_bus_and_slot(entry.domain, entry.bus,
> >  						   entry.devfn);
> >  		if (!pdev) {
> > -			pr_err("no pci_dev for %04x:%02x:%02x.%x\n",
> > -			       entry.domain, entry.bus,
> > -			       PCI_SLOT(entry.devfn), PCI_FUNC(entry.devfn));
> > +			pr_err_ratelimited("%04x:%02x:%02x.%x: no pci_dev found\n",
> 
> This case was not mentioned in the changelog.

Sharp eyes!  What do you think of this commit log text?

  The CXL pci_print_aer() case is ratelimited by the Error Source device.

  The GHES pci_print_aer() case is via aer_recover_work_func(), which
  searches for the Error Source device.  If the device is not found, there's
  no per-device ratelimit, so we use a system-wide ratelimit that covers all
  error types (correctable, non-fatal, and fatal).

This isn't really ideal because in pci_print_aer(), the struct
aer_capability_regs has already been filled by firmware and the
logging doesn't read any registers from the device at all.

However, pci_print_aer() *does* want the pci_dev for statistics and
tracing (pci_dev_aer_stats_incr()) and, of course, for the aer_printks
themselves.

We could leave this pr_err() completely alone; hopefully it's a rare
case.  I think the CXL path just silently skips pci_print_aer() if
this happens.

Eventually I would really like the native AER path to start by doing
whatever firmware is doing, e.g., fill in struct aer_capability_regs,
so the core of the AER handling could be identical between native AER
and GHES/CXL.  If we could do that, maybe we could figure out a
cleaner way to handle this corner case.

