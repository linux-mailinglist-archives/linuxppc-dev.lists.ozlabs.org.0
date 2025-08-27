Return-Path: <linuxppc-dev+bounces-11387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19268B388A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs380M09z305n;
	Thu, 28 Aug 2025 03:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315763;
	cv=fail; b=UsQ1QotnRVNsh1xUqUSINo3hzOAVsymrhg6t+cvVPYMpqm8+xAbxkrpKWrOsfJAOUO7JnhdJsYas8R0fDq5lBXCd+b5U840CSB8QNqoxyGCTtRRPKm+DZUs58V+AMRuQeHtKLyFBHbnskVqItLegFvSub01t5bv2FZMhI3awFIwQ5W4Loc5SnDT6jco/KcN2vhKzFM0LbBL0L2n2LGdy+qAbVTANxCF6dYZcMLdhFCkDhUON3LTm5W/WJNfbtPXFZT82IIgjMnbbX0QgoqVkU681HB/3e32bmjMcQcoaHzp8UBIwpCMyN2p+kT3f4WlK1HXizGK88/TVeUuGPhfhmA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315763; c=relaxed/relaxed;
	bh=P9Un1xHuAFzP1rJC47hxruRpN5pGtud9F9YrIVXU2WE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d5qm9RN8/29OEbSj3RHWMUMIADnpXz7nl/Bmpp6cNdVJX9RTGJ5vYv36lyYwn5/HpEsJVbu1jqMpPl+vOkNBbdKB6oHpi/rV6wMCffY+Od82w4YgV59iCHG5QoTvp9Uhu51H6x8h/hGMpoSFvIfSxkk99jYPTGj9rln5J5KpnywZ5CatYd8pZI8LEh3AA3+I8Z41SXJnm6W0kd6r8c+YalRyEtyA/L+bLqOzeqR5wuX4gUQq2F+y2SDOPqu56ocjXmSa8XPcxjlPvNVoKJTA0pOnKMoQb2+G7VWMEX/1Y45hcZOZDy42PR0gTEheRgThPKMKMe51yiJn9J2CP3K3xA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fITVI5uU; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fITVI5uU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs352QLZz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:29:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315762; x=1787851762;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6CfFqTvh5fOPbghJP8BiJKvKzSKbl86xfu7di64d54M=;
  b=fITVI5uUMZHfaKmbMtuZ3gBPrbfQonrtL7GObuwL3HLhrS9Sb2a6nPI9
   i2JliCu940Y8bz2odgZyRRxhlvITGH++OR6WOD7J2mmRZ7GexplQA8H9j
   +Ou8LeXQ5csW31HYKD7JqrHKxvl1zsdBVOhbapsPdrYUluPui17JxV7HZ
   uF63XQobqKm7LcbSAcmcdb8WHtjXX1+X2Ffxh7JUFjRTHiznSN+WUR6wM
   d5sGv9oco2ixrs9iePBdy8MSiPEood//5k82GHz+Ppgu8O/Fya7vexgt9
   ZRC8tUhwUbkmtoWU7n2JrR2n1/nUQBZeHUWbPPEdTAcNQizJ5I+NaZXQT
   Q==;
