Return-Path: <linuxppc-dev+bounces-14191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD4C5F9E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 00:45:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7Yg118pzz2yvv;
	Sat, 15 Nov 2025 10:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763163949;
	cv=none; b=U1+aR/FD55v1bMo6wjG9kTlf1KBgtqCvZTSOtzjoW02fZFv6orVhGA/41tGZY6YapgchpSOpu2xIG2Sh3wk5eYRTM76JfG19p3rMv+Qh0fe09rNAcq1J1XR17xuCV5Cp4TYJscQuyWHBWnh8z5xNxfLVDGuArJb+AhZBuxHCgALLrKnH8ONBs/02RX7dsQwP8J4VmiUkwlCwhNkF/f24Ij9/9AX8AiBDEFFQ1tdha74UqHlPniyhuhxhRSGRzCnkGI3+3d2ZnBBMHHjUHnw5BRY1dz+vrK9nyK7h9u0G57V0j0/y8W12OhfWqD6DeSPYBTG7JsI1hd+AbTCzlifkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763163949; c=relaxed/relaxed;
	bh=lqMXTfk408msT1pA0iBE6eGxGdsXPLUrKSqyy/ypnU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XMZDO4dTqAMU7GrRXCQCXgslM/M106hPwk8n1EN7kFe+Gd44/EDTsiQDCwVrX+oV6uWBxDg+rw3Wj3Cbwa6I+ApgHdSU+8p+yfibzBdCvL9s1TodGf3xK6MYqvWAhU9XCKgrbsgz1D/W+lkGxrwSaOIveCZgfoXP7gPTUuhUM4cufmt/Yl6BNRLED4vuXXlbRkHy0B8nSpVSH5AXqWWVBkQNkR9Fv5VJf9g3bSP4bKiY4IHhiIztJy2qd5KTze7Bz1t1B6LVS33ZoyKgQKyqz6UgRa3bQT3GvKRFi0cTi4r/xU2EDm9f2qL+c/4tP5d5ATRe/gC9dBiPsskqhp6vYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CrngH4Up; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CrngH4Up;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7Yg028tYz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 10:45:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85F9044259;
	Fri, 14 Nov 2025 23:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C52DC16AAE;
	Fri, 14 Nov 2025 23:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763163945;
	bh=VjOUQn2CMnLCK8Ez8KnMoiA++LC+kuNQ89cJ9UDiqgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=CrngH4UpTSR0l68GfGHGvcRYcsBQPtp5oAgbzGTIck6kdV2BVKE4UD17+nymFyigP
	 Yd0dBrcbgUKB+C96gfivjhJ/xPLHCu17vaOur2/6WZLK2VxV2Fnidy51wc9kLupdd9
	 7fOUfVMuEjtJ18yisyyoBAH1uRSI9wQzYx1y6EDvASg3UabAXcEqsiwA5DEjoYX2jJ
	 kLDMzddbEWwlhyZNyoFZl/eL6QpH1+e8qZdUTtLrRL9baw4dxulV1q8Q9jvO2KiuYj
	 6lLkOuCJSfEtoWdyLU3jfvqOjcYB9zAhCY9YJPSmU34FzBxlzwz3Gqq2RM3ssy505v
	 o45hHW1Hwjk1A==
Date: Fri, 14 Nov 2025 17:45:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Farhan Ali <alifm@linux.ibm.com>,
	Benjamin Block <bblock@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Alek Du <alek.du@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, qat-linux@intel.com,
	Dave Jiang <dave.jiang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH 0/2] PCI: Universal error recoverability of devices
Message-ID: <20251114234543.GA2350415@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1760274044.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Oct 12, 2025 at 03:25:00PM +0200, Lukas Wunner wrote:
> When PCI devices are reset -- either to recover from an error or
> after a D3hot/D3cold transition -- their Config Space needs to be
> restored.
> 
> D3hot/D3cold transitions happen under the control of the kernel,
> hence it is able to save Config Space before and restore it afterwards.
> 
> However errors may occur unexpectedly and it may then be impossible
> to save Config Space because the device may be inaccessible (e.g. DPC)
> or Config Space may be corrupted.  So it must be saved ahead of time.
> 
> This isn't done consistently because the PCI core doesn't take care
> of it and only a subset of drivers do.  The situation is aggravated
> by the behavior of pci_restore_state(), which only allows restoring
> Config Space once and invalidates the saved copy afterwards.
> 
> Solve all these problems by saving an initial copy of Config Space
> on device addition which drivers may update if they change registers.
> Modify pci_restore_state() to allow using the saved copy indefinitely
> and drop all the workarounds for its previous behavior that have
> accumulated in the tree.
> 
> Lukas Wunner (2):
>   PCI: Ensure error recoverability at all times
>   treewide: Drop pci_save_state() after pci_restore_state()
> 
>  drivers/crypto/intel/qat/qat_common/adf_aer.c    | 2 --
>  drivers/dma/ioat/init.c                          | 1 -
>  drivers/net/ethernet/broadcom/bnx2.c             | 2 --
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 1 -
>  drivers/net/ethernet/broadcom/tg3.c              | 1 -
>  drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c  | 1 -
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c  | 2 --
>  drivers/net/ethernet/hisilicon/hibmcge/hbg_err.c | 1 -
>  drivers/net/ethernet/intel/e1000e/netdev.c       | 1 -
>  drivers/net/ethernet/intel/fm10k/fm10k_pci.c     | 6 ------
>  drivers/net/ethernet/intel/i40e/i40e_main.c      | 1 -
>  drivers/net/ethernet/intel/ice/ice_main.c        | 2 --
>  drivers/net/ethernet/intel/igb/igb_main.c        | 2 --
>  drivers/net/ethernet/intel/igc/igc_main.c        | 2 --
>  drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    | 1 -
>  drivers/net/ethernet/mellanox/mlx4/main.c        | 1 -
>  drivers/net/ethernet/mellanox/mlx5/core/main.c   | 1 -
>  drivers/net/ethernet/meta/fbnic/fbnic_pci.c      | 1 -
>  drivers/net/ethernet/microchip/lan743x_main.c    | 1 -
>  drivers/net/ethernet/myricom/myri10ge/myri10ge.c | 4 ----
>  drivers/net/ethernet/neterion/s2io.c             | 1 -
>  drivers/pci/bus.c                                | 7 +++++++
>  drivers/pci/pci.c                                | 3 ---
>  drivers/pci/pcie/portdrv.c                       | 1 -
>  drivers/pci/probe.c                              | 2 --
>  drivers/scsi/bfa/bfad.c                          | 1 -
>  drivers/scsi/csiostor/csio_init.c                | 1 -
>  drivers/scsi/ipr.c                               | 1 -
>  drivers/scsi/lpfc/lpfc_init.c                    | 6 ------
>  drivers/scsi/qla2xxx/qla_os.c                    | 5 -----
>  drivers/scsi/qla4xxx/ql4_os.c                    | 5 -----
>  drivers/tty/serial/8250/8250_pci.c               | 1 -
>  drivers/tty/serial/jsm/jsm_driver.c              | 1 -
>  33 files changed, 7 insertions(+), 62 deletions(-)

Applied to pci/err, maybe for v6.19?

It touches a lot of drivers, so it'd be nice to have more time in
-next, but it is mostly in error recovery paths that aren't going to
be exercised much anyway.

I'll watch for a minor update of comments and update if I see it.

Thanks a lot for your work and description of this.  It's a big step
in my understanding of PM and error recovery.  Which still leaves me
mostly ignorant, just slightly less so.

Bjorn

