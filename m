Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B186ED95
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 01:48:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYQDaTW1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmmXL4wPLz3vdR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 11:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYQDaTW1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmmWY3x4Vz3ddX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 11:47:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709340441; x=1740876441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fU3zMZKXIIVa75m9eCEI6HQaJLFDn0+uWgPSHwH8wT0=;
  b=QYQDaTW1x3+wgVfESLdRlJ+9XaZSELI3ufwro1U2yW3vAKA4w23QIrdA
   DgOPA6UY6iaVGod8khXdE0iNzh2wdrxqTe/xcnjKF0fJZlojZz7baGENO
   MC+UDDpbMcsHLqfP4wdNyWk9FXtHK5WFM+Yhdf+Xp8rpWefTETJyBauz/
   2b9tnO10bEs/kPEyoKx49sOLqxPRLzM+MuZ0Hvs3+6GnJAh7mwEtjGPLL
   aHmgpoJagsbB/5bphZhXb9XFhaRTvjWrJx8zpw1naqChKqhXUNjPtFlrw
   EWQHoED4SeM5uTTXf6zg4rjhfpcNuaG4to37xJ5ffEh0Dmp0+b96dlnwO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4020160"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4020160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 16:47:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8790612"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Mar 2024 16:47:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 16:47:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 16:47:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 16:47:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxPoi+1G92wpmUjqPc4dlseVIOOJAu3HcJASSlfPHmpYGyiUlrR8HVquUFKVjcp/tvmF2GBAsezbcNEcQcm1zMz/rJ54j4FVJIFvpVHg+o+CtuxB8CRMUg5GB5VwBLMhDHCgjj533okOZijMUHWmb5O5IkedfZ1lkqgUGi0LuoPbrvhHkQ/inw7QFXhG4fy7cKsa1V33ksZ+vzVu4eDRHxnun8codxILlGWq/+h0gm3vgRGoL6nvFMRqvkdInv/Qgyh1A5A7sLLjzz0reSAu7Kt4WvfUvOhLpSrCeNFTpZUyj6UfW9ogr0bqjUugpUFAnUiuu8zzI4HcO9iSVdudYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU3zMZKXIIVa75m9eCEI6HQaJLFDn0+uWgPSHwH8wT0=;
 b=EoYLlN9bZb91F0Dv682pbUxP4UA3L+7jEA/ct9030+CxbpAZnNFgRvw7iseF89jJnQP4yrpYLeB1LqHNhXbvgE+/CQCfgTtCkiCEiGu6EWpJOuMUbtRpc6YlwBe76+gQJrQYvKlxCxFIu3IOqpd4ePllEsbip8rP02B2VNzfE/ZwumoYQG10t6tazayRt1JNRpedLsI7ccia56YVV/xLrogXhbcmAdrSU95aGGBBiFXfjr9kMbH5kOsWMEi3n+g9z44BRXGN9EpKIx6RQMlTXjgaRLTw1z7QL5vAwA9JAAAZGqsWqWCgP5bpBQkcUArX98PZcb9eWdEdMOg7MHml+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB7946.namprd11.prod.outlook.com (2603:10b6:930:7e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.14; Sat, 2 Mar
 2024 00:47:08 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7362.017; Sat, 2 Mar 2024
 00:47:08 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "keescook@chromium.org" <keescook@chromium.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOdsOIuf9v8cz0SXVaOI9gIdJbEdxC+AgAC5pQCAAAKPgIAAJA2AgAEcBICAAELjgIADoSeA
Date: Sat, 2 Mar 2024 00:47:08 +0000
Message-ID: <ac04c9aa134807bbc00e6086e7a14a58a682f221.camel@intel.com>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
	 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
	 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
	 <202402271004.7145FDB53F@keescook>
	 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
	 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
	 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
	 <202402280912.33AEE7A9CF@keescook>
In-Reply-To: <202402280912.33AEE7A9CF@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CY8PR11MB7946:EE_
x-ms-office365-filtering-correlation-id: 42ff17d8-e0db-4ec2-5b64-08dc3a524a4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hIrCIX4BDlrvI59cK2SUeog4x7E7GsgdML7XuMofF1qUamt3wAsW/pxFthjrD2Je/Yzw2lkfQV1UcWCixkVDuE2D/kzcvNqOPPYsh1HVUM095oqIV4O37EQe7SztoD/nxhrQX2KuOfS6KP3xum145hlXaTcFkB6joZqcmMSsArJuQdB4isr5gQYzVsQnOFgxxqY4yboxPE0+YzipR2Vj4dcOaBWsbEwGRyGpjh6/hUGXQ5k5e6KB7PA15NtL4enOYRLXih7jjZeiz/YkN+3ZrNLTp1dnmshSVF7xWkX/BBcKZngNFfjAbdFw0YW1kIoHKt9KID0Ypg5Sz7RoKYW3WGQROeQehFKElpwMcn2PGukottGEoZbTPw6bMluHEfKHMXwLdBrpMPqeeoEgM8UJvmGgzh0aj09UIAb9avMU+rrDmgo3AkSt3zt7DxRQYHvre39J/kQnoE9IE6l2Uz8wTYPlx4NyZCMXaTzbsX4J9g8b9s31GGAlaeAFNQUeHHjxGU3KOnKyBjQQKL063ZFceXwnhs15e2b7h6oIa/qz+CETVkVj+22Ny18REfAyMDZMrv9WlDJ42gcRJQsLfi2m8UDGg9bFBvGHTsOrSBfF91NYsvACU1v2cn+nW2lECNOeIlcavD1MWYGyo774vCUTE4xwVMwQR7e8UOwtNl+ZL61hoLYNfJj4qSV9KqnX6eKMjf31at1rGE138FTqhQBNBfP3AbFCQAGE2djsdZ0VK6E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlhtbTdBQ0pQZ0U2TXM0RmJLeXVwa0Y1cW1XV3pqRTU1Tkh0cWRKd05XM3RO?=
 =?utf-8?B?eDNGeUdCMTRmOHdjSzBrNnBiQXJkeXQreUNFRWJNRUF5c3ppYnE1azdRdERp?=
 =?utf-8?B?K3B1MVJvUC9ITFNnRjFUbmFseEJBZ2wzWi9RMWF6cSt6bkNLMm1KV2RjQTNn?=
 =?utf-8?B?M2tzVllwSGc2VjQ0eks0Yzl1bmVHVHl5bXJ2K1B3ZzNzajg0dG9KUHVKNUcr?=
 =?utf-8?B?Zzl5ZzVyd0Z4dWg0eHJlVzcrckJTMzRseFlic0NFbjk4ZzA3YzE4L0dLR3BH?=
 =?utf-8?B?MTN1TEh1RmJsa0ExN1p0QXIyNW5lMVdURFA2SHd2Umk4cDdka0p0YlFNbVYx?=
 =?utf-8?B?SytWaGNRdG5oM1V6azgrZ2Z2SjlWaEZtaVFSWWdFNy9DRE96V2hOeEdyOCtt?=
 =?utf-8?B?ekswM1JMNHRmbEo4MXV3M3ZHSnlTcWF0NFpjZmEyNktwQVF1dDB5eWF6c0Jo?=
 =?utf-8?B?UG9rVzFjWEk5UGhkOHBycUVGeVFWdzg4U2Y1STdzcEJHYUNTSTVuRTZUWUdl?=
 =?utf-8?B?MjZPT3hSc1A3NTcvaExYdUFFUzN4OVZZZGF3Q0FEVlVnUGdWTVI3TTFDWDVH?=
 =?utf-8?B?VFJTdXRQUEVHVUF6MUZBVnZLR1k2N2VsWkJyR0J4enpUMy9ET3dYM1M0bWhv?=
 =?utf-8?B?MnU3VGhjODNBc3hSQkJRNzB0Y1RmZTd2djdhSjM3cmVqUk9sWkJPVkFnaWRU?=
 =?utf-8?B?WDVQdGJrYWtkWGRKTEdIL2RieDBuWDJySjNzdFkxalQ3THpjL2MvVzUxeTg5?=
 =?utf-8?B?SWhSTy84K3ZlbnVQblVWc2szNWR1NWxJSjMyVkdRcXdIdG4wZWhqMmVMT016?=
 =?utf-8?B?RHh3a2JoR2pITnZOT0ljUGRYV3hhekx2MWhEamxPM3BiQ2JWQ1dCNU9jdUl0?=
 =?utf-8?B?WkVYV2FZcnY1d0dHeDZkWkFPcVFEUnhXWjZsTVhDeG80eERPRWhHd0grSzJo?=
 =?utf-8?B?eE9LYS9rTXVhdDdqUGxsZE1GdXdlRUFXYmdPKzVDY2FhOERFOEpRL0hMelBO?=
 =?utf-8?B?VUM4b3lMdlN6NHZFblZPR2crN3VTSW1EeSsxWFNISzBobzFjbDdaZ1pJZjJQ?=
 =?utf-8?B?b2ZmMXh0cWRvSHlEbjZpMXJvc3JGajk1ZjA1THJ6S09hMjNHRVRSM29BWTNE?=
 =?utf-8?B?anVkR3dWODhNY0hSMENlalJRY3dEMlNtYXliZWRsRVZ2SUlyTHp4MUZCbkpo?=
 =?utf-8?B?dit0SkNyc05JMHViQ0pQekR5amNhZVc2MWQ3bVdwR2ZSUE1kWUJpN0dUWXFF?=
 =?utf-8?B?ZHFiYkw3ejByaWdNZm5IRzNRdjdHQzVuM1dyU1drR2lpWjVOYXlJajVBc3d0?=
 =?utf-8?B?NHNCVXdZRS9kZ2M0NDNieU1BaVZSSDYrM0JOb1NjOVF2TW9GOXNid091NG92?=
 =?utf-8?B?MWlrMWxZb3ZxZk1KeG92WmRPL085SmlZRElMSTJKWVZQQjBBaElxVk9IUndt?=
 =?utf-8?B?N29DbThSb1JaaW8zLzRERDBKaVNOZk9lbnYwNDFnWHI0YjFFWm5oUGd6dUMr?=
 =?utf-8?B?bDRJOVRGNTk5bWY0WXVnYWlyVWFiWFZ6QnZrRHZWSTBXNHZkZ0RrUitVV3p6?=
 =?utf-8?B?V1BWWFNuWU0vRlk0SkpRUVBsK3htNGp2ZE05M2thOXpzSkJNQXFCeVhnVVND?=
 =?utf-8?B?ZjZtMno2NWZxbGNGdSs4ZkhvUjB3N2xySWU5YWlHVmxEaVVtSVZuc2VxZnFs?=
 =?utf-8?B?blJ6K0RlOG56OEpRSHhnTjUrR1V4NkpTNzBDSDVORFB1MlZTQUsxMFFoMWIv?=
 =?utf-8?B?eEhPYjZ2L2RlOGsxVnMweDE5RTZSR3BhT2UvTzYrR3duNzFOUHIrNXpCd08z?=
 =?utf-8?B?ckZBOVNCeGROSWFRYjdLSElmTTRVZk9KOWlQT2VRZDVCTUwrQzc2VTh6djho?=
 =?utf-8?B?dmYybjBrR1pmUEdEWkFWNTFhVSttZ2lDMGJvemJKdFE5bDMvaUdqcVFYN3hS?=
 =?utf-8?B?K2tDeXcvd0FmQ2JsaEhJSFpUMDJvQ1dKWWgraGFWb01kMUlaSmxZakV0SHpI?=
 =?utf-8?B?Q0JSQ1JwTU8yYVREcVprRGpEeE50WkpXaXVvdXZoemtJN1lKZFRHTXMrR2x2?=
 =?utf-8?B?MCtFSDM3RjBsMUFySzl5L085cDFTSk5KZFhhMmd6SWczeFU3L0dpVWxnUVRJ?=
 =?utf-8?B?enE0N1I2VElNQlM4ck5haS93bXR0NHRwei9iaXZ0d2FvVnYyd2N2VXNZYnhq?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC29F0F9A536C448850B919550CCE475@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ff17d8-e0db-4ec2-5b64-08dc3a524a4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2024 00:47:08.7873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GplDLNiBT0ocQcYZzLJ4TVH7fzSXdmgXN4+p/D/ZDbn/i7tNKlpqe0UJusDV2r1BlaNfeMY2tgDHx1DbR0ly95DcfPlq43Fx5121eeB53Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7946
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

T24gV2VkLCAyMDI0LTAyLTI4IGF0IDA5OjIxIC0wODAwLCBLZWVzIENvb2sgd3JvdGU6DQo+IEkg
dG90YWxseSB1bmRlcnN0YW5kLiBJZiB0aGUgInVuaW5pdGlhbGl6ZWQiIHdhcm5pbmdzIHdlcmUg
YWN0dWFsbHkNCj4gcmVsaWFibGUsIEkgd291bGQgYWdyZWUuIEkgbG9vayBhdCBpdCB0aGlzIHdh
eToNCj4gDQo+IC0gaW5pdGlhbGl6YXRpb25zIGNhbiBiZSBtaXNzZWQgZWl0aGVyIGluIHN0YXRp
YyBpbml0aWFsaXplcnMgb3IgdmlhDQo+IMKgIHJ1biB0aW1lIGluaXRpYWxpemVycy4gKFNvIHRo
ZSByaXNrIG9mIG1pc3Rha2UgaGVyZSBpcyBtYXRjaGVkIC0tDQo+IMKgIHRob3VnaCBJJ2QgYXJn
dWUgaXQncyBlYXNpZXIgdG8gKmZpbmQqIHN0YXRpYyBpbml0aWFsaXplcnMgd2hlbg0KPiBhZGRp
bmcNCj4gwqAgbmV3IHN0cnVjdCBtZW1iZXJzLikNCj4gLSB1bmluaXRpYWxpemVkIHdhcm5pbmdz
IGFyZSBpbmNvbnNpc3RlbnQgKHRoaXMgYmVjb21lcyBhbiB1bmtub3duDQo+IHJpc2spDQo+IC0g
d2hlbiBhIHJ1biB0aW1lIGluaXRpYWxpemVyIGlzIG1pc3NlZCwgdGhlIGNvbnRlbnRzIGFyZSB3
aGF0ZXZlcg0KPiB3YXMNCj4gwqAgb24gdGhlIHN0YWNrIChoaWdoIHJpc2spDQo+IC0gd2hhdCBh
IHN0YXRpYyBpbml0aWFsaXplciBpcyBtaXNzZWQsIHRoZSBjb250ZW50IGlzIDAgKGxvdyByaXNr
KQ0KPiANCj4gSSB0aGluayB1bmFtYmlndW91cyBzdGF0ZSAoYWx3YXlzIDApIGlzIHNpZ25pZmlj
YW50bHkgbW9yZSBpbXBvcnRhbnQNCj4gZm9yDQo+IHRoZSBzYWZldHkgb2YgdGhlIHN5c3RlbSBh
cyBhIHdob2xlLiBZZXMsIGluZGl2aWR1YWwgY2FzZXMgbWF5YmUgYmFkDQo+ICgid2hhdCB1aWQg
c2hvdWxkIHRoaXMgYmU/IHJvb3Q/ISIpIGJ1dCBmcm9tIGEgZ2VuZXJhbCBtZW1vcnkgc2FmZXR5
DQo+IHBlcnNwZWN0aXZlIHRoZSB2YWx1ZSBkb2Vzbid0IGJlY29tZSBwb3RlbnRpYWxseSBpbmZs
dWVuY2VkIGJ5IG9yZGVyDQo+IG9mDQo+IG9wZXJhdGlvbnMsIGxlZnRvdmVyIHN0YWNrIG1lbW9y
eSwgZXRjLg0KPiANCj4gSSdkIGFncmVlLCBsaWZ0aW5nIGV2ZXJ5dGhpbmcgaW50byBhIHN0YXRp
YyBpbml0aWFsaXplciBkb2VzIHNlZW0NCj4gY2xlYW5lc3Qgb2YgYWxsIHRoZSBjaG9pY2VzLg0K
DQpIaSBLZWVzLA0KDQpXZWxsLCBJIGp1c3QgZ2F2ZSB0aGlzIGEgdHJ5LiBJdCBpcyBnaXZpbmcg
bWUgZmxhc2hiYWNrcyBvZiB3aGVuIEkgbGFzdA0KaGFkIHRvIGRvIGEgdHJlZSB3aWRlIGNoYW5n
ZSB0aGF0IEkgY291bGRuJ3QgZnVsbHkgdGVzdCBhbmQgdGhlDQpicmVha2FnZSB3YXMgY2F1Z2h0
IGJ5IExpbnVzLg0KDQpDb3VsZCB5b3UgbGV0IG1lIGtub3cgaWYgeW91IHRoaW5rIHRoaXMgaXMg
YWRkaXRpb25hbGx5IHdvcnRod2hpbGUNCmNsZWFudXAgb3V0c2lkZSBvZiB0aGUgZ3VhcmQgZ2Fw
IGltcHJvdmVtZW50cyBvZiB0aGlzIHNlcmllcz8gQmVjYXVzZSBJDQp3YXMgdGhpbmtpbmcgYSBt
b3JlIGNvd2FyZGx5IGFwcHJvYWNoIGNvdWxkIGJlIGEgbmV3IHZtX3VubWFwcGVkX2FyZWEoKQ0K
dmFyaWFudCB0aGF0IHRha2VzIHRoZSBuZXcgc3RhcnQgZ2FwIG1lbWJlciBhcyBhIHNlcGFyYXRl
IGFyZ3VtZW50DQpvdXRzaWRlIG9mIHN0cnVjdCB2bV91bm1hcHBlZF9hcmVhX2luZm8uIEl0IHdv
dWxkIGJlIGtpbmQgb2Ygc3RyYW5nZSB0bw0Ka2VlcCB0aGVtIHNlcGFyYXRlLCBidXQgaXQgd291
bGQgYmUgbGVzcyBsaWtlbHkgdG8gYnVtcCBzb21ldGhpbmcuDQoNClRoYW5rcywNCg0KUmljaw0K
