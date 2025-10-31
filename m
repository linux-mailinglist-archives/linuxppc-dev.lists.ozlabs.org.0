Return-Path: <linuxppc-dev+bounces-13647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD87C2657E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 18:29:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cynym4bDjz2xxS;
	Sat,  1 Nov 2025 04:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761931744;
	cv=pass; b=MKo7gNHqqbPX05g0LNrHCszJ+DS6OyGn6vPNfU7C4YyjJFfOo4XM8hQ1+QT302SaWbG8FEDbkbD4LRLk4y1KVXdIwBrJu+mP7HWyjx0U+UmwLnf/79uQZWpMgjzEdaMNfaUWY7vv6s+9niog2slZ2rslJrr3x1VhK+kUGo3qc+TO5TojYChHSdlxXsASQqGZry4eTjaAJDJoUKPGjC4KWNkgSXwWFXup/NUkcTqGXwCbUP/LW4GtYbtF4nQVYFYn/IW2P2bAjkP1afMbkkBlG757ZAp0ff4TdZWmfvfgj0oOyypufRdkNDoGxEvT/lZNukBrhGutaC04u5xrxPKaEw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761931744; c=relaxed/relaxed;
	bh=DIKTLrPc5oDAtRbGDqtkEfINxLpjUEomKqaIif1WE8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Olp/W+mB0lGt9JmDMKwhvKXfHIwYqcEHaORgDvhMUgCXXiLvAEKoqMl6L0i7ukh14lc+nG+clIH4WNu52W+rrFTe2yoYNcJJ/fdZgNV12rRVwJSQmWn145ZenxBH0GlZ37SrVYmYcjXd9DuAMNJr2eQiB1gJezvEbMYyp0Y8Ph8AwtHESxY4cthANDuyxcOsyO/3wjY+2MG015S6GMoXDLtOpDY24hNAnTBszPfGtyPSxYxueIbSJi1Ze21RJ6f6rOpGsfZ6xqmLIWCVhzuVYrnVBhVENeFp1oV1duSXawx6sQUOCiV8BL2DlL8udnlVuE1Kt+9+wKXCRDMThhZoNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKyv4ih8; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKyv4ih8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cynyj6nDkz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 04:28:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761931742; x=1793467742;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DIKTLrPc5oDAtRbGDqtkEfINxLpjUEomKqaIif1WE8g=;
  b=cKyv4ih8VQ3sdbOq6d2S1ULkZuliuT4oWPBYeBBK7YiFI5bxjMSCwXnV
   FMK/cH2bAHcIPQ2DkMCaLQ1yfc4zcNjj6KztyxDS2t4V0x4bGSbiaXLaV
   NF2rrVmjH7RSa/U/QM/4pmtW2wMH8YUdkEO8fTwi4TwdLFtTp5bOaSmEb
   4VPZYlMLNovdQKju2cig4mMXLbqUKzmRSLZQO1FMGhznIYlAw3Q2gn4UI
   BEp+J4FOIMrSB3nXpaNonVJdJS7x/UEI8gKD6R1RveEPiYUo4yZHcQAKM
   //oveUFMJ7exfihOmSvr7Tj0wmVQdnTfKNjgouO/ow0D2glMoZKpscKrt
   g==;
X-CSE-ConnectionGUID: iez80NEtR9GwJVx8yVlHIQ==
X-CSE-MsgGUID: el48873+Q5u9C8LBupZedw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63795175"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="63795175"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:28:57 -0700
X-CSE-ConnectionGUID: hW1+MEkTQcicZE/SM89jVw==
X-CSE-MsgGUID: XGoRjQwCTvq+UyI/vAAASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186742805"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 10:28:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:28:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 10:28:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.43)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 10:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/CvXoxYTiVCXNxTPoOpfBAL/TlRAHj291Obh/u7hG/YNk0exQ/fFw6k/KjJtgyKgwbzUy1UyGS4RN/KMMbUJT0dulCrlpQAqB/gm2FW2NXfTemlPxR1w0hA2g0aJTRV7e7nt6bjQ7cHQk2rU/2swNbKmHY4yHaAeNjERNIHzkpHDaJzZBtm5FLzXvBe+2GZaW9s73gAt/juEBzztX5aU8wm/RZV0uVWgUziZiLW71ytXFcM2ZkFUKWZJSIImcp04yTvKxChA4D0+docACBzZ55Zu5ik1EfbHQ3bXf3MUaDxCQHOTcyOWBmuAyI564MogE6Gw7bDiqiXn9w3eOw7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIKTLrPc5oDAtRbGDqtkEfINxLpjUEomKqaIif1WE8g=;
 b=jvCUCbWEYESw4PTuHkMPcRiJyxr+dntZ+n47UZPqf+GPt6kjJIP9Hl8OjZTb89b2TP1rQWfi669axPDwAq/LKREVqLEmBQmc8QcJvMtnegoWUxaemXQPZ41o0uxg+IBqqDDJ6Vl4H+hljNADXKU4rEzaQ4WY5jQGTf0rspoW4zQtZoru1N4uuS+zLsp57n671cx0/Vrub83tRiwbiRxKc+ZkJqGt4Z5GbpWx4h9wUTx9ZdNUJeaVNjZ8+qxZo7fztmISrZMH2ayyMJ8LUI4eFl+AV3cMIiQBe/G43YgYlIX4rDrvYpMDc1+E+MaHu2HyLIky+Q0zFRsrdeD9hqzwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 17:28:52 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 17:28:52 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
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
	<linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan
 Y" <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Weiny, Ira"
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "Annapurve,
 Vishal" <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
