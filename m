Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80079DF67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:30:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=K6SUO/7W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlptr27Xvz30fd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=K6SUO/7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::619; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlpsw4Gv5z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 15:29:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsUFo25p8hCsZPFrkQzOLYnc1i6F/McftiIS7x7TMSsLbUwBKOeco2FGwzJ7Ky1mncgr9NNbbgIbS5AHyrMU5ZVwLcBbwFtVK1ZgYyQQSbqI7omtRnR2YnJ0ruwXVAzGBwx5wQU0eeR7253yhxvZutJ16EGOM2LzxmiijBnBaTgxZg731Zvamoxt8gpZFwHGC4z0adBCXlldhjMmVVX+XgWObETAavrXglyBFMFjpELXArxBhqRporEkCw4ttUmUhoV6/pqsyI3MwFZLEQ98HlDbkkrRPUgGi5N4799Y0CuFi5RjHbEkbMcJUqdf/mxkndIZ84c3Mj70ChmXhOWNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/8EHm3qmvrZMdDnIHUu/C/21M+QUybeP6O+qOfXWnw=;
 b=dB6+nukrlP1dX2O27kZaVBSI+/G/j+TlJ1HGCI4eIMnKinEXw0u9lHo1+uTAMWMN1/SfRtsc5hDr+Q6p2n1Ukg8/sGaS/fj4ujXwMDSRxRQ2gGLSYfVhiS6bakYXXv6V7BnLEErpbyAaUwlgpySGVr3EHzqc5lh5FVh/+gVKHMT+q1iDS3AeMeA3imoGrJApl0scD76cfKSeCiEp6t9WzRHQmOT/VOlSF1CyKUAV0HPKn+ZH2FWY4bIIw1QpKJcnwNMZuxhCBaW9SUPNMepkcHrJqJzyIaE2OeHJN2ky3lge1ZDJ2uzFsZel91d0HyN4PDfsYqZ+92pbaYyYMmS5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/8EHm3qmvrZMdDnIHUu/C/21M+QUybeP6O+qOfXWnw=;
 b=K6SUO/7W/ZUcMc9Ql6HAehJ2Q6MLj1Id1TadOhIkGKhrH0bTnovRVi2Rij+BU3bv70IpidWjJb40D8eObCuvLf5miz+EPEdH9rhgujbl2tCh6wWve+H44/twLIWninri5BC6ud23XM+g9P/vzY3YOcwuBcstNcs54AYvD1cGGuJGeApUunrg15XcZiA7Q6j6458JGOZ/a1BXQZPGH6lfOw0umU+gAf/oR6n+gORYKRe2l7gaRbFSC8HDRhtO5PYEbouqxrBTCc89x7UZx8Gjl+eas63kJOLZu7vspIkglMc7g/raL+N73aZtm+VqvMw8Z4M9Ves2gaDi4ypLjxBzxw==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB2485.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.19; Wed, 13 Sep 2023 05:28:59 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9b89:47b8:ed16:5962%2]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 05:28:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgIAAAdaAgAubzoCAAH9ogIAAiW+AgAAbyoCAACn2AIAAnF6A
Date: Wed, 13 Sep 2023 05:28:59 +0000
Message-ID: <60d9aa0d-d6bd-918b-c78d-398045e5d62c@csgroup.eu>
References: <20230811014845.1bf6771d@yea> <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
 <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
 <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
 <20230912021147.57c85033@yea>
 <22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
 <20230912175941.0fca47bb@yea>
 <453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
 <20230912220920.64a9ac3c@yea>
