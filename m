Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72A8387CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 08:11:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ncIQN/Kh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJytZ39Fhz3cTf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 18:11:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ncIQN/Kh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::601; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJysm5dkSz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 18:10:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmA6P6jZersX1aC3NlpXl1IzpRsVXhdnoqIhc9yom+GDr/Z9R29h72+LWcvHJXrZp5yUbAzPg0qBaWj7+J6oZp+e242r8PiyKTxCUtFE6aZokItDLSC6Ho4ID0DlmY6Ip+C3C96KbHZrm6wXKsqKt6duRe3sfCFGJcPjhVcbisGMwM56iVvQg33LC2P0kzLROhTP3y2eHFdz+vEuh7qyGSI3DG47tGqz7zf6OoSLqZVbTXY92IBvXgstUoGUZUM+XLpB6qlrIa/3U2yD301HMoubTyFKmwqqncc0n8O1XMJWOK655SHTe+/bIaDMLiJJfL6q28kC4LtkbG8nasG26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17CT3/KEpDK7QjOCaig36KL+D6kAoeiUqDd1I2IZV5U=;
 b=WHZSyWIl26xMB4ygPaeA3czKkhHAv+dQMDIx8LWfNSsQbBamCziVheuYNSJhpidmh9ZPho9m57c7rLd5CcwccjgkmSsBfAAWM8IN3X0MxcxHWJEoTBcKMGj+yYjtsFhd5wwqRfkXRl6RFQOzjD0TfBRsZxwbptkIhy6viaUwpV+2Xr0/CUjGtaWzEJCXn/lTDUcTeOZ4iPlCR6DAeokTAq0i5rH2xKoWUBIZ8nRUqzbkxJJF0MZaO6vyjoq8c1xToYoJajLQbpNnv61WaM0NsfZAkV7iSSbBuk+oOF0plW95OtwzLSbWhG+yAOqVvmsjwSyBKcCVSZNhfKIaNx7GwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17CT3/KEpDK7QjOCaig36KL+D6kAoeiUqDd1I2IZV5U=;
 b=ncIQN/Kh2m3eJbYfIlOJAuZv10eEtAv6FOuGu7Idw2Ot0emPXHPCLnYNT1Css9vNAUF6yu8l5g6xCCdBu8bOtfMzVKtnQjM2ei+th7tm6sYEax8tDQ9J4kbEXOT4dprRTTeb4a87a6eiYeE5KJSXcLEuRzvIB6HdKuaU2EC5YUt5zb7JfoAMxSxpvBY9NTHzwEeHuedIbKxeGOsFvy0t/3ZA2yUHfCgy/TEH+HsMraKQ07uff/hwo1MSR6NrchR9kiJOKd9DinF8BQDdAXP0+NsrlAvotCmnJINUBpwzV8c/cfB0v9FiXSPjYQwij/j3mynILOJG0O2j2Tebgs0Lww==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3679.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:186::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 07:10:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 07:10:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jiangfeng Xiao <xiaojiangfeng@huawei.com>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PING PATCH] powerpc/kasan: Fix addr error caused by page
 alignment
Thread-Topic: [PING PATCH] powerpc/kasan: Fix addr error caused by page
 alignment
