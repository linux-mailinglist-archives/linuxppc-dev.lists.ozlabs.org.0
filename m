Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E13913012
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 00:08:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G5eDhfuO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5WhZ6dTqz3cns
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 08:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G5eDhfuO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 22 Jun 2024 08:07:51 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Wgq0hs6z30Th
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 08:07:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719007673; x=1750543673;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ox6K4bjQNqMs3f4jCo998zOeAs2pBPKNviRhhyKoaT4=;
  b=G5eDhfuOOjEk4wEo1dWUkts+2O/9NYT8jmWikm4Vf0NIS16ZZrJfkdpL
   fY5yBMd5iSd9UBA7lGkTfI/lJxhH226LLdSjwnX+UF2iEuZ/jcQmwHCkK
   yhlJ6dKVJbvg+q62UbpUpBv1dwhUnarOmDWr1YrkHmzehXwz/T0MYuUjQ
   0ZM+vvbUrUuTfMZz8ROGTUSaj0MoiBmE0hDrmSh1wq1pt+Qp2E9mFG8Q1
   FdKngj/qm5KrKZNQkbq193LvfCkAk6AV7SdJo26l637OmnCieN7wQS9Ph
   7CP0Rs5wMSmsNpk8fsiRwUgfqjA9VzV7ga/C3X5SI5KwPj9c0CZqZr97Z
   w==;
X-CSE-ConnectionGUID: BXsX0ReDQjGm5rdB4LEUEA==
X-CSE-MsgGUID: r0/vbPYXSqiwLEOQ0p0NPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15891403"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="15891403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 15:06:42 -0700
X-CSE-ConnectionGUID: rSCOb/vqTAK5YhlNwYoRIA==
X-CSE-MsgGUID: 2FFkIKOaRz6HGZgWMu2RSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="42792104"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 15:06:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 15:06:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 15:06:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 15:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL9e3eFzg/ibK14Xxvx+WGh24KCsvKIFhAGCzJguyjNL192cfVdRX3bSrzWxeBaxxf4BnMtMkqsCSY3GDbIeTNU0yjcejBdGrgG8q4yKzb3CtczIxIjhQbzL1/ts7GHjRzAfffoye9otPwjnDecFO9h7L/QU9p6JxNZewdOsX5c6nLg8oY+OEIpRyRMhWqsJJEmVL2wswF1/A0lTKIQl0itbo13fEfV6GMsV0oRt/J8JmzZ4BQucPxcSXbqiWyOPxQglLjtdHsFyPjkJby3vpbp8aS9mZ2kNx8cW69ujgTtYF0BApxDInwlt0iUWJrbVzWXxYl1LY/vKjS8LCoZ8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox6K4bjQNqMs3f4jCo998zOeAs2pBPKNviRhhyKoaT4=;
 b=UphL7z2P72Oyimbr6DgFzOJ+yJKWqFopzeOrO7fzhsBrS70gxH13FDTDQO4x7gf0xnB71TdBCm4wWpxV6s+DFWwjabrrwdI8f3s6+V3l7ImzLbI0IeCjobtoigbwtNUtti/ofNfogL9hlrx+pP4uFYiEM5ZA5LR1zeU+RpJqwA26ISOPyzA5e/YfhKuAjLVJynm6/8a+Zgfz0yQgrCqUNgNQiMg8hxSQaSkkoMGEOGRbXysz38yBdR4OJxIWKqjMF9uEIVj0W0IZyolX+O2D2u0am3v7BGi5o7oWbLNdFEJ0VKzFTJYC7DIvYhjnfQp0Q6/Hh1YSMhxOTAAjJzisKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 22:06:38 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 22:06:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "peterx@redhat.com" <peterx@redhat.com>
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
Thread-Topic: [PATCH 6/7] mm/x86: Add missing pud helpers
Thread-Index: AQHaw+qENzALlsOIS0itRHIdMvvnfbHSnMqAgAAOUgCAABuhgA==
Date: Fri, 21 Jun 2024 22:06:38 +0000
Message-ID: <59d518698f664e07c036a5098833d7b56b953305.camel@intel.com>
References: <20240621142504.1940209-1-peterx@redhat.com>
	 <20240621142504.1940209-7-peterx@redhat.com>
	 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
	 <db95c7abea9cd252a791d15359a4d940d91524e3.camel@intel.com>
	 <ZnXiQAJsKPBAKa6b@x1n>
