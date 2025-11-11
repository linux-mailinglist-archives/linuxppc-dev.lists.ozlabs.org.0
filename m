Return-Path: <linuxppc-dev+bounces-14022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C2C4B590
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 04:38:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5C1k3h1Pz2yvM;
	Tue, 11 Nov 2025 14:38:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.224.83.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762829354;
	cv=none; b=OoHeUUTqUAf+yEg2FMl2tw7BL0L+iZdt9ndqSpl2jjReADXWdEPYi3Z6ghokVugdIl4/9SmvMDwd1/NEdOKg0F8E60FftNF4lOaLUXZBGzI0WenawYE5XXaiEDS0zAeo1qlyOJLLZaBZVnKxIdOVvpXPaXWbtwsVYBIS86pkqaxse9/mly+qQ61l2vf8FsJordlwX7ujY9+McC835z3pbBJ8LQWM9dfW3tOiZtjaGmCZFI+jqD1ZFBzmNGC8fUA0LrmZEn+3ebWlh7y+H9Q3mYD0/X6EIOUeYeGu9zDnmJMDuzsSSQqVgYtcruX79qQxFaLe6pzxhzmKTuwYvlSxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762829354; c=relaxed/relaxed;
	bh=wldv8Qsh/4sLIhJ4SctOETeeCU5PBThyRygSnxhx63A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XeTti4WT6jFBeh489R5NbZAjK8S2P9YTMMaNEk7cgNvDNcV7VlUuIvKe90jI/JpvaY2nYCIIkiJ081QIEYEpLrB1TxvQ+fqowOKefHm3Pn/shC+VyuBQwGkt8uInjHoH3V2Zp9JmaFu87rI/3WF6rgPjdD62ZDSsU7a7B6azMeli2khLhhdFbw9RlG5H9P6tnqhBIQjfglYp58kPI+4ht6P5YFctKDCKJJK8cw/2mojBiqkquHtfeZyg1mCI6gLaNQqJ7EOLYdHtULPpUPB85EmWAy30mOp1/qqOg5IDqNF0lnOVJDoXH3OCQ7qSIMisYZTpBE0gicjS9CfGvKGthw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cd08qT9+; dkim-atps=neutral; spf=pass (client-ip=156.224.83.48; helo=mail-m8348.xmail.ntesmail.com; envelope-from=shawn.lin@rock-chips.com; receiver=lists.ozlabs.org) smtp.mailfrom=rock-chips.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cd08qT9+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rock-chips.com (client-ip=156.224.83.48; helo=mail-m8348.xmail.ntesmail.com; envelope-from=shawn.lin@rock-chips.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2407 seconds by postgrey-1.37 at boromir; Tue, 11 Nov 2025 13:49:11 AEDT
Received: from mail-m8348.xmail.ntesmail.com (mail-m8348.xmail.ntesmail.com [156.224.83.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d59wR4lC8z2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 13:49:08 +1100 (AEDT)
Received: from [172.16.12.129] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 291ba890e;
	Tue, 11 Nov 2025 09:33:53 +0800 (GMT+08:00)
Message-ID: <4a2a4203-3eb0-4eab-a06e-ce5c6bf18ff4@rock-chips.com>
Date: Tue, 11 Nov 2025 09:33:52 +0800
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
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Christian Zigotzky <chzigotzky@xenosoft.de>,
 Manivannan Sadhasivam <mani@kernel.org>, mad skateman
 <madskateman@gmail.com>, "R . T . Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, luigi burdo <intermediadc@hotmail.com>,
 Al <al@datazap.net>, Roland <rol7and@gmx.com>,
 Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au,
 linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 0/4] PCI/ASPM: Allow quirks to avoid L0s and L1
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
References: <20251110222929.2140564-1-helgaas@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251110222929.2140564-1-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a708c486b09cckunm21ab4954142baac
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5LSVZCGE4fHUkfHh8ZHktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cd08qT9+ofTOHLviYsPJU6/zj7uWHpgRHy2ESEJxDV1L/c8gW4npffGalzbbjreYmLcwN/86vIr1ikZC6wZsG4I+t/7HOnoH9eQLrFRhvbWfKt5+u+3Bis9Ii6eiLvJdGdTvAAOi91zO6iWc1PVmtroFmRO8/KE2EaOaRBNA7J0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wldv8Qsh/4sLIhJ4SctOETeeCU5PBThyRygSnxhx63A=;
	h=date:mime-version:subject:message-id:from;
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


在 2025/11/11 星期二 6:22, Bjorn Helgaas 写道:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> We enabled ASPM too aggressively in v6.18-rc1.  f3ac2ff14834 ("PCI/ASPM:
> Enable all ClockPM and ASPM states for devicetree platforms") enabled ASPM
> L0s, L1, and (if advertised) L1 PM Substates.
> 
> df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for devicetree platforms")
> (v6.18-rc3) backed off and omitted Clock PM and L1 Substates because we
> don't have good infrastructure to discover CLKREQ# support, and L1
> Substates may require device-specific configuration.
> 
> L0s and L1 are generically discoverable and should not require
> device-specific support, but some devices advertise them even though they
> don't work correctly.  This series is a way to add quirks avoid L0s and L1
> in this case.
> 

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Bjorn Helgaas (4):
>    PCI/ASPM: Cache L0s/L1 Supported so advertised link states can be
>      overridden
>    PCI/ASPM: Add pcie_aspm_remove_cap() to override advertised link
>      states
>    PCI/ASPM: Convert quirks to override advertised link states
>    PCI/ASPM: Avoid L0s and L1 on Freescale Root Ports
> 
>   drivers/pci/pci.h       |  2 ++
>   drivers/pci/pcie/aspm.c | 25 +++++++++++++++++--------
>   drivers/pci/probe.c     |  7 +++++++
>   drivers/pci/quirks.c    | 38 +++++++++++++++++++-------------------
>   include/linux/pci.h     |  2 ++
>   5 files changed, 47 insertions(+), 27 deletions(-)
> 