X-CSE-ConnectionGUID: AqC8s3QpTemX8DGKXxfh4w==
X-CSE-MsgGUID: TbeUAzPqQkyJMEmaQbLv1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76024177"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="76024177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:29:19 -0700
X-CSE-ConnectionGUID: kTVdnc1eQ1qlmLD+KHPDjQ==
X-CSE-MsgGUID: RN0eOnnxRU6cW7pyWECa6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169801340"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:29:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:29:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:29:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:29:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epmEmRRbNXDUxTIsYt4sGt0VB2GjUWx9rtXYnKn7l3Km9hQvESV6fFOYy4K3PTAkluia7G7jBAm8hp3rNQZU4ACBhFfsz47halBn1nmfYY46m5cT514nZM4in5H30PIG5RJuasWt8KZ+B1npgfo8t0QdPmiBrlBXOJj5pN7SkyPoM13ehCIvSgEHASxO7tk0SYWBpL3D/4+LyjF1qemRopNQRBHyXzxdT8uGrtv2e25d1WnziiCUR7v6yC/SCktNT5E86bQ9Kzrg2kDVH0+lp1I9MC0l6z6cotjJL1IQyNxibY06p5V4FmvsWP2nGU+TSB4rLTGjnp77xmT4ouKMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Un1xHuAFzP1rJC47hxruRpN5pGtud9F9YrIVXU2WE=;
 b=i+D559knplc9MRRPs8LaMzdpma2gOt9BrBT3reQlYZ/koiNXJd9C1PeHz7iOiFOxCJ3ZV/XerNdE4o8o4QC6WHlrHdICGwIH/7NliKA7Sf60GCzbX55c7+foWTUEa51J06iXOaWmtaucy4pAVWgrD0GKQEQlo+qHoeV4/J6BCcXdgMXA8QS8F+BraOt2qllPMXDI2zSMm/l6G/tR+NpUXKahWDMihqso+VSCZK9iUkkWtVz9/aH78ee8c4rqwu1lgtYYGH2qS7s0vkDUUM4Ty+GIfMawK3fj7TCTZ6pZ62OQYqL8RusLY95LtaIAoLXCis5YMhN61HT91XmmEvMx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:29:16 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:29:15 +0000
