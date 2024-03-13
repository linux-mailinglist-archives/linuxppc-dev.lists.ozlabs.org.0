Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D687A9D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 15:58:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UlDaRUVB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvttJ48MSz3d28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 01:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UlDaRUVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvtsX091qz3cDw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 01:57:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710341856; x=1741877856;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cvXITNzngUSPQIoAnMgD7QVEAN1H8hhv9LyTmR0ySlU=;
  b=UlDaRUVBjWVtFxr9Eg+Ixw4sRnLrj2G7pQZ5yv1vi1LwcQCGgbUGr5eV
   ERbrECLz/UCFif8ecfkorBDKl7M3/TdK6sIGX49jSuIUOpRejSskDmrtE
   g297wUCBS3ra/3jX1A9pTNleQ9PH5hQ8UT3mjVDluaRucru5zCnzd306i
   jEzN+oniBm7apm7lH5SxkQTAJHVgOQTAiQopQQJWOFtiItWsta8eTB/XJ
   EJvfr7EYk5XSOfu21/8ugavKzjFw9zwW+wbXsa8XzFwd1nwFxhtRkyedu
   4dj69Ic9Lk/mtJIJOIVIX7qtWxWYmm5LkiFW+UnJIdGkdwLdy/PR44wxW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5292145"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5292145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="11869423"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Mar 2024 07:57:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 07:57:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 07:57:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 07:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPWwh0xktqHyH/o1XA7hDGWBVQshaBt+f4g8ALHKcEVrp+hEr1OfHpG2Ud0Ds4/28eFFQRlbeayzIxuXAEodb02F131+xP6awqOSub4m6bnVuZHT9ThVpA0gxlEPgslzlMtawJWbvkv4tFgl3jiS6lmpdvNtiKMeqoM62+WNDcXhbKQgwNFjhY1AwthVbM9l18Ys8SyLyvdrOxbl/qk7P2RKDV3dinlNWyGFUw5zETFnj+Wh5cTmLXZt0Bgg09HKSCUcChgDhWxCr3SqD5MyTBiGGMta9VM4fil0SnYRe6soNcdDK7NBCVVwsMY1uWkos1nGoXjfnBMMJ+g+AQ8DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvXITNzngUSPQIoAnMgD7QVEAN1H8hhv9LyTmR0ySlU=;
 b=Ck823e492RjlpzMuAabjC7gEWPrBAEuPAtGw4RHZ8+uqb2Y10HUuo4K9O3qCkUxMcVamIavZNPLYmLMqgHk7PYkB/KwyMgMLHibGF8h9oHndEy4ST5iRMTDpTNOpWdfwL0/SK9pdBdq5sS5vELHrSeqnXHEPlpf45eYFMXXPCGeU4KKpYDVCh24Z4wZTVIyeD7nps7/MrNWUOjJl24TdhLkomIJ3fYXf4VhL7xVP9FoxzBSSP/NHZKf8jJ30kimSRtqi9wN6tkaSa3KMAKqO+2wwsBTRQYegon9SoZ0Xtq8oP2zMyjYpbq0axVSjZhNmK+20tF1oqOgSmhQAgvR0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 14:57:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7386.016; Wed, 13 Mar 2024
 14:57:23 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>, "luto@kernel.org"
	<luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>
Subject: Re: [PATCH v3 07/12] powerpc: Use initializer for struct
 vm_unmapped_area_info
Thread-Topic: [PATCH v3 07/12] powerpc: Use initializer for struct
 vm_unmapped_area_info
Thread-Index: AQHadMzMZevf36hBX02eGqaTvf3gY7E1OiGAgACJxgA=
Date: Wed, 13 Mar 2024 14:57:23 +0000
Message-ID: <e9b5b322b451dfe2dde8da2b1240cf51f74b0541.camel@intel.com>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
	 <20240312222843.2505560-8-rick.p.edgecombe@intel.com>
	 <dad7735d-dc57-4c89-a2b2-29d971f3cf69@csgroup.eu>
