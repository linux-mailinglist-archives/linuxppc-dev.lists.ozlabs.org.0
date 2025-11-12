Return-Path: <linuxppc-dev+bounces-14139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E24C54B87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 23:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6JGN5BZ0z2ytT;
	Thu, 13 Nov 2025 09:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762987116;
	cv=none; b=daRVl+2eeN+A2nCYCbxBBciZ1MqnG9m+jo3XO9Gw/g69wQ1phd9WhlhCDh/JzCxazM13KkmZhCtl9Sme0CffLGe8zgtzL7vEX/HCjo2JgVrb9TGckfXffAxqDnBJxZSC3KiqEbpjNU8SWUptNB1o2lK7Jec3ySk5qfI+jRE5orFYYLBEpRRv9Y4Tsvy5TZaVEVNI0Fw08mJOK2IUbcEXCh7pJ0DNgQu6Zk/2LVQAvnu70YOnBu4qRB+5NC20ljFGGDE5WhDZlR3NXm5yec91gB8NE7boUzTVt9Xe+lmn43OXzM29nXc5CAnIRqXm2KX4D3hvGNcaHY+6BdsFor7wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762987116; c=relaxed/relaxed;
	bh=jpYFwcxjXecxvat29GX7maZjRBMAvWeNBTQ3JZrt8SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jQw5TAMs2aXWPF8ZjG9qp8FaTQ17A30M/O0USusg4l0KielQevlKkFSJ4HQylkQwNzyMh8MF5ITdcIemZ9PkwVMi+gY5zfrYCQujDdY+7vaRmjWLGyGRdbR3ZsYMna7rNCb3B7Ewd73DiL0LaBCvl4jnlxv0DxTkYMTjBUOPbwxh7P/GUgw/EmTAS8C2aF0fzvnKgzBhPbWmrnspdhSMPUTOCJu4hxGCrHmULRMHG5ztQQbSxp5LiouGZuguMrHEDwphZRMGMnmBdlAmpA1K+bOGwpFeQdZVPNm3STxNwJEuCsgqtzMU+V5/Z/Paf0hr80TOUyGSddah07eZYPootQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnX5Vdxq; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnX5Vdxq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6JGM4nnsz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 09:38:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14B18601BB;
	Wed, 12 Nov 2025 22:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3FDC4AF0B;
	Wed, 12 Nov 2025 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762987112;
	bh=7JOpHh3ITXKexgD/3ZZE8c1j0sx8rxNvxSRy064lh8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RnX5VdxqXXd79Ms7+GgEALirAiKSqK38eks0P5cfIiAm93yDSulmLkc1m4nWT0PDt
	 kzjFcuEYjkphZxNp41IpYrEAEUUKqg5gfJwWz0buVWDc2+mkumi1dsDboCQqlyHM4N
	 HhxVZrCl7fYxWKBaApo1hXNXxCel/MpvucfatDB6JkpegZ8o490W89oCgzjdvza6oD
	 Q09SRHV5PPw4gMBTmW6DJecuaPvsY6WtXM3cNm6HKi7revWlcPsiwvg6xVDvL/Ecab
	 YZwR83/KtENlfOHyf8FFCldCrIDLzU2fJqR/il6JIc2XMWD86TtV2lsbq1S+n0Ld0I
	 JGgXHlM4MicKA==
