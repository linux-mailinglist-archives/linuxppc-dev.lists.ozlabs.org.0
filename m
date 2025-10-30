Return-Path: <linuxppc-dev+bounces-13616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AA8C22A70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 00:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyKYG2VBlz302b;
	Fri, 31 Oct 2025 10:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.8 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761865730;
	cv=pass; b=ZbqTdHEawWXMEMSsgJDgwDZAdpDPiqUK5Aztx6vP4ybueBwqjBmp32koraBbLj1lKd7hh2GSXSR9sfd91P3EKfqIq1iHQml5l69l4Y3LChaPf/A4UPKoRzO/dOv4SK2O5yA9CQjy4gbrp6JulaEXLIP2i2O0Ujfo4NS9VsSFe/Y3gQmJgojO3YN526RgIa7wyTm6rW6YEQbRh5mNxIzQue6szyjO5lFFhb9ezyEgUfRvNG205Q1LpHtrXeNYEi0gm5J8lWuyPoLpcvnT+fnuHboU0Ai+Cn/zm9NGg1EXLGu4ixxo60Y8gRtJX3PaJNGoZGQNUUCmXRH2ekZfBmBUKw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761865730; c=relaxed/relaxed;
	bh=l3l9YUYtc6bF3vc/ccbholXOr8DU3FSgny/zLV3cRXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iBXYPEnR2TQ7ubFU+hRWc9iPDNHTwGSyuaFL+xcuN5BSmo2uiif+FVGVahzOb0t+7CGDoydExlxdmOfdNi0xFCr2rymqaKPPM6fPA+UiQHz3KYxWnlP4Ed7xPWGR+Ir7URG8v/C4v51RE5f7/WqJr4P99KnGhBtPoSk5Jkxy70QPyAsu+SVqmGJY0EV6FFmL/iRcsWf0NdkYQ1LfhVZWIMWhYhn3iP14r7Bn4MBCNCuBnH5KkSfYmsVajjfwImFW/ydGzeEPgWelfJhU1JUwoaGW3OZe6J/PzGzvGgup8qHqxv212Ll+eH56Uvwu9Hbaxr3HI8P+9DWoPSixvRM6Bg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oH21LDf1; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oH21LDf1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyKYD0vCMz2xR3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:08:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865728; x=1793401728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l3l9YUYtc6bF3vc/ccbholXOr8DU3FSgny/zLV3cRXQ=;
  b=oH21LDf1dQe8Wl5W83tTsh+TwK+Gc5RGY/qUbC7GsEniqGvSmpFsC5TL
   GppqKfasInnh+RCpcvvewBCwB4AfsTXc029o3znI7VEAlt3E6ESAiPXji
   5LXQoweQXmRz0fNW8dBFDGQJOi+bX4bSvEwZF7wKrcslROkFqfASYQKrs
   79hrldyzhVjJjAZ7R8z+M0MmPOfmJWrx0Ro1Uc5k+hTpR86DrJq8Jlf2A
   3GvNWU5sO/TJLjjO6UWa7/i3bhwO8ohyt6/zSSLV9nnOMoxTnbRIR2rJJ
   vwpz7ukxVcq8j6DYleXWlgwkO2nAosZwTFKnFjfnny9LaEPN8W6fL9/zf
   w==;
