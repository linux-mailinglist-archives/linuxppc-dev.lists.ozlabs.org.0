Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0086B577
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 18:02:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kliQMe2H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlLJW5p6dz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kliQMe2H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlLHh3TkPz2xPV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 04:02:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709139729; x=1740675729;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=S9lopE8N1NyB+CJp6sqHT5LSOKTMOHpf5Tfs+ZASWEQ=;
  b=kliQMe2HZge7UlWqzRodQ5lKaUZKPvNY3v9yYFMoXuSUA6QeaQydihsB
   lK51heGVkWeWOpIVR4L7Jyb8slwmdw33qZ+RisjZJLckr6EhjHFB5DutS
   Noz+4o1td1oyOR3kDe3lwfZIMZ1uM2d8XhQNMTV+aZ7YHO+0nEO7M/ZSN
   sJaYdM7Q1d4vsFOOPgrJYaWDccbJ+hb5PtPzaARnvsrFivHdMtzsKJrE7
   ubol5t1fAZdGPpl8GRX75Tv5pUGUbvthRoFlDNfrR9yr4cWakQTuSY4ah
   4v98EdFW0g8g9rGxHx/mCdgbYRyOGf5Gxgwb+i/Hrc+L5gppA1kxcl/mX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7379495"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7379495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 09:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7419698"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Feb 2024 09:01:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 09:01:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 09:01:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 09:01:39 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 09:01:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNRez+Y6F407x5HsWSKlWEJDZoZJueV6pkECSyVdY7DB0Az6MyYQLM4bcLKfVjUnoMo/zcKGhv5MmnnyiLKI76CnAbcoKK1hHQiiilnwnSnDQcOSVfTLGI16RqBFB44haPE8WNPGULdjhFsjpFYcQuWIJZoC7PulCBKLfXn2vkLPBGuNkqf9d9nkxcf1tt9SlmLMhvswVBxzKBysOzMev0f1aEDepYD40Afv2B8aFbzY10tApnj3LF7G84sTNjWMbat3dDbuSF75YQ7joOjuIrF453y65Jri31h37ZRv76N5zeU/3DcuMzHeyZYYfBd5cMexljviVFpA7rdd6j0MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9lopE8N1NyB+CJp6sqHT5LSOKTMOHpf5Tfs+ZASWEQ=;
 b=a6b4kD5+ws1X35RrtbD8zkr6iJppAYe0dq5IQK7VwriSnkYg7c6XNMw84P9dCQtyT8ISH5N7uLxEptXbbwd3M9A1PJctF8WTiG55lfxiFyLk9pZPkRuAAy4Qif0H7CzyqON5ze9yMplboXkwQIx6pYZS1cffl1GkvBo1aAL/k4cJa+UUCZNko/Yz6g1hQRDAnc5/1JwidLQwUj8aPH51SpYVLBYg/thKcAabDKmwO2SMWJkIRNfXy87Ru4ox/WXPQGH/gzTwUf9EevNKBoO+Psrj95zQF36H06D6HsT4fhQr4WqPmK8dkhOziqg/GiFmPVGhGXSlVdhH/CNlASFDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Wed, 28 Feb
 2024 17:01:35 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7339.022; Wed, 28 Feb 2024
 17:01:35 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "keescook@chromium.org" <keescook@chromium.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOdsOIuf9v8cz0SXVaOI9gIdJbEdxC+AgAC5pQCAAAKPgIAAJA2AgAEcBICAAD1OAA==
Date: Wed, 28 Feb 2024 17:01:35 +0000
Message-ID: <8b12189f4379e9e321527ca2ece597a61c431c80.camel@intel.com>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
	 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
	 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
	 <202402271004.7145FDB53F@keescook>
	 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
	 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
	 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
