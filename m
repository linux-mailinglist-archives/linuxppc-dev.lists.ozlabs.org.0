Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC246666FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsk2T5LLTz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 10:11:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBqcCXiY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBqcCXiY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsk1W2C7Rz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 10:10:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A367661EF9;
	Wed, 11 Jan 2023 23:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04C6C433EF;
	Wed, 11 Jan 2023 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673478635;
	bh=++uluPFMowPrY8s1xfgmEUXDgen39mn6C1pbnUZ2MU4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kBqcCXiYgbOo0fz6xo/YOGVM2XLI/TGaRt6I6q6PjPGZghKE/om05zyqfQApLqDYT
	 jmtXbxl6mYgeTjvYJzO/uS6FXr7Jtgv4Vt9rxojdIH0almjY/NGOnq8M98oF8kwfKv
	 mCwqtmnaMLXuy53tHGIvRSpO6jJpLEDBsKoIBdgEktC94gHq4mrfugdJv1Tl6xx0Op
	 Kf2NLycwahihsEOlR2wzo34lyCEDQAN00QCHEvDa7CZKU+ikaJv0Sg+J3cVXJ9bOw8
	 YdLlhfDNoHLfjF0ARFO6qKNG2/37bTKDikGli5xn/eqK7HJNGt8MYp2vc2UsdDCZZn
	 X5NH/nGhjaa4A==
Date: Wed, 11 Jan 2023 17:10:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Message-ID: <20230111231033.GA1714672@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9126d49-6e98-956c-f4a3-699cc86d8b11@linux.intel.com>
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 01:42:21PM -0800, Sathyanarayanan Kuppuswamy wrote:
> On 1/11/23 12:31 PM, Vidya Sagar wrote:
> > As the ECRC configuration bits are part of AER registers, configure
> > ECRC only if AER is natively owned by the kernel.
> 
> ecrc command line option takes "bios/on/off" as possible options. It
> does not clarify whether "on/off" choices can only be used if AER is
> owned by OS or it can override the ownership of ECRC configuration 
> similar to pcie_ports=native option. Maybe that needs to be clarified.

Good point, what do you think of an update like this:

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..f7b40a439194 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4296,7 +4296,9 @@
 				specified, e.g., 12@pci:8086:9c22:103c:198f
 				for 4096-byte alignment.
 		ecrc=		Enable/disable PCIe ECRC (transaction layer
-				end-to-end CRC checking).
+				end-to-end CRC checking).  Only effective
+				if OS has native AER control (either granted by
+				ACPI _OSC or forced via "pcie_ports=native").
 				bios: Use BIOS/firmware settings. This is the
 				the default.
 				off: Turn ECRC off

I don't know whether the "ecrc=" parameter is really needed.  If we
were adding it today, I would ask "why not enable ECRC wherever it is
supported?"  If there are devices where it's broken, we could always
add quirks to disable it on a case-by-case basis.

But I think the patch below is the right thing to do for now.  Vidya,
did you trip over an issue because of this, e.g., a conflict between
firmware use of AER and Linux use of it?  If so, maybe we could
mention a symptom on the commit log.  But my guess is you probably
found this by inspection.

Bjorn

> > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > ---
> >  drivers/pci/pcie/aer.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index e2d8a74f83c3..730b47bdcdef 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
> >   */
> >  void pcie_set_ecrc_checking(struct pci_dev *dev)
> >  {
> > +	if (!pcie_aer_is_native(dev))
> > +		return;
> > +
> >  	switch (ecrc_policy) {
> >  	case ECRC_POLICY_DEFAULT:
> >  		return;
> 
> -- 
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
