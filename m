Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC3558C5D1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 11:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1WWl4yn1z2x9J
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 19:44:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FcI+Xnbq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FcI+Xnbq;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1WVz3nDFz2xrR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 19:44:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZpyLzQhOq2EWG8FfmQUIlrAZdzbu/Bg4kfnxjHNlvsbEqkHzIyhLYPcGQVnhGif5kM/Jr0OOdLoSMx7EYv5Cd79Cf7Ev9t1DCPio1Nr0eV0I50mlw+PEFU7sc5g5CYW28Ke833Sn06RCvPdI3jZw/B+nY8ZBqQOi4wR0shLAiUsGXoasdoATtxVUSiiEdmW+eMt+P3Q/yeI8OqRXEQGdTxofFqVeAng5mAFrlZG/VXPIlQXqFTaWO43EO66Rh/2tcubXcEQpFQvWRaghHErjcU3iDFVYgl2Z1lcRtZlDoTu0x8kFpVpqqjOe/xE8XwMVNF9/K2v8e8HuXBB9rIZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXWub60fFWdltsKZGdsigQXpM3Bpjz6zGBT2nSMlDvk=;
 b=Ti1Nrom2boT6porIhM+bgZ+qbInjiG/pwnwJ0cUmbj7zV7ZDHahs5IZjiUeKb1dG0cjNKQjKwg+8WwH0fANa3KVuVYFVSGyXxUu1raBZVUfXFe9DHb/JxrgpJdNazfZqeNF3T5XmSD+nnbNaxmh7Fb1yoVwpMPHgXHCJWv24piw8joFZ4lww/S1Wr8yMaIrBKoWcsStQDe6CiJovTccsaF1ecMF1q/lEJ1B87MZM7tFj0iOeNEYVbNi32LytchjKIYC6aFM24+i53VPCd6GqhHOTzbm3W6KlRm6LNUruy50p911YtYR0PLxd9VuxEj3q7yIv4K9qsTiaLA2ElnaKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXWub60fFWdltsKZGdsigQXpM3Bpjz6zGBT2nSMlDvk=;
 b=FcI+XnbqP3cUpL9elLFBAeZIhWuWSTT0tWQQ9iWWpBPx6D2rR3UWWqPlMqSh0zGCJExR0C2enPfQz+BuOpZdw1iAq5rw/1mnG8PaU7QkuB2muxPfbOGXqs+6It9Xe0RI/Z8UPaO89X389yAl3pJXGHhNuElC1LFtNZLvRfxzdXDFvesOccxArVvn08Hpy1Smy+Qpip5XhGY8mAWhggLa7aFkRU1kVaYG7Y34WihLI5rTpAzVC5LXPd1XOcWFUheDgjmI4K+a5SYQuq+q6R183UoVT1PQeFIwW71tJWybehN6KcJ36lDfdCWYlwcC2SOCDIi+0lGQdEvwG7WokNN5+w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1562.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:43:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:43:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 03/14] powerpc: Remove direct call to mmap2 syscall
 handlers
Thread-Topic: [PATCH v2 03/14] powerpc: Remove direct call to mmap2 syscall
 handlers
