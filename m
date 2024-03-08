Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED96876C6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 22:31:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TW7YYjfk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trzrj0p1lz3bnk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 08:31:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TW7YYjfk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trzr000r4z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 08:31:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97936CE29B1;
	Fri,  8 Mar 2024 21:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97843C43394;
	Fri,  8 Mar 2024 21:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709933468;
	bh=BIrlIu35U2rimElEMkh+0WBDV89ooLPXuL5UGm7857c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TW7YYjfkc2/7XCq1OsOk4JnkQ2Z4roe/55Aod6b+odn0SZoI1mh5iU4avPdsBAWNJ
	 vKBopD5GVzT90xHrQM+caKjUTuYrTM7tQ+t8f8Rtpg0do1sXZN4uug2ChAwfwUt8oD
	 FYO5MDsYtY3VOSDjGJM9RCJyjHti1KtmK4BjwP7C+HHelSf9pmB/FblcRkwN1JJygS
	 8cvT2c6sCebDAogOn97OZTUAmx5lOItuq5MiswxsqBTwwpFBq4sChVbLa+1RPGMnYF
	 PnJky00JFyo6T5VFhhxyakNMX6h7kcYchNcS/Xl5ww125XNcuXJ7pVUOeybv5tcaQm
	 78wmQeAI82sxA==
Date: Fri, 8 Mar 2024 15:31:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 0/4] PCI: Consolidate TLP Log reading and printing
Message-ID: <20240308213107.GA700934@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240206135717.8565-1-ilpo.jarvinen@linux.intel.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linux-efi@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Paolo Abeni <pabeni@redhat.com>, linux-pci@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>, Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, intel-wired-lan@lists.osuosl.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 06, 2024 at 03:57:13PM +0200, Ilpo Järvinen wrote:
> This series consolidates AER & DPC TLP Log handling code. Helpers are
> added for reading and printing the TLP Log and the format is made to
> include E-E Prefixes in both cases (previously only one DPC RP PIO
> displayed the E-E Prefixes).
> 
> I'd appreciate if people familiar with ixgbe could check the error
> handling conversion within the driver is correct.
> 
> Ilpo Järvinen (4):
>   PCI/AER: Cleanup register variable
>   PCI: Generalize TLP Header Log reading

I applied these first two to pci/aer for v6.9, thanks, these are all
nice improvements!

I postponed the ixgbe part for now because I think we should get an
ack from those maintainers or just send it to them since it subtly
changes the error and device removal checking there.

>   PCI: Add TLP Prefix reading into pcie_read_tlp_log()
>   PCI: Create helper to print TLP Header and Prefix Log

I'll respond to these with some minor comments.

>  drivers/firmware/efi/cper.c                   |  4 +-
>  drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 39 +++------
>  drivers/pci/ats.c                             |  2 +-
>  drivers/pci/pci.c                             | 79 +++++++++++++++++++
>  drivers/pci/pci.h                             |  2 +-
>  drivers/pci/pcie/aer.c                        | 28 ++-----
>  drivers/pci/pcie/dpc.c                        | 31 ++++----
>  drivers/pci/probe.c                           | 14 ++--
>  include/linux/aer.h                           | 16 ++--
>  include/linux/pci.h                           |  2 +-
>  include/ras/ras_event.h                       | 10 +--
>  include/uapi/linux/pci_regs.h                 |  2 +
>  12 files changed, 145 insertions(+), 84 deletions(-)
> 
> -- 
> 2.39.2
> 
