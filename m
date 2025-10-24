Return-Path: <linuxppc-dev+bounces-13254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63720C04ABE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 09:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctDm768rfz30RJ;
	Fri, 24 Oct 2025 18:19:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.14 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761290343;
	cv=pass; b=GtbTYMz1kVM+qh/GtzNbpdBMA34nIDfzL7vKMUecstgEUB0EZVi2MJUgM5rdpNVCWe8pgSz48liOPBgn9msJfZ23w4iF7ZgLWo5PdrRUGdJWmPGjPZw79XyKGYNqxRhs7FeLhWh2VJKnP0l3oEJ5lGuqVtDw9uk7i1U4UeFFPWdGqwm2lz51SjhUdr3XH77Ozvaw2z52S4qZ3rc0FFucnOvUhhgVXK3VV7gMM7CdNmksUokI8XdpA/Car9mJnnWxp/No84RcedyXXAF/RiBzBp7d4xWXzo27R2x/LsoFcdrIPYvHRvJPaLxyiW76O5xLCFWW24dqK8kn6iN+t3cJcA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761290343; c=relaxed/relaxed;
	bh=jMhYjIgzI56WFLFbDoemyYsL56xYdbXKmoNZIYBeJQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gzm7x1ASfs4keT6LQctLY98VlR7KDhIiLpG4hbeNzhMP1nhyAmmnIE8PiGnFQ5dONRpOLvNNQzeIRXj86Ujl0o0fxQ7JDKIC3vRGaVD9GMyUKorfuNsQIyBJ3M/z01LXWdQ+r2ZdG+CUVyNRmFElEsD+2CS6/4jnQq0Om90oLHQIuSCF3oc+YWbhlgqb1vJYtfhPrLrzt0MNkLQvj7I2A28u0VAJMA5/eTT+8iWkckgFgQKAQYkfMoXGNT4GjKQiUCAla0aii4i5MZl/5SCp+RVNsIjxmYpL4ZnnF3NylpejTeykmANfGPSsvdStemPrO+FEIxm9t6emcbOCtlGyyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/dLlSe8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/dLlSe8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctDm52cPwz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 18:18:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290341; x=1792826341;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jMhYjIgzI56WFLFbDoemyYsL56xYdbXKmoNZIYBeJQA=;
  b=j/dLlSe8C2xGCTZFB+efeuGC9jpenmivdpwAZtpTA8uubNZnJ46c/THo
   jnNI5nFjl5QwkknSEaYw/dGJeQK8z/4EnMMyUDgKGQpJpXA6DSoRUjmu9
   OuYaRB08PghRc5lqjKWahYMCzYokz4nXkx+g2Wg016N4Ez/lyC9MUl79V
   c7CpHDkAIdxxWWVoWBkOR9KPzgsU4N0Pt1TZz7sRfs/KrqUZ/LWDqouIi
   UkbqD3AmnT6gj81ibuZvGU2TtIMbwPFqVokhAuM4iEg5/25zEoKSeyxOy
   lhVK0HAdzPM2SXgz561ix0cfbZ7gOdlStgkyEBAyQ3micowwjQ9x1d+ih
   Q==;
