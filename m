Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B364868A1E4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 19:23:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7kYT3bYMz3fBc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 05:23:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iMeMfMQb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e1a::60f; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iMeMfMQb;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7kXS6wNNz3f67
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 05:22:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPDz7tcAaSAVNokYL7P8HL76IkEcIZHzBV510+FqzaDpwJfjqTFB5tY8ySgQ++LDvy8Ixe++hK5ghhM7pdiG50Ab2OqVi+WsnyIwTqvH10XROvDV3sXQKOUwbPXIUdxycS3hq/ky5IQry9tk8dmTqJY72HR5dsFEDPe9AbAUUCVpythXje3SxNkPwttoadO7QCuVw+/5AA29+IBHhNfdpXmSSS6VEZW442TolZjYLVgdbMZd9xP8sFHMxDFs5YFm76hAYdHdoMHBEulUoC25PtJkH/QM0f2010Q2Dk6UavEsNAiOv5nTlW5Im65aXtbX3xhRcAISB18belyskTHndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhktJ5vup+pLgCvyY7owXYSJYsWJX3LnxQ0WuL9pbrk=;
 b=lOdIlaNazvErwtqK5N088t2oiLUfvT7Ph6PISRfchWJjAXiZ1ae2ntIf7V7Lv0KEpTlIWJNZWRwpvgq8AXRywf/1nXJ1NDbcISObUKev5ZSJvFpJzT3KhVKaYMbs3p40YIBCmfaKLYc2DZ66xDlEdpRHSOH04X5e0XP277OUkNDe9suYQxhVxuFpFOXq/nxFAwonzhDUNgubXzUi3YXM5DUHWyuTOoxI4u9SyxxOqfiluc1lJsbu4d9b2gUU28fL/09YzUp1RAnfhf1ApswEletf0X6zynpvp+MLrTVVap7gBsTWLuZe5bVkAaP88lDdrr4MMVKLKdsBtJfnmselxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhktJ5vup+pLgCvyY7owXYSJYsWJX3LnxQ0WuL9pbrk=;
 b=iMeMfMQb6tVEjd6C7kpEoK/MPEnhHfURfXiaecuA9B0JiIvi9iBESdrQaHZdT63+EEaGeVH+J+iRlYgaN8FHeoy/k7uJlfrHKH8KXy1G9k9qm9csovaK6+9H3l8w7YKmGo6+Z4QWGXxuhBq5xptPQbHXo3+ut4c/5bMguyaeJ/0tVH5GGufoE1gH3I+WPX3pBlXbJzdWI31YMdQbfXakV84wE+6PrxeM3zrKuZdbbGYwjSrjUoXaX0smJUD+yi/sV7DAZcip0wzuqz9NmjuN8MmAoOXUEaUgNpFb7U31z7ejv+slj6AuXktFmgK1Wy0Jjq0KSJqmPH6dQgp6S94TBA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2983.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 18:22:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:22:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Thread-Topic: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Thread-Index: AQHZMJAoHnrP29o+IEWPR5CDVAsvZa66AHKAgAAClgCAAGFkgIADLMUAgAAGiAA=
Date: Fri, 3 Feb 2023 18:22:08 +0000
Message-ID: <a0805df4-ebc3-0478-b9dd-0bd1f9d23b82@csgroup.eu>
References:  <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
 <20230201113155.18113-1-naresh.kamboju@linaro.org>
 <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
 <CAKwvOdnc_ggT_2FQQwq71PiDE_D1xxXXnB5iSWvvoa3pu7kMdQ@mail.gmail.com>
 <20230203175846.oczctwfr2jq7usze@pali>