Thread-Topic: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
Thread-Index: AQHcSdkzrKWzyg8VC0q4XOBdgAv7FrTcg/KA
Date: Fri, 31 Oct 2025 17:28:52 +0000
Message-ID: <725c68f2607ad2d4f742fd749ea517a98d669384.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CO1PR11MB4788:EE_
x-ms-office365-filtering-correlation-id: 4d87b731-45c4-4397-6a20-08de18a2f61d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ek0zSnN4a29NdmhqNXZpNEVXcytHY3BmdDJnRWV5eWMwK2RSUFBuUkhxWGVs?=
 =?utf-8?B?S1Q2Vk11ZzZTSEdQcVcrbUt5RldaQUZ5Nk5TTE1qZVdnWXZwM1JSWW5RRXJx?=
 =?utf-8?B?UDVUejNvRFlEMTRPWDk3S0NkR1dWNllFNWJMNmtQVXNCS0pCUzJuY1VGL1FQ?=
 =?utf-8?B?RHMwSkp6YUNYUGZEVit3amZndnNoc2ljRGd3M0hxWCtTVUNSdTkySWJmckN1?=
 =?utf-8?B?aWVsSzQ0d291VjdYRmhJN3ViWjhQRWF5cStKNThjYjMzaFRjYXdQS09KOTdU?=
 =?utf-8?B?blpjazQwdXhXR05SNFJTRzlWNEtDTXJyQnVwZkNWaXovbkhIYVlYVkQ2Tyt3?=
 =?utf-8?B?UGFnMy8wVWhEUURDTGpPa044NFZuWTdTUkZHbThIM0plVlFFQTA5dXpHYTRm?=
 =?utf-8?B?dE96eEFlMXdPUmdSNUNxY2xqVUY0Sy9yRnp6WWtFWnA2VjNJWVNCbkJNaWVI?=
 =?utf-8?B?Y1o1TUNXZEtMeUdxaTZ3U09qS2RPMUxZS0lmT2dTRTFlRU1ycWFjYUo5a3Ir?=
 =?utf-8?B?bFMxQkQ0OGJ1cG1WRWxjYlF0dUNiRFRrbDJxOXJHUUtYM2h1RGk0RFJsN2wy?=
 =?utf-8?B?elNGNlVoWEdLTjY5NldnTVJxYlB6NnRtT0k0bElCbTk2Um42bzZUZzZUZU5s?=
 =?utf-8?B?ZVlFeWhrOWl2bmt4TW1HZVpnTkVmYlZld0xzOWZHSmFsenBNdlI1NnNnaVlQ?=
 =?utf-8?B?ejFsZ2I5N2RYRCtSdWN2ZHhacHRIdDJ4TFVXYjlNUFhqK1h4SkV3Tm1Eekp6?=
 =?utf-8?B?K1Z0NXdMM2hxZEhocEVVOE1sbTcrWlhqMDcwSFJwbTZUQnk2VGpGcC9Paysw?=
 =?utf-8?B?UFFqMVQyNmhTSktrS1BDNUY1aTVWRVgxR1ZJSDBvL3BvVjdlRTlkK0tsQXBY?=
 =?utf-8?B?MUJRNHRtdEZUOCs0RFJoeUNRanhUYk16VExKL2poNWp3eDViNVZxdFJHQXBT?=
 =?utf-8?B?YlhsSGhySXllN3dSUExMaWNxWkhPSGhUNXV5MG03VFZmb0NycHlWQ29RMkFr?=
 =?utf-8?B?ZGJiN2dSOWgrckpRRGEvNk1sbHJlazhKVjM4OG4xSjFXVjJ4ZENTTFRidVhF?=
 =?utf-8?B?YnkzdGgyeTRyTGhWR01jY2k5S2hsMHNVOU9BQS9hdkkwa0tpamJQZmp2bCtP?=
 =?utf-8?B?bzFRa2g1bzBKaUhLR3RuOWVJUHFxblhiN2dKZmxKNmNyalQ2U3NRY0pwZEZB?=
 =?utf-8?B?TUtxbDc2K0Vsb0QxYzRPbnk1ZzhQTWRpR080Q0w1RDFndE41dFQwWlYvVXox?=
 =?utf-8?B?WGZCTjBMWjduditPa0FIRUlwb0pHYkl5NnMvYk1uOTRjcHNCNTMvS0ZWeXYv?=
 =?utf-8?B?U3g2SkRTdEVzY01ETHBkd09OYUxzYk82SEpjcTlxOHh6V2kyYnIxMGdXSTBY?=
 =?utf-8?B?Wmp6ZW94U2JmZmxCelJKSUhlNU16d0VWbkIwLzg3Si9sak1HYlo5VVZRYUUr?=
 =?utf-8?B?anRMSGRYSUthd0ZkUzZHTGpScU5TRHVyb2lheXJqSmU2MXk0dmxHSjRHZW9n?=
 =?utf-8?B?ZFFmK1dHaTF3bTdwNEdSYjRoUHJCYVp5M2UxcWU3RUJvMHRuMmdoeDBiZms3?=
 =?utf-8?B?c2cwaVdvcjF1ZlI3ZkkycGxscDAvN3FTY2NtT09sV0h4QU5BUEtNWHpVSmN0?=
 =?utf-8?B?NDBUTTErY2Q2NHhxODlCbGtUQVBkY0x4NzkySkxrd0hQMFJkQTZQM245YUZF?=
 =?utf-8?B?NFpMcVF6c3l2SU9WOFEzUFBWUE1sNjdZNHJtOEwwd0FoQTE4L1oyRnZCcHph?=
 =?utf-8?B?K0Z5dWdISHNza0w1ZklyVjB6VzFTdnJ6SzVxZXdDbWxINXV0dVhLYzk0UEhC?=
 =?utf-8?B?K1JxRXJnZlA4Z3ZlTzFvdUVBVXh5WUJYZGRGbTdybmtIejRQaTB6b2pBQ1A0?=
 =?utf-8?B?UTNqNVpiZm9zY1FhenljK3RZaUd3QTlFQS9QMHBmK0VDWEFueG9CWitvNDg3?=
 =?utf-8?B?aWtHTFFpY2NEWkhBaWNRYVhGZ3daRHhVSnM0Y2xqSHVmVTZEQjJnZVUrc3ZH?=
 =?utf-8?B?eTc2KzhqRURBaWpoNnhnSXZxdjdUWmx3OXh3WWJPNUgzVTI3NXYxU0NlTlB2?=
 =?utf-8?B?Zk1yeE9wdnMyU09JZUJrOUZnOCtTN0FteXE2Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG5zSXlubHlXZC9wOTE4SFJqc3Y2a2V2V2ZVbDQ4MTcyU01Vd2pFV2h3dTNT?=
 =?utf-8?B?ajVMeWRNMnNJTGpOa3V0V3ZBR2FKTEErWHVTV0I5QU9uL3FpMjZrU253ZkhY?=
 =?utf-8?B?NkZGYUN3UFRoWURPVkI2OVBJaWVuZldiWUZ5a2VxV2FtaDlCa0RuSFJsdkor?=
 =?utf-8?B?YTk3dXhMVUNHRS9GVDRhUnM5TTUwVm5kV1hLTmsrc1M4Mm1oNE5UNmRISGZI?=
 =?utf-8?B?MXYyL2VDNGtCWjgzUzRrWnNwSE5PaGN4eGpXVTNnTUsvR2t4UEU2bDI3QzRw?=
 =?utf-8?B?b1VZVDQ0bnNhQkg3SmRNQkZ4WXUrNTR5WkJrLzNOaHFFNjBqdTdFaVdXbTMx?=
 =?utf-8?B?d1hGcW1DLzdwRG9kYklGSnhsbHQyUHp2SFcwVSt3TGRkcWR6MGczbFMxNlZt?=
 =?utf-8?B?SnBzMm9OekhNbTh4SVpOalN1ZUdKSmh3bTRFSExjOGhFYytlaTJwMVUzdVVN?=
 =?utf-8?B?VmlnbU50eUhiZmQ5OGtSaFBsSVBLdnB3UnJ2MGRzdEx1bHp5UDVkeEV3MHJ4?=
 =?utf-8?B?M1A2c2Z3YThhT2oxZU5HeVJUNGlsdjFJNytwbnpnZ082Q0NSdGtZdlhZcG43?=
 =?utf-8?B?T3NBUC9ZMys1ZGNlaStla2hBT2ZNTWxCdDI2VXNIV2dyTGpyTXJ1QUpDWC8v?=
 =?utf-8?B?ODU3RkY3YVpFb2dXb1NHemtXZVBpREE3M0N3dnIvZTloallBSzhqNEErU0xv?=
 =?utf-8?B?eGZaaTBVaTZiTXlNRytWS0Vhc3pSeFBWL1BsbCt0dHN1cDhFL1FGMVI1QU9z?=
 =?utf-8?B?YkNkOTBXNHh6RWZkSlh1NFFPNUkwWmtrdW1qQ2d0ZENCZXBvelE3QUtFSHVE?=
 =?utf-8?B?Q2ZXSXFvRHZSby95RXZiUFlYd25ybzY1QXkyYk16ak5TK1luQVFrOTR6NEd0?=
 =?utf-8?B?NE16TlpnTklIYUwzSkxTdmxsdi9nb0V6UjZ0N0dCQlZISkZmQmRFZy83cmY4?=
 =?utf-8?B?VWRHSXIvZGFTOG5xZlBNWm0wRlFIM2daUnJQMnF6bWZubm8ydEZsa0VwcEt4?=
 =?utf-8?B?T083cUtzVXk4Vm5wUWw2UGRka0RWNyt6eVFEUUFENTE2blQxWFF5SDdHRlU1?=
 =?utf-8?B?dm55eGhUMWRZTy9kK3Uwa000ZG5JS0FrVlZodk8rMVl0UFU2WW1TS0s1ZStH?=
 =?utf-8?B?TlpRUEtrVVpBQ1BvUmZoRzdQUEFxM2xHSXNKNTBScmV3c2NWd2hhUUhaR05E?=
 =?utf-8?B?cDA3dE9MQlJZZUtkZ1R2M0VIMnIxV1llWkltaVhiZmt4aGZzNEJTa3REMUNr?=
 =?utf-8?B?Ym52SkFlWGluMXFQN0s5OEFLNjUyVFVYWEVVcUNHSFlwNUV1dDV6OXF4dlZB?=
 =?utf-8?B?SUl6WUNoeXFtK0FsYjg3ckhqc0J2K3BBdXZGUHcwbXFvcUgzTlNZQUdRYldT?=
 =?utf-8?B?aFlsKzZsUUhKZnRQTG4vZFZjWjZRUGVSVklBcVBxV3JkaUFoa3FTWDZSd1F3?=
 =?utf-8?B?R0pzbXFtMmo5NnFuQnpnQy9OSGx0MVYwalUzMzltaklRVkRkNVZ5TXV2eTNa?=
 =?utf-8?B?b2pGM0FuakJnZWFnc29xY1BTNDhQb0QvU0hqV0RmdEN5dVdzK1JqUUN6OUwv?=
 =?utf-8?B?OUJkK2E4ZWpZWjAvZ3RrOEU1T1M0aFlUODdsZ1pVRlhIWXpldTkxR0hrbnZu?=
 =?utf-8?B?QmFTd2JScklhY0k4K2VadDlIbnQ5MzZYZ09CYmE2L3BsQ1hTanBnMThwRTY3?=
 =?utf-8?B?MmY2bUdNMnNkbVNDeDRuYW9nZG01d2xYZ3JmWVluajRjVVhINFVxdUEwbmxF?=
 =?utf-8?B?N3IvaGZDOU91SG5aRW5qQmh3b1FKYThWVDQwZ25FWjdNeDdaVTJrREdWMEJM?=
 =?utf-8?B?bGZ1ekFNZ094dW8rTmJHRGh4SmxsSVc5UGlTR3kzUllWcU4rVGNWZUxrZmJU?=
 =?utf-8?B?Tmp4VnlxZWY0Y3RvQ1MwRUhORlREeDB1cDRYSmtuYUdhd2kwNllpUWZtRHgv?=
 =?utf-8?B?cHg3S2FYVlV1Tkx4WGc2WUYzQ0ROYjFiSDh0SmRGc091RjVFQUJhTEw2TmZ5?=
 =?utf-8?B?bk52NHFDR1AybmNsTFpVVXdMNFpqWmdoaTlnZGtMWjg5MHNDRUlXajZyYXlM?=
 =?utf-8?B?OGFDZzJWWkVvNWF0ZUlOTkhFcXZ6WW1DQUUvRHF5YnNQbS9vZVBqNG1kUktu?=
 =?utf-8?B?K1RIT1pFRGJPYjFHd3NKSFBmSXlTeGJCRVFhclp2aU5GUTlSMEVEUEVKNkNP?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA9F5F94ECE2F479F7FAC958D999B09@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d87b731-45c4-4397-6a20-08de18a2f61d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 17:28:52.5862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDIWTFvc17xjPdDgdiv9ZMX1WufGDdla+vrrxw9PitOQJa0VlavLqLzghzNLmGz9Nd1twxTBWJ/3JOU2GWcSQ46O0aygDHqjkxfZ0dNIQxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiB2NDoNCj4gwqAtIENvbGxlY3QgcmV2aWV3cy9hY2tzLg0KPiDCoC0gQWRkIGEgbG9j
