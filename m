Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9579F86A0CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 21:26:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QBW+KCly;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkpt01dPFz3vXX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 07:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QBW+KCly;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkps94Q7Qz3dWS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 07:25:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709065549; x=1740601549;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r1ifcatoiUsd+Xh1ttZqzMtffywVmMZdBueEkc6NyxY=;
  b=QBW+KClyBP6tzHfM0D4A+HeDycAxJOhBQLEYlT45RCokU5xBLOFLLQX7
   SfyRjDgf6B5rUOZQTbqASwP2HgOa1lAPC0sON/lU9wSoWfy0vK2aApJES
   LHSvXmunDHq8Mu4rGcPcQP8WbfVlf8rqc1Kl6M6vafCOFi+GO17UoLvdc
   CX323hOtHOCdcXXrNbH8UuKpQ3HykhaPithUPGO4E5lvWN4da4mXJCPYf
   dsUVNYtokTiK3gsZIBE9UgpR7pfdBNlmkqMYrToYLj3q7oUmm7KZwNxqO
   dBGr7/hswG71LdB2pJwgVX/QFiYcgZF7DpbwkpinHjFR6gYtSTVBwSM2f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25900228"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="25900228"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 12:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="11834764"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Feb 2024 12:25:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 12:25:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDUkeKD7a/FadVaGoSAfNwNG/XsUVoGG8zJkfEEzyxYgHDNMQCDpquST7bkOInhko1WyMBBjl2ZXBv9pg7htt+h11jR+Sbhva6YKVfj/mXYXtx/P2pXMUFKDJbDMRQBoyoFPKP+RXZhth/2MHwVx/b3Tdj9DkKDtrhWFQ5qt1Xh01YydRimqkWLD77A8U0O+SFXqoCrOhODebQ5NuEkXSAC2gl1VXtS0M2xP0XDrvCEjVwPCP6yk8Qm/4Jg4yM3fnA/rLCyEk/70FUh/PnUJ/Laq/hBfJ2o4XC0my1FBVokQgNfF8MnZaFH2IZLSj0VG/1c1qF18zxri01pQbVfdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1ifcatoiUsd+Xh1ttZqzMtffywVmMZdBueEkc6NyxY=;
 b=Az3uyDtD6hMps40M/GhuqMItCdIbZwgeQRxLvmjajj/KAxRRtvLgXX9sSPDO3RpblPvzUCSoGGhbT9ZaLVQpDcg2CkZwY2t+98O2WBzoVOMelVaCBX9OMFTatzvXt6KVbfVHC/8ZW8G65TGTtG5rQyLDkik9R7AxqCbJx6Yyk+gOws5MMvok8oGVzK0v2Tc7FT0QgRt2b7JzIEwnPHc20L6g4CO0XmDBc94X8HlJAKt+Ns7V4BsSUosxnlmHbKkU8iHrZ8PBopY3WsaLgvHS7zxO3xSHhKvd58PMQi+W2kK2BNglxNASowInEhiwlqnMREIA75du+S6FIrmY9E7KJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 20:25:39 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 20:25:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "keescook@chromium.org" <keescook@chromium.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOdsOIuf9v8cz0SXVaOI9gIdJbEdxC+AgAC5pQCAAAKPgIAAJA2A
Date: Tue, 27 Feb 2024 20:25:38 +0000
Message-ID: <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
	 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
	 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
	 <202402271004.7145FDB53F@keescook>
	 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
