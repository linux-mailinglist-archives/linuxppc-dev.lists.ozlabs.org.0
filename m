Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE204817B46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 20:49:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PB8aZ71l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sv9Pl3T3kz3cPW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 06:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=PB8aZ71l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::600; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv9Nt3Hqqz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 06:48:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzxzCTr5ILV0yKMZAs8OzdH7aSSyE6lpfIcZIuUXZLVjM+p00mAZPzzB2nq+89XVK9WXn7rkfID4++7dS0ZiuoiOIi+Bw9fCQDdhXGr5tIIbZYYgOzgxg9IJ6bbVdxyD0o/5vAL+YqINQQv1KKqOu772oWAc+SZcsfR34i0/ztf/q/thN9ax7ibfPG/1ViC/V6pQJZ3e4KESpVwDhExHyOEa2wqe1tAg2XZYkLkNFImg4A98DbrZ58TJtWce2jEu2+8mGnnq64mC6S9DmS+Wxzn8LqEGd7AMZkzMS7M/j4nlotI8g4wHQ6jqIcgdlTNdzEK/dUOC8+AR9QXl2mMuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lO7GqBy4KmNq2PvsolJ6ixGG2iPVS1Jp6GOitaqrX4=;
 b=KJ7nhFqk25lv6IbTwRBlkKLgZNFTcjYi0xdQNnbmw4K1xM7r+hyuIN5/M4zJ8zKzskjXCbOoEgvC6TinPNPS7Rb8aVybh8WNXyjSONAhZ6L3ymwQVVjww/WmVdgKKEMPoPTmJB8H7y1dJoU4vN26ebXp7Pp3OOb8ozB2rsIvJnHIvEc8gfgWfW/BCeBT4HwisRLfwziMuBnh/B2heUZDDa+taQuUDfPLiChU9CUNhQ4q2auf2kWSz2TOzNiGlP5SpfbYikF2snxr0Ac6BWQCAP4lbj9lrWBpYTB8oXzLEkm7V91sxFyvdqpCk8+5K6z8Zur9f0beMpqnyhZMNiY1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lO7GqBy4KmNq2PvsolJ6ixGG2iPVS1Jp6GOitaqrX4=;
 b=PB8aZ71lB7MFVNZlyCo0aGbcguws1ZRQ3a5oajTkrMHFb/Dc52evq1ulrF50pWYUCd+7Pn2DpRaC8AdNb9vpILK/QJH5RBlsigemwYKNyavh8T0VCpyiNHlTbC91nzopxGcpD+LjwL39Uz/Tj6pBciQuVZ+S1UhyDgLyE8X2+S5DmG8MkUfNU3YsvA5146OFgoCfO37QbB4yhdwRB2d4lPZoIiCIXHMZnAyPBIAqts1FYtEvp4+ui695mN1gQBAZESL7RSJu+1d/xx9wJgBlD6BR1UFyFmuFPMXDA99lz207F5p9NgSDZorlzqzbKXjgO1Veq3p+Lyph+K+DqMNv9w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3412.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 19:48:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 19:48:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anatolij Gustschin <agust@denx.de>
