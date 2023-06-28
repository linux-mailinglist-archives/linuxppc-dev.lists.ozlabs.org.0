Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A41ED7418FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 21:41:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=abkzZTCH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrsQP43n7z30gc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 05:41:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=abkzZTCH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrsPS1S9dz2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 05:40:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/E2wGtNJ0/w4vV8F95JyTacEyKE5vwN/2Dh/wdf2cB05S4oCoFN/WGuwfXBEclDhriONefAVVB/jqfsXS1DH249WEqjt98fEJgLq2d19PE1tkA/UAts5TGLqDcPM8E3QTo+PNxKqfIF4njUg24Uyzb4zr7soa9MryCRtGMbXhI0ilavcOLMAb/BVHZZl/oaHjJvZGGgLG6S8iV0BqeRGidJtg1A9FfxMfNfqXL/69/SIsRz3qhEYZJqFtGJhjmy8rHs3QNuI5XgXebJj9hz/eIlCCBd3BQQddcn4UWvSN3cCIe7v4l7rWqSEPcV43WYCjBNi9eIKpRqAa7lbT42xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0klFBG0nQmgFYOsHaSwOsVxis/R7erXyfyhOy8l/tA=;
 b=ZbwW0zsscxIhzs2qel5ngzbn4Ao8IrPv5hH6j8s+jnumSqPjn+4CleJdYJLnFVNHvbJycY1KLnFKP1iCaAk2CEGo7TGjgUsmHBMu68uyaUuAur7vuwf4aHPiGvs0akBt1nfk9+fxJZQwAmIwbpKhQLJAv6pqQPUkgWXhrFhHGHVupyRR9uKrMhAPU0YmknaEB7TGhH8syOZiOOlU1ZCpKSSFaVFUCN9Qprj3Y880298CYWcyOnVKFcPJUq9jLinEtFh2jpArnvdCG4NlUsUt22uLOAC99i06fKLdHIN29gmuYEDHqIOX6xWLba7VZbDxi0ANr2zGtyCWKFlX+XRsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0klFBG0nQmgFYOsHaSwOsVxis/R7erXyfyhOy8l/tA=;
 b=abkzZTCH4Fcq/xUQu84g+N0zvvDcNB8u1w1lw49r01pX6z6wLnZhWtcPh6LyiHCu/Hw6KU3imYEwQN7Q5GTF3M23MH7c2Z0kvGIGKerguOxl5eanF0rDrXTsuN8/riJg600DF2zYwTXhsWQb/0JSOLtiZLc5BxsEsqwB7KXtgFST78ybXghWv/no+IvjdDaDDmJar7PVWzKm6ccGG6gSo+dQJKNrdDHP0nVuEIW2xTPTTHmaWpNUIlBQQ1GY1oGLHRtZ5BhITy9Rpl0Xt+sI8fhHR94XHRn3WwLV3LkReA3/+g6odNswe7levW1U7x7OMhhYdSzhs/8vUNWR6infqg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2126.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 19:40:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 19:40:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Leo Li <leoyang.li@nxp.com>, Ma Ke <make_ruc2021@163.com>
Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Topic: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Index: AQHZqbkQaP4TFYaOrEeUc/nFP4wqCq+gcZ4AgAArl4A=
Date: Wed, 28 Jun 2023 19:40:02 +0000
Message-ID: <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
References: <20230628081511.186850-1-make_ruc2021@163.com>
 <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
