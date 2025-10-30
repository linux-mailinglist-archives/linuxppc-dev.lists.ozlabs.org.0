Return-Path: <linuxppc-dev+bounces-13615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFBFC22A55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 00:06:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyKVK58yMz302b;
	Fri, 31 Oct 2025 10:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.15 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761865577;
	cv=pass; b=XEPC/vo9Hhx8I/WVyrBJKd8Y6BDZGY7PtgOZSlP76QGDkLi2kvpc5BhGQ1ihoMzzDWoGJy4QlWdQ3xn3bC8LZqokRcKFfBAvf7vbEIDiPq0uHKt8cK+T51DR1dYIrBHhLx/eVJrpD964YDFSpg7nvm0k9sczGy9hT1/1YyvmuzKnRBKManKftCzRnzvRIDl7xI3LMBZk4ciRTdWWCXxrX/95lIMeib5iwRiEItNwAyCP/yyTysqxnxur1h4jWWoEK+EtxdCF6yeFYCG97tcEdTcE+/IZ+cvrqFIwtKWba3W10I2HdKNzBzPvhopcnMxQW2OS9V2IEDqtlxG+Q8F6zg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761865577; c=relaxed/relaxed;
	bh=YUuMxoOBbrARWulbBtaPRbso2FhmqgN9VSjKmEfsCIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UDKOerSLbD3Kx69uHqx1yBb/UIip47AeOv5iAB0sI04kjFH3dwv9GVFqwivzqhpw3H5SlGrmk+y9fnXjWnJUcEZxMGvuNPe015D3oxjpLWVoNaHy8bgdAl3awc5iloVrheKpqdFhQmH6mB8yr38pm0ln3om+9VtHMSvmanUTBlRMu3AYHxebclYmmhmnWqtYgx9bs3TPeIZz6OSg7r3IsVsnHTesfbHAtrzNgRQw8K1FqTmbVKisSiUd5F4DTPDoVbRSYVweCJybLh9QDbL1YCrGdcpC0vVK/J/iJdTfmirjQNOI2jfb8CP4/rpPVsQ8ADj5/ZR59SLKNGd8nhrwUg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G54CyZ6T; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G54CyZ6T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyKVJ0zmNz2xR3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:06:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865576; x=1793401576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YUuMxoOBbrARWulbBtaPRbso2FhmqgN9VSjKmEfsCIc=;
  b=G54CyZ6Thl7pw2N1M0FdE7oP6lnBx/Ea2Jvax9+vEzMTgmpt+RYpy4uz
   dvxnfvTJbMfbPtWlrb36bUSy/jARkRDqb1bt1YLI4qlHxnTRgDPvEdTWx
   73gBrUsihBT9hT5U/1JlwDoFN7Hd6I0O47HYAkQftp4+/a8oxPRP/+I7C
   CyqLalewQxwTxpLJvL4MiACt/uwnZqpIQUbxABKY/QLlEqDkCt4vlx4sD
   /xrWMBq6zqgRNzyAhyIycidFplyzpL3G45H31ui39ZzNVDTJT9rbTN/FP
   Mgk+UHCrQBOP/ggohkmPx/canudQTnJVLZifHMnYWADwiDY2G/0HCe+i1
   Q==;
