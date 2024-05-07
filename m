Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59D8BDE74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:36:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=liqGiVJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYY7b59Zdz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 19:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=liqGiVJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYY6s1tt4z30TN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 19:35:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOA89DGiFi9mdSLzKzsB2f7tWnDQTPWjdN0kiOHb7KhDT3H/XXgM4V6TZKuSwKW3pyEY6O2Wddz4Jitu/EYxMRcstjVqex0W/uFAUk7X72Gb6sc/eQrIXvYS0Heca9nTQPRK9oSGDNwhkZlO7IPrJPezU1Ntkc6QeQG5ha4Xc2N7ImRpDIbnFkCzz6JBUVEcJgMPM68veU4+8VlYAz0DQr5NH+v+i5qNpdlgJUYC6xlln0dDycgvq7kSDspn7uGWfD2E/zTPrTgtLaSP/1CWfQrCbH0x531BDiFZB7Eo+IP+TVPgMX/42bVBLm+gpEq3/WKR/aUrPhoK1+j2iJZCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5hZ6OQq1w1B+SN+r3u14hx5VD1D+kf3Sdif5fMclNE=;
 b=CbUz2s+JWiHFD5wt1VJ0MisojX21MLYD3n1uf8fKcX6nDh6IGay/53RiqqeYiUkgCRBMk77kyCD2/o3ozoyxLliAeazXJ6b93nR79SCIOEug/GFmt3F4BynL8u5T6pETVy9hsstZoTQPeSS2H4TYhYyiBD0e0P4BOHA3to/jgcgKl6kDvBv+4qVq0Ozm27QlOX+eC/pbxJVH08QiusXpuzikw5a/uW6/nxlsLe8l4gZU0JlP/8aIlcGtW2QrPMV1MKyQfphS9MZBOv6iCfKYLX2lxFu72KnIrJyf4dv14/XKF+zdMZpkq8Vkrv7VV21OLHgGWAHmvBtoZ3bk68qJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5hZ6OQq1w1B+SN+r3u14hx5VD1D+kf3Sdif5fMclNE=;
 b=liqGiVJp8cx6EM4xtRhMew9E5K8XcNNeBgyejOSqxBZ4P95ap0ms07m/eKefoJjmoUExWNhOS5qYoQRCidbmomnRIqcviCIMZBqzeQKIgNxq7H/icyHxQaYlYKnaq04ULUrM7+ElGyTqKlGw0/1wIAVZuHy/UZKEczUkyQacg4kMwlstGbCSTXzUai4QTZ5Zpp1Resk6Dft1oGvlkRHhi7Qt1HXN1dkvYI6/jbt7tSudxo6sZ/VrUsRiyHxGIaIBeb/FEFX7MsMVXU3WRBzArC4vZns0Jfu3EkuLehs16ZntJtlI8pINw7VkyC8dozEdvCLP+ruJkvc2HhhmSyeVDw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2900.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 09:35:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:35:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>,
	"segher@kernel.crashing.org" <segher@kernel.crashing.org>
Subject: Re: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw
 instruction in objdump
Thread-Topic: [PATCH V2 4/9] tools/perf: Add support to capture and parse raw
 instruction in objdump
