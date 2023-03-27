Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEFD6CAC2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 19:49:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlgL66CSMz3fTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 04:49:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5P/92+HY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5P/92+HY;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlgKB4syrz3byZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 04:48:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiPb3gN/58sn+JWOLfSQPyiXqVjp30VxHN/oWgeFZvpkIz9n8qBxHiEt73IFUh87srXPHTNtLKWTHFLFJtLmZb+2VNIvyqSV24i+qH8nFZE9xHNfDuStOIhOgLssmQlFIkEWBdx+6SVkWHTjeN1YGhlhSnvZe6m71SRw8rixmcbkmdwhabbtm0EPvtOs1qekVRQnPK9KbX2MjkBudzSvuYYkDf1O7xofA+K9p6z2aNS90vrQpVdB6+Iul2gJuskjHlU+mQSbfXnc/3TA2d6FlvxSatexujtQeIzHTcQpNz6810yfMmgWFSJOd4euCLW8OGnmSGR9WsXBzrvsMlmEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/2wwJXhk+20CWjYsYBKmp7+YgEhf7DKENA3Pjc20lI=;
 b=WO8Xph6kerIooUniP3qF2ZEn14dJfPyi51recPHJ2fh0j8KTTqjK8cTCaK1z3ZnLOCm6MfsXE7TK2C1y81cjw6mTn32+TtqHA+YSWWB5pA56hEmJCtkjcqpd6ULZOdrL8Khxd1F3damdILJuBPltUiaGJ474h6E0pxWXSBIcs2HFc7El3IOxJ48bzNYhJ5fq1YjOox4RTA4dcn1kizxdMXGvOUvIR2aBZz+CCr1E42zA4lJ00KZYo1euvdgL02ygRuoz8EjXxo+tNNxPsbo1ARF8R0lZDkbqu2F4MwVZoDMJqqZMK77sukPKqB0wy9PiJiKqYM3uhOTyIqNFbUTisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/2wwJXhk+20CWjYsYBKmp7+YgEhf7DKENA3Pjc20lI=;
 b=5P/92+HYv4r7PNXT+KCVrnkQoaT9T/l8BODcEs5e37xbcil/CpwAjjEpHtankIqYLDY9XugqcAndloJsX6o1aBrbIOOaWg9nkxQQrtmBWppTF/Xyq4vnSPYq0Z8VitFTpwyaUIL3nO3AR7CFYQ+yQ0EVnfsKc1laP4KWhUCGoiN1sYUdvipY5sUv06b2vDYRkvtRmoCvT/23qX+YdIInM1bfgTD/lCSDeeHBQqZjK1OhG56wkNZr/RWk6enRivB8JGtZq8V8VRBHmjK3RJITVdJjASxp3O+z33hjhGU9NRq379tMG9bg8NJOoFVfG0PDK1xACBxaC7e4iX+QCNz11Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3406.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 17:48:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%5]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 17:48:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
Thread-Topic: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
Thread-Index: AQHZXxrq+8HPN7EdUkuvKUy3NcYjV68O6mKA
Date: Mon, 27 Mar 2023 17:48:11 +0000
Message-ID: <ffded830-6081-5e8a-b51d-fd1882e9b8a8@csgroup.eu>
References: <20230325130651.2457266-1-npiggin@gmail.com>
 <20230325130651.2457266-2-npiggin@gmail.com>