X-CSE-ConnectionGUID: dCfMX2s9TFeZGCTlic36aA==
X-CSE-MsgGUID: 4lEBkW0PQ4ejNstqxsw3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63506582"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63506582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:18:56 -0700
X-CSE-ConnectionGUID: jzKOJylaStSArALb6GtW7w==
X-CSE-MsgGUID: 12zIbcIKS9yI+YkmEbfw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221563191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:18:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:18:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:18:55 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1p5oSUOD7JY139fN1zuFVrIUlfpjsflAbodv3rsDPFvrIdYGPSaI4jKK9is1O0iFLr+6UPctbPS3paQKZmX3OGDgFivpyZZ2w8k1wRTXaZkvhlO8Mp4k0JbNqNXCIAP32nfQI1zoMXM22RWz0flB8kk3gs5J82Yl2ye5y5fHAWQGFC8H4KWxXK2Tkg3Mqny60QzsGFa+A+P6S0bEvH9eZygEdnDKNM5+OaR/jfEY1/r+XODEmt6b2IuraCFmaN11KUwxXtevydkmN50seBlxS3y8yFFFw9XN2faaf3izJiZPtG2gGgKhIewNQPJHeZIzDA4LnyUJIrQSkWwXe/95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMhYjIgzI56WFLFbDoemyYsL56xYdbXKmoNZIYBeJQA=;
 b=Zh2uUqRV+uhA5OFQu5ljR/mPrCbeQNONjiETBM5QiLAQxbGTSIpCCsHALVlW+cVKrekPbTpI9SVQtsERqPyuJBDvIHPAGPjWfIw/+2CN/UPa2BCe6Ri9RZWNfGtoamdC1EPIeq3VCHDttVoZfNPtju1Zg1iGsQZAu0edSvuam1n+Arx6cNc8wFe1qFax0AOlAefxY5OBZrTQPCoGfQKbCRMG57piBbO3Vw/cCJEtkmAa1C4gZnCyBw8bto1sfBtxf6f3oJivecYPKJKl3NGJVli/8gVeyTUsFKVkL9EfQOpq/Qbd6YfH9f+sUhY+qEBVXeSDx2MItwmzaa/I8m8hHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:18:52 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:18:52 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 15/25] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
