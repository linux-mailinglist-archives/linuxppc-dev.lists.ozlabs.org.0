Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED7A8CE58B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 14:56:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JA0fvzlG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm4bR1zRFz884W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 22:48:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JA0fvzlG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm4Zj6zyWz87J2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 22:47:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwZ7ucETtv990B8/RFER/yVLBRn34bWu6lHpHRy6GQ5tnUep6MTsyHCFaZrWY1+ruCP5koQpUUulyaVHNhcSubQiWY+JZI10LdcA7YbM2lKYJqPsLzOwPatg3zQtI5mZpMPKQaXzawB2L2QN/PnCanDmY1+dd2XvAv5YkNz1dEGxtNcbyTDxiTnyQJM5rZFCJNOALP6U2dq1d7flVx/bVG+q1u2jnSYuODQV7x20+QPAJd4MSuFX6YQSSsOgryq4jNHlhU8N1vBRE/534LHu6/SpmuEjAReKfhKQjG9fzunC2N1HnJjNAW7H2kmITEEYRxfASGE1MHI0mDvIej+npQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eigG7h1CVB0/1M2OpkTontnGeDcWDQ30yZnqaADilKI=;
 b=Pky2XML2jz/UZZScUn9wOvYUuZb9uHXhzDc9CkaDG+SJJK/sPOGIHVuMpHmMNl3UX3ORUNdAUsJmlzsCBNZ5c3Dr09Yl0hj94NgINTejw/299zP1e75xF+jJ21ttZBWfkZ0/ykiT+lbUEhbULIHI1r6aUX8z07AjcwtUlowV56KHyveFINLsaxMbGkbDSIXOhfkxURQcxgjl0r0o2OwgkjHfuWAm+Tk4WGdjJYhk+PKRu++u9dzyB0TErv1WJwvu+FeTd0RpukOxPGKfWlUTVf45KiW15mJeJMsLQibVyw2ttgCqdlsGj/M/lVg82v4EoFlLhfRb7+SA9U8YkpfvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eigG7h1CVB0/1M2OpkTontnGeDcWDQ30yZnqaADilKI=;
 b=JA0fvzlG8l2j9xmkmaL7E+j51PwE8OXKJdYIk3SWbrdj33SwxH05X17sThT45jx8wOhfP20vvJmpPQJPk2BKsUZ3BBu+oT4TH0NehL1ngDvzJKT4yUT8rSSqy354h9NBymk2KHBaahVcLV+3OOiOT6JT5VTfZUbm4fzjfsJV6mwSaLXGgnv69fic/fCl7ROXP0WXvCTTap17aMKd7gGqlLKaG8DVtiiwr+43NtP0p0xntxkk8C9/BgzJ6sPFVxtg/qMX8S6VaqSV/gcSPrjd9Kig+fQuKD4JixeQjcSfMhU09lW1qazOGrIHSyQtYNwux6MlWCiwttE6wsZlw+xLTQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 12:47:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 12:47:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 8/9] tools/perf: Add support to find global register
 variables using find_data_type_global_reg
Thread-Topic: [PATCH V2 8/9] tools/perf: Add support to find global register
 variables using find_data_type_global_reg
Thread-Index: AQHan6+0Y0VouNVKREyFpHtxv5S0fbGLjB4AgBrdEwCAAAiCgA==
Date: Fri, 24 May 2024 12:47:31 +0000
Message-ID: <bf4f0324-727e-46c2-b9a4-ebe02ce40fe4@csgroup.eu>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-9-atrajeev@linux.vnet.ibm.com>
 <05213684-d45b-4a6c-82ef-6ec7fd2653b2@csgroup.eu>
 <2ACEF7F9-E80E-48A2-BEFA-8C6292A4EB1F@linux.vnet.ibm.com>
