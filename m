Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8027C83D4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 12:58:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ndkb5SH5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6NlK71Lbz3vXb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 21:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Ndkb5SH5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6NkS59LBz3c5T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 21:57:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4k1DelvgvZ5/ro0m+HJcd/IB4GZhZUmgSLyMbhfQusstDC3UR0fdh+dhyes2DzbphmzPLYK+N2/q+v4EIvrcX4LynceOTyjNFY4g4RmTxW4WjIdwI4n7usfFdZqX5IiWPN6T/8P8LxBejP+grDmgRWNuwVrT9NAhe3ErwNgKlgTb2hJH/ibAy75p++2kpIKPg/FCV2A4rIpyBGfsQVyai50RstWGYMkSbc69u8hWUyWGbBnrcxtW7elhloWa7C4sIAp5IoZN8IfkUUuCYjMqSBdzbA8ypjqvH2q3oLbOptMPX6EjH4gRQiME4G3HOScYwHVARDrghzZJezrjukf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDATx1tIgmWJr2YG08PKQihzkeirOBEViTEIgGf8UrQ=;
 b=N3nILPIMJujjjAjUnd3j5OFX0fmNrjvUgB79scYOd6Ya95MIY62Bas3BtapoILh0L62tbECOPc+oaIXT0Lrh8EArUTNZtFeJHqp70ej/u77uOE4/yXolEbGHpgf1fjrsZofXyw5miraiGl0iJmHPRtLle2/uxZR5O+rLCHI21w79WvEZR+ufWIDe5A7S1Chyzv/KaQvDmGO0pyvR3iFa0kiTWohZg5+PI7kx6WWkqEbBPTx5LCcvdJSQteojfWGMXaT8Lvoch2dRqKnPxzVJcWGr8PIUGUHcZLe/0oaj/cVkifqoyCV6JdQD0iC+vimX3r5udd8Wt1psK/4JtkaJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDATx1tIgmWJr2YG08PKQihzkeirOBEViTEIgGf8UrQ=;
 b=Ndkb5SH5tx4OArTQ4ix1gUp2mvSyCewRZ+rdd1sEKc3IEihKSwWtlYCIQ9M6oSiVR34pw2qtXYiEjZec/wOgXir3wf/61uLhhPi3X/SKsSBiX9bZoUPQ7OBVRdDUSszdsQ32hlhFJ/P2aJjIyHr7T2ixM47HSwRQUXOKUr9RCzyQ8lgyM8ZJRl217hJWz5bGA1Grdm4rlEJ5KG7NoJb4N5vY/UvQHR0pe5AtwOwkvpXbQ+NfBRFz+wLrTshv/XNgRkBTXAaPXdlVr2UfE9fVYKbF5sjwbzWYhXzy7HYff4DwyHg9LLy+5QQvHlNp32lX7C2Zc4cii+TDQEonc4w5eA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3354.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 10:56:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 10:56:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v8 0/7] Support page table check
