Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC30619F43
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3pBW1P67z3dvF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Esgiji4W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.74; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Esgiji4W;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90074.outbound.protection.outlook.com [40.107.9.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3p9X51llz3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:52:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTxfxY5uxQMKI+ZmDD9pj+wXo2/OhDQADPpuy8/1rrks/Hj1dJP1Yzq1hMPzk1CFu5W7gujOc3blrJiWmisVYp35XJYOYCtMTnousN0knKs+94YzK/lbJt2oiyljZVBZhkXVA9oCelDsMrIGaTgYH0UUA+4pR/GodYnRYxuuEwh54VOgsZzSttd7MsNndrL24YLw5AZh5Zje+5vPv7AcR/RdyA+CUmeTJQmM4PtE2tJ3tGf9a6BqOgD3ZKusRNPZYdcNwRVtfVnW0Fz+VEUaQRwOy6HIuYTtNToUyUAgzRqv/+6/SISJEnYutWUHGZ3uRKZKQMuLjz3Cqm+LhtWGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5K0kNZR2488IFyyT9KdLlbG3jcHlHWFHN/GnsWvTNZs=;
 b=eybIAidDatkODteIMuwNaFCM9CHmUsHiGWy0CjlkfF2RlXH3uLeWBj0W0L9PadOul4I28WuQEYm2i01+ctGkvIZPI0Q2Y9dAaOZw0rL+tXWf73Po6fZqtcsLYlYGzoHiXDBDjZVhQCbeij4OOE3psXnf/PSqxcfUrj9iVjejuMUNba/202GdENg7BpYZxIJSBQ8ZSyrKxqMdfjr6u1kVzHP7FHzG5DSLXqlfN+GtfyWTY2FelnLoulOF3nHJAcE3zaHT/9rpDnbs6Ig0/LRIydeiJl3cC9xqg+7tzA1rRi/uR14rkvfctam8WQfEkEQBgrVTJKdrdU4nTKYiPzDbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K0kNZR2488IFyyT9KdLlbG3jcHlHWFHN/GnsWvTNZs=;
 b=Esgiji4WvD+cjPL1yKia6Vq1QPK0OOlheliciMi/Ie+531iw5KssyQo+smDy4Sy5y6LBzM4y8TSwF++v6ZXUbHzNXaal75cRJY50AUPDHeD71tNDQcp1PJYTPo4VhFM6A9sDyAXv0M1xx4/9ueRcddWRmeN52XmdAGepj0nApreKzK2krJpvrorYKjcTz41RlIok2bb2J+VoyLB37Kmxk8IaIF2/bJN2yVm+Adh/SMsNpVU8geu1oMDP1YozWzn+i4V3PP+5QG3eKoM9ts0YnzbK5ZuAjOLvWLNmWTdVvgn/P5wUzc9sMNLbbqUf8HZqCAh0721uLKvvmvz6AtvNnA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1598.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Fri, 4 Nov
 2022 17:51:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 17:51:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 1/6] powerpc/64s: Fix assembly to support larger
 values of THREAD_SIZE
Thread-Topic: [RFC PATCH 1/6] powerpc/64s: Fix assembly to support larger
 values of THREAD_SIZE
Thread-Index: AQHY8HLb7z/8CIswP0uPTtCc1U+Ada4vC04A
Date: Fri, 4 Nov 2022 17:51:54 +0000
Message-ID: <204dee71-e3c3-e974-e8b4-ee6015cc7e3b@csgroup.eu>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
 <20221104172737.391978-2-ajd@linux.ibm.com>
