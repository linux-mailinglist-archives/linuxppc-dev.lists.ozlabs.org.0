Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CA988080D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 00:08:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lPpZal5U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TznSw68Wmz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 10:08:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lPpZal5U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TznS44Q0qz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 10:07:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i07XMCF3EHrZcHxTks3Bl86t3xl+UfHwkgFDEfqXEbMgXBboXlYLfN9dmgzHDOyBUSNjakr71HqRkmTXPKVyIaZGqtxF/dFyauZZ2kG0pEsAkfSvDczUQKGB7XwaQErLjtp/gVRkeBSXF16LjMfG7isNeVQz1AxhYYrLyBfbJN5bZxeXEFgAu23hF5E4tps0lagQAUU5G1kSXSkDRXr/XU6p3mOHv3knDrrR642UbhJs3y/UVTAI2/DTDDP2w6COR+Ya6dnnzznv9G5YrcLt4FqdibdH9EwX569YEiG/y5qTnR+GPGOKUBXvXp4O8Wppb6jG/5fujtD0NTSmV5yrZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIWgk6SMYkNoRglA1OadUQRN+DUaDuIzSTpI0bKYhY8=;
 b=E0SXt8o9/JhXRVunyF2rOlsxLUcHVsfyocvRGZgBxVK5BhLLTLAI7fe4cKjDXboLGOnCwYZjVvpqTRu01aIYVb3oa7XLKrdi5KoA6NetMGlHyZ/9tl8JWYlj7w4rGZIXJ8EEfesccAOJ1wvRS6elxrh8owyxVXMLcoyMXLEl7WanawAd5Fspo0v7ucDjD+KiRu/MB9+KfdssexpcQ1i18d/KfCndhZ71pH4DwJr8A3Z8pAuAmxYOmhbqF1AZD0+MAJ7KtEeyP1gLXHfT1SH9BEmfX7wuagCRNJmYZy7UmsrdiBEEL6O1b8xgNKF2oFN5MQYvnVu6do81LvRAy+/XIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIWgk6SMYkNoRglA1OadUQRN+DUaDuIzSTpI0bKYhY8=;
 b=lPpZal5UpBSZWr7/GRfzvP4HU2NzgWSA/pK6fyu1iNhWqKlaB7UICCcItI1myglzMumG4M9hn0BGHKaZXuDivimqIEGvW8DfDVz+MSPxvE1nbbSfq2zXqXeYI9mISGuQS7ja0iuPNgoId/tgzNHryMWjCZT+JqZ42lS16wJ9ieWgjVBGtHw4JL5mWOh6i8KNWK4FSmjWCS8yAakbZm0fhI5bkW5HCYN16AUkpfDX3NEBgx3ziXg1cwWW+IApFRf3UP8M3MheuZWXTUAkSeaPCbBMC8bRKd2FgLDfhmkLEu8Fryk9eWQ8uQcE5n9FlVsyRuRDwf3fGY15FoXIqVgqug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2729.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Tue, 19 Mar
 2024 23:07:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 23:07:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Thread-Index: AQHadZASkAUcDDurK02wtpi3kLRmM7E27NOAgABFZ4CAAAUJAIAGfI2AgAIFYYA=
Date: Tue, 19 Mar 2024 23:07:08 +0000
Message-ID: <e0417c2a-2ef1-4435-b5a7-aadfe90ff8f1@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu> <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
 <20240318161519.GA5825@nvidia.com>
