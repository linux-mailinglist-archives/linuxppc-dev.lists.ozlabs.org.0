Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189006E2BDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:50:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyqqb6hpTz3fVr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 07:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=buZL1sGM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=buZL1sGM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyqpn2wM9z3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 07:49:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F62260C13;
	Fri, 14 Apr 2023 21:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAA5C433EF;
	Fri, 14 Apr 2023 21:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681508959;
	bh=1x7EeM3VZ+EADcoA4/MQ8ManxznxDJ06SrvK/B28czY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=buZL1sGMoy9FUtbGI+SKPAjVXE/ApbZRPVdEhzF5fgwsrF+S5TyVwqkdw1ffvFIhv
	 d7kJg+pZpaE/I8r5dztw0BY9z3yT5AcfzB9enLYzZ5dtfm//nJSyOkf4X2Fx22yR/4
	 RNwGj7CSMBBvAaq4NptWIRn5GlMvi5HWe+i8p3KsMDT8L71rv3py005BUOgMr5l9Qa
	 AHVMVeih/iJM2dikBR0OoPsc4oY8s5H6JfcZtvL4kvUPJgLVoJy5JIS1x2VYe0ipag
	 iX9G2b1kOubjkeH8LZ9uX2+FUFv/N7C/r0lzuLwJsXTIOrRCzuNCJ9WsKX9WzFL16T
	 oa6Ri90e7zJZQ==
Date: Fri, 14 Apr 2023 16:49:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <20230414214917.GA221407@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgFv6AtCXkVl8IQ@rric.localdomain>
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan.Cameron@huawei.com, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 13, 2023 at 03:38:07PM +0200, Robert Richter wrote:
> On 12.04.23 16:29:01, Bjorn Helgaas wrote:
> > On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:
> > > From: Robert Richter <rrichter@amd.com>
> > > 
> > > RCEC AER corrected and uncorrectable internal errors (CIE/UIE) are
> > > disabled by default.

> > > +static void cxl_unmask_internal_errors(struct pci_dev *rcec)
> 
> Also renaming this to cxl_enable_rcec() to more generalize the
> function.

I didn't follow this.  "cxl_enable_rcec" doesn't say anything about
"unmasking" or "internal errors", which seems like the whole point.
And the function doesn't actually *enable* and RCEC.

> > > +{
> > > +	if (!handles_cxl_errors(rcec))
> > > +		return;
> > > +
> > > +	if (__cxl_unmask_internal_errors(rcec))
> > > +		dev_err(&rcec->dev, "cxl: Failed to unmask internal errors");
> > > +	else
> > > +		dev_dbg(&rcec->dev, "cxl: Internal errors unmasked");
> 
> I am going to change this to a pci_info() for alignment with other
> messages around:
> 
> [   14.200265] pcieport 0000:40:00.3: PME: Signaling with IRQ 44
> [   14.213925] pcieport 0000:40:00.3: AER: cxl: Internal errors unmasked
> [   14.228413] pcieport 0000:40:00.3: AER: enabled with IRQ 44
> 
> Plus, using pci_err() instead of dev_err().

Thanks for that!

Bjorn
