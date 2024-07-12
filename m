Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470C92F6A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 10:00:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=0ttg/nx2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL3tp0GXLz3cXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 18:00:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=0ttg/nx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL3t30Wqfz3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 18:00:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rbox0yNQiI6+rJyThackTfh0cMfZXYZWvX3fujejHtDwYSApLTWyQT1Kf+6LQf51+9dFhoflzz82kwc+r9A+y4Z07Ikej8X36Cpbof/8h6tUAaM060xrH+Bfti+f7a79A6KkWPMouU4GwFxqJe0r5ssNBoKyNEZiwT1NP5k2JFCgUQEToeCFzHQcObyEojVSIk16ieARPg84+k6kDT/itnTYXzePhMNDYjP5sKQmuYYtr127KMW/F2rmBxUpjNtPtHQ/LIIq/8dsDh191ObsYl6P/GKOvJascE5TF7Clv0EZbQwH7oJLIdOZku2Ca+rwdek1N0Z8+sD+Sk/e3G4MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZoqRXetGTDJcFa32dEQS5bIWtE2/f8XZ2WfWKnQTnc=;
 b=Cdx4j37z/gkKnFF7EFOqrCm9GrMtyGEismtvBA61QXlBc14poacH8Ir/zpyr5HlhSS4Yle6s55qWTZPNp0VxzUfU0CNXHjVmoeAArBb8w5gfOqjtoa/+i+D5pf27ziW/V5oEFAGLau/QySiEWNcWBE9Hpo571pqPI4qRJAx2acs5Obyjo7BIIm7Md/Pfl/e242eha8WaTWP1DJaKHSVaw+9+z2Nu9d3MT+gk3pKjeOxTraGf40+91+881pKv+wD3e0G3/hsC+cPMPKS8xgPslicbhDaRY/V+SNVeILgeC3EkOa8U+y36NZ05x9UMpmuKMUxul2pU7HiHi+izNGEpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZoqRXetGTDJcFa32dEQS5bIWtE2/f8XZ2WfWKnQTnc=;
 b=0ttg/nx2RB2AZWVFz38eAyDIZjZ38RYk+xlybAB72BzD5BJs1HQOTAkP6ofoMnXVvjUibLvj69A8w5mgy88oMPuizIlEMbSsqnVeCc/KzNJRHGT212BWVeFplxGmHH5A+Im2uEm0WBsZjQO4NwUi6GbOq3OplKX+Q5G3WjuBBBtGl+e/YqF5KpQMteIFi/+0liwmP1XTwO5twfI9owu2jtUYm0gFr3P7Pmnke7z8h4r5ULPquaG5YHwOfz0HdSFHrHrb02Ny6Dlx+2JAwr01LZpSvZwYxnsUBuR5R5IlufIeNthK4icWED3lVNGBjYzO8FfQNz9YgNgdo+qrz6A15w==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DU0PR07MB8417.eurprd07.prod.outlook.com (2603:10a6:10:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Fri, 12 Jul
 2024 07:59:44 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%7]) with mapi id 15.20.7784.005; Fri, 12 Jul 2024
 07:59:43 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Mark Brown <broonie@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to get
 a channel from a phandle list
Thread-Topic: [PATCH v2 07/10] soc: fsl: cpm1: qmc: Introduce functions to get
 a channel from a phandle list
Thread-Index: AQHay6pNvsbN6VJe70a8MonTZyE2rLHlgUWAgABkS4CADOYDgA==
Date: Fri, 12 Jul 2024 07:59:43 +0000
Message-ID: <9423930f-8cb8-4b31-927f-a93b1006fb18@cs-soprasteria.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
 <20240701113038.55144-8-herve.codina@bootlin.com>
 <a8c44188-d5d8-445d-9d64-bbfce6b1b628@sirena.org.uk>
 <87a5ixkghq.fsf@mail.lhotse>
