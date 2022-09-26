Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B225E9E1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 11:44:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbdCF44KFz3bcF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:44:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=XO1r+q4d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.77; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=XO1r+q4d;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90077.outbound.protection.outlook.com [40.107.9.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdBS6fzWz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:44:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8CsXu5DxGjghMzQaZZQkSbXvj5fFWNupaBW8zAp5C3uXST4vE3al+ZGIDknwps5At2KOmaEey6y7VtYjSROuLZ3sN+0b0SX5J8XWNtALhUl2Pd9Lw2YyIHFiSbk4gcv5ZL2vR9BoF5+Fr9gnc/MWXbnHFSUKPmSFwZ58d/0EaklFLDMg1YhBf7sW1jjx4JLIsAyS/XZLyMZBoTsl5YfzE9KZxaPAZZAkLQS+/63ZaHyMNu2fEIrJ3NPbyc3D8mGJ/iQ5k4/oZoryJS/HCyebzZtEkW4m4LplbkNpByWMfr7GRxXEWLF69GbUDtQsfUw0Vqxn0WhLoz/1v8t9IBAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAIvDLNRurDEWWgrORYOFLdTscM01zy4syU2SgZiSts=;
 b=aBq6um5o68p8BjDhpYwBtg5XETq6Oy3tYGWVZMUiUtgUfN+vNLtfmGqYutm2NxwYLzlxQYeTLp/Y2MWX/ppoQVgGHmeepbeza/S6w/td6ABeHrARd4dl2EwdurA54DFo27RZL26GKhhtw+9+FTWc6+A25NXlgWO7tmjjQlPBN42NkkTChZL0G8TOsBPe0NKDbce7nllJTWjCD09srZbu2okbAbLOF2NZ2j5Ok2suBWNDq2EvcfC6jUJtf0OhFWbSNgABH02ETxAAAoHvZYjeKdhG0NNyUn1aCqrZaNqaVkt6qIKsvz73NiKpjg/ZA7qUxUyK9wdj/1bmNTgMyJxNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAIvDLNRurDEWWgrORYOFLdTscM01zy4syU2SgZiSts=;
 b=XO1r+q4dZLDCAklNJnowCJOB37x3utJ04cp8Jc/f6NPCgBIDWykme1CfOWDnERk8vUcF7r8FYaTFbu7AjUwt1+PmI5R4lE8fD84AbnG6q7JL2djIRDsr9IPphiej41xUmKKtFU8VEORAl2332wbpzxIiLEyfZ58ACNAvMxdom9s661z9E39TOkbEyF96mv+n8vg0vECdxW5I5KHjWsA57aos+QAfmwVbm7we5U1MtUgOz2HuRWMVxHgeA5XQFCNWxgtbRSlSE6+sExDtr2zq/5goReM/61D3ljPPNvqaBCb2IjKPRaVL1AgSXhlJl4K4JR/MU09cxyZSFZrn0lNq7g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 09:43:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 09:43:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Sinan Akman
	<sinan@writeme.com>
Subject: Re: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Topic: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Index: AQHYtABEs/XtKdJlskKmHA1duRa+Xq3xsPoA
Date: Mon, 26 Sep 2022 09:43:55 +0000
Message-ID: <fd9c174e-2c89-7e11-9e68-d6044b7eab21@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-3-pali@kernel.org>
In-Reply-To: <20220819191557.28116-3-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1736:EE_
x-ms-office365-filtering-correlation-id: d762bf09-6ca6-4e6c-7163-08da9fa3a0d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  G3GgWUISQ+v/sCKBp8E9PjdoTcyyZXAIJbMPbfkivcP5Xc1J+eGNEpJkiZci2IhKKmScux3UQsEgzd15hw0t8T+uuva2BxupNSwB+stThPwRyI0TtCThePXQf3n0N8L2m21QevqJi720syepY1L5WQyhdV3enoz9MeUOXcxwozv/R0dR2r2H+ysqd6U1/n5DwJW9QmeitqqxsPPtsgmdqldFhBvkAgMtmX5kD35PeE4ZzrDWTFfO5lAOvOJ2aAotxsCZpuLxz8BMQtq/IJTu/wRKkPGQbPSqwa0hVtu9s6hyhJb9z+nWySp+JeKqoXXWbywaBPW98EIQcg+e3mUMna1jGD9e2Itfp5HzmBoLwA2JJ5kQds4q1JhctcsWsKJvQCzewFv74rTqJ/8OV60/bwtdfX7+o09fhRBt+wr9QEGOFTQeVkynuJeXeaX5kpHAv172l8GHFupM6eNtINleX2CnKpBW2dabGc+uaqSC/xUjVqAg+pu1FS/ru41eaDl9+HT2hwzJKaSazER/2WSQnuOTTkkQke8dCQP01Re1K+hLyK0meyEGQb/uUE3w5RT2zZmuJBscC4pYZT51m77ooav6E6uPqbar1C7qC+YtUI/mrcJwER9dWGxwgJYFFP2QPr1I/uyCUn7tx/drx2O7ML0dMC75735qYKFX9nNBM/O5TONvy/UsNO+O7TBiX1dYWCIkxitSg75H9Klj1dUXiAudkOuG29/1Mll6asckwA18Vi1J9RiABeV/uxf65yMH3c4mAyzB4u8NQ8pPivGrjsPVJqMxRouwwxYyj5JeSnv6/hjyAuheSTGtBaNQ0SYBFBxO1fkY4eXljaXSCYgwCQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(451199015)(6506007)(31686004)(2906002)(26005)(5660300002)(2616005)(316002)(36756003)(4744005)(66574015)(6512007)(76116006)(66946007)(83380400001)(41300700001)(110136005)(6486002)(186003)(44832011)(478600001)(54906003)(71200400001)(64756008)(122000001)(8936002)(86362001)(31696002)(66556008)(38070700005)(91956017)(4326008)(66476007)(66446008)(8676002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y2RPOFFBeDduNmp0SW5Sa1dRcXZQWmhoQWNKWmw0UndFczZETjYrRzNsWlNq?=
 =?utf-8?B?dEVheGlpbjZHWVBIT1RHQ0pkS1ZMMnJkdlFzT1hOVTZwbWZlaXQrS254dTZI?=
 =?utf-8?B?K2QxU3l1Sm44N1dtVUxZRm1PSHZjaUVZOUxqOUdXSGxoVGZCbDVZOGVnOERF?=
 =?utf-8?B?Szl3cGw1R2dNL1lUOGh1WXNveWp1MGMyQ005bm9pb1REZFhCK2lEUFB6Y2xI?=
 =?utf-8?B?RU90OVF5RnliMzJlNklwTDEzazBZanpQamNsRlFDYitOTmV3TGdzcGw4VXho?=
 =?utf-8?B?YjNYWEZLeW5OVEpSNytSMG93aHBWVkJyaGhNYXZ5TTRNMXVMcmdCYytzeVJQ?=
 =?utf-8?B?YXpsZ01VcHlhdUsxZ0ZHa0JpVDJMcVlucGZwL21MQWF3a0JIZmN2RUt1alc2?=
 =?utf-8?B?OGUvVUtUd1ZZcnUzaVZQb2ZPeHYrM2l3SGNiRmtOMkszOTBNMzd0SXQ1THA4?=
 =?utf-8?B?RWJidEpmWW5JNVBzbG1XL01WS0VWSEloV1J4MTEzL0xDQUVaYkF0Y2RRTUpJ?=
 =?utf-8?B?RFJ3dEVyMnV2VWhwK3ZNdFJGQXQvWm5DVTA2Um9QaDRGVHVvRGRWTFdpb0Q2?=
 =?utf-8?B?Y28yZWQvRFBnd0dQd25wQXJrOG9PK2NENEd1YkdIdG91ZkVwTGRDS0RreVRF?=
 =?utf-8?B?aStTclJudERLZXZCSzRZbCt3OTNtcG5HSDVKcDI0VDc2aGZFQmRwNzFLWWFH?=
 =?utf-8?B?ZG1JdDY4c1VEbmdmUXNldmZ2QUpISkp2Slc0bUJZQU1SaXJYNnArOGlwUkVZ?=
 =?utf-8?B?dlU3MWY0dGRLUXZQeWpkTmRQQmQ0ckNLN3N6Z3lVVzcvSkk5dkJWS1diZTVm?=
 =?utf-8?B?SURpVlNTa2xqa3h6QW5talhwYUFWaDlUc291TnNrM1Jwdjd5REtvVVFiS1Ba?=
 =?utf-8?B?ckFhRmtlaHdiNFBGT1ovdFl5bkZYdGVvSkhkb2Y2a0JHSEovMlZKMjJrTDAv?=
 =?utf-8?B?L1Z1MmpiRnZIbk9IRVpNRThxNUZxS3pkTVRvSGx1SFlZaHhjUDVuL0VzNzhF?=
 =?utf-8?B?aGUra1Z6ZVErTUhLdHJjbllvWTdMK2R6OGlVanpqeEttR1laak9MTHpscVJz?=
 =?utf-8?B?MU4wZk5XSUNscUE0WExCQWMwZURKOGpjNVhiSTNpVTZmWjE0Nm1reXc0L0Vq?=
 =?utf-8?B?WTZhZTllV0pEeEU4VFd4N3FnUmIrZUJva1VianZrWTdlWStGUGRkd0pCYjg3?=
 =?utf-8?B?WFpraldBVkxVY2UxZTVxVE1RbExjOFZPMVY5UjBLZCtVK0lWTzFYK1JqcEpi?=
 =?utf-8?B?QXFEc3V4ak5LZkx1QkhYRis5RXhkamhlckZZSllRazRCQlJMM3Fra1B4dUpa?=
 =?utf-8?B?WTAzRFZHOXlSUHVQbnF0UDdBNUlTa3NRZlRLRGRMUXZaR2dXMXBRQUEvRXhp?=
 =?utf-8?B?ZXRWQjFJR0x3elZpS2dXNjVqTEYreTFFRzlEOHNrZEl3N1BsejZhYU16aXNq?=
 =?utf-8?B?dnlObXlxTDZmeU5ZVmVLS3J6azFtS2Jvb0wvY0RlMFVPZFhDOE5QTmIrN0pl?=
 =?utf-8?B?NlhzTGtXL1FSOXdUTGNRQm44cy92YWZodDFKRUhSb2Z6Wk84QzROQXpFS2dm?=
 =?utf-8?B?QksvWUl2bURFRjNKcFpKWVluRW5QUEt1U2VETE42Q3duSXJGMUNQcHBpVHkv?=
 =?utf-8?B?d1BHS2hwNXpqZkRHK2xlNXY4NHUvaDZkbC82Sk9ESHV0YUtkSHVQWndkT1BI?=
 =?utf-8?B?TFcvMkl4YWlrMFNaMDhLNUYvaStPbFhzK1dETXdxdG9tamNXYVJiN1Z6SHhs?=
 =?utf-8?B?ZlNRVGY1UXlqa2drNzNybzJka09OalZsV0lpSDFNY3VTdkJpSW4wNFFoeFhy?=
 =?utf-8?B?ZmFpQUF1a2UyM0xXVXo3Mjc3THBrdlYxT3NWbytTdzNNaERNSnhFUmVDRWQv?=
 =?utf-8?B?NjhjSjFRYVhuMUFJeVZHU3JSTWdray9RSlRVdlBtKzJ3TUM3NmZTaDFKWHRo?=
 =?utf-8?B?VXJCV05qbjJla21nbTRLcXZOQ2t4S0w1VkwxT1JnRzV1VzZ1czR3TWc3UXE5?=
 =?utf-8?B?b1h2VSsxVmRqaGpXQyswVU1qdDZ4aHliZEpTanZhRFVQdGpET2VwdUJYczQx?=
 =?utf-8?B?MXZleENOdzZ5cXo2RDVSVzNnbERZbUdHcHZlQXNrREtYaC8rbDh5SlBhNlQv?=
 =?utf-8?B?VmxjK2psT0xYNWM3VFJiQi9DTkdrclcwQzlValhKVWNtSFd1L1lGbjA3S0tk?=
 =?utf-8?Q?IlQi+J3QH8u47IIQrtZgkuU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5C80E478D80D34C8A96AC2B9DBF5FDB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d762bf09-6ca6-4e6c-7163-08da9fa3a0d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 09:43:55.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7s0D57CHobquBB2y/FZh9vqgZtEAQKlb45j79f8ABmyKstlWeJTRLxx9FT+rN8CuScwFpr1qugKMCxyImW/xqnqsElyebHMpQwyxX7HKDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1736
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

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IEZ1
bmN0aW9uIG1wYzg1eHhfZHNfcGljX2luaXQoKSBpcyBub3QgdXNlZCBvdXQgb2YgdGhlIG1wYzg1
eHhfZHMuYyBmaWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2Vy
bmVsLm9yZz4NCg0KVGhpcyBwYXRjaCBzaG91bGQgYmUgc3F1YXNoZWQgaW50byBwYXRjaCAxLg0K
DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmMgfCAy
ICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1eHhfZHMu
YyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmMNCj4gaW5kZXggZjhk
MmM5N2YzOWJkLi45YTZkNjM3ZWY1NGEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0
Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84
NXh4L21wYzg1eHhfZHMuYw0KPiBAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdm9pZCBtcGM4NXh4
XzgyNTlfY2FzY2FkZShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpDQo+ICAgfQ0KPiAgICNlbmRpZgkv
KiBDT05GSUdfUFBDX0k4MjU5ICovDQo+ICAgDQo+IC12b2lkIF9faW5pdCBtcGM4NXh4X2RzX3Bp
Y19pbml0KHZvaWQpDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgbXBjODV4eF9kc19waWNfaW5pdCh2
b2lkKQ0KPiAgIHsNCj4gICAJc3RydWN0IG1waWMgKm1waWM7DQo+ICAgI2lmZGVmIENPTkZJR19Q
UENfSTgyNTk=
