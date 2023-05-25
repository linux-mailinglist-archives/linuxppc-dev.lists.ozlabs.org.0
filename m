Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89F7119EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 00:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS28M1TdDz3fHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 08:01:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tlUgaxrF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tlUgaxrF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS27Q3N8Vz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 08:01:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0B6B615AD;
	Thu, 25 May 2023 22:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A547C433D2;
	Thu, 25 May 2023 22:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685052063;
	bh=ptE4zUO2N1qn5e28e8ELQ07KDbno8edydjVNz2FJipk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tlUgaxrF3z9IwUeA0DGL4h+NIbcmOJM/r14l3L3I9HRklMIf5eX3CeONLvzDEntda
	 osuUN5uTSj89B76YksTuXRcjG3o8fnn1/nKVfoBt6SjNv1TMJy8pxP0weYoXN08/LZ
	 NnWpZaqHEPkpZ9EFY31YI9li4C+FWhtxNf9dtO5psADQ1v26O4DYueomEjqdkpDHdo
	 L9s2ilCnNe0E8J44KETH5vfeLzcAjK1qIvGazQyKlmwaBwWn7amMIDus4DjZp+Q/fw
	 CgxEXg46iB38Nmidqd9ugZLtJxkJb0isTuKOi0eGXQXe/NfDzgbtfkzFzNEvgjyGAN
	 CxYZdeN6e4wtQ==
Date: Thu, 25 May 2023 17:01:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v4 22/23] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZG/anZ78FukSpERs@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG/TKOgMTSljryHN@rric.localdomain>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, ira.weiny@intel.com, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, vishal.l.verma@intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 11:29:58PM +0200, Robert Richter wrote:
> eOn 24.05.23 16:32:35, Bjorn Helgaas wrote:
> > On Tue, May 23, 2023 at 06:22:13PM -0500, Terry Bowman wrote:
> > > From: Robert Richter <rrichter@amd.com>
> > > 
> > > In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> > > RCiEP, but CXL downstream and upstream ports are not enumerated and
> > > not visible in the PCIe hierarchy. Protocol and link errors are sent
> > > to an RCEC.
> > >
> > > Restricted CXL host (RCH) downstream port-detected errors are signaled
> > > as internal AER errors, either Uncorrectable Internal Error (UIE) or
> > > Corrected Internal Errors (CIE). 
> > 
> > From the parallelism with RCD above, I first thought that RCH devices
> > were non-RCD mode and *were* enumerated as part of the PCIe hierarchy,
> > but actually I suspect it's more like the following?
> > 
> >   ... but CXL downstream and upstream ports are not enumerated and not
> >   visible in the PCIe hierarchy.
> > 
> >   Protocol and link errors from these non-enumerated ports are
> >   signaled as internal AER errors ... via a CXL RCEC.
> 
> Exactly, except the RCEC is standard PCIe and also must not
> necessarily on the same PCI bus as the CXL RCiEPs are.

So make it "RCEC" instead of "CXL RCEC", I guess?  PCIe r6.0, sec
7.9.10.3, allows an RCEC to be associated with RCiEPs on different
buses, so nothing to see there.

> > > The error source is the id of the RCEC.
> > 
> > This seems odd; I assume this refers to the RCEC's AER Error Source
> > Identification register, and the ERR_COR or ERR_FATAL/NONFATAL Source
> > Identification would ordinarily be the Requester ID of the RCiEP that
> > "sent" the Error Message.  But you're saying it's actually the ID of
> > the *RCEC*, not the RCiEP?
> 
> Right, the downstream port has its own AER ext capability in
> non-config (io mapped) RCRB register range. Errors originating from
> there are signaled as internal AER errors via the RCEC *with* the
> RCEC's Requester ID. Code walks through all associated CXL endpoints,
> determines the dport and checks its AER.
> 
> There is also an RDPAS structure defined in CXL but that is only a
> different way to provide the RCEC to dport association instead of
> using the RCEC's Endpoint Association Extended Capability. In the end
> we get all associated RCHs and check the AER of all their dports.
> 
> The upstream port is signaled using the RCiEP's AER. CXL spec is
> strict here: "Upstream Port RCRB shall not implement the AER Extended
> Capability." The RCiEP's requestor ID is used then and its config
> space the AER is in.
> 
> CXL.cachemem errors are reported with the RCiEP as requester
> too. Status is in the CXL RAS cap and the UIE or CIE is set
> respectively in the AER status of the RCiEP.
>
> > We're going to call pci_aer_handle_error() as well, to handle the
> > non-internal errors, and I'm pretty sure that path expects the RCiEP
> > ID there.
> > 
> > Whatever the answer, I'm not sure this sentence is actually relevant
> > to this patch, since this patch doesn't read PCI_ERR_ROOT_ERR_SRC or
> > look at struct aer_err_source.id.
> 
> The source id is used in aer_process_err_devices() which finally calls
> handle_error_source() for the device with the requestor id. This is
> the place where cxl_rch_handle_error() checks if it is an RCEC that
> received an internal error and has cxl devices connected to it. Then,
> the request is forwarded to the cxl_mem handler which also needs to
> check the dport now. That is, pcie_walk_rcec() in
> cxl_rch_handle_error() is called with the RCEC's pci handle,
> cxl_rch_handle_error_iter() with the RCiEP's pci handle.

I'm still not sure this is relevant.  Isn't that last sentence just
the way we always use pcie_walk_rcec()?

If there's something *different* here about CXL, and it's important to
this patch, sure.  But I don't see that yet.  Maybe a comment in the
code if you think it's important to clarify something there.

Bjorn
