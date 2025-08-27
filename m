Return-Path: <linuxppc-dev+bounces-11391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A24B388A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:30:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs3z4HLHz3cYk;
	Thu, 28 Aug 2025 03:30:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315807;
	cv=fail; b=GXGB4M4De60a14d6iw+lmngVB7Y8G1iGUDAPyH85Fy/pFoEz3+r6/KzQnE4rnHhSA445D/uoF4HjhClifp82U33kqEJCzRDPrwoZWUJfFa3jdjEt5UH/d/4DAOC7YgVZ7MYWtDLWUhCJadc7mxCiQngAM1j9JAi8q8gyyh3l4R15rrlyAQcacjhHBTnjzTASKuu3MoJAc4qo/gGaDJnt3ySUhEzJJyZtN0wHstxO4tKU9dLbEAMvS99dKQjJYPJpNNHKaI9MDVrCZYSdhdMZoNP1eCH1NW9w+KMTPyAm1zYcO6Iz4XBAyhrokCL3vqIcfJIc0COwr2HE11BNvkfJ8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315807; c=relaxed/relaxed;
	bh=+QM/Hk0k3W2Q4XrVl8vaCgvJSML4ZT7W0dimG8/0TVs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DnS6r+iWEPc9VB94yqugBCEpOsvp8ykHKWRE5nmtDTor2NaRNDAoFoM7nZUIu8PKHLQpMuq6knlWwdg7ueXKOSH864RxQFv3JY0rhHdyXa14sry/4Y3Ed3r+rWupos3UL6YLPPK7umGEOQP0Xy/u4DR55EtHGCGSCwFaM6Vf3NT2zmwyj/62El2y7KZ8g9drxWSP1y5bZUbXJSVO4fAeYZip54vStMMWhytyGrdL3aLr/9dsjutcSr2nJ3cS/U3VErzlOY0k9KtEytFHLjUUN7YJ4BcJ7B5az9jofdxxxYz1Nh1a2UrTr3R4X5gH0FFK6czEI8uhMkVzqrJVmF6Hiw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IxT0oIaq; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IxT0oIaq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs3y1HS2z3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:30:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315807; x=1787851807;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/IAcV+DvFAhsKJqFdygkqEdpyO6BgmRjGynmU7hHle0=;
  b=IxT0oIaqso3v2Y01C3+sZRe3B8Cu9iT15yy42zANFDhwp+W8QXTB99/0
   pv8j3Sz0H7cd1w8cjO2DW9/hXhz21wcI63uvUlLfRbdJ/9U0tSfp9KoqL
   Slwms5UFUNS5AnHZBNK+bvUzAr5gQuY3TRoFG/SQe6C9YEVwCyEKCgLwZ
   HjuMvp8Ndo+86hvRQir1ysvSd43cfVoiH4Uy04m3MacUF7unQTNRbrLs1
   O5TvptktdNh5xs4HJB9HncFbZpq/E5F5zq037MwjoS+JtvOjpNVR/h248
   tw6aTNdPcz8nBO9PPzrKVDB7QQVzv/1WPSveqtzOX6NU0ZRP6U3wAMJdP
   w==;
