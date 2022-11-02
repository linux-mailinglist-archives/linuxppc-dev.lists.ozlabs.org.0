Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0E615DE7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 09:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2KyR2T1qz3cfF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 19:37:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gbBuF1M3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.82; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gbBuF1M3;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90082.outbound.protection.outlook.com [40.107.9.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2KxR6Snrz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 19:36:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFTQamhEq2zj9oaDLDPk2wgSd44MkfNMLfJFTUxfIUMsBPjeZ7QagHoN+hEebuyaT2Fc2BEQXZZrXVZ6M1w0lR4zaQbfM78j2Y+0MMzrN16tszRXZMQAdeQUiYQyMIfeM7WtIB3iaFmMcPXnKvwPHZ4bYnW4rzctqirIEEN4QRbL8MJ/BsjpIOTM7LQOyj3LYOeSdjN64/l3jqX8W00+6YrQfv3TlY3b/i+49eotQG0aJTwEj2WQbp0RVF+u2Gaz0rKrxcJW5PET3kQMuYHCltsHdj5rq7YbPIA3tYLTmCdAj9WMTGFsuvgOm8pRFAIwYIt1UjEvfyH0H7CrAVNElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Up6oh6wazlOJaqsxerApEKaApVnktqoyPO00vwhz44=;
 b=MRI1gAy0/78gRN+QkVm7bSs/gi2hsAc/JY+CadrOasTxLWfz2X5iFeHn189Co+Va6gLXiDadOSp/TsZmtdx4NEfIxs6CapSaTb7yeiMKwLNWKkl8gASMa5u5IHuG7dqeMwujX3N1F77WUPQm9CTqPk5eJCKPy+EQN8cxAahRwvxboQ+uA081LIxnq3LbNdX/yb5fxEfTG5XqZZkst4rukynBkecENxf4PdwB5WzzUpxiKC82oydsveRTAXZF0txd4RuesxFaew7bo2B/1IP5hRRH12WCbxS1rXlrU1wxBbpiL4zThjJ/2bN1sd+dEXWXhi8Quz7q/5ja7XDIv96+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Up6oh6wazlOJaqsxerApEKaApVnktqoyPO00vwhz44=;
 b=gbBuF1M3/mZPucQ+w9WtXY6or2dNqj1ioFCvCTP5MTQW7ZLLliRHSEOeNlT3do02CBR3KYaoLnpwSXMwYxE4IuN5i+6WEnAUZDxGzjOjYpooGdbeiLMWr96XXbN2A0WeRW5qm0RM0RgJv1hLikkgA8G5HYUS9UD6WN4ioAzZsoUvmU4/Epii4ZVp0VFMUlP1luBMMLQpez9dbA5y5HXVqXD3WxQTpobnFG8ju+PbBaQIKenXjp00YXL+HwuoeZ7Gt19Pcol98FNa8mlZK0jYRnWCeuTQZWfn4fLam2OK3JyFWM6Onk8MfbV+c5Usyj1WXdUl67ZK9shl+WRISk/5MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1864.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 08:36:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 08:36:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/5] powerpc/kprobes: Remove unnecessary headers from
 kprobes
Thread-Topic: [PATCH 5/5] powerpc/kprobes: Remove unnecessary headers from
 kprobes
Thread-Index: AQHY5KmMotCjR8EL+kyeIHEF1xtGtq4rYw4A
Date: Wed, 2 Nov 2022 08:36:24 +0000
Message-ID: <9747a449-a790-707a-e4f5-174f4bf52007@csgroup.eu>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
 <bf3c70d498a24a0c466657f396291f2298744ef8.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To:  <bf3c70d498a24a0c466657f396291f2298744ef8.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1864:EE_
