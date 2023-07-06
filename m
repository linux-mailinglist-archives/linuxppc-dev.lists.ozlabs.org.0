Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4327495B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:36:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=INCHVOSn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxRdX1K41z3bw2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 16:36:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=INCHVOSn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxRcb2Sxkz306t
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 16:35:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo1SVkVhnh1LCBQrwLCTTu3a6RLCZKv6lhI5XrcbbCDNBhKSzeOfp/5oSg/kLm358UdGd6i+U+AgrlHZQMAHc5zd+fIY/+KuvvCXzZLpDgagn2P0Zm7jo+EM3HxDwhQ5MgOhwP8aXTl5cw2X+fKRwFkz0A6Xg4Gir4dXZyFQHS1j3gcRG+TGPPXalEkoghPi8n6wDABi4WEDlsCstqBPB2KUcqbqnRpltTdQDaLTQxuTRoeR8vnt/MJcpUExM9MzDmvPtR4usiUQEHVhKeo6fIvDCpl3/178G5G4ICYlyXw6+JOA1IAm0PB+BivoxStBxowkXuzySU31tCQp5m9maQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hXTy8F4aBsVnUkhOJQK8nhc/dGB8wSyHUCtimbkYHA=;
 b=lFcfAkKTEk3o3ClYRoVGAsplzhcXsWt38L8DRsDk3qfHMQRUYX1M47D61ezjzC8/TJv+Aup+dszlmOEHeTS0bDDvI6o6YtlG3OqkStg1kPxpnGlVx2MrFR5wtMgHYbMQbo71Wt7vDFQnRyCzX5GFHUSN51WlzvLEDfyQjp3Gihssnd49o5kLsaw/3QgbhpjaOrO31xgDjdvo77mwP5xZpJ+7LpDggKdgeFC3TjUWqn3GCfUcciVLrVc+PAPhHg94XrZDSM6KNLTrwuIZrjoyDildGan+0934l3RrqbE0bPhilkNoxpQ4vetutvAgONP6lOhrXrPKD5xSJOUzk2wK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hXTy8F4aBsVnUkhOJQK8nhc/dGB8wSyHUCtimbkYHA=;
 b=INCHVOSnyWPkdR8hI0e01r6ogP1XELEbmBcnQABdfPgSQUM+B6XAqEiIWFPhOyKOoZPH72QuK2u9XVoLMlLr/pJb5ACJ/jhQZSu7RrDHpL7XDjzzlLbh3tQvmcbTvGSR7yd/4GLyd6Z91mZjYFW26tA8OOm4D1nud4KsHgl9ZccQMJLXxh8dWXUW5RHTGtNAwR5SO1epZ7BejKdWCjrdrilWjfxgB/jp2PgNeS89jd4vJLSdsSbunhpB6au2eOfY8cG8kR4BwaXz0exGyyKn/UYP9cJvHFM/HVr3M3YrNVvreSzVAxUb4eb7Mc64QN/TyD3Z3FVTvPayiI36boocZg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2303.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:13::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 06:35:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 06:35:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
Thread-Topic: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
Thread-Index: AQHZrtgK5cTbG97WIEibeUwAL5uQ7K+sM4sAgAARAgCAAAXlAA==
Date: Thu, 6 Jul 2023 06:35:36 +0000
Message-ID: <d8437dd4-63b6-13fb-22fd-9b92c661071c@csgroup.eu>
References: <20230705003024.1486757-1-bgray@linux.ibm.com>
 <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
 <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
