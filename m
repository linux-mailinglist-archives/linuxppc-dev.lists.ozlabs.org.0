Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6898725B3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 18:32:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S/ox7Qjz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq2gZ6WVtz3vnd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 04:32:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S/ox7Qjz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq2fs75pZz3vbj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 04:31:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5ukIMupd5aCJdCXYzDzOAk4zns3M4eY34NnsjaBIo9W4wT6fXnjWrIW+jnQpAOY/7eI5I2mzEse8T84lCykGsVLkC9tlBS0uiQnqu6WqmoQaRs+tKP4gksnKRQU+SOU1D128j3+azRC+QofivXmNq4q035bvPQG5yxz0qlbnBVaSplIY1OMAcMrk/wmYIK+8ybha9LFCIw+ipk8Ag1n5Rerkmt2n7kWCbxv4/bW7jq2T6XwpFQCw2fI+PupU4MFoV2u1v76MXXEqAt0A1cPOR5ypEvxyU0Ax2yChkvh5pOnScP1pKRRORC/VgYlUodjKc63P+qndFGIjy9BaGwPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whHt7HJ6NHSeF75IkZN8hPQSjhGBH+5ED2PD8JXSB84=;
 b=WrRp6x+T5+CLFAa2mhkOiN4P0jAbSBEWECRy+F0L9OcflZOTkB9WZ/Gcfa0GD/ZAf8slgwZ2njJuDjq62zV3hkeU8Pu3NGOcx9Z4S8zmT19EZFAng70PYTvH/o+g6m+astk7HBDMQI3/lA0tA8a95ZeyYEqFm7PlYAM+pXcVT5vU8Vw4nDqdolbp2k4jQ5VisUPZE0E0p6eJrZw3BcfUxhaY3N7Q+ulQJspFnu9Pah96h/fJWmFkktyb4syzdOvIsPUdI9FVCr1OzRnlLWsLpAjTlP5O7cv7u8IFuCvLIaPY/rI6JMi4BUzYowMFEkKqD601YY0r4n2NmiwsLac6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whHt7HJ6NHSeF75IkZN8hPQSjhGBH+5ED2PD8JXSB84=;
 b=S/ox7QjzsTxix108RLFd7vE10WB4VLX/gsWVoYqcFZRG4nu8BHDWpADMsRTCpG8simeYJXNCUmJDZxSGdaHvSuiss7Vv6sxbY9GucUDTuRA12A5GZV1JYygONw9pH4M65xVntDeBAk255EjuZbNodyu3kjTHNxXdKfCejV8Z+sc9Pc//arOo0qiy1acxlSJ49223ml/N1VAZ+oBHRN3gfLPdXQlam64KzgchL1lm5z843BaY1PmX7GA9FgfHmxVfCooV7uOG0+QJc6q3P7kr9IUGCE9kBOI4WsHQ7X3aNMq9bT/vRuF3FZKjY2jpbNYzOGlt6X2UPdxty3Md3ey2Og==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3584.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 17:31:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 17:31:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 02/10] mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
