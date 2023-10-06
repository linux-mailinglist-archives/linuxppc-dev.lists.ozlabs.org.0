Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707787BBC36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 17:57:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eNbtG9m6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2CjT1F02z3vbL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 02:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eNbtG9m6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2ChZ2KgBz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 02:56:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPIoF7+7GfhnqFyYXD4nxo2mOgd1pteIzj4SD3MjnP/votpAwvmZ4Ent+aQJJxDHwdVhJfze9oePF6+p1pfv8DhGiDnywTf3j1aBjN/BZ3QnTZeg7Oe/0hLipz9L0gw5LFgrc8Z3n9RvydwXwICJby9oL0Zx71dSyxcg+63hHiMwEjjKjokhXMCecFLBrhO+mTk/uo8W9dOV3eTMn5q+TH3UZBO27XkrS8Kq4V1w1B6FiZcq1lUW3lANgWuhFZa/EJys85O9NY6sP5L1CWQD3maUf4du6azqSVr0FGYB6fdtitOrKLzQlVOEo/ve/zZmTiXun1x1ajKL2Dyjtpq1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+ijxHaAvv0b96UPylJVqBj/vs9X4dLkMqJY+3HDYuI=;
 b=eVSfg/URJ0w15VG4z+prU5aQ9AZZfu3o/HsLrBho1gmXzK9nwTk5FQ4tECrSI72hyRscR4yJUXvgLeEqjUtmJnbE1CrgcfHv3bF7n+Ac1l75u77mAQpYQsenq6uxmhAT6t1osGKSu6hnuMipUPFctxY4nPqHHvo2VKWUbcSFukAhxYe+Sg2dbQjj38Pi7Rtsxhe7r6qkf3GzyXLFsj8S2P3DgnUFosxETg1H5yYBF9Mp5nifLdUNZj0vbZ9WW5ZNvgJ9E4riJljFsM7ND0WwBH6T8Urcd8WxaurpS1YYfq+j4is2rUMn0f5/aZ8s4A245v/JJ6asyrhyluwqlOCLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+ijxHaAvv0b96UPylJVqBj/vs9X4dLkMqJY+3HDYuI=;
 b=eNbtG9m6yNQYDy8yorbeWxdCmRYxv5ndGA3RJSLpQswN7E1Lfi5SfE3bK50yGNKM3YKiL8rDYbYWhOd6XwkZwJzojfx4P9PD0C5iDUFZ6ZnK8TrYclvbZG/4VNV5oP5mlaVLBHclIfT7vOSoMpAdIqy677x4tH/eZ1ggxq9yC/hbUhVvfe++4PeC5VJZgR++qvp4DEyJqSdtMmFZ2yz8qYqwF890pudaWmwyECC3QeQRCOp7n1Cu2opT7t96+ejXKyC5rlIyDOkd8kfW22JpGaWCvz+QhoZGEQ1V+8+qSQf8UOTeMki/bts4yOcOKUZ8E4hQrtanfl/6e1rRVokabw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1873.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 15:55:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 15:55:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Eddie James <eajames@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: KUEP broken on FSP2?
Thread-Topic: KUEP broken on FSP2?
Thread-Index: AQHZ978R6EU4rs4G8UK8Ora/CnKi+7A8OoMAgACtlICAAAORgA==
Date: Fri, 6 Oct 2023 15:55:49 +0000
Message-ID: <ea34f1f6-7b40-06e7-5b76-1ae08440375a@csgroup.eu>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <11fda331-f3b8-57e2-1073-b6b2b40deea5@csgroup.eu>
 <e2e0caaa-571c-f131-1697-00b218c6febe@linux.ibm.com>