Thread-Topic: [PATCH v3 15/25] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
Thread-Index: AQHcPv2qqi9Jus2wYUe9WIJFI4OQ5rTQ7ueA
Date: Fri, 24 Oct 2025 07:18:52 +0000
Message-ID: <c2a34f05801ec5e3a9c51f0c585b368c82c4ea43.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-16-seanjc@google.com>
In-Reply-To: <20251017003244.186495-16-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH3PPFD6B8A798D:EE_
x-ms-office365-filtering-correlation-id: 576b7a9f-7cdf-4884-203d-08de12cd95d8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?MzZGWU5oNmx5YnRaNnFNNkYwenZranZjOVZFWWoybnBRL2oxSkZRUC9zdWhS?=
 =?utf-8?B?MVZDTkRkSlZlcmVOdG9zakswUWdrV1ZydERzVU5mV0tHYjB2WmtaUHM2ZXFL?=
 =?utf-8?B?YWhORGRua2tiTVNOaXNpb014SXNZTVdPR1U1eHE4QUVHM1JJT1Fzb0l2Vzdi?=
 =?utf-8?B?NVY5UHpCeW9VZGkwYm9OQlJsck9tWmEvaFFFV0FBa1lkbFArbFZzUXBzUUYv?=
 =?utf-8?B?d093Zm14U29FWk05MTEvUmJCZnM2UllyU2U4bStQNldScDJSNWtPSVVGSGRB?=
 =?utf-8?B?ZFplRFpiYmFOb2xHZE16NGlxUEtWKzdCZDZBNUsybmdTbFNLR0F2RnRBd0JC?=
 =?utf-8?B?S1BWVkZEV2FiazJFRFY1czZoYVRzTTMxNFI2b1pTNmppby9DSVJ5bTE3Z2ZZ?=
 =?utf-8?B?S0FYV2NhUytnb2ZaMUx1T0dKMjlRaE51eThGc3FsWUpjL0hZZjMvSm9iVTIx?=
 =?utf-8?B?ekdGQ3Q4MTkzSWxjZ29pMXFKWGgxckltS096eXpQVFNpS0pVOXlyRnVOS1VU?=
 =?utf-8?B?bzkxOGJXV3Zvald3NE1Pb2NWNkc4L3hidEpVSi9Na2lVTStkTnkyVE80MnRC?=
 =?utf-8?B?bTYzditCSlZ4b1BLbHg1Niszb2dmZStwRENBa2drcG8zNzNQU3lnbFlIQ2Fu?=
 =?utf-8?B?dzZjT0tpMm5maDFnOWsxYmFRczM4b2p0NFFQcTEzTGZKMWozc2RybzhKdGk0?=
 =?utf-8?B?L09obGIzbW01bUhmY3UvS2l1Nm0rS1pOckZETW5jTWZQL3N4Z29XazB3Z3Er?=
 =?utf-8?B?emNmUzlycWxPUWpIVktJRE10YVVGR3BicjlDSFNyNk9rUXNrTEVJVjZiRjBM?=
 =?utf-8?B?QzdnUmJkU2VrcHRnOE02SVZKVTVnTHo3cTNvdFRyUDBUaHdzMkV0K3BFUXBj?=
 =?utf-8?B?ZjJ2MmRhRE93Sm1GMHBobmxZeGZ5NVJ4RVRPM1BHdG1OOXVMeEtTeFBLSktR?=
 =?utf-8?B?WkMrTFA5d0k5UVhRSFhKOUwvVkppV1FlOUJjU1QyR1VsNFJ5NXlEQ3J3aERD?=
 =?utf-8?B?RnVrOXlLQWd5K2ppc2V5bEpEdE5VWjFycGhKeHlUendqcE03ZkxscCtQV0Uv?=
 =?utf-8?B?Y1I0YkJiYnp5aVRnOWlwbWhZZ29PL1JhT2MrYlRIZTlEVjMxR1RmSXFIVUV2?=
 =?utf-8?B?dlBDVEdLMnJ2dy8ra3dXQ0pHRVdGYkVkYkphVFVvd1QxSnBFNjVtWHM2Mmda?=
 =?utf-8?B?RnVxMDZ0WmlBZHVacEZUTHZBSURVYWJGSy9MUVpxRHFNYVpkOTRCOWNWM3hp?=
 =?utf-8?B?VENXUjBjTks3NVdWZ0hWekIxQ0ZGbGF2MFRxYXZ2b2pRQXAzUnVZZGtNZzNH?=
 =?utf-8?B?K04yaC94MVltK2hmNUVmblk4V2gvZGRZRDU1OEE4WEZVWlZtdWJ6WGhXeE9M?=
 =?utf-8?B?dlJQQ0hSclF5QmtNWkhIcHdpU1V2a1h3TDA3L0FVQXFBaGVVejdpaWlUOHlm?=
 =?utf-8?B?ejhVMXZ1ZTAzVDNqSzZGVEpuV2Yydkd0clJPa25LZEF4aDZTZFhPMmx4V2V3?=
 =?utf-8?B?MjhubjB1VWU4ajNTWTYzQ3JoMEVxejljMXJJdGkydEwzZHEvTHZiWldheldp?=
 =?utf-8?B?NXNqZEFhVHl2MmkyQ0ZvNDVhMlU3S2ZJbHBacVlCREJienRXYU02SnViWVl1?=
 =?utf-8?B?QUZjcGRremZSUFYySEUzSC9tSndYaU8rR3duUGlwWHA2cHc0RE16SEdGSHd4?=
 =?utf-8?B?anhkTHNqaHBtanBnSzhMVjlwNlFoK2ZoeCsyM3RTSGUwcFZNRy9ibkIrdHU1?=
 =?utf-8?B?NFUycm9Oc254KzJsZmVaTERBdnZUejZqWDEvWGhvZ2E0MXk5VkVlSGJyelN0?=
 =?utf-8?B?WUtHOURpZ3ZadkhvSllwZGM0QVpRV3grNVNGR1VsZEtQRkt5OEV0TndsVnFD?=
 =?utf-8?B?b2NES2pOeU5za3ZRejlzUXpjSEc3WVlycWdCWndCcTlGRkM2TUlTekhIaFlD?=
 =?utf-8?B?OG9MQjBIYkRrbmV0R3E1a3ptdzNqWVZLbzVhaWFUSUtOVVRZaTNyamlYTjNU?=
 =?utf-8?B?dVJMSGsxMUZyOWVBekdHRlRKbHVCeG96dVcvVmQzd3BxSWh5UkRkQzRPeE5x?=
 =?utf-8?B?MGdlZjM5eS9oY3VuQzZwMnVtS3F4Z1BmOFhQdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG1HeS9RQjZvNGlTNHJrSkpGVGhFeERUY3Q1MllmdDZWN0tXcXpCTzdYZTFK?=
 =?utf-8?B?dlJLWENDN2hFaWtnUlZDUzJrSC9XVGdpYjB4M08ydnlwRDJacWlaVVlJL3Iz?=
 =?utf-8?B?NDlXNnlkZmkrWjhvbGYyWjhyUCtOZVAvd0xXQTErVlMyNlF4RUlGS3hjaDJs?=
 =?utf-8?B?QTJRSzU2bzliZVltSytRSzRWL2RzRUZuZUxCRFg3OWhXdG9PVEpzSWMrRmsw?=
 =?utf-8?B?RmdQaHVya25wTnBXQlFjSjQ0VmdpckZ1VE9MMUNqTTJZNzM1ZmluVTJSTElB?=
 =?utf-8?B?S2xMME0ranRRclh5azBYUjM2cmhkblhLMUJyRjc4R1JwcDlIME8vRzltM2pI?=
 =?utf-8?B?bFphcUxhTjhrbjhYckdQSUVRRTIraUtpanJIUjVaK0xyRzd6Y0tJUk9qSFpH?=
 =?utf-8?B?ZExqU2ZvK3hPMHRoZy84NkdMM0MrOXhrb3hzUmhzNGFBaENRUCt5VGpJVWkw?=
 =?utf-8?B?N3JrWHMwTkRhRkY2RHVVK3hkWXUrVFMyS081ajBsNytqNWp0eXJLNGRnSUlQ?=
 =?utf-8?B?bS8zL0x4cERNTlc4eUI1REJWTmIyQnBteEpOdE8zeUd1T2JqWHp2RXN3OXFF?=
 =?utf-8?B?Q3NCSmVJczZLS2xVME5jck1UVU53T0Vxd0dFRi8yRlZBdzJCZlI4bzFvb0xD?=
 =?utf-8?B?YUc0U2J5NEUya2E2Vmd4VlNYQ205eTdKRCs3QXk5akFHQiswNzFSWGFsQWdk?=
 =?utf-8?B?WlVaU21WdllWL0o2bEdpemVSMDFhYzFjTkViSDY0bmg3bTkzeUtOaC9tMzdl?=
 =?utf-8?B?bGprOGRBK2lzTjkrMUtnSlhUc3ovZERJRE80NG1kd3Iwd2x2MlZlMDJxKzV3?=
 =?utf-8?B?MW5ONWhjc00wTnNZckc3cFNiUzVYVGNjWk13dGR3L1JYcEd3SFpOM0xLcjVB?=
 =?utf-8?B?Wit1eDRGZ1llYkZ1N1FSWTRBaEpjbjkyek9lMWJQWXc0RzlKSmtTK3oxNHRJ?=
 =?utf-8?B?UUUrRHI1MUNSSjYwL0k1dzBzNFB2UFkySTl0dGNubzV4RktZTW5iT3RpZlN2?=
 =?utf-8?B?ZXZ3YnQyMWIyWElQZjJGMGxGWWc1ZHR2OVhHcHdENDM5RzVJSlZhT2dpUHBY?=
 =?utf-8?B?K05CdEVEbmtsTlRHNTQyMlZyd1NlMkhHcHZJcEUzUVZlV2pId1UzQWUrN3Na?=
 =?utf-8?B?TFJzejM0V21KYzl2WFJuSm9mWStUYzRGU3U1dzBkZzBTTUVjNkUxVDd2RmxZ?=
 =?utf-8?B?eURWTzJEZGd5bXdBMFR0V2pNeC9RcEhEYVc2L0NycjFaSXBWRkQzcWcxc0ZM?=
 =?utf-8?B?TXZCazMxTkhNd1BmQ0dnV2d1b2FlaFBCbFVZUnRuUzcxQ1NPL1ZFdndUR3Fu?=
 =?utf-8?B?N2pNSVhyVndpM0MwUEdUOTJNTkEveUZHVzcyZ3czTTVkL1lVOTA5M1kxb0tJ?=
 =?utf-8?B?YUJaSUZ6MGltakw4OG9tVnRsL0psdngvWkRnVEFDRVZ5alFqc1Fkd1pTcEpy?=
 =?utf-8?B?VHJjeW52am1BWFdqbGw3Qlk0bzN6eVovZDVLMFluSnI4aWExeGh1dmpDcGRC?=
 =?utf-8?B?NXdqMGhyaGZPckpFMDl5M1hpdVUxRW1Eb0JtRlM5NGFCQXp3NHRMUVJmWnA1?=
 =?utf-8?B?WkxLNm1WaFJTSHJkZno2bjlhY0VGbzNSSW1GMGhTY3FJNStTOTJ2dnZqZWJW?=
 =?utf-8?B?bkVManRYUFBERTNBWFRUcmlQOHhvZVU4MFhkWmlwbDVLeE1vWE0zSzNSaEhn?=
 =?utf-8?B?Y2JkWmZqV2V6V2w4bEFpMkozR3hJQUV4WCsyUTBvc3RuQUpqM0FCVDlvRUR0?=
 =?utf-8?B?RU5JMFNYcTFMOHZrMWdOQ1ZaWHppMGxSQktHbkdhRVBTdktqRTNOMnVxQVZ4?=
 =?utf-8?B?ak5zVk1HTTRCS3BxWEZUNzVzRlRUcXdndnhlcHdpUnVncEpBV1cyeVRtdjhx?=
 =?utf-8?B?cU5MNEJFRU9aMFA4Sll2d0R4eEppZmxUWFhvVE5YSFRYaU43VHdFOG9iRC91?=
 =?utf-8?B?YjM5Q1ZGeU9EWCtoZlVJa1VURm1URFNaYmxmOUcyWmlJMEd6YURwdXZ2bUVw?=
 =?utf-8?B?VFJ4b2RUSmxpdldxajlSZWVqelNOTVlnejB5RlJOMHV5RHNnU01tTVhETnlT?=
 =?utf-8?B?cjRFeHpuZkJiNGQvem9RN2dZK0g0MHNFQlFGbkhWWFg0NXVDVzF6M2hQQmlT?=
 =?utf-8?Q?OdRMYFooqTNTKmq0A/s0ej7Ne?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30D5410B4A0CDD4BBC495359879C03E2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576b7a9f-7cdf-4884-203d-08de12cd95d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:18:52.4007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5etMHUjyuWFbE+YGrOKGfMMbS4sIlov4NaGJ3QjdqsJl4RuKut6X//bDLvWyovPfSvlyYeE2tLs7mmk4O9uPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBXaGVuIHBvcHVsYXRpbmcgdGhlIGluaXRpYWwgbWVtb3J5IGltYWdlIGZvciBhIFRE
