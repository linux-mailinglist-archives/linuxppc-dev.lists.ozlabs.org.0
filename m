Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A971E4FA6BE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 12:17:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kb9yp4Rjbz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 20:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60b;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kb9yH1pkrz2y7K
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 20:16:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbT06JER+3N4NyQO9QFBfNlHGwIb1o+ZcL/Kcs9iiJYIh0shbWlQo5LpXTq+kAePNbpJ4G2GxCCezJ2GuxmEymJHgl02lZqV5tz2TQEwuphnHWHM8NbVuB6fu38CdZFXGwVnHAyZJ/kinM4JtdvgWdhudgRyp4LwtNO673PP6FNhVQ/X7dNCxBMt4BS1hv0DibsNDe3OT5hrhPTtZBBIoq7YjwzKUmzY5ODsTOp8zPz/phasyfjWyjqjDGWruT/f/cgoiCuuc0xwyiTCGu4zKofxn3htoOtWCK5rUmKFNSaKXam4yhFrnwaeC+FwVf2WBRdGzQWqqY0DkKY33GIsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMLL3mWgN70FGUS14pW5l7y3MNFm7YDk/jY2BPNS0xs=;
 b=UNsD6zq9zQH4RrKmBWky1pcbiH2R5C3w6f8cZhWO/LGcL/YWqGnKNXjNlfBKjDywmo/PrPVHo4u11yzpKcNBSIlO3LAo1aP7+6220ldNJL5nt9JqCu5L5q/VpnS3nJOPGcGRqcnVcJwcNObJymaa3A4NkDuKPsPGkksIedqc0kuwy/znLJGmgqx8RrcgPry9ZTN7o74BxhUTv51KQas6bxkx7UjTjeqX4pNExpc2uffwZtPgY7wjzkBsU80480ujL3NxCkyx9aoCRtGEGnl4jhw1kBcMvRR0YGvvrfdl+HHw0Z9mmQetsMCy9n7zbnUOjpb0SfjOKjIj3F9b/Dn21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3512.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.27; Sat, 9 Apr
 2022 10:16:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.027; Sat, 9 Apr 2022
 10:16:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v9 0/4] mm: Enable conversion of powerpc to default
 topdown mmap layout
Thread-Topic: [PATCH v9 0/4] mm: Enable conversion of powerpc to default
 topdown mmap layout
Thread-Index: AQHYSxnRc2ENeDhPakaqyRr1Al6EHazm7KkAgABy0AA=
Date: Sat, 9 Apr 2022 10:16:13 +0000
Message-ID: <8f1f194f-6b54-a382-b46e-5221cb82c80f@csgroup.eu>
References: <cover.1649401201.git.christophe.leroy@csgroup.eu>
 <20220408202516.254e22a8293a57324650bd3f@linux-foundation.org>
