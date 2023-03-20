Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E27DE6C13D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 14:43:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgGD85sH0z3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 00:43:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=MV1hAI2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=MV1hAI2W;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgGC975lVz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 00:43:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcG2c3iw4um0QZ9MTeTw6pBuwsn4LJYzboFn923xS0BsDsGddAt0kazjz1yaZxU9Qp3AWakUXcXoKONThtGcUENCqHq7bowDoD0L6HWV60W8K8TF3KeMr7buNIZKTtZvoBdqC5oEwgLRBJxZi+fxEarTJmK78T7FazYHq7jxAUVZlYo0S3Ohj63rNvsZAQK/7x1+T8oLmSv7gq72YWYRsnzQsoWIYvyQsFFT917upjT1P8limHLtDJ1eTW1myO+dhin8YlCUVYawlTgKmQNK8HuV1kx60BPCX5JLXnGVfeti8x1vvIheP4ciwm1MUqqHnThmQHwL/xK4anrQ9j86Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vc6IFHX5bruetsBxPsjgT/KOJg4uFa6c/K5s5Q4meo=;
 b=FBBOvzxJQ2Pw42nNahr+CmeIreMAWEvGfkHsLjuL01x5+3SlhNQe/W09Fc9V0kwz2109SZ+jYlyG+hfIvK4KElnWGggG+UG0KUW7ZwV0PyIuH6GIWuzlv1JU7Xe5GkGXIvNHvSMYmNjcE1a3C+8HV7pqcMymTtHloHMjpNFrtlPK9ivxvF5DhmDqqftvpSo0jk2sccEECXC3TuXKj4GQGQzMf4v1+IXrPAqbSrBWEXMPJvy4UauH8/51cMBOOA0osVLYW8rIXs2TWoBGz06zXbFXs1SW6PQnHEV0VWmo3nM49OEH6Bd6WNLxV95IQk1gQ8b6Llb1262fZme8lwmA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vc6IFHX5bruetsBxPsjgT/KOJg4uFa6c/K5s5Q4meo=;
 b=MV1hAI2WR8yVZtgNdK/6IZ7ObSf7fjfhrjlClkia0xMu3hV2nmwA3FDKFnyi+rrcLJ65ytL1/9XXbuJ47u/A40prx/7uFpE3tlKbPRmXvZgsuu3WFMCXskJdXCRtGLxeJclq4irkvPiJEmxRcJJ4Uf85OxyrsYbmKe5pTt3iLHRQV9QNgLseJ6V23zBol9K3BSSByUvVHQqMaErTKaOGN3eRXI/9U4Dd7uZHmM1QJE3Sqgk3idf2hkiS+CmDpBmUoyRTP0qAwP+AxEZd0CvANHm+2AygXiiesQ84H6UCdR5851A65w4N+Ma8kRMmC/3RYmrUXVukr6r/yHMaJwXwfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2399.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 13:42:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 13:42:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Tom Rix <trix@redhat.com>, "qiang.zhao@nxp.com" <qiang.zhao@nxp.com>,
	"leoyang.li@nxp.com" <leoyang.li@nxp.com>, "nathan@kernel.org"
	<nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Topic: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Index: AQHZWyrjgs5H+DwCsEybNZc01dEQDK8DrVMA