In-Reply-To: <2ACEF7F9-E80E-48A2-BEFA-8C6292A4EB1F@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2106:EE_
x-ms-office365-filtering-correlation-id: 6375f156-6a20-474b-fde5-08dc7befad9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|1800799015|366007|376005|7416005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?NmEzWHExanhqSXRNeFNQcTZSd0xEK3BwUEkvaGpRS0dkVHNKcGRhaFYwS1lz?=
 =?utf-8?B?SXBURDVmU296dGtWR3IybmYvWkI2Z1JmaUllNFdSWHJDaVZwVk53emUrem4y?=
 =?utf-8?B?dm9lVHh6QTVoVW5JMkltVm82Ym4wMDF4SU5BQ3pmRnA4NTlTU1R3bll5d21J?=
 =?utf-8?B?azAwL3VxL2FKNGR6OGNaUGdSc0NRSTloWWtUVWozdnphb1pzNnhhWkxLZ1ps?=
 =?utf-8?B?OTF0Z1JVWEFUSjJkazMwYzNtQ05KTXZ3U0hmY1NORC9MY2puQzNZbk9ZRWRt?=
 =?utf-8?B?QlhKMmRxMzB5WS95VC84ZEpNZkIveUxUTFRDbXUwc0xURWtuSUxDRkpGM2c3?=
 =?utf-8?B?OXJBMzFNZDlJcEQrdFM2UTF0TmVNbmpzdkhhT2dsT2MzWTZ2SCtpNnV6RWlD?=
 =?utf-8?B?WkNtYkhXYWhFTHZsbDJSVjBSeHdvMVVuZ2tySnE0MmptTkJwMWNBMEx4cDlp?=
 =?utf-8?B?VE52cmk4SC84c2pQVEtRQlpDcWRBdWJhOTRlV1Y4ek15MGRMNTdWWWRqR0lG?=
 =?utf-8?B?My9aajBLK25KbitJbDh0c0dYb1FMeUxvaVY4NkgwK2tvZjI4Y1JWdlB6dDZm?=
 =?utf-8?B?SEdqeTlRUUMwejZRWFFWeXNRbm5ISGYzeDJOaVZqbUsyaEdRMWkwZ3kwaWdy?=
 =?utf-8?B?TUFyNmhlQ3NieGk3SnFRcG9vRXZSc2Uxa3hjNXZGNG4xTW1OVkZVajRpWnNP?=
 =?utf-8?B?VitUSU92VUN0T3hLd3h4THRBUVB1Q0dYVmJSR2t4Unl1UTdBZExMeUEyZWNY?=
 =?utf-8?B?ZGJ2bzBaUTltZTlQaERmRmJydWZKOXUrUlZzcmVEamg0b0xDa1hERENBak9Y?=
 =?utf-8?B?cGVoK0dzVmN0R2ZaOEdmdWNwWXFYM2hyQmp1NkNoYm40Y1FudlhLTk9pcXFo?=
 =?utf-8?B?U1lhVEFlQVRNa2dna3haa1VVQml0cFpma20rWU9vaHRQSlA3K3Yrajc3R0k5?=
 =?utf-8?B?M3NRRzZOQ2RTNmtPN29yUkJ4YkRIOFBPK0pVTHVPMG1ZQWd2TEliZTFnWTgr?=
 =?utf-8?B?VW1tdEZadDd1enhOU1pyQzJjTEQ4a3MzM3l3eDZKQUlQUFJKYzJzcDlyYk1h?=
 =?utf-8?B?MGxIWDNWcWc4WDdlcHZDa0M2MzFQMVBqNUR1cDg3a3JxWmF2WGxaRWlIa0Z6?=
 =?utf-8?B?ZWZkc0xPYmk2eEQ2dmdoS2kveFk5TjlWVGpMN1BIY29tamNncGpxR0g0NHAx?=
 =?utf-8?B?OGZFRVpPSllZRDJlRngrNVU2TzFRRnIrQk1jVURsVWNReCtOMW1zdkZBUFYz?=
 =?utf-8?B?M2YrV3Y1UmdWdWh4empjN3Z0TDNBcFFwYkFMZ09tbUNEOUVIZ09vM0V1Mnhy?=
 =?utf-8?B?YkRhSUsweVprUlcxWk1TN09xNFVXd1crNHgvdHJFNjJuK2RHWU1MMFBIYi9M?=
 =?utf-8?B?TmFteTcvRk4yWmVrUXYrL3lFbmJ2ZmpUVDFjaFNDNGRRNmE1ajBONjhvVml2?=
 =?utf-8?B?MWk3Q05Fak9DK25WTDRCalV0ZFVINllvbXk0aW16dk4yQUsxczh2N08xS2ZN?=
 =?utf-8?B?RzBRSWorQkZKcDZNOVVudFBuN3RtQXpocWZqRU5GdHFNVjUzajZMdGdsaFZU?=
 =?utf-8?B?MWxDeGhRa0Z3eDN3NzVkK21GaEZtWmFPZ1pZblJKVXMvMCt2ME0zWWM0Mmlu?=
 =?utf-8?B?VTAvZkl3THpHOHh1RVY1SVh6UFNSc3ptbXFZdFhyUWV3V1pBWlVxUDYyMmFK?=
 =?utf-8?B?RWNJcEljMVJkRUJYMFhablNEOWRBaDArSnRHQVRwNi9GUXRGcjRlWmxCQ0lr?=
 =?utf-8?B?di9WSWplSXNRWnAzRGR4REYzZkZzT094eGtnQ3J6WUIvQzlzdERBbU93Q2hR?=
 =?utf-8?B?c1VJY1lmOWxJaGhIRmF5Zz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0dhSzNtOEQ3MDh2Vk1BZ1VndXMwRUhBUFBzSW0rMmtCclFZQjFLUG9DcnpV?=
 =?utf-8?B?VGpPUW9aNGFJYkk2dlIzdkpVMlRaQVBzdGRGVlJKbFpQVjR0SFBmeXlJNVkx?=
 =?utf-8?B?eGpqaVQvcDVRUDE2QjJBT3pDVk41Wm93Z1g3OEp4TWFiblJ6eVlmc1dKbm5s?=
 =?utf-8?B?dTlaaVp1YldwejRJekdzMWFiZ0lhM3RyQ1BtWDNCMmRWWXNmQzFNc3FCNlB2?=
 =?utf-8?B?TGhwVlcvRnhoU1RMZkg3TUxYTmorTzFxSW1ROGFRUnhBWTk5VTNiMHY5M1k0?=
 =?utf-8?B?ZVNyNDlmc2NNNnMvd2JRY3UrZFJOaFBnQkwzN3lieERTV1VqQ1FSaU5TTTRK?=
 =?utf-8?B?cHFobkp6ZkJUREZ2MXFsYWFhaXphOGNIQ0lKYXdQRElOSStYTTh1bE8zd3U4?=
 =?utf-8?B?WnZqOE1Kbkx3K0RZeUthWFlQWUJzby8ySVBDSlgzaWJpb3lQb3d0RWtuNTht?=
 =?utf-8?B?ZnhTc2NSV1ZZWDhoUHA2TXBFdzl6bDY1UjQrNmpsS1dvNEN3aDdia0RUazY1?=
 =?utf-8?B?TTRCVGY0NGVCV1lJWVI1WHpmTDBrNXpLQU5zV3F1STliUFVtSURGWTlGeTlw?=
 =?utf-8?B?Sk9Zc3FBWE1wYVFIZjN5aHNOR3h0a0k1MlJaUHE2RHZsRFFsay9yYmQ0VDJP?=
 =?utf-8?B?ZVdJOWhtZ0QvWVI5UTdsTUhyVEc3UTgrUVUvclJJN2VNdXBWbFZOdzkwL05t?=
 =?utf-8?B?SFN2T3FFQWpXSDJQbGROVHM5ZjVwL0ZZYzcrUVJ6M3NTM3I4NG5tM2dWNENM?=
 =?utf-8?B?dmxCRW5EODZwelJsaW5vU1AxR2hsQ2o3UlJDZ2RsSDVzRkMwWHk0RC9NbDFW?=
 =?utf-8?B?U2ZrcEVQNFpQOENHUTNCVXBiWXJXQlVxZ2FvOEZXR0tBVjBKaFRDYUxPeW5Q?=
 =?utf-8?B?TldYZ2xWV0JQT1FFMEsxcjJZYnBqeVFNRXg1bUxvSzZqcGJSQm1xOStESlpp?=
 =?utf-8?B?VUMrZUJwanBuU29MSCtvdzlZckNzN1lNL3pBS1pyYXVnYjVlbUVjOU9xRG5Y?=
 =?utf-8?B?R05rUUl0bndRVHFKaDJUczN0dTNtaGN6WHZyNE1CVmoyYTdVOE9NR21qY3pP?=
 =?utf-8?B?TVc2dk9nd0EvcVlqdUFQM3A0VEZoOGd5UDN5TUxpUnpVNkllazhQOGRBQ0JZ?=
 =?utf-8?B?cStXdVBDYTdjRi9BZmJveEdtY2hLSXRoOWE4VE1qQ2hQOENrNHdZZ2Z5L1Mw?=
 =?utf-8?B?a202UU5EZGovSUtMRkdmNHdJc2JKYyt6OE96V01BSnVCUGhHODEyWk42RHNw?=
 =?utf-8?B?bWI2TnJWcXJPakFzQzBvbk4rNnY2R1pEN1BGTDBYd1ZGVUhJRXRNd1dzdjA3?=
 =?utf-8?B?akNIdU5YdTE5dzA1eFljU2NBeFphUDZobGkwenFEUnppRmUvQXBGWDNSYTVq?=
 =?utf-8?B?WlJwVStxSzF0NGE3NnlIbjJlaFlPMC92bm9JT0Y1YytMUWRKKzlhVXVwYkNP?=
 =?utf-8?B?aFNURURUZGErWXdWQlFEWnNIWjZ2c29XQVNwQXRVWm5FMmN6Mk5wNjJsVkdS?=
 =?utf-8?B?T2txT2tsaEgwZ3YySkZMQVJWMmZaOTZqUjVSU1VqOXhRMUJvdXhWblRWdXAv?=
 =?utf-8?B?S1NqZ0pLYzRucXVZTnd3NUsxNll5bEQyUmZ0a3hpbi92cEtLdGhDQXhtVnUr?=
 =?utf-8?B?L2cvNk9qcGNYeE9ETVJWM0NVZ082amh6WkZZQXltd1VaYUIwTXdTbE1tMmE1?=
 =?utf-8?B?RlVPMFI2RThPSXE2a29nWm9wNzRGRkw0aE9KVXRoU1RxSGhzRGF4ZG5BcmNF?=
 =?utf-8?B?NE9LOUtodHhHa0JGNHFHcm95cjJGS3ljeDQ5cDhWaDJkT24vWjhFZitjYzBG?=
 =?utf-8?B?QXRrU1Z4aG9vcFZGZ1hmaHZHTjU4YTArMGpUTk5VOHdObW1hZmdTQ1B1MThJ?=
 =?utf-8?B?UzY1Q0ovaEV1UHN5TmhsR0lyekRJZzh2MGg3Q0Q4UzZ1Q0EwNmtPcHVvOWVt?=
 =?utf-8?B?bzc0SFpmcis3bkV6bWNodldGRXNycUo4NmFwcnMzMVNTLzYvQzA5V2ZWUkJX?=
 =?utf-8?B?eDFKeDZaallXMi92cEFRRXZZQWc3YkFXWkpUY3U1UkhwMEJBNXhIMjByQ0RS?=
 =?utf-8?B?OG53dU8xbXJ6VlUyL0thZmJQVTFyQzQwZDZ0eXVDZWpEL1hTa2NtWWN1OTRI?=
 =?utf-8?B?VWZheWxXd1lRQXppcG5SeFYxRkI0UlFWT091RDI1STFkWjdjb0JtSEVGaG9J?=
 =?utf-8?Q?WEcE+ScokGbaWCaYF7S1qRmGf4fAb165HSHrqXLvazu6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79BF2217BB814A44B85C2381C9E5EF97@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6375f156-6a20-474b-fde5-08dc7befad9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 12:47:31.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C28NRB+q+oDe5F8biafSKGkPQ2ByUWO/zYgvFDDLR+rKOa+u+lzFiw7PuBTy1vKzE7m7UqLUhxoPl2LwS+I0+ZXU6rWkCiDTMyr1lX/nuVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2106
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
Cc: "irogers@google.com" <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "acme@kernel.org" <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA1LzIwMjQgw6AgMTQ6MTcsIEF0aGlyYSBSYWplZXYgYSDDqWNyaXTCoDoNCj4g
DQo+IA0KPj4gT24gNyBNYXkgMjAyNCwgYXQgMzozM+KAr1BNLCBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMDYv
MDUvMjAyNCDDoCAxNDoxOSwgQXRoaXJhIFJhamVldiBhIMOpY3JpdCA6DQo+Pj4gVGhlcmUgYXJl
IGNhc2VzIHdoZXJlIGRlZmluZSBhIGdsb2JhbCByZWdpc3RlciB2YXJpYWJsZSBhbmQgYXNzb2Np
YXRlIGl0DQo+Pj4gd2l0aCBhIHNwZWNpZmllZCByZWdpc3Rlci4gRXhhbXBsZSwgaW4gcG93ZXJw
YywgdHdvIHJlZ2lzdGVycyBhcmUNCj4+PiBkZWZpbmVkIHRvIHJlcHJlc2VudCB2YXJpYWJsZToN
Cj4+PiAxLiByMTM6IHJlcHJlc2VudHMgbG9jYWxfcGFjYQ0KPj4+IHJlZ2lzdGVyIHN0cnVjdCBw
YWNhX3N0cnVjdCAqbG9jYWxfcGFjYSBhc20oInIxMyIpOw0KPj4+DQo+Pj4gMi4gcjE6IHJlcHJl
c2VudHMgc3RhY2tfcG9pbnRlcg0KPj4+IHJlZ2lzdGVyIHZvaWQgKl9fc3RhY2tfcG9pbnRlciBh
c20oInIxIik7DQo+Pg0KPj4gV2hhdCBhYm91dCByMjoNCj4+DQo+PiByZWdpc3RlciBzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKmN1cnJlbnQgYXNtICgicjIiKTsNCj4gDQo+IEhpIENocmlzdG9waGUsDQo+
IA0KPiBSZWZlcnJpbmcgdG8gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2N1cnJlbnQuaCwg4oCc
Y3VycmVudOKAnSBpbiBwb3dlcnBjIDY0IGJpdCBpcyBmcm9tIHBhY2Ffc3RydWN0IHdoaWNoIGlz
IGhhbmRsZWQgd2l0aCByMTMNCj4gUjIgZGVmaW5pdGlvbiB3aGljaCB5b3Ugc2hhcmVkIGFib3Zl
IGlzIGZvciAzMiBiaXQgY2FzZS4NCj4gDQoNCkhpIEF0aGlyYSwNCg0KWWVzIEkga25vdy4NCg0K
WW91ciBwYXRjaGVzIGFyZSBtZWFudCB0byBoYW5kbGUgYm90aCBwb3dlcnBjLzY0IGFuZCBwb3dl
cnBjLzMyLCBhcmVuJ3QgDQp0aGV5ID8NCg0KQ2hyaXN0b3BoZQ0K
