Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B4C68B720
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 09:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9Jtm6kxPz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 19:13:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b0ajVXo/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe02::62a; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b0ajVXo/;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Jsd6Fcbz3cJq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 19:12:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgB3rF1HGTZ3ShKi7R9JXo+H+m9xXwxhXWYAdeKdh/IDLdZqB1kHt/Nx4kvhKeNiVMGSBVY/AxKY0AsWivI7Ii+pQYhpP5dmUpgQqAxh8brFcqJqj916c/moynpHQRLF8cgvwIE6ocvFzyftB0CWQtgOeB6v0Z9qGxoyc8J71hqMl5XoBEVBBKNNXt8eZhNj1K7CujgQbtxwe6l9/f5mHiKG7IawniznzUVGqNiZstGe0uYv04C0eKcP/R/k1eH5vlnEvF2dwnCoWf0NlC1uLY79Gn6swZnch0Zj/s3VOXUcgInbQrSU4+U6ciK6HKFhF585bb6yxlqvCCMZtOMGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INlfurNXHzXPTbXFZ0UYcAZYRWEdJnLomYprSyprtt8=;
 b=hNdBXG4LZdZlGPwaisEMTrhO8ja00/6G2TXjwn8VpznQy+PToKI4BcNNlB7r538rZ+3JZpzkv1fJxe4Mkwp+Hg9gpQCuzLl7aJ5nsjgF+QrCug4uRtfbCmuolpL+4NwiT0CpAqCxD/tZl8TzobuLJPPl3rtCiSonTmLJYV3yirj862pEV1jmR/ghXRFmhoRzjrrbarg8g74dT7CLt+9tJj1lKMuZ10eMD7qqK76HdHC0FjwlOKnhxf4Bzq3MokBSZz24Eee5lTZ0o5KfSOdrniiAKf6MNXpJcdjXkomWiCM2d/HuVkKfIxxycBUf8OHQCdwUu3/2oWZZT/WFOFgy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INlfurNXHzXPTbXFZ0UYcAZYRWEdJnLomYprSyprtt8=;
 b=b0ajVXo/UJeiFtvaFOQjOBN45LqLir6kgOD8JfnNOMHdOgviIWPxtHHSHFrkDUZMDYCUf90WtMXYj7B3inTsMTo9UaVL2oJaV5z+UR+R97MllQ7xsDwAnkwNkI48IbbsdqgaR1XYId0XQc12qF4FcVagZjN6eGfKbaTxGGTpptCVmURf3kaIEWTEx4/2WPAdxQNQoQY9J3LxFGKhrtO/oAvNNOhnNMtgx5lsnJ1cUVZ8ZGzZh2rpHa6ppJT8BkarINqC2CS92Zas2uu7bJxUC4FrQJB/8h2ZXBbVm7hD9rqRsoo+FwrGWepKopHtZYvIITy3XaN7xSoOiIkGqGjQww==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1583.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 08:12:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 08:12:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 0/5] powerpc: Add KCSAN support
