Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EF54AB32
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 09:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMghF3ymKz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:54:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=iNjmpl3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feab::817; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=iNjmpl3l;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn20817.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::817])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMggM0pPcz304S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 17:54:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9se3Vqwb3r/LZfTCT2SJep+p8aUq5JcbQQt3DcAwpvnJqZHdhWxG2y+/BEGKmS2jjRqbsPt7/bH7JPhKPU3mPvFojK9DlABzQbsbmsOQMLD6CXhmWip+H+/ezx+mgXJD41t3sCC0Y3v4iaMANCcpJy/5zuZXgO5jxCt5VYwck8oDKmuqj0sLnmwOYlcKZ39Ign45N2HNX5KAjF5JrqVKMVE/SBeW3b2bPoPpc5VmvL2Cr7hdeWOdIT4bJJuU5VWaClXbpmmLe2tTEY/Ifd5vp71LbI7kTLZBtPYujoZZhUq0/9KGBp98a3qRjX0fo3cL++J7JMHeySbtN8aqUc1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIgnqEkhszE4bTJhROX6YAOQDAyVeY0dxK7SE//AdsA=;
 b=FseKO9OH7jR+/OPOsSyL9Jg5z+tocaNELQ7F6zOCYhB0p/HrqFrS65jQR9FPTTn9qmY44zaRoAo5a/miG0Qo15zs6vn5o30gflCr19wQ2AD5ePtPL9zcaKx4kSEsCGy6Mhn4Nq338YAIFZ3sE70bO3G/tk4SDLbLBnSgM0LXbZhY9Nr0CfM7mQ1pEC7OkGUYBfsLM3s68rZxArENpFwVQageBugmAGYOJxXF8AockXgGD2ncv8c5XeBSrVIRmP7X285ihBs6pnIDfhNZNk9Nc/Zv0bEek6Ik2x5AnuYnGxBcGbNQbQvgDMapuFTU2PNQank88q3gwEIA9//DeKa+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIgnqEkhszE4bTJhROX6YAOQDAyVeY0dxK7SE//AdsA=;
 b=iNjmpl3lFWo1/ONOKQCVMLD+G+PkBRBxok1vNfpZCHpcXOOgAAVa4Rft6YVFjf4FoBYz/q/ktSYvU4M3eAfU8e82JRZnPsTHOA8UzuDVkPAWRsv/GL0R77Ui4cp3yWw0aNEg6WfMRQHhOncEJiclJrVveex11YqjD6WwT3w2M8xuEePhJBzsERIVDGyvQk1hJWAmqfKFcQ+wAe0zoIRw2gICstQjKkGQHvqlT4KgDuFu4m0vG9aPmHeyfTHvEC/WKretWnkVoGAlVaHTwdo+euAbaD///TcWOinV1cphtCrUXM70QyPKfm1eIXl4KacZ/X0VM0MSl6BXl0ZVHhWgow==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by SI2PR01MB4299.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 07:53:46 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 07:53:46 +0000
From: Wenhu Wang <wenhu.wang@hotmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Greg KH
	<gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Topic: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Index: AQHYf8PgfEfUKvdhvUy2TYJx5fnwTw==
Date: Tue, 14 Jun 2022 07:53:46 +0000
Message-ID:  <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
 <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