X-CSE-ConnectionGUID: IR8LeDxmTP67ls7bnlRoyw==
X-CSE-MsgGUID: L+7hmnf4Tt6SBLZuZVQBxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81649997"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="81649997"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:08:46 -0700
X-CSE-ConnectionGUID: vbF17fZaQrKdd88tjCP+xg==
X-CSE-MsgGUID: 6+fWtB12R2CItRFLOA41eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="209649318"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:08:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:08:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:08:21 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3pm5wpjFekRvEvcyntDs/hRdqKuPHVmt8/PsImuyADUkYGKn4BzyZFXoh2vDPpH1CN17b6+YUEjwDNls1gvWwhCPMOE+JrDPP8Ob93M2zvnv44pXLHjw/hnSRSuCW/0WTx2yWSwAc2jIezXYKryVxQuLbuGAqRBrLrJ8a1Ym12rkxxAzhqvSJRKMKtHqdrcwfqztfJf7odtg8oF5bFAfI8IQQ7DSFLpkQW2pVv7EF7uN4psTYrCK2b3ibtXup/9hgsIcLf33JpQ6lLNn00HOFy5tUPED3h6v3NsuDqlxvJxVl60nz3ApviJDD7usbYFjZimNJAPnQMLhmLzzD0uEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3l9YUYtc6bF3vc/ccbholXOr8DU3FSgny/zLV3cRXQ=;
 b=dxusvpBTTCBcbgWiU5pVYEXh7PS8/duXacqCfMNfJLCfJ4q13vQ4d2tcPglD/8ZiNAg17mCwtqePIygHvUrnAlP4kv6ucKEiUl/wgxv3HdJscOkogqPKz/fPsTYycXjy9xgwL3g5lYwN0WdNFyi7LQJxMMECh49vDidb24OGMZiiH+ZJWENpE9sWVSt7pGkfi7nqyi2hRwcWGIGzqOVR/wlfttIU7HpX5So8BkoUs2gErW1cGO6XG2LnYkRa/15J+CpUNghZa8zM1DTrv1GfmPYTOLiHvYVqpiR988z2+fYZzmvcGAlMXAc1s64yzfsrHh9+a5GQjGA2dm5T+RNZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:08:18 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:08:17 +0000
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
	"michael.roth@amd.com" <michael.roth@amd.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Topic: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Thread-Index: AQHcSdlYf3tncJbEZEOzmGQKtjRSS7TbUHAA