In-Reply-To: <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: eb1ef6ea-d7c0-4fe5-8e10-08dc37d24329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NTGFaDF3AnskwLwCUCcJ8N0/zZKaZUncC0PBTMkOc1/+C8Cv5uHaBOu/0Q6tj6L6OnYUoZ0IhpkhITJFTl9N28pMoNiArVQKRjr0aNKPsegKnP6SodL+rm1GrHAofKWFb3NTYH3pRdQDcxZmRAzWD/OO9INDb0toBE+rOWwZg5BTl7GwTo2kbHVaw72vrSwI52Jw05h2SEswUm44BBQFE5p4Lla31bEXG2o/FpfLEORugA55MTt2HXfDcekXKYTZXXKvlDGraQzFDD5TE+ojj/J1x9kVffHjhjFsCZaFfSweA5kRSKvIaFVGc3KjGc2oKPuK3zDFBYwj9dtT1VTrkM4kEKdpywbitWmzMO1CgoRsX9IzTcrE1lF81Jo91eSY/kOdWqe/uwMCUo/MTmj1YTwyCxQuirL0Qm/qTYxzkj4ztrgyNslC+Ng48JKLBJR0HhCRo0GV7MwOTuDcvXic3RNhla+GHbZHDDiZikr8IqCRl45qmi6m5CHniLGaB7knp8+q8+mEWK0yK/Xguz/9IXc0tcON942bJyG7esXH2+DRyJpA5I45weyfLp0rcrIODH9D0z9TW8BDZxa2NazPz61jMAgM8xWAoIpbtvyjTBP++XlkIw5VDsBiFLPyeO2DYstnM+y7qlYhGRSQA7eAGXlZrRzcLFUDFcxPNjt2HMZ9elDc1dELnLY39p829qizFDVyDdynQJDY2JYYhBNNzklaQWiq+eRrsKTiNm1Rjc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3BpWXVyVTNIa1h2Y1RGZEJkQUdSMHVhZUd4OEF2S0xaTjBBMk1nRk1aVDUz?=
 =?utf-8?B?dmE1VkZMMXF0Um1CS3kyWEtoTHhCeGxDK2ZzOWw3bXdyU0dZdjJjbUdSNTR5?=
 =?utf-8?B?QnhySExJVWF5amF1TVM3YjNBdThMcVc3cXBibnVybjk0WVhLVWV3c29ZQmlo?=
 =?utf-8?B?aVNoVlUyazdDUURWVitCejl0NkdCZzExL3ZrWmdSMlhaU1d0cWw4Q3NyMk42?=
 =?utf-8?B?aDNKb2owUmdQZmpLTzV1YkgvYnBOdElERTFpUmQ4djdMOU01djdaNDJiaVJ4?=
 =?utf-8?B?akhOSTJoUzNzZGtuV3BNZE1JU1FTK0x0UVBYMzROSTR4NmZiZFVoUDRnOFRP?=
 =?utf-8?B?QmVjeG9DYzEvVmlzOXJTY2RMcUh4dlhHcWg0cGdvVUtzTk14R2N5djVhMm1P?=
 =?utf-8?B?NXZEcC81WlNzdisrV1BTY0dwbndyQXg4K3dtTWJsSU5SS0JKSkI3SHRhcnBy?=
 =?utf-8?B?L2cwNmhwNng5NXgxWnhSWXdXK3E5V1VmUmJaVjJHZDdwRGM1WE5TTHd6OC9H?=
 =?utf-8?B?bG8wMmxZZlIvYUwyR0VmOVdIWjFvMnczMmw2N0pEbjh0alpkT0JBMWs4aXJp?=
 =?utf-8?B?Y3BOVmphcmdBVEtsQ2NMZnZyQ3RUenVGRHM4YTdIU0ZlRSs5WFRnQWZ5RUMx?=
 =?utf-8?B?OWF3OTJyMHkxUEs5N0V1VFZOenFHYTJybzZpUlVzUWdPTFhHRlcyQTdJZlJQ?=
 =?utf-8?B?OHErMXpVd3c5ajNzOTdoaVBubWczck5Gd3BMci8zbkdFV0xvN0Z1TnNPMVBN?=
 =?utf-8?B?d0t3bEMxNHA4amFvYk1ENFJRcldjemhnMjNvSU1OUUtySjNrbHYyTllKdTl1?=
 =?utf-8?B?WUNJNHllQWhZQ0I3SnI5VXo1TWVZUTl5WnZ3dk9kOFlYeXZuSXRDN2NaMnFH?=
 =?utf-8?B?Qm1Ub2NUejl0ampLMXRySERieUV4YUVxNXNUT2oyZTdwVHFQUWFQazdyeDhy?=
 =?utf-8?B?dGExNG5ja3hFNE5CZXNKODMxUjFkWWhRd1YyRmVHbHlBNkVxNnl4ZUJ4NUhx?=
 =?utf-8?B?WnN2Snk1OHZFYWFOa3llZ3c1OEZ2L0Y2VVpuTlpGRFNIaWZRL3dWaUJPaEo3?=
 =?utf-8?B?QklqWmxBVTlHNEt5eThFTFM3QXA2aW54QTBVMm9qSVpwK1h1ekQ0Z1lSZ0dr?=
 =?utf-8?B?dWN0S1E4eTdNMUMvemlGYncvdHViTm0zOGd4cVl1dGdxR0hsek9qMzFiWjNE?=
 =?utf-8?B?RVRDaG53ZXdYTE5rQmZpWTc0aXI3OGg5UHZoTzhkZ0hubW91UDZlZHNFeDlK?=
 =?utf-8?B?bGp6QlN4YmNmSjlOMUZxY3Y4U28rajBLT2xNNWE5cTJEaE1qRVd4NjQzOVE3?=
 =?utf-8?B?QUk4M21wT0kvLy9sclpuaDRlWmdyaG1VcC9KWG8yNnU2R09Ed1d0U21FVDRO?=
 =?utf-8?B?bDQ2WDFzYzBSVnFCZEpoRnF4ZjJmck54R05HcVlpL1habW9uZWlDR0Fpak1H?=
 =?utf-8?B?dVpRTWZDUGJPK2Y5OFI2YjYrT0dFNDB3ZDZPdWV2RXUyM01VTmtBNHFWM3hs?=
 =?utf-8?B?R3R4eGo0MlhzTjBnejBPeTNPNXRpMzBnSjM5YjlMd1graXp1Q21iQUlKL0tB?=
 =?utf-8?B?a3RWRDJHZjRGaGhmdTBLNG1yYittOEZ2OForemNJR01WbFZKSWFFY0xFeks1?=
 =?utf-8?B?b2Z1UXhUVXJKb1ZFK3JwWXpjTktrY3BuNmtKaEg5NXBycDd0ZVZzR25vRDF0?=
 =?utf-8?B?WHUwMXNjaG8ySTNKdHd0d1NFQ1lhNmp6QzBLOFhhREJHVmNRMFJ2TnB1YzdF?=
 =?utf-8?B?STZuWUZzbFVNTytyRDh4anZFMG9hK2pNZ0VINUUxamdzV3FJTFozOXpHcUlE?=
 =?utf-8?B?WC9OTHpMNGVLcENGS2pUNUU2a2tqV0FSUjN6UjJrYTU2NDk3dTlhUUkyRWhv?=
 =?utf-8?B?dnBWbVlsUkpPZ0ZCZ0N5TU9HSldhNkl3ZW1udWxvMFBCRHlzYzBmVHVQbDBj?=
 =?utf-8?B?d3VZZS8reVVWRDJnUGJsTEJHV3ZKTFF3b0FXNzZ5K2M4SmNXSzdUWnZkQ0ZH?=
 =?utf-8?B?SmtIcCtMYit6cU5sUFB0VmdoeVRsNEJiVVdsVXhuZHNhZ1Rha0lIY3NpS1ZC?=
 =?utf-8?B?UWkzU3ZPK1h4YTdkdE94T1VWRTFnRVhqWVI4TlowR1dvVG5VTm9xUjl0Umxy?=
 =?utf-8?B?L3Y4UDh4S1I5YnY2OVNvYS9oaHVoeExqdDVrOCtaNWdMSG00SDZmRWFUZkZB?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64F24BEF83BF4C48A11FEA975D7F6246@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1ef6ea-d7c0-4fe5-8e10-08dc37d24329
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 20:25:38.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alyDoEOTBDOL/uZHfXWW+JI2if0b7ra4RHspdeUPmWcysp7Uwk7OnuVYMG6DZLlWIgoM1QzJvIhlhEfWfKQXg55gvR+u8ebmb52Ti2XnUlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