In-Reply-To: <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2303:EE_
x-ms-office365-filtering-correlation-id: afbd6996-904b-4823-ec40-08db7deb34d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HGBl9KLX4fb7HSEFdwCSXDNoVq2TWESV1pP83QdYHQ28D6CeKDZ70wMT+Fk5iwwqpm15DbSNhwdDAvtExQiTOwCCsrIE0aORbmtTZQxPnlLXwCCHsvW0lFrWPKSfkxQxczoMmsvu6r9PhcFkh6ctSAezWoDptmISRwaiYNxJQqsrEtpJa8cpC6GJqSLlLFPiZRvvn+piCFAFOpSif7kmCc1xrhwoILEwlWZcRgidyX2+TcDVombGGF98ZTOxcXwUG7laOpP0HomSKvwOAuzV97JazoWaXC/81Hf/zGgef7mJeCQ60PXocfpWTwujRwCz06TNMx6OK2KfyUDnQ5nUM0Iq8BvUK8OzMEBNZtI53ZEVPXGkEFwk4oWBYuyJ8SRPaEyVLw8dlK5HRu3A3O21CUaGsEY/efsdn43RaU7HGveh4KJJ9T/s0GCYsAcUUGEyzKgiU+C6JUl6Hubj3o1RIKX1IBTlPn+GLm/G2VKUUogEpAirjnDacnCbUesSuwgW+q6kNhFTk6oNpR5elAUKI0e+gBel8wawV7mZ0nUZdKoyIgl5GLz4CilaR0OA3yIKR5JVTOgD65rFhb8y5hyGcC4uTUylX+7t+OsYbI0Kqmef8goWv2p/+hoT1AzQfnxVjvOnwL5YV182cmI8chQIQyIFMvL437EFZc9RanGWR/5xX1eBOTDqdrHRy98c4JS3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199021)(2616005)(54906003)(66556008)(66946007)(38100700002)(66476007)(66446008)(64756008)(91956017)(76116006)(122000001)(186003)(86362001)(36756003)(6486002)(38070700005)(71200400001)(6512007)(26005)(6506007)(110136005)(478600001)(31696002)(4326008)(8676002)(8936002)(44832011)(5660300002)(31686004)(316002)(66899021)(2906002)(41300700001)(83380400001)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RlJqRUJPUGVwdHZhWmZPd3NSc2FZSldTNDQybmg2UEdGSWdiMFUvUGtZSVd4?=
 =?utf-8?B?dDVWL3JSWVlucXBOb1RrUHdSNkRhOGRRcDdSWFJqbGQ1NUtkNFRpZHpXMjVK?=
 =?utf-8?B?S25VU3FGSHppOENMTUVUNld5em5oT1NpTEhLdjc4R05aU0x6QkZXbjU1bGxG?=
 =?utf-8?B?TFgvUXBXMzFoUGVCKzI0Q2oxbTV3VGhkRWd4ODNtMU83MWJxdW0xdkpxSWJ3?=
 =?utf-8?B?SjBwZjRrTS8rSzUvOFFxblpFMkhuVXhlODVIL2tKWjJBYllxK0ZncWZ5d1Ux?=
 =?utf-8?B?NFRFa09FcVZCNkI1cXdPNDlDaDZuWGxuVldzSEtFOHR3bDRUUGJnMXEwSGUz?=
 =?utf-8?B?RXdwcUpNK0V2WjFkV2lYN2tyREhpNnFjSkZPY3BzTDJQRGZlMUNtdFRFUXBu?=
 =?utf-8?B?TFV6MmYveDQ1aWJMSkdWNHlKUjdzclZ1M1daaldtdEExeW5OTWVKaTNIcm5G?=
 =?utf-8?B?Zms4V2xuMGVORFRhVkpGTkF3NGNhQ1BmTFFwWWFtN1hjR1lkenI0UVd6Qnlx?=
 =?utf-8?B?djZ2eEk4V292WkNMK3VzbTBRSTdZdVc0RXhWNXBuRmV5MUZkaGxZQWRLbWxV?=
 =?utf-8?B?d1ZYUGNReEE4UU13T3FFVVV0UTdPUDJmeVROTDQ3cHlJRld4REszQUhMb2pN?=
 =?utf-8?B?dFlhUmg1S3lndXZybWQrWlFXL3A5bVZWajVYV2l2SitpSnlVQWJEejFudENM?=
 =?utf-8?B?dmwyc01EWjFEWWwvSWtiOHJETEIwYUZoSVBsdEhTTlhOenBVbCtudzExYlBh?=
 =?utf-8?B?blJyTGlWcFAvZmlJMWU1bExJai9rMFZJb0lkZGNFcWxLa3VrUWtENmhwa0ZQ?=
 =?utf-8?B?ZHlBOXJldThySDJ0UkNCMWttc2FyTlBrUkp6VC9ianhPNnRPRVdMZ1h5anhk?=
 =?utf-8?B?NUdBMVhFWDZhSW5hNnpOREhHOXVoUkVpNXVEWVB6QkpQNnU2a2pSYWw3ZSs3?=
 =?utf-8?B?VFJHbE9Zc3YvWnBtWGoxNS91dCtVYnJQZ0FZTW4yYzk5NlN1YUVzdkwra2xi?=
 =?utf-8?B?bUQwbUhZVVlVV1VOd1VnNVJtT0N6TjNpQS96b2VVcEtZL1lkYkFPSTdCVHNw?=
 =?utf-8?B?VmxHZCtFcExxa2p3RHlFTXJKT3YvcVdvT09SYTZPY0paZTRwTTZNb05kWDEv?=
 =?utf-8?B?cmVmZThVckNkMHFFZ2g2amFpeXl1cDV5RnZkajZHeUZpUTY3cFFEVm5wTzMy?=
 =?utf-8?B?cy9wVzdHNzhocXErbkY4TVBUMUJld1NtK0MrdFh6TElnMkU5VnR6TW5ac2E5?=
 =?utf-8?B?Tmg2YllQYVpHMEoxcTdxYTJpbFZMSHBsQTljNVdsaGRBT0ZsR1k4T0dJRkFw?=
 =?utf-8?B?ekordXByTzE5NnVTRENFZWFMSWhxcW9tYitOcUl1Ri8wZHk2OXZuYk1MVHly?=
 =?utf-8?B?SlNVMWNydHA1K09PbHFvKytIN1JwWTFOZDE4RG5uZjdoMmNYaEZzUmllYWJi?=
 =?utf-8?B?aE5YYVJ4endMTm03a0dpY2hnL2xiaG5MNVJjTUU0b2xpUS9CcElRZ3FSNk1o?=
 =?utf-8?B?Y2J5L2tTYUNPREQybzhUTWtjREltNk5EYnRheVA3RXJoWWEvbGxXOElaTmQ5?=
 =?utf-8?B?S3N0WjU3cjVCSUdDaCtScjR6RnZQNUVYNmwzazFKNHZiYi9vMmJPUUFJWGdz?=
 =?utf-8?B?aU5MS20vMjFIWUI1OFRvRHl3WjkycWdkbUI4b2xTY1ZYbmtpRG1YdTl6eXhr?=
 =?utf-8?B?SGY4YWxKWVBBTmx0aTZWeGFCY3BTdzIvaVNMMGUxcFRKVUUvc1Qra1QraFY4?=
 =?utf-8?B?MHlwQ3EzWXliY3UzVkM1cjVhS2lqdHZuTnB4d2w5VlNUYTczamxiQkRzVmti?=
 =?utf-8?B?Um1WNmg5cmRDR3BON2Q5bVZ0VnV0QlZyMHhKUHhIaVJDbUMvSFA3VTltdnNm?=
 =?utf-8?B?elFFdytKZE9rYkQwYzNmY0wwVnVuZzlqZ3pzL3JPRk50UDhjV05tcVBRUlRS?=
 =?utf-8?B?MFluWnB0KzJvQWttemxnUVRaeVZOa3RYL3RUMnc0N3lLcExNU3ZqQSs4R3Fy?=
 =?utf-8?B?NUM1aDNJMG0xWFdYdkJ2QktxZEk3RWFTQ01rYmx2TkZ6QW9saTZ2M3UybWdr?=
 =?utf-8?B?SEJjbFVZSWx0Ylp5dDJzTEE3SCtEUkZxcVFvSys3T2JkTFptZ0FTMUpNT052?=
 =?utf-8?Q?wF3kFHFslP+WvqwHUv69w1xhq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DC39EB5B0FE674190D43CB76F4C989C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: afbd6996-904b-4823-ec40-08db7deb34d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 06:35:36.0387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOrSiAYJjQF+6voBakiaNhebCixCRsmxN7LaswDWM/6aoiTq1Bvs8RbMliVRg7KJWEdEksZDqWIJaonUmrvrq1yDimVbIqPpOzP7zL17V9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2303
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA3LzIwMjMgw6AgMDg6MTQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gVGh1LCAyMDIzLTA3LTA2IGF0IDA1OjEzICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4NCj4+DQo+PiBMZSAwNS8wNy8yMDIzIMOgIDAyOjMwLCBCZW5qYW1pbiBHcmF5IGEgw6lj
cml0wqA6DQo+Pj4gVGhlIGRyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYyBkcml2ZXIgaGFzIGEgZGly
ZWN0IGRlcGVuZGVuY3kgb24NCj4+PiBzdHJ1Y3QgcmVnbWFwX2NvbmZpZywgd2hpY2ggaXMgZ3Vh
cmRlZCBiZWhpbmQgQ09ORklHX1JFR01BUC4NCj4+Pg0KPj4+IENvbW1pdCA3MGE2NDBjMGVmYTcg
KCJyZWdtYXA6IFJFR01BUF9LVU5JVCBzaG91bGQgbm90IHNlbGVjdA0KPj4+IFJFR01BUCIpDQo+
Pj4gZXhwb3NlZCB0aGlzIGJ5IGRpc2FibGluZyB0aGUgZGVmYXVsdCBwaWNrIHVubGVzcyBLVU5J
VF9BTExfVEVTVFMNCj4+PiBpcw0KPj4+IHNldCwgY2F1c2luZyB0aGUgcHBjNjRiZSBhbGxub2Nv
bmZpZyBidWlsZCB0byBmYWlsLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR3Jh
eSA8YmdyYXlAbGludXguaWJtLmNvbT4NCj4+PiAtLS0NCj4+PiAgwqAgZHJpdmVycy9ydGMvS2Nv
bmZpZyB8IDEgKw0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9LY29uZmlnIGIvZHJpdmVycy9ydGMvS2NvbmZp
Zw0KPj4+IGluZGV4IGZmY2E5YThiYjg3OC4uNzQ1NWViZDE4OWZlIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvcnRjL0tjb25maWcNCj4+PiArKysgYi9kcml2ZXJzL3J0Yy9LY29uZmlnDQo+Pj4g
QEAgLTI0Niw2ICsyNDYsNyBAQCBjb25maWcgUlRDX0RSVl9BUzM3MjINCj4+PiAgICANCj4+PiAg
wqAgY29uZmlnIFJUQ19EUlZfRFMxMzA3DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqB0cmlzdGF0ZSAi
RGFsbGFzL01heGltIERTMTMwNy8zNy8zOC8zOS80MC80MSwgU1QgTTQxVDAwLA0KPj4+IEVQU09O
IFJYLTgwMjUsIElTTDEyMDU3Ig0KPj4+ICvCoMKgwqDCoMKgwqDCoHNlbGVjdCBSRUdNQVANCj4+
DQo+PiBBcyBmYXIgYXMgSSBjYW4gc2VlLCBSRUdNQVAgZGVmYXVsdHMgdG8gWSB3aGVuIFJFR01B
UF9JMkMgaXMNCj4+IHNlbGVjdGVkLg0KPj4gQ2FuIHlvdSBleHBsYWluIG1vcmUgaW4gZGV0YWls
cyB3aHkgeW91IGhhdmUgdG8gc2VsZWN0IGl0IGV4cGxpY2l0ZWx5DQo+PiA/DQo+PiBJZiB0aGVy
ZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUgbG9naWMsIHRoZW4gdGhlIGxvZ2ljIHNob3Vs
ZCBiZQ0KPj4gZml4ZWQgaW5zdGVhZCBvZiBqdXN0IGFkZGluZyBhIHNlbGVjdGlvbiBvZiBSRUdN
QVAgZm9yIHRoYXQNCj4+IHBhcnRpY3VsYXINCj4+IFJUQ19EUlZfRFMxMzA3LiBCZWNhdXNlIG90
aGVycyBsaWtlIFJUQ19EUlZfQUJCNVpFUzMgb3INCj4+IFJUQ19EUlZfQUJFT1o5DQo+PiBtaWdo
dCBoYXZlIHRoZSBleGFjdCBzYW1lIHByb2JsZW0uDQo+IA0KPiBSaWdodCwgeWVhaCwgSSBkb24n
dCB3YW50IHRvIGFzc2VydCB0aGlzIHBhdGNoIGlzIHRoZSBjb3JyZWN0IHNvbHV0aW9uLA0KPiBz
ZW5kaW5nIGl0IHdhcyBtb3JlIHRvIG9mZmVyIGEgZml4IGFuZMKgYWxsb3cgZGlzY3Vzc2lvbiBp
ZiBpdCBzaG91bGQgYmUNCj4gcmVzb2x2ZWQgc29tZSBvdGhlciB3YXkgKHNvIHRoYW5rcyBmb3Ig
cmVwbHlpbmcsIEkgYXBwcmVjaWF0ZSBpdCkuDQo+IA0KPiBJbiB0ZXJtcyBvZiB3aHkgSSBtYWRl
IHRoaXMgcGF0Y2gsIHRoZSB3YXkgSSBzZWUgaXQsIGlmIGEgY29uZmlnIG9wdGlvbg0KPiByZXF1
aXJlcyBhbm90aGVyIGNvbmZpZyBvcHRpb24gYmUgc2V0LCB0aGVuICJzZWxlY3RzIiBpcyB0aGUg
bmF0dXJhbA0KPiB3YXkgb2YgcGhyYXNpbmcgdGhpcyBkZXBlbmRlbmN5LiAiZGVmYXVsdCIgb24g
dGhlIFJFR01BUCBzaWRlIHNlZW1zDQo+IHdlaXJkLiBJZiBpdCdzIGEgZGVmYXVsdCwgZG9lcyB0
aGF0IG1lYW4gaXQgY2FuIGJlIG92ZXJyaWRkZW4/IEJ1dA0KPiBSVENfRFJWX0RTMTMwNyAqcmVx
dWlyZXMqIFJFR01BUDsgaXQncyBub3QganVzdCBhICJ3b3VsZCBiZSBuaWNlIi4gVGhlDQo+IGJ1
aWxkIGJyZWFrcyB3aXRob3V0IGl0Lg0KDQpJIG1lYW4ndCAid2h5IGRvZXNuJ3QgaXQgd29yayBh
cyBpcyIsIGFuZC9vciAid2h5IGRpZG4ndCB5b3UgZml4IHdoYXQgDQpkb2Vzbid0IHdvcmsiLg0K
DQpXZWxsLCB1bnRpbCBjb21taXQgNzBhNjQwYzBlZmE3ICgicmVnbWFwOiBSRUdNQVBfS1VOSVQg
c2hvdWxkIG5vdCBzZWxlY3QgDQpSRUdNQVAiKSBpdCB3YXMgbm90IHVzZXItc2VsZWN0YWJsZSBz
byBJIGNvdWxkbid0IGJlIG92ZXJyaWRkZW4uDQpBZnRlciBjb21taXQgNzBhNjQwYzBlZmE3ICgi
cmVnbWFwOiBSRUdNQVBfS1VOSVQgc2hvdWxkIG5vdCBzZWxlY3QgDQpSRUdNQVAiKSBpdCBpcyBv
dmVycmlkYWJsZSBzbyB3ZSBoYXZlIGFuIGFkZGl0aW9uYWwgcHJvYmxlbS4NCg0KRG9lcyBSVENf
RFJWX0RTMTMwNyByZXF1aXJlIFJFR01BUCBvciBkb2VzIFJUQ19EUlZfRFMxMzA3IHJlcXVpcmUg
DQpSRUdNQVBfSTJDIGFuZCB0aGVuIFJFR01BUF9JMkMgcmVxdWlyZXMgUkVHTUFQID8NCg0KSSB0
aGluayB0aGF0IGh1Z2UgZGVmYXVsdCBsaWtlIGZvciBSRUdNQVAgc2hvdWxkIGJlIHJlcGxhY2Vk
IGJ5IA0KaW5kaXZpZHVhbCBzZWxlY3Rpb24gb2YgUkVHTUFQIGZyb20gZWFjaCBvZiB0aG9zZSBj
b25maWcgaXRlbXMuIEZvciANCmV4ZW1wbGUgUkVHTUFQX0kyQyBzaG91bGQgc2VsZWN0IFJFR01B
UCB0aGVuIEkgZ3Vlc3MgaXQgd291bGQgYWxzbyBzb2x2ZSANCnlvdXIgaXNzdWUgd291bGRuJ3Qg
aXQgPw0KDQo+IA0KPiBCdXQgbWF5YmUgS0NvbmZpZyB3b3JrcyBkaWZmZXJlbnRseSB0byBteSBh
c3N1bXB0aW9ucy4gTWF5YmUgdGhlDQo+IHJlZmVyZW5jZWQgcGF0Y2ggdGhhdCBjYXVzZXMgdGhl
IGJ1aWxkIGZhaWx1cmUgaXMgYWN0dWFsbHkgaW5jb3JyZWN0DQo+IChDQyBHZWVydCkuIEkgc3Bv
a2Ugd2l0aCBKb2VsIFN0YW5sZXkgKENDKSBhbmQgaGUgaW5kaWNhdGVkIHlvdSdyZSBub3QNCj4g
c3VwcG9zZWQgdG8gZGVwZW5kIG9uIFJFR01BUCBsaWtlIEtVbml0IGRvZXM/DQo+IA0KPiBBcyBm
b3Igb3RoZXIgZHJpdmVycyBoYXZpbmcgdGhlIHNhbWUgcHJvYmxlbSwgcXVpdGUgcG9zc2libHks
IHllcy4gQnV0DQo+IHRoZSBQUEMgY29uZmlncyBkb24ndCBzZWVtIHRvIGJ1aWxkIHRob3NlIGRy
aXZlcnMsIHNvIEknZCBwcmVmZXIgdG8NCj4gbGVhdmUgaXQgdG8gYW55b25lIHdobyBkb2VzIGJ1
aWxkIHRoZW0gdG8gcmVwb3J0IHRoZSBlcnJvci4gSSB3YXNuJ3QNCj4gcGxhbm5pbmcgdG8gYXVk
aXQgYWxsIHRoZSBkcml2ZXJzLCBJIHdhcyBqdXN0IHRyeWluZyB0byBmaXggdGhlIFBQQw0KPiBj
b25maWdzIEkgYnVpbGQgYW5kIHRlc3QuDQoNCldlbGwgb2sgYnV0IHRoYXQncyBwcm9iYWJseSB0
aGUgaW5kaWNhdGlvbiBvZiBhIGRlZXBlciBwcm9ibGVtIHdoaWNoIA0KZGVzZXJ2ZXMgYSBtb3Jl
IGdlbmVyaWMgZml4Lg0K