Date: Mon, 20 Mar 2023 13:42:32 +0000
Message-ID: <0ab9dd9a-f35c-e8d8-69cc-bd42ed150f94@csgroup.eu>
References: <20230320125202.1721775-1-trix@redhat.com>
In-Reply-To: <20230320125202.1721775-1-trix@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2399:EE_
x-ms-office365-filtering-correlation-id: 40966b79-035f-49cc-bf90-08db2948f50f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  b2UdxNkfcyZEouM4GQNXGnoYCpGWp/3425zf846ahcDmxb/uYKYRQNwNe+DEqSpADCkBd6LqowBrZtQId5A+mgNbcohEplQCslWChf6ybwyhOsvikpM0UvE6rjanYpdnVS2jKGgWgd4qZMT/F0CU5/so2M16m+4LxsDggvLDv2IhXVOtGGvoU+P2mgdrdScq8C5a/4YsiHS0q+04qtlNHop8bbsN2WMOBwFMSvRAggnLCPgoRzFV5CgVLox+tkQVsA+5kId4aIefJAVS6QpG7pxGifpfp0HXaxI7gDjv+CtQQiEdu6A1N4W/kldDVTjz0YUJB/KlQwKcXYdBNwVajh4Hz+JV4AtkrWW1AEOhodvrhpVLiVZ38TNujZttUGOljme4dswOEEdOai7gTsf+ePGsaX85U/cK4P+7mHp+crnDoMGaWu8WH6d9k4Mp6rCMd+K5PNLnbMfNCdo7EulJORmPJFCDUxO2AVUAv8aeXlkBN2/jhHtIJc3H3uNZc2y6m8QmSh/qYp0l+6v9t1AQVSdQFs77J/mTBa3BY8HVq0M2jVVr7oVVnIB/jfQ3WHr7eRRjZKatyG2XthASUuxJCFh776hJ5WRT1wwE5e3eFLr3zSHzuy1f6ZR2S+oEV2uJdeuV8ZI4r/pFUqAt0ymFUFV3OdqpjuAP43g+svInE+we4n5Li52nQlRxt+mypxKq6XerD8TKgVKk6hwEjixJFcN27YRFOuFs0HJXKZYJgrZh+wi2/Xq0EcqhFJiOSvzQOhfaHSC4cE7+/qEZba8+XA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39850400004)(376002)(366004)(451199018)(31686004)(2616005)(54906003)(83380400001)(6512007)(110136005)(71200400001)(478600001)(6486002)(6506007)(26005)(316002)(5660300002)(186003)(31696002)(44832011)(76116006)(38100700002)(86362001)(38070700005)(2906002)(8936002)(91956017)(66946007)(122000001)(4326008)(66446008)(36756003)(66476007)(8676002)(66556008)(64756008)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OFpYSENXaUtBR0NLVC9GZDJBNGh2d2hab0Yzd1RDaWozRVBZMFIvSk5vQ2Yv?=
 =?utf-8?B?U3Z0TzJkZ0tKOUtzNXllcHZQMWFvdStCMStrbFhkeHhWNy9MaG04ZitCWHpX?=
 =?utf-8?B?OWxCNDg2UlA0eW90bFJDaVlha1FWNlhmN2dFMytZSjg5SEM1UWcwdmY4aUFT?=
 =?utf-8?B?NjVHWjhaSFpnczVKSDJjUThINFVMNENGc3poWTNyREx2TWduQmZQZGJrU2xa?=
 =?utf-8?B?WHJNcU9XVTAvRk9CNXpldHV3bzNwdks4WU83N0xDSVFBUFd2S0VNUkJiZjYz?=
 =?utf-8?B?bFhza2dkb3J3TFNTcmpOMmlaQXR0bFp3a1gxK0FLNENvakpaNytrbEdSR3Uz?=
 =?utf-8?B?bFhSc0k1akFuMDFGTElGTWFoRnlrOGtuamVWRnZ0UGdNNVUyR0dyeEVMbnJK?=
 =?utf-8?B?T0psQk8yZEc2VThDN052UjdzSEtXZHZtaXdOUEZyZ05WWjl0L0tLV1VJWjJ6?=
 =?utf-8?B?d00vcG1wVXVid0N5Qk9JdlQ4eUZOemNRT0loYXRFdVpTeUY2dGt4cnNoTUNw?=
 =?utf-8?B?UWdBNjNSTmZVZmN3RDc0TUJwMkRWcnB5UVp6ZSs4WW5vV3FhTEpENlNJMjg1?=
 =?utf-8?B?b1VGdlFQR2Z4OFBmdkhyTmFqbUpFZzhxalBzSTQwcWtsV1FTMTh5VVVWNU1t?=
 =?utf-8?B?WlVCUHpMS0d3MGFmRmM5SnIvZnprUU1LcGN2VWVBajVjZkFmanVYb1czRERQ?=
 =?utf-8?B?a0JTNlljOWR6TjBEN3JWUDMzcm1OVnhIUG9BbXM2YU1mQzB3SGdwckU3YnIr?=
 =?utf-8?B?UFo2emZLZzBycUlXU1VFSVdqeFloZmRFbGlkZ0MzVHpIcDdJb0lKNFJtYm1i?=
 =?utf-8?B?eUtjVUE3bFRsb3RtaWZldzlON0M4N0trNEVIdEhwb0czTmZFc1gxT1EzWTdC?=
 =?utf-8?B?S1FBUFNaVWhKK3d0T0ZFUlBCMm5UN3BNVzN1cGVVWWYwRHhQb1JVT3gwVGdn?=
 =?utf-8?B?aERtdCsvdTIyUVE4bFFvMTlkcjR4ci9ncTI2b2haa0pqOGJnanRvV2wwZmJH?=
 =?utf-8?B?Tnh3cGtNYzJRQ1dvNkYwb3RtUFFVeGluS1F3M3h3U2ovakp3Ym9BczZKOUlw?=
 =?utf-8?B?ZmRKTFBSTG1kUTZudHpYN2duNVkwNDQxRWlTZXQxemdUQS9rNDhjZEVicURh?=
 =?utf-8?B?RWtPMVgrb1FhTHJHdHllUzZURWhNYkp6UHNBaDMzbE1EdUE4Nk1zMndmSHFw?=
 =?utf-8?B?ZnE0K25YbDd3VEFlSU1RMmJIVUViZkZyTndrT1J2K1hBUGFEdTdVeEtxT1FB?=
 =?utf-8?B?cTcyMFIxaU43NUpkRmMzMVVtbnZYMUhRWWFPNVN3ZldkNFZsM2hZK055N1ps?=
 =?utf-8?B?cGpMVVlkaFhDbDZHODdtQnlJTTN0bmxvbGE1TUVmdVQ5MDNqNHdTMW53WmR5?=
 =?utf-8?B?dG50Mjh4ejJnZkhaeEdVU0c0RnE0bkxtbjZhUm95eld2U0RjUFppc2ZaYzhs?=
 =?utf-8?B?Q2NKYlNZbTRMUERVcHJhdE1oUzcrUFJYSFhQNGxCM1MrUFkvRzJkMU95Qito?=
 =?utf-8?B?WHNnOW5NWmJLWHVKbDd1SjlZOExjSEhiajFxSGUzL3lDT2d6NzFBdkN5UFVB?=
 =?utf-8?B?cHJNNlozRGEzNHhxK2FnNUNqUFFkM3g1REdSbW9SNWRwM0x5eE9LTHBOaXpY?=
 =?utf-8?B?bEU4S3ZFaFVBWGE2emI1clZBYkxyRzBqdVd4OU9ZbjNTNzJXSFZ3VXYvalZx?=
 =?utf-8?B?ZVlFMUZ2Q3J0a1hBTFEvWHhwakg2OFdwczRQUHpFWnh2Tk04OXpPSGZVc2VZ?=
 =?utf-8?B?dXlCZVhrTHlCbVdKbkM5NW03VVBCcDhxODlhcmYxRmZYUmVHYmkxYjdzRTdl?=
 =?utf-8?B?M05zSElpL2V1TkJGV0toTlJJWlIrbUpNYU9Vc2dRc2hLN05JMHdWYTBUNmE0?=
 =?utf-8?B?VGNCTFpHQTVHVStyeWVieTFrOXZUdlJIRlVWS0djNmtudFViRDE1bitpTmpa?=
 =?utf-8?B?Tzl0RXdKeWoxYkhLdGh4TmI4TU1MWE5USitucmJKQmpWVXltdVhuS1RuSUtx?=
 =?utf-8?B?VXZLaDdwbFczU3h6S1lVMmdhaFBmS1VuVXpnRDk4VXJRc3RyK0IrdWpyVDMz?=
 =?utf-8?B?a1lJbjVHUC8rYlRCN1YxUzNVYlRwVWUzNGlhL1FZVmtnSm9rWHZhNzlHL2di?=
 =?utf-8?B?bXc0K2MyVDUrcEZnWWhmNWpXTGViTFJTclppVjUxMERqZEUxTUdDa1JVemVY?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AA1E761AB467B46A14A7BDD74424261@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40966b79-035f-49cc-bf90-08db2948f50f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 13:42:32.8423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7t9V75/oyZA3YvIrlqKSE1SM8iZrMFBFl/+XsuX7LIYlNDziFmZclK9iYbCJ1QYqaGJQNcuv66qw/9HDgGtjt0p5iFcLY+/NcHlF54bnNS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2399
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAzLzIwMjMgw6AgMTM6NTIsIFRvbSBSaXggYSDDqWNyaXTCoDoNCj4gY2xhbmcg
d2l0aCBXPTEgcmVwb3J0cw0KPiBkcml2ZXJzL3NvYy9mc2wvcWUvcWVfaWMuYzoyMzU6Mjk6IGVy
cm9yOiB1bnVzZWQgZnVuY3Rpb24NCj4gICAgJ3FlX2ljX2Zyb21faXJxJyBbLVdlcnJvciwtV3Vu
dXNlZC1mdW5jdGlvbl0NCj4gc3RhdGljIGlubGluZSBzdHJ1Y3QgcWVfaWMgKnFlX2ljX2Zyb21f
aXJxKHVuc2lnbmVkIGludCB2aXJxKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
Cj4gVGhlIHVzZSBvZiB0aGlzIGZ1bmN0aW9uIHdhcyByZW1vdmVkIHdpdGgNCj4gY29tbWl0IGQ3
YzI4NzhjZmNmYSAoInNvYzogZnNsOiBxZTogcmVtb3ZlIHVudXNlZCBxZV9pY19zZXRfKiBmdW5j
dGlvbnMiKQ0KPiANCj4gVGhpcyBmdW5jdGlvbiBpcyBub3QgdXNlZCwgc28gcmVtb3ZlIGl0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+
IC0tLQ0KPiB2MjogQWRkIHRvIGNvbW1pdCBsb2cgd2hlbiB0aGUgdXNlIHdhcyByZW1vdmVkLg0K
PiANCj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNsL3FlL3FlX2ljLmMgfCA1IC0tLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb2MvZnNsL3FlL3FlX2ljLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWVfaWMuYw0KPiBpbmRl
eCBiYmFlM2QzOWM3YmUuLmMwYjRmODY1ZmJhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2Mv
ZnNsL3FlL3FlX2ljLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlX2ljLmMNCj4gQEAg
LTIzMiwxMSArMjMyLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIHFlX2ljX3dyaXRlKF9fYmUzMiAg
X19pb21lbSAqYmFzZSwgdW5zaWduZWQgaW50IHJlZywNCj4gICAJaW93cml0ZTMyYmUodmFsdWUs
IGJhc2UgKyAocmVnID4+IDIpKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHN0cnVj
dCBxZV9pYyAqcWVfaWNfZnJvbV9pcnEodW5zaWduZWQgaW50IHZpcnEpDQo+IC17DQo+IC0JcmV0
dXJuIGlycV9nZXRfY2hpcF9kYXRhKHZpcnEpOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIGlubGlu
ZSBzdHJ1Y3QgcWVfaWMgKnFlX2ljX2Zyb21faXJxX2RhdGEoc3RydWN0IGlycV9kYXRhICpkKQ0K
PiAgIHsNCj4gICAJcmV0dXJuIGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOw0K