X-CSE-ConnectionGUID: /+e7jnt+Rx6ljocFeIKO/A==
X-CSE-MsgGUID: BwEg0fnfSSCnwykcgk3A+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58642921"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58642921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:30:04 -0700
X-CSE-ConnectionGUID: aHPbBwvRRs2NE/dx1vnDBA==
X-CSE-MsgGUID: QGTnSqUVSJKPQII8lpDYcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169826954"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:30:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:30:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:30:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:30:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAEsusqADRIZX4qMGYnjPiA8Rls4e6qVm7ShDWZC58K/3xetDIqSgVXkuRtG48McTrRKzRdNIjcdw/26sNlz0B8OoYMp0WokjgTgjpLIocmRzawjQa7k+iGmwZjlhd18Qc4+kYX1GDr3NwIN6mcLZrO6YP8EDce/b+/DqkK3BEjM7ayiURRIR/PAqoqii+oah1KsS6N/jGETN0cL6OZD5BcpjAhCvM5LOwtlSz4J5XFWQFQHem9TPmIJXSSOeXE6foLALKLOPlPhvBce558ZqC4IRPyvU9qjypnS8aTBQQaFU5HQEQFAl6kCT5DvuCij2MO/yTVmShKFO6Zh/A5iIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QM/Hk0k3W2Q4XrVl8vaCgvJSML4ZT7W0dimG8/0TVs=;
 b=AU5Ax9+Fz+M+ew1FSpgdWyAuTAPyNbp6xWXsgCJCmGS56/ps+gW/Osb/IFh9qzj/iSgOSoUdovNuOyM3cAnYU1rNwn9rJGHg+hUEzbOx0DR99P3ThWIu32TPTdWQyJWUEUCxuOw8U0sCiL5Xazl6MUeqWdW13JlTecXZNTEq+d339B36vPicVSkdipswMyTYIN3RvFQll3rqxtZK+r0KY+AuOr+pR6Qul6Yc48nZ2LvjJLWVJnk2bsVuuPR9cHlsdgqZOg0/5gn45jutN9JSFJvYQwgv7zRjG0uX/Ukq1mH0rJc8ShKSOb/NxbmOjucP2OWyyvxaEeoiY/SR6l9zbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:29:59 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:29:59 +0000
