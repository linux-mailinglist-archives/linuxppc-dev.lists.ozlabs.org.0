Return-Path: <linuxppc-dev+bounces-12633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E208ABB3664
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 11:08:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccmDN37CJz3cg1;
	Thu,  2 Oct 2025 19:08:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759396100;
	cv=none; b=Rsgmcsjk8z3LZ7ZJdyEXhGDJqrrt2X5X0th82WqRiEvaWXx2lJty/QilhWy8RHj722l8V6yvY/O712Sxyaf3u1TBauoc0y/NdgXw+WwGNC7Em6ppi8Sn2HjDXY5yZjowulcAfjhPn5vCy08vTwXR51AYoCFuc2Wc+HXnvb8ajb8kDV5d3ITAX83XuYOJZnVBCRjt7IG5cIWDfBQM2Kaz4euZxlwriJmDRLIs2x+ECThJbUTt6Os9cGvRU0lEQNsZvDdWoJc5ASvqVibfBPRqrdh6cfJ/jG7NMkmriG9mi1+Xd7/Fg7bnuPWaHW3fZmhjWKqareLjf3vefChirjIYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759396100; c=relaxed/relaxed;
	bh=BlLt5panXmmEHVXA0XxXsxYBIsfiOEYulVIp8xSB9XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbMZWEEoejRNKJC5R4HIdFxElV55FCyFmZXJyAKGovL05oBCSDP8Hug292rwpMj0rCv3T/HZDafkgP70gJ7fjh/vX3PL37L0VnkufjcDo8tA9TQSq+8H9shRFMS8hNxLBZgXrl2ADpCapZyG/4f4D8hMHJq7agahBZbPWO4O8aF25idKdUNmAHb1c8Bdtg7MysM6LoHjI8+GHTiN9xc/tMY1DgFkzws4hVff5NvFEl0OezW4E3wTOC/n430E5DdO2Ilg9EhrcX7XXCd6h2lEgkZb6j9edN3do662Co04X7fniwYQQD8JEI/8wcVRsch/xPKKMdJZHAPeVBwAi13dKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.48; helo=mail-ej1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.48; helo=mail-ej1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccmDL48hZz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 19:08:17 +1000 (AEST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7322da8so167557366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Oct 2025 02:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396093; x=1760000893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlLt5panXmmEHVXA0XxXsxYBIsfiOEYulVIp8xSB9XQ=;
        b=Rr9m0kbraYlEmeSWdCJUB6UYMU0r5F/rRTtaDdcYtbCWwug31REUpifRQ8AhVxGuJr
         ItmO8y2ypnLvEvhuk4n5Qm0d7JQ5F0fBIbHNJcIdk0P46+ere0LJ3Wy+RDnNh73h4I9H
         6kPtVpavOHiDmGE/+WIGYvwE8tb5Lg2sHzRJ2jJl+zXysz7hpvkKfo2Zd7Ue2Q1KQYAY
         nEgnqPfUz5NDmpzWuw6auLl1g7dgrexW9rnEUXLzHzlD8h/GD37x883u+ur0tC+lj19J
         7I5LqezhslcNoVaGl4r2FQDMpKgdBfx1rZCXX+68Q/peGSfFT6pzNUi/5YGvkpjwq3kT
         xhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXXgClX77Push/HLji8NA+XUYoQPxxuYliqxJ+GqGkArXLE6xJbm9D6jRaPt3U752aar8647pz+HZ0KtU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YylPQ1RbMudEMiGcpRz2IyEI0hKOJMFUgDnc0tSF3Y4h8KyG3Of
	Rix4l7IAVSJ4l74zE4hLKTnV/1wCAZ0gUNZ4ghR9y1A9LLGqwr7ZRBVl
X-Gm-Gg: ASbGnctS3/nobi/XqH8hKLpF7rj+urkxN/a6lcWNZb3362rfVy7pyqZGEdElU3pTLnB
	g2tpg1YS27I1UiV9Kt8/ycsqn5tgxFYLOauFgGCG5sM8BEhdK7eLbs0iysrHxkReXfsq8OLIOA5
	hsyjQhNaUivciJNOWI+5xT2T1uTU2dw3V2MNW9vk8dZTYGMOm6BHdTml67/lFU3E8JtBLYB9hHa
	ZqciYbZn93a0zdCDTZeYtpQ/19ARIQw/sH+ly2lzE44uofTJY4hazi9p7+Vj2l+4ajeV80tbW8I
	Z1TeRCZGfdRhfDHWA0s9jojf6jlGraOsw7VdBikQuGHPulhwh158EZCGP1LTNY7akdYbU2rtMlQ
	Qo565PDUxeuvINETAOqR8CHZVXEYoiIBuoaJSqQ==
X-Google-Smtp-Source: AGHT+IGpi5AWMPG26wffyaCaJQkmJM5i6JvDCSfBwhqoaFgRXhDDFMGP5iuKIHJhZ06XN3XmRGQUUg==
X-Received: by 2002:a17:907:2684:b0:b3f:a16d:da7b with SMTP id a640c23a62f3a-b46e4d7d845mr765523266b.8.1759396093087;
        Thu, 02 Oct 2025 02:08:13 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8b7sm157905466b.40.2025.10.02.02.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:08:12 -0700 (PDT)
Date: Thu, 2 Oct 2025 02:08:09 -0700
From: Breno Leitao <leitao@debian.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: pandoh@google.com, linux-pci@vger.kernel.org, 
	Karolina Stolarek <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller <ben.fuller@oracle.com>, 
	Drew Walton <drewwalton@microsoft.com>, Anil Agrawal <anilagrawal@meta.com>, 
	Tony Luck <tony.luck@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Sargun Dhillon <sargun@meta.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, 
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, 
	Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Bjorn Helgaas <bhelgaas@google.com>, kernel-team@meta.com, gustavold@gmail.com
Subject: Re: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <qvxxjffvet7lukrjina44y52bsim4grvjl3avtzjlh2rgncyl5@4z5k36wtad6u>
References: <buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457>
 <20251001213836.GA228836@bhelgaas>
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
In-Reply-To: <20251001213836.GA228836@bhelgaas>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Bjorn,

On Wed, Oct 01, 2025 at 04:38:36PM -0500, Bjorn Helgaas wrote:
> On Fri, Aug 01, 2025 at 06:16:29AM -0700, Breno Leitao wrote:
> > So, somehow the PCI was released at this point?

> For completeness, would you mind attaching the output of
> "sudo lspci -vvs 00:00.0" for one of these systems?

Sorry, I don't have this information anymore from the previous stack.
But, I've just a fresh instance of the issue that seems related to the one I
gave you.

Please let me know if you anything else from this instance and I will capture
for you.


	 {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 0
	 {1}[Hardware Error]: It has been corrected by h/w and requires no further action
	 {1}[Hardware Error]: event severity: corrected
	 {1}[Hardware Error]:  Error 0, type: corrected
	 {1}[Hardware Error]:   section_type: PCIe error
	 {1}[Hardware Error]:   port_type: 4, root port
	 {1}[Hardware Error]:   version: 3.0
	 {1}[Hardware Error]:   command: 0x0540, status: 0x0010
	 {1}[Hardware Error]:   device_id: 0000:00:00.0
	 {1}[Hardware Error]:   slot: 255
	 {1}[Hardware Error]:   secondary_bus: 0x00
	 {1}[Hardware Error]:   vendor_id: 0x8086, device_id: 0x2020
	 {1}[Hardware Error]:   class_code: 060000
	 {1}[Hardware Error]:   aer_cor_status: 0x00000040, aer_cor_mask: 0x00000000
	 {1}[Hardware Error]:   aer_uncor_status: 0x00000000, aer_uncor_mask: 0x00100000
	 {1}[Hardware Error]:   aer_uncor_severity: 0x00062030
	 {1}[Hardware Error]:   TLP Header: 00000000 00000000 00000000 00000000
	 Oops: general protection fault, probably for non-canonical address 0xdffffc0000000054: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN
	 KASAN: null-ptr-deref in range [0x00000000000002a0-0x00000000000002a7]
	 CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Kdump: loaded Tainted: G S          E    N  6.16.1-0_debug_rc12_0_g1031909ae07a #1 PREEMPT(none) 
	 Tainted: [S]=CPU_OUT_OF_SPEC, [E]=UNSIGNED_MODULE, [N]=TEST
	 Hardware name: Foo
	 Workqueue: events aer_recover_work_func
	 RIP: 0010:___ratelimit+0x36/0x750
	 Code: ec 38 49 89 f7 48 89 fb 65 48 8b 05 fc da 84 03 48 89 44 24 30 48 ba 00 00 00 00 00 fc ff df 48 83 c7 40 48 89 f8 48 c1 e8 03 <0f> b6 04 10 84 c0 0f 85 17 05 00 00 44 8b 63 40 4c 8d 6b 44 4c 89
	 RSP: 0018:ffff8882893c7a28 EFLAGS: 00010202
	 RAX: 0000000000000054 RBX: 0000000000000260 RCX: 0000000000000000
	 RDX: dffffc0000000000 RSI: ffffffff84b1cedb RDI: 00000000000002a0
	 RBP: 0000000000000002 R08: ffffffff87093aff R09: 1ffffffff0e1275f
	 R10: dffffc0000000000 R11: fffffbfff0e12760 R12: 0000000000000002
	 R13: dffffc0000000000 R14: ffff8882953ce000 R15: ffffffff84b1cedb
	 FS:  0000000000000000(0000) GS:ffff88905e498000(0000) knlGS:0000000000000000
	 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
	 CR2: 00007fd58a9f2000 CR3: 00000002bd08f002 CR4: 00000000007726f0
	 PKRU: 55555554
	 Call Trace:
	  <TASK>
	  ? trace_aer_event+0x6a/0x1f0
	  pci_print_aer+0x30f/0x6c0
	  aer_recover_work_func+0x13b/0x200
	  ? process_scheduled_works+0x959/0x1450
	  process_scheduled_works+0x9fe/0x1450
	  worker_thread+0x8fd/0xd10
	  ? __kthread_parkme+0xd0/0x1c0
	  ? _raw_spin_unlock_irqrestore+0x42/0xa0
	  ? __kthread_parkme+0x92/0x1c0
	  kthread+0x50c/0x630
	  ? pr_cont_work+0x4a0/0x4a0
	  ? kthread_blkcg+0xa0/0xa0
	  ret_from_fork+0x1c6/0x390
	  ? kthread_blkcg+0xa0/0xa0
	  ret_from_fork_asm+0x11/0x20
	  </TASK>
	 Modules linked in: sch_fq(E) tls(E) act_gact(E) tcp_diag(E) inet_diag(E) cls_bpf(E) intel_uncore_frequency(E) intel_uncore_frequency_common(E) skx_edac(E) skx_edac_common(E) nfit(E) libnvdimm(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) coretemp(E) kvm_intel(E) mlx5_ib(E) iTCO_wdt(E) iTCO_vendor_support(E) xhci_pci(E) kvm(E) evdev(E) irqbypass(E) acpi_cpufreq(E) ib_uverbs(E) i2c_i801(E) xhci_hcd(E) ipmi_si(E) i2c_smbus(E) mlx5_fwctl(E) ipmi_devintf(E) wmi(E) ipmi_msghandler(E) button(E) sch_fq_codel(E) bpf_preload(E) ip6_tables(E) vhost_net(E) tun(E) vhost(E) vhost_iotlb(E) tap(E) mpls_gso(E) mpls_iptunnel(E) mpls_router(E) fou(E) loop(E) drm(E) backlight(E) drm_panel_orientation_quirks(E) autofs4(E) efivarfs(E)

And the lspci as you've requested

	# sudo lspci -vvs 00:00.0
	00:00.0 Host bridge: Intel Corporation Sky Lake-E DMI3 Registers (rev 04)
	Subsystem: Intel Corporation Device 0000
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 0
	Capabilities: [90] Express (v2) Root Port (Slot-), IntMsgNum 0
		DevCap:    MaxPayload 256 bytes, PhantFunc 0
		ExtTag- RBE+ TEE-IO-
		DevCtl:    CorrErr- NonFatalErr- FatalErr- UnsupReq-
		RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
		MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:    CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:    Port #0, Speed 8GT/s, Width x4, ASPM not supported
		ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:    ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk-
		ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:    Speed unknown, Width x0
		TrErr- Train- SlotClk- DLActive- BWMgmt- ABWMgmt-
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable+ ErrNon-Fatal+ ErrFatal+ PMEIntEna- CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range BCD, TimeoutDis+ NROPrPrP- LTR-
		10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
		EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
		FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
		AtomicOpsCap: Routing- 32bit+ 64bit+ 128bitCAS+
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
		AtomicOpsCtl: ReqEn- EgressBlck-
		IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
		10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
		Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
		Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
		EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
		Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [e0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100 v1] Vendor Specific Information: ID=0002 Rev=0 Len=00c <?>
	Capabilities: [144 v1] Vendor Specific Information: ID=0004 Rev=1 Len=03c <?>
	Capabilities: [1d0 v1] Vendor Specific Information: ID=0003 Rev=1 Len=00a <?>
	Capabilities: [250 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: LaneErr at lane: 0 1 2
	Capabilities: [280 v1] Vendor Specific Information: ID=0005 Rev=3 Len=018 <?>
	Capabilities: [300 v1] Vendor Specific Information: ID=0008 Rev=0 Len=038 <?>


thanks
--breno

