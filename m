Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A067AB46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 09:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1x9V2jB3z3cfS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 19:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SjYZ7jm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.15.51; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SjYZ7jm5;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1x8T1ZF1z3c9G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 19:00:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOfEWuGjZxmtZf9lYWwkMrAaI2+J/Vf3D0cxeHYz/UeqA07/+0imf/ZIJfvVWenNOXU2w+HLSwkC/ANnEYrfd7OC2iTEyQHDZpcskb0IwuAobG/PjzQtaU5oe4hsJjx4SjJPPSEe961bgpRnMSDMMTwNjaHK+aum6HvK33IjzjYKj4exbW55eLlbM770e0Oj0tPBMYieZX6cWyZhKbm25BifiPrCJNeXjywiGQkYThPLiYFbsF4vfv994XgAAn46vcx6SAK8RbKZ9aFzhbxIhfCRl3bp8VrPYKQxcWt+VuGJo+/OYmb+yuGIJueb4tPpUZwfA32Umk8OcQ7jIM0qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97nC1YGtFr96QF+owihbqdkauYi7W59RzkCF3w8SUfM=;
 b=mZTgj/SDL20qGvTsD3tEQHWX18Kl/jm9PWiqspnFJHM1DaApcJJKtQa7swxI32UCeVMIVML7Ih3xFrRJPwZeeRUQEvkVp0Jznd0woEnoviA/ZXX6QWukJ//IuA6aW76PTIAJgrgtUnVPj5sHZ0wXQZNeK9aW0ov/HsdZYj4recsr/6RisnKtjnt5RPzlSzkXvxOSpobUy1BSKD79b4aWhv+OOta9QtyYLfLngNyeAhX5+wkjqACtvkplbxxx6Zj/vQ3PuPjuveBYR7oePc+eDJbRXLRF4cLYai18IJq6a7vnrXeY5obLFsLStJK0PrkZcK7yB31gpdArWKkH05+EDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97nC1YGtFr96QF+owihbqdkauYi7W59RzkCF3w8SUfM=;
 b=SjYZ7jm5i/d8mz5lt2V24O1QnEE5waoKaxO60cehaYl/XIZ86fJFsA576136WyVP71fiKXSiofgEfVZDW3NbeHKX9jjwcQu4qWZlV7w84HpHz23Pva2r20911YfmYF1Ft35PNKwByaxjibt3MoFMYuCoL/nkjqILkTS+VoK+WJBu679BsQj2XHMDDghAgvCrJyLvd01VrZQXmZtwQZyxgnvWIKwDot30Dbpkn1h6FtOK09AMuQXH1rmWjfIsZfxW4c095f2lDtvijgOpyYPizmriGXHRQT6STJCfrS5HZxDjf/J3c4kr79rZ/GSQyCVUqt4o/RWmRG2L0wX27lNezQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2367.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 07:41:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 07:41:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index:  AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQCAAACcgIAAAKWAgKBniwCAAAuhgIAZADQAgC0n8YCABHm9AA==
Date: Wed, 25 Jan 2023 07:41:47 +0000
Message-ID: <da635f99-ce3f-18e8-cf7d-7fd5923c8451@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20221208191602.diywrt3g2f6zmt4s@pali>
 <aca70dc9-2185-9def-7bc0-b415bec8a5c6@csgroup.eu>
 <20221224174452.xxlkmos7yoy3qn42@pali> <20230122111931.hgcsc72fk6alrmzu@pali>
