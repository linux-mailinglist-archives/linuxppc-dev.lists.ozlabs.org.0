Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C232805177
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 12:03:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=W67uPwVS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkyM03gnPz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 22:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=W67uPwVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::621; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkyK735HZz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 22:01:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA9JGQp4imkN392qBumNIdvQPYjzQ3eFvc100q7gumTaAq45DYqba0MTJPu557g40IKU1MKAeQQ+/TEM9Ih6gU84qTm2ThjXVRzkP8FpqUVBPji8hgnS2lXMoLeX6/aDxft3io7btSKObNBMCZ0E3jcIY2bV1QkdQVX2XNk/KrUsgL3Hja03aFUSPtgrPgtgIFsB2fqaB3AesHHnNHdGRGWzruLDdEsS0ibMie/ojwJX8HK8AqdAfhBGnoE5AtUdngMw47TuSiBbZo1mNRewKHFzLfktW2x66ioeI0ZjelLhXg8wXNdTLhv8iGCD5EaYn7RiImCWyNL9+51sZ1PTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfhcxyE8+xh9E5al9KoJv8iehF/+lO5kzbXwLWimjT0=;
 b=YwQn9mR+NH7U9jAG4XkEl8XsJ09EIQB/B3wQoCJgx/a5uhlwiXZqNv6HK2IINg1ouIvbVQsiFolzxDa1taOQybHp9Dc9ouRpn1MkdfWyekn2HLhH+8Dmxs3odCmTJ+y+9PDOCYHCyvkIMIUAnCrTuE4tzYb3+JKO2i3wJ7eCPCSOSekEEGGEXZRAkhxyeJohWTz7qgwpfduvSp1RjZ8yvKuh6LabraF2+nqXzj+Ap1Vv7tPvrZKXSn3Myk/CrMCWeqJ6CsGEhtyKew9tkbQO9zpuO5Xnb4Wxm2Q7Oql1MWZZhSwK6d7tjf/e5PZ0IOWsAsfgbOX5s6Q5ZsLaAj5eTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfhcxyE8+xh9E5al9KoJv8iehF/+lO5kzbXwLWimjT0=;
 b=W67uPwVSZ/+uVEnewrukuYwQ+KoRPHplkBkrrAyxa4RNw0cdemp0MDR/nY0WRkAT86NjXZ6z4PUJHSa/9Ui+QaqJZNZtgpbwdUXrRYDFL56ok5UIxBuRmkBKOwcOQ8e4Efe1J1bepMKePKf/o1X0y5It4sZbVoo1e/9W9zs5L7/7QbgTm++Q2SalqQCjNpicNgfTvJYFLcMlxL1npn38tqwdJVXsNh9yZ0YbLeThOTMVHVf/PctpEe6EOi78A6uc1ShthTdDHhq46Qh5veDtJNvsrtn8QftzRg922ROajVgwBCAFXg15Y3+brz4Nmqb7sKXAIaQx8DjPu3BGtTTpZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3330.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.24; Tue, 5 Dec
 2023 11:01:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Tue, 5 Dec 2023
 11:01:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/book3s64: Avoid __pte_protnone() check in
 __pte_flags_need_flush()
Thread-Topic: [PATCH v2 2/2] powerpc/book3s64: Avoid __pte_protnone() check in
 __pte_flags_need_flush()
Thread-Index: AQHaJpVyjy6bp/ey00eB4WYEMrs7g7Cah7GA
Date: Tue, 5 Dec 2023 11:01:43 +0000
Message-ID: <60496393-98f5-4051-9243-8fa43c48d5f8@csgroup.eu>
References: <20231204093638.71503-1-aneesh.kumar@kernel.org>
 <20231204093638.71503-2-aneesh.kumar@kernel.org>
