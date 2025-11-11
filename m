Return-Path: <linuxppc-dev+bounces-14099-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8CCC4DA16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 13:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5QbB6N41z2yvV;
	Tue, 11 Nov 2025 23:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762863606;
	cv=none; b=VrxPv1quPY61EcBRtjbrcK50SiGA6aCRrEvYDSCgHrk9YazbUQrfmH3w78uutHwxYfxS10rOQ9CRaTLBolLKJf+ELtz31aK2liOgfwig8qg0VdEo09aPeRhIN5HTD55SaJf+ai063BYZwtCYoM+o2/QHYFhekgg+GBw5ObtTZZwzCEwiErm1s67u09XDM+9Hf4Dran++SMpo0yBnSqnK90ZhApW4mVuEumv6eULMYVGOkEFrTDBi0I3B7S9zjSLTI3Vl7neYjOrS7VQ+7UtVOh49ZuIxXUyBgXUEeQeh5gz+33Srln4SjlTNLpiOgaQdR72OdBMBlHFwZe/s/VZZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762863606; c=relaxed/relaxed;
	bh=g6jHUq/xQKtGcgiL9PFjvZSkTY/oV+0De4Fhqq3zjSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LDFpYrysqOfDWD2AvaieV0TD+SDIm+iqaamFXmFNEiXEH1oFwEHVJH3R5tuJyDAnV1jGCTFvzV0AS18kwwtmfNcL3yTu9zovC4ZwcOD5W7bHKIIhkd+JjtEoMmZ6XoH4pAY6Kuq3viZNPqD1PJxELLFWJkmnT9EXOFpi92FEDAjtghcoJOGhq8v1YChmxft8gtD+YHk8Wd58DSVGS15ZkWwQ9FTXym62749GPZ4IqTCEcZMNV1hG/S47kM6/dwE5GBsFG35oobmsMFZ1Ta1BSeiMxrl/q5Znva3oDRWKQFKY/QwSVRRPQLMdASKR1zCirMGASwnfQWPlkDfJh7u1IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DOUxslbs; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DOUxslbs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5QbB1Jzlz2xFR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 23:20:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F09A61903;
	Tue, 11 Nov 2025 12:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31C4C2BCB1;
	Tue, 11 Nov 2025 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762863603;
	bh=fw4bBM14g4kHXLxHnq+oCuA8+A4FD4yo4UWJLbL05fE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DOUxslbsCSH498vEuLR+iHlaDZ8WU5xeGprTHuH6M0tZYMLRUKY2wmjvziY09guPY
	 h/PIEjXW6VAKPzJ88uiyJvC1/3jeefbQcFw6HAtPMyXuCvh8b2onP7SyMa64PRjmyP
	 L6SbFpbmYsZpavVGEllVQLB8+vwxUNLmp/6bt2O7is7Iqw4GqwfMelA9NsWehCgA/H
	 kyLHceRkVzEBRJGMHBZoM9ntLviKIgTiRmHNTVJ4L266pP3kxMp4meUZ2crhGBgPwp
	 TJ+5B77w8hRofDlgzjbqSA6QKSmHVmxPdxEgjSf9BXH74HbcgExTqLGjQcDLIrzGUw
	 k0QHh/PwrZkag==
Date: Tue, 11 Nov 2025 06:20:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	debian-powerpc@lists.debian.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>, regressions@lists.linux.dev,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251111122001.GA2168158@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a41d2ca1-fcd9-c416-b111-a958e92e94bf@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 06:15:20AM +0100, Christian Zigotzky wrote:
> On 11/07/2025 06:06 AM, Christian Zigotzky wrote:
> > On 11/05/2025 11:09 PM, Bjorn Helgaas wrote:
> > >> I tested your patch with the RC4 of kernel 6.18 today. Unfortunately
> > it
> > >> doesn't solve the boot issue.
> > >
> > > Thanks for testing that.  I see now why that approach doesn't work:
> > > quirk_disable_aspm_l0s_l1() calls pci_disable_link_state(), which
> > > updates the permissible ASPM link states, but pci_disable_link_state()
> > > only works for devices at the downstream end of a link.  It doesn't
> > > work at all for Root Ports, which are at the upstream end of a link.
> > >
> > > Christian, you originally reported that both X5000 and X1000 were
> > > broken.  I suspect X1000 may have been fixed in v6.18-rc3 by
> > > df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree
> > > platforms"), but I would love to have confirmation of that.
> > 
> > Hello Bjorn,
> > 
> > I will enable CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT for the RC5 of
> > kernel 6.18 and test it with the X1000.
> 
> I tested the RC5 of kernel 6.18 with CONFIG_PCIEASPM and
> CONFIG_PCIEASPM_DEFAULT enabled on my X1000 today. Unfortunately the boot
> problems are still present.

Thanks.  Can you post a dmesg somewhere so I can see what the relevant
device IDs are?  Can be with any kernel, doesn't have to be v6.18.  We
need the Vendor and Device IDs to add a quirk.