Message-ID: <c218a7c8-ca8d-4551-a267-86582060f3a1@intel.com>
Date: Wed, 27 Aug 2025 20:29:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] tools/perf: Allocate and setup aux buffer queue to
 help co-relate with other events across CPU's
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-11-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-11-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0055.eurprd06.prod.outlook.com
 (2603:10a6:10:120::29) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c7dc6113-771b-4db5-36bc-08dde58f3ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUlOeHBqT1A1V2h0bVpPK0N6eW8vaDltdzNMT2pZTUNFZjFIS0xHOFNkdzh2?=
 =?utf-8?B?ZjVmWXZkL21JRjFwZ2VibEtHeHo3WFIzYnF2VWdTL3JCdVJqeVNoeUYwR01F?=
 =?utf-8?B?T1Q1cU9sV0xWc2w1OWdMb0FaQ1dxcFQ4NmY4WXh4Ui9Jc0lYbzN5R3VmdmhH?=
 =?utf-8?B?cWpZZGZSaDlEMXB0cTgxRTZ6Y2Rtc2c4WTg5dW9yNFY3eGdZa0s4c1lIZzg4?=
 =?utf-8?B?YS9FT0NSaGw1MC9lcXNSYmpsN1RBek9xSlAzUEdWMW5RSGFNTWorSFJwbWxl?=
 =?utf-8?B?YUxuWTFIMUFZYU8yQXFhdURISkk5UXJzMkRpZEhDaFZUZlFaN0VqWkxkUlZK?=
 =?utf-8?B?RHBQSmZZN1FpL2JTNEVoYm1BT2kwek43L2lmSTlzYVZqK1U2U0JjNVI3SDVm?=
 =?utf-8?B?NDZ3V0tWQjV1R3VHVy93Sk9yMHpRRC94K2tYMzZ6WTNrVzF6cE1JSEpRL050?=
 =?utf-8?B?T1dOdFdRUnUwTkxXeHdSeWxwRmdONHhPSFZjL3FNQmZoTTYxbk5HZzBlNVN4?=
 =?utf-8?B?MEQyU1RCRjNNaE5mVnJYYzhrU3BpWlRjQm1hVU9rOVR4Sk4zR1dZTHIwR01F?=
 =?utf-8?B?cW9qWk9aaklKS25lSW1mbjVBRFJwNWJSWHhaOFQ0M01hZHJFUm9zQUFSdEtv?=
 =?utf-8?B?NDgvdG41bE1CVHFTSHQvdHQrb0sreVdJbWNNTnhUZzg2dHFDaEdzTVRTc1pn?=
 =?utf-8?B?TzQxNkthdG9qMmNFTk5adU9pZGlyTG5lUG9JTHhtVXFMdElxc0dIV3lWcU9Y?=
 =?utf-8?B?YnNRMFN4YlphTXBRSG10OGpkbWZEdVVDVGlubXZtdVRRK0JsQTU2WjRrM3hM?=
 =?utf-8?B?L0ZKMjI5MXBzUjlzOU9zcVhxaWpVQ1VRamhzZDYyaXdaYnB5aTdCZ1EwN05C?=
 =?utf-8?B?UVB1YnVVOWxZUzJpSSt4b2pMRG54VUI3bmF1azdCMjF0L3Bkc2xNV2ZNSGNi?=
 =?utf-8?B?Q0drRTdxMk5nbVB3a3FISHBIQkwrRFUxVnBvTmZBalZ4YmdORkE0ZnVpbkF5?=
 =?utf-8?B?cjNtVENPUmZ1K2RDOVRDVmJldmtaYy9BcDZ4czBLOWRNcUZtK2FaWGJud3FH?=
 =?utf-8?B?ZzF4Vk1MdWV2dGgvRHowdzgySnlFS0F1Z1EvUTdHQitTVGVVVTNZQnpobVRr?=
 =?utf-8?B?OWxoQndES0licXF3S1p6ejJSSTRua0pjVTJyVllxQmNxWW50b2ljWTlHVkVY?=
 =?utf-8?B?dGo1SndReUZTN2d0ZzVVYXdRTlRGUUY0Szd4UCs4dlFldEVZZ0JNdmgxNjRW?=
 =?utf-8?B?YjJwelBGb3dyR1JmZHVKTTJERC9YNXRTOSt6cHdScUlZMUttbWxzemlaaWZs?=
 =?utf-8?B?SXgwM3A3UzdOYVhkc2xWNW05bWo3TkNBZUNRUkM4YlFvcWIzMWRhYjdaUFdW?=
 =?utf-8?B?Zm5YYU9tU284V3hsam1mL0RKRFh3TUVxOXlhTHR4aDlvM2ZrZWF6LzdnY1pp?=
 =?utf-8?B?enYrWnpveUZoc0dwL1BsZGJ0NjB6Ti9qQ2xsVHVjVUh2WDFJZ24zOS9lekly?=
 =?utf-8?B?Y0NUWnIxM0xlakY1WHJKVVplaGZhcEgwR054RStHSVhrTUduVS8xb0tzaUFS?=
 =?utf-8?B?aWl5cjVuWGZSZllqWXBBc0VlNkkrSEg3NCs2RkdVeTdwanhXTWV4NEd0eGdo?=
 =?utf-8?B?RENDUnRyN0JmZ3FQcGdPZ1lwVVMvcWtIamlDTzJHZWRXTnplL1lmK0hPTGEw?=
 =?utf-8?B?YU9qcnp1VXBoVmpEeFdPbitFVmQ3dmx0eGJRZUh4Ukd2cHpxbmplRkV4TGEr?=
 =?utf-8?B?ZERVb21VSlZ4TXlab3huazZKdGRXT0NRN2taR0V2Q0d2WlA5R3BLUytFTGVY?=
 =?utf-8?B?RER2eFhPVFdpQVM4Yjlic29DbSt0bVJZWXd1dGlVbTBGZFdTajkxN1M1NUV4?=
 =?utf-8?B?UW9iREVib21qOGdaMUhuZ01FY1h4eGlMbUVieEJ2Vm1yL2NxNzV2eEw3TG5U?=
 =?utf-8?Q?AOJPdPg8LIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDN3ZzhFYzFsUmloZGVoZW9iY2paTEk2c3UxQnduNjVKUnlUeFR5TXFoQ1NN?=
 =?utf-8?B?OVFjZlNKc2VIN3ZYWmU1c01kWGxvbjJ4azlwNGlFRkpqVW8wOHBYbXJSbFJY?=
 =?utf-8?B?ZHZQMGlQS1hTRUd5QnRQd0p0NndINUUzeGlzZDFUOGpicVJmNGFnRzVodXhC?=
 =?utf-8?B?MC94TkRqa0RCNTI2RTZDOWJQa1hPVk9hUkJGY1FjTnJjZ29tcjBydkJheHFB?=
 =?utf-8?B?SUFRa0R0R2pvQ3M5bk9HU2ZTSW1YN0RlRmdPN0tDeWJrclhXaEE3aWRuT01Z?=
 =?utf-8?B?WEhUWVR3aTZQM0pVOEZZRUJXaHFra2xZUFRuTld1TmpHK0dISENtQlJDMWdJ?=
 =?utf-8?B?TUVLR28zeVhMaTFOZ0ZpM3kwK000MGNUQUJkSGNsQ0pPRGZMdDdOYzdPbnJt?=
 =?utf-8?B?cVpqMEpMNGVFREtFQVBUdnZpNFkvSG8xZ09tQTc1cEl3dUhxdnRoZGErRUFr?=
 =?utf-8?B?dVYzbkNmVjdoNkhROWhqV0RMcjdJYU5qdTNWRU9OazJVSEp0bmpJTStXNXFF?=
 =?utf-8?B?T041cjFldzR6amg3cHVtUEZFeFFhdTF0R2hvaXZqcGVuZzFZS2ZUUmV1WFcr?=
 =?utf-8?B?L092UlpNejYwSFdNajROaUZUVTFNeUJQSEZtS3NvQUtLQVpSMm1FUGNHekJ4?=
 =?utf-8?B?d0dnRjVBTkdXREVpa3phWGRlY3hxYWw0SlkxQ3hCdDdTY1lkU2NtVXppdk1q?=
 =?utf-8?B?Sm5zZno0R3pKNFVPU1dhZnkrSUQxYjdqdG1KSGtyZnhCc0VkdzNOa1piK1hD?=
 =?utf-8?B?Z0VsUGNkRWxaSzR1UUFkUEphMU9wUGtkQUQ5Qm5uRVZCYm1BZ2lVcUF0dmpJ?=
 =?utf-8?B?SWJPQnlHSWo5bEZzc2NqRHAweWVaQU4va0toazlWaEhTQ2VEamZmaFZ2bnVJ?=
 =?utf-8?B?Ym1QU3B3STYxNXBPLzVkR2E1NWhzMjJ0S2I3bEhZWTAyeVY1a0xTeC9wRUJ4?=
 =?utf-8?B?VXV6alhYWjhZKzJTTU1lRExTS1puYmI1ZERhVzFJUU5jMW5JMHZSeGtZL2RQ?=
 =?utf-8?B?YkYxLy9PMnlJMkQ5T2lxT2dXSjBPRTVvOE1KMWJoczVWWFpjWEk4RTlQZ3ZX?=
 =?utf-8?B?VGF1dVJhTGFmS2VpTXVtOE9WVEdTcWMxbmY2Tmx4MDZBQnVSMEkwWTFHaEJL?=
 =?utf-8?B?d2daaWFjcU02VStEeVpTUjZkOExpZVV6OC96eFNZNXpCTk9xcXhBazZYeDBT?=
 =?utf-8?B?aEt1NG9Db0ZwQTZBNElGMlp3eHVjQUROL0tqbkxiQlpoNmVnMjRGQ0YxSWNu?=
 =?utf-8?B?c3I5V3g4K1BIbEFRSTZGSHYzZEFLNC9SNlBVazlVb2FTSTZsZm9QYXZVQ2Rm?=
 =?utf-8?B?L1RScS9GZEtneWhiTWlCUW1oRHcySytSS3o5R21GZlA0YWx2RG5DbGxROG1U?=
 =?utf-8?B?UTdkRllLVnVBM0F4d3ZlOEhuai9Fb1k2UmJtcjdaWTMyZ0hnaW5Ya3NsK0xD?=
 =?utf-8?B?dVVmWkxqN1Z6ZzYwOGF2Qi96d2hHU3VyQms1dUR0RW92aU9aajVZcDhrTk1G?=
 =?utf-8?B?dWFmbTgwV1hmQVNWZGMralFVL3B2NHlRUmtkVmo5cU5iQk81WXhCcWVEYk9S?=
 =?utf-8?B?ZnFyenNlWHkxb3NiTGF1dmJ1K2RtVWRQbzBKV1RmeUxIdkhweDdhYndKYnFU?=
 =?utf-8?B?bm5NeWEvTmthZVZCa1IwSnlxUmFiUnp1TGNVOG4rWjErYjU4b1lzd0xzS0J5?=
 =?utf-8?B?cFdLcjIrZWluZi9pVWx1OFByTDAreUdyYWttN2NOYjE5dWlKbi9tR3Zacmhk?=
 =?utf-8?B?ZWRQOGVpT29ueDlMam5BNDNzbC8xbEdyejdjY0JLdHlWdkJZczhIWHBJZ0Y4?=
 =?utf-8?B?RnZibGw3Mm43L1lpa1hpRWk4KzFHTUZLZHlZNXNwL29BM0NkRC9TcVB3VW4r?=
 =?utf-8?B?Vlk1WGNQZ2Z5M2RjUytoaWNhNGlyckpwT01mVmZ1cHYyNXEvd2FTOUdvbzJB?=
 =?utf-8?B?ZGdNUnRFWVFqVWZFd0pqWk10SEMrcFg0cElQc1o1SGRWbUFqV3p4ZEhnKzVE?=
 =?utf-8?B?eHZlaVRoUzZ0Rkp4a2Y1TGhQcWFKbUVUc1hCRlVUNFZvYnFCbEhZbmNDM21x?=
 =?utf-8?B?c283c1pTTFJFY0ozY1lOVmtGa2lQSWwyeDRDNmROek0vU0NZcGhCK1N0Q0NE?=
 =?utf-8?B?VUtidVdEU0d6Ull1N1RhYnRHTUlSazJvNldacnY3dDFHRkdGaXJRK05TcC8y?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dc6113-771b-4db5-36bc-08dde58f3ed0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:29:15.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdags+pBgw6dFOEKGPHLgBL/bmPM18jIZzEeLvNrzZlHAtVYHze5IaWHLrkyITB1NNie5pnELAOH+olZNEBQ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
