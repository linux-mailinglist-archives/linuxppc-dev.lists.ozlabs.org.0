Return-Path: <linuxppc-dev+bounces-15431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8FD06277
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnH2q58SLz2yFn;
	Fri, 09 Jan 2026 07:44:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767881961;
	cv=none; b=FjCKN0DWiGSiGJJrd4LNEjQslEKhisIYs5WLLBHDheCKaRcRLcCY5Aam0rauc4Y6dJiGzNeVLFVWCLjLEBals7ISgzV2ks20Yf//osQ97fTtIHIA34IhR4xqXqr2WRkRJQDjPv0FGq+HazQgzc5BNgYhRotmXXD8VHqBbLQlQHGWThDAoCJqKfQL+nZ+tXUNjVCPEPROeVO4fUA6nHN/ulTDO1tVTu1yfjuTASuJ+4ll+nxDSgt99yISq7/53W3N8VkU9PgO4TKnhRZsBRT4OWs3gqzVgzpPmiPS+7e3KuX3S2UI2oxTr10X4pJ9URXz0P5iQg3rZB4ERjQarzn6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767881961; c=relaxed/relaxed;
	bh=2pJVAlx9bx6bh8NZnUx64FaNPqmWJ/VI2nAAY5xDgGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ohkb3onLNQFZN8BKaRAvw6UuHwHu/3rplwuBtN91C7ifHVX6RwjfeYXnrfvBIMtUiuP0oRz2INjXKYygRccpnxe2FL4PrdFlyomTHquA3yPbGIa+hbciL0vXCS5RO+HQA5/XrEKr+g54MWKPXZtLowEC5sslP8iOOqXlJNDlbHmreFWORdq7SR8U/iy27uO7PBh6Wd4rsN2tvoW3JqYIoJkAz5O+ffHaetb2o4ZTUDDhK/nofEA4DkXtOk0NffT2y6NEeNtT5PfINHpNSg6Lwp0mkQ9WX6aGn+Z5tvZh7rNwdHCFgrKub/uVSEyL0kLUkhXwHokTG8ht1AMDH/5ocw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Df6Ma/Ty; dkim-atps=neutral; spf=pass (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Df6Ma/Ty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.179; helo=mail-pf1-f179.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn6Tz1dmwz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 01:19:18 +1100 (AEDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b80fed1505so2304932b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 06:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767881895; x=1768486695; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pJVAlx9bx6bh8NZnUx64FaNPqmWJ/VI2nAAY5xDgGo=;
        b=Df6Ma/Ty5TUsi8sh4UM+y+kQvIiOy5O/m8+W7J/dbM/buIh+yCQd654xirLBfuVSpC
         uiFaGfPgv7z5pUv1eFCPWXCV07RRC22/uGh68X7v7eXbifl6rrd/UgBlfoqRV+Tw/qm7
         IBnb3YrwFxTJ4gk1YKCv+65QOgMNmJIG173Xk7jvfIqq0mqLYA5zXWWKLev4bRDJmpap
         NMhssci5XBI/8txw5lrka+lPzzCxbor0Nq1usPHcW5lbZN3+EPBeyagS6oZDG5mcDXm6
         t+JyzqvTDwL9F7xyPrKv3C6BLO/FvOhV1DeEkDB/aWQRcpBXbrZp6xUz82YSs1O5BOPq
         nhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881895; x=1768486695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pJVAlx9bx6bh8NZnUx64FaNPqmWJ/VI2nAAY5xDgGo=;
        b=KWe3PA9FXDtU46RsC5bA+yD+BmLyk1qrdHPB0GvHOW5LugygL6sFCxtrMo9qwp7YzP
         Vl79GYVDnrQbGgjGTNZcAtQFS6wAqeq7AQsVURZnVW6nuFJ9uYkffNeJg0Y+ia5facTU
         Bkw1dvl5en/zAYx0z+VAcBJtAZ76LxiP7gqt9RdCYgni0q2Xz2yv0QIgfCjw61jd3TJn
         utxitdkWPq04kqfSaitVxXGqh+eZT2kmVgLLdVgI0radywXP4VLSo0h8BOyA5/GjuHLv
         Jc3inkOjfUSGGGWzzGrCzQhxkZSegLsIhYzqNOBj2ZVT1gjU30U2KxVjsv1i8Xtzu7lw
         an0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp4iOSgJ4eZA9xUZMukP48vVgFoEaEO1Cf1LeB0uboD9OgoIpkTvZ2dqpPwWyAbZU8MQEMqCodW6X7SrA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmO3xMYeM8D+9+f6lhQHuHWMu8WBAL6yU/YF+P0mO2fEDvYWza
	K27+IKw6HmXj41KskZtcgrfPSibZjFmOyqCjy3knqMCYuvzhGU5nuj8=
X-Gm-Gg: AY/fxX5yOueELFB/LkZq47Z9jCNoc8M1o1BDvbWqiNx8O6lkRbGLTYIgmwe5nEc7/ny
	PWoUl0CvCIN2NqZoRBmckcofmMix4vikq9YL4vVYF6tcUsM+4T+kaMk+4zsurLMtQ85biUb4lfp
	FxQ2/sK+TcbTo+Ps5ONulXzEpRIblkkh4AzTifZSJEqrWiljusytkfqqXBYybAIwgo0rrgqyFfq
	S5ghsvNWMesWPrKZO5yJn65cRrpcNhBQ4DREQz8TAjzYfPkPvZawHoQarQGy8idjKLBoFGxneyW
	qW6oM9R31PiVLwmkqZuDKvnIK/gZVVIJ8eKV3Df/5TNYzRLvpBSR/FveGPXQJlGEUc2XIjwBxyv
	qLYtuWIwjD5+Vp1M4d3V4UULkXUXpP9DwYNfyWETTT3oW2YEw8og6Kuzosk+I2w34N4G26MMuWm
	797WOaKGKPMWDpZJE=
X-Google-Smtp-Source: AGHT+IEibuXgcznIY8q9CVouxCGujXqfV2VIu0G1iExmkchhbFHHZ+bOsQ6z9wSPH7WPWS06Ha8LEA==
X-Received: by 2002:a05:6a00:1d8e:b0:7e8:4398:b35b with SMTP id d2e1a72fcca58-81b7fccaa65mr5344377b3a.46.1767881894781;
        Thu, 08 Jan 2026 06:18:14 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dcc5c3793sm94658b3a.8.2026.01.08.06.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:18:14 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mingo@redhat.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	tglx@linutronix.de,
	westeri@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Thu,  8 Jan 2026 14:18:04 +0000
Message-ID: <20260108141804.1086-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108113701.GR2275908@black.igk.intel.com>
References: <20260108113701.GR2275908@black.igk.intel.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [atharvatiwarilinuxdev(at)gmail.com]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.210.179 listed in wl.mailspike.net]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.166.195 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

linux mint wouldnt install, because it gives a GRUB error.
so i cant compile the kernel, so the lspci is from 6.12:

00:00.0 Host bridge [0600]: Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller [8086:9b53] (rev 03)
	DeviceName: SATA
	Subsystem: Intel Corporation Comet Lake-S 6c Host Bridge/DRAM Controller [8086:7270]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 0
	Capabilities: [e0] Vendor Specific Information: Len=10 <?>
	Kernel driver in use: skl_uncore

00:01.0 PCI bridge [0604]: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 03) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) [8086:7270]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 17
	IOMMU group: 1
	Bus: primary=00, secondary=01, subordinate=03, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: 81600000-817fffff [size=2M] [32-bit]
	Prefetchable memory behind bridge: a0000000-b01fffff [size=258M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [88] Subsystem: Intel Corporation 6th-10th Gen Core Processor PCIe Controller (x16) [8086:7270]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee02000  Data: 0020
	Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #2, Speed 8GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <256ns, L1 <8us
			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
		LnkSta:	Speed 8GT/s, Width x8
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #1, PowerLimit 75W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via WAKE#, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd-
			 AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS+
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Via WAKE#, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [140 v1] Root Complex Link
		Desc:	PortNumber=02 ComponentID=01 EltType=Config
		Link0:	Desc:	TargetPort=00 TargetComponent=01 AssocRCRB- LinkType=MemMapped LinkValid+
			Addr:	00000000fed19000
	Capabilities: [d94 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Kernel driver in use: pcieport

00:12.0 Signal processing controller [1180]: Intel Corporation Comet Lake PCH Thermal Controller [8086:06f9]
	Subsystem: Intel Corporation Comet Lake PCH Thermal Controller [8086:7270]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ -2147483648
	IOMMU group: 2
	Region 0: Memory at 81816000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal

00:14.0 USB controller [0c03]: Intel Corporation Comet Lake USB 3.1 xHCI Host Controller [8086:06ed] (prog-if 30 [XHCI])
	Subsystem: Intel Corporation Comet Lake USB 3.1 xHCI Host Controller [8086:7270]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 25
	IOMMU group: 3
	Region 0: Memory at 81800000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: [70] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
		Address: 00000000fee0b000  Data: 0021
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: xhci_hcd

00:14.2 RAM memory [0500]: Intel Corporation Comet Lake PCH Shared SRAM [8086:06ef]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 3
	Region 0: Memory at 81814000 (64-bit, non-prefetchable) [disabled] [size=8K]
	Region 2: Memory at 81817000 (64-bit, non-prefetchable) [disabled] [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

00:16.0 Communication controller [0780]: Intel Corporation Comet Lake HECI Controller [8086:06e0]
	Subsystem: Intel Corporation Comet Lake HECI Controller [8086:7270]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 44
	IOMMU group: 4
	Region 0: Memory at 81818000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee04000  Data: 0021
	Capabilities: [a4] Vendor Specific Information: Len=14 <?>
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:1b.0 PCI bridge [0604]: Intel Corporation Comet Lake PCI Express Root Port #17 [8086:06c0] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Comet Lake PCI Express Root Port [8086:7270]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 18
	IOMMU group: 5
	Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
	I/O behind bridge: f000-0fff [disabled] [16-bit]
	Memory behind bridge: fff00000-000fffff [disabled] [32-bit]
	Prefetchable memory behind bridge: b0400000-b16fffff [size=19M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #17, Speed 8GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #16, PowerLimit 25W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 260ms to 900ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee04000  Data: 0020
	Capabilities: [90] Subsystem: Intel Corporation Comet Lake PCI Express Root Port [8086:7270]
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [150 v1] Precision Time Measurement
		PTMCap: Requester:- Responder:+ Root:+
		PTMClockGranularity: 4ns
		PTMControl: Enabled:+ RootSelected:+
		PTMEffectiveGranularity: Unknown
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+ L1_PM_Substates+
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+
		L1SubCtl2:
	Capabilities: [220 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [250 v1] Downstream Port Containment
		DpcCap:	INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
		DpcCtl:	Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP- SwTrigger- DL_ActiveErr-
		DpcSta:	Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO ErrPtr:1f
		Source:	0000
	Kernel driver in use: pcieport

00:1c.0 PCI bridge [0604]: Intel Corporation Device [8086:06b8] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:7270]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 19
	IOMMU group: 6
	Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
	I/O behind bridge: f000-0fff [disabled] [16-bit]
	Memory behind bridge: 81000000-814fffff [size=5M] [32-bit]
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR+ <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #0, PowerLimit 10W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee06000  Data: 0020
	Capabilities: [90] Subsystem: Intel Corporation Device [8086:7270]
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0500
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [150 v1] Precision Time Measurement
		PTMCap: Requester:- Responder:+ Root:+
		PTMClockGranularity: 4ns
		PTMControl: Enabled:+ RootSelected:+
		PTMEffectiveGranularity: Unknown
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+ L1_PM_Substates+
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+
		L1SubCtl2:
	Capabilities: [250 v1] Downstream Port Containment
		DpcCap:	INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
		DpcCtl:	Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP- SwTrigger- DL_ActiveErr-
		DpcSta:	Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO ErrPtr:1f
		Source:	0000
	Kernel driver in use: pcieport

00:1c.1 PCI bridge [0604]: Intel Corporation Device [8086:06b9] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:7270]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin B routed to IRQ 20
	IOMMU group: 7
	Bus: primary=00, secondary=06, subordinate=06, sec-latency=0
	I/O behind bridge: f000-0fff [disabled] [16-bit]
	Memory behind bridge: 80000000-800fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: b1700000-b17fffff [size=1M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #2, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #1, PowerLimit 10W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee08000  Data: 0020
	Capabilities: [90] Subsystem: Intel Corporation Device [8086:7270]
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [150 v1] Precision Time Measurement
		PTMCap: Requester:- Responder:+ Root:+
		PTMClockGranularity: 4ns
		PTMControl: Enabled:+ RootSelected:+
		PTMEffectiveGranularity: Unknown
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+ L1_PM_Substates+
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
		L1SubCtl2:
	Capabilities: [250 v1] Downstream Port Containment
		DpcCap:	INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
		DpcCtl:	Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP- SwTrigger- DL_ActiveErr-
		DpcSta:	Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO ErrPtr:1f
		Source:	0000
	Kernel driver in use: pcieport

00:1c.4 PCI bridge [0604]: Intel Corporation Device [8086:06bc] (rev f0) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation Device [8086:7270]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 21
	IOMMU group: 8
	Bus: primary=00, secondary=07, subordinate=7c, sec-latency=0
	I/O behind bridge: 5000-8fff [size=16K] [16-bit]
	Memory behind bridge: 81900000-8fafffff [size=226M] [32-bit]
	Prefetchable memory behind bridge: b1800000-bf7fffff [size=224M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #5, Speed 8GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #4, PowerLimit 25W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee02000  Data: 0022
	Capabilities: [90] Subsystem: Intel Corporation Device [8086:7270]
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
		RootCmd: CERptEn+ NFERptEn+ FERptEn+
		RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
			 FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
		ErrorSrc: ERR_COR: 0700 ERR_FATAL/NONFATAL: 0000
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [150 v1] Precision Time Measurement
		PTMCap: Requester:- Responder:+ Root:+
		PTMClockGranularity: 4ns
		PTMControl: Enabled:+ RootSelected:+
		PTMEffectiveGranularity: Unknown
	Capabilities: [220 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [250 v1] Downstream Port Containment
		DpcCap:	INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 4, DL_ActiveErr+
		DpcCtl:	Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP- SwTrigger- DL_ActiveErr-
		DpcSta:	Trigger- Reason:00 INT- RPBusy- TriggerExt:00 RP PIO ErrPtr:1f
		Source:	0000
	Kernel driver in use: pcieport

00:1e.0 Communication controller [0780]: Intel Corporation Comet Lake PCH Serial IO UART Host Controller #0 [8086:06a8]
	Subsystem: Intel Corporation Comet Lake PCH Serial IO UART Host Controller [8086:7270]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ -2147483648
	IOMMU group: 9
	Region 0: Memory at 4000100000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel modules: intel_lpss_pci

00:1e.1 Communication controller [0780]: Intel Corporation Comet Lake PCH Serial IO UART Host Controller #1 [8086:06a9]
	Subsystem: Intel Corporation Comet Lake PCH Serial IO UART Host Controller [8086:7270]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin B routed to IRQ -2147483648
	IOMMU group: 9
	Region 0: Memory at 4000101000 (64-bit, non-prefetchable) [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [90] Vendor Specific Information: Len=14 <?>
	Kernel modules: intel_lpss_pci

00:1f.0 ISA bridge [0601]: Intel Corporation Z490 Chipset LPC/eSPI Controller [8086:0685]
	Subsystem: Intel Corporation Z490 Chipset LPC/eSPI Controller [8086:7270]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 10

00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
	Subsystem: Intel Corporation Comet Lake PCH cAVS [8086:7270]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 46
	IOMMU group: 10
	Region 0: Memory at 81810000 (64-bit, non-prefetchable) [size=16K]
	Region 4: Memory at 4000000000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
	Capabilities: [80] Vendor Specific Information: Len=14 <?>
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee08000  Data: 0021
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_cnl

00:1f.4 SMBus [0c05]: Intel Corporation Comet Lake PCH SMBus Controller [8086:06a3]
	Subsystem: Intel Corporation Comet Lake PCH SMBus Controller [8086:7270]
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 10
	Region 0: Memory at 8181b000 (64-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at 4040 [size=32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

00:1f.5 Serial bus controller [0c80]: Intel Corporation Comet Lake PCH SPI Controller [8086:06a4]
	Subsystem: Intel Corporation Comet Lake PCH SPI Controller [8086:7270]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 10
	Region 0: Memory at fe010000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: intel-spi
	Kernel modules: spi_intel_pci

00:01.0/01:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch [1002:1478] (rev 47) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 1
	Region 0: Memory at 81700000 (32-bit, non-prefetchable) [size=16K]
	Bus: primary=01, secondary=02, subordinate=03, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: 81600000-816fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: a0000000-b01fffff [size=258M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Upstream Port, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 75W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x8, ASPM L1, Exit Latency L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x8
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp+ 10BitTagReq+ OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: Routing+ 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [270 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [320 v1] Latency Tolerance Reporting
		Max snoop latency: 71680ns
		Max no snoop latency: 71680ns
	Capabilities: [370 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=250us PortTPowerOnTime=170us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=0us LTR1.2_Threshold=0ns
		L1SubCtl2: T_PwrOn=10us
	Capabilities: [400 v1] Data Link Feature <?>
	Capabilities: [410 v1] Physical Layer 16.0 GT/s <?>
	Capabilities: [440 v1] Lane Margining at the Receiver <?>
	Kernel driver in use: pcieport

00:01.0/01:00.0/02:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479] (prog-if 00 [Normal decode])
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 22
	IOMMU group: 1
	Bus: primary=02, secondary=03, subordinate=03, sec-latency=0
	I/O behind bridge: 3000-3fff [size=4K] [16-bit]
	Memory behind bridge: 81600000-816fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: a0000000-b01fffff [size=258M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Downstream Port (Slot-), MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr+ FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+
		LnkSta:	Speed 8GT/s, Width x16
			TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 4
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing+
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -3.5dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee01000  Data: 0020
	Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 14, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 34000000 03000010 00000000 80008000
	Capabilities: [270 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [2a0 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:01.0/01:00.0/02:00.0/03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 14 [Radeon RX 5500/5500M / Pro 5500M] [1002:7340] (rev 47) (prog-if 00 [VGA controller])
	Subsystem: Apple Inc. Navi 14 [Radeon RX 5500/5500M / Pro 5500M] [106b:0219]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 255
	IOMMU group: 1
	Region 0: Memory at a0000000 (64-bit, prefetchable) [size=256M]
	Region 2: Memory at b0000000 (64-bit, prefetchable) [size=2M]
	Region 4: I/O ports at 3000 [size=256]
	Region 5: Memory at 81600000 (32-bit, non-prefetchable) [size=512K]
	Expansion ROM at 81680000 [disabled] [size=128K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x16
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit+ 64bit+ 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [200 v1] Physical Resizable BAR
		BAR 0: current size: 256MB, supported: 256MB 512MB 1GB 2GB 4GB
		BAR 2: current size: 2MB, supported: 2MB 4MB 8MB 16MB 32MB 64MB 128MB 256MB
	Capabilities: [240 v1] Power Budgeting <?>
	Capabilities: [270 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [2a0 v1] Access Control Services
		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
	Capabilities: [2b0 v1] Address Translation Service (ATS)
		ATSCap:	Invalidate Queue Depth: 00
		ATSCtl:	Enable-, Smallest Translation Unit: 00
	Capabilities: [2c0 v1] Page Request Interface (PRI)
		PRICtl: Enable- Reset-
		PRISta: RF- UPRGI- Stopped+
		Page Request Capacity: 00000100, Page Request Allocation: 00000000
	Capabilities: [2d0 v1] Process Address Space ID (PASID)
		PASIDCap: Exec+ Priv+, Max PASID Width: 10
		PASIDCtl: Enable- Exec- Priv-
	Capabilities: [320 v1] Latency Tolerance Reporting
		Max snoop latency: 71680ns
		Max no snoop latency: 71680ns
	Kernel modules: amdgpu

00:01.0/01:00.0/02:00.0/03:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 HDMI Audio [1002:ab38]
	Subsystem: Apple Inc. Navi 10 HDMI Audio [106b:0219]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin B routed to IRQ 45
	IOMMU group: 1
	Region 0: Memory at 816a0000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x16
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee06000  Data: 0021
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [2a0 v1] Access Control Services
		ACSCap:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1b.0/04:00.0 Mass storage controller [0180]: Apple Inc. ANS2 NVMe Controller [106b:2005] (rev 01) (prog-if 02)
	Subsystem: Apple Inc. ANS2 NVMe Controller [106b:1800]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin ? routed to IRQ 43
	IOMMU group: 11
	Region 0: Memory at b0400000 (64-bit, prefetchable) [size=4M]
	Region 2: Memory at b1400000 (64-bit, prefetchable) [size=512K]
	Region 4: Memory at b1600000 (64-bit, prefetchable) [size=64K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable- 64bit+
		Address: 00000000fee02000  Data: 0021
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch+ ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [148 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [168 v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Capabilities: [170 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=0us PortTPowerOnTime=0us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1+
			   T_CommonMode=0us LTR1.2_Threshold=81920ns
		L1SubCtl2: T_PwrOn=44us
	Capabilities: [180 v1] Vendor Specific Information: ID=0002 Rev=1 Len=100 <?>
	Capabilities: [280 v1] Physical Resizable BAR
		BAR 0: current size: 4MB, supported: 1MB 2MB 4MB
	Kernel driver in use: nvme
	Kernel modules: nvme

00:1b.0/04:00.1 Non-VGA unclassified device [0000]: Apple Inc. T2 Bridge Controller [106b:1801] (rev 01)
	Subsystem: Apple Inc. T2 Bridge Controller [106b:1801]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	IOMMU group: 11
	Region 0: Memory at b0800000 (64-bit, prefetchable) [size=4M]
	Region 2: Memory at b1480000 (64-bit, prefetchable) [size=512K]
	Region 4: Memory at b1610000 (64-bit, prefetchable) [size=64K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch+ ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [180 v1] Vendor Specific Information: ID=0002 Rev=1 Len=100 <?>
	Capabilities: [280 v1] Physical Resizable BAR
		BAR 0: current size: 4MB, supported: 1MB 2MB 4MB

00:1b.0/04:00.2 Non-VGA unclassified device [0000]: Apple Inc. T2 Secure Enclave Processor [106b:1802] (rev 01)
	Subsystem: Apple Inc. T2 Secure Enclave Processor [106b:1802]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	IOMMU group: 11
	Region 0: Memory at b0c00000 (64-bit, prefetchable) [size=4M]
	Region 2: Memory at b1500000 (64-bit, prefetchable) [size=512K]
	Region 4: Memory at b1620000 (64-bit, prefetchable) [size=64K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch+ ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [180 v1] Vendor Specific Information: ID=0002 Rev=1 Len=100 <?>
	Capabilities: [280 v1] Physical Resizable BAR
		BAR 0: current size: 4MB, supported: 1MB 2MB 4MB

00:1b.0/04:00.3 Multimedia audio controller [0401]: Apple Inc. Apple Audio Device [106b:1803] (rev 01)
	Subsystem: Apple Inc. Apple Audio Device [106b:188b]
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	IOMMU group: 11
	Region 0: Memory at b1000000 (64-bit, prefetchable) [disabled] [size=4M]
	Region 2: Memory at b1580000 (64-bit, prefetchable) [disabled] [size=512K]
	Region 4: Memory at b1630000 (64-bit, prefetchable) [disabled] [size=64K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch+ ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [180 v1] Vendor Specific Information: ID=0002 Rev=1 Len=100 <?>
	Capabilities: [280 v1] Physical Resizable BAR
		BAR 0: current size: 4MB, supported: 1MB 2MB 4MB

00:1c.0/05:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM4364 802.11ac Wireless Network Adapter [14e4:4464] (rev 04)
	Subsystem: Apple Inc. BCM4364 802.11ac Wireless Network Adapter [106b:07bf]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+ <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 12
	Region 0: Memory at 81400000 (64-bit, non-prefetchable) [size=32K]
	Region 2: Memory at 81000000 (64-bit, non-prefetchable) [size=4M]
	Capabilities: [48] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=2 PME-
	Capabilities: [58] MSI: Enable- Count=1/16 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [68] Vendor Specific Information: Len=44 <?>
	Capabilities: [ac] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr+ FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <2us, L1 <32us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via WAKE#, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt+ UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 0f, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 40000001 0000000f 8140004c 00000000
	Capabilities: [13c v1] Device Serial Number 68-68-da-ff-ff-36-14-7d
	Capabilities: [150 v1] Power Budgeting <?>
	Capabilities: [160 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [1b0 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Capabilities: [220 v1] Physical Resizable BAR
		BAR 2: current size: 4MB, supported: 1MB 2MB 4MB
	Capabilities: [240 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=0us PortTPowerOnTime=10us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=0us LTR1.2_Threshold=0ns
		L1SubCtl2: T_PwrOn=10us
	Kernel modules: brcmfmac

00:1c.1/06:00.0 Ethernet controller [0200]: Broadcom Inc. and subsidiaries NetXtreme BCM57766 Gigabit Ethernet PCIe [14e4:1686] (rev 01)
	Subsystem: Broadcom Inc. and subsidiaries NetXtreme BCM57766 Gigabit Ethernet PCIe [14e4:1686]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 11
	IOMMU group: 13
	Region 0: Memory at b1700000 (64-bit, prefetchable) [size=64K]
	Region 2: Memory at b1710000 (64-bit, prefetchable) [size=64K]
	Expansion ROM at 80000000 [disabled] [size=2K]
	Capabilities: [48] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
	Capabilities: [50] Vital Product Data
		Product Name: Broadcom NetXtreme Gigabit Ethernet Controller
		Read-only fields:
			[PN] Part number: BCM957766
			[EC] Engineering changes: 106679-15
			[SN] Serial number: 0123456789
			[MN] Manufacture ID: 14e4
			[RV] Reserved: checksum good, 27 byte(s) reserved
		End
	Capabilities: [58] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [a0] MSI-X: Enable+ Count=6 Masked-
		Vector table: BAR=2 offset=00000000
		PBA: BAR=2 offset=00000120
	Capabilities: [ac] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <4us, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr+ NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <2us, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [13c v1] Device Serial Number 00-00-00-10-18-00-00-00
	Capabilities: [150 v1] Power Budgeting <?>
	Capabilities: [160 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [1b0 v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Kernel driver in use: tg3
	Kernel modules: tg3

00:1c.4/07:00.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 14
	Bus: primary=07, secondary=08, subordinate=7c, sec-latency=0
	I/O behind bridge: 5000-8fff [size=16K] [16-bit]
	Memory behind bridge: 81900000-8fafffff [size=226M] [32-bit]
	Prefetchable memory behind bridge: b1800000-bf7fffff [size=224M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Capabilities: [c0] Express (v2) Upstream Port, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 25W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <2us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [800 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Capabilities: [a00 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=0us PortTPowerOnTime=10us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=0us LTR1.2_Threshold=0ns
		L1SubCtl2: T_PwrOn=10us
	Capabilities: [b00 v1] Precision Time Measurement
		PTMCap: Requester:- Responder:- Root:-
		PTMClockGranularity: Unimplemented
		PTMControl: Enabled:+ RootSelected:-
		PTMEffectiveGranularity: 4ns
	Kernel driver in use: pcieport

00:1c.4/07:00.0/08:00.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 15
	Bus: primary=08, secondary=09, subordinate=09, sec-latency=0
	I/O behind bridge: 0000f000-00000fff [disabled] [32-bit]
	Memory behind bridge: 81a00000-81afffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #0, PowerLimit 0W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=1 RefClk=100ns PATEntryBits=1
		Arb:	Fixed+ WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
		VC1:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable- ID=1 ArbSelect=Fixed TC/VC=00
			Status:	NegoPending+ InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [900 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:1c.4/07:00.0/08:01.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Physical Slot: 1
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 23
	IOMMU group: 16
	Bus: primary=08, secondary=0b, subordinate=43, sec-latency=0
	I/O behind bridge: 5000-6fff [size=8K] [16-bit]
	Memory behind bridge: 81b00000-88afffff [size=112M] [32-bit]
	Prefetchable memory behind bridge: b1800000-b87fffff [size=112M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee03000  Data: 0020
	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
			Slot #1, PowerLimit 0W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
			Changed: MRL- PresDet- LinkState-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending+ InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [900 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:1c.4/07:00.0/08:02.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 17
	Bus: primary=08, secondary=0a, subordinate=0a, sec-latency=0
	I/O behind bridge: 0000f000-00000fff [disabled] [32-bit]
	Memory behind bridge: 81900000-819fffff [size=1M] [32-bit]
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disabled] [64-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #2, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #0, PowerLimit 0W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [900 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:1c.4/07:00.0/08:04.0 PCI bridge [0604]: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:15ea] (rev 06) (prog-if 00 [Normal decode])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Physical Slot: 2
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 24
	IOMMU group: 18
	Bus: primary=08, secondary=44, subordinate=7c, sec-latency=0
	I/O behind bridge: 7000-8fff [size=8K] [16-bit]
	Memory behind bridge: 88b00000-8fafffff [size=112M] [32-bit]
	Prefetchable memory behind bridge: b8800000-bf7fffff [size=112M] [32-bit]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee05000  Data: 0020
	Capabilities: [ac] Subsystem: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] [8086:0000]
	Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #4, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
			Slot #4, PowerLimit 0W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
			Changed: MRL- PresDet- LinkState-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectable De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending+ InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [900 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
		ACSCtl:	SrcValid+ TransBlk- ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:1c.4/07:00.0/08:00.0/09:00.0 System peripheral [0880]: Intel Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] [8086:15eb] (rev 06)
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] [8086:0000]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 10
	IOMMU group: 19
	Region 0: Memory at 81a00000 (32-bit, non-prefetchable) [size=256K]
	Region 1: Memory at 81a40000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [c0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
		Vector table: BAR=1 offset=00000000
		PBA: BAR=1 offset=00000fa0
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Kernel driver in use: thunderbolt
	Kernel modules: thunderbolt

00:1c.4/07:00.0/08:02.0/0a:00.0 USB controller [0c03]: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018] [8086:15ec] (rev 06) (prog-if 30 [XHCI])
	Subsystem: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018] [8086:0000]
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 26
	IOMMU group: 20
	Region 0: Memory at 81900000 (32-bit, non-prefetchable) [size=64K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D3 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME-
	Capabilities: [88] MSI: Enable+ Count=1/8 Maskable- 64bit+
		Address: 00000000fee09000  Data: 0020
	Capabilities: [c0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x4
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ 10BitTagReq- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Device Serial Number ee-ad-a4-f1-8e-b3-02-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1 Len=100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=8086 Rev=2 Len=04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [800 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Kernel driver in use: xhci_hcd

