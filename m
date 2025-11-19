Return-Path: <linuxppc-dev+bounces-14370-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E887C711C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 22:09:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBYxm6H8Xz2yvM;
	Thu, 20 Nov 2025 08:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763586540;
	cv=none; b=j/Xla8DOGS/lHk1wwIH60MPfXhzoibx4SxDFlZmfSKXEwc2+uSyJt9gwYAJ8UR196ewPaRpi7GWTJORhwUrPl1lbPKBtO3ICcAIYeaA8SkFbM/Q7ohk00mMAdUOQvYGzMO0+0yN0XpsxTRT0jYq1u7gkwcfqhUp8xVsBXNX+UKsumKyq2Si0oXRZQUp+MXd6Pz9ZLnKEGJMGudU7EtBjwdOW9sdpJcmW2iHEj0M4fpJTxDImQA9r//SKDcqOObDsn+rAgfXJC/jwvtUDPQWLpE56jQc6L0ICsoQ24gBs9KKLp4i6NXUbpVlwWSKUKkaFx8cL4BT4fxLVUeFjyVyAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763586540; c=relaxed/relaxed;
	bh=6pLw1lwdEKcLbL6fi/zFw3hXa1sHyiQKrHPNXECsD6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcqT8RVYDQ0ALthvYWluakZFpMgfzWC6in+pDMttFKgLMrmVGPnNJ9KYDDDXg+9pQ2q0XI5o1XufVa5GApZNG8FiAY5y5l9XOBq+ANWS8LWagtEDMad0nyN9mZVrhNYKeZhQOuBQKB+ee7XWPFtQ2PKvS6SV9SnNvi/gHdahfC9d2jsONLDp2fXWVW34bqnLTRY2q7y4iTk8dRGCWyfZ6D5WLHAMjIzGUE/HMUaHxtDNr52kdq1HO2a3ABZhnBSb9/61AjT/RD8lvPMgU+THPPG9zYvUCK+Yy1PRlevsGDh5AO9yI02ZeHLFKs3jL4ssXJb3RQoGJ+Al4S39xv1PrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=otkduF27; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=otkduF27;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBYxm0HMkz2yvH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 08:09:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2E67419B4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CEFC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763586537;
	bh=16ZMTChKTjSpq1K5C21d8JLgJneqgfU+d17xRQO+50Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=otkduF27NPeuj9DKNWoIdRslIiTT9935uXGl3u/4xMmUgBaHd1YnbW6P7esDHSmw7
	 6hTdJkbQZM3oNoMlAcUwGLsmNnoZLoqgJiBJ+9HcVhcModTS6oMdaltmiFQS0FiRvi
	 Aw06CiSCqz3WrlqssNU9yoXhjgPTkMpdNQ4DKWARDDXhwlUBBcm9UR0UBxr70NJeFk
	 yYx6SqYL6nD54U7Ct+sY8wCb0HuC/G2MGGsGVK6IbCJYFduWIeuaSDdQ2p1PJnGePJ
	 wR99Xt5Nu/iE0Yzh3wFbwwG1fag1Gt1bssWgARr7Us3Ziia/eZQNRAJ2DLy9Jz1Pve
	 8vhtmES6VRcvQ==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4503ee5c160so69306b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 13:08:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxDbad4pE1z7BWAXaHu5JXu2EC7RPrLon6r0JlDa8Lo2UK2nY+8A/ecxxy3OFJBux04teo0xIAemC4rkU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZa//vMjUminRcaQeUVDE00QHSIMHFuZtosiBNopgoSDcjQe0q
	IdfXhKCXpTMyLTNpNjkORXQVfrqaDQBU86Zi4a9fm154jttmv48kFpN7JfaxRXtrkkhR638mHWc
	kwenJ6XDbRj6FIZZ8I2TcJTwk3qh6Zf0=