Thread-Index: AQHaTaDl24T4quok502l7CDmtuoIh7Dm+yIA
Date: Tue, 23 Jan 2024 07:10:10 +0000
Message-ID: <dfc07bfb-4fcc-4aa8-bfe6-3987b6741b82@csgroup.eu>
References: <1705974359-43790-1-git-send-email-xiaojiangfeng@huawei.com>
In-Reply-To: <1705974359-43790-1-git-send-email-xiaojiangfeng@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3679:EE_
x-ms-office365-filtering-correlation-id: 66e4f56c-3d2f-4614-49a2-08dc1be25632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tR7VGl0JCVt73apKReYP4qA8GlhW7kimtlGpJmPoijIEGX8geffri40eXIoiRM2kd0B8533L27WmFFhKAijEUNuHnoE/nQwDGaBqLXdH68J1ab1t4lUV2iGLqk03i+bhCAGhMVkaHweWCp8NeXepFdygFvU/HjsSOokoSchOBTUkSA/tZIUkD6yn7xP0kAR2eoLpOXU5r6tMkwrin4zPLMI7F2iQuJpliNE3wOtyg4dh6iNhDcLnp9FAWoYQVPcUfeL4OzHzW867Ut2rbyOx/zgaRPRWNdHdK7XrJBki2W/0nNReSDsPmVJ4Og4zt2Sp1wzzPZnxxWrFUH1wYyp2a1MSncak7Z+5uOCqQeP9PaAbo15FFtF/y01TO3MrxT8+wgvLiaUjR6OllscTf6cqvKQIqyNZ4Y+zKF8PPStyHj/CbIJJm4sJqjkHKBqATT0C/A6H8y2hxii56XIB9gehmhj2KBZAx8zrvhYIiRymS4JCmcqyZJF5GfvJaOsPEcXMmXlZOs/Zim4KpFc5ou8WsGCSunoGDdGJ3dIF5lZefWqIq6lHJS9+1p9cbP7KNNlEFtuLLkiWoMhpIvur3vblBb/dzJFO3WWU3fOarFUUnmxdbA7zqwn7Y1P3OvgigmEuEnQ/yEKfQA6mxI5IZG4ZWv7aWv01qMKRSsCy2qj1iQg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(366004)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(44832011)(83380400001)(4326008)(8936002)(8676002)(7416002)(86362001)(122000001)(38100700002)(31696002)(38070700009)(2906002)(41300700001)(36756003)(5660300002)(6512007)(2616005)(91956017)(110136005)(316002)(66946007)(66556008)(66446008)(76116006)(54906003)(64756008)(66476007)(31686004)(478600001)(6506007)(71200400001)(966005)(6486002)(26005)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OGJMV0NpSnZoaDRDeHMwamV3d2pDV3hqZHdJNGt0Tit5UGJmUDE2WFFKNTEz?=
 =?utf-8?B?QXZqOUp2TmdBMlZuUXIyN3BuMjMyM3dpSWdrMjBTSHh4bktWYmNGcEZ4c3d0?=
 =?utf-8?B?aTkvN2JuaHNoS3NhTTlyOWpEQzJsa05PakhQdjlXZndaZkdPa0VyRldiYTd2?=
 =?utf-8?B?c2dhVVF3QjFoQmdxa0p5Q1lKeFFDZHBMbTE0OHZ6TEpaUENQMTQ0Uk1uZDlF?=
 =?utf-8?B?OGVFM25vVHhIOC8vOHB6Q1ExdzFmNHEzb2t4RGNFNDhnbGNrc3BUOVRFTFds?=
 =?utf-8?B?bFJRcWNVNDVNS1NGV09OSXBubU9aVkd0bVY5NXk4dE9Wc3AwVVhhZGExc2cx?=
 =?utf-8?B?WHhLTVBjeGlOcFFPQ2dpMWQ5QklETFI5WFFpRXBLaTRjc3VxUnVjQWFyd2Ix?=
 =?utf-8?B?eHJCMTJpaUZsNUw1Y1FBZS91YWdNckd2T1luTHdkMlBnczQyekxVRWJhc1Rw?=
 =?utf-8?B?MVRNWk9KTC81UE1jd0lPbU04OEJCSGlBeHhwSzRReTZsM0d6M3U2a21KcC85?=
 =?utf-8?B?MnZHa2hobVBzRU1vVWNoN25mQkxsZHdHOHJsU2NDS3Z1RnZmakY1R3RTblVX?=
 =?utf-8?B?eW1tQk55Q1JyK1BZd2RFODZPWk5EaUZIVFF6ellMNmw2U0Jyb2NpeWZlMWd2?=
 =?utf-8?B?cVpCKzg4Y2JQMkpJNERSODVrMVIvVExMckVMUG5WVG5pZkxndCtoaEVNcWFS?=
 =?utf-8?B?NUpmYU5SMXZOTzhPYUtncTJoOXZtOGpyUFhuSE53R3JkSjJXeG9oeW14U0h0?=
 =?utf-8?B?SFRmUnUzVnhDTElFNFdEanJISHFZWWNOWWFpKzB0YUJPMCs3bXUrb21RQUUy?=
 =?utf-8?B?Q0xyYlV1ZWRpZ2FBNnUvQ0hNZkxRaTY0SGg2ZnJLaWhQeCtlajdrTEJLVVky?=
 =?utf-8?B?YzQ3NUJMUVkralNnTUI5cFE3d3JOUVZMelBXQmhRajVjU0U0M1Mzcnk1MTBu?=
 =?utf-8?B?UkZVY3RlRmdqdkV1bTFyL3lYVnBvQ01RL2pVbFludmZqa0dUNmVtRDJBZUxi?=
 =?utf-8?B?eFkxT05wdnc4cGttY0k1T1F5TU9ZQ3hzQ2U5VWZMZDNlYnBDd3JBYUNxc2FW?=
 =?utf-8?B?WVNkblNnUytwUGxrNHFmaFlUeVpuUnlQb2tXeFFSRXMyTm1EOWV4Ukd4TUhU?=
 =?utf-8?B?VlNGWmhScVJhVGZqMHdtY2FENHl1VEV2amZwbDVrWUNsNkpsVkNHbGNCcEk1?=
 =?utf-8?B?NjArSTZ4SVAvd25ydmNreVovT0t0Z1BibE05K1R3NGFyWlR4TzR0WTBXeTFi?=
 =?utf-8?B?cXovUU9pMHplbWZsN0JnZ21EdWYzSW9ZNWhZTHVXSlhJZmNqU2FJL2ZtRW9k?=
 =?utf-8?B?TjRkR09CV1c4dDFjUTBzQUtuTE9lTitwRGFBcm5QWDg2NGdBc3MyWThaOFZR?=
 =?utf-8?B?MDdNWDl5dG1ReDQzSDRpd1J5ZTBGM2tmU1E5eFpiSERiTnZrdG9TbHhyT3kv?=
 =?utf-8?B?SGZRWWtSYVhza2VpTk1CdEx4eHE5VEZHR3hsU0ltMmE0bW5HSjhUOUV2d094?=
 =?utf-8?B?YUF3Ty92bGNSc0NPZUdwMWdlMjRseFpYTmtSK2MwcUtjTk8vNVN0V3pwSURo?=
 =?utf-8?B?WmRlNGdBckJqU3ovd1BkSy8wQVVxanltc2s0WUl2QTZvbktnYldYMmRnMlVW?=
 =?utf-8?B?eHBBb3cvRTAxVjNxTExaRXFwK251VjNQbnZnNnFUanRvY0tuR1p6ZWNaZTVr?=
 =?utf-8?B?YXdFVGdINXEybGRSVjZvbCt1VkJxWDFOMFJmbjZoM2NmZmdweldDZGRXVjdh?=
 =?utf-8?B?NGhidU02c3JHTWNhc2Q0dm1ZV1M3SUJKU0V6U1FUaVZpQU90QVorVTRmMG1j?=
 =?utf-8?B?dzlwc0g5dWxObG1rbUVzaGtENzJvMU1zc0QrMENacGFYVW5rSHhoYU1tS1NB?=
 =?utf-8?B?VFFIMlIva1VENEF5MEs5S20ydU5keGd6aHlUWktiRU1YNkk3cE9UUlhHVnli?=
 =?utf-8?B?c2NYWUhCS3UxSGxFNUt6Qi9oWXlidVpoTmtzYlpxNGxsMlQ2YWxKMEhZSUJE?=
 =?utf-8?B?MUVCd3BwUW03SWErQ09SdUR3UFFHbWFraFJMdnY0NDIrakhvRFNJSlNvSmEx?=
 =?utf-8?B?VktQL0tuRHlhOGxmYTNScFhHWUZMUEFSU1lMbnlvSyt0U0lkVTdNVm0yaHVT?=
 =?utf-8?B?QUdZdjRPUXFLSnE0Rng3cDhzVWE3aGFFdXdjclRoVVM5TFoxY1B6aCtoNy9z?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADCF58013BCD5A479CF861DECAD3F0CF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e4f56c-3d2f-4614-49a2-08dc1be25632
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 07:10:10.2090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMB4FeKvvFiHbQ1aBal78UZpRgf9uYvuESR8XZKTQfEOyu0Hz397fmVzem2zMMD0mp7JCuLd2P6sizNnduOoy4sUV/ZHhGfZxlXdp6LI7Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3679
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
Cc: "douzhaolei@huawei.com" <douzhaolei@huawei.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wangbing6@huawei.com" <wangbing6@huawei.com>, "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>, "nixiaoming@huawei.com" <nixiaoming@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAxLzIwMjQgw6AgMDI6NDUsIEppYW5nZmVuZyBYaWFvIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIHhpYW9qaWFuZ2Zl
bmdAaHVhd2VpLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6Ag
aHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IElu
IGthc2FuX2luaXRfcmVnaW9uLCB3aGVuIGtfc3RhcnQgaXMgbm90IHBhZ2UgYWxpZ25lZCwNCj4g
YXQgdGhlIGJlZ2luIG9mIGZvciBsb29wLCBrX2N1ciA9IGtfc3RhcnQgJiBQQUdFX01BU0sNCj4g
aXMgbGVzcyB0aGFuIGtfc3RhcnQsIGFuZCB0aGVuIHZhID0gYmxvY2sgKyBrX2N1ciAtIGtfc3Rh
cnQNCj4gaXMgbGVzcyB0aGFuIGJsb2NrLCB0aGUgYWRkciB2YSBpcyBpbnZhbGlkLCBiZWNhdXNl
IHRoZQ0KPiBtZW1vcnkgYWRkcmVzcyBzcGFjZSBmcm9tIHZhIHRvIGJsb2NrIGlzIG5vdCBhbGxv
Y2VkIGJ5DQo+IG1lbWJsb2NrX2FsbG9jLCB3aGljaCB3aWxsIG5vdCBiZSByZXNlcnZlZA0KPiBi
eSBtZW1ibG9ja19yZXNlcnZlIGxhdGVyLCBpdCB3aWxsIGJlIHVzZWQgYnkgb3RoZXIgcGxhY2Vz
Lg0KPiANCj4gQXMgYSByZXN1bHQsIG1lbW9yeSBvdmVyd3JpdGluZyBvY2N1cnMuDQo+IA0KPiBm
b3IgZXhhbXBsZToNCj4gaW50IF9faW5pdCBfX3dlYWsga2FzYW5faW5pdF9yZWdpb24odm9pZCAq
c3RhcnQsIHNpemVfdCBzaXplKQ0KPiB7DQo+IFsuLi5dDQo+ICAgICAgICAgIC8qIGlmIHNheSBi
bG9jayhkY2Q5NzAwMCkga19zdGFydChmZWVmNzQwMCkga19lbmQoZmVlZmYzZmUpICovDQo+ICAg
ICAgICAgIGJsb2NrID0gbWVtYmxvY2tfYWxsb2Moa19lbmQgLSBrX3N0YXJ0LCBQQUdFX1NJWkUp
Ow0KPiAgICAgICAgICBbLi4uXQ0KPiAgICAgICAgICBmb3IgKGtfY3VyID0ga19zdGFydCAmIFBB
R0VfTUFTSzsga19jdXIgPCBrX2VuZDsga19jdXIgKz0gUEFHRV9TSVpFKSB7DQo+ICAgICAgICAg
ICAgICAgICAgLyogYXQgdGhlIGJlZ2luIG9mIGZvciBsb29wDQo+ICAgICAgICAgICAgICAgICAg
ICogYmxvY2soZGNkOTcwMDApIHZhKGRjZDk2YzAwKSBrX2N1cihmZWVmNzAwMCkga19zdGFydChm
ZWVmNzQwMCkNCj4gICAgICAgICAgICAgICAgICAgKiB2YShkY2Q5NmMwMCkgaXMgbGVzcyB0aGFu
IGJsb2NrKGRjZDk3MDAwKSwgdmEgaXMgaW52YWxpZA0KPiAgICAgICAgICAgICAgICAgICAqLw0K
PiAgICAgICAgICAgICAgICAgIHZvaWQgKnZhID0gYmxvY2sgKyBrX2N1ciAtIGtfc3RhcnQ7DQo+
ICAgICAgICAgICAgICAgICAgWy4uLl0NCj4gICAgICAgICAgfQ0KPiBbLi4uXQ0KPiB9DQo+IA0K
PiBUaGVyZWZvcmUsIHBhZ2UgYWxpZ25tZW50IGlzIHBlcmZvcm1lZCBvbiBrX3N0YXJ0IGJlZm9y
ZQ0KPiBtZW1ibG9ja19hbGxvYyB0byBlbnN1cmUgdGhlIHZhbGlkaXR5IG9mIHRoZSBWQSBhZGRy
ZXNzLg0KPiANCj4gRml4ZXM6IDY2M2MwYzk0OTZhNiAoInBvd2VycGMva2FzYW46IEZpeCBzaGFk
b3cgYXJlYSBzZXQgdXAgZm9yIG1vZHVsZXMuIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEppYW5n
ZmVuZyBYaWFvIDx4aWFvamlhbmdmZW5nQGh1YXdlaS5jb20+DQoNCkJlIHBhdGllbnQsIHlvdXIg
cGF0Y2ggaXMgbm90IGxvc3QuIE5vdyB3ZSBoYXZlIGl0IHR3aWNlLCBzZWU6DQoNCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c3VibWl0dGVy
PTc2MzkyDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfMzIuYyB8IDEg
Kw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4v
aW5pdF8zMi5jDQo+IGluZGV4IGE3MDgyOGEuLmFhOWFhMTEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2thc2Fu
L2luaXRfMzIuYw0KPiBAQCAtNjQsNiArNjQsNyBAQCBpbnQgX19pbml0IF9fd2VhayBrYXNhbl9p
bml0X3JlZ2lvbih2b2lkICpzdGFydCwgc2l6ZV90IHNpemUpDQo+ICAgICAgICAgIGlmIChyZXQp
DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gDQo+ICsgICAgICAga19zdGFydCA9
IGtfc3RhcnQgJiBQQUdFX01BU0s7DQo+ICAgICAgICAgIGJsb2NrID0gbWVtYmxvY2tfYWxsb2Mo
a19lbmQgLSBrX3N0YXJ0LCBQQUdFX1NJWkUpOw0KPiAgICAgICAgICBpZiAoIWJsb2NrKQ0KPiAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiAtLQ0KPiAxLjguNS42DQo+IA0K
