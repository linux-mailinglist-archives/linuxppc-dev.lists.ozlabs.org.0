Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8B5E9EAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbdlG5CyHz3bXn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=N8ecbvvp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=N8ecbvvp;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdkZ5214z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 20:08:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwXtgSpDHcEUYCUkpU2/KZ24SSnJnhPeccefvHGmekdJoQNMBLrBSolkRId39yw3IqsAHRFl5xHnHXFFWvOsUWJYEMASoGPml9LJgRmRASfKkWPYkFtr5H+jR7qYLyowOwHWHtYQBJY+282bgRwLkAXnXfeedfSXJ6UoP1nFPrEPmCITBkFvHSOypOo28CLFuaYkMB7PAgrAs0oJCrttBwUvBdOv5p4pyprpmGrG6NqdS5il5roq0mmJTw8/czHEch9ap9MYKtTy/lFNAH2qRLvbzXp4ye/d8WF2pHIndRKKaQxoPCVO2m20KkP18vhhfX1enUM8xU5ZPOcsow0Viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2bANFch3nr6g2Lz1/eydDU2dqy2FMZmkrJT0bIcSzE=;
 b=WMmHAK5kIHGzFSYNt2XvDOWWdMfPcjzqEMkNF3DnYcmIrbcxweCBh2F+nHn+iIKyAAskQWRltcqxq1VoEps8pyeWJeAz++ZtvfOrIpxnHi32cEZISSVexj7MXjMnfvgqvVFFsgbgOPDuHgjeGm5IvhOtTLgnKYQkPKI1vHekRZ3dBm/hrz9yRszcpz4257HAqVR14GlDz44v7XeP0oIIPh3GwBh4B1YACMOxF+Q7Jih2rw8cc3B2yLJbe1qIvPmVC+mtbm+hC65mSo4MqVeGIiZpfRXXRyUl3cmilIqFj/yvvkti8FqwaRVqutR4i7nZzBefWrUNYrQIfkmvVHp2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2bANFch3nr6g2Lz1/eydDU2dqy2FMZmkrJT0bIcSzE=;
 b=N8ecbvvpIvk+ooT0tgil0SPNHe6wF8FAqpVqfR7YiF/JPfAWuuC4aFatxvqeKKDpMrhOwtlqUEai1lcX161ZfdFdLxRiHgswekH2AVzI8bGMHoBWMNcYzXBby3jTsTBig+XpYIwIhQiHmqxJ2tLHZI5db7VzqCDtgKFdLer5m01OCsQQ44E4Swz2Mnrp+BU4fl/ZvgRW3RMFwHo+PZyUwiHJf6v7HcEQ3I1lr2sY/SDw7NnB9faAvj9kmQQDR9meUY8QU/+Xr9zdhCIRb5dcVhRBxJLhD5mo61LPaJv+n5B4Oj7DNrIqVwqWAObDesUq9lbVv7CZkJ3t79MtjPTg9Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1606.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.18; Mon, 26 Sep 2022 10:08:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 10:08:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Sinan Akman
	<sinan@writeme.com>
Subject: Re: [PATCH 6/7] powerpc/85xx: p2020: Enable boards by new config
 option CONFIG_P2020
Thread-Topic: [PATCH 6/7] powerpc/85xx: p2020: Enable boards by new config
 option CONFIG_P2020
