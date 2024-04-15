Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 773068A58AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BrEZoLuR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJDCB1t2Xz3vZh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:08:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BrEZoLuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJDBP5QGtz3dRJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 03:07:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcDfvMBpfIET16V/K6j5chV/53izICCOeunRmCYqQq2U4R69yP5UOyoA5wlsoWr99nmb3iVVnT2DGV7xOzmAMX8Aybil9UFyxj7wCMroWVGg9LXbUR8/nFPAdYMBHUrFMjd/sVcEy1B+eguTzsqN6JgVWl5zDIwQx9NOfs3QQwzy9fz08cSkWkX8ORHxMz7tkBZNeUSdXdy26Zg4vhpzwZeCe5B+AHrkmbFO18VpQdQqdZIF6nfb53el65qzzaEP3tz0lgFM2gNsNTVUtwR3op0Lwj8drhsM0ARJgIkwuqHtJL34HSdjZ80kqj/00tia5mND0k/KBgBz1e9th2fQ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ou7nLuNwKTPiKm0Jvd2LLk3hTzMexEZbAPlzNuQs6k=;
 b=XOOiTeY+FyAYDuzaMnJ+OG8oFLjWPPkOy47wXgJJb3zaEyQILHA51g3mPE1XNysuNHzAzhGtXaj50PE/XTgrjzyB7JqMmTqcjCgRiH0iea11l5PAVhTL1isQc085QipDVCsqkODpto8RIfP7XkSuj/tS97EC6/sixuiA33HuYCtUyWhvJhyV5KTTUKRYSeyYiTNmK+Hd1XSn4PbBCIE4oY5EvEHdSb/Dnmmc0emUkp6CR7qWptUkpLWAQipgBIjq40Q+k90Zd6JOx0ld1oKnM/cCY7hMHaM7JlBrliw02katMzrVCynQxBsIg2/yfrl3u0smYAtYA4IcDnEfRGzKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ou7nLuNwKTPiKm0Jvd2LLk3hTzMexEZbAPlzNuQs6k=;
 b=BrEZoLuR8tsgShkAJzRxQhN3GS7NgeaXhyEgBzTz1Fa176Gk8qsoNe2L31kPe1U/bTbB3wpzZSlIOIBdi3SALD1/gDP28UpceZNc7sCdVjnO+QZsc+8opfPJ8TpgIlIQX/1N6ezquDx0+vzFi1GezQhNxxJWERzlP1D2IDYzmsqnz8mescV9bFCAwwOBx+7Nz/xkxsDuHriv9lOuRljpVIIAV4x3W71vfPxYdvmQIaUCP8d3aXYhuLYbKXTITO2IdGkGST+Pjivmlu0QE3oCQvN8f8ImFR/DOaWi28ohSl6dResQrgsWvO85mWdwm+mbYpbb7dJ3VmmqJePWOrqa3w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3557.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.43; Mon, 15 Apr
 2024 17:07:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 17:07:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
Thread-Topic: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
Thread-Index:  AQHai1xRYzjVdYtCeEepwMKzYWvQLLFipl4AgAADMgCAAA/YgIAAAq+AgAASP4CAACE+AIAFsHwAgADeTwCAABmhAA==
Date: Mon, 15 Apr 2024 17:07:15 +0000
Message-ID: <a87bed5b-edb7-4ba2-bdd1-88fcd1da7b69@csgroup.eu>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
 <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
 <4d429a10-eb45-4262-8e74-69af810ef1ac@intel.com>
 <dd6653b2-3a88-4b95-af13-c6fda5b27b39@app.fastmail.com>
 <875xwjcqpl.fsf@mail.lhotse>
 <e0cf6827-06c2-4212-848c-10d275c75546@app.fastmail.com>