Thread-Topic: [PATCH v3 0/5] powerpc: Add KCSAN support
Thread-Index: AQHZOdGpzd5ixLSSgkCm+kVqMRhjUK7BkeOA
Date: Mon, 6 Feb 2023 08:12:34 +0000
Message-ID: <449b9d60-18f6-ebf3-9878-ae54a61d1e49@csgroup.eu>
References: <20230206021801.105268-1-rmclure@linux.ibm.com>
In-Reply-To: <20230206021801.105268-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1583:EE_
x-ms-office365-filtering-correlation-id: b99a584d-62ad-48df-eee2-08db0819e6d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MS2UnFpOzQy1QJetT0zyVt/xrdr+HbgHHBx0tDjJU41vsO9YMphKJAkFccaIdYwunpM6mof+GwP1OTAuLQeSg6vAItZac+wvJq952AwP5+4aB/Jj3qXm17RHGaE9DjKCb3taEfUhqqbklR9B/EuFHJgqhdVdmaIr4OMMel3RO8Qt7tKRRn5P5kP6pZkAx/U5NdZF9Slh8NzNjZKNVdilnamelvxUTBsGciNU9b1KJeaXnGr4U0yoT267RCpOI5gKLvFylVeriaQDFpTdvtgCD3pTmT85qbOl9iWsq1L0ig8SKhmLCa73L0oK9jdxOFcI8+H949R2MTJoPwUpJ/D2FqQNxs484fAFVggifdM24c37L3tbtec/NfnSVx1cij6rXe5Fk0xVPsnvBUXXLoMMbZ2Sw9SvoBkaGOfH5aCNX/fbd5gMVdb1Q8D2SAN9IMeErKC6XQic8eVjo6d607QeLpRL8wiopRqY3Wipg3zaJHYvXURZeIZOCCzzfPaSTP/CDixA5WsuXp8LJjRj03ujc5DwRhDskdJkYnifmJG4/VgZrjxAbzkgs6qBqGyYFkFYgX05k6qco+BpA6UVaf5IP4sjRX1H7JmoweFQ+wRTmaB/QMIM/5dVQWczIkL5vNl8XiHzfx4quqvAtRRM5oinn8/S8OOlmUpAd6iw491cOobL5QdG9DL4ICU2D7N0sUWPZhXBxas3alUqzZmSequHvMhG0l5+075IA2qiN7b7D6zJr0EFm28WLppRIebwnV+BlivbCHJIOeI7OyMZYBJJK4p9gfk6Ou+/1HjZZdglxPY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(451199018)(31686004)(38070700005)(38100700002)(122000001)(966005)(6506007)(186003)(6512007)(26005)(36756003)(478600001)(86362001)(6486002)(76116006)(2616005)(4326008)(66574015)(66556008)(66946007)(83380400001)(31696002)(8676002)(66476007)(91956017)(64756008)(110136005)(316002)(2906002)(44832011)(66446008)(5660300002)(8936002)(71200400001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bVIwRXZLR3lpNXpNNWxSa1l0U0kxUGxKZTdhNmNhdElIRDBNWFNKK25FWWFN?=
 =?utf-8?B?MGx4R0U1c05WZS80eVBRTHVjU2d1RmNhb09JYmkvcHpmUGlsWkVtdFZJeWQx?=
 =?utf-8?B?OTRDQTFVNUJYM3hWSFBTem9BQ0t6eFJYd0IvdDdxNVR3emJUb2RFWkhtbU5Y?=
 =?utf-8?B?MERpamVjMVowVmh0S1JWWmhkNk5LRkJHTjQxUnJ0c2M2aHRrdkI1NzlMK2Q2?=
 =?utf-8?B?SHZjdGVjOERveFQzd1hGSFJtM2E5YWdneG1qaDlOa0RKUkFCMVcxQXpVWlJF?=
 =?utf-8?B?VzZQeVB4aENSQ3Z5MzE1TUwrTG1nLzZWRVB4K1g4UlpLUUx2UUFRei9yUzVx?=
 =?utf-8?B?ZmExWWZpSTMwTGhBTmlXTkFqY0hXU3pUUEJoNjVzYWY1QW9kdmZjNEtyRUpq?=
 =?utf-8?B?SFVPWEZqK2wvY0FJdEd5ZkJoRmtkdld3alZVK0pkSUZDMzRCZng5M1FldVV0?=
 =?utf-8?B?d3gxNlRGVEN1dUs3RzFRcWFMcWRWZmFIMXp3ZURjL0UyTmhPNUs0dVNEOFg4?=
 =?utf-8?B?NmxGN1ZBVDBQWTFJTUVROEZ5Ky8xc1R0RFVmRUYrS3lpV0lFVXR4RWt3UEw3?=
 =?utf-8?B?akNRYnpoNUdZZHVNeDBVWk1ialpoa1R6V25TaGNkT3Z6THpodStUQmh3bzAv?=
 =?utf-8?B?bWFNbnJ2cmdVNEhUNUQrVUNra1hIaTlHV3FWTkNQdE94NURUNlM5dGV4WjY4?=
 =?utf-8?B?bHNEZ0g3Ujdmc09OMmFKZC9hYk5ERXN6SG55VTJoemF2ZUVXaWN4TjlSaFZ0?=
 =?utf-8?B?c3cySXY4Z0RHNmFibkdFeXZwTG5lOGh5QzI0OWhsUTJNTGk0VnM0WUVISUx0?=
 =?utf-8?B?MStvOTNaTzlwaXgzM3NVMkRUVGs2TDZOTElmWG5OL0tnYnVnb2pueVRNbUNn?=
 =?utf-8?B?dEdpOENaVkJxN25SSHN1MUVQejBZV1U4SGVTN1JLZmtpb2l1d1NxQklCOVZ5?=
 =?utf-8?B?SzVaWEYzMUlWL1hUaGoxYTU4a3JtZS9XWEJhTWE0dkN5dTBLbTZNc0ZiUTZ5?=
 =?utf-8?B?SGVuUWJvWVhNbVJKRkgwK21RQXgvc3Y5YitwcTdaVWplODRmOEI1b21WTzhw?=
 =?utf-8?B?L3hXWGFIVDJpKzY2dDExVEFMRzMvNTdQUmtsZmE4eTBsZnU3eURxODNLMTVj?=
 =?utf-8?B?MldrYTA0Si9CbDl3bFU3RUtlc2hIRlhNQ0c1K2ZuSkVpdElhSWc2Mm9iMWpG?=
 =?utf-8?B?bHkxTkRKYm0zTDRSTGlIWEJhMGxFY2kxajRmSCtVb0dhZldyRDhaSVZURWFq?=
 =?utf-8?B?Q3p6L25VTFNuRGV5VmpuZWtBZjN5a0dZYlB4UU9rTCtmL2RjK2RFWEN3WUx3?=
 =?utf-8?B?c2RPbkhMOFhsTHNQeForUG1sZCtDbHRUdDI5R01oM3A0T2pzSjdkaUR5L2FG?=
 =?utf-8?B?RkdhK2ZJc1hiNmFQN2QvaTNKNDFXYlZacVFRaEtPN2lqTmhiV3Y5MzhnT0hq?=
 =?utf-8?B?YjlUMmlEcCtNT0pNZmk4OEpLejl6dVp1UFI2WkNaRnBZYTllOEtrVi9JTVMy?=
 =?utf-8?B?dTY1c01wYmJ0T3A5WGRPTThSN1MwekVLQ3NXRnNMbkRBRk9NKy9ZM2lQTHNi?=
 =?utf-8?B?UnJhZFhleERHcHdoNWxsRFQrWG8vRUpSR3RhWVJ5SHpFTW5yeWJJYW1odnV4?=
 =?utf-8?B?dHdreVdqd0grb0MwSjJ3V3dmT1psL2dGb3owWEViMHdUWXhWOFExWVd5UWtB?=
 =?utf-8?B?OTkwNno1dUNJRlZ5R0pKYS8rM2VmcVFFL2daLzgwTjg1YVNoRXk5S1NhdnZ1?=
 =?utf-8?B?dGxZdk5jOVNaQzlDUnVDSUs2V200SEI5MWdxMEFUYlNQWUJBNTl2M3RvTU9q?=
 =?utf-8?B?OWFkSXBKM0VBVWhGT3JqNDI5VGNjOVJrNlJUYVVla2JqbDlydm1FZDBYVzBR?=
 =?utf-8?B?MVIrUWhyeUNyc3Y0VHBPVk8yOU5qZE4weUhrRjhySTcxSi8yMHZPUnFCck5a?=
 =?utf-8?B?eEdVY21RYzczK1JLTFUrZFFoME9nSys4REd6cHJKdjVuZ1FwQldqVUpFNi82?=
 =?utf-8?B?QlJQR0k1SWRjN3Z2Ukk5SmpsRWU1OWxNRjNQVXRHblowS2JWdCtSR0pWRlIx?=
 =?utf-8?B?blU3YWw3R1NnMGlMUUZtS1VXQTMvS1NrZ3BpUGpoQWJobTg3WmJrS3dMV09O?=
 =?utf-8?B?T21DTUI2QlpkZGRhcWJPUXlRS2xGWk1LU2xqaDVIMHZqeHNkRHJYTmRBc1NJ?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C9A549588C1004D93208D89CAFCEAE1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b99a584d-62ad-48df-eee2-08db0819e6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 08:12:34.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pTdPFzHCuVhyiN4lcx2WZ8L7HhbAPksDeyzROmy+Au3l5APGdXUEDIW5zZITyn8bMXUTjoauXCXc250+84cngsiYDXD5/Cs1GA8NqTRHBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1583
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAyLzIwMjMgw6AgMDM6MTcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgS2VybmVsIENvbmN1cnJlbmN5IFNhbml0aXNlciBzdXBwb3J0IGZvciBQUEM2NC4gRG9pbmcg
c28gaW52b2x2ZXMNCj4gZXhjbHVzaW9uIG9mIGEgbnVtYmVyIG9mIGNvbXBpbGF0aW9uIHVuaXRz
IGZyb20gaW5zdHJ1bWVudGF0aW9uLCBhcyB3YXMNCj4gZG9uZSB3aXRoIEtBU0FOLg0KPiANCj4g
S0NTQU4gdXNlcyB3YXRjaHBvaW50cyBvbiBtZW1vcnkgYWNjZXNzZXMgdG8gZW5mb3JjZSB0aGUg
c2VtYW50aWNzIG9mDQo+IHRoZSBMaW51eCBrZXJuZWwgbWVtb3J5IG1vZGVsLCBub3RpZnlpbmcg
dGhlIHVzZXIgb2Ygb2JzZXJ2ZWQgZGF0YSByYWNlcw0KPiB3aGljaCBoYXZlIG5vdCBiZWVuIGRl
Y2xhcmVkIHRvIGJlIGludGVuZGVkIGluIHNvdXJjZSB0aHJvdWdoIHRoZQ0KPiBkYXRhX3JhY2Uo
KSBtYWNybywgaW4gb3JkZXIgdG8gcmVtb3ZlIGZhbHNlIHBvc2l0aXZlcy4NCj4gDQo+IEEgbnVt
YmVyIG9mIHN1Y2ggcmFjZSBjb25kaXRpb25zIGFyZSBpZGVudGlmaWVkLiBUaGlzIHBhdGNoIHNl
cmllcw0KPiBwcm92aWRlcyBzdXBwb3J0IGZvciB0aGUgaW5zdHJ1bWVudGF0aW9uLCB3aXRoIGJ1
ZyBmaXhlcyBhcyB3ZWxsIGFzDQo+IHJlbW92YWwgb2YgZmFsc2UgcG9zaXRpdmVzIHRvIGJlIGlz
c3VlZCBpbiBmdXR1cmUgcGF0Y2hlcy4NCj4gDQo+IHYzOiBSZXN0cmljdCBzdXBwb3J0IHRvIFBQ
QzY0IGFzIGtjc2FuIGNvZGUgZXhwZWN0cyBzdXBwb3J0IGZvcg0KPiBfX2F0b21pYyogYnVpbHRp
bnMgZm9yIDY0LWJpdCBhdG9taWMgdHlwZXMuDQoNCkkgc2VlIG5vIHJlYXNvbiB0byBkcm9wIHN1
cHBvcnQgZm9yIFBQQzMyLg0KDQpTZWUgY29tbWl0IDcyNWFlYTg3MzI2MSAoInh0ZW5zYTogZW5h
YmxlIEtDU0FOIikNCnh0ZW5zYSBpcyBhIDMyIGJpdHMgYXJjaGl0ZWN0dXJlLCB0aGV5IGhhdmUg
aW1wbGVtZW50ZWQgc3R1YnMgZm9yIDY0LWJpdCANCmF0b21pY3MuDQoNCk1heWJlIHRob3NlIHN0
dWJzIHNob3VsZCBiZSBtYWRlIGdlbmVyaWMgYnkgbW92aW5nIHRoZW0gaW50byANCmtlcm5lbC9r
Y3Nhbi8gYW5kIGJ1aWxkaW5nIHRoZW0gZm9yIGFsbCAzMiBiaXQgYXJjaGl0ZWN0dXJlcy4NCg0K
Q2hyaXN0b3BoZQ0KDQoNCj4gDQo+IHYyOiBJbXBsZW1lbnQgX19zbXBfbWIoKSBpbiB0ZXJtcyBv
ZiBfX21iKCkgdG8gYXZvaWQgbXVsdGlwbGUgY2FsbHMgdG8NCj4ga2NzYW5fbWIoKS4NCj4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjMwMjAxMDQzNDM4LjEz
MDEyMTItNC1ybWNsdXJlQGxpbnV4LmlibS5jb20vDQo+IA0KPiB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjMwMTMxMjM0ODU5LjEyNzUxMjUtMS1ybWNsdXJlQGxp
bnV4LmlibS5jb20vDQo+IA0KPiBSb2hhbiBNY0x1cmUgKDUpOg0KPiAgICBwb3dlcnBjOiBrY3Nh
bjogQWRkIGV4Y2x1c2lvbnMgZnJvbSBpbnN0cnVtZW50YXRpb24NCj4gICAgcG93ZXJwYzoga2Nz
YW46IEV4Y2x1ZGUgdWRlbGF5IHRvIHByZXZlbnQgcmVjdXJzaXZlIGluc3RydW1lbnRhdGlvbg0K
PiAgICBwb3dlcnBjOiBrY3NhbjogTWVtb3J5IGJhcnJpZXJzIHNlbWFudGljcw0KPiAgICBwb3dl
cnBjOiBrY3NhbjogUHJldmVudCByZWN1cnNpdmUgaW5zdHJ1bWVudGF0aW9uIHdpdGggSVJRDQo+
ICAgICAgc2F2ZS9yZXN0b3Jlcw0KPiAgICBwb3dlcnBjOiBrY3NhbjogQWRkIEtDU0FOIFN1cHBv
cnQNCj4gDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICB8ICAxICsNCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oIHwgMTIgKysrKysrLS0tLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSAgICAgICB8IDEwICsrKysrKysrKysNCj4g
ICBhcmNoL3Bvd2VycGMva2VybmVsL2lycV82NC5jICAgICAgIHwgIDYgKysrLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC90aW1lLmMgICAgICAgICB8ICA0ICsrLS0NCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3RyYWNlL01ha2VmaWxlIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzby9NYWtlZmlsZSAgfCAgMSArDQo+ICAgYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZSAgICAg
ICAgICB8ICAyICsrDQo+ICAgYXJjaC9wb3dlcnBjL3B1cmdhdG9yeS9NYWtlZmlsZSAgICB8ICAx
ICsNCj4gICBhcmNoL3Bvd2VycGMveG1vbi9NYWtlZmlsZSAgICAgICAgIHwgIDEgKw0KPiAgIDEw
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCg==