Message-ID: <c83166e3-99d6-47aa-b774-0dfe69e0da8d@intel.com>
Date: Wed, 27 Aug 2025 20:29:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] tools/perf: Add support for printing synth event
 details via default callback
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-13-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-13-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0269.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 39431527-6364-43ac-3367-08dde58f5932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzJGWExFZGZYbk9lcDdWTkFoRFBDeGl0T0N6RnZzQXpFRVl6d2RZbWxTQ2xr?=
 =?utf-8?B?NVNhNGdRWTQ5Sk5vcStFTXZ2REhYRXNWZTZDR3Q3U0VxaWV4SEFsY3ozKzFG?=
 =?utf-8?B?RjNlbTFwakxHSkVQaTNsWk95KzZmTTczdXZtWlFIOUpUbDlncllhcjJSS2ZL?=
 =?utf-8?B?bkhZUTVHL1MwNlVCdFgxN2FuODhNT25WUUVOR3FKUTNyUVovSW1YOFg4K1I1?=
 =?utf-8?B?WnczNnJLdk8yTE5wWm9pMWdWNERBanBjZ2lUMlRmTXpFc1N1NDY3NUVyWXlE?=
 =?utf-8?B?Z1A0cWlGWG1NcHdJOU5na2FKVnRGbVdNb0ZocytxSVFtd2ZQcTF3aHJZRTlP?=
 =?utf-8?B?NXNPMWVoM0gvWWZwcVFMRzhnd2tDa0lGdlFoL09jNVNYQUR5MUlTMkltSWZO?=
 =?utf-8?B?clJQUXRIV21JdDdCbU5hbUVpMThTdm9Dc3Vna2FvVW11VnlSdVhjOCtBZVE1?=
 =?utf-8?B?YUFIVFpiY2kxeDhuN0lhWVBWdGFUWFNSaVVLSmpvT2hsSFFFUGRVS2c4SVg0?=
 =?utf-8?B?TFRtWkh5QS8xYVZueVNqdW5XcmZxaFdwL2FlMk9GYjJaOXM0NGtDK2s3ZmNs?=
 =?utf-8?B?SVpuOTZoaFhWL2J6bkk2K1pZK2d1NFRTYVI3V0tkSlI4ZGF2cUhZMUVkKytt?=
 =?utf-8?B?Q280bXVUSEdid3BURTM2UDloWmJsSUZCYzNPZ2d5M0hNNnlaZ1NsWFFJRGg3?=
 =?utf-8?B?Vi9Ib0FKdC82NUtiVEQ5WE9wcmtCTHl4YzRnb3I0NG1Zb1pJMTVPSXJZdERB?=
 =?utf-8?B?NTQ0TXNuaVBad3gzYjJhd1Y5NWRoUHpMQVdsQ3NMVUxJWkxzSFNCTXdwaGtp?=
 =?utf-8?B?V3F6c1hUYXdSMjBWVU83SU1DK3ZiZHppRUNVeGlkaXFMc3VPbGY1RVppZHEy?=
 =?utf-8?B?dkxaYmtLMHRXL0dxeDlGQ0htY3ExMTYraGkzRlM4Ukx0OFRNNHZScktFMDE5?=
 =?utf-8?B?ekxuSFpTeU14akNBSUgrN0FBdUxJM3pWSkdZVHJOb2duU1k5a3ZUS1g5bko5?=
 =?utf-8?B?OVpnSmVMQkNmY21MdDZ3Q3JpSENjbFlUcTVCM0xoQnJuMnVsNVpwN1hVcTk1?=
 =?utf-8?B?K3Q2VUxyOGtjcllqZFltQWl5UmE3ZlY4Tk5pSFpKcU5vS1NGNXBZYnFENGQx?=
 =?utf-8?B?MFBWNC9udHNrVkFkOTA1c2Y3RzJreWJ4VGFiU0JBWXY3RWM0Z0tWallLOURC?=
 =?utf-8?B?a3NHNFhHeHQwTklnbFJPd1g0bzRJYjQxZ2hJNmtYOVVNNTFRN3FJclc2VkJM?=
 =?utf-8?B?TkhZQTJTM3hvUXlvRmM1aSszalVJTjFOTVpUQTk1MUZsc3A4aWo1UExuKzBu?=
 =?utf-8?B?bnpXdkxBa2o4T3NKdGR4eVJ2LzN5OUVNdVpzZGczQjZuRHVoTXIwbU9jV1dz?=
 =?utf-8?B?b09qdGViYVlleFVBbjhYUU5xRHhLUVhNWk5uUDQ3VTJwTVYwbHg1b1lHcWtl?=
 =?utf-8?B?d3A3eXNnT0lPQ0lJOGJFeXFWZmRLT1djeXpFb0d1QTBGdis5MitDTzlKU1lz?=
 =?utf-8?B?V0hPb0hwLzk2REg0OXBPRk1jbGVlTnQvSUdRRUUxcmxEMHQ0NzJHQ3FzU0lB?=
 =?utf-8?B?THNra0xCMnczNlRpeUFuSzFwY1pUNHJkQ1pNbGpXaEZrY2xHTnc0WlpPcmhx?=
 =?utf-8?B?c0lCL0NXc3E2REJzWlZ3RkZPMG95QzZhRXZHNFdIRnZlQ3ltWVQwRlJlcVBD?=
 =?utf-8?B?eS9UUndETTJJZVN5bTBKcTNRZUpMMWFpdEVFa2R0VDQzNURkaHRncDgyTXVy?=
 =?utf-8?B?NVZnMm12bC80K2llV1c0R1hjTzZmYzMyc2NtbXJHUmk1bFhJQllYNC9GUC9o?=
 =?utf-8?B?VFVhdFNkQVhjUGJ1WGFzek1VMERiODFRSWZNRDlhcEk4bTdvSVRxeGhhVlJz?=
 =?utf-8?B?dHM5ZlA1RW9zNUU0UnZUd25TcTRZbU9QWU1GUVhoYU5SM1VxYzIvYmEySVFW?=
 =?utf-8?Q?B+2GQ+qq8GU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5uN3FXZTkycldYL0Yvdzc1WXNMbDJ6OFpwRkxPeXZjdjlHL08rZXRoTFNU?=
 =?utf-8?B?Z3dpWFR5WnlFMDNUNEkxVjIwYmtRN2FDaG9DMkdMd3FwN1U5elIrSno0cDZs?=
 =?utf-8?B?UVVzYm04d2dNQnNwcUJyWksxakM5aU9Gd0dzSlpVdVN3bnhqQjlUWktlY0RT?=
 =?utf-8?B?ODJEY0hGcXJMTVJyNnhKNTFvWm0vU3NCaTFYU1BrVkJkdkxsM25paW4zK3lU?=
 =?utf-8?B?SG1ZNmtIUVhBZnU5bG53VXNUTjQydmozU2R5RUV1WHdRUzFtRXkxN2VzaHVQ?=
 =?utf-8?B?M0ZSK0t1VVQ3NE1mbytaU05lSVk4UTdSNSt2djR2WVp0aERQZnkxMkoxL0V0?=
 =?utf-8?B?TytQOUFpVmtOeTdpSWtGemZuM3VoY3ZMSWdNL2dzSU80YW9idUxwTXRZTVdt?=
 =?utf-8?B?YmJvSkQrN3lUbHBOUDQwVCs4eHk5N2F0WHFkTUVjQmhOL1Qrc0lTM2dxZTZR?=
 =?utf-8?B?RWlFbnJMb1k1dnNCK1dpNmsycnhvcCtSWVAwVXp2UFdYMWdtalAra2JHRUx2?=
 =?utf-8?B?Q1hRMUJ0REh2RitqSFQ0MC90UG05MWZKaklpdkFEQ09NNFI5dDlwYTdhb1Nz?=
 =?utf-8?B?NkYrbW5RcjhrTzM1WTdod25FWk5BNk42eGdUc2hnRTk4TThHN2pFbTc3SEw5?=
 =?utf-8?B?L2F3cytYWmt1aTdBME5xRnVUb1UycVNFOEV5STdGUjlYdDhHM2ZGVjJhalFF?=
 =?utf-8?B?KzZpL3hTK1NoeSs4TVJpWEo1aEZHaCtTbTRHbVZlYWkwVXpGZFpTR0ZSVmJv?=
 =?utf-8?B?U2U5RWdiNEtrTlBTdWdNTTQvZC9FMFdpd1JVMVlSYitDUzYxWEVmdlNHMzNI?=
 =?utf-8?B?ck9BaGVpT1pUYTg3bndrYnFXYmQvZmFjL0xWVDFVb3ZTVFpKcWFuaTAyTm9B?=
 =?utf-8?B?UHd1YlZ6QUtoZ0VHdmpQWDhjdmNMYTJGb2w1Si9rcEV0WUYybWw3YUp2K1Vm?=
 =?utf-8?B?RzR4TWh0Tm0vQkV3cEJBZ2Y1NlJzSXJJYWVmTmExaDFBYzNlYjlCbTRDTUpU?=
 =?utf-8?B?NGMrbG5MeTRaU0lDQzVvaUJFVStPR2hlWHVQL24rSkNoNVZpSkkwcGR6YkRX?=
 =?utf-8?B?Wms1YnpCQkUyMDRHTGpOSEtkMFUrZENKaTk2TmtoWnVXOUxQWkpDb1ppakp5?=
 =?utf-8?B?TGs2Q1haYkdvNmk4dDBLNnorczJORzl0L2tHcExpY0lJeWlUM0ZTMGhmNE9j?=
 =?utf-8?B?bnJLMW94Um9RUnVSTWl5ZzFseWlhczk4d21OT0hBcXI4dWNwbTJLMW5IM1J3?=
 =?utf-8?B?ako1V21xOEIzY2lrWG00WDYvaXJ4TnhLa3pqNXlXazdjRzdEMHFTZHV0VWx1?=
 =?utf-8?B?dnVaNFZyYTNvTStKOGtYTjlvM2h3dVFxZy9laGlIaXVQWEF3cExzbzVTUHNL?=
 =?utf-8?B?UlYrVkNpS1VYWVlqZXBSeENjaHlQNjhBd3RrRmU1dGJQSWJ5UkJrRVVPeXJL?=
 =?utf-8?B?ejJGRUZPUEY3U0hoNG1MaUc3YVd2OE5yRE4rTEUxMW1vdzZnV3ZsNXVwYnRn?=
 =?utf-8?B?UVV6ZlZIcmRLWWtGWFZaU0Y4eVFqS1FxK1A1bzRzWGJhZUlSOUdsOWg1ODdi?=
 =?utf-8?B?RU00TTJabTluK0JGUGw3TFdNV0o4S0pJR0VRaFVBb2tlTHZ0RXZSQU05L09a?=
 =?utf-8?B?bVVGVk1zSyszTjBoZmJGdUc5dlJQazh0bmxBMFN4d2tlL0RRQTdUOWJQeW8r?=
 =?utf-8?B?dlNvbkVZdzZSOER5UlpHajhNajNTQXZZNXV4cVFnV25JMndLSmhhWHlSMDFw?=
 =?utf-8?B?cHBhajkwUWJwQi9NUkJpalJPalh4MCtuWXl5T094bXRZcnpJZHBrSFpjNGR6?=
 =?utf-8?B?Z2xaV1VibkpCWVBzaFdWbzdnYnp0R3NkRFlVa2hxck1LUWxHZEk5ZjVrVVhR?=
 =?utf-8?B?NjFLV3dkUTFYUURKaFEraHZwbkNuS3E3Y0Z0OXNwRXRSMUxqTGgvSjBzeFFC?=
 =?utf-8?B?WS9WS1A2eFJDLzVhaWJkMmNYM2Y5azdkQTF6MmRnWTdrRy8zS0c4RDNZak8x?=
 =?utf-8?B?VHE4YlQ4T0lsT090dHcxaE9ZRG9BUUIramtKT3RuV3lvTXJ0dG53aE5DT2RL?=
 =?utf-8?B?TkJoTitHd1p0Y0Z2YmJBZWg5WVAvbWw0ZmVEU0FBU0lsR20vMUkvaTBURG1n?=
 =?utf-8?B?WURlVGxuR0dIUDd4dHZDQTNoSDVkcWUyT2xTeTB5dEpRVjFkalc5TitBc0du?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39431527-6364-43ac-3367-08dde58f5932
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:29:59.7848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqQNfT0GKnu5XGoh9N3AqPs+WIamKXJ7bKnYR/SRCGFuDJhhWejm1c5bmzEwAaFBg9h/fX65/nvD3tiCZv5KDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
> Introduce arch_perf_sample__fprintf_synth_evt to add support for
> printing arch specific synth event details. The process_event()
> function in "builtin-script.c" invokes perf_sample__fprintf_synth() for
> displaying PERF_TYPE_SYNTH type events.
> 
>    if (attr->type == PERF_TYPE_SYNTH && PRINT_FIELD(SYNTH))
>    	perf_sample__fprintf_synth(sample, evsel, fp);
> 
> perf_sample__fprintf_synth() process the sample depending on the value
> in evsel->core.attr.config . Currently all the arch specific callbacks
> perf_sample__fprintf_synth* are part of "builtin-script.c" itself.
> Example: perf_sample__fprintf_synth_ptwrite,
> perf_sample__fprintf_synth_mwait etc. This will need adding arch
> specific details in builtin-script.c for any new perf_synth_id events.
> 
> Introduce arch_perf_sample__fprintf_synth_evt() and invoke this as
> default callback for perf_sample__fprintf_synth(). This way, arch
> specific code can handle processing the details.

A default callback is not needed.

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/builtin-script.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index d9fbdcf72f25..eff584735980 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -2003,6 +2003,12 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
>  	return len + perf_sample__fprintf_pt_spacing(len, fp);
>  }
>  
> +static void arch_perf_sample__fprintf_synth_evt(struct perf_sample *data __maybe_unused,
> +		 FILE *fp __maybe_unused, u64 config __maybe_unused)
> +{
> +	return;
> +}
> +
>  static int perf_sample__fprintf_synth(struct perf_sample *sample,
>  				      struct evsel *evsel, FILE *fp)
>  {
> @@ -2026,6 +2032,7 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
>  	case PERF_SYNTH_INTEL_IFLAG_CHG:
>  		return perf_sample__fprintf_synth_iflag_chg(sample, fp);
>  	default:

Should just add something like:

	case PERF_SYNTH_POWERPC_VPA_DTL:
		return perf_sample__fprintf_synth_vpadtl(sample, fp);

> +		arch_perf_sample__fprintf_synth_evt(sample, fp, evsel->core.attr.config);
>  		break;
>  	}
>  