In-Reply-To: <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [iAw83C+x61mxisjYPMGb+8ykD/ombd9C]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50a287c5-5c96-486d-1424-08da4ddb02ae
x-ms-traffictypediagnostic: SI2PR01MB4299:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fYiiC/0xTfVVtpYrlYw2yfqYJTTG3urc7nEzjD5hJ79m91kdGJY6aiG2OOf74n5F2MisNTZVQB0DZCAFOtNPXxM6Ccz7BFrhLO8Fzm/P3ldBaRDQXTWesyanN46SMGe5+tZng5zAaurAo2jsyqhuv7ST6Za9bLMX5jYZxST4iwaujz7IJ1OPHMYdp48wZxwRN/mPBfplAkIiBR+YRap3H9reSQEep53LnJVb4bg0+nOPn4payOGGqTPu9pmFqRYSsW5t3KE2B1PM+Per3URoIMFc1AdF5siBzfsiQMq5eURCE702nNNnKNiauyyY47fPedLgRQ0GLDR+OJNGtf3ANPhgn3aprg/RulxH8mfCpbMasjX0Fc6MuHQBoF8pZmPZuKP69Io08O15RnG4F0KPn6dhyLSG0lAjN02MkkxNrb4bAAHx5eXkZ/cYWa1HJm9CZxiuudAQRVH9bM1xw6hLXDj0VUzuIYrL48iHaJhr1sYc2MJm2iNNY+HNChJbrEpqiV7RvO+NqlClLEopQJI05RoK3Ge46PzTn9kC7VnNKs5Lz4LYiFhzflKGFQn4sC3gBQKBiMd9T5ISQesppT1czlSsMDCc5BdjSkR2Ojb++Hk0ndb8fRHMpgrKg8DY9Bow
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?ks_c_5601-1987?B?cHZ2WVVRQlBPZGloWHBRN3NsdU1STkhBMTVlbytlNlNUSGhrNmlh?=
 =?ks_c_5601-1987?B?VEFoR3lUbnpiMWFXM1pXUXZwVFlJM21WTXo3VHRqRjJwaXlGdEQ4?=
 =?ks_c_5601-1987?B?TVI0Q2VVS3dyQWlCWDNrUEdic3pPZUdKNGlxOUZZeUR3eENUbU83?=
 =?ks_c_5601-1987?B?bjBOdXJ1SUd2UFpZQy9PL3Q4dlZkektzOW1SbnZHdi9JQWpJaEVs?=
 =?ks_c_5601-1987?B?d2JiL2FLNVV5RGx6eVppanJMS3lrKy9xNEVYakZpM0VCeUJjUnVI?=
 =?ks_c_5601-1987?B?eGIvaGk4dlhTNndFNkQrSTFTNzR0MGhieDNYYjc5NnJXdC9FQmY2?=
 =?ks_c_5601-1987?B?YXc1Mk9FR2VSN0NrbStzdGM1L3k5aVFlWStWZEV1RTVMR2owVkNm?=
 =?ks_c_5601-1987?B?aXNqVUF6aFAzYXdiOHlZK2NvbFVhUUNkRGYrN2tTTUhqQTJHd05z?=
 =?ks_c_5601-1987?B?dWROSEc2K0hxS3llcWJRWFhzNG52Umk4WU1TTW5icktia1NGZGdP?=
 =?ks_c_5601-1987?B?eG04ckdwTWxhbmtVZ2hpWThXbDFyZmpmcWhONVE0ZW94NGplRDVt?=
 =?ks_c_5601-1987?B?YVdod245YUFINXgxd1loTUJHNEFMRWM3VmErWlJhOER0YThKd2Vp?=
 =?ks_c_5601-1987?B?MlU5K1lmdGxpKzFlQk1zSzh6TDNLMGVmQ283SXEvR2IxbStERXUw?=
 =?ks_c_5601-1987?B?VXJ4SS9VVFhrWUtCdWF4Z2NIamI2M2dyTVl5WGYzOVQvdlBmZFFU?=
 =?ks_c_5601-1987?B?WG5WUnZsOXhsSW1ZSHAwZlpOSTBCakJiT3ozMENXb2NFbmRmbEJ0?=
 =?ks_c_5601-1987?B?dEkvdmpvdXhweWNqSW9PSHlDdm5Wejh0NzdYa2UzQ05BWHoxRnRw?=
 =?ks_c_5601-1987?B?YUE3RG93bmNNbytWSHlRS0thMTQvZHdmRkZ5dG1PcWtSN2FyOHkx?=
 =?ks_c_5601-1987?B?RUZXMVkrV3FDRytvY2xxOE5tTDAwNnYwQkl5NWxCbkRJUlVCN0Vh?=
 =?ks_c_5601-1987?B?VmNSRjEvaFlVODhVWVRyUnB2Vnh1Rlo0VU1UeXI3eG5rRUFENGty?=
 =?ks_c_5601-1987?B?S25Ka0dJekhlMHdkUHZoQWpvSUZPMS8vUlppMlg2T0pSdjNNM1JE?=
 =?ks_c_5601-1987?B?bXRZWGt3MnErRFJpOUpOaGVMUUVyL1hNa3RWcFI0c2UweTFTbHE3?=
 =?ks_c_5601-1987?B?a09mczhQYUo5YmZLZ0IyL1M4VTRGQlVWYjBuV2xFV2VCNFU0OHFr?=
 =?ks_c_5601-1987?B?dnM3RVBON1F4MFlQWDNJWFp1WGJxaGJQRnFPVVhRMm9EeFhYTzgw?=
 =?ks_c_5601-1987?B?L2VIdDh5Y1NnZTh4aEgya2F6Nms4bGV1MlA3RVp5Sk5jTFU2YVJ6?=
 =?ks_c_5601-1987?B?RDN4WVZoa2hLM3hjOUp4V3FaNk40dU5FMEZSMnVaY1luOTg2WDJG?=
 =?ks_c_5601-1987?B?Ymk3aUJmczkzOXMvQmsrbVNXZFU1am1hOUh1eXZOb3B5dXZ2WWNK?=
 =?ks_c_5601-1987?B?Sit5eGV5YnVGTU1LRDYvYmFNMGFKSE1GOFBpazgrb1hLdmV2cVZy?=
 =?ks_c_5601-1987?B?blozRkNvTWhFMzBZb0hTaVk3ZGtxNGhMVUpPVFl0K3R1ZzRXQWpk?=
 =?ks_c_5601-1987?B?aDBRUlBVQ2t2MEVkMWZDcmdlYlNhczVlOEhPNHFGTkJuYkJka1lV?=
 =?ks_c_5601-1987?B?UFdCODMzNnIyNFNWaEN3Mlljclh1dCt1S091dXNMK1B1NUJFWFF5?=
 =?ks_c_5601-1987?B?bk55K0wzc2xoT1VxcWJmOG1LcFJDK1BCc3ZzSlpCWkdmWHFpWVFL?=
 =?ks_c_5601-1987?B?RzBVL3JUcVl1S2hmS1NxbkpqSmkwK2djdEh1dmhmcFFBcDJJbGVv?=
 =?ks_c_5601-1987?B?MWFFbVdHb2RLR0V2ZUNPVTdaelRXYmhjMjFhd3NOQWU4TkxGZjI1?=
 =?ks_c_5601-1987?B?d0NPMHBSZ2hLQ0h5RkdYRUlNQ1hBYXorWE1OYnBNM0pLRXFZVnR3?=
 =?ks_c_5601-1987?B?UmV5RWFKNUJ3ZjFUaGpaNEp1WlFvWDZXbWJXd1JBSGlZNGlmYmpE?=
 =?ks_c_5601-1987?B?MlFpK254TlpOMDAybS9Bdmx2SnVvNjc4dEpzdUlycVpkVWthdjRO?=
 =?ks_c_5601-1987?B?dTlpK25wVU9MZWRqSXFnU1ZkVG41VG54THFud2JTVGE3dHE5ZVVP?=
 =?ks_c_5601-1987?B?R1BDenIwWnJHZS8xdXQwMGZmQm8xSDQraDJ1enNtQm5EaE9RaGcr?=
 =?ks_c_5601-1987?Q?t4VpBlfo=3D?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a287c5-5c96-486d-1424-08da4ddb02ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:53:46.4173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR01MB4299
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj4gPj4gKwo+PiA+PiArc3RydWN0IG1wYzg1eHhfbDJjdGxyIHsKPj4gPj4gKyAgICAgdTMyICAg
ICBjdGw7ICAgICAgICAgICAgLyogMHgwMDAgLSBMMiBjb250cm9sICovCj4+ID4KPj4gPldoYXQg
aXMgdGhlIGVuZGlhbiBvZiB0aGVzZSB1MzIgdmFsdWVzPyAgWW91IG1hcCB0aGVtIGRpcmVjdGx5
IHRvCj4+ID5tZW1vcnksIHNvIHRoZXkgbXVzdCBiZSBzcGVjaWZpZWQgc29tZSB3YXksIHJpZ2h0
PyAgUGxlYXNlIG1ha2UgaXQKPj4gPm9idmlvdXMgd2hhdCB0aGV5IGFyZS4KPj4gPgo+Pgo+PiBT
dXJlbHksIHRoZSB2YWx1ZXMgc2hvdWxkIGJlIHUzMiBoZXJlLCBtb2RpZmllZCBpbiB2Mgo+PiBU
aGUgY29udHJvbGxlciBpbmZvIGNvdWxkIGJlIGZvdW5kIGluCj4+ICJRb3JJUaLiIFAyMDIwIElu
dGVncmF0ZWQgUHJvY2Vzc29yIFJlZmVyZW5jZSBNYW51YWwiCj4+ICJDaGFwdGVyIDYgTDIgTG9v
ay1Bc2lkZSBDYWNoZS9TUkFNIgo+PiBTZWU6IGh0dHA6Ly9tNHVkaXQuZGluYXV6Lm9yZy9QMjAy
MFJNX3JldjAucGRmCj4KPlRoYXQncyBub3QgdGhlIGFuc3dlciB0byBteSBxdWVzdGlvbiA6KQo+
Cj5UaGVzZSBhcmUgYmlnLWVuZGlhbiwgcmlnaHQ/ICBQbGVhc2UgbWFyayB0aGVtIGFzIHN1Y2gg
YW5kIGFjY2VzcyB0aGVtCj5wcm9wZXJseSB3aXRoIHRoZSBjb3JyZWN0IGZ1bmN0aW9ucy4KClll
cywgdGhleSBhcmUgYmlnLWVkaWFuLgpEb2VzIGl0IHdvcmsgdG8gYWRkIGNvbW1lbnRzKGFib3V0
IG9yZGVyIGFuZCBhY2Nlc3MgZnVuY3Rpb25zKSBmb3IgdGhlIHN0cnVjdHVyZSBhaGVhZCBvZiBp
dKO/CkFuZCBhcHBlbmRpbmcgbGlrZSAiX2JlIiwgIl9hY2Nlc3NfYmUiIG9yICJfYmlnX2VuZGlh
biI/IChzdHJ1Y3QgbXBjODV4eF9sMmN0bHJfYmUge6GmoaZ9OwoKPlRhYnMgaW4gTGludXggYXJl
IGFsd2F5cyA4IHNwYWNlcyB3aWRlLgo+CgpJIHdpbGwgcmUtY29uZmlybSB0aGUgdjIgb2YgaWRl
bnRhdGlvbi4KCj4+Cj4+IEkgbG9va2VkIGF0IHRoYXQgcGF0Y2guCj4+Cj4+IEkgZG9uJ3QgdGhp
bmsgeW91IGNhbiBqdXN0IGRyb3AgdGhlICNpZmRlZiBpbiBmdW5jdGlvbgo+PiBfX2FjY2Vzc19y
ZW1vdGVfdm0oKSBpbiBtbS9tZW1vcnkuYwo+Pgo+PiBZb3UgaGF2ZSB0byByZXBsYWNlIGl0IHdp
dGggc29tZXRoaW5nIGxpa2U6Cj4+Cj4+ICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZF
X0lPUkVNQVBfUFJPVCkpCj4+ICAgICAgICAgIGJyZWFrOwo+Pgo+Cj4KPkFub3RoZXIgdGhpbmcg
aW4gdGhhdCBwYXRjaDoKPgo+QnkgbWFraW5nIGdlbmVyaWNfYWNjZXNzX3BoeXMoKSBhIHN0YXRp
YyBpbmxpbmUsIGl0IG1lYW5zIHRoYXQgZXZlcnl0aW1lCj55b3UgcmVmZXIgdG8gdGhlIGFkZHJl
c3Mgb2YgdGhhdCBmdW5jdGlvbiBpbiBhIHZtX29wZXJhdGlvbnNfc3RydWN0Cj5zdHJ1Y3QsIHRo
ZSBjb21waWxlciBoYXMgdG8gcHJvdmlkZSBhbiBvdXRsaW5lZCBpbnN0YW5jZSBvZiB0aGUKPmZ1
bmN0aW9uLiBJdCBtZWFucyB5b3UnbGwgbGlrZWx5IGhhdmUgc2V2ZXJhbCBpbnN0YW5jZXMgb2Yg
YQo+Z2VuZXJpY19hY2Nlc3NfcGh5cygpLgo+Cj5XaGF0IHlvdSBjb3VsZCBkbyBpbnN0ZWFkIGlz
IHRvIGFkZCB0aGUgZm9sbG93aW5nIGF0IHRoZSBzdGFydCBvZgo+Z2VuZXJpY19hY2Nlc3NfcGh5
cygpIGluIG1tL21lbW9yeS5jIDoKPgo+ICAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hB
VkVfSU9SRU1BUF9QUk9UKSkKPiAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgoKSXQgaXMgcmVh
bGx5IGEgYmV0dGVyIGNobW9jZSwgdGhhbmtzIGZvciB0aGUgYWR2aWNlLgpNdWx0aXBsZSBpbnN0
YW5jZXMgZXhpc3QgYXMgeW91IG1lbnRpb25lZCwgdGhlIGJsb2NrIHJldHVybnMgMCB3aXRoIG5v
LW9wCmluc3RhbmNlIHdoaWNoIG1ha2VzIG5vIGRpZmZlcmVuY2Ugd2l0aCB0aGUgZnVuY3Rpb24g
cmV0dXJuIHZhbHVlLgoKSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggYWZ0ZXIgYSByZS1jb25maXJt
aW5nLgoKVGhhbmtzLApXZW5odQ==
