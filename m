Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EEC569DBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 10:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldqjv3FVDz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PQRjwF51;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PQRjwF51;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldqj83MDPz30Hf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 18:44:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hovGzGWBBdwod0kaiLhTmW5Q0mteixu5PZxaw+4CgjY+LH2b1yvpDhaRuOJ4SttJq9cx0AFLJXSLpmXBE/I5g+jMszqMKLfjpjZg2dKL1mWEKXdNGKSSt2pBspYwgfrY7JfglHbxmtqxdR/J5DuukAirlUxQiBZ0rqqRP2TJgDLCcZStz6BN6ZaLEAJ0b1oNpIdcOqoNyiAExPHVfq8grIcExbfexbVVS6GoBZIuEbek+q+9fuWdtFv+eMP9XoAvRyY8LXGvMvJ2vQd6fqSSpxADfApffH8qEiUZR6/+al6I9yE5RxL8tK3x4dgqEJNzbN/5U09NlslIQeJWPJuHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5brghKDHvxTVW1BnyQErKj8lex9PwDPTKmbxjtx99jY=;
 b=OKnumhsNe+qx5YJuOhW5HswMY5PH23+ZwSx8hhJ79pBitaYiv5lUiw+lOKITf6P7x2Fs9Ct6cTochEDhbcjU48rk9ZeMVrlcOJdfgBq0PsrQDzpSs6Eqwd994vSNExauvUNuv7n5ERDQVQcnh7tEyyQVKwd28Y2IQwJ3sKXEfroeAA4tChtHbHR+0XPgloOXTpq2hnbXeGx+NZIVTDjydbBZaClznftrEsgT2RQbQ2GWoosXiTtI1UA2IPvnfHgETSS5sC7DiM5NDMW1M8mvOc1O4Ckutn62Pgi0uGtbAC3f+7RGZmTC4LQ1hoW3VY51tLUXhVclMZ7pUQZ4jmdy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5brghKDHvxTVW1BnyQErKj8lex9PwDPTKmbxjtx99jY=;
 b=PQRjwF51tsyoLEDSu6uNumZkqFQ5Zfq0BTUIb8fTmUIasYEPDrxpGZFJVNi2ROHLDy7gx63HCrQ9TF5DcMLz5xeBOedH62zoRBP0ZFGYgF2yiODl5+0562VWgFWyY/pwX7cyZ+Vd6HSAPaJlUU7rwxomvrpcGbsEHXw1mWh8t1y6uxY6NyF7p8RwOWTDb77oMGfKez7ntTnskPeRbLDKlN3Oi1vXwFFORwwbX7cm9CkBU20hEIi7VJogTu01jjSA/8k4ezYiXxDoPb+oP4POCMPXKK03tGPS4lWd7s2UqOx+0FK0pdqUZOeOj0TU/jV2bQEocuD9s+2jdB+fw7UN7A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 08:44:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 08:44:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/3] powerpc/platforms/83xx/suspend: Prevent unloading the
 driver
Thread-Topic: [PATCH 2/3] powerpc/platforms/83xx/suspend: Prevent unloading
 the driver
Thread-Index: AQHYkckEGGP0+/UiB02gg+4AjeYvhK1yl/OA
Date: Thu, 7 Jul 2022 08:44:26 +0000
Message-ID: <1e71846f-41c3-95ce-bf49-d77c9b173034@csgroup.eu>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
 <20220707061441.193869-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220707061441.193869-2-u.kleine-koenig@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f328b942-6af3-45ea-b1b8-08da5ff4e5fc
