Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E25EAE1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbqND3xJrz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 03:23:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XBGoGIPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XBGoGIPo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbqMf2Qgyz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 03:22:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3C16DB80B38;
	Mon, 26 Sep 2022 17:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC080C433C1;
	Mon, 26 Sep 2022 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664212968;
	bh=4EYiYZ0wrDgSgsqkBMAwgMjP6z1zRz5Fmv8L+RYBpPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XBGoGIPobGMP16I4bFTLp4eHtOgJGOZUZHef8ebOBcb7pYrIzpxDPi39Cv3BXSbTE
	 yDIpGbaDJShRsyYq50eEe0VIQT7TJCiUN3p5oqjE/QK7IvCBtUmJiPCLZLSXlH7tJY
	 apt19ITXr926s7KKXqBlNpm4DCsmlFbnuabBiKWwLA9JYL0EWeVfO9kAyG2aSB+T/G
	 ZsLqStUswyWHmlaVpAud1aYKUdvH2cNneaIE4hegZSo442hawm0mJq9j2jha91GKn3
	 HqBU1xFvU/s7p8HS0QDiwHdI1FUCqErzpQZm911AHs8ewHGOV2UR13IMJSpttiIkU3
	 6i8iuXQnYBY7Q==
Date: Mon, 26 Sep 2022 12:22:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH 3/3] PCI/AER: Use pci_aer_raw_clear_status() to clear
 root port's AER error status
Message-ID: <20220926172246.GA1609538@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e025745-06af-c5c6-aa70-6ff1f9ad0962@bytedance.com>
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

On Mon, Sep 26, 2022 at 10:16:23PM +0800, Zhuo Chen wrote:
> On 9/23/22 5:50 AM, Bjorn Helgaas wrote:
> > On Fri, Sep 02, 2022 at 02:16:34AM +0800, Zhuo Chen wrote:
> > > Statements clearing AER error status in aer_enable_rootport() has the
> > > same function as pci_aer_raw_clear_status(). So we replace them, which
> > > has no functional changes.

> > > -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> > > -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
> > > -	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
> > > -	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
> > > -	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
> > > -	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
> > > +	pci_aer_raw_clear_status(pdev);
> > 
> > It's true that this is functionally equivalent.
> > 
> > But 20e15e673b05 ("PCI/AER: Add pci_aer_raw_clear_status() to
> > unconditionally clear Error Status") says pci_aer_raw_clear_status()
> > is only for use in the EDR path (this should have been included in the
> > function comment), so I think we should preserve that property and use
> > pci_aer_clear_status() here.
> > 
> > pci_aer_raw_clear_status() is the same as pci_aer_clear_status()
> > except it doesn't check pcie_aer_is_native().  And I'm pretty sure we
> > can't get to aer_enable_rootport() *unless* pcie_aer_is_native(),
> > because get_port_device_capability() checks the same thing, so they
> > should be equivalent here.
> > 
> Thanks Bjorn, this very detailed correction is helpful. By the way, 'only
> for use in the EDR path' obviously written in the function comments may be
> better. So far only commit log has included these.

Yes, definitely!  I goofed when I applied that patch without making
sure there was something in the function comment.

Bjorn