x-ms-office365-filtering-correlation-id: a2435ca6-45d5-4cdb-fc02-08dabcad53dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  YoVfihvYcTs/fhto3CWd3UPQYnCmHos7xd9VR42T4S6uWpv5eyXMcvVgvOHtP6tBckYgU3FVupS6a8D0K7RMyVUYrl+N0nAfcPbfDZ2r7E0Cev07Ao7Pza+vbHHrXSq5FDs9Oxc9G2Z33kN7w+jnoaRVKbc/0xKjyZ+fio/n8ScDH2Kw9RkfC0OGqaZP0n/aJ4/W3j0jbp3NMMsT8BUUMghNluru7CbN0U/rJzziekZDbSewN/KoPm/fBsbcwvCa6vT4uH++4UfZkflnzxJzuG1luVGGC3NX01gSgrg37RFf7hTaLqWyqwB0MaBryFDrITNv/sHqKt+Eft5FwyDrNYs4aImx5aDDi60N65uI+58SO3z9IQxSpaaT1vM8wwlnPmTRVWCFykW9ww0ZwkZnRx+0TsNGow5wikFYQtfMSvGz0Qh89dcpO/AbgMaI+epRWjD9pZ+xd/Y8gxsMvEAfH8alVzZuMWBr6mNr80xo2mpNJH1cDFYrF7m678l+nY9nX4B3Gb7NjPonyL0KPn2I1YV/QQ8sdkGtkos1XJ4Ggw6J7tQaorSsyLccmq87cv9Os+dolpU9ggP1gxevXyIihMxKiFjfGJbycg6Ur0BBB6KkngQ4dOa/BaZpaEFUtBaHyZlb4Hn9Liqu54VGwpG//XWYE4JIICU8GI8qpTi7RAOTSba/CI0ydGaRp/Z3hev26paIbvy+UKapww1tLMdwyvR/JPjcv6LCBjAiZQR1DF7i64FyK8NQCYo7+4W6KZp43BnPJ7ci+2wpz/UeToauJf1cb/U7/+G6tNTdY7ukO3OeW7XNcvzaEk/b1tH4l5VOfpRGtfFrTSGhJvcVoXID9g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39850400004)(346002)(366004)(451199015)(36756003)(31686004)(38100700002)(31696002)(122000001)(76116006)(5660300002)(44832011)(2906002)(83380400001)(38070700005)(86362001)(316002)(26005)(6512007)(54906003)(2616005)(186003)(71200400001)(478600001)(8936002)(6486002)(8676002)(110136005)(41300700001)(66476007)(66946007)(4326008)(66446008)(64756008)(66556008)(91956017)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWJ1QjBrTVc1clFoMDVISXphYXVFb1NDNmliZXZucGVacHVaWVFjYjRsTnFY?=
 =?utf-8?B?WmxwYjV2WWs1UEdkUTNKNE5QRzFGR0pSTkZMRy9IMUEvVUxuVXZ6VmxRZGtK?=
 =?utf-8?B?emZKL3hiZ3N1eTI1L2pSQ25wdXZ0UFpUR2NDVER0aWdqbi9BdTRTU095RDQv?=
 =?utf-8?B?cElBY0g2TURDZmxiS1pWeTRxd3FOcXBBZit5WnJReitIeWlRci9XL0RlSmxq?=
 =?utf-8?B?Vml6SGhXTVZ0dUF0R0VadkxLTCtsQkNRS0VEODBuNndjWlg2aHFWdUJNMDFu?=
 =?utf-8?B?SWJaaUpNbDI0NHZZU1RPOHpVU1VURklWWEVPb0h4b2hsS0RNaUJWbkF2VHBi?=
 =?utf-8?B?YkpBZWd4OG1LRXl5SUF6ODdOTUpqSURmL09wQnB2cnUydDJQUnNRS0FsT0Zl?=
 =?utf-8?B?NjJ3MGRCZHU4NmExeG9zZEVUZWJ1MEtvcHB4TVdwdkRqaEdRWlBmVmsyWi9p?=
 =?utf-8?B?eVBQR1MwK3h1UUZNUTJuUGhKaXNsOWQ4UmZkZVo2M3E5VGZCRkdTeHdkM3ll?=
 =?utf-8?B?ZWlWRzdZblg5aURSc0Q2WFZJMjdteE00NUxwak1XT2xGMXFrK092MTlnNXpO?=
 =?utf-8?B?TC8zOWRWWmVVbGpBand6T3pHUWkxQy9ENmoyaDJ6M3MwODV1OTFHejZCSGx5?=
 =?utf-8?B?VjVMMUtLbEVTaXhhMlBRLzZ5T1M5SVhablZCTS9YdVZaOENaeXZCeWVxcXl4?=
 =?utf-8?B?ZTdaV3Z3M0YrM3dkYk9acmgyQTZvU3hXbnFtejZwdlVPcjdta3RRRVZGUmlv?=
 =?utf-8?B?M05kdUkvaFc2RUhXcmxPbThOR1pVN2JaaGRZSG5nN1NPSFdQMjg5SnloWjdW?=
 =?utf-8?B?U0FiTTg5RExoWFk1MmlxYk5FelRhek1SR0pFUmJ0a1FUdzNIaTdpMk9QWHdS?=
 =?utf-8?B?MHJ6eEs3bTJnZkM5bHpRQU1LeWpyOXhwTW5MT0VCamYxcHY3UGdBT2xsR0Rm?=
 =?utf-8?B?NUVBUTN1SGtZTEsyRWpRVXNBb2pzd3FMYlFuaGRrdk95TWNmRHNJZEVHa2p6?=
 =?utf-8?B?Y1hNa3Q5QlBFbm1XQlFJSFBtVXVIVjNqU0dYdll0d1B6WHpUNmZDTVhNaGsx?=
 =?utf-8?B?MFM1WStHWDc4NlhpcnRtUy9vUHFjaG5JUTZRRXluUEVSdWJxWGsrNGI1MDhz?=
 =?utf-8?B?aHdTWEJlNzd4OWplamFock1LTGliNEhEdENBTXgwcFBSSHI5NUxLT3c4MTgv?=
 =?utf-8?B?b1pIdEZRYXBvM0RTY1VST0hSd1l4OXMxM055dzkxNWxpcVVCRVJIVWoxamc5?=
 =?utf-8?B?cDV0WjVnZ2Q0V0FCcTZtQ0JwKzE2RzJERExESkc2Zm9zMzZndVdEOGF6V1JI?=
 =?utf-8?B?dDhXVUYzdkpXSWVHWUZtTm1qWmJCZTRzRnpYS01IRmJXSjViNEEwOUR6WFMv?=
 =?utf-8?B?cEprajU4bWNWdjZkT01lNnBPRmMrdGdoMWlac1dmV2k3WllOSkxNWTl5RjUw?=
 =?utf-8?B?cHZLVysvb24yQ3d4VTF5T3BhbTdMSklOTDVvUHhSczhocys2UmZtMXN3QXVX?=
 =?utf-8?B?UE5Eank4bWQ1enRlejIxc2VPVjhtT29pYmJnUGtpNVRqVG9HRnhoZEJFbEpo?=
 =?utf-8?B?aWdGbXoybEhpZlo3bHhkdFkyWXJDOFp4T05abG1JYW5IalR4RTltbkVLYnZG?=
 =?utf-8?B?ZWpHZ3FuRk1FRWVOLytIbzZJVTVQZkpaMTM3UTNMVmM1RndVVGtnOUZwMXZH?=
 =?utf-8?B?RUxLQkp3bUlKVjVsUjN5SGo4b0hwRXFjOWpxZTFCajhOVms4dXFKK1A5djRw?=
 =?utf-8?B?cHB5cjl4Q21hVktNSll6eTgvS08vSFB0dVlsMXMxTUFzdDhUNTQ3TUIxbjZ4?=
 =?utf-8?B?dHhtMmUxaEpPOUZiaGJscnFRcGdESGJHSGZ5ZkpEd1BBS2xIQUR0OU1NN2ZX?=
 =?utf-8?B?K0F3ZDJxUjV0ZEZ3Ry8zdmtGaW4zSVJnRm82SmFJVHVPVEZiQ1RjcHVib0tZ?=
 =?utf-8?B?Q1VHTGlIV1ZVRWNtYURFRGo1WXg3L0xOdi8xS0Rac1A1azd5TnY2OTNkMGVY?=
 =?utf-8?B?Z0ZiSFFjK2gxS25kajR6c00zUU53bU5TOWcvZGRSZkZPQ3hCSGxuVWUwZGtF?=
 =?utf-8?B?ekVLbjJXOENNb2szWjlWMnFwYXBqU3N5L2ZRWHdzV0pjYUhTMzBHck5HQXQ4?=
 =?utf-8?B?eDdWVC9QR3czSGtIVFpLSHdhT1lrM2QyQ1A1Nk9HeS9xbHE4clBndTZzS0h5?=
 =?utf-8?Q?d3/00H9xpFjpqWenThX40no=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <182D3A43BDA17C41AA620D5BE638D10B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2435ca6-45d5-4cdb-fc02-08dabcad53dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 08:36:24.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RdCC+RNAmMh2RIP91xQjdO8QzzaS9FUUokeC5ADwVP7s5bobLUE8wyQ+HWzmp+fRjOZFVlFAmxeQWl9J2utDvXePhpDF7BnUbPx2eGzcRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1864
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
Cc: Jordan Niethe <jniethe5@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzEwLzIwMjIgw6AgMTk6MjksIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
TWFueSBvZiB0aGVzZSBoZWFkZXJzIGFyZSBub3QgbmVjZXNzYXJ5IHNpbmNlIHRob3NlIGFyZSBp
bmNsdWRlZA0KPiBpbmRpcmVjdGx5LCBvciB0aGUgY29kZSB1c2luZyB0aG9zZSBoZWFkZXJzIGhh
cyBiZWVuIHJlbW92ZWQuDQoNCkl0IGlzIHVzdWFsbHkgbm90IGEgZ29vZCBpZGVhIHRvIG5vdCBp
bmNsdWRlIGhlYWRlcnMgYmVjYXVzZSB0aGV5IGFyZSANCmFscmVhZHkgaW5jbHVkZWQgaW5kaXJl
Y3RseS4gSWYgb25lIGRheSBmb3Igc29tZSByZWFzb24gZGUgaW5kaXJlY3QgbGluayANCmdldHMg
cmVtb3ZlZCwgdGhlbiB5b3VyIGZpbGUgZG9lc24ndCBidWlsZCBhbnltb3JlLg0KDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBOYXZlZW4gTi4gUmFvIDxuYXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0u
Y29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMtZnRyYWNlLmMgfCA0
IC0tLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMuYyAgICAgICAgfCAyIC0tDQo+
ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jlcy1mdHJhY2UuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
a3Byb2Jlcy1mdHJhY2UuYw0KPiBpbmRleCAwNzJlYmU3ZjI5MGJhNy4uMDhlZDhhMTU4ZmQ3MjQg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jlcy1mdHJhY2UuYw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMtZnRyYWNlLmMNCj4gQEAgLTcsMTAgKzcs
NiBAQA0KPiAgICAqCQkgIElCTSBDb3Jwb3JhdGlvbg0KPiAgICAqLw0KPiAgICNpbmNsdWRlIDxs
aW51eC9rcHJvYmVzLmg+DQo+IC0jaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+DQo+IC0jaW5jbHVk
ZSA8bGludXgvaGFyZGlycS5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L3ByZWVtcHQuaD4NCj4gLSNp
bmNsdWRlIDxsaW51eC9mdHJhY2UuaD4NCj4gICANCj4gICAvKiBGdHJhY2UgY2FsbGJhY2sgaGFu
ZGxlciBmb3Iga3Byb2JlcyAqLw0KPiAgIHZvaWQga3Byb2JlX2Z0cmFjZV9oYW5kbGVyKHVuc2ln
bmVkIGxvbmcgbmlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9uaXAsDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jl
cy5jDQo+IGluZGV4IDg2Y2E1YTYxZWE5YWZiLi4zYmYyNTA3ZjA3ZTZjNiAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9rcHJvYmVzLmMNCj4gQEAgLTE0LDggKzE0LDYgQEANCj4gICAgKi8NCj4gICANCj4gICAj
aW5jbHVkZSA8bGludXgva3Byb2Jlcy5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L3B0cmFjZS5oPg0K
PiAtI2luY2x1ZGUgPGxpbnV4L3ByZWVtcHQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvZXh0YWJs
ZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9rZGVidWcuaD4NCj4gICAjaW5jbHVkZSA8bGludXgv
c2xhYi5oPg==