Date: Wed, 12 Nov 2025 16:38:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
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
Subject: Re: [PATCH 1/2] PCI: Ensure error recoverability at all times
Message-ID: <20251112223831.GA2245026@bhelgaas>
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
In-Reply-To: <070a03221dbec25f478d36d7bc76e0da81985c5d.1760274044.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Oct 12, 2025 at 03:25:01PM +0200, Lukas Wunner wrote:
> When the PCI core gained power management support in 2002, it introduced
> pci_save_state() and pci_restore_state() helpers to restore Config Space
> after a D3hot or D3cold transition, which implies a Soft or Fundamental
> Reset (PCIe r7.0 sec 5.8):
> 
>   https://git.kernel.org/tglx/history/c/a5287abe398b
> 
> In 2006, EEH and AER were introduced to recover from errors by performing
> a reset.  Because errors can occur at any time, drivers began calling
> pci_save_state() on probe to ensure recoverability.
> 
> In 2009, recoverability was foiled by commit c82f63e411f1 ("PCI: check
> saved state before restore"):  It amended pci_restore_state() to bail out
> if the "state_saved" flag has been cleared.  The flag is cleared by
> pci_restore_state() itself, hence a saved state is now allowed to be
> restored only once and is then invalidated.  That doesn't seem to make
> sense because the saved state should be good enough to be reused.
> 
> Soon after, drivers began to work around this behavior by calling
> pci_save_state() immediately after pci_restore_state(), see e.g. commit
> b94f2d775a71 ("igb: call pci_save_state after pci_restore_state").
> Hilariously, two drivers even set the "saved_state" flag to true before
> invoking pci_restore_state(), see ipr_reset_restore_cfg_space() and
> e1000_io_slot_reset().
> 
> Despite these workarounds, recoverability at all times is not guaranteed:
> E.g. when a PCIe port goes through a runtime suspend and resume cycle,
> the "saved_state" flag is cleared by:
> 
>   pci_pm_runtime_resume()
>     pci_pm_default_resume_early()
>       pci_restore_state()
> 
> ... and hence on a subsequent AER event, the port's Config Space cannot be
> restored.  

I guess this restore would be done by a driver's
pci_error_handlers.slot_reset() or .reset_done() calling
pci_restore_state()?

> Riana reports a recovery failure of a GPU-integrated PCIe
> switch and has root-caused it to the behavior of pci_restore_state().
> Another workaround would be necessary, namely calling pci_save_state() in
> pcie_port_device_runtime_resume().
> 
> The motivation of commit c82f63e411f1 was to prevent restoring state if
> pci_save_state() hasn't been called before.  But that can be achieved by
> saving state already on device addition, after Config Space has been
> initialized.  A desirable side effect is that devices become recoverable
> even if no driver gets bound.  This renders the commit unnecessary, so
> revert it.
> 
> Reported-by: Riana Tauro <riana.tauro@intel.com> # off-list
> Tested-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
> Proof that removing the check in pci_restore_state() makes no
> difference for the PCI core:
> 
> * The only relevant invocations of pci_restore_state() are in
>   drivers/pci/pci-driver.c
> * One invocation is in pci_restore_standard_config(), which is
>   always called conditionally on "if (pci_dev->state_saved)".
>   So the check at the beginning of pci_restore_state() which
>   this patch removes is an unnecessary duplication.
> * Another invocation is in pci_pm_default_resume_early(), which
>   is called from pci_pm_resume_noirq(), pci_pm_restore_noirq()
>   and pci_pm_runtime_resume().  Those functions are only called
>   after prior calls to pci_pm_suspend_noirq(), pci_pm_freeze_noirq(),
>   and pci_pm_runtime_suspend(), respectively.  And all of them
>   call pci_save_state().  So the "if (!dev->state_saved)" check
>   in pci_restore_state() never evaluates to true.
> * A third invocation is in pci_pm_thaw_noirq().  It is only called
>   after a prior call to pci_pm_freeze_noirq(), which invokes
>   pci_save_state().  So likewise the "if (!dev->state_saved)" check
>   in pci_restore_state() never evaluates to true.
> 
>  drivers/pci/bus.c   | 7 +++++++
>  drivers/pci/pci.c   | 3 ---
>  drivers/pci/probe.c | 2 --
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index f26aec6..4318568 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -358,6 +358,13 @@ void pci_bus_add_device(struct pci_dev *dev)
>  	pci_bridge_d3_update(dev);
>  
>  	/*
> +	 * Save config space for error recoverability.  Clear state_saved
> +	 * to detect whether drivers invoked pci_save_state() on suspend.

Can we expand this a little to explain how this is detected and what
drivers *should* be doing?  I think the reason is that the PCI core
can invoke pci_save_state() on suspend if the driver did not.

I assume:

  - PCI core always calls pci_save_state() and clears state_saved when
    device is enumerated (below)

  - When it has configured the device to the state it wants restore,
    the driver may call pci_save_state() again, which will set
    state_saved

  - If driver has not called pci_save_state(), i.e., state_saved is
    still clear, we want the PCI core to call pci_save_state() during
    suspend

This sounds sensible to me.  It would be nice if there were a few more
words about pci_save_state() and pci_restore_state() in
Documentation/.

pci_save_state() isn't mentioned at all in Documentation/PCI, and 
Documentation/PCI/pci-error-recovery.rst contains this:

  It is important for the platform to restore the PCI config space
  to the "fresh poweron" state, rather than the "last state". After
  a slot reset, the device driver will almost always use its standard
  device initialization routines, and an unusual config space setup
  may result in hung devices, kernel panics, or silent data corruption.

The PCI core doesn't call pci_restore_state() in the error recovery
path, so maybe that matches the platform (PCI core) restoring "fresh
poweron" state.  And maybe the driver using "its standard device init
routines" is an oblique reference to things like pci_restore_state(),
which is called by several .slot_reset() and .reset_done() callbacks?

pci.rst mentions the PCI core saving and restoring the "standard
configuration registers if the driver hasn't done that", which I guess
refers to pci_save_state().  This seems like it could be more explicit
and maybe could mention the default of saving/restoring the state at
suspend, and the option that if the driver itself calls
pci_save_state(), *that* state will be restored.

This all looks good to me, and I'm sorry I took so long to get to it.

But I surely would like to have Rafael's ack for this because power
management is a mystery to me.

> +	 */
> +	pci_save_state(dev);
> +	dev->state_saved = false;
> +
> +	/*
>  	 * If the PCI device is associated with a pwrctrl device with a
>  	 * power supply, create a device link between the PCI device and
>  	 * pwrctrl device.  This ensures that pwrctrl drivers are probed
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b14dd06..2f0da5d 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1855,9 +1855,6 @@ static void pci_restore_rebar_state(struct pci_dev *pdev)
>   */
>  void pci_restore_state(struct pci_dev *dev)
>  {
> -	if (!dev->state_saved)
> -		return;
> -
>  	pci_restore_pcie_state(dev);
>  	pci_restore_pasid_state(dev);
>  	pci_restore_pri_state(dev);
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index c83e75a..c7c7a3d 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2747,8 +2747,6 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  
>  	pci_reassigndev_resource_alignment(dev);
>  
> -	dev->state_saved = false;
> -
>  	pci_init_capabilities(dev);
>  
>  	/*
> -- 
> 2.51.0
> 