In-Reply-To: <ZnXiQAJsKPBAKa6b@x1n>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: e2b8c327-e477-4135-078e-08dc923e6ca4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|7416011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?S2xMODFaWHpCVk5pK1Y1aFJWYnJqWlZCNTZHQjhURHo2VTd0RmdKcXd1WXAy?=
 =?utf-8?B?U2ZGVnBLeUp0WHVCSm9qMGhlbEVLYktqWkVOMFkvbEhPVGpDYitnSGVxVmF2?=
 =?utf-8?B?R25LQWgwdTVkdzIyejljd0tNV0x6dzN1NG1IczdCaFJGZWZVK1JwWkR1YzdO?=
 =?utf-8?B?L1dvMTdOM0FmQkhQM0ZSTFhldW5xZEVFVnp3MGtONEhoNHFJZlc0bDgyN3Fx?=
 =?utf-8?B?Q1E0Tm9SMm80UnducDNVeGFDeVRIOGprOFV5Uy9uZUJpZStBaWJhdVA0KzVB?=
 =?utf-8?B?Y1IzT3luRVRlVFd6MFArZUdtNWliU1JjcktaZWdUTHhtblluNldTRzhkbkZD?=
 =?utf-8?B?NHBnZ3VpL1V0VFk0OW0yeFBzb0pQWUlOKzQ5RlZjQTY3eUtnRWJQV3JESjRQ?=
 =?utf-8?B?cXQ2dlZyVkZ2REFzaGZnOVRWTU1qZFRiTnhremRXZ2NselRVOUYvRmlNMll3?=
 =?utf-8?B?b04xWkZKVmd4MjdVL0VjRGpENVYrNy8rc05FWnNVZk1QWmVpczJxSFVMZ2Ey?=
 =?utf-8?B?My95aUVrcG9xVDNMQmZQc0YyWG5DQ0JLR0VTcjRoa2xkRHpIbVVZMzJnNzlE?=
 =?utf-8?B?Qnc5NE5WMWFLUWJ6R01PN3pZRkNndEtqV1JSZ21Pd0J2MUhBY2FjVUx5REt0?=
 =?utf-8?B?c1pHcGFqSWdCSFJMNHJXQjBaOHFEQi8zWWp4cWVLanBOZFMvYnZvWXJ3T1dh?=
 =?utf-8?B?VVVlUlR6Sjc4UFpaM2lBSENGNm1yQ0xRWGtkR2Vzd0h0NS92TERRa3FWUklY?=
 =?utf-8?B?UkY4eXNTMmgwVmJNVEpzTXE2blFlZ0d4bi94WWVpU0FNeVZxMGRxVjdGaFNm?=
 =?utf-8?B?TTg0NlVmM21DbnlMK0ZyMXpOeC8xSE5GMStWeGVzWmdHN2xGb1N6Rk1pVlJO?=
 =?utf-8?B?Q1hOREF5aVVtSkhHaysvblcwclArTUFTM1pVZXRuMXFWSHd2OWNVektHSFJz?=
 =?utf-8?B?bXVULzdtN0RlcWFNbWIyMUsrQU5nd2lSM2ExcjVoeFlCY1kvQXJoY3lUeGdy?=
 =?utf-8?B?TVkvK3dFaFlyV1ljNnExV2hBYnhHSE9KQWRtd1crTGJiU2pTb1M0dWh0VSsz?=
 =?utf-8?B?TlgydmRKYjNEMGF2QTh4ZmU3VEVwdnFic2NpQVpVV1M1aTYvOGFMcUY2czZD?=
 =?utf-8?B?UXFzUG1CUE1JdlpvWkt5WklodDlEbXc3TnEzOEg2WEhFRmVsNDFsME8zcjRw?=
 =?utf-8?B?aWcveDg5ZHd6eEpYeDlnNjZaajJXbjB5QWwwazN4Z0FNOFFvOUw3NjZoVDNB?=
 =?utf-8?B?dk9LWmpqbmFIa0hjTUFGRmdReU9NQ2ZNUlppZ3gvNmhZd3k2U3NGMTZ1aFpv?=
 =?utf-8?B?eGVwaFNyVi8zSUg1Q2RjNU80NExMZzI2TTNsd1gyenZ5cmdFVU9FMkZMd3Nj?=
 =?utf-8?B?NUtuclZHV0MwOUk5QXBCWll5VTlvOEtQYUZSOGNubGM2WUtsL0RrS2dYVFI4?=
 =?utf-8?B?Z09jVzU2b1pOTVZEWDBmeXJsVkxYWU03VFJ4SU1kWlhzVEhTd2oxVlVWcHgv?=
 =?utf-8?B?TitJWTRtc3VzZkRjeHdETEFCMGtxN3RDQ2R5WmgrYlBvMXNoVTlyNnZ2SDdP?=
 =?utf-8?B?U1Y4VTZCNVgrRUhHaWc0SzV2VVA5aHkxYWsvYVA1NVBvQ3ByWjJmUWY5Z2JT?=
 =?utf-8?B?NXluazY2eGVQTkhGUzIrVlJqbUxOTlNVelFjTUNOeFpiTzdlQk1nMGZMV3g4?=
 =?utf-8?B?Qm45WGlLRTN5dEg2ZWhtQ3JSazR6S1E2aUhOZVdCNk1qS1lIb0J0dkxOUEgr?=
 =?utf-8?B?dTBYZ1RESElnMUdGenZiZFJaQkpQUlhtVW04Y2tZaHRzelJtM24xWFBhN0Rn?=
 =?utf-8?Q?JQzWX/nSZP6ZqdMgkxq3DnDyYNY5T7VRYksHU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(7416011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qnl2dWt3bkt3QWNnNC9xOGY1Ny9Ia1c5MGprUFFXQzFQc0t3Y3pvTHVRY0o0?=
 =?utf-8?B?aE9CM3VoNHZtOWY3N2VhYTBqYk4wVnJvQ3plYklmNjVjWlF6TS9jWTh0TXlR?=
 =?utf-8?B?V3FqM2NoVVBEVTY0ckpsMktCY1FyVDZ1dlZ2UFRqRjFXL3ZJeERBYU16T3la?=
 =?utf-8?B?UndEbGJOMGh6WGJjeGxUNXVYTnVzaEZHbFovNk91dU0yc1ZkL1MvbjJxdnMv?=
 =?utf-8?B?NlMzTWFZRlc5SmV1azJpdnUwQXlYbGs4QkZINDFNblpQZnVQY1ZCNS9ncDdP?=
 =?utf-8?B?em9kYXJLcnpJYnQ0ZUExMkdCVjE5UHdqcEdqTXlLanl2RjhvMVpZMVI5YTZv?=
 =?utf-8?B?YnZXQlNGNHpCM2dEUUt2cXo5N1lDaW45YldWZzdlM3pKS3dJdlBrYXE2dElz?=
 =?utf-8?B?QllQOTJSR3IrYnV1WXkxemk5QWNOaUQ0cjJoSzRpOVhpQ0xUME9PSDArUnl4?=
 =?utf-8?B?YTRKa2xNTExFZ28vN0tEb1NXbHJBS3h6WEtHUldhNlg1VVJNK29Wd0VNaXR3?=
 =?utf-8?B?OGpEbCtNbjNYNDYya2ZHNHRvV2kvYS9CWEVSS3dqNWgwWjNmYld0SVFXY2lT?=
 =?utf-8?B?TXBSU1ljdWhuZlRUeFY4bUlmanZOZXJYNkZQdkNSRzBPNVlyQTBjRGltd3Rk?=
 =?utf-8?B?c2MzOEx1blZnVWoxYWVFRmZHYUV4WGZuN3h0eEFRU0hQbVlSd29FbG83SE9Z?=
 =?utf-8?B?TVB1MTE0TGVVRGhsUy9ldlN0a1Y1UFFLZzZPMjZIVktqcXNzZlVMTk5iM21p?=
 =?utf-8?B?WFdESXFIOWRFbTg5ckxiaDQ2OXBmTFNQbGpMZFRhQll1V1Nmc2NrY28xMVJB?=
 =?utf-8?B?aTkzQ1oyRi9uSXZPaXVCcFRTL0FsRXJSYzNrMUdEVkc2WjNhckJ5MFdmTGcx?=
 =?utf-8?B?aXJxSE42Y0dNY2ZvcVlwSUZsNWZ0Wkd5UjZIdkVKM24yQkNwUlN5USs4aTBX?=
 =?utf-8?B?NHR5MldxaTdMczF2TlB0L3ZiZXViWk8vZjJvRjJPa3NrUGVKL0Z5eitjbDVX?=
 =?utf-8?B?U1RZVDNNdmV1Ym82M09ZZGQ1R0J2Q2VvUm5PSmdoSWxNMXhOaXdXZHYweHhk?=
 =?utf-8?B?dVUrRzkwY2FaN0pFWURwNG1VVXNMQjluRkhBSFF3SVZzelhmNHJaSENiMzlw?=
 =?utf-8?B?YktSSnoydERSMkhJOGRCdkhYdkdVNVQ5dUxDWkpFanNibWNQZ3JwTThIem84?=
 =?utf-8?B?VlFlN3VaV0FlM0dUT0tzVjdtSE5QV0ltS0kxSTA4aWsrNWJtcVZZc2JkUEYv?=
 =?utf-8?B?MGNybHFiNkFTZ1Y3U0grbkJtc3FYQ2tBMFhqck1RN2VVYTBzSS9iWEwvRTRr?=
 =?utf-8?B?YU1JTmtMUVZTbzhGbEpPc1I3WVkyMDAwaWc0bUxFelp2RnJ1d3pkWUtFTHA1?=
 =?utf-8?B?MXArNXB3UlpHQ1FlSmI2RzlvV2VpeUVaZFlZZFhZVjNEOEg1VUVzSlJ4KzBV?=
 =?utf-8?B?VzlhemFGekVybXZ0Q2J6Q1FxV0V3SWhseFhHa1B3WGJNUWdzRndKU2R4M05a?=
 =?utf-8?B?Y2paa0tVZURiZ3A1eXQyM0FiTjFidjZFR0J5ck5jV0NxOWxBMGdoMVlFUEhy?=
 =?utf-8?B?T1NpWDErZ0pldVFDbVVnbm5sMGVOaWxMNWdPeGNwL1duUEpUYzc3ckFnbGZn?=
 =?utf-8?B?MjkzMG5Pb1RRT0o0WUZldldqZ2J4b0JuTXZHRFcxcGlDRnN5VkY0NDh2cm1L?=
 =?utf-8?B?UnMvbm1wQ2pWYVdwSnVLY04yazE2TXRkZXlQb2tsemZoeW5ub2h1VzNZRHBy?=
 =?utf-8?B?YldtVHJTSWhtRDA1M2pSWDJuT3cwRlJhRjhxYzl3KzBNeU9qRGI3L3RVbU00?=
 =?utf-8?B?VGFmL3BpU09WZHFmc1VDZ0N4MDZ2dzgyR2dPYXd3d2lKZHM4NWI5Nk1BS2Mv?=
 =?utf-8?B?UHJKVThLSkZvNDNuSkhRSHlyNFU2czJuMWpYOWp4N2cvUlhwdTBDM1M3bndV?=
 =?utf-8?B?ZzBpWGhtTjI0VlVSTWxQenpkblFzdTd1UnlCZmVOMVZoMEVVcWI1ajdzdnJO?=
 =?utf-8?B?bmw5OThtNVhxN2xhVUozWm9JM0dJV2xsZkREMHh3SDNoMnpBdHFPczNQQzVn?=
 =?utf-8?B?bjZrWndvSlhtT1Evakg5Y09HaitSRkxLaGpPOTkyeUxZbFdzZ0RKNU1yT1B1?=
 =?utf-8?B?S3BacHBPTkVwOTJoQi8vcEVRL2tSN05YbnRuSTdZWkpjTHplU3RNbnRMNncx?=
 =?utf-8?Q?UiB2lziEKNDNN8lcIBA38BU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <649248BDCD53AC4BB184A07D60EE1F9F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b8c327-e477-4135-078e-08dc923e6ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 22:06:38.7564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMhsp0/lLxaEvn+u1O2DqylcNGfg2z2CVqngslE/rGqC07rrcVO/rqOsN+y8G2e9jriKdo4JjHrCxE23NJtXRk8Y4NrCFZlICsogtEoAD88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "Williams, Dan J" <dan.j.williams@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, "riel@surriel.com" <riel@surriel.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "bp@alien8.de" <bp@alien8.de>, "kirill@shutemov.name" <kirill@shutemov.name>, "tglx@linutronix.de" <tglx@linutronix.de>, "vbabka@suse.cz" <vbabka@suse.cz>, "osalvador@suse.de" <osalvador@suse.de>, "Hansen, Dave" <dave.hansen@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mgorman@techsingularity.net" <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDI0LTA2LTIxIGF0IDE2OjI3IC0wNDAwLCBQZXRlciBYdSB3cm90ZToNCj4gT24g
RnJpLCBKdW4gMjEsIDIwMjQgYXQgMDc6MzY6MzBQTSArMDAwMCwgRWRnZWNvbWJlLCBSaWNrIFAg
d3JvdGU6DQo+ID4gT24gRnJpLCAyMDI0LTA2LTIxIGF0IDA3OjUxIC0wNzAwLCBEYXZlIEhhbnNl
biB3cm90ZToNCj4gPiA+IA0KPiA+ID4gQnV0LCBzdGlsbCwgd2hhdCBpZiB5b3UgdGFrZSBhIERp
cnR5PTEsV3JpdGU9MSBwdWQgYW5kIHB1ZF9tb2RpZnkoKSBpdA0KPiA+ID4gdG8gbWFrZSBpdCBE
aXJ0eT0xLFdyaXRlPTA/wqAgV2hhdCBwcmV2ZW50cyB0aGF0IGZyb20gYmVpbmcNCj4gPiA+IG1p
c2ludGVycHJldGVkIGJ5IHRoZSBoYXJkd2FyZSBhcyBiZWluZyBhIHZhbGlkIDFHIHNoYWRvdyBz
dGFjayBtYXBwaW5nPw0KPiA+IA0KPiA+IEhtbSwgaXQgbG9va3MgbGlrZSB3ZSBjb3VsZCB1c2Ug
YW4gYXJjaF9jaGVja196YXBwZWRfcHVkKCkgdGhhdCBkb2VzIGENCj4gPiB3YXJuaW5nDQo+ID4g
bGlrZSBhcmNoX2NoZWNrX3phcHBlZF9wdGUvcG1kKCkgdG9vLiBOb3QgdGhhdCB3ZSBoYWQgbm8g
dXNlIGZvciBvbmUgYmVmb3JlDQo+ID4gdGhpcy4NCj4gDQo+IEkgY2FuIGRlZmluaXRlbHkgbG9v
ayBpbnRvIHRoYXQsIGJ1dCB0aGlzIGNoZWNrIG9ubHkgaGFwcGVucyB3aGVuIHphcHBpbmcsDQo+
IGFuZCBJSVVDIGl0IG1lYW5zIHRoZXJlIGNhbiBzdGlsbCBiZSBvdXRsaWVycyBmbG9hdGluZyBh
cm91bmQuwqAgSSB3b25kZXINCj4gd2hldGhlciBpdCBzaG91bGQgcmVseSBvbiBwYWdlX3RhYmxl
X2NoZWNrX3B4eF9zZXQoKSBmcm9tIHRoYXQgcmVnYXJkLg0KDQpZZXMsIGl0J3Mgbm90IHBlcmZl
Y3QuIEhtbSwgaXQgbG9va3MgbGlrZSB0aGUgcGFnZV90YWJsZV9jaGVjayB3b3VsZCBjYXRjaCBh
IGxvdA0KbW9yZSBjYXNlcywgYnV0IGl0IHdvdWxkIGhhdmUgdG8gYmUgY2hhbmdlZCB0byBwbHVt
YiB0aGUgdm1hIGluLg0K
