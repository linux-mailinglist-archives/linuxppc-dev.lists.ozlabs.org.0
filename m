Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9146255CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 09:55:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7swQ1fYLz3f2w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 19:55:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KT/UM6pN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KT/UM6pN;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7svM6KVSz2xkx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 19:54:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpbIueBUEKX7xMvU/UepvtThLMMho3VkBc3aRcgvWtMeX6F7NP7NldQw9CfH9xWdfEg2Zv9u+28yWwLQNEcZKdtuz/x6peX8uXIGZniZvAydJeBt5blEJXMsKApMj2DAmDVH6CArd9+7sA98QMMQTUGo7vWoCNThjRYrH9ckMlajyqNsXPczQhWVr4CKaBuxuGPmXovE+J1XoFBHZRAmQQ3tE2AapSFDcHPUDzTADkOHqbguXbwzEuwdjkT8uURycvBnyWar3PqZvG5+a1n1KcqNFwPANkm7M2rdz2pOfUaSu5yRaNxWNenw3In1hXfzE9HqBTuxT5U4KzMZf0+f0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieERYg+J7uJJEQDmENYOtu7v7hZLNEqhSnU5HJS6aVQ=;
 b=hoYVOzlrsqPqBWzlb4sfMNaZGyz3QQNZTWY4WB3ePt6RzXNvYCeIXMzILH9I+r3/6oSoZdLT5nnl1uLhfchLih04xnLZPzdaI/hK7RwXfk+QgSYthcHc2utEgie60KLWhPVsOa2rLwyBkYQxlGYGCwVAYUOhMG5WPTrPNEt+M6weH/D+Nph+3DPD0F1LVJc93VTJ1F8vqhUzKGxFFg9RCRfjAhpsgyjAg9tYRKNxelBB2OYGB8M0L1J+IIKhaaWZWQgsF0VO7U5fxKu2wYxbKbIUJSwcGpVol7FYLrmXguFHjsQxDWltxqEiMwc2s4g6mpSEdc+Jvpj8fY6GYlQiWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieERYg+J7uJJEQDmENYOtu7v7hZLNEqhSnU5HJS6aVQ=;
 b=KT/UM6pNxdq/YN35X1lEXKSjiolp7i5iuwWHIq05ukF3UwQwVzq1jiB0TJm+YuMRIcXjfZYreF3u6ujCneQBneJmfdCsT/VF2iJX9VprKxf+Y0qupetQRrxzWhUFSCwDDvmGa/3d6zs//4xDBVBJNlqeVvpq6elbRr4CmO77m5OVJJS+U3lTH9Y1qFc8wEB7scnt7vsBFEyYjDfnSX7ToLJ6QjhB+3K/yFbbH6oUBjlSz+OyuKhmEyDgaVm3wDCJYjx1GxQ0wnJVTMYuRjUcaLQmN06OUOGaztkbaf5inQ7BqU0pnTNG1P9jMZBqx1bCh/kKGoMCVHRm8I1HTxl+Yw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2488.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 08:53:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 08:53:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Steven J. Hill" <sjhill@realitydiluted.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Writing not working to CPLD/FPGA.
