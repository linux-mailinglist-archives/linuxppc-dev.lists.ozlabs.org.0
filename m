Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350C570785
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 17:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhSyQ68KZz3c2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 01:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0zFOUetR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0zFOUetR;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhSxg5xwjz3052
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 01:49:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5OT9pYboUiaJ/lhdX4xMhYqkhjL4C91+iwcoJd9IfKWlI4qKRevSeY2UPzBParbToNTOlPkzUoYr20vsl5ZJfXtiuu/LkxHqPN882OLgtlxPkCT5s3Jq8Somc1+A+Z2Vp4I4K4Vwmcf11gP6r875Qs+HbZubrnjsETBc+BCGCfPKxpYDVXkRTAKMDAacSFGYA7b0TG0xN7qitPNM45TyKMYllQzseRG/dOL6ZBsFLEx6IkjzWXtAo5ulWl5E7ptJHgqRbIrfxE5mdp9uPlHGlrqFM+n6XXgNsOxb2+C1TzQUBUOjoeYgjgAjAjheRW634O8kliu4Xl3+SOPt5/0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Nj5L+CUUBkE3S/wBm39IyWJ6btRtv1nNljoL/TfrJA=;
 b=fLmT5RU4CrS/WbIvw3Mc4f5ZCEBo0rjN16Slim2jGGog+/2JyZcqCgqmKbCyC/vPbFmYIP1/01POYlXb793ZdT0qIeWfvZY1AY7KOJlt4OuZo40Vmy1cZ3/cwWONjLAZ3K9i/r66I+9NMSchgFtwut17+yIZyRMDLKs4QeNbx3AitRYOqUhMrXX5I7q/S0ctEtSciOYdBT5cmTInJD/f605WGfJrI1/PdR3Rs6JtutlMzxTT8oD7XLrOtHyqgH9WYPwqr82m5yjMUIa0/qsnk8tXJEhFVcAh1FbPS/beDov7LbfyatQ7gTiq+JtVL+o4Pjs443r6KBhjoalCb6A+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Nj5L+CUUBkE3S/wBm39IyWJ6btRtv1nNljoL/TfrJA=;
 b=0zFOUetR36QdijLshjNJhCLaCbUainhzxHYQ0HgIJlwCtcFrZzjUlhqSf6R5QHtJQQ7njB0sAMuOh6ok9LU1gVnivpHkY+sn1hEDZT1Dd8uo2bxdJJrmqRzNUAzSoGnRtGoJND/RVofji6oxI/16+zPB90Pjf38NmEy+8pZzLC1uKW2qOWGqzC1fHla6GkYP2XITKed3cyS+wOS7vdHWiAd5oWm5E0WKLSdMcwcYBm8rcqWc1zpNtQa+NHlE1ajNpJwZnG1G/N7wwtQidU/HbNoYlpe4EQ9VN7mU5T7M6zScYnffPu5MRT1hvVJeDvOP8rycKF4im6NTcq7jbH2H2A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2101.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 15:49:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 15:49:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v1 4/5] powerpc/44x: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
Thread-Topic: [PATCH v1 4/5] powerpc/44x: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
Thread-Index: AQHYlTFZM8ItLf3W0UGDH9TWcWhutq15RNAAgAAMX4A=
Date: Mon, 11 Jul 2022 15:49:22 +0000
Message-ID: <2970b49d-25cd-3c14-ed75-7558ac82df68@csgroup.eu>
References:  <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <b0d982e223314ed82ab959f5d4ad2c4c00bedb99.1657549153.git.christophe.leroy@csgroup.eu>
 <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