Thread-Index: AQHan6/qz9wpVIkYqUyD8zc0BeueILGLhGMA
Date: Tue, 7 May 2024 09:35:22 +0000
Message-ID: <f2efdb9d-e636-4678-b492-83d3a28d8134@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-5-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2900:EE_
x-ms-office365-filtering-correlation-id: efe6224e-2310-4fd4-ee72-08dc6e790490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?dVZmcFFiZFYxMXJTOW5pZytCai9tcHFFaDRxcFhyN010K05YUzVNRlJxdXNa?=
 =?utf-8?B?Z1p3eEMvUkQyZU5raWdndmpjVjlBcCtob2lxOCtIcmZzcWhrbUpHaE1jQzY5?=
 =?utf-8?B?bHYvbHpsemhUNDY4dEtKNk9ERVl6Tk53QzA4WURRVGRCczZFbTdvZWtIc0hl?=
 =?utf-8?B?aktFZnQ3OXJoUkpyVGJNSFQ3OU1iRTJEbFdMNkhnRXJia3lwS2NFN2sxKzRX?=
 =?utf-8?B?SGFNd0FCMWIrZjI1SUR4TmkyZzhaMkdrakoxN0NWMjJweWhZN3dlcm1WZDUz?=
 =?utf-8?B?ZklkSElpUzNXbStFTFVGd0J0K1IxNkxPYTVPMW8wamxPMG5EQ1E5UGRNR21r?=
 =?utf-8?B?VWFEcDAva3BOR2k5cEM4bE5oL3R4bnV5NnEvUXpYSzJPc2JmOE02b2RvNVlh?=
 =?utf-8?B?NEx4aTM1QjcxajRRaC9JNkZzRVZFL1J1Wk56WU9VRHlwUDA5M2pMb3A5K2xa?=
 =?utf-8?B?RTZNWU92VXJFb0NKa3pYcWluNlVqM05sdnJYTkpyNVZ6MHNHVmpoaGNDTW9C?=
 =?utf-8?B?em9udEc5RmlXdHRPd3REU3hzWjB0UjM3bU9kTWI1MDRoY2pHeDYybkF1Uk8y?=
 =?utf-8?B?TFNiaUl1anUxbGxwcFl3cmNxcFplRG04NFQxcmJtbk5xUGI4WlBTZ2ExeFpM?=
 =?utf-8?B?b3Y5Sjc5SXArWm9ndkpXUlhIblhVMjdManBZSjFLT0VndXB0VXhXTTYzWmxm?=
 =?utf-8?B?QUF0RjRZRC9kTjRsMk80b2ozMHZQQzFuTWo1YXN2Z21iYUl5S3RiSHNmMU5C?=
 =?utf-8?B?ZkQ2ZmFvQkprL0p1bjRoQ1V5M3cvVnVrUDU2MzdacVNvTitCYnVIUHRvYmRE?=
 =?utf-8?B?OGNVdWxZWWZlWnJ5ei9VMzlBeHJ6Y0xZeHkzKzFDWXpCOStQY21NT1J4aW5u?=
 =?utf-8?B?YnRJZERqSzBkWWR5WWZkR2U2NGY3cC9LRE90bFJSb0xqNlZuVVpuY2tod2JH?=
 =?utf-8?B?cjRnbjAzUTh2d2dzZ3hUMENzbUVJQ3MwQXNrV3hvako4S0ZES0RtVmhsYS9K?=
 =?utf-8?B?NS91NEhoN3JkS2dXSXMxYlBXaVdObjR2bjZJckNnMU9YWlBBbmtKdUMwM2NL?=
 =?utf-8?B?UXM4NGdXQjRKMXdKQW5KdnlGYUlmYVFwa0dnYmNPM3NxRzJsajdmcTJnWFJR?=
 =?utf-8?B?ek9FUkpnR01zNVdJVzF0cEgzZnZrRjViZHhERmQwbWtRSnZJYUY3VEVNUFhU?=
 =?utf-8?B?emdlMmRqSXczamhzSkhvRjBTaXBTL0REd2JnUU5vQndVUTdWdzIyZjNCOGJT?=
 =?utf-8?B?SDNEcFViL2svVWJocEtFZlJaZXd3dSthY1pZRlZuRnhqM09PU2c2Zy9xUDFD?=
 =?utf-8?B?aDVkelFUVExPbEtPOWlXUUp1UE41OW5yNm5aYnlxMWJGMEdubHFObEdVYlFS?=
 =?utf-8?B?aWwrYXUvMG5oSlFPV3BaekM3MU5xVHNLWTNGN0J2S2FuS1dzT1pFT0k5RHF2?=
 =?utf-8?B?NjNCZis4NlphV2lXSFpsdldBWGJuZnBvOTZCYnl4aEttcTVHbEFoUjFvVWpH?=
 =?utf-8?B?QUYxK1V2S1lNZ1BlbGJuK1FMb2dhMlNWWkNCdkhyOG4yeTRhNldldlFVL2RF?=
 =?utf-8?B?Z0l3QjdIK3JKazZHcGlET0VrNE5UYWhBaGZDbkYyWExJSWNwdG9FbjJmdDVl?=
 =?utf-8?B?VkJaM3RhTDgwZi85cUc1T3NES3IvUGszejlyUXBCNDBPT0NnbUxQTGxCSDcr?=
 =?utf-8?B?dDFZeURvTGpBNU1ZYlVyWW9XVVIzWXhCY3piOEpNNjVTK2tiYWdKdXBFcW9z?=
 =?utf-8?B?ZHFrQjNVeklTQ0JLcGwySnBqUkFLOXVMZ3JjeU9wTXdydEtFRUVnc2xESzdk?=
 =?utf-8?B?ejJZeVV2dHhZeGo4UmNQQT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHZ5Q2dzRXgwNll4YVRQczJ3SnUvK1FPWmprTGxEeE9mZXhaZ2lMV3FRWG1H?=
 =?utf-8?B?WGtDZjd6anp5Ryt2TVUvb1VxdEV0TUtCTUloL3ljV0FwWjNsRG9ua3NUZFZk?=
 =?utf-8?B?TnY4eHRkWldZZm9kTVc0TkRhbllYMnJFN0JzSEtQTFBaNEJjUVA5Mmp0K05o?=
 =?utf-8?B?SGZtaWZqL2JDNnFUWExub0NCbVBxVmIvL3J5N3NBMHlCZ1dzQ1FTUlFhS2NW?=
 =?utf-8?B?S09NZHpEOGF2N1drWkxDRWI3a0g5WXhoUG1TdFZoTDlady9oWWpPOEtnTDJv?=
 =?utf-8?B?YWhlc3pteFlLTm1XOWhDYmIzSUFxdDJBcEJDR1pJbkRIVUpIZ2dVZFBPRnhk?=
 =?utf-8?B?bEgrRDI1R0hOSUcrL1BFeGtLN2RCQjNNSnU5aDZLY3JhR2R2Y3hzRzhhblZU?=
 =?utf-8?B?KzFrWmJBa3FRYlVrYUxPT3V2Wk1UdkNvZXp2Tll3OTRPczA5SEd3Y2xrWmlq?=
 =?utf-8?B?dEZHOXd6MUVCWnFxbmVZcGVYK1pMTWxTVDNiRllWYnhRazJ1N0ttZkJKRGhl?=
 =?utf-8?B?a2RoR1NhYnpTMWZXMjBSN21qWklPWjBGOWhzZmtSRVVLdzZudWd6YmxRNmxr?=
 =?utf-8?B?c2t3VndDanRScjM1cHdBd0hJcXMvR2VsNlFiVThucGx1WWlHQ3ZsbUo2dzc4?=
 =?utf-8?B?OXc1c0ZPcEdQZXFaOU9yelBJZ2hpdlRLSmJzWGRPblpheEswNXZLKzVwNlJn?=
 =?utf-8?B?MUhaOWp3dkVpeDlNdVM1YU1aOHRMdHpBcldvNnhSOW1xSU5xUENBVVk1YW8r?=
 =?utf-8?B?dkxxc2hVS2MwTlA0SW9uanlYTytlYml1N1BQdEphYy85WDhTVkpSTEc0bXZ3?=
 =?utf-8?B?QUtKak4yWlJmYzhxbU1TdWtldHBUbEVjQk9tTUZWM3RhYi9Pd296OGUwZkRs?=
 =?utf-8?B?aFR5empZVkJ0ZU12NW13NS9VVUZ4WTF3c3FPR1JzaFhqNGpLeC96bWcyMXdz?=
 =?utf-8?B?NHFqaFYyV09uNU10SW5GbUdRMzZUQjBPNSs0c2pZdlFjdXVOZmFwclhqRVIz?=
 =?utf-8?B?ZXJDY3lRUTdnV2JNTHdWNjlvSERrekVvTnZISFF6MGN2bWlEaXBCcUQ0T01Z?=
 =?utf-8?B?c1R0WkxOSU1KakI3KzdGY2hkb0lTMnZqNGh1Z0hXUmtWQy8xSXdTRXdyTTVL?=
 =?utf-8?B?dWRmUCtmR0lBRm9tZXZVNTFEWVpqUXlGRDYvSEQrTTd2dTY1aGdtd3pvdkE2?=
 =?utf-8?B?bjhxbUQwQnFKb0V6VUw3emNzNmFxdC9tNHo2SWxRT013Q0plTEVWSzhZblRO?=
 =?utf-8?B?b1hTSThYajZDYW92VzREL1pqYkxybzhqaUE3MFNuVWJtdHhPU2JPZmhpbVFO?=
 =?utf-8?B?OTdDSllwWUt1WlNhanhOd3RydmdJYW9Za29DQS9zbGovcmtRVCtNSjAvR0Qw?=
 =?utf-8?B?WmFlTzUxMkhnM0psQTNjK0IwRHRNSzBXREN4UVFyb0FqaVpXTXhSZFk2WVhF?=
 =?utf-8?B?YXVDbVhUSTZ4WGZoYUczSGdxQzUxclA2NERQSk1oTmhZRGdWNjhtWlZYb3NB?=
 =?utf-8?B?T0ZMTUZXOHdkVE9kc3RWNCtKUWtjSTJsM2RYUkx2UWEzMDgxVG8yY1N1ZTZ6?=
 =?utf-8?B?cDJuMSsweUpzc21TNVRVM2hFY2NjcmpWWElVaE1odW4vUDBzQkkyUVhqTGtG?=
 =?utf-8?B?c0dkcWU5c1dlSDRxeCtvYWN1U05aR1ZJZlZOZ0ovV1k4QUQ4Um9jRitDV0Z3?=
 =?utf-8?B?Q1dvZm9Cb2tkOU9hVms4RjdXWVJQNHVkRWRuVDh5eUszZ0hNUEsvek5tb2VG?=
 =?utf-8?B?YXJaNHRJKzBkbE04MmppMC8rRVZtQVBCdkJPS1ZaS2R3S3U5V1poUkhxYndP?=
 =?utf-8?B?TzZpcU1UcE9aNFdDNG4zWFFLQzhrTDVWTnl6U3BueG84ZncrNFJaT09qNzIv?=
 =?utf-8?B?V0xzSUluSStNc1ZzWGdJYzBZVDEvN25jU0VhdjBYU1R6Z1dYa29wbFhnQWNQ?=
 =?utf-8?B?WFRiL05CTjAwaUQzTWN6TFZKMmNXV1F0K0g5eldXRW81ajMzQWRuWHdvYTlS?=
 =?utf-8?B?bmw3TURFWEJ3aXpXL24ramZzRkpWaUNHSWxTKzg4bi9mZkJpSm12Y1Brc0VV?=
 =?utf-8?B?Y1FTRTZGbjBBYTkvb1hsYmR6ZUU3dTR2M3BtRzNSZXBRTnpGNmRsWmd4SVBZ?=
 =?utf-8?B?UEIwOHc5WVlhUU5RaTFYdXVuN2FPaThkem1XR29MZWorbUhBUnExeDlBeXhB?=
 =?utf-8?B?a21jMEdkM3NJV2hjbGVib29najVKRm9rcjhISDJUVEpLQ2xralo0MHp6VmYr?=
 =?utf-8?B?RDVybTlPTllELzJlaEpjMFhaLzZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BAA0847ACB1054CAB6C41722A44DF01@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efe6224e-2310-4fd4-ee72-08dc6e790490
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 09:35:22.5860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1M3HpZ8V0vmgLMvfhusF3VrbYkg/fjqd8z1gTM6js44KdjmPKGGWs16ZVW2y1QF+TS+UMIkQSaEXryF3GIlGKik1c4Rpack2ACxHycNI+Is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2900
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
QWRkIHN1cHBvcnQgdG8gY2FwdHVyZSBhbmQgcGFyc2UgcmF3IGluc3RydWN0aW9uIGluIG9iamR1
bXAuDQoNCldoYXQncyB0aGUgcHVycG9zZSBvZiB1c2luZyAnb2JqZHVtcCcgZm9yIHJlYWRpbmcg
cmF3IGluc3RydWN0aW9ucyA/IA0KQ2FuJ3QgdGhleSBiZSByZWFkIGRpcmVjdGx5IHdpdGhvdXQg
aW52b2tpbmcgJ29iamR1bXAnID8gSXQgbG9va3Mgb2RkIHRvIA0KbWUgdG8gdXNlIG9iamR1bXAg
dG8gcHJvdmlkZSByZWFkYWJsZSB0ZXh0IGFuZCB0aGVuIHBhcnNlIGl0IGJhY2suDQoNCj4gQ3Vy
cmVudGx5LCB0aGUgcGVyZiB0b29sIGluZnJhc3RydWN0dXJlIHVzZXMgIi0tbm8tc2hvdy1yYXct
aW5zbiIgb3B0aW9uDQo+IHdpdGggIm9iamR1bXAiIHdoaWxlIGRpc2Fzc2VtYmxlLiBFeGFtcGxl
IGZyb20gcG93ZXJwYyB3aXRoIHRoaXMgb3B0aW9uDQo+IGZvciBhbiBpbnN0cnVjdGlvbiBhZGRy
ZXNzIGlzOg0KDQpZZXMgYW5kIHRoYXQgbWFrZXMgc2Vuc2UgYmVjYXVzZSB0aGUgcHVycG9zZSBv
ZiBvYmpkdW1wIGlzIHRvIHByb3ZpZGUgDQpodW1hbiByZWFkYWJsZSBhbm5vdGF0aW9ucywgbm90
IHRvIHBlcmZvcm0gYXV0b21hdGVkIGFuYWx5c2lzLiBBbSBJIA0KbWlzc2luZyBzb21ldGhpbmcg
Pw0KDQo+IA0KPiBTbmlwcGV0IGZyb206DQo+IG9iamR1bXAgIC0tc3RhcnQtYWRkcmVzcz08YWRk
cmVzcz4gLS1zdG9wLWFkZHJlc3M9PGFkZHJlc3M+ICAtZCAtLW5vLXNob3ctcmF3LWluc24gLUMg
PHZtbGludXg+DQo+IA0KPiBjMDAwMDAwMDAxMDIyNGI0Oglsd3ogICAgIHIxMCwwKHI5KQ0KPiAN
Cj4gVGhpcyBsaW5lICJsd3ogcjEwLDAocjkpIiBpcyBwYXJzZWQgdG8gZXh0cmFjdCBpbnN0cnVj
dGlvbiBuYW1lLA0KPiByZWdpc3RlcnMgbmFtZXMgYW5kIG9mZnNldC4gQWxzbyB0byBmaW5kIHdo
ZXRoZXIgdGhlcmUgaXMgYSBtZW1vcnkNCj4gcmVmZXJlbmNlIGluIHRoZSBvcGVyYW5kcywgIm1l
bW9yeV9yZWZfY2hhciIgZmllbGQgb2Ygb2JqZHVtcCBpcyB1c2VkLg0KPiBGb3IgeDg2LCAiKCIg
aXMgdXNlZCBhcyBtZW1vcnlfcmVmX2NoYXIgdG8gdGFja2xlIGluc3RydWN0aW9ucyBvZiB0aGUN
Cj4gZm9ybSAibW92ICAoJXJheCksICVyY3giLg0KPiANCj4gSW4gY2FzZSBvZiBwb3dlcnBjLCBu
b3QgYWxsIGluc3RydWN0aW9ucyB1c2luZyAiKCIgYXJlIHRoZSBvbmx5IG1lbW9yeQ0KPiBpbnN0
cnVjdGlvbnMuIEV4YW1wbGUsIGFib3ZlIGluc3RydWN0aW9uIGNhbiBhbHNvIGJlIG9mIGV4dGVu
ZGVkIGZvcm0gKFgNCj4gZm9ybSkgImx3enggcjEwLDAscjE5Ii4gSW5vcmRlciB0byBlYXN5IGlk
ZW50aWZ5IHRoZSBpbnN0cnVjdGlvbiBjYXRlZ29yeQ0KPiBhbmQgZXh0cmFjdCB0aGUgc291cmNl
L3RhcmdldCByZWdpc3RlcnMsIHBhdGNoIGFkZHMgc3VwcG9ydCB0byB1c2UgcmF3DQo+IGluc3Ry
dWN0aW9uLiBXaXRoIHJhdyBpbnN0cnVjdGlvbiwgbWFjcm9zIGFyZSBhZGRlZCB0byBleHRyYWN0
IG9wY29kZQ0KPiBhbmQgcmVnaXN0ZXIgZmllbGRzLg0KPiANCj4gInN0cnVjdCBpbnNfb3BlcmFu
ZHMiIGFuZCAic3RydWN0IGlucyIgaXMgdXBkYXRlZCB0byBjYXJyeSBvcGNvZGUgYW5kDQo+IHJh
dyBpbnN0cnVjdGlvbiBiaW5hcnkgY29kZSAocmF3X2luc24pLiBGdW5jdGlvbiAiZGlzYXNtX2xp
bmVfX3BhcnNlIg0KPiBpcyB1cGRhdGVkIHRvIGZpbGwgdGhlIHJhdyBpbnN0cnVjdGlvbiBoZXgg
dmFsdWUgYW5kIG9wY29kZSBpbiBuZXdseQ0KPiBhZGRlZCBmaWVsZHMuIFRoZXJlIGlzIG5vIGNo
YW5nZXMgaW4gZXhpc3RpbmcgY29kZSBwYXRocywgd2hpY2ggcGFyc2VzDQo+IHRoZSBkaXNhc3Nl
bWJsZWQgY29kZS4gVGhlIGFyY2hpdGVjdHVyZSB1c2luZyB0aGUgaW5zdHJ1Y3Rpb24gbmFtZSBh
bmQNCj4gcHJlc2VudCBhcHByb2FjaCBpcyBub3QgYWx0ZXJlZC4gU2luY2UgdGhpcyBhcHByb2Fj
aCB0YXJnZXRzIHBvd2VycGMsDQo+IHRoZSBtYWNybyBpbXBsZW1lbnRhdGlvbiBpcyBhZGRlZCBm
b3IgcG93ZXJwYyBhcyBvZiBub3cuDQo+IA0KPiBFeGFtcGxlOg0KPiByZXByZXNlbnRhdGlvbiB1
c2luZyAtLXNob3ctcmF3LWluc24gaW4gb2JqZHVtcCBnaXZlcyByZXN1bHQ6DQo+IA0KPiAzOCAw
MSA4MSBlOCAgICAgbGQgICAgICByNCwzMTIocjEpDQo+IA0KPiBIZXJlICIzOCAwMSA4MSBlOCIg
aXMgdGhlIHJhdyBpbnN0cnVjdGlvbiByZXByZXNlbnRhdGlvbi4gSW4gcG93ZXJwYywNCj4gdGhp
cyB0cmFuc2xhdGVzIHRvIGluc3RydWN0aW9uIGZvcm06ICJsZCBSVCxEUyhSQSkiIGFuZCBiaW5h
cnkgY29kZQ0KPiBhczoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiB8IDU4IHwgIFJUICB8ICBSQSB8ICAgICAgRFMgICAgICAgfCB8DQo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gMCAgICA2ICAgICAxMSAgICAxNiAgICAgICAgICAg
ICAgMzAgMzENCj4gDQo+IEZ1bmN0aW9uICJkaXNhc21fbGluZV9fcGFyc2UiIGlzIHVwZGF0ZWQg
dG8gY2FwdHVyZToNCj4gDQo+IGxpbmU6ICAgIDM4IDAxIDgxIGU4ICAgICBsZCAgICAgIHI0LDMx
MihyMSkNCj4gb3Bjb2RlIGFuZCByYXcgaW5zdHJ1Y3Rpb24gIjM4IDAxIDgxIGU4Ig0KPiBSYXcg
aW5zdHJ1Y3Rpb24gaXMgdXNlZCBsYXRlciB0byBleHRyYWN0IHRoZSByZWcvb2Zmc2V0IGZpZWxk
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEF0aGlyYSBSYWplZXYgPGF0cmFqZWV2QGxpbnV4LnZu
ZXQuaWJtLmNvbT4NCj4gLS0tDQo=
