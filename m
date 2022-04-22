Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8250C23C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 00:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlTWZ3qFCz3bpm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 08:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VqtUDtOS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VqtUDtOS; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlTVX4N4cz3bfq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 08:24:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C34286216A;
 Fri, 22 Apr 2022 22:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0321DC385A4;
 Fri, 22 Apr 2022 22:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650666289;
 bh=fxJN1ADA+sWdw61IyEj2dQRFCoL52sBZQvlid/cA61E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VqtUDtOScYsh+v96PGvVuNJA4iiHe4wsX46n78PX9q4xuJr4S6lfCl6udE4phxR/u
 sDHXMGvuAzZc6k/O/ylBMrhWqoKUnBwG7C5ApaG3dvc/NuXg1nY8RauzA29/0GmDro
 1ICAMa6ItEkonugBzifApV07hA+ZOEtw5b0KBCMGl5070QULczZzfIXskxOEF+najl
 aTycO/QVOeHZPtNQuDSa0R8rzenzctAjN95/NGV3u1gWS26b6FORAce58dfg65PyO/
 ufKiRA4WAVh9U+K66a47bC89lTQwcc7r4i++WXCUnFem/zek52SNa/UNDn4q96ZeV4
 dD7MKEizgG/SQ==
Date: Fri, 22 Apr 2022 17:24:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rajvi Jingar <rajvi.jingar@intel.com>
Subject: Re: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
Message-ID: <20220422222446.GA1522716@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba571993-90fb-ae67-6617-0b63571298be@intel.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Oliver O'Halloran <oohall@gmail.com>, david.e.box@linux.intel.com,
 bhelgaas@google.com, mika.westerberg@linux.intel.com, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc other folks interested in PTM from https://lore.kernel.org/r/20220408153159.106741-1-kai.heng.feng@canonical.com]

On Thu, Apr 14, 2022 at 07:54:02PM +0200, Rafael J. Wysocki wrote:
> On 3/25/2022 8:50 PM, Rajvi Jingar wrote:
> > For the PCIe devices (like nvme) that do not go into D3 state still need to
> > disable PTM on PCIe root ports to allow the port to enter a lower-power PM
> > state and the SoC to reach a lower-power idle state as a whole. Move the
> > pci_disable_ptm() out of pci_prepare_to_sleep() as this code path is not
> > followed for devices that do not go into D3. This patch fixes the issue
> > seen on Dell XPS 9300 with Ice Lake CPU and Dell Precision 5530 with Coffee
> > Lake CPU platforms to get improved residency in low power idle states.
> > 
> > Fixes: a697f072f5da ("PCI: Disable PTM during suspend to save power")
> > Signed-off-by: Rajvi Jingar <rajvi.jingar@intel.com>
> > Suggested-by: David E. Box <david.e.box@linux.intel.com>

> > ---
> >   v1 -> v2: add Fixes tag in commit message
> >   v2 -> v3: move changelog after "---" marker
> >   v3 -> v4: add "---" marker after changelog
> > ---
> >   drivers/pci/pci-driver.c | 10 ++++++++++
> >   drivers/pci/pci.c        | 10 ----------
> >   2 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > index 8b55a90126a2..ab733374a260 100644
> > --- a/drivers/pci/pci-driver.c
> > +++ b/drivers/pci/pci-driver.c
> > @@ -847,6 +847,16 @@ static int pci_pm_suspend_noirq(struct device *dev)
> >   	if (!pci_dev->state_saved) {
> >   		pci_save_state(pci_dev);
> > +		/*
> > +		 * There are systems (for example, Intel mobile chips since Coffee
> > +		 * Lake) where the power drawn while suspended can be significantly
> > +		 * reduced by disabling PTM on PCIe root ports as this allows the
> > +		 * port to enter a lower-power PM state and the SoC to reach a
> > +		 * lower-power idle state as a whole.
> > +		 */
> > +		if (pci_pcie_type(pci_dev) == PCI_EXP_TYPE_ROOT_PORT)
> > +			pci_disable_ptm(pci_dev);

Why is disabling PTM dependent on pci_dev->state_saved?  The point of
this is to change the behavior of the device, and it seems like we
want to do that regardless of whether the driver has used
pci_save_state().

Bjorn