> When the Dispatch Trace Log data is collected along with other events
> like sched tracepoint events, it needs to be correlated and present
> interleaved along with these events. Perf events can be collected
> parallely across the CPUs. Hence it needs to be ensured events/dtl
> entries are processed in timestamp order.
> 
> An auxtrace_queue is created for each CPU. Data within each queue is in
> increasing order of timestamp. Each auxtrace queue has a array/list of
> auxtrace buffers. When processing the auxtrace buffer, the data is
> mmapp'ed. All auxtrace queues is maintained in auxtrace heap. Each queue
> has a queue number and a timestamp. The queues are sorted/added to head
> based on the time stamp. So always the lowest timestamp (entries to be
> processed first) is on top of the heap.
> 
> The auxtrace queue needs to be allocated and heap needs to be populated
> in the sorted order of timestamp. The queue needs to be filled with data
> only once via powerpc_vpadtl__update_queues() function.
> powerpc_vpadtl__setup_queues() iterates through all the entries to
> allocate and setup the auxtrace queue. To add to auxtrace heap, it is
> required to fetch the timebase of first entry for each of the queue.
> 
> The first entry in the queue for VPA DTL PMU has the boot timebase,
> frequency details which are needed to get timestamp which is required to
> correlate with other events. The very next entry is the actual trace data
> that provides timestamp for occurrence of DTL event. Formula used to get
> the timestamp from dtl entry is:
> 
> ((timbase from DTL entry - boot time) / frequency) * 1000000000
> 
> powerpc_vpadtl_decode() adds the boot time and frequency as part of
> powerpc_vpadtl_queue structure so that it can be reused. Each of the
> dtl_entry is of 48 bytes size. Sometimes it could happen that one buffer
> is only partially processed (if the timestamp of occurrence of another
> event is more than currently processed element in queue, it will move on
> to next event). Inorder to keep track of position of buffer, additional

