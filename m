Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 14D248CF32C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:37:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JrJI2vym;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnD5N28yzz8Bly
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JrJI2vym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnD1B5vsVz88k2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:26:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUe4+VCmBES78B5zvjJHDikTFWXGdU//L4LMqCLDIoPN0InMJCDVbrh63GkRyx6M8QVOB9Kyx9eA6H7iUORq8BEM13arj1POQqim0WaUYYZEZFP2AgyA0cd0GFXGFVRLkd/ebLE198USDsFSk608dBTEpsmkae02fWTrF/9uP+eTFieA2ud5eP9J9qa/BfZBrjZFkg0GM4AVOaGKcKGoVC2BdwGNQ5C39R66ntY/VP1Eg+39p4D08dy85Wqgpg1abNTV7Mva4i2AzWoUHEBadjWd4sBQNXrKkiroyC2FBD3U2iV9S5tS8JroppcVxl2EWLZVtkolt52+9z+uqFBHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hO9gYfBbjsHx39gVBDThXeCeoGWZtRtuaY7kTPr7LE=;
 b=jlt9KP5spaNvu91cAozfnhpdSJg0Tx0DKJb4EGPyIabuiG75H4THhPszKrkwH994YC0VxKxBAs3u3sckJMcF/wESV/IVUP2LBUPAo5FXkdkA2p/+Flv1fQMzhpGQREYQINWW6Iz7IqRBe+BKVvGBJmNzgDEev2tQl4WUlA18IGkAkhETRxRxeJ4CJDa5GAKsGT2sFIjmzDKkSkSnjMoA4ppGAKxbuDH/8PiJvuVBLo0ikkQLjf7aCNOErFpx/u19Y8RfKsf5PybNtsA5rYj4X9pssiFIKAq39Mw8zMnESokZvFO0y8+nxw6z1syCGS8Q8sSGBQeIbTaqKhsNd7Io7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hO9gYfBbjsHx39gVBDThXeCeoGWZtRtuaY7kTPr7LE=;
 b=JrJI2vymOZb5JTdUvJvs9FjfA+PCwYCpN4hxD5N6s5GSvsml2WvFnCqcBMhffEhlt4NcHBTB2LBarLw9pfnqnNxzm+BFY3pxiy0yVwv8N7S9ZmGvnS6SoRB99msM5L6hXORgjzzoPhWkb5A+sYeukiWlQFbRxtHINpcGPAUj5BaGV3l0FlaIznt2uGHWaQifvavxli5DHM1kTdem02RNatYpEfEXXUFO1tZ0LNqtEzPEqlwOf51L2+Ysb5lI0nwPTWAV0fCBdx1c4W13LVPozghtQm7rh65F9RgEldY8OCAC8S7Bp+Gip3GRLQPH2DEzT0mAN6NpYpnlwuouPQcjyw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Sun, 26 May
 2024 09:25:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Sun, 26 May 2024
 09:25:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 4/8] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Topic: [RFC PATCH 4/8] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Index: AQHafsSXMVrLile8AEeabKnjy8x1+bFIp3+AgGD4ZAA=
