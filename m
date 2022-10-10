Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BC5FA263
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 19:05:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmQJb4Dcpz3drn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 04:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s7muJrPv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s7muJrPv;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmQHb4KNvz3bj1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 04:04:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxvLOBnYYtvrPUP7e2HtLYAbLcLlSaue9b61Kb+9EMWD1K762qWWN6f0HoxryvHBuvTKZlsew9fq83Y++aVw0XsPLuXra6X0NLzVREGCgOqomFtzb6t6+kjFFvOurvgg4NjJWDgZ0xWO7PGY13t05EiextwEFJKoTok5k+7BLbuGqSUfPhhU0d9xTOQ0bzGOop/Uh3cEmNfV2e49IFqyO12kG4YmZNgriL9gO9ga59WnRgMKMMYKMVIOFsxfXky2/37jjmAGhzxpidZm/utwXZ77AIeRHmtEAzpz6rc2kK2VUfht59FKIWwoGvFiooXFWCyTu8/oWqi3/wpQyEiugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ0XXbbEKTvIaTw5DVDXmgqgrUowwljniYcCyrv8nog=;
 b=SArtbWFU8LBAy3oxyXGdEb4rz9bQZjjd6RXB5dWLX3WPygfH66Q57iKz6i9evTBwl5MpsG7D8HpOUBrxGTg1sRWt6hv48m752cQDQDcjzQu3KZVzoYLDsF0PWLRMzd49vbmz/xzkEI6XsCOEm3zMx1vQA/+iA95duu8U/kqxgw3itrSHN8A1q4mLLumpSVPZNuosGNrJlpqPH+NSb6jEg/YTPaHZBpJQOxoeK5bqO5LJcGi/L2RhGU/D4IXj6bx00yXX7kLa4jEcGyaloKi8t1EBUYtGys8ylZ5DiIzNbF0i4UcXT8Ljy+rjZs3mZSBZkrVTyK8ZHiEoLCYIszdQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ0XXbbEKTvIaTw5DVDXmgqgrUowwljniYcCyrv8nog=;
 b=s7muJrPvr7Qmj/dyu2cA6USwEksdCyOeu3X5Kxjt2Wd6KSAL+2l6hk/E6ElRaV9PC+gyftaFi/bSXaHZ+nMPScWlAhonT3UTOTPkiaArYJZIcpNqL91JisYsdz0tKLcpRXpQYXuiqILaNhiuI/2iXiAHRG5PmEQWnN+sGPJGkInt6neR9QWX0+eCT4joyze7d4WmD3lA/o+RJNG4/I136qhm2VkEEyyanT3NxExohhuEylmYrj0oV4W4+sc/s3tXa/WTI/1UaJFgi1Si413PXDAaUQMUeOCxB70hz/k4KlAHgPXC3V7wRnH01+958us6k19ZNX4kA8+I7+jof9wwXA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2328.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.39; Mon, 10 Oct
 2022 17:03:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 17:03:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nathan Lynch <nathanl@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Topic: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Index: AQHY2EIBh+iraNEA6UKZa+r/wPzLXq4AwrWAgAAPGgCAAfBWAIAE8XqAgAAwYIA=
Date: Mon, 10 Oct 2022 17:03:49 +0000
Message-ID: <6deea219-32c1-f5ba-4192-620f8321077d@csgroup.eu>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
 <87h70for01.fsf@mpe.ellerman.id.au> <8735bvbwgy.fsf@linux.ibm.com>