T24gVHVlLCAyMDI0LTAyLTI3IGF0IDE4OjE2ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiA+ID4gV2h5IGRvaW5nIGEgZnVsbCBpbml0IG9mIHRoZSBzdHJ1Y3Qgd2hlbiBhbGwgZmll
bGRzIGFyZSByZS0NCj4gPiA+IHdyaXR0ZW4gYSBmZXcNCj4gPiA+IGxpbmVzIGFmdGVyID8NCj4g
PiANCj4gPiBJdCdzIGEgbmljZSBjaGFuZ2UgZm9yIHJvYnVzdG5lc3MgYW5kIG1ha2VzIGZ1dHVy
ZSBjaGFuZ2VzIGVhc2llci4NCj4gPiBJdCdzDQo+ID4gbm90IGFjdHVhbGx5IHdhc3RlZnVsIHNp
bmNlIHRoZSBjb21waWxlciB3aWxsIHRocm93IGF3YXkgYWxsDQo+ID4gcmVkdW5kYW50DQo+ID4g
c3RvcmVzLg0KPiANCj4gV2VsbCwgSSB0ZW5kIHRvIGRpc2xpa2UgZGVmYXVsdCBpbml0IGF0IGRl
Y2xhcmF0aW9uIGJlY2F1c2UgaXQgb2Z0ZW4gDQo+IGhpZGVzIG1pc3NlZCByZWFsIGluaXQuIFdo
ZW4gYSBmaWVsZCBpcyBub3QgaW5pdGlhbGl6ZWQgR0NDIHNob3VsZA0KPiBlbWl0IA0KPiBhIFdh
cm5pbmcsIGF0IGxlYXN0IHdoZW4gYnVpbHQgd2l0aCBXPTIgd2hpY2ggc2V0cyANCj4gLVdtaXNz
aW5nLWZpZWxkLWluaXRpYWxpemVycyA/DQoNClNvcnJ5LCBJJ20gbm90IGZvbGxvd2luZyB3aGVy
ZSB5b3UgYXJlIGdvaW5nIHdpdGggdGhpcy4gVGhlcmUgYXJlbid0DQphbnkgc3RydWN0IHZtX3Vu
bWFwcGVkX2FyZWFfaW5mbyB1c2VycyB0aGF0IHVzZSBpbml0aWFsaXplcnMgdG9kYXksIHNvDQp0
aGF0IHdhcm5pbmcgd29uJ3QgYXBwbHkgaW4gdGhpcyBjYXNlLiBNZWFud2hpbGUsIGRlc2lnbmF0
ZWQgc3R5bGUNCnN0cnVjdCBpbml0aWFsaXphdGlvbiAod2hpY2ggd291bGQgemVybyBuZXcgbWVt
YmVycykgaXMgdmVyeSBjb21tb24sIGFzDQp3ZWxsIGFzIG5vdCBnZXQgYW55dGhpbmcgY2hlY2tl
ZCBieSB0aGF0IHdhcm5pbmcuIEFueXRoaW5nIHdpdGggdGhpcw0KbWFueSBtZW1iZXJzIGlzIHBy
b2JhYmx5IGdvaW5nIHRvIHVzZSB0aGUgZGVzaWduYXRlZCBzdHlsZS4NCg0KSWYgd2UgYXJlIG9w
dGltaXppbmcgdG8gYXZvaWQgYnVncywgdGhlIHdheSB0aGlzIHN0cnVjdCBpcyB1c2VkIHRvZGF5
DQppcyBub3QgZ3JlYXQuIEl0IGlzIGVzc2VudGlhbGx5IGJlaW5nIHVzZWQgYXMgYW4gYXJndW1l
bnQgcGFzc2VyLg0KTm9ybWFsbHkgd2hlbiBhIGZ1bmN0aW9uIHNpZ25hdHVyZSBjaGFuZ2VzLCBi
dXQgYSBjYWxsZXIgaXMgbWlzc2VkLCBvZg0KY291cnNlIHRoZSBjb21waWxlciB3aWxsIG5vdGlj
ZSBsb3VkbHkuIEJ1dCBub3QgaGVyZS4gU28gSSB0aGluaw0KcHJvYmFibHkgemVybyBpbml0aWFs
aXppbmcgaXQgaXMgc2FmZXIgdGhhbiBiZWluZyBzZXR1cCB0byBwYXNzDQpnYXJiYWdlLg0KDQpJ
J20gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCB0byBkbyBoZXJlLiBJZiBJIGNoYW5nZWQgaXQg
c28gdGhhdCBqdXN0DQpwb3dlcnBjIHNldCB0aGUgbmV3IGZpZWxkIG1hbnVhbGx5LCB0aGVuIHRo
ZSBjb252ZW50aW9uIGFjcm9zcyB0aGUNCmtlcm5lbCB3b3VsZCBiZSBmb3IgZXZlcnl0aGluZyB0
byBiZSBkZWZhdWx0IHplcm8sIGFuZCBmdXR1cmUgb3RoZXIgbmV3DQpwYXJhbWV0ZXJzIGNvdWxk
IGhhdmUgYSBncmVhdGVyIGNoYW5jZSBvZiB0dXJuaW5nIGludG8gZ2FyYmFnZSBvbg0KcG93ZXJw
Yy4gU2luY2UgaXQgY291bGQgYmUgZWFzeSB0byBtaXNzIHRoYXQgcG93ZXJwYyB3YXMgc3BlY2lh
bC4gV291bGQNCnlvdSBwcmVmZXIgaXQ/DQoNCk9yIG1heWJlIEkgY291bGQgdHJ5IGEgbmV3IHZt
X3VubWFwcGVkX2FyZWEoKSB0aGF0IHRha2VzIHRoZSBleHRyYQ0KYXJndW1lbnQgc2VwYXJhdGVs
eT8gVGhlIG9sZCBjYWxsZXJzIGNvdWxkIGNhbGwgdGhlIG9sZCBmdW5jdGlvbiBhbmQNCm5vdCBu
ZWVkIGFueSBhcmNoIHVwZGF0ZXMuIEl0IGFsbCBzZWVtcyBzdHJhbmdlIHRob3VnaCwgYmVjYXVz
ZQ0KYXV0b21hdGljIHplcm8gaW5pdGlhbGl6aW5nIHN0cnVjdCBtZW1iZXJzIGlzIHNvIGNvbW1v
biBpbiB0aGUga2VybmVsLg0KQnV0IGl0IGFsc28gd291bGRuJ3QgYWRkIHRoZSBjbGVhbnVwIEtl
ZXMgd2FzIHBvaW50aW5nIG91dC4gSG1tLg0KDQpBbnkgcHJlZmVyZW5jZT8gT3IgbWF5YmUgYW0g
SSBtaXNzaW5nIHlvdXIgcG9pbnQgYW5kIHRhbGtpbmcgbm9uc2Vuc2U/DQoNCg==