X-CSE-ConnectionGUID: n/eT5qXrT02RtQ2444afLQ==
X-CSE-MsgGUID: FRaO0D9uS0esUJqZlpbMTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64118710"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64118710"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:06:14 -0700
X-CSE-ConnectionGUID: FpSChP/bSna2S+k0/XC8aA==
X-CSE-MsgGUID: Yx9MDsTuT2eiT0lICoTPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186418662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 16:06:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:06:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 16:06:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 16:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX1G4g4krwN7uQ8V/HqDxLbBKCCKLE0WvD82JZGukSIgBVfXq294DsXNroghhjGESUZSS9lEWk2j34V7/l9gFV/CXqXv2iBY4qLSsYKkKQS2smxj06T7RFSjGcixUP55LfG3ukz6OzOca8TcQ/HaJyY/SBl4B/P5iBXUNW76+ohfq+qFiaSDrHXw8hNm02uEWXA2c/0LJi0LHPd9JglctSsJe2LQ8wxFYnzn8n0oYrDtoRWCUHZdoIMiLrBaTilEH03H+wdTMjSVk00oLvOFmTlR81mjYBIC2CZH8kMMysEW8DmOOyHxp5O7/MIhTLMTdkQ8oGK77dlKz+CVVG0IUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUuMxoOBbrARWulbBtaPRbso2FhmqgN9VSjKmEfsCIc=;
 b=kb0RgD8Nw8CPPwA28Y29RpXpf8vNDc0Qrw98iCBAG0gt8zl626aLMNLkP4up/m4J2dJpeylP8o9/PwwXTRioOVQDYZOdwCsYbwCG6GaalCHh+FN4am30KO5VrtBf0IuvH5J7CMOYyzHD3+VfhFS/gSaXzryrcKPAr1SFoFYV5mzUJL9har9KIwqIi56Dv3QoghdXaYd012ujn0vBtuI2OWPtSeL7uKKr6dFWVFgoWYdkUqDd749uUgEvhHzRHB1u5Rd2wBsFg3Oh/Y3CkAKPYWB0W3NkDzVHgs/TONcvHjUKTXLL2i1A/JWqOfMOhSmA4YAbp9tCag0f5TV5MvcvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 23:06:09 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 23:06:09 +0000
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
Subject: Re: [PATCH v4 25/28] KVM: TDX: Don't copy "cmd" back to userspace for
 KVM_TDX_CAPABILITIES
Thread-Topic: [PATCH v4 25/28] KVM: TDX: Don't copy "cmd" back to userspace
 for KVM_TDX_CAPABILITIES
