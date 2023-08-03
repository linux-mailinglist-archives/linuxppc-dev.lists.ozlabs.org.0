Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6B76F149
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:03:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GJp0cJ2x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGxXr2bqhz3c82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 04:03:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GJp0cJ2x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::601; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGxWr5qytz2yhL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 04:02:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdqaTdWT6QDKgB+hN32oK6Ypqo4cR9FhAtxU/EZP660Zs4NlTnJoZDEEbuJKnKeNq//Cl+pufeR9WLB8EcMAfKVfFRY5oBTnjUOplMu9ZStBYPCth13p9oWgCzkvINLp1AxOuKW/4GZzMvPbOIkTLTeyVOhWYt32IE1tk3gQ05XIEl0oZ85Vs8M8QqiRQk8NT5Yw6XESloQwt5yYxTHvOTOFQ88XBGnJzMUFL9k8ufErNNSJdgwxjx5c0fPZbo0pyjs29pTojMQkZUsxvEcxkq1l5OPvkZaNvIDp7pAcZiD6tXbGRr6lmkbevdWPsI/E9dAvX1gZZur1yLSaRIUOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBCQoc+AS2YB2IJE/sZUTI0BFd7gEzKlUkbuq/0he3k=;
 b=Hm7yOBKX2mvboP/Z5RvggI7EYRB42x8YQUOqpKlJaMTW/kk0LoUrdf0kC/eF8ylhmOhBUOGSd3sK7vymTHOq4dZJFxvWmPMMBWL3SOABRnWtEYPv/HzZeJYBbRLkwUy1w6T9882FZHpojK18uEMn7bAwc+NY041vRUqfY4mtzMvj17DGIIeeAn6a0gdBjTWqK/VyIiSMdm0dfstj/S7mDPNwJ8sGjHrWw3KY1tsdM1s2MOC7w6/Nf6Fd9htEnHBFl1zG7f1h8l484mRmDWe1+c3aRj7ogYBipSYONIDXCAdA2UlIANk8I+6elGDMkG5c/UzuvA0M2N7uoswr/2QrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBCQoc+AS2YB2IJE/sZUTI0BFd7gEzKlUkbuq/0he3k=;
 b=GJp0cJ2xi54glSDt+BU325Hby+6Y3mrCXZlBrzqEMka/8jyENw589LVNe3ZMRPVJTGxTuHExeZO9qCcM93P3eLksbKjsXt2iAj/zAhmXCRG6e13A6vIuvopsFNZe2ASMwXR0lp+NFSLm/L5mYeU7Jtr0eZiy0f1gz4LVi0BPN5h8wuZ2pzWbZRWdafRUe8vEALMQVG7WOlwkR9S7BNdxHe7iBxuswWoC5+HhbAHvWY5Z633JAamFGetUZSZvE5r2iQ0FBHEGTKQGR/k5LASL3Q/3QXR8uCciFennqB3F3Gzx1G7YxsXFD2s1ZcZH1g5j1UgH0AQVhxOhCaWWyMp0kA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3372.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 18:02:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:02:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nick Desaulniers <ndesaulniers@google.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH v2] powerpc/inst: add PPC_TLBILX_LPID