Subject: Re: powerpc: several early boot regressions on MPC52xx
Thread-Topic: powerpc: several early boot regressions on MPC52xx
Thread-Index: AQHaMbj1TpOaLc3NvE6hJ6HxIxfFYLCvcsgA
Date: Mon, 18 Dec 2023 19:48:04 +0000
Message-ID: <277b815c-0d73-4f33-ba00-d89b9a0cdb35@csgroup.eu>
References: <46a002f7fe894c7c7ed8324e48e9cd226e428894.camel@ew.tq-group.com>
In-Reply-To: <46a002f7fe894c7c7ed8324e48e9cd226e428894.camel@ew.tq-group.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3412:EE_
x-ms-office365-filtering-correlation-id: 049194a3-3544-4487-9a57-08dc00024076
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jVNNIwETZDwb2zG1bkHNM0s/Mnf0OhUd3klaIlnjOLtSobcb79EUbQjqKtEQ4/8NBNNDqEw3R+Ttz50Kunr05FG+rFXRr3p1C5kCZc2t5F8EJXKangqbXUTc+pX35clmTrVAcM3ZgPnTPcyw4VdI4K8h0difhWDgYMxruupD6BK6YsUrqcC3BgnwsBVgJSQmCd3e/U7VlrtlTGKx1VgNq0c3My9elzw/ukXUQbHpE87QaTTW9oj7ZejU5S48WGa5YF3zUDB9Y0Vqne1mF5+wK+2FNa58BZK1Ga9hm8EpkS88wLbagPPtalU3cFnUsJu8Jq0C33HLjEXjirNDtRl1n0azTYIgfKVK8xY1fzBiQ1GrTelHFsddnGFPSenZbWb4j6Ha9g1F7menMVJwFaIh9q7XfX8pQATXnKNkiBmqnIqE9GXtHaGGRjnUU+lw9wPgwUxT3IDf7xJXIAl2SQxqEieZsu5P3lVlvQxiOBOqIabyOGS+pe0E6H+pPQOExGvuyGgUd5vJY31fQm+MwYAkJFRBiQ4biqcM9fjfck0V1C1MumrRNu0V97kvlP7ZUcJ9Z35SChNnd+GyQu8MfXqILzA9+D3G6GeSZk6KJT5wrG3L1/OGLqyw7l0ztg0Vt7XgE959iTevxa9LhWlv5bG1cDPR2IZoNhx9W4lB2TeeKYQ2/oky6wWxS2xuIMIc4Hjd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(54906003)(66946007)(66556008)(66476007)(66446008)(64756008)(44832011)(76116006)(8936002)(8676002)(4326008)(478600001)(316002)(6486002)(110136005)(91956017)(36756003)(41300700001)(38070700009)(2906002)(31696002)(86362001)(5660300002)(122000001)(38100700002)(71200400001)(6512007)(6506007)(83380400001)(2616005)(26005)(66574015)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c3JTWHVXZ0JZMlFzZ0pDNHJ5U3RqSWdNc0YwQmJ5RUJBaitwUG91RVE5MlAz?=
 =?utf-8?B?V0o1M3htVXozOHdPb3pYN2tUU0xjVk13MGJIaWJOYVF1TkNtbW80alpBY091?=
 =?utf-8?B?c1YvdzZRcE1VdXdpT29jOFlkTlByWVBvZzBQdGhLRXdRd2txWkFNaytvcGU5?=
 =?utf-8?B?NDFMRUJSR3BCeUJzRWtkQzVnMzFydmNSb0Rha1JwdE8vaHhJbmZ6ZllaMkpi?=
 =?utf-8?B?S1BEbjByV2FPaVFFRHdRSFZvVTFrb1dZUlFYd2R3dm55ejVaUWZuNVdBblI4?=
 =?utf-8?B?SjdzTmFzc0JuQUtyRUZZanhXYXI0RW9oOWRVaFYrMlBVdjlOenJXa21rV3M2?=
 =?utf-8?B?YitwQWJEK3Y0a0w2eGIreFhyUEhlY01EQmtVQ1BMRzduWWxvQTU3V0xkNEN6?=
 =?utf-8?B?dzQySWJ0bFRCMmhvMjZTd3VRb1N2YkJEMUFmT0hYY0JONE50Z0N4d0Y0S09W?=
 =?utf-8?B?NWR3MzlGV2Q4RDhNYlo1TUlMV0N1eENnbW5hNEFRWW00QzRFV0RvV1lpZmZH?=
 =?utf-8?B?dFBHSzJKalAzTWFucUJpeDNMNGVSRGJsSEY3eEozMDQyMU9JUlhqaWgxM3pw?=
 =?utf-8?B?SGdEZ3J1Q2Z5SU9temNneHRqUFJDZTIzOGJlOEJKcE1ZUUxORVJQOEFRYklm?=
 =?utf-8?B?RXkwRUNyTHkvdFdSRGN1S3NxUVo3elFUemxnOFJCYjBBcXR4Vkd4aW9xbUF3?=
 =?utf-8?B?ZzJUcDhJM2hRNXNOQ2xMQnA4Sy9US0NpT09mMTl4NGt4M3htTU5YTlhYb0RU?=
 =?utf-8?B?bzU3STBpNkVsN0t5U2tDZ1JIdWlPMHlTWGNWZkZaeUJNeW9aSFNkTUQrc1RM?=
 =?utf-8?B?N2g5bEpEUml6TSszM1Z6T0Z6a1BUQ1NuVXEzaEZjYXl3QVlHTnc2aDBqVFlQ?=
 =?utf-8?B?aVlTZWFOVHpJZ0gzdStjRGtGWG5Fa2N2amtZajd3V1VVaVpGU2dxSXNyMmU4?=
 =?utf-8?B?NWlDa0VvZ2w1RjdZL2p1aFJpbUdyUVBhQ1hPVGhvZE90WDZGQ1dJSlF2NXBs?=
 =?utf-8?B?VmJnOW9qYjQ3ZU5RTUU1dWZXS3hEYlZNZ241MmtjQUtwODNWZ3o5RDY3MlpO?=
 =?utf-8?B?Vk5VOWE4OGZRZlZBZDZNRWNaZXg3eWNrcHRhOGlMSzQ3NTFzbGgyRkJYMlFw?=
 =?utf-8?B?Tmw1b2pmZEUzNDg1QVJmK3lISFFnQnBMb1Z4VFFrOEZnY1RITkx6MktFTVFa?=
 =?utf-8?B?OW5MZmFVMktmdW5Qa1VzOFZ3eVZTaCtWK0Jhd2w3Mkc1aHlmNVF1ZzlOblZm?=
 =?utf-8?B?UDlTNllGV2VCTVNwWlZvZDBRQXdUdU1DWmlyU3I1b2hTZEZzRGovbXZPdG9t?=
 =?utf-8?B?Mm5EbmhBMVc0TDEwbjNOV1BtOStBdTk5cEh3STRYMnJ4WUhPTmJFNnpjb0hD?=
 =?utf-8?B?eVh5SzZmVmc3UUlOd09XMUZEOFlZVFhNd29pVzh2ZHV5cEJENTJqVVkxanVK?=
 =?utf-8?B?cndNQ3ZybEZmVnREY08wSE12VlpVV3ppeFVLM1hmc2lUZkxTTVBudnl2dDd5?=
 =?utf-8?B?RmE2dnhKbUZjRDJOME9zZjQ1aHdSK0xwT05sMlRBWHZYZDMvSGpvMndaNnJq?=
 =?utf-8?B?OHhBdDJBU0dYSGlDRE84a2RsYk1jNFE4TVlFZnN3dkpjR3lSWnhOclVXSElt?=
 =?utf-8?B?UDlmNTBtajM1ZUVraXVWcm1kZy9BVWdQczgrMVhYWjRITDJtNnUxWkw5Skgz?=
 =?utf-8?B?S3pzb0hFTHN0WjY1K2gwOUd5RmVGeGFuL0s2ZlI5QVR5NDNXNzZVaURJbmFR?=
 =?utf-8?B?VC9KZFRRQ2JKMFNoejh3akR5MUZnMTlHSEpzR0V4VHJZOFI1eXNDZlc0ejVQ?=
 =?utf-8?B?SE1STGNTQzV6YTVkVDZuZGZiL1VldHp3UXZwZlBQZ2lIZVc2SVZJN3YyTTM4?=
 =?utf-8?B?bkhHbEJucnJpckkzZXdMcWg1am0veGc4ekJab1kxYXBMeGFiZ0cyUm9xUkp6?=
 =?utf-8?B?NDUvTlZhUzh0a3V2b0tFSXNsUFozT0ZIYmdqNGpRWDBLbm9RdmVXamMrZll6?=
 =?utf-8?B?dXN2RVJZbENpQ2d5L0RrL1pLKzNZbVNRbU55SzBub2FmMUZNc0t6eTloRnp4?=
 =?utf-8?B?b1cvcWROMnJ2WXhXQ3M4bW1sY0VCdmpLMFptdnNmV1V0V2ViR3FZeG9XZm1k?=
 =?utf-8?Q?TlKSQrTUfY1t4Ma9WSoEFpM3R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72A930CA6E53974081FD23D5F357460B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 049194a3-3544-4487-9a57-08dc00024076
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 19:48:05.0746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzcnmUia7rrdfiYUsQOk2JOnLYUngxKCGswhPFgDrmJTCZfcR4M0YdJJlyBcSNd+2sp8/CB4jyatT5E/dSEzTYBn7Eg1sSKLzOlHVRh8U6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3412
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWF0dGhpYXMsDQoNCkxlIDE4LzEyLzIwMjMgw6AgMTQ6NDgsIE1hdHRoaWFzIFNjaGlmZmVy
IGEgw6ljcml0wqA6DQo+IEhpIGFsbCwNCj4gDQo+IEknbSBjdXJyZW50bHkgaW4gdGhlIHByb2Nl
c3Mgb2YgcG9ydGluZyBvdXIgYW5jaWVudCBUUU01MjAwIFNvTSB0byBhIG1vZGVybiBrZXJuZWws
IGFuZCBJJ3ZlDQo+IGlkZW50aWZpZWQgYSBudW1iZXIgb2YgcmVncmVzc2lvbnMgdGhhdCBjYXVz
ZSBlYXJseSBib290IGZhaWx1cmVzIChiZWZvcmUgdGhlIFVBUlQgY29uc29sZSBoYXMgYmVlbg0K
PiBpbml0aWFsaXplZCkgd2l0aCBhcmNoL3Bvd2VycGMvY29uZmlncy81Mnh4L3RxbTUyMDBfZGVm
Y29uZmlnLg0KDQoibW9kZXJuIiBrZXJuZWwgPT0+IHdoaWNoIHZlcnNpb24gPw0KDQo+IA0KPiBJ
c3N1ZSAxKSBCb290IGZhaWxzIHdpdGggQ09ORklHX1BQQ19LVUFQIGVuYWJsZWQgKGVuYWJsZWQg
YnkgZGVmYXVsdCBzaW5jZSA5ZjViZDhmMTQ3MWQ3DQo+ICJwb3dlcnBjLzMyczogQWN0aXZhdGUg
S1VBUCBhbmQgS1VFUCBieSBkZWZhdWx0IikuIFRoZSByZWFzb24gaXMgYSBudW1iZXIgb2Ygb2Zf
aW9tYXAoKSBjYWxscyBpbg0KPiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzUyeHggdGhhdCBzaG91
bGQgYmUgZWFybHlfaW9yZW1hcCgpLg0KDQpDYW4geW91IGdpdmUgbW9yZSBkZXRhaWxzIGFuZCB3
aGF0IGxlYWRzIHlvdSB0byB0aGF0IGNvbmNsdXNpb24gPw0KDQpUaGVyZSBzaG91bGQgYmUgbm8g
cmVsYXRpb24gYmV0d2VlbiBLVUFQIGFuZCBvZl9pb21hcCgpL2Vhcmx5X2lvcmVtYXAoKS4gDQpQ
cm9ibGVtIGlzIGxpa2VseSBzb21ld2hlcmUgZWxzZS4NCg0KPiANCj4gSSBjYW4gZml4IHRoaXMg
dXAgZWFzeSBlbm91Z2ggZm9yIG1wYzUyMDBfc2ltcGxlIGJ5IGNoYW5naW5nIG1wYzUyMDBfc2V0
dXBfeGxiX2FyYml0ZXIoKSB0byB1c2UNCj4gZWFybHlfaW9yZW1hcCgpIGFuZCBtb3ZpbmcgbXBj
NTJ4eF9tYXBfY29tbW9uX2RldmljZXMoKSBmcm9tIHRoZSBzZXR1cF9hcmNoIHRvIHRoZSBpbml0
IGhvb2sgKG9uZQ0KPiBzaWRlIGVmZmVjdCBpcyB0aGF0IG1wYzUyeHhfcmVzdGFydCgpIG9ubHkg
d29ya3MgYSBiaXQgbGF0ZXIsIGFzIGl0IHJlcXVpcmVzIHRoZSBtcGM1Mnh4X3dkdCBtYXBwaW5n
DQo+IGZyb20gbXBjNTJ4eF9tYXBfY29tbW9uX2RldmljZXMoKTsgSSdtIG5vdCBzdXJlIGlmIHRo
ZXJlIGlzIGEgYmV0dGVyIHNvbHV0aW9uKS4NCj4gDQo+IEZvciB0aGUgb3RoZXIgNTJ4eCBwbGF0
Zm9ybXMgKGVmaWthLCBsaXRlNTIwMCwgbWVkaWE1MjAwKSB0aGluZ3MgYXJlIGEgYml0IG1vcmUg
Y2hhb3RpYywgYW5kIHRoZXkNCj4gY3JlYXRlIHNldmVyYWwgbW9yZSB0ZW1wb3JhcnkgbWFwcGlu
Z3MgZnJvbSBzZXR1cF9hcmNoLiBFaXRoZXIgdGhleSBzaG91bGQgYWxsIGJlIG1vdmVkIHRvIHRo
ZSBpbml0DQo+IGhvb2sgYXMgd2VsbCwgb3IgYmUgY29udmVydGVkIHRvIGVhcmx5X2lvcmVtYXAo
KSwgYnV0IEkgY2FuJ3QgdGVsbCB3aGljaCBpcyBtb3JlIGFwcHJvcHJpYXRlLiBBcyBhDQo+IGZp
cnN0IHN0ZXAsIEkgd291bGQgcHJvcG9zZSBhIHBhdGNoIHRoYXQgZml4ZXMgdGhpcyBmb3IgdGhl
IHNpbXBsZSBwbGF0Zm9ybXMgYW5kIGxlYXZlcyB0aGUgb3RoZXINCj4gb25lcyB1bmNoYW5nZWQu
DQo+IA0KPiAoU2lkZSBub3RlOiBJIGFsc28gZm91bmQgdGhhdCBiZWZvcmUgMTYxMzI1MjljZWU1
OCAoInBvd2VycGMvMzJzOiBSZXdvcmsgS2VybmVsIFVzZXJzcGFjZSBBY2Nlc3MNCj4gUHJvdGVj
dGlvbiIpLCBib290IHdvdWxkIHN1Y2NlZWQgZXZlbiB3aXRoIEtVQVAgZW5hYmxlZCB3aXRob3V0
IGNoYW5naW5nIHRoZSBpbmNvcnJlY3Qgb2ZfaW9tYXAoKTsgSQ0KPiBndWVzcyB0aGUgb2xkIGlt
cGxlbWVudGF0aW9uIHdhcyBtb3JlIGxlbmllbnQgYWJvdXQgdGhlIGluY29ycmVjdCBjYWxscyB0
aGF0IHRoZSBrZXJuZWwgd2FybnMNCj4gYWJvdXQ/KQ0KDQpJbnRlcmVzdGluZy4NCkFnYWluLCB0
aGVyZSBzaG91bGRuJ3QgYmUgYW55IGltcGFjdCBvZiB0aG9zZSBpbmNvcnJlY3QgY2FsbHMuIFRo
ZXkgYXJlIA0KY29ycmVjdCBjYWxscywgaXQgaXMganVzdCBhbiBoaXN0b3JpY2FsIG1ldGhvZCB0
aGF0IHdlIHdhbnQgdG8gZ2V0IHJpZCANCm9mIG9uIGRheS4NCkNvdWxkIHlvdSB0aGVuIHByb3Zp
ZGUgdGhlIGRtZXNnIG9mIHdoYXQvaG93IGl0IHdvcmtzIGhlcmUgPyBBbmQgdGhlbiANCkknZCBh
bHNvIGJlIGludGVyZXN0ZWQgaW4gYSBkdW1wIG9mIC9zeXMva2VybmVsL2RlYnVnL2tlcm5lbF9w
YWdlX3RhYmxlcyANCmFuZCAvc3lzL2tlcm5lbC9kZWJ1Zy9wb3dlcnBjL2Jsb2NrX2FkZHJlc3Nf
dHJhbnNsYXRpb24NCmFuZCAvc3lzL2tlcm5lbC9kZWJ1Zy9wb3dlcnBjL3NlZ21lbnRfcmVnaXN0
ZXJzDQoNCkZvciB0aGF0IHlvdSdsbCBuZWVkIENPTkZJR19QVERVTVBfREVCVUdGUw0KDQo+IA0K
PiBJc3N1ZSAyKSBCb290IGZhaWxzIHdpdGggQ09ORklHX1NUUklDVF9LRVJORUxfUldYIGVuYWJs
ZWQsIHdoaWNoIGlzIGFsc28gdGhlIGRlZmF1bHQgbm93YWRheXMuDQo+IA0KPiBJIGhhdmUgbm90
IGZvdW5kIHRoZSBjYXVzZSBvZiB0aGlzIGJvb3QgZmFpbHVyZSB5ZXQ7IGlzIHRoZXJlIGFueSB3
YXkgdG8gZGVidWcgdGhpcyBpZiB0aGUgZmFpbHVyZQ0KPiBoYXBwZW5zIGJlZm9yZSB0aGUgVUFS
VCBpcyBhdmFpbGFibGUgYW5kIEkgY3VycmVudGx5IGRvbid0IGhhdmUgSlRBRyBmb3IgdGhpcyBo
YXJkd2FyZT8NCg0KU2hvdWxkbid0IGhhcHBlbiBiZWZvcmUgVUFSVCBpcyBhdmFpbGFibGUsIHN0
cmljdCBlbmZvcmNlbWVudCBpcyANCnBlcmZvbWVkIGJ5IG1hcmtfcmVhZG9ubHkoKSBhbmQgZnJl
ZV9pbml0bWVtKCkgaW4gdGhlIG1pZGRsZSBvZiANCmtlcm5lbF9pbml0KCkuIFVBUlQgc2hvdWxk
IGJlIE9OIGxvbmcgYmVmb3JlIHRoYXQuDQoNClNvIGl0IG11c3QgYmUgc29tZXRoaW5nIGluIHRo
ZSBzZXR1cCB0aGF0IGNvbGxpZGVzIHdpdGggQ09ORklHX0tVQVAgYW5kIA0KQ09ORklHX1NUUklD
VF9LRVJORUxfUldYLg0KDQpDb3VsZCB5b3Ugc2VuZCBkbWVzZyBvZiB3aGVuIGl0IHdvcmtzIChp
ZSB3aXRob3V0IA0KQ09ORklHX0tVQVAvQ09ORklHX1NUUklDVF9LRVJORUxfUldYKSBhbmQgd2hl
biBpdCBkb2Vzbid0IHdvcmsgaWYgeW91IA0KZ2V0IHNvbWUgaW5pdGlhbCBzdHVmZiA/DQoNCkFs
c28geW91ciAuY29uZmlnIHVubGVzcyB5b3UgYXJlIHVzaW5nIG9uZSBvZiB0aGUgZGVmY29uZmln
cy4NCg0KV2hhdCBVQVJUIGRyaXZlciBpcyB1c2VkID8NCg0KV2hhdCdzIHlvdXIgYm9vdCBjb25z
b2xlLCBjYW4geW91IHVzZSAiZWFybHkgYm9vdCB0ZXh0IGNvbnNvbGUgKEJvb3RYIG9yIA0KT3Bl
bkZpcm13YXJlIG9ubHkpIChDT05GSUdfQk9PVFhfVEVYVCkiID8NCg0KQ2hyaXN0b3BoZQ0K
