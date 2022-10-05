Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42E5F5A8E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 21:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjPXP32q4z3bl0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AzqvWZLk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.47; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AzqvWZLk;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90047.outbound.protection.outlook.com [40.107.9.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjPWR2kCZz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 06:18:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no8RiyDF6MIWstJdW5cU+ojLx8tnj0C+1t+o5Uxogl+7vIwK3XvFK0d71K6zguKl+QENcbEXGMyUHodPyYGHhA2mYu0TeBPKLAB/5owbGj2ghYf2lGmhfYk6s30GE/e4+0IREzLi6FOAEiZ18JQ0JsBbvaioS5JE1aggErtIY4t2mHB2XBIXGE/3sZ+xkyw4ukJ1oRRMyC/F82QlEnoa7SYllWzK1HJfgS0/pg5YkQ8p639JWTuIzAIbVWlYEM2a3l4qSNMeKHQT5+Y2IvQrgEO/6hGFJbQbDVj9sRuIb4oNruRcZYWfEhMFGhMtQ5jdujBYDqSaqL3aFT0Co26k4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEtP1hlKUfrZMcCQGSx4+fl30J+dqxCG4Df6pijfDjI=;
 b=G1Hs/1srRvF9d0haKP9bL6cgi8/5frJTf1Z7Ld/5GnwNIt9UsC8o6BH0X0cPKClgHSd0Ga2msTUKOhe4o/cpVKKs+AIDgtGXuXiQxRzWhPjOt3omLw6eMWGDCXbwL5U4asNJeY1swf/aGdCyDf4/qeRnkYoCpjsRrAC20NurljDm6GrDI08i2S1Id0nbr5v6Q5r4ZlCDmN8Id1io+R1qT+VWACI8vzVWlJGI/Uji7KUDd/fhsIv00JBmAEUgTzqZ9TAapCRc9ovDemPbQcdtYo5HOF1yJDsGvc391fTnc/fNtWJaiZhnlYPiePLjHap5rQGPTZ4/IE3YS+irtYDukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEtP1hlKUfrZMcCQGSx4+fl30J+dqxCG4Df6pijfDjI=;
 b=AzqvWZLk+alD5BWAvo5drWf9OIA6lXoipq4P9GLLyzL3CCuITbuRAPyIRfSSMsjc7OEiEeaK0Xro27KxH20vtHRy+b0HRcfcOBzcJuTC+f30lcsFg5QPiAle3iQntNQ01XZvRju+5utqhD3wRFYU9mBd+LL+2CyD9tRAR4k854OFd0iMFyOqw82icSbzbJMwubnrSqmDCV11lOXgNBKoGbh8uN5SWqz6LHOaGcYOksA8irRjysrBz3YjZykBiiVELJjTQKlC0YnWFqcYdxpDIlBvYkN8zMBN2hFneE/t/bvhh84YofgJwJR0JJeAaPBHWFpEnEeKjiEBmMGqsadxqQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2155.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 19:18:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 19:18:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/6] powerpc/module: Handle caller-saved TOC in module
 linker
Thread-Topic: [PATCH v3 2/6] powerpc/module: Handle caller-saved TOC in module
 linker
