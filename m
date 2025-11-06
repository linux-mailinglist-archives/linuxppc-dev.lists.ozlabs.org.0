Return-Path: <linuxppc-dev+bounces-13904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D20C3DE11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 00:45:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2f2r5cyNz3bf2;
	Fri,  7 Nov 2025 10:45:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762472756;
	cv=none; b=BZbfxFP5T4KjNImqBBfAe0IlxL86KwcCsHCi9oB0zIF4/uwJFjt+OIMqq+g01si215lMj47lF5Rd567JN75NfdXwgmRc3/IaPA32RVlmpHGB0gVQJ+6huVHzPl5NnoaoH3bhXZtGB6vlEfEOPxRh85KfDGuPlfDopLhw8bIqTCu2/7kbmG769E1gOj3RIWE0kbe+U70huG7R7JCFqwmKi/GwmYs2GoTEyTylyZWKChrOaN182mXNUt2MG98U4zQc2LILLQuhU465xnEhw9dbWqdxvbKpTeuHH/HxuOHwxn8XgP9m/IaN3YLIpyyJ66t8CHwummm79Er63Tvj2LZGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762472756; c=relaxed/relaxed;
	bh=+gnFJJxqbLSg1TYkXQbbrbi6aZzsNHqAku1owFbVMNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HsVODfxRogot77aMEteNphpsTLaREzYxsIaSeXZOxgc3wxEvtcwi/I6+QIUOpyz/4YvV8LH6oTtscEEKvTTMYS9Hm0A4qUsetlFEyoxX7BD3fYtSX9iwAlkjxb0GrltPPhcuDrfl+rJoRv+kERych1yx8TyweaDuVIBncoFmLRFs9Jdu2jBV/l7DFVFkACGhaDizO5qQ08TxCT4RXM3GAVsN6xn5wj1Oyk22NAdGnMPRYAnPVREwcmRxgxdjnp2hkqNxOzVsuzVSnKN4ewenrA78tRERmWPCpR4go/HgQu2AcgA44EXn+9PQL/z6TG8ZuOhHMFapW1gRVYElsloDPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDaJ/5/t; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nDaJ/5/t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2f2q6n75z2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 10:45:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AF8F40605;
	Thu,  6 Nov 2025 23:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2545C4CEF7;
	Thu,  6 Nov 2025 23:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762472753;
	bh=23mhRYspHUO/+Jn5j6UsbhA1co9CDPUsRj1RdkMabQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nDaJ/5/t364D5zfSObhgA0ft1VArPTqWeLPFQA2zIvyUNQrfV2m8D9AA6X3c5wRfH
	 Q21Bodv0vO+P2iAZM+d8B129L6ihVGsJdLbnQgXgMWbxJxAKxB9W/Vzpt9ERYKmJRt
	 aPh4IG8/t4b7ih5DeFQIRITz4ez1HnuyE4TWHMhy1rLMvRcLng9ku7ZrAH+AJOoAxT
	 +SnElhanks/y9iRPZtvGOTsNrJWW8mOlltH/yeUnl3icmXwDxMakvBdKh4Ty7d1tei
	 a8n09H4P4KN7mwJUyC1cfXnAir4KE2faeS5B4uxozC0VPQXKcCBLQQM2poCCsk8o7Z
	 9Wg2vPA8Kn0XA==
Date: Thu, 6 Nov 2025 17:45:51 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/2] PCI/ASPM: Allow quirks to avoid L0s and L1
Message-ID: <20251106234551.GA1976429@bhelgaas>
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
In-Reply-To: <20251106183643.1963801-1-helgaas@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 12:36:37PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
> L0s, L1, and (if advertised) L1 PM Substates.
> 
> L1 PM Substates and Clock PM in particular are a problem because they
> depend on CLKREQ# and sometimes device-specific configuration, and none of
> this is discoverable in a generic way.
> 
> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> (v6.18-rc3) backed off and omitted Clock PM and L1 Substates.
> 
> L0s and L1 are generically discoverable, but some devices advertise them
> even though they don't work correctly.  This series is a way to avoid L0s
> and L1 in that case.
> 
> Bjorn Helgaas (2):
>   PCI/ASPM: Cache Link Capabilities so quirks can override them
>   PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
> 
>  drivers/pci/pcie/aspm.c | 42 ++++++++++++++++++++---------------------
>  drivers/pci/probe.c     |  5 ++---
>  drivers/pci/quirks.c    | 12 ++++++++++++
>  include/linux/pci.h     |  1 +
>  4 files changed, 36 insertions(+), 24 deletions(-)

I put these on for-linus, hopefully for v6.18.  I would like to have
some review and testing before asking Linus to pull them, especially
since the first one is not completely trivial and is a change (but
shouldn't be a functional change) for all platforms.

