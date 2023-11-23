Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A97F5850
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 07:35:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OD/2Aai7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbSzZ3VJcz3vhN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:35:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OD/2Aai7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbSxp2qsvz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 17:34:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKBaQ5LF9Ec/Hrg73g8PDsPSxIxatc0AmbBbNXxiv0jHt4ZRl86KFhO2g+StV0Ihg2Q5YKcfmGu+AMNzZ9TeRD9lWM2al8KAjtSXUCFGX5EgsrnFBI6plVVTTNSnksy96553zMigrEjuWlXoVDyYl1vfsbEkKl1o63J1e1MH345InNkDo1lXkYMOCRBEjGiFRaRKyIbmjpyPmIdJ34sslyiUj7bLmEViruTtBwFuEpE3DccNlViPwfMNdwmm5E2GjskaSRhzRc7hX1EX+M3OXth+Mctj1OEv/XpKDU+0zSFZ1WJ60DEuVaDvIWSQ5iF46Y3olRQ6G3I/rJrR3fb/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v29zitwx4DTxlH8h9/mtrqTU2Q0IH3lGQNV0Cu2/RA=;
 b=Jjj1EydU2aGsoOoIpvlne1V+TPNxuoOM5jlZbPaaN+Fng8fsJjPQfWliAVvyTKbvF5j0A900XkmpBm2pAV8ahhvt1EBkxzQHfO5JOjOFeELk8yB5mTietEs1FK7U/xirnmkOh87WdfM2npO0TkrK+AWpwTjcg8/Xh8wMKgMtJD37Ru/7MylRBs4+TBPsLXe07TKcjDDPOu3Y1kMcJhmUEDWVDHd99fIkNkiYVdOr6SVUxCiiBM31Pxchv48r7KCVS6ObFbbUx62ODw35JY9IebHSbrwhHyohH/kcGKI8sZnMc0A1zfRY7GNWwPmbl3VCZ8+rwonG+/AliBsS7kg8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v29zitwx4DTxlH8h9/mtrqTU2Q0IH3lGQNV0Cu2/RA=;
 b=OD/2Aai72u9xU2RlO3aUqC56eY2ObCiraawIOyHZ+pwOHTM24Ze5o2cyDPuIoDwoencAn6vU+Jki046MlXKbGamANZsogsxXpBzjFMJ2pV9KmPI4z3iPk3wwztkJ4oM+Oym9zJ/0ZI6yv5X3qeAjCyQ0WWTcbitD9Y2ao8hNsBKmObUBTVPlMW6zhPU9SDSTGb4tjxoKyVR4Ms8XCEMbHyE4fxte4c3E1d8CvgBoD5tqDJRBkv+bZSi7cAnNUGEQi9cu2lh7Dub2ToH1zyNwIQfgVerGEDk5wGJe1EGaFOgEAo/pfd9Ai98JNBJK31E0HnLQ1B7pZPc8xeIYMEF3Fw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3413.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 06:34:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 06:34:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>, Rob
 Herring <robh@kernel.org>, Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 3/8] scripts: insert-sys-cert: change name to
 insert-symbol
Thread-Topic: [PATCH 3/8] scripts: insert-sys-cert: change name to
 insert-symbol
