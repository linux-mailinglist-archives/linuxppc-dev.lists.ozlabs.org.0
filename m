Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D619041E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 18:54:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Ugb5OlsB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzFCF0LXZz3cmr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 02:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=Ugb5OlsB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2611::616; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2611::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzFBW46BVz3c1w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 02:54:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsNilwalKbb9zljt+TyDNIX6yqFOgio0Omm803vWUUN4/KOL5q7ISVRPaIpbuSqfAJIAGC3tywzU6ucQCiRwLkmUUyeyhFLmcDrEL5DzZmVL+gKxT8dvwkCHa3+IYIejnrdidH9LQdIUDWI6wTNhWthnFhmXE0rDC1fGw0pMBXZk+94AzeegIg7fdqkOGN9r85cr2crp4MMT6hQhCQOB9VxZ05ejaohUug0CRske7VlhzBQjr6oeKhe5h8FxuHDQtnwP8z/PuKGRwfiygIymaOEo1PKVhEKHPrdoQoULrJJD5wz9ierVDMyNY2GDzxBLGK+1h4yH9KPhW2XCb9taHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL5IQ7naEld1R/0sbFBS23zorPtokDuGYABmXBT5UoU=;
 b=NVEr8H3WiJG1oc1CTah2rn+yrs7ACk/yRdqCrQcFYu1051XvWClacYesHs6iAiiVIGGei7p08cGmLwxCMPfQUtbr2TZNTH+iqWwnCfdC2BPUp8eS+k59g3Dc8OIHhltBVK6+Apndxlk96KY7VqMVW+aATRhccgKeeOKA0l8NbEUlJq7KILa2Z0WYoJMYgfw8BKr9DOvUKVgINS+NZ4MDvOP7ImeCuMYpmCE/Egn3sy18Hgp+3l4Nuy+sTeYSsEJu7eb8eQVcjvwseOZnozHJf9smT6bdkblT5jmUYYnlBV8TT31K9c4x2qwhaftRu5DqBhbJZmyqwk0HwnDnOvc7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL5IQ7naEld1R/0sbFBS23zorPtokDuGYABmXBT5UoU=;
 b=Ugb5OlsBG9HBcm6jQHnNfKJ/m9JvsV6XT2exfaZVeKtvQdvjgyPxWAKGArvmu70bqa+lc7+J8RlNDumMpPnAkX2gRUHefkkCZuVOHnc4fgSgg50Uz246pODJeaWhYJIhWFNd+pBdQQzZBHikJ8RSZpRAiiGOQW5LYE+sas/j4A+xwIvk59QWr893GHfFhprGjBwcue6JUeNnjFF/dd4MGURJmdMf/Ld6qD/kk6h5IE4J8B7iRGtPokTZiKCeXB6DZvKAPM2jFMxuTMbPNFa9FKNYhyq4L69dWSJq5AZWVHc9gdsRX2tanD270QQs5m/KYwoOwO2s66Jmp0V5DcrC+w==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PR3PR07MB7049.eurprd07.prod.outlook.com (2603:10a6:102:7c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 16:53:43 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7633.033; Tue, 11 Jun 2024
 16:53:42 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Topic: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Index: AQHau+KLGQQ/eNTTsES+mAG/hC7cQrHCnGsAgAAOUYCAAB1TAA==
Date: Tue, 11 Jun 2024 16:53:42 +0000
Message-ID: <d5e6d897-44f0-413c-bc24-4709896cef55@cs-soprasteria.com>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain> <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain>
In-Reply-To: <ZmhofWIiMC3I0aMF@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PR3PR07MB7049:EE_
x-ms-office365-filtering-correlation-id: 7260a118-3a4b-48dc-94d7-08dc8a370d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:  =?utf-8?B?NXhKbTJaRXVOQm96WEZGUDBJb1M2NUNreDBWR0J4WXdwT2lWYmNFeWdmOUhO?=
 =?utf-8?B?NnF1aVZBV3h0SmtFeGFRZHJFTXBzTWpHbmZ5bXNwY3NUN2h1QnIrbm9RaS9B?=
 =?utf-8?B?VXBHTkdIUlVOSHBraWtFTkcxNjVUb2xXdG5BS1RMU3N5YjhvaUJ1TG5RS1A5?=
 =?utf-8?B?bk0wTWpXRnB3SGFQSmlYcnZnM0tteStUMTJPT3lReTJ3SmI3WUhlT0RFRTN3?=
 =?utf-8?B?SElRRkliaHBxL3VzTklFMmpxUUd3dTg1S2swaHN3QTJndTA1cW1jSkZvQjk1?=
 =?utf-8?B?NG1TM3NlVHJPeCt5OTQrcDhwMVlvYjk0aUgrenpxL2pQVEJtSnVSVWRmelFN?=
 =?utf-8?B?S1VlUlM5SDFDaFZFbCtUZmhiOURQV09kaGZPb0xFNEpBbXlsNFBpbXFsNVBm?=
 =?utf-8?B?djZZcXpNQWFtdUZqaG9HU3ZyYSt0MlBlbTRVYnJsU0d6V2ZwWGw5RXlMNjlD?=
 =?utf-8?B?ZHlHdkF6ekp5cTlabllzcVJ1NlpneU1KdFdUNmc4Ylh6Y3ZldyszWTVWUEIr?=
 =?utf-8?B?eGZHMkx6Q3JCcFRJR0hzbkdCbjRxY3BnZ2NDS1ZzOEhjMjIwQU5CZXh5QTFJ?=
 =?utf-8?B?RWN6VG1lWHRmWjZBcTNiR0duVEhlWHhMQ3pZRFIreEY4RWQ3YkptRVN5TDFQ?=
 =?utf-8?B?UGFqUSszb2xGN0ZyTmFHS0xmR0ZNbXRpL1ZOUDYvUGNmM0k1RExTZEVFN1FV?=
 =?utf-8?B?VmZ3UGdvUGdzY3ZpNGFwSjgzdWJRVlAreS9SQjVCWVRqTlc4dmwvbktMemtB?=
 =?utf-8?B?cEVEUGdtSlNDZFFlSHRhRk1pdWRTUE9KRmVvYlBuRVNjNDRWenZiTHE3Q2pi?=
 =?utf-8?B?b0I1K3Fsd3FGanRZMEYyVHZlL0xNOXJtbFNuOUN0Sm5GdzEwU2NxMTlHV3Yz?=
 =?utf-8?B?YWpyTWE3WThCSFNhOEFTV1J6Y1ZjaUt6SUkwM3Q0RXBHUE1PdFdPS2loamFo?=
 =?utf-8?B?WDJmZUk2VUxWK1JWSFV5emV5bHpaYS80QUZhemFKUW5uQTJIMGZVdVNySXhG?=
 =?utf-8?B?Y1E4OUN3cGVFVngrcGtwVThWdEE4QTRyTVFJeDZiRTVVd3UzQi9SenZJbzVz?=
 =?utf-8?B?Y2J4emUyRm95Q084VHhRSG1rSHdFaTJUNXRKalprcDVXSkZ1ejdNaWxxT0Vu?=
 =?utf-8?B?MUFZakZXZTRsTWczN24vWThqWEhONllucEMxdzNydnJmaVJDWVR6T3ZsaHZP?=
 =?utf-8?B?SVRKQTZkWDZXcFJzY0NSd3BJWForU2xwRVpLRVE4TDg4NmJLTC9aYU9JM1RL?=
 =?utf-8?B?MXNtUmE1dzI0SUc1ZUZqRjFyM3Vtc1FPRGtlTEtHNXBuV1lqU0tNRlREYWxL?=
 =?utf-8?B?Y3B1ZTk1WDBxWi9wU0Q1dXBELzBSSkI3aHZ6WG9iTjNuUFhjby8zbW82L0o1?=
 =?utf-8?B?a2VGNHJrUWdHWXZoR0dUS203bmRjaGpoZzBzMFdGU3phNGdKc1RnMFB2RmxK?=
 =?utf-8?B?Qzd4L2NHUURoRGZZQ3pjTDZjT2czQ01nOGxXSStlQUtLUFVsajZocExWamFS?=
 =?utf-8?B?bEUyZzBRM2JsWHErc3p5S1FyelgyeWlyRXFXRDlvR09BcHhrb3Q0WnVUNU9Z?=
 =?utf-8?B?ZGtwNUlSNXQyT0dxNjBmbGV0K1krRjVmRmRXbHUvSXJEVUE2VVVqUldKTngy?=
 =?utf-8?B?R1c5aVNSdGZXVlJhNnFwOTR4dFZ0WFIvRVU5RFNDTWNlV25ScnZNZXNNU0Qv?=
 =?utf-8?B?NlFlV1BXbjFXVGRSd3NXQlo0ZVh5bWlzcFp6NG9KWUFyWVNBV2xqb3Job21V?=
 =?utf-8?B?QlEydGVYOUlKOWl0bHF4aFRWL3ZKWHJiUnBpUGtKSHc1Y2h5Mlk3bmJBSllZ?=
 =?utf-8?Q?4wreJpGlY4NsjRvp9hjbVt0fNBwJ+EZ4qBFFY=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dFFSdmlYRUhiZmtIUEQ3T3hUTDkrRnFFQkNGMEI2Y2ZUNzJSV2RWdHpoc3BK?=
 =?utf-8?B?TUJnMkwwVFVEdTRIc0RabExRNUtENk80NTNOUk5wZE5YY0Z0blR6SHcwR2VE?=
 =?utf-8?B?OHRWSXduWTBvcDJGdGRhdEpFcXd3SWNFZ1I2Wk1QbXpKTkd3anhnb3JSZjRZ?=
 =?utf-8?B?REtTWFluY2d0TDhhMGNoYVlNaFQwV0VSdlR1bkdHOTVmMGV5Q295U2pnNkZj?=
 =?utf-8?B?SGVpV2lKTEl4OHlWYnFUdmUwMTNHQXExV012dUtiRlZOYnNuem1ZZ2wxSmZ0?=
 =?utf-8?B?K2tseUYwaXcrNWlSVEhjQVZMZ25mWVpadkQ3NVc2MnNETWJsTHZQVmNDSTNp?=
 =?utf-8?B?MHZWOXRtYk5pOEhYQVJrdW1BRjloTkdHd2pVb1lSWW93LzNBdXhNNVRyREta?=
 =?utf-8?B?MWNwaFlFN1IzL09UMlIwZEFpSDdwbEVmbEhSYkxtR1lQT2FVK2ZqVkxBV1ZW?=
 =?utf-8?B?QmN4d3BNWWNueHBsT0ZiQ0xBZGMvYk94ODVMejRwZGtPbFd6ME5ZV3NFSkdq?=
 =?utf-8?B?VXpOMlQ2OU9nQzh1NU1udFpzSzBxNXRKcUhBbzVENjdIKzE1VWV0VGNDZXlx?=
 =?utf-8?B?VXlhU3JORkNycmZhaHM0QVFWUm9BL1hyYWNiSDdadHFDcEwxcjZFcG5PT1BR?=
 =?utf-8?B?OEowY3BXRlNMb0xMbEdVbk5oZkI4emxQQWxsdTN0QnFxZ1E1SlRYMWVpYjJQ?=
 =?utf-8?B?MDlwUyswdU1WNncrZFViWlhkUEIxTUp6Tk1XYlRXQ2pXQ0V3Zm0zeGJFUkFw?=
 =?utf-8?B?YWc0M0F2WVV6cHUwZFhETk5PMWh5NTV0c0pCSmNvS1E1aCtXVnQ0MzVHdkpn?=
 =?utf-8?B?YkJ6M0V5cTN5UHFaNUR2SkM5amhYc1FQU0RYY0oxaWNIQUxUalVEeEtRQjR3?=
 =?utf-8?B?T3FlS25yQ3doUEJxdEg2eTNWbzVmTDNESnh6dkExTXFXVVd2aEtUZGdzeVJV?=
 =?utf-8?B?QTROM1VwQ1NCQTZteDBSWjVhRm9ZcVRQS2Z0NWV3R2trYUR2R2dKOC9KYnBM?=
 =?utf-8?B?TU02NWMzczBTbDdySlZKRGJHcy9OM0s5OElvWUdnL1c1b214NENNSEV2SVlP?=
 =?utf-8?B?M3ovNmhUOVpmTDFOcGREKzZDU25VQytPRURpVFNyZDNlL08rSlF4TFJPb1B2?=
 =?utf-8?B?TFdaN0hxMVUyY1oxNTFxaXVsb1FQWUNNRitoV2xLQ040cG0zWWFHKytSekh2?=
 =?utf-8?B?V0R0SFM1UTlCYzd0blJEQXhRVmVRVVFsd0pReklQR2M5QTFjakplVGIrQmFx?=
 =?utf-8?B?RmE2alNLeWdvNmpSRXE4dC9jVi9SR3pTOEcyclZEc2RxUWVkMDNNMzlydXBx?=
 =?utf-8?B?QmoxMGJSWGozbnpXTXMrZXVyaTREL3RSQjVpZXVUY1BiSmxEenV3blRNTnBL?=
 =?utf-8?B?Z1JFM2hTek53S3VoNGNzU3hpWllsNi9BeEwvZmdJVFBaeFJUcU1rRlNhd2hV?=
 =?utf-8?B?REh1Z0dQK1J5b1A2cEpqRHhzRVlvTEZCbkJEWlR6dDZ4TG90M3FrMVIveVYy?=
 =?utf-8?B?V3drbEV4T3libVJhRWF1SGZHRGNRR0pBelBsUmdzaDhVQU9DdHZmL28wdmFJ?=
 =?utf-8?B?aTBobWVtY3pMdlA2M1VVYVZEeDNTcDBSUFd5bG9saGh0aWFnOEVGVVZ6NHpR?=
 =?utf-8?B?VjZGZW9lYmxuTkZUM3J2KzV1bjNTNkJGSmJ3NGV3cStPTlNpL001N2xDTlZE?=
 =?utf-8?B?cWVCTXJXQVk4aXFpckRLcm54dGhPTFV4VWFzaDZmTG4velB0azVZNTQ4TlBl?=
 =?utf-8?B?WTZ2dERSaE9qME00azJaSjJBcGc4cTVwWXRxOWhJdTQvQ3VGWDNEQXd5NXp6?=
 =?utf-8?B?dEQ5QlBEZ3I0L2VLbmZNQUZnb05DSDg1Mzc2ejNiN3VjTFNvWVBJUzV4Y1dM?=
 =?utf-8?B?S3dPVTZRZ1k2dVQyVFZ2cUNDa0pLRTVyR3g3dmZ5ajNueFlBRXZ3RHVBcXNZ?=
 =?utf-8?B?YllncjVTS1gyamFYTW5Caklyd3dUR0kxVVhCTzhFN2JkMktYOENXU1ZabEk0?=
 =?utf-8?B?UzVoMTZhYUV3eUtuMlFzMmpvNlYwcy83Q3hZcTVCSUlQbVNhRTRlSG5ZNEJF?=
 =?utf-8?B?RW1ic1JrSVoweDA1Y1Z4MWJVTTF5SFlrQlgvNm1tNUZTK1N0Q2dEcDc2UDB6?=
 =?utf-8?B?UlZENmwwOGdka1JGUWNlVmdxTEg4eTF6WWNpc0pPTDJpSlkrNVl5TE1yeC9W?=
 =?utf-8?B?TUFSL1NaTHNoZ1dEVUJTaEpFT0I0S2ZIL1o1U1VVTzloU0ZZQUhrVk04enVn?=
 =?utf-8?Q?Nde24nRa73TB0Sc+gjexlnJq3dYG19D4ttdJ31RMLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23D1213CFC20F64FBC9795284583C6F5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7260a118-3a4b-48dc-94d7-08dc8a370d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 16:53:42.5906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1Z7HArYwZPP04r8X16IE+QIdiSYs796ld/ZQtmGibVWzIMtK+dOE9qdqmrXsIgmhB+VCYUPFMnqXgd9zgI09AQlvv/dGHUqUMJQp+JDi1UgOlnELxyEFMlYILRezM7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB7049
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3PR07MB7049.eurprd07.prod.outlook.com
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA2LzIwMjQgw6AgMTc6MDgsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG9zYWx2YWRvckBz
dXNlLmRlLiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50ID8gaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFR1ZSwgSnVu
IDExLCAyMDI0IGF0IDEwOjE3OjMwQU0gLTA0MDAsIFBldGVyIFh1IHdyb3RlOg0KPj4gT3NjYXIs
DQo+Pg0KPj4gT24gVHVlLCBKdW4gMTEsIDIwMjQgYXQgMTE6MzQ6MjNBTSArMDIwMCwgT3NjYXIg
U2FsdmFkb3Igd3JvdGU6DQo+Pj4gV2hpY2ggbWVhbnMgdGhhdCB0aGV5IHdvdWxkIGJlIGNhdWdo
dCBpbiB0aGUgZm9sbG93aW5nIGNvZGU6DQo+Pj4NCj4+PiAgICAgICAgICBwdGwgPSBwbWRfaHVn
ZV9sb2NrKHBtZCwgdm1hKTsNCj4+PiAgICAgICAgICBpZiAocHRsKSB7DQo+Pj4gICAgICAgICAg
ICAgIC0gOE1CIGh1Z2VwYWdlcyB3aWxsIGJlIGhhbmRsZWQgaGVyZQ0KPj4+ICAgICAgICAgICAg
ICAgICAgc21hcHNfcG1kX2VudHJ5KHBtZCwgYWRkciwgd2Fsayk7DQo+Pj4gICAgICAgICAgICAg
ICAgICBzcGluX3VubG9jayhwdGwpOw0KPj4+ICAgICAgICAgIH0NCj4+PiAgICAgIC8qIHB0ZSBz
dHVmZiAqLw0KPj4+ICAgICAgLi4uDQo+Pg0KPj4gSnVzdCBvbmUgcXVpY2sgY29tbWVudDogSSB0
aGluayB0aGVyZSdzIG9uZSBjaGFsbGVuZ2UgdGhvdWdoIGFzIHRoaXMgaXMNCj4+IGFsc28gbm90
IGEgZ2VuZXJpYyAicG1kIGxlYWYiLCBidXQgYSBwZ3RhYmxlIHBhZ2UgdW5kZXJuZWF0aC4gIEkg
dGhpbmsgaXQNCj4+IG1lYW5zIHNtYXBzX3BtZF9lbnRyeSgpIHdvbid0IHRyaXZpYWxseSB3b3Jr
IGhlcmUsIGUuZy4sIGl0IHdpbGwgc3RhcnQgdG8NCj4+IGRvIHRoaXM6DQo+Pg0KPj4gICAgICAg
IGlmIChwbWRfcHJlc2VudCgqcG1kKSkgew0KPj4gICAgICAgICAgICAgICAgcGFnZSA9IHZtX25v
cm1hbF9wYWdlX3BtZCh2bWEsIGFkZHIsICpwbWQpOw0KPj4NCj4+IEhlcmUgdm1fbm9ybWFsX3Bh
Z2VfcG1kKCkgd2lsbCBvbmx5IHdvcmsgaWYgcG1kX2xlYWYoKSBzYXRpc2ZpZXMgaXRzDQo+PiBk
ZWZpbml0aW9uIGFzOg0KPj4NCj4+ICAgKiAtIEl0IHNob3VsZCBjb250YWluIGEgaHVnZSBQRk4s
IHdoaWNoIHBvaW50cyB0byBhIGh1Z2UgcGFnZSBsYXJnZXIgdGhhbg0KPj4gICAqICAgUEFHRV9T
SVpFIG9mIHRoZSBwbGF0Zm9ybS4gIFRoZSBQRk4gZm9ybWF0IGlzbid0IGltcG9ydGFudCBoZXJl
Lg0KPj4NCj4+IEJ1dCBub3cgaXQncyBhIHBndGFibGUgcGFnZSwgY29udGFpbmluZyBjb250LXB0
ZXMuICBTaW1pbGFybHksIEkgdGhpbmsgbW9zdA0KPj4gcG1kXyooKSBoZWxwZXJzIHdpbGwgc3Rv
cCB3b3JraW5nIHRoZXJlIGlmIHdlIHJlcG9ydCBpdCBhcyBhIGxlYWYuDQo+IA0KPiBIZWgsIEkg
dGhpbmsgSSBtYW5hZ2VkIHRvIGNvbmZ1c2UgbXlzZWxmLg0KPiBJIGRvIG5vdCB3aHkgYnV0IEkg
dGhvdWdodCB0aGF0DQo+IA0KPiAgIHN0YXRpYyBpbmxpbmUgcHRlX3QgaHVnZV9wdGVwX2dldChz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCkNCj4g
ICB7DQo+ICAgICAgICAgIGlmIChwdGVwX2lzXzhtX3BtZHAobW0sIGFkZHIsIHB0ZXApKQ0KPiAg
ICAgICAgICAgICAgIHB0ZXAgPSBwdGVfb2Zmc2V0X2tlcm5lbCgocG1kX3QgKilwdGVwLCAwKTsN
Cj4gICAgICAgICAgcmV0dXJuIHB0ZXBfZ2V0KHB0ZXApOw0KPiAgIH0NCj4gDQo+IHdvdWxkIHJl
dHVybiB0aGUgYWRkcmVzcyBvZiB0aGUgcG1kIGZvciA4TUIgaHVnZXBhZ2VzLCBidXQgaXQgd2ls
bA0KPiByZXR1cm4gdGhlIGFkZHJlc3Mgb2YgdGhlIGZpcnN0IHB0ZT8NCj4gDQo+IFRoZW4geWVh
aCwgdGhpcyB3aWxsIG5vdCB3b3JrIGFzIEkgdGhvdWdodC4NCj4gDQo+IFRoZSBwcm9ibGVtIGlz
IHRoYXQgd2UgZG8gbm90IGhhdmUgc3BhcmUgYml0cyBmb3IgOHh4IHRvIG1hcmsgdGhlc2UgcHRl
cw0KPiBhcyBjb250LXB0ZXMgb3IgbWFyayB0aGVtIHB0ZSBhcyA4TUIsIHNvIEkgZG8gbm90IHNl
ZSBhIGNsZWFyIHBhdGggb24gaG93DQo+IHdlIGNvdWxkIHJlbW92ZSBodWdlX3B0ZXBfZ2V0IGZv
ciA4eHguDQo+IA0KPiBJIGFtIHJlYWxseSBjdXJpb3VzIHRob3VnaCBob3cgd2UgaGFuZGxlIHRo
YXQgZm9yIFRIUD8gT3IgVEhQIG9uIDh4eA0KPiBkb2VzIG5vdCBzdXBwb3J0IHRoYXQgc2l6ZT8N
Cg0KOHh4IGRvZXNuJ3Qgc3VwcG9ydCBUSFAsIGFzIGZhciBhcyBJIGtub3cgVEhQIGlzIG9ubHkg
c3VwcG9ydGVkIG9uIA0Kc2luZ2xlIGxlYWYgUE1EL1BVRCwgbm90IG9uIGNvbnQtUFVEL1BNRCBh
bGx0aG91Z2ggdGhlcmUgaXMgc29tZSB3b3JrIGluIA0KcHJvZ3Jlc3Mgb24gYXJtNjQgdG8gYWRk
IHRoYXQuDQoNCkJ1dCBob25lc3RseSBJJ20gbm90IHRvbyBtdWNoIGludGVyZXN0ZWQgaW4gOE0g
dHJhbnNwYXJlbnQgcGFnZXMsIHdoYXQgDQpJJ2QgbGlrZSB0byBoYXZlIGZpcnN0IGlzIDUxMmsg
dHJhbnNwYXJlbnQgcGFnZXMuDQoNCkNocmlzdG9waGUNCg==