In-Reply-To: <20230203175846.oczctwfr2jq7usze@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2983:EE_
x-ms-office365-filtering-correlation-id: 27baa751-f833-4b75-5907-08db06138f5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BqGwJj9D1xeKBXYqk1SrFl07CIBPdR2OA0Axt8DoYMGJvPYb6I2C0MMyfUXyDqggc9zka6Pckp4G9bY+ZVVGHTNm4K5KWPBIGDGMUPzmjK1i6AjQFHO+RI6ONxLLfji+lbmJT7eSRY3D/neJFphYyd3IBR75neMiwrw/9vFhhrxcw6nNGBQ9JHB447x+AXRXdH/fWhVLGzLcSXm3U+e1kVNNMmcg6SMDZ53oA29XIytcIwxiipDLwl5yzad21xpNIGWBxZBoJPOhKrqCIItZlsuYPTWOsfWFkOL0eo7G6TOBtzUItI/iP26tl/NP+KG8ImGPyor7cZ+RVJUOJ+x04g5CXgxscIjGgj55vR5bHC7wFRnaGfctj5XLcetJAzDu6eXacKoTDmyozWJ/taUbb8wGzmPkzFPP3MCUCtsAk4NCkdDSBxzIjzFnUHP8Ht4XlZQVK4kNeh39rS/c/Eef8ShhEL5+EP33Xfz3e4LCrEUj8XfeSqkLl3sKNTutRaI2s/0EXZzFQb7P+9+vBZ4Zvh9c3XRWT8RghCyqOLgAzqctTYV5ytUshlTPy3kHbGpKDUiw2IblqFAmXcdzVGswzLqy13gkzFiJO9KE/SCR4yUrkwwaCP4jh+DCJGX/cZ5ZsVIWc7TOHrRdQ5GJhUT/aWaQ+Svf0Seou2pn55pBLXFZObiAmQlBTlfnvx3kLF/rqEwKBSEZa7X/bP2rseD9bNlr0ryMFgWrOWNjojvalCNxtdx6U2imkvBLJcBhRcoUuFoo2Yy3gAKgom1fj2iWl6+5oXo2n9sQdgmRMYllXb8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39850400004)(376002)(366004)(451199018)(2906002)(5660300002)(44832011)(7416002)(38070700005)(31696002)(2616005)(86362001)(122000001)(38100700002)(71200400001)(53546011)(83380400001)(6506007)(186003)(6512007)(26005)(6486002)(966005)(36756003)(478600001)(76116006)(66946007)(66556008)(66476007)(316002)(41300700001)(31686004)(64756008)(66446008)(91956017)(40140700001)(110136005)(4326008)(54906003)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QVoxemFiMDltU2Q4cG1JT0YzNkZ1eERNbGRGOWVMRWptNUFHQmc0SEtKOUlW?=
 =?utf-8?B?OG5Zclk3SGVaanBGR01IM3A5dE01aU5tdCtvcllyRGU1OUxQYTBPZ2FLc3Ny?=
 =?utf-8?B?OVcrVEhhU1g1N3dGam5LbFBLdFJzdWMyZGJ1TEZvdXR2ZXQ3ckgzVDFmSzdV?=
 =?utf-8?B?U3F1K1RYd2VtTzFBWm1jRHBlbjlQN0t1ckFMVmpNQnhMbWRrbW1naGFTUWVI?=
 =?utf-8?B?NkZ1TWNocnJtQnlPa0xySG52QlZIYkhTZ0VHT2ZnT013OHREd0d2RlovQlIv?=
 =?utf-8?B?UUpvRWJsSEVNZlBSQ3p5aVA5RDltb2FRTFZFemFDTlJRRFo4cXhaZHdOMjhP?=
 =?utf-8?B?Z2pEUWpaZzdDVjA2WnZnN0VhNHJGOTd3ekZLWVVTbzB3djJTK3ZtTm8yN2dR?=
 =?utf-8?B?QkVFZUxqOTVaSFBwZTRBVGVUWjhSRXJZNTR1bzZNc1R1eDBreXRZTjdTb3ls?=
 =?utf-8?B?M2dRVXh4bklJSHB6YWdpVG45ZGRWb2RKV2lmeWlnNCs0ajNjd1pMRzRuem9D?=
 =?utf-8?B?M1VTQWpWY0gyTmtZVVAwZHljZ0tUcDh4Y25JekpaREF1T3dOT3J3cEFiRkVL?=
 =?utf-8?B?MUx5QTB2N3g4aXJsL2s2VjBENjNpRzFUYm9PellVTS8wa1hVOEpqeDVRQVNM?=
 =?utf-8?B?Ymk5MVU4YkNBY3UvMnFMbmdPS3NXeG5pSG81N2NtREExY1JNUGtQbWxwSHhY?=
 =?utf-8?B?NmpEV041OFdNeDdUQzZpdFJzZ1ZhdXlSaVFGVGU1eHJrWkdLVzFKOHBuYVBw?=
 =?utf-8?B?VGV3bStkMksreDZYR2xFbnd2VE52WnVtb1ZuOVRwaTFtNjdWOVJpVDN6ZFAv?=
 =?utf-8?B?ZjFuSGxUZndUc1RxMkk4UGw3WTJMaTkxaTMraFlBSTFXRS9mVXg3bzNuWnlp?=
 =?utf-8?B?b1VmdndzcVJ1Z2s3eWdSbFhQT2JhV0ZkOGcvK242OFdiL05FQjF3Uk56NVZR?=
 =?utf-8?B?MHJVZmRPK2xRdDZXNFlSYzNMc2FaTnVOWVN0VWxBQlViOGVZaGk3NlliZSt0?=
 =?utf-8?B?WkM2S3hLQnpRRmFCUXlQYW1Xc0JvN3EyYUE0Njd4YWE2Vk91RHZIT2VzOTcx?=
 =?utf-8?B?d0RZNU01NkZlYXY4aXdrL2VlSTFIZmhKZGZhaERBeXMzejVvV3F2d0VGa2l3?=
 =?utf-8?B?M052c3I3SXljZnJ6SVNtaW9Zc1REeXoyd21nR0hHaXFFQzQ1S2FXbWs3SGZP?=
 =?utf-8?B?ZWtGZDZuWG5MSi9EVkhQUExxczFFQy9ETFMzUVRkemw1YTlkdWpWM0ZMV2lk?=
 =?utf-8?B?ekJLd1dCa1hDN05yVUV4STViV0w5WmtvRWEvN043Y3FEVTgwOW5DdHo2cGpH?=
 =?utf-8?B?M3hVS2JWZWhXdGtnSG1IUnZYSFkraHczaityVlJZZFk1S0ZSKzc1VFgyNWlk?=
 =?utf-8?B?djRCU0dvZ294WFFvQnRMY2xhN3lYZHdoKzB4QXhCR1crM3JyVFluRi9GSWZV?=
 =?utf-8?B?Mk9pSHV4cHpabXcyRkdCSmpFaEV1dnJUdzY3SGZoTzlTU01COG1CbFdEeWhC?=
 =?utf-8?B?QnpTcXowQytJUDNDTEQwc2pWaTBrVUJETVltdFo0emtiaktkWGhNTU1PTS9z?=
 =?utf-8?B?WUdqek5ZeHZxdjF5TWR1aE5Vczgzc1RJNUwzT21ZaCtubzJ2OEt6RDFXTnlO?=
 =?utf-8?B?bFdrVEV3eHhvRmRmWTltVnVYWWhULzFwMHdqc0V3b0xrdXVUbWlIcmF0c2w0?=
 =?utf-8?B?WjNzSFBEcWlZc1J3Vyt1SUtuWER5c0tQdjdSajlWTnh3Y0RUNlVZaG41M2xl?=
 =?utf-8?B?Ri82d0Rxb3RISnpHSFRYVmc4RkIrWUVrbC9FVnV3bFYyejU5TlA0MG9rOE5y?=
 =?utf-8?B?cTZrd01TY3hJOTQwM1N5OVFmb1BTb00waVpuVVBUSi9pcktlQUlpMmFLT1Rw?=
 =?utf-8?B?V1V6WUxUdnIzSFB6Y1JCR1JTbWpOVXpjQjRIb0RTdEFYMDY3TWp4ZG1qYUlw?=
 =?utf-8?B?b0c0SVRnQ1JzVnZYbzZFNytjR3JSY3NjcTNRcGFWalc1bENUYnkrZmxNUTRs?=
 =?utf-8?B?blJ3a0lYZnNNenJZMzBwYVhCYmJIVkl6WmhBbnJiRXlMV1ZvaTJVN3dLT1hi?=
 =?utf-8?B?bnI0aXJpS0ZPQzBhQU5icVNyK0pHRDRNMXhPKzV0WnlwUUtCZVg5S2ROMSs0?=
 =?utf-8?B?bXp4OUtoSGVBcE40NGVad3VkWDdRTW1Wbmh0cFBtb0IwdEZUU3BFbHFwUG44?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42640977A5CAE5439F621C2A8CE25B43@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27baa751-f833-4b75-5907-08db06138f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 18:22:08.1993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 385abTx8HtLbClgec6bW1z0rXAqSGTsRl4YHuKOuyqfDv4EWsyz4j4aP7NV4zD4WJoWLJhv/eYm1/l5vbatW9pxJicu9aNpQaPnfVrS7IYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2983
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
Cc: "anders.roxell@linaro.org" <anders.roxell@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "qiongsiwu@gmail.com" <qiongsiwu@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "nemanja.i.ibm@gmail.com" <nemanja.i.ibm@gmail.com>, "nathan@kernel.org" <nathan@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzAyLzIwMjMgw6AgMTg6NTgsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFdlZG5lc2RheSAwMSBGZWJydWFyeSAyMDIzIDA5OjI5OjQ1IE5pY2sgRGVzYXVsbmllcnMgd3Jv
dGU6DQo+PiBPbiBXZWQsIEZlYiAxLCAyMDIzIGF0IDM6NDEgQU0gQ2hyaXN0b3BoZSBMZXJveQ0K
Pj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+DQo+
Pj4gTGUgMDEvMDIvMjAyMyDDoCAxMjozMSwgTmFyZXNoIEthbWJvanUgYSDDqWNyaXQgOg0KPj4+
PiBGb2xsb3dpbmcgYnVpbGQgcmVncmVzc2lvbiBzdGFydGVkIGZyb20gbmV4dC0yMDIzMDEzMS4N
Cj4+Pj4NCj4+Pj4gUmVncmVzc2lvbnMgZm91bmQgb24gcG93ZXJwYzoNCj4+Pj4NCj4+Pj4gICAg
IGJ1aWxkL2NsYW5nLW5pZ2h0bHktdHFtOHh4X2RlZmNvbmZpZw0KPj4+PiAgICAgYnVpbGQvY2xh
bmctbmlnaHRseS1wcGM2NGVfZGVmY29uZmlnDQo+Pj4+DQo+Pj4+DQo+Pj4+IG1ha2UgLS1zaWxl
bnQgLS1rZWVwLWdvaW5nIC0tam9icz04IE89L2hvbWUvdHV4YnVpbGQvLmNhY2hlL3R1eG1ha2Uv
YnVpbGRzLzEvYnVpbGQgQVJDSD1wb3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0bGUtbGlu
dXgtZ251LSBIT1NUQ0M9Y2xhbmcgQ0M9Y2xhbmcgTExWTT0xIExMVk1fSUFTPTAgdHFtOHh4X2Rl
ZmNvbmZpZw0KPj4+PiBtYWtlIC0tc2lsZW50IC0ta2VlcC1nb2luZyAtLWpvYnM9OCBPPS9ob21l
L3R1eGJ1aWxkLy5jYWNoZS90dXhtYWtlL2J1aWxkcy8xL2J1aWxkIEFSQ0g9cG93ZXJwYyBDUk9T
U19DT01QSUxFPXBvd2VycGM2NGxlLWxpbnV4LWdudS0gSE9TVENDPWNsYW5nIENDPWNsYW5nIExM
Vk09MSBMTFZNX0lBUz0wDQo+Pj4+DQo+Pj4+IGVycm9yOiB1bmtub3duIHRhcmdldCBDUFUgJzg2
MCcNCj4+Pj4gbm90ZTogdmFsaWQgdGFyZ2V0IENQVSB2YWx1ZXMgYXJlOiBnZW5lcmljLCA0NDAs
IDQ1MCwgNjAxLCA2MDIsIDYwMywgNjAzZSwgNjAzZXYsIDYwNCwgNjA0ZSwgNjIwLCA2MzAsIGcz
LCA3NDAwLCBnNCwgNzQ1MCwgZzQrLCA3NTAsIDg1NDgsIDk3MCwgZzUsIGEyLCBlNTAwLCBlNTAw
bWMsIGU1NTAwLCBwb3dlcjMsIHB3cjMsIHBvd2VyNCwgcHdyNCwgcG93ZXI1LCBwd3I1LCBwb3dl
cjV4LCBwd3I1eCwgcG93ZXI2LCBwd3I2LCBwb3dlcjZ4LCBwd3I2eCwgcG93ZXI3LCBwd3I3LCBw
b3dlcjgsIHB3cjgsIHBvd2VyOSwgcHdyOSwgcG93ZXIxMCwgcHdyMTAsIHBvd2VycGMsIHBwYywg
cHBjMzIsIHBvd2VycGM2NCwgcHBjNjQsIHBvd2VycGM2NGxlLCBwcGM2NGxlLCBmdXR1cmUNCj4+
Pj4gbWFrZVsyXTogKioqIFsvYnVpbGRzL2xpbnV4L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MTE0
OiBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLnNdIEVycm9yIDENCj4+Pj4gZXJyb3I6
IHVua25vd24gdGFyZ2V0IENQVSAnODYwJw0KPj4+PiBub3RlOiB2YWxpZCB0YXJnZXQgQ1BVIHZh
bHVlcyBhcmU6IGdlbmVyaWMsIDQ0MCwgNDUwLCA2MDEsIDYwMiwgNjAzLCA2MDNlLCA2MDNldiwg
NjA0LCA2MDRlLCA2MjAsIDYzMCwgZzMsIDc0MDAsIGc0LCA3NDUwLCBnNCssIDc1MCwgODU0OCwg
OTcwLCBnNSwgYTIsIGU1MDAsIGU1MDBtYywgZTU1MDAsIHBvd2VyMywgcHdyMywgcG93ZXI0LCBw
d3I0LCBwb3dlcjUsIHB3cjUsIHBvd2VyNXgsIHB3cjV4LCBwb3dlcjYsIHB3cjYsIHBvd2VyNngs
IHB3cjZ4LCBwb3dlcjcsIHB3cjcsIHBvd2VyOCwgcHdyOCwgcG93ZXI5LCBwd3I5LCBwb3dlcjEw
LCBwd3IxMCwgcG93ZXJwYywgcHBjLCBwcGMzMiwgcG93ZXJwYzY0LCBwcGM2NCwgcG93ZXJwYzY0
bGUsIHBwYzY0bGUsIGZ1dHVyZQ0KPj4+PiBtYWtlWzJdOiAqKiogWy9idWlsZHMvbGludXgvc2Ny
aXB0cy9NYWtlZmlsZS5idWlsZDoyNTI6IHNjcmlwdHMvbW9kL2VtcHR5Lm9dIEVycm9yIDENCj4+
Pg0KPj4+DQo+Pj4gT24gR0NDLCB0aGUgcG9zc2libGUgdmFsdWVzIGFyZToNCj4+Pg0KPj4+IHBw
Yy1saW51eC1nY2M6IG5vdGUgOiB2YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZTog
NDAxIDQwMyA0MDUgNDA1ZnANCj4+PiA0NDAgNDQwZnAgNDY0IDQ2NGZwIDQ3NiA0NzZmcCA1MDUg
NjAxIDYwMiA2MDMgNjAzZSA2MDQgNjA0ZSA2MjAgNjMwIDc0MA0KPj4+IDc0MDAgNzQ1MCA3NTAg
ODAxIDgyMSA4MjMgODU0MCA4NTQ4IDg2MCA5NzAgRzMgRzQgRzUgYTIgY2VsbCBlMzAwYzINCj4+
PiBlMzAwYzMgZTUwMG1jIGU1MDBtYzY0IGU1NTAwIGU2NTAwIGVjNjAzZSBuYXRpdmUgcG93ZXIz
IHBvd2VyNCBwb3dlcjUNCj4+PiBwb3dlcjUrIHBvd2VyNiBwb3dlcjZ4IHBvd2VyNyBwb3dlcjgg
cG93ZXJwYyBwb3dlcnBjNjQgcG93ZXJwYzY0bGUgcnM2NA0KPj4+IHRpdGFuDQo+Pj4NCj4+PiBI
b3cgZG8geW91IHRlbGwgQ0xBTkcgdGhhdCB5b3UgYXJlIGJ1aWxkaW5nIGZvciBwb3dlcnBjIDh4
eCA/DQo+IA0KPiBNYXliZSBsbHZtIGRvZXMgbm90IGhhdmUgc3VwcG9ydCBmb3IgdGhpcyBvbGQg
Q1BVIGNvcmUgYXQgYWxsPyBCZWNhdXNlDQo+IGZyb20gJ25vdGU6IHZhbGlkIHRhcmdldCBDUFUg
dmFsdWVzIGFyZTonIG1lc3NhZ2UgaXQgbG9va3MgbGlrZSB0aGF0Lg0KDQpCeSB0aGUgd2F5IEkg
c3VibWl0dGVkIGEgcGF0Y2ggdG8gb3B0IG91dCBvZiBDTEFORyB1bnRpbCB3ZSBjbGFyaWZ5IHRo
ZSANCnNpdHVhdGlvbiwgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4cHBjLWRldi9wYXRjaC9lNjI4OTJlMzJjMTRhN2E1NzM4YzU5N2UzOWUwMDgyY2IwYWJm
MjFjLjE2NzUzMzU2NTkuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCg0KQ2hyaXN0
b3BoZQ0KDQo+IA0KPj4gKyBOZW1hbmphaSwgUWlvbmdzaSwNCj4+DQo+Pg0KPj4+DQo+Pj4+DQo+
Pj4+DQo+Pj4+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxs
a2Z0QGxpbmFyby5vcmc+DQo+Pj4+DQo+Pj4+IGh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3Jn
L2xrZnQvbGludXgtbmV4dC1tYXN0ZXIvYnVpbGQvbmV4dC0yMDIzMDIwMS90ZXN0cnVuLzE0NDc5
Mzg0L3N1aXRlL2J1aWxkL3Rlc3QvY2xhbmctbmlnaHRseS10cW04eHhfZGVmY29uZmlnL2hpc3Rv
cnkvDQo+Pj4+DQo+Pj4+IFRoZSBiaXNlY3Rpb24gcG9pbnRlZCB0byB0aGlzIGNvbW1pdCwNCj4+
Pj4gICAgIDQ1ZjcwOTFhYWMzNSAoInBvd2VycGMvNjQ6IFNldCBkZWZhdWx0IENQVSBpbiBLY29u
ZmlnIikNCj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gTGluYXJvIExLRlQNCj4+Pj4gaHR0cHM6Ly9sa2Z0
LmxpbmFyby5vcmcNCj4+DQo+Pg0KPj4NCj4+IC0tIA0KPj4gVGhhbmtzLA0KPj4gfk5pY2sgRGVz
YXVsbmllcnMNCg==