In-Reply-To:  <CAK8P3a33jf5CUpyzWmRHpoUDMWB7TqSw5afUW=rcmMVSK8BvRA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ade1fc53-7a3d-4cf4-b107-08da6354ec65
x-ms-traffictypediagnostic: MRZP264MB2101:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o/1n7aS3VZYskhSIinjE3UsSxoLxV6tf1sWP5IVOXlJX/+RkzfD1pDX57aptg4ZGjaCC6/5SarECnA49R9uUGEWU+xJhpitNU4Jl16SQ6wgdzcVdt0BTUElSwV+3cAROdCY9J41b1xQaA0KdcXImErTQ+hkvbKFsexLFAtFEKF33TACTdd+W39ULK0e5S41q7HhUKtCNwsVBtyEsfXUMncoKtbLgXzs+23b5+SCqmqE1Bwj36NR7u4XO/42o+Oq/a8V5n18Q18vG9Ahywfa9mEeCkD6GB6bFqnDxSYbjrfhBT/4fvHBq7fxkGDZHqzA8o6TBv69o5r5ziupes7O/kdU1FE3/15pS6vcdXqDuMrVwjgz/va4SjxKVKT3Xqs0toP+fdbefq0K7O40o8z9B/IBrkvLTGLuh3SNYX9mxsQt3qzGbtiHBDOwVbP5yk13DiIzZ9G66OO7DH1K2ss/fHHCscoA326Koh8fHdO3d4jY3VCo2O+nK1wclSV7LTTkEpb3VOwd3wM6RIVtod/aJkdMey2MFOe5W2MK7vlaAuuOfFP/CPxrGmqamGfY8RRIrpLT7Hi0He1DqwgcMkS9QAVyyMkyqbgNHLU8xCpqFmPN6OZ98+mzs8hc6n98SxjKZHko+lGNKI1jlnwdm8/j3FQjkagLcVRW/srEsAVcRlqB9u/f5DgcnNX9UUrgS9AnPsFfb5DxwPv1zQWSoeI+Fsm3YAQy1Dhx0QUg5NS5lWo/FbUnzqmCvWuoEdzzr41Y7aYfApubRFK73U04WtQG6vpdUnTdz+3uDU+sKEmimPbBJJTyqg2r4wXesxwvFh2ej0LTKlRc3I4u6zhwUWnGpt8t7POYu//1/PR4dM3pQ/D6Feo0tFnaxaq14xWjE3vpJxaV30MV+xEiQWp8XtVSlYw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(38100700002)(186003)(76116006)(5660300002)(122000001)(110136005)(316002)(4326008)(71200400001)(66476007)(66446008)(31686004)(54906003)(66556008)(36756003)(91956017)(66946007)(8676002)(64756008)(86362001)(2906002)(6506007)(44832011)(6486002)(478600001)(31696002)(8936002)(6512007)(41300700001)(2616005)(38070700005)(53546011)(26005)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TVBoNFJmYnByajhmUG9DTHQwN0lwcjlTRDlFSE95dXM4cmxKajIxT2hBKzB2?=
 =?utf-8?B?V2dqbEZMdWp0YW5TRkRyUnhYVUJqcEYwZGQyVHo5dDBUdWJqQldMd3kvbHd4?=
 =?utf-8?B?Ti9hdmJCSzBvYnJjL0JhYmVsQjNqTFdMaGxQV0dPNUljand6aHl0SGltblN1?=
 =?utf-8?B?Wkp6amNRa3pIYWR4clVBSjlYRmg0d0ZlVDI3Sk9zVVhOQmdmYWgrY055RWpR?=
 =?utf-8?B?SkV0aW9oUWt1aU1IVHd0N1NjMW5EL2IrSUIwWEM2eVJncksyaEN4czVHZE9P?=
 =?utf-8?B?b1JjK1hESFNrZGZHVkpWV3gwZ0FEbDBQRzJ2MUpmQVljN0hLR2VPZE84M3lv?=
 =?utf-8?B?WGhGNE1ERTFNQ253YkhVNlRFbUc4NmN5T2FhN0FrU1BYNzBVOU9NWndHNzVl?=
 =?utf-8?B?Q25JZEpTN0Iva3BqQ21LMlVSQUk3N3pqS2lpOFlRT0ZTMlZueTQ0ZCtJSVJN?=
 =?utf-8?B?Sk9YZTk3RzdiWFlrcnprWjRURUJ6UWNNTVVGOXI2RU5rOEpxeGU1RlZFSi9x?=
 =?utf-8?B?M004MFJnbVhCR0dDcm5hRU1Wbk9KWmtRNXlVODhHZ3dOVitSRXVJdmplMWJY?=
 =?utf-8?B?bzY1dFlqWmNaKzBnSHllcG1NSGRFQ1Nmbm1HZVBtOU1zdS9ROFhLOUxxbG5w?=
 =?utf-8?B?cTRVYUF6YytybW9BMVBkSVZUQ3huQzZLdjJwTWVDemdVV2E5b3BHMFVzd2lj?=
 =?utf-8?B?WVIra2V5UGxSWEpxak9qaVZjZ1I1TzhwUW1XOGJpNXdpYitNcFNCMlVId2JI?=
 =?utf-8?B?ZFBBakVCUkxwR2tEcFN0UW4xby84Ry9ZVFgrS243T1haVHByUWVtbHNwSTRl?=
 =?utf-8?B?eVpwa2lTNUQ4M290Q1NFb2dWbEFwdlplQzNlT3ZwRUI3MmJISlNWblNndzhq?=
 =?utf-8?B?TExLV3FiRGZUbllwcGdCWVlXSHdyK20vZXIwcis5QWVKMDRlV2NvazkwQ1NL?=
 =?utf-8?B?aXV0eGFPS1BQYjRMMGxFcmsrQnBuVUFCN0FwUU9MY3o5dUpvZlNhZFljUC93?=
 =?utf-8?B?SmNWSkVnTWM1Q0VkL3dub3BicGRpRjdKMzZjTlk1Q0I0NnNPbGpkZmZDb1Vz?=
 =?utf-8?B?MGdyM0Q0Q0REMk9HNGFEZGhmSUZZNkdxZU15TWgvb050MERWTHVOR0hIeExv?=
 =?utf-8?B?ekRkMjUzOWRuS091ajBjNjMzTi84emc5VjE2bzFTeVVTdk4zWi8vdFN6VERJ?=
 =?utf-8?B?UWpldmtuRDZJYTlLYVRkOEttVTBncEM0MzgxZnR2c2phNWlTQlVMMXg0c3Ft?=
 =?utf-8?B?ckUwV2Y4SFVRYWx4bFNiT1hzd1VkUHpLUEY1cUxwNW9uZGh4N3B2dHNDSDlQ?=
 =?utf-8?B?RWF4YmVQcE8yMHNRY01kY29TelBCUUgxcmQ3dFMyMzk4K2dFWEF5cTFjZFFj?=
 =?utf-8?B?SVFIUUFlbW4venlvSmoxWGx0cUp5MGFaeDdSOGFqSDdMVlQyL2dFVEV5NVZq?=
 =?utf-8?B?dHB0V1dDVXExQnRHQ29sa1JEampoYmlSbDVRdGRGWjNNQnhTejgrbHJDQ1Ft?=
 =?utf-8?B?bTQzK2o4Y3F0NENmVjZETXU4TnFRbUFRM3hJUGk2aEQrYm9JU3dBaUpwUjgy?=
 =?utf-8?B?dmhac1poM01wYjBxVWgycHd5L2NxNFVxMHFBVWd2d09PZ3lzYVp0SWNQTEpB?=
 =?utf-8?B?YXNEOExQTExjUlp1SzZmUTdFS1hIY09TRGFjMG92bjB4a0dDTHpGY1paYnJP?=
 =?utf-8?B?QTJDM3BYZUZhUUdEVURubHlFNEo0TWIwdHo2amtDMEF0ajNveWdCeWxTZENY?=
 =?utf-8?B?dDE3VUFZVWk1T1p1ZG01Unc4cTV0QTkzaHVFdlQvWTUvS1FwVS9ESVpld3E3?=
 =?utf-8?B?MnQ0UFhFK3JtZnhwbU5SMFYxZGlGMUVnRFFEOU11TURaOTRGRmhxeEVwZ1Bw?=
 =?utf-8?B?STZCTU8vemx6bUFMcTNMZG8zUElGRE00eTFlZEtEK3lSS2diN2ZNOWtHU3Er?=
 =?utf-8?B?V21MZlpzN0dLV1VQckRweTJiODd0bG90Y3pydk9uenZmOUJMaHJTbnFvdVVn?=
 =?utf-8?B?Zi9icnIxNGJkTk5WRmpoZWMvNGdXajlEKzM3MW05RWNESjZhWjFadmZjV0Y4?=
 =?utf-8?B?OXFKUUx0VkhCUDAxRHUyejRqbEFwREFCOFA4T0ZraEtxNUNxWVJPbHZDSllo?=
 =?utf-8?B?WGZGN0RkMlRQNHNJbjFnWHBialBYOGR4aU1MMzNEWHFscWxZQTBKdHhMeWwz?=
 =?utf-8?Q?tCS/aVtZkntNwIBHrNRvOLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF4BF3C08A986F4689727D7DBD755374@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ade1fc53-7a3d-4cf4-b107-08da6354ec65
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 15:49:22.0680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9QOSj6aCt04amFokgkp81O7FhigKO2QJNvbqOaN/6kACHIp18UPWyYsSFxrGmGDEFEbaERj1NR3mtUSqWcKcrObdV6+c5gWY8D82dM9zdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2101
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T29wcywgSSB3YW50ZWQgdG8gaW5jbHVkZSBQYWxpIGFuZCBTZWdoZXIgd2hlbiBJIHNlbnQgdGhl
IHNlcmllcywgSSANCnByZXBhcmVkIGEgc2NyaXB0IGluY2x1ZGluZyB0aGVtIGJ1dCB1c2VkIHRo
ZSB3cm9uZyBzY3JpcHQgYXQgdGhlIGVuZC4NCg0KTGUgMTEvMDcvMjAyMiDDoCAxNzowNSwgQXJu
ZCBCZXJnbWFubiBhIMOpY3JpdMKgOg0KPiBPbiBNb24sIEp1bCAxMSwgMjAyMiBhdCA0OjE5IFBN
IENocmlzdG9waGUgTGVyb3kNCj4gPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6
DQo+PiBAQCAtMTgzLDYgKzE4MywxOCBAQCBjb25maWcgNDA1X0NQVQ0KPj4gICAgICAgICAgYm9v
bCAiNDB4IGZhbWlseSINCj4+ICAgICAgICAgIGRlcGVuZHMgb24gNDB4DQo+Pg0KPj4gK2NvbmZp
ZyA0NDBfQ1BVDQo+PiArICAgICAgIGJvb2wgIjQ0MCAoNDR4IGZhbWlseSkiDQo+PiArICAgICAg
IGRlcGVuZHMgb24gNDR4DQo+PiArDQo+PiArY29uZmlnIDQ2NF9DUFUNCj4+ICsgICAgICAgYm9v
bCAiNDY0ICg0NHggZmFtaWx5KSINCj4+ICsgICAgICAgZGVwZW5kcyBvbiA0NHgNCj4+ICsNCj4+
ICtjb25maWcgNDc2X0NQVQ0KPj4gKyAgICAgICBib29sICI0NzYgKDQ3eCBmYW1pbHkpIg0KPj4g
KyAgICAgICBkZXBlbmRzIG9uIFBQQ180N3gNCj4gDQo+IElzIHRoZXJlIGFueSB2YWx1ZSBpbiBi
dWlsZGluZyBmb3IgLW1jcHU9NDQwIG9yIC1tY3B1PTQ2NCB3aGVuIHRhcmdldGluZyBhIDQ3Nj8N
Cg0KTm8gaWRlYSwgbWF5YmUgbm90Lg0KDQo+IE1heWJlIGFkZCBhbm90aGVyICFQUENfNDd4IGRl
cGVuZGVuY3kgZm9yIHRoZSBmaXJzdCB0d28uIElkZWFsbHkgd2Ugd291bGQgYWxzbw0KPiBlbmZv
cmNlIHRoYXQgNDQwLzQ2NCBiYXNlZCBib2FyZHMgY2Fubm90IGJlIHNlbGVjdGVkIHRvZ2V0aGVy
IHdpdGggNDc2LCB0aG91Z2gNCj4gSSBndWVzcyB0aGF0IGlzIGEgc2VwYXJhdGUgaXNzdWUuDQoN
ClllcyBjYW4gZG8gdGhhdC4NCg0KQnkgdGhlIHdheSwgNDQwLzQ2NCBib2FyZHMgZ2V0IGV4Y2x1
ZGVkIGZyb20ga2VybmVsL2NwdXRhYmxlLmMgd2hlbiA0N3ggDQppcyBzZWxlY3RlZA0KDQo+IA0K
PiBJcyB0aGVyZSBhIHByYWN0aWNhbCBkaWZmZXJlbmNlIGJldHdlZW4gNDQwIGFuZCA0NjQgd2hl
biBidWlsZGluZyBrZXJuZWxzPw0KPiBnY2Mgc2VlbXMgdG8gdHJlYXQgdGhlbSB0aGUgc2FtZSB3
YXksIHNvIG1heWJlIG9uZSBvcHRpb24gZm9yIGJvdGggaXMgZW5vdWdoDQo+IGhlcmUuDQo+IA0K
DQpJIGRvbid0IGtub3cuDQoNCkNocmlzdG9waGU=