In-Reply-To: <87a5ixkghq.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DU0PR07MB8417:EE_
x-ms-office365-filtering-correlation-id: 1dbade5b-1b94-4fef-11ce-08dca2489726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?OFdZMDM4MVF2ZE9QdTQrYzFvMkhzT2ZJWURiT1laQkc3S3pJL3lJcEFxNkpl?=
 =?utf-8?B?TG9KYUp2OXdyWW9mb29xUWc2MDBSUk0xeDJFZDFuLzAwb0NoSk5OeVQ4QnpI?=
 =?utf-8?B?RjdWQ3F0eDQ1SkxIbFZrQUU5a0xDQVVlNlNURDE2ek9lRnVUQUMyZHIzdFpY?=
 =?utf-8?B?dnRuV25IZkpHc2Y3eVpSdFBnTElwSHhUUjEwOUdSRFJBNkFUWjJQY3EvTk9E?=
 =?utf-8?B?ODIyZlVuY00vVFhCVEpOaElzaFpCNjdJcURNdllFcVUrbTBGZHo2VVlaeXIy?=
 =?utf-8?B?enlNY2VDMC8yOVU4UXZ2QXUwSnBKNVlNRkI4TnZUUFo1SjNkc0RTNGV3WWIy?=
 =?utf-8?B?SitPdzZNZjZHdytscVVPWFhobjYyc2owTlZZUEt2TGFKYjNnTXJtM215T1ps?=
 =?utf-8?B?T2JWK1BqTjlrNTZ3T3FaVk5UUGo1MDZtUXhwRCtxTGUzWkd6cXNJZ1ZRc1pR?=
 =?utf-8?B?bzBBSE96U2NxWTUxYWlsQWFqZ0MyVUdzbVJST1hnSkQ5U0FJSTNvejZjV0pi?=
 =?utf-8?B?eFd5MjFNZGMyaS93S0RQa2ovR0QzMnlGbkYvUDA2V2ZZZEcvRWVnV1liUVB4?=
 =?utf-8?B?aVo0MzFkSFIxNi8zVWJ3T2x3OVhJcW1Da0dtMlkxVWhnNDlaR1hJVCtzd29G?=
 =?utf-8?B?Z21PNzRNMXZibGtZRENjNWd3TjZqd0dmMmx0TlNhV0JUTExJbmV6T0tKMjls?=
 =?utf-8?B?dzhWeTVEVlZudzRlZHJkQ25mVzEzOWg1cy8xeXMvajlkcXVkZGZOY2toZGhE?=
 =?utf-8?B?Z1gvNDZJZEpNaGEwM2d6NzA3d1Mzc01wbmRSZUoyYzdodEdmM0hpenY3M25F?=
 =?utf-8?B?eVZaRkhsRmFVOTZ0aGM1d1RWY2o0ellsak9SQ1hPV2FpeGo0V1EyRzVnNGx2?=
 =?utf-8?B?REs1UUgvbW10dm5BalNYSEVOODVYWFVTYjJqU0FNelVMaTQ0WHJ5Ymx2bks4?=
 =?utf-8?B?TGttNkdEbnBjUFAxUE9kSEIxSmtqWisrcDY2dGtUY2VNN0VqYWxtTDlEZWsr?=
 =?utf-8?B?MndqdVBFZTVCbkVVYjgrUzdKbGZ5WmY1SzRwa2JPcVI4b0pFMUoxMjNyUGFT?=
 =?utf-8?B?NHRRR2pGODJjUDgzUDZ1YTROeWNUZ0lONGI0cUdURGh4RXlRbWd4SkZCSVZs?=
 =?utf-8?B?Ny90TmZSRm1qZ0tUSmlLUkQ0LzdBck5tb3E0eDhsUmhJYlY3QndaYWZnVmM2?=
 =?utf-8?B?dWdMS0RXd20vMzdhZjE5VDFyVkNnTW4wenlWWXVobFpnSTRFeVcwR2xlUkRQ?=
 =?utf-8?B?MUVHekgxSDBNazdNRW14OFlobTRsalBDSDlWTU9IUlYrQVVrelhjdmNHTlc2?=
 =?utf-8?B?cGRMcGMxYmVvYUVKSVlTZEp3UHdxZy9jY3U2Rnl0SlJwWEZWM2NGNzAwMHlO?=
 =?utf-8?B?eVhGb3RzZWxjSDRNd1FYTThuMy9PQ25HMzNBNTNOR2NYMU0zRzlZclhiNWRR?=
 =?utf-8?B?ckgxMExoVTRNY3pVRzY3ZkVFV3U1Q3c3cjZHQm1mTWw4c0ZZZS9WeTIvY0Vh?=
 =?utf-8?B?UVdZSDJyVlY2WU9yQ0tCL2QwSXRKRFAwbnR1MndVS3FBNmFpYVZxWCtWM05G?=
 =?utf-8?B?aFRyemhqR0xrK3hMTWRaUUtma01BVkNDbkVqa3pjZU9UdmRhcFc0WUFmeE1q?=
 =?utf-8?B?aVJsSnIxeFpxNTByUVFIUUsrQ09FRmJtRmp3UkNFQURubFF2UTA2UmFXQ2JR?=
 =?utf-8?B?eHJjY3ZGZ3IwVmV4NmpqS01IcjZDNWNURmcyMXZHNUE4WmFLcXdIR1NtVVAy?=
 =?utf-8?B?R2RzVk82UDBvOEZWZm05bStRQVJOK3JaOUJ1ZlFnZmZKa29wT0t0d2ZjZW1B?=
 =?utf-8?Q?2Wzpb7xBvCPiQTSSJqjb7bE9UfzTidk8SD40w=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cERadG9rNVN1NG5TaCtYbFU5WEUrdUplWitmK0FTSFdtZGRuYXVXSHpHR2lI?=
 =?utf-8?B?ZEIrTHdKdzJ2a25YV243dXZVeHdmRUJRU1VnbGw3eUVzc3EyUmxJV3JkVnFy?=
 =?utf-8?B?Ly9LQ1p4Y3ZONzBjaTZ0cjhtYldlVE4zdG01REs3UDlMUU9FWENEOEsrNkF3?=
 =?utf-8?B?ZGgyT2tYRDBaUFZRZlF1UldsRm1qSENLK2NkNjlXVlU5UGU2ZDRBWHNDdDY4?=
 =?utf-8?B?ZnBhRHlvVmR1d05nUmJ6T3Z1MjZVUFp1V0xyQkdoSWRrQ0tiZCtwY2JWcy9L?=
 =?utf-8?B?MkcxNTltZVNCcm4rZUhOT3dDUnNqai80R2RrS0h5aHhOQ3VRbGc5d2lZQU9X?=
 =?utf-8?B?VVhoM29qRGN4NWxCQWhqcTlSVXh2K1FwUUprMWxtTXJwS0dnditjYkNidkR4?=
 =?utf-8?B?bStUa01YRnAra0N1WGpwZ3ZwVGs2UGxQQmhjT3RMRHMweHVVNG41d3l3dzBo?=
 =?utf-8?B?VVBKVW5JdllUQ0NRMkFmamo0eWtvU0t4ZVFpZlM4M0FwV2J6cW5Td2RGaWNl?=
 =?utf-8?B?ZUZoMkZaemFlaGFMN3U4ODZLZHVEQ21PTEtqL2l2RktvdDgyeWVzWmtEcU8r?=
 =?utf-8?B?d3FybXkwVGh1eFZ5OXdUYjRacTM4eUU0elVFNEFEVXBHemxoL2VjT29YaVZI?=
 =?utf-8?B?cHBDQThDZVZvZmdKQUNOS1dWT1B4OXZEanFaZ0JlVXlkbllIcHVpVmNENjlI?=
 =?utf-8?B?VFNONFo1aVBRTkpVeGxSNXdQU080ZXNYZjh1T1JuSGgwYlZZbHloM1JwRHNz?=
 =?utf-8?B?Z0lKL2FISFQzQkRoVitOQUVJU3o4c0ZLNGU4RlpXeXBhOFBWSWY4VXA0b054?=
 =?utf-8?B?dUtiTnllQmxXdVNZcHZLbmMraUQyR0FEL2FaNVVBeEhGcmxMMU15R1pYN29P?=
 =?utf-8?B?anhGZlhUb00wODlaUzlFTnlZNkRSdWRWcjc3dDFsNlFZMHdPaW9tT3NPOVFF?=
 =?utf-8?B?RzNDM3YyVHVKcGhockdJbi80SzcxVjBTakNXcDUxQytHeEhzRnM3Y1AwSjJn?=
 =?utf-8?B?SW5sMURud3dyQVNaTDZuZjNFMWppNkovQkcrK0I5MHU2VWJJMi9NSnh2ZmxZ?=
 =?utf-8?B?UVQwTmFBbVZLSUhlSVNVSUNHYUFOWEN5QmZmT2dVQk85S0syeUFMNmdiQ2hz?=
 =?utf-8?B?eTNOYXY1WWxKK2JES0E4ZWtZbk5uQVJUQmMwajducUtCTFBTbUhIRURXeGd6?=
 =?utf-8?B?M014cVRUVUNPZkwvdm9rQ0pYVWc2QUpXbklNRmhyOGZ0RmNZU2o4T2kvYWVZ?=
 =?utf-8?B?ZUVjU1p2dnJuYnFQZ0ZOYkVORlNCMmRWc3g0bzVDWDI3TTVWd05qczZpcC9t?=
 =?utf-8?B?N1hnUUZzOXJ2cDJyMnpUV3FXQjdlcnM1bzVabzAwaFo1MENub0tOalFJbS9x?=
 =?utf-8?B?Z2d0c1UwaGlHM2pYZFNlY1JTc1RxUStNVWFuMkVnSjJlTFdkN3M3YzFQMlNI?=
 =?utf-8?B?ZGdyQUZaTFpWd2FWenR0bFhVYmNPVFlHRlhHRHNURGZxZmJDYzM4Nmk5OEU5?=
 =?utf-8?B?TmlaZk56Rm9NYkQrSUkwSEFMMFJldFEvVVE5djFCMjBkRG54Z0Uvank4YWk5?=
 =?utf-8?B?SEIxaUJGTUtpdVFkUnNYbVBOYk1EdVZDeWF1YldJaDY1ZnJ2NHRoUlh2T0JL?=
 =?utf-8?B?NURGcnIxbnVTdWI5WkRtSHpXbGViM0w1NjJ1V2UySm1HM25hK2s0dmJEdENY?=
 =?utf-8?B?ZmdXNU1KZzVSQVJJWDgzYzFoUHZaaVRmWVBjcS9PV25XSXhTcmxmWHN3QklD?=
 =?utf-8?B?S2tMQjhDRG1KRmtRU2ZHREpyUWRIYUtzOVBsVVZzOTdRaCsrZFZiQlVlbUJk?=
 =?utf-8?B?UVdveVVKaGROZzVzdFJXelRhVEFkV0ErMmxlallkaTNpRnlCeTdPQ0ZUWUxE?=
 =?utf-8?B?SWxZT1Mramx4K0JLc05MU3k2NUpNcmVMNFJQdU0zTkRCTng2VWpEaTB2QlV0?=
 =?utf-8?B?bDNHYnYwL1Q2UnZFMmZlRDdOK0FDSEdHZzRQV0JxUlhRbDBlZi95QmhXVjNC?=
 =?utf-8?B?R2g4QXZWN1l5a3BNQ3RnLzlKeWJrUkZwMTNlRTJOWVQ1VS9yS2h0Vzk1dVp4?=
 =?utf-8?B?OVBwMXZoaTVkMVNoYXlMOUd2QndRdWQwQklUekk0OWpuclhFeGhBbXF4L2pP?=
 =?utf-8?B?ZW1RZHltREtLRWkvR1NDbW9uNi9PWkpkM0I3ZlgxV0VVZ01NU0tNZ20zaVZ0?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C67D9FDF9F7D840A9ACBA50C319D5B7@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbade5b-1b94-4fef-11ce-08dca2489726
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 07:59:43.6907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAveYCrtHa7JZbKQzVPrzKNCx6AbP+PkObvVlfPwiyu5oGqWEYJGe03xwfWDqc9fTSJpJrUQGHKTJ9Qf4qXHLxxBBqEbk8B5Z8Si84JZbCiEk43xIIjSs+yaPZsNy1qg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8417
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DU0PR07MB8417.eurprd07.prod.outlook.com
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjQgw6AgMDU6MDEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiB3cml0ZXM6DQo+PiBPbiBNb24sIEp1
bCAwMSwgMjAyNCBhdCAwMTozMDozNFBNICswMjAwLCBIZXJ2ZSBDb2RpbmEgd3JvdGU6DQo+Pj4g
cW1jX2NoYW5fZ2V0X2J5cGhhbmRsZSgpIGFuZCB0aGUgcmVzb3VyY2UgbWFuYWdlZCB2ZXJzaW9u
IHJldHJpZXZlIGENCj4+PiBjaGFubmVsIGZyb20gYSBzaW1wbGUgcGhhbmRsZS4NCj4+Pg0KPj4+
IEV4dGVuZCB0aGUgQVBJIGFuZCBpbnRyb2R1Y2UgcW1jX2NoYW5fZ2V0X2J5cGhhbmRsZXNfaW5k
ZXgoKSBhbmQgdGhlDQo+Pj4gcmVzb3VyY2UgbWFuYWdlZCB2ZXJzaW9uIGluIG9yZGVyIHRvIHJl
dHJpZXZlIGEgY2hhbm5lbCBmcm9tIGEgcGhhbmRsZQ0KPj4+IGxpc3QgdXNpbmcgdGhlIHByb3Zp
ZGVkIGluZGV4IHRvIGlkZW50aWZ5IHRoZSBwaGFuZGxlIGluIHRoZSBsaXN0Lg0KPj4NCj4+IFRo
ZXNlIHR3byBQb3dlclBDIHBhdGNoZXMgc2VlbSB0cml2aWFsIGVub3VnaCBhbmQgaGF2ZSBnb3Qg
bm8gcmVzcG9uc2UsDQo+PiB1bmxlc3Mgc29tZW9uZSBvYmplY3RzIEknbGwgZ28gYWhlYWQgYW5k
IGFwcGx5IHRoZW0uDQo+IA0KPiBBY2suDQo+IA0KPiBNQUlOVEFJTkVSUyBzYXlzOg0KPiANCj4g
RlJFRVNDQUxFIFFVSUNDIEVOR0lORSBMSUJSQVJZDQo+IE06ICAgICAgUWlhbmcgWmhhbyA8cWlh
bmcuemhhb0BueHAuY29tPg0KPiBMOiAgICAgIGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3Jn
DQo+IFM6ICAgICAgTWFpbnRhaW5lZA0KPiBGOiAgICAgIGRyaXZlcnMvc29jL2ZzbC9xZS8NCj4g
RjogICAgICBpbmNsdWRlL3NvYy9mc2wvcWUvDQo+IA0KPiBCdXQgSSBzZWUgbm8gZW1haWwgZnJv
bSB0aGF0IGFkZHJlc3Mgc2luY2UgSmFudWFyeSAyMDIxOg0KPiANCj4gICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLz9xPWYlM0FxaWFuZy56aGFvJTQwbnhwLmNvbQ0KPiANCj4gQW5kIGFj
dHVhbGx5IGRyaXZlcnMvc29jL2ZzbCB3YXMgbWFya2VkIG9ycGhhbiBpbiBBcHJpbCwgbWF5YmUg
dGhpcw0KPiBzaG91bGQgYmUgYWxzby4NCj4gDQo+IE9yIGRvZXMgSGVydmUgd2FudCB0byB0YWtl
IG92ZXIgbWFpbnRhaW5pbmcgaXQ/DQoNCldlIGhhZCBzb21lIGRpc2N1c3Npb24gYWJvdXQgdGhh
dCBpbiBBcHJpbCwgc2VlIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIw
MjQwMjE5MTUzMDE2Lm50bHRjNzZicGh3cnY2aG5Ac2tidWYvVC8jbWY2ZDRhNWVlZjc5ZThlYWU3
YWUwNDU2YTI3OTRjMDFlNjMwYTY3NTYNCg0KSGVydsOpIGhhcyBzb21lIG9mIG91ciBoYXJkd2Fy
ZSBmb3IgYSBsaW1pdGVkIHBlcmlvZCBvZiB0aW1lIGJlY2F1c2UgaGUgDQppcyBkb2luZyBzb21l
IGltcGxlbWVudGF0aW9uIGZvciB1cywgYnV0IGhlIHdvbid0IGtlZXAgdGhhdCBoYXJkd2FyZSBv
biANCnRoZSBsb25nIHJ1bi4NCg0KSSB3aWxsIHNlbmQgYSBwYXRjaCB0byB0YWtlIG92ZXIgbWFp
bnRhaW5pbmcgZHJpdmVycy9zb2MvZnNsLw0KDQpDaHJpc3RvcGhlDQo=