X-Google-Smtp-Source: AGHT+IHc04nHlgUwT2+nxDos3Jg4thRAorugNdW8jucP4fYf1TIOLd1CqRyUoTwdLt7mI0uTa8AF3kX48Fvs3/j7cF8=
X-Received: by 2002:a05:6808:68c9:10b0:44f:8f02:c75a with SMTP id
 5614622812f47-451000904a8mr176480b6e.1.1763586536919; Wed, 19 Nov 2025
 13:08:56 -0800 (PST)
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
References: <cover.1763483367.git.lukas@wunner.de> <094f2aad64418710daf0940112abe5a0afdc6bce.1763483367.git.lukas@wunner.de>
In-Reply-To: <094f2aad64418710daf0940112abe5a0afdc6bce.1763483367.git.lukas@wunner.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 19 Nov 2025 22:08:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gPeQUHY_OpnvGPXgkE2dw4D008V2bFrF14tYgisKD6dQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnELAxukPfeKquwawkMHEgp3PlGUnRhS77TwPV0fUbQvNQrwqoD1__2ld0
Message-ID: <CAJZ5v0gPeQUHY_OpnvGPXgkE2dw4D008V2bFrF14tYgisKD6dQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/PM: Reinstate clearing state_saved in legacy
 and !pm codepaths
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, 
	Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 9:59=E2=80=AFAM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> When a PCI device is suspended, it is normally the PCI core's job to save
> Config Space and put the device into a low power state.  However drivers
> are allowed to assume these responsibilities.  When they do, the PCI core
> can tell by looking at the state_saved flag in struct pci_dev:  The flag
> is cleared before commencing the suspend sequence and it is set when
> pci_save_state() is called.  If the PCI core finds the flag set late in
> the suspend sequence, it refrains from calling pci_save_state() itself.
>
> But there are two corner cases where the PCI core neglects to clear the
> flag before commencing the suspend sequence:
>
> * If a driver has legacy PCI PM callbacks, pci_legacy_suspend() neglects
>   to clear the flag.  The (stale) flag is subsequently queried by
>   pci_legacy_suspend() itself and pci_legacy_suspend_late().
>
> * If a device has no driver or its driver has no PCI PM callbacks,
>   pci_pm_freeze() neglects to clear the flag.  The (stale) flag is
>   subsequently queried by pci_pm_freeze_noirq().
>
> The flag may be set prior to suspend if the device went through error
> recovery:  Drivers commonly invoke pci_restore_state() + pci_save_state()
> to restore Config Space after reset.
>
> The flag may also be set if drivers call pci_save_state() on probe to
> allow for recovery from subsequent errors.
>
> The result is that pci_legacy_suspend_late() and pci_pm_freeze_noirq()
> don't call pci_save_state() and so the state that will be restored on
> resume is the one recorded on last error recovery or on probe, not the on=
e
> that the device had on suspend.  If the two states happen to be identical=
,
> there's no problem.
>
> Reinstate clearing the flag in pci_legacy_suspend() and pci_pm_freeze().
> The two functions used to do that until commit 4b77b0a2ba27 ("PCI: Clear
> saved_state after the state has been restored") deemed it unnecessary
> because it assumed that it's sufficient to clear the flag on resume in
> pci_restore_state().  The commit seemingly did not take into account that
> pci_save_state() and pci_restore_state() are not only used by power
> management code, but also for error recovery.

That's right, it didn't.

> Devices without driver or whose driver has no PCI PM callbacks may be in
> runtime suspend when pci_pm_freeze() is called.  Their state has already
> been saved, so don't clear the flag to skip a pointless pci_save_state()
> in pci_pm_freeze_noirq().
>
> None of the drivers with legacy PCI PM callbacks seem to use runtime PM,
> so clear the flag unconditionally in their case.
>
> Fixes: 4b77b0a2ba27 ("PCI: Clear saved_state after the state has been res=
tored")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org # v2.6.32+

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/pci/pci-driver.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 302d61783f6c..327b21c48614 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -629,6 +629,8 @@ static int pci_legacy_suspend(struct device *dev, pm_=
message_t state)
>         struct pci_dev *pci_dev =3D to_pci_dev(dev);
>         struct pci_driver *drv =3D pci_dev->driver;
>
> +       pci_dev->state_saved =3D false;
> +
>         if (drv && drv->suspend) {
>                 pci_power_t prev =3D pci_dev->current_state;
>                 int error;
> @@ -1036,6 +1038,8 @@ static int pci_pm_freeze(struct device *dev)
>
>         if (!pm) {
>                 pci_pm_default_suspend(pci_dev);
> +               if (!pm_runtime_suspended(dev))
> +                       pci_dev->state_saved =3D false;
>                 return 0;
>         }
>
> --
> 2.51.0
>
>

