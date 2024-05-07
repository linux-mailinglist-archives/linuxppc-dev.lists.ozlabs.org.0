Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6E8BDED3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:49:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eXIRK5cY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYQS4xmbz3cW4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eXIRK5cY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYPm0Fn0z3c4P
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:48:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVxx/VRRNCx6BanLpxZSWiX94O4GzhM3XsTCAFTWEnIHkh7WQWGaDtk2AJwrPq9VF7PfcsZ0Vw/pv6dSyVqNx4iEK2pXJIrhBBcM8gZoobQ5VsXoQalA9G0LKgWvJXYr+85HDBoqkyfkBRD9c+/5QsVATvNf9nDLRucnk1hdsfYOrB9pEMVfFuAzkRVmCo2n5WQPpigy9TRLhrfM/NlXgQPZmOFxiUyPGf1pHyVIC/63D9Ui9eHHcqB/FRJUH5UKywx8BaSO1pF0NpnpXtQ9zCpZSTKWum0UMdSfAfuXLCro6HSHOBDOoBiiKPppLa0LvcIyxqU+fOAnfKV+Icq2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfpzqXw5dKChtYo8sQQbJ9B9hnlkZVDKWTj7knXdwBQ=;
 b=fa9ETenZJrf72HPpWjcboC5o3Th8m4oaNr+q14iGQAD7t7L2FTxVNuPvYy2DtYesRFNexzNruRbdE9gWtECvOW2uje/MJ59/LSew3w7cwVpCBqYCFU0oL9ZVptMuGNBX0JVbDY3E9F5pYUEpBFwDYuMTZ+ncqEJ3y1o6aV1nKC4K6sq2MJRYKAfC9LV1qNA78mYZWJTCA6wsPwincZlf+OSBtDhxX828L0hg2UDpqLf7ef7sghuy7OpEfXIDP9DFFrvQv5h/7+gPvYyPGiovcGb3dWQlweUp5i/IPn1+MLUq1V10s3gpu8ZV8GHBfU2Sqjxv4x8jdQjvXinH6GuAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfpzqXw5dKChtYo8sQQbJ9B9hnlkZVDKWTj7knXdwBQ=;
 b=eXIRK5cYgdgd1p5jtsKzS6AB1077Gjq8jg5XirnjfmBbCqC26AdvyFsBqnhBlTWWojUTKmG94uDeCUj6NLK0oriaw8dPuCiZrIM0JruY3pXZItC1AGd7LK/iIbed4hEwGmHjGbvARNPnEA81cp2xmR8HkF7UJM71oLm7bCudQGgJRvxY/Jt93ahM0BZOf3H+FPwKi6qGf+8pLUX0OunVZ/C0rlb1sli5Ui/Rdwn7bRmrymmbPMXXNfoWQPm4xYQfxf4rrVxHwrKe046OmK5UMvjc/tllYHgSLUCb4Ze4iKrQyD/1O9pu7NQ6G+/rgKTLa+g7QVeiuGGIjNdK8pJP6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PASP264MB4995.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:48:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:48:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: [PATCH V2 5/9] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