Thread-Index: AQHYn++EG4yxwJNYTUSETWwT/4mJMa2k1toA
Date: Mon, 8 Aug 2022 09:43:50 +0000
Message-ID: <6a1d6543-19bd-2a3a-f65b-10a7c3457087@csgroup.eu>
References: <20220725062558.118793-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725062558.118793-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64b5fe7a-7f28-4a16-72db-08da79227fd6
x-ms-traffictypediagnostic: PR0P264MB1562:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qAHLNrINPH+KYLwh0ou0ZwVRcJA0uxTnh6e0i3sZ3ONSoRxLVot4XaspBw+wkJglLHkK8OnJSDFPByX6xyugHj7omF0iREx7xbMmSTEdI74lXucyf94ba07e6nI2B9a+6jgs0uieZu3zlVCivDy48yQLVGNXa8wWztR50Lrb/7NVKA9tSGBvvfIsRxezee3O68Var9qs5xYLBY9rafbSDELmgvwQBr46noII3alg1eDpJTUDeVHIn/NA2i2eqFYGm9msrFkNKDOxRXhsY7s+G6Ymlibf/Tv2tBBe+C+Kg0hxdFZMbShOYptDkK/m5PQE4hYnDk/HAWN0TTptSrzq9F2UGEK8As6xwxhy6MM5R3fPsxb/hUxoAYMNTaPgmETrgPmYfz9r3s8F8WS2knoqcC3Dp6wTj8K0pTJ/ZIFCWALvFsuKbgNQY4zz8dnCcmlh9UTy5cqxGJYn9hivrdr3m2pzvTxvmjAn9JOthY4Ihmghq1UTWgbq0BpbzxKZaLlJ0JW2i1RIsWqSDuSCYt0ZEJona7vkGE5+m6+fWY5pSrzQBp4CtPq8h/Oqd2ESCY4WISSc8ttDbTG/Z02XX9vPVRBRl5lyFeXwNGWx1zo7BziWTgyK/SzXeeCcTfxoXJAK9I7SjynUg02nfxocrQ3Yv+4OK5R1GtdsL2xL/5O/zhoD2oWgRuh+Ffd5UzuOlQPRJEfZBd76LWu495melv6ImcL295Vj6EZOUE+6Us5krG1v0CFdpkty7DyjoxCxpnHQfJ+CWiskX0RZS6Xxrc8XWX5RQPpHW5X/x8eoIyGokb34yIBqbEs3GPAQAXR8uXlmbS62qNuYFwgAKyV7AgHIdH6fwrTwsWIFdsYSXItHbyGIATwaOEKeLSbZ+ejUYAT7
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(39850400004)(366004)(346002)(2906002)(38070700005)(6512007)(26005)(41300700001)(6506007)(83380400001)(38100700002)(2616005)(122000001)(186003)(6486002)(478600001)(91956017)(71200400001)(4326008)(36756003)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(8936002)(31686004)(66946007)(86362001)(110136005)(44832011)(316002)(5660300002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YllXU2FyQ3A5SEs4SE5ub2g1eXdoUnNuakNmV1NER1cwdWxzUXFNUjNuOFdt?=
 =?utf-8?B?RFE4a2ZqQldwTmgzbEFCMUhXbjlJUTg0UVJ2eTVkdzU1RnNLamQ3ZlZVMlJL?=
 =?utf-8?B?NDdYNnNHNGlMelBUenVVN0dqaTVkejZFTWtOSnloQVFhY2h1WkJEblcwdS9B?=
 =?utf-8?B?QzJ0Tk5ZSmU4RlJ5dlFxU3V2Q1VjWXVGNjc1Q09SYnZ6QW9tWFYyQXZxVWNy?=
 =?utf-8?B?OHNqa2hPciswWlhTblFNa2ZTcXRIYzBQeFA1Q3hkV09uSVVtL1lMbDdIcnNZ?=
 =?utf-8?B?MW9Pd0t5NmR2b3V6SitpUU5kbGlENnlOTytnQW1yWEJhcGMrWEVNSWJFZkVk?=
 =?utf-8?B?YklUTHBwK1U2dHFGNDM2bzJnQkxKTTFEL2FianJLOVUzZ0VFTjAwckdUR0g2?=
 =?utf-8?B?V3pvVS92VThudmxoNFlIOThmUFNaZFJmaDI3a2JnTml5bUlCdkpCdGxuUnBQ?=
 =?utf-8?B?Y2RUNE80dFpOMDBuK0x2aWNPWk1iakhwejB0UnlFSjgzMXFWSmt6R0VsbzRP?=
 =?utf-8?B?S1g3UjFKdlZyRFFpdXlqZlkxWndTT05kU0xNVW1oVzUyQXQ2NWZ5K1kwRmc1?=
 =?utf-8?B?am1hK2UySkdBY3k4RWRWeVJLdlNkajVMKzk3TVJkd1FST2V5MG50OXV3WHRJ?=
 =?utf-8?B?RlkxWUxHeDY1QkdXdDh3clFrZU1lRndsWkgyTmpuWGlVbnBXb3doazVLeVA0?=
 =?utf-8?B?L200anJwN3k5RkpQNzhkaVhJR042WllBVm5zaEREMzA3Vnd3dFRnbW1RQzRY?=
 =?utf-8?B?Ky9RY293ZTBZblJoOUNsWjdGSmROUklpcXByMVJSKzdZWXhwZE1kL05mYWw3?=
 =?utf-8?B?Q2xZSGNFLzJhUVRpZHR2aC9oWkRKVmVTYXZpSmtxTlNsOStVVUxFUVN0MGR6?=
 =?utf-8?B?ZS9DRTBpUDVOOUhtamkyK1JCaUZlRHRPa0QxYWdPWUUzVjFrN2MzM0VuYlJS?=
 =?utf-8?B?VlEzQ3M1dlIxMW1pSGJ0Y0FMYnduTkVvOW1CdjBSK0E0SDhpZzlJM0p1VWNE?=
 =?utf-8?B?Q3hlKzU4emJNMm1UcUltcW1ydkxVM0lOamkwUmt4VFNqWnYyYnJNdWlCQ3pG?=
 =?utf-8?B?N280M3ZWS0djZ21yV1p2Tmxra0E2dWZacEFIaFpMcmp4TzVFUXZKUms1Yml5?=
 =?utf-8?B?RHNnN3Examk1Sk1nR2lNenlwSklGbC9kTUtPOTJvaG9JSStEcTR5TmlTdHhE?=
 =?utf-8?B?OGdkdGl4QzRsY0VmeHFKelJyYzRyS1VUcEkwVHcyTFNDY0t5TzVLQmJJaFVi?=
 =?utf-8?B?MnpUeVo1TFZxaVRSR214Um5kd29adFlZT21laklWVThFU1FaOEZqRG5rRWdW?=
 =?utf-8?B?Y1JjazV0S3hKczc2S3FpRWpaVHNhSDIrNWZHY1NTQndMY3FWVmRzR1FPamVN?=
 =?utf-8?B?RjNCNUkzaWlPS21ZZEE0OHFvS3Z0VG1zTGhrdmFLR1VzaEdvWTllV2pIQU9S?=
 =?utf-8?B?MDZLYitYRklMRmhVUDVhOS9vU2hTOGpJTHM0MmdJMDh5cktaVkNhbVJlR3Zo?=
 =?utf-8?B?dUFmU1J6aUlRS1Y2MTRua1doYkJsTm5iSGlqaVNQSXN1eWFoRDVGQnBJRFkv?=
 =?utf-8?B?Y0NyUFBLdzdQUTZNTkFPNmNVeGRhdWtQWTQxR3grcHJVUVY5cWhnQSt1aEJ4?=
 =?utf-8?B?bzcvWUtIZ0U0YURmaTR6dno0UHA1UlcwVTdZci9VM0lRMG9iRENsMEcrdkt3?=
 =?utf-8?B?dnpzS3RxcDA0aDFrdGc5U1JrK0IwdnBaRXRJa2dzZlU2c1hlRGFwdkhwZTZa?=
 =?utf-8?B?NE5KUWNtY0FsVm84Vm9rb3lZK29wN2RYcGNsbkd5QndEbnNaRW9NdG80NjJ2?=
 =?utf-8?B?QStWZ3NLNXdWR0pacGhEd0QyTWo5bjZiTHpNUlI2T2dOdjB4YjNkMkVBYVkz?=
 =?utf-8?B?NXZnTEpjSm8rR0dQc3dkZlUzYnJPRkxQV2YxYnBOa2V5SE8xY000Nk53QnJE?=
 =?utf-8?B?YVpzL284dTZ6c3dUTU8vU3l1UHZ3NzZUOGRwa1VkQTRNTnVmRXd4c3JReUcx?=
 =?utf-8?B?bEdvS2Nrdzk3ZHV6cmR0SkFaMkJ4QmxpNzhMc3FRNG5zZVhuYW1EOFZya0xo?=
 =?utf-8?B?b21Ra2ROK0x5M0RGT3l6NG5uWjJWcitnSUV4T2U3VFpSOW5LWFRjK2t6THBs?=
 =?utf-8?B?VU1jZUkvVmhzQUwwMjA4WGVFZ2Z6MDdoNW5EbG9LZDBJQVJHWFpvZFVVVzU4?=
 =?utf-8?Q?p9DGb19B3k0S1tyiEcwbdes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F33672066015848A82F2B3E495FE508@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b5fe7a-7f28-4a16-72db-08da79227fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 09:43:50.6486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAB2DPZPil2+EsPu/T2w44fJgmX2CpccD5nszPVV+7dgZyCbAFwsdmacDQp/pURMeqviPlQkmD+kSe8mJn0/Cf7JcXosM78fk/q/lLCUNEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1562
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

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MjUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
eXNjYWxsIGhhbmRsZXJzIHNob3VsZCBub3QgYmUgaW52b2tlZCBpbnRlcm5hbGx5IGJ5IHRoZWly
IHN5bWJvbCBuYW1lcywNCj4gYXMgdGhlc2Ugc3ltYm9scyBkZWZpbmVkIGJ5IHRoZSBhcmNoaXRl
Y3R1cmUtZGVmaW5lZCBTWVNDQUxMX0RFRklORQ0KPiBtYWNyby4gTW92ZSB0aGUgY29tcGF0aWJp
bGl0eSBzeXNjYWxsIGRlZmluaXRpb24gZm9yIG1tYXAyIHRvDQo+IHN5c2NhbGxzLmMsIHNvIHRo
YXQgYWxsIG1tYXAgaW1wbGVtZW50YXRpb25zIGNhbiBzaGFyZSBhbiBpbmxpbmUgaGVscGVyDQo+
IGZ1bmN0aW9uLCBhcyBpcyBkb25lIHdpdGggdGhlIHBlcnNvbmFsaXR5IGhhbmRsZXJzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+
IC0tLQ0KPiBWMSAtPiBWMjogTW92ZSBtbWFwMiBjb21wYXQgaW1wbGVtZW50YXRpb24gdG8gYXNt
L2tlcm5lbC9zeXNjYWxscy5jLg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3N5c19w
cGMzMi5jICAgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3N5c2NhbGxzLmMgICAgICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKysr
DQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibCAgICAgICAgICAg
fCAgMiArLQ0KPiAgIHRvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2VudHJ5L3N5c2NhbGxzL3N5c2Nh
bGwudGJsIHwgIDQgKystLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9z
eXNfcHBjMzIuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzX3BwYzMyLmMNCj4gaW5kZXggYzM0
OTBhZGNiMTU4Li44OWU4YzQ3OGZkNmEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvc3lzX3BwYzMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNfcHBjMzIuYw0K
PiBAQCAtMjUsNyArMjUsNiBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9wb2xsLmg+DQo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3BlcnNvbmFsaXR5Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N0YXQuaD4N
Cj4gLSNpbmNsdWRlIDxsaW51eC9tbWFuLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2luLmg+DQo+
ICAgI2luY2x1ZGUgPGxpbnV4L3N5c2NhbGxzLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3VuaXN0
ZC5oPg0KPiBAQCAtNDgsMTUgKzQ3LDYgQEANCj4gICAjaW5jbHVkZSA8YXNtL3N5c2NhbGxzLmg+
DQo+ICAgI2luY2x1ZGUgPGFzbS9zd2l0Y2hfdG8uaD4NCj4gICANCj4gLUNPTVBBVF9TWVNDQUxM
X0RFRklORTYobW1hcDIsDQo+IC0JCSAgICAgICB1bnNpZ25lZCBsb25nLCBhZGRyLCBzaXplX3Qs
IGxlbiwNCj4gLQkJICAgICAgIHVuc2lnbmVkIGxvbmcsIHByb3QsIHVuc2lnbmVkIGxvbmcsIGZs
YWdzLA0KPiAtCQkgICAgICAgdW5zaWduZWQgbG9uZywgZmQsIHVuc2lnbmVkIGxvbmcsIHBnb2Zm
KQ0KPiAtew0KPiAtCS8qIFRoaXMgc2hvdWxkIHJlbWFpbiAxMiBldmVuIGlmIFBBR0VfU0laRSBj
aGFuZ2VzICovDQo+IC0JcmV0dXJuIHN5c19tbWFwKGFkZHIsIGxlbiwgcHJvdCwgZmxhZ3MsIGZk
LCBwZ29mZiA8PCAxMik7DQo+IC19DQo+IC0NCj4gICAvKg0KPiAgICAqIGxvbmcgbG9uZyBtdW5n
aW5nOg0KPiAgICAqIFRoZSAzMiBiaXQgQUJJIHBhc3NlcyBsb25nIGxvbmdzIGluIGFuIG9kZCBl
dmVuIHJlZ2lzdGVyIHBhaXIuDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3N5
c2NhbGxzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzLmMNCj4gaW5kZXggMjI3NTU1
MDJhZmMwLi45ZjMzOWJjYjQzM2QgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
c3lzY2FsbHMuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzLmMNCj4gQEAg
LTU2LDYgKzU2LDE3IEBAIFNZU0NBTExfREVGSU5FNihtbWFwMiwgdW5zaWduZWQgbG9uZywgYWRk
ciwgc2l6ZV90LCBsZW4sDQo+ICAgCXJldHVybiBkb19tbWFwMihhZGRyLCBsZW4sIHByb3QsIGZs
YWdzLCBmZCwgcGdvZmYsIFBBR0VfU0hJRlQtMTIpOw0KPiAgIH0NCj4gICANCj4gKyNpZmRlZiBD
T05GSUdfQ09NUEFUDQo+ICtDT01QQVRfU1lTQ0FMTF9ERUZJTkU2KG1tYXAyLA0KPiArCQkgICAg
ICAgdW5zaWduZWQgbG9uZywgYWRkciwgc2l6ZV90LCBsZW4sDQo+ICsJCSAgICAgICB1bnNpZ25l
ZCBsb25nLCBwcm90LCB1bnNpZ25lZCBsb25nLCBmbGFncywNCj4gKwkJICAgICAgIHVuc2lnbmVk
IGxvbmcsIGZkLCB1bnNpZ25lZCBsb25nLCBwZ29mZikNCj4gK3sNCj4gKwkvKiBUaGlzIHNob3Vs
ZCByZW1haW4gMTIgZXZlbiBpZiBQQUdFX1NJWkUgY2hhbmdlcyAqLw0KPiArCXJldHVybiBkb19t
bWFwMihhZGRyLCBsZW4sIHByb3QsIGZsYWdzLCBmZCwgcGdvZmYgPDwgMTIsIFBBR0VfU0hJRlQt
MTIpOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4gICBTWVNDQUxMX0RFRklORTYobW1hcCwgdW5z
aWduZWQgbG9uZywgYWRkciwgc2l6ZV90LCBsZW4sDQo+ICAgCQl1bnNpZ25lZCBsb25nLCBwcm90
LCB1bnNpZ25lZCBsb25nLCBmbGFncywNCj4gICAJCXVuc2lnbmVkIGxvbmcsIGZkLCBvZmZfdCwg
b2Zmc2V0KQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNj
YWxsLnRibCBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gaW5k
ZXggNTRiYjU4MzQ3ODVmLi41OWQ5MjU5ZGZiYjUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9zeXNjYWxscy9zeXNjYWxsLnRibA0KPiBAQCAtMjQzLDcgKzI0Myw3IEBADQo+ICAgMTg5CW5v
c3B1CXZmb3JrCQkJCXN5c192Zm9yaw0KPiAgIDE5MAljb21tb24JdWdldHJsaW1pdAkJCXN5c19n
ZXRybGltaXQJCQljb21wYXRfc3lzX2dldHJsaW1pdA0KPiAgIDE5MQljb21tb24JcmVhZGFoZWFk
CQkJc3lzX3JlYWRhaGVhZAkJCWNvbXBhdF9zeXNfcHBjX3JlYWRhaGVhZA0KPiAtMTkyCTMyCW1t
YXAyCQkJCXN5c19tbWFwMgkJCWNvbXBhdF9zeXNfcHBjX21tYXAyDQo+ICsxOTIJMzIJbW1hcDIJ
CQkJc3lzX21tYXAyCQkJY29tcGF0X3N5c19tbWFwMg0KDQpXaHkgYSBuYW1lIGNoYW5nZSBoZXJl
IHdoZW4gdGhlIGZ1bmN0aW9uIGlzIGp1c3QgbW92ZSBmcm9tIG9uZSBDIGZpbGUgdG8gDQphbm90
aGVyIHdpdGhvdXQgYW55IG5hbWUgY2hhbmdlID8NCg0KVGhpcyBsb29rIGxpa2UgdGhlIHJldmVy
c2Ugb2Ygd2hhdCB3YXMgZG9uZSBpbiBwYXRjaCAxLiBDb3VsZCB0aGF0IA0KY2hhbmdlIGdvIHVw
IGZyb250IHNvIHRoYXQgcGF0Y2ggMSBkb2Vzbid0IG5lZWQgYSBjaGFuZ2UgYXQgYWxsIGluIHRo
ZSANCnRhYmxlID8NCg0KPiAgIDE5MwkzMgl0cnVuY2F0ZTY0CQkJc3lzX3RydW5jYXRlNjQJCQlj
b21wYXRfc3lzX3BwY190cnVuY2F0ZTY0DQo+ICAgMTk0CTMyCWZ0cnVuY2F0ZTY0CQkJc3lzX2Z0
cnVuY2F0ZTY0CQkJY29tcGF0X3N5c19wcGNfZnRydW5jYXRlNjQNCj4gICAxOTUJMzIJc3RhdDY0
CQkJCXN5c19zdGF0NjQNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2Vu
dHJ5L3N5c2NhbGxzL3N5c2NhbGwudGJsIGIvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvZW50cnkv
c3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gaW5kZXggNTRiYjU4MzQ3ODVmLi40MzcwNjZmNWM0YjIg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2VudHJ5L3N5c2NhbGxzL3N5
c2NhbGwudGJsDQo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9wb3dlcnBjL2VudHJ5L3N5c2NhbGxz
L3N5c2NhbGwudGJsDQo+IEBAIC0yNDMsNyArMjQzLDcgQEANCj4gICAxODkJbm9zcHUJdmZvcmsJ
CQkJc3lzX3Zmb3JrDQo+ICAgMTkwCWNvbW1vbgl1Z2V0cmxpbWl0CQkJc3lzX2dldHJsaW1pdAkJ
CWNvbXBhdF9zeXNfZ2V0cmxpbWl0DQo+ICAgMTkxCWNvbW1vbglyZWFkYWhlYWQJCQlzeXNfcmVh
ZGFoZWFkCQkJY29tcGF0X3N5c19wcGNfcmVhZGFoZWFkDQo+IC0xOTIJMzIJbW1hcDIJCQkJc3lz
X21tYXAyCQkJY29tcGF0X3N5c19wcGNfbW1hcDINCj4gKzE5MgkzMgltbWFwMgkJCQlzeXNfbW1h
cDIJCQljb21wYXRfc3lzX21tYXAyDQo+ICAgMTkzCTMyCXRydW5jYXRlNjQJCQlzeXNfdHJ1bmNh
dGU2NAkJCWNvbXBhdF9zeXNfcHBjX3RydW5jYXRlNjQNCj4gICAxOTQJMzIJZnRydW5jYXRlNjQJ
CQlzeXNfZnRydW5jYXRlNjQJCQljb21wYXRfc3lzX3BwY19mdHJ1bmNhdGU2NA0KPiAgIDE5NQkz
MglzdGF0NjQJCQkJc3lzX3N0YXQ2NA0KPiBAQCAtMzkxLDcgKzM5MSw3IEBADQo+ICAgMzA2CWNv
bW1vbgl0aW1lcmZkX2NyZWF0ZQkJCXN5c190aW1lcmZkX2NyZWF0ZQ0KPiAgIDMwNwljb21tb24J
ZXZlbnRmZAkJCQlzeXNfZXZlbnRmZA0KPiAgIDMwOAljb21tb24Jc3luY19maWxlX3JhbmdlMgkJ
c3lzX3N5bmNfZmlsZV9yYW5nZTIJCWNvbXBhdF9zeXNfcHBjX3N5bmNfZmlsZV9yYW5nZTINCj4g
LTMwOQlub3NwdQlmYWxsb2NhdGUJCQlzeXNfZmFsbG9jYXRlCQkJY29tcGF0X3N5c19wcGNfZmFs
bG9jYXRlDQo+ICszMDkJbm9zcHUJZmFsbG9jYXRlCQkJc3lzX2ZhbGxvY2F0ZQkJCWNvbXBhdF9z
eXNfZmFsbG9jYXRlDQoNCldoeSB0aGlzIG5hbWUgY2hhbmdlID8NCg0KDQo+ICAgMzEwCW5vc3B1
CXN1YnBhZ2VfcHJvdAkJCXN5c19zdWJwYWdlX3Byb3QNCj4gICAzMTEJMzIJdGltZXJmZF9zZXR0
aW1lCQkJc3lzX3RpbWVyZmRfc2V0dGltZTMyDQo+ICAgMzExCTY0CXRpbWVyZmRfc2V0dGltZQkJ
CXN5c190aW1lcmZkX3NldHRpbWU=
