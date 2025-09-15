Return-Path: <linuxppc-dev+bounces-12236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0DB57FFC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQT2T2rwzz3drk;
	Tue, 16 Sep 2025 01:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757948945;
	cv=fail; b=XOaH5A1EbRVVCvqQZpyORaUO/cw1s8JRXd8Gp0qOKYThI8ards5BRlSYq8yiZejQqEhsaomhELASso3ivedresTzS8Q2nGTqEFc8dzqgtexdvo9U7MPkoLABirCA1R7kk7YmKwv4Vm78fDesTkrXX6RXbmOHboTzYKhnKX9rRrJpvs3AgJc4pZwO0V1Ahj6MjjhNNTRLVq+mXWFAwfUWNRPkO1DK+ytLZmnyYKcrZwe3ws6pvxp6Z9f+610uSFDLieYlBAuZwd24ADC6VTrHgKg7b78Hk9H3KAbMRquPvDSIZsXQ1XSXeRnp9HIqH5KX0mijERBuMjSZBPCUrTq+hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757948945; c=relaxed/relaxed;
	bh=5puBiGxGTguj1mzo/NiPg5TPUtOGtQZlstVFKLGcpiM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gej6PHVxH2iMUPZmEJvStTWPy8L2n8gtA8HUyIfv2IvjSTpeeER791RP5l29f/6vRPZ3kEq/R0+bsH/eUoorDCElfKlBUi9H6SojOvdxnAe623ZuTNJ0A5rxa755cvmikEbi76UrKDuC+CoouJI7aKlFfKl1VCaSUWYZpqcHrX3asly2xx5DVWX4Leo4jJAtCkM0HTdj+iZIag7e9WhrbmVUeZV+Kj3aiAFdmmb8StewXNQps6CnumU7zdiVocerZR2kASXJnRG3SLa/9jG0zZaBIkTfdMM6/I1Xk4oXGG6i9UQ+n6256iNk7kJb3gXokYP9pUsmlUBYGeFgI3xb2w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFyC1awh; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JFyC1awh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQT2S06wnz3dlY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948944; x=1789484944;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KBhli3vgosZg8znayRsE2nlrOqtN5LUJ5KDTJhg4ozE=;
  b=JFyC1awhIj4ogBC4zXbVAkI1ee+woSWdxy2b/aOP4oR7Ci3sPotT8Fhd
   0dA43jkAxgPROZ1PivFJlmUL7nU3TKysn3ep4hvyPylm+r5rO30rGtWFG
   EUo9b1MT+bClsTmiUDe6LF8GDvsqnF2tyHbknuoemp88wiZ72l3Dsatp8
   Wdd6nJmSMN9FbOliEAqwyS/o6nnUTwTPM4KfgiFBCdzksLcmeQX7FJzIy
   tjTqzibP2h48hLBxFGBrFl4HB02V8nlOJN64rbhMoifPxVwnbDtdbfZDU
   dCt9A4/84JGNmSODQYEZj+x+Os0KVzX6zsAe6miE61RRBu9KoOKZBjU91
   g==;