a2RlcCBhc3NlcnRpb24gaW4ga3ZtX3RkcF9tbXVfbWFwX3ByaXZhdGVfcGZuKCkuIFtZYW5dDQo+
IMKgLSBXcmFwIGt2bV90ZHBfbW11X21hcF9wcml2YXRlX3BmbigpIHdpdGggQ09ORklHX0tWTV9H
VUVTVF9NRU1GRD15LiBbdGVzdCBib3RdDQo+IMKgLSBJbXByb3ZlIChvciBhZGQpIGNvbW1lbnRz
LiBbS2FpLCBhbmQgcHJvYmFibHkgb3RoZXJzXQ0KPiDCoC0gcy9zcHRlL21pcnJvcl9zcHRlIHRv
IG1ha2UgaXQgY2xlYXIgd2hhdCdzIGJlaW5nIHBhc3NlZCBpbg0KPiDCoC0gVXBkYXRlIHNldF9l
eHRlcm5hbF9zcHRlKCkgdG8gdGFrZSBAbWlycm9yX3NwdGUgYXMgd2VsbC4gW1lhbl0NCj4gwqAt
IE1vdmUgdGhlIEtWTV9CVUdfT04oKSBvbiB0ZGhfbXJfZXh0ZW5kKCkgZmFpbHVyZSB0byB0aGUg
ZW5kLiBbUmlja10NCj4gwqAtIFRha2UgImFsbCIgdGhlIGxvY2tzIGluIHRkeF92bV9pb2N0bCgp
LiBbS2FpXQ0KPiDCoC0gV0FSTiBpZiBLVk0gYXR0ZW1wdHMgdG8gbWFwIFNQVEVzIGludG8gYW4g
aW52YWxpZCByb290LiBbWWFuXQ0KPiDCoC0gVXNlIHRkeF9mbHVzaF92cF9vbl9jcHUoKSBpbnN0
ZWFkIG9mIHRkeF9kaXNhc3NvY2lhdGVfdnAoKSB3aGVuIGZyZWVpbmcNCj4gwqDCoCBhIHZDUFUg
aW4gVkNQVV9URF9TVEFURV9VTklOSVRJQUxJWkVEIHN0YXRlLiBbWWFuXQ0KDQpEbyB5b3Ugd2Fu
dCBzb21lb25lIHRvIGZvbGxvdyB1cCB3aXRoIGEgdjIgb2YgdGhpcyBhZnRlciB0aGUgc2VyaWVz
IGxhbmRzPyAod2l0aA0KQmluYmluJ3MgdmVyYmlhZ2UgY29tbWVudHMgaW5jb3Jwb3JhdGVkKQ0K
DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyNTEwMjgwMDI4MjQuMTQ3MDkzOS0xLXJp
Y2sucC5lZGdlY29tYmVAaW50ZWwuY29tLyN0DQoNCg==