In-Reply-To: <dad7735d-dc57-4c89-a2b2-29d971f3cf69@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB7673:EE_
x-ms-office365-filtering-correlation-id: b93d7ce5-b8e9-4bd2-6a18-08dc436de3ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bu61Fe/oo6w58UR40oDLYwJ8LGUyg+j9LN2XLxgZTH9cpG8TSnT0EdLc5mI5N+DmV7avEDYLoafYQY4KMzahwjeHJBrg+EOSS+6HD+7ghiegL2Oodww9c71BTz5O4IT5a1Kt6OHdjKpL3/SPo9+WBZLLz0QtaeJ2lFb79dl0ZTmJ5rw692zKNmiGVtEfbJJ5g7EMOCmIcrOI5YTA23aXVzbKgdQNrIbsMswyYYENsE8u6s++2SZDzHl87H0phBZvV+xlXnA5xWLXxQMOsPuD7WqPSEmP8orZrdI3J7ohNyE5ZrXTVMTfxRLlAX4QQErFs01I5LVRjhLOhLNdMblxjawlQdLaJEkrYhoh8PhE09mToWCsUcFVFYZu0qzzj9b5OR+HvMF9DlraJ+rHxIHbYFQEjOk0xaeSElsibKy3ivrU8/wpEmu+4+ozEaGqteB6tfm4BPYmpnYoQ/nWxZGqzEDR3mYuyl+nyamCDae7FFlhjbQ+uO7uo6CCyUquhpARJiO/tNX9Q9WS6Sj5ebGUOcHNsdcTjPvY9GQITUHrfqA14ynpvWCPrI3WkkN5BijWaUeAn0tFmwB6lKGZ6kHrcEnjHAbe2dnKacFjkAZPuYSYXHWAkB8THyodAt5BKVWErzu5sriaTo2BzxNKcdGlj9baPLI4Ylvm3pvc6gmrQrgQ3c1nOMHyDuuDnBsGn/eslEdbZFPDAnYOA4kG/1neeAaPkpxIxGcTRx3oTO6WFBA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R244VmpFaUIrZzF4amNLZjU3R1h1TFhqakZncGJ5U2pmVjJHU3ZudGZHYnpX?=
 =?utf-8?B?OEZVNm5aT1Q3azQvZlhLTVF1bnBEVENCUGh3ZFF5bDNJWWFkKyttY3lFN1NB?=
 =?utf-8?B?ZlVwa1JuVzQ2bmpKalZvN2ZNMHFjNGtqUXoxSjdacDVUcmRmVCtQWFhpNEp2?=
 =?utf-8?B?TlY2MjBwMC95Vjd6NHFIZmZYOHFXTHU4U3JtcW1RR2dvTWFOMEoydjNkbDN5?=
 =?utf-8?B?dmdMZFVHRTNhUUdtd0d6SWVyQlIwVmRYeXZScUZTRG11UXJ6aHF0b0NKRFpk?=
 =?utf-8?B?U1pSNTZmMUptU245d0F3cU1VRHdCQXJidEpkbjZmVjhxVzhLZWU4Yi82T3Jw?=
 =?utf-8?B?T0Z4VmRYRklRYlc4K3RHbVNNbGZWWXhWV1BPMERSUnZZTUlvazRVMkdqQkNw?=
 =?utf-8?B?SXVqTitTN0d0bmdwYzcvUUQwVFJWajJUZkZkbEFXR2UvT1hFUlR5eXFVOVQ5?=
 =?utf-8?B?NzNic0hoc2Z0TTdRcjk5SG1yQUZIWHNxVmtJbE1pT05nSlEzQzQ5R0ZUR3ZG?=
 =?utf-8?B?clNvZkZZM1pJMXhjdzQzYTFTaFQrN2JQcVZzOFl0MVVJODVqM0xnSHFvTGQ1?=
 =?utf-8?B?Y1pFRlUxcWR4YTFONjJ6TnpNMlFEUS9hY09UTzNQWmFSYmt4QitDSDI1VWtv?=
 =?utf-8?B?UU1XTHozRWt2RUx0eVA3RjJ5Rlc4YW5OZVU4L1RsR1E4M21PVWI5SVhxQXlZ?=
 =?utf-8?B?YlFzWUZHM2RSM2c1TWQrc0lmNHR0SjN5alhlR1VtdVorMEx4Q0FDSXdtUDNv?=
 =?utf-8?B?ODRFNjNmZHB5SG5jcitVOGpOM1dpUFdrWXVMbGJteVYxWTRNeTZnZ2U5Mnhw?=
 =?utf-8?B?dHNHeUhPay8xWFAwWWoxUkRNaTFTdWsrUURaelJwNmE2RUQzUEcwOUM4Ymtm?=
 =?utf-8?B?aDcvdzAxQmlnbkhKd1NlL2EySGhua0RWNVJpVUlQTFpTc2pzOFByZUVwcWtk?=
 =?utf-8?B?L0gzYkNDenhsQWd3TmlpN2o3OGhqL2FOQ213ZmMxTTVGOHlJRWE2MW91L1dx?=
 =?utf-8?B?ZG9JT1NxdHZVMkxQUitvcXk5SDZwcmcyT3k1MEZsT3pyblJaLzUrMlNjMlZk?=
 =?utf-8?B?U3RJMG0zbTVNZytWM2ZIbkV5OXlJb3J1Mlp2Nk5tM2wwNnd4Z3A4Y1BueWhm?=
 =?utf-8?B?bklvSUNZSUdNK3VFYXZEYnJVeHYzcEpobUdlamhxWGY3dTdwdjd1MUlveGpI?=
 =?utf-8?B?QXc0U2pkT2lHR3VVa0xTYzRpWmZhbjhmR09EY3dJejdDZEdwaTZaTnN2WXZz?=
 =?utf-8?B?cWo0SG1vWkdSSzBNRS9kZ2F1elJHeVo1aS9jSkZ6Y09yU3pHUWp2YTlSOVd3?=
 =?utf-8?B?RVdyajl6NStZTVJ4WlZ5bmE2RVErNEswenNPRW9PK1VHWG5kNVlhSUYreFh3?=
 =?utf-8?B?RFZqWm41ajg0eHlFNzNHR1dCdS9UN1d1MDE2dnFaYXlTVjY2T1k0dTZKRHFt?=
 =?utf-8?B?UnBDUnc2Z0RVS21QTWVhRU9CdjhLUlZKRVRLdEVvV2hBeXR1YlFleUtrRWsy?=
 =?utf-8?B?OVkyV1ZlOWd1Qm9aM0FFcVRndkFlc3RXNndRdi9qZW9PRk5HRVFrRW9MVDNM?=
 =?utf-8?B?ZU95eXd3SWxSWFQrMTdyaldwbGdHR2xyWVpmRnprMTdkNXgvZU5ONjhjQ2hj?=
 =?utf-8?B?TnY0YUZ2STBDWEFVcE1kZTFBcVdvTWJaN3ZOaWdUelEvSnJWZWhOK0oydGc2?=
 =?utf-8?B?dWg0WG5CcFFWYjdqTHRSMU5FV3FHeHJJcnhzTC96eUp3ZkRQbkkyMVFrTFo2?=
 =?utf-8?B?cS9mZWNtcUVOSFVjUXB3V2x0ek5BNUZVaTBUdHVNMk9RZDhlUWRMQXcxZjgz?=
 =?utf-8?B?cWcwQkoxRWQxelFaWFJKeXVBL3J6K0prK3YrR2tKREhjNExaN3EyRFE0RDZa?=
 =?utf-8?B?a0hEbDQ0YXkvbDEvOEQycVZXVFNiYjNLNzV1WWMxMUVubjhySVJraFlFdUJY?=
 =?utf-8?B?Z3dpWDB1VUV4K0c0bzczaloxdE5EZ2FCMFFTZE5MK1BDYWU3amdTVGNTSjFs?=
 =?utf-8?B?emtnNHhkKzVHZDFrWm5hSGpBVXhJRURKVzdiV2tzTmxYQ2tnWjRBbjV6ZnNu?=
 =?utf-8?B?Tmk0SFR1eE1CdFF3Yk1zRXkvZFhacHd3WmZCUVo2NHZzYnl5eEt6cWtqWEtN?=
 =?utf-8?B?am0rMWNrb3RuQ2ZsRVFodE1NTGJaamRzZmVtUUF2VnVGNXRyNGlHdGwzcHdD?=
 =?utf-8?Q?lbcN7AjGCUatjAcDlQlbnJw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F123C426D76E9D4BBB08741E410E56DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93d7ce5-b8e9-4bd2-6a18-08dc436de3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 14:57:23.1898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CDTquSB50tZvYaigmzGoAA6v9MgZ5vyAcu+sPQPQatwWXfR3oUlwvCL1uFvaXPcCvSi4hPN0AswhQauVXgsZSMx1Jd+I47JHjtlAMl0QKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDI0LTAzLTEzIGF0IDA2OjQ0ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiBJIHVuZGVyc3RhbmQgZnJvbSB0aGlzIHRleHQgdGhhdCwgYXMgYWdyZWVkLCB0aGlzIHBh
dGNoIHJlbW92ZXMgdGhlIA0KPiBwb2ludGxlc3MvcmVkdW5kYW50IHplcm8taW5pdCBvZiBpbmRp
dmlkdWFsIG1lbWJlcnMuIEJ1dCBpdCBpcyBub3QNCj4gd2hhdCANCj4gaXMgZG9uZSwgc2VlIGJl
bG93ID8NCg0KRXJyLCByaWdodC4gSSB0aGluayBJIGRlY2lkZWQgdG8gbGVhdmUgaXQgYmVjYXVz
ZSBpdCB3YXMgYWxyZWFkeSBhY2tlZA0KYW5kIHRoZXJlIHdhc24ndCBlbm91Z2ggZGlzY3Vzc2lv
biBvbiB0aGUgYWNrIHRvIGJlIHN1cmUuIEkgd2lsbCB1cGRhdGUNCml0Lg0K