In-Reply-To: <20240318161519.GA5825@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2729:EE_
x-ms-office365-filtering-correlation-id: bb33fc70-d59d-4634-b1ab-08dc48694d1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RNEsIE5gY1K/0eGdse2lih8ZPwec/AZJcone3w8ANRCwDhRVKgNjQrA9Z6OcYTbozRLsKj5SAgR5jfsC5ADO9tfJ++AdDDDdRDl0QvbZBcVzy4xS97USoaU2UK/4sBeUuAX6qEcZutb+VGbtZMrcWXLNXVpicLJtAlEkmjLNjCgStDleTOXGtd+1ZVD4uV77v8PleC4lQXz5G3D/1zETawE0aLVJNFevJw9MmmJGciszLt7k5K4VuaYuQuMMSk5MpLf8apCYHqtZUSASNfLTNW7MoIfY2aHrRGbxJnKSOynGZ0Dt3yWAOesFHzolEtxg3UIP22F7okH1zDaw0XK44/nWbfo127TuQAaCepoaWvNNvXM42mFVKdCV/715YNXQFf0Gah/guKhA/G8I8JgunWZhoT8Jto1oq5SRuiaK6TXQBYj55B46WLHbGy4UQNtrje9BxguNldhrDTP2/kOYAgUsaaizRaBFcRd7+NlIMhJF1oU/AGMgPEszd0dKTtIA1FY7Ttpb+aX1WlGaV0Q/JpSu6G+/nz+KSJD1EmmXCWiLBQC19zVM+9hYqBJRAZOShG5D6yZnKPgjqc7ebcOYBCvTcrmNhdFRnoXhSz22qeVOBg0RNhGdhyOJyrGVZrv16awnuieVHzfd6tiVWZKYm5tNSny1V+agHdSS5l/FCY83ejrViTITGOJ/PD0RZDLoO/3seCp6cgXEvlTXlQ4AgNxzOv3BiuSazcHIIV6o42c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QUE1WndueHFnaVhROWw4ZDJNNGhyRzRwZm1HbFV1UlhsL0pkTHdDNklZRkto?=
 =?utf-8?B?OWYrWTJsempYNmt1ZjBleUlVNTQ3VmczQ1ZwZmRLU0hMT1QvNUV1UW5TcHRK?=
 =?utf-8?B?UTJqMDFORW9zZFdkcW53OGcvYXRvRFozSC9oL1NhallEOFAzOHlmbVB5UTM2?=
 =?utf-8?B?TWluNCsrS1ROYVNuMkRTMGlXRy9ndXROajlIQmQxcHpGcEh5TDc2NHlmblpq?=
 =?utf-8?B?OUpXclpmeUg5dUhDU2RkbHdLWTNCNVg5dXVYM1JFbmFRRDR3dVA0L3Fkb2lL?=
 =?utf-8?B?V2o1NURtTjdLUGUraDh3Z243dUtxU0lURVdFVHdQbmxEazZCcWdSZ3pUdHFn?=
 =?utf-8?B?RlBIOU13Q05lTXA3VVJsUi9MK3h0aXltWGlldzBpVVB6eFAxRGl1TCtoTHp4?=
 =?utf-8?B?MWZxYU8zQzVTMnZWQ0pmOGZjeXh1clpvdVFvNkMyeVZPOHhpRGtqNHJUemRR?=
 =?utf-8?B?Y2U1UDJlSEhpdWN0SjFCVjA1Vm5pMmhSK05ENW54MzNZYml5OTdERytoenFE?=
 =?utf-8?B?NFBBR1F0NFNTNjV6cytlc1BiMnZiUFUxWTF2RTh1LzVTMUd1TXl2RWV6Q3VN?=
 =?utf-8?B?RUZnV3FuWm8vWnREOEYxZmlyeDZmYk5hTDRHM1hZRW5YYy9pbmRwL095OW4v?=
 =?utf-8?B?WWNYcmVHMWQ3STFEdXdMM0JhenRRZFN3b0dLT2pvYWYvdlZ5QW5TTDJydjVQ?=
 =?utf-8?B?Y0xaWnNzaGRVOTJDemFZQjNLZDlMa2ppQWllT3NIOThQaFFscDdQV2xXbGE3?=
 =?utf-8?B?T1ZZM3pJL3pwZlpyWlRha0htRWozczdmZlFEZUI1T3BCQkh6UmRsbm0wRVpk?=
 =?utf-8?B?T0R4bUsrcWdmTHh5RFNKVjFRSDNMYjJqalZqVlBoaDJmYS9zWTM2RVRCY3lR?=
 =?utf-8?B?TnlkSUh1ZWdCNFN2dlpic0dHZ0JrZUhEYWhYc3krWXlJdGRhQkNuSTNCRGNa?=
 =?utf-8?B?aGJtZG9OZVBWOUQzL056K1FhZlhJQnEwbVZWZHh4ZngvekxVTTd0N2M1cmMx?=
 =?utf-8?B?K3R2Z1RIaHR3RkRWRExaMUdRai83SnArMCtXRWQ3T3pMeHU4V3BLdEMxUFo2?=
 =?utf-8?B?VkY3ekZZcnJIeHVHRU5QN0t5NG5ZaTJ3TTBLc2FrUmEzZm9HMDNZb3RFUnFZ?=
 =?utf-8?B?WWJYcHJWNWtYNkszMWc3K0VlWFRsMWVWM3BSYXhrZU11MDVjU1k1aFZQS0dB?=
 =?utf-8?B?QWhQeUhrZUhwVVpzNmU4U2hhd2x3dy8wQ2cxK1NmczMvNExmYUFaMmt3b2Fu?=
 =?utf-8?B?V01qRGRqQ2tHVUViNUlrMDJnKzE0WW90OVIvbVplSlNnQ1pQVXFMM2dOTjht?=
 =?utf-8?B?eW1BdHppR0luQURZVGp6dTlPaE0zR1NzRno5VXFNekpPK0FZVDBQUHpzbFlZ?=
 =?utf-8?B?Q0NwUlRFUTM4NHUyb3hsUUNQbURvaHFyaDZzRE42SEluamIzSjErM3o1TDVY?=
 =?utf-8?B?T1hnZ3RXSTFpbjNldkFWVlFKVzFNc2U3cnlsMXNYdmpjQUZGNjR0ZGJFZ1RQ?=
 =?utf-8?B?MWY3ZGxybjY1OW9HeE5NNEx5Z09qRVpZcGtnM25JbmpqSUJWZTBiUVBUb2Ix?=
 =?utf-8?B?OWFiNm94RkoyOUpuYmlpUFdNRHQ2NzNabytDV0pKeTZ1UU9vZUdoeCs3ZGdh?=
 =?utf-8?B?V1J1VzZrWGw4L0M2bFJQWjh6M29qc1J5VmUvZFJNRWl2OU9OVUE0YTRmL05m?=
 =?utf-8?B?TlZBZlBjVU9zai9KRFhCN1BrcmxnTUlOem1GMUhWUmdxbGYyRzF5Y3FFYnVp?=
 =?utf-8?B?RTZ1ZlZ0T25SZnZ1K0J0aFE3NEdFdTNQbXFHdmV1aEI2UkZtNFNRYm42QVdU?=
 =?utf-8?B?dFV2ME1HQTVBM3o1OGVudlZDWTZwYjJXdnk2WXcyWXhhbFM4RC8vTU4vMkhI?=
 =?utf-8?B?bHlJbFp5NlZhOG82TVJQTHpCbmdHYXFvV2ZnV2R1L0VZWlptR3dQY01qYmJx?=
 =?utf-8?B?dE8zbDdZMENGUEpPaEpIb29WMkdRanE5U1FQaUNnUEN6MExkSjBUVC95ODc4?=
 =?utf-8?B?VXp2TndhZHJQT1UxN0ZBd21GUm15Q0FhN2hqcDk0VVk4cXM4cGJUd0Z2RWJC?=
 =?utf-8?B?NXpQWDlTN0w5RHJNZ1paYVNnUHI0TVJHT1BhUnNkc21GV2Fuc2NUWHBTb2lP?=
 =?utf-8?B?SGhTQVdiWmVmL1g2eHNwam54TmNhZTArQ0U2bi94eTlacXBFU1NsTzlKbGQx?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE40AF53CDBE0C43995A0518B12E0F31@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb33fc70-d59d-4634-b1ab-08dc48694d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 23:07:08.1998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oga5Smck483vhPlQBah2PaCKh1R6s2eYTe42Ukg3kh2wq8wkxdzda+PH+x5rL2G8iuf05dDwKbEi8pVKdlFhEBMGMAGHLp4H++ayWXTdfAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2729
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Mike Rapoport <rppt@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzAzLzIwMjQgw6AgMTc6MTUsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCAwMToxMTo1OVBNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAxNC8wMy8yMDI0IMOgIDEzOjUzLCBQZXRlciBYdSBh
IMOpY3JpdMKgOg0KPj4+IE9uIFRodSwgTWFyIDE0LCAyMDI0IGF0IDA4OjQ1OjM0QU0gKzAwMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+IExlIDEzLzAzLzIwMjQg
w6AgMjI6NDcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6DQo+Pj4+PiBGcm9tOiBQZXRl
ciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+Pj4+Pg0KPj4+Pj4gUG93ZXJQQyBib29rM3MgNEsg
bW9zdGx5IGhhcyB0aGUgc2FtZSBkZWZpbml0aW9uIG9uIGJvdGgsIGV4Y2VwdCBwWGRfaHVnZSgp
DQo+Pj4+PiBjb25zdGFudGx5IHJldHVybnMgMCBmb3IgaGFzaCBNTVVzLiAgQXMgTWljaGFlbCBF
bGxlcm1hbiBwb2ludGVkIG91dCBbMV0sDQo+Pj4+PiBpdCBpcyBzYWZlIHRvIGNoZWNrIF9QQUdF
X1BURSBvbiBoYXNoIE1NVXMsIGFzIHRoZSBiaXQgd2lsbCBuZXZlciBiZSBzZXQgc28NCj4+Pj4+
IGl0IHdpbGwga2VlcCByZXR1cm5pbmcgZmFsc2UuDQo+Pj4+Pg0KPj4+Pj4gQXMgYSByZWZlcmVu
Y2UsIF9fcFttdV1kX21raHVnZSgpIHdpbGwgdHJpZ2dlciBhIEJVR19PTiB0cnlpbmcgdG8gY3Jl
YXRlDQo+Pj4+PiBzdWNoIGh1Z2UgbWFwcGluZ3MgZm9yIDRLIGhhc2ggTU1Vcy4gIE1lYW53aGls
ZSwgdGhlIG1ham9yIHBvd2VycGMgaHVnZXRsYg0KPj4+Pj4gcGd0YWJsZSB3YWxrZXIgX19maW5k
X2xpbnV4X3B0ZSgpIGFscmVhZHkgdXNlZCBwWGRfbGVhZigpIHRvIGNoZWNrIGh1Z2V0bGINCj4+
Pj4+IG1hcHBpbmdzLg0KPj4+Pj4NCj4+Pj4+IFRoZSBnb2FsIHNob3VsZCBiZSB0aGF0IHdlIHdp
bGwgaGF2ZSBvbmUgQVBJIHBYZF9sZWFmKCkgdG8gZGV0ZWN0IGFsbCBraW5kcw0KPj4+Pj4gb2Yg
aHVnZSBtYXBwaW5ncy4gIEFGQUlDVCB3ZSBuZWVkIHRvIHVzZSB0aGUgcFhkX2xlYWYoKSBpbXBs
IChyYXRoZXIgdGhhbg0KPj4+Pj4gcFhkX2h1Z2UoKSBvbmVzKSB0byBtYWtlIHN1cmUgaWUuIFRI
UHMgb24gaGFzaCBNTVUgd2lsbCBhbHNvIHJldHVybiB0cnVlLg0KPj4+Pg0KPj4+PiBBbGwga2lu
ZHMgb2YgaHVnZSBtYXBwaW5ncyA/DQo+Pj4+DQo+Pj4+IHBYZF9sZWFmKCkgd2lsbCBkZXRlY3Qg
b25seSBsZWFmIG1hcHBpbmdzIChsaWtlIHBYZF9odWdlKCkgKS4gVGhlcmUgYXJlDQo+Pj4+IGFs
c28gaHVnZSBtYXBwaW5ncyB0aHJvdWdoIGh1Z2VwZC4gT24gcG93ZXJwYyA4eHggd2UgaGF2ZSA4
TSBodWdlIHBhZ2VzDQo+Pj4+IGFuZCA1MTJrIGh1Z2UgcGFnZXMuIEEgUEdEIGVudHJ5IGNvdmVy
cyA0TSBzbyBwZ2RfbGVhZigpIHdvbid0IHJlcG9ydA0KPj4+PiB0aG9zZSBodWdlIHBhZ2VzLg0K
Pj4+DQo+Pj4gQWggeWVzLCBJIHNob3VsZCBhbHdheXMgbWVudGlvbiB0aGlzIGlzIGluIHRoZSBj
b250ZXh0IG9mIGxlYWYgaHVnZSBwYWdlcw0KPj4+IG9ubHkuICBBcmUgdGhlIGV4YW1wbGVzIHlv
dSBwcm92aWRlZCBhbGwgZmFsbCBpbnRvIGh1Z2VwZCBjYXRlZ29yeT8gIElmIHNvDQo+Pj4gSSBj
YW4gcmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZSwgYXM6DQo+Pg0KPj4gT24gcG93ZXJwYyA4eHgs
IG9ubHkgdGhlIDhNIGh1Z2UgcGFnZXMgZmFsbCBpbnRvIHRoZSBodWdlcGQgY2FzZS4NCj4+DQo+
PiBUaGUgNTEyayBodWdlcGFnZXMgYXJlIGF0IFBURSBsZXZlbCwgdGhleSBhcmUgaGFuZGxlZCBt
b3JlIG9yIGxlc3MgbGlrZQ0KPj4gQ09OVF9QVEUgb24gQVJNLiBzZWUgZnVuY3Rpb24gc2V0X2h1
Z2VfcHRlX2F0KCkgZm9yIG1vcmUgY29udGV4dC4NCj4+DQo+PiBZb3UgY2FuIGFsc28gbG9vayBh
dCBwdGVfbGVhZl9zaXplKCkgYW5kIHBnZF9sZWFmX3NpemUoKS4NCj4gDQo+IElNSE8gbGVhZiBz
aG91bGQgcmV0dXJuIGZhbHNlIGlmIHRoZSB0aGluZyBpcyBwb2ludGluZyB0byBhIG5leHQgbGV2
ZWwNCj4gcGFnZSB0YWJsZSwgZXZlbiBpZiB0aGF0IG5leHQgbGV2ZWwgaXMgZnVsbHkgcG9wdWxh
dGVkIHdpdGggY29udGlndW91cw0KPiBwYWdlcy4NCj4gDQo+IFRoaXMgc2VlbXMgbW9yZSBhbGln
bmVkIHdpdGggdGhlIGNvbnRpZyBwYWdlIGRpcmVjdGlvbiB0aGF0IGh1Z2VwZA0KPiBzaG91bGQg
YmUgbW92ZWQgb3ZlciB0by4uDQoNClNob3VsZCBodWdlcGQgYmUgbW92ZWQgdG8gdGhlIGNvbnRp
ZyBwYWdlIGRpcmVjdGlvbiwgcmVhbGx5ID8NCg0KV291bGQgaXQgYmUgYWNjZXB0YWJsZSB0aGF0
IGEgOE0gaHVnZXBhZ2UgcmVxdWlyZXMgMjA0OCBjb250aWcgZW50cmllcyANCmluIDIgcGFnZSB0
YWJsZXMsIHdoZW4gdGhlIGh1Z2VwZCBhbGxvd3MgYSBzaW5nbGUgZW50cnkgPyBXb3VsZCBpdCBi
ZSANCmFjY2VwdGFibGUgcGVyZm9ybWFuY2V3aXNlID8NCg0KPiANCj4+IEJ5IHRoZSB3YXkgcGdk
X2xlYWZfc2l6ZSgpIGxvb2tzIG9kZCBiZWNhdXNlIGl0IGlzIGNhbGxlZCBvbmx5IHdoZW4NCj4+
IHBnZF9sZWFmX3NpemUoKSByZXR1cm5zIHRydWUsIHdoaWNoIG5ldmVyIGhhcHBlbnMgZm9yIDhN
IHBhZ2VzLg0KPiANCj4gTGlrZSB0aGlzLCB5b3Ugc2hvdWxkIHJlYWNoIHRoZSBhY3R1YWwgZmlu
YWwgbGVhZiB0aGF0IHRoZSBIVyB3aWxsDQo+IGxvYWQgYW5kIGxlYWZfc2l6ZSgpIHNob3VsZCBz
YXkgaXQgaXMgZ3JlYXRlciBzaXplIHRoYW4gdGhlIGN1cnJlbnQNCj4gdGFibGUgbGV2ZWwuIE90
aGVyIGxldmVscyBzaG91bGQgcmV0dXJuIDAuDQo+IA0KPiBJZiBuZWNlc3NhcnkgdGhlIGNvcmUg
TU0gY29kZSBzaG91bGQgZGVhbCB3aXRoIHRoaXMgYnkgaXRlcmF0aW5nIG92ZXINCj4gYWRqYWNl
bnQgdGFibGVzLg0KPiANCj4gSmFzb24NCg==