In-Reply-To: <e0cf6827-06c2-4212-848c-10d275c75546@app.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3557:EE_
x-ms-office365-filtering-correlation-id: 6d2f52fe-aa80-45b5-929a-08dc5d6e801a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  =?utf-8?B?N0NxKzJrb1BVYksrYkU3Y01CNVRoNUlwQVB0ZWpDWWRWU2F3NkVrdjZLOUQ5?=
 =?utf-8?B?MEdoYmRKUlVLbHpCYmduemVIcjM2eUlXSTcxWHJDQW5RRUNVOXduVTJmWXhK?=
 =?utf-8?B?OW52bUoyeVJLUG1GelIrR3c1bHZpQjRUZXJOaXJIQkcwUXdTY0RNVjREZEFP?=
 =?utf-8?B?enlQZ3BJNUtocnVkZ0FSUTQ5QjVqYjRsZ2M1UVBYWFUrcEYxQnowVDZ3MGMy?=
 =?utf-8?B?OVE5R0pyRllXRVFUTkNoVC9uUFFpdFdFK2JkRnpuaDZ0U1VqbitDb0pQSlIx?=
 =?utf-8?B?QVVORXpTVCszbGJBdmNuOFoySGgySFViQ0l6aGFocjZuSHhFZmIvUXBMV0dB?=
 =?utf-8?B?dnB3MFlmUlE3NkNNd3JPTTg4Qm5uVm9mSmZMUFpNTXBZZGxDUXlRcTZ6bEhU?=
 =?utf-8?B?ZDR3OHBKVWpuanlXQkJudStPSHhONExJV2hhMVZtRjc2UjgrUm5aUlJmekk4?=
 =?utf-8?B?c3B1TDFkaVJvZnoyRCtkWkRiWCtKd3p0VUdDSWVqd3ViZjJZcHo0K3BITUtx?=
 =?utf-8?B?VTdSaEJXN3FzTllnRlhiZ2JSZEpWRUx5bVBaRG5HQUFOZXpBZlRRV28va1Zi?=
 =?utf-8?B?bDZMN0lDQzczdXZJZlltTFRUWStnTVBkZDN3TE5walVQV2o1SjRTRGlFOG5S?=
 =?utf-8?B?UFozQUU2NXRWWXZuWGRDc2w3S0l1cUd4cDdScS9vUEVXVTdxNEdPcnF0c2I4?=
 =?utf-8?B?ZkM0TzRsY0l5SklqcGdNbTlPRmsrdjF1L0ZxM09uTXZ2WlR1dFlLNDVva2tN?=
 =?utf-8?B?NGpCWVpEWGN4bW5SNTg4SjVkME9uNVRRNjBkY09HMDhJeHMyelVVd3BJNTdF?=
 =?utf-8?B?bE1TQWZvVHJtRjJZZXFVRFZOemtBNmR3ZVJKajFBY0xrQlBpUmNaOUo3c1NU?=
 =?utf-8?B?YWU0cWJhNnozelIrUDVud3pRb0FpZ2xVd0JxR05UcStTOFh6VGxaY1ZoVTNu?=
 =?utf-8?B?b0w2Z04xaTR0SUNyRVdmdjRMbzk5NXdsQW1pRjk3NWw4UXorT3ZXSTY0SU1p?=
 =?utf-8?B?K0N6dlZYWm54N1JUbnJnNVE5eFI2M2phNlB6c2RsMndNMlo5U0pxS3BrMGQv?=
 =?utf-8?B?T0VGZEVKMWI1Y2Y4amI3OE9FbUlWZUN2VFdxM0VmUmxZc2ZqYVllWmJsQWs4?=
 =?utf-8?B?b2xSNFV5MUExN2tsWmFpbU1iQStnenZBM29lMWM3eXIyM3Z6bmR1QmtXN1d2?=
 =?utf-8?B?djhadGdkZFd5SzNRMTRWMm9vWitYcVNmdDc3TXhQdWFNckwxbEJlNWRjTURw?=
 =?utf-8?B?REl0MmJXd0NRL0NlYlZkWXR5QndqUGdZcGp5SURkKzhLaWhreDM4VTdGeVA3?=
 =?utf-8?B?dEpHL3JvV3d3MllzY1FnVzVHVFdIREJ2c1VoN2k2OUwzRWpXVHZvWGNQOGtr?=
 =?utf-8?B?ZkhXNVZkdjB5d1FEQUFud2xRNW9TamNoR043WUE3QWM3Ni9kVGNkdkNmemx3?=
 =?utf-8?B?MlZoV01NUkJqRWh0SjNsRGxseGY5TzhkYUtXeHFObWlaLzI1YW9BREMwUUJm?=
 =?utf-8?B?NUsvLzJLZkpjdXl4d0VoMkxzNExndkZxeXRFVmU5cy81NVM4aGJOZVRac1hh?=
 =?utf-8?B?OG1LWUh6cW1rQldjYUsrVHcxZFhiSzZrNmxFdmZ6aFVXdGFPU2Q1emJQUmxr?=
 =?utf-8?B?NDJLTlJ3enVTclBYUUZGOWtSeGxGR1FOc0dxUU5yS1FzbklDcko3KzBnM3ZZ?=
 =?utf-8?B?ZWN6TW53eElYNXAxWG1TaTZpK2I0cDNrRnRuU3ZiTE15dkxxdlQwM0FYMkFP?=
 =?utf-8?B?bjhSKytaWGJoL1M5cVpvSk5YamhyMnZ5NmUyZGR1TWN3U1BVQjc5WjA0Z0ls?=
 =?utf-8?B?ZkR3SFcrNklJdUpVWmwyQT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y0NPdUplNEl0ZHZMMG1VcFgramlvUEIwYnBHaURUZlU4clRMY3NqM3ZyK1FO?=
 =?utf-8?B?OGlSZS9WMGd3NXZYL2RzdkZiUEtQd1dqTWxDZUNiY3dWUWR1cm42d3JnVVFY?=
 =?utf-8?B?UzRQc3FiZkZGNWthczdod0N0Yk1uZVY3bTVqaEtIT3YxeUdJb0NhbzVlYitC?=
 =?utf-8?B?NzdLenRoK1JpWkFNc21WUUs0K3F2Y0xSVU5YRlBLaGZBSFJIV3pyZ25NR1Vk?=
 =?utf-8?B?M0lXb1dWU1E3Q0lSOG1YT2gxQTMxQUFpUjFKNE0vRkY3WFVXZjVrdW9YQkxn?=
 =?utf-8?B?djIrZWkrajNaZjJlRWMyMjZkQTdsaGJwY20wYmNWTjUyYzRiQlVpc3FUa0k0?=
 =?utf-8?B?UmhEYmNXWXhQaUVoZ2J1RWgwT2Q0RnA1akYwbEttbjI0UXdqemJFMk82WTU2?=
 =?utf-8?B?a0Jpc29GNEdnRmdvQ0NSSmxoWDJIWGRnOUsvL0Y2U0FpUW9FTUNSTTlFQ0t5?=
 =?utf-8?B?NW1yOUdYWlhoZW9HZm5taFZmTDRhZWRLL2FKYmlydVhTVkp1aXNybDQySlE3?=
 =?utf-8?B?emtoMy9vYVdBMUt5V3p4d1dIOENzNnpmaEhNWENkLzlZemlGdVNEY2NFYlVw?=
 =?utf-8?B?Smh0MmswSG1JZ0xWK1g1bjQzUGRZMmROM040NVRLOGdpOTlRckFiTFFtUytC?=
 =?utf-8?B?K05Hd0ZiYzJTTUdVWUdQd3gzSldpR2tUOURSVlR3UU9KSElDMDZyclZwM2F6?=
 =?utf-8?B?WlorSm12bWpHMVdES3VxK3ZTVm8vQ3VKOUNIWkN2NEQrSGlhNUpucXlXbnBH?=
 =?utf-8?B?NHBVd2Z4aGdPWkZ2c21ERU1tR3RzZjdOWlRmTmZQVkpDMUFUdWtRRDRWNFZF?=
 =?utf-8?B?OVFoVVlwT1dncGE0K1lwOVNuU3hDMmJ1ZTlrTkZtRW9mdjcvZ3lOV3k1Zm5N?=
 =?utf-8?B?NGw2U2EvejAxSEhVVHMvejFHU0FHbVJKazZZcTVwU0pXSGZvOS9uRDQ3NThO?=
 =?utf-8?B?bU5qSjh3NVd0V08vZUV5S3lCRFcrVnR3a0hmTk9SMU9sN3JkNUVqVXdUQ0gw?=
 =?utf-8?B?VENwcExFN2JFWExYY3RMMnRaa0lOMCs4RFgyUk9mNTRGTEtGT0p6YUsyeDFq?=
 =?utf-8?B?elc4Tzk4a3YrV1UvZThpWkZrU2E4S2NlOWJ4RGdLSGM5UmVnZEJ6WG5sN1Z2?=
 =?utf-8?B?VHdxNzMvWUJZbUR6Sjk3ZURMb0MxbzdRZHUzKzdrWTZKeFo1Vmk1ZFR4ZWlj?=
 =?utf-8?B?c3dDU1RSQVREYnE1NnZaZUVOaDlhYURDWDZ4WEgzdTU0bVdYb0RmZGR0V0Mw?=
 =?utf-8?B?MWs1UkswdTl5S2F5WThkK2MxRXptNVlFb2NhdXFoWVdMQWhzaThaWlJCM01i?=
 =?utf-8?B?Tno3L29YdlhNeTBROGtTUHNOeE1KUDBiSXJ0QXh0Y0EyTVpjejM0dUFXOFky?=
 =?utf-8?B?dmo2clRNTWpnTUhRWGlNczM2bEdDWExVWmJRZHRlTXgreUlwczV2dU1rZ2No?=
 =?utf-8?B?U21ySzIxTTVsYVRBNmtuc0hDVndkZUsvMm9QQXNJbVcrakxaRWNIS1RaTDQv?=
 =?utf-8?B?T0dMZk9YdGZwRTY0aHdRT1N2TjlBVFRKekVIcXVma0I5YnBnODRPelI1UURk?=
 =?utf-8?B?eWtaZkhjRWwzNUVkOUJEdWFncjhaMmVSKzRvVW5nWlB2N1IzSkgvZFFPa21V?=
 =?utf-8?B?OGxDMDcrY2xuVkZ4eTNPK2Y2bG01M1o1QU5zNWU4aVB2MS92ejdMSnM0dmpQ?=
 =?utf-8?B?RC93RG9XSjgzZmZ0SmhGTG9mUXdoUm5TODdQcmlPWU9ScEh1elRUT2hsd1R1?=
 =?utf-8?B?Qi9rK3MwU3A0WW5NL214ZktBOElJdjVleDFKUXhjanJpWVRMbzNRQUxIMVBk?=
 =?utf-8?B?Ty9RY1lyWWV3NUhKNm9PU3lTcHJlT045eXc1eGhQMHZPYUpLVXhiR1RVN09U?=
 =?utf-8?B?TTdtaWNoZ0pVQzFYZDFUK1E2eXZmM2s4NFh0MDl6c0VLUnVJdFNkKzE0REZi?=
 =?utf-8?B?VkR6S1VCZ2tWVDNXQ0tOZS9yQ05BWGgybDM4QVl3dGRXWGZjTWtqQytFYXF0?=
 =?utf-8?B?dnZhSUFITzcvalovODZhQS93SXJISnpGVzFRenp3ekZEVGFJWFZUd3pGWkdy?=
 =?utf-8?B?TmpHMktnMjhDa2ZwVWlPVlBIdTNXSVF2c0FHZFZzTWJCc3FWY0w2bzZnMHpk?=
 =?utf-8?Q?QEYsajvD3loItfkQ5o0kj9uJx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6616A4B7FA4FD54CB365C43007A1CCB2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2f52fe-aa80-45b5-929a-08dc5d6e801a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 17:07:15.6635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLPdr9oPXvE0J3/yosGHz/uVwOk5ZLneX7xCS2/k2OlJs12LkyU39OhufJDAO/pZjxUtk3IWhtpccXq4/UnCUIz8OtgW3uhKuG269QTSI1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3557
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA0LzIwMjQgw6AgMTc6MzUsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCBBcHIgMTUsIDIwMjQsIGF0IDA0OjE5LCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOg0K
Pj4gIkFybmQgQmVyZ21hbm4iIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6DQo+Pj4gT24gVGh1LCBB
cHIgMTEsIDIwMjQsIGF0IDExOjI3LCBBZHJpYW4gSHVudGVyIHdyb3RlOg0KPj4+PiBPbiAxMS8w
NC8yNCAxMToyMiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4NCj4+Pj4gVGhhdCBpcyBm
cmFnaWxlIGJlY2F1c2UgaXQgZGVwZW5kcyBvbiBkZWZpbmVkKF9fT1BUSU1JWkVfXyksDQo+Pj4+
IHNvIGl0IHNob3VsZCBzdGlsbCBiZToNCj4+Pg0KPj4+IElmIHRoZXJlIGlzIGEgZnVuY3Rpb24g
dGhhdCBpcyBkZWZpbmVkIGJ1dCB0aGF0IG11c3QgbmV2ZXIgYmUNCj4+PiBjYWxsZWQsIEkgdGhp
bmsgd2UgYXJlIGRvaW5nIHNvbWV0aGluZyB3cm9uZy4NCj4+DQo+PiBJdCdzIGEgcHJldHR5IGlu
ZXZpdGFibGUgcmVzdWx0IG9mIHVzaW5nIElTX0VOQUJMRUQoKSwgd2hpY2ggdGhlIGRvY3MNCj4+
IGVuY291cmFnZSBwZW9wbGUgdG8gdXNlLg0KPiANCj4gVXNpbmcgSVNfRU5BQkxFRCgpIGlzIHVz
dWFsbHkgYSBnb29kIGlkZWEsIGFzIGl0IGhlbHBzIGF2b2lkDQo+IGFkZGluZyBleHRyYSAjaWZk
ZWYgY2hlY2tzIGFuZCBqdXN0IGRyb3BzIHN0YXRpYyBmdW5jdGlvbnMgYXMNCj4gZGVhZCBjb2Rl
LCBvciBsZXRzIHlvdSBjYWxsIGV4dGVybiBmdW5jdGlvbnMgdGhhdCBhcmUgY29uZGl0aW9uYWxs
eQ0KPiBkZWZpbmVkIGluIGEgZGlmZmVyZW50IGZpbGUuDQo+IA0KPiBUaGUgdGhpbmcgaXMgdGhh
dCBoZXJlIGl0IGRvZXMgbm90IGRvIGVpdGhlciBvZiB0aG9zZSBhbmQNCj4gYWRkcyBtb3JlIGNv
bXBsZXhpdHkgdGhhbiBpdCBhdm9pZHMuDQo+IA0KPj4gSW4gdGhpcyBjYXNlIGl0IGNvdWxkIGVh
c2lseSBiZSB0dXJuZWQgaW50byBhIGJ1aWxkIGVycm9yIGJ5IGp1c3QgbWFraW5nDQo+PiBpdCBh
biBleHRlcm4gcmF0aGVyIHRoYW4gYSBzdGF0aWMgaW5saW5lLg0KPj4NCj4+IEJ1dCBJIHRoaW5r
IENocmlzdG9waGUncyBzb2x1dGlvbiBpcyBhY3R1YWxseSBiZXR0ZXIsIGJlY2F1c2UgaXQncyBt
b3JlDQo+PiBleHBsaWNpdCwgaWUuIHRoaXMgZnVuY3Rpb24gc2hvdWxkIG5vdCBiZSBjYWxsZWQg
YW5kIGlmIGl0IGlzIHRoYXQncyBhDQo+PiBidWlsZCB0aW1lIGVycm9yLg0KPiANCj4gSSBoYXZl
bid0IHNlZW4gYSBnb29kIHNvbHV0aW9uIGhlcmUuIElkZWFsbHkgd2UnZCBqdXN0IGRlZmluZQ0K
PiB0aGUgZnVuY3Rpb25zIHVuY29uZGl0aW9uYWxseSBhbmQgaGF2ZSBJU19FTkFCTEVEKCkgdGFr
ZSBjYXJlDQo+IG9mIGxldHRpbmcgdGhlIGNvbXBpbGVyIGRyb3AgdGhlbSBzaWxlbnRseSwgYnV0
IHRoYXQgZG9lc24ndA0KPiBidWlsZCBiZWNhdXNlIG9mIG1pc3Npbmcgc3RydWN0IG1lbWJlcnMu
DQo+IA0KPiBJIHdvbid0IG9iamVjdCB0byBlaXRoZXIgYW4gJ2V4dGVybicgZGVjbGFyYXRpb24g
b3IgdGhlDQo+ICdCVUlMRF9CVUdfT04oKScgaWYgeW91IGFuZCBvdGhlcnMgcHJlZmVyIHRoYXQs
IGJvdGggYXJlIGJldHRlcg0KPiB0aGFuIEJVRygpIGhlcmUuIEkgc3RpbGwgdGhpbmsgbXkgc3Vn
Z2VzdGlvbiB3b3VsZCBiZSBhIGxpdHRsZQ0KPiBzaW1wbGVyLg0KDQpUaGUgYWR2YW50YWdlIG9m
IHRoZSBCVUlMRF9CVUcoKSBhZ2FpbnN0IHRoZSBleHRlcm4gaXMgdGhhdCB0aGUgZXJyb3IgDQpn
ZXRzIGRldGVjdGVkIGF0IGJ1aWxkdGltZS4gV2l0aCB0aGUgZXh0ZXJuIGl0IGdldHMgZGV0ZWN0
ZWQgb25seSBhdCANCmxpbmstdGltZS4NCg0KQnV0IGFncmVlIHdpdGggeW91LCB0aGUgbWlzc2lu
ZyBzdHJ1Y3QgbWVtYmVycyBkZWZlYXRzIHRoZSBhZHZhbnRhZ2VzIG9mIA0KSVNfRU5BQkxFRCgp
Lg0KDQpBdCB0aGUgZW5kLCBob3cgbWFueSBpbnN0YW5jZXMgb2Ygc3RydWN0IHRpbWVrZWVwZXIg
ZG8gd2UgaGF2ZSBpbiB0aGUgDQpzeXN0ZW0gPyBXaXRoIGEgcXVpY2sgbG9vayBJIHNlZSBvbmx5
IHR3byBpbnN0YW5jZXM6IHRrY29yZS50aW1la2VlcGVyIA0KYW5kIHNoYWRvd190aW1la2VlcGVy
LiBJZiBJJ20gY29ycmVjdCwgd291bGRuJ3QgaXQganVzdCBiZSBzaW1wbGVyIHRvIA0KaGF2ZSB0
aGUgdGhyZWUgZGVidWcgc3RydWN0IG1lbWJlcnMgZGVmaW5lZCBhdCBhbGwgdGltZSA/DQoNCkNo
cmlzdG9waGUNCg==