Thread-Topic: [PATCH V2 5/9] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
Thread-Index: AQHan6+u7W21sOc0QU+PhaubJqf6RrGLiAKA
Date: Tue, 7 May 2024 09:48:19 +0000
Message-ID: <dd7ea638-8a97-4ad1-9e56-5e444bad9252@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-6-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-6-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PASP264MB4995:EE_
x-ms-office365-filtering-correlation-id: 6fe4873d-5408-4470-c6fc-08dc6e7ad3dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?dkZsSVIzUHRLYTNLNGlRZzJ1SS9HMGF5Y1lXcWxPbnZLbXJDVmI3NTBMVHI3?=
 =?utf-8?B?eGNwQXVXNlVPSTBaUnNieWwycC9EWmRXZ0dzTC8zMWlBTWlaS0xXU0FOT1ZQ?=
 =?utf-8?B?bWhBVjdETUZFVzhUK2dwVjFtMjFXcVd4SkZSNUtpU3FpczN1ZEEyaXV4ZVZj?=
 =?utf-8?B?L2xHNUc0a2cyYmhieG4vZXZVVGdRU0kvclg1Wm12UitOT3hSbXJZeExWMUl0?=
 =?utf-8?B?QUdtVHpDVHJWV1JxMEpZSXVDL1NwL004UVI2aWdQN01sekl0eWVqMGxXdzl2?=
 =?utf-8?B?LzQ3RUtZdjhWVUZrKzQ5QmgxajdOak5NZmdqTTNNeFZFaEp2Nm04UEQ3b3VE?=
 =?utf-8?B?bzNSaDN2NkFmTUhVbksxY25PTER0ZkpJWVNjckhkVVJqZVhBRERxU2UwQjZ2?=
 =?utf-8?B?Y2lvNCswRXMzZ0NtOFZZUDdlbEtWK0hUM1FycmdCVjZVWWx1dmwyMVc0Y2h1?=
 =?utf-8?B?Z1pYbnY0VlUvaGVLWVdPTVMzZlZrSVlRdy9acGFsSzhhcWtwMzdQcXRKWGx3?=
 =?utf-8?B?MGozWFd1b0dxSmdZSVl0RThWTTJ4NnNXUDdyYzV3UXZqWktQM01UYUdHYkF3?=
 =?utf-8?B?K1NCZjlob1BYeWxSYTZPUE1iS0t4b1VHY3MzOXIzU1crUXhxTEJUM05SRmFO?=
 =?utf-8?B?ZU1mS0t5ZWsxQ0xVNnA5R0xxSG1ha29MR0l2L3E1b1BLd2VxQzg2emNxNGM0?=
 =?utf-8?B?VDlwWXdna2cwZ2NFS1h5WTNaY3VMQ2VLL1lRaDl3SlJKRXBTbFpsQmYySkYw?=
 =?utf-8?B?cE1RQXd5WDdsdUdJbUNERmNRdE12M3Z5eGdWQWxZWW5DWEhGcUhkc0VPUHIw?=
 =?utf-8?B?VXFNUmwzTkJQNW04b0tGVFN5OGRuM2EyTWdwZkdFMURLTHFrajZKWGwwTkJy?=
 =?utf-8?B?dUJRdnRORDRhWGlsTFR4ajU4V1g4K0VJUVFoR0p4WFQ0T0JwWUdRQ1ZVOWpn?=
 =?utf-8?B?UGdKWHhLRzFNQkZUZ1k5bUlqblhoTGI5UHdoSm0yVVZiaThqN0V3bFk4U29r?=
 =?utf-8?B?UnYrZ0JXelBjUy9pOEdIMjFuc1FpOHB3MXBUaU9ZQUlVSUt4NjFKbzJVS3hq?=
 =?utf-8?B?U2tVajlKSmJVeGZscGlrVkNrN21MRG15dldMdis1Z3JiVWVWM0xnYUttUTIv?=
 =?utf-8?B?WElxVTBvRHV3UW50RjBVZk1KUjhoclNidm9UMDdpZzBnUE1HSFQvbEZEc3JU?=
 =?utf-8?B?Q0VmWnN5Y0tkSVBJbk8wV0xxRUJsR0RTeE1OTDNZQ3I5YUQyK1I3OWFWZlRY?=
 =?utf-8?B?djdBc3NQbkJ0QWc5c2RaK0FLQW9ENDZEakpCLzUzR3Erd3VQL08veVhyb2tE?=
 =?utf-8?B?bTVEMndFSU9JSXo4VnJ4QWNMOUJyVjk1UGhUUjZEMVJUU1dMMVNCU24zLzMr?=
 =?utf-8?B?UVpKVGM5L200c3h3bGh5OFc4c21sR0xuR2FxOFRBdG5HMmJuYVp0NXh5SHNW?=
 =?utf-8?B?TE9GVVJhQjk1NVJlQ1hnQWppemYxanZ6T0hzOHhKK0s3NFJCM1FOb1dmUzFD?=
 =?utf-8?B?N1FmSnZrU2YyMUUyVUdMT1pVZGZicGthemh6d3NhK2RGT09NeFViZGUzaDdD?=
 =?utf-8?B?SlYwQ2dqTG45cDlManBadE9adXdLM1AzZmE2VUV4MGRUcm5qeFRCd24zSEtN?=
 =?utf-8?B?NUJxWW1JTWFlLzVoeVU4K1JVdlp1U3ZUTWxpczd2bjlYMGNBZ0JrUFlObUpu?=
 =?utf-8?B?ZFBBc1pZcUdUMllWUmQwZno5emRiRTVMdXlXUHArblprb3BsbnNqMnJTUWM4?=
 =?utf-8?B?Nkc5YjBtRFQxeVhIanhhaXRBSks5ZnM0SUJuWG4weEsrbytMdTBON0pyQlNZ?=
 =?utf-8?B?di85eENoUlF6ajZKNUdGdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eVB4N2lwdStvbFgrUWJ4Si8xOWQxWmFSR0J3V0JxTjRSWUNjRk1DNllqTGR6?=
 =?utf-8?B?cmZQY3hnN3JTdTIwMU15OVJ2akZiRVFCSERDK0tlMm5yUSs1ODhXdytwTnkz?=
 =?utf-8?B?Uy9NeDArY3B2ZzgxNCtxYmdOR3hrSTNwUXhXSW5nRk1GZTdFaXFBYXVkcXRq?=
 =?utf-8?B?N3c4ODZHY0MzSzRuZ25YaFd6eCtQZTRydmdYVG5kQ0l1ZjgxRWZBb0h6OHFI?=
 =?utf-8?B?WGZnVVlCaXN1V20yaDZzN3BveGVVT3d0ekNObVAzQ2NFWFpFSEVmMzhMYk1I?=
 =?utf-8?B?dWY0ankyeEtoZlBWcnh2T0IzRVptVS9MRGplRVB4ckdLQzVXSzhNaHlNdXJj?=
 =?utf-8?B?aVNqYnM5RUJHNzVSNXA4cTlLY0VheUtpRzRMUGdFM1J1RGdtanVoaFJSK3dJ?=
 =?utf-8?B?ME5vTzlzZmtkQWNJaXlCcHZzRmhqT0R1NkgvK1hpZTQ4ZEdhbWdaSjc1b09B?=
 =?utf-8?B?RFFQOEx4WWdxVDFGa0d6ZzZ4cDVENTRmUjJPVlpJZkpXd2ZNQ1I2RDJuMkNX?=
 =?utf-8?B?d0xORmlXSWd0c0FNQ0ZZRlVoVGRJYitFR2RSSkZHTDArRzRCbGJPLzc0YjM5?=
 =?utf-8?B?dTc1NXFMSy92S3RYN2ZuSU1Ud0FCNXgyK0NKckNBNjVTSGtldlIvT2sxbS9k?=
 =?utf-8?B?N1lKZkRvaDlEc3hmckdzWUwraXc3czNmTGc0WG9mOGNubWk1SkdSWU5mTDRZ?=
 =?utf-8?B?VkNoVktVb2NVL24zc0c2enlVTGNiY0N1MXdUclB1ZmxDZno4YThadUViRG1H?=
 =?utf-8?B?amREekwzTzN4MUUvRTYwWTQyMHNjc2g0RnIrVEJ4N0pBWHI5bFRINmwva1Mv?=
 =?utf-8?B?LzZXQ0RZL0l6ZngzWktOOG9UYkJ0TjFzcDJYMDE0ZmRLczJPVGcxcGRyVklX?=
 =?utf-8?B?U00vaFY3cGZLaHZucy9wL0NveldHTE9WRW1QNzBmcGdsRmZoazJuQ1Vpd202?=
 =?utf-8?B?R1lkR05ydXU3TUdUdGhzMkJQemFKRENiWmtPeXVUWjZ6Z2RudjFldXdkWDFa?=
 =?utf-8?B?Q0kwaXhQa1I2MldGdXphTzhVelpLbW1TakdnL0ZER1k4SEhKVVpBYTU0TEpS?=
 =?utf-8?B?aVNCOVR0VDloOERLbzZZTU5oS3lSeis1ekFUNGtLNGVZanhlQ3FRaUVnVDli?=
 =?utf-8?B?eEVmWnNZcy9ZT1M1Y1RLNGN4eU1FRVRlM2ZCMmpSS1cra1dKa29XSWlRMjlr?=
 =?utf-8?B?ekN2U3lYU3dYblNDQ1BYZWEvYkpwdGg1Lzl4TGhVN2pQUi9XUXVWa01LNlR0?=
 =?utf-8?B?d1hITnlNUkIrQ05FTnNuNDYyOWlVS1ZzRDVZSlFrYjlrb2hNbU1qbTQ5Y3lq?=
 =?utf-8?B?bjVRUWZqbk1LcW9jRXhmUjhseDZ3QmRtWWpSTjdwUXk0Q1hjeUNnRENNditv?=
 =?utf-8?B?RlBHVHZFZFVNRUZGY0xxL1liUitobGkyNVlGV2ZiS1lvUnNVSWRlWFZlNHhW?=
 =?utf-8?B?M0V4L1VLTUZ1MllmTGRvMUg0VUhKU2xmRmxqYlZNaGZmcjUxL3VKSVpFc21M?=
 =?utf-8?B?MlczOGVCWXc1b1h5K2tTQ21iUHZEdWxHWG1ETHFFMHRudDExZDB0TXVSVkRT?=
 =?utf-8?B?Y2pGOEtDQzIrb0NrS0p5THczZmR5MHZwb1Q4NmFDM0FoYW1vRUpqL0F6RklG?=
 =?utf-8?B?Q0hnNkJFN2pweG9qU1VuSVpXL050ZXNQTDYvZG90OFB6eVN4VGxFUUV0Ykwr?=
 =?utf-8?B?Y0dWNjVmQTRRbFZlWFZ4S01yMUhPTmtzV0V1dTM0R2ZPd0xQQ0ZTa0VqRi9C?=
 =?utf-8?B?ZzBNdFh6ZkhNVlYyNDV5ajhVeFV3TUx3SW0vejBIanRlT0tGdzBlVGpaTU5V?=
 =?utf-8?B?OXRqdkNYb0VuUGFJMGU2M2RId1lOaEtjK0pqcERodGNub2xJd0pyZUlCdXJy?=
 =?utf-8?B?Q2V4bmw2NXVCeUpnS01mbEcyWEVwd204NVNOZHNvM0RNYUpRblBxUHZBcy8r?=
 =?utf-8?B?TSt3QzdHVlV3V1VwVlVWTWhteXd6czc5Q2lzMkNuRE91MEkxZjNvVTFVdGxS?=
 =?utf-8?B?bWFuRjRVNHNsdUNwbCtuV3NUUkk0SDd6MGJVaS9HWWJ6MnlNMFNSZUc4UTBx?=
 =?utf-8?B?TWhCdHhraVJIWDEzRTNmNzRYUENyTUFNcTdCei9ETW90U3dCblkvSTRHc3BI?=
 =?utf-8?B?Q3BzbE5rY000UGpRZWtLbmlNWjRvblQzVWNHZHY4Q3VXUitMTDM4MzlYVldF?=
 =?utf-8?B?aEdmQlJvN3J1M1YvTDNadjUzMi9YQ2UvZUwySFU0dVdLQnBRdGQzNXlreTZt?=
 =?utf-8?B?cmVyVkt5QTNnLzh1c2g0bEZMeGlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DF5C587FE890644B25AA0FF4B2FD93D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe4873d-5408-4470-c6fc-08dc6e7ad3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 09:48:19.8882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pb7trAJNRSs4rBA4G3o0LzYCG/+2zrdgEOQADG4bbA20nU3RvZaN7N45CWBajXzgeYzegUSozFyO3xTcegbHd8vA6zYic+lUFoDijnsURzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4995
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
VXNlIHRoZSByYXcgaW5zdHJ1Y3Rpb24gY29kZSBhbmQgbWFjcm9zIHRvIGlkZW50aWZ5IG1lbW9y
eSBpbnN0cnVjdGlvbnMsDQo+IGV4dHJhY3QgcmVnaXN0ZXIgZmllbGRzIGFuZCBhbHNvIG9mZnNl
dC4gVGhlIGltcGxlbWVudGF0aW9uIGFkZHJlc3Nlcw0KPiB0aGUgRC1mb3JtLCBYLWZvcm0sIERT
LWZvcm0gaW5zdHJ1Y3Rpb25zLiBUd28gbWFpbiBmdW5jdGlvbnMgYXJlIGFkZGVkLg0KPiBOZXcg
cGFyc2UgZnVuY3Rpb24gImxvYWRfc3RvcmVfX3BhcnNlIiBhcyBpbnN0cnVjdGlvbiBvcHMgcGFy
c2VyIGZvcg0KPiBtZW1vcnkgaW5zdHJ1Y3Rpb25zLiBVbmxpbmsgb3RoZXIgcGFyc2VyIChsaWtl
IG1vdl9fcGFyc2UpLCB0aGlzIHBhcnNlcg0KPiBmaWxscyBpbiBvbmx5IHRoZSAicmF3IiBmaWVs
ZCBmb3Igc291cmNlL3RhcmdldCBhbmQgbmV3IGFkZGVkICJtZW1fcmVmIg0KPiBmaWVsZC4gVGhp
cyBpcyBiZWNhdXNlLCBoZXJlIHRoZXJlIGlzIG5vIG5lZWQgdG8gcGFyc2UgdGhlIGRpc2Fzc2Vt
YmxlZA0KPiBjb2RlIGFuZCBhcmNoIHNwZWNpZmljIG1hY3JvcyB3aWxsIHRha2UgY2FyZSBvZiBl
eHRyYWN0aW5nIG9mZnNldCBhbmQNCj4gcmVncyB3aGljaCBpcyBlYXNpZXIgYW5kIHdpbGwgYmUg
cHJlY2lzZS4NCj4gDQo+IEluIHBvd2VycGMsIGFsbCBpbnN0cnVjdGlvbnMgd2l0aCBhIHByaW1h
cnkgb3Bjb2RlIGZyb20gMzIgdG8gNjMNCj4gYXJlIG1lbW9yeSBpbnN0cnVjdGlvbnMuIFVwZGF0
ZSAiaW5zX19maW5kIiBmdW5jdGlvbiB0byBoYXZlICJvcGNvZGUiDQo+IGFsc28gYXMgYSBwYXJh
bWV0ZXIuIERvbid0IHVzZSB0aGUgImV4dHJhY3RfcmVnX29mZnNldCIsIGluc3RlYWQgdXNlDQo+
IG5ld2x5IGFkZGVkIGZ1bmN0aW9uICJnZXRfYXJjaF9yZWdzIiB3aGljaCB3aWxsIHNldCB0aGVz
ZSBmaWVsZHM6IHJlZzEsDQo+IHJlZzIsIG9mZnNldCBkZXBlbmRpbmcgb2Ygd2hlcmUgaXQgaXMg
c291cmNlIG9yIHRhcmdldCBvcHMuDQoNClllcyBhbGwgaW5zdHJ1Y3Rpb25zIHdpdGggYSBwcmlt
YXJ5IG9wY29kZSBmcm9tIDMyIHRvIDYzIGFyZSBtZW1vcnkgDQppbnN0cnVjdGlvbnMsIGJ1dCBu
b3QgYWxsIG1lbW9yeSBpbnN0cnVjdGlvbnMgaGF2ZSBvcGNvZGUgMzIgdG8gNjMuDQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEF0aGlyYSBSYWplZXYgPGF0cmFqZWV2QGxpbnV4LnZuZXQuaWJtLmNv
bT4NCj4gLS0tDQo+ICAgdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvdXRpbC9kd2FyZi1yZWdzLmMg
fCAzMyArKysrKysrKysrKysrDQo+ICAgdG9vbHMvcGVyZi91dGlsL2Fubm90YXRlLmMgICAgICAg
ICAgICAgICAgfCAyMiArKysrKysrKy0NCj4gICB0b29scy9wZXJmL3V0aWwvZGlzYXNtLmMgICAg
ICAgICAgICAgICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAgdG9vbHMvcGVy
Zi91dGlsL2Rpc2FzbS5oICAgICAgICAgICAgICAgICAgfCAgNCArLQ0KPiAgIHRvb2xzL3BlcmYv
dXRpbC9pbmNsdWRlL2R3YXJmLXJlZ3MuaCAgICAgIHwgIDQgKy0NCj4gICA1IGZpbGVzIGNoYW5n
ZWQsIDExNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL3V0aWwvZHdhcmYtcmVncy5jIGIvdG9vbHMvcGVyZi9h
cmNoL3Bvd2VycGMvdXRpbC9kd2FyZi1yZWdzLmMNCj4gaW5kZXggZTYwYTcxZmQ4NDZlLi4zMTIx
YzcwZGMwZDMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL3V0aWwvZHdh
cmYtcmVncy5jDQo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL3V0aWwvZHdhcmYtcmVn
cy5jDQo+IEBAIC0xMDIsNiArMTAyLDkgQEAgaW50IHJlZ3NfcXVlcnlfcmVnaXN0ZXJfb2Zmc2V0
KGNvbnN0IGNoYXIgKm5hbWUpDQo+ICAgI2RlZmluZQlQUENfT1Aob3ApCSgoKG9wKSA+PiAyNikg
JiAweDNGKQ0KPiAgICNkZWZpbmUgUFBDX1JBKGEpCSgoKGEpID4+IDE2KSAmIDB4MWYpDQo+ICAg
I2RlZmluZSBQUENfUlQodCkJKCgodCkgPj4gMjEpICYgMHgxZikNCj4gKyNkZWZpbmUgUFBDX1JC
KGIpCSgoKGIpID4+IDExKSAmIDB4MWYpDQo+ICsjZGVmaW5lIFBQQ19EKEQpCSgoRCkgJiAweGZm
ZmUpDQo+ICsjZGVmaW5lIFBQQ19EUyhEUykJKChEUykgJiAweGZmZmMpDQo+ICAgDQo+ICAgaW50
IGdldF9vcGNvZGVfaW5zbih1bnNpZ25lZCBpbnQgcmF3X2luc24pDQo+ICAgew0KPiBAQCAtMTE3
LDMgKzEyMCwzMyBAQCBpbnQgZ2V0X3RhcmdldF9yZWcodW5zaWduZWQgaW50IHJhd19pbnNuKQ0K
PiAgIHsNCj4gICAJcmV0dXJuIFBQQ19SVChyYXdfaW5zbik7DQo+ICAgfQ0KPiArDQo+ICtpbnQg
Z2V0X29mZnNldF9vcGNvZGUoaW50IHJhd19pbnNuIF9fbWF5YmVfdW51c2VkKQ0KPiArew0KPiAr
CWludCBvcGNvZGUgPSBQUENfT1AocmF3X2luc24pOw0KPiArDQo+ICsJLyogRFMtIGZvcm0gKi8N
Cj4gKwlpZiAoKG9wY29kZSA9PSA1OCkgfHwgKG9wY29kZSA9PSA2MikpDQoNCkNhbiB5b3UgcmUt
dXNlIG1hY3JvcyBmcm9tIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmggPw0K
DQojZGVmaW5lIE9QX0xECQk1OA0KI2RlZmluZSBPUF9TVEQJCTYyDQoNCg0KPiArCQlyZXR1cm4g
UFBDX0RTKHJhd19pbnNuKTsNCj4gKwllbHNlDQo+ICsJCXJldHVybiBQUENfRChyYXdfaW5zbik7
DQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiBGaWxscyB0aGUgcmVxdWlyZWQgZmllbGRzIGZvciBv
cF9sb2MgZGVwZW5kaW5nIG9uIGlmIGl0DQo+ICsgKiBpcyBhIHNvdXJjZSBvZiB0YXJnZXQuDQo+
ICsgKiBEIGZvcm06IGlucyBSVCxEKFJBKSAtPiBzcmNfcmVnMSA9IFJBLCBvZmZzZXQgPSBELCBk
c3RfcmVnMSA9IFJUDQo+ICsgKiBEUyBmb3JtOiBpbnMgUlQsRFMoUkEpIC0+IHNyY19yZWcxID0g
UkEsIG9mZnNldCA9IERTLCBkc3RfcmVnMSA9IFJUDQo+ICsgKiBYIGZvcm06IGlucyBSVCxSQSxS
QiAtPiBzcmNfcmVnMSA9IFJBLCBzcmNfcmVnMiA9IFJCLCBkc3RfcmVnMSA9IFJUDQo+ICsgKi8N
Cj4gK3ZvaWQgZ2V0X2FyY2hfcmVncyhpbnQgcmF3X2luc24gX19tYXliZV91bnVzZWQsIGludCBp
c19zb3VyY2UgX19tYXliZV91bnVzZWQsIHN0cnVjdCBhbm5vdGF0ZWRfb3BfbG9jICpvcF9sb2Mg
X19tYXliZV91bnVzZWQpDQo+ICt7DQo+ICsJaWYgKGlzX3NvdXJjZSkNCj4gKwkJb3BfbG9jLT5y
ZWcxID0gZ2V0X3NvdXJjZV9yZWcocmF3X2luc24pOw0KPiArCWVsc2UNCj4gKwkJb3BfbG9jLT5y
ZWcxID0gZ2V0X3RhcmdldF9yZWcocmF3X2luc24pOw0KPiArCWlmIChvcF9sb2MtPm11bHRpX3Jl
Z3MpDQo+ICsJCW9wX2xvYy0+cmVnMiA9IFBQQ19SQihyYXdfaW5zbik7DQo+ICsJaWYgKG9wX2xv
Yy0+bWVtX3JlZikNCj4gKwkJb3BfbG9jLT5vZmZzZXQgPSBnZXRfb2Zmc2V0X29wY29kZShyYXdf
aW5zbik7DQo+ICt9DQoNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9kaXNhc20uYyBi
L3Rvb2xzL3BlcmYvdXRpbC9kaXNhc20uYw0KPiBpbmRleCA4NTY5MmY3M2U3OGYuLmY0MWEwZmFk
ZWFiNCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2Rpc2FzbS5jDQo+ICsrKyBiL3Rv
b2xzL3BlcmYvdXRpbC9kaXNhc20uYw0KPiBAQCAtNzYwLDExICs4MDAsMjAgQEAgc3RhdGljIHZv
aWQgaW5zX19zb3J0KHN0cnVjdCBhcmNoICphcmNoKQ0KPiAgIAlxc29ydChhcmNoLT5pbnN0cnVj
dGlvbnMsIG5tZW1iLCBzaXplb2Yoc3RydWN0IGlucyksIGluc19fY21wKTsNCj4gICB9DQo+ICAg
DQo+IC1zdGF0aWMgc3RydWN0IGluc19vcHMgKl9faW5zX19maW5kKHN0cnVjdCBhcmNoICphcmNo
LCBjb25zdCBjaGFyICpuYW1lKQ0KPiArc3RhdGljIHN0cnVjdCBpbnNfb3BzICpfX2luc19fZmlu
ZChzdHJ1Y3QgYXJjaCAqYXJjaCwgY29uc3QgY2hhciAqbmFtZSwgaW50IG9wY29kZSkNCj4gICB7
DQo+ICAgCXN0cnVjdCBpbnMgKmluczsNCj4gICAJY29uc3QgaW50IG5tZW1iID0gYXJjaC0+bnJf
aW5zdHJ1Y3Rpb25zOw0KPiAgIA0KPiArCWlmIChhcmNoX19pcyhhcmNoLCAicG93ZXJwYyIpKSB7
DQo+ICsJCS8qDQo+ICsJCSAqIEluc3RydWN0aW9ucyB3aXRoIGEgcHJpbWFyeSBvcGNvZGUgZnJv
bSAzMiB0byA2Mw0KPiArCQkgKiBhcmUgbWVtb3J5IGluc3RydWN0aW9ucyBpbiBwb3dlcnBjLg0K
PiArCQkgKi8NCj4gKwkJaWYgKChvcGNvZGUgPj0gMzEpICYmIChvcGNvZGUgPD0gNjMpKQ0KDQpD
b3VsZCBqdXN0IGJlIGlmICgob3Bjb2RlICYgMHgyMCkpIEkgZ3Vlc3MuDQoNCkJ5IHRoZSB3YXkg
eW91ciB0ZXN0IGlzIHdyb25nIGJlY2F1c2Ugb3Bjb2RlIDMxIGlzIG5vdCBvbmx5IG1lbW9yeSAN
Cmluc3RydWN0aW9ucywgc2VlIGV4YW1wbGUgYmVsb3cgKG5vdCBleGhhdXN0aXZlKToNCg0KI2Rl
ZmluZSBPUF8zMV9YT1BfVFJBUCAgICAgIDQJCT09PiBObw0KI2RlZmluZSBPUF8zMV9YT1BfTERY
ICAgICAgIDIxCQk9PT4gWWVzDQojZGVmaW5lIE9QXzMxX1hPUF9MV1pYICAgICAgMjMJCT09PiBZ
ZXMNCiNkZWZpbmUgT1BfMzFfWE9QX0xEVVggICAgICA1MwkJPT0+IFllcw0KI2RlZmluZSBPUF8z
MV9YT1BfRENCU1QgICAgIDU0CQk9PT4gTm8NCiNkZWZpbmUgT1BfMzFfWE9QX0xXWlVYICAgICA1
NQkJPT0+IFllcw0KI2RlZmluZSBPUF8zMV9YT1BfVFJBUF82NCAgIDY4CQk9PT4gTm8NCiNkZWZp
bmUgT1BfMzFfWE9QX0RDQkYgICAgICA4NgkJPT0+IE5vDQojZGVmaW5lIE9QXzMxX1hPUF9MQlpY
ICAgICAgODcJCT09PiBZZXMNCiNkZWZpbmUgT1BfMzFfWE9QX1NURFggICAgICAxNDkJCT09PiBZ
ZXMNCiNkZWZpbmUgT1BfMzFfWE9QX1NUV1ggICAgICAxNTEJCT09PiBZZXMNCg0KDQoNCg0KPiAr
CQkJcmV0dXJuICZsb2FkX3N0b3JlX29wczsNCj4gKwl9DQo+ICsNCj4gICAJaWYgKCFhcmNoLT5z
b3J0ZWRfaW5zdHJ1Y3Rpb25zKSB7DQo+ICAgCQlpbnNfX3NvcnQoYXJjaCk7DQo+ICAgCQlhcmNo
LT5zb3J0ZWRfaW5zdHJ1Y3Rpb25zID0gdHJ1ZTsNCg==
