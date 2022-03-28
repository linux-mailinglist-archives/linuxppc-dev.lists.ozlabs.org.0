Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454634E92EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 13:00:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRqV60qKbz3c17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 22:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::626;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRqTc3KGFz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 21:59:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejPMaqXDjfP943BrAtQMTEvO7OJ17aw+OhnPHpecqVyQVN3QihM25rvX636nYKfRww7zU3h02Lt5EsRLpZ2JGh7RZQX8ruKGFDx9Z1/kwErJjl7JLOapX6eRFOhvA84tXBSUWcQgx8JrnlhV1KOPh7XbpOJuG/1XuLJjN0vGxt3+DQcoTmYNA3Q3jG3+gFkmupV5YFQe0bv/3Mgp47ltBs+0RkXl0jhlAZ8Zl72BNpwH8ODTlj8SEjIavmTNtKWkMzilX44STEbANg5oLzvhJ0kLSVloqyPumSI10xD6x4NBwbO09ghJDr0hULNRkCAnnnqWZCgvtyMtpxFSCoso/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYlgvbW360nC9IlY39Er+siNWwzeGutijMmmKYTZZ/s=;
 b=R0MfilWcbT9y8HQLHwJGxfXUqGkVMzW+RYGzuz6QgcfV52L5DRdv1AH7ysMrNF+fv6oFeecUfPDJqWtdWPO1X6kFRl5D3beU1pNYhBmlaeEx65Qu1apIDw34mGXCdp59YAZLh/aIpzd8ru+PBJZdagGLw1q3NHLUgYyTM9Uz09s0A6bWobsEdyTK4s9M58jugl4FBV3W5B40ylwX516t7GvSSmlvryBtv1rXg6XenDS0/swOYWGYPftzG7DeGxKWb7uRkoyjwJmX61NtbkZKU06NaO1Vz/mGnRQyLPh+khOsdFKLMgJ4IUSvdDs0eH7Y1lt2DZFRawcC9FPJs2VPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 10:59:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 10:59:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
Thread-Topic: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
Thread-Index: AQHYQPIfLR67jdMa+ECWra/lL4RyQqzUnbCAgAAGL4A=
Date: Mon, 28 Mar 2022 10:59:24 +0000
Message-ID: <34355f36-1122-9c22-e717-73a957a31a3e@csgroup.eu>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
 <b2ff771c-01ef-3f14-f22d-9248735fdc77@huawei.com>
 <87sfr2fjms.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sfr2fjms.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d8d725-dcff-4fe1-be65-08da10aa052d