Thread-Index: AQHY2HvvV8yLNYq0QU+PJdsamnWLQ64ALZAA
Date: Wed, 5 Oct 2022 19:18:39 +0000
Message-ID: <3e411080-5f68-1ec8-b2fd-bb508a81078a@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-3-bgray@linux.ibm.com>
In-Reply-To: <20221005053234.29312-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2155:EE_
x-ms-office365-filtering-correlation-id: ccc8d87c-2f49-44c9-66de-08daa70668d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dLBglw3pDDaGcU4QYZCTjqhOlj90DkVZuUlLdRCRftBErpdWJcpaT5A9p1LON4bPiBxIkKg/n9oYrLi/dfOA8M12rzTq/EeAumoVkGW8eSVWeBo61kWLwQ5KhsTJukHv3MbG+jHVL2JWCumYLBiSXxwi8qvTc5zq9h3xUynXWGqf11aQF7urWDYUifL8kde8+m+pTnbDFfppJJWo5jLtfpJANoq9/F9ACn7mcM6s4rPYKKvm7HQ+FMxW/wqoeBh8ZzVEdv3z7/p5UhB6uEM6WxzYSAPafSUinzy0pC5R+neGBSyFyUcrjapSQXOTt7ArAOz4dizV7Kcz/o+ryLdI8TF4U1FJzgjJ2llqfr53FDAZXBDuMv+w0b4iFGEq1yy4DHHaCcY+EQ+CsRKCUxhhtwnrFPXuyqWMkYQa0xxsM8uAdA9G0zCJXc6esMbRG4288M78arw5rJAn9k91MIdveVgS6o2nuu8kJuFmoGTkfr2r0r9RonhUbo8C4iX94wzccpEezt/uqYsEOAPMll+Z+S0cBkIEVaygyCJmlfABd6E4QKaGrKUO+kJPiOAzIxJma6sy3sRIIC7FqzOcKnQfQdQ6qRoEz6cEguvfuGSDHnuQPlM/rmsDvY5AYPJfbzK4tswN1Pqdy15cBOLmIXlFyGWejzvLxCCILEc22HzREdFS1vse2Z5S4UuVFCWOtuiOZcOtmBOONrACY2AZUGpVKpfWN4Y5jxpq+wv1wWAteyYTcG3ANdxtIE6DkAA/ItRLIV7NLtL/6cNSNM1N2/McRUzZKAeia9x567kqkdPXlu8hU8OncitdBtoF/8x9zy7DQu5jfhzYBd7Y0Y8nmiO+Ew==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199015)(83380400001)(186003)(66574015)(38100700002)(2616005)(31696002)(38070700005)(122000001)(2906002)(5660300002)(7416002)(44832011)(41300700001)(8936002)(71200400001)(6486002)(26005)(478600001)(6506007)(6512007)(76116006)(4326008)(8676002)(64756008)(66446008)(91956017)(66476007)(316002)(66556008)(66946007)(54906003)(110136005)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SFk2WW01VmJpbmFYKzhGTHkvWXFTUzJRZ3dYaExaUENSbUYrQUl0c0NhaFU1?=
 =?utf-8?B?dERIUG5KU2ZxTGZseVpaQzVvOERsVlorenNMbWlxWm5lOE5iemZjNlhYYytm?=
 =?utf-8?B?SndxRTdMT2dVTDZTbk00N1QyRFQ5S2x5MGhEUkJVUDdSbmJnZjZCRlU5ak5U?=
 =?utf-8?B?SVNqWlBpWERjUFZGR1FPVEZ6T2dvSmFuWTJCYyttUGNGcVRoTGRmelFaZDh5?=
 =?utf-8?B?RWR3bCsyUzJzeXQ5RzdDZjIvYXNsSkNFeHdRa0VMMzRrTXFqZTVlaXVadnpL?=
 =?utf-8?B?Y2ZMWnVXUGdUTDBGYkFZeEYxdzNQdjQ4bThub3k4SWdDLzFmM2dlNVhsc0lk?=
 =?utf-8?B?Nll0REhwQ2NNZXY0ZjFZMEhTZFFQa1FudmpsY3dWTHhibDlOYU4wc3lxbGgx?=
 =?utf-8?B?VG5NRGJldnVWNlBIUkMxOWh5a3c5NjRpSDlJM1NyMXBudCtJMmxQSXc5dXVB?=
 =?utf-8?B?SDhlbjFtZStMMUhBTTNqbWJhcTBqTnNyVDJKMjE2ZUc0NlFrbEhGVXNjNjkw?=
 =?utf-8?B?NU1PZGZwZVNLWitITEJCdGJjRnFsTTB3R3p2cWsxYW54Mk5PTGFuVTlOZDll?=
 =?utf-8?B?VHRsdk1WS2MvQmlSRkk0Rys0RnRNVmpXY2V1SWhmNHpNbVkwS2VaSGxSR0pa?=
 =?utf-8?B?V2t1cnRGcWIzdjYrREFpcEs1VVh0SSt0NTd2NWN0eGk4VkUzZGNGWmwwUnBO?=
 =?utf-8?B?bjNIL3RHRzNDNGNxemk4ZFV0VFJzU1ZPSWVVQzlUTnJabGxzU3BCdE9MNjhR?=
 =?utf-8?B?Q0VpMytlNUNqQVpWU0w1T0ttamN6SHNQZnc1RUkvN1M2bHdZemJrY0xUN0Jx?=
 =?utf-8?B?amRxeXVZOHNtdlExRGtoYVVZaGZjajdqZ2w0cnV3ais3UlkxZkxZdWE5NDM5?=
 =?utf-8?B?c0JoS3d6OXlGNWFoUzlzdE9QOHdkZzd3OHF0SmkwRXBUS1c5dWlCaU95RnFH?=
 =?utf-8?B?czN6V28wV3Q0MEFRNWl1eGVWQ0dvK1Ftc1RITGpvZ1MrSE13bjJheHpZQlVI?=
 =?utf-8?B?ZTkwdzRvbDA4WEh2N1JDOUdUMUtrZkkxMVpQQjdiUm9HUDRRT1lGRThXMlEy?=
 =?utf-8?B?RkswU2JQdG13NEhxQ3Nad0Q3eFp0clhGQndUTlM3aDlJQU9lZVBEb3Uxa0dK?=
 =?utf-8?B?NmQxZ3ZNajZoWVRhSmJ3LzJrc1ZveWh5SVpZeFdncm5KUDZudm16NnMzQ3hl?=
 =?utf-8?B?Um1ieWNyL2pSYnd2alJScmxwVkJLZmRlTUFVblptK2t2SGNtaWV1RXMyUTMw?=
 =?utf-8?B?MXFFYW9XR3VDcXMyazN5cFVKdGFSM093bUIxYzAyVzZpN3pXVWxXN2pPYTFm?=
 =?utf-8?B?bTZoNGw4UlEvZFVoaWJjS0FjQkhsMVhTUjMreURSNDlwSG9Cbk1oRDUyRDk2?=
 =?utf-8?B?UDhucVlEK2M2U0k2TzFHZ3hkaElVZHlWQ2hqRU5OdCs5SnhsTHR4SGhjd052?=
 =?utf-8?B?Vm5lbFRBNUU2ODRVdVBzU2RvMm82VjM5MHN2WGY1UlErTDVuNnNYTHhqNDA3?=
 =?utf-8?B?Zi9vM2V4QmFYdVJrQ3ZoTmVtRDErS2V6ZUt5Rnp6Q1lPdXZhY0tlUG41Rnpv?=
 =?utf-8?B?cjBldnNmUWtKN3BTVEdsS0VnYzJlZjVuVzJnUEV6em5tb296VkR5ZkFVTUlu?=
 =?utf-8?B?dERueWVyM3hocVlrSTBBQzhndFVETDZVOWk2L1JqSnJ6UkhHY2Q5UEcwQmxp?=
 =?utf-8?B?WXhyVDhWWmVkVnpmWkZMM3hybWNOZ21UNkNsYUd5RUxZdG1SN0wzVnJJNDBr?=
 =?utf-8?B?WnlVRlhkVm1kZU9JbkRUWklSY2l0UVdWbTdlVU82emZIRXIyUFYydXFjLzV2?=
 =?utf-8?B?SEhJelJPVjBWaEJpeXNydkY1NGhMSTAxSko1YmcyM0tUemZPSXV1dVdZZklv?=
 =?utf-8?B?QjBxd21YVjdjcWxBTjZMSm5Fd0hWUC9QOUxiM0I3eDA5c0hKN3VqSHQvbEtB?=
 =?utf-8?B?S3Rmb2xURFB3clRmUGU4eHVCMDB5bVFlU3lPZXRwMTNpN2RXQ0FxWnpQSEla?=
 =?utf-8?B?UXQ1MWlGZXovcXJkM1o5QmRmWm1DZm13ZkVxbnRzWnlhUk1wQ2lYZlhFN0la?=
 =?utf-8?B?Ulp6V1AwcStXdWpPMkRkSlZmeG0yV2RYbWtWMXZlQTl0RnNHZnhOL3ZTL3oy?=
 =?utf-8?B?UzhBOE9ndnlwUitJUnJVMnh5TXYwaVhGMlMrNG15Y1RtOTBiemE0TDUrQUwy?=
 =?utf-8?Q?nppeh/5q/p2kt5iL+xob5P4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E606396640514B4CBE2FA8B3A8FE3905@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc8d87c-2f49-44c9-66de-08daa70668d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 19:18:39.6452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwIcaMOhwveG08hSQULLP8FAekjfJMKBgQU+FHcUDEMZoiMwybvJOOoYmc6U0NPRGgBIFL8ntS9hSENAJA+vKiOgdQyo2yg/rkautScoX7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2155
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEwLzIwMjIgw6AgMDc6MzIsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGNhbGxlZSBtYXkgc2V0IGEgZmllbGQgaW4gc3Rfb3RoZXIgdG8gMSB0byBpbmRpY2F0ZSBy
MiBzaG91bGQgYmUNCj4gdHJlYXRlZCBhcyBjYWxsZXItc2F2ZWQuIFRoaXMgbWVhbnMgYSB0cmFt
cG9saW5lIG11c3QgYmUgdXNlZCB0byBzYXZlDQo+IHRoZSBjdXJyZW50IFRPQyBiZWZvcmUgY2Fs
bGluZyBpdCBhbmQgcmVzdG9yZSBpdCBhZnRlcndhcmRzLCBtdWNoIGxpa2UNCj4gZXh0ZXJuYWwg
Y2FsbHMuDQoNClRoZSAnY2FsbGVlJywgd2hhdCBpcyB0aGF0IGhlcmUgaW4gdGhhdCBjb250ZXh0
ID8NCg0KRG9uJ3QgeW91IG1lYW4gdGhlICdsaW5rZXInIGluc3RlYWQgPw0KDQo+IA0KPiBUaGlz
IGlzIG5lY2Vzc2FyeSBmb3Igc3VwcG9ydGluZyBWMiBBQkkgc3RhdGljIGNhbGxzIHRoYXQgZG8g
bm90DQo+IHByZXNlcnZlIHRoZSBUT0MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBH
cmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L21vZHVsZV82NC5jIHwgMTQgKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5j
DQo+IGluZGV4IDdlNDVkYzk4ZGY4YS4uNGQ4MTZmNzc4NWI0IDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
bW9kdWxlXzY0LmMNCj4gQEAgLTU1LDYgKzU1LDEyIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbG9j
YWxfZW50cnlfb2Zmc2V0KGNvbnN0IEVsZjY0X1N5bSAqc3ltKQ0KPiAgIAkgKiBvZiBmdW5jdGlv
biBhbmQgdHJ5IHRvIGRlcml2ZSByMiBmcm9tIGl0KS4gKi8NCj4gICAJcmV0dXJuIFBQQzY0X0xP
Q0FMX0VOVFJZX09GRlNFVChzeW0tPnN0X290aGVyKTsNCj4gICB9DQo+ICsNCj4gK3N0YXRpYyBi
b29sIG5lZWRfcjJzYXZlX3N0dWIodW5zaWduZWQgY2hhciBzdF9vdGhlcikNCj4gK3sNCj4gKwly
ZXR1cm4gKChzdF9vdGhlciAmIFNUT19QUEM2NF9MT0NBTF9NQVNLKSA+PiBTVE9fUFBDNjRfTE9D
QUxfQklUKSA9PSAxOw0KDQpJIHdvdWxkIGhhdmUgd3JpdGVuIDoNCg0KCXJldHVybiBzdF9vdGhl
ciAmIFNUT19QUEM2NF9MT0NBTF9NQVNLID09IDEgPDwgU1RPX1BQQzY0X0xPQ0FMX0JJVDsNCg0K
QnV0IGl0IGlzIGp1c3QgYSBtYXR0ZXIgb2YgcHJlZmVyZW5jZSwgc28gdXAgdG8geW91Lg0KDQo+
ICt9DQo+ICsNCj4gICAjZWxzZQ0KPiAgIA0KPiAgIHN0YXRpYyBmdW5jX2Rlc2NfdCBmdW5jX2Rl
c2ModW5zaWduZWQgbG9uZyBhZGRyKQ0KPiBAQCAtNjYsNiArNzIsMTEgQEAgc3RhdGljIHVuc2ln
bmVkIGludCBsb2NhbF9lbnRyeV9vZmZzZXQoY29uc3QgRWxmNjRfU3ltICpzeW0pDQo+ICAgCXJl
dHVybiAwOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBib29sIG5lZWRfcjJzYXZlX3N0dWIodW5z
aWduZWQgY2hhciBzdF9vdGhlcikNCj4gK3sNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsN
Cj4gICB2b2lkICpkZXJlZmVyZW5jZV9tb2R1bGVfZnVuY3Rpb25fZGVzY3JpcHRvcihzdHJ1Y3Qg
bW9kdWxlICptb2QsIHZvaWQgKnB0cikNCj4gICB7DQo+ICAgCWlmIChwdHIgPCAodm9pZCAqKW1v
ZC0+YXJjaC5zdGFydF9vcGQgfHwNCj4gQEAgLTYzMiw3ICs2NDMsOCBAQCBpbnQgYXBwbHlfcmVs
b2NhdGVfYWRkKEVsZjY0X1NoZHIgKnNlY2hkcnMsDQo+ICAgCQljYXNlIFJfUFBDX1JFTDI0Og0K
PiAgIAkJCS8qIEZJWE1FOiBIYW5kbGUgd2VhayBzeW1ib2xzIGhlcmUgLS1SUiAqLw0KPiAgIAkJ
CWlmIChzeW0tPnN0X3NobmR4ID09IFNITl9VTkRFRiB8fA0KPiAtCQkJICAgIHN5bS0+c3Rfc2hu
ZHggPT0gU0hOX0xJVkVQQVRDSCkgew0KPiArCQkJICAgIHN5bS0+c3Rfc2huZHggPT0gU0hOX0xJ
VkVQQVRDSCB8fA0KPiArCQkJICAgIG5lZWRfcjJzYXZlX3N0dWIoc3ltLT5zdF9vdGhlcikpIHsN
Cj4gICAJCQkJLyogRXh0ZXJuYWw6IGdvIHZpYSBzdHViICovDQo+ICAgCQkJCXZhbHVlID0gc3R1
Yl9mb3JfYWRkcihzZWNoZHJzLCB2YWx1ZSwgbWUsDQo+ICAgCQkJCQkJc3RydGFiICsgc3ltLT5z
dF9uYW1lKTs=