In-Reply-To: <20230325130651.2457266-2-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3406:EE_
x-ms-office365-filtering-correlation-id: a77875b7-b0a9-42d5-8f15-08db2eeb6ea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5J1O3Te0HJakSpZOPS1fhpRXq7mjdwt24WZkK91dOknK5TcRva26e4wFR5DG3SZ0E1v4K9Z5Dn7Wj0dNwUFqqi1rMNgfIDnTfNqKo+b5v6VrdRqL8MJAUbo3bkWVDGpqUbQFJsBOmxvzgtprpQ8YfQFnZlvq0F15Yecdp1wW56cDZEwRFysd0nLCxakNHjUQ7OPxeFIBkKxJIomkBSWH11jf0fQj22/Sv9uvkgS3iCJhdxFwpOcvYrVYpjCClvuvU0lRaleCR4qGzvlbif3ZE2GLsg9Ua1pnqUeDDjX38h+94EPdqNZp4njngEujQakgpAPu8h94wcbVAuYKDatd4uppkd5ZYdUpxUrYQ5FdUZ0Gs/BsbFO+CFuax6Wa1ZtoYRknIsoXdJJC9vM+yhdAvQYafBZFm+j3yStc1HYXRQswGtLx3/b7dEpTD3ZerFtOt47yM+GFJz0PUW+7cS+iCX3EMm6pMrHtrw7C4zoqbGaU/rSq+75ZmidskisPEELvgecGdzCORnetNFN4q9XNnIrGBYJpic1BILoY+Soazo30TV+pMP79P/fzfnEP0K4Y9yN0kaG7KmTd4/W6pzaGZTcuQ8J8GDPJqEpWYkCGA99fj7AwfJoznq40AOOQMl+ttnQ3I04Q+7gcOR59sS9II491EOvMzlk3z7SHx0E9GOJGgzkk4i3vYeoo6f2AxxL0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(6512007)(6506007)(26005)(41300700001)(186003)(6486002)(71200400001)(2616005)(83380400001)(31686004)(66574015)(478600001)(316002)(4326008)(66446008)(38100700002)(66476007)(2906002)(6916009)(8676002)(64756008)(66556008)(66946007)(76116006)(91956017)(44832011)(36756003)(31696002)(5660300002)(86362001)(38070700005)(8936002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L0lhVlRxTGRWRnlCaC9saERRZEJMeUtnMW5KVFo4dk5qZU5vL0tMS2dqTVB4?=
 =?utf-8?B?M0dkeHRFaTloZHBTa2tHejk3Sjc0aXk0eVlKeXhzalFmdzkvVElhZFBnb0RK?=
 =?utf-8?B?OXlTUmovQkVhQ0tWTCtYQSt1TEdSeWxOMFNjdk9RSmROZDFHV2NKUDgvaDY1?=
 =?utf-8?B?SWdGclUwVTQ0TzZTMllKeWRDSDhtamZ4bGdQM0I5cEsyM3pLa1dYWE1kYmtz?=
 =?utf-8?B?SlVGUnZqNXlEN1J3UGp0dFB4R1dZZTQ3UkdwTkc1U0FYWWpGeEhoSGVhVHJa?=
 =?utf-8?B?VTQvRzlweHUzVS80R2ZQcUJvMFFWdWMvRkdHMEN1Z1RMTXhTdGN3RHlHVHox?=
 =?utf-8?B?Q1RJU0hQL1ZSSXl5d1hsZ2lZcDNFV0RlVm52a2RKV2U1MHhjUlJBdTJrdEZY?=
 =?utf-8?B?ZS82ZUNSWHJYb2o5VkxUb3lDMmNoa3pkK2h2Q2FvVFFrcy93NmlnRGhBZkZw?=
 =?utf-8?B?Sy8zQkZiNncyU3IvWHBXOHRNWVhudWZWZEJyQ3dsamlIKzdrb2lEOUxOZkhs?=
 =?utf-8?B?Q0tkVUUrSHRNMkhqYm95QXcySEErUzBZREJnbUptNWlWQVQ4MlJzQUJORkZ2?=
 =?utf-8?B?YTlhV0Z4SFFXc2VTcW5pdlkrVzlXb2xneWtQWVE4SmVsKytTM3NvcFNuakZo?=
 =?utf-8?B?bjVGYVRRSUJYc2xrRWVhZzFhL0krTFFQM3NKYlRkamRLLzRLVXRXdE1nVkVN?=
 =?utf-8?B?LzhmVG5iMkZPSm0wc0lSZGwxSURXSjNsQU1HOW5Wc3RLaHBrY1E3VjgxQ3Bh?=
 =?utf-8?B?ZUFYVWxGTm52cGdtSXY4aVova1ozMW1CZk8wSWxyek9ucHh5M29icDRiOEQ1?=
 =?utf-8?B?ZExCNVJUUTZHN2VVUFkzbG9jRnd3V0VoUmxJQjZ6RENXNWFOYkY2N2txRXJs?=
 =?utf-8?B?UXR3K2dsR0JHR3A1aS9NR1pDSzVLY3YvVE84YWtFL2M5bGEwa01rSjY0NXBJ?=
 =?utf-8?B?Z2ZnWlI2OVQxcW5YS1dxQU5iS2E4cHFsUjZlaDZ6bkVYdlRpRE9iZ2MwTC9r?=
 =?utf-8?B?aFU5TkhGN1RZV2tHazBSTEliUzhHQWZYcFBCdnFGUFlBL0ovS1NqU28wYUtH?=
 =?utf-8?B?cmJrcG1xWDVBZ3FlWGpOUzdsbXo1SjlENzV2VHF6bVBESWtyeHd0UW12SGFh?=
 =?utf-8?B?MlFXWWo2bVZxSzczUDY2aG80L3JUMnBZRVhyaVR1OG1wTVZRSk9MQm1Sc3JK?=
 =?utf-8?B?TmttNGJLU1F0eFFsV2VBN2hIcW1NTSs2ZXA5U2hkb2VGd3BWK3lwYzdnY1R6?=
 =?utf-8?B?NURXZ3BYWFpjTjY3b2xVU2x5SkxSalV5ZFFBWlZ6cHd5VkI2ckwrSUlISXE3?=
 =?utf-8?B?djFRbkFpVE5BVktuQUN5ZG9IYlBXSm1TZ2V4aTRVbDRQYUp5LzE0ajJmRzMr?=
 =?utf-8?B?OUQ2bEZJUjNvcXBheVNzYW9vNHRCTkZLVTIyd3JRd0ljdGN6bnlLSnhXdGxB?=
 =?utf-8?B?Tm5jNnBXcHZXWUZDVDNRWE50ZWtlU1dVL1pHYVFRdHN3TGVpOVBwMFYxYmNl?=
 =?utf-8?B?Y01ET3JjR0dYUVlWbmMwMk1FSkFKL1JyOWlxK1lTVXQ1OHdNM0Mzd3lIM3Jh?=
 =?utf-8?B?U2RaSXhMaHl4Yk1OUEMwb0I1US9PeGdES1h5RE5qSFRseVk3OHdQVkpTc3Q2?=
 =?utf-8?B?WW5IOFFyV2lhOHQ2Zk5qckMvVjR1eTFOWHNFbjdKQktsdmVUODVuekY5R2RU?=
 =?utf-8?B?aWpSY21BQWxBTzJabWhCLzJWRk9mYmNHSUdGZlc3TW9UN2syRml0QWU5Rzdk?=
 =?utf-8?B?aVJpVzJnRXlaWW8rNVlFbWhndGhVUll3Ty85ZThvTzNPb0J6RFMwZktoZGdr?=
 =?utf-8?B?Mi9oL00vZkp6bkh0QW1YaUVxMkZvbUNmMWY0OFJNa2JrN0hsMWxxOEhKVEF0?=
 =?utf-8?B?am5uSXJWRG02a29mcTlYOG5PT2xaaUV4aXVXQ3k0MjVXK3dLQWtnc3VwQTJ3?=
 =?utf-8?B?bFFVblB6TUlhNmJnSTBJbENWWHBVYkk5Y0lPZXplYlRxS2JBbjFacnBNVCtN?=
 =?utf-8?B?cFc0dmxZajc3YVVkTzRDOURWandQekt6SnZTamVXT3NTVTRzcHBNUHIvN2xS?=
 =?utf-8?B?amt2K2d2ZFR4LzI5UUVtWkRNWklWNkNJbXBMY05CL1Q0OHNQN3FTUWY0ZkpD?=
 =?utf-8?B?aEVSN3VMclg5ZnROQ2lQRGVoa2ZOdVV2d2dkMjlhMTBTUzNvWTVMRHhVSlFB?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14D6A63316D8A44EB7137E113EE89E7C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a77875b7-b0a9-42d5-8f15-08db2eeb6ea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 17:48:11.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3sPcKs2QEllHYay7Km8P5pTfYlDZ1JGFktPmIkfE1Qb0oSBsHf80ewqDF5+NuEipi/JjmII1Y6BPXeCOaUensQeV1r1KaBDr2qjwztCQC0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3406
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAzLzIwMjMgw6AgMTQ6MDYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBUaGlzIGZpbGUgY29udGFpbnMgb25seSB0aGUgZW50ZXJfcHJvbSBpbXBsZW1lbnRhdGlvbiBu
b3cuDQo+IFRyaW0gaW5jbHVkZXMgYW5kIHVwZGF0ZSBoZWFkZXIgY29tbWVudCB3aGlsZSB3ZSdy
ZSBoZXJlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdt
YWlsLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgIHwgIDggKysrLS0NCj4gICAuLi4va2VybmVsL3tlbnRyeV82NC5TID0+IHByb21f
ZW50cnkuU30gICAgICAgfCAzMCArKy0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgc2NyaXB0cy9oZWFk
LW9iamVjdC1saXN0LnR4dCAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+ICAgcmVuYW1lIGFyY2gv
cG93ZXJwYy9rZXJuZWwve2VudHJ5XzY0LlMgPT4gcHJvbV9lbnRyeS5TfSAoNzMlKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL01ha2VmaWxlDQo+IGluZGV4IGVjNzBhMTc0ODUwNi4uZWJiYTA4OTY5OThhIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9rZXJuZWwvTWFrZWZpbGUNCj4gQEAgLTIwOSwxMCArMjA5LDEyIEBAIENGTEFHU19wYWNh
Lm8JCQkrPSAtZm5vLXN0YWNrLXByb3RlY3Rvcg0KPiAgIA0KPiAgIG9iai0kKENPTkZJR19QUENf
RlBVKQkJKz0gZnB1Lm8NCj4gICBvYmotJChDT05GSUdfQUxUSVZFQykJCSs9IHZlY3Rvci5vDQo+
IC1vYmotJChDT05GSUdfUFBDNjQpCQkrPSBlbnRyeV82NC5vDQo+IC1vYmotJChDT05GSUdfUFBD
X09GX0JPT1RfVFJBTVBPTElORSkJKz0gcHJvbV9pbml0Lm8NCj4gICANCj4gLWV4dHJhLSQoQ09O
RklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUpCSs9IHByb21faW5pdF9jaGVjaw0KPiAraWZkZWYg
Q09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUNCg0KWW91IGRvbid0IG5lZWQgdGhhdCBpZmRl
ZiBjb25zdHJ1Y3QsIHlvdSBjYW4gZG86DQoNCm9iajY0LSQoQ09ORklHX1BQQ19PRl9CT09UX1RS
QU1QT0xJTkUpICs9IHByb21fZW50cnkubw0KDQo+ICtvYmoteQkJCQkrPSBwcm9tX2luaXQubw0K
PiArb2JqLSQoQ09ORklHX1BQQzY0KQkJKz0gcHJvbV9lbnRyeS5vDQo+ICtleHRyYS15CQkJCSs9
IHByb21faW5pdF9jaGVjaw0KPiArZW5kaWYNCj4gICANCj4gICBxdWlldF9jbWRfcHJvbV9pbml0
X2NoZWNrID0gUFJPTUNISyAkQA0KPiAgICAgICAgIGNtZF9wcm9tX2luaXRfY2hlY2sgPSAkKENP
TkZJR19TSEVMTCkgJDwgIiQoTk0pIiAkKG9iaikvcHJvbV9pbml0Lm87IHRvdWNoICRADQoNCg0K
Q2hyaXN0b3BoZQ0K