Thread-Topic: Writing not working to CPLD/FPGA.
Thread-Index: AQHY9YLpkJXc6LB3EEecZVBlBVZV8a45azCA
Date: Fri, 11 Nov 2022 08:53:46 +0000
Message-ID: <4521e89b-a05b-a7b5-4fe0-35f7c898eb8f@csgroup.eu>
References: <8893e416-007c-f7b8-3b67-2ceec7db2e01@realitydiluted.com>
In-Reply-To: <8893e416-007c-f7b8-3b67-2ceec7db2e01@realitydiluted.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2488:EE_
x-ms-office365-filtering-correlation-id: 387392da-f057-4375-e981-08dac3c23e7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3YQ+yUbeQrpq600LI3kznNXaKIjauIBA0rbF183EHLwjaPB3VqWeAL1uvpjgrOJqR8tY6alfxncCV4XvGJVgEhi/9YvDJaGq2Ax3ygMBgpeBL/fgCBwZSjEmzDY8hPD75DFgqRSf/URxHONffToepATTbj11t3R1QCp2P7l/9LoSXM20mh+rAegid3PuqQaKXYtCw5XZUa6Wt48NTNxvMxVpmWotYb/9FAiZm8lCRQ1yPFbjjmvRcPXYSpRB6EVrUSCUUGfjjNYOQeJxo0uTNF4ZAkcyLhfN08dV8XYDJLqc5d2mhgoJadd1OH10mjHmWFialx8FdVmFqryFiIt9qXmzDoYCLjXklSZL+griYWmOZBmUVNPR2wpqtAkDXZ91UaA2NBzWHulhFRXbozIUKN4Xl8NjnRksM9EfFmRGEqs2GP+kodCY1Q8rHqvnDzQcJERFJRAFgbhUCGppp34HXo4raiirCrzjszjiSXRnuVzTa8H/XCbtcqIEKPl4g2wOyGRyADH4IP5M+dAsRGcJD3qhBGpa/TYatSwuePIVw6ccNn0PILLrkfuxBFyHYzPQwaFTDK/levgE+zXHcwPKYDtJG1WYm2HAI9VBz0R3rF7fUcZ0XUZdb0rqB9sYE/BvGaGNBfutX0rxP/b3HqqNio9gcP0UtkrL/bqz6UpqiK2fyWGnInCxTKFUN5YZenZrPkWLA1/VQB7PxAs9oUVV4YaQ8D4Qs3+OW5XIaVlVrz+dIgPtQOLJqtbuz9PYE1KiYFV0lYHj1tYq+XCVlQttMGNnLvUQr0dGFE7QXs2tZasn+x/ZMRE/I0/rp5XeZ8ys36EuDObeWEBhv9uZT9tx/giS+Swtq0xktiKs+Rya79M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(451199015)(5660300002)(2616005)(86362001)(186003)(6506007)(31696002)(6512007)(26005)(44832011)(316002)(76116006)(83380400001)(71200400001)(66446008)(66556008)(64756008)(66476007)(38070700005)(66946007)(66574015)(8936002)(8676002)(91956017)(478600001)(31686004)(36756003)(110136005)(122000001)(2906002)(38100700002)(41300700001)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eDBxenNjWXNWMWVlMWNqN0xPQklnaVU0bENWU29YRkVaSTl5QVl0T1pDRThk?=
 =?utf-8?B?SWN2b2ppQ0k2bHVwUXR2dDlJZkVNQThiNTR1SlFPRmdCYUhzRXM1SzJpSXA4?=
 =?utf-8?B?c0xoR0JyUHV2OTlJZTkzRnJNQkxEY09qUDIvRFdQSWs2a0NtUkprN0t1bFMw?=
 =?utf-8?B?WlF6L2g0SXVHQ213U3h6N2QrdWJCWHBIOWE4c20vWVU1Q2ZnZllJRUxBOTBW?=
 =?utf-8?B?RUQ3SHlyV2hBM0JrL2hLcnJtWHZrcXRJSzdLNnJvc0ZGL1dpbi9wUHRDSmF5?=
 =?utf-8?B?K0gxRlNRdjRZRzZjUzVONDkxWmpFekxNSzdIOE5RK3JpcnZMYjBHZEtaZWl4?=
 =?utf-8?B?U0ZEdThqbENLUlFMcm8wMGtpYWFhREFwaWlhZmhqZ1l2QW05L28yajRFbmRF?=
 =?utf-8?B?RVprUVVwbGpFY0liWk9EUXptRWVmUXkzZUlJRG92K0REdXdCSHBjZkhLSHVW?=
 =?utf-8?B?N20zQ1BKR1JDSTB5d0szbWR4OWtWNTl1VkQvQlJGR0REaGQwWE9zSk9taE05?=
 =?utf-8?B?OGNlYUd2Ui9hQ1dlQm1KZkpyVnB1QXJIMURrVjZITzNmQk1MZXMzYVNoaEFk?=
 =?utf-8?B?Z2ovclV0cWpnZkdZakRhT2VsNVlxN3hrWThscHlDdVJqNWRwWFY0ZG5vWVBM?=
 =?utf-8?B?SmpkUFpOMFpEZzFIWnhML0UrVE0wVmlzOFQzVktqMEgxeHVvb1hZNVFWYmxZ?=
 =?utf-8?B?VHhMdDJKSGNUdlRvODVTODFuN3Qwb3g2WmJJeU01MmFKN25CUnZVQVZNTnZQ?=
 =?utf-8?B?Q0VIdTFZaG1aZXJxT2FLVjcwb0tuSVhRNFZmWnJ6STNwUFlTK295TkZRV3px?=
 =?utf-8?B?WmJKOUVJM2ErMHM0Q1dJTmg2cEg2aDY2Qm1xQSthR2pNU2FjdHJYSk5hWGtY?=
 =?utf-8?B?QjVNcy9kRXE2dkhUTjlxSHJBVENTOW00R2xFRXNxanIzZTFVclpOOXF4RlFo?=
 =?utf-8?B?SXp0ZnZFYjFDYWZzZWV4MmJzaCsvRVNDRC85S0xhVkFCTXdyczRGeDEzOERV?=
 =?utf-8?B?RThKTFpKa2tINDdWa2pRY3ZwZEZ5V2FTckJGM2dqT1R6VmdDR1VVemNMT2d3?=
 =?utf-8?B?M1FOeWxYcFp4OFBFbTZQZzVrTmNqeWk3NmNCdHFSVWM2V2ZSeFNlSWZKbWx2?=
 =?utf-8?B?dnRXTFFTL3NDUzlkMWw1MGszbUpxZk9JdzJ0eW12ZlFvb2RNa21CWFB6K0Np?=
 =?utf-8?B?WGF3dU1zbjJxN29CaFIveGtTMVBjQ21QNHJoWEtreW1oOTdEMHNHbnQyWW9y?=
 =?utf-8?B?akFoTmFRd0MvRW1jcEdjZjJOQzkxQmdKaVpRS2hJNDBTTEhwZWY5TEkySkVH?=
 =?utf-8?B?YkFHdzd6WUo4V01ERGJqQzNQUFN6Nit1RWM2dHlFQkR2N29DcGdNaG5nR1hq?=
 =?utf-8?B?RXExUEJCMnNTSVV2cCs2UGp4N0pHanZ3SktNcy9JYnVqK25TMDZFZlJmWFVV?=
 =?utf-8?B?YVVEa1BGWEUvejJjV3o2Y1U0RUEyVElFUExmbCt6amk1RnAzMC9SU0x2QWI5?=
 =?utf-8?B?S1FqQTN1VjBMVkxaQ0FoT1VGZ202cHJoZmEzLzVoVzJveG9kSUM5SWVuY0hj?=
 =?utf-8?B?ZjZ5OElvWTZPNFNFTkRGQXdGNXZKK2hYYmNVVGxPYWpSVW5YUHVMZ2hyN09Q?=
 =?utf-8?B?VDhDTXVnLzNnaVlqYVZ3R0wwWFpHNzFIOWJIMzBrYzU4N1M3dk9ob0plT0sx?=
 =?utf-8?B?cXF2WVBBTGNGT0dRU09jSHl6QUNCSEM3SVA1eGFtSVQzWEFZVDVPYlhsOThP?=
 =?utf-8?B?TU9ESkVZeTNRdUdabXZMcXZUZkozSm1hRUlvZHZKMGc1TGRVN25GV3RCYWFy?=
 =?utf-8?B?U1huNlRlc0RaM0RUZ25XR2N1WEFvalNYcWFMY1BGTUs2WXJMK2dpcnFzZG9G?=
 =?utf-8?B?QjJpektZVTBaclV2M3RXaFE4K01Qam4wVHR5eUUzdCtEOUpCZm9EeWNkOUdU?=
 =?utf-8?B?emlURFdIVmd2d3J3eUd1UitqbDY3K2hGNStuRG8raVAwamc5SS83NjZjOFFD?=
 =?utf-8?B?cnhaUVFqVFBFSit6L204bXJPemZPN25pL1I3ZzFKMEd6TWVhZzV1SEVpa0hj?=
 =?utf-8?B?YVhsaVFGM0xpdGxsZHpPeUVod0hvZWlaVkozK1JoVkVtUGZPMG9sNzBnOEh5?=
 =?utf-8?B?OG0yU0U5ZnV1azBUNE1qTVltc1dQTk5sSXdCL2FRci9FNTRRdmQ0RVZsR1Rm?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A50DAD38A6E5B74EB66F53BE7FBC8AE2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 387392da-f057-4375-e981-08dac3c23e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 08:53:46.5347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWgTfql8FHEG5xyha8lEoVaMCo5wdn5JLkEy+LBJ2YnlP2sFti8hxrhdj2hyC+6o6cBag3oiVucewj3TfOij/5ab/hOFZ+ZyqYjs2Dr7wcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2488
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU3RldmUsDQoNCkxlIDExLzExLzIwMjIgw6AgMDE6NDUsIFN0ZXZlbiBKLiBIaWxsIGEgw6lj
cml0wqA6DQo+IEhlbGxvLg0KPiANCj4gTXkgcGxhdGZvcm0gaXMgYSA3NDQ3QSB3aXRoIE1hcnZl
bGwgR1Q2NDI2MCBicmlkZ2UgY2hpcC4gSSBoYXZlIGN1cnJlbnRseQ0KPiBnb3QgdGhlIGtlcm5l
bCB1cGdyYWRlZCB0byB2My4xMiAoc3RhcnRlZCBmcm9tIHYyLjYuMjYpIGFuZCBvbmx5IGhhdmUg
b25lDQo+IG1vcmUgcGllY2UgdG8gZ2V0IHdvcmtpbmcgdGhhdCBoYXMgbmV2ZXIgd29ya2VkLiBU
aGVyZSBpcyBhIENQTEQgb24gdGhlDQo+IGJvYXJkLiBJdCBtYXBzIGluIGp1c3QgZmluZSBhbmQg
SSBjYW4gcmVhZCB0aGUgcmVnaXN0ZXJzIHdpdGhvdXQgaXNzdWUuDQo+IEhvd2V2ZXIsIG5vbmUg
b2YgbXkgd3JpdGVzIHdvcmsuIEluIHRoZSBib290bG9hZGVyLCBJIGNhbiB3cml0ZSB0aGUgQ1BM
RA0KPiByZWdpc3RlcnMgd2l0aG91dCBpc3N1ZS4gVGhlIHByZWJvb3QgY29kZSBpbiAnYXJjaC9w
b3dlcnBjL2Jvb3QnIGNhbiBhbHNvDQo+IHdyaXRlIHRoZSBDUExEIHJlZ2lzdGVycy4gU28sIHdy
aXRlIGFjY2VzcyBzdG9wcyB3b3JraW5nIG9uY2UgdGhlIGtlcm5lbCBpcw0KPiBib290ZWQuIFVz
aW5nIF9QQUdFX05PX0NBQ0hFIHdpdGggaW9yZW1hcF9wcm90KCkgYW5kIG90aGVyIGZsYWdzIGRv
ZXMgbm90DQo+IHdvcmsuIEhhcyBhbnlvbmUgZWxzZSBldmVyIGVuY291bnRlcmVkIHNvbWV0aGlu
ZyBzaW1pbGFyIGJlaGF2aW9yIGluIHRoZQ0KPiBwYXN0PyBQbGVhc2UgQ0M6IG1lLiBJIGFtIG5v
dCBzdWJzY3JpYmVkIHRvIHRoZSBsaXN0LiBUaGFua3MgaW4gYWR2YW5jZS4NCj4gDQoNCg0KSXQn
cyBhIGJpdCBkaWZmaWN1bHQgdG8gYW5zd2VyIHdpdGhvdXQga25vd2luZyBtb3JlIGFib3V0IHlv
dXIgc2V0dXAuDQoNCkZpcnN0IG9mIGFsbCwga2VybmVsIDMuMTIgaXMgcHJlaGlzdG9yaWMuIEhh
dmUgeW91IHRyaWVkIHdpdGggbGF0ZXN0IA0Ka2VybmVsLCBvciBhdCBsZWFzdCB3aXRoIG9uZSBv
ZiB0aGUgbG9uZyB0ZXJtIHN1cHBvcnQgcmVsZWFzZXMgKHNlZSANCmh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvY2F0ZWdvcnkvcmVsZWFzZXMuaHRtbCkgPw0KDQpXaGVuIHlvdSBzYXkgbm9uZSBvZiB5
b3VyIHdyaXRlcyB3b3JrLCB3aGF0IGRvZXMgdGhhdCBtZWFuIGV4YWN0bHkgPyBEbyANCnlvdSBn
ZXQgYW55IGVycm9yLCBhbiBPb3BzLCBvciBpcyBpdCBibGluZGx5IGlnbm9yZWQgPw0KDQpIb3cg
ZG8geW91IHdyaXRlIHRvIHRoZSByZWdpc3RlciwgZG8geW91IHVzZSB0aGUgSU8gYWNjZXNzb3Jz
IG91dF9iZTMyKCkgDQpvciBlcXVpdmFsZW50ID8gSWYgeW91IGp1c3QgZGVyZWZlcmVuY2UgYSB2
b2xhdGlsZSBwb2ludGVyLCBwbGVhc2UgcmVhZCANCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvdm9sYXRpbGUtY29uc2lkZXJlZC1oYXJtZnVsLmh0bWwNCg0K
SSBkb24ndCB0aGluayBfUEFHRV9OT19DQUNIRSBpcyBlbm91Z2gsIHlvdSBhbHNvIG5lZWQgX1BB
R0VfR1VBUkRFRC4gVXNlIA0KZnVuY3Rpb24gaW9yZW1hcCgpLCBzZWUgDQpodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92My4xMi43NC9zb3VyY2UvYXJjaC9wb3dlcnBjL21tL3BndGFi
bGVfMzIuYyNMMTI5DQoNCkNocmlzdG9waGUNCg==
