Return-Path: <linuxppc-dev+bounces-14490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A7C872EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 22:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGFXX5HX5z2xqg;
	Wed, 26 Nov 2025 08:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764104604;
	cv=none; b=ACPvmqojkd6exUqCRFFCtZTtXz9n2KPQek/ecNR9xZruPX3uRKyaIWQWoaeWYj2OwRsbUHNmFUxFrSHp+AtKCkgJSF0ib+KBxtmyPO/DSMuyG3uKFy/jdkIpGe8SG/EOJwq3856koHljIJKoYSlefXfgjZRoo/r2L+0reW5C1e2EjJtzQPigaR5O0VWzuxKrmErIGu1qPhcFN/z4oq6J8WOd8OVVHOKQHcG8cauFjWJQSFB4tZ58EOANTh0Lw0fGLbWiBDcQomkXH5C2u4o3XgdJZSxk3K9+XrwGEptLNzrUnoxTZLPf+AUAcesYe7paLZI+hMdZB9TK6erSoG/ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764104604; c=relaxed/relaxed;
	bh=117wtrsjcxdwFUoW4UFNVfYV9nWbJw8O+n28Ilf3sAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=E7AGRJG2riQqNTQV+zQi1dDX4kIFIJ68L7cAvzHrrv7FfZWtKu7JqDRv/Ra2pp5fKH7sLrd+JmdXi7CvydER7s5DTZtWGz0aMxfmbZREdmYX0tu34TrrC78JQu1d8r1dmMjr/TRSdUeV2r1Nf24D2r8ugXuBRi0my3pycWkokemcAXQ3A/AdcN1lSVYsWXcq7zvdoz/S76lwxS1QgLGiqL+ogH+ln1HhMZJhhYid6GmCW/78i+I3vgir+rT9b16g8qNsONIv41RqULW7XaUN6C/9aT2L7yKTV8G+P93USIqsKcTXkrDH9Yl9jUoEqEYyoQqhH8a74BtDMB2PXLiv+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZtpeZ+Lx; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZtpeZ+Lx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGFXW4XrMz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 08:03:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C99742A14;
	Tue, 25 Nov 2025 21:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F089C4CEF1;
	Tue, 25 Nov 2025 21:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764104601;
	bh=Id26wiJS3ZBzN4+TDSno8bnwLN/spJCiR/oQ+uP7xFI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZtpeZ+Lx8V1B8GTqX/dBXV5m00Zb7+3qS+ZrBfoDreM5YZ5nZoia3wfywfmTvDVN3
	 jK9FPaSFcHqs+02t30dAcDrdBw2cPSKSA4N5taB5a95Az8x+cAFmkHPWJL4u2YHgrm
	 rDKpQLzsyiqplS/wSS2Ddg0JucCgMCbmv4QT+TCf2VRyMFTdBzL/eyAm9SZg0Ezyui
	 O4s+RxHxmLkYcLi88xy/+suwyASuMbj2Ws7onXeCxZpXLSNk1rnUDo3sSLAjeXZZmm
	 p8x1Dsv+6xSp/7/GLzOVMY0f+0f7m0qW04W/8D8IkKVwFc7rvTW+LFJuxslp4T2Crp
	 xWg+gtsj987Bw==
Date: Tue, 25 Nov 2025 15:03:19 -0600
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
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/3] PCI: Universal error recoverability of devices
Message-ID: <20251125210319.GA2767956@bhelgaas>
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
In-Reply-To: <cover.1763483367.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 19, 2025 at 09:50:00AM +0100, Lukas Wunner wrote:
> This series intends to replace commit 1dc302f7fccc ("PCI: Ensure error
> recoverability at all times") on the pci/err topic branch:
> 
> https://git.kernel.org/pci/pci/c/1dc302f7fccc
> 
> The commit is assigning "dev->state_saved = false" in pci_bus_add_device()
> and during review there were requests to explain the assignment more
> clearly in a code comment.
> 
> However the assignment is (only) necessitated by missing assignments in
> pci_legacy_suspend() and pci_pm_freeze(), so I propose to instead add
> *those* assignments (patch [1/3]) and thus avoid the need for the
> assignment in pci_bus_add_device(), together with its code comment.
> 
> Furthermore the commit is *removing* an assignment in pci_device_add().
> I am separating that out to new patch [2/3].
> 
> So patch [3/3] is identical to the commit, but without the addition
> of an assignment in pci_bus_add_device() and without the removal
> of an assignment in pci_device_add().
> 
> I am looking into improving the documentation on pci_save_state()
> in a separate series.
> 
> Lukas Wunner (3):
>   PCI/PM: Reinstate clearing state_saved in legacy and !pm codepaths
>   PCI/PM: Stop needlessly clearing state_saved on enumeration and thaw
>   PCI/ERR: Ensure error recoverability at all times
> 
>  drivers/pci/bus.c        | 3 +++
>  drivers/pci/pci-driver.c | 6 ++++--
>  drivers/pci/pci.c        | 3 ---
>  drivers/pci/probe.c      | 2 --
>  4 files changed, 7 insertions(+), 7 deletions(-)

Applied on pci/err for v6.19, thanks!

