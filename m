Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80138780F92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:48:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=D20t9Gl9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS5rd2YN0z3cT0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 01:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=D20t9Gl9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS5ql1Dwrz2yxg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 01:48:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6eKiSUsSKEZoyxh9WUxD9vCyHTDwFWvfNMJLBsmZj7FdeK5C9OAquHLFgroxwdM2obAEQVFbjLLt9YDREoJQ+oj7jdAeZErIzs9stJR2/EnbZ/Kji1w7GFVOBVMYLtqWp0nRWQlhUwLnFm8MxWdpDZr/JfGARsP8i5ZyyGfYyX4RAvpREBHGgTQ3AZcuuhnn0cfOySOgp/GeZJialueyY7wYjK+V+iLcPsp8j5t1ugKwdEbr3xN+sKk4VEsy91gtGV+uwK6UzxeCgf3/HZScYKhQ5iSkrUUc33YqIOEPTBRaa+d4Co8Bgd2R7eJUpWbvtKYy1f6cSzO9dfSB5wIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rMrWxwyrcaExp7RUiJXIL6cQQUp3dEiQSaDSjoQij8=;
 b=ipEjQb+wJvYSr2QGH8chGJqorA6MZYGIHZyw/DVHijg6IjXn7H26wJrxIc7CDPCdjR+3yA/CqW9SzxHzkWCPq7KAR/DQ2JvSyOE6ZQSAvQmJJnFy/2d0hIPYmdcEYnu17XmgbJPZU8t2y6QKRjxClMbCoHmel6xw7im0xOir6rz4FpVEscMjAMNULNKR0cX+6wX5eP4nx0s1NNt6LKJCQD8E/7By+k2dwqktwc3LA7carsVV9ShOH4UHUYO31MidhBeFzJtMWUzKZos5wQiiRV05lGK2WyXoXmiOHiRakiO85P2DUWApWz1+uIw6KG4VyRSczASZufuFos62jFjzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rMrWxwyrcaExp7RUiJXIL6cQQUp3dEiQSaDSjoQij8=;
 b=D20t9Gl9JV63U9tHP1Yg+XV1W31OUZApytR2RAYDnanFS5DmecU4C/z9Aa0wDN8EjeHXG2cp45YL7dq8MAqcXHzO4a7iMy0j6ddvEMPxGNjfV37XDskUqiQHI07kYJy8PBOEmeZBU7a5DdO8nayTkqKiLjRXlY7NQQvjtuFG+L9Vek6TmVGyaJElUGmK+WB8Z0sayjik6kf2Xe9An4uJKaQHVRm94G6NVsO2FHrrvJJxof2dIyHQPOq8i43Pi8kbSb+cDdgj7bZk7e5jkBo9tjQ07V9+8JqGgPnP4VyTioGOb8C2UFuHxSOx19/Ub9PIckhYejYgsa63bTbOMsQhZg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1535.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 15:47:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 15:47:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOAA=