In-Reply-To: <20230122111931.hgcsc72fk6alrmzu@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2367:EE_
x-ms-office365-filtering-correlation-id: 5e8d1d6e-2add-4f56-3e31-08dafea79cfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Au2hS/i2NRu+gwfq/9/lsg1Bk+ENOqgaw5123Z1Y9GOr+mfrOPSpCcOoXovz5QEYSpoii2FGj2uRn+7/qdD1rIMkN/B8tpKKmQfLXMv3PdfRuNJqxRQVTw0ZXHsfIMavGR6gaN7J1C3Y354HlveC7LpPu4RnHe2b9KzLTSnc6bDbV067e/q8iw6yIjJdqQpAJpl87xGAWsh89UoKw758TK6o04Q507hlyoIKVKyblwuCT1EKH7FumH8mPVJG9dQJHK7tQ53qLGwOYuUM07iyU9J+YxBG+KekqaWlTBkuHJsL1OyVLM2dg8n7WzH7pNslmZzS1E9hweKXLtvbhJdtr41PrkPq+zkYA0z4bN/BMKIe9QyJwKtmUW5SHt06aed+w8sStrqZhXZMU086aMYc42wcZbnsAXSauwMJ0Hqvb37qv+qfr7Wvn+DI2trM7CeWZ5hVVmb4ivjWtvWTvWM8ujH3+SvIsD/BeQ92526Nuild75odU0VdsbFwQB9JM6krzzKmPMmqfCV7vtxnsJg5Sl6oC7O9mX50xh470dPXzpXwvasXxx/FGJpwh4UEMC0WbWXzY1km0HOBtnwOBlasxOiNeUhYppQPyQMBIxjCmwxEvaKCFK7xd+Jt+ukyWVo9I177G88zOOWM2/SiSejJXAvqZEMf8azyY0Hq1kkzMDZsdxXXjeqD5NqCFvbgeI91o5ASgTBDr/XeTHaUqajhkRDED2RzVP0/zl/9EAb+B8Xsj45raBZPFshCM9xDpYaF4Gie97xhmYLIuv7OBwILTq7GJ6oeXqvwCu7lg5GgnxQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199018)(5660300002)(64756008)(66446008)(186003)(316002)(2906002)(66946007)(6916009)(91956017)(4326008)(66476007)(66556008)(8936002)(76116006)(8676002)(41300700001)(31686004)(71200400001)(6486002)(83380400001)(478600001)(966005)(6506007)(6512007)(26005)(2616005)(38100700002)(122000001)(66574015)(44832011)(54906003)(38070700005)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aVYzRG9nam9TTWNXbElRZm5yU2dIRnJOY0tPaXRiWmQ5K3NrTVUzYUwrWDJt?=
 =?utf-8?B?YmxVL0l0bkF1OGE0UGFQbW5URTgvNGIvRjh3UHNPN3ozSDRyaXpLNE5SbkdV?=
 =?utf-8?B?dlRlTWYwSXRNOE5wdm9jYWpnLzRYc1M2ZERKak56d0hPUi9pa25JVkIrdVdj?=
 =?utf-8?B?UWt0eDhoR0h5TUlWSlBNQ2FiYjk3c1luM3B3eXEzVUh0SG1VbCtvb1lkMlBV?=
 =?utf-8?B?YXAxYjlwbVpEVDVQamlDTFFWOXdzV3JUZ0hYTE5iUEhXZGwwT2M2c01ubGxi?=
 =?utf-8?B?S2VzVFlEU2UvejRBSmllWERmOUs3QXFCRWZWeU9HSnkwbDBGT0tCd0NpUEpY?=
 =?utf-8?B?TVVQR0VpQUQxd2lsOGRqMjA1TlY1ZGdtcUtPSXJsSW44RElDS1o3cldsWXdM?=
 =?utf-8?B?SEg3cms4Ymk1bytIN3dKRitYQmhWSHNsNC9FRU9iNGNjSmtvbUdVc1d1VFQ5?=
 =?utf-8?B?YlhsU0szVDM5ZTl1S0Z6TURSY1M5clZqNVVHRDFtQ0VtZk5vR05GYml4cjB3?=
 =?utf-8?B?eUdEVnN0S1dsVkQrL3RxQmVIU2laWTJhSnV2QTZ5ekRyN1FvS2l6Z01jUVdi?=
 =?utf-8?B?dnNyTXRKT0RhRHpCVXJ5dWYzRWRoTUJ4aG92Q1cwdS9odWJzellhdU1rWW4x?=
 =?utf-8?B?bHBOQktuU05sazltUEl2dWhIKy9Ta05jRjRGM1VSdWRFd3Z0UGdFOEZVYkh5?=
 =?utf-8?B?anhkV0FZbjErZ2hFcm8xUk5NU0J0Zytnb3RlRXllTTFuKzY0QjBBR2xDVmdi?=
 =?utf-8?B?MXZxLzVxdzdnSWdjTGhUWFQxdE5ib1BtNHhGVmoxTFlSSHBOUGdDMSthTlcx?=
 =?utf-8?B?aHdoV3V2NHRaOTFseVd2MEwvWEVZZW9kQkRBT25yRGZkQU45bHNvM2pQbHNE?=
 =?utf-8?B?THVqNUJVMlBreTMzditKcXBNR3hnSUEvcTdzQWVjV01nZ3AvSG51RnUxdU9z?=
 =?utf-8?B?bFROSER5ODdlRm5ndElwNnNFbkdSRm9VbzZHRXZRSmxybWRETnRGVEZOR1pX?=
 =?utf-8?B?Tktnb25MVHJEcXBVa1ZiSVZLVGdUVEw1ZGpvczZKR3NRc1VUUHN0ZVVaZWZR?=
 =?utf-8?B?QjhuZ0FIUUtOeEtVNXZONVRycnFJdjhtWEMyZmxkcmdOdUlDbUwrU3E2dDBH?=
 =?utf-8?B?YTVkVFU1SmNuS2p1MDRJTFBDQlhTRnJsd2xmK1RZRjlLQnF6QUdPMlJPOFpa?=
 =?utf-8?B?Wk9JM2dtUFk2bHhwWmNSUmNpenJwVVBTcEttbkhSQ2ZtYVQ3OENvbHBmMit1?=
 =?utf-8?B?MTJJYmVManQvcmszblB5OUFJd04vNWMxM0crU09xY0pzLytCeDN3QlY3akNP?=
 =?utf-8?B?OWVodnFkQ1hIakw0c0pocGVWcGkwbFFrTmV3QlVoUDRiKzlOU2ppeVJJNml2?=
 =?utf-8?B?TkNCbVAxRTJxZzViYzRKelpjeDkrcnJzMUNENVVnb1NOUDZKdTRYbnpEWU1t?=
 =?utf-8?B?czZhcytjQ1pKVFhVTUZTQnJDQkNtL0lOeFlGTExHeU9xVTFvUlpJWjFaOFBF?=
 =?utf-8?B?bTNkUUJNSXhWQ3NBVURhMUJEamQzTHdFRm5DdnhqQXdGWnVmSWJHTWJzUlJX?=
 =?utf-8?B?am5xaXhXV1daSWNuV2dEWWMrSTl5dHNaYkpqd0lsbXFHOFJzYi94aXBwcHVm?=
 =?utf-8?B?eDl1NTV2MFI2ZkxxYVhFMGQ2eTFyRnBtS1dtRUhBUGNzYXE1c1lWNDRObENs?=
 =?utf-8?B?NUppVnlaWVZ3Y1pWR2VwN3U2Ym9POWlQaGY0RU5SN3o5TVQzQ1NsYTRTeVhX?=
 =?utf-8?B?dEU1YUsxcFNHckN6dWdVQXAyOVlXNy8zNDBHTktocHBQVTZXNUJxVWVQdWpp?=
 =?utf-8?B?YnhuNHFmYmJ5SHYyREpFVnpqVGV2aDRBMVM3K2hBcm9kWEFCSlIxcmorbGdR?=
 =?utf-8?B?Mm0zYXlMazcxZmVobGFsOEQvSWxlajRjbG82R3FqOUFTbkl3SlU0S3d2bnlG?=
 =?utf-8?B?bkRHTEV5WitwdWVLOWxFUVFlZXA3Z2lrbFVSRTRUQU4yczFNN2dJNndMWmc2?=
 =?utf-8?B?TlVQNEtQVWlNMnJkN2hvUHl3RnVTYlY3QzJrZU1LT3BEWUp6a3h0STZRQTlV?=
 =?utf-8?B?clpWZjAzd2h3M0lBMEl2clN0bnNhcjZkWE9RcmY3V091VytJQ1NpWkJFdkRQ?=
 =?utf-8?B?bG85c2xlc05RSHBiemhmQ3pIV0d0Q0h5ZFNjZEg1bUxDUW5OV21wOGdyVkx3?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26DF38AD476019498DAA5AA15BB25271@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8d1d6e-2add-4f56-3e31-08dafea79cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 07:41:47.2804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Esal7LKz1dxcK0Ljn4UDy2j0WsxBetqxJr3/ilW7sNa3A82GtlZzCrz0Vq9PoH01M4y//t/0CpmAWng+ioPfc1o3+BdnATWSRJujGlaO4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2367
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAxLzIwMjMgw6AgMTI6MTksIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFNhdHVyZGF5IDI0IERlY2VtYmVyIDIwMjIgMTg6NDQ6NTIgUGFsaSBSb2jDoXIgd3JvdGU6DQo+
PiBPbiBUaHVyc2RheSAwOCBEZWNlbWJlciAyMDIyIDE5OjU3OjM5IENocmlzdG9waGUgTGVyb3kg
d3JvdGU6DQo+Pj4gTGUgMDgvMTIvMjAyMiDDoCAyMDoxNiwgUGFsaSBSb2jDoXIgYSDDqWNyaXTC
oDoNCj4+Pj4gT24gU3VuZGF5IDI4IEF1Z3VzdCAyMDIyIDE3OjQzOjUzIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+Pj4+PiBMZSAyOC8wOC8yMDIyIMOgIDE5OjQxLCBQYWxpIFJvaMOhciBhIMOp
Y3JpdMKgOg0KPj4+Pj4+IE9uIFN1bmRheSAyOCBBdWd1c3QgMjAyMiAxNzozOToyNSBDaHJpc3Rv
cGhlIExlcm95IHdyb3RlOg0KPj4+Pj4+PiBMZSAyOC8wOC8yMDIyIMOgIDE5OjMzLCBDaHJpc3Rv
cGhlIExlcm95IGEgw6ljcml0wqA6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IExlIDI4
LzA4LzIwMjIgw6AgMTE6NTYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+Pj4+Pj4+Pj4gV2hl
biBDT05GSUdfVEFSR0VUX0NQVSBpcyBzcGVjaWZpZWQgdGhlbiBwYXNzIGl0cyB2YWx1ZSB0byB0
aGUgY29tcGlsZXINCj4+Pj4+Pj4+PiAtbWNwdSBvcHRpb24uIFRoaXMgZml4ZXMgZm9sbG93aW5n
IGJ1aWxkIGVycm9yIHdoZW4gYnVpbGRpbmcga2VybmVsIHdpdGgNCj4+Pj4+Pj4+PiBwb3dlcnBj
IGU1MDAgU1BFIGNhcGFibGUgY3Jvc3MgY29tcGlsZXJzOg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4g
ICAgwqDCoMKgwqAgQk9PVEFTwqAgYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5vDQo+Pj4+Pj4+Pj4g
ICAgwqDCoCBwb3dlcnBjLWxpbnV4LWdudXNwZS1nY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgYXJn
dW1lbnQgaW4gb3B0aW9uDQo+Pj4+Pj4+Pj4g4oCYLW1jcHU9cG93ZXJwY+KAmQ0KPj4+Pj4+Pj4+
ICAgIMKgwqAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBub3RlOiB2YWxpZCBhcmd1bWVudHMg
dG8g4oCYLW1jcHU94oCZIGFyZToNCj4+Pj4+Pj4+PiA4NTQwIDg1NDggbmF0aXZlDQo+Pj4+Pj4+
Pj4gICAgwqDCoCBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzMToN
Cj4+Pj4+Pj4+PiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dIEVycm9yIDENCj4+Pj4+Pj4+DQo+
Pj4+Pj4+PiBjb3JlbmV0NjRfc21wX2RlZmNvbmZpZyA6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAg
IMKgIEJPT1RBU8KgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPj4+Pj4+Pj4gcG93ZXJwYzY0
LWxpbnV4LWdjYzogZXJyb3I6IG1pc3NpbmcgYXJndW1lbnQgdG8gJy1tY3B1PScNCj4+Pj4+Pj4+
IG1ha2VbMV06ICoqKiBbYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGU6MjM3IDogYXJjaC9wb3dl
cnBjL2Jvb3QvY3J0MC5vXQ0KPj4+Pj4+Pj4gRXJyZXVyIDENCj4+Pj4+Pj4+IG1ha2U6ICoqKiBb
YXJjaC9wb3dlcnBjL01ha2VmaWxlOjI1MyA6IHVJbWFnZV0gRXJyZXVyIDINCj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiBTZWVtcyBsaWtlIGluIGZhY3QsIEU1NTAwX0NQVSBh
bmQgRTY1MDBfQ1BVIGFyZSBub3QgdGFrZW4gaW50byBhY2NvdW50DQo+Pj4+Pj4+IGluIENPTkZJ
R19UQVJHRVRfQ1BVLCBhbmQgZ2V0IHNwZWNpYWwgdHJlYXRtZW50IGRpcmVjdGx5IGluDQo+Pj4+
Pj4+IGFyY2gvcG93ZXJwYy9NYWtlZmlsZS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBnb2VzIHVu
bm90aWNlZCBiZWNhdXNlIG9mIENGTEFHUy0kKENPTkZJR19UQVJHRVRfQ1BVX0JPT0wpICs9DQo+
Pj4+Pj4+ICQoY2FsbCBjYy1vcHRpb24sLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkpDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IEkgdGhpbmsgd2UgbmVlZCB0byBmaXggdGhhdCBwcmlvciB0byB5b3VyIHBh
dGNoLg0KPj4+Pj4+DQo+Pj4+Pj4gSXQgbG9va3MgbGlrZSB0aGF0IENPTkZJR19UQVJHRVRfQ1BV
IGlzIGJyb2tlbi4NCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgJCBtYWtlIEFSQ0g9cG93ZXJwYyBjb3Jl
bmV0NjRfc21wX2RlZmNvbmZpZyBDUk9TU19DT01QSUxFPXBvd2VycGM2NC1saW51eC1nbnUtDQo+
Pj4+Pj4gICAgICAuLi4NCj4+Pj4+PiAgICAgICMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRvIC5j
b25maWcNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgJCBncmVwIENPTkZJR19UQVJHRVRfQ1BVIC5jb25m
aWcNCj4+Pj4+PiAgICAgIENPTkZJR19UQVJHRVRfQ1BVX0JPT0w9eQ0KPj4+Pj4+DQo+Pj4+Pj4g
Q09ORklHX1RBUkdFVF9DUFVfQk9PTCBpcyBzZXQgYnV0IENPTkZJR19UQVJHRVRfQ1BVIG5vdCEN
Cj4+Pj4+DQo+Pj4+PiBZZXMsIGJlY2F1c2UgdGhlcmUgaXMgbm8gZGVmYXVsdCB2YWx1ZSBmb3Ig
RTU1MDBfQ1BVIGFuZCBFNjUwMF9DUFUuIFdlDQo+Pj4+PiBuZWVkIHRvIGFkZCBvbmUgZm9yIGVh
Y2guDQo+Pj4+DQo+Pj4+IFdpdGggIltQQVRDSCB2MV0gcG93ZXJwYy82NDogU2V0IGRlZmF1bHQg
Q1BVIGluIEtjb25maWciIHBhdGNoIGZyb20NCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXhwcGMtZGV2LzNmZDYwYzJkOGEyODY2OGE0MmI3NjZiMTgzNjJhNTI2ZWY0N2U3NTcuMTY3
MDQyMDI4MS5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Lw0KPj4+PiB0aGlzIGNoYW5n
ZSBkb2VzIG5vdCB0aHJvdyBhYm92ZSBjb21waWxlIGVycm9yIGFueW1vcmUuDQo+Pj4NCj4+Pg0K
Pj4+IFRoYXQgcGF0Y2ggc2hvdWxkIGxhbmQgaW4gcG93ZXJwYy9uZXh0IHNvb24uIFdoZW4gaXQg
aGFzIGxhbmRlZCwgY291bGQNCj4+PiB5b3UgcmVzZW50IHRoaXMgcGF0Y2ggc28gdGhhdCBzbm93
cGF0Y2ggY2hlY2tzIHRoZSBidWlsZCBhZ2FpbiA/DQo+Pg0KPj4gWWVzLiBCdXQgSSdtIHN0aWxs
IHdhaXRpbmcgYmVjYXVzZSBwYXRjaCBpcyBub3QgaW4gcG93ZXJwYy9uZXh0IHlldC4NCj4gDQo+
IFNlZW1zIHRoYXQgaXQgc3RpbGwgaGFzIG5vdCBsYW5kZWQuIEFueSBzdWdnZXN0aW9ucyB0byBt
b3ZlIGZvcndhcmQ/DQoNCkhpDQoNCkkganVzdCByZXBvc3RlZCB0byBzZWUgaWYgaXQgcGFzc2Vk
IHRoZSBDSSB0ZXN0cyB0aGlzIHRpbWUuDQoNCkNocmlzdG9waGUNCg0KPiANCj4+PiBCZWNhdXNl
IGF0IHRoZSB0aW1lIGJlaW5nIGl0IGlzIGZsYWdnZWQgYXMgImZhaWxlZCIsIHNlZQ0KPj4+IGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAy
MjA4MjgwOTU2NTkuNDA2MS0xLXBhbGlAa2VybmVsLm9yZy8NCj4+Pg0KPj4+IENocmlzdG9waGUN
Cg==