Thread-Topic: [PATCH v3 02/10] mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
Thread-Index: AQHabrb0BEl45765bUyLnW1y4GfPELEpaGiA
Date: Tue, 5 Mar 2024 17:31:14 +0000
Message-ID: <b2e12168-e257-408d-b258-5da7d795d6c3@csgroup.eu>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-3-peterx@redhat.com>
In-Reply-To: <20240305043750.93762-3-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3584:EE_
x-ms-office365-filtering-correlation-id: a8277329-19c6-4f46-004f-08dc3d3a0edc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bkMAoBn//YHZSH5xWXq6pBiVgMTnuY6mnYEewco+XlKKB3xp+uip4PTQp+PSpX3HR7x8OnmEMc+/GsQIpUXBAY/UKbGZPQ95F6W0VU2fcImubwReAk1uNqgKvcE2JdkueX3IFyWPO8D2XnrOG7c4SgW76C72TaCsK6Gx0Wjfx+4thhlewl0ouL2DFwwnu22usvHirxS9gorJkAGn/6gXgZN21sm6QzBmuu17VR7WZyTa6i7bLxDqYM/Ce0PbC5rwmIi0D1DBMdVIHzBFlzi00tXkkU2BMkyjogTnwLKIIoDpzpXTuSkMHObIkJMI5u9q4EGGW91XiRny+hnjoEwQEy4v+xwx/OROj/kF5TDDFkM6utNnyY4ZJapa3os+VnM53y1YZSEe8YE1e109LchS4+Dq08N/1FUhtAwjykrQZHl34y2VNd50uHHS2tfUMFWEgvGxQqwPS1gILmbk+rdLs3bCDTiIFKHQvAsWbN+uDuz+N9e7MUjamOHYI2NiPUrBGloVQAeYdeErhypLH5gj9ApzUh5SC1uR3MwRiPC6ZQnfdiYywBMO/RAI8wZmRCGEQGyd3WkX1x+r4R4gPmzW+hsECyqomZ9ZrQJIiaKb4t0PcgyYf8TqOJkK3THK5nZJ35AqzU/SL3Xa5G1Mms6DIibaywntmtBbnHmGKtwxa0hfTsFHlLB4P7Axhjx6YMY698qNcyyQVDqPNpTiV/2g+w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YUtCWm5hL0tFeDBsWHA3ZEpBU1d6dVlXWU9vOGNTNWtzNFN5WEhMN0E0cDZw?=
 =?utf-8?B?MkVuR1F3Uy9LeURQcWR0TmQwLzFqWkRMNkkvVU9KZmhRMHE3eVYwZ0JFZjNp?=
 =?utf-8?B?L1FPZCtwSU40cXNRdlA2aWNDZnNDcnNBOUtNaGRNK0ZoaFg0RzgrcUZzb0VC?=
 =?utf-8?B?M0U1VkIxeFhkT01JcnVzQTZYeWhxcjBoRE9SekYxMHNiRHYvMUhNT2RvakhH?=
 =?utf-8?B?Y1dzL2RuUGMrQ1BhWS9oeHEwb2E2VFpYMkx3Q0FXaVM5dG1nbUpzRjZtZlFU?=
 =?utf-8?B?K09aU0dCR1crN05DK0tVbmgxL2dLaHRORU02dlZZVytWRkdvUWNTc0ZGam54?=
 =?utf-8?B?bTZ3cEM5MlZ3dUU0ZmZyMERDTzIyNnBHQ09GVFBPMlZCcGZpMmROTURHdjhU?=
 =?utf-8?B?L1hLei85cXdZV3J6WkJxZ2hTSlMwWCtvTHZIMGpDMWcvcVFNYklxUjJUVXox?=
 =?utf-8?B?dm4xSFJFVjg4QTNxK0pUV1NibXhIZ2hMd1dnRXJxZnlPWFArdXNMTDQ2d0hG?=
 =?utf-8?B?cXJOQ3Y2dkhwMmtqUFYwdHAxeWR5MzhMdU9uS2RUeU8zdUJITXlydDhDNnQr?=
 =?utf-8?B?R3ZxMEFwREM0U052dnBrUm15VVBTeE14ODllU29WbCtlYnhrMy9sYUdTUWdo?=
 =?utf-8?B?cnlvMXB5N2pvTTJUVDM5MkwxUVRuTVlXNnlISWZiNHRHc0lLckQ0ZDdYeHFI?=
 =?utf-8?B?S1J2d2ltK3hDdk5XTzJzZ29jVTJBdFA0akxyN3g0WFJVaWtlMEwwRy9sc3ht?=
 =?utf-8?B?R1BjN0FQYXl3OWFyazlkK1FtQ2VqWFN3QXUrOFprWUo0UEF5QkhKYlg3alQ3?=
 =?utf-8?B?S01YZmgxRXU1YzN3V1pFOXBJcWQ1YzR4OEduNlh4VlFSbEs2M0gyOSs5ak9T?=
 =?utf-8?B?Z0xxakZQU1owczBiT2RmUnN0dEdzV3hVY0VGSWJQaEVJbFEybkpYMzhlQlJm?=
 =?utf-8?B?dmZwMFkvekcrWGVEeXB3cSttdHR1bm50bEJmUjVLTmdRMGlwNndmSWtvak04?=
 =?utf-8?B?bVhrRlRYc2lMMDg2U1FyNUlySk1IWi80VXZnbUdXVXgzRzhncENiZjI1YmF6?=
 =?utf-8?B?V2VkTFdHa0cyTEQvYTlVUkNVeFZxMXRZS3NaTFoxd1ltQjRZZTIvZHBuWkZj?=
 =?utf-8?B?OU1ac1YzZ2cwU1N1Z2dQQnQwMTFpN0JIcjRKak5JbkxJSWJZa0dLU3FaNVA4?=
 =?utf-8?B?VjdyaU5LdHNpRTlmdmZkaDlzZDloTzFwd2phUkdyZUhYTVBzVzZ6YkVRMk4v?=
 =?utf-8?B?WGFpeVlXV0s1VlRCbC9hTEtyUVlxZTl6NkpaSUVvQ1FFaXBtVjh4M0JGNE00?=
 =?utf-8?B?RVVpbnQwUXArVWtzSVg3b3NTZ2pFRDNwdWVQT3V3QzhzQ1puemphT0hPTnFw?=
 =?utf-8?B?S3VRRktPbjJ0NHc3T2NzQjdlUTBDb0xNNDFuTHJaNFJLam9DZnNTWDZIb3M1?=
 =?utf-8?B?NGVJNmh2by9GMnk4SFpXL3NWaFJKK2tDV24xQldoU3YvZkJrMnlYUXgwVHNP?=
 =?utf-8?B?bHpINVl2eDFXMWVyakhSMnZpY1ZtUU83WGZTNTNWK001cFpERWZTVVU3elhD?=
 =?utf-8?B?bmlKRUxYOTI0WkkvMnh2VEhndXZPSDVKbjZHWUdYYzI1THZ6aGdIeDJjc3U5?=
 =?utf-8?B?SWQrd25OVlFXVEdaUFNuQkh0OURuN3Q5bXdVYThzSUE4dUU5WDVKS3dkd0dn?=
 =?utf-8?B?bXIxYi9kdjRMMVFLN3AwdVR1cFFVai9CQ1hESG9DaEV5VmVTMUZGbW5Nc20v?=
 =?utf-8?B?YjNWdlR1QXhvcy9iYUI3YmtJSk95Y3Mva29tYkFEQVJoRUp2OFJYWDlhNVhp?=
 =?utf-8?B?TzJUcjBiOHRzaFh0YUlvK1FWUjV5VjNpeEVLY3lZYmViai93TzA0T05CeCsv?=
 =?utf-8?B?cHZSUzA1MWVydFBUa0UzZDB6c1k2aTNBRHltbGlPU1RTTVZLY0pSNFJTMzU4?=
 =?utf-8?B?SFVIWnlEei9VdDRZaTBUVVJlMGVHNmRIN3RnMnR6MWxRdXFPTVVxWDJ4ZTNI?=
 =?utf-8?B?NzM0SDdzZU9VWVJUNDZoKzJ3VnY2RmV3dGtZTVgraEV4L0V1R2oycjRqZUNJ?=
 =?utf-8?B?L21mYWFoNHB2TDQ2OURSdzZJOG94QlRhS1ptSjdERjJOak56L1FscHkvQmhq?=
 =?utf-8?B?S3NOY2t3dVYrL0daUHhqY3hXYldMVWxUL1FlSVlSaHdGRk1lWTd2UEdCcVg5?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F629288EDC8AA84F95D128358306D4E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8277329-19c6-4f46-004f-08dc3d3a0edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 17:31:14.6084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzIGrlB1ZseppeITo+lrtVVUONnQA9hkWqDmbdgp0UH+wsBXMhWuKbtYVZABvcv5qyloQXTrvQlAqU9/mm+OuYcLCUqG08gs+h5g3DhOP38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3584
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAzLzIwMjQgw6AgMDU6MzcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IFRoZXkncmUgdGhl
IHNhbWUgbWFjcm9zIHVuZGVybmVhdGguICBEcm9wIHBYZF9pc19sZWFmKCksIGluc3RlYWQgYWx3
YXlzIHVzZQ0KPiBwWGRfbGVhZigpLg0KPiANCj4gQXQgdGhlIG1lYW50aW1lLCBpbnN0ZWFkIG9m
IHJlbmFtZXMsIGRyb3AgdGhlIHBYZF9pc19sZWFmKCkgZmFsbGJhY2sNCj4gZGVmaW5pdGlvbnMg
ZGlyZWN0bHkgaW4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaC4gYmVjYXVzZSBz
aW1pbGFyDQo+IGZhbGxiYWNrIG1hY3JvcyBmb3IgcFhkX2xlYWYoKSBhcmUgYWxyZWFkeSBkZWZp
bmVkIGluDQo+IGluY2x1ZGUvbGludXgvcGd0YWJsZS5oLg0KPiANCj4gQ2M6IE1pY2hhZWwgRWxs
ZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dp
bkBnbWFpbC5jb20+DQo+IENjOiAiQW5lZXNoIEt1bWFyIEsuViIgPGFuZWVzaC5rdW1hckBrZXJu
ZWwub3JnPg0KPiBDYzogIk5hdmVlbiBOLiBSYW8iIDxuYXZlZW4ubi5yYW9AbGludXguaWJtLmNv
bT4NCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IFN1Z2dlc3RlZC1ieTog
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBSZXZpZXdl
ZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQpJbiBjYXNlIHlvdSBwb3N0IGEg
bmV3IHZlcnNpb24sIGluIHRoZSBzdWJqZWN0LCB1c3VhbGx5IHdpdGggdXNlIHBvd2VycGMgDQpu
b3QgcHBjDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9w
Z3RhYmxlLmggfCAxMCArKysrLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggICAgICAgICAgIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2Vy
cGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYyAgICAgICB8IDEyICsrKysrLS0tLS0NCj4gICBh
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jICAgICB8IDE0ICsrKysrKy0t
LS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAgIHwg
IDYgKystLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV82NC5jICAgICAgICAgICAgICAg
ICB8ICA2ICsrLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3htb24veG1vbi5jICAgICAgICAgICAgICAg
ICAgICAgfCAgNiArKy0tLQ0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwg
NTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzY0L3BndGFibGUuaA0KPiBpbmRleCBkMTMxOGU4NTgyYWMuLjNlOTllNDA5Nzc0YSAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4gQEAg
LTE0MzksMTggKzE0MzksMTYgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3B0ZV9yd191cGdyYWRl
KHVuc2lnbmVkIGxvbmcgb2xkX3ZhbCwgdW5zaWduZWQgbG9uZyBuZXdfdmENCj4gICAvKg0KPiAg
ICAqIExpa2UgcG1kX2h1Z2UoKSBhbmQgcG1kX2xhcmdlKCksIGJ1dCB3b3JrcyByZWdhcmRsZXNz
IG9mIGNvbmZpZyBvcHRpb25zDQo+ICAgICovDQo+IC0jZGVmaW5lIHBtZF9pc19sZWFmIHBtZF9p
c19sZWFmDQo+IC0jZGVmaW5lIHBtZF9sZWFmIHBtZF9pc19sZWFmDQo+ICsjZGVmaW5lIHBtZF9s
ZWFmIHBtZF9sZWFmDQo+ICAgI2RlZmluZSBwbWRfbGFyZ2UgcG1kX2xlYWYNCj4gLXN0YXRpYyBp
bmxpbmUgYm9vbCBwbWRfaXNfbGVhZihwbWRfdCBwbWQpDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wg
cG1kX2xlYWYocG1kX3QgcG1kKQ0KPiAgIHsNCj4gICAJcmV0dXJuICEhKHBtZF9yYXcocG1kKSAm
IGNwdV90b19iZTY0KF9QQUdFX1BURSkpOw0KPiAgIH0NCj4gICANCj4gLSNkZWZpbmUgcHVkX2lz
X2xlYWYgcHVkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcHVkX2xlYWYgcHVkX2lzX2xlYWYNCj4gKyNk
ZWZpbmUgcHVkX2xlYWYgcHVkX2xlYWYNCj4gICAjZGVmaW5lIHB1ZF9sYXJnZSBwdWRfbGVhZg0K
PiAtc3RhdGljIGlubGluZSBib29sIHB1ZF9pc19sZWFmKHB1ZF90IHB1ZCkNCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBwdWRfbGVhZihwdWRfdCBwdWQpDQo+ICAgew0KPiAgIAlyZXR1cm4gISEocHVk
X3JhdyhwdWQpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFRFKSk7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggNTkyOGIzYzE0NThkLi5lNmVkZjFjZGJjNWIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtMTgyLDMwICsxODIsNiBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2ZyYWdfc2V0KG1tX2NvbnRleHRfdCAqY3R4LCB2b2lk
ICpwKQ0KPiAgIH0NCj4gICAjZW5kaWYNCj4gICANCj4gLSNpZm5kZWYgcG1kX2lzX2xlYWYNCj4g
LSNkZWZpbmUgcG1kX2lzX2xlYWYgcG1kX2lzX2xlYWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBw
bWRfaXNfbGVhZihwbWRfdCBwbWQpDQo+IC17DQo+IC0JcmV0dXJuIGZhbHNlOw0KPiAtfQ0KPiAt
I2VuZGlmDQo+IC0NCj4gLSNpZm5kZWYgcHVkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcHVkX2lzX2xl
YWYgcHVkX2lzX2xlYWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwdWRfaXNfbGVhZihwdWRfdCBw
dWQpDQo+IC17DQo+IC0JcmV0dXJuIGZhbHNlOw0KPiAtfQ0KPiAtI2VuZGlmDQo+IC0NCj4gLSNp
Zm5kZWYgcDRkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcDRkX2lzX2xlYWYgcDRkX2lzX2xlYWYNCj4g
LXN0YXRpYyBpbmxpbmUgYm9vbCBwNGRfaXNfbGVhZihwNGRfdCBwNGQpDQo+IC17DQo+IC0JcmV0
dXJuIGZhbHNlOw0KPiAtfQ0KPiAtI2VuZGlmDQo+IC0NCj4gICAjZGVmaW5lIHBtZF9wZ3RhYmxl
IHBtZF9wZ3RhYmxlDQo+ICAgc3RhdGljIGlubGluZSBwZ3RhYmxlX3QgcG1kX3BndGFibGUocG1k
X3QgcG1kKQ0KPiAgIHsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0
X21tdV9yYWRpeC5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRfbW11X3JhZGl4LmMNCj4g
aW5kZXggNGExYWJiOWY3YzA1Li40MDhkOThmOGE1MTQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9yYWRpeC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0v
Ym9vazNzXzY0X21tdV9yYWRpeC5jDQo+IEBAIC01MDMsNyArNTAzLDcgQEAgc3RhdGljIHZvaWQg
a3ZtcHBjX3VubWFwX2ZyZWVfcG1kKHN0cnVjdCBrdm0gKmt2bSwgcG1kX3QgKnBtZCwgYm9vbCBm
dWxsLA0KPiAgIAlmb3IgKGltID0gMDsgaW0gPCBQVFJTX1BFUl9QTUQ7ICsraW0sICsrcCkgew0K
PiAgIAkJaWYgKCFwbWRfcHJlc2VudCgqcCkpDQo+ICAgCQkJY29udGludWU7DQo+IC0JCWlmIChw
bWRfaXNfbGVhZigqcCkpIHsNCj4gKwkJaWYgKHBtZF9sZWFmKCpwKSkgew0KPiAgIAkJCWlmIChm
dWxsKSB7DQo+ICAgCQkJCXBtZF9jbGVhcihwKTsNCj4gICAJCQl9IGVsc2Ugew0KPiBAQCAtNTMy
LDcgKzUzMiw3IEBAIHN0YXRpYyB2b2lkIGt2bXBwY191bm1hcF9mcmVlX3B1ZChzdHJ1Y3Qga3Zt
ICprdm0sIHB1ZF90ICpwdWQsDQo+ICAgCWZvciAoaXUgPSAwOyBpdSA8IFBUUlNfUEVSX1BVRDsg
KytpdSwgKytwKSB7DQo+ICAgCQlpZiAoIXB1ZF9wcmVzZW50KCpwKSkNCj4gICAJCQljb250aW51
ZTsNCj4gLQkJaWYgKHB1ZF9pc19sZWFmKCpwKSkgew0KPiArCQlpZiAocHVkX2xlYWYoKnApKSB7
DQo+ICAgCQkJcHVkX2NsZWFyKHApOw0KPiAgIAkJfSBlbHNlIHsNCj4gICAJCQlwbWRfdCAqcG1k
Ow0KPiBAQCAtNjM1LDEyICs2MzUsMTIgQEAgaW50IGt2bXBwY19jcmVhdGVfcHRlKHN0cnVjdCBr
dm0gKmt2bSwgcGdkX3QgKnBndGFibGUsIHB0ZV90IHB0ZSwNCj4gICAJCW5ld19wdWQgPSBwdWRf
YWxsb2Nfb25lKGt2bS0+bW0sIGdwYSk7DQo+ICAgDQo+ICAgCXBtZCA9IE5VTEw7DQo+IC0JaWYg
KHB1ZCAmJiBwdWRfcHJlc2VudCgqcHVkKSAmJiAhcHVkX2lzX2xlYWYoKnB1ZCkpDQo+ICsJaWYg
KHB1ZCAmJiBwdWRfcHJlc2VudCgqcHVkKSAmJiAhcHVkX2xlYWYoKnB1ZCkpDQo+ICAgCQlwbWQg
PSBwbWRfb2Zmc2V0KHB1ZCwgZ3BhKTsNCj4gICAJZWxzZSBpZiAobGV2ZWwgPD0gMSkNCj4gICAJ
CW5ld19wbWQgPSBrdm1wcGNfcG1kX2FsbG9jKCk7DQo+ICAgDQo+IC0JaWYgKGxldmVsID09IDAg
JiYgIShwbWQgJiYgcG1kX3ByZXNlbnQoKnBtZCkgJiYgIXBtZF9pc19sZWFmKCpwbWQpKSkNCj4g
KwlpZiAobGV2ZWwgPT0gMCAmJiAhKHBtZCAmJiBwbWRfcHJlc2VudCgqcG1kKSAmJiAhcG1kX2xl
YWYoKnBtZCkpKQ0KPiAgIAkJbmV3X3B0ZXAgPSBrdm1wcGNfcHRlX2FsbG9jKCk7DQo+ICAgDQo+
ICAgCS8qIENoZWNrIGlmIHdlIG1pZ2h0IGhhdmUgYmVlbiBpbnZhbGlkYXRlZDsgbGV0IHRoZSBn
dWVzdCByZXRyeSBpZiBzbyAqLw0KPiBAQCAtNjU4LDcgKzY1OCw3IEBAIGludCBrdm1wcGNfY3Jl
YXRlX3B0ZShzdHJ1Y3Qga3ZtICprdm0sIHBnZF90ICpwZ3RhYmxlLCBwdGVfdCBwdGUsDQo+ICAg
CQluZXdfcHVkID0gTlVMTDsNCj4gICAJfQ0KPiAgIAlwdWQgPSBwdWRfb2Zmc2V0KHA0ZCwgZ3Bh
KTsNCj4gLQlpZiAocHVkX2lzX2xlYWYoKnB1ZCkpIHsNCj4gKwlpZiAocHVkX2xlYWYoKnB1ZCkp
IHsNCj4gICAJCXVuc2lnbmVkIGxvbmcgaGdwYSA9IGdwYSAmIFBVRF9NQVNLOw0KPiAgIA0KPiAg
IAkJLyogQ2hlY2sgaWYgd2UgcmFjZWQgYW5kIHNvbWVvbmUgZWxzZSBoYXMgc2V0IHRoZSBzYW1l
IHRoaW5nICovDQo+IEBAIC03MDksNyArNzA5LDcgQEAgaW50IGt2bXBwY19jcmVhdGVfcHRlKHN0
cnVjdCBrdm0gKmt2bSwgcGdkX3QgKnBndGFibGUsIHB0ZV90IHB0ZSwNCj4gICAJCW5ld19wbWQg
PSBOVUxMOw0KPiAgIAl9DQo+ICAgCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBncGEpOw0KPiAtCWlm
IChwbWRfaXNfbGVhZigqcG1kKSkgew0KPiArCWlmIChwbWRfbGVhZigqcG1kKSkgew0KPiAgIAkJ
dW5zaWduZWQgbG9uZyBsZ3BhID0gZ3BhICYgUE1EX01BU0s7DQo+ICAgDQo+ICAgCQkvKiBDaGVj
ayBpZiB3ZSByYWNlZCBhbmQgc29tZW9uZSBlbHNlIGhhcyBzZXQgdGhlIHNhbWUgdGhpbmcgKi8N
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMg
Yi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+IGluZGV4IGM2YTRh
Yzc2NmIyYi4uMWY4ZGIxMDY5M2UzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9y
YWRpeF9wZ3RhYmxlLmMNCj4gQEAgLTIwNCwxNCArMjA0LDE0IEBAIHN0YXRpYyB2b2lkIHJhZGl4
X19jaGFuZ2VfbWVtb3J5X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcg
ZW5kLA0KPiAgIAkJcHVkcCA9IHB1ZF9hbGxvYygmaW5pdF9tbSwgcDRkcCwgaWR4KTsNCj4gICAJ
CWlmICghcHVkcCkNCj4gICAJCQljb250aW51ZTsNCj4gLQkJaWYgKHB1ZF9pc19sZWFmKCpwdWRw
KSkgew0KPiArCQlpZiAocHVkX2xlYWYoKnB1ZHApKSB7DQo+ICAgCQkJcHRlcCA9IChwdGVfdCAq
KXB1ZHA7DQo+ICAgCQkJZ290byB1cGRhdGVfdGhlX3B0ZTsNCj4gICAJCX0NCj4gICAJCXBtZHAg
PSBwbWRfYWxsb2MoJmluaXRfbW0sIHB1ZHAsIGlkeCk7DQo+ICAgCQlpZiAoIXBtZHApDQo+ICAg
CQkJY29udGludWU7DQo+IC0JCWlmIChwbWRfaXNfbGVhZigqcG1kcCkpIHsNCj4gKwkJaWYgKHBt
ZF9sZWFmKCpwbWRwKSkgew0KPiAgIAkJCXB0ZXAgPSBwbWRwX3B0ZXAocG1kcCk7DQo+ICAgCQkJ
Z290byB1cGRhdGVfdGhlX3B0ZTsNCj4gICAJCX0NCj4gQEAgLTc2Nyw3ICs3NjcsNyBAQCBzdGF0
aWMgdm9pZCBfX21lbWluaXQgcmVtb3ZlX3BtZF90YWJsZShwbWRfdCAqcG1kX3N0YXJ0LCB1bnNp
Z25lZCBsb25nIGFkZHIsDQo+ICAgCQlpZiAoIXBtZF9wcmVzZW50KCpwbWQpKQ0KPiAgIAkJCWNv
bnRpbnVlOw0KPiAgIA0KPiAtCQlpZiAocG1kX2lzX2xlYWYoKnBtZCkpIHsNCj4gKwkJaWYgKHBt
ZF9sZWFmKCpwbWQpKSB7DQo+ICAgCQkJaWYgKElTX0FMSUdORUQoYWRkciwgUE1EX1NJWkUpICYm
DQo+ICAgCQkJICAgIElTX0FMSUdORUQobmV4dCwgUE1EX1NJWkUpKSB7DQo+ICAgCQkJCWlmICgh
ZGlyZWN0KQ0KPiBAQCAtODA3LDcgKzgwNyw3IEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCByZW1v
dmVfcHVkX3RhYmxlKHB1ZF90ICpwdWRfc3RhcnQsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4gICAJ
CWlmICghcHVkX3ByZXNlbnQoKnB1ZCkpDQo+ICAgCQkJY29udGludWU7DQo+ICAgDQo+IC0JCWlm
IChwdWRfaXNfbGVhZigqcHVkKSkgew0KPiArCQlpZiAocHVkX2xlYWYoKnB1ZCkpIHsNCj4gICAJ
CQlpZiAoIUlTX0FMSUdORUQoYWRkciwgUFVEX1NJWkUpIHx8DQo+ICAgCQkJICAgICFJU19BTElH
TkVEKG5leHQsIFBVRF9TSVpFKSkgew0KPiAgIAkJCQlXQVJOX09OQ0UoMSwgIiVzOiB1bmFsaWdu
ZWQgcmFuZ2VcbiIsIF9fZnVuY19fKTsNCj4gQEAgLTg0NSw3ICs4NDUsNyBAQCByZW1vdmVfcGFn
ZXRhYmxlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBib29sIGRpcmVj
dCwNCj4gICAJCWlmICghcDRkX3ByZXNlbnQoKnA0ZCkpDQo+ICAgCQkJY29udGludWU7DQo+ICAg
DQo+IC0JCWlmIChwNGRfaXNfbGVhZigqcDRkKSkgew0KPiArCQlpZiAocDRkX2xlYWYoKnA0ZCkp
IHsNCj4gICAJCQlpZiAoIUlTX0FMSUdORUQoYWRkciwgUDREX1NJWkUpIHx8DQo+ICAgCQkJICAg
ICFJU19BTElHTkVEKG5leHQsIFA0RF9TSVpFKSkgew0KPiAgIAkJCQlXQVJOX09OQ0UoMSwgIiVz
OiB1bmFsaWduZWQgcmFuZ2VcbiIsIF9fZnVuY19fKTsNCj4gQEAgLTE1NTQsNyArMTU1NCw3IEBA
IGludCBwdWRfc2V0X2h1Z2UocHVkX3QgKnB1ZCwgcGh5c19hZGRyX3QgYWRkciwgcGdwcm90X3Qg
cHJvdCkNCj4gICANCj4gICBpbnQgcHVkX2NsZWFyX2h1Z2UocHVkX3QgKnB1ZCkNCj4gICB7DQo+
IC0JaWYgKHB1ZF9pc19sZWFmKCpwdWQpKSB7DQo+ICsJaWYgKHB1ZF9sZWFmKCpwdWQpKSB7DQo+
ICAgCQlwdWRfY2xlYXIocHVkKTsNCj4gICAJCXJldHVybiAxOw0KPiAgIAl9DQo+IEBAIC0xNjAx
LDcgKzE2MDEsNyBAQCBpbnQgcG1kX3NldF9odWdlKHBtZF90ICpwbWQsIHBoeXNfYWRkcl90IGFk
ZHIsIHBncHJvdF90IHByb3QpDQo+ICAgDQo+ICAgaW50IHBtZF9jbGVhcl9odWdlKHBtZF90ICpw
bWQpDQo+ICAgew0KPiAtCWlmIChwbWRfaXNfbGVhZigqcG1kKSkgew0KPiArCWlmIChwbWRfbGVh
ZigqcG1kKSkgew0KPiAgIAkJcG1kX2NsZWFyKHBtZCk7DQo+ICAgCQlyZXR1cm4gMTsNCj4gICAJ
fQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggNTQ5YTQ0MGVkN2Y2Li45ZTdiYTljMzg1MWYgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL3BndGFibGUuYw0KPiBAQCAtNDEwLDcgKzQxMCw3IEBAIHB0ZV90ICpfX2ZpbmRfbGludXhf
cHRlKHBnZF90ICpwZ2RpciwgdW5zaWduZWQgbG9uZyBlYSwNCj4gICAJaWYgKHA0ZF9ub25lKHA0
ZCkpDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4gICANCj4gLQlpZiAocDRkX2lzX2xlYWYocDRkKSkg
ew0KPiArCWlmIChwNGRfbGVhZihwNGQpKSB7DQo+ICAgCQlyZXRfcHRlID0gKHB0ZV90ICopcDRk
cDsNCj4gICAJCWdvdG8gb3V0Ow0KPiAgIAl9DQo+IEBAIC00MzIsNyArNDMyLDcgQEAgcHRlX3Qg
Kl9fZmluZF9saW51eF9wdGUocGdkX3QgKnBnZGlyLCB1bnNpZ25lZCBsb25nIGVhLA0KPiAgIAlp
ZiAocHVkX25vbmUocHVkKSkNCj4gICAJCXJldHVybiBOVUxMOw0KPiAgIA0KPiAtCWlmIChwdWRf
aXNfbGVhZihwdWQpKSB7DQo+ICsJaWYgKHB1ZF9sZWFmKHB1ZCkpIHsNCj4gICAJCXJldF9wdGUg
PSAocHRlX3QgKilwdWRwOw0KPiAgIAkJZ290byBvdXQ7DQo+ICAgCX0NCj4gQEAgLTQ3MSw3ICs0
NzEsNyBAQCBwdGVfdCAqX19maW5kX2xpbnV4X3B0ZShwZ2RfdCAqcGdkaXIsIHVuc2lnbmVkIGxv
bmcgZWEsDQo+ICAgCQlnb3RvIG91dDsNCj4gICAJfQ0KPiAgIA0KPiAtCWlmIChwbWRfaXNfbGVh
ZihwbWQpKSB7DQo+ICsJaWYgKHBtZF9sZWFmKHBtZCkpIHsNCj4gICAJCXJldF9wdGUgPSAocHRl
X3QgKilwbWRwOw0KPiAgIAkJZ290byBvdXQ7DQo+ICAgCX0NCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9tbS9wZ3RhYmxlXzY0LmMgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV82NC5jDQo+
IGluZGV4IDFiMzY2NTI2ZjRmMi4uMzg2YzZiMDZlYWI3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvbW0vcGd0YWJsZV82NC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzY0
LmMNCj4gQEAgLTEwMCw3ICsxMDAsNyBAQCBFWFBPUlRfU1lNQk9MKF9fcHRlX2ZyYWdfc2l6ZV9z
aGlmdCk7DQo+ICAgLyogNCBsZXZlbCBwYWdlIHRhYmxlICovDQo+ICAgc3RydWN0IHBhZ2UgKnA0
ZF9wYWdlKHA0ZF90IHA0ZCkNCj4gICB7DQo+IC0JaWYgKHA0ZF9pc19sZWFmKHA0ZCkpIHsNCj4g
KwlpZiAocDRkX2xlYWYocDRkKSkgew0KPiAgIAkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZF
X0FSQ0hfSFVHRV9WTUFQKSkNCj4gICAJCQlWTV9XQVJOX09OKCFwNGRfaHVnZShwNGQpKTsNCj4g
ICAJCXJldHVybiBwdGVfcGFnZShwNGRfcHRlKHA0ZCkpOw0KPiBAQCAtMTExLDcgKzExMSw3IEBA
IHN0cnVjdCBwYWdlICpwNGRfcGFnZShwNGRfdCBwNGQpDQo+ICAgDQo+ICAgc3RydWN0IHBhZ2Ug
KnB1ZF9wYWdlKHB1ZF90IHB1ZCkNCj4gICB7DQo+IC0JaWYgKHB1ZF9pc19sZWFmKHB1ZCkpIHsN
Cj4gKwlpZiAocHVkX2xlYWYocHVkKSkgew0KPiAgIAkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19I
QVZFX0FSQ0hfSFVHRV9WTUFQKSkNCj4gICAJCQlWTV9XQVJOX09OKCFwdWRfaHVnZShwdWQpKTsN
Cj4gICAJCXJldHVybiBwdGVfcGFnZShwdWRfcHRlKHB1ZCkpOw0KPiBAQCAtMTI1LDcgKzEyNSw3
IEBAIHN0cnVjdCBwYWdlICpwdWRfcGFnZShwdWRfdCBwdWQpDQo+ICAgICovDQo+ICAgc3RydWN0
IHBhZ2UgKnBtZF9wYWdlKHBtZF90IHBtZCkNCj4gICB7DQo+IC0JaWYgKHBtZF9pc19sZWFmKHBt
ZCkpIHsNCj4gKwlpZiAocG1kX2xlYWYocG1kKSkgew0KPiAgIAkJLyoNCj4gICAJCSAqIHZtYWxs
b2NfdG9fcGFnZSBtYXkgYmUgY2FsbGVkIG9uIGFueSB2bWFwIGFkZHJlc3MgKG5vdCBvbmx5DQo+
ICAgCQkgKiB2bWFsbG9jKSwgYW5kIGl0IHVzZXMgcG1kX3BhZ2UoKSBldGMuLCB3aGVuIGh1Z2Ug
dm1hcCBpcw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jIGIvYXJjaC9w
b3dlcnBjL3htb24veG1vbi5jDQo+IGluZGV4IGIzYjk0Y2QzNzcxMy4uOTY2OWM5OTI1MjI1IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMveG1vbi94bW9uLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL3htb24veG1vbi5jDQo+IEBAIC0zMzQyLDcgKzMzNDIsNyBAQCBzdGF0aWMgdm9pZCBzaG93
X3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICAgCQlyZXR1cm47DQo+ICAgCX0NCj4gICANCj4g
LQlpZiAocDRkX2lzX2xlYWYoKnA0ZHApKSB7DQo+ICsJaWYgKHA0ZF9sZWFmKCpwNGRwKSkgew0K
PiAgIAkJZm9ybWF0X3B0ZShwNGRwLCBwNGRfdmFsKCpwNGRwKSk7DQo+ICAgCQlyZXR1cm47DQo+
ICAgCX0NCj4gQEAgLTMzNTYsNyArMzM1Niw3IEBAIHN0YXRpYyB2b2lkIHNob3dfcHRlKHVuc2ln
bmVkIGxvbmcgYWRkcikNCj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiAgIA0KPiAtCWlmIChwdWRf
aXNfbGVhZigqcHVkcCkpIHsNCj4gKwlpZiAocHVkX2xlYWYoKnB1ZHApKSB7DQo+ICAgCQlmb3Jt
YXRfcHRlKHB1ZHAsIHB1ZF92YWwoKnB1ZHApKTsNCj4gICAJCXJldHVybjsNCj4gICAJfQ0KPiBA
QCAtMzM3MCw3ICszMzcwLDcgQEAgc3RhdGljIHZvaWQgc2hvd19wdGUodW5zaWduZWQgbG9uZyBh
ZGRyKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHBtZF9pc19sZWFmKCpw
bWRwKSkgew0KPiArCWlmIChwbWRfbGVhZigqcG1kcCkpIHsNCj4gICAJCWZvcm1hdF9wdGUocG1k
cCwgcG1kX3ZhbCgqcG1kcCkpOw0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo=