Date: Fri, 18 Aug 2023 15:47:38 +0000
Message-ID: <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
In-Reply-To: <20230818111641.7f680ce7@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1535:EE_
x-ms-office365-filtering-correlation-id: 87776231-7e9e-4276-b120-08dba0027314
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  enHf9EviXOchdscG14QNp18p3KsN1MT9gywfewSsmL7FlbPDFOVVeTM+/DqgBOaE7qDDdTNWJPYLiugdxzadSdc+jY9UZ3XQcfprG4ez1uir2j2Uk1NpKO77MSfPRHBXAM0r4WEB0BSjLJuCIQ5SO5UhVq9x9wbA7+HCjxMzC6RxX29IZhxkFWwlRQYSzbTqFLeyvwL+0aJ14wPE1NI8fGykwkqFjdIDfDlfXBg2yciZiTarEpEN35/lj8JHOcJoN0Qw53Jz72/kqNz4kmZw5uazBiSP2txbQiqxaZ6cqDaYTOk4K+JbocTVspStBzobvYAveU5xL6Zu/10GM0qG4sDK4HFJVrOz8enPM/ErSHN7uWDg1iXH8XxFBsX+AruZSOUVDNEKJO1S/kNQUDnRAathS3TMM3BTIiGoMzZzwE9bMamQoyfhX0T2FKYQ9RqTYjeOkVhJaOXrmK14IuTOeakh4GL9/LhpabuY3v9k1HoCu+Zfkf53WUiAOm9fVprgcfIlE3Od28gRDGuyfPwlt/deI4+s8pT6qU7+lgfFp6f1daHrnMky9og6icvXVJZQXpdtrBqY/N6ScwgkYPR/8oNnSrIxasLRhOG0LtjhCybFLmnuCcD/N7A4JRC08McOTiE/GabaUtuLwB1gUk9gKrBY8wBAN6+ajK3LvOspixixBQtCSh8ybngIyNJHVfDt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39850400004)(376002)(396003)(186009)(1800799009)(451199024)(6486002)(71200400001)(6506007)(38070700005)(38100700002)(6512007)(122000001)(86362001)(31696002)(26005)(66574015)(83380400001)(36756003)(2616005)(2906002)(64756008)(66946007)(66476007)(66446008)(66556008)(316002)(41300700001)(110136005)(91956017)(76116006)(44832011)(5660300002)(31686004)(8676002)(4326008)(8936002)(478600001)(19627235002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2F1dCtYblV3ejZDeDVLaUZEYlJDdDlIYW9QMm1jRmx4UWlHM0pvWXl0Y3ov?=
 =?utf-8?B?YkNIY1ZWK2pWQVNwMUVabisrYmN3T0xJa1NRd3hlQ3pVWGtUcW01Qk9sUjBv?=
 =?utf-8?B?b1B4eFZHdTNlVHZUVFBMeGl2NHNCOXhNcGxwWkg3SjRwUFlZSUc3OGd6NEls?=
 =?utf-8?B?OTJNcmJBS0JjOFlrVTNkcnZLRitZZDZQRTlmWWphSWMyN2g3VjJjRWZBV2kz?=
 =?utf-8?B?V05LVDNGRFJEVDVVcmtSRC90c2QxLzdyYmlucGFLaFN3QWJGaUxrdVFJemxr?=
 =?utf-8?B?dVdYY3NZUVFEZDd6WWF6SG9WOVVXankvd0VCM0NUUDZOS1ljMlVBRTV1cVRO?=
 =?utf-8?B?NlVtemc2ajdtdXkzWTRFRit4Q0c2REZ5aFFnQStIaTRMRzB0ajlITDlsdXRX?=
 =?utf-8?B?cUxhUzh2Yy9hTmpEMWFFdlJPcHRwczF4RW9MRFlHN1VpQVVVbjQ4TGxNSlo5?=
 =?utf-8?B?Rm9uQ25QL3JKUTlXN2Q1L2t3REVBdmptcG5zS3ZydGdUYlo4dnNFam9RclNB?=
 =?utf-8?B?eDZxZkFSQ0lZNGRHdFdNYW9mZExJVFBOditrQmhrN1lNVVU3RDFIYmdDeXRQ?=
 =?utf-8?B?UVViTnRKMW9vUEtEUEQ3N0tTVHk0QjhHSG91UjVEMzkwY2JFMm5TRXlhWHEy?=
 =?utf-8?B?NW5CajlkQlQwckV1ZnFxTHJTWXZFamR2OUtzeWhnQzFyZjZ2NXRSRXJseWNp?=
 =?utf-8?B?RSszd21JSEROUzVHRkt1VWh4SzFESXdLQzcrSHdUSHNNR2RIazB4TmZYeEtR?=
 =?utf-8?B?cWNtblVyTmt4dUhsZFpnTG9iaDZ3NDNoZmpaeW5pM0hiNEJDbEZIMXFkcnZ5?=
 =?utf-8?B?Q1NGL1BkMjlGZVlnck92dTk4bGZHZUpTc3RENnpraWgvZ1RkR0hrSUdpS21j?=
 =?utf-8?B?YWsvZkJzRWlJdUd3R1h2MzNubkg3U2pPTFQ2dHMvSlExY0hDb2k4UmNJeEJy?=
 =?utf-8?B?UWxydXgvcnQ0YUV6blJIbXMwUzh1bWhLTVFxNVRhME9PRVVSKy9TaTBzYytY?=
 =?utf-8?B?Y2lTUGZsVjM5OHFxb2FCeFlTK2I0ZGh6QzBWN2F1ZjNqRm1uY0JpK3dsRlBo?=
 =?utf-8?B?RFllaVlJd28rUHpHZ3VkSjNYZFFXZEg3ZlhOZ0hjUzlkdDg3TXZTRWUwS3ZS?=
 =?utf-8?B?R1hiSDVDcVR5cTY2VUdnKzVBVnZqZE0yTUczam43OHBKNDBDc3k3UmJGS2dB?=
 =?utf-8?B?aDZhUTRwRUNhM094NWhxV203WjVLdWI5RFZRTmt5Y00vVmNhNVdPTlVWQ1lh?=
 =?utf-8?B?elpuclV3RWxvMmhoZStlSXA5Nkw0RzgyZHRWVWRaajZRYkxISnZ5a010TEg4?=
 =?utf-8?B?M2U0OTZYVTg3MWh3T1NXMXV5V3l1dXdoVmxTTzBiSXZBdHpvSy9YWFBhbEsy?=
 =?utf-8?B?YjZvRnJwVzkyYjFob0FkeU1wcGx3a2J1Q0lKNTQ2VFVMUXZvVEI5bUJxaTVk?=
 =?utf-8?B?OVdJZyt3YTVQNGw1S0tnUmlSVHF6VUJ1MWVtdXhlVTlLUnNUNCt3MmNGcFNE?=
 =?utf-8?B?MHdIZjJSaFlsTElyWFh1RkpYb0h0MXZaZ1NrVzFpNUdLR3VndHNkM1ZpRzNK?=
 =?utf-8?B?VEFRWFpaQ05pM2JaUSs1clRRK21TaFl6VEc4SFhxdFF5NnhINFFxdXlEclVH?=
 =?utf-8?B?LzFkUG94L2hMVVVRYWNuZ1JXS2Nqd2NUeU9jdXlNSkNDK3BndnB2aGtKU2VQ?=
 =?utf-8?B?WTNaVC9mei9VTzZCd1N5WEZjYmg5VVZCdys3bkdxSGRxMUJObmV3NWEySlBi?=
 =?utf-8?B?RWNOYU1DVytDVHBOSk9kL3ZnUEgzT0tKVGpKZGdUa3FuOVNpVlJnZmFjR1hD?=
 =?utf-8?B?bVVWdjNhNEVkUFBMM2l1c1hWMUJ6UUpzM0pYMjZmNWQ0SHVYajdUWFl5UWlF?=
 =?utf-8?B?UU12WmkwUUZncTZIb2RiZllwSEkvd2ZvSGNEOXJSZXIrYWFtMkpEMmFhdk1L?=
 =?utf-8?B?REVWT0F2T3ZORHp5TkhlRVhkWVRGSVhLb0g1VXhiWHk2cmdGOGJoeUFvVnQ4?=
 =?utf-8?B?WGFOTlp0MDlwYjJFczBqb2llK1BoOVVXTlRxTXR3TlVLb0VydFRRbThYYWtI?=
 =?utf-8?B?QVRnbmlSTS9sZ0owVFovZ09MTEZJWGhkZTc5TkRVb0R4L3lNWE9IYWhEUGUv?=
 =?utf-8?B?QnV1cGFQOGh3QkovNzVkTU5LQVM1N0tLRHB2VzA1ZlEwY1hLWHdaUWNzUTRY?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F2AD32EC5502B478C42D3DCB1B6C914@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87776231-7e9e-4276-b120-08dba0027314
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 15:47:38.4050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1SxTpOQg+o6pA7yr3hFa01apWEJDwdmUn0OkKbuquJg+RtOCdyFcmqItEMN+kYZxxu6xAidYtkh7dGv/mHBBce2Uo8lH1QQUL8o46nxxzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1535
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

DQoNCkxlIDE4LzA4LzIwMjMgw6AgMTE6MTYsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMTggQXVnIDIwMjMgMDk6MTM6MjEgKzEwMDANCj4gTWljaGFlbCBFbGxlcm1hbiA8
bXBlQGVsbGVybWFuLmlkLmF1PiB3cm90ZToNCj4gDQo+PiBUcnkganVzdCByZW1vdmluZyB0aGUg
Y2FsbCB0byBidGV4dF91bm1hcCgpIGVudGlyZWx5IGFuZCBzZWUgaG93IGZhciBpdCBnb2VzPw0K
Pj4NCj4+IGNoZWVycw0KPiANCj4gT2ssIEkgY29tbWVudGVkIG91dCBidGV4dF91bm1hcCgpIGlu
IE1NVV9pbml0KCkgYW5kIHRoZSBmcmVlemUganVzdCBoYXBwZW5zIGJlZm9yZSB0aGUgIkxpbnV4
IHZlcnNpb24gNi41LjAtcmM2LVBNYWNHNC1kaXJ0eSBbLi4uXSItbGluZToNCj4gDQo+IFsgICAg
MC4wMDAwMDBdIHByaW50azogYm9vdGNvbnNvbGUgW3VkYmcwXSBlbmFibGVkDQo+IFsgICAgMC4w
MDAwMDBdIFRvdGFsIG1lbW9yeSA9IDIwNDhNQjsgdXNpbmcgNDA5NmtCIGZvciBoYXNoIHRhYmxl
DQo+IFsgICAgMC4wMDAwMDBdIG1hcGluX3JhbToxMjUNCj4gWyAgICAwLjAwMDAwMF0gbW11X21h
cGluX3JhbToxNjkgMCAzMDAwMDAwMCAxNDAwMDAwIDIwMDAwMDANCj4gWyAgICAwLjAwMDAwMF0g
X19tbXVfbWFwaW5fcmFtOjE0NiAwIDE0MDAwMDANCj4gWyAgICAwLjAwMDAwMF0gX19tbXVfbWFw
aW5fcmFtOjE1NSAxNDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIF9fbW11X21hcGluX3JhbToxNDYg
MTQwMDAwMCAzMDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21tdV9tYXBpbl9yYW06MTU1IDIw
MDAwMDAwDQo+IFsgICAgMC4wMDAwMDBdIF9fbWFwaW5fcmFtX2NodW5rOjEwNyAyMDAwMDAwMCAz
MDAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21hcGluX3JhbV9jaHVuazoxMTcNCj4gWyAgICAw
LjAwMDAwMF0gbWFwaW5fcmFtOjEzNA0KPiBbICAgIDAuMDAwMDAwXSBrYXNhbl9tbXVfaW5pdDox
MjkNCj4gWyAgICAwLjAwMDAwMF0ga2FzYW5fbW11X2luaXQ6MTMyIDANCj4gWyAgICAwLjAwMDAw
MF0ga2FzYW5fbW11X2luaXQ6MTM3DQo+IFsgICAgMC4wMDAwMDBdIHNldHVwX2t1YXA6MjMNCj4g
WyAgICAwLjAwMDAwMF0gc2V0dXBfa3VhcDoyNQ0KPiBbICAgIDAuMDAwMDAwXSBzZXR1cF9rdWFw
OjMwDQo+IFsgICAgMC4wMDAwMDBdIHNldHVwX2t1YXA6MzUNCj4gWyAgICAwLjAwMDAwMF0gQWN0
aXZhdGluZyBLZXJuZWwgVXNlcnNwYWNlIEFjY2VzcyBQcm90ZWN0aW9uDQo+IFsgICAgMC4wMDAw
MDBdIHNldHVwX2t1YXA6NDANCj4gWyAgICAwLjAwMDAwMF0gQWN0aXZhdGluZyBLZXJuZWwgVXNl
cnNwYWNlIEV4ZWN1dGlvbiBQcmV2ZW50aW9uDQo+IA0KPiBJIGFsc28gdHJpZWQgYSBrZXJuZWwg
d2l0aG91dCBLVUFQL0tVRVAgZ2V0dGluZyB0aGlzOg0KPiANCj4gWyAgICAwLjAwMDAwMF0gcHJp
bnRrOiBib290Y29uc29sZSBbdWRiZzBdIGVuYWJsZWQNCj4gWyAgICAwLjAwMDAwMF0gVG90YWwg
bWVtb3J5ID0gMjA0OE1COyB1c2luZyA0MDk2a0IgZm9yIGhhc2ggdGFibGUNCj4gWyAgICAwLjAw
MDAwMF0gbWFwaW5fcmFtOjEyNQ0KPiBbICAgIDAuMDAwMDAwXSBtbXVfbWFwaW5fcmFtOjE2OSAw
IDMwMDAwMDAwIDE0MDAwMDAgMjAwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21tdV9tYXBpbl9y
YW06MTQ2IDAgMTQwMDAwMA0KPiBbICAgIDAuMDAwMDAwXSBfX21tdV9tYXBpbl9yYW06MTU1IDE0
MDAwMDANCj4gWyAgICAwLjAwMDAwMF0gX19tbXVfbWFwaW5fcmFtOjE0NiAxNDAwMDAwIDMwMDAw
MDAwDQo+IFsgICAgMC4wMDAwMDBdIF9fbW11X21hcGluX3JhbToxNTUgMjAwMDAwMDANCj4gWyAg
ICAwLjAwMDAwMF0gX19tYXBpbl9yYW1fY2h1bms6MTA3IDIwMDAwMDAwIDMwMDAwMDAwDQo+IFsg
ICAgMC4wMDAwMDBdIF9fbWFwaW5fcmFtX2NodW5rOjExNw0KPiBbICAgIDAuMDAwMDAwXSBtYXBp
bl9yYW06MTM0DQo+IFsgICAgMC4wMDAwMDBdIGthc2FuX21tdV9pbml0OjEyOQ0KPiBbICAgIDAu
MDAwMDAwXSBrYXNhbl9tbXVfaW5pdDoxMzIgMA0KPiBbICAgIDAuMDAwMDAwXSBrYXNhbl9tbXVf
aW5pdDoxMzcNCj4gDQo+IEhlcmUgdG9vIHRoZSBmcmVlemUganVzdCBoYXBwZW5zIGJlZm9yZSB0
aGUgbGluZSAiTGludXggdmVyc2lvbiA2LjUuMC1yYzYtUE1hY0c0LWRpcnR5IFsuLi5dIiBpbiBk
bWVzZy4NCj4gDQo+IEF0dGFjaGVkIGlzICh3YXJtIGJvb3QpIGRtZXNnIHdpdGhvdXQgS1VBUC9L
VUVQLg0KDQpJJ20gd29uZGVyaW5nIGlmIHRoZSBwcm9ibGVtIGlzIGp1c3QgbGlua2VkIHRvIHRo
ZSBrZXJuZWwgYmVpbmcgYnVpbHQgDQp3aXRoIENPTkZJR19TTVAgb3IgaWYgaXQgaXMgdGhlIGFj
dHVhbCBzdGFydHVwIG9mIGEgc2Vjb25kYXJ5IENQVSB0aGF0IA0KY2F1c2UgdGhlIGZyZWV6ZS4N
Cg0KUGxlYXNlIGxlYXZlIHRoZSBidGV4dF91bm1hcCgpIGluIHBsYWNlIGJlY2F1c2UgSSB0aGlu
ayBpdCBpcyBpbXBvcnRhbnQgDQp0byBrZWVwIGl0LCBhbmQgc3RhcnQgdGhlIGtlcm5lbCB3aXRo
IHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVyOg0KDQpucl9jcHVzPTENCg0KDQpUaGFua3MNCkNocmlz
dG9waGUNCg==