Thread-Index: AQHcSdlWOp6dbKSXb0qSYl2CRjSp+LTbT9cA
Date: Thu, 30 Oct 2025 23:06:09 +0000
Message-ID: <6830e97d6481809b4ad9229d32d9a9f8d6062789.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-26-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-26-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MW5PR11MB5860:EE_
x-ms-office365-filtering-correlation-id: 8bd6ff25-d9b9-4720-58fb-08de1808e9dc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?amYvSlFFWDMvbzhkRXVCMDlnRWJpV2dFTzdCY1FpVmdIcURIaEp3WXYwSkJW?=
 =?utf-8?B?VnAvQ3o2TisrRHlaNm8yYUErTXZwZ0FTZi8vVW5Nc0VWdzhkR0pWUzZDSFNQ?=
 =?utf-8?B?cW5WUUpRSnpSK3FkV2locVZQV1lnQzE5c011TWo1QWduNG96TUZJUFZpbkVi?=
 =?utf-8?B?VzF3a3lCcXNOQjJhUUUxem5qUlc5Ym5Oc2ZmVldpUmNrTU5YazRqQ3hTb0Zx?=
 =?utf-8?B?SWZkRXpzc0E1NnhrV0l2Ni9ycnd5WVJxTmkzTTd2bmhPWmZiRVlna3FlalZ4?=
 =?utf-8?B?eGpoS3JkdGVUbEJEVUFtaDVVbDhHb2hnNFhCSnRqb2EzRFljemgxS3krT2Fn?=
 =?utf-8?B?VXhjbGp4L2pPeDFuV1o0aVVYZXB2cWtONzZYamkvclVvSVFHWXgwOG5VYUlV?=
 =?utf-8?B?Um4vcGViUkZMUWt5b21PemJYOUtlTFNuV3ZaWTFyZGRndHBrVkMwbkcrcEgz?=
 =?utf-8?B?SVdSTmRVWXExVXA5QnBJempvd3pDMFJFWFFEOCtXMDdjd2JMWmNPd2J0NGI1?=
 =?utf-8?B?TjYxTlNaZ3JMRjNBY3liaXpKNlc0T3hIS3JSWDZyVk9iYlFzdGRGRmo1dExM?=
 =?utf-8?B?anlIZi9LZ1Z4U3FDNVB5Z1NqeGN0bUVPV0lWZlVKMnlxQmMzU0JwNW5YQWJi?=
 =?utf-8?B?K0VqWlhVNUhqVWxPSFUyODlRTGdGRGxlMlVOcUxVSXczbGVUc1B4ZlZkczdz?=
 =?utf-8?B?VlpTTFg5WkpTK3JmajNuZEIwa1BnY2JVcSthNVUvV1c2KzdWOXZkR1FNNmFK?=
 =?utf-8?B?TE5UVE5FTVNGSk9HWVFFTFJmb205MmFnTUZKcFFRcWFWL3ltVUdTNStWL2R4?=
 =?utf-8?B?SEZxb3UvV01iaHIxeHNaMktIVVVqZWQ0RzNMb0ZJbUNHakJ3WFJZcWh6Tmh1?=
 =?utf-8?B?RlBieHQ2cHBMMGxmN1paeWoyOUkrbzR5NS9lV2xmaitYOUdvVlpBci9OclJS?=
 =?utf-8?B?Zkt1c2VQOTlQWW4zcjBTNXNMbVpQWGhCMXl0dXhJWnA0ekNxMzN1Ym1EV1J5?=
 =?utf-8?B?QWlzU1h1VjZkTVV3d0hxQWZZblRpUGEzV2F5S1FtWEdldnc0M0VMVWIxSzFr?=
 =?utf-8?B?WVZBMXJJNTQ2WU13NnR2eldJeFd6UGxCZ2s4T2ZvdmFkMUR5T0xtVlQ4bDdq?=
 =?utf-8?B?WEZJQXZoeitVeHZ3K3pvV1JvSEFGRmlJMmFLd0dHWkN4dWZwRUc4cldHblo0?=
 =?utf-8?B?L0p0bloxQWZrTDR0ZVIxdVRjQWwwUWNBTVAyWTVSN1ZOcGZhUkRSZkoyQ2t5?=
 =?utf-8?B?KzUwQ00ycWMxeE9GY1dFZGxkQWlUUnl1cTR5QWl6UUh4R2lmcnFUbWJzT3VY?=
 =?utf-8?B?Z3ZoZGZUK0FIQUZITndTQXNnMzdYMkg0OFdzamU1RGdGc2gzSzlrRVgyVWVk?=
 =?utf-8?B?cm9wdUd4b3dwM2hFdHlrV3lHZ1FLdDBIcjJ6Wm52VGU1M3BSdVpWVmE3U3BJ?=
 =?utf-8?B?ajdsd1phWE4wV0lQVDMxSmFoa1JJUFVDZTFTeHV1VjdGNHdFYVBpcXJlOSt0?=
 =?utf-8?B?cmtkdFFaQzcyc3FRRUgyckhVM3BXSWtOQ2FPVEpkSURsSUR2a2JMenpmL3RE?=
 =?utf-8?B?TUlDa0tEWWdYVUtrakRUbFdRZVJIZVp2c29hQ1Foa3o0eVNSdzZiMGhSanp5?=
 =?utf-8?B?by9hMCsvSGIralJ0Mldxd0l0aHBUUWF3Q3RHMkZqL3k5a01NV2pXdkpRQndx?=
 =?utf-8?B?RmtlRmttUFg0SXNaSHZzNDhvTklRMWhranNJQ0lyUThCbU5jN2VFZkVvUThL?=
 =?utf-8?B?YlNHYy9kWTUyVmdla3NFOFFuRTNMRHBWVS9qTitOWVhVSDR5bTJsVmJMV1NI?=
 =?utf-8?B?ZHBwb2ZCQWQrd3dpVjB1SDJBWlhNYVF6RW1hZzdnL1YvS2xpS3pOY1YvbkUz?=
 =?utf-8?B?cTFZUVg2dTQ4RVU2RWVabjgxVGZIL2xIL0gxQTRWZyswK2JJdjhoMGx0cEFu?=
 =?utf-8?B?cDMyRVNrcDROTVVZUUFQVEZTUEpsQnl1ZWpKZlFsR3c0bTZIZmpXcllmZmFw?=
 =?utf-8?B?ZEtXVzBjd290bzlqcm5Qbld2OGpMNEdBV0hpc1EzbTFET3lYbDhnZmhBUTli?=
 =?utf-8?B?M0tBRTM5cVFGR1dGKzdZQ2plT2hOWHBBR3I2Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NCsrVkRMOVJxU0EwVnJ1WHpDS3MrdHBNRW5ucWFHTlJOVzFXSXB4dFFET0di?=
 =?utf-8?B?N3ZxbzhOdTcwdGRTaWRBVHpqZkdSb1lBUDhoclpCL1F1QTV0d1EyaFpna2pE?=
 =?utf-8?B?V0haN3gvbnBTWGlUSERDSEVZdmFxd2x0a1UvUDlmMk9yTkEwbmVpcXhGNy9y?=
 =?utf-8?B?MjkzUkxTUGI3WExSeFFhNXpIeFVnOXc3V2dTbFRaVjRmWHI3b3J3ZGN4bDU3?=
 =?utf-8?B?UkxWVEVWUzFLTm5DRTg0bXJFNERoSDVDUHRsa3hZTjlGVlFVZmVQV01LT0hq?=
 =?utf-8?B?Rms2QmdwN1NVd2E2NXVpaXBuV1R3eHdMR2J3RDJmM1N0QzdEMjZ1dS9Zb2M5?=
 =?utf-8?B?NGkrY2Q3NHoxbTRMcGxWNmE1TU9uUW1NM1BOcmJLTFFsZS8rSEFYZFBPTkdm?=
 =?utf-8?B?QkV3RVFJZGVwejJzUW5GNnJ3dXE4M1BvdXRmcVNwRWRLQTFHa1ZENE1MQ1hZ?=
 =?utf-8?B?SnVGTDlGZTVUbkQzOUh3YXBpbFFhdExzNjZHVkJhcXNHcWx5V0FpRFZSd1Jw?=
 =?utf-8?B?OExMKzJLZVdMYlA5dnMvZisyYmRMMi83WXNZYXFRWVdTd3ZkbEpoa0l6NGNX?=
 =?utf-8?B?alZMRVVqUllVV1UrS0FqTnA0SGFBbHAxckI4VVlJM0dheCtJZTlOTjFRSy96?=
 =?utf-8?B?MUNodFdkZ2tUakdRb2pjWFg2a2dLT0ppTW11Sld2Z1RoVlRaL0Y2WHBNaCtT?=
 =?utf-8?B?dXp4ZHhxV2dFcHlVVUF1eWNkb0kyMUdGdUgwMEdhcjFqTWk1aU5oM0o0STQy?=
 =?utf-8?B?WTNrOUEra05SWVdvRlJYc2VUUmViR1VHVlMzVEpoN2ZMdlArNzROWjFNUUc1?=
 =?utf-8?B?eXk2RFJGN2l5dW9yOEZYdTZIYmJ6TDFFaGxoTW1meWNrU2pIU256QzdPeFQ0?=
 =?utf-8?B?a2h5SlVEamtzVENhYk01NGVIa01iVm5FN2F0R3JSQmlnOGlTblJNS01PQktq?=
 =?utf-8?B?SktPK1RyTmhWRysvSU02SHdjM2cyTWhOclBuZlk4R3daczB1bFlRVU5WL0FF?=
 =?utf-8?B?ZzNBR0xGK0pGTW9VQzd5bW8xWEVTMGFFdXA2eHN4ei91WDhJVzJobVBiQzhN?=
 =?utf-8?B?OGpCN3VRM0hja0hEMmczNVU3ckhRTVZaek0vSXh4ZGNNSnBUbitDQVdBaUJm?=
 =?utf-8?B?bW9leVhmMXQwKzBhd1BQZ2thSjNMbE13TGJraUdjeUFwdGJ1Q3lnVCtHQzFp?=
 =?utf-8?B?aUJLcEliL3lTZ08wTVUxbzR2NkJEU2tQVkVFbUd6Mnp6d3BRSlRMNGVzTlFB?=
 =?utf-8?B?TTEyUURGOXFBdmZLejk5NzhMc0lzOUUvdXR0TmZoUHZObThnS0dBcmFtVVFT?=
 =?utf-8?B?V3BWOFB1b1h0WERYK1g3dzhHdnExV2srMGVEbEN5ak9pbnlDa2o2UkJja1Nj?=
 =?utf-8?B?MUI5ajk1cUNFcCt0VzR2Y2MremhueUF2Q2grcUZ1TEFPTllkbHdpWnZNLzla?=
 =?utf-8?B?Tk9XeDEvd21KWnMyc2dEOUc4ODhIM0dZTTd2cE9PUTh6SVN4Um1qL2dnd0JG?=
 =?utf-8?B?SmFLakc2Z25aaUptOVlGQ1FBWDJ2R1BWejl0bElnTEZYUm13UWViYVMyc011?=
 =?utf-8?B?ejdnTnkxbW9NVFZTZlJRMTRFbmlkUFhKK1VkYVFNbDdJV3Z6M2s1VG1IbnE3?=
 =?utf-8?B?V3A2OHdnaDVCWDZyNmlDb2NacHNKQ0V4NWJrUkVyd1ZCQWhTMEVEQ1lNWStT?=
 =?utf-8?B?NEFKZzF5T0I0bk1qcjNWUzBQRFhSQ3JmVVM0aS9LS2ZuN0JYSDdaTzg1NGpl?=
 =?utf-8?B?ZTdFSmUveWdWZWJ3UG5BcHh0N3RGSk1YZ21SSklzanI1MC82U25kU3RFTVpV?=
 =?utf-8?B?eElJcnNzZXdQMllHekorMUQwTi9oaGdxVElPUGNVb3J2WkVnRklrUW5jTFV3?=
 =?utf-8?B?eHRFRTVmOFBQdmZ6VFdFd1hBVHgrZitremlObmtadnVYUitBaGJFZ1V5NGVV?=
 =?utf-8?B?ZGZ0QjE4K092Q1lSNWY4RU1SL08ybytnYmRYWWVCbGhicXd1MDhQZkdJQWRH?=
 =?utf-8?B?azBJQ0UzbWFsUEpCZVFXcXZWcWJjWUVqbUtWK2V5ZTgxeVNwYVN3WDRJSTg1?=
 =?utf-8?B?TW83VEo0elJ1QnJkeXpuV21sdmRPdHUrSU5NcnRiSTZtNWNseWY4L1l3VkRQ?=
 =?utf-8?Q?OdSl+65Ia+3ADEP8A5f33354A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5454376A2F4A284DB7C9760CE932E471@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd6ff25-d9b9-4720-58fb-08de1808e9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 23:06:09.5491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBN/8tjzvaW3Ufql4wtFO3TuD/BQKoKDjiFjuJgp+/r2nv1bPZ5UERvHPwAROjIFYaJbK3ylu0RDjKm1jW5vfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBEb24ndCBjb3B5IHRoZSBrdm1fdGR4X2NtZCBzdHJ1Y3R1cmUgYmFjayB0byB1c2Vy
c3BhY2Ugd2hlbiBoYW5kbGluZw0KPiBLVk1fVERYX0NBUEFCSUxJVElFUywgYXMgdGR4X2dldF9j
YXBhYmlsaXRpZXMoKSBkb2Vzbid0IG1vZGlmeSBod19lcnJvciBvcg0KPiBhbnkgb3RoZXIgZmll
bGRzLg0KPiANCj4gT3Bwb3J0dW5pc3RpY2FsbHkgaG9pc3QgdGhlIGNhbGwgdG8gdGR4X2dldF9j
YXBhYmlsaXRpZXMoKSBvdXRzaWRlIG9mIHRoZQ0KPiBrdm0tPmxvY2sgY3JpdGljYWwgc2VjdGlv
biwgYXMgZ2V0dGluZyB0aGUgY2FwYWJpbGl0aWVzIGRvZXNuJ3QgdG91Y2ggdGhlDQo+IFZNIGlu
IGFueSB3YXksIGUuZy4gZG9lc24ndCBldmVuIHRha2UgQGt2bS4NCj4gDQo+IFN1Z2dlc3RlZC1i
eTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEthaSBI
dWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

