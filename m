Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49440558343
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 19:28:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTS046RsCz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 03:28:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LUF+Z1Pf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LUF+Z1Pf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTRzW0mjVz3bpy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 03:28:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 085C861F09;
	Thu, 23 Jun 2022 17:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C00C3411B;
	Thu, 23 Jun 2022 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656005284;
	bh=zKTHUEkMNbZcc0IfdYhL4S+A/UWDDSTSzsFXGIjten8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LUF+Z1PfLas2pb5K370GJ2gIxWvky9TVIVHg3VrtLDDtbSoaDmcyPhhCt5oLn6rBC
	 C3XR0qizSeh7cEjS4xn+0xj2PhaMas/lnO3KWYz/qJIocmcWwkymycV4F+D3EzY3N7
	 vFh9r62bduK2gNXt6G+97KwDxYRnmJV9oz0GCz6RfGkkg9+kCHR5egw6XvChuMm3PO
	 zsc5QLQrMneyg7E8dDcDSRlvs07+0cVh2NwyTp8H5jZpxD2muts6V3AXUgPPscFZrX
	 mJ98SMqDVJwYP4EOZwtVIibcWUTBdW9kYlgdo0NgRY2FpIVOTZIVA45WI2Cg4ds7Ux
	 N/3UGODsqUpSA==
Date: Thu, 23 Jun 2022 12:28:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v4 2/2] PCI/DPC: Disable DPC service when link is in
 L2/L3 ready, L2 and L3 state
Message-ID: <20220623172802.GA1461319@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p61knfUS02Ny9JCn18F8EgiP0EmJjJcPZ6PoKsPC0y5Hg@mail.gmail.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 21, 2022 at 10:27:31AM +0800, Kai-Heng Feng wrote:
> On Mon, Apr 18, 2022 at 10:41 AM Sathyanarayanan Kuppuswamy
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > On 4/8/22 8:31 AM, Kai-Heng Feng wrote:
> > > On Intel Alder Lake platforms, Thunderbolt entering D3cold can cause
> > > some errors reported by AER:
> > > [   30.100211] pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: 0000:00:1d.0
> > > [   30.100251] pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), type=Transaction Layer, (Requester ID)
> > > [   30.100256] pcieport 0000:00:1d.0:   device [8086:7ab0] error status/mask=00100000/00004000
> > > [   30.100262] pcieport 0000:00:1d.0:    [20] UnsupReq               (First)
> > > [   30.100267] pcieport 0000:00:1d.0: AER:   TLP Header: 34000000 08000052 00000000 00000000
> > > [   30.100372] thunderbolt 0000:0a:00.0: AER: can't recover (no error_detected callback)
> > > [   30.100401] xhci_hcd 0000:3e:00.0: AER: can't recover (no error_detected callback)
> > > [   30.100427] pcieport 0000:00:1d.0: AER: device recovery failed
> > >
> > > Since AER is disabled in previous patch for a Link in L2/L3 Ready, L2
> > > and L3, also disable DPC here as DPC depends on AER to work.
> > >
> > > Bugzilla:https://bugzilla.kernel.org/show_bug.cgi?id=215453
> > > Reviewed-by: Mika Westerberg<mika.westerberg@linux.intel.com>
> > > Signed-off-by: Kai-Heng Feng<kai.heng.feng@canonical.com>
> >
> > Reviewed-by: Kuppuswamy Sathyanarayanan
> > <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> A gentle ping...

See questions here:
https://lore.kernel.org/r/20220422222433.GA1464120@bhelgaas