In-Reply-To: <20231204093638.71503-2-aneesh.kumar@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3330:EE_
x-ms-office365-filtering-correlation-id: 54b140ab-48a7-4d47-b89b-08dbf581913f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HtWqnl6DQrB004p1JEsmBApROK6mA/NMcbQsWZkp692HCOFNFx7YFJD3+YnuA514WzJ8IwKVepyzr+LTizCdD7XyyyJG1dl4Ho7TASGG0SMjG38a5WqYoB0ORFOUiQFSnVFH61C8AIeZ6Hz2GWQ+RYgpJDa0Ud2FU+5WzyRxRg0rdc/7lNpGVABVYMIECWll+lNetWKu68bGwBq4PCaVU5T9RmSYSv3WMy7JOglK8jHdaoOo0Ceqj+XAftHRct7eYOLdaxCH2lMtjQ+hEaRtTRYNm5C87rMNvaGkwyJngVHrZ62wn306iugMJvbc97iIcbJkTkUoW5qWTGIvHER2anp0EjGSguluG7qU9NLRRcJfSNsUBzDBESh7yRgDEffEqmCmlBC6qgEW8706/196lwMPWG5vz27btEFZPs0ympROIZ6wPlwAwOX1SVmhIk2eAWwe6vzaBFxSh8e04XGj1i26atJ6mXIXTs/H+u2MkEWvWxb26seBk1fQ3uCDgWhUrUtUfhQvtwiMDL23yGRcI8jAxJWOlhS0cf4RvS6Oxb7eu+2gf88fcd3+ciqYgw4fXNGJJJbqlijegmF2txcknP0elKoiK4tnOgZ8rkDq2IoQsq3sYY8RDhCWvG8AbME9lFXbd/z8vfEVC10xgBRx5xL1PWWKLNZHHSX8nO+YUhGvzYiYdH2+Kd2R9oTh78TpUA0z4ENyjzbpioStH/E0q83q5Hv6DlnScP3iTX/Oz/o=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(64100799003)(186009)(451199024)(6486002)(6506007)(36756003)(26005)(2616005)(38070700009)(6512007)(41300700001)(38100700002)(66574015)(86362001)(31696002)(83380400001)(122000001)(71200400001)(478600001)(2906002)(31686004)(316002)(66946007)(76116006)(64756008)(66446008)(110136005)(66476007)(66556008)(91956017)(44832011)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WHRSTis1WkNYSTNnWXRhZW13N2NWSjA5RHBiMmVVT21nZnpkeW9PdW5SeGRE?=
 =?utf-8?B?cVJTSkVscDZYQStvNDJac051NTU5RytGZitqL3NZenF0cVRkRzY2WS9tbTRv?=
 =?utf-8?B?NnV5ZkdEdko1cVZiZVN0dUpiODFJUTRtZWxEV21tWkdVYXBKSDFnYy9HTFpq?=
 =?utf-8?B?eFBjekFsdFZ4WmNpeHo5aFl5YzFkamtrZVNZRXcyK0FsVXFSK3ZReGF3S2Zz?=
 =?utf-8?B?VFcvdm5VSmkyY0NIM1NDK1JHbnhBdTF3ek9pK3NoTUpEUkRvLzRncXhvd0VR?=
 =?utf-8?B?Z1lOd2RoTG5kM09LMjd6bEZGeEJieGRTOWlKT0V2VHlZTm9nM0ZXUERkQUZB?=
 =?utf-8?B?TTk5OWtrczlwQ0dnNXdnbUJSNHZVOEFGUmlNamo0WUJKWnBhbmc5NFpWbGZk?=
 =?utf-8?B?ZVdJNm16SHMyOGdSc1Y1ODBMVHBTQm9qRmg2eGhJZnVJZ3lvUEk2STI0YVdR?=
 =?utf-8?B?aERnVXZ1WTdvSGJiOS95UXp2TUtCYk5lWVRLUUlNK3Y2LzVmRzgyeENIeFV6?=
 =?utf-8?B?MVFqZWFBYW1sbG8rMHJFN0l5SW9tS1BRVVZ3eXVobkNGait3TVh5dzN2NDBO?=
 =?utf-8?B?M25YWFVnRkFJL2cwRXpmNWhYd0FSeGswUk5VbW1mdVo3NEpYdEx4aUp6S0FT?=
 =?utf-8?B?QU5PUE02Vno4VE1oemlHR1BZNExSVWpQUVU2ZWV1Qlh3R1NuZmZiekhpTFp3?=
 =?utf-8?B?RElXdjhBYytCR2ZUMXVrL0QzdHBoeloxa1F4ekhaTnR5N3Z0d3hOTUJURlZ1?=
 =?utf-8?B?VWRzNVFmemp3YWdUNW80bytHY08xZUpIYW1vMDhrQ3RaT01FR0o2eGliQjFT?=
 =?utf-8?B?R1RRNktoWlJZbk1WdVFSZ3ZPa1NwWENXaWtWRjRuL1duRGJUY3hVaDRVeGxi?=
 =?utf-8?B?Rkhha3FFY0J3eko4c3RMNmk5K3NJc1huOUtRdmhjeUdjdm1sbngzM0JKeEJw?=
 =?utf-8?B?YmFtVlBFR0NQMmZuOWhVMmRTL29JUDB2NjJJVHBKMFp4UWtPbkdpQUdiU3N1?=
 =?utf-8?B?WnorNDRsSTUzbXdDTHNkaVRFQU8vT3JnTzVVdFY4UVg4YlJJd0FqemU0ckVZ?=
 =?utf-8?B?THdReHRRbHA4c05TTnhhWE9SSVAxTGJWQk8rVWl1L3oxeWtVUC9lbG9hT3pI?=
 =?utf-8?B?NzhxNGp5U3RaWjBBOCtxZGU0VmtvMkVNUkNwL21Yd2JIS2dLYm1YZXhiUTd4?=
 =?utf-8?B?TGtGQjlPaC9vT09sRXkzRHkxbDhyR1V1dEc1bUtZY3BUM2tuaFpPaUl4Skp0?=
 =?utf-8?B?MzdEbERMaFZJZ2lrMjlLQjdWTTJGdHZQQnpFNFJKWHluVGYySXhYWVpCZHdt?=
 =?utf-8?B?QTdXVE5TQmpMMEtSRUhCU2Rwb0RJb1UxUXhLaXRNeXFiNy9aSzVlOXpIcUhP?=
 =?utf-8?B?SXo0aGdPczh2d1A1aW5kbWxiem1YNmwwTkNCZlIrUFFKNzlRTkxhem9nRSt2?=
 =?utf-8?B?UHVUY25FQUd5NEtpbkZNK1VmbjZ3aC9FNlBsUGNVUlp3aUlsZUlMRlh1L0h1?=
 =?utf-8?B?VkJTbzhqcXd1VE12S3dHcENtd20reitZazYvVjZ2dXlBcEtlQTZNaG5TNXk4?=
 =?utf-8?B?ZFZXRE1OdzVrcXR1NmhIeDdvM2Jic3NtMVdXajQxTS9oZDc0L2VxUkorZEMx?=
 =?utf-8?B?REhqSmZXVVVLVHcvS3pWdHJvb1NIMk9EcXQzSXNtWEp5cTJmVzhkamlRTUxS?=
 =?utf-8?B?ZjF2NDllTUdMNG43bzRoVlJOMVJrN0d2N3RXZ01rNjM5VEFLQU4zZnQ2cjV1?=
 =?utf-8?B?dDFjMjl3SXE4Y1JjSGh3bXVLdjZodDhkclNvdEVGazk0SW5ZRXRwZ3BsNWg4?=
 =?utf-8?B?UjlLTnlQZmViVGpPNFJESDIwMEh2SDVGbzV3VVZsdlY1M2xXNnBDdUtFU1Y3?=
 =?utf-8?B?dUhUa0x3TmNJU0VLeElDL1JxU0NsU3hQQVZ5S1lObS9pNXlvR3FMV3RneUo3?=
 =?utf-8?B?Q0NidFhxVXR4RTRqZU1OTXZvejhQL1UzMnRibG42enVBZTJMZnFtQUx4Wkp6?=
 =?utf-8?B?U0FJeXN1QzZuMlRWYjhucW1GWjkyMm16Ukp5R0VXd1VKSWNnT2RYRzFTNTg0?=
 =?utf-8?B?V3BFSW9OVkFFcFVjelkvb1FNTWx4aE1MNStFTVRzNzV3T1pZNlhEWG01QTZr?=
 =?utf-8?Q?HVQ1/va51V63k9NBv/9fm3+mq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1692B325F85A3B4FAD32D23260734BCC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b140ab-48a7-4d47-b89b-08dbf581913f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 11:01:43.9145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bVoFsPfDLIT/22DlhNfhuwoE6RqXGOOHjhqfn1elsjx4RXcyq07mTOfITtJLW2UHgdB+aG1txxESkNCXApDYiITf6sgvhSt7JZklaCo9PVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3330
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTA6MzYsIGFuZWVzaC5rdW1hckBrZXJuZWwub3JnIGEgw6lj
cml0wqA6DQo+IEZyb206ICJBbmVlc2ggS3VtYXIgSy5WIChJQk0pIiA8YW5lZXNoLmt1bWFyQGtl
cm5lbC5vcmc+DQo+IA0KPiBUaGlzIHJldmVydHMgY29tbWl0IDFhYmNlMDU4MGI4OSAoInBvd2Vy
cGMvNjRzOiBGaXggX19wdGVfbmVlZHNfZmx1c2goKQ0KPiBmYWxzZSBwb3NpdGl2ZSB3YXJuaW5n
IikNCj4gDQo+IFRoZSBwcmV2aW91cyBwYXRjaCBkcm9wcGVkIHRoZSB1c2FnZSBvZiBfUEFHRV9Q
UklWSUxFR0VEIHdpdGggUEFHRV9OT05FLg0KPiBIZW5jZSB0aGlzIGNoZWNrIGNhbiBiZSBkcm9w
cGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5lZXNoIEt1bWFyIEsuViAoSUJNKSA8YW5lZXNo
Lmt1bWFyQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oIHwgOSArKy0tLS0tLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaCBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaA0KPiBpbmRleCAxOTUwYzFiODI1
YjQuLmZkNjQyYjcyOTc3NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Jvb2szcy82NC90bGJmbHVzaC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvNjQvdGxiZmx1c2guaA0KPiBAQCAtMTU4LDExICsxNTgsNiBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwNCj4gICAJICovDQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBib29sIF9fcHRl
X3Byb3Rub25lKHVuc2lnbmVkIGxvbmcgcHRlKQ0KPiAtew0KPiAtCXJldHVybiAocHRlICYgKHBn
cHJvdF92YWwoUEFHRV9OT05FKSB8IF9QQUdFX1JXWCkpID09IHBncHJvdF92YWwoUEFHRV9OT05F
KTsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3B0ZV9mbGFnc19uZWVkX2Zs
dXNoKHVuc2lnbmVkIGxvbmcgb2xkdmFsLA0KPiAgIAkJCQkJICB1bnNpZ25lZCBsb25nIG5ld3Zh
bCkNCj4gICB7DQo+IEBAIC0xNzksOCArMTc0LDggQEAgc3RhdGljIGlubGluZSBib29sIF9fcHRl
X2ZsYWdzX25lZWRfZmx1c2godW5zaWduZWQgbG9uZyBvbGR2YWwsDQo+ICAgCS8qDQo+ICAgCSAq
IFdlIGRvIG5vdCBleHBlY3Qga2VybmVsIG1hcHBpbmdzIG9yIG5vbi1QVEVzIG9yIG5vdC1wcmVz
ZW50IFBURXMuDQo+ICAgCSAqLw0KPiAtCVZNX1dBUk5fT05fT05DRSghX19wdGVfcHJvdG5vbmUo
b2xkdmFsKSAmJiBvbGR2YWwgJiBfUEFHRV9QUklWSUxFR0VEKTsNCj4gLQlWTV9XQVJOX09OX09O
Q0UoIV9fcHRlX3Byb3Rub25lKG5ld3ZhbCkgJiYgbmV3dmFsICYgX1BBR0VfUFJJVklMRUdFRCk7
DQo+ICsJVk1fV0FSTl9PTl9PTkNFKG9sZHZhbCAmIF9QQUdFX1BSSVZJTEVHRUQpOw0KPiArCVZN
X1dBUk5fT05fT05DRShuZXd2YWwgJiBfUEFHRV9QUklWSUxFR0VEKTsNCj4gICAJVk1fV0FSTl9P
Tl9PTkNFKCEob2xkdmFsICYgX1BBR0VfUFRFKSk7DQo+ICAgCVZNX1dBUk5fT05fT05DRSghKG5l
d3ZhbCAmIF9QQUdFX1BURSkpOw0KPiAgIAlWTV9XQVJOX09OX09OQ0UoIShvbGR2YWwgJiBfUEFH
RV9QUkVTRU5UKSk7DQo=