x-ms-traffictypediagnostic: PR0P264MB3191:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2+xGmBpsmDGiJJXsVCETaFji/kYptza80pVYbUM5101E82hjI/2oVNOjJQjb2fYgcqUgOVrsgq893UqUcQAUTIbwOFIbSCA7ZqpAgVbzl7102ohd5QYttoR1yNMl2lUPi9KMOAvuf3ur/jOAvRJSUXseuvFJCbxOrddt+G01AI/NDOZW0VsodHnvkWIiMWnmGvE8zWejeQRzyN0PGrrVcs+Qddvq0yMAtgXzGutDacnU2VMqPw65nA8DUlbJ67BC+p1ddHojk+YJf2aS+CVwRXsTnDXBctpE7LQsel0BzOTtFTXboz+GwS1ZRFOJuHLCc6COHiY4j8UyY9UUTuYO2xVZIS/U6yI6jlr6t0VuwkRKqz1mhiwytiXT8VWglhmjXUGp01njV4KDwODnmVNpXvrtJhJTeiykxm69aQoMpyP671wwffbX79NT8Yc64jkRVLZkqGNHnzMoM0FqNRbHEU9EWgohTOI2RSOE+c/mKfw7wGCYvLwHcJR7I8yw3gRhsy0qWAlmO4qDC7RzLdofuzI/hfs4Uy61ux+vtHNy5wrKU8UEneb/oiB+gipQBTOG/lqbo+81tDpW4k60WgM3/601mRrGlg4HYpsQyV5Kev6opK89rpKgDZ7qgNIFsCLjZcHMYdFIxMbOufGBZxECAuuzrjPt5EYTjWQeu2EHsf/Y5b2njpXMg7UhazOquFKcvjxdNJKmdFRdmE9720PoK3KZMKm5d/Oj/OMQoXjCQFDnHhEl/7Pw8S0qvFfARj2z4c8BW6g8MZflLMrEAEQQRQiErsVL6Z76HFbwSTWEEi5x2UYBjNoO93odkT/z3zsbGENhN4YUKVx+S4eIs/m12TowAt3Jxwvo2bluFKg8enU1x5ksy8jHqJN2tOkSUjZU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(66574015)(186003)(71200400001)(8936002)(44832011)(2616005)(6506007)(15650500001)(36756003)(86362001)(5660300002)(31696002)(110136005)(83380400001)(26005)(316002)(54906003)(31686004)(6512007)(2906002)(6486002)(478600001)(66446008)(41300700001)(91956017)(8676002)(64756008)(66476007)(76116006)(66946007)(66556008)(4326008)(122000001)(38100700002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NERTSnZsS09DVy9GMFNYSTlQVis5bnh3NS91ejdtbC9jc0t0MVFQaEpXbXh3?=
 =?utf-8?B?UFVZVGE3eTVLTXdUQjJDUE1oVFZJUy9HYXFteEFoaTE5SHNHbzc1c2Z2ampq?=
 =?utf-8?B?a0d3dmNHWGF3ZWlQRitwN0pSSGRremhvQ2ZaUHVZNUhST2k5bklVanB4b29U?=
 =?utf-8?B?bEw0bU9hYWMxSGQrWXlIY1ZFNk42YlBudDErZnltK3FQbjRvaExRNVErWUpG?=
 =?utf-8?B?allBNmNuT3Q2VFB1VjZZRHhxT0tjRDVBZ3FmSG1yUys4cS9Yb1Rpc29IMmZm?=
 =?utf-8?B?Yy9md09HVUlXUE0xTWxBSU5xNTIzMUNSdytUblgvNXdQWHIrNmIwcWo3T0Zq?=
 =?utf-8?B?dlg2WXdBeE1mWVNzZldJT1ZrdDA1b0o5M2k2czRJVTA0aXNGcXFtejFBR3hL?=
 =?utf-8?B?YStuZ2xCSVZzMm9TYk55ZU9QM2thbHRiTTZiNTdZTUMyQmlncFBYN1NySW85?=
 =?utf-8?B?S01iMVJsZ3hlOWFna25wQ0htRFg4UDNLQXUybDJOSVBQMStWd0NlQndOZmo2?=
 =?utf-8?B?M3p2VVFUTTJ6VEpiZ2J4bHAxN2NMMjFsV3hIM3lhUjNRTFdaRUdvcWFEMU85?=
 =?utf-8?B?SW5GaGtwamhieGp4Z1FJRXkraDd2akVsR3R0b0xlK2tIdUxsN0JmUWs2eVBC?=
 =?utf-8?B?ekxDcTlLSzY5eFF2dW9waFVsL1g4bTgxbUVXQVNwM0ZHNTFUcE1kUlkwSFo2?=
 =?utf-8?B?ZmxuZC9ROXBNM0hsQkUyUy9DenBrMG5uU1pxQ2ZmNGJaemZBOWJsanZ1c1R4?=
 =?utf-8?B?dG5zdjJaU21yZkNRRWVVRHgzcUw3QzN3d0wyRmhrWXl4dzdDREMzcmUzQW41?=
 =?utf-8?B?WFRLRWpsRnliSEF3Z0dRQzRIbThtcjAyRnhOYnBVQlZqVUt3MHRvWCtFQTMr?=
 =?utf-8?B?SnUwSmptMk5FZEc3cGt0eEt4aGp6ZWs0TTJkOHZtVzEwd3NkMElPZ2ZldG5i?=
 =?utf-8?B?aG1ERXc2NWZtYnhCemQrSnhERjhYQmt5UDRubkxpbXEzTFdsMXpyVzlrRUZo?=
 =?utf-8?B?dVpuMWxmejc1K2cwM0N6SUdCM0Z0YlcrSWVWazlhbW9LT0dha3QxZWJIa1gz?=
 =?utf-8?B?Rm5yTFk2WjIvUEJzQTJFMVFESW5wWGEzdFhQTDNmSkJrM09SR0F6aGtRL2hI?=
 =?utf-8?B?bmhnTDJEeEZkVzlIdXNhaHQ0MUVVM0d4V2VwWmQzZTdRVmdOcFZTY3JwZVBG?=
 =?utf-8?B?M3VWWTNrRmg3bmNidWgvamJmaVVzVVRFb0Z5WW1LdXAwNlN5em1xcGc3N2VY?=
 =?utf-8?B?SUc0S0N2d3BmeW1Md2Vsd0diYWtlcmVQNDBGcEo5SHhJRjU3UXJHdWpzQm54?=
 =?utf-8?B?eStNMEI4UEhkRmdNWlFrWnJCQ2lUYkU5MG9hNFpDcGR6eGN6MU55TjFtenVk?=
 =?utf-8?B?eWRmUTZqdmtNZHUyaFRpOUZCbmJOVmpyUXYwaHEzb3FPRHFSWkU4LzlsQ3I5?=
 =?utf-8?B?OHRLbGt0Z05FRjI2QmJDU2g4QmFwczdjK1M4Y016RElMV2hXMElnbTlVSTFa?=
 =?utf-8?B?bkhSK1lTVUJTc0pnZUNRVWUrUG91ekxQVjNqWGNueXdYK0tLTmNoYWZjdVFY?=
 =?utf-8?B?d2d3SjJLZ25SSkhTWDdBTUJjS2lXQnY1QlhZRnlUdHBtUUd0a0NjUTMydFlY?=
 =?utf-8?B?ZnRzQ0UxZlNQRHRNYUd5WGJUcWliL05tenFaYjAxdUh5TFI2clVhRm1MeVpk?=
 =?utf-8?B?TG5GVmpXU2FyY1IrTHpaZWZyTy8vcHVqRUdSYmFDVkJFQmk3N3dheHBzdSs5?=
 =?utf-8?B?UmJSdEY1OU9qUHVCUG1FaEV6MEQwNVlMb3B1SUVuQ2pWYVVGRG9ZbWlld2FZ?=
 =?utf-8?B?VEU3bVprMHZaL2tNRSsrOFZ5VTBLei84clNrVkQvdzBCQkpSOGVxN08velYx?=
 =?utf-8?B?MW1HdG5CSXdFS2tueFFyOFQ0aS85UEpwcWo1R2w0MDlsV01tblJoRWQvTFJK?=
 =?utf-8?B?M2lXc0QxemsyZ05FbCsyd255Unh4YWVMVVZhSlFsMENOd21lZGFjZlp0WVdt?=
 =?utf-8?B?b3VRMjkxbzN2SHplQVl5M2xWWkhIS3k4aTJzdU5WK3hXWmVLakJqWnFaSm9r?=
 =?utf-8?B?T0k2SDNXZCtIZzJNeVlXemQwVW1haXZ3blMzYjByak5uQ1NuSHBXdXkrWWlS?=
 =?utf-8?B?a2pESDh5dE93NWRDQk1SZExqNWNNNER1SG9YaHd1VmJnSnJpTDRsNnJ6Q2Nh?=
 =?utf-8?Q?7QBqMqor83/FeuhcmYqWWXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C64E28EAAA649840BFD0A5EF3F43D140@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f328b942-6af3-45ea-b1b8-08da5ff4e5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:44:26.1079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5mG4gcgXauHkBHwvZB6yw7o/xR4xppzh7UfMPiUbN+w5WoR5sh3EIpDxKh9oooyx0krp1mRdNWtFWDQ/4lvIHCetbO8M+cUQzYfZkr8S/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3191
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
Cc: "kernel@pengturonix.de" <kernel@pengturonix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjIgw6AgMDg6MTQsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IFJldHVybmluZyBhbiBlcnJvciBpbiAucmVtb3ZlKCkgZG9lc24ndCBwcmV2ZW50IGEgZHJp
dmVyIGZyb20gYmVpbmcNCj4gdW5sb2FkZWQuIE9uIHVuYmluZCB0aGlzIG9ubHkgcmVzdWx0cyBp
biBhbiBlcnJvciBtZXNzYWdlLCBidXQgdGhlDQo+IGRldmljZSBpcyByZW1vdmUgYW55aG93Lg0K
PiANCj4gSSBndWVzcyB0aGUgYXV0aG9yJ3MgaWRlYSBvZiBqdXN0IHJldHVybmluZyAtRVBFUk0g
aW4gLnJlbW92ZSgpIHdhcyB0bw0KPiBwcmV2ZW50IHVuYmluZGluZyBhIGRldmljZS4gVG8gYWNo
aWV2ZSB0aGF0IHNldCB0aGUgc3VwcHJlc3NfYmluZF9hdHRycw0KPiBkcml2ZXIgcHJvcGVydHkg
YW5kIGRyb3AgdGhlIHVzZWxlc3MgLnJlbW92ZSBjYWxsYmFjay4NCj4gDQo+IFRoaXMgaXMgYSBw
cmVwYXJhdGlvbiBmb3IgbWFraW5nIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgcmV0dXJuIHZv
aWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy84M3h4L3N1c3BlbmQuYyB8IDcgKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84
M3h4L3N1c3BlbmQuYw0KPiBpbmRleCAzMGI3NzAwYTJjOTguLjMwOWY0MmFiNjNkNCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84M3h4L3N1c3BlbmQuYw0KPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgzeHgvc3VzcGVuZC5jDQo+IEBAIC00MjEsMTggKzQyMSwx
MyBAQCBzdGF0aWMgaW50IHBtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZmRldikN
Cj4gICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW50IHBtY19yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+IC17DQo+IC0JcmV0dXJuIC1FUEVSTTsN
Cj4gLX07DQo+IC0NCj4gICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBwbWNfZHJpdmVy
ID0gew0KPiAgIAkuZHJpdmVyID0gew0KPiAgIAkJLm5hbWUgPSAibXBjODN4eC1wbWMiLA0KPiAg
IAkJLm9mX21hdGNoX3RhYmxlID0gcG1jX21hdGNoLA0KPiArCQkuc3VwcHJlc3NfYmluZF9hdHRy
cyA9IHRydWUsDQo+ICAgCX0sDQo+ICAgCS5wcm9iZSA9IHBtY19wcm9iZSwNCj4gLQkucmVtb3Zl
ID0gcG1jX3JlbW92ZQ0KPiAgIH07DQo+ICAgDQo+ICAgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIo
cG1jX2RyaXZlcik7