Thread-Index: AQHaE3admRtkOg8E1kGVQjFzZsDoGrCHhysA
Date: Thu, 23 Nov 2023 06:34:02 +0000
Message-ID: <11e53988-c4bc-4f9c-9355-883993078e86@csgroup.eu>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-4-danielwa@cisco.com>
In-Reply-To: <20231110013817.2378507-4-danielwa@cisco.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3413:EE_
x-ms-office365-filtering-correlation-id: 89439fc9-c3f6-4b27-9c1f-08dbebee2f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MH6b1X802mlPxvr2LJlG04MtXcdjeQ1TCBQ7jJN15IpO+ylzJwPH6U4B/HPxtAJVceugslMYB/kobozNVVzBgfY5UJ8oegF9QK8koHDSqZb0SJfyl4zu6wkhztdvn1VvmU6DerP3jw4ETiX378wTtcguoNLIsj4OeXQg06YgjJqdS2fKNRqsz6wRT1eN0eD3UXFOWNtLPhaJoqA6f8U2JsyPqgri7Y6rNv2R9IiQgnZhFGy9hgXv2Wf/+VmRhleIW+OGySFjO0zdcCZBQJ+BCuHZ1jeml2LCPZ1A7WOF/YLKzTmSjfW/jF4n5EjkRxcNeGX8ntFgJYosfaZ/msEyxLuaxrQGmMdjYRdwLub4UmhwsL8Qv5tSTN5u66QsrmhL4NImhwudb1wG3rXoJ7P6UY7DiP9wSBlOrh3VjLnPxeM8TDxfSv4M7QKUDPmrw1j4lKuN9Z+BJ3Ai9ELQ3mpNZ4u1JP9wh0FuiX0N2ZWA+t08+aLcz400XlgEX/QWERHxG1NabnSsMdSEseMondVERPe88Q8u54d1UKa4tGPAVA31P29jkapqDgqvRn6vjcbsxhKqBwW67OCa9R1nkj1UjvJf4d2ANKdS9vfeDDEeouUdOPxUDXZX/UyPQJtiZ+3tMjuSxiBo4eHDwJ7U2kG0bx+iFAXV4jZ+qhR3ml9hghih1g4Qy5bParUME3pFVjQebBLE2lvQlrP9uFQ1W6D66nYwVbRqT5GdBSB6Zy39IgJprgegziMVDrd7kTZ7Nctx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(66574015)(6512007)(71200400001)(6506007)(83380400001)(7416002)(5660300002)(2906002)(44832011)(41300700001)(76116006)(91956017)(110136005)(6486002)(478600001)(66946007)(4326008)(64756008)(8676002)(8936002)(54906003)(66446008)(66476007)(66556008)(316002)(122000001)(38100700002)(921008)(38070700009)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y1p0T0pabzVzdGxQY2xzR0VMWW1oMlI2d0hkSFROUkxoczNyeWUvVWZBMHM3?=
 =?utf-8?B?ck1jaSszQlpJN01VUVhIL0FrV0pNYnRrZnpKY1RoUUZMa0hpNWtSMSsxT01I?=
 =?utf-8?B?VERhL3lucUV1dVZKT1hmcm5mWTBJbEwzVWcxazNiTVVWN1FrYTJWV1RWTlJl?=
 =?utf-8?B?Yk84aVJ5T25JbnA1VnRKTVhTV1NWVzhSOVN4cFBVV1orWDNiemJ3a0xjaU04?=
 =?utf-8?B?a09GdWdKcU9VaFhMUWkrKzJWWXRjWUprK0kyS1pGb2hNdEppQ2tGUHlzVGVO?=
 =?utf-8?B?WFRMdFhHNldIeWxMRG91TVZ5UTlHN012MjloZkhHT2k2VzJhMlBKdXl5Vm5I?=
 =?utf-8?B?MUFsQXJ2aXp3OU1rR2h0bE4ybDEwekRHTGpsNDQ4dzhXdlcwRjZnR1MxMnNH?=
 =?utf-8?B?VkxoL3hXU3NZS1p5L1YvaDVGd3ZtQVZwQnZQMnVoVDZxRjlRYitUcC9qYVNl?=
 =?utf-8?B?VU9ISGZrL1gwdTFGcXQzajkxSFFqQmtBY3dtaTlQQWhYbG14SWx4b0lmdENv?=
 =?utf-8?B?Z09Wd3FXMmVhRndzaEhXMmVYNDRPYThQanR2Ri9POWg0c0pBcE9yUUx5UERN?=
 =?utf-8?B?T1QySVdCcllCckdTMGQwTEh3bkJpTUpCc2V2WGMwV1M4bmVidTI5THdkTTh6?=
 =?utf-8?B?Q1NzREphYjZjaWQ5Z2dBRkl6aU9oVTlOVU1kcVRFKzNPVmU4WWhLeVZjSmNr?=
 =?utf-8?B?bktWdjNoZmNKNVp1a2FYNFpwV3RWUG9PNzdNQXlNSUVqYWpMdERFWDJjNEgz?=
 =?utf-8?B?STV3ZTdRWHhIait1TXdISFA2TkdwVHc0RWlYTUIyZUpnK1VxVFV1WXlXUjJ0?=
 =?utf-8?B?N3A5c21SRTZ2MlgzaVU5VXQ4TGdxQTlCNUtUclZMWktmaWN3d1RjbjQ1VTFj?=
 =?utf-8?B?bTcwbmpnOUI1M3g2MU1OTklNQVl4TnJ4dUFUOXJwcTVURy9MYnZabEFPcXg2?=
 =?utf-8?B?SDQwUXFaU0NpcmxqaG1QdFcxc3pGVjlHZkZnZHdDb3U3QjVZNUtqUmFzeEZE?=
 =?utf-8?B?b0ZVaFA3NnpZVVJJYzN4ZEVDaUE3WDZXQ0s5aTVVdWRnL2FGeklpODVGNEsw?=
 =?utf-8?B?enNJOHI2VnlLSVlUTTFiSDE0Zno4N0RxdEJyeStwdUwweFJDVERDV2JxeXMr?=
 =?utf-8?B?dE5qR1VoMEtWOFdER2FtMjZkRTZtU1MzWUt0Vnl4OTlPektNcmY4WmwzdWJZ?=
 =?utf-8?B?aHVCZUdMZmkyMmdDSHpKNzlOSG1hemRhWk8weFBvalFUdm94aUhMN0NkUGVm?=
 =?utf-8?B?ZElVcWJkcktiY3ZLSG9wbnVsSTlNY09WNWMyN3p1QVpUSTQ1d1lyeG5hRUJj?=
 =?utf-8?B?MVhNZEMwRmlKZzgzZW1QcDltSnNoU2lTak9VTm96UmtMYjFiZnFtc0dKVVlR?=
 =?utf-8?B?WVNFRm9YZW4zR2l3MTVxNnlYb3NtN3RyMU9LVXl5aWF6ZTFyRTY2QzhoYUpu?=
 =?utf-8?B?ZUl5TXltbm9zb3VxYlI5U01PZjMxNDU2VVArMGhHRkYwR1gxZjhCZ2J5MFpW?=
 =?utf-8?B?S1dEakEyaHpHREYvb3hVTnRYRzFqV1Fpdm1yM3g2VU5ISE9sSHFwYXRpcHNV?=
 =?utf-8?B?VmFLNkZsV2N6amhZZ08raHlGWlE2c2w4L1RLRnZpbHdpOEtVUEsxbnpXUTd0?=
 =?utf-8?B?SkNEK1dHNUxVU1lrRElFUVhNSE1GdHFHWDhycHljTnI2ZEFjRTVlbGMzTnFa?=
 =?utf-8?B?VkNqdHhNMGZlaElJY3pWdkhsZUV6YytMN1NSVDNvdTdRb0xhNG44QU92dFFW?=
 =?utf-8?B?enNDTGlBVVFOOHd0UW83Z2l0TVJNREEvenpCMHJPMjh0ODEvTVdSSG5FWUxj?=
 =?utf-8?B?ZmdiNTVBQkhXSFlLOHdZeDN3UjJhZUtnaDYwNyswaGxEamdLRjlIRktmcjVl?=
 =?utf-8?B?c0xlRElyeGQ0L1E3Vm5rVHBpU2JaRFY5NkNmb1pTejJIS21HVjZ4NkRFZUlD?=
 =?utf-8?B?MWVJdzQycW16dmVYdHRkYnFQVlAvOXRuMGtsc0ZUSUtvMGtuOGNFMWhPaTMy?=
 =?utf-8?B?dnlyYmZpdVl4QU9YdUNQZWw2UWJMUktBRWxaa2JPYll2THVUcm1WWHQwOEU2?=
 =?utf-8?B?K1Y2Ull4WHQ5S3Z4bUFSU2EvTENUaWw5SHFoaEVLa2R1bmhwMG1IYnhBenBT?=
 =?utf-8?Q?MOxW3WSRrzjh7i+lvyZiyMkET?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F828F8666E565498EFF06F367958E6D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89439fc9-c3f6-4b27-9c1f-08dbebee2f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 06:34:02.8102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Kqez0M5ySwdt/qzLSmY52K+jYbPVSjuqrp/GBvw1D/xBxOEM6J6XrgmtF3hZQEllOQa5zM7nGNB40UQciQaDwPpSaeuMkgiIPrHlT2vdxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3413
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
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzExLzIwMjMgw6AgMDI6MzgsIERhbmllbCBXYWxrZXIgYSDDqWNyaXTCoDoNCj4g
U2luY2UgdGhlIHRvb2wgaXMgdXNlZCB0byB1cGRhdGUgdGhlIGNvbW1hbmQgbGluZSBhbmQvb3IN
Cj4gdG8gdXBkYXRlIHRoZSBjZXJ0aWZpY2F0ZXMsIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8N
Cj4gY2hhbmdlcyB0aGUgbmFtZSBvZiB0aGlzIHRvb2wuDQo+IA0KPiBVcGRhdGUgdGhlIG5hbWUg
b2YgdGhlIHRvb2wgdG8gYmV0dGVyIHJlZmxlY3QgaXQncyBuZXcgdXNlLg0KDQpTaG91bGQgYmUg
c3F1YXNoZWQgaW50byBwcmV2aW91cyBwYXRjaC4NCg0KPiANCj4gQ2M6IHhlLWxpbnV4LWV4dGVy
bmFsQGNpc2NvLmNvbQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgV2Fsa2VyIDxkYW5pZWx3YUBj
aXNjby5jb20+DQo+IC0tLQ0KPiAgIHNjcmlwdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstDQo+ICAgc2NyaXB0cy97aW5zZXJ0LXN5cy1jZXJ0LmMgPT4gaW5z
ZXJ0LXN5bWJvbC5jfSB8IDIgKy0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gICByZW5hbWUgc2NyaXB0cy97aW5zZXJ0LXN5cy1jZXJ0LmMg
PT4gaW5zZXJ0LXN5bWJvbC5jfSAoOTklKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFr
ZWZpbGUgYi9zY3JpcHRzL01ha2VmaWxlDQo+IGluZGV4IDU3NmNmNjRiZTY2Ny4uMmQ3NjE4ZmE1
ZDZiIDEwMDY0NA0KPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlDQo+ICsrKyBiL3NjcmlwdHMvTWFr
ZWZpbGUNCj4gQEAgLTgsMTAgKzgsMTAgQEAgaG9zdHByb2dzLWFsd2F5cy0kKEJVSUxEX0NfUkVD
T1JETUNPVU5UKQkJKz0gcmVjb3JkbWNvdW50DQo+ICAgaG9zdHByb2dzLWFsd2F5cy0kKENPTkZJ
R19CVUlMRFRJTUVfVEFCTEVfU09SVCkJCSs9IHNvcnR0YWJsZQ0KPiAgIGhvc3Rwcm9ncy1hbHdh
eXMtJChDT05GSUdfQVNOMSkJCQkJKz0gYXNuMV9jb21waWxlcg0KPiAgIGhvc3Rwcm9ncy1hbHdh
eXMtJChDT05GSUdfTU9EVUxFX1NJR19GT1JNQVQpCQkrPSBzaWduLWZpbGUNCj4gLWhvc3Rwcm9n
cy1hbHdheXMtJChDT05GSUdfU1lTVEVNX0VYVFJBX0NFUlRJRklDQVRFKQkrPSBpbnNlcnQtc3lz
LWNlcnQNCj4gICBob3N0cHJvZ3MtYWx3YXlzLSQoQ09ORklHX1JVU1RfS0VSTkVMX0RPQ1RFU1RT
KQkJKz0gcnVzdGRvY190ZXN0X2J1aWxkZXINCj4gICBob3N0cHJvZ3MtYWx3YXlzLSQoQ09ORklH
X1JVU1RfS0VSTkVMX0RPQ1RFU1RTKQkJKz0gcnVzdGRvY190ZXN0X2dlbg0KPiAgIGFsd2F5cy0k
KENPTkZJR19SVVNUKQkJCQkJKz0gdGFyZ2V0Lmpzb24NCj4gK2hvc3Rwcm9ncy1hbHdheXMtJChD
T05GSUdfU1lTVEVNX0VYVFJBX0NFUlRJRklDQVRFKQkrPSBpbnNlcnQtc3ltYm9sDQo+ICAgDQo+
ICAgZmlsZWNoa19ydXN0X3RhcmdldCA9ICQ8IDwgaW5jbHVkZS9jb25maWcvYXV0by5jb25mDQo+
ICAgDQo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2luc2VydC1zeXMtY2VydC5jIGIvc2NyaXB0cy9p
bnNlcnQtc3ltYm9sLmMNCj4gc2ltaWxhcml0eSBpbmRleCA5OSUNCj4gcmVuYW1lIGZyb20gc2Ny
aXB0cy9pbnNlcnQtc3lzLWNlcnQuYw0KPiByZW5hbWUgdG8gc2NyaXB0cy9pbnNlcnQtc3ltYm9s
LmMNCj4gaW5kZXggNzdkMzMwNmNmYmZiLi42ODY2ZTNhODQ5NzQgMTAwNjQ0DQo+IC0tLSBhL3Nj
cmlwdHMvaW5zZXJ0LXN5cy1jZXJ0LmMNCj4gKysrIGIvc2NyaXB0cy9pbnNlcnQtc3ltYm9sLmMN
Cj4gQEAgLTcsNyArNyw3IEBADQo+ICAgICogVGhpcyBzb2Z0d2FyZSBtYXkgYmUgdXNlZCBhbmQg
ZGlzdHJpYnV0ZWQgYWNjb3JkaW5nIHRvIHRoZSB0ZXJtcw0KPiAgICAqIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSwgaW5jb3Jwb3JhdGVkIGhlcmVpbiBieSByZWZlcmVuY2UuDQo+
ICAgICoNCj4gLSAqIFVzYWdlOiBpbnNlcnQtc3lzLWNlcnQgWy1zIDxTeXN0ZW0ubWFwPiAtYiA8
dm1saW51eD4gLWMgPGNlcnRmaWxlPg0KPiArICogVXNhZ2U6IGluc2VydC1zeW1ib2wgWy1zIDxT
eXN0ZW0ubWFwPiAtYiA8dm1saW51eD4gLWMgPGNlcnRmaWxlPg0KPiAgICAqLw0KPiAgIA0KPiAg
ICNkZWZpbmUgX0dOVV9TT1VSQ0UNCg==