Date: Thu, 30 Oct 2025 23:08:17 +0000
Message-ID: <403176431c931bdb4c7909565ed7b25eaaa80b10.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-27-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-27-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS0PR11MB7484:EE_
x-ms-office365-filtering-correlation-id: ce0c648d-f741-413a-e199-08de18093623
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?UVNCU1F5dXh0ZFdXZXJNdDQyV2pSd1E0MDlqaEQySG85MDNnV3Q1d3RjdDY2?=
 =?utf-8?B?NlkwUGVscW12REE1TllKdS91c2NhYWk0WkJyU053WHVIWmdKOGZHaEdYMVZV?=
 =?utf-8?B?SGFkSVJvQUxYWEpnZnBaUGpLL0VLZHVkUzYvMXl0Y2dOVTJNL3RablFkVUFH?=
 =?utf-8?B?NkQ5MDBZTmJZWkZPV2hqL04xQnRrU2ZQUXdKSFEzYkVueHJabTBJZDdrR3J6?=
 =?utf-8?B?SWsxbHBkeEFnOTBaTVhReDVkVlg4d29jNHpYc1dNRFJoUFRPT0tYREFyVDFZ?=
 =?utf-8?B?OFRSTGRYQlZCbldvZFRHbmx5MW9MU1dKcWNyWEFuUWdhNFdsSEo3cEhkdm9I?=
 =?utf-8?B?UGFZdDk4b3dpZDQ1eEoybmNyQTNlaWRRbk9xZTVaQmszeWhOTVJ6dS9iZ2Yv?=
 =?utf-8?B?ZFFRQ1d4bHZJdDY1eEo0ZldkNnVhVEdtMWUyV2gwZEIzdXdxRFY3T0dxZklO?=
 =?utf-8?B?ZEhxM20ybjN5MXRaZE9zdFNyL2tRQVZkMUdpT2kvUFJ3ZnhFczRVRVl4YTNH?=
 =?utf-8?B?Z0RZcTBPblpJcExsaVVGcDRCWmVHQWdvMGVVclJkVWFISC9rV05qMTI2VVpz?=
 =?utf-8?B?bkdjWFNiUjZqbDY0ZFplT2JLazlaaHo2SzNlU203dEpwbWxHR1hDS3NSd2dp?=
 =?utf-8?B?MlNUUkwyQmc4WUVMOGRQZXB0R0c2bWlrYW5QUUZIY2VaZDJ6TUU3ZWsybzBm?=
 =?utf-8?B?RS96eS84VDQ2M3ZocFV1bXl1NWEzWTY3MFhrNEhDM2lpdGZxdDlGem5lNlJq?=
 =?utf-8?B?a2p4RlNPbDNvQmJEZys2WVRqVE5UNTdjeEJjdjg4UmgxVXZmQXBRUnpqY2Qz?=
 =?utf-8?B?MGVUVjRnTTY1NEpxbGJUTXRCQ1JaOXVPY1h0bnZ5bHgxNjRQY2s4ckxrNFBX?=
 =?utf-8?B?dDhNVWpuUVllWVlwMmVLbkNJZFJRaURQSG5uQ2FHZ1FSbTlzYmM0ODljZzFr?=
 =?utf-8?B?MmtuS0J5dmE1U0oxZGhWRFliMFp5WENBKzR5WWNCSUZuZG5PWjVhck9rSjF3?=
 =?utf-8?B?SERzMGQ2MXNYdktGTGhYdnp5V3VFTkxGOVZHdmh2c1ExbnB1bk1pL1VIYzBq?=
 =?utf-8?B?TU1BY2haclptVTFlMGpuZ2NjZkU4SjNvYnJEYzFCU3pwRzgzY1U3OElyYWt5?=
 =?utf-8?B?SjRucFdYS3JmOGdoR3BSM1daZDlxbzZhZTdLWE9hMEdtZTlDTkhuMlpyOEpw?=
 =?utf-8?B?UzlpMG40UGFzR3MzNUZlNndxQXhZSFNNTmJVbmJlclN6YUtZNUFjU1NMMDdP?=
 =?utf-8?B?QWxFUTBFaG04M2lNZnlFV0FBbjNKOTN5WXNMNWxCWWppbUpmdm80cWdSb3lp?=
 =?utf-8?B?OVVZcFZKUFZvSWk0S3dlWitiMlllVmhGQ2Z5c0pMSzlKeitnNTNVandoc0ZQ?=
 =?utf-8?B?MFNKOENOOW5EeTNPUVg2eCtLQWU2ekRLdHFyVE5HVkN4UzRXaFo0aG10dWM5?=
 =?utf-8?B?cncyeE9iVXhjRjRzUnB6UWFpRFc2WWJxVktVZU5xYmdacDNCK010YlhTa0ZE?=
 =?utf-8?B?bWQva2tiTVVweG5ocFp1UVJxdEZ5UEhMZEp3WnNjdC9aRGxUdUZ5UG9ERE5X?=
 =?utf-8?B?THFYZnc2ZXQ3akpVRk4wSDM4YzkrTndvT1M1L2pKcGdTLzdNTkhrV2hrZ1pZ?=
 =?utf-8?B?UGlvdWRVS2NCUkxlMVFmTmk5M29RdldDUXlOdDhGK0ZRZnJNMDU5MnMvQVEz?=
 =?utf-8?B?azBwQVJNNS8ycTl1WXgrcnhXSTB0b2lpRU5FTENZZVUwY3JVMThBWE9Ra2w5?=
 =?utf-8?B?Qm5kazVmRFp2L0NOTndGV08vSklobnVBM3ZZNWVQK0tVM1U1MXZUVHU2dFJO?=
 =?utf-8?B?QTJtZ3MxRWdCUy9ETWJyaERhVlNYa3p5SzRTdTlkYkVreEgybll1R0hXZkhM?=
 =?utf-8?B?eXdBMzMvVEdIY1NZNC91UVRpckpzZGNtNTJ4TXNSWjZRakFsRXBTNDdzelc0?=
 =?utf-8?B?UUNWVG1USmljNlVBbnJSdktxaGJ0QUxueVp2NWhIU211aFFiTDF6SWFWVnNM?=
 =?utf-8?B?QnhOMyt1RWZ6bXMwOHpvRS9ncy9ZTVBneFhqMSswSVAwRWhIbXV1SG9aTExm?=
 =?utf-8?B?MjB3QXhJTFNBdmIrSktWNUkvcThwellBeGJKMW1hUmhqYW1FbndhOHlWWDI5?=
 =?utf-8?Q?Uxlw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0huOFJJaGplOFh0MWpYOFJxNEoyWXdBdlpycmtqUDdmNkRKMURBRldCYkpU?=
 =?utf-8?B?Z2pVZUcxdXBUMEhKVkw5ZTA5R1MxZThJUUozRHBVTzkvZEhuYTBMWE13SDVG?=
 =?utf-8?B?cnl5dDRMQkNTVjZzN3JBS1lWMjQ0L3phVXZOcGFJdmNZZVBxLzdzb3Vqci9D?=
 =?utf-8?B?WTVLOE9ST28veG1Dd3pYWHhiYXp0Qld6b1psUDRjZ1R6eW9BRnJHYkRaNkdZ?=
 =?utf-8?B?T1ZPZURNMjNYUDMwRUozOE41aUtXdGZMRXpYbG91UkwrOWIrcHI0ZlpHdWx3?=
 =?utf-8?B?a3M4OFM3Z3RRdmwzQkIrNVRSYUR3clYyclR1RkNOWDA5OXEwaklFekFVUGJm?=
 =?utf-8?B?MWFuMUFJMWZqZXAxQVlnUU1Tam9GcVJDMkJ1TXFYQUNrNzVqdGlET3pPRER4?=
 =?utf-8?B?NG9rZmk3anpiYk5BTkljeVczaXRLbnBVTHJ5dmw1VStFNXpKeHpWOXIzSUxn?=
 =?utf-8?B?WFliVGM4c1dqd1FRWW5KblJ1SXNRTzkzRWVoUndLYUVhRDVjRFNnVUlWZW1u?=
 =?utf-8?B?RTBrSDVFU21tTDZXK0JqR1dlaGx4K1p3RmsyRmJlc29pOStNSXFOYjBFRmU0?=
 =?utf-8?B?ZjFUWkJVb2FzMHpOQ1hmZk9SRnYzOUZFREwyMUJHNERrbHFkNy95azROSjlI?=
 =?utf-8?B?emYvK1FNeFFuVzNmWUw5dTdubEFlVGNWV1ZVSTNEV2hwak83YSttSC9zOStT?=
 =?utf-8?B?RC9JQXBucUljWndFTEVKcXN4d1hwS0NYNHZ3N0VYaWhSRUJDTmF6NmtraDRa?=
 =?utf-8?B?dWJKWjRmanJOM1VBcWJ3SlBOTXhTMVNvMEN1bTUyMUV3LzZOM0IyRnZveWxk?=
 =?utf-8?B?YVp0SVpFWSszQ29HdGdMSithQjYzSFRPZzBMdHU2RnMrcGVhTkFTamQ1UnRS?=
 =?utf-8?B?dTFOVlpUQldHcUJvanp2SEpSSGJBblRHYWJhalc3cVlJZjhCcHdCRWFCcjd4?=
 =?utf-8?B?U0wxSGdJMVdpek9tenlkUkpFNUMzWVJ6cjJDMVJxVzRkU3dYVCtBUytNTy9V?=
 =?utf-8?B?TUE4RDJaTEl6ZnBPWmRabW5LUE56TmJUeXo0NnEvTUxHWkFrQVVNQkxFZHdl?=
 =?utf-8?B?Ky9BSy9WNE9aQXl4eFZUV0s1NE9sLzZYZGJOM3hLdGFUSTFCZkgyN0lXSjhK?=
 =?utf-8?B?QVdjY1lVbzVqRithNGlLTFE1K3RJNnVuRVI5WnJhUnZZQ1BJemZZMC8yUDhN?=
 =?utf-8?B?dk9LVGtnZlNEVWFNc3BJTlVaYzRYbWdmZkVFV01neEdPR20xRisvU3VOeHM0?=
 =?utf-8?B?SFRXSWw0QkYwVDVWazFFYUorU0JURXkwOVg0VXhLc1hlMU1CNGVuejY0WW1W?=
 =?utf-8?B?bmNZWXEybWF5ai9waUNWbUYwUk1xakFScGNCc2RhRjB1N3VVT1B2dGFqdGk4?=
 =?utf-8?B?Zkd2K042UmNxUGswYUg2ZUtQc2pBYTRvSmM0TXBoK2dCcFNXZTBybENkQXg0?=
 =?utf-8?B?UWl3VlpZWkREc2x1NzFPdThUN3ppRWpHQXdVSXcwTFplWERQZEVvKzNLSmI1?=
 =?utf-8?B?a0QzYzhjODZqSzVCbjNaZHpiS0JYdzZnaml0WGNuMFZqV21vY1NIdytpOXFh?=
 =?utf-8?B?MDhJRHpBYlVDVnFkNUlGMlF0em9ROFlWamRIRGRrOGsvZGFmNDdBb1hoT2VE?=
 =?utf-8?B?bFd0WW1UaTlGWGJxZ2hSaGVhc0F5cFBwQ0hORVUzVDA4YXNCWU1KckNRK2xy?=
 =?utf-8?B?Uk55Z1VIQ2t2Y1RxTFkzU3JLMjU5WDNGMUV6L2FIRjk4WnVrQkwraUt6U21m?=
 =?utf-8?B?Tzh4WEplM0hZMEFDWDFwMHduU09GQTR4amxTNGpJOVpjVkFqa2ZtSklqMExW?=
 =?utf-8?B?elpKdkEvM29oWk1rUGdFZlRsSEZOSDFJWEJWckFvc1RvTERnbUowNFNnZmdh?=
 =?utf-8?B?TFNhdkxZK0QyUkZyVFFmNEZ4dmVFamVmRmVGWVVFZE9VUCtJSTl4VXlLZUJo?=
 =?utf-8?B?RXVreEVnYmFWZXZlRzJyZ1M1VVJCVWpuOUJkL1oyWTdldEZsRy9Kc0tVdmc5?=
 =?utf-8?B?UFNpY0M5TzJaRlFJN1JIRkVkNmhNb0dPREtFOTRlWU50ZUFhaFZ3dTQwWkI4?=
 =?utf-8?B?Rm9YY3dNVy96Y0Y3RmNGREVIdVFQZkdDUi9wTlJDMDZpME4rN0E3RXlGZnIv?=
 =?utf-8?Q?RzQdM97zWVlepJzuDmgdGt6fZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A83B64EE8A12A943B852B5644D76A74B@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c648d-f741-413a-e199-08de18093623
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:08:17.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dxuooQ6RA1vlI+gFYM2Wp/DMlOXiwO2gb+nw4h8hc7Sjl5uXti+uhQCBBdksB5Zh0s60gOuMbKgzlhXwimhQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBY3F1aXJlIGt2bS0+bG9jaywga3ZtLT5zbG90c19sb2NrLCBhbmQgYWxsIHZjcHUt
Pm11dGV4IGxvY2tzIHdoZW4NCj4gc2VydmljaW5nIGlvY3RscyB0aGF0IChhKSB0cmFuc2l0aW9u
IHRoZSBURCB0byBhIG5ldyBzdGF0ZSwgaS5lLiB3aGVuDQo+IGRvaW5nIElOSVQgb3IgRklOQUxJ
WkUgb3IgKGIpIGFyZSBvbmx5IHZhbGlkIGlmIHRoZSBURCBpcyBpbiBhIHNwZWNpZmljDQo+IHN0
YXRlLCBpLmUuIHdoZW4gaW5pdGlhbGl6aW5nIGEgdkNQVSBvciBtZW1vcnkgcmVnaW9uLiAgQWNx
dWlyaW5nICJhbGwiDQo+IHRoZSBsb2NrcyBmaXhlcyBzZXZlcmFsIEtWTV9CVUdfT04oKSBzaXR1
YXRpb25zIHdoZXJlIGEgU0VBTUNBTEwgY2FuIGZhaWwNCj4gZHVlIHRvIHJhY2luZyBhY3Rpb25z
LCBlLmcuIGlmIHRkaF92cF9jcmVhdGUoKSBjb250ZW5kcyB3aXRoIGVpdGhlcg0KPiB0ZGhfbXJf
ZXh0ZW5kKCkgb3IgdGRoX21yX2ZpbmFsaXplKCkuDQo+IA0KPiBGb3IgYWxsIGludGVudHMgYW5k
IHB1cnBvc2VzLCB0aGUgcGF0aHMgaW4gcXVlc3Rpb24gYXJlIGZ1bGx5IHNlcmlhbGl6ZWQsDQo+
IGkuZS4gdGhlcmUncyBubyByZWFzb24gdG8gdHJ5IGFuZCBhbGxvdyBhbnl0aGluZyByZW1vdGVs
eSBpbnRlcmVzdGluZyB0bw0KPiBoYXBwZW4uICBTbWFjayAnZW0gd2l0aCBhIGJpZyBoYW1tZXIg
aW5zdGVhZCBvZiB0cnlpbmcgdG8gYmUgIm5pY2UiLg0KPiANCj4gQWNxdWlyZSBrdm0tPmxvY2sg
dG8gcHJldmVudCBWTS13aWRlIHRoaW5ncyBmcm9tIGhhcHBlbmluZywgc2xvdHNfbG9jayB0bw0K
PiBwcmV2ZW50IGt2bV9tbXVfemFwX2FsbF9mYXN0KCksIGFuZCBfYWxsXyB2Q1BVIG11dGV4ZXMg
dG8gcHJldmVudCB2Q1BVcw0KPiBmcm9tIGludGVyZWZlcmluZy4gIFVzZSB0aGUgcmVjZW50bHkt
cmVuYW1lZCBrdm1fYXJjaF92Y3B1X3VubG9ja2VkX2lvY3RsKCkNCiAgICAgICBeDQogICAgICAg
aW50ZXJmZXJpbmcNCg0KPiB0byBzZXJ2aWNlIHRoZSB2Q1BVLXNjb3BlZCBpb2N0bHMgdG8gYXZv
aWQgYSBsb2NrIGludmVyc2lvbiBwcm9ibGVtLCBlLmcuDQo+IGR1ZSB0byB0YWtpbmcgdmNwdS0+
bXV0ZXggb3V0c2lkZSBrdm0tPmxvY2suDQo+IA0KPiBTZWUgYWxzbyBjb21taXQgZWNmMzcxZjhi
MDJkICgiS1ZNOiBTVk06IFJlamVjdCBTRVZ7LUVTfSBpbnRyYSBob3N0DQo+IG1pZ3JhdGlvbiBp
ZiB2Q1BVIGNyZWF0aW9uIGlzIGluLWZsaWdodCIpLCB3aGljaCBmaXhlZCBhIHNpbWlsYXIgYnVn
IHdpdGgNCj4gU0VWIGludHJhLWhvc3QgbWlncmF0aW9uIHdoZXJlIGFuIGluLWZsaWdodCB2Q1BV
IGNyZWF0aW9uIGNvdWxkIHJhY2Ugd2l0aA0KPiBhIFZNLXdpZGUgc3RhdGUgdHJhbnNpdGlvbi4N
Cj4gDQo+IERlZmluZSBhIGZhbmN5IG5ldyBDTEFTUyB0byBoYW5kbGUgdGhlIGxvY2srY2hlY2sg
PT4gdW5sb2NrIGxvZ2ljIHdpdGgNCj4gZ3VhcmQoKS1saWtlIHN5bnRheDoNCj4gDQo+ICAgICAg
ICAgQ0xBU1ModGR4X3ZtX3N0YXRlX2d1YXJkLCBndWFyZCkoa3ZtKTsNCj4gICAgICAgICBpZiAo
SVNfRVJSKGd1YXJkKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGd1YXJkKTsN
Cj4gDQo+IHRvIHNpbXBsaWZ5IGp1Z2dsaW5nIHRoZSBtYW55IGxvY2tzLg0KPiANCj4gTm90ZSEg
IFRha2Uga3ZtLT5zbG90c19sb2NrICphZnRlciogYWxsIHZjcHUtPm11dGV4IGxvY2tzLCBhcyBw
ZXIgS1ZNJ3MNCj4gc29vbi10by1iZS1kb2N1bWVudGVkIGxvY2sgb3JkZXJpbmcgcnVsZXNbMV0u
DQo+IA0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMTYyMzU1Mzgu
MTcxOTYyLTEtc2VhbmpjQGdvb2dsZS5jb20gWzFdDQo+IFJlcG9ydGVkLWJ5OiBZYW4gWmhhbyA8
eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL2FMRmlQcTFzbWR6TjNBcnlAeXpoYW81Ni1kZXNrLnNoLmludGVsLmNvbQ0KPiBTaWduZWQt
b2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCg0KUmV2aWV3
ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