X-CSE-ConnectionGUID: yO2rFpLpROqOp+/AN7dk9Q==
X-CSE-MsgGUID: kQv0w6dDTAyUSOI9j9I0Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85642892"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="85642892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:09:02 -0700
X-CSE-ConnectionGUID: C2747jBDQjeIOah+QYdbog==
X-CSE-MsgGUID: VCrSu0d8SpC45ttzkff6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="211839166"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:09:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:09:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:09:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUsiWT/o1j/MH97gqPe36qlooeiZVpRVozE6LyDA4xVVSgCNTHCz80FR1gUjVmF2ZzEubvETuKotLmYTBGM86gT6/JM07Ciw8XVabiirNCf7dKtMO8xuNE0AW5cv02n/WKID8xBGmj0g36AIOGqM3kMB1CGJ+HeV4zrDBuxOGY322Z9U6IFEKVpEyBO9Zf65kqoKnMEql9GOqik5zC+ISkcnGRd8Ya1p5f49NSU12p5WVQuWPjuQH9/OVJEZ74FL5MfK4oJeeMqx6XFR/d6t7+H8JOPyYgTvMj8O4u+N9k56uMzpwM+G477JRpI6YpJrIAVTo7dmA5lW7eFGC436ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5puBiGxGTguj1mzo/NiPg5TPUtOGtQZlstVFKLGcpiM=;
 b=OZiB9QrUNvDODyIVqfwH/SbGMp6DrjVk3ERIP0oKsKN1u3OvA09Gg9WYY79AAXxLTh2Iipf8/g0OjjP5Asv7RkP+tW3o3u6t6J1Slq5ZStW9+gFuhTAI+Q8Dz6WCcQ/j3wh6dS/Jyr9ZUacYEfOpuMT/rr5y/hOfU6ge0cgtS4q3Pxh/vRgv7m0a3x1L3NCsLsAUOt0XvrJVNt8pUb00MSuzjr/1nVykJ6HFC4uCWLGtrsGWCU99uugX4ZmUjfnURmGLdtMKvG+3BxM6orku+S0pEcVoFatlQQ/CukuneX2vRNvTcOfbmAjy+uKMyI0ndI9qRXf+BqeniiTCnwjnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 15:08:53 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:08:53 +0000