Date: Sun, 26 May 2024 09:25:57 +0000
Message-ID: <94d68801-e74a-40ea-8455-41a30490ab6b@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <1abe6cfaba2ad41a9deb705a4d3de8d1a9b6d5ca.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163559.GE6245@nvidia.com>
In-Reply-To: <20240325163559.GE6245@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3164:EE_
x-ms-office365-filtering-correlation-id: e3ce1506-4cc8-4570-d0ac-08dc7d65d9ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?VWRQQzBRSFZ3ZHJDcWVnLzAxWWFBTVY2ejBOQm43VXU3NEI0S25FNGlMREpw?=
 =?utf-8?B?RjgzbVZsU2VQb0swYUxDdDllQmQ1RWs3eFZwWFl3eTlEQUtzczVrSGlNbHp6?=
 =?utf-8?B?eDBCU1h1QXArWkdaS2FORzNzNkEvOHJFMVVndFdtZjFPMnUraWs3T0FKL3dP?=
 =?utf-8?B?MWh6Y3h1VWlacHpleWg0Q2FScFhJMy9qdlFYV1lTa2F5WmZrc2F6U2FUYnpQ?=
 =?utf-8?B?dlA4bTFKUU1rK1VSWEhsRDZEeC9va1RuVXVuRGl5K3krQm00NTV0cXA1RHVV?=
 =?utf-8?B?VEpVV2d3NktDTHdVTFZtRDA4cEVkZ0laVUZ5K09NM0dkV1o2T0hDRTZnT1Vo?=
 =?utf-8?B?VS9Wdjd0NktvbTVveTVhdStub09UWTEzSEZwcTRJNHdXSmluZ3ZsK2VWMEpV?=
 =?utf-8?B?cmlmRGg4M2gyZGQ1WnhhalAvR3pwd296UmFjUndOOW9YRzZ1Y3AzRmJiblNw?=
 =?utf-8?B?UmZKMXNzb1ZLclJhd0YvS3F1ZFVXYW8xT1JRWGkrdW43NzI1elFDR3oxK2Vk?=
 =?utf-8?B?YTdzOHNXb084NVdkM1JJa2hKTEs0U04zS05NTmtmSElZOEdlRTI3SXdQL05X?=
 =?utf-8?B?elJab0Z6T1dGNDBETG8zS2dBdjMzWTJSMnFpVk9YNXBGbnhoM2ZocHVFWitm?=
 =?utf-8?B?Wi9TL05LS2JFSTJGRmY4UmZDd3RDV085aERlQURJbW04cDNRcUY1TENxcEZ3?=
 =?utf-8?B?MStuKzQ2b0NuUEdqVkdCUGRWSkhRUEVtUUdDR2pIbjViNk1NK3VvcFdNQ0ly?=
 =?utf-8?B?VnNmTUNXRHZGMkM2V2M0Qy9zclNIU3hPY083S3IxQXIxS3AxSkVvQWRJTW42?=
 =?utf-8?B?ME45ZXVCUXhrSUVoZElJdWRnSXN5b0UrQkxDUmJFZUJVRXBZZXBKc1BYR2Jr?=
 =?utf-8?B?Q05HSGlTc3I1bGxVSnUySGthaHZ2S1htMERsSGErRTZrR21RMFFaUlJORFU1?=
 =?utf-8?B?S0tPbUhNbmR5YzRxWVEveHpzVy9OS0NlMUwyVGo2YlN2TXZDV3d2SlZnR0NV?=
 =?utf-8?B?ekJLZk82dEQ5QVdBMjFMUU5PVWtvUWgxRytOZnhUQ1lYaVVEWGQ3WU5NWllN?=
 =?utf-8?B?ZUFWb2JkSUJ5Q04zYTQvdjMxL3NYT0pnaHRoYXY2TXZWTnhIL1VzMnBmMys4?=
 =?utf-8?B?TDZBeGhRSnVWb2pmUmFRR0ZsVFZRL296Z0dYRzF4TUNVTkErRXVHVFo1Ym0r?=
 =?utf-8?B?THliVGdFVXlkV2pmekZ4TGt1alJVTmh2ZmRuQlJFeXRkNmtHTUwzSmF2OWsr?=
 =?utf-8?B?MXd1MHZNY2tTaWg2TUNoQUF4NkNHejBDSHA5Q3M0cllZdEc3RWhSU2s1UkxE?=
 =?utf-8?B?YWhDMEZRUEg2Y0xsRWZteUhUS1ZvQUFSYVN3OHF3b0JjSlFmdHpzU0NzNDRq?=
 =?utf-8?B?aDI2NWZvd0VQL3A5VkduTmFTdEo2b0g2aUJWeVd4dWRreFg0eE90ZTMyVWEw?=
 =?utf-8?B?M0FKWGhtZnBYd0g1aWFSTGdKMk9vZmlkYm5lOWc1aVFvSWx2M0dOVWwvd1Vo?=
 =?utf-8?B?Z3hnYXFRejdGeHlra3pOdGlrOTZyZXNFNzdkajdIdG1qSHVoWmdrVlhwMWpy?=
 =?utf-8?B?SWlZdHloMU5qbzVHQnVhNFJ0Wi9UeWZEZ01xQmRxTG5TTzkxaTVRLzhhOVhs?=
 =?utf-8?B?bHVUU1hzNHlvUXJtb3pRVDhISXhlb3R2Uld3VkNZNFRBaC9CdTBoT1VxTDBu?=
 =?utf-8?B?bm9tZ3RqcDJwOFl4WklLamVpN3YwMDcxOGZNMjhFT05RQlAycGg4TUJHT1Zn?=
 =?utf-8?B?LzU4ZVRpRzhIb0N0SDJDUnRtZ1FhckJsakFuUm1PdzZOZmREU0NPekVGcHpj?=
 =?utf-8?B?K1liSzAvSkNMWXlCeXc2dz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aFRMRjhJUDhzME1BUGRqdVdidWpPd1lwY0dBVmNQeTRrc1RLUnVtUTlQYXQ3?=
 =?utf-8?B?L2trU0FxTXNzaEIxckFJd0tkcUFRZUdmTVFkOUwyTmZFRkZVVDhpU0w5SitV?=
 =?utf-8?B?S0puV0FQa3dJdGZwalFHdi8rdER0Sy9TQjd3b1V2Y0psVlp4UlFhanFrTVZS?=
 =?utf-8?B?MUVaeGp5OGZMMm4yUlV6ZzJOcEVSbTZkLzg4b2hWV3ZPYmdyMkxLVWRXNWJX?=
 =?utf-8?B?ZEFkcnI2TGZjQlZNdDZPRzF0TW12VjZiaUc0Z242SFN0U0dWR21RSEgvZHA0?=
 =?utf-8?B?K2IveXcwZlhuZVFIUzNhVTJ5MWxmcy9JY0xoS3JnUjFaKzFER3d3MW1sQVc0?=
 =?utf-8?B?eVdZaGdGU3V1bExUdXQxb1NZbUxYQkFsRzVHcGhyd0tTSkk1SzVmSGZtRXZa?=
 =?utf-8?B?V2Q2ZllNM2MvVGE4Z2o0Zy9zdmJOejBhclRzZ2g3MjhCYkZvRmh6YTBCVFE2?=
 =?utf-8?B?OWhXRWE0WVBpMTA0UElVZHUvbG82ZGtFZDUycmkwWk50N0hrT1UyNlo4cDkw?=
 =?utf-8?B?clB0eDBIVnIrMEVVN1h3b3g2MWh3MDRmSzlYWlMvRlZvOFR0a0k3NGtVYXlw?=
 =?utf-8?B?U2Q2UDArclVZcVhZZkJwVHVyY1cydFZjUVJpRnAweEF1NGJnRzlObzlmU3VF?=
 =?utf-8?B?WXRTcy9XcHBDaUpqZUJqVlpYTGcxZlNWa1VGNThueGhFOUJITWp0Q2tiTEN5?=
 =?utf-8?B?dVUrc3ZMWk1NckdXTVd1SStzQnpTWDJLeDMwb3dQL3krd0oycEhIeU9rOFNw?=
 =?utf-8?B?Sm1zMUp0alAvRVl3MkpyN3dvRUVsSysvR2UvQ3pTL3pmVCsra2N0NjhMVnNJ?=
 =?utf-8?B?bFZtOHR0QXFaeDlMRkh3c0xFUURCbHBRN2tYRTVsdDR2SHRlcnBRR1g4ODdi?=
 =?utf-8?B?Y0wwT2FYL3ZLWTc5Qzh5aCttcWRpaHplbjVBSWRyWGcyQXBheGp2M0tVSUNk?=
 =?utf-8?B?R2F5dlpHaDlyRXA2K3R6ZlU3UlZPY0h5aHFoazkxN0FualhoTVFMRWVFUDVS?=
 =?utf-8?B?WVd3aXJSRHY4YytETHlqcGgvdUswQm9SMlpteXEyZUg2YkF6WGRYMmRUM2d5?=
 =?utf-8?B?bGx4REUwQU5NS0t6WGRUNExxZlJzR3dtMnA1bVRCbEcxMVNoNm56bjJQUm03?=
 =?utf-8?B?cllMN3lxa2twSUdlZklGSnU2UThjTWNWeTdQak5YMndGbVBsdXo0eHA2WjJH?=
 =?utf-8?B?NDlIWVV5MFpuU0k0YnpJaFRXTU9JSGpESzU2Y3hqRHdtZVBUQWk3YVZCV05n?=
 =?utf-8?B?NnFRM294VnBiL2g0RDVieXA1RGMxa0xPdTRPL1N1RDdlVlR2WmduR0QzdnVz?=
 =?utf-8?B?MU1Sd0xMU0p4c2Yxelp0WnlsRWFpTnFKWDRCN1A4eUNGZzFDUksvZkNNanU4?=
 =?utf-8?B?cEkzSWdNZTVEMGdDZi9LckFkWDY3MnpHeGlBenRYaFNvMndtZ1paNm00NHJY?=
 =?utf-8?B?Y2FjUXpMNXJra2pNbGQ0eGR0aTRnMlZHUnY1YSt0MnZwMThuWWtETVZrTjBY?=
 =?utf-8?B?WUM0UkFESng5Vjl5eW5qSmZkNjVBeWR5ZXFpbHpjcWNkRTcxMnZnS3JCOGNZ?=
 =?utf-8?B?MzIxSFpLclBoc0lYZ1lWbWxSMnQ3ZW11NzFvYml5MEMzcTVkVVJpaFFMRTRC?=
 =?utf-8?B?MjlKWS96SUpJTkF3U1UxL2E5TW51R1J6MVBGSkxST2JUeHE5dFdlK1hScmhN?=
 =?utf-8?B?RnFqbllHcXlKSnJmc3BBWVZKMWhxczZQdDFFaVhycGJ0OE1kVURnVWswZlp0?=
 =?utf-8?B?U2JxdXVwb0tDd0FxQnp2N2RCclBtNTJsSCtpSEE3Y1B3Nm10bEsxcmxNZ1Yw?=
 =?utf-8?B?YnozNkUrNG5zbXVPdEZCWWx6WkVLK05Dd3NudkF3bGhFZkpBZzdKU0lwNHJv?=
 =?utf-8?B?cnNibnF0d3ViWFFSRGlsc1FkbnhWWWtLWHUyOXg5bjFmUWdlV05KSHhyN0wz?=
 =?utf-8?B?WkF5RkpXaC9pdlAwbHVjdE52c1FwK2ljZ1I5RUZoK1hEQm9mbjJBb2c2TnFK?=
 =?utf-8?B?dWxTODhOUER5YWhrTzNlVnZaTDhXU0l4dHByKzlVMXdSUmFyRWRQUmd1MWZP?=
 =?utf-8?B?R2pIa0JUc3ZQNUVqMnliUUQrZ2M1bVU4aFRkK2IwbHROUkZmSk1YSDZ5Umpz?=
 =?utf-8?Q?g5lGKlMqaf2yswVZKwnECzKHF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <606330E84D7FD24BB4A444812290AD0F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ce1506-4cc8-4570-d0ac-08dc7d65d9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2024 09:25:57.8301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jfz5wXPIY9JWANIXuWN6KeUr09QFuuzzBcngmOyrgaWkOS/fyJZWJ/ohnE5WSs6n2gmfBhrkjO+n8aJQ0HOXtTsZOod+JbTH9ypwBF31st8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3164
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAzLzIwMjQgw6AgMTc6MzUsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NTo1N1BNICswMTAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPiANCj4+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9odWdldGxiLmggfCAg
MiArLQ0KPj4gICBmcy9odWdldGxiZnMvaW5vZGUuYyAgICAgICAgICAgICB8ICAyICstDQo+PiAg
IGZzL3Byb2MvdGFza19tbXUuYyAgICAgICAgICAgICAgIHwgIDggKysrLS0tDQo+PiAgIGZzL3Vz
ZXJmYXVsdGZkLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9odWdldGxiLmggICAgfCAgMiArLQ0KPj4gICBpbmNsdWRlL2xpbnV4L3N3YXBvcHMuaCAg
ICAgICAgICB8ICAyICstDQo+PiAgIG1tL2RhbW9uL3ZhZGRyLmMgICAgICAgICAgICAgICAgIHwg
IDYgKystLS0NCj4+ICAgbW0vZ3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0K
Pj4gICBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIG1tL2h1
Z2V0bGIuYyAgICAgICAgICAgICAgICAgICAgIHwgNDYgKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0NCj4+ICAgbW0vbWVtb3J5LWZhaWx1cmUuYyAgICAgICAgICAgICAgfCAgMiArLQ0K
Pj4gICBtbS9tZW1wb2xpY3kuYyAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+PiAgIG1tL21p
Z3JhdGUuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tDQo+PiAgIG1tL21pbmNvcmUuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+ICAgbW0vdXNlcmZhdWx0ZmQuYyAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KPj4gICAxNSBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCsp
LCA0MyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9xYXJtNjQvaW5jbHVk
ZS9hc20vaHVnZXRsYi5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9odWdldGxiLmgNCj4+IGlu
ZGV4IDJkZGMzM2Q5M2IxMy4uMWFmMzlhNzRlNzkxIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9odWdldGxiLmgNCj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
aHVnZXRsYi5oDQo+PiBAQCAtNDYsNyArNDYsNyBAQCBleHRlcm4gcHRlX3QgaHVnZV9wdGVwX2Ns
ZWFyX2ZsdXNoKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPj4gICBleHRlcm4gdm9pZCBo
dWdlX3B0ZV9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLA0K
Pj4gICAJCQkgICBwdGVfdCAqcHRlcCwgdW5zaWduZWQgbG9uZyBzeik7DQo+PiAgICNkZWZpbmUg
X19IQVZFX0FSQ0hfSFVHRV9QVEVQX0dFVA0KPj4gLWV4dGVybiBwdGVfdCBodWdlX3B0ZXBfZ2V0
KHB0ZV90ICpwdGVwKTsNCj4+ICtleHRlcm4gcHRlX3QgaHVnZV9wdGVwX2dldChzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCk7DQo+IA0KPiBUaGUg
aGVhZGVyIGNoYW5nZWQgYnV0IG5vdCB0aGUgaW1wbGVtZW50YXRpb24/IFRoaXMgd2lsbCBuZWVk
IHRvIGRvDQo+IHJpc2N2IGFuZCBzMzkwIHRvby4NCg0KSXQgaXMgbm93IGZpeGVkLg0KDQo+IA0K
PiBUaG91Z2gsIHJlYWxseSwgSSB0aGluayB0aGUgcmlnaHQgcGF0aCBpcyB0byB3b3JrIHRvd2Fy
ZCByZW1vdmluZw0KPiBodWdlX3B0ZXBfZ2V0KCkgZnJvbSB0aGUgYXJjaCBjb2RlLi4NCj4gDQo+
IHJpc2N2IGFuZCBhcm0gYXJlIGRvaW5nIHRoZSBzYW1lIHRoaW5nIC0gcHJvcG9nYXRpbmcgZGly
dHkveW91bmcgYml0cw0KPiBmcm9tIHRoZSBjb250aWcgUFRFcyB0byB0aGUgcmVzdWx0cy4gVGhl
IGNvcmUgY29kZSBjYW4gZG8gdGhpcywgbWF5YmUNCj4gd2l0aCBhIEFSQ0ggI2RlZmluZSBvcHQg
aW4uDQo+IA0KPiBzMzkwLi4gT3VjaHkgLSBpcyB0aGlzIGJlY2F1c2UgaHVnZXRsYiB3YW50cyB0
byBwcmV0ZW5kIHRoYXQgZXZlcnkNCj4gbGV2ZWwgaXMgZW5jb2RlZCBhcyBhIFBURSBzbyBpdCB0
YWtlcyB0aGUgUEdEIGFuZCByZWNvZGVzIHRoZSBmbGFncyB0bw0KPiB0aGUgUFRFIGxheW91dD8/
DQo+IA0KPiBKYXNvbg0K