In-Reply-To:  <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2126:EE_
x-ms-office365-filtering-correlation-id: 3f700aa7-6e3c-4287-8e97-08db780f7758
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WIJTSZetlTGCEHnARWivX6L7ttDxGvABYDILG+8HpQKlgjUvvkWjzL1/59IFcYxwMbspVguplyBIdM/HiiVzXLP52xqFmJH0CX1kBenhpXjpYwnuvnJh3GjNwlFPXdn0xI2CqkWYQR+buLBqsMO4+RMMfHH9gWMVTV+M98AFwhFnsGW6cmNsKcJqL36cMeaSLjPRm3KyxCz3xUUpl9e/CHZvK/YCBv2wAvmW3hHiiz/D7WjdKnCsxp9BPuqZ/ZmbYMIhVKJOqgbxzHMjfhmTyCoTmwAHoZiJdYm4fnZUnGYFBuRo/qcnUAqzNjUopJ7giXqQHIa6ZutWp6FmIQYslhNc9xaCWv7bPtJLWjCVwloqLUZlC7JxIqnuTz0v14XiiqXVIaG/KEK8n7iOCEc4hv9B4xtptsEdyw73KZ8R3WR5wMycrblKGD6MY/XRzYe6yLMDGHi6tbdBSJq1amzybAloR24bSdIae/MN+7dAM1vM09jxtvaDZaYGPN95fGUn3EVeZq3IsCrxGXPIbf/L/OZYiclkwWHq+miZtJskAExVNDCHp3pO9bRnM6x01+LASILEQJUArRWeixwgI8WIlNX1NT1f/joF6Csyn5Ley8HyAAz2Isc4JdzUs+I8dvf6MpD48sQzM97sJi7bKR5w09tW6H4Q5BlRGJdLCPyC8Px7TajJeJzey6rS/1H74Gjx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(451199021)(6512007)(44832011)(31686004)(91956017)(66556008)(66446008)(4326008)(66476007)(316002)(76116006)(38070700005)(64756008)(478600001)(8936002)(66946007)(36756003)(8676002)(5660300002)(15650500001)(2906002)(110136005)(54906003)(86362001)(31696002)(41300700001)(6486002)(26005)(53546011)(66574015)(71200400001)(6506007)(122000001)(186003)(2616005)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aE5FMkJ3TzF1TWV2R2lHTDVCRUNLY3hUaVpWRUtTMEYrc0NnVDRabUpmZXV2?=
 =?utf-8?B?Zm5qc0YxdTgvekF5QTkxRk9laXV0Vjg1K2xldDNGSWMyYUhHK3BUcVR4U0Q2?=
 =?utf-8?B?clpKVDZLaWlCQllqaEgrbFkwOFpVbnhoSUovZEpKZ1UxUG1kM3NJd0xNQVlk?=
 =?utf-8?B?Ulg5ajhiVDg0eVJMdTBKcXNjQ29KTVVIRGlwY0RXWTlJOHd5ZmI4MFg4WjVH?=
 =?utf-8?B?dDVIamtjMXp0MGM0SW5WV3RZUFNMUUhVNE5CZEhzV00yM0pZSHNDZ3ZWRC91?=
 =?utf-8?B?N3gwY294SlUvSW1wb2JvemNiQ3p6Sk51NFhDMFJkZnZaOWpGb292Mld6VXpG?=
 =?utf-8?B?NnVGaWZvSHV6ZGZyNUhYKy9xNnpmNVRqOFlxQ1ZvK1ZrM1hOa3lhTmdpdVI3?=
 =?utf-8?B?OHNVTEZLUkV4SHhjeGV5cUFTN3NCM0lFVHVrY09CNWtPQmNEZG9CdDFJQXg3?=
 =?utf-8?B?dlp1Z1BtU3crNk1Tc3VIcU1hRlJYbTZmaEFRcFpLREVTVWM2ZS8rZm81QmZF?=
 =?utf-8?B?MHkxeWs0NzMwVnUySnpMb1ZoS0J6LytyWjcxVHlYN0xZNWtmaUtmZEh4OWxU?=
 =?utf-8?B?NnI0d3JMdTh1LzJtREowMWdKT2tqSlVUVE5QNWtaRit4c1huK005RDdKaFNm?=
 =?utf-8?B?enlOc3hoQXprazRJbzI5aklBamxYRDhiWHIwdTQvaTRUaWZxSy9Tam1wLzN4?=
 =?utf-8?B?MUVYZ2ZiUzdYTGQ3NGlrVjFHRkZKc2FiVGpLeXR6cngxSjdJZWhlRExWMEFv?=
 =?utf-8?B?dmlCYXQ5UjZWVVJsSGRwdnZza1p1QVRuYTlFbHlNTzNTSzRQZk0rcHJ0SHlF?=
 =?utf-8?B?elRBOFlJNzRlKzRmMjhPOGh4YWZEZHBmelZwN0lpb0loSzRERUgyeXRabzIr?=
 =?utf-8?B?SEtiK005b3JoTUtqZ0NISFhZUDVKUHk5SkxVQ25vYmd0anJZNnpDYkcvekw4?=
 =?utf-8?B?b05RS0d2VzROZzYyY3VENUpIRjBmeDVQbGZMRkE5VVNDMEwwcTM4SzNsZTlH?=
 =?utf-8?B?b0NUTVdSM2hRTnNFQk9Qd253WUNJUmFtY0JjY1NiMlFKVUFVZ0tXREtOVGxt?=
 =?utf-8?B?dnFPUFFsNnNxRm1WRVljOFNrUXNDR1VOSlArb0p3QmdqeVZqN3puVmM2TUQ4?=
 =?utf-8?B?Uzk4VHRJVm5LUEY1ck82cGVnTjFNWlFDVGZLNFFHY1lQM0lzUHB1S2ZaSDJO?=
 =?utf-8?B?MEVNazQ5RzRtVUd3bFlneUxQT0N0aUY1cDlHeDB4eDRPWXFkYUdLUDlPOFBC?=
 =?utf-8?B?VTIybEZ5Q21CdXRTWExNSzBKeXBuWVhyT21LY1BKREI1bWRRWStleFVjS3JK?=
 =?utf-8?B?bjhrWENvVTg4bkZLTWt4WXFFMUE4ZU9aelRtNzJkbHhJbjFnZ2kyYW1DVGhC?=
 =?utf-8?B?MjBDSDFWaG9POXRGRm5HcEZwUEdPVXlBTDM4UUhoMkNIdkVTTHQ0OFNNOFh3?=
 =?utf-8?B?YjQzU2VremE2WHpXZFczWWE1MkxtWHp4ci9IdlNnd21FVlJna2hrdmVDZUEy?=
 =?utf-8?B?bUxmVUxpbERnUkpLWmYrdFM0aElpenZJYjd3SytnM3k1dHhiOEdVRHNZV0xZ?=
 =?utf-8?B?RHZxbk4yNnVOODdhRU9KYTZQciswS1hUOUh6OTlWQUVubWVNZWh6MGxVUkx5?=
 =?utf-8?B?ekplcmlPTlhQbUh6cks2ZG1NdFIzYW5nOTZlWTMrL0RiWnpVZEU4Z20yYVJa?=
 =?utf-8?B?QXFmWVNYVjFKblR5NHVtZWJ4TElsVm15U29hU2QxbmpCQ25naG96TkFacy9r?=
 =?utf-8?B?U3Rlb2trV3NXS0ZoSUJXTUd0WmFGOUUyZG1CQmxwVk9VZDFzWitZcFhZUUNU?=
 =?utf-8?B?SXY5VzFueDg1d3llbDhJTWhjSjFIVHRIbkVMeHhzdmZQc211dE1ZVVN0ZW9J?=
 =?utf-8?B?bndWSmEydXN6S3h0dkxRWW41VG52aTd4TFNRTk1EemNIL2FQalZsaFBSNERj?=
 =?utf-8?B?S2JRQnk2MThVZFBhbmhyRTVtMnpvYzVaek50QU9uUXVLakVEMmQxOFNoUnRt?=
 =?utf-8?B?YVRjZUZzMVNDL3pyVkhmZFFWcVg3Y2NVT04yZVNsNTd1ZXd2UHl1MWFabmVY?=
 =?utf-8?B?d3pIZVFwNGs5VllvbERMSklpQ2MvM3FVb05ieitpSFQ3a1RxeXhEYUJEYzd3?=
 =?utf-8?Q?nFyFxNgYkgMeGScKPwE2oi4b+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43620B6C8B12C348B38A92C4B0F9EA4A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f700aa7-6e3c-4287-8e97-08db780f7758
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 19:40:02.5016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/LmyjU1/avwcUiMt/P7+83v+CrwT1evS9Kp8tpYDK0yFWy3fImbnI0WVIdX1OCTs++HDs1oSA8pMeCKFTHOG4MdZMEBq4FtSgcY+GVd0Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2126
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA2LzIwMjMgw6AgMTk6MDQsIExlbyBMaSBhIMOpY3JpdMKgOg0KPiANCj4gDQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogTWEgS2UgPG1ha2VfcnVjMjAy
MUAxNjMuY29tPg0KPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI4LCAyMDIzIDM6MTUgQU0NCj4+
IFRvOiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4+IENjOiBncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtDQo+PiBkZXZA
bGlzdHMub3psYWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgTWEgS2UNCj4+
IDxtYWtlX3J1YzIwMjFAMTYzLmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSF0gdXNiOiBnYWRnZXQ6
IGZzbF9xZV91ZGM6IHZhbGlkYXRlIGVuZHBvaW50IGluZGV4IGZvciBjaDkNCj4+IHVkYw0KPj4N
Cj4+IFdlIHNob3VsZCB2ZXJpZnkgdGhlIGJvdW5kIG9mIHRoZSBhcnJheSB0byBhc3N1cmUgdGhh
dCBob3N0IG1heSBub3QNCj4+IG1hbmlwdWxhdGUgdGhlIGluZGV4IHRvIHBvaW50IHBhc3QgZW5k
cG9pbnQgYXJyYXkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWEgS2UgPG1ha2VfcnVjMjAyMUAx
NjMuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3FlX3VkYy5j
IHwgMiArKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3FlX3VkYy5jDQo+PiBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvZnNsX3FlX3VkYy5jDQo+PiBpbmRleCAzYjFjYzhmYTMwYzguLmY0
ZTVjYmQxOTNiNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3Fl
X3VkYy5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF9xZV91ZGMuYw0KPj4g
QEAgLTE5NTksNiArMTk1OSw4IEBAIHN0YXRpYyB2b2lkIGNoOWdldHN0YXR1cyhzdHJ1Y3QgcWVf
dWRjICp1ZGMsIHU4DQo+PiByZXF1ZXN0X3R5cGUsIHUxNiB2YWx1ZSwNCj4+ICAgCX0gZWxzZSBp
ZiAoKHJlcXVlc3RfdHlwZSAmIFVTQl9SRUNJUF9NQVNLKSA9PQ0KPj4gVVNCX1JFQ0lQX0VORFBP
SU5UKSB7DQo+PiAgIAkJLyogR2V0IGVuZHBvaW50IHN0YXR1cyAqLw0KPj4gICAJCWludCBwaXBl
ID0gaW5kZXggJiBVU0JfRU5EUE9JTlRfTlVNQkVSX01BU0s7DQo+PiArCQlpZiAocGlwZSA+PSBV
U0JfTUFYX0VORFBPSU5UUykNCj4+ICsJCQlnb3RvIHN0YWxsOw0KPiANCj4gVGhhbmtzLiAgVGhp
cyBzZWVtcyB0byBiZSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uICBCdXQgbm9ybWFsbHkgd2UgZG9u
J3QgbWl4IGRlY2xhcmF0aW9ucyB3aXRoIGNvZGUgd2l0aGluIGEgY29kZSBibG9jay4gIENvdWxk
IHdlIHJlLWFycmFuZ2UgdGhlIGNvZGUgYSBsaXR0bGUgYml0IHNvIGRlY2xhcmF0aW9ucyBzdGF5
IG9uIHRvcD8NCg0KQnV0IHdlIGFyZSBhdCB0aGUgc3RhcnQgb2YgYSBjb2RlIGJsb2NrIGFyZW4n
dCB3ZSA/DQoNClRoZSBvbmx5IG1pc3NpbmcgdGhpbmcgaXMgdGhlIGJsYW5rIGxpbmUgYmV0d2Vl
biB0aGUgZGVjbGFyYXRpb25zIGFuZCANCnRoZSBjb2RlLCBzbyB0aGF0IHdlIGNsZWFybHkgc2Vl
IHdoZXJlIGRlY2xhcmF0aW9ucyBlbmQgYW5kIHdoZXJlIGNvZGUgDQpzdGFydC4NCg0KPiANCj4+
ICAgCQlzdHJ1Y3QgcWVfZXAgKnRhcmdldF9lcCA9ICZ1ZGMtPmVwc1twaXBlXTsNCj4+ICAgCQl1
MTYgdXNlcDsNCj4+DQo+PiAtLQ0KPj4gMi4zNy4yDQo+IA0K