In-Reply-To: <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|LV8PR11MB8605:EE_
x-ms-office365-filtering-correlation-id: e99cc2f7-d5b3-47e7-a210-08dc387eebe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NlfMnSJOirBfVyQYqIFIqFpqOUl7pjbnCSOZDnF1gRVYylTGaf5FiOHBK9W1d89mLHDgn7nlN8otmN89ivGYxFlimUP5w2Hhclr8osAQccdBSewHUcqnwl2N71rBl/pTDZgcORJ2Bhv/BVY68iNaM9eNRz2vkoVZrDlAIzciNwpewuuNH3Z4bx/I2Ns2oHqTNXA7ZlL/iuuHBqK3o/z2BhBm50G2YjNwuT6/bAWmHnUCVlfNcRCXiX0F5hknLT6Cwn41r/QS58ugU+e4Svn+zcAFAdbOkWOEMElP+j/SapNbfc1nS13rptYoaDViqdp854VkA0lCqzy+5jPPVZskDesqFBhZknsQ7ayLKnlYZ2BXeowXdOkB+/ppsc5MISado66VcKfAuKePzAG1vblZIrJcMIdxDiy+rLyhug7eMQKxJ15cbbqODxPOYht392UVFmSUk+rPmuNl/C6TG4lZJmZE8+DSsu48jHNKOet7ZaFvrAjlV9YUWNHjb3MEPINxkX1jiHPa36HTLlw9ryJrx8SJ3L7IKoy0CqcWdc8bv/ij4q2OQcYvKH8msbVSa6ZhiOtFagss3wEgUhZjvJC33AUhmUd+AirzI2OkPWeVDaH9n14iLIWo+qdQG27csV3v+RXOWXM/2clNuP3mPbXANAkq+bNCNbwrox1PgR5ONYKoZ/548D4VbLrpIoQbKRuZZG3dySJoYrUjGUqI7P31oocn2IUWraUco2OcTYjatck=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXJtNkVyckE2empMS3lFYnIwVzJYME9RZmZKd3ZmZ2EralpaNGNBQTg2Skpv?=
 =?utf-8?B?czZFMEVaSE5NdjZ5ZnRCbkxXb3YzbUpkSUFBZVFObk5NcVl1SzF0a1Q5WWpV?=
 =?utf-8?B?UmQ3V0hZWkt5Nkp5YnZQRi9va0JqdStZaTJReVdFVi9GN2U1clhLQWFaT2JV?=
 =?utf-8?B?N0dTQ2ZDbFdzcEtMc1lpM09mMk0vZnkrcS9xSThYVjU1TEpjMTBjSmV5REZB?=
 =?utf-8?B?QWIyOGV0RHQzbEsrWFJHTDNjK1pRdysvSnBQVGM2bnlicWt4Q21QWHRoWGZC?=
 =?utf-8?B?Vkw1WWQrN2FhZXoxaHM2bUpJSjdOVXBOaWxqb2VRY1FibGhiTXpMQnVseElL?=
 =?utf-8?B?SEN6TnBEYlU2c0xsMFFMOU80QU55dzRIUGhwZ0l1YVB0cXFQUGp3ZDFnVEw4?=
 =?utf-8?B?L0xaY3hNR1Q4SFFDVmkyVEFrMXU0SjVYUkNxMGJTUTVib2ovb2pnNjFJa21N?=
 =?utf-8?B?cFFmeDVjcGhEODgzbDM3RmsxYmRPVjdXSTdsL3RuQTZHbEtDRFZudElJZlpQ?=
 =?utf-8?B?YlRiQVlGTU5DN3JaTmtETS9QWktKYm4xREkwRFRUeE9yZmFKVGR0YUtVaWlu?=
 =?utf-8?B?NkkrVzZiQms1R2JWMmxIbjEwZmlYVmVJdlNRL0tqbWV6Vjdyd1ROMnc5NjEr?=
 =?utf-8?B?YkhabkhKbUN0RGM3Y05sWTRkWTVQeFlETXZaTVRrbXRYS2I1bWw3Rm1rdGZJ?=
 =?utf-8?B?T0p4S0xRZ2k2YU42YURuNFM1R3FCZElNK1J6dmpuMWM5eXhTTW5wQ04rYkpT?=
 =?utf-8?B?akRtVXBzMVBweHZ3Z3JuUkZhSFdzcVM2RE9KTEwzc093UUR6Vk50cUhtWlg3?=
 =?utf-8?B?ZkhvUXlVcXR5RTNZVnNFVXVabDg3SW5wZjY2ZDFjQ0JTcnExL0NGT2FOUGhh?=
 =?utf-8?B?dGNBbjZLeGw1WC9ESjZlR3JvWkgwTEFPZitHc0pkYUt1blUxVjQzT01ORm4y?=
 =?utf-8?B?Qy9RbUozM1JGN1c4K0h4bUdWOGVZTllDakhYWnd3UjA1aEtvbUxqdkxqOERu?=
 =?utf-8?B?eWhxLzFKeHEyeGh0eGZCQVR3cFd6eERScExuRS9aQ09rRG9DMjBwUjBqUS82?=
 =?utf-8?B?Z2JFekdvVWVXM0tPZTVQTkMxTUwxRXZOWEtXWDlzZ0wvTEt0WXgxNWxpcjgw?=
 =?utf-8?B?SkhENE4vSXNwNDRLL05kR053ZWgrNTdRTEtybHVJUEJTUnV5eW9iV3RYdVNv?=
 =?utf-8?B?QkZyNTBqcjlVVzZIWkpwU1g0SStXSXpCSGxjbkJ4RW1ibUdpUGFQQ3R5bGF3?=
 =?utf-8?B?bWUyNGtFeGpZUEdYR3g1bUFVRDRMajRsZ3NVemRIY0Vyak9LcjMyeHVBUmRX?=
 =?utf-8?B?b2VWdy95UHJxeGY1MDRnd3hEK0hGRFR6MGpLVVNvM3E4YU9FcWp1ZGlTejFm?=
 =?utf-8?B?ZXVuTFRaZy9wVzA4UkRMV1h4R0oyQ3ZvenpTSmNxUmhQempSbmk4U2Nac05t?=
 =?utf-8?B?Sk1ZaUhEYTRJMW5VMmRKK0M4MExIVlZtWnhLWUhLSUhlQlB1RTYvbTVLdUJv?=
 =?utf-8?B?WGFLR1k4MkpEMVZkMmlmMTBONU5zeUE0Vk9TRk9aQlYvemV4cVRWeWJiekt2?=
 =?utf-8?B?QlBPSGMzMVVYa2ptbnZrS0RkT0JoMmd3V0ZiY2k0NU5BNVkvYUprT3RWMDN1?=
 =?utf-8?B?OEtpSnBIdGkvaGxWUXFlbHpMUlNTQUxnaUd0RmwxVkVMR0MvamJvbjdndUwr?=
 =?utf-8?B?NG1wVlBxbDRubHRTUWtwM1pCVGtCaEs3NnlHQ25WUDArQnRTYWVZVFRkUUNr?=
 =?utf-8?B?NUQwZDF0VnYrcW5HM0VQdTdpeHl5NFhWT3FwaVRTMEhPVkhCY3drNS9FMWpG?=
 =?utf-8?B?QkpsZCtXMGY0UEhCanRPTnIzam5kRkh3ZmF4TmNISk5vQTZrSWZzS3Q4QUgv?=
 =?utf-8?B?VExXUW1MZEZUSjlVbTN6Y3J6bEMyaVA5R1pXN1VGRG9IRVhQVEJrM1JtZVpI?=
 =?utf-8?B?NEx0OWh2TnpXbDBRRXhPMnpOc0RBcnBNQVptV3JvcElzV0hIQTVPNVptOVFn?=
 =?utf-8?B?ZDJqcVhVd2JPd3dleDZxTHRsU3k0SSsyOVplVEVNN2pmNmF0SlRzTCtjKzJD?=
 =?utf-8?B?OE0rc2pFdzErVnU4a3BGOHBmcEhKOWkxd0NMbEFkajNHUU15SE8rd0RYUE1M?=
 =?utf-8?B?c0hHd1ZKaVNIQjVTNzgxSitwVDVRcmVMQzRtc1ZlR3NROWUyUCtFNTd1d3NU?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6F754B0BE2D8A4898172805A30E797E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99cc2f7-d5b3-47e7-a210-08dc387eebe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 17:01:35.4174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7tKUWlKlpGgPOkk2CnFpV2mc/OL6c0fkYPNBwQTtNz8K1P6N1N38FYJuEG07UmTbjyRRhlQm7EfOz6mtoijI1VWpOtUxJ9khdG3fgjVYLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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