Inorder -> In order

> fields is added to powerpc_vpadtl_queue structure.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/util/powerpc-vpadtl.c | 219 ++++++++++++++++++++++++++++++-
>  1 file changed, 218 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 36c02821cf0a..299927901c9d 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -28,6 +28,7 @@
>  #include "map.h"
>  #include "symbol_conf.h"
>  #include "symbol.h"
> +#include "tool.h"
>  
>  /*
>   * The DTL entries are of below format
> @@ -72,6 +73,14 @@ struct powerpc_vpadtl_queue {
>  	struct auxtrace_buffer	*buffer;
>  	struct thread		*thread;
>  	bool			on_heap;
> +	struct dtl_entry	*dtl;
> +	u64			timestamp;
> +	unsigned long		pkt_len;
> +	unsigned long		buf_len;
> +	u64			boot_tb;
> +	u64			tb_freq;
> +	unsigned int		tb_buffer;
> +	unsigned int		size;
>  	bool			done;
>  	pid_t			pid;
>  	pid_t			tid;
> @@ -151,12 +160,217 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
>  	powerpc_vpadtl_dump(vpa, buf, len);
>  }
>  
> +static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	struct auxtrace_buffer *buffer = vpaq->buffer;
> +	struct auxtrace_queues *queues = &vpaq->vpa->queues;
> +	struct auxtrace_queue *queue;
> +
> +	queue = &queues->queue_array[vpaq->queue_nr];
> +	buffer = auxtrace_buffer__next(queue, buffer);
> +
> +	if (!buffer)
> +		return 0;
> +
> +	vpaq->buffer = buffer;
> +	vpaq->size = buffer->size;
> +
> +	/* If the aux_buffer doesn't have data associated, try to load it */
> +	if (!buffer->data) {
> +		/* get the file desc associated with the perf data file */
> +		int fd = perf_data__fd(vpaq->vpa->session->data);
> +
> +		buffer->data = auxtrace_buffer__get_data(buffer, fd);
> +		if (!buffer->data)
> +			return -ENOMEM;
> +	}
> +
> +	vpaq->buf_len = buffer->size;
> +
> +	if (buffer->size % dtl_entry_size)
> +		vpaq->buf_len = buffer->size - (buffer->size % dtl_entry_size);
> +
> +	if (vpaq->tb_buffer != buffer->buffer_nr) {
> +		vpaq->pkt_len = 0;
> +		vpaq->tb_buffer = 0;
> +	}
> +
> +	return 1;
> +}
> +
> +/*
> + * The first entry in the queue for VPA DTL PMU has the boot timebase,
> + * frequency details which are needed to get timestamp which is required to
> + * correlate with other events. Save the boot_tb and tb_freq as part of
> + * powerpc_vpadtl_queue. The very next entry is the actual trace data to
> + * be returned.
> + */
> +static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	int ret;
> +	char *buf;
> +	struct boottb_freq *boottb;
> +
> +	ret = powerpc_vpadtl_get_buffer(vpaq);
> +	if (ret <= 0)
> +		return ret;
> +
> +	boottb = (struct boottb_freq *)vpaq->buffer->data;
> +	if (boottb->timebase == 0) {
> +		vpaq->boot_tb = boottb->boot_tb;
> +		vpaq->tb_freq = boottb->tb_freq;
> +		vpaq->pkt_len += dtl_entry_size;
> +	}
> +
> +	buf = vpaq->buffer->data;
> +	buf += vpaq->pkt_len;
> +	vpaq->dtl = (struct dtl_entry *)buf;
> +
> +	vpaq->tb_buffer = vpaq->buffer->buffer_nr;
> +	vpaq->buffer = NULL;
> +	vpaq->buf_len = 0;
> +
> +	return 1;
> +}
> +
> +static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
> +						unsigned int queue_nr)
> +{
> +	struct powerpc_vpadtl_queue *vpaq;
> +
> +	vpaq = zalloc(sizeof(*vpaq));
> +	if (!vpaq)
> +		return NULL;
> +
> +	vpaq->vpa = vpa;
> +	vpaq->queue_nr = queue_nr;
> +
> +	return vpaq;
> +}
> +
> +/*
> + * When the Dispatch Trace Log data is collected along with other events
> + * like sched tracepoint events, it needs to be correlated and present
> + * interleaved along with these events. Perf events can be collected
> + * parallely across the CPUs.
> + *
> + * An auxtrace_queue is created for each CPU. Data within each queue is in
> + * increasing order of timestamp. Allocate and setup auxtrace queues here.
> + * All auxtrace queues is maintained in auxtrace heap in the increasing order
> + * of timestamp. So always the lowest timestamp (entries to be processed first)
> + * is on top of the heap.
> + *
> + * To add to auxtrace heap, fetch the timestamp from first DTL entry
> + * for each of the queue.
> + */
> +static int powerpc_vpadtl__setup_queue(struct powerpc_vpadtl *vpa,
> +		struct auxtrace_queue *queue,
> +		unsigned int queue_nr)
> +{
> +	struct powerpc_vpadtl_queue *vpaq = queue->priv;
> +	struct dtl_entry *record;
> +	double result, div;
> +	double boot_freq;
> +	unsigned long long boot_tb;
> +	unsigned long long diff;
> +	unsigned long long save = 0;
> +
> +	if (list_empty(&queue->head) || vpaq)
> +		return 0;
> +
> +	vpaq = powerpc_vpadtl__alloc_queue(vpa, queue_nr);
> +	if (!vpaq)
> +		return -ENOMEM;
> +
> +	queue->priv = vpaq;
> +
> +	if (queue->cpu != -1)
> +		vpaq->cpu = queue->cpu;
> +
> +	if (!vpaq->on_heap) {
> +		int ret;
> +retry:
> +		ret = powerpc_vpadtl_decode(vpaq);
> +		if (!ret)
> +			return 0;
> +
> +		if (ret < 0)
> +			goto retry;
> +
> +		record = vpaq->dtl;
> +		/*
> +		 * Formula used to get timestamp that can be co-related with
> +		 * other perf events:
> +		 * ((timbase from DTL entry - boot time) / frequency) * 1000000000
> +		 */
> +		if (record->timebase) {
> +			boot_tb = vpaq->boot_tb;
> +			boot_freq = vpaq->tb_freq;
> +			diff = be64_to_cpu(record->timebase) - boot_tb;
> +			div = diff / boot_freq;
> +			result = div;
> +			result = result * 1000000000;
> +			save = result;

It would be nicer for the time calculation to be in a separate function.
Also 'save' is an odd choice of variable name for a timestamp.


> +		}
> +
> +		vpaq->timestamp = save;
> +		ret = auxtrace_heap__add(&vpa->heap, queue_nr, vpaq->timestamp);
> +		if (ret)
> +			return ret;
> +		vpaq->on_heap = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static int powerpc_vpadtl__setup_queues(struct powerpc_vpadtl *vpa)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < vpa->queues.nr_queues; i++) {
> +		ret = powerpc_vpadtl__setup_queue(vpa, &vpa->queues.queue_array[i], i);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int powerpc_vpadtl__update_queues(struct powerpc_vpadtl *vpa)
> +{
> +	if (vpa->queues.new_data) {
> +		vpa->queues.new_data = false;
> +		return powerpc_vpadtl__setup_queues(vpa);
> +	}
> +
> +	return 0;
> +}
> +
>  static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unused,
>  				 union perf_event *event __maybe_unused,
>  				 struct perf_sample *sample __maybe_unused,
>  				 const struct perf_tool *tool __maybe_unused)

tool, sample and session are not __maybe_unused

>  {
> -	return 0;
> +	int err = 0;
> +	struct powerpc_vpadtl *vpa = container_of(session->auxtrace,
> +			struct powerpc_vpadtl, auxtrace);

Arranging local variable declarations in order of descending line
length is often more readable

	struct powerpc_vpadtl *vpa = session_to_vpa(session);
	int err = 0;

> +
> +	if (dump_trace)
> +		return 0;
> +
> +	if (!tool->ordered_events) {
> +		pr_err("VPA requires ordered events\n");
> +		return -EINVAL;
> +	}
> +
> +	if (sample->time) {
> +		err = powerpc_vpadtl__update_queues(vpa);
> +		if (err)
> +			return err;
> +	}
> +
> +	return err;
>  }
>  
>  /*
> @@ -181,6 +395,9 @@ static int powerpc_vpadtl_process_auxtrace_event(struct perf_session *session,
>  			return -errno;
>  	}
>  
> +	if (!dump_trace)
> +		return 0;

See comment about auxtrace_queues__add_event() in patch 8.

> +
>  	err = auxtrace_queues__add_event(&vpa->queues, session, event,
>  					 data_offset, &buffer);
>  	if (err)