Thread-Index: AQHYtABFhnxYWDlpKE6w3rkHFRGr4q3xt8sA
Date: Mon, 26 Sep 2022 10:08:19 +0000
Message-ID: <872fa228-1fbb-1723-4b28-c130368e99f7@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-7-pali@kernel.org>
In-Reply-To: <20220819191557.28116-7-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1606:EE_
x-ms-office365-filtering-correlation-id: d36d7835-a712-4f82-5ab8-08da9fa7097e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  h1b5kXL4f5p6PniVM+Ppfv5ve5OVrBCDJl6Wy/x29xBYKF5iS+j6n6NwHWe0FR323DKUGeI5b0kLbtal6ymnXJqsKarDTWoQASqumTDvRPvIAt4Ro4NC4d0gEIcuXNmH/UxFFL0jyM0O0RUKxOvtvM9fGWJrPoWIdZmipjdElszOxB8iMwLpjm6ojSldt1niQ39TtOc9xKFqQlI3MGHlciwQzSDLK7pnHDGTywfduDWMQz8rrgffG9pc9x5QcVkdNCdkPZphfC7nD1dUWpF76giQRyHJaYJsAszzgu9Sh3c2dd2R2g1EcXMwqLXBeOH/c9th8Z2ne7OFSGmpdw8ZYLdqYnrsgLSVpoj1FTvIj+TL35LVcFZluS+/ipJcyZRGLmz+cFKsLk8Rpm12ikmMTzvqU7RjJikeZJLpClV9n3xXlmqA5Jc/9kgyZ/2ZGWog/nmV/1oezkwj4zS+HY5TYqztCSINdrJM/t4JPwn46S4VXlX2+iCugixETXzYEdXtXrQApn3KZtwNCMbZz40w0ppSxQ4Uzfn5Crc07W2B8S414B7cwWMDjPZELHQYUQzghUHJlSevzInSxxhe4i3xQrLgZuQVz4LE23MbVnPMH/t+fm3MD4EFt8IhQflQJaeLhj+v+Pn7aH7w94gyx8fL9Tj0R6BmQ6nNJyaOQFrbGqXqNZw3kFg5cehlZxj/N1QMBQDkl0FZlNdYE+Tl/Y5mtstjXWyvl+0BXqhlsAC6n7kwlaIKa1Qf4ejt6dVTwFj2Wa5fRa5Bv4ZOIxsD+ZYUKePk99K24qlZBI6+l7M3DRWbYLBowl+uERxHxJl9uHKsuMXRJ+QmFrW6RxgsFnANiw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199015)(71200400001)(8676002)(83380400001)(186003)(31686004)(2616005)(66574015)(86362001)(38100700002)(316002)(8936002)(26005)(6512007)(6506007)(91956017)(5660300002)(478600001)(2906002)(38070700005)(76116006)(31696002)(66446008)(66556008)(64756008)(66476007)(110136005)(4326008)(66946007)(54906003)(6486002)(44832011)(36756003)(122000001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NEZ0Vk8xVE1WQWRLWW9LTFMzeFR3RmZvQkVyL0dnOVo2REl1bHFYZFdHeCtH?=
 =?utf-8?B?QlJDWlNrZWNwYmV3aG1QNDZ2dmg5b2pwaUM5OG11NFg2K3prWkpTZlZobzVw?=
 =?utf-8?B?dWo2MXRDckFPekIvb1cxNDlCTHE1eVpXT1VJdXZQb2JjU3FxWVIrUmNxUlg3?=
 =?utf-8?B?YkRPenJneE9wTGljamNEazdyUGh0c3dZV09zTGV5eG1wSmNaaENoMDVmeUo2?=
 =?utf-8?B?TnpCRWpad3Rsdi9yVFMrZHVhNFRxTEJCUzRuT3NsY2dRelhqMjdRTWg0NThL?=
 =?utf-8?B?bnplOGlyenAyb0FadnpvZ0xxQURacXRtbEh2T1RhR090bWZjNUx5bnQ1VmRs?=
 =?utf-8?B?clRwNjZhVVU1dXVZbG1JSEt4VFYrb1N0MXpYOHdTbFNIOVQ0U3ZqOW9DdXZY?=
 =?utf-8?B?WldTYlhJaGhTK2xFNmZrell6dlZoQUNOQWFITXBEL250Ris1RzFrMlU1V3BO?=
 =?utf-8?B?amFYMURTcllRY1E5Y2lHMVZHSHBwWVo0MURmQWRMSHZOcnlHaGFxelhvVjBP?=
 =?utf-8?B?UGRPcW0rSFJCSks5Ly9TbjZXQmg2M1dPLzZjWW95NDBRNzRybUNsMG1YQnNl?=
 =?utf-8?B?NUs0NThBL1JSajdzQVNDSDQvSDk1OVRmSXJabnl2U3hBZktZNDhGY2FMcnp6?=
 =?utf-8?B?Z1lYZVFEK0V4TEF5ekdRdERwcmxrNDYrRkJnaGw3SytnUXFxdVdoOFVjMHAw?=
 =?utf-8?B?TUFLUHNBN0xIbGRVbVB1N3ZLK0J4L2s2VlpFcFQ3VkhVOFIySmVONmNES1Rl?=
 =?utf-8?B?Q3QwZEJSNjExdHBINmxBSndiUnkvNXhqaSs0K3U2OTZQQUhuUThjSHVJYThv?=
 =?utf-8?B?Ry9YSXFCVHNpTDl0cFhVZnlpSFc1cHBPZHBsUGFoTUh5TjVyTzM5WjZVKzBY?=
 =?utf-8?B?WUZRVzBEazdOdFpiK2phNXVvbWw5UTVGVDhmcTRyMXgxTkE0eGQ5MjlkQ3hl?=
 =?utf-8?B?QlRaTC9iVUFXK2pPczljYjJQeWNyWDMyKzU3SnFsbzd2OUkzelNnaEpxTnRs?=
 =?utf-8?B?eU9GQ0xjVzZKMklFZStMZG9vd0NHUUVCeWpmNGVrZGZFT2JuaFV1Y2g4TFpl?=
 =?utf-8?B?R2ZpU0dCQkc2enRaTWFzUFF1NHZnQzEvNmRNRDNsTGYySWFaQWdDOWhFekUr?=
 =?utf-8?B?QkNaSm5YTDRaZUpOa1FHdFVpTG5HdWdiYnVjSTRqb0Y0YVZCd1NGZFd6MG00?=
 =?utf-8?B?cElsOGtpYVFTdXh1bmowUXJtZkYyNWtQNms2djVkY2F3QzVpZU1YWmV0M1k3?=
 =?utf-8?B?cjNvVklpQzJBSXd2dm5lT0MrOHZkR01vanVwdFRwMnZsUVJSK3o3dENtSTl5?=
 =?utf-8?B?UjhkQkd6RUYvbnBZQm5uYjZDeCtZVnNIVHJGSHFwc0dTQTI5WmNYdnYrY2k0?=
 =?utf-8?B?TjkvQmxSYzJkZ1NMWTlRUVpCdk8rWU02VW00ZHBIMFk3UXB5cDZRdmNzbWo5?=
 =?utf-8?B?bWttU0NTWGZFSHdnRW0zYU9hYlM0S2tBaXFtRnlzemt1UGhxSFJacW5DNWJa?=
 =?utf-8?B?VERpWlFpNWlBclVpRDNMUzZJU3hMQWhnWHBHbkkwQitleEd1NTkvNG1HK2h5?=
 =?utf-8?B?aDQxVUZndXI0a3ZtZ2kwcy9aM0dOakhMNy9KWHVlUDhMellpYkVaU0tNQTBN?=
 =?utf-8?B?RGV3dm9NdkNLUnZYT1ppN29LeUtHelJNOGN6OFBKcEx2bDk4di9TemszM2V1?=
 =?utf-8?B?d2dWSmJKNGxTa09RczgvZzJyM1FNNUlnaE1jVkdaUHhRNlZNaGxCZXVENnJo?=
 =?utf-8?B?RXZUcWNVNCtFUUJCU0ZCQWFoRmNIMVNTckwwSjVwZUlFTy82T3ZoNmRIRWxi?=
 =?utf-8?B?ZzlBOExMaVp2NUd6WnpMT3FydEJKZk5Xc1dtVkhReHlsSHJ5a2VRUklvMWlL?=
 =?utf-8?B?enZpZkl1ak4vUjRNWHQrSENydUptbGdRWXN6VHpnbkJGTFM3dWh6OTVQNXd4?=
 =?utf-8?B?SGc1WDZ0QWd0VmtOT0hOSnJWdStZbUdNQWJURlVyKzNoN1l1SVVGQUpnWVVK?=
 =?utf-8?B?UmVpVHJGL1FkUmtEK1ZrTzlvTVdxVUdvZGJrSi9IbXVoZmFpdHZjSXhvNGJI?=
 =?utf-8?B?NDE0OVJOVGk0SDVXT0hBQ2FRVmZoUURuQW02akxzamIrRTY0a1VXQmJhZ3Zm?=
 =?utf-8?B?Wm55aUFmZzcyWWZRQ1E3OUJxRlVaWW9sUk9yM1Jjb01rZXd1Mjhoc1B1blpU?=
 =?utf-8?Q?Q3HhRcnsCxA2uhBt3RkKPDM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77C85E12AC625747923C0F221DA2DBBE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d36d7835-a712-4f82-5ab8-08da9fa7097e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 10:08:19.3664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppurrjRAvWJJStuCNqP/3dx89WfHw3qLqA7GrI0gQn+o/utOPnRoIFz4fJ6Ka8/ti7QPWj6Kawxu7Bgeqh17EU7rAi2SQS56o2imFWRoDw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1606
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

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IEdl
bmVyaWMgdW5pZmllZCBQMjAyMCBtYWNoaW5lIGRlc2NyaXB0aW9uIHdoaWNoIHN1cHBvcnRzIGFs
bCBQMjAyMC1iYXNlZA0KPiBib2FyZHMgaXMgbm93IGluIHNlcGFyYXRlIGZpbGUgcDIwMjAuYy4g
U28gY3JlYXRlIGEgc2VwYXJhdGUgY29uZmlnIG9wdGlvbg0KPiBDT05GSUdfUDIwMjAgZm9yIGl0
Lg0KDQpDb3VsZCBpdCBiZSBDT05GSUdfUFBDX1AyMDIwIGluc3RlYWQgPyBOb3dhZGF5cywgZHJp
dmVycyBzZWVtcyB0byBzcHJlYWQgDQphbGwgb3ZlciBkcml2ZXIvIGRpcmVjdG9yeSwgc28gaXQn
cyBtdWNoIGJldHRlciB0byBoYXZlIENPTkZJR19QUENfIA0KcHJlZml4IG9uIGFsbCBkZWRpY2F0
ZWQgcG93ZXJwYyBjb25maWcgaXRlbXMuDQoNCj4gDQo+IFByZXZpb3VzbHkgbWFjaGluZSBkZXNj
cmlwdGlvbnMgZm9yIFAyMDIwIGJvYXJkcyB3ZXJlIGVuYWJsZWQgYnkNCj4gQ09ORklHX01QQzg1
eHhfRFMgb3IgQ09ORklHX01QQzg1eHhfUkRCIG9wdGlvbi4gU28gc2V0IENPTkZJR19QMjAyMCB0
byBiZQ0KPiBlbmFibGVkIGJ5IGRlZmF1bHQgd2hlbiBvbmUgb2YgdGhvc2Ugb3B0aW9uIGlzIGVu
YWJsZWQuDQo+IA0KPiBUaGlzIGFsbG93cyB0byBjb21waWxlIHN1cHBvcnQgZm9yIFAyMDIwIGJv
YXJkcyB3aXRob3V0IG5lZWQgdG8gaGF2ZQ0KPiBlbmFibGVkIHN1cHBvcnQgZm9yIG9sZGVyIG1w
Yzg1eHggYm9hcmRzLiBBbmQgdG8gY29tcGlsZSBrZXJuZWwgZm9yIG9sZA0KPiBtcGM4NXh4IGJv
YXJkcyB3aXRob3V0IGhhdmluZyBlbmFibGVkIHN1cHBvcnQgZm9yIG5ldyBQMjAyMCBib2FyZHMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPg0KPiAt
LS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvS2NvbmZpZyAgfCAyMiArKysrKysr
KysrKysrKysrKystLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L01ha2VmaWxl
IHwgIDMgKy0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9L
Y29uZmlnIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L0tjb25maWcNCj4gaW5kZXggYmUx
NmViYTBmNzA0Li4yY2I0ZTkyNDhiNDIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvODV4eC9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9L
Y29uZmlnDQo+IEBAIC03OCwxNiArNzgsMTYgQEAgY29uZmlnIE1QQzg1MzZfRFMNCj4gICAJICBU
aGlzIG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBNUEM4NTM2IERTIGJvYXJkDQo+ICAg
DQo+ICAgY29uZmlnIE1QQzg1eHhfRFMNCj4gLQlib29sICJGcmVlc2NhbGUgTVBDODU0NCBEUyAv
IE1QQzg1NzIgRFMgLyBQMjAyMCBEUyINCj4gKwlib29sICJGcmVlc2NhbGUgTVBDODU0NCBEUyAv
IE1QQzg1NzIgRFMiDQo+ICAgCXNlbGVjdCBQUENfSTgyNTkNCj4gICAJc2VsZWN0IERFRkFVTFRf
VUlNQUdFDQo+ICAgCXNlbGVjdCBGU0xfVUxJMTU3NSBpZiBQQ0kNCj4gICAJc2VsZWN0IFNXSU9U
TEINCj4gICAJaGVscA0KPiAtCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUg
TVBDODU0NCBEUywgTVBDODU3MiBEUyBhbmQgUDIwMjAgRFMgYm9hcmRzDQo+ICsJICBUaGlzIG9w
dGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBNUEM4NTQ0IERTIGFuZCBNUEM4NTcyIERTIGJv
YXJkcw0KPiAgIA0KPiAgIGNvbmZpZyBNUEM4NXh4X1JEQg0KPiAtCWJvb2wgIkZyZWVzY2FsZSBQ
MTAyeCBNQkcvVVRNL1JEQiBhbmQgUDIwMjAgUkRCIg0KPiArCWJvb2wgIkZyZWVzY2FsZSBQMTAy
eCBNQkcvVVRNL1JEQiINCj4gICAJc2VsZWN0IFBQQ19JODI1OQ0KPiAgIAlzZWxlY3QgREVGQVVM
VF9VSU1BR0UNCj4gICAJc2VsZWN0IEZTTF9VTEkxNTc1IGlmIFBDSQ0KPiBAQCAtOTUsNyArOTUs
MjEgQEAgY29uZmlnIE1QQzg1eHhfUkRCDQo+ICAgCWhlbHANCj4gICAJICBUaGlzIG9wdGlvbiBl
bmFibGVzIHN1cHBvcnQgZm9yIHRoZSBQMTAyMCBNQkcgUEMsIFAxMDIwIFVUTSBQQywNCj4gICAJ
ICBQMTAyMCBSREIgUEMsIFAxMDIwIFJEQiBQRCwgUDEwMjAgUkRCLCBQMTAyMSBSREIgUEMsIFAx
MDI0IFJEQiwNCj4gLQkgIFAxMDI1IFJEQiwgUDIwMjAgUkRCIGFuZCBQMjAyMCBSREIgUEMgYm9h
cmRzDQo+ICsJICBhbmQgUDEwMjUgUkRCIGJvYXJkcw0KPiArDQo+ICtjb25maWcgUDIwMjANCj4g
Kwlib29sICJGcmVlc2NhbGUgUDIwMjAiDQo+ICsJZGVmYXVsdCB5IGlmIE1QQzg1eHhfRFMgfHwg
TVBDODV4eF9SREINCg0KSXMgdGhhdCBuZWNlc3NhcnkgPw0KQ2FuIHlvdSBqdXN0IHVwZGF0ZSBk
ZWZjb25maWdzID8NCg0KQnkgdGhlIHdheSwgZGlkIHlvdSBoYXZlIGEgbG9vayBhdCB0aGUgaW1w
YWN0IG9uIGRlZmNvbmZpZ3MgPw0KDQo+ICsJc2VsZWN0IERFRkFVTFRfVUlNQUdFDQo+ICsJc2Vs
ZWN0IFNXSU9UTEINCj4gKwlpbXBseSBQUENfSTgyNTkNCj4gKwlpbXBseSBGU0xfVUxJMTU3NSBp
ZiBQQ0kNCg0KV2h5IGltcGx5IGFuZCBub3Qgc2VsZWN0ID8NCg0KPiArCWhlbHANCj4gKwkgIFRo
aXMgb3B0aW9uIGVuYWJsZXMgZ2VuZXJpYyB1bmlmaWVkIHN1cHBvcnQgZm9yIGFueSBib2FyZCB3
aXRoIHRoZQ0KPiArCSAgRnJlZXNjYWxlIFAyMDIwIHByb2Nlc3Nvci4NCj4gKw0KPiArCSAgRm9y
IGV4YW1wbGU6IFAyMDIwIERTIGJvYXJkLCBQMjAyMCBSREIgYm9hcmQsIFAyMDIwIFJEQiBQQyBi
b2FyZCBvcg0KPiArCSAgQ1ouTklDIFR1cnJpcyAxLnggYm9hcmRzLg0KPiAgIA0KPiAgIGNvbmZp
ZyBQMTAxMF9SREINCj4gICAJYm9vbCAiRnJlZXNjYWxlIFAxMDEwIFJEQiINCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvODV4eC9NYWtlZmlsZQ0KPiBpbmRleCAxYWQyNjFiNGVlYjYuLjAyMWUxNjg0NDJk
NyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L01ha2VmaWxlDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9NYWtlZmlsZQ0KPiBAQCAtMjMsOCAr
MjMsNyBAQCBvYmotJChDT05GSUdfUDEwMTBfUkRCKSAgICs9IHAxMDEwcmRiLm8NCj4gICBvYmot
JChDT05GSUdfUDEwMjJfRFMpICAgICs9IHAxMDIyX2RzLm8NCj4gICBvYmotJChDT05GSUdfUDEw
MjJfUkRLKSAgICs9IHAxMDIyX3Jkay5vDQo+ICAgb2JqLSQoQ09ORklHX1AxMDIzX1JEQikgICAr
PSBwMTAyM19yZGIubw0KPiAtb2JqLSQoQ09ORklHX01QQzg1eHhfRFMpICArPSBwMjAyMC5vDQo+
IC1vYmotJChDT05GSUdfTVBDODV4eF9SREIpICs9IHAyMDIwLm8NCj4gK29iai0kKENPTkZJR19Q
MjAyMCkgICAgICAgKz0gcDIwMjAubw0KPiAgIG9iai0kKENPTkZJR19UV1JfUDEwMngpICAgKz0g
dHdyX3AxMDJ4Lm8NCj4gICBvYmotJChDT05GSUdfQ09SRU5FVF9HRU5FUklDKSAgICs9IGNvcmVu
ZXRfZ2VuZXJpYy5vDQo+ICAgb2JqLSQoQ09ORklHX0ZCX0ZTTF9ESVUpCSs9IHQxMDQycmRiX2Rp
dS5v