Message-ID: <2a42efd8-d08d-4f37-a6e8-54de7c1f8b68@intel.com>
Date: Mon, 15 Sep 2025 18:08:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/6] tools/perf: Process the DTL entries in queue and
 deliver samples
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-6-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250915072754.99850-6-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: b29da61d-7563-41cd-8d49-08ddf469c889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0w5VDFYbVFBSWZFeU9Cb0dyMWpFaVV0aFd4UUFCUEpreWRScDlMKzgyYUJs?=
 =?utf-8?B?Tjk3ZzFXOEt2SmlzSzN2aU5YNko2dGJYU1RZVTQyTVhjWGdSZWdBdHVQN3dH?=
 =?utf-8?B?ak8wck1GVFg5ZmRhUlEwQWtneVFIbEhMd0d6YXdNSUowVmc3aXBOMGx0ZUR4?=
 =?utf-8?B?ZXNEMnZLMGk1S3orbHlkZ1NReWNRdG1xYktGSEZlMnRRR0lRcXczb2hXcHB6?=
 =?utf-8?B?c0NOWVJlQWVJZG4xR2o0czJLdzBoK0VhaEMwZ3AxOG1UWEtUdWZrOEtJK25C?=
 =?utf-8?B?bm5PeWJ1RTdhdSsyR2xGZkFCOFJoQk5vclYrcEFOTXR3NTBpYXlxTFE0NmJy?=
 =?utf-8?B?SUJMZTNISXRkWG1tL3IxZXJHVmNEejdQM1Y3YThsYkRSRVFHWm5kcHRsbHB6?=
 =?utf-8?B?ajZJZVR5QnJldlJ0V1VFSG5QTFZSTDdzbUJXNEduc0xPbjIxZkJIUVhZSW9H?=
 =?utf-8?B?T2xYbzVoVTVCRHVzekhwN0NndW1oTURCbTB3VXFZS01pYUc2TFFXbVRneXdH?=
 =?utf-8?B?clFpQ01DV2FvUUppYXlhK0pmMUI5VFBlZDFJcmRaQXRtYkJ2VTA2b2xhV2ZJ?=
 =?utf-8?B?UVoyT2N1b0I2V3RwaXZGZTN6aWcvOGR0VDVabUxBOWY2emFLOHNhazMyNlFJ?=
 =?utf-8?B?dW5HRzFOZmcwVnpHMjBZZlArL3VnSjVBaUpUdmVVanRzb2VCdmdKY2tQMFll?=
 =?utf-8?B?d3pDN0h1TFpxM0t1NTA5dEFuaVpCcENvbk5QeS9WWXJjeit1M3IydEF6enph?=
 =?utf-8?B?akY0N1B6T0NyVmlHaldIYm03d2pydmpOWnJiZHgyUUUxWVJUbkMwSmRzYVlw?=
 =?utf-8?B?dnpnd3lDdndjcHJqbldXMHBtekNleGlzWHFuMThsb1g3NUR0Ry84b052ajI3?=
 =?utf-8?B?MlRsaWNXdzZld2RmTkZySkxYOXBUaFpkakZWUVBPRHBmalg2YUxGS0h3TkJH?=
 =?utf-8?B?enl3WXRXVmNDQzM3S2ZDb2JDTUY1Z2lOc1g3cVVGc3dPbWE3eUFuYWplYTNE?=
 =?utf-8?B?T1pNYWU3YlJpdUJ2M1hlZ1Z4ZTZISGZJOG9sZDdFRlJkRmo1bDhXVjRaMU5H?=
 =?utf-8?B?YThtSmk2WHVBNVRIbVVsMEdmK2ppcStsTXFONDJYdDc5eVNhVU95T3A2RnRQ?=
 =?utf-8?B?Yk9sVVQ1VTE0eW1YK0RMK3EybmtlWU5oNTAvU1Z5M1J1UVNQTzJkRE12TTY5?=
 =?utf-8?B?ektOQXBXaXVXZDhBM0hMcUFzeVFuT2tMVGloaXFCVnd3dllkSTg5UFQzb3VJ?=
 =?utf-8?B?bjRuZHNLcDBZUm1aRlBjUXNlZnNyd2krSng4YVJwUndpUUVnV3AvQWhKbENM?=
 =?utf-8?B?YldXbFV6QjlHSm44RXFaRWh1cHhLNjg5dzQ2NXRYT0Uwa1JzYUJKU3RiV3Jw?=
 =?utf-8?B?UEo1WXdxUWxyR2tTSWdZUkpnQmhOZkhYeXgrdnovZXV1SGxPdllnWWs5dHJz?=
 =?utf-8?B?dmhESDZUbUt2MG00Mm9YNTRCRlBodHVNV0F2MEw2alVXaTE1VUVhQnNRTCsv?=
 =?utf-8?B?UGJKVXFPaktJdG5HRVVuajUwSGE1OXZtZXZmTC9NQXIwTkR4YzJaaUxEcEY5?=
 =?utf-8?B?TGVuRTYyK0U2Z1dsQXdTSFAyMFVTSHUzTytBVWl2eXRuKzlONTZrajJiYkgx?=
 =?utf-8?B?SXFOa0NJd3lOZzJYWjB1TVFVZ0pNOFFGMFBSUkZxeDdocmRzdUd0ZVg1SVAr?=
 =?utf-8?B?S1hqaEpmd050MGtvWDBFZ2srUkdIckIwMU42eWN2T1pZQzEvVFFyb2Q1QkxQ?=
 =?utf-8?B?ZWMyakRSY0x3cURZc0tncVlCdnNMQ2p2SWtsbWhhS2dEK0c2U0dUaEJYalk3?=
 =?utf-8?B?S0RRVGV6QVFDZzRxdzhRL3dYV0s3SDNueFhhM21jSFJuR3ltSjZkcjRtQWxw?=
 =?utf-8?B?dG5PNEQ1bEhsd2plcXBvbS96c3BpbHhCWHo3a0NxSTZvdktVN29pOHNYWFpZ?=
 =?utf-8?Q?sikkAK+TYeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEtxY1VWZGY5TjVhNURocWZQaW1YQy9lVE9pUVRCblNOUDgzQ2NRaWZ5b1dV?=
 =?utf-8?B?Y1VrWk9uV0xUUk1XTlZGWWhVZ3J5bDRFMjhOOFJhb1pTMU1Xdy9pVTZqdmw2?=
 =?utf-8?B?dHQ0TkdKelpwampoRktDNE0zT2NyTU8vcjZKY3ovNzg4MjBYbm9nQjE0bHdS?=
 =?utf-8?B?c2RXMUgwUVFnQmFwL015TUFiSVQ3VUNvSFhudGNHdjhjTlA3VTlVdk55bmpW?=
 =?utf-8?B?VTZGaTlZS1hGVnV0VndrNGRla2NQR0g1RWVDcXBuVjJ4ZjMrdUdUSEtsNnp1?=
 =?utf-8?B?d0kzRStMSks4MGZZdEUwbWRDR3NQMTA2M2t4VGh0L1VHWmdIL1kvbkJmbWIy?=
 =?utf-8?B?TzFHaFNuQThlVThGN3RPZWVIdUpRMlNVL0k2emVGdXlGWTJSTCt0SG5xZUpo?=
 =?utf-8?B?NDA5RHVxQ0lkaGRZUW5uWUM2OFhPL1JvcThLMm1ORXQ0cnYwWW9sbnZyQTI1?=
 =?utf-8?B?Z080L3FEVnB5QkhLcEdCeGliU21mRlhnVXhKVUtOaThaTVV3Z2dkYm4xZUov?=
 =?utf-8?B?YnZwV3RzT2NqT2tEUWRGRHE4d2p6ci9TQzVrc2wwNGJEc2hVTnhxNU5MUWRY?=
 =?utf-8?B?YlVXc3FxbHRvaXJsamYzcTFpVzZjUnAycDFLSWJndkorcVc0dnhWN2JZcFZW?=
 =?utf-8?B?QVlZSzRLZW0rN0Z3U1pxNldCSE1iTHdmU3hvWGNVOEhYbEhVSjBEengxWU1R?=
 =?utf-8?B?dk1pV2l0WDRKdCtVNmJteVNDVWt1aXp6ck9NQmxJMk5GUTE5RzBRdWQrWlR2?=
 =?utf-8?B?ZzBkakJVMjVnZ01EK0s4eFNvRDh4eU02WnI5Y1VqcTJBeVEwVUJNQkV2dldU?=
 =?utf-8?B?Y1ZpcXlUV1F4MWVFa0ZENkN1VmtFY0lrQmlISitnUHpjWEV2d1pNSE91V1ZW?=
 =?utf-8?B?L2QzK09mUlUvMEpmN3AwWGVOU2w3cmdUYUhoeW9rVFV4QkFOMzdXc0N3eDcy?=
 =?utf-8?B?VUJpeVc2YXYyVDRFUUd1TnprSTk0andNa2FyQmxieEE1cEtEOXhSRS9FYmtF?=
 =?utf-8?B?TjFrajY0U285YkZ3ajUzUlJEZDJFTHBIZ3MwVGlidlkvUmNYV0dwL29lT0JZ?=
 =?utf-8?B?R2dBTHZlQXo3MFArU3d6U3J1U3dleENkd0hkL05Yb0lOU0ZXZy9QUHBIQmRt?=
 =?utf-8?B?bHhWNGFYZWc1VTgzVzMwaEpkT21vNkRxMDNhQXIzRm81dzRWOXI1bENDenly?=
 =?utf-8?B?cm5TQ05JZVlZSS8wTmZRbXMzSG5tYWl2WGlHa29KWDRHYitBM3dzTldhbDM2?=
 =?utf-8?B?RmwvKzZtcmVKODBMeTV6WXNyaWlRZHBjRlRmdlQzNVJnLzlSL3lzbHVpVGpC?=
 =?utf-8?B?UXhvcFhpZGNEc2dlbmloeEJyZG5lYUlQa0tmaGQ0NThCOHUraWsyeXF4aVJH?=
 =?utf-8?B?dW5XU2NPZkpWSEdZSzJlcDlpV2VPNG1YRlRVU3BwN1BWelhuVlJJWmVldlhG?=
 =?utf-8?B?UzBJVTMrV1g3NnFSY3dMNE04OWhoczA3VXlSeisxSnF0QXRVN3hMd0ZvdkhU?=
 =?utf-8?B?aDY4Nmt2Slo5OWJKOGVLUytNQnhLekQ2L3JZUmtyVkdCN2Rvd0lpamdJZjRD?=
 =?utf-8?B?UFU3Y08yMmk2eU4yU3NrbVVMd1JzRUlKL2VRZzNsR0d2dGlSUlpqK3lnMWtZ?=
 =?utf-8?B?c2llT1R5M1BQN0I5WnhPS05sbTZSQnVHVTFXd2hlTFAvNXVMaHIzMFlqOXhX?=
 =?utf-8?B?RHV6ZUgwSWRsNDArU3VsUzd0dStod2xCNzcwRlFjbTl6dUtXZ1VXN0FndENP?=
 =?utf-8?B?MjkwNEF0YjBSQmZiVEFHTDVrWlVNdmJTcjZWTUxMTTMvb3BFV2hvOUlJRnlx?=
 =?utf-8?B?ZnBQc2NJbjQvOEtCUi9xQStMam5CUWVoMTJwWHFzYVg4VmQvcy85ekpmVVhE?=
 =?utf-8?B?ay9ldGM4SHphSjA0ay8rbEY0bTZEZTcxbG1oOEdzQ0lXb1VPN0dVU2FrRWpo?=
 =?utf-8?B?bFUrc2ZTNnh4bUxJeWNhcWFDeWg0VFh1KzBZZXNDV1FmdVZoNFE0WWpUOTJm?=
 =?utf-8?B?K2Z0em1CL0hwVXRGdXJlNzh2N2pmL1ZwdVluZGJLT0h5YVZSWTlkanJqcHVF?=
 =?utf-8?B?TWpFSGh2bnVCai9qQVF1OFdSR3p3Y3JQK3Z4cHFrTWRucXpNMDc3R2ZaVFRQ?=
 =?utf-8?B?cnN1dWQxQ0lNbU00MDdUMlRQVmtseEF3YmUwa0RVaWY0aFhiUkxnZUlLMFEv?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b29da61d-7563-41cd-8d49-08ddf469c889
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:08:53.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRRFpQwN2a7mw15cNeKyy3iezeYkwuEF+2KatnFvSbzC9sXI+K5hCRy5jFWad40yxRXZ6B7xycODeYJ+He9ooA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 10:27, Athira Rajeev wrote:
> Create samples from DTL entries for displaying in perf report
> and perf script. When the different PERF_RECORD_XX records are
> processed from perf session, powerpc_vpadtl_process_event() will
> be invoked. For each of the PERF_RECORD_XX record, compare the timestamp
> of perf record with timestamp of top element in the auxtrace heap.
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record.
> 
> Sometimes it could happen that one buffer is only partially
> processed. if the timestamp of occurrence of another event is more
> than currently processed element in the queue, it will move on
> to next perf record. So keep track of position of buffer to
> continue processing next time. Update the timestamp of the
> auxtrace heap with the timestamp of last processed entry from
> the auxtrace buffer.
> 
> Generate perf sample for each entry in the dispatch trace log.
> Fill in the sample details:
> - sample ip is picked from srr0 field of dtl_entry
> - sample cpu is picked from processor_id of dtl_entry
> - sample id is from sample_id of powerpc_vpadtl
> - cpumode is set to PERF_RECORD_MISC_KERNEL
> - Additionally save the details in raw_data of sample. This
> is to print the relevant fields in perf_sample__fprintf_synth()
> when called from builtin-script
> 
> The sample is processed by calling perf_session__deliver_synth_event()
> so that it gets included in perf report.
> 
> Sample Output:
> 
>   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 0.300 MB perf.data ]
> 
>   ./perf report
> 
>   # Samples: 321  of event 'vpa-dtl'
>   # Event count (approx.): 321
>   #
>   # Children      Self  Command  Shared Object      Symbol
>   # ........  ........  .......  .................  ..............................
>   #
>      100.00%   100.00%  swapper  [kernel.kallsyms]  [k] plpar_hcall_norets_notrace
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> Addressed review comments from Adrian:
> - Moved time calculation to different function
> - Alignment and wording changes
> 
>  tools/perf/util/powerpc-vpadtl.c | 173 +++++++++++++++++++++++++++++++
>  1 file changed, 173 insertions(+)
> 
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 637abde60f44..dc437dae16b8 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -161,6 +161,43 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
>  	powerpc_vpadtl_dump(vpa, buf, len);
>  }
>  
> +/*
> + * Generate perf sample for each entry in the dispatch trace log.
> + *   - sample ip is picked from srr0 field of powerpc_vpadtl_entry
> + *   - sample cpu is logical cpu.
> + *   - cpumode is set to PERF_RECORD_MISC_KERNEL
> + *   - Additionally save the details in raw_data of sample. This
> + *   is to print the relevant fields in perf_sample__fprintf_synth()
> + *   when called from builtin-script
> + */
> +static int powerpc_vpadtl_sample(struct powerpc_vpadtl_entry *record, struct powerpc_vpadtl *vpa, u64 save, int cpu)