WCBndWVzdCwgQUREIHBhZ2VzIHRvIHRoZQ0KPiBURCBhcyBwYXJ0IG9mIGVzdGFibGlzaGluZyB0
aGUgbWFwcGluZ3MgaW4gdGhlIG1pcnJvciBFUFQsIGFzIG9wcG9zZWQgdG8NCj4gY3JlYXRpbmcg
dGhlIG1hcHBpbmdzIGFuZCB0aGVuIGRvaW5nIEFERCBhZnRlciB0aGUgZmFjdC4gIERvaW5nIEFE
RCBpbiB0aGUNCj4gUy1FUFQgY2FsbGJhY2tzIGVsaW1pbmF0ZXMgdGhlIG5lZWQgdG8gdHJhY2sg
InByZW1hcHBlZCIgcGFnZXMsIGFzIHRoZQ0KPiBtaXJyb3IgRVBUIChNLUVQVCkgYW5kIFMtRVBU
IGFyZSBhbHdheXMgc3luY2hyb25pemVkLCBlLmcuIGlmIEFERCBmYWlscywNCj4gS1ZNIHJldmVy
dHMgdG8gdGhlIHByZXZpb3VzIE0tRVBUIGVudHJ5IChndWFyYW50ZWVkIHRvIGJlICFQUkVTRU5U
KS4NCj4gDQo+IEVsaW1pbmF0aW5nIHRoZSBob2xlIHdoZXJlIHRoZSBNLUVQVCBjYW4gaGF2ZSBh
IG1hcHBpbmcgdGhhdCBkb2Vzbid0IGV4aXN0DQo+IGluIHRoZSBTLUVQVCBpbiB0dXJuIG9idmlh
dGVzIHRoZSBuZWVkIHRvIGhhbmRsZSBlcnJvcnMgdGhhdCBhcmUgdW5pcXVlIHRvDQo+IGVuY291
bnRlcmluZyBhIG1pc3NpbmcgUy1FUFQgZW50cnkgKHNlZSB0ZHhfaXNfc2VwdF96YXBfZXJyX2R1
ZV90b19wcmVtYXAoKSkuDQo+IA0KPiBLZWVwaW5nIHRoZSBNLUVQVCBhbmQgUy1FUFQgc3luY2hy
b25pemVkIGFsc28gZWxpbWluYXRlcyB0aGUgbmVlZCB0byBjaGVjaw0KPiBmb3IgdW5jb25zdW1l
ZCAicHJlbWFwIiBlbnRyaWVzIGR1cmluZyB0ZHhfdGRfZmluYWxpemUoKSwgYXMgdGhlcmUgc2lt
cGx5DQo+IGNhbid0IGJlIGFueSBzdWNoIGVudHJpZXMuICBEcm9wcGluZyB0aGF0IGNoZWNrIGlu
IHBhcnRpY3VsYXIgcmVkdWNlcyB0aGUNCj4gb3ZlcmFsbCBjb2duaXRpdmUgbG9hZCwgYXMgdGhl
IG1hbmFnZW1lbnRlZCBvZiBucl9wcmVtYXBwZWQgd2l0aCByZXNwZWN0DQoJCQkJIF4NCgkJCQkg
bWFuYWdlbWVudA0KDQo+IHRvIHJlbW92YWwgb2YgUy1FUFQgaXMgX3ZlcnlfIHN1YnRsZS4gIEUu
Zy4gc3VjY2Vzc2Z1bCByZW1vdmFsIG9mIGFuIFMtRVBUDQo+IGVudHJ5IGFmdGVyIGl0IGNvbXBs
ZXRlZCBBREQgZG9lc24ndCBhZGp1c3QgbnJfcHJlbWFwcGVkLCBidXQgaXQncyBub3QNCj4gY2xl
YXIgd2h5IHRoYXQncyAib2siIGJ1dCBoYXZpbmcgaGFsZi1iYWtlZCBlbnRyaWVzIGlzIG5vdCAo
aXQncyBub3QgdHJ1bHkNCj4gIm9rIiBpbiB0aGF0IHJlbW92aW5nIHBhZ2VzIGZyb20gdGhlIGlt
YWdlIHdpbGwgbGlrZWx5IHByZXZlbnQgdGhlIGd1ZXN0DQo+IGZyb20gYm9vdGluZywgYnV0IGZy
b20gS1ZNJ3MgcGVyc3BlY3RpdmUgaXQncyAib2siKS4NCj4gDQo+IERvaW5nIEFERCBpbiB0aGUg
Uy1FUFQgcGF0aCByZXF1aXJlcyBwYXNzaW5nIGFuIGFyZ3VtZW50IHZpYSBhIHNjcmF0Y2gNCj4g
ZmllbGQsIGJ1dCB0aGUgY3VycmVudCBhcHByb2FjaCBvZiB0cmFja2luZyB0aGUgbnVtYmVyIG9m
ICJwcmVtYXBwZWQiDQo+IHBhZ2VzIGVmZmVjdGl2ZWx5IGRvZXMgdGhlIHNhbWUuICBBbmQgdGhl
ICJwcmVtYXBwZWQiIGNvdW50ZXIgaXMgbXVjaCBtb3JlDQo+IGRhbmdlcm91cywgYXMgaXQgZG9l
c24ndCBoYXZlIGEgc2luZ3VsYXIgbG9jayB0byBwcm90ZWN0IGl0cyB1c2FnZSwgc2luY2UNCj4g
bnJfcHJlbWFwcGVkIGNhbiBiZSBtb2RpZmllZCBhcyBzb29uIGFzIG1tdV9sb2NrIGlzIGRyb3Bw
ZWQsIGF0IGxlYXN0IGluDQo+IHRoZW9yeS4gIEkuZS4gbnJfcHJlbWFwcGVkIGlzIGd1YXJkZWQg
Ynkgc2xvdHNfbG9jaywgYnV0IG9ubHkgZm9yICJoYXBweSINCj4gcGF0aHMuDQo+IA0KPiBOb3Rl
LCB0aGlzIGFwcHJvYWNoIHdhcyB1c2VkL3RyaWVkIGF0IHZhcmlvdXMgcG9pbnRzIGluIFREWCBk
ZXZlbG9wbWVudCwNCj4gYnV0IHdhcyB1bHRpbWF0ZWx5IGRpc2NhcmRlZCBkdWUgdG8gYSBkZXNp
cmUgdG8gYXZvaWQgc3Rhc2hpbmcgdGVtcG9yYXJ5DQo+IHN0YXRlIGluIGt2bV90ZHguICBCdXQg
YXMgYWJvdmUsIEtWTSBlbmRlZCB1cCB3aXRoIHN1Y2ggc3RhdGUgYW55d2F5cywNCj4gYW5kIGZ1
bGx5IGNvbW1pdHRpbmcgdG8gdXNpbmcgdGVtcG9yYXJ5IHN0YXRlIHByb3ZpZGVzIGJldHRlciBh
Y2Nlc3MNCj4gcnVsZXMgKDEwMCUgZ3VhcmRlZCBieSBzbG90c19sb2NrKSwgYW5kIG1ha2VzIHNl
dmVyYWwgZWRnZSBjYXNlcyBmbGF0IG91dA0KPiBpbXBvc3NpYmxlLg0KPiANCj4gTm90ZSAjMiwg
Y29udGludWUgdG8gZXh0ZW5kIHRoZSBtZWFzdXJlbWVudCBvdXRzaWRlIG9mIG1tdV9sb2NrLCBh
cyBpdCdzDQo+IGEgc2xvdyBvcGVyYXRpb24gKHR5cGljYWxseSAxNiBTRUFNQ0FMTHMgcGVyIHBh
Z2Ugd2hvc2UgZGF0YSBpcyBpbmNsdWRlZA0KPiBpbiB0aGUgbWVhc3VyZW1lbnQpLCBhbmQgZG9l
c24ndCAqbmVlZCogdG8gYmUgZG9uZSB1bmRlciBtbXVfbG9jaywgZS5nLg0KPiBmb3IgY29uc2lz
dGVuY3kgcHVycG9zZXMuICBIb3dldmVyLCBNUi5FWFRFTkQgaXNuJ3QgX3RoYXRfIHNsb3csIGUu
Zy4NCj4gfjFtcyBsYXRlbmN5IHRvIG1lYXN1cmUgYSBmdWxsIHBhZ2UsIHNvIGlmIGl0IG5lZWRz
IHRvIGJlIGRvbmUgdW5kZXINCj4gbW11X2xvY2sgaW4gdGhlIGZ1dHVyZSwgZS5nLiBiZWNhdXNl
IEtWTSBnYWlucyBhIGZsb3cgdGhhdCBjYW4gcmVtb3ZlDQo+IFMtRVBUIGVudHJpZXMgdXJpbmcg
S1ZNX1REWF9JTklUX01FTV9SRUdJT04sIHRoZW4gZXh0ZW5kaW5nIHRoZQ0KCQleDQoJCWR1cmlu
Zw0KDQo+IG1lYXN1cmVtZW50IGNhbiBhbHNvIGJlIG1vdmVkIGludG8gdGhlIFMtRVBUIG1hcHBp
bmcgcGF0aCAoYWdhaW4sIG9ubHkgaWYNCj4gYWJzb2x1dGVseSBuZWNlc3NhcnkpLiAgUC5TLiBf
SWZfIE1SLkVYVEVORCBpcyBtb3ZlZCBpbnRvIHRoZSBTLUVQVCBwYXRoLA0KPiB0YWtlIGNhcmUg
bm90IHRvIHJldHVybiBhbiBlcnJvciB1cCB0aGUgc3RhY2sgaWYgVERIX01SX0VYVEVORCBmYWls
cywgYXMNCj4gcmVtb3ZpbmcgdGhlIE0tRVBUIGVudHJ5IGJ1dCBub3QgdGhlIFMtRVBUIGVudHJ5
IHdvdWxkIHJlc3VsdCBpbg0KPiBpbmNvbnNpc3RlbnQgc3RhdGUhDQo+IA0KPiBSZXZpZXdlZC1i
eTogUmljayBFZGdlY29tYmUgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