In-Reply-To: <20220408202516.254e22a8293a57324650bd3f@linux-foundation.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c14704b-0f53-4aae-8f34-08da1a11fa08
x-ms-traffictypediagnostic: PR1P264MB3512:EE_
x-microsoft-antispam-prvs: <PR1P264MB3512B41AAE540C3B41F08E15EDE89@PR1P264MB3512.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufW4F0LN5qmvbf6i8W9kkiwAn+eTQKUjR3RYssPufSkDSIKd4mqRwDH5M+nLTUM/qmAGJav61V29wINgB+t9lN/61U7hbJwc38CuQnyt3/iED4XNrU5wBbfz9PZejGR0iZKEZ4U8p/7zsZV8bIlBzbKXLMitH3EApvvfvbK9fscJVgj1HzjKUchmOQEpfNYo/xPi0o2BbpRa6cxsbOodLvX3elRTBdwzc5w5DiuwEmf5mb0mk0vDvmySJiAlGudaHeelSM0Y1XlcMG8He5D4eREMPpJNzla/8sv7lKkpmmx/YhaikallbG3+5Fk6uImfgwKPVyKCXZi1xjM2ZAjpesLP7QKu/R4vaAXdb8o1z+ZBvIQVNWhtfuxWQXgxJxzDhqxXkp0HQbA0pctkxwue1xySk6IlVp5Bg7P6cRFSaHAa9u4yN9/HwEjlzlS+sR3ep6eXri/bUYj5CDDvT8324mY5IdF55pTDANuxXDIE6rnE7KtikuhOU6AzNFchHp2MsbMbef3CmOtS+e54EwKAuXrt0xmXHPAvbSAVqri0uW4dw1t7SIMFkQ4wbwhVRQ/0FqdwT6W3sAaHyoKt1UEQHAelxGoEkInjdtSpKzRTLq7PcyQsf8WiZi2jtKPQWNX0hSvhlbNQzAfZ8AmGusTUYSYO0aDmdamjuBuLrZ+NeSw7P6q8KCN+Zc62M/I3psLMe6G7jvGvEdVc/Yuzh72qJngApkGbjoKr/LTJl4c8qY3EBvOimkHNUlweqW29oMiksJXmWqxNJIJbRZpsvr9TLwFBkcqfUJpS2zZiWKiiWIq4uVb0vEWhV+XN4DjbV2AWBC4ypWKdh5w/qeLYbH76EG1DGl+B5axGyU2BcTj10Alv/TQXppdywRkPz9/Tl61Lwf3cv83hAJZH99pub/nepw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(83380400001)(38070700005)(36756003)(26005)(186003)(66446008)(31686004)(64756008)(76116006)(66946007)(66476007)(6512007)(316002)(4326008)(6506007)(66556008)(38100700002)(5660300002)(66574015)(86362001)(44832011)(2616005)(8936002)(8676002)(966005)(31696002)(6916009)(2906002)(54906003)(122000001)(508600001)(71200400001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Unh3bzFxNi8vOEZ6Ykt6dHh4TlBVcm5BQytyUkJBbHA5elVsZWprUnNBeDJU?=
 =?utf-8?B?R1lsQ3FpYTBVYjZBU1RQdDhlMEZObVNaaE44cWFmd3VqYzNlZkpZaFdBWTV2?=
 =?utf-8?B?Q1RNSkh0azN5RVlnTmpvT0VsdVhmS3FiM0YvNDlUSFdzTlBiKzRDTWEzcDVv?=
 =?utf-8?B?NFU4ditmRU0wVW9QdlJGL1NtanlkRURqRVkvb0owaE9xWW9pOHFuU2N2WDRG?=
 =?utf-8?B?QmlORnhyNlVaYi9ZbjYzSm1wcUFuUXlQdlBRTXpYUC80aTZRU0VValdrVUpv?=
 =?utf-8?B?NjFRdWQ3NFJkRjJONjluNHdTZktiVnNINEZrMHduMzROUi9FQU9LNHRPNjBO?=
 =?utf-8?B?WVplUXdlb3B2c3dBU3FSVU41d0lLWE9nWDFSSlN2aG1kTkl2YUQ3OXJXQTFi?=
 =?utf-8?B?WWVjcTNHaXpNWHJUT3BGR2hqMG5FZUo2WjRUdmVUSkdWa3RGN3Avc3NjNDNZ?=
 =?utf-8?B?TU93SDhDRW1adWVWMEh0RWJySkJZczd2RWVPb045cnRNQnZ5eFJsWEVYcldR?=
 =?utf-8?B?Qzl4WUZ6Q3J0YVNnbnNGeFh0YWVzajAyM01tZG9NeHg1NHptd0NSTW05T05V?=
 =?utf-8?B?aFJLN1JRYkJydjVHMnRLNXIzQ1JsK0k1UE1oUnE5aTB6RFQ2SUdXOFloQ0hQ?=
 =?utf-8?B?eC9qa0ZHR0JVWTN3YTg5RXRCWEhNcnJ5bTRLZzJhbFQzNklJTjhVcndUSTZr?=
 =?utf-8?B?U3VtVHZnK25pbE9ZeDREZVhtNndFWXdtb0JJS3Rsek9zQUF1U3hzTkhlcmpH?=
 =?utf-8?B?akVDWHlmRDlXS3E2VzZLbkJTTWdNcnd2ZnZvN1FLNklzTFZTQzh4UkxzWFR2?=
 =?utf-8?B?WmdBYVhJRTBOdUlOa3dLbmI5QVVpbGVJbVBmUzR0OTdUdFF2OU90TUxrNlJQ?=
 =?utf-8?B?Sm9zRUhGNXQ0aWdhemFBOE9FS2RERVNtQk5mMmoyL1FUNFJicjJFd3lRQnVr?=
 =?utf-8?B?ODUyUm80RFJUbjhoa3ZKdG4yU2VxeHJOZWJaeDA3U1hVNGpCVWwyVThyc2Y4?=
 =?utf-8?B?akxNYnlGSUV3a1pYRVdESm91M0x0TVRrMGk1MXNqdVpQMkdnSERkRjlOSTE5?=
 =?utf-8?B?YWpGcDgweHo1ejFCMFVSZncvbmN1ekxCRGtMWnpnY2hDMzJzTUVVczVsRm9K?=
 =?utf-8?B?dDErMks3alZmRTh0b3lvV1lPN0liOFppa2lmaWMrYWQ3ajUxOEZlTXducXhF?=
 =?utf-8?B?L3piUnBnRFFPTlhHZTBRRE1FcXNzMW00aDl2TDBLT2lPWmwybFRQKzBRUDQz?=
 =?utf-8?B?OTdzSWVHekduek5IN1pSZlJUU1BtcUh3TlpQK3VodXpKSTF2MGUwVlNrNGlZ?=
 =?utf-8?B?TU40WXlaOFh1M0NRamd0aWJweFRSQkNvV2oxSytZalNqSmdlRnMxcFJzVmRq?=
 =?utf-8?B?bzFodzdncFlvdkR0c3hTSDc3ODdBRDJMcWRRdGV6bUl5V0dUQWN3Tm10VUN3?=
 =?utf-8?B?aWJzRER6aURVT2VnQzhTcXQ1cVZvVnNJTFZjTzBod3UxQTdHSE1ta2tIdXJy?=
 =?utf-8?B?TXRWT3B2SWQ1QXh1T2FIZTd5cHp0ZjhkN3pBN0dBMm4zczU2VCs3VjVQY3ho?=
 =?utf-8?B?bXcxNWJqVVYwM3gvRm02NURyanljQzJLVUFSNDI4N1RDaTRPa3BUTitvN2tO?=
 =?utf-8?B?YW9jVXNNNEt4YmFwcHRPcjk4YzNrbTNCYWdJS0RBMnVCOTkyRC9hOUpIMEVN?=
 =?utf-8?B?UHUwb0Fyd0RILzZhRTl5QTFaSEF5THNuZFZFM2picWFWVkM2cERMdEc0TkxL?=
 =?utf-8?B?MUZBMjNaZDdoNTRlU2xkTklUQTZWNFVHN1AwbmdUMSt0VGdFL1hta0s3ZkFk?=
 =?utf-8?B?K3JNUVJja3NWQlgvaVNvYkErcDdnWmIwdU9xTWhKdUZBcDJJbFZha2x3TXQ0?=
 =?utf-8?B?bHl5U3lWNTN6QWVqcDdMSzR6MUFWdm1TdTdSUk05RHBlRDNkVndKL3RtQ0ta?=
 =?utf-8?B?U0tkbGRNdU1lazRkWHdXVGEvOE5hY29iSzUvTnJtV0pQcEhvckhheVlIVXE0?=
 =?utf-8?B?NEJLb3I4bWVPT0tPL0g0OUtwd1BmVXNNMzNsZTlxNWNaYlh5MUhzS1ljNkNX?=
 =?utf-8?B?MXlMaHVmQU9XUWNETjYzNmhBWGdkUDlIS1BLNHJhWWtLeFpseks2RXQ5T0dE?=
 =?utf-8?B?Ti9uT1NPNEdHUDlTOFUxc1hnYXhwWjR1WVRNOHh2Uk4xS0pldXUwSzlmWjNE?=
 =?utf-8?B?V0Z3ZGR1Ynp6QUZGV081VzRLdlo0RERaVjlzSk1laVVxVlA1NHE5U21jLzlw?=
 =?utf-8?B?R0tSM3FVYmorQ09XZkFCUElpRnNxZGhlMVVZQWtoYitZSFhYVlZyQW80cFZa?=
 =?utf-8?B?M2Noam1MVkdTVUZ3b3RMWTZFQVF4cVA5WGcrWFVBalhJcEcwa24zcnpYZWFS?=
 =?utf-8?Q?AsKBTNj/O0rXCX2xRyPSSVGXxiBRjQHR23fmB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50D17E17531AAC48BFB477E9B3899B8C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c14704b-0f53-4aae-8f34-08da1a11fa08
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2022 10:16:13.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEtfcFhbv12gMyv4SwWoU6J2nxcYFy8hT57aFqxOULtIijDxkaG737VpyBpO+nzu2GpmTNnuwGbYexmPRoWci18n+MzBa34hkF8slww0b/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3512
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA0LzIwMjIgw6AgMDU6MjUsIEFuZHJldyBNb3J0b24gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCAgOCBBcHIgMjAyMiAwOToyNDo1OCArMDIwMCBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+IFJlYmFzZWQgb24gdG9wIG9m
IExpbnV4IDUuMTgtcmMxDQo+Pg0KPj4gVGhpcyBpcyB0aGUgbW0gcGFydCBvZiB0aGUgc2VyaWVz
IHRoYXQgY29udmVydHMgcG93ZXJwYyB0byBkZWZhdWx0DQo+PiB0b3Bkb3duIG1tYXAgbGF5b3V0
LCBmb3IgbWVyZ2UgaW50byB2NS4xOA0KPiANCj4gV2UncmUgYXQgNS4xOC1yYzEuICBUaGUgNS4x
OCBtZXJnZSB3aW5kb3cgaGFzIGNsb3NlZCBhbmQgd2UncmUgaW4NCj4gZml4ZXMtb25seSBtb2Rl
Lg0KDQpVbW0gLi4uIFRoZXJlIG11c3QgaGF2ZSBiZWVuIGEgbWlzdW5kZXJzdGFuZGluZyB0aGVu
Lg0KDQpJIGNvbnRhY3RlZCB5b3UgYmVmb3JlIHRoZSBtZXJnZSB3aW5kb3csIGFuZCB5b3VyIGFu
c3dlciB3YXM6DQoNCkxlIDExLzAzLzIwMjIgw6AgMDU6NDksIEFuZHJldyBNb3J0b24gYSDDqWNy
aXQgOg0KPg0KPiA1LjE4IGlzbid0IGEgcHJvYmxlbS4gIFBlcmhhcHMgeW91IG1lYW50IDUuMTcs
IHdoaWNoIHdvdWxkIGJlIHJlYWwgdG91Z2guDQo+DQo+IENhbiB3ZSB0YWtlIGEgbG9vayBhZnRl
ciA1LjE4LXJjMT8NCg0KDQo+IA0KPiBJZiB0aGVyZSdzIGEgY2FzZSB0byBiZSBtYWRlIHRoYXQg
dGhlc2UgcGF0Y2hlcyBhcmUgbmVlZGVkIGJ5IDUuMTgNCj4gdXNlcnMgdGhlbiBwbGVhc2UgbGV0
J3MgbWFrZSB0aGF0IGNhc2UuICBPdGhlcndpc2UsIHRoaXMgaXMgNS4xOS1yYzEgbWF0ZXJpYWwu
DQoNCkl0J3Mgbm90IHJlYWxseSBuZWVkZWQgZm9yIDUuMTguIFRoZSBpZGVhIHdhcyB0byBtZXJn
ZSB0aGF0IGNvbW1vbiBwYXJ0IA0KaW4gNS4xOCBpbiBvcmRlciB0byBtaW5pbWlzZSByaXNrcyBv
biBjb25mbGljdHMuIEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgDQppdCBvZnRlbiBoYXBwZW5zIHRo
YXQgY2hhbmdlcyBvZiB0aGF0IGtpbmQgZ2V0IG1lcmdlZCBhdCB0aGUgdmVyeSBlbmQgb2YgDQp0
aGUgbWVyZ2Ugd2luZG93IG9yIGJldHdlZW4gcmMxIGFuZCByYzIuIEkgd2FzIHRoZXJlZm9yZSBu
b3Qgc3VycHJpc2VkIA0KdGhhdCB5b3Ugb2ZmZXJlZCB0byBoYW5kbGUgaXQgcGFzdCByYzEuDQoN
Ckhpc3RvcnkgYXQ6DQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhw
cGMtZGV2L2NvdmVyL2NvdmVyLjE2NDY4NDc1NjEuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldS8jMjg1NjA4MA0KDQoNCj4gDQo+IEFuZCBpZiBpdCBpcyBpbmRlZWQgYWxsIDUuMTktcmMx
IG1hdGVyaWFsLCB0aGVuIHBsZWFzZSBjYXJyeSBhbGwgZm91cg0KPiBpbiB0aGUgcG93ZXJwYyB0
cmVlIHdpdGggQWNrZWQtYnk6IEFuZHJldyBNb3J0b24NCj4gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Lg0KDQpXZWxsLCBNaWNoYWVsIHdhcyBhIGJpdCB1bmNvbmZvcnRhYmxlIHdpdGggZG9p
bmcgaXQgdGhhdCB3YXksIHNlZSBiZWxvdzoNCg0KDQpMZSAxMS8wMy8yMDIyIMOgIDA1OjI2LCBN
aWNoYWVsIEVsbGVybWFuIGEgw6ljcml0IDoNCiA+DQogPiBZZWFoIEkgZGlkbid0IHBpY2sgaXQg
dXAgYmVjYXVzZSB0aGUgbW0gY2hhbmdlcyBkb24ndCBoYXZlIG1hbnkgYWNrcyBhbmQNCiA+IEkn
bSBhbHdheXMgbmVydm91cyBhYm91dCBjYXJyeWluZyBnZW5lcmljIG1tIGNoYW5nZXMuDQogPg0K
ID4gSXQgd291bGQgYmUgbXkgcHJlZmVyZW5jZSBpZiBBbmRyZXcgY291bGQgdGFrZSAyLTUgdGhy
b3VnaCBtbSBmb3IgdjUuMTgsDQogPiBidXQgaXQgaXMgcXVpdGUgbGF0ZSwgc28gSSdtIG5vdCBz
dXJlIGhvdyBoZSB3aWxsIGZlZWwgYWJvdXQgdGhhdC4NCiA+DQogPiBBcmd1YWJseSAyLCAzLCA0
IGRvIHZlcnkgbGl0dGxlLiBJdCdzIG9ubHkgcGF0Y2ggNSB0aGF0IGhhcyBtdWNoIGVmZmVjdCwN
CiA+IGFuZCBpdCBoYXMgYSByZXZpZXdlZC1ieSBmcm9tIENhdGFsaW4gYXQgbGVhc3QuDQoNCk1p
Y2hhZWwsIGlzIGl0IG5vdyBvayBmb3IgeW91IHRvIG1lcmdlIGl0IHZpYSBwb3dlcnBjIHRyZWUg
d2l0aCBBbmRyZXcncyANCkFjayA/DQoNCj4gDQo+IEFsc28sIFs0LzRdIGhhcyBhIGNjOnN0YWJs
ZS4gIFRoaXMgaXMgYSBiaXQgb2RkIGJlY2F1c2UgLXN0YWJsZQ0KPiBjYW5kaWRhdGVzIHNob3Vs
ZCBiZSBzdGFuZGFsb25lIHBhdGNoZXMsIHN0YWdlZCBhaGVhZCBvZiBhbGwNCj4gZm9yLW5leHQt
bWVyZ2Utd2luZG93IG1hdGVyaWFsLCBzbyB3ZSBjYW4gZ2V0IHRoZW0gbWVyZ2VkIHVwIHF1aWNr
bHkuDQo+IA0KPiBNb3JlIG9kZGx5LCBbNC80XSdzIGNoYW5nZWxvZyBwcm92aWRlcyBubyBleHBs
YW5hdGlvbiBmb3Igd2h5IHRoZSBwYXRjaA0KPiBzaG91bGQgYmUgY29uc2lkZXJlZCBmb3IgYmFj
a3BvcnRpbmcuDQo+IA0KDQpUaGF0IHdhcyBhIHJlcXVlc3QgZnJvbSBDYXRhbGluIGZyb20gQVJN
NjQ6DQoNCkxlIDA0LzAxLzIwMjIgw6AgMTc6MjEsIENhdGFsaW4gTWFyaW5hcyBhIMOpY3JpdCA6
DQogPiBJIHdvbmRlciB3aGV0aGVyIHdlIHNob3VsZCBhZGQgYSBmaXhlcyB0YWcgKG9yIGF0IGxl
YXN0IHRoZSBjYyBzdGFibGUpOg0KID4NCiA+IEZpeGVzOiBmNjc5NTA1M2RhYzggKCJtbTogbW1h
cDogQWxsb3cgZm9yICJoaWdoIiB1c2Vyc3BhY2UgYWRkcmVzc2VzIikNCiA+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyA1LjAueA0KID4NCiA+IEkgdGhpbmsgdGhlIG9yaWdpbmFsIGNv
bW1pdCBzaG91bGQgaGF2ZSBjaGFuZ2VkDQogPiBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhKCkg
dG8gaGF2ZSB0aGUgc2FtZSBiZWhhdmlvdXIgYXMNCiA+IGFyY2hfZ2V0X3VubWFwcGVkX2FyZWEo
KS4gU3RldmUsIGFueSB0aG91Z2h0cz8NCiA+DQogPiBGV0lXLA0KID4NCiA+IFJldmlld2VkLWJ5
OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPg0KDQogRnJvbSANCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvZGIy
MzhjMWNhMmQ0NmUzM2M1NzMyOGY4ZDQ1MGYyNTYzZTkyZjhjMi4xNjM5NzM2NDQ5LmdpdC5jaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUvDQoNCkkgY2FuIHRyeSBhbmQgc2VlIHdoZXRoZXIgdGhp
cyBjYW4gYmUgbW92ZWQgaW4gZnJvbnQgb2YgdGhlIG90aGVyIHBhdGNoZXMuDQoNClRoYW5rcw0K
Q2hyaXN0b3BoZQ==
