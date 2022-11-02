Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E146461604A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:57:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Ml15Ljsz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:57:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EGA9sHIv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.88; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EGA9sHIv;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90088.outbound.protection.outlook.com [40.107.9.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Mk11NPXz2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 20:56:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJtEraHFlWN0BX5qiRkBfPjZW55XEstYawJKAZP0KClVSnc+5KBJLUcbLSQvQQkEZ5hLjjPk4cLdBk/oI6H5SVBQ7/Cun2PwkxGvUMe4Obrtmlc4Vt69nuLQibKWkQYHOBKE8Yz6+ewMTNDho106SaP+wmx1iBEbw2u25CjXw8vSeUs/xN5opiE3mr0Fd9YBMzLZv+X4gqdOEvB0qpAkT2axVCSu269b1saUOqwfI9PlSCLZ414h/inYZjnhy5iDoc2O+62cZPJWVf9Xf6F0vYApVhWkbv6KxmdNPV2vbDSXxnKWXJs/mW6NL8YXEb4G8dgQlQPf/VLwSTsJxPiHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3YDmIpsGSu6GwrJka64IjsznuJOHfSPwLCLAu4snK0=;
 b=UvEu5JK3v/+fBB30Mkj403yuCdbENxrsPd3KfEMWfkZrHaZWOrYNRH0pTsxXmTHot28grtyrAn0q0AkJkPV1QQvNYAMTz3y7Uw5BbpIJ/7kpzHWkXWRZaC30GCiJdWXwFmppe9IXnfe3FbwKXYqwPh8TlyppY7QCZJV8mUYMexozZj4qzTsucWV/ywYRagGTRH18farKu0Tmf6XB+3X9Q7PgeVz9gAOxC2wRIGwvX8b/FX37u+FgB3WT3/Z5YO1pQ+0J5sj8PfH8KDTavgWGw56aBEWzZjSPZQJgFT9NF///wfX30Gl2NK0vY4Jcy1s9lGls921v5EQ1xu7KftohaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3YDmIpsGSu6GwrJka64IjsznuJOHfSPwLCLAu4snK0=;
 b=EGA9sHIvAcN7uGQ67vMogi2IBJjB8mB+UNUOX+pqe5eAMwGsbaGI85eI2PfgSgKlzgNeO9+1m3XFh1VlkFq6AwfM+qXfsQdgA0JJJJFt/7P5kQd9RE33n3BZC2RYlPWfSFeyaJxL+FG1HxibxA1A/PuTpHIjrb//zBtIX+xHOMTMeVGxfjJRUrcqR/vpZ9NFGaVlsjrBj46YTGo04qJvKNgfpHcU9Tio+rGOK7EtsUdEP8aeA8QGHcDom0IoaCz9o5Pd4HGk7WfhF5g6ovp6LnNoD+4vZ+jcdqcKrvquxUEVI1ZX1Cg9mO08bTj1LLpib2hOeDaqKFe8MAr/vdP7ng==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2250.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 09:56:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:56:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given
 mm_struct and psize
Thread-Topic: [PATCH v9 5/7] powerpc/tlb: Add local flush for page given
 mm_struct and psize
Thread-Index: AQHY6Cx8HiCbUsscv0CfPOsbFasg2q4rcm4A
Date: Wed, 2 Nov 2022 09:56:35 +0000
Message-ID: <6c13afb6-3b58-f673-a396-1ae80931b80b@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-6-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-6-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2250:EE_
x-ms-office365-filtering-correlation-id: cd02b74a-485b-4784-6011-08dabcb88720
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZRkCnQTumPxsnYu38JKXdhYiDnCI75QF/FtZ5nSavTtE9mDcMiNwl8nqbpD6v1HcHBh4yC5ohYKe3ILpdeXRQbyHhS4IZ3dtvysPgbt6UnOt5roka3WxotB1HwGY9YYNt0HAHFQWayjjGq6Y0HqmE6jCcWoPuSnfwT73jt1CT/JwQAVG9byikgAKItDbf8F37+UFPYlCJmgFAkxtzpdB30YE1ByPc3B/j2rlzZzwDsF0dfM8uf1IL2JxdUDDNo61wDURzlaJVEZW4airfeTwawKpEY8mbBy+mbp0RGP8FafEHEX28CouRN+K2ptLaImpXfv5Q+HvmuTad/jYGczbp58k74XPFSBmzvXntot5IxAxQJCMU8ArLTfxLvdh0LAdOzEtgMVUQmMIkB96FxJHkhuFVt2n+juzQUAHDaNo22RUcJyCo97eSSnThNP7I+4b/wBkXycPXFpTSf4oPjWm0MPcum8A9tOmkWKalrl6RFurxGcijiXcnO5LQo52tl6RF7FY7TIiUZaFOUE3xdfKFs2hhrrQqkXFB9iAnYa7kfDD5/nvBYAOmQ1Mia/ZdBX04A399Fn/biRPOf5Vwhp0CDSamCiOS1AAyzvAsmRVZaOO5vSaFwFWx/C9rwvuMXtqZ9kNutxwcJjyWZDO20xl/f4ExOoGYNFfwNa/SOGO/oAPUwvGwn+DDPW18HPYJhWmu1t922L1x5S/NLIBzrmH4/+RN8Z00mD8C5awUqBHz1UzoBUUq83lcRaSOwHxMXYSpN4ONAM6VoyOVxNh2CHJrT4YXUDBig+m3qNcvHc8NfRmu/fFqqYEfWBRU7m8B9ukHbWey4exYdhNZ0hAbj0f7w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(136003)(346002)(376002)(451199015)(71200400001)(6506007)(478600001)(316002)(66946007)(91956017)(4326008)(76116006)(36756003)(54906003)(8676002)(110136005)(6486002)(38100700002)(38070700005)(122000001)(86362001)(31696002)(2616005)(26005)(6512007)(83380400001)(186003)(66574015)(8936002)(31686004)(44832011)(2906002)(41300700001)(5660300002)(64756008)(66476007)(66446008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MC9aanF5SFpISjdTZEJFd28rVzltSGZ4eEYxTnIyc3A4VU5qdUlJN09OUW52?=
 =?utf-8?B?aGNla1A4TzRzVFdZcm0rM0k2QU5GN0JQVU00YTJZMk4yVjJYKzBRYzZIU3RI?=
 =?utf-8?B?dFgxU2hBamJYYTNHS3JWV2NPcnFGU3lkQ0svb1liTWRqK2NlYnFnZDQyOHhJ?=
 =?utf-8?B?YTRPZUgrSUpCcHlqL29zTVZibG1jdnFCUi9qRkpkUWhBaXNTRSt0UUlnUEpE?=
 =?utf-8?B?QzJQbFQ1QW04Z1lBRTFSQ2NVSmJ4K2RZeENIQXdBNWZVQ1YwNjE5bklJNlBR?=
 =?utf-8?B?YUg4QkJVTjBsQm5kbTh6SncrVGFvQTc0SFVkbjM3YXZJNWROT2p4VFY3QmRT?=
 =?utf-8?B?TFVuY3grQ0VDSitzNlpwRWYrREdsZjZ4YWxpSFY0ZHBKa1FKREhIREc0anQr?=
 =?utf-8?B?T3AvUzBoUSs4RjRjUHdUYjlBMG12VFlCakRDVFFxNVJxZ3diN25lOUpINFBx?=
 =?utf-8?B?bWNaOHpBTnJGOFdUWmVRTWRFYVhTMWlUQTFwNUJRUHNNaDdROFF4b3hRSklk?=
 =?utf-8?B?VmhMRml5Tmo1bGhrMWIrSlF1aFAyNXMxZ2l4a2p2ZmJRVWYxbnZwUlFVZUw1?=
 =?utf-8?B?YytFcGoySlR0Ym9rTTVRd3E4bUlDMHRuUTZMa0ZmWXFZdzdQa1pyUWgyNW5U?=
 =?utf-8?B?ZmZzNFlLdXRUbENxOHZVa3dqWjAzUnBTU3BzTE0rcDVjNXdtWFNSTGRtaE1a?=
 =?utf-8?B?MmpEdDU0SG1mKzJWcGJublFnS3ppZU0wbGVpd0dmSTN0cHZJUDJhU2FSVldX?=
 =?utf-8?B?dnNJbCtGQXEra0lzQ3lQb2hRSTJnZlZkK1JvMU9vUEFaV1VKbFBvRVNERXBj?=
 =?utf-8?B?djlsU0tPM1grMEJWejNxaDJ3S3A4cjRab2dsbTZXT2hFZlExS2VWM1ZyZWtx?=
 =?utf-8?B?TEZLYll4cFpWdERlRnlIc0NnNDR0WUM0WUorY0xCYmNiZ29PRncrdW9pT2Np?=
 =?utf-8?B?bzNYZzNLMjBZcTRrZ0VvR0lsb3pqVEtnZEFTMk4xZTJRVTd1Z05pQkU3dXEv?=
 =?utf-8?B?NTNYc3Q0eWh3VlRmYXVqT3lTZ3B3L2hYZEdhcUlmWE82V1RteGN3dFE3RVc5?=
 =?utf-8?B?QkFxTmlOZWNuV1pYK1FIMHlBSG1INDJ5VExESHNzWTZSVmMraUFOYlZJMUNw?=
 =?utf-8?B?eDNScHVuckwva213V2YzN2VNNjFHclBsb0I2L2lYZWJmTFJQcWJLL3Z0RzVq?=
 =?utf-8?B?QVl0OXdzRm5UMnA2anVOVUxKVkJGeWpqUk5QWlRYS25Nek16YSttb1pPQUVS?=
 =?utf-8?B?aDZjdTIvQkNISzM2SWJRa1IzU1hxYk41WTlqemd6NVZzR3I5eVFiMnJUWDRt?=
 =?utf-8?B?RUFGZThQWVdRNnNPRjVYSFgxNVl3eGlkQUNycjB0VHhHd21IN00vKy9VTDhD?=
 =?utf-8?B?ZU01aExIM3dLL0poTGRFdGlCbVZlUk1qbDNNL2ttMHIvRk93UWRQRHhTclU3?=
 =?utf-8?B?VTBFNzZMeC9vM2tGL1R3bm05ZHR3aXJjMEVYSzNyWG5FdzlCdGcyczFqZlZG?=
 =?utf-8?B?aTE2YXpQbUhwMGt0SFZkVThFVXJyMTFFT05qeVAyUzNjb3JXQklzNnFyVVZo?=
 =?utf-8?B?QTVsQ3FsdUVibmtReE1hdW1iMkE3N0R1bXg0eWUrdUFkOStaUTlDaEtwRy9Q?=
 =?utf-8?B?Ri9PekFGN1M4cGlZTytzUUhYbDFMa2FOQUpVNjF4cTNqOUdPLzIvVzczS0Fp?=
 =?utf-8?B?RVJ0YUxUYzdqYlZXaFh6Yjh3UzJKVS82Q2RuekxqTWJnUDhBWDVrNG5TL2Q5?=
 =?utf-8?B?dWU4ekhjeDVMRHVyVTRNRjFVNllSM1p6REVQeDd1dGcwd0F6MlNRMTFTRWJo?=
 =?utf-8?B?UnpHRVdXNDMvQWd5K2xjS203czhkOTRHK2ppNUUxRFBhRUxsL0s0OU15MVNU?=
 =?utf-8?B?d2Y5YUEzdWZabmo4QVVSRUw4dDU4aDZzUEZxdW53SXNjWWVzVWpON2hVblJ5?=
 =?utf-8?B?b2hUcGYwYlIxZUVpbi9hc2xHVFVzYU5qWGh2OXZkYVM5M2UyV2E3MEM5VmhV?=
 =?utf-8?B?Y3creGgzdGxTdGpSRDdRUW15YVhQNzlCR0ZqbXVaR2tBNFBrdmh5K003VzNY?=
 =?utf-8?B?dmQxajBYQWQ3dUVtNEt1S0xNc2lHTUJIbVo2Q0ZxR2lTSWJWN2JPQ2lZUEFW?=
 =?utf-8?B?MDhCMmNWN3VmUlpBbEF3bHdDZ21rcHIwekhKbkdsZExkc1hwakZkZU91bEt3?=
 =?utf-8?Q?V29HEl1SrAUNq14D0Ex1Fvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8424744A81EE4FA6B4831B68DAD09D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd02b74a-485b-4784-6011-08dabcb88720
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:56:35.2928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQ4coHFdJO3LCZtanBh/ztjcJbIt97XxVVqdFzuzgv5m6pG8IglMGS7JctTc+kRN08hYOexHI5LGvBRitsygWLSPreY5oFTikvEekNsGMgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2250
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QWRkcyBhIGxvY2FsIFRMQiBmbHVzaCBvcGVyYXRpb24gdGhhdCB3b3JrcyBnaXZlbiBhbiBtbV9z
dHJ1Y3QsIFZBIHRvDQo+IGZsdXNoLCBhbmQgcGFnZSBzaXplIHJlcHJlc2VudGF0aW9uLiBNb3N0
IGltcGxlbWVudGF0aW9ucyBtaXJyb3IgdGhlDQo+IHN1cnJvdW5kaW5nIGNvZGUuIFRoZSBib29r
M3MvMzIvdGxiZmx1c2guaCBpbXBsZW1lbnRhdGlvbiBpcyBsZWZ0IGFzDQo+IGEgV0FSTl9PTkNF
X09OIGJlY2F1c2UgaXQgaXMgbW9yZSBjb21wbGljYXRlZCBhbmQgbm90IHJlcXVpcmVkIGZvcg0K
DQpzL09OQ0VfT04vT05DRQ0KDQo+IGFueXRoaW5nIGFzIHlldC4NCg0KSXMgYSBXQVJOX09OQ0Uo
KSByZWFsbHkgbmVlZGVkID8gQ2FuJ3QgYSBCVUlMRF9CVUcoKSBiZSB1c2VkIGluc3RlYWQgPw0K
DQoNCj4gDQo+IFRoaXMgcmVtb3ZlcyB0aGUgbmVlZCB0byBjcmVhdGUgYSB2bV9hcmVhX3N0cnVj
dCwgd2hpY2ggdGhlIHRlbXBvcmFyeQ0KPiBwYXRjaGluZyBtbSB3b3JrIGRvZXMgbm90IG5lZWQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29t
Pg0KPiAtLS0NCj4gdjk6CSogUmVwbGFjZSBib29rM3MvMzIvdGxiZmx1c2guaCBpbXBsZW1lbnRh
dGlvbiB3aXRoIHdhcm5pbmcNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy8zMi90bGJmbHVzaC5oICAgICAgfCA5ICsrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oIHwgNSArKysrKw0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaCAgICAgIHwgOCArKysrKysr
Kw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvdGxiZmx1c2guaCAgICAgICAg
IHwgOCArKysrKysrKw0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvdGxiZmx1
c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvdGxiZmx1c2guaA0KPiBp
bmRleCBiYTE3NDNjNTJiNTYuLjE0ZDk4OWQ0MWY3NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvdGxiZmx1c2guaA0KPiBAQCAtMiw2ICsyLDggQEANCj4g
ICAjaWZuZGVmIF9BU01fUE9XRVJQQ19CT09LM1NfMzJfVExCRkxVU0hfSA0KPiAgICNkZWZpbmUg
X0FTTV9QT1dFUlBDX0JPT0szU18zMl9UTEJGTFVTSF9IDQo+ICAgDQo+ICsjaW5jbHVkZSA8YXNt
L2J1Zy5oPg0KPiArDQo+ICAgI2RlZmluZSBNTVVfTk9fQ09OVEVYVCAgICAgICgwKQ0KPiAgIC8q
DQo+ICAgICogVExCIGZsdXNoaW5nIGZvciAiY2xhc3NpYyIgaGFzaC1NTVUgMzItYml0IENQVXMs
IDZ4eCwgN3h4LCA3eHh4DQo+IEBAIC03NCw2ICs3NiwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
bG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgew0K
PiAgIAlmbHVzaF90bGJfcGFnZSh2bWEsIHZtYWRkcik7DQo+ICAgfQ0KPiArDQo+ICtzdGF0aWMg
aW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2VfcHNpemUoc3RydWN0IG1tX3N0cnVjdCAq
bW0sDQo+ICsJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdm1hZGRyLCBpbnQgcHNpemUpDQo+ICt7
DQo+ICsJV0FSTl9PTkNFKHRydWUsICJsb2NhbCBUTEIgZmx1c2ggbm90IGltcGxlbWVudGVkIik7
DQoNCklzIGl0IHBvc3NpYmxlIHRvIHVzZSBCVUlMRF9CVUcoKSBpbnN0ZWFkID8NCg0KPiArfQ0K
PiArDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1f
c3RydWN0ICptbSkNCj4gICB7DQo+ICAgCWZsdXNoX3RsYl9tbShtbSk7DQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oDQo+IGluZGV4
IGZhYjgzMzJmZTFhZC4uOGZkOWRjNDliMmExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaA0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaA0KPiBAQCAtOTQsNiArOTQs
MTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGhhc2hfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIHsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgaGFzaF9fbG9jYWxfZmx1c2hfdGxiX3BhZ2VfcHNpemUoc3RydWN0IG1tX3N0cnVj
dCAqbW0sDQo+ICsJCQkJCQkgICAgdW5zaWduZWQgbG9uZyB2bWFkZHIsIGludCBwc2l6ZSkNCj4g
K3sNCj4gK30NCj4gKw0KDQpJcyBpdCB3b3J0aCBhbiBlbXB0eSBmdW5jdGlvbiA/DQoNCj4gICBz
dGF0aWMgaW5saW5lIHZvaWQgaGFzaF9fZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsDQo+ICAgCQkJCSAgICB1bnNpZ25lZCBsb25nIHZtYWRkcikNCj4gICB7DQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmgNCj4gaW5kZXgg
Njc2NTVjZDYwNTQ1Li4yZDgzOWRkNWMwOGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLmgNCj4gQEAgLTkyLDYgKzkyLDE0IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwNCj4gICAJcmV0dXJuIGhhc2hfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlKHZtYSwgdm1hZGRy
KTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3Bh
Z2VfcHNpemUoc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+ICsJCQkJCSAgICAgIHVuc2lnbmVkIGxv
bmcgdm1hZGRyLCBpbnQgcHNpemUpDQo+ICt7DQo+ICsJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4g
KwkJcmV0dXJuIHJhZGl4X19sb2NhbF9mbHVzaF90bGJfcGFnZV9wc2l6ZShtbSwgdm1hZGRyLCBw
c2l6ZSk7DQo+ICsJcmV0dXJuIGhhc2hfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplKG1tLCB2
bWFkZHIsIHBzaXplKTsNCg0KVGhvc2UgZnVuY3Rpb25zIGFyZSAndm9pZCcsIHNob3VsZG4ndCBu
ZWVkIHRoZSAicmV0dXJuIi4NCg0KQ291bGQganVzdCBiZToNCg0KK3N0YXRpYyBpbmxpbmUgdm9p
ZCBsb2NhbF9mbHVzaF90bGJfcGFnZV9wc2l6ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCisJCQkJ
CSAgICAgIHVuc2lnbmVkIGxvbmcgdm1hZGRyLCBpbnQgcHNpemUpDQorew0KKwlpZiAocmFkaXhf
ZW5hYmxlZCgpKQ0KKwkJcmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplKG1tLCB2bWFk
ZHIsIHBzaXplKTsNCit9DQoNCg0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGxv
Y2FsX2ZsdXNoX2FsbF9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICB7DQo+ICAgCWlmIChy
YWRpeF9lbmFibGVkKCkpDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bm9oYXNoL3RsYmZsdXNoLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3RsYmZs
dXNoLmgNCj4gaW5kZXggYmRhZjM0YWQ0MWVhLi40MzJiY2E0Y2FjNjIgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvdGxiZmx1c2guaA0KPiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3RsYmZsdXNoLmgNCj4gQEAgLTQ1LDYgKzQ1LDEy
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uDQo+ICAgCWFzbSB2b2xhdGlsZSAoInRsYmllICUw
OyBzeW5jIiA6IDogInIiICh2bWFkZHIpIDogIm1lbW9yeSIpOw0KPiAgIH0NCj4gICANCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcGFnZV9wc2l6ZShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwNCj4gKwkJCQkJICAgICAgdW5zaWduZWQgbG9uZyB2bWFkZHIsIGludCBwc2l6ZSkN
Cj4gK3sNCj4gKwlhc20gdm9sYXRpbGUgKCJ0bGJpZSAlMDsgc3luYyIgOiA6ICJyIiAodm1hZGRy
KSA6ICJtZW1vcnkiKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF90
bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQ0K
PiAgIHsNCj4gICAJc3RhcnQgJj0gUEFHRV9NQVNLOw0KPiBAQCAtNTgsNiArNjQsOCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZA0KPiAgIGV4dGVybiB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFu
Z2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOw0KPiAgIGV4dGVybiB2
b2lkIGxvY2FsX2ZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSk7DQo+ICAgZXh0ZXJu
IHZvaWQgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVu
c2lnbmVkIGxvbmcgdm1hZGRyKTsNCj4gK2V4dGVybiB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdl
X3BzaXplKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiArCQkJCSAgICAgICB1bnNpZ25lZCBsb25n
IHZtYWRkciwgaW50IHBzaXplKTsNCg0KVGhhdCBmdW5jdGlvbiBkb2Vzbid0IHNlZW0gdG8gYmUg
ZGVmaW5lZCBhbnl3aGVyZS4gSXMgdGhpcyBwcm90b3R5cGUgDQpqdXN0IHRvIG1ha2UgY29tcGls
ZXIgaGFwcHkgPyBJZiBzbyBhIHN0YXRpYyBpbmxpbmUgd2l0aCBhIEJVSUxEX0JVRyANCndvdWxk
IGxpa2VseSBiZSBiZXR0ZXIsIGl0IHdvdWxkIGFsbG93IGRldGVjdGlvbiBvZiBhIGJ1aWxkIHBy
b2JsZW0gYXQgDQpjb21waWxlIHRpbWUgaW5zdGVhZCBvZiBsaW5rIHRpbWUuDQoNCkJ5IHRoZSB3
YXksICdleHRlcm4nIGtleXdvcmQgaXMgcG9pbnRsZXNzIGFuZCBkZXByZWNhdGVkIGZvciBmdW5j
dGlvbnMgDQpwcm90b3R5cGVzLCBwbGVhc2UgZG9uJ3QgYWRkIG5ldyBvbmVzLCBldmVuIGlmIG90
aGVyIGhpc3RvcmljYWwgDQpwcm90b3R5cGVzIGhhdmUgb25lLg0KDQo+ICAgDQo+ICAgZXh0ZXJu
IHZvaWQgX19sb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyB2bWFkZHIsDQo+ICAgCQkJCSAgIGludCB0c2l6ZSwgaW50IGluZCk7
