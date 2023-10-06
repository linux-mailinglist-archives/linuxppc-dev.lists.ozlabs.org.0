Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A47BB136
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 07:23:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=itO9zRgy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1xf215hpz3dL4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 16:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=itO9zRgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1xd56F4Yz3bX1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 16:22:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL+1Pi+4MOgpWsZQ52FQxlKxwKesu1lpLLf0kqA8arQaWkvIAcqC6+SJkevCg/pwdX01R6QC/K4tKSBlsMMxU4NJegx1eUQLEtZGCR+wwK8Q8qhgZr/wbTQNDZy29ledZKTTs9kXLWQPISrS0S8qSHc0gYUhkreP+/OcT/SB+uQAC2Ps7d4wyfr0TnLfE+TEjLrOdf9+PqVZvhkbe2r/YcV+Qug9LzeUhq1snU/9xPRnjYlsMadborHSV3TyCjIyVFvZ3uFQZWmFwfvnEDPncmXXLVTIWURXPaG04LCLPPXWj/sE+44Pt/5xBs0hvr3Ta1CCYTTHIYJYs2Ewxa/e+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SavnYbq+1AS4JYyh+zOqIwpJc6rsyUQbusJsOt3/yh8=;
 b=X3r7WkDG32CCpy2D0csNBAUsPpS66HI0PMSnmaAo67Lnf3HFzjQo6i88zqG243nU0js3C5clLqOeXvCbGKmioNxrQXof2Ot1ijmIWV1mnGoXYe+ytEm3N3ZdZsk1wPAKTziOorhCYsQr6GJt6KMExu4zgHH8CwGCx0wr+QeoSgzDy6CRGfQ0d2d9YuDyMg9SUagV3+MlfX6o6LxBmk6oEMDf1N8k7Sp+dsk+nqrnndmerTrxxF9nRpwvI8z90W5eV4AFDe5VV77y7HV9m39Zh8+/Mn/ZY7fLPIMaxwXlzR5F6eJWJUb9USVOo9f9TTqs5VsLPVYhUYtT2CqllgJjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SavnYbq+1AS4JYyh+zOqIwpJc6rsyUQbusJsOt3/yh8=;
 b=itO9zRgyOkALMc51N1e0gw8TCM/x5uu5P5L8EL7lRFfdLIKLTvoszSGcxCjbEzuXmxEYpJrf76OKHhZwNYoN0J+XVn2CMpsZjGsmMKLYxZnK5H6FAHGZDmSOGvdjOSrXH7Lx//sEPdwoK+/zq0oA2BR02FyZ9/LjjNtB3VxEFADHfSSId/qGF7Ysxe65fTw9x6fR8dgGUptEB2M/DTQo91KU2/i/J8ndoLnHckoN5PBQb/xTb8yRA6vJG8tQsBhHF1cpqD6vbjDq2hw7Y9QokduS0lPCGyjZV2UKn4SB9xDihuyhlZr4yQQiW//A0osFKn/jUhVOUUd1XeW+8P2++w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3450.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 05:21:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 05:21:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Eddie James <eajames@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: KUEP broken on FSP2?