Thread-Topic: [PATCH v2] powerpc/inst: add PPC_TLBILX_LPID
Thread-Index: AQHZxjCiMrjrqr8fkUG803UqwYUpp6/Y3NqA
Date: Thu, 3 Aug 2023 18:02:08 +0000
Message-ID: <eb73a052-7841-16ac-b01a-40a11dce34e5@csgroup.eu>
References: <20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@google.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@google.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3372:EE_
x-ms-office365-filtering-correlation-id: 4db18974-30a5-4405-fb99-08db944bc12d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZE9Idf+pkwYFntfsSPpuFPzjbu/9YKUQ7GheTtTsYvc6PeL9eT+iGYGWXEebc/PxLDjNMRsxUYsBMQFNo/PRI2u1MKxe1acuVxr75nNqdxxhFZVmggRbMk9fYCTDY6rUihuTJe1QRee8CFqh9APETCp1PFQ7s2jF3lwOHnxXOcpK8SKOM61XhJWk1wf8Hs+Z9c+0+0t/MyU9lAFF9uemmmxXzaPDAPes39YSTFHAEGZtWltinhRTCLD6XYSmwR1a5lbAXcKcP+8LyFb4aXbdGbYe6XEa6/HFlSKXJ5Hn2bqthH28D9hUK1Bmzhwa4MVArUllwDMb3P8g6mSrBospYQcJ7wjwwvVz/haAe03+a15Ggzn0e9UxROjXJga11+9Zxbbu69YrOVCICWpLwMFdyx2413gx4HmojkUAjSLHBXRif1CsrIY8KZujIK9RLHLtyF9k0Kf68OqeVwWoIiRfr10+miKysdldvg2AOokR6xBW6lkA0LEbDwCu/KMgTjPAvrAfOcwVtPCT6I1dDIthBN/EE2hWhi2OU0zHa1k/hujrtNNpgn01DpbsbN7ztGcK4HUGqa8WniC1SJxqCXwwqJ3wU8X8jndty7a4/+zl3qXMwvZCdxsu2Te1zvkLiOS5Im9vHbXPLDpnf7TaopWyPt+7s5Nz0DpUvCE4oNvbSBEQsY5V0VQFgRXLwR90c0zCrPSpWl4n4DCa+SZJ17kYTw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(136003)(346002)(396003)(366004)(376002)(451199021)(66574015)(2616005)(6506007)(83380400001)(186003)(26005)(8676002)(76116006)(316002)(66556008)(2906002)(91956017)(4326008)(64756008)(66946007)(5660300002)(66446008)(66476007)(41300700001)(7416002)(44832011)(8936002)(6486002)(71200400001)(966005)(6512007)(54906003)(110136005)(478600001)(38100700002)(122000001)(31696002)(86362001)(36756003)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QkhSN2ZnU2ZkeWc5WGVnQlh5clhjK0dUMEJlNnJQaTAza3lpSWJROU5mT09p?=
 =?utf-8?B?M2Z3UmFGR2xmNytwU2pNeXV6UjJhQnkvU3JvNktDdHVZeG1wTThROGxnNFlY?=
 =?utf-8?B?MmlwQlR6Vm1ycjM2S00zanRmTHdTZnZWNG1hUW9sQ0IwL2RBQnhyTTVyejZt?=
 =?utf-8?B?K0t2V3BNK09jdU9pV25NV2oyeEcvZEc4YlJzWW50M1VNY2NpWkF5OWtUSW9W?=
 =?utf-8?B?Q29vbk1YV2FuNVNFeDAxaUgyS09nR0V1M2N3WWdXU09rbExLVEY1L2RQTEha?=
 =?utf-8?B?S3ppZXNJeGxiWjVmZjM5bzhoOG52QVBaM2U5K1Y3YmNXVkx2TjhtNERBekds?=
 =?utf-8?B?Y29RZDErcHdhb2lrbW5sdUFYRjMveTlmd2dWN3NYMUt5RXVOUkJlelRGaG43?=
 =?utf-8?B?bkE3OXY3c3ZlaG5NWGRoRVh6NS9tYVNoRkJ5dWhhOEg0bTB0QWgvRnZmZ1Vu?=
 =?utf-8?B?ditqVUo1MzFZMkhtRFVlWGdrb3lwNWdGU0JYeTBCTUs1MkNkR1FEMWxtQUdY?=
 =?utf-8?B?c1JmeGdqNGI0QVVOM2hNcGdDN1JlRXA3SHo4QlRxMDJWSTBlS0dERHBkYnd0?=
 =?utf-8?B?UjNzOG16aTlCNGhnRloxcE1wQUVGU3JvT3ZyUDZxUnQyOWZWWU16NWw0ZmYr?=
 =?utf-8?B?K3NUZk1hTEoyWXFnelBrKzFLWWM4dG40NkVvc2FraC9zYWR2V2ZyQnRheDZh?=
 =?utf-8?B?SmtXOGs5eVZMQWZ4Q0UxajgyaWIwLzlwbE9IaVU1dk9ta3BYaW9lQ2Z0bVRr?=
 =?utf-8?B?WkhEa2phOUc3bzJ5Yk5GWW5kUXRUNEtpNXYzakJmZ0t1RDBYNWsvVHBQZDhD?=
 =?utf-8?B?KzRtYVp4eEpqU3A3TzhBQjhPQS9nV2VpdUJHeXdOckJBSk5xOENMNzBYZG1I?=
 =?utf-8?B?MXdHYTJwb1pEcUx4NGVuc29LVVNoenhTeWUrM3BHQWFSb3J6aEJVQU14YnI0?=
 =?utf-8?B?WVRoYVViSEFQKzFiVVdObVFDZkZuQVExY2E1S3NzcHNTcVNtd3F2bTJac29R?=
 =?utf-8?B?V1hTaXUyc3RaOTFoUDh2Ujh5dUU2elNnUXZJbi93cFFyUDJRaVk0MVJXLytj?=
 =?utf-8?B?ZG5UZlFqM1A0RGVNOHBFSXUwKzdkajd2M0M1NlNiaW41K0pMTE9MU2RSRjZH?=
 =?utf-8?B?U0REVWloRFE5Mi9YSEludG54bHNHRStMYmdRUGNqL3A0YmhRM0VkSVBhdVc1?=
 =?utf-8?B?b1ZkZjgzUUp3cHM4VEJUZythNElNdElxd3RtWTJrbXdXVk1pSEN2NGo2R3ln?=
 =?utf-8?B?UW1vdGM4dmU2dXgza0dUb1RhUVpUNWdNallXdk1YUGkxUk93RXEwQkhLZnl2?=
 =?utf-8?B?SGc4TEhvbGtURWxZQjgvVnJaM3puVUJQcTZxaGRMclJVcFBvUlRjN0hEUGRQ?=
 =?utf-8?B?by8rd0UwUVFIQ3Q0eGZ4d2lSb3lwOW4xQmUvZWM1UGtBTW9lNWk2dUVYVEFO?=
 =?utf-8?B?NzNwRk5xc1F3dG1neE1yMGdQR21tQ2lpQnhrdTBDbXg1b0NaT3haVVloQjVE?=
 =?utf-8?B?UnBqaVpDbE1LNmEwT1YycC91UTlKNmh2MSt5cUVHWXoyWXNybnJWVFY1aHlH?=
 =?utf-8?B?OXUvK1FtQnRqeDBPZjNhMUFhdWlsUXh4bi9HNUprSlV1VThKc2dCZlB5MWdE?=
 =?utf-8?B?cEI4eVR5OEpINlY1c3ZUMVpPRHdwUGh3bnQzVlBaRUFzWk9WbHo5U0F4NlQv?=
 =?utf-8?B?TWQyeUp0YWJwcTRKS2w0MEYvWS9rcUw1WndKcXRqL3JUNGtjN095b1FwYklL?=
 =?utf-8?B?NmxnZmRCQlczdTI3ek9YSXcvNVVqb2F3TXZhOG9DOE5YZUhua3lEU00yVHg3?=
 =?utf-8?B?bDhlcEtPUVBUTkhKNnc0bW5IMFVNeDVLdVNIc1ZTQnZ3TlNIWVZNSkpSYS9Q?=
 =?utf-8?B?R0gyWmlSK283czNsNE9FWVJiZXVWQXV6V3puYVBaODNUZzl0SkFjRHVvQTFl?=
 =?utf-8?B?TldvdHdPVnVuNnV4TjYzazkvTlpjYlBFamkraGF2Q0xkTG92Y0hXSk43MnpL?=
 =?utf-8?B?aVB3cmt0WG5mK2Uyams5ZldVc3ZJYUdWdzBNVFA0Y0xhKzU2dkgxWG5BVlJC?=
 =?utf-8?B?WnJQRVB6VkxYOXc3YnFNNi85bjl2U1pIaFVzUkZabG9oQUJ2ODgvcllsekR6?=
 =?utf-8?Q?b6OZo+NoHn07Ff6lEauHQsJ4A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87DFE20C5524EB40A91BB229D33C367B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db18974-30a5-4405-fb99-08db944bc12d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 18:02:08.7337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pT0eAOxHP83EKBD8uoCp5Hi7XaRkCEIRMIwaLq1xsLpogM/BqYJQpjyrsLKAd8gtujU3VORJudvhWSgYHIF9ExcmWbLQbxENlPIOn5XvaSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3372
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA4LzIwMjMgw6AgMTk6MzMsIE5pY2sgRGVzYXVsbmllcnMgYSDDqWNyaXTCoDoN
Cj4gQ2xhbmcgZGlkbid0IHJlY29nbml6ZSB0aGUgaW5zdHJ1Y3Rpb24gdGxiaWx4bHBpZC4gVGhp
cyB3YXMgZml4ZWQgaW4NCj4gY2xhbmctMTggWzBdIHRoZW4gYmFja3BvcnRlZCB0byBjbGFuZy0x
NyBbMV0uICBUbyBzdXBwb3J0IGNsYW5nLTE2IGFuZA0KPiBvbGRlciwgcmF0aGVyIHRoYW4gdXNp
bmcgdGhhdCBpbnN0cnVjdGlvbiBiYXJlIGluIGlubGluZSBhc20sIGFkZCBpdCB0bw0KPiBwcGMt
b3Bjb2RlLmggYW5kIHVzZSB0aGF0IG1hY3JvIGFzIGlzIGRvbmUgZWxzZXdoZXJlIGZvciBvdGhl
cg0KPiBpbnN0cnVjdGlvbnMuDQoNCkNhbiB5b3UgbWVudGlvbiB0aGF0IHBhdGNoIGluIGh0dHBz
Oi8vZ2l0aHViLmNvbS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzM1MA0KDQo+IA0KPiBMaW5rOiBo
dHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xODkxDQo+IExp
bms6IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9pc3N1ZXMvNjQwODANCj4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC81MzY0OGFj
MWQwYzk1M2FlNmQwMDg4NjRkZDJlZGRiNDM3YTkyNDY4IFswXQ0KPiBMaW5rOiBodHRwczovL2dp
dGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QtcmVsZWFzZS1wcnMvY29tbWl0LzBhZjdlNWU1NGE4
YzdhYzY2NTc3M2FjMWFkYTMyODcxM2U4MzM4ZjUgWzFdDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sbHZtLzIwMjMwNzIxMTk0NS5UU1BjeU9oaC1sa3BAaW50ZWwuY29tLw0KPiBTdWdnZXN0
ZWQtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gU2lnbmVkLW9m
Zi1ieTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+DQo+IC0tLQ0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAtIGFkZCAyIG1pc3NpbmcgdGFicyB0byBQUENfUkFXX1RMQklM
WF9MUElEDQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDgw
My1wcGNfdGxiaWx4bHBpZC12MS0xLTg0YTFiYzVjZjk2M0Bnb29nbGUuY29tDQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmggfCAgNCArKystDQo+ICAgYXJj
aC9wb3dlcnBjL2t2bS9lNTAwbWMuYyAgICAgICAgICAgICB8IDEwICsrKysrKystLS0NCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwYy1vcGNvZGUuaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmgNCj4gaW5kZXggZWY2OTcyYWEzM2I5Li5m
MzdkOGQ4Y2JlYzYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMt
b3Bjb2RlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwYy1vcGNvZGUuaA0K
PiBAQCAtMzk3LDcgKzM5Nyw4IEBADQo+ICAgI2RlZmluZSBQUENfUkFXX1JGQ0kJCQkoMHg0YzAw
MDA2NikNCj4gICAjZGVmaW5lIFBQQ19SQVdfUkZESQkJCSgweDRjMDAwMDRlKQ0KPiAgICNkZWZp
bmUgUFBDX1JBV19SRk1DSQkJCSgweDRjMDAwMDRjKQ0KPiAtI2RlZmluZSBQUENfUkFXX1RMQklM
WCh0LCBhLCBiKQkJKDB4N2MwMDAwMjQgfCBfX1BQQ19UX1RMQih0KSB8IAlfX1BQQ19SQTAoYSkg
fCBfX1BQQ19SQihiKSkNCj4gKyNkZWZpbmUgUFBDX1JBV19UTEJJTFhfTFBJRAkJKDB4N2MwMDAw
MjQpDQo+ICsjZGVmaW5lIFBQQ19SQVdfVExCSUxYKHQsIGEsIGIpCQkoUFBDX1JBV19UTEJJTFhf
TFBJRCB8IF9fUFBDX1RfVExCKHQpIHwgX19QUENfUkEwKGEpIHwgX19QUENfUkIoYikpDQoNCkNh
biB3ZSBhdm9pZCBjaGFuZ2luZyBQUENfUkFXX1RMQklMWCB0byBtaW5pbWlzZSB0aGUgY2h1cm4g
YW5kIG1pbmltaXNlIA0KdGhlIGNodXJuIHdoZW4gd2UgcmVtb3ZlIFBQQ19SQVdfVExCSUxYX0xQ
SUQgaW4gdHdvIHllYXJzLg0KDQo+ICAgI2RlZmluZSBQUENfUkFXX1dBSVRfdjIwMwkJKDB4N2Mw
MDAwN2MpDQo+ICAgI2RlZmluZSBQUENfUkFXX1dBSVQodywgcCkJCSgweDdjMDAwMDNjIHwgX19Q
UENfV0ModykgfCBfX1BQQ19QTChwKSkNCj4gICAjZGVmaW5lIFBQQ19SQVdfVExCSUUobHAsIGEp
CQkoMHg3YzAwMDI2NCB8IF9fX1BQQ19SQihhKSB8IF9fX1BQQ19SUyhscCkpDQo+IEBAIC02MTYs
NiArNjE3LDcgQEANCj4gICAjZGVmaW5lIFBQQ19UTEJJTFgodCwgYSwgYikJc3RyaW5naWZ5X2lu
X2MoLmxvbmcgUFBDX1JBV19UTEJJTFgodCwgYSwgYikpDQo+ICAgI2RlZmluZSBQUENfVExCSUxY
X0FMTChhLCBiKQlQUENfVExCSUxYKDAsIGEsIGIpDQo+ICAgI2RlZmluZSBQUENfVExCSUxYX1BJ
RChhLCBiKQlQUENfVExCSUxYKDEsIGEsIGIpDQo+ICsjZGVmaW5lIFBQQ19UTEJJTFhfTFBJRAkJ
c3RyaW5naWZ5X2luX2MoLmxvbmcgUFBDX1JBV19UTEJJTFhfTFBJRCkNCj4gICAjZGVmaW5lIFBQ
Q19UTEJJTFhfVkEoYSwgYikJUFBDX1RMQklMWCgzLCBhLCBiKQ0KPiAgICNkZWZpbmUgUFBDX1dB
SVRfdjIwMwkJc3RyaW5naWZ5X2luX2MoLmxvbmcgUFBDX1JBV19XQUlUX3YyMDMpDQo+ICAgI2Rl
ZmluZSBQUENfV0FJVCh3LCBwKQkJc3RyaW5naWZ5X2luX2MoLmxvbmcgUFBDX1JBV19XQUlUKHcs
IHApKQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYyBiL2FyY2gvcG93
ZXJwYy9rdm0vZTUwMG1jLmMNCj4gaW5kZXggZDU4ZGY3MWFjZTU4Li5kYzA1NGI4YjUwMzIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2t2bS9lNTAwbWMuYw0KPiBAQCAtMTYsMTAgKzE2LDExIEBADQo+ICAgI2luY2x1ZGUgPGxp
bnV4L21pc2NkZXZpY2UuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAgDQo+
IC0jaW5jbHVkZSA8YXNtL3JlZy5oPg0KPiAgICNpbmNsdWRlIDxhc20vY3B1dGFibGUuaD4NCj4g
LSNpbmNsdWRlIDxhc20va3ZtX3BwYy5oPg0KPiAgICNpbmNsdWRlIDxhc20vZGJlbGwuaD4NCj4g
KyNpbmNsdWRlIDxhc20va3ZtX3BwYy5oPg0KPiArI2luY2x1ZGUgPGFzbS9wcGMtb3Bjb2RlLmg+
DQo+ICsjaW5jbHVkZSA8YXNtL3JlZy5oPg0KPiAgIA0KPiAgICNpbmNsdWRlICJib29rZS5oIg0K
PiAgICNpbmNsdWRlICJlNTAwLmgiDQo+IEBAIC05Miw3ICs5MywxMCBAQCB2b2lkIGt2bXBwY19l
NTAwX3RsYmlsX2FsbChzdHJ1Y3Qga3ZtcHBjX3ZjcHVfZTUwMCAqdmNwdV9lNTAwKQ0KPiAgIA0K
PiAgIAlsb2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+ICAgCW10c3ByKFNQUk5fTUFTNSwgTUFTNV9T
R1MgfCBnZXRfbHBpZCgmdmNwdV9lNTAwLT52Y3B1KSk7DQo+IC0JYXNtIHZvbGF0aWxlKCJ0bGJp
bHhscGlkIik7DQo+ICsJLyogY2xhbmctMTcgYW5kIG9sZGVyIGNvdWxkIG5vdCBhc3NlbWJsZSB0
bGJpbHhscGlkLg0KPiArCSAqIGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzE4OTENCj4gKwkgKi8NCg0KSSB0aGluayB0aGF0J3MgdGhlIG5ldHdvcmtpbmcg
c3Vic3lzdGVtIGNvbW1lbnRzIHN0eWxlLg0KT3RoZXIgcGFydHMgb2Yga2VybmVsIGhhdmUgLyog
b24gaXRzIG93biBlbXB0eSBsaW5lIGFuZCB0aGUgdGV4dCBzdGFydHMgDQpmb2xsb3dpbmcgbGlu
ZS4NCg0KPiArCWFzbSB2b2xhdGlsZSAoUFBDX1RMQklMWF9MUElEKTsNCj4gICAJbXRzcHIoU1BS
Tl9NQVM1LCAwKTsNCj4gICAJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiAgIH0NCj4gDQo+
IC0tLQ0KPiBiYXNlLWNvbW1pdDogN2JhZmJkNDAyN2FlODY1NzJmMzA4YzRkZGY5MzEyMGM5MDEy
NjMzMg0KPiBjaGFuZ2UtaWQ6IDIwMjMwODAzLXBwY190bGJpbHhscGlkLWNmZGJmNGZkNGY3Zg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KDQoNCkNocmlzdG9waGUNCg==
