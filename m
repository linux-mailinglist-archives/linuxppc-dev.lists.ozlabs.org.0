Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2E6928DBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 21:21:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBwILHie;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WG3K84HM7z3d8t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 05:21:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kBwILHie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WG3JT2zHBz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 05:20:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64868CE10F6;
	Fri,  5 Jul 2024 19:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6141BC116B1;
	Fri,  5 Jul 2024 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720207236;
	bh=HchELO8nLBln8sfZVXM5+tcXKtpO4xsgC76A+YN3J8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kBwILHieC1Z6CJbKtY8lqZJUEsArAzL7hXxABbptIQwOhgNlWFXh9w8DeirvYXyYC
	 d/e80w4K5Dvyuiq7djURjha6yprVRBwnwpuepZYwjO8hHPM4Eky4Fw87WTZV84eHMP
	 j0QhW0xQ3idturpI38gYhlFARaO67tsFjbB+/1NZdtNNA9MdhRNhsSLS7OI2G4YpCq
	 M8rGgPPJ1aauE62olyF3L8DBMukj7fzZrNetCy92bKy21NAesRhcP9SBPDkJfsLuAR
	 dbSAp5iZtsVPGzpSCf/kxV6fF3oF2gCaMSEPQxnppoB/Oknp5hhM8vAr2BoX8qsVDf
	 3KayVZCxp5rRQ==
Date: Fri, 5 Jul 2024 14:20:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: Re: [PATCH] PCI: Fix crash during pci_dev hot-unplug on pseries KVM
 guest
Message-ID: <20240705192034.GA73447@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703141634.2974589-1-amachhiw@linux.ibm.com>
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
Cc: Rob Herring <robh@kernel.org>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lizhi Hou <lizhi.hou@amd.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Lukas, FYI]

On Wed, Jul 03, 2024 at 07:46:34PM +0530, Amit Machhiwal wrote:
> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> a pseries KVM guest:
> 
>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
>  Faulting instruction address: 0xc0000000012d8728
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> <snip>
>  NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>  LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>  Call Trace:
>  [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>  [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>  [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>  [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
>  [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>  [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>  [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>  [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>  [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>  [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>  [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>  [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> <snip>
> 
> A git bisect pointed this regression to be introduced via [1] that added
> a mechanism to create device tree nodes for parent PCI bridges when a
> PCI device is hot-plugged.
> 
> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
> device-tree node associated with the pci_dev that was earlier
> hot-plugged and was attached under a pci-bridge. The PCI dev header
> `dev->hdr_type` being 0, results a conditional check done with
> `pci_is_bridge()` into false. Consequently, a call to
> `of_pci_make_dev_node()` to create a device node is never made. When at
> a later point in time, in the device node removal path, a memcpy is
> attempted in `__of_changeset_entry_invert()`; since the device node was
> never created, results in an Oops due to kernel read access to a bad
> address.
> 
> To fix this issue the patch updates `pci_stop_dev()` to ensure that a
> call to `of_pci_remove_node()` is only made for pci-bridge devices.
> 
> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
> 
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Tested-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>

Thanks for the patch and testing!  Would like a reviewed-by from
Lizhi.

> ---
>  drivers/pci/remove.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> index d749ea8250d6..4e51c64af416 100644
> --- a/drivers/pci/remove.c
> +++ b/drivers/pci/remove.c
> @@ -22,7 +22,8 @@ static void pci_stop_dev(struct pci_dev *dev)
>  		device_release_driver(&dev->dev);
>  		pci_proc_detach_device(dev);
>  		pci_remove_sysfs_dev_files(dev);
> -		of_pci_remove_node(dev);
> +		if (pci_is_bridge(dev))
> +			of_pci_remove_node(dev);

IIUC, this basically undoes the work that was done by
of_pci_make_dev_node().

The call of of_pci_make_dev_node() from pci_bus_add_device() was added
by 407d1a51921e and is conditional on pci_is_bridge(), so it makes
sense to me that the remove needs a similar condition.

>  		pci_dev_assign_added(dev, false);
>  	}
> 
> base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
> -- 
> 2.45.2
> 