Thread-Topic: [PATCH v8 0/7] Support page table check
Thread-Index: AQHZQZL2JLGQFhSW0kCUt0v9fKLpqbBJBNAA
Date: Fri, 13 Oct 2023 10:56:58 +0000
Message-ID: <99886903-5afa-8fe6-b9bf-0254e352f63f@csgroup.eu>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
In-Reply-To: <20230215231153.2147454-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3354:EE_
x-ms-office365-filtering-correlation-id: f38327e2-34f2-4da6-5943-08dbcbdb1f4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8WmMwcb2YXRA8EnY+MRoLFXkZG+XYIbuy/r4DNXT8seXpCyAKf2z2GuDpEEUxW9TeKCX8u4CgOpURliI1kSwjJg7CLXBqvRyZVGaGg2jwBhv2tl8UvDnTlfnzGc8Lah5WFuJSuQ7efFQoGxNEqITu2WQsCK7BlVvNIVYdvxGSElrIFU+LRm7ajQap/n86DzhwQMCCghIkskpH+F7Ro5kU2OqbCJi4ED0VqjoXJLNbGhIirlIJaPX3agTYIz+baL3E3PecUIIYUcHYUIZEPbPoGJQb0uJ1V6/Npi4A2jQ67BaXgCzwho/PhDDssWVckn74pehHDKWkgs3LOow+IXKxEN9GceGOTKa7kBufpXOh/Tej38Ex+nzIK2lVLzwV8oGLDxUz/ECj95bAudTlsOdFuc28NlL/KCWgebL2obc4QDFNu3e4vZNI6h0e6hd5h47ghpulV6UamyArOFgybRxTusUrq6Hx41ZWFQ41EQhE3fWl+M4KvYqmJESi+/8lBcKmRgGKqTYuqnzVq8ixm0dLG83Mf3ygTYUG/mXZMlUiQo1vJSnrJaGHOiN92FyMw96Qyy73SuSd9eyCde4VPMNtPJxJTURJ2OhBaHAOETRO/oMpZsvx1GBt9DkSwzzA9/NdfwFmXtFzs40vh9tWU/x07waEmxxZeClrYjITvfvs+o=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(6512007)(71200400001)(6506007)(6486002)(966005)(478600001)(31696002)(36756003)(122000001)(86362001)(38100700002)(38070700005)(2906002)(83380400001)(66574015)(2616005)(26005)(66446008)(91956017)(66946007)(66476007)(5660300002)(76116006)(66556008)(110136005)(64756008)(8676002)(41300700001)(44832011)(8936002)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZXNwYms5NjJLL0ladnZwdWVrc2dZNHZPZGZCMUNOU3VVZVV1TTZPaUp1ZUpK?=
 =?utf-8?B?bnYreWw5WHE2dzBNR1VScm1lZmx0Y0dxVzVPSGlpY2tBVjVRdGlxRXQrVmpv?=
 =?utf-8?B?TWhZQm9SMGZtRUJsaCtzUERzUU5kaWFHbFgxc0FqeldKWXNkTkxLbFlpY0xB?=
 =?utf-8?B?YmsrRkRQQ0pCN05QTHBHanVVcjlHTEYzWWdVRDRMeEN0eUVsK0htbEpJM1Va?=
 =?utf-8?B?clB4L1Axd1NsaDVmNUgwdFIyRTFCdGYwVC84Yi9sRGt4VFVyNGdZcmgrcTVS?=
 =?utf-8?B?OXFWTHFpWnlTTkRybmhrVFhJdnJvb01SMUNrZXRlZTJDd2VaMi84cDBXSTl4?=
 =?utf-8?B?U3Q1a3pXcHVuMW9naWQrZ3FZQitQeHZjQmZBK25tV1RxK2s2bTVFZXZQUTRk?=
 =?utf-8?B?bGZxYVpzeDFzV0NrLzRNMXVuZDhvVGhkWFZjN25MT1pwRmhlN3VSdE9NTElB?=
 =?utf-8?B?RmphREgyQ0dLS2xLV1NFN3VPeFV5a21HVEtqZm1xNnBURmZjcjRvNm1Vdzcx?=
 =?utf-8?B?NEI4YXlCdkxRTVE1R1dUSjJpVkxRNzdOVUh3NUJYbHJoTmdkWkZBRUpWc2JH?=
 =?utf-8?B?cFJ3TUcvRzBYS1h5VWVOa1E0aFVUcTNPQ0pzbnluWHg0QWZJQ2VSOHdRellP?=
 =?utf-8?B?OFhmZDZsQ3dubXdDbGx0Tm9XQWh2NkJsWm9rKzdUWVphWm9jS3hhVWhMU2h4?=
 =?utf-8?B?YzhWRXd0N0RTVUJ0TDFoa1RFd09zWElZNE94YTlmS0NLaUpzSGJaY2IrTE1o?=
 =?utf-8?B?OFo4YXhvMTE1NzJzN0tQc1lmc0p6KzlnRjVWVkZEMTRtSk54MEN6c3JtZGpN?=
 =?utf-8?B?aWdmT3ZGN0pIcnZiMDZRWE1HdmdwcVI4dFl0K054aVRuRDhROHZDV01FMmhj?=
 =?utf-8?B?d0Zwemk5ZVdLOWMwWEFYSmtvZkg0dW41RWVMSWdaUWdJK3hqQnZaM0NiOGx0?=
 =?utf-8?B?TzNpcEtVSlhaNFJUN1Rma3FiN2F6R3NqbXVtV0pkZDBocnVMWlFyZFpicHJD?=
 =?utf-8?B?TDRiYWJoVTFBWnJXdEt6M09rb2hpMUZRbkk2ZFJsd3oxdTZLazhJQmlRYVBN?=
 =?utf-8?B?bkpDUkZOSzVzbTk1a1ordkFDcFppZ3B4MnlKalpNNCszNjJYZW9uSTlidlRP?=
 =?utf-8?B?dFlXZFJPM1NtQTNGR24xR3AreW12LzJJaEY3MEs5NTVhSHlCVTZYR2pjeXlu?=
 =?utf-8?B?YzBudm5hYXBrdmNCYUpKdjNZUS80TzFIbTVwYXlnek16K2ZlVU1UeEI3VGRE?=
 =?utf-8?B?UlhJZjFrY3YzREYrdUdWRHJTOERwdVZJcWszNzNqaDAxQlJJSHB2MkdUTXd2?=
 =?utf-8?B?ZGRzZUp5VzNJWk94RDRBaUkzQzc5SGpLNDNHazJCM1pTdFpjYUtiRUplV3By?=
 =?utf-8?B?K0hOYXJNTnZMWEN2aXFJRk5STmFJVFI4VjlPVUtXT1hnc3hjTmJtQ3dDTDRs?=
 =?utf-8?B?cHVvdVA2NHpBVlM5YzBzUGhNT3dHalV6enEycWJ2Szh5UjVBb2c1TEVXMjJD?=
 =?utf-8?B?dUpQMlZyajJXbXRNV3ZuaTdWd0hLYnpkUExnLzMxdmdGZUR4T2N2dnFOYWVx?=
 =?utf-8?B?d0hhOWF6RGhZWUhxRkVMRmNjakMrVWZldTNZNWd6dFZnNkFGcGROcHVsYkt0?=
 =?utf-8?B?V3c0eHF5MXNDMWQ4WjdKZkZQUnpuVmFxcWZ2SUkxVTdJM3VVeU0vazI4cVVl?=
 =?utf-8?B?RDhjenVCeVIxaUNpVUFmbVZXTDJBVDQvMi9lMS9HNktEeHhXbWwvRXZYalZq?=
 =?utf-8?B?YnZCZDd4Nm8wTklLUWhsOHVkbjdUR040NDJPQnJGaGg1QSsrVklKS3o5bk4r?=
 =?utf-8?B?RE5LM21yODVNWVkzank4NmltRlFjZUczdGd4eUZ5blVVaVlTL0ZvRWNNNlVq?=
 =?utf-8?B?aFhxdmRGYzZxV2dNYTVNWm4yMmw1RW9EbzF5RVRpVUlWdUdSTUR6Qkg1RVYw?=
 =?utf-8?B?WEJuSHFUaXVGN2pGK3NlSDJrcVNJRDFYdXBoeEhBMXA5Y2tHYkQwQTVjSDZp?=
 =?utf-8?B?YTJoWEdRY0dSck1YT2RMUlNFeTIzVElCSVVOQVFOSEtiaTFlR2hvMHMwV25V?=
 =?utf-8?B?Smd2bkdoNm81UGhZSWhFdGRzSjhuSFRadW1KRjRXWktoS1pmVkRDMzR1dnpS?=
 =?utf-8?Q?hgj7y2ZHUR6VrxD1jSIiqfCAn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84975A38230C294EB02D029AC189E46C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f38327e2-34f2-4da6-5943-08dbcbdb1f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 10:56:58.6167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVWNz9js5UQyl+aAJA9midwP8BQu/tLWRvQzLTB874ywFlo1JUFiO5GYw8F5KHOgJbnugF/Z/N/B/ItTeonlR3cEWtdoeWgLedgVTNTbvAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3354
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