line length of 116 exceeds 100 columns

> +{
> +	struct perf_sample sample;
> +	union perf_event event;
> +
> +	sample.ip = be64_to_cpu(record->srr0);
> +	sample.period = 1;
> +	sample.cpu = cpu;
> +	sample.id = vpa->sample_id;
> +	sample.callchain = NULL;
> +	sample.branch_stack = NULL;
> +	memset(&event, 0, sizeof(event));
> +	sample.cpumode = PERF_RECORD_MISC_KERNEL;
> +	sample.time = save;
> +	sample.raw_data = record;
> +	sample.raw_size = sizeof(record);
> +	event.sample.header.type = PERF_RECORD_SAMPLE;
> +	event.sample.header.misc = sample.cpumode;
> +	event.sample.header.size = sizeof(struct perf_event_header);
> +
> +	if (perf_session__deliver_synth_event(vpa->session, &event, &sample)) {
> +		pr_debug("Failed to create sample for dtl entry\n");
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
>  static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
>  {
>  	struct auxtrace_buffer *buffer = vpaq->buffer;
> @@ -234,6 +271,140 @@ static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
>  	return 1;
>  }
>  
> +static int powerpc_vpadtl_decode_all(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	int ret;
> +	unsigned char *buf;
> +
> +	if (!vpaq->buf_len || vpaq->pkt_len == vpaq->size) {
> +		ret = powerpc_vpadtl_get_buffer(vpaq);
> +		if (ret <= 0)
> +			return ret;
> +	}
> +
> +	if (vpaq->buffer) {
> +		buf = vpaq->buffer->data;
> +		buf += vpaq->pkt_len;
> +		vpaq->dtl = (struct powerpc_vpadtl_entry *)buf;
> +		if ((long long)be64_to_cpu(vpaq->dtl->timebase) <= 0) {
> +			if (vpaq->pkt_len != dtl_entry_size && vpaq->buf_len) {
> +				vpaq->pkt_len += dtl_entry_size;
> +				vpaq->buf_len -= dtl_entry_size;
> +			}
> +			return -1;
> +		}
> +		vpaq->pkt_len += dtl_entry_size;
> +		vpaq->buf_len -= dtl_entry_size;
> +	} else {
> +		return 0;
> +	}
> +
> +	return 1;
> +}
> +
> +static int powerpc_vpadtl_run_decoder(struct powerpc_vpadtl_queue *vpaq, u64 *timestamp)
> +{
> +	struct powerpc_vpadtl *vpa = vpaq->vpa;
> +	struct powerpc_vpadtl_entry *record;
> +	int ret;
> +	unsigned long long vpaq_timestamp;
> +
> +	while (1) {
> +		ret = powerpc_vpadtl_decode_all(vpaq);
> +		if (!ret) {
> +			pr_debug("All data in the queue has been processed.\n");
> +			return 1;
> +		}
> +
> +		/*
> +		 * Error is detected when decoding VPA PMU trace. Continue to
> +		 * the next trace data and find out more dtl entries.
> +		 */
> +		if (ret < 0)
> +			continue;
> +
> +		record = vpaq->dtl;
> +
> +		vpaq_timestamp = powerpc_vpadtl_timestamp(vpaq);
> +
> +		/* Update timestamp for the last record */
> +		if (vpaq_timestamp > vpaq->timestamp)
> +			vpaq->timestamp = vpaq_timestamp;
> +
> +		/*
> +		 * If the timestamp of the queue is later than timestamp of the
> +		 * coming perf event, bail out so can allow the perf event to
> +		 * be processed ahead.
> +		 */
> +		if (vpaq->timestamp >= *timestamp) {
> +			*timestamp = vpaq->timestamp;
> +			vpaq->pkt_len -= dtl_entry_size;
> +			vpaq->buf_len += dtl_entry_size;
> +			return 0;
> +		}
> +
> +		ret = powerpc_vpadtl_sample(record, vpa, vpaq_timestamp, vpaq->cpu);
> +		if (ret)
> +			continue;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * For each of the PERF_RECORD_XX record, compare the timestamp
> + * of perf record with timestamp of top element in the auxtrace heap.
> + * Process the auxtrace queue if the timestamp of element from heap is
> + * lower than timestamp from entry in perf record.
> + *
> + * Update the timestamp of the auxtrace heap with the timestamp
> + * of last processed entry from the auxtrace buffer.
> + */
> +static int powerpc_vpadtl_process_queues(struct powerpc_vpadtl *vpa, u64 timestamp)
> +{
> +	unsigned int queue_nr;
> +	u64 ts;
> +	int ret;
> +
> +	while (1) {
> +		struct auxtrace_queue *queue;
> +		struct powerpc_vpadtl_queue *vpaq;
> +
> +		if (!vpa->heap.heap_cnt)
> +			return 0;
> +
> +		if (vpa->heap.heap_array[0].ordinal >= timestamp)
> +			return 0;
> +
> +		queue_nr = vpa->heap.heap_array[0].queue_nr;
> +		queue = &vpa->queues.queue_array[queue_nr];
> +		vpaq = queue->priv;
> +
> +		auxtrace_heap__pop(&vpa->heap);
> +
> +		if (vpa->heap.heap_cnt) {
> +			ts = vpa->heap.heap_array[0].ordinal + 1;
> +			if (ts > timestamp)
> +				ts = timestamp;
> +		} else
> +			ts = timestamp;

braces {} should be used on all arms of this statement

> +
> +		ret = powerpc_vpadtl_run_decoder(vpaq, &ts);
> +		if (ret < 0) {
> +			auxtrace_heap__add(&vpa->heap, queue_nr, ts);
> +			return ret;
> +		}
> +
> +		if (!ret) {
> +			ret = auxtrace_heap__add(&vpa->heap, queue_nr, ts);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			vpaq->on_heap = false;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
>  						unsigned int queue_nr)
>  {
> @@ -347,6 +518,8 @@ static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unu
>  		err = powerpc_vpadtl__update_queues(vpa);
>  		if (err)
>  			return err;
> +
> +		err = powerpc_vpadtl_process_queues(vpa, sample->time);
>  	}
>  
>  	return err;