Thread-Topic: KUEP broken on FSP2?
Thread-Index: AQHZ978R6EU4rs4G8UK8Ora/CnKi+7A8OoMA
Date: Fri, 6 Oct 2023 05:21:51 +0000
Message-ID: <11fda331-f3b8-57e2-1073-b6b2b40deea5@csgroup.eu>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
In-Reply-To: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3450:EE_
x-ms-office365-filtering-correlation-id: 57509615-bbf7-4dc6-beee-08dbc62c2554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Xbw98m1ZP0JeW1BnVieXZOie7VyCB8ch5rJrMECfIN0uwReBeoXbPk3ffa41+6E9/igub+YcfcE+ojpgo6/weHGaAhg0eJHcTOcnv/0bgEkqzm8eUEn8A5vaH2AfAHW40BTru+F3Dk/JgOCSdnr52s/gr9D+Y0WQZiovnQ3dImHgqOZPZ4a9t6Q98I6zHhrRMaOaAVeDN/3emTaOy6XRCSQ1O4UPR57gr6mO4QMqXgvx6eh4EQj/YbybtrmdHI0V1+aJGyND+DBva1tYmQoej9PMiv6/pm1YjJm3im0nRibi4+r3OXInRyVopsHRTZ8oReKNQJJp0sjfpica5keW/hcCk0EUCNPp4aqLe8sP55Xyw9f8U6m5sTYQ3XFSo7+Pa8VcB84LKu3XnBflHrIgPLaf9IlSS3srfKTi3g9IQof4ZuNhxlZDwCi3260TOhyOalljdsLTUuJr0Xa0yLDVS3kTbOGOGSzav4tzTK8Ae2wit4C3o6TtAYum78RiE4uoBon7IyYIE8RKXUGtzgA5SakaNdvmPbYTZ3Ol2yqf9ydlk2I7XtU6lT78mTXucFkfIQCYHRnIntZ5EJVkPc8WAj3YeAp9e3DMU9Yxm6R4xBY41jMToA7QonaI1tfqVYf5B+XtyZG+VTaeWbJxunqR52YVuZVo5GMRjR01LdDDh0KGfB4O3aIIu0muiNdzkNwa
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39830400003)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(2906002)(122000001)(38100700002)(38070700005)(44832011)(5660300002)(86362001)(36756003)(31696002)(478600001)(6486002)(66574015)(6512007)(26005)(83380400001)(31686004)(2616005)(41300700001)(6506007)(71200400001)(110136005)(316002)(76116006)(91956017)(66556008)(66446008)(64756008)(54906003)(66946007)(4326008)(8936002)(8676002)(45080400002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VENzcWNQbGt3NS9CUXFheHlrNjVaVWtzOW5IN3hsOVRDVmdNcnFRbUZrbURB?=
 =?utf-8?B?R0wvMTV4enl3TFVOQ0dJT1gvRkNmT2JBR3hGQTE1MGU0aXpzVGJtcUFjSExX?=
 =?utf-8?B?eTJ2RVBEODg0NVRCQkNxZmxTWDVNRnc5Y2VJODJXaHlHbzM5OGo1bzViODBL?=
 =?utf-8?B?emdxTUFhU1c1bVNVUlJIb2lrMVhsU3o2cVZ0blp6R1dYakorZmp1V3RGMGtD?=
 =?utf-8?B?TnVuYkhVRXVLclRWOW9vMGUvdXk3SDcvRmdxamNFTUhLOE5QRHNtelVmcm81?=
 =?utf-8?B?akRWOUs3MVVqWXdWZUdmQjVGRUdXTVFVY01BSDVUM3lIK1cwVTByY1JHNStI?=
 =?utf-8?B?Wko3c2xhaUQxdXE0NHR3RVNOTkNaUnpTREx0VzQrZ1lPMS9jeVMvYmNrMml5?=
 =?utf-8?B?eHVCZ2hSRTdZNytGbWFReWpRemhyOENKVzl4Y2JLVTArUVNOdFVFNlpzd2pr?=
 =?utf-8?B?azBPdWxuOFBBajhSNWplZGVTamdpL0xaOWVDekRXVnZnbEsrTWduSU9hWmJt?=
 =?utf-8?B?aGZnT3Zma24wTmtaQm1OcjQzTUt0TXdLejhVU2kvQUMzSXhFZU4rbTFMRitw?=
 =?utf-8?B?RjIreWRtNHFIWUdiVTduT2gxMC80cVlHYTJHRGcyTkVPMUNWVy8yZ1NnTnMy?=
 =?utf-8?B?UkM4NWpIZkZNYWtvNXdyTHBMTGVxVWlFQmlaTE5DVkREanViTFdiUm9iZllW?=
 =?utf-8?B?RXB5a0VhRnNoeFlIMDlUSjJpc3NQeHN1MVZWQmpVdmRkVkpEZXhLQ1JQRy9R?=
 =?utf-8?B?Q056WFRiRHFBeWp2c3FwdWFNUXprNkUrdDVyVzdvTVd0ZW45dzV5R0F2aFhK?=
 =?utf-8?B?dzRIbnR3cE5kNlNNWHgzZ0FGN2VIUkMrMElaL1lSay8zTzE2WG4xR1dWMW0w?=
 =?utf-8?B?emE1OGhyQllwMWpBSjNRSU9Fc2txYmZDWVk5UmpqZGtxSzhKQ01WbEJtWURw?=
 =?utf-8?B?RXNOUUZ3S1QvbEZaNHdMZ0NHeDJMVTg4Wk9MbkZjWUVaWGpNZXB5K3EvWTJl?=
 =?utf-8?B?YU5QL0lqcXc1YlFiOU5uN1ROdmJsdHBFR29mUTJ6Y1VUWkJBQ3Y4VVZWa1RS?=
 =?utf-8?B?aUdTTlIramx4bmd3WWFFRitjcTV6VWNSY3N1akZwUnRXU1ZRcWtqd0Y4YXdK?=
 =?utf-8?B?dlFjTmFrOVBWZTdEY0NEc1ByOTRDQ3p0RWw0WllFcUdEaitqaUFmSGVCZ1hU?=
 =?utf-8?B?ZHdkQ3R4YVVWR0l4Mnp1TGxrQkVQQ2M2U1pvK2M3YTVhWSs3U0NLSWs1d0Nz?=
 =?utf-8?B?WVBGOXV1UVpOdXhlc2VUaUs1eUxzUDNIVThpbjQzWEJ4a2dtQVFFZks0YnFF?=
 =?utf-8?B?QldxQWpSbTgrcENNYUhuWVVBc2dZZ2lsOHpLanhiMERPYS84WkxYdEh4YUQ5?=
 =?utf-8?B?NndDRUYwVkw0a2pZYk85VWpTUnIzQ2Q1T0lzdXYwV212anV4QU5QK05rdFBN?=
 =?utf-8?B?cG54cVgvS2c0cnMxdkdUYzNLT05sQThIQloxbHo1aHVUbnd1M1NzUmt4azgr?=
 =?utf-8?B?WFR1cFJKbFkydkRrandmdFlvVGlINDVUdERLRmh5c2krNzg0WTNlQXVLU1ln?=
 =?utf-8?B?c3hNdjZSZU5nQ1FnT0I5UGJZVDRhY0F3RkE1aFFRRDQvZi9JWEtjZkJsOUF5?=
 =?utf-8?B?OXVNZlQ3a21HLzl4N25mUUdTZ1AyV0FnSnJ5Z0NBTXkxdGlzMFYvL1dQUnZx?=
 =?utf-8?B?TnpoV1BaczZhMEJMT2wrTEVIb3BucjFtMjhPZkZWemNPSkZ0QVppeHlCNE4w?=
 =?utf-8?B?QlBNK01zVk4rN3ZRL1JZelpHSEMvZGRoNGRzQTdzcEF0QXBETzl2YisxeC9i?=
 =?utf-8?B?YUVtV3FETU1mT1BLYTQrU09XNDNJdXAvSFRoei9SOE13aW9JZGtQdmtTNHZV?=
 =?utf-8?B?TFF0cXU2UWs3a0daSmIyVk9GUWlycE0rSm1LZTNpdndHbGt5REphamJKcGVq?=
 =?utf-8?B?ZlNzTHY0WlUvSmhSUjdQUzVJSmExNFBUa1lYNkUxUGlFQVFtNEhTdlFhcTZl?=
 =?utf-8?B?RHYvNG1NdU5PVUhVOUR5NTIwR3BJS2o1ajZLeWJnVkpRRWRoaHdYRmZDUWJx?=
 =?utf-8?B?aGM1WTlWeFdKSlBmVTk4V2pUdWkvbTBDL0VSOHk0QnM2L0dEU0dZZG00dUU5?=
 =?utf-8?Q?2evUXW/C8NGuGRaixNKb7Qiaj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <130F2065D9078047A0775C412FD66E53@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57509615-bbf7-4dc6-beee-08dbc62c2554
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 05:21:51.0228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/1/YxmmGh7YMmTqKTxrsV0oSRxie88Zl4yDaVB4X0vIvD2X+JbRdzsNM0iAcBZfbNLdaXE340Qs6t30j9NURW59bSInRIDdozfqAi54z5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3450
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

SGksDQoNCkxlIDA1LzEwLzIwMjMgw6AgMjE6MDYsIEVkZGllIEphbWVzIGEgw6ljcml0wqA6DQo+
IEhpLA0KPiANCj4gSSdtIGF0dGVtcHRpbmcgdG8gcnVuIGxpbnV4IDYuMSBvbiBteSBGU1AyLCBi
dXQgbXkga2VybmVsIGNyYXNoZXMgDQo+IGF0dGVtcHRpbmcgdG8gZ2V0IGludG8gdXNlcnNwYWNl
LiBUaGUgaW5pdCBzY3JpcHQgd29ya3MsIGJ1dCB0aGUgZmlyc3QgDQo+IGJpbmFyeSAobW91bnQp
IEkgcnVuIHJlc3VsdHMgaW4gb29wcy4gQ2FuIGFueW9uZSBoZWxwIG1lIHRvIGRlYnVnIHRoaXMg
DQo+IGZ1cnRoZXIgb3Igc3VnZ2VzdCBhbnl0aGluZz8NCg0KSSBjYW4ndCBzZWUgYW55dGhpbmcg
aW4geW91ciBkdW1wIHN1Z2dlc3RpbmcgdGhhdCBLVUVQIGlzIGJyb2tlbiwgY2FuIHlvdSA/DQoN
CldoYXQgSSBzZWUgaXMgdGhhdCBrZXJuZWwgdHJpZXMgdG8gZXhlY3V0ZSB1c2VyIG1lbW9yeSwg
d2hpY2ggaXMgd3JvbmcuIA0KQW5kIEtVRVAgcGVyZmVjdGx5IHdvcmtzIGJ5IGJsb2NraW5nIHRo
YXQgYWNjZXNzLiBUaGVyZSBpcyBubyBjYWxsIA0KdHJhY2UsIHN1Z2dlc3RpbmcgdGhhdCB0aGUg
a2VybmVsIGhhcyBqdW1wZWQgaW4gdGhlIHdlZWQuDQoNCkNocmlzdG9waGUNCg0KPiANCj4gDQo+
IFRoYW5rcywNCj4gDQo+IEVkZGllDQo+IA0KPiANCj4gW8KgwqDCoCAxLjA0Mjc0M10ga2VybmVs
IHRyaWVkIHRvIGV4ZWN1dGUgdXNlciBwYWdlIChiN2VlMjAwMCkgLSBleHBsb2l0IA0KPiBhdHRl
bXB0PyAoDQo+IHVpZDogMCkNCj4gW8KgwqDCoCAxLjA0Mjg0Nl0gQlVHOiBVbmFibGUgdG8gaGFu
ZGxlIGtlcm5lbCBpbnN0cnVjdGlvbiBmZXRjaA0KPiBbwqDCoMKgIDEuMDQyOTE5XSBGYXVsdGlu
ZyBpbnN0cnVjdGlvbiBhZGRyZXNzOiAweGI3ZWUyMDAwDQo+IFvCoMKgwqAgMS4wNDI5ODZdIE9v
cHM6IEtlcm5lbCBhY2Nlc3Mgb2YgYmFkIGFyZWEsIHNpZzogMTEgWyMxXQ0KPiBbwqDCoMKgIDEu
MDQzMDU5XSBCRSBQQUdFX1NJWkU9NEsgRlNQLTINCj4gW8KgwqDCoCAxLjA0MzEwNl0gTW9kdWxl
cyBsaW5rZWQgaW46DQo+IFvCoMKgwqAgMS4wNDMxNDldIENQVTogMCBQSUQ6IDYxIENvbW06IG1v
dW50IE5vdCB0YWludGVkIA0KPiA2LjEuNTUtZDIzOTAwZi5wcGNuZi1mc3AyDQo+ICMxDQo+IFvC
oMKgwqAgMS4wNDMyNDldIEhhcmR3YXJlIG5hbWU6IGlibSxmc3AyIDQ3NmZwZSAweDdmZjUyMGMw
IEZTUC0yDQo+IFvCoMKgwqAgMS4wNDMzMjNdIE5JUDrCoCBiN2VlMjAwMCBMUjogOGMwMDgwMDAg
Q1RSOiAwMDAwMDAwMA0KPiBbwqDCoMKgIDEuMDQzMzkyXSBSRUdTOiBiZmZlYmQ4MyBUUkFQOiAw
NDAwwqDCoCBOb3QgdGFpbnRlZCANCj4gKDYuMS41NS1kMjM5MDBmLnBwY25mLWZzDQo+IHAyKQ0K
PiBbwqDCoMKgIDEuMDQzNDkxXSBNU1I6wqAgMDAwMDAwMzAgPElSLERSPsKgIENSOiAwMDAwMTAw
MMKgIFhFUjogMjAwMDAwMDANCj4gW8KgwqDCoCAxLjA0MzU3OV0NCj4gW8KgwqDCoCAxLjA0MzU3
OV0gR1BSMDA6IGMwMDExMGFjIGJmZmViZTYzIGJmZmViZTdlIGJmZmViZTg4IDhjMDA4MDAwIA0K
PiAwMDAwMTAwMCAwMDAwDQo+IDBkMTIgYjdlZTIwMDANCj4gW8KgwqDCoCAxLjA0MzU3OV0gR1BS
MDg6IDAwMDAwMDMzIDAwMDAwMDAwIDAwMDAwMDAwIGMxMzlkZjEwIDQ4MjI0ODI0IA0KPiAxMDE2
YzMxNCAxMDE2DQo+IDAwMDAgMDAwMDAwMDANCj4gW8KgwqDCoCAxLjA0MzU3OV0gR1BSMTY6IDEw
MTYwMDAwIDEwMTYwMDAwIDAwMDAwMDA4IDAwMDAwMDAwIDEwMTYwMDAwIA0KPiAwMDAwMDAwMCAx
MDE2DQo+IDAwMDAgMTAxN2Y1YjANCj4gW8KgwqDCoCAxLjA0MzU3OV0gR1BSMjQ6IDEwMTdmYTUw
IDEwMTdmNGYwIDEwMTdmYTUwIDEwMTdmNzQwIDEwMTdmNjMwIA0KPiAwMDAwMDAwMCAwMDAwDQo+
IDAwMDAgMTAxN2Y0ZjANCj4gW8KgwqDCoCAxLjA0NDEwMV0gTklQIFtiN2VlMjAwMF0gMHhiN2Vl
MjAwMA0KPiBbwqDCoMKgIDEuMDQ0MTUzXSBMUiBbOGMwMDgwMDBdIDB4OGMwMDgwMDANCj4gW8Kg
wqDCoCAxLjA0NDIwNF0gQ2FsbCBUcmFjZToNCj4gW8KgwqDCoCAxLjA0NDIzOF0gSW5zdHJ1Y3Rp
b24gZHVtcDoNCj4gW8KgwqDCoCAxLjA0NDI3OV0gWFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFgg
WFhYWFhYWFggWFhYWFhYWFggWFhYWFhYWFggDQo+IFhYWFhYWFhYIFhYDQo+IFhYWFhYWA0KPiBb
wqDCoMKgIDEuMDQ0MzkyXSBYWFhYWFhYWCBYWFhYWFhYWCBYWFhYWFhYWCBYWFhYWFhYWCBYWFhY
WFhYWCBYWFhYWFhYWCANCj4gWFhYWFhYWFggWFgNCj4gWFhYWFhYDQo+IFvCoMKgwqAgMS4wNDQ1
MDZdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiBbwqDCoMKgIDEuMDQ0
NTY4XQ0KPiBbwqDCoMKgIDEuMDQ0NTkwXSBub3RlOiBtb3VudFs2MV0gZXhpdGVkIHdpdGggaXJx
cyBkaXNhYmxlZA0KPiANCg==
