Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AF5EAF40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbrPf2S5Sz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 04:09:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cc2VTt5Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cc2VTt5Y;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbrP44fBJz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 04:09:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4206BB80BA3;
	Mon, 26 Sep 2022 18:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6A3C433D6;
	Mon, 26 Sep 2022 18:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664215748;
	bh=f0vC5rcbDYjIyScqcWYY9GpgiQN1RROu0ZZ2a2E8E2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cc2VTt5YU8CMoAICIdScy9zbs3OhBWuctGyV31uYoLdX/jhHdprUjUqxyrBZ90I2m
	 h8N5ESFrH1aB8IMAdw2dYD0NCdAYmVAWblgzCt/FgA6kr9H6dIGoOFJ3yX0nTLyyk7
	 gb35oRC9yB3dTEzhLGg/AhrJGiOmlbX2LU1buRJYTRbUORZAxUyRtFt0UpbZ75PkX2
	 qC0+M6pIGnpbu+rX6ewu3bb5iebRbHY/rA+em1+StX155rtK6dt5K5tLJbhb+c0LDc
	 fbLcwRJOPUksuwO/XnLcreVRekt5Z59jz5qMlcdMO7KxrNiaxg692INePg4DaFbIMu
	 2iLGYmd1p3aOQ==
Date: Mon, 26 Sep 2022 13:09:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH 2/3] PCI/ERR: Clear fatal status in pcie_do_recovery()
Message-ID: <20220926180906.GA1609498@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1de80c28-33ec-b1bd-a557-91e4166d2da7@bytedance.com>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 10:01:55PM +0800, Zhuo Chen wrote:
> On 9/23/22 5:08 AM, Bjorn Helgaas wrote:
> > On Fri, Sep 02, 2022 at 02:16:33AM +0800, Zhuo Chen wrote:
> > > When state is pci_channel_io_frozen in pcie_do_recovery(),
> > > the severity is fatal and fatal status should be cleared.
> > > So we add pci_aer_clear_fatal_status().
> > 
> > Seems sensible to me.  Did you find this by code inspection or by
> > debugging a problem?  If the latter, it would be nice to mention the
> > symptoms of the problem in the commit log.
> 
> I found this by code inspection so I may not enumerate what kind of problems
> this code will cause.
> > 
> > > Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
> > > and pci_aer_clear_nonfatal_status() contains the function of
> > > 'if (host->native_aer || pcie_ports_native)', so we move them
> > > out of it.
> > 
> > Wrap commit log to fill 75 columns.
> > 
> > > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > > ---
> > >   drivers/pci/pcie/err.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> > > index 0c5a143025af..e0a8ade4c3fe 100644
> > > --- a/drivers/pci/pcie/err.c
> > > +++ b/drivers/pci/pcie/err.c
> > > @@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> > >   	 * it is responsible for clearing this status.  In that case, the
> > >   	 * signaling device may not even be visible to the OS.
> > >   	 */
> > > -	if (host->native_aer || pcie_ports_native) {
> > > +	if (host->native_aer || pcie_ports_native)
> > >   		pcie_clear_device_status(dev);
> > 
> > pcie_clear_device_status() doesn't check for pcie_aer_is_native()
> > internally, but after 068c29a248b6 ("PCI/ERR: Clear PCIe Device Status
> > errors only if OS owns AER") and aa344bc8b727 ("PCI/ERR: Clear AER
> > status only when we control AER"), both callers check before calling
> > it.
> > 
> > I think we should move the check inside pcie_clear_device_status().
> > That could be a separate preliminary patch.
> > 
> > There are a couple other places (aer_root_reset() and
> > get_port_device_capability()) that do the same check and could be
> > changed to use pcie_aer_is_native() instead.  That could be another
> > preliminary patch.
> > 
> Good suggestion. But I have only one doubt. In aer_root_reset(), if we use
> "if (pcie_aer_is_native(dev) && aer)", when dev->aer_cap
> is NULL and root->aer_cap is not NULL, pcie_aer_is_native() will return
> false. It's different from just using "(host->native_aer ||
> pcie_ports_native)".
> Or if we can use "if (pcie_aer_is_native(root))", at this time a NULL
> pointer check should be added in pcie_aer_is_native() because root may be
> NULL.

Good point.  In aer_root_reset(), we're updating Root Port registers,
so I think they should look like:

  if (pcie_aer_is_native(root) && aer) {
    ...
  }

Does that seem safe and equivalent to you?

Bjorn
