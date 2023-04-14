Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B86E2BC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyqSp6qsNz3fWK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 07:33:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WdZ8f4zN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WdZ8f4zN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyqRv62Lbz3c8G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 07:32:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64500647F9;
	Fri, 14 Apr 2023 21:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7ADC433EF;
	Fri, 14 Apr 2023 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681507975;
	bh=dVz860V7djdss/UKGiiKvEJO6jYVRvEtcJXJXr82MBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WdZ8f4zNekBFfkd3OEeT3EecKu5j5HgMdLa+Bm0eBfcqC/VObw0tFz+JkVGGh6JPD
	 rHEmzv6/PAfYerD6eZwTknbbihPieLtTkDYeAGJtPlvlWsSmvPFNLwukmkhgXYFBn0
	 MsvCplZaaXrBBic1m5T4Kq9Pwo5oefHv3y2it65jMQew07d3CV99QrC4Rwf+OV7fth
	 bneh1EQvwqMT9pdqAIfLlXxdW6UzPf6s58Slfsc+Vpofk3nFoxrXy+h0kphpSEwgQF
	 WbjJdOY0aiLJ5b4Dx4Ty9wih9NuKTzy9VDSD5l7DV2KArgEZjTzjZ5oF2EgrTuE/zE
	 q6lIOJDl3vAhQ==
Date: Fri, 14 Apr 2023 16:32:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <20230414213254.GA219190@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDfbLF1ZYc3uIC19@rric.localdomain>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, ira.weiny@intel.com, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, vishal.l.verma@intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 13, 2023 at 01:40:52PM +0200, Robert Richter wrote:
> On 12.04.23 17:02:33, Bjorn Helgaas wrote:
> > On Tue, Apr 11, 2023 at 01:03:01PM -0500, Terry Bowman wrote:
> > > From: Robert Richter <rrichter@amd.com>

> ...
> Let's assume just a simple CXL RCH topology:
> 
> PCI hierarchy:
> 
>               -----------------
>               | ACPI0016      |--------------       Host bridge (CXL host)
>               | - CEDT        |             |
>    -----------|   - RCRB base |             |
>    |          -----------------             :
>    |               |
>    |               |
>    |          -------------------     ---------
>    |          | RCiEP           |.....| RCEC  |     Endpoint (CXL dev)
>    |  --------| - BDF           |     | - BDF |
>    |  |       | - PCIe AER      |     ---------
>    |  |       | - CXL dvsec     |
>    |  |       |   (v2: reg loc) |
>    |  |       |   - Comp regs   |
>    |  |       |     - CXL RAS   |
>    |  |       -------------------
>    :  :
>       
> CXL hierarchy:
> 
>    :                                        :
>    :          ------------------            |
>    |          | CXL root port  |<------------
>    |          |                |        
>    |--------->| - dport RCRB   |<------------
>    |          |   - PCIe AER   |            |
>    |          |   - Comp regs  |            |
>    |          |     - CXL RAS  |            |
>    |          ------------------            |
>    |  :                                     |
>    |  |       ------------------            |
>    |  ------->| CXL endpoint   |-------------
>    |          | (v1: RCRB)     |
>    ---------->| - uport RCRB   |
>               |   - Comp regs  |
>               |     - CXL RAS  |
>               ------------------
> 
> Dport detected errors are reported using PCIe AER and CXL RAS caps in
> the dports RCRB.
> 
> Uport detected errors are reported using RCiEP's PCIe AER cap and
> either the uport's RCRB RAS cap or the RAS cap of the comp regs
> located using CXL DVSEC register locator.
> 
> In all cases the RCEC is used with either the RCEC (dport errors) or
> the RCiEP (uport errors) error source id (BDF: bus, dev, func).

I'm mostly interested in the PCI entities involved because that's all
aer.c can deal with.  For the above, I think the PCI core only knows
about these:

  00:00.0 RCEC  with AER, RCEC EA includes 00:01.0
  00:01.0 RCiEP with AER

aer_irq() would handle AER interrupts from 00:00.0.
cxl_handle_error() would be called for 00:00.0 and would call
handle_error_source() for everything below it (only 00:01.0 here).

> > The current code uses pcie_walk_rcec() in this path, which basically
> > searches below a Root Port or RCEC for devices that have an AER error
> > status bit set, add them to the e_info[] list, and call
> > handle_error_source() for each one:
> 
> For reference, this series adds support to handle RCH downstream
> port-detected errors as described in CXL 3.0, 12.2.1.1.
> 
> This flow looks correct to me, see comments inline.

We seem to be on the same page here, so I'll trim it out.

> ...
> > So we insert cxl_handle_error() in handle_error_source(), where it
> > gets called for the RCEC, and then it uses pcie_walk_rcec() again to
> > forcibly call handle_error_source() for *every* device "below" the
> > RCEC (even though they don't have AER error status bits set).
> 
> The CXL device contains the links to the dport's caps. Also, there can
> be multiple RCs with CXL devs connected to it. So we must search for
> all CXL devices now, determine the corresponding dport and inspect
> both, PCIe AER and CXL RAS caps.
> 
> > Then handle_error_source() ultimately calls the CXL driver err_handler
> > entry points (.cor_error_detected(), .error_detected(), etc), which
> > can look at the CXL-specific error status in the CXL RAS or RCRB or
> > whatever.
> 
> The AER driver (portdrv) does not have the knowledge of CXL internals.
> Thus the approach is to pass dport errors to the cxl_mem driver to
> handle it there in addition to cxl mem dev errors.
> 
> > So this basically looks like a workaround for the fact that the AER
> > code only calls handle_error_source() when it finds AER error status,
> > and CXL doesn't *set* that AER error status.  There's not that much
> > code here, but it seems like a quite a bit of complexity in an area
> > that is already pretty complicated.

My main point here (correct me if I got this wrong) is that:

  - A RCEC generates an AER interrupt

  - find_source_device() searches all devices below the RCEC and
    builds a list everything for which to call handle_error_source()

  - cxl_handle_error() *again* looks at all devices below the same
    RCEC and calls handle_error_source() for each one

So the main difference here is that the existing flow only calls
handle_error_source() when it finds an error logged in an AER status
register, while the new CXL flow calls handle_error_source() for
*every* device below the RCEC.

I think it's OK to do that, but the almost recursive structure and the
unusual reference counting make the overall AER flow much harder to
understand.

What if we changed is_error_source() to add every CXL.mem device it
finds to the e_info[] list, which I think could nicely encapsulate the
idea that "CXL devices have error state we don't know how to interpret
here"?  Would the existing loop in aer_process_err_devices() then do
what you need?

> > Here's another idea: the ACPI GHES code (ghes_handle_aer()) basically
> > receives a packet of error status from firmware and queues it for
> > recovery via pcie_do_recovery().  What if you had a CXL module that
> > knew how to look for the CXL error status, package it up similarly,
> > and queue it via aer_recover_queue()?
> 
> ...
> But first, RCEC error notifications (RCEC AER interrupts) must be sent
> to the CXL driver to look into the dport's RCRB.

Right.  I think it could be solvable to have aer_irq() call or wake a
CXL interface that has been registered.  But maybe changing
is_error_source() would be simpler.

Bjorn
