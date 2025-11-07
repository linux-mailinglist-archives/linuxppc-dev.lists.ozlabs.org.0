Return-Path: <linuxppc-dev+bounces-13917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81739C3E949
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 07:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2pQK24NCz3bt1;
	Fri,  7 Nov 2025 17:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762495401;
	cv=none; b=hhCmwwjT1TiU460GN0qinhHlIzk6fTBNM5HHFkwpcOLA0Rm2LP4W6BmWIW7nF9gKbXe45+hzAPdWox9NLgBg8jcJ7/JwiJMfoZF5CUTM5wedOPjlpl/3FI1nq9B80oozDDCnDRO7xoC0qHAT2QJ8rKb3DUiKOo2b6wbRfejpMyR27I19cSQ1fNjBErEamElSGgGVKfpmdmZma55bPFXaBubMCcexJsvlOl/8AxCX2mQJimfm0zDhc2GcVCncYq0HIJ7KGnrr8EbzJxc4ACI4X6fk2yuXjJt1T83c/A6TSn29MQwdpNClHzxQXFCkDDxsoHltJ2UzHDHs/lvywkPKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762495401; c=relaxed/relaxed;
	bh=1RAW7ld/09Fzr4BBW7q0PLb+1mxjvGaOUKVRPziZo7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg3YEbXKx1pe7OikYhr6TLyTNnn23SvdubC1Ov8hdX5ti/rfCAxac+CsaFrVmzaDByPNDIGc73YIwSpeIg8htIIKhQ4cOtPyJm9gBuVfh3US7jeIvJXNOgEqZzGCzs+QMWFAH+59TWNYpai+aTLOwl5PVdzOkteFE4QJ0ucdY+ItXO3t2YxInTpoVMz19YhSe2tsauUp0So8DlPlB60V4UqP740GcQ8CmNagaZriEppBxSL033GgPN7wv4lqaCg/LzlvlpT34/5+/6q89BNibp35WlKM9htG/amZ30fcb7BcXw96oism3rmyc9QcZLxDGj3Clc24WyM0A1qBX4X6kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LPV+Cg2w; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LPV+Cg2w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2pQJ2K88z3bfN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 17:03:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3732B403BA;
	Fri,  7 Nov 2025 06:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D186FC4CEF5;
	Fri,  7 Nov 2025 06:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762495398;
	bh=TlVvyjy8Qz5ChlDvWPbBxE+vA1IB1QZdK1yG9sKb7DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPV+Cg2wMPbNl1q2cCNQmh8ekcy8rJwpZ2QzvQr3CkIRAs6QlBnp5w6K4bnjX3O7e
	 mZ7z7nM9j1sVHLYXXpeSFgtswQjKBsjoc5cYhXX1NG0/mom6XoCGKVaCGP8YB29LJ6
	 AXqZgFQSBMTQpJemxdrpoMEzOp05DEB3yocDtCdzkv0j4EtaxbZ06gHugQwxPq0qaL
	 nzLKSNxtaylvIc3zfm8mbqndZDqhpYstZs39ys3kMmPlsAl/39qPIGtE4MOtZXeT6d
	 3K9c5ozOP6/ZoQP7AD8NDIdO/6hacVbF52jW752Le2R+WlgjJwi1PI5anY1W8uQFXY
	 Tz2SFKS7br/tg==
Date: Fri, 7 Nov 2025 11:33:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, mad skateman <madskateman@gmail.com>, 
	"R . T . Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Lukas Wunner <lukas@wunner.de>, 
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>, Roland <rol7and@gmx.com>, 
	Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org, 
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] PCI/ASPM: Cache Link Capabilities so quirks can
 override them
Message-ID: <6fni6w6aolqgxazmepiw2clwjq54yt76pjswx7zmdgebj4svqz@mggk4qyhdrrt>
References: <20251106183643.1963801-1-helgaas@kernel.org>
 <20251106183643.1963801-2-helgaas@kernel.org>
 <944388a9-1f5d-41e4-8270-ac1fb6cf73e1@rock-chips.com>
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
In-Reply-To: <944388a9-1f5d-41e4-8270-ac1fb6cf73e1@rock-chips.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07, 2025 at 09:17:09AM +0800, Shawn Lin wrote:
> 在 2025/11/07 星期五 2:36, Bjorn Helgaas 写道:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > Cache the PCIe Link Capabilities register in struct pci_dev so quirks can
> > remove features to avoid hardware defects.  The idea is:
> > 
> >    - set_pcie_port_type() reads PCIe Link Capabilities and caches it in
> >      dev->lnkcap
> > 
> >    - HEADER quirks can update the cached dev->lnkcap to remove advertised
> >      features that don't work correctly
> > 
> >    - pcie_aspm_cap_init() relies on dev->lnkcap and ignores any features not
> >      advertised there
> > 
> 
> Quick test with a NVMe shows it works.
> 
> Before this patch,  lspci -vvv dumps:
> 
>  LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
>          ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>  LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
> 
> 
> Capabilities: [21c v1] L1 PM Substates
>          L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> L1_PM_Substates+
>                    PortCommonModeRestoreTime=10us PortTPowerOnTime=10us
>          L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                     T_CommonMode=0us LTR1.2_Threshold=26016ns
> 
> After this patch + a local quirk patch like your patch 2, it shows:
> 
>  LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
>          ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>  LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
> 
> Capabilities: [21c v1] L1 PM Substates
>           L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> L1_PM_Substates+
>                     PortCommonModeRestoreTime=10us PortTPowerOnTime=10us
>           L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>                      T_CommonMode=0us LTR1.2_Threshold=0ns
> 
> 
> 
> One things I noticed is CommClk in LnkCtl is changed.

That's not because of this series, but because of your quirk that disables L0s
and L1. Common Clock Configuration happens only when ASPM is enabled, if it is
disabled, PCI core will not configure it (the value remains untouched). That's
why it was enabled before your quirk and disabled afterwards.

This bit is also only used to report the L0s and L1 Exit latencies by the
devices.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