In-Reply-To: <20221104172737.391978-2-ajd@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1598:EE_
x-ms-office365-filtering-correlation-id: 0ca3c8b2-226c-4340-1ac0-08dabe8d42c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AJhWIc/DSVattns07NwyZJdc4kV3JLPtUfPZ1/C5IxpCkmmKnJu2C+K9jwUoXSDligVxyHpYlgUDw9Ayxqft4PkUcblDogDbvauMChChSWUicZuGoVi6uYCErtbWTcsnpaD13olZh73PdRkv12NmftWE6jMJcGxkFWONzBChzK9x474XRXGItVsojb9Yo4QQu4cnVM84XhoBhEx58zU+2V9zraF8D4pTfKX6JtvIVDAUVbE8vAIGPgjWD0/Jbhr8bnwt+TBOGYEd2WD8toPpk1K6ySDoJ6ABT59IQfRydBY5+qQgh0qCxW09g+TxurHp1lJ7nqlZO0+3Ww8dmsPG27Lx645OQIAaIY2iWeNWDJneYsbciFsuHKvLzCMnVpj+ZHImQAlxmF0PwUR6jnxOWofpY6kx5MKoCdjyeq8G84gxbA5RYCDBL4Fh3r3c+poq7jpGZdaxGh0DphJeg9q/bUWBD5JSCZN1t6MZYBBXx2Qt8iRfkeM1eH+2jpZwjCBdaoOB64dfHpprF/+j3VDBuaPwmWSBJdp45P8jPDSj2XcfpYHd5PjYPSuGITBgTAm46Zp+e3CNSO4j+bOUkV6HrdAfVr884tSJYq9ZNdr2oySen8MtyQDJEcBDO8OxPQ7/3fAAD0fJaK03+QyBmJljaemzhCAcUAa+lXB2pvY6Rey2jk9wOJ2teC318kIlqjVtQP9734E7gNQ4qCqIawL9O+bc3GgyZNVWq1UFBXBnSf1bU1Wsv02tGglA5K42MA/1oUKq+o6dliJXXhkY12HQVn58c374n2cl/+yKR+9UQlMw+xo1mj1q4pO4FrB+WzkBJ5BDj71nQXgETtGzDn8X+g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39850400004)(346002)(136003)(451199015)(71200400001)(31686004)(64756008)(6506007)(2616005)(8676002)(54906003)(110136005)(6486002)(66446008)(316002)(26005)(6512007)(4326008)(91956017)(478600001)(76116006)(66556008)(66946007)(66476007)(8936002)(41300700001)(186003)(44832011)(66574015)(5660300002)(83380400001)(2906002)(38100700002)(36756003)(122000001)(38070700005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N09Fb1ZoN085MXZkNzJRVWcxZlZ5WUs4QVlWSXgyQXZnTk5rVmxCWHd6b00r?=
 =?utf-8?B?UDYvNWlBK0h0aFdtZlI0eXg2OWswNk9STTFQYzRqSC9BdVYxVjd0am96ZTU4?=
 =?utf-8?B?OXljbzVTZTIyeFR0SVpMZ1M4N0dxamMxNjQ4d2J1UEZoekIyR1VTUm9CUkgv?=
 =?utf-8?B?bzExMUZqeHNILzU0Tk1ySlpuVUFxZHlPMmpuMWd5L2FFbGVJeUk4dm0vTGNH?=
 =?utf-8?B?Qms0UEV6NGVFenN3Qjdqd2xvSDBKMjNhS1RHNTRWR1dwYWNoRzlrVUxDVTNK?=
 =?utf-8?B?RzJNN1BrNzllemNoZjVHZzYwZVcreTZlSHlCRG5ZWTZDOGlXcmRwdzJ0UEdu?=
 =?utf-8?B?NzRpcjRSWFpQdCtjSXdoZFRiYk9PREJCajJMOHJVNmc5Smx4QjN4M1FSRHRj?=
 =?utf-8?B?cjU4YTZKbitPWnpBQmZ5NkhBSklrWFJTRndVTWZ1RVBCY0FFWVB5WkZ6ODc1?=
 =?utf-8?B?L3ZSR1ZCWGE1VXlPY05lU2xJYmxKMjE2OXp2RGIrdlEzb3dqUXBJVjFTVEI2?=
 =?utf-8?B?bDE3ZUtMUDk4VSt2MkpQbDlFZmVJTFJac2QraGRQWmZtRk1maUkwYU5yM21M?=
 =?utf-8?B?NnE3c0pQa3QwSHNQYkl4b09xN045ODQwVHdJaFlaeVdiNnVicWZ6RlFYZjdS?=
 =?utf-8?B?MUJrQ3FVbFRmekswZ0hrWkdTeGk3WlBYdHNMdjcxSEdCcUZpd29UNHY1VU5C?=
 =?utf-8?B?SC9jQ0RnQUVZTXk1MjFOaVhOcVJSbXBRR0JQL2RUeXhENGM1ajF4aHZ3aDA3?=
 =?utf-8?B?ckFhSVhkUHF6TlBjUVFVcWtBMFhUcmVucHhRUnNjUUowb1RTTU9nRVo2ejBj?=
 =?utf-8?B?eW83bDdEalUyZ0FzMWpEM1dsYUdHMVo5ejA0UEI3UVhYM2dGREczb3hMUi9P?=
 =?utf-8?B?OCtBbDMrVWZZYmpnWmg1R3lleWRVRUlobU9CR2hoVWMrb2NtYmFtVXBRdU9H?=
 =?utf-8?B?cFcvQUl0QzJITENYVUxENWQ4MVdOZldzVUh2ZHQ3VXVtSkJYZXJibEREYzUx?=
 =?utf-8?B?TDREdHczVTlVTDMzSmN5Q0IvV3hVU1VUWHFVRUhOdTBaSnNkNkZHTHJOWE5l?=
 =?utf-8?B?NktHa2MrQlB3aHZCQWVTNmpBemI1ZE1uWjNrcE5JSWxNR3I4TEdPTWxXeERk?=
 =?utf-8?B?L2VRZ0tCNWhGeXRadVFiUGhBSFkvd2x5NUVKL2lUbFM1Qk9mWHJZYVY5aVRP?=
 =?utf-8?B?dmdSSzJENHROcDdEcnVTaUdZODJxOXdpTDZrMUVJMDhsU09nNGFBTVBtak5Q?=
 =?utf-8?B?WkJXTFFVMVhsRmFkNTE3cnVXcHkzUlVwcVhrR0M3ZVlmdTZON1VCZTc1WXZp?=
 =?utf-8?B?eXVHTFJDeG9NaUViTkxUOWFKemRVYkRoY3FsTldrS0Z4MTQzVk51SXk2a0Zn?=
 =?utf-8?B?cEZERGxRRjFNZVI2dzdiT0QrcjJ5V0VBZ1JzU0FDN2xxblRYSnY0SVVYeGpZ?=
 =?utf-8?B?N2tXeXdvZ2JtcExPUkFWWlc1K3g5WEtZRWhZSHR3R0ZBZ2NsaVBCZVF0ZWQy?=
 =?utf-8?B?K1RpLzZJOHJkbnBNQTVHQmp1SlFoZ2VoYWdwNklKbTRHbDdkRHovd1RHMkkx?=
 =?utf-8?B?bE8vZCtaQnR1K3VHVmNHOFYvdS8xT3JhK2h0K0xmUzhKQk03L21Ud0x6aXkz?=
 =?utf-8?B?VVZGU2VvQlB6QzhkeDdNYzQ3eXJIN2w3NmtrblBSRmFueVhKNTl4QzRrLzcv?=
 =?utf-8?B?VTNRYy85NEljT0tGS1FzTGhDREJsN0hVa0ZKYnJraTc1K1NvUm9Gd2xqTHVs?=
 =?utf-8?B?aFcwQUZXZ0tiZEhRVis1blFkL3FLZkZPNkhwSVlnczJjVDZXejh5VzZHb2pU?=
 =?utf-8?B?NjY3ZTBIUHBNSWdjRGNmTm5DYlJURHZOc2MraFkvSlVScEt2RjJFWVp4aGU2?=
 =?utf-8?B?NzM0UnZiRnRZQXBMNFpKU1ZlOTZTNjV4TGRXMEdUZ0RQL3JCNC8vVDVTMCtJ?=
 =?utf-8?B?Zi9MZE55Q0Y4ekh1SXZjUTI2c3dsYXQ4TFlBZjZCdGRaMFBqVk9vRnpGbHlZ?=
 =?utf-8?B?ZHlXVnd1azhPSVdVcE1HWS9WZUVGbzZ1d3VVYXBVZzh1UWgvSXN5bGl0QTI1?=
 =?utf-8?B?bjVBd1VnTnN5LzREUVR0MlJXRjhJcDRBMTlkV24rZGlXblJDUVdqQ2U4YUNn?=
 =?utf-8?B?L3RQL2RYTnVvN2RHbmplejVucmdVNUpvdFdnQy9FVDIybStmNE1FVmJTWlpC?=
 =?utf-8?Q?f1UDktso1XTNlKopJN1K/Dw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBD579F94D05C2489D3ECCD3883AEDDB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca3c8b2-226c-4340-1ac0-08dabe8d42c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 17:51:54.6069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrZpT1R5ILhSe2kkPxbDeCT61/QYF1hEASAr0/4kysN2oXsTQrz3LNJHIRlAAzN7SfeD45qCk2DDRytqxSoHO2PyEvBEgRbo5J93G8y00fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1598
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzExLzIwMjIgw6AgMTg6MjcsIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gV2hlbiBDT05GSUdfVk1BUF9TVEFDSyBpcyBlbmFibGVkLCB3ZSBzZXQgVEhSRUFEX1NJWkUg
dG8gYmUgYXQgbGVhc3QgdGhlDQo+IHNpemUgb2YgYSBwYWdlLg0KPiANCj4gVGhlcmUncyBhIGZl
dyBiaXRzIG9mIGFzc2VtYmx5IGluIHRoZSBib29rM3M2NCBjb2RlIHRoYXQgdXNlIFRIUkVBRF9T
SVpFIGluDQo+IGltbWVkaWF0ZSBtb2RlIGluc3RydWN0aW9ucywgd2hpY2ggY2FuIG9ubHkgdGFr
ZSBhbiBvcGVyYW5kIG9mIHVwIHRvIDE2DQo+IGJpdHMgc2lnbmVkLCB3aGljaCBpc24ndCBxdWl0
ZSBsYXJnZSBlbm91Z2guDQo+IA0KPiBGaXggdGhlc2Ugc3BvdHMgdG8gdXNlIGEgc2NyYXRjaCBy
ZWdpc3RlciBvciB1c2UgdHdvIGltbWVkaWF0ZSBtb2RlDQo+IGluc3RydWN0aW9ucyBpbnN0ZWFk
LCBzbyB3ZSBjYW4gbGF0ZXIgZW5hYmxlIFZNQVBfU1RBQ0suDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2FzbS1jb21wYXQuaCAgIHwgMiArKw0KPiAgIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvZW50cnlfNjQuUyAgICAgICAgICB8IDQgKysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvaXJxLmMgICAgICAgICAgICAgICB8IDggKysrKysrLS0NCj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL21pc2NfNjQuUyAgICAgICAgICAgfCA0ICsrKy0NCj4gICBhcmNoL3Bvd2VycGMva3Zt
L2Jvb2szc19odl9ybWhhbmRsZXJzLlMgfCAzICsrLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYXNtLWNvbXBhdC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2FzbS1jb21wYXQuaA0KPiBpbmRleCAyYmM1M2M2NDZjY2QuLjMwZGQ3ODEzYmYzYiAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2FzbS1jb21wYXQuaA0KPiArKysgYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXNtLWNvbXBhdC5oDQo+IEBAIC0xMSw2ICsxMSw3IEBA
DQo+ICAgI2RlZmluZSBQUENfTEwJCXN0cmluZ2lmeV9pbl9jKGxkKQ0KPiAgICNkZWZpbmUgUFBD
X1NUTAkJc3RyaW5naWZ5X2luX2Moc3RkKQ0KPiAgICNkZWZpbmUgUFBDX1NUTFUJc3RyaW5naWZ5
X2luX2Moc3RkdSkNCj4gKyNkZWZpbmUgUFBDX1NUTFVYCXN0cmluZ2lmeV9pbl9jKHN0ZHV4KQ0K
PiAgICNkZWZpbmUgUFBDX0xDTVBJCXN0cmluZ2lmeV9pbl9jKGNtcGRpKQ0KPiAgICNkZWZpbmUg
UFBDX0xDTVBMSQlzdHJpbmdpZnlfaW5fYyhjbXBsZGkpDQo+ICAgI2RlZmluZSBQUENfTENNUAlz
dHJpbmdpZnlfaW5fYyhjbXBkKQ0KPiBAQCAtNDUsNiArNDYsNyBAQA0KPiAgICNkZWZpbmUgUFBD
X0xMCQlzdHJpbmdpZnlfaW5fYyhsd3opDQo+ICAgI2RlZmluZSBQUENfU1RMCQlzdHJpbmdpZnlf
aW5fYyhzdHcpDQo+ICAgI2RlZmluZSBQUENfU1RMVQlzdHJpbmdpZnlfaW5fYyhzdHd1KQ0KPiAr
I2RlZmluZSBQUENfU1RMVVgJc3RyaW5naWZ5X2luX2Moc3R3dXgpDQo+ICAgI2RlZmluZSBQUENf
TENNUEkJc3RyaW5naWZ5X2luX2MoY21wd2kpDQo+ICAgI2RlZmluZSBQUENfTENNUExJCXN0cmlu
Z2lmeV9pbl9jKGNtcGx3aSkNCj4gICAjZGVmaW5lIFBQQ19MQ01QCXN0cmluZ2lmeV9pbl9jKGNt
cHcpDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzY0LlMgYi9hcmNo
L3Bvd2VycGMva2VybmVsL2VudHJ5XzY0LlMNCj4gaW5kZXggM2UyZTM3ZTZlY2FiLi5hZjI1ZGI2
ZTAyMDUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfNjQuUw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzY0LlMNCj4gQEAgLTIzOCw3ICsyMzgsOSBA
QCBFTkRfRlRSX1NFQ1RJT05fSUZDTFIoQ1BVX0ZUUl9BUkNIXzIwN1MpDQo+ICAgCS8qIE5vdGU6
IHRoaXMgdXNlcyBTV0lUQ0hfRlJBTUVfU0laRSByYXRoZXIgdGhhbiBJTlRfRlJBTUVfU0laRQ0K
PiAgIAkgICBiZWNhdXNlIHdlIGRvbid0IG5lZWQgdG8gbGVhdmUgdGhlIDI4OC1ieXRlIEFCSSBn
YXAgYXQgdGhlDQo+ICAgCSAgIHRvcCBvZiB0aGUga2VybmVsIHN0YWNrLiAqLw0KPiAtCWFkZGkJ
cjcscjcsVEhSRUFEX1NJWkUtU1dJVENIX0ZSQU1FX1NJWkUNCj4gKwlsaQlyOSwwDQo+ICsJb3Jp
CXI5LHI5LFRIUkVBRF9TSVpFLVNXSVRDSF9GUkFNRV9TSVpFDQo+ICsJYWRkCXI3LHI3LHI5DQoN
ClNvIHlvdSBhc3N1bWUgVEhSRUFEX1NJWkUgaXMgbmV2ZXIgbW9yZSB0aGFuIDY0ayA/IElzIHRo
YXQgYSB2YWxpZCANCmFzc3VtcHRpb24gPw0KDQpXaGF0IGFib3V0IHRoZSBiZWxvdyBpbnN0ZWFk
Og0KDQoJYWRkaXMJcjcscjcsVEhSRUFEX1NJWkUtU1dJVENIX0ZSQU1FX1NJWkVAaGENCglhZGRp
CXI3LHI3LFRIUkVBRF9TSVpFLVNXSVRDSF9GUkFNRV9TSVpFQGwNCg0KPiAgIA0KPiAgIAkvKg0K
PiAgIAkgKiBQTVUgaW50ZXJydXB0cyBpbiByYWRpeCBtYXkgY29tZSBpbiBoZXJlLiBUaGV5IHdp
bGwgdXNlIHIxLCBub3QNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL2lycS5jDQo+IGluZGV4IDllZGU2MWE1YTQ2OS4uMDk4Y2Y2
YWRjZWVjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2lycS5jDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMNCj4gQEAgLTIwNCw3ICsyMDQsOSBAQCBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgY2FsbF9kb19zb2Z0aXJxKGNvbnN0IHZvaWQgKnNwKQ0KPiAg
IHsNCj4gICAJLyogVGVtcG9yYXJpbHkgc3dpdGNoIHIxIHRvIHNwLCBjYWxsIF9fZG9fc29mdGly
cSgpIHRoZW4gcmVzdG9yZSByMS4gKi8NCj4gICAJYXNtIHZvbGF0aWxlICgNCj4gLQkJIFBQQ19T
VExVICIJJSVyMSwgJVtvZmZzZXRdKCVbc3BdKQk7Ig0KPiArCQkibGkJCSUlcjAsIDAJCQk7Ig0K
PiArCQkib3JpCQklJXIwLCAlJXIwLCAlW29mZnNldF0JOyINCg0KU2FtZSwgeW91IGFzc3VtZSBv
ZmZzZXQgdG8gYmUgbWF4IDY0aywgaXMgdGhhdCBjb3JyZWN0ID8NCg0KV2hhdCBhYm91dA0KCQls
aXMJCXIwLCBvZmZzZXRAaA0KCQlvcmkJCXIwLCByMCwgb2Zmc2V0QGwNCg0KPiArCQkgUFBDX1NU
TFVYICIJJSVyMSwgJVtzcF0sICUlcjAJOyINCj4gICAJCSJtcgkJJSVyMSwgJVtzcF0JCTsiDQo+
ICAgCQkiYmwJCSVbY2FsbGVlXQkJOyINCj4gICAJCSBQUENfTEwgIgklJXIxLCAwKCUlcjEpCQk7
Ig0KPiBAQCAtMjU2LDcgKzI1OCw5IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjYWxs
X2RvX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdm9pZCAqc3ApDQo+ICAgDQo+ICAgCS8qIFRl
bXBvcmFyaWx5IHN3aXRjaCByMSB0byBzcCwgY2FsbCBfX2RvX2lycSgpIHRoZW4gcmVzdG9yZSBy
MS4gKi8NCj4gICAJYXNtIHZvbGF0aWxlICgNCj4gLQkJIFBQQ19TVExVICIJJSVyMSwgJVtvZmZz
ZXRdKCVbc3BdKQk7Ig0KPiArCQkibGkJCSUlcjAsIDAJCQk7Ig0KPiArCQkib3JpCQklJXIwLCAl
JXIwLCAlW29mZnNldF0JOyINCj4gKwkJIFBQQ19TVExVWCAiCSUlcjEsICVbc3BdLCAlJXIwCTsi
DQoNClNhbWUNCg0KPiAgIAkJIm1yCQklJXI0LCAlJXIxCQk7Ig0KPiAgIAkJIm1yCQklJXIxLCAl
W3NwXQkJOyINCj4gICAJCSJibAkJJVtjYWxsZWVdCQk7Ig0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9taXNjXzY0LlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL21pc2NfNjQuUw0K
PiBpbmRleCAzNjE4NGNhZGEwMGIuLmZmNzFiOTg1MDBhMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9taXNjXzY0LlMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9taXNj
XzY0LlMNCj4gQEAgLTM4NCw3ICszODQsOSBAQCBfR0xPQkFMKGtleGVjX3NlcXVlbmNlKQ0KPiAg
IAlzdGQJcjAsMTYocjEpDQo+ICAgDQo+ICAgCS8qIHN3aXRjaCBzdGFja3MgdG8gbmV3c3RhY2sg
LS0gJmtleGVjX3N0YWNrLnN0YWNrICovDQo+IC0Jc3RkdQlyMSxUSFJFQURfU0laRS1TVEFDS19G
UkFNRV9PVkVSSEVBRChyMykNCj4gKwlsaQlyMCwwDQo+ICsJb3JpCXIwLHIwLFRIUkVBRF9TSVpF
LVNUQUNLX0ZSQU1FX09WRVJIRUFEDQo+ICsJc3RkdXgJcjEscjMscjANCg0KU2FtZQ0KDQo+ICAg
CW1yCXIxLHIzDQo+ICAgDQo+ICAgCWxpCXIwLDANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9rdm0vYm9vazNzX2h2X3JtaGFuZGxlcnMuUyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2
X3JtaGFuZGxlcnMuUw0KPiBpbmRleCAzN2Y1MDg2MWRkOTguLmQwNWUzZDMyNGY0ZCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfaHZfcm1oYW5kbGVycy5TDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X3JtaGFuZGxlcnMuUw0KPiBAQCAtMjY4Niw3ICsy
Njg2LDggQEAga3ZtcHBjX2JhZF9ob3N0X2ludHI6DQo+ICAgCW1yCXI5LCByMQ0KPiAgIAlzdGQJ
cjEsIFBBQ0FSMShyMTMpDQo+ICAgCWxkCXIxLCBQQUNBRU1FUkdTUChyMTMpDQo+IC0Jc3ViaQly
MSwgcjEsIFRIUkVBRF9TSVpFLzIgKyBJTlRfRlJBTUVfU0laRQ0KPiArCXN1YmkJcjEsIHIxLCBU
SFJFQURfU0laRS8yDQo+ICsJc3ViaQlyMSwgcjEsIElOVF9GUkFNRV9TSVpFDQoNClNhbWUsIHdo
YXQgYWJvdXQNCg0KCXN1YmlzCXIxLCByMSwgVEhSRUFEX1NJWkUvMiArIElOVF9GUkFNRV9TSVpF
QGhhDQoJc3ViaQlyMSwgcjEsIFRIUkVBRF9TSVpFLzIgKyBJTlRfRlJBTUVfU0laRUBsDQoNCj4g
ICAJc3RkCXI5LCAwKHIxKQ0KPiAgIAlzdGQJcjAsIEdQUjAocjEpDQo+ICAgCXN0ZAlyOSwgR1BS
MShyMSk=