Cc: "luto@kernel.org" <luto@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug
 @rivosinc.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDI0LTAyLTI4IGF0IDEzOjIyICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiA+IEFueSBwcmVmZXJlbmNlPyBPciBtYXliZSBhbSBJIG1pc3NpbmcgeW91ciBwb2ludCBh
bmQgdGFsa2luZw0KPiA+IG5vbnNlbnNlPw0KPiA+IA0KPiANCj4gU28gbXkgcHJlZmVyZW5jZSB3
b3VsZCBnbyB0byB0aGUgYWRkaXRpb24gb2Y6DQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgaW5mby5u
ZXdfZmllbGQgPSAwOw0KPiANCj4gQnV0IHRoYXQncyB2ZXJ5IG1pbm9yIGFuZCBpZiB5b3UgdGhp
bmsgaXQgaXMgZWFzaWVyIHRvIG1hbmFnZSBhbmQgDQo+IG1haW50YWluIGJ5IHBlcmZvcm1pbmcg
e30gaW5pdGlhbGlzYXRpb24gYXQgZGVjbGFyYXRpb24sIGxldHMgZ28gZm9yDQo+IHRoYXQuDQoN
CkFwcHJlY2lhdGUgdGhlIGNsYXJpZmljYXRpb24gYW5kIGhlbHAgZ2V0dGluZyB0aGlzIHJpZ2h0
LiBJJ20gdGhpbmtpbmcNCktlZXMnIGFuZCBub3cgS2lyaWxsJ3MgcG9pbnQgYWJvdXQgdGhpcyBw
YXRjaCByZXN1bHRpbmcgaW4gdW5uZWNlc3NhcnkNCm1hbnVhbCB6ZXJvIGluaXRpYWxpemF0aW9u
IG9mIHRoZSBzdHJ1Y3RzIGlzIHByb2JhYmx5IHNvbWV0aGluZyB0aGF0DQpuZWVkcyB0byBiZSBh
ZGRyZXNzZWQuDQoNCklmIEkgY3JlYXRlZCBhIGJ1bmNoIG9mIHBhdGNoZXMgdG8gY2hhbmdlIGVh
Y2ggY2FsbCBzaXRlLCBJIHRoaW5rIHRoZQ0KdGhlIGJlc3QgaXMgcHJvYmFibHkgdG8gZG8gdGhl
IGRlc2lnbmF0ZWQgZmllbGQgemVybyBpbml0aWFsaXphdGlvbg0Kd2F5Lg0KDQpCdXQgSSBjYW4g
ZG8gc29tZXRoaW5nIGZvciBwb3dlcnBjIHNwZWNpYWwgaWYgeW91IHdhbnQuIEknbGwgZmlyc3Qg
dHJ5DQp3aXRoIHBvd2VycGMgbWF0Y2hpbmcgdGhlIG90aGVycywgYW5kIGlmIGl0IHNlZW1zIG9i
amVjdGlvbmFibGUsIHBsZWFzZQ0KbGV0IG1lIGtub3cuDQoNClRoYW5rcywNCg0KUmljaw0K