In-Reply-To: <e2e0caaa-571c-f131-1697-00b218c6febe@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1873:EE_
x-ms-office365-filtering-correlation-id: 0dda62b3-464f-44ad-8bbf-08dbc684b62d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  C0rqrCI+IVAV/C31oSjQJre0h0hZBV6zRSTiKNLCRApCUm8+4eqjDimfFoP9N1Fa9o1TcuqMyBbeWON8iTB/I/x9ziOqf3mKtavgTsuzwNrCKSXYJFd0sBPwRxKleooydEC1I/YeuJUGxpUitm7M2DvCZ+wAyFkoF8rgBo2WvdazsXR0iJ2FkZygDBuCNf4Tgx3i/vEDyVxLZpPLfi+4D+DawHEvFe9fGUnMdnroeLtrea2ZCNGajVxhUsEPqmrWcotX8pEwR2BAAp4LsI8B2CG+MXMtTvtrPuGqsVxrs6jDzltxHtSZcPPs9p26BuAhX5TlgVvoPPByW6w+jMqgdFIXtwK83iNuiTf5tsk54o1slP6PRwCSu31Kjh7d/lp//Ui2fYcmOyWT5vLP9lVjKXm2UogNOHroNMiwNvRUbvnp5v0TTTj6x13Xtswkc+75rHnk7oOYAlJ+gacAkz4zxW8kUYgWej/Nxg9CTYVLWphzXCAT69C0mh/vBb1KXqYrfdlfOhXYislJddC8Nh9Egk57HeQF6yCpIHGgx7bQJ2FevJt0tCx0QTk34ieQLfYyQazcfD/fttznZX2LhYfTLWRwprjGMamdG+sRgXBXbPd71hYKCwplaVW+A+6UyX5TNXGSj+yzuFFO4fiXW9BNIGHy6kjCSvn720+KZWbaLsY8l42pyYgAOZIQO+KTQiFq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39850400004)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(6506007)(45080400002)(53546011)(6486002)(6512007)(478600001)(71200400001)(122000001)(38070700005)(86362001)(31696002)(38100700002)(316002)(41300700001)(2906002)(83380400001)(2616005)(66574015)(26005)(36756003)(64756008)(54906003)(44832011)(66946007)(66556008)(66476007)(66446008)(5660300002)(76116006)(91956017)(110136005)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eEtPeFRSTTBnUFNkVWZJV0NJWWx4VjBKalkvQi9oS0NFNWZkVGFBTldVSFdp?=
 =?utf-8?B?MGxRK1QwaGJUL2NUNlpoc042MHYydWQxNmJHOTI1WUhxanlLend0Rmo5UWhy?=
 =?utf-8?B?N1BhZ20zVUFic3JIRzZibnZydElXSjVNTWN5TXdPT3VJTW1nRU5zWlgzS3J0?=
 =?utf-8?B?NkxENHNzQUZVcUhsSE90cTBHUjZlSGF3aTVXeE5MdCtFR010RURtZHBsNkxk?=
 =?utf-8?B?TEpnVlJrb3Z2S3IwWWJUbVRVa1FCQ1VQWjdvZlM5K1F3UjhvWWdnTEEySzBx?=
 =?utf-8?B?aE0yRFNwQTJsWHNZR1lZUUQ3d0g0aUMvb21ROG1RZHpVVlB0cDVLUEp5ZzJy?=
 =?utf-8?B?NHhHa2wyaHlrUmdvRkQ0OTQ5K1VmellJTllOeld2Zm1BajlBZWJ1MkJGa0pS?=
 =?utf-8?B?RnJadHFUSEVFNFVzMnpwcHVvaDR3OU5NY0MvTjBqNFRWU2hVVGc4REVkYmV4?=
 =?utf-8?B?SFNINEZhM1JjR1IvMjk2UmVMNThaVXVSSFIyZFJtTjZudm4xOS9EYno4WGt2?=
 =?utf-8?B?ZXBvdnpJYU1kRkw3aWRRNE1CVEFjWnJYWWc4OWdkcE5NaURyT21vYzNPbTNF?=
 =?utf-8?B?Wk5hbzVQQWdNSU5UQUV3eHk2Ui8wTVh2d3dFUjFhNFQ1aU5ucHVsOEJaODNm?=
 =?utf-8?B?UXZaUUpNU1RwOUVnQ0dCWnlUUDlZdVRlalh2S2x3MWFoNCtSWUs3QmZoOU52?=
 =?utf-8?B?dEUxME12ZytkWjdZS05QRE56aG9sQW9nN281QjJUYjRRYkVNbDhTQ3dlUVFL?=
 =?utf-8?B?MmpKSkRBQTNoSW1DRXRLTjNPTlA4TkVJWXJaeHlMRzRCWkZVYktMUkhVUFBw?=
 =?utf-8?B?N1lXcVZ2QkEwRkU0QzZrZUpyZURxZThhZEI2WU56VWMxb3B5QTlmZ3I1OFhD?=
 =?utf-8?B?bXB4dDdITlk5V0pQTExkRVdWUkFyU0Y5akZwSTdyZjVFamM5VkxkNWtjcXBu?=
 =?utf-8?B?T3NEaTJML1FlaW9UN2ZKVHozTmtjWXdoZDRkRHRmRUFoVFJnNWNZa09HK3Q3?=
 =?utf-8?B?NUJLWnFNQlpHRlBmaSt2WHpkeWxqU1lzSjBqS0RZc2RXME1VeGt2dzRHTHlB?=
 =?utf-8?B?MkM3T1VPb3kreDB0K0ZxZk42UzFBZGtxMko1cUJ4a3hJNk1BSzhyeEs0enZ6?=
 =?utf-8?B?SFdQZVNMV3luVXVieUhRbEt4VkVObVp3TXdTU0VYWm9QeTZBMDdvVVJ2V3lm?=
 =?utf-8?B?WjZPd3dUcUFveHBrWDVZQk51N0V0SUhjeU94VWZTK09meDZQMXpqbkZLU0Z4?=
 =?utf-8?B?ZDhid0Rha2dJZGN6eitDcmMzOUpjclZIOW1aU05Rak85UDZBaDN4MlJ1VElq?=
 =?utf-8?B?c1pPUU5sTTFsbUNydVZROXRsNHE3QUorTHhIckw4Y2RHdFBqSHZRcGVIM1JU?=
 =?utf-8?B?eE1PV0ViS0kyRkxPOTA4L0gwbjBxNSszb3V5aFAyb09WZTAvbG9ZVWxBRk96?=
 =?utf-8?B?U0dPLzQzN2YzQTFpaHZRZWtweDZ4YlZkT1JyeHl4ektnSG45aWI1WDN2VDFu?=
 =?utf-8?B?MmhQZ2ZTZHc4c3dCSERib0dKcU1HblFudElqTjZkRHUzdTFOaythTlZEVlZL?=
 =?utf-8?B?ZjVOVm92bHU2MFRJcUZGOEc1czFuSTBsZkhjaFEyRDdSUVR2bVRGbkc4MHVI?=
 =?utf-8?B?TkFlcEFLaDBaWVExRGlwWjBsOStCMEhBV09hYnVLdktNWVJXTDFmd2Q4OXk0?=
 =?utf-8?B?L2NjSzlseXhPR0x0eHFsUDEwNnI5WTdHa3pMeWU2ZW00ODdUVEllTGhOd1p1?=
 =?utf-8?B?MGpBUXd1Qzd2cmsxWEd2UjI4cXNBdWEvL2RKZEIrSTlyOHpzelkxclIzSUdS?=
 =?utf-8?B?UThDN1VLbHF1SGJzSXB3Mk5JNG5FU2NCdnQ2UitkRlJxL2l5NjJvOG9ISHVK?=
 =?utf-8?B?ZExSQkZacVk2VEl6ZTJ1ODV3aHVlUTdMSEpnc1Y3VW1zNzMvMWJlZFRiQ3hL?=
 =?utf-8?B?VnNad0xpanVuWHRjVURZQ2FPR0lzSUwxaWZCUTFJNU5tOE1KRnJyL0l4OHV2?=
 =?utf-8?B?aGVjYzh0TkJmbXA5N0F3Nm1xejVGWm5ZeW9JMmVma2lxai9QaFU1cndHVVFo?=
 =?utf-8?B?WUdYcFdwTXBZd2NUbTNqeFgyV0FvTDBlMFpMeEhHZFlMSmwvZy9iUHp6ZWcw?=
 =?utf-8?B?dXN4Mm1RdUN6cjZJUzByeWVuOEdjeDl1dkc4ZGcyMk9LS3Nhdjh6SEdsTHFX?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDB1D78C16CBE54FAC75EEB99B11EBA2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dda62b3-464f-44ad-8bbf-08dbc684b62d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 15:55:49.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VsZP1B3+cpbcFHAmA4ZhtQPiHI5tGVgxhaaTQp6Vazt1bzOfWED0337ij3pO6Jc+qfR7HqqTrkU5bMJDqbNX7HkOZU2E2VSHeHXPM9U8yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1873
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
Cc: "paulus@samba.org" <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDA2LzEwLzIwMjMgw6AgMTc6NDMsIEVkZGllIEphbWVzIGEgw6ljcml0wqA6DQo+
IA0KPiBPbiAxMC82LzIzIDAwOjIxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4gSGksDQo+
Pg0KPj4gTGUgMDUvMTAvMjAyMyDDoCAyMTowNiwgRWRkaWUgSmFtZXMgYSDDqWNyaXTCoDoNCj4+
PiBIaSwNCj4+Pg0KPj4+IEknbSBhdHRlbXB0aW5nIHRvIHJ1biBsaW51eCA2LjEgb24gbXkgRlNQ
MiwgYnV0IG15IGtlcm5lbCBjcmFzaGVzDQo+Pj4gYXR0ZW1wdGluZyB0byBnZXQgaW50byB1c2Vy
c3BhY2UuIFRoZSBpbml0IHNjcmlwdCB3b3JrcywgYnV0IHRoZSBmaXJzdA0KPj4+IGJpbmFyeSAo
bW91bnQpIEkgcnVuIHJlc3VsdHMgaW4gb29wcy4gQ2FuIGFueW9uZSBoZWxwIG1lIHRvIGRlYnVn
IHRoaXMNCj4+PiBmdXJ0aGVyIG9yIHN1Z2dlc3QgYW55dGhpbmc/DQo+PiBJIGNhbid0IHNlZSBh
bnl0aGluZyBpbiB5b3VyIGR1bXAgc3VnZ2VzdGluZyB0aGF0IEtVRVAgaXMgYnJva2VuLCBjYW4g
DQo+PiB5b3UgPw0KPj4NCj4+IFdoYXQgSSBzZWUgaXMgdGhhdCBrZXJuZWwgdHJpZXMgdG8gZXhl
Y3V0ZSB1c2VyIG1lbW9yeSwgd2hpY2ggaXMgd3JvbmcuDQo+PiBBbmQgS1VFUCBwZXJmZWN0bHkg
d29ya3MgYnkgYmxvY2tpbmcgdGhhdCBhY2Nlc3MuIFRoZXJlIGlzIG5vIGNhbGwNCj4+IHRyYWNl
LCBzdWdnZXN0aW5nIHRoYXQgdGhlIGtlcm5lbCBoYXMganVtcGVkIGluIHRoZSB3ZWVkLg0KPiAN
Cj4gDQo+IFJpZ2h0LCB0aGUgZnVuY3Rpb24gd29ya3MgYXMgaW50ZW5kZWQsIGJ1dCB0aGUgZmFj
dCByZW1haW5zIHRoYXQgSSBjYW4ndCANCj4gY2FsbCBhbnl0aGluZyBpbiB1c2Vyc3BhY2UgKGV4
Y2VwdCBpbml0KSB3aXRob3V0IHRoZSBrZXJuZWwgdHJ5aW5nIHRvIA0KPiBleGVjdXRlIHRoYXQg
bWVtb3J5LiBJIHNhdyBLVUVQIGluIHRoZSBjb21taXQgaGlzdG9yeSBhbmQgaXQgc2VlbWVkIA0K
PiByZWxldmFudCwgYnV0IEkgY291bGQgY2VydGFpbmx5IGJlIG1pc3Rha2VuLiBDYW4gYW55b25l
IHRoaW5rIG9mIA0KPiBhbnl0aGluZyBlbHNlIHRoYXQgbWlnaHQgY2F1c2UgdGhpcz8gT3IgaG93
IEkgY2FuIGRlYnVnIGZ1cnRoZXI/DQo+IA0KPiANCj4gSSB3ZW50IGFoZWFkIGFuZCByZW1vdmVk
IHRoZSBjb3VwbGUgb2YgbGluZXMgb2YgYXNzZW1ibHkgdGhhdCBlbmFibGVkIA0KPiBLVUVQIG9u
IDQ0eCBhbmQgdHJpZWQgYWdhaW4uIE5vdyBJIGdldCBhIGNyYXNoIGluIGxvYWRfZWxmX2JpbmFy
eS4gTklQIA0KPiBpcyB0aGUga2ZyZWUoZWxmX3BoZGF0YSkgYW5kIExSIGlzIGdhcmJhZ2UsIHNv
IG5vdCBlbnRpcmVseSBzdXJlIHdoZXJlIA0KPiBpdCBhY3R1YWxseSBjcmFzaGVkLi4uDQoNCldo
aWNoIGNvbmZpcm1zIHRoYXQgS1VFUCBpcyBub3QgdGhlIGN1bHByaXQuDQoNCkJ5IHRoZSB3YXkg
d2hlbiBib290aW5nIGEgYmFtYm9vIGRlZmNvbmZpZyBvbiBRRU1VIEkgaGF2ZSB0byBwcm9ibGVt
Lg0KDQpBcHBhcmVudGx5IEtVRVAgZm9yIDR4eCBhcHBlYXJzIGluIEtlcm5lbCA1LjE0Lg0KDQpE
byB5b3Uga25vdyBvZiBhIGtlcm5lbCB2ZXJzaW9uIHRoYXQgd29ya3MgPw0KDQpDYW4geW91IGNo
ZWNrIDUuMTQgKHlvdSBoYXZlIHRvIGV4cGxpY2l0ZWx5IHNlbGVjdCBLVUVQIGluIHRoYXQgdmVy
c2lvbiwgDQppdCBpcyBub3QgZm9yY2VkIHlldCkgPw0KDQpPbmNlIHlvdSBoYXZlIGEgZ29vZCB2
ZXJzaW9uLCB0aGVuIHdoYXQgYWJvdXQgYSBiaXNlY3QgPw0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+
IA0KPiBUaGFua3MsDQo+IA0KPiBFZGRpZQ0KPiANCj4gDQo+Pg0KPj4gQ2hyaXN0b3BoZQ0KPj4N
Cj4+Pg0KPj4+IFRoYW5rcywNCj4+Pg0KPj4+IEVkZGllDQo+Pj4NCj4+Pg0KPj4+IFvCoMKgwqAg
MS4wNDI3NDNdIGtlcm5lbCB0cmllZCB0byBleGVjdXRlIHVzZXIgcGFnZSAoYjdlZTIwMDApIC0g
ZXhwbG9pdA0KPj4+IGF0dGVtcHQ/ICgNCj4+PiB1aWQ6IDApDQo+Pj4gW8KgwqDCoCAxLjA0Mjg0
Nl0gQlVHOiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBpbnN0cnVjdGlvbiBmZXRjaA0KPj4+IFvC
oMKgwqAgMS4wNDI5MTldIEZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4YjdlZTIwMDAN
Cj4+PiBbwqDCoMKgIDEuMDQyOTg2XSBPb3BzOiBLZXJuZWwgYWNjZXNzIG9mIGJhZCBhcmVhLCBz
aWc6IDExIFsjMV0NCj4+PiBbwqDCoMKgIDEuMDQzMDU5XSBCRSBQQUdFX1NJWkU9NEsgRlNQLTIN
Cj4+PiBbwqDCoMKgIDEuMDQzMTA2XSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4+PiBbwqDCoMKgIDEu
MDQzMTQ5XSBDUFU6IDAgUElEOiA2MSBDb21tOiBtb3VudCBOb3QgdGFpbnRlZA0KPj4+IDYuMS41
NS1kMjM5MDBmLnBwY25mLWZzcDINCj4+PiAjMQ0KPj4+IFvCoMKgwqAgMS4wNDMyNDldIEhhcmR3
YXJlIG5hbWU6IGlibSxmc3AyIDQ3NmZwZSAweDdmZjUyMGMwIEZTUC0yDQo+Pj4gW8KgwqDCoCAx
LjA0MzMyM10gTklQOsKgIGI3ZWUyMDAwIExSOiA4YzAwODAwMCBDVFI6IDAwMDAwMDAwDQo+Pj4g
W8KgwqDCoCAxLjA0MzM5Ml0gUkVHUzogYmZmZWJkODMgVFJBUDogMDQwMMKgwqAgTm90IHRhaW50
ZWQNCj4+PiAoNi4xLjU1LWQyMzkwMGYucHBjbmYtZnMNCj4+PiBwMikNCj4+PiBbwqDCoMKgIDEu
MDQzNDkxXSBNU1I6wqAgMDAwMDAwMzAgPElSLERSPsKgIENSOiAwMDAwMTAwMMKgIFhFUjogMjAw
MDAwMDANCj4+PiBbwqDCoMKgIDEuMDQzNTc5XQ0KPj4+IFvCoMKgwqAgMS4wNDM1NzldIEdQUjAw
OiBjMDAxMTBhYyBiZmZlYmU2MyBiZmZlYmU3ZSBiZmZlYmU4OCA4YzAwODAwMA0KPj4+IDAwMDAx
MDAwIDAwMDANCj4+PiAwZDEyIGI3ZWUyMDAwDQo+Pj4gW8KgwqDCoCAxLjA0MzU3OV0gR1BSMDg6
IDAwMDAwMDMzIDAwMDAwMDAwIDAwMDAwMDAwIGMxMzlkZjEwIDQ4MjI0ODI0DQo+Pj4gMTAxNmMz
MTQgMTAxNg0KPj4+IDAwMDAgMDAwMDAwMDANCj4+PiBbwqDCoMKgIDEuMDQzNTc5XSBHUFIxNjog
MTAxNjAwMDAgMTAxNjAwMDAgMDAwMDAwMDggMDAwMDAwMDAgMTAxNjAwMDANCj4+PiAwMDAwMDAw
MCAxMDE2DQo+Pj4gMDAwMCAxMDE3ZjViMA0KPj4+IFvCoMKgwqAgMS4wNDM1NzldIEdQUjI0OiAx
MDE3ZmE1MCAxMDE3ZjRmMCAxMDE3ZmE1MCAxMDE3Zjc0MCAxMDE3ZjYzMA0KPj4+IDAwMDAwMDAw
IDAwMDANCj4+PiAwMDAwIDEwMTdmNGYwDQo+Pj4gW8KgwqDCoCAxLjA0NDEwMV0gTklQIFtiN2Vl
MjAwMF0gMHhiN2VlMjAwMA0KPj4+IFvCoMKgwqAgMS4wNDQxNTNdIExSIFs4YzAwODAwMF0gMHg4
YzAwODAwMA0KPj4+IFvCoMKgwqAgMS4wNDQyMDRdIENhbGwgVHJhY2U6DQo+Pj4gW8KgwqDCoCAx
LjA0NDIzOF0gSW5zdHJ1Y3Rpb24gZHVtcDoNCj4+PiBbwqDCoMKgIDEuMDQ0Mjc5XSBYWFhYWFhY
WCBYWFhYWFhYWCBYWFhYWFhYWCBYWFhYWFhYWCBYWFhYWFhYWCBYWFhYWFhYWA0KPj4+IFhYWFhY
WFhYIFhYDQo+Pj4gWFhYWFhYDQo+Pj4gW8KgwqDCoCAxLjA0NDM5Ml0gWFhYWFhYWFggWFhYWFhY
WFggWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFgNCj4+PiBYWFhYWFhYWCBYWA0K
Pj4+IFhYWFhYWA0KPj4+IFvCoMKgwqAgMS4wNDQ1MDZdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAw
MDAwMDAwMDAgXS0tLQ0KPj4+IFvCoMKgwqAgMS4wNDQ1NjhdDQo+Pj4gW8KgwqDCoCAxLjA0NDU5
MF0gbm90ZTogbW91bnRbNjFdIGV4aXRlZCB3aXRoIGlycXMgZGlzYWJsZWQNCj4+Pg0K