DQoNCkxlIDE2LzAyLzIwMjMgw6AgMDA6MTEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
dXBwb3J0IHRoZSBwYWdlIHRhYmxlIGNoZWNrIHNhbml0aXNlciBvbiBhbGwgUG93ZXJQQyBwbGF0
Zm9ybXMuIFRoaXMNCj4gc2FuaXRpc2VyIHdvcmtzIGJ5IHNlcmlhbGlzaW5nIGFzc2lnbm1lbnRz
LCByZWFzc2lnbm1lbnRzIGFuZCBjbGVhcnMgb2YNCj4gcGFnZSB0YWJsZSBlbnRyaWVzIGF0IGVh
Y2ggbGV2ZWwgaW4gb3JkZXIgdG8gZW5zdXJlIHRoYXQgYW5vbnltb3VzDQo+IG1hcHBpbmdzIGhh
dmUgYXQgbW9zdCBvbmUgd3JpdGFibGUgY29uc3VtZXIsIGFuZCBsaWtld2lzZSB0aGF0DQo+IGZp
bGUtYmFja2VkIG1hcHBpbmdzIGFyZSBub3Qgc2ltdWx0YW5lb3VzbHkgYWxzbyBhbm9ueW1vdXMg
bWFwcGluZ3MuDQo+IA0KPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoaXMgaW5mcmFzdHJ1Y3R1cmUs
IGEgbnVtYmVyIG9mIHN0dWJzIG11c3QgYmUNCj4gZGVmaW5lZCBmb3IgYWxsIHBvd2VycGMgcGxh
dGZvcm1zLiBBZGRpdGlvbmFsbHksIHNlcGVyYXRlIHNldF9wdGVfYXQNCj4gYW5kIHNldF9wdGUs
IHRvIGFsbG93IGZvciBpbnRlcm5hbCwgdW5pbnN0cnVtZW50ZWQgbWFwcGluZ3MuDQoNClRoaXMg
c2VyaWVzIGRvZXNuJ3QgYXBwbHksIGNhbiB5b3UgcmViYXNlIGlmIHN0aWxsIGFwcGxpY2FibGUg
Pw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiANCj4gdjg6DQo+ICAgKiBGaXggbGludXgvcGFn
ZV90YWJsZV9jaGVjay5oIGluY2x1ZGUgaW4gYXNtL3BndGFibGUuaCBicmVha2luZw0KPiAgICAg
MzItYml0Lg0KPiANCj4gdjc6DQo+ICAgKiBSZW1vdmUgdXNlIG9mIGV4dGVybiBpbiBzZXRfcHRl
IHByb3RvdHlwZXMNCj4gICAqIENsZWFuIHVwIHBtZHBfY29sbGFwc2VfZmx1c2ggbWFjcm8NCj4g
ICAqIFJlcGxhY2Ugc2V0X3B0ZV9hdCB3aXRoIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24NCj4gICAq
IEZpeCBjb21taXQgbWVzc2FnZSBmb3IgcGF0Y2ggNw0KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMzAyMTUwMjAxNTUuMTk2OTE5NC0xLXJtY2x1cmVAbGlu
dXguaWJtLmNvbS8NCj4gDQo+IHY2Og0KPiAgICogU3VwcG9ydCBodWdlIHBhZ2VzIGFuZCBwe20s
dX1kIGFjY291bnRpbmcuDQo+ICAgKiBSZW1vdmUgaW5zdHJ1bWVudGF0aW9uIGZyb20gc2V0X3B0
ZSBmcm9tIGtlcm5lbCBpbnRlcm5hbCBwYWdlcy4NCj4gICAqIDY0czogSW1wbGVtZW50IHBtZHBf
Y29sbGFwc2VfZmx1c2ggaW4gdGVybXMgb2YgX19wbWRwX2NvbGxhcHNlX2ZsdXNoDQo+ICAgICBh
cyBhY2Nlc3MgdG8gdGhlIG1tX3N0cnVjdCAqIGlzIHJlcXVpcmVkLg0KPiBMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMzAyMTQwMTU5MzkuMTg1MzQzOC0xLXJt
Y2x1cmVAbGludXguaWJtLmNvbS8NCj4gDQo+IHY1Og0KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eHBwYy1kZXYvMjAyMjExMTgwMDIxNDYuMjU5NzktMS1ybWNsdXJlQGxpbnV4
LmlibS5jb20vDQo+IA0KPiBSb2hhbiBNY0x1cmUgKDcpOg0KPiAgICBwb3dlcnBjOiBtbTogU2Vw
YXJhdGUgc2V0X3B0ZSwgc2V0X3B0ZV9hdCBmb3IgaW50ZXJuYWwsIGV4dGVybmFsIHVzZQ0KPiAg
ICBwb3dlcnBjLzY0czogbW06IEludHJvZHVjZSBfX3BtZHBfY29sbGFwc2VfZmx1c2ggd2l0aCBt
bV9zdHJ1Y3QNCj4gICAgICBhcmd1bWVudA0KPiAgICBwb3dlcnBjOiBtbTogUmVwbGFjZSBwe3Us
bSw0fWRfaXNfbGVhZiB3aXRoIHB7dSxtLDR9X2xlYWYNCj4gICAgcG93ZXJwYzogbW06IEltcGxl
bWVudCBwe20sdSw0fWRfbGVhZiBvbiBhbGwgcGxhdGZvcm1zDQo+ICAgIHBvd2VycGM6IG1tOiBB
ZGQgY29tbW9uIHB1ZF9wZm4gc3R1YiBmb3IgYWxsIHBsYXRmb3Jtcw0KPiAgICBwb3dlcnBjOiBt
bTogQWRkIHB7dGUsbWQsdWR9X3VzZXJfYWNjZXNzaWJsZV9wYWdlIGhlbHBlcnMNCj4gICAgcG93
ZXJwYzogbW06IFN1cHBvcnQgcGFnZSB0YWJsZSBjaGVjaw0KPiANCj4gICBhcmNoL3Bvd2VycGMv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCB8IDE3ICsrKy0NCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCB8IDg1ICsrKysrKysrKysrKystLS0t
LS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy9wZ3RhYmxlLmggICAgfCAg
MyArLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIHwg
MTIgKystDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgg
fCAyNCArKysrKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3BndGFibGUu
aCAgICB8ICA5ICsrLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAg
ICAgICAgIHwgNjAgKysrKysrKysrLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182
NF9tbXVfcmFkaXguYyAgICAgICB8IDEyICstLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9oYXNoX3BndGFibGUuYyAgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNz
NjQvcGd0YWJsZS5jICAgICAgICAgICB8IDE2ICsrLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcmFkaXhfcGd0YWJsZS5jICAgICB8IDI0ICsrKy0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9t
bS9ub2hhc2gvYm9vazNlX3BndGFibGUuYyAgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMv
bW0vcGd0YWJsZS5jICAgICAgICAgICAgICAgICAgICB8ICA5ICstLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlXzMyLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2Vy
cGMvbW0vcGd0YWJsZV82NC5jICAgICAgICAgICAgICAgICB8ICA2ICstDQo+ICAgYXJjaC9wb3dl
cnBjL3htb24veG1vbi5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KPiAgIDE3IGZpbGVz
IGNoYW5nZWQsIDE5NyBpbnNlcnRpb25zKCspLCA5MyBkZWxldGlvbnMoLSkNCj4gDQo=