x-ms-traffictypediagnostic: MR1P264MB3075:EE_
x-microsoft-antispam-prvs: <MR1P264MB30758F4235C305BE47594D91ED1D9@MR1P264MB3075.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4jzxV5hkti9/5ywAPOoHVDa0EyLQ/RgodN5zr312BhjSaq+fQrXq36saCMdad1TJjrc+gKQsOzKFKMJDpjX5I3A9GFHwgGbmLzudIkyH+AM4Sk4Lg+jtjFFApOsWwkWR3djF5GvYwO7I5qFfzggcaJXpIee+M7u2M2iUnJZ7NbN+UxJvUQMbW5AEFHj4ihANy386RNLNbx0MuYtVbvVmD9kD5o9kTkipBNJqCNYien8Aw+1luo8wG22JshghZ62IlOD4GE7FSZJtZvVD66WxUopLH8nSM93kEHh9HZMRqraDN62W1BpTAHRi5Uc5fZ0392mtBV3YlUiGA5cke0HWj7WzTBbY1P3ykN240aBERR3oLwFGl7OxDJEESl1QUlpGejnMa+xkHfeCFFG+UN/G5psuUSEm82TeILzd3QjdEZxaoRk21GlxoynXYL1SiKQu1YON5xRRdyhKeOWbg0ljzsKtCmWLp2TgHXHvu4gmWPk9FQ70mHtCn5cUG/05Bx4y89xBLVa6kr0tDnKeVQoU/yR/q55d1socRo0I7pXxA8yH3oxL7kJvGzdSUQW5x2h2hCWsL9WC6RONO1x4BxSM0K9rl0/GQbqpWmK2FtHFk6E0n5v/zqdId2KLXlc5g1NsfNNvEGy386Zt5pDC953heG0upNGevoYLNQylQywjeoUGPBlXxc0icuh1Sjyz7h5SHgRaimGdrDAOo5tSXMPd/ckghm3fwb3piCiTCGPPb0KSkOU4w/g8E7jdpEmEMoYlt1pQGmRbnqoKNGn3oSaxVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(110136005)(83380400001)(38100700002)(71200400001)(64756008)(2906002)(44832011)(31696002)(66946007)(4326008)(66574015)(76116006)(316002)(66556008)(38070700005)(5660300002)(6486002)(66446008)(66476007)(122000001)(8936002)(86362001)(8676002)(186003)(6512007)(6506007)(31686004)(26005)(508600001)(2616005)(36756003)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N21TUTNLLzVXS1FXVTNrcEd0eXRqUTVqWEw5ZkRUYjRQUDJqNmtla3k5WE94?=
 =?utf-8?B?RXVBdU1Kc01lUVNCTGVwLy9kNlVKTFN6NWU2SkRhRGdLR3Fnb3g2RnQvSmk3?=
 =?utf-8?B?anpwczN4aFUvVmRXVXlGOGM1eVFSUG9BMXltdHFTUmpsbEVrNmxCeTZMckpk?=
 =?utf-8?B?R09RNDlTZEFTUjhkQW4xM2tvb0U0TGE0M2dEbE9ONkM4dFNxam5HT05vcm5r?=
 =?utf-8?B?Rmd2MjduQTFqaUlOcGJLRXViQmhVTkFYVGtEVmtYeHc3dW01eUxMMStEYVdP?=
 =?utf-8?B?ZDdGV2pkODFubHJTc1F0TkNOdlA2anZtV1BBNHVjRzROckRjMzlJUTJlZHpN?=
 =?utf-8?B?emdDM0J5MDY4emtJcmRXMjl2d0ZWODA3THFuNklnRWtaOVpRRm1ibk5BeERO?=
 =?utf-8?B?cUF3NGxIR0pyVThYTjNHdUh3K3h0M01MdnRXNmtxWm9HTHorRjNVQ3dDY0hL?=
 =?utf-8?B?djhseWUva3BmYWlTTVNXNThVekZ6UElxTmt6MWxqSGNCWXNpSUk2elFzbmo3?=
 =?utf-8?B?b1lmdXNSamxoVG5JNmRjRmtVa3o1eHRNVXlPSm1EQzVLMlE1OHZBbXJlcjVN?=
 =?utf-8?B?TUhHZmtwdWJ0cXB3WCtaOFZsK2pIWm9RMWsvZHRWYk14cUdQVUVYSHRwSzNX?=
 =?utf-8?B?anl2N0NtUGJGdVpkMS9lUU5GTkpDelc2d2ZScmgwamdIWjRCbkNTTEVoOCs2?=
 =?utf-8?B?L0hrcGt1VGorZWZlZGpnM0FxZFZLQmgrRlN6R0lyRkIzNkpMa25nUFZEYjlw?=
 =?utf-8?B?cW94V3ZQL3crM3FwM1JrZVprOHM5dHRDV1Y4NFdDWCs5NzVlcTdObGs3dEs2?=
 =?utf-8?B?MzkvNzBuVTdzc3hXVDVxc2lJdFRXSUpmUFVac2NIZnFWSGhMUVF0VXM0R09q?=
 =?utf-8?B?RFdVWlVtZ2c4ZGx5eEZTWHYxQzB5b3RzOFdaeGdSUVk3K2NlNmpsK1Axa3Ns?=
 =?utf-8?B?ZGNoeFA2dkZCdVJzTEJhV2dicmRiUEYvNXJyT0VOWkJObFJBNG9zM0RoaTBQ?=
 =?utf-8?B?a3UvQWdQL2xQOE9GL2JNTFErdmRtVFJMbmppbmtBNWJsVDNGKzdGdGFDRUpw?=
 =?utf-8?B?dnlVdklpaGp5RHRpYlhWd1BEZVdWWS9RTTgzK3l4M1VGMktJYkZJLzNBQ3Qw?=
 =?utf-8?B?dUZ3a0VxRDdyTW9OVVJZaHoyTUpSSFQwMUovTk9Vam54V2pPdjkxVmVnZFRj?=
 =?utf-8?B?Z0E1eDI0all2RENnTWVjLzVOTUtTRTFYRXVocjRKTVN6TDV5MXlFU2ZTNlZR?=
 =?utf-8?B?S29jU1NOMDNjSnVUbEJWalBOREdJdGZMK3ZhNWYvbHF3aWQxa2RIMVc3NTBo?=
 =?utf-8?B?dzdNaHY4MWFlTkRUVG93T1l3eGorWEVtWC9Fc1NEZ0ZGd0dDOHlzT0gyN3Jt?=
 =?utf-8?B?aTczMnVsbUJBZGswaU9uRlRaVG4rQ1JMdlBOakh0MS9yb2NWQ2RMa0JlVFJ1?=
 =?utf-8?B?WWFXYytRSzI4NHZyM0srY0JtUVBvaEZkSUlXMkVpcVM5MEtPQXdEcHkxOUVm?=
 =?utf-8?B?VTZXTkxMYTA1d09sa0Jwb3AxUG8waUhTV3EwLzIvMzJCS1pQdlVPL0RGQ3gx?=
 =?utf-8?B?eHBPNzROL291U0s3VWh6MjA0eGdmQVFtQVU3QmZ2a085YWN6ekthbXNvWlRp?=
 =?utf-8?B?MjN0NTBHRmI1WVJtN0l0bUlJNEdyZmFPOUVVbjN5ZXlHcHpnWmdxWm44TStq?=
 =?utf-8?B?aGxhMVEvWE9ybFp1NGlZT1dlR3lWWlVYczNrQ09KS096M2xpVzV3aWxYaFpy?=
 =?utf-8?B?TlZrYkhEUThsZDRWNlgwa25iY3ZwOVhMdkZPMFdpa0pBOTZaWkFKV2hPQlFk?=
 =?utf-8?B?K0JkQ0dHd1FOb1JwejJVNDd0bzRLbHpCU1l6VURGRzV6OEZqMmRveDB5bkdi?=
 =?utf-8?B?aGU3UUMzS21TaGhpZGdXNlVZbmxRcEg3cHNIWXVXVS8vMzRrWlVsODJhaXhW?=
 =?utf-8?B?eVpMZUZlM2g3a1A0Q0RObFF2OHdFd1lmR3FpbVlLWFluVDNwWmhqNnBoQkE4?=
 =?utf-8?B?TmhjaXhHWTJiZjFxNERha0t0Q0pIU284ZmdMUG0wc3p1ZUQvVk42QnpiU3Vm?=
 =?utf-8?B?Q1V3U1dkZDlLdWp1UmFWRFJncy9jOVBiaGdIeWpzUXdkeU1HRXNjcXF2bGNI?=
 =?utf-8?B?czRsUllkazhiTzN5aXB4NUxOcmlBK1Vud2tQellvaXdFQ0ZYYXhNdVFlRWdv?=
 =?utf-8?B?NkhuUzdHVVFubDV2Wlk4d2xjVVpKVFBhbFVkbmF6TFZNL2o0REM2S0R4eVBh?=
 =?utf-8?B?dkFyMDdOdjJHc0w3Nys3ZDhLTUV2bmpCN1pORHRpUWVjVmFkYnZMSjVzelRy?=
 =?utf-8?B?SGxRelB2dVpvL3dzU1c0N3BOR3ZWYjh0ZkZ3Y2paSzExcktjdnpJa3BHREpB?=
 =?utf-8?Q?tEs5LvnEoOfgn3oRJcPL4c58QgsnLkZL6fLmT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ACF428FC0805141B8B4BCCD28043E7E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d8d725-dcff-4fe1-be65-08da10aa052d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 10:59:24.2934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9gx7JDq8BTTKu51iTbthpDAPscBLdRUfIGhKbNxunKRktGQy5eH1aWmzWwbEeuwKhnMe0ELrAtEd1yhzDoCMuYpClanJ1XyhXL2NQUtCrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3075
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
Cc: "songyuanzheng@huawei.com" <songyuanzheng@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAzLzIwMjIgw6AgMTI6MzcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cml0ZXM6DQo+PiBI
aSBtYWludGFpbmVyc++8jA0KPj4NCj4+IEkgc2F3IHRoZSBwYXRjaGVzIGhhcyBiZWVuIHJldmll
d2VkWzFdLCBjb3VsZCB0aGV5IGJlIG1lcmdlZD8NCj4gDQo+IE1heWJlIEknbSBqdXN0IG1pc3Jl
YWRpbmcgdGhlIGNoYW5nZSBsb2csIGJ1dCBpdCBzZWVtcyB3cm9uZyB0aGF0IHdlDQo+IG5lZWQg
dG8gYWRkIGV4dHJhIGNoZWNrcy4gcGZuX3ZhbGlkKCkgc2hvdWxkbid0IHJldHVybiB0cnVlIGZv
ciB2bWFsbG9jDQo+IGFkZHJlc3NlcyBpbiB0aGUgZmlyc3QgcGxhY2UsIHNob3VsZG4ndCB3ZSBm
aXggdGhhdCBpbnN0ZWFkPyBXaG8ga25vd3MNCj4gd2hhdCBlbHNlIHRoYXQgbWlnaHQgYmUgYnJv
a2VuIGJlY2F1c2Ugb2YgdGhhdC4NCj4gDQoNCnBmbl92YWxpZCgpIGRvZXNuJ3QgdGFrZSBhbiBh
ZGRyZXNzIGJ1dCBhIFBGTg0KDQpJZiB5b3UgaGF2ZSAxR2J5dGUgb2YgbWVtb3J5IHlvdSBoYXZl
IDI1NmsgUEZOcy4NCg0KSW4gYSBnZW5lcmljIGNvbmZpZyB0aGUga2VybmVsIHdpbGwgbWFwIDc2
OCBNYnl0ZXMgb2YgbcOpbW9yeSAoRnJvbSANCjB4YzAwMDAwMDAgdG8gMHhlMDAwMDAwMCkgYW5k
IHdpbGwgdXNlIDB4ZjAwMDAwMDAtMHhmZmZmZmZmZiBmb3IgDQpldmVyeXRoaW5nIGVsc2UgaW5j
bHVkaW5nIHZtYWxsb2MuDQoNCklmIHlvdSB0YWtlIGEgcGFnZSBhYm92ZSB0aGF0IDc2OCBNYnl0
ZXMgbGltaXQsIGFuZCB0cmllcyB0byBsaW5hcmx5IA0KY29udmVydCBpdCdzIFBGTiB0byBhIHZh
LCB5b3UnbGwgaGlwIHZtYWxsb2Mgc3BhY2UuIEFueXdheSB0aGF0IFBGTiBpcyANCnZhbGlkLg0K
DQpTbyB0aGUgY2hlY2sgcmVhbGx5IG5lZWRzIHRvIGJlIGRvbmUgaW4gdmlydF9hZGRyX3ZhbGlk
KCkuDQoNClRoZXJlIGlzIGFub3RoZXIgdGhpbmcgaG93ZXZlciB0aGF0IHdvdWxkIGJlIHdvcnRo
IGZpeGluZyAoaW4gYW5vdGhlciANCnBhdGNoKTogdGhhdCdzIHRoZSB2aXJ0X3RvX3BmbigpIGlu
IFBQQzY0Og0KDQojZGVmaW5lIHZpcnRfdG9fcGZuKGthZGRyKQkoX19wYShrYWRkcikgPj4gUEFH
RV9TSElGVCkNCg0KI2RlZmluZSBfX3BhKHgpCQkJCQkJCQlcDQooewkJCQkJCQkJCVwNCglWSVJU
VUFMX0JVR19PTigodW5zaWduZWQgbG9uZykoeCkgPCBQQUdFX09GRlNFVCk7CQlcDQoJKHVuc2ln
bmVkIGxvbmcpKHgpICYgMHgwZmZmZmZmZmZmZmZmZmZmVUw7CQkJXA0KfSkNCg0KDQpTbyAweGMw
MDAwMDAwMDAwMDAwMDAgYW5kIDB4ZDAwMDAwMDAwMDAwMDAwMCBoYXZlIHRoZSBzYW1lIFBGTi4g
VGhhdCdzIA0Kd3JvbmcuDQoNCkNocmlzdG9waGU=
