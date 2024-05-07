Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94CF8BDF3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 12:00:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VJWjbKan;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYfj5k3Dz3fSk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:59:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VJWjbKan;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYdz1t8Sz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:59:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoQppdzFxwWAE9s50cP1iMq3WHFCo1TIkWwZQFd8ltqH/5SblyqBvwdX9Z0S9WdG7kc+FKheFyTzFnj+mjdGHbl6u5KL3sr9nRX1Phc2ANf8c8p9x2mTB6MWDMkJv/k84b1Zgj5XtNPpVhJWbzFrJqoqbO0e1oMo3nWwmodKeFv/34HtNBRY92wdpPC3MdBxtlfq3oN7jDXWSh2ANadHQVHxjuCUUupcTxS89bTbWb4B4Ndzdlv2Lrjg36IFMb4YhdvIh84vj3zs6D3ye27cp8fH4wIM0owU0z/4q8tdZWfPAjkVdPv6SoSh+hRgTd4xiUn9yp1jSTnEYGfYsJdhwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDwUP4stYWEnsetVFMxtblnyMtR5UBZkR7Iox/Xy1AE=;
 b=jrzyoGKUVSNgb4Yymds0a4xdrCYq1GGBcdMWkUoEgyh0JdSb5eRQ3yc91G+GKlJuiqX3FnbRqmg8bSAFAUf5019GwRiz8TMmCRoLgHL9g4YCQBNH+yi3JpPeJGcYYYKQYAzJ0idnka9U7MQTn77I2gKNFhHY8O4VDXK+lPGK6bFvqfWX6ANwHnGBOBvBc2OsCzlX+f3wdFS33SDnOJfYKpNZcnYaDLFQCzO9tL+UxdOUXEeGQxkVNDsE+RhpPL9o6OEtd8UgMyo0rUDjKltZ1A0k1SPn+R1mGwhMjYUnxdMarGDrGfsZ3r+c63jBi/n20wMNBg80cbg92RIRsC0Tcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDwUP4stYWEnsetVFMxtblnyMtR5UBZkR7Iox/Xy1AE=;
 b=VJWjbKanW22cNWiVJ/6Etnn89DuKgptdzzuMPuXZhS2jUtWeCjHWljy7BBeWDkIkAOPvKabkWHRRoVhJGZnLsqLsJ8feRRaj2ZgO66CPYK6IidZHxQWpI99nNBeAKnbP9VjRuvs6wCyrx7fn9NUQ++e/TPMxeVv7zzWJig6JBpJte1wG6zdHy2podqQ+jSb74Ouax0b1J+/qxDYvMtw6moSofgDLsF87Ghbly1sJ/dOP41E5hd0Z1F3cLhlPG0nH5aiM2sNOog4oAuNer+pLnAtKz6yomsrEF1TEDcmf1op6kjQdp3HJo3GwyIod0geIOejgSH5ITqWEj3KJakc0+Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3659.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:161::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:58:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:58:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: [PATCH V2 7/9] tools/perf: Update instruction tracking with add
 instruction
Thread-Topic: [PATCH V2 7/9] tools/perf: Update instruction tracking with add
 instruction
