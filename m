Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7655BB72F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 10:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MV3hg2pBNz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 18:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=n2aMo6NL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.88; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=n2aMo6NL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90088.outbound.protection.outlook.com [40.107.9.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MV3gq41cnz2yXH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 18:16:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CofWjqvdMl71Xc3WS5fa0lT+tp0k3XQ30PENGLdvcDWYulzQ0M0hah8bzkuKAASmzCaGPeqhdh0IEVtjDo9gBtjdz43atd83rE2/xx8VDltQgebX0i+1BJXoQrclQTb8Og5Jz/E5th355tUZ8PSfGnZyhdoNT0agSlNpaeH5lwvvhsT2+Slw4RhagIPgxJqOMCXki8w6Tn4pA/+HhiUirYy3ARqahzKnRjcF0FnLwiUNBFnTlPoQZG/63bl/XmdPUR8vgm5UPP5vp5AcRmU3zaScfzSkw3WbvmqvMy999nPCt1fGaw4kXYIuR5/oF9qtef+h22PexFpdELgokzCczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xFpAbZjk4YleiPMZ1fP1PNsPj6pVrrI/gdHDe19+HU=;
 b=f5Kngcj2xi5Q39eCv5WJke7sAUF1o1viiXZiqyNVusaPGDEqOyrhCSIGOMasiOSyP5wVlpi1R0PIRCtVGD+pW2feV1M/67tUOrFtS+BcmbbAEY3l2kG8lPqhz9qXSdyGJoREcwmdm9bv8xzQTFW48c8AodBDuIUPrPsfCSZlUGTRhSYblg/4tKDZGi0pQq0Mh3nRgcRW7ieudHRf9x5y0RX+LthsemhBkxZm49umJ0g9B/SYbIVMQILNADmUPYu1oIyOV/MCof+P1XVpowY1HMk7JnY34ZiQXRLBG7NUTv+DM1noHfVLGXOktdy3GvxyNVCH+wQfdmCFyTq1eDmo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xFpAbZjk4YleiPMZ1fP1PNsPj6pVrrI/gdHDe19+HU=;
 b=n2aMo6NL3M4aI+dJ5FjBZCRMk329AduoV34xSPUPWGviptlS476JXBo88EthRgweZEET98G7bWMmZfeRWzwz2qRs7QorR0laj1ZtJG/8zwzm4ehq48pCGYIjvH9kKKRFvvzeq8qqyfHOdkbna2LaFrUAJq4UlimqkSIbcezCK8wZOeO5JQSScS/3TSkxVmbLuOYq97ZTeA1O0z/Sxgm1iIaIfhWDNgAq6UkWSHfwLjajRkr3YUIf4bUDF6p/jhB8AgNIzAJLUGF1/pQO3bo1D63VqAEFarukIAY7+hejGN3NsFRJAQWMO0K2k1akO97UkFgSTtt/Av9bsLv+wOj/ag==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Sat, 17 Sep
 2022 08:16:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5632.018; Sat, 17 Sep 2022
 08:16:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Samuel Holland <samuel@sholland.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Topic: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Index: AQHYyYnrawisyGt7e0mr4Du3kDJFGq3jSIUA
Date: Sat, 17 Sep 2022 08:16:34 +0000
Message-ID: <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
In-Reply-To: <20220916050515.48842-1-samuel@sholland.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2125:EE_
x-ms-office365-filtering-correlation-id: 6c8f471d-162e-41e3-e257-08da9884ef26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  SM45ufX7ApqR/Tt9UAyy4J/kSv1oMvmcKYdEsRLUhPBpKr5VwSJZ0kqSh1NQjPack6ADnyzfcheHFuip4ACwKI8OQ5V5GCwY9IhjJNEZxODROCxPB41oK+8tak45OEU8UgoJ1CjjUsirnNUtderOAB0adhVnoG6sYfQ4U0uNjcXYgJ+avzlYCwriEBdKZqkjTjBgZ0MKwQG4M82Mfh22nuTq4ONroqOO8niUGvxutXbU+K1LcwG1PDAW0yVwrq9eutdoqZhbyCQwDEAuDT3/0hFmVDthqNrCSHhpeOjhpbcWnFk0XR9uhe+/jhMUIf++lUIUWjcvQeJONVt8PoXWjf+ehREGVgv6YikFSRmla0pzPu+Im2s3tXSPjkOddn503JlXxgTOzKPgTlu5f/t94EPSKrkDLbslplAimMms34GA7SyDJbqjpp/bdUOIHmvaCq3hpsrhTXXYOSODbF93WfgaizNrNkvPLqGaX2MNll7EhZE1Pur39+GHsuRfwDnJ+JK0IwIE2QIEW9VGO9xURlh7f5re4CYHSk2CBYEDaJeDdC8GuPp/0LNyzGKg3K0dQnmGGhFQ4d7RnDbZw/gRckYWWoOVm2/5Tl4ekG3G69XLvJc+JRgUZypM7jqKxG3j8ZNs/hix1lXXhWKRM/KK7gJL/Dzl4VTxSYso9JUd33fGQKXnZ4mbEzHriNENg+2DhrTV+Yaq3irEFBimbpCSRWcrOTMPNOMpfMO0fblANtpBVzCvKECFKE0G/4fDJoed6sW6qPwtqzMHsoMniG8nqetu20XSxTOCUF2MSef2g5pYdCbIQWNBQzBgRuIay4ZrNaBH8KQEr3uXziyNN/cAVQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(451199015)(41300700001)(66476007)(66556008)(64756008)(66446008)(71200400001)(2906002)(38070700005)(86362001)(31696002)(478600001)(6486002)(186003)(66574015)(83380400001)(54906003)(110136005)(316002)(2616005)(8676002)(6506007)(4326008)(91956017)(76116006)(66946007)(26005)(6512007)(36756003)(38100700002)(122000001)(5660300002)(31686004)(44832011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aCtZNmJiSC9GMURPODNTem1HcXBoUitIVkR6eUNqeVlPbjBCck5uUUQzNjUw?=
 =?utf-8?B?aXd5Njg3bDhvNzdFaDdFeXRUSnpXOXljZjFONUt5cnFTNVFidkJ4Ri9GQVcx?=
 =?utf-8?B?UnNzSkpEWkIwKy9rRmFSR1ZYY3FxZTZIc3h4S210NHhnTDRKOFJzOVhrTkFa?=
 =?utf-8?B?R3JVU3MwS0hMQVZzY3VyOTh1eFBMVkg0L09PNzN3aXRqSGpzai9hdFR6MTFs?=
 =?utf-8?B?R0NwMEExdVhJVG9SSUhxc1ByRGVncGNDMVhGS3pMK1FyVEVMUE9MOUkwdnhZ?=
 =?utf-8?B?K2pVNjlZSE8wRDZWK2JRa0lHYmkvSytBZ2UyRzRSSHVsRHJWWDByS2FZVXlJ?=
 =?utf-8?B?bTlvcHREZ2xVUFIrazZvRlBNVkU2dHlaWGptMW5nZWpDQWNnVk9PemcwSGZS?=
 =?utf-8?B?ODBwTGhOZ2VRTjl2OFJqUTFZUDNJeUVpWTlMcHppclpPa21XQ1JWZ3A2QWV3?=
 =?utf-8?B?dHVldjI5RVJNUFpxbTBsL3NEUHdDODlFNjFsM2pKWXZWcWg2ZzhLY0NjN2M0?=
 =?utf-8?B?T1EwNVRCQTJDK2xyZ1lQUEpVbDdvUm14WjhZNDh5ODYwRlV0SitKV3QxY0JI?=
 =?utf-8?B?bWlSQk1sVVIzM2pSYmRTeGtxUnVmQk5uQ0QvOFFyT0p1YlU2STRTK0tPTk1W?=
 =?utf-8?B?VkxvY0Y2VUlINXVxWjVzZW5kbEFFMG5IZGk1Uk5rdXV3ZUh3Nm0zZ0N0SEdp?=
 =?utf-8?B?aEF2c2Q0eTV0R29YMkpTVzVud3NYTDVGQ2toR3FBS3JiVjdFN3hpT3pSSnhE?=
 =?utf-8?B?WXRSdi9tajdTaWRHQitzYzV3M0l0L0UwMW1tejNGQzVxek8rRjF2YU9la0ht?=
 =?utf-8?B?SlFrbzdiOE1Rc3ZLRkFjcGtDT0JqbDJGTmdzdXo3dG1lWHphMXExMTh5UTRW?=
 =?utf-8?B?cE1MM2NJQVNwck5aOUEvU2FWcWt3WDNXRDVQQmZMUi9pUGMwTGhVZ0VuL1dV?=
 =?utf-8?B?Z3pBQWppZ2xIUlhEZDhjZ05ITk1YSVVKaXdpczBVQXpGRkEzaGQwUDBjTTdN?=
 =?utf-8?B?VVcxUzMxUUJOZGVkWlhaWFpRdWF3d0hublY1RnVabUxCQmFhWVNWLzJ6ejY2?=
 =?utf-8?B?NXdyUlUxZVRHb2dDTEZwamZHM2QwZzdNMXF5dnpSUXRuRDZXcDdCcHZqcFhH?=
 =?utf-8?B?dXdKRzZmQnJhb3RXN1JqMTlCSUNkK3pIVUI0R2tKK0pjbEhUWTd4YzRrSW1U?=
 =?utf-8?B?QVpYTUVleXhQRVl1WDZ6S080alBPM0taR3lBalV5V1NrcVc0RUdQcU9iRVVN?=
 =?utf-8?B?c2ZUUmsrWVNyREZmZUYzVHNhZlFtTWgxcitDQ0hzcThFMXhpTWR4aURmOUJq?=
 =?utf-8?B?d0RpMlA0RzVCanFDRHlTU3hLeVZzZnZ5cFZyYjRBSVg3TXI4MVAyOFZTOHRJ?=
 =?utf-8?B?ZjNMWmxqSVdIZ3RkRWNYUjg2bzhFaDRENmplZVRlWjZKR2Qwbktha1pmKzBH?=
 =?utf-8?B?YzA3RlJ0SDZyRkQweXJNaVQxWHpHQmpYSXdISXFkQXAxVWd2MWR0SEJ0SkZl?=
 =?utf-8?B?OGNOVHY2Z04rR1drVXhPbEVBRmNEVXR3US9ndGdtU01aREg4SG0vNmpBUXQr?=
 =?utf-8?B?VGx5SGxmT1NBWml6Mi9KYnJmc2NHRjFHYW1CUE5DZElvdEE1bFM3b2FNUmFR?=
 =?utf-8?B?eXEzbXZaL1g1ZU1RMDNwc0F6b2xzcHpHM25tbDR4RUE2Yk15M281dG1oNENL?=
 =?utf-8?B?cTdRbDJLNHZ2T25pK2hoQTVFdzVGbU5RalBhaW5WQnZ4bjdCZHkxd21mL1pM?=
 =?utf-8?B?c1B3dzZIWG4zOFNmSGYwZ013RVFEK2ZTbExhOXVuWG9QdGRmelhpeVJhM0VK?=
 =?utf-8?B?Vkdaall2M0J5UEtvc1VFSVRCdmttbzJRNEs2T1A1c2pic095eVNHN3VTRWxY?=
 =?utf-8?B?WjJvaUpQMzNmT3BjVWJtTUdqaDBCYWc5bmtZMkl2UXNXaWlNM01GeUZDaUYr?=
 =?utf-8?B?MmtJc2MwUnBHZ1Z0d3JjdW9rbEJYdXo3L3NlVkZOOHE5bHRUUDB5aEdQR0F2?=
 =?utf-8?B?MVZ2d3JDOGgyaFAvRk9nRndqMk1TWGs1UTJ4Zy8yQjdUMGp1RUVOWWhLSTVK?=
 =?utf-8?B?a3dBWUlIWTN1bjN0ZUsxU0lleVZMejU5VkttWjQwNVRtVXc2c0diTWJlanRC?=
 =?utf-8?B?SHZXTlhFTFA1OXIrZ1FleVhsRGo5WkJVeE9oZXg0cjNpUzAwN3NTMWZlY0Q5?=
 =?utf-8?Q?xD/T/lBCRE+AVphnGrhzgkc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F89C74CEE943024C9AA5513A20AB2416@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8f471d-162e-41e3-e257-08da9884ef26
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2022 08:16:34.1129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+X77tt9fkb/OwB1mekt6mGcL/Ibhok3cMu3vsJDNtq92KNgq1vWrwhfvpLlp5BmEJ4Mq+e4qZ2bnKCus1uhq5BGTQUIWpjw+6vNdlFS8Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2125
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMDc6MDUsIFNhbXVlbCBIb2xsYW5kIGEgw6ljcml0wqA6DQo+
IFdpdGggQ09ORklHX1BSRUVNUFQ9eSAoaW52b2x1bnRhcnkgcHJlZW1wdGlvbiBlbmFibGVkKSwg
aXQgaXMgcG9zc2libGUNCj4gdG8gc3dpdGNoIGF3YXkgZnJvbSBhIHRhc2sgaW5zaWRlIGNvcHlf
e2Zyb20sdG99X3VzZXIuIFRoaXMgbGVmdCB0aGUgQ1BVDQo+IHdpdGggdXNlcnNwYWNlIGFjY2Vz
cyBlbmFibGVkIHVudGlsIGFmdGVyIHRoZSBuZXh0IElSUSBvciBwcml2aWxlZ2UNCj4gbGV2ZWwg
c3dpdGNoLCB3aGVuIEFNUi9JQU1SIGdvdCByZXNldCB0byBBTVJfS1VbQUVdUF9CTE9DS0VELiBU
aGVuLCB3aGVuDQo+IHN3aXRjaGluZyBiYWNrIHRvIHRoZSBvcmlnaW5hbCB0YXNrLCB0aGUgdXNl
cnNwYWNlIGFjY2VzcyB3b3VsZCBmYXVsdDoNCg0KVGhpcyBpcyBub3Qgc3VwcG9zZWQgdG8gaGFw
cGVuLiBZb3UgbmV2ZXIgc3dpdGNoIGF3YXkgZnJvbSBhIHRhc2sgDQptYWdpY2FsbHkuIFRhc2sg
c3dpdGNoIHdpbGwgYWx3YXlzIGhhcHBlbiBpbiBhbiBpbnRlcnJ1cHQsIHRoYXQgbWVhbnMgDQpj
b3B5X3tmcm9tLHRvfV91c2VyKCkgZ2V0IGludGVycnVwdGVkLg0KDQpXaGVuZXZlciBhbiBpbnRl
cnJ1cHQgaXMgdGFrZW4sIGt1YXBfc2F2ZV9hbXJfYW5kX2xvY2soKSBtYWNybyBpcyB1c2VkIA0K
dG8gc2F2ZSBLVUFQIHN0YXR1cyBpbnRvIHRoZSBzdGFjayB0aGVuIGxvY2sgS1VBUCBhY2Nlc3Mu
IEF0IGludGVycnVwdCANCmV4aXQsIGt1YXBfa2VybmVsX3Jlc3RvcmUoKSBtYWNybyBvciBmdW5j
dGlvbiBpcyB1c2VkIHRvIHJlc3RvcmUgS1VBUCANCmFjY2VzcyBmcm9tIHRoZSBzdGFjay4gQXQg
dGhlIHRpbWUgdGhlIHRhc2sgc3dpdGNoIGhhcHBlbnMsIEtVQVAgYWNjZXNzIA0KaXMgZXhwZWN0
ZWQgdG8gYmUgbG9ja2VkLiBEdXJpbmcgdGFzayBzd2l0Y2gsIHRoZSBzdGFjayBpcyBzd2l0Y2hl
ZCBzbyANCnRoZSBLVUFQIHN0YXR1cyBpcyB0YWtlbiBiYWNrIGZyb20gdGhlIG5ldyB0YXNrJ3Mg
c3RhY2suDQoNCllvdXIgZml4IHN1Z2dlc3RzIHRoYXQgdGhlcmUgaXMgc29tZSBwYXRoIHdoZXJl
IHRoZSBLVUFQIHN0YXR1cyBpcyBub3QgDQpwcm9wZXJseSBzYXZlZCBhbmQvb3IgcmVzdG9yZWQu
IERpZCB5b3UgdHJ5IHJ1bm5pbmcgd2l0aCANCkNPTkZJR19QUENfS1VBUF9ERUJVRyA/IEl0IHNo
b3VsZCB3YXJuIHdoZW5ldmVyIGEgS1VBUCBhY2Nlc3MgaXMgbGVmdCANCnVubG9ja2VkLg0KDQo+
IA0KPiAgICBLZXJuZWwgYXR0ZW1wdGVkIHRvIHdyaXRlIHVzZXIgcGFnZSAoM2ZmZjdhYjY4MTkw
KSAtIGV4cGxvaXQgYXR0ZW1wdD8gKHVpZDogNjU1MzYpDQo+ICAgIC0tLS0tLS0tLS0tLVsgY3V0
IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiAgICBCdWc6IFdyaXRlIGZhdWx0IGJsb2NrZWQgYnkgS1VB
UCENCj4gICAgV0FSTklORzogQ1BVOiA1NiBQSUQ6IDQ5MzkgYXQgYXJjaC9wb3dlcnBjL21tL2Zh
dWx0LmM6MjI4IF9fX2RvX3BhZ2VfZmF1bHQrMHg3YjQvMHhhYTANCj4gICAgQ1BVOiA1NiBQSUQ6
IDQ5MzkgQ29tbTogZ2l0IFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjE5LjgtMDAwMDUt
Z2JhNDI0NzQ3MjYwZCAjMQ0KPiAgICBOSVA6ICBjMDAwMDAwMDAwMDU1NWU0IExSOiBjMDAwMDAw
MDAwMDU1NWUwIENUUjogYzAwMDAwMDAwMDc5ZDlkMA0KPiAgICBSRUdTOiBjMDAwMDAwMDhmNTA3
MzcwIFRSQVA6IDA3MDAgICBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgICg1LjE5LjgtMDAw
MDUtZ2JhNDI0NzQ3MjYwZCkNCj4gICAgTVNSOiAgOTAwMDAwMDAwMDAyMTAzMyA8U0YsSFYsTUUs
SVIsRFIsUkksTEU+ICBDUjogMjgwNDIyMjIgIFhFUjogMjAwNDAwMDANCj4gICAgQ0ZBUjogYzAw
MDAwMDAwMDEyMzc4MCBJUlFNQVNLOiAzDQo+ICAgIE5JUCBbYzAwMDAwMDAwMDA1NTVlNF0gX19f
ZG9fcGFnZV9mYXVsdCsweDdiNC8weGFhMA0KPiAgICBMUiBbYzAwMDAwMDAwMDA1NTVlMF0gX19f
ZG9fcGFnZV9mYXVsdCsweDdiMC8weGFhMA0KPiAgICBDYWxsIFRyYWNlOg0KPiAgICBbYzAwMDAw
MDA4ZjUwNzYxMF0gW2MwMDAwMDAwMDAwNTU1ZTBdIF9fX2RvX3BhZ2VfZmF1bHQrMHg3YjAvMHhh
YTAgKHVucmVsaWFibGUpDQo+ICAgIFtjMDAwMDAwMDhmNTA3NmMwXSBbYzAwMDAwMDAwMDA1NTkz
OF0gZG9fcGFnZV9mYXVsdCsweDY4LzB4MTMwDQo+ICAgIFtjMDAwMDAwMDhmNTA3NmYwXSBbYzAw
MDAwMDAwMDAwODkxNF0gZGF0YV9hY2Nlc3NfY29tbW9uX3ZpcnQrMHgxOTQvMHgxZjANCj4gICAg
LS0tIGludGVycnVwdDogMzAwIGF0IF9fY29weV90b2Zyb21fdXNlcl9iYXNlKzB4OWMvMHg1YTQN
Cg0KLi4uDQoNCj4gDQo+IEZpeCB0aGlzIGJ5IHNhdmluZyBhbmQgcmVzdG9yaW5nIHRoZSBrZXJu
ZWwtc2lkZSBBTVIvSUFNUiB2YWx1ZXMgd2hlbg0KPiBzd2l0Y2hpbmcgdGFza3MuDQoNCkFzIGV4
cGxhaW5lZCBhYm92ZSwgS1VBUCBhY2Nlc3Mgc2hvdWxkIGJlIGxvY2tlZCBhdCB0aGF0IHRpbWUs
IHNvIHNhdmluZyANCmFuZCByZXN0b3JpbmcgaXQgc2hvdWxkIG5vdCBoYXZlIGFueSBlZmZlY3Qu
IElmIGl0IGRvZXMsIGl0IG1lYW5zIA0Kc29tZXRoaW5nIGdvZXMgd3Jvbmcgc29tZXdoZXJlIGVs
c2UuDQoNCj4gDQo+IEZpeGVzOiA4OTAyNzRjMmRjNGMgKCJwb3dlcnBjLzY0czogSW1wbGVtZW50
IEtVQVAgZm9yIFJhZGl4IE1NVSIpDQo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWxAc2hvbGxhbmQub3JnPg0KPiAtLS0NCj4gSSBoYXZlIG5vIGlkZWEgaWYgdGhpcyBpcyB0
aGUgcmlnaHQgY2hhbmdlIHRvIG1ha2UsIGFuZCBpdCBjb3VsZCBiZQ0KPiBvcHRpbWl6ZWQsIGJ1
dCBteSBzeXN0ZW0gaGFzIGJlZW4gc3RhYmxlIHdpdGggdGhpcyBwYXRjaCBmb3IgNSBkYXlzIG5v
dy4NCj4gDQo+IFdpdGhvdXQgdGhlIHBhdGNoLCBJIGhpdCB0aGUgYnVnIGV2ZXJ5IGZldyBtaW51
dGVzIHdoZW4gbXkgbG9hZCBhdmVyYWdlDQo+IGlzIDwxLCBhbmQgSSBoaXQgaXQgaW1tZWRpYXRl
bHkgaWYgSSB0cnkgdG8gZG8gYSBwYXJhbGxlbCBrZXJuZWwgYnVpbGQuDQoNCkdyZWF0LCB0aGVu
IGNhbiB5b3UgbWFrZSBhIHRyeSB3aXRoIENPTkZJR19QUENfS1VBUF9ERUJVRyA/DQoNCj4gDQo+
IEJlY2F1c2Ugb2YgdGhlIGluc3RhYmlsaXR5IChmaWxlIEkvTyByYW5kb21seSByYWlzZXMgU0lH
QlVTKSwgSSBkb24ndA0KPiB0aGluayBhbnlvbmUgd291bGQgcnVuIGEgc3lzdGVtIGluIHRoaXMg
Y29uZmlndXJhdGlvbiwgc28gSSBkb24ndCB0aGluaw0KPiB0aGlzIGJ1ZyBpcyBleHBsb2l0YWJs
ZS4NCj4gDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMgfCAxMyArKysrKysrKysr
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
cHJvY2Vzcy5jDQo+IGluZGV4IDBmYmRhODljZDFiYi4uNjliMTg5ZDYzMTI0IDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3Byb2Nlc3MuYw0KPiBAQCAtMTE1MCw2ICsxMTUwLDEyIEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBzYXZlX3NwcnMoc3RydWN0IHRocmVhZF9zdHJ1Y3QgKnQpDQo+ICAgCQkgKi8NCj4gICAJ
CXQtPnRhciA9IG1mc3ByKFNQUk5fVEFSKTsNCj4gICAJfQ0KPiArCWlmICh0LT5yZWdzKSB7DQo+
ICsJCWlmIChtbXVfaGFzX2ZlYXR1cmUoTU1VX0ZUUl9CT09LM1NfS1VBUCkpDQo+ICsJCQl0LT5y
ZWdzLT5hbXIgPSBtZnNwcihTUFJOX0FNUik7DQo+ICsJCWlmIChtbXVfaGFzX2ZlYXR1cmUoTU1V
X0ZUUl9CT09LM1NfS1VFUCkpDQo+ICsJCQl0LT5yZWdzLT5pYW1yID0gbWZzcHIoU1BSTl9JQU1S
KTsNCj4gKwl9DQo+ICAgI2VuZGlmDQo+ICAgfQ0KPiAgIA0KPiBAQCAtMTIyOCw2ICsxMjM0LDEz
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCByZXN0b3JlX3NwcnMoc3RydWN0IHRocmVhZF9zdHJ1Y3Qg
Km9sZF90aHJlYWQsDQo+ICAgCWlmIChjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9QOV9USURSKSAm
Jg0KPiAgIAkgICAgb2xkX3RocmVhZC0+dGlkciAhPSBuZXdfdGhyZWFkLT50aWRyKQ0KPiAgIAkJ
bXRzcHIoU1BSTl9USURSLCBuZXdfdGhyZWFkLT50aWRyKTsNCj4gKwlpZiAobmV3X3RocmVhZC0+
cmVncykgew0KPiArCQlpZiAobW11X2hhc19mZWF0dXJlKE1NVV9GVFJfQk9PSzNTX0tVQVApKQ0K
PiArCQkJbXRzcHIoU1BSTl9BTVIsIG5ld190aHJlYWQtPnJlZ3MtPmFtcik7DQo+ICsJCWlmICht
bXVfaGFzX2ZlYXR1cmUoTU1VX0ZUUl9CT09LM1NfS1VFUCkpDQo+ICsJCQltdHNwcihTUFJOX0lB
TVIsIG5ld190aHJlYWQtPnJlZ3MtPmlhbXIpOw0KPiArCQlpc3luYygpOw0KPiArCX0NCj4gICAj
ZW5kaWYNCj4gICANCj4gICB9
