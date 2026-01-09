Return-Path: <linuxppc-dev+bounces-15448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11443D07790
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 07:58:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnXfH4dvhz2xQK;
	Fri, 09 Jan 2026 17:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767941879;
	cv=none; b=CM1i791e4Gofu6B0CcDje6e3jiWqXND7xta3dWdaavN0aEQIm9Wufqq8w1vmuJtZaGIxduWlR2uXJb3E62q0m6kaI8MzuxLoJd14FlKKBsV7fdcRFOCYCj3Mh+fvXZOUnBb5EXHDC67S8yiqieRKM2Rfy9mbDgVJloY1Ao0E2rI96hWdbnoRUwW6w5+JHaOFLjHSa0WjBeb3BNLoT36lNXvM75rPh9sSsNzx08CePIoKOKo6rWvYhciUXi1HoUjQaTNEtNlV9iNNzNrfDKINXKywfRSCRa7RDSQ/6PVjmveMLonGV1ELE88IQqD0omo6REZN/zJAG2Ll+KWr+nMlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767941879; c=relaxed/relaxed;
	bh=Adl4K2ef+7ao2+6tXxxxvZg3Z+41hfQK5470ks3tGhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+DIHyeCU/JMn/bIvWXpAzD7IevA5b7bw8WZf2rcS/zpAVcn5txvd7lAQ/WGDZ7otFUWFnHzeaXVhhVnWyf30MjIZy/HRpAMQOUZON6RagBgnXAyiLWKhtlTl4SvAPBegJwI/1clFQs4j36fMXb0441fkplneIfNNAwpZ/tX44DUtKL/4LyZKHnfCE564IzChd+qcsTWf5WSkT36BjY4Ln3ExSM1RVDg+qvqnfmEcFux8zgS6wXUtRYSf4L6Yg6bDtqTYKQHK/LPGyJkEr9NJYVBs7ZT4EyBD4/cjj+DeQfIkxfVGxwMI6w7GBSerDb5j9t/kQYPpoeY+fbsYCMQJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BtTEl0s1; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BtTEl0s1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnXfD20Dkz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 17:57:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767941876; x=1799477876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FlO0xEN6Jh0wwWYqypG+Z0Vs7hkbD+IyuhpO4YrXzCQ=;
  b=BtTEl0s1jzzXuQsqWNe4riSOUGXIwxcg5epATxFTGj8jP4UIGasLWclx
   YprvDMCmhR2JyX+nTUT463LyXavjNyDNqpf2Dobj1h80cBVB9P41qmZcQ
   av4W8RwT8twb9XaPv+Qtk5Ey6hav/dJ/D88jg4U72pFyQMxmZmztEqcT1
   FRLbMA09Ljbcie0z7jlfUqefKV6wFnABseHVM/mLc4mluJCzRNIWdBCOz
   uTONbKtd72BRYZ0cDol+sGjkZtCEtkKu4IhtZCB8zOeBh6KiALANJwYlu
   RsyLCkOfC0W9zEtBKV8nhTnCmFw0P5iOZ3htSP2zd+K5WkFild3r6/L+m
   w==;
X-CSE-ConnectionGUID: PS9UmntQQae/S/YYAAhUSQ==
X-CSE-MsgGUID: N5PkXL76TCGgQEFbuHQHsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79619249"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79619249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 22:57:51 -0800
X-CSE-ConnectionGUID: YDNB1ScjQaiMHEmYsfgGfg==
X-CSE-MsgGUID: wqzbjOnoS9+MoeRdKTcM8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="208236178"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jan 2026 22:57:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3E18994; Fri, 09 Jan 2026 07:57:46 +0100 (CET)
Date: Fri, 9 Jan 2026 07:57:46 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: YehezkelShB@gmail.com, andreas.noever@gmail.com, bhelgaas@google.com,
	bp@alien8.de, dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de, mahesh@linux.ibm.com, mingo@redhat.com,
	oohall@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	tglx@linutronix.de, westeri@kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <20260109065746.GT2275908@black.igk.intel.com>
References: <20260108113701.GR2275908@black.igk.intel.com>
 <20260108141804.1086-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20260108141804.1086-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 02:18:04PM +0000, Atharva Tiwari wrote:
> linux mint wouldnt install, because it gives a GRUB error.
> so i cant compile the kernel, so the lspci is from 6.12:

That's fine, thanks!

> 00:1c.4/07:00.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
> 	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
> 	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Latency: 0
> 	Interrupt: pin A routed to IRQ 10
> 	IOMMU group: 14
> 	Bus: primary=07, secondary=08, subordinate=7c, sec-latency=0
> 	I/O behind bridge: 5000-8fff [size=16K] [16-bit]
> 	Memory behind bridge: 81900000-8fafffff [size=226M] [32-bit]
> 	Prefetchable memory behind bridge: b1800000-bf7fffff [size=224M] [32-bit]
> 	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> 	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> 		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> 	Capabilities: [80] Power Management version 3
> 		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
> 		Address: 0000000000000000  Data: 0000
> 	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
> 	Capabilities: [c0] Express (v2) Upstream Port, MSI 00
> 		DevCap:	MaxPayload 128 bytes, PhantFunc 0
> 			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 25W
> 		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> 			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> 			MaxPayload 128 bytes, MaxReadReq 512 bytes
> 		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> 		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <2us
> 			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> 		LnkCtl:	ASPM Disabled; Disabled- CommClk+
> 			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> 		LnkSta:	Speed 8GT/s, Width x4
> 			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> 		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
> 			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> 			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> 			 FRS-
> 			 AtomicOpsCap: Routing-
> 		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
> 			 AtomicOpsCtl: EgressBlck-
> 		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> 		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> 			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> 			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> 		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> 			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> 			 Retimer- 2Retimers- CrosslinkRes: unsupported
> 	Capabilities: [50] Capability ID 0x15 [0000]
> 	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
> 	Capabilities: [200 v1] Advanced Error Reporting
> 		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> 		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
> 		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
> 		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
> 		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
> 		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
> 			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> 		HeaderLog: 00000000 00000000 00000000 00000000
> 	Capabilities: [300 v1] Virtual Channel
> 		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
> 		Arb:	Fixed- WRR32- WRR64- WRR128-
> 		Ctrl:	ArbSelect=Fixed
> 		Status:	InProgress-
> 		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> 			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
> 			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
> 			Status:	NegoPending- InProgress-
> 	Capabilities: [400 v1] Power Budgeting <?>
> 	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
> 	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
> 	Capabilities: [700 v1] Secondary PCI Express
> 		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> 		LaneErrStat: 0
> 	Capabilities: [800 v1] Latency Tolerance Reporting
> 		Max snoop latency: 0ns
> 		Max no snoop latency: 0ns
> 	Capabilities: [a00 v1] L1 PM Substates
> 		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> 			  PortCommonModeRestoreTime=0us PortTPowerOnTime=10us
> 		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
> 			   T_CommonMode=0us LTR1.2_Threshold=0ns
> 		L1SubCtl2: T_PwrOn=10us
> 	Capabilities: [b00 v1] Precision Time Measurement
> 		PTMCap: Requester:- Responder:- Root:-
> 		PTMClockGranularity: Unimplemented
> 		PTMControl: Enabled:+ RootSelected:-

At least this shows a similar issue we fixed for Barlow Ridge.

I don't have Titan Ridge host here so cannot try to repro but I wonder if
you could still try with CONFIG_PCIE_PTM=n and see if that changes
anything? Of course assuming you get the Linux installation working again.