In-Reply-To: <20230912220920.64a9ac3c@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR0P264MB2485:EE_
x-ms-office365-filtering-correlation-id: 91ac02a9-5208-4659-bf96-08dbb41a554f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ArQy6dBBQ128fqsDoPBEGrgrZ1UtVwBGjHtnmmZII2apZyCWVt9CLM+NK/WPBTr6ear6omfBVGEDoRF2BeCcFhrYknUN0PfBZKWuOyTxph3JKaJCZaKOHx6aua0WRr0XTslwB3AmbqpOgSk7bKPt52I7ARmUS+6+1Rgf6UXeT3zoS93+GzICBxUdOBhtapGOh7AkPgxsQ3MpH0czg3tqdsrUVZWB3XMqIkpBhItqUxA5oIfwGkI5sI86PyYA6JYmILEvCexgBu+w8pMbNohx0qPIHWwjsYVwGUr8B18fT1ut5xsrU9/76AJhJW3LgaqL/SoTHWpqIKg1kU7Sz87NQ6FrSCBCLKy0AaMo4zmeQA3qAYGVD0XVkMkEt4Jq1OqTY2pOriWDecOWsFbsNKU8lYw/R90/dmv7KBDKF2QVq+flUtzuzff8wSjOyMuesjXZMT7zhlbUohsWSG+Oj84b4Ya/5DkgYgIJ6iyHLhrLrCDdQfNfSnSuP1iwwT9o3ZX9drvjDO+YF9nU4T+6/z5AvvVbV5H5tkqlQvwot9LpPJE47s0c3B1b6BHq6mztzQF6ofn0/IvB7l/veZADph+jY2UyC59WC5m80ULr12VOueHb3FIOOHZm5HXpdK88w8ikpt2mTgdgJW7hG8T++hQCOSbz0CB33G5pom9Lqiw9NYsu0LwFBQliBi/DEiYYdL+M
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(1800799009)(186009)(451199024)(86362001)(36756003)(83380400001)(2906002)(31696002)(26005)(6512007)(2616005)(31686004)(71200400001)(6506007)(6486002)(122000001)(44832011)(478600001)(38100700002)(38070700005)(5660300002)(19627235002)(6916009)(316002)(8936002)(4326008)(8676002)(76116006)(41300700001)(66946007)(91956017)(66446008)(64756008)(54906003)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cWpPV2g4WVptSnEwK0lzaHBuN3JFaGpybS9Wc1IzWlJJY1VQd3hrUjhTd2Jv?=
 =?utf-8?B?Vkk2b0tuVUpzbDZobk1nclpaRmZkVkdKbFlWZmxxWE10VlBOallRcDMrVGpJ?=
 =?utf-8?B?Nk5vYllTYzFSWm9ad2gwazZHS201d1VVUExwN1RkQjV0Um5sNEtOWXNoWXMz?=
 =?utf-8?B?WlE3MnNjVktYWm1tak9rODBCREVvektnWGZGUGU0K011OXJEaE15QkhPQit2?=
 =?utf-8?B?WjIvY1lQcmNiWXg5Q2VlVnU1U1BJQk56NWNNanNEMnJ4bkp2Y3U0bVNaTldR?=
 =?utf-8?B?V0NzdnVqbkRwL3dSWGJyYVBpWE5TSndjUnc4NWZQa1NoOUVJRnlqM0wwZjE0?=
 =?utf-8?B?SnllUit6SUVKNzdwYitjOFRKNHFtZFdNQnpITUQrc3N0VXpsYmVyTnVSNWVH?=
 =?utf-8?B?MW1yc0E5d3d6dVVNSFQ0UzZyOHp4U1NwUFV5elAwY1FiMHlnTTRvQlllSFA1?=
 =?utf-8?B?MXcyV1hZUW4xN3dJZjEybEhYVzhoNEVFdEhScVlPNkQveEo0b21ONEkwb2Va?=
 =?utf-8?B?WVVWZVNWOWRGUS8yeStLSXp5blVFKzBtZVlwdjFBekJRZmFSOWkvVnNSM09o?=
 =?utf-8?B?T1ZaeVZYNkw1SHRaVzRCRmlydWhOZnF1UEFyNGhuemtNZTJWc0JxTmo4Z1FK?=
 =?utf-8?B?d3FHR1NWRXY1RThiZ28xdzlKSjNHc2c0UURheFQ1QzhmZEtVMk5maStWNEV0?=
 =?utf-8?B?c0JQWEZaUHI2b3c5MVhQM0Z3d2dkcUNZQm9Mb1VQZEU2d2hLY0N6eGhpN1Q1?=
 =?utf-8?B?dFEyT1BndStoejMySnZJc3YvampqcktMS0ZacjczZjV0bFJqaWZiSXRFR2RP?=
 =?utf-8?B?TzYwSTRPNEQ3TURhQVFpTG5wMmRSSk8rVksxaVNUWWRiMzh6emx1bWdmZjYx?=
 =?utf-8?B?QjJycHJTZlV3VjFuaS96VGhyeU5jdDUyUGZIMmgyeWVoREhvcXRRUHI5b1BO?=
 =?utf-8?B?OEFURitPV28ycUpVMnlhYmtsVlYvUGw1Zjh3cDZOWUFzemlWNDdNeU9OT2RY?=
 =?utf-8?B?QW9udXI3Wm9ZNVJnU0d5S0dRVUVRQ2QxWU5QK0dzYmFwVTQweUdjOFEzWDZH?=
 =?utf-8?B?cmx4Q2YvZDBMT0s1MjhOalhOUWhuUEp5U2FnalVLQ2JhYmFSWUswVXNlUHB0?=
 =?utf-8?B?c1l5VEU4QStFQVZBcUVPaDNBZnl4SEYyWk1yaUhwMU9PRWFPeHArZi82anYx?=
 =?utf-8?B?dEYxeFY1Y0JKUFJ0cjFqeUNwblBIWVllTm85YytKZXFmMTFrVXMwVG0wVlBI?=
 =?utf-8?B?cW9Bcmh3N25tK1FqOXY5TTRocC9pZXJxZXpSSlZmNEJES1NvTzd1WW1nbS9X?=
 =?utf-8?B?aGVVWWpnVllHb0l6cW82eHorSG52Nkl1ejY4M1B5cSszWi9hSHRWcE9MWHZx?=
 =?utf-8?B?Y2lsbUxDNjNCQXdmMDFLRUU2Sm85MDFjZGpQVzNEZTJHWUErZWhGa1Z0Ym1v?=
 =?utf-8?B?SGdvcklMa1Q1dWhIaFg0ZXdWN2NkOW9LV2tpL3BlMmZ6SE9xYjF3SjdEVElE?=
 =?utf-8?B?bDh4VzJ3ZURuSFZHZFpoeW56ei9RSi9mRHZiN01wMUJ2WjVsQm52TncvUDQw?=
 =?utf-8?B?WmVWQXlHNlp3OFZNRmxteWpiMUN0T1kxbWcwc2RURjNScjdCd2Y4TG1lNG0z?=
 =?utf-8?B?Wm5xTjRnaDdUVzE5cC9wMThUakU4SzZIYnlSUHVLOWZac05EVWZ2WUJVVnA0?=
 =?utf-8?B?NGV6YzFVZDRheHlTY3I2MHJjUEszQVVIOFRwWFNzNUxYVFNqb1JYc29ubU4y?=
 =?utf-8?B?QWZTV2J1TXpRZEJuZ01tdWhqV2dPbEYxd05OaXJITThzNjI3ZE0xejNqa1NJ?=
 =?utf-8?B?N0xSbFNVbjVibFFwTm5FMHVHcW9GR3FWM2NQcjdWK0lpcDV5Y0xLRlVaVGNw?=
 =?utf-8?B?RFZWWjE3YlluNUhxY052Qm85czZXaGRzTndOODNNNElJNTdic2dLSmt5SmZX?=
 =?utf-8?B?cG1ocGoxMjFreHJpWmd6TG1uUVRXWFVkSnhObENJRDJzaFNPK2ZEVmZWd01E?=
 =?utf-8?B?aFA1ckt2bmJmTVArOVNhWTA1a1ZyT2VBRForSWZtNkhnMGU3MzlKZ0hiYkk2?=
 =?utf-8?B?bEgwaTh3NklWQTZSMk13MklYRTd6U1hyaHZnK2FGa2cyK2p2Q0NpemVINDFa?=
 =?utf-8?B?RjIwTTlpb1pLaWRnUVAzZk1TbllCR0ZBU1lhR3g5VkExbDA2UVJoWWVJT0U2?=
 =?utf-8?B?V1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87ACBEE07E009F43B1F13B95C8A485FE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac02a9-5208-4659-bf96-08dbb41a554f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 05:28:59.6165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ve+k8dSbgtK3VUohNsVoyHIT4AZeoYS5TK1SelxF90jIQA+Jdj9OOZk33Tu7CMpiWIc1htwbPYnMRRkRjq2hYRiIXFv58qL0bksjP557kCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2485
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjMgw6AgMjI6MDksIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgMTIgU2VwIDIwMjMgMTc6Mzk6MTAgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBBaCBvaywgbWF5YmUg
eW91ciBDUFUgb25seSBoYXMgNCBCQVRzIGFuZCB0aGV5IGFyZSBhbGwgdXNlZCwgZm9sbG93aW5n
DQo+PiBjaGFuZ2Ugd291bGQgdGVsbCB1cy4NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczMyL21tdS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczMyL21tdS5jDQo+
PiBpbmRleCA4NTA3ODNjZmE5YzcuLmJkMjY3NjdlZGNlNyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3MzMi9tbXUuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czMyL21tdS5jDQo+PiBAQCAtODYsNiArODYsNyBAQCBpbnQgX19pbml0IGZpbmRfZnJlZV9iYXQo
dm9pZCkNCj4+ICAgIAkJaWYgKCEoYmF0WzFdLmJhdHUgJiAzKSkNCj4+ICAgIAkJCXJldHVybiBi
Ow0KPj4gICAgCX0NCj4+ICsJcHJfZXJyKCJOTyBGUkVFIEJBVCAoJWQpXG4iLCBuKTsNCj4+ICAg
IAlyZXR1cm4gLTE7DQo+PiAgICB9DQo+Pg0KPj4gT3IgeW91IGhhdmUgOCBCQVRzIGluIHdoaWNo
IGNhc2UgaXQncyBhbiBhbGlnbm1lbnQgcHJvYmxlbSwgeW91IG5lZWQgdG8NCj4+IGluY3JlYXNl
IENPTkZJR19EQVRBX1NISUZUIHRvIDIzLCBmb3IgdGhhdCB5b3UgbmVlZCBDT05GSUdfQURWQU5D
RUQgYW5kDQo+PiBDT05GSUdfREFUQV9TSElGVF9CT09MDQo+IA0KPiBBcHBsaWVkIGFsbCB5b3Vy
IHBhdGNoZXMuIEFjY29yZGluZyB0byB0aGUgb3V0cHV0IG15IEc0IERQIHNlZW1zIHRvIGhhdmUg
OCBCQVRzLiBOb3cgSSBnZXQgdGhlIGZvbGxvd2luZyBvdXRwdXQgb24gc2NyZWVuIGJlZm9yZSB0
aGUgZnJlZXplOg0KPiANCj4gcHJpbnRrOiBib290Y29uc29sZSBbdWRiZzBdIGVuYWJsZWQNCj4g
VG90YWwgbWVtb3J5ID0gMjA0OE1COyB1c2luZyA0MDk2a0IgZm9yIGhhc2ggdGFibGUNCj4gbWFw
aW5fcmFtOjEyNQ0KPiBtbXVfbWFwaW5fcmFtOjE3MCAwIDMwMDAwMDAwIDE0MDAwMDAgMjAwMDAw
MA0KPiBfX21tdV9tYXBpbl9yYW06MTQ3IDAgMTQwMDAwMA0KPiBfX21tdV9tYXBpbl9yYW06MTU2
IDE0MDAwMDANCj4gX19tbXVfbWFwaW5fcmFtOjE0NyAxNDAwMDAwIDMwMDAwMDAwDQo+IE5PIEZS
RUUgQkFUICg4KQ0KPiBfX21tdV9tYXBpbl9yYW06MTU2IDIwMDAwMDAwDQo+IF9fbWFwaW5fcmFt
X2NodW5rOjEwNyAyMDAwMDAwMCAzMDAwMDAwMA0KPiBfX21hcGluX3JhbV9jaHVuazoxMTcNCj4g
bWFwaW5fcmFtOjEzNA0KPiBrYXNhbl9tbXVfaW5pdDoxMzINCj4ga2FzYW5fbW11X2luaXQ6MTM1
IDANCj4ga2FzYW5fbW11X2luaXQ6MTQwDQo+IGlvcmVtYXAoKSBjYWxsZWQgZWFybHkgZnJvbSBi
dGV4dF9tYXArMHg2NC8weGRjLiBVc2UgZWFybHlfaW9yZW1hcCgpIGluc3RlYWQNCj4gTGludXgg
dmVyc2lvbiA2LjYuMC1yYzEtUE1hY0c0LWRpcnR5IChyb290QFQxMDAwKSAoZ2NjIChHZW50b28g
MTIuMy4xX3AyMDIzMDUyNiBwMikgMTIuMy4xIDIwMjMwNTI2LCBHTlUgbGQgKEdlbnRvbyAyLjQw
IHA3KSAyLjQwLjApICM1IFNNUCBUdWUgU2VwIDEyIDE2OjUwOjQ3IENFU1QgMjAyMw0KPiBrYXNh
bl9pbml0X3JlZ2lvbjogYzAwMDAwMDAgMzAwMDAwMDAgZjgwMDAwMDAgZmUwMDAwMDANCj4gTk8g
RlJFRSBCQVQgKDgpDQo+IGthc2FuX2luaXRfcmVnaW9uOiBsb29wIGY4MDAwMDAwIGZlMDAwMDAw
DQo+IA0KPiANCj4gU28gSSBzZXQgQ09ORklHX0RBVEFfU0hJRlQ9MjMgYXMgc3VnZ2VzdGVkIGJ1
dCB0aGVuIEkgb25seSBnZXQ6DQo+IA0KPiBwcmludGs6IGJvb3Rjb25zb2xlIFt1ZGJnMF0gZW5h
YmxlZA0KPiBUb3RhbCBtZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFzaCB0YWJs
ZQ0KPiBtYXBpbl9yYW06MTI1DQo+IG1tdV9tYXBpbl9yYW06MTcwIDAgMzAwMDAwMDAgMTQwMDAw
MCAyMDAwMDAwDQo+IF9fbW11X21hcGluX3JhbToxNDcgMCAxNDAwMDAwDQo+IF9fbW11X21hcGlu
X3JhbToxNTYgMTQwMDAwMA0KPiBfX21tdV9tYXBpbl9yYW06MTQ3IDE0MDAwMDAgMzAwMDAwMDAN
Cj4gTk8gRlJFRSBCQVQgKDgpDQo+IF9fbW11X21hcGluX3JhbToxNTYgMjAwMDAwMDANCj4gX19t
YXBpbl9yYW1fY2h1bms6MTA3IDIwMDAwMDAwIDMwMDAwMDAwDQo+IF9fbWFwaW5fcmFtX2NodW5r
OjExNw0KPiBtYXBpbl9yYW06MTM0DQo+IGthc2FuX21tdV9pbml0OjEzMg0KPiBrYXNhbl9tbXVf
aW5pdDoxMzUgMA0KPiBrYXNhbl9tbXVfaW5pdDoxNDANCj4gDQo+IA0KPiBXaXRoIGJ0ZXh0X3Vu
bWFwKCkgbGVmdCBpbiBwbGFjZSBpbiBpbml0XzMyLmMgSSBvbmx5IGdldDoNCj4gDQo+IHByaW50
azogYm9vdGNvbnNvbGUgW3VkYmcwXSBlbmFibGVkDQo+IFRvdGFsIG1lbW9yeSA9IDIwNDhNQjsg
dXNpbmcgNDA5NmtCIGZvciBoYXNoIHRhYmxlDQo+IG1hcGluX3JhbToxMjUNCj4gbW11X21hcGlu
X3JhbToxNzAgMCAzMDAwMDAwMCAxNDAwMDAwIDIwMDAwMDANCj4gX19tbXVfbWFwaW5fcmFtOjE0
NyAwIDE0MDAwMDANCj4gX19tbXVfbWFwaW5fcmFtOjE1NiAxNDAwMDAwDQo+IF9fbW11X21hcGlu
X3JhbToxNDcgMTQwMDAwMCAzMDAwMDAwMA0KPiBOTyBGUkVFIEJBVCAoOCkNCj4gX19tbXVfbWFw
aW5fcmFtOjE1NiAyMDAwMDAwMA0KPiBfX21hcGluX3JhbV9jaHVuazoxMDcgMjAwMDAwMDAgMzAw
MDAwMDANCj4gX19tYXBpbl9yYW1fY2h1bms6MTE3DQo+IG1hcGluX3JhbToxMzQNCj4gYnRleHRf
dW5tYXA6MTI5DQo+IA0KPiBIb3BlIHRoZSBvdXRwdXQgc2hlZHMgYXQgbGVhc3Qgc29tZSBsaWdo
dCBvbiB3aGF0J3MgZ29pbmcgd3JvbmchDQo+IA0KDQpDYW4geW91IHNlbmQgbWUgKG9mZi1saXN0
ID8pIHRoZSB0d28gdm1saW51eCBiaW5hcmllcyAoVGhlIG9uZSB3aXRoIGRhdGEgDQpzaGlmdCAy
MiBhbmQgdGhlIG9uZSB3aXRoIDIzKSBhbmQgYWxzbyB5b3VyIGxhdGVzdCAuY29uZmlnDQoNCkFi
b3V0IHRoZSBzaGlmdCAyMywgSSBzdXNwZWN0IHRoYXQgcHBjMzIgc3RpbGwgZG9lc24ndCBsaWtl
IHdoZW4gLmluaXQgDQppcyBwYXN0IHRoZSBmaXJzdCAzMiBNYi4NCg0KVGhhbmtzDQpDaHJpc3Rv
cGhlDQo=