Thread-Index: AQHan6+yLK7ttiJyIUGM8WsgGfkQsbGLivAA
Date: Tue, 7 May 2024 09:58:48 +0000
Message-ID: <7c8af115-56fb-4b1f-818c-f2a7d532166b@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-8-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-8-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3659:EE_
x-ms-office365-filtering-correlation-id: 6365b0f7-e6cb-4947-5d1e-08dc6e7c4aaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|7416005|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?djJ3RWM5ZG1BN1l2UUFWbHNSWnRwaWowSHYxMU9IcWVoK1BGV3RrSTFwVEhk?=
 =?utf-8?B?LzJYZi9OVXllbDJxaThMSDI3ZEU1eHhmTUxJSW5OYnF6WUpZQkpjMFBRRTF0?=
 =?utf-8?B?dU5jcy9LZFZNdWFBckduM2p5dCs4elpjODBQN1lHRUJNMHJyOGFzc1V3Uk9B?=
 =?utf-8?B?ME5FZXlTUkNIRzZBMzFQOEx0dUh4Si9VNnVucmlKUExzTFQ4UkN1alczRENB?=
 =?utf-8?B?d1pQUVpBdHArSS96b3RONkozK2NlaysyVHQ5YkhtcytHbG5Jdll3cDFtSmtG?=
 =?utf-8?B?ejg3dHAwTlYyays0Z3FGM1YyMzJnT0xSSW9McUNJeUV2T0dzTEV3QmFSZ3l4?=
 =?utf-8?B?dVdReUJYZkJ4QlErbzdKZ0JtYmlCOTBYRkdTalN2c3hRNTQ1bFhhUHEvUFhv?=
 =?utf-8?B?bis2d0tYeDdOUndGNEg2bVh0UmdZRDByZDhPeitlT3BoZ1hhdGdzQ1BvUzFE?=
 =?utf-8?B?OEpnSUY3WnRIUmQvNmQyTkUzMkR0Z2tUSkZORmk0Z1dORHpWeUNDOE9GNEtL?=
 =?utf-8?B?WkxMNWZuUWZoMWlhTzJjdHl2MXZxQTdOOWd0NWhKNmwvZGt6cmVWYWp4Vm9k?=
 =?utf-8?B?dXgyUHJmV2FVbWY0V043blZ1ZVhHOUZKSytJM0VHdnhKMk4rSXRaQ2JpaTdG?=
 =?utf-8?B?MWZwWE5Kd3h4dFcvV2NDd1lkZ09Gc1AzcWVTeGQzRUE1ZlIzWGgrYVZ1cGI2?=
 =?utf-8?B?V0p3SkwvblJmWStnMlg4MUlPZDh0dzU0UEtSWDdxdUV3RzFmSVpsOEl4bklu?=
 =?utf-8?B?Y3hxcVBpakhlYlBRRmZYS09WV3lzQ0s4ZFNKa0M5eGVTbmcraVgyMGgyWUl0?=
 =?utf-8?B?VVN6S2tnNk40T2t3VTQwcklsTkdoTGNhQUFOcWp2NGM3ZzNpekswOHRHVHhs?=
 =?utf-8?B?d015ajVjUy9HNHNnQUhQS2RET3drZlR5SzdTZVNnS0NhSExQQmQ4WXNjK1g1?=
 =?utf-8?B?ZFRJQVhZYUx4WStNUk9FekhZbXJzeWZ1R1AzSnEraGtyS2FJMkdmNzcza3dD?=
 =?utf-8?B?MzNmUHZlMTBoZmlnamdoSnpOeXJ2QkVGVTZ0U1FvUlZrMGNmNHRLaXFkSVpI?=
 =?utf-8?B?L29VUm9ZSC9YejAySEtUYXNWSVdOam0vQXdtbS96NGVub21TNjZYMzdMZndW?=
 =?utf-8?B?NTlLOElUamN1VzlnVG1IV1ZTTjBmbVN6cE0vdEEybXJPdDMrbDVRdTBsZjFw?=
 =?utf-8?B?REtEVWQwc2lGMm1NdVVnMHVaWWtFNUJTNytwdnAzZUFOWERqUlBSR0ZNcDl4?=
 =?utf-8?B?b1VYRjNzdUdCaE9BQmY3SmpySllROHR4cGJBN3BKZHBnMEtlaU5NeStDTFRu?=
 =?utf-8?B?WlBtU3BJRlVac3J6em1tOUVNc3ZZMFFzN1FZcGRlK1kvUmpSRXZMWHQvRmpr?=
 =?utf-8?B?bmdMQnJnYmNXeGNFWUZGZkxCS1pydjVSTFFOYkV3Y01FY3hRUDA0TFN5cTdQ?=
 =?utf-8?B?elFGSnBvclFMN2hFeGlkbFY3czcxZVhNdVV5c3RoUTlZcDBJL0gzMjFMTzZP?=
 =?utf-8?B?Qml3c2c3ZGs0QlZZeEhENitraHdvWnZPNEphaDAyaWtXR2JVaWRKNDh4eklF?=
 =?utf-8?B?NlJSQXdxalFEazBYUTE1U1dIVWhyL1lmZ0JMTlBydWE1ZmY0am5HSVZKL1Fx?=
 =?utf-8?B?UWZWcHdsVG1SaGdwclVRbTVibjRJM0xmUDFGZ0V5QUhtR2JiYUVPeHE3QU9t?=
 =?utf-8?B?QW00Q3hBcUlJZm9KYnkzT0xqRm1QZmpoTlB4aTVBTmlMT3djM2gyTHVSN0E2?=
 =?utf-8?B?L0tubnpJS0ZKOXIzRXVUM3p4cGc3cXEyU2hvOFlUeStZckJrOEJYQyt6YUhJ?=
 =?utf-8?B?azVUZms1VFRDVEhCTjNXQT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RlJISXh1YmhZWkMxYW1hRXVmZ211czBtVWNzaWRlTFZXeVk2OHdIUjVRcVZT?=
 =?utf-8?B?ZW5HV3VxT0gvUHVPY3gyZXlNUGRPM1dWbEJnQWJjeHU4aG40dHZobXM2Qm82?=
 =?utf-8?B?YW5sVEgzdEw3VkQ3c21sbWpWYzhaajQ0RVZ5cWtvd2xtcEt0REcvSVM2R3JN?=
 =?utf-8?B?TnlIY0l2Qk9mREUvdUwzVnhPVUdlc29BSW1kRWYwdDRkRTFIVlFyZ3Raa3ph?=
 =?utf-8?B?K0R3M1lTekpLUUxpR2hiRlRqS3VidU9aTkdRUmVCdlpTTmRQSnhlb1llRFRj?=
 =?utf-8?B?Y2VSejllaktNZW9uWXZKYUM5ZmNRUGdSMnQrNGlSK0xPTCtIUWJMbVUvZFJ0?=
 =?utf-8?B?aFhYZ2o1K0JzQ0ZYZUg5ZzlSR3YwV3pEVWFhNzdQS3loY3cva0VEdk9Fd2No?=
 =?utf-8?B?TjFNSHppR0w4R0p0SHlWV2d1MnJFZjV4OWdTSlliUW03bkZHRU40VURZcEYw?=
 =?utf-8?B?cndsVGlLYURLMmh4RitIZmNxNXdxQk43cmJ4NFkzcjByRWxGWXlwWDEyMEQz?=
 =?utf-8?B?TG1XQkFSVGRKaVcyT0V6ZXNvOVM2N1ZZZlB2NVNpL2FIV0FkUWM3dW1FODJG?=
 =?utf-8?B?T1R2ZE85ODc4TGZBMWRpTy81azNJY2Y5SEVzVFlMeFRVSjNkbEVsSndnb0lR?=
 =?utf-8?B?bHRWb2hNM1VVWjN6UlhNZ28vS2lSOU43NUdSNWtRaWlYT1ppL1NaaDgrZkZD?=
 =?utf-8?B?WFp4ZUNQU2t6bWxhekowL1kxU3pMZXRMVWh5M1ovOGxXcUNtV1JyOU54K1Jy?=
 =?utf-8?B?WktNeUhSQlRURmtNSUxXWWVFZ1BKcTBXOGFTTjlKeUJ0L0ZTQ3d0TUp4VGth?=
 =?utf-8?B?VjJpQWQvc000eDl4TUtLR25GblI3aWhSVFJHOW1nNlFhQldjdTQwZTRqanNP?=
 =?utf-8?B?L2kra1NuV0oyNlNiOWtUK2tZN01TWjlLYlNEZ3FzRWFFS3A3clNaRDFjbWlp?=
 =?utf-8?B?MnRnMGdaUmg4eEhReDNGdmEvYmVHMEJNdG8xS1hHK0ZIUjEvenpJMks0ZCts?=
 =?utf-8?B?VS9kMnY5K2NmZzJTMHZUYnVZU01INjRFTjhpZllUYmFTVldjdDJxdUsra09C?=
 =?utf-8?B?UWpwTUhBK1VlZEtvdjBETjBiSCttNkl3WTU2aUwzb0hGdU9jQ0Rka0FYZGlH?=
 =?utf-8?B?Mi9ZeFhqLzVGRTVtOCtSQS80QzVHMzk1RTQvUzZPYWkwUUV2c3ZXWTJVcFhW?=
 =?utf-8?B?eFpvK2FrS2V5ZDhuZ1lPVWl5YXljVVpEUTI4Z2o5bFBWdGVBbEMyeHYyRHB5?=
 =?utf-8?B?U3lxUUYwV3FpcFN3MTdZZjVkT0JZZUplSHlTMkxLQWFhK25qVHF3Vk12WHN3?=
 =?utf-8?B?b1BVaFhIYUo0Y2pyckhyZSsxems2VnhjcWNGbTFQemhJK1lGOEV0NytYaTFI?=
 =?utf-8?B?WG9vdklHeDFGQSs5VEhGd21VKzFUUkJlSXA1UHJhRFkyR0ZDMnN0VzhkcWhI?=
 =?utf-8?B?dUEzWkNlQ3VadTFPQ3g2NnpXTFVLTzFtSXpnOS9kM3grQWloTXIvS1cxY0kv?=
 =?utf-8?B?Q1FoS2tLdUNSRDNpT0Vya0drS2l1UXR6c2hkQVd2UHlnQytVK1FET1JPdmxt?=
 =?utf-8?B?U05aUGdlamxyS293QlhUdnoxVm1tOXlDbGhEN2NQQ0QxQXVyeHA1SGp4SEdk?=
 =?utf-8?B?aDVHK2xTRWlxd2pMdytUdENsWDBPTTJ2RzR3UENoY2hjZlpwYTNIbEFuTHVm?=
 =?utf-8?B?eFcxVURmaHk0Q3pwRDV2c0YxSW5PV29wd0NCTUZUeDE5ckgzb1JDa0pKTXVU?=
 =?utf-8?B?aHdTVEhWak5SS2ZHRmh1UC85VE16Rmpua1ZRZjkwL2RlL293VjIyWUl5ZWZG?=
 =?utf-8?B?NGVzWmQyZEVHVzJnSXhJd25VTDdMNVg3SkdGVVF1QjE2RkRwaHVZU29VQkh0?=
 =?utf-8?B?c1ZhaUhRSXBVV3J0TnJjQWNRck9lY01iWlh0dHVMREZXTHpkNjJhZzN6K1d2?=
 =?utf-8?B?ckVJdDFDTWtnK01MMENCT0ZFblowbGM5QjY5YldkMXM5SThvemFKa1REQ0J4?=
 =?utf-8?B?TE10TkZRWHAzeEdVaUZWMDdYeVBOWms0ajl4aW82NktlSVdPaHZiTm9XaThY?=
 =?utf-8?B?SWkvZTZRK1JCd2FZeWdUUVVoYXhxendkOGp5ZlI3aEthbUd6by81SDkxMUs5?=
 =?utf-8?B?cU9lTTk1WUZxQlEvQUVzNkhZOXpGVENBaGpvUWJtNW0ra2h0YXR3SXZZd0k4?=
 =?utf-8?B?QkwyamEvcEhtN0VzTkpNQVVzV0E4SUM4V2I3eTRiZFdqdWJXKzUzMlQrNkhJ?=
 =?utf-8?B?eTFycjhsT0dXbXczMkhSQkhoaHhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <191002C32D9EF84EA57AC37B8F858454@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6365b0f7-e6cb-4947-5d1e-08dc6e7c4aaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 09:58:48.7270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pd8uetDjO4/WJhgo+8Sh7n9KeVrtP+b3hB+Q1UeEvs1jRZSST2M8crsXttzUUTtg8xpScNP7NIuHJ1OiLL3oqll/y8u9kARkOMb8aqEwWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3659
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
Cc: "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA1LzIwMjQgw6AgMTQ6MTksIEF0aGlyYSBSYWplZXYgYSDDqWNyaXTCoDoNCj4g
VXBkYXRlIGluc3RydWN0aW9uIHRyYWNraW5nIHdpdGggYWRkIGluc3RydWN0aW9uLiBBcGFydCBm
cm9tICJtciINCj4gaW5zdHJ1Y3Rpb24sIHRoZSByZWdpc3RlciBzdGF0ZSBpcyBjYXJyaWVkIG9u
IGJ5IG90aGVyIGluc25zLCBpZSwNCj4gImFkZCwgYWRkaSwgYWRkaXMiLiBTaW5jZSB0aGVzZSBh
cmUgbm90IG1lbW9yeSBpbnN0cnVjdGlvbnMgYW5kIGRvZXNuJ3QNCj4gZmFsbCBpbiB0aGUgcmFu
Z2Ugb2YgKDMyIHRvIDYzKSwgYWRkIHRoZXNlIGFzIHBhcnQgb2Ygbm1lbW9uaWMgdGFibGUuDQo+
IEZvciBub3csIGFkZCogaW5zdHJ1Y3Rpb25zIGFyZSBhZGRlZC4gVGhlcmUgaXMgcG9zc2liaWxp
dHkgb2YgZ2V0dGluZw0KPiBtb3JlIGFkZGVkIGhlcmUuIEJ1dCB0byBleHRyYWN0IHJlZ3MsIHN0
aWxsIHRoZSBiaW5hcnkgY29kZSB3aWxsIGJlDQo+IHVzZWQuIFNvIGFzc29jaWF0ZSB0aGlzIHdp
dGggImxvYWRfc3RvcmVfb3BzIiBpdHNlbGYgYW5kIG5vIG90aGVyDQo+IGNoYW5nZXMgcmVxdWly
ZWQuDQoNCkxvb2tzIGZyYWdpbGUuDQoNCkhvdyBkbyB5b3UgaGFuZGxlIGFkZGMsIGFkZGUsIGFk
ZGljID8NCkFuZCBhbHNvIGFkZG1lLCBhZGR6ZSwgd2hpY2ggb25seSBoYXZlIHR3byBvcGVyYW5k
cyBpbnN0ZWFkIG9mIDMgPw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBdGhpcmEgUmFqZWV2IDxh
dHJhamVldkBsaW51eC52bmV0LmlibS5jb20+DQo+IC0tLQ0KPiAgIC4uLi9wZXJmL2FyY2gvcG93
ZXJwYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYyB8IDIxICsrKysrKysrKysrKysrKysrKysNCj4g
ICB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgYi90b29scy9w
ZXJmL2FyY2gvcG93ZXJwYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYw0KPiBpbmRleCBjY2U3MDIz
OTUxZmUuLjFmMzVkOGE2NWJiNCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMNCj4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMNCj4gQEAgLTEsNiArMSwxNyBAQA0KPiAgIC8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbXBp
bGVyLmg+DQo+ICAgDQo+ICsvKg0KPiArICogcG93ZXJwYyBpbnN0cnVjdGlvbiBubWVtb25pYyB0
YWJsZSB0byBhc3NvY2lhdGUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgd2l0aA0KPiArICogbW92
ZV9vcHMuIG1vdl9vcHMgaXMgdXNlZCB0byBpZGVudGlmeSBhZGQvbXIgdG8gZG8gaW5zdHJ1Y3Rp
b24gdHJhY2tpbmcuDQo+ICsgKi8NCj4gK3N0YXRpYyBzdHJ1Y3QgaW5zIHBvd2VycGNfX2luc3Ry
dWN0aW9uc1tdID0gew0KPiArCXsgLm5hbWUgPSAibXIiLCAgICAgICAgIC5vcHMgPSAmbG9hZF9z
dG9yZV9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAiYWRkaSIsICAgICAgIC5vcHMgPSAmbG9hZF9z
dG9yZV9vcHMsICAgfSwNCj4gKwl7IC5uYW1lID0gImFkZGlzIiwgICAgICAub3BzID0gJmxvYWRf
c3RvcmVfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gImFkZCIsICAgICAgICAub3BzID0gJmxvYWRf
c3RvcmVfb3BzLCAgfSwNCj4gK307DQo+ICsNCj4gICBzdGF0aWMgc3RydWN0IGluc19vcHMgKnBv
d2VycGNfX2Fzc29jaWF0ZV9pbnN0cnVjdGlvbl9vcHMoc3RydWN0IGFyY2ggKmFyY2gsIGNvbnN0
IGNoYXIgKm5hbWUpDQo+ICAgew0KPiAgIAlpbnQgaTsNCj4gQEAgLTc1LDYgKzg2LDkgQEAgc3Rh
dGljIHZvaWQgdXBkYXRlX2luc25fc3RhdGVfcG93ZXJwYyhzdHJ1Y3QgdHlwZV9zdGF0ZSAqc3Rh
dGUsDQo+ICAgCWlmIChhbm5vdGF0ZV9nZXRfaW5zbl9sb2NhdGlvbihkbG9jLT5hcmNoLCBkbCwg
JmxvYykgPCAwKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0KPiArCWlmICghc3RybmNtcChkbC0+aW5z
Lm5hbWUsICJhZGQiLCAzKSkNCj4gKwkJZ290byByZWdzX2NoZWNrOw0KPiArDQo+ICAgCWlmIChz
dHJuY21wKGRsLT5pbnMubmFtZSwgIm1yIiwgMikpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+IEBA
IC04NSw2ICs5OSw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9pbnNuX3N0YXRlX3Bvd2VycGMoc3Ry
dWN0IHR5cGVfc3RhdGUgKnN0YXRlLA0KPiAgIAkJZHN0LT5yZWcxID0gc3JjX3JlZzsNCj4gICAJ
fQ0KPiAgIA0KPiArcmVnc19jaGVjazoNCj4gICAJaWYgKCFoYXNfcmVnX3R5cGUoc3RhdGUsIGRz
dC0+cmVnMSkpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+IEBAIC0xMTUsNiArMTMwLDEyIEBAIHN0
YXRpYyB2b2lkIHVwZGF0ZV9pbnNuX3N0YXRlX3Bvd2VycGMoc3RydWN0IHR5cGVfc3RhdGUgKnN0
YXRlIF9fbWF5YmVfdW51c2VkLCBzDQo+ICAgc3RhdGljIGludCBwb3dlcnBjX19hbm5vdGF0ZV9p
bml0KHN0cnVjdCBhcmNoICphcmNoLCBjaGFyICpjcHVpZCBfX21heWJlX3VudXNlZCkNCj4gICB7
DQo+ICAgCWlmICghYXJjaC0+aW5pdGlhbGl6ZWQpIHsNCj4gKwkJYXJjaC0+bnJfaW5zdHJ1Y3Rp
b25zID0gQVJSQVlfU0laRShwb3dlcnBjX19pbnN0cnVjdGlvbnMpOw0KPiArCQlhcmNoLT5pbnN0
cnVjdGlvbnMgPSBjYWxsb2MoYXJjaC0+bnJfaW5zdHJ1Y3Rpb25zLCBzaXplb2Yoc3RydWN0IGlu
cykpOw0KPiArCQlpZiAoIWFyY2gtPmluc3RydWN0aW9ucykNCj4gKwkJCXJldHVybiAtRU5PTUVN
Ow0KPiArCQltZW1jcHkoYXJjaC0+aW5zdHJ1Y3Rpb25zLCBwb3dlcnBjX19pbnN0cnVjdGlvbnMs
IHNpemVvZihzdHJ1Y3QgaW5zKSAqIGFyY2gtPm5yX2luc3RydWN0aW9ucyk7DQo+ICsJCWFyY2gt
Pm5yX2luc3RydWN0aW9uc19hbGxvY2F0ZWQgPSBhcmNoLT5ucl9pbnN0cnVjdGlvbnM7DQo+ICAg
CQlhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7DQo+ICAgCQlhcmNoLT5hc3NvY2lhdGVfaW5zdHJ1
Y3Rpb25fb3BzID0gcG93ZXJwY19fYXNzb2NpYXRlX2luc3RydWN0aW9uX29wczsNCj4gICAJCWFy
Y2gtPm9iamR1bXAuY29tbWVudF9jaGFyICAgICAgPSAnIyc7DQo+IGRpZmYgLS1naXQgYS90b29s
cy9wZXJmL3V0aWwvZGlzYXNtLmMgYi90b29scy9wZXJmL3V0aWwvZGlzYXNtLmMNCj4gaW5kZXgg
YWM2YjhiOGRhMzhhLi4zMmNmNTA2YTkwMTAgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3BlcmYvdXRp
bC9kaXNhc20uYw0KPiArKysgYi90b29scy9wZXJmL3V0aWwvZGlzYXNtLmMNCj4gQEAgLTM2LDYg
KzM2LDcgQEAgc3RhdGljIHN0cnVjdCBpbnNfb3BzIG1vdl9vcHM7DQo+ICAgc3RhdGljIHN0cnVj
dCBpbnNfb3BzIG5vcF9vcHM7DQo+ICAgc3RhdGljIHN0cnVjdCBpbnNfb3BzIGxvY2tfb3BzOw0K
PiAgIHN0YXRpYyBzdHJ1Y3QgaW5zX29wcyByZXRfb3BzOw0KPiArc3RhdGljIHN0cnVjdCBpbnNf
b3BzIGxvYWRfc3RvcmVfb3BzOw0KPiAgIA0KPiAgIHN0YXRpYyBpbnQganVtcF9fc2NucHJpbnRm
KHN0cnVjdCBpbnMgKmlucywgY2hhciAqYmYsIHNpemVfdCBzaXplLA0KPiAgIAkJCSAgIHN0cnVj
dCBpbnNfb3BlcmFuZHMgKm9wcywgaW50IG1heF9pbnNfbmFtZSk7DQo=