In-Reply-To: <8735bvbwgy.fsf@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2328:EE_
x-ms-office365-filtering-correlation-id: aa5667dd-430e-4b20-64c1-08daaae166d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Hyq/aZB5e656B79BIR11HTewe6hjQEXaAnhtBEfIb2rzUaTRYFoudQXJVpymHcIc9Kh2+NeSbQLX5ScQilEa+I6OoPPtW5Z4FaQJFFIJ+gd9F2IucIr6mOHbxrvmGPbxC0E4Crps0e2StP1J4Cd1NYvRj8rb2ip4eDRaHafmfcVqv23Sh2NIZrGV8MZ9qdLYjOBhaVumG5VyDui0o6Pu9tkkW+W+Qb9t1HR2KqDd9PsL63ovim+VF+ZaOcknNuk5gpL5NRq1SVUNgx36NE97JU+bRsSO6uT8qUJr/IPxqs/BeKxT15IxBSIY8NZPxcs1BoMs6KHdvhEspMbp5yd5nKN50GHj6BliMrMpdSj1qR4RZuxK1nbmBsSe9kNnwybfMttzmnHPm5dmm1ggsYKJb0nJdZGtirhzJA+DdJw4+Bkbt8VFjAYB50iK/iUi5R4hJyZTGMkK4x/DCJ2N3xgh4sfD702kaPBmvtSorkocGe9f3NtdXI+3K9qXpAN9yUan+Y6HX2NzRf1OEf5PUhdxLEWjDexGTDMHpXNxYwFcy6UWEHmP4wvsb3woHDL8GhLaRdO94r/wmdQH0HZP8YryEjrbLydEH41t2ZOoUzzP+V3q4OKBljwbGLqxT7wOLrJXdIq+UelvS6eMXXddwFuem5qAuTpxUhUyBFGBC+Ml8BTgA1voAEoI3GDvLkGUX+YWP5vnbpfZaGoU/+0i4fz9I772jXeHeqEumXR1fnmraL7KXat82EyG69dDwt2FdwocQmJfIxC9ylbToyCA9OKtyho7aodeg7UlyZL0CBoU36rDEMV2z5vA3lwmYY1BkrEnGXKgh1Dlf0uCkNohZyb9Qw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(316002)(110136005)(478600001)(31686004)(6486002)(54906003)(71200400001)(66476007)(66946007)(76116006)(66556008)(91956017)(8676002)(4326008)(64756008)(66446008)(38100700002)(26005)(83380400001)(6512007)(8936002)(6506007)(41300700001)(2906002)(5660300002)(2616005)(186003)(44832011)(36756003)(86362001)(122000001)(38070700005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L29pOGVjNGJnN1hrOC9LWlZuSXBabWV4M0xwc2ZnQ0xta011aDIwZ0hVWDRp?=
 =?utf-8?B?QVFEaU14RlFEMldHSEl6bTJ1c1hMd1FJTjE0cmtuWDF2SFpSbG4xWWU2VUZX?=
 =?utf-8?B?Z0gvMDZ2OVEvYmpoZ1ZDRmJpYURSOUwxMG5hd2JkbnVGRWVaSk91NDZzZm1E?=
 =?utf-8?B?bTh0TEVuaVdtMlFDc0JUTXp4T0dDNE9zZWNuclc0L0xucTBWNGRGM0ZUU0VP?=
 =?utf-8?B?TUZnUGc5VzhraUIxSmNSVU5hN0Y4UXZ6Y0hqSzBjNkFnaHN3eEh0MHE4MHFM?=
 =?utf-8?B?Qk9qaU4yR2F1eXFZd0EydzBDVThNL3RkcDFEK2U2RWRFaVMrd0pUV3JQV0w4?=
 =?utf-8?B?R0RkTU1QSEtYMXdacDlKMUJJdjlGR1RqUDRJUGtFN0ZKZWNKRmEyV0JNVE16?=
 =?utf-8?B?eUtjUDFpZEhQRTVXeFRSS1BqaU1USXNMQmFmL2tsZWtZaDY1YldaaW5sWU43?=
 =?utf-8?B?ZnpwK3BRNGRGMjh5dFZSbUdBQzJIcXhlTktNQWkwVU5WVmYxQkEzRElYWElv?=
 =?utf-8?B?SWpESFBjbis4QWFnSFFqMFJqSlY0K1loU1VoS3JNOXF0N2ErOWpDdGZhTk82?=
 =?utf-8?B?cEdoTFdkZ3pISkl5RGsyUEZ0Ym9QUWFmbCtjdHMvRDhqRkwwS2tPOVI3UGtQ?=
 =?utf-8?B?RGIzUFpKRlNsR253Tkh1UUVLcVk1cDlCUk4xMGVZc1lxUmpDNXRZbmRET0pa?=
 =?utf-8?B?TVlhUS82c210a1AxaXhXZkZzWWR0bXFHVmk0NkxFWmxSS1JDbVZwcDBWU1dq?=
 =?utf-8?B?cUJzMEJuZnFJcTE2QU1NK09VbTJ0ZThNNVhVeVlqcy9vWXpMc252c3BNTzkv?=
 =?utf-8?B?S01MZGtVUEc0NWVqcFlVMU8zNTFuMW03RFlFdFQvNitOVjB0c1NCVGpBeGFO?=
 =?utf-8?B?cmo2UnJHb01kUzhnSzBuT1JsVWlVbjYwU2U3WnMydC9ZSlpHNGtQaEdSNzJl?=
 =?utf-8?B?NWZQK2thQUp4eW9pUitBVUFjTE91UHdMK3lKKzExeU5BTGVadGt2NFRtQXdq?=
 =?utf-8?B?Mk9XeGFCVU1aYy9VSG51ZGxxYUFTMHpLM05jL0Zrd0d2Vmx2RnRjeE1GcmJi?=
 =?utf-8?B?WkZ0NWZiS0M4eEFRTlZYVUREMVl0c2NNVzkwWlBCQ2g4d2lqc3hNWS8yWGVu?=
 =?utf-8?B?eXZSeXlGSkdKQS9YLzlIS1JVY3p6cEpwMzNDaW1ybXIxYlhuMWpjQ25wRWZh?=
 =?utf-8?B?Q3JVdTZadmkweCtndFdQdEtkY1YxNDg2RnB5NGlhM09YM3VXRWFpTHQ4OE5U?=
 =?utf-8?B?Vk5pb3JURjhQVWNrOHo1bm1qbm1JR1BBcWpzempzS3hiR2tOWnk5WHFtZkFz?=
 =?utf-8?B?eGlvYTFJS2FuZVRTazB0MjJlTmlEZURlbktONE1KbXJwMk1HMi9tUjl4bUor?=
 =?utf-8?B?OW9ueDBBcUlnT1hDRzBhWlE1SGVONjIzQzBtRS9jeVZGWUE1UXlkREJpRkcz?=
 =?utf-8?B?dTEydXI4VHR4NloyQW1oSmpzNTdRZ0RZZVVGc0dkNWN1YytDcHFtMVBzbTdL?=
 =?utf-8?B?K3p0SzA1ZGZLVzIzQVl0cTNrMHF5MlZOUnk2bHhhZVgzQ2NzVS9OdnJWelo2?=
 =?utf-8?B?REF2ekc1bmlYWmRhb1pLc2RBSXVyU2RnSFlQdEtHQTI0dU5YNTJOUXVPUTNW?=
 =?utf-8?B?VE5ONlFEanBLQ0tpVXpkSzBja3doMzFrYTV1K0diMTI1M0VORFd1aytFNk93?=
 =?utf-8?B?Yi9YTWJIUTZvTXlXbEJXVFdjd2FEUEMvSU1uSnZ4cDlMc3lTdXJRS2RxVVY4?=
 =?utf-8?B?SldNTzArVlU2YTdub2J5dEFSQk9jUW93V0RkaFZqYUZRbGpyOXdmUFN5VSs2?=
 =?utf-8?B?T3prbWlaQi91YkFSbVFFd3hyN3oyM1NYdVJ0dUZ5ZitxMjJEZjNhTTQxN25Z?=
 =?utf-8?B?eWxxejNqbW50Z21uUVFVTVNxM2ZDaStmSEFNV0pGaGRKa1F6SklDQXdNam9W?=
 =?utf-8?B?eWkyVW9yTzV2RVcvVWo5Vng3aFQ0VnlESmhRQ1cwQVZDZE01OTdvVG9ybkVw?=
 =?utf-8?B?cFhwNFVPVjZIaHFkdGlOamdBZ1NNT0hlcitRajJHcGU4L2E2bVlEQ2J5cXRz?=
 =?utf-8?B?UzlBeVQ0WG81NTVjaVZlVmc5cDJUQjlSR2tORlJjTk9UaUVoVTQ4eEFuNUs2?=
 =?utf-8?B?RmkzMEJ1UUlUQ2VUY2l4SUtCbGw2cjZWV1NxT0dNeEhBOVFxUGE3TlBIT2pN?=
 =?utf-8?Q?YXXud0XoJwr9r8wPYKrzJJo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEAC9F90E28ECE47817708B8B41C03F0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5667dd-430e-4b20-64c1-08daaae166d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 17:03:49.5280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wn2NoOEv05oHMQ721NZDiMQni2LY++0B1Qk88fV4tU37OohaINZwwh4fRBfnkQTZKNS9bbGkU05gJpDpV1kTfgkHQHL0Qa/D7XG5ZRgtfvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2328
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzEwLzIwMjIgw6AgMTY6MTAsIE5hdGhhbiBMeW5jaCBhIMOpY3JpdMKgOg0KPiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IHdyaXRlczoNCj4+IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JpdGVzOg0KPj4+ICsgS0FT
QU4gbGlzdA0KPj4+DQo+Pj4gTGUgMDYvMTAvMjAyMiDDoCAwNjoxMCwgTWljaGFlbCBFbGxlcm1h
biBhIMOpY3JpdMKgOg0KPj4+PiBOYXRoYW4gTHluY2ggPG5hdGhhbmxAbGludXguaWJtLmNvbT4g
d3JpdGVzOg0KPj4+Pj4ga2FzYW4gaXMga25vd24gdG8gY3Jhc2ggYXQgYm9vdCBvbiBib29rM3Nf
NjQgd2l0aCBub24tcmFkaXggTU1VLiBBcw0KPj4+Pj4gbm90ZWQgaW4gY29tbWl0IDQxYjdhMzQ3
YmYxNCAoInBvd2VycGM6IEJvb2szUyA2NC1iaXQgb3V0bGluZS1vbmx5DQo+Pj4+PiBLQVNBTiBz
dXBwb3J0Iik6DQo+Pj4+Pg0KPj4+Pj4gICAgIEEga2VybmVsIHdpdGggQ09ORklHX0tBU0FOPXkg
d2lsbCBjcmFzaCBkdXJpbmcgYm9vdCBvbiBhIG1hY2hpbmUNCj4+Pj4+ICAgICB1c2luZyBIUFQg
dHJhbnNsYXRpb24gYmVjYXVzZSBub3QgYWxsIHRoZSBlbnRyeSBwb2ludHMgdG8gdGhlDQo+Pj4+
PiAgICAgZ2VuZXJpYyBLQVNBTiBjb2RlIGFyZSBwcm90ZWN0ZWQgd2l0aCBhIGNhbGwgdG8ga2Fz
YW5fYXJjaF9pc19yZWFkeSgpLg0KPj4+Pg0KPj4+PiBJIGd1ZXNzIEkgdGhvdWdodCB0aGVyZSB3
YXMgc29tZSBwbGFuIHRvIGZpeCB0aGF0Lg0KPj4+DQo+Pj4gSSB3YXMgdGhpbmtpbmcgdGhlIHNh
bWUuDQo+Pj4NCj4+PiBEbyB3ZSBoYXZlIGEgbGlzdCBvZiB0aGUgc2FpZCBlbnRyeSBwb2ludHMg
dG8gdGhlIGdlbmVyaWMgY29kZSB0aGF0IGFyZQ0KPj4+IGxhY2tpbmcgYSBjYWxsIHRvIGthc2Fu
X2FyY2hfaXNfcmVhZHkoKSA/DQo+Pj4NCj4+PiBUeXBpY2FsbHksIHRoZSBCVUcgZHVtcCBiZWxv
dyBzaG93cyB0aGF0IGthc2FuX2J5dGVfYWNjZXNzaWJsZSgpIGlzDQo+Pj4gbGFja2luZyB0aGUg
Y2hlY2suIEl0IHNob3VsZCBiZSBzdHJhaWdodCBmb3J3YXJkIHRvIGFkZA0KPj4+IGthc2FuX2Fy
Y2hfaXNfcmVhZHkoKSBjaGVjayB0byBrYXNhbl9ieXRlX2FjY2Vzc2libGUoKSwgc2hvdWxkbid0
IGl0ID8NCj4+DQo+PiBZZXMgOikNCj4+DQo+PiBBbmQgb25lIG90aGVyIHNwb3QsIGJ1dCB0aGUg
cGF0Y2ggYmVsb3cgYm9vdHMgT0sgZm9yIG1lLiBJJ2xsIGxlYXZlIGl0DQo+PiBydW5uaW5nIGZv
ciBhIHdoaWxlIGp1c3QgaW4gY2FzZSB0aGVyZSdzIGEgcGF0aCBJJ3ZlIG1pc3NlZC4NCj4gDQo+
IEl0IHdvcmtzIGZvciBtZSB0b28sIHRoYW5rcyAocDggcHNlcmllcyBxZW11KS4NCj4gDQo+IFRo
aXMgYXZvaWRzIHRoZSBib290LXRpbWUgb29wcywgYnV0IGthc2FuIHJlbWFpbnMgdW5pbXBsZW1l
bnRlZCBmb3IgaGFzaA0KPiBtbXUuIFJhaXNpbmcgdGhlIHF1ZXN0aW9uOiB3aXRoIHRoZSB0cml2
aWFsIGNyYXNoZXMgYWRkcmVzc2VkLCBpcyB0aGUNCj4gY3VycmVudCBtZXNzYWdlICgnS0FTQU4g
bm90IGVuYWJsZWQgYXMgaXQgcmVxdWlyZXMgcmFkaXghJykgc3VmZmljaWVudA0KPiB0byBub3Rp
ZnkgZGV2ZWxvcGVycyAoc3VjaCBhcyBtZSwgYSB3ZWVrIGFnbykgd2hvIG1lYW4gdG8gdXNlIGth
c2FuIG9uIGENCj4gYm9vazNzIHBsYXRmb3JtLCB1bmF3YXJlIHRoYXQgaXQncyByYWRpeC1vbmx5
PyBXb3VsZCBhIFdBUk4gb3Igc29tZXRoaW5nDQo+IG1vcmUgcHJvbWluZW50IHN0aWxsIGJlIGp1
c3RpZmllZD8NCj4gDQo+IEkgZ3Vlc3MgcGVvcGxlIHdpbGwgZmlndXJlIGl0IG91dCBhcyBzb29u
IGFzIHRoZXkgdGhpbmsgdG8gc2VhcmNoIHRoZQ0KPiBrZXJuZWwgbG9nIGZvciAnS0FTQU4nLi4u
DQoNCkkgZG9uJ3QgdGhpbmsgdGhlIGJpZyBoYW1tZXIgV0FSTiB3b3VsZCBiZSBqdXN0aWZpZWQu
DQpXQVJOIGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgb25seSB3aXRoIHVuZXhwZWN0ZWQgY29uZGl0
aW9ucy4NCg0KS0FTQU4gbm90IHdvcmtpbmcgd2l0aCBoYXNoLU1NVSBpcyBleHBlY3RlZC4gQSBw
cl93YXJuKCkgc2hvdWxkIGJlIGVub3VnaC4NCg0KU29tZW9uZSB3aG8gaGFzIGEga2VybmVsIHdp
dGggS0FTQU4gYnVpbHQgaW4gYnV0IHdobyBpcyBub3QgaW50ZXJlc3RlZCANCmJ5IEtBU0FOIGFu
ZCB3aG8gaXMgYm9vdGluZyBpdCBvbmUgYSBIQVNILU1NVSB3aWxsIGJlIHRlcnJpZmllZCBieSBh
IFdBUk4u
