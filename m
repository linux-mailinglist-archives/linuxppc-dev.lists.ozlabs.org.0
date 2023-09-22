Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E327AAF94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 12:34:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DrsjF1vg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsTCD2FzQz3dj4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 20:34:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DrsjF1vg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::601; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsTBK2Y7tz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 20:33:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt2wywBmmIaQja8YQQvCSYiLLLQ9bKxSNKvyUnSznRRYfZMoYthCz9CcwNASj6cBPqeX4blh+ElfR95M54chK/upu3U89WNieVO9IZgDWYcGoHqfIGE70IaTt6qRxVy4R3r1xz2Au18xA6qUcNHQNMeQobyUzqbiQWdTeLiBad86jD2rbZi3QIFuujP13nOny8jNWw1tj1Ta5EykQw/y2TSP0KqS6VgFLJXE2vsJcmkrvSLCC8GcZ1tAYj+EqBGgmzLFwmySorTLn8QWm6tg+tHDJ1L/5a3MMT2JAYOWpe4R/YgV+7D4RWFDEH3MP9oMWLbzlyKGbVzO02YJZdpuIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZbwrgTjwdAiDl2JBW5q2sQ9wRyJA3HZJZoQ6fICUy0=;
 b=ZJdhD2o8hExa86xZP8GeKwqLsmS797ZFBM2x/f0O3n2zjqalg4p9vYQdKUiHIlrHGG14Quu/+QchUg8l1ltgyJ6zKhJMw3zwCi6o3Vf8kX5DdrezQPfY2ZqC2X7zslKd4HL7JEaRRpb05t+WK9UbR56WIQCC+CG18XSjMQFf63PfQ2w0aSx8X/4hSygrOuYK/Vd2nIpgyr+NTUSOtNXBwDaVSZcBYtgLjWzzXorjB6TFKDQcNrgls+39TrV4NpSB7QQlAGwb9gHy/8tI/n5M8qRzionAfg5TeE9qngbF9smqDy/wVOQEIUDdKVPKknMG87xAIIY18dGasaNRgWR7UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZbwrgTjwdAiDl2JBW5q2sQ9wRyJA3HZJZoQ6fICUy0=;
 b=DrsjF1vgF97OeS7nLUyB5wcn34MuYLoKIocbttY2pVDhBmVm+w41qnnLpMR0YPlRVgZyQJaAmKWE0Fz8SR6tBk8E21ffDHJ9VHUadFGE4z1pzc0lW5tfvQIO+GfwSxfCh3XwlcZLqLLwQS+8xXoOHgng9bGD89VIHMoER3KXrwl3Md0xb16TVXRFui5g5yZVRS7H01k78lIhmjw23xLLatN9EDPLeEQQPB82L751nbYdlbIes/MYcQNTbIEx/1wP7lzf+FoGKlDtqB0nItCNsBYBpcxVcWZVc2YPLRdWo4dHXO3oU8uz1ORDi8UE8R2JkI/L/fMweXD+yikizelf8A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 10:32:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:32:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Thread-Topic: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Thread-Index: AQHZ6gItMQcLw552qk22hvcHPHnl07AmrDkA
Date: Fri, 22 Sep 2023 10:32:46 +0000
Message-ID: <1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgroup.eu>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-10-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-10-rppt@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3016:EE_
x-ms-office365-filtering-correlation-id: 218ac041-548e-410d-5e97-08dbbb57436a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bQhEaysNUlBCFpaJJabeeux305jrDRc96mcR/RrEeJ/4RWqIfY06/z9wmE3pNP/ve0wD+y3bQloDI5BgjmRR3Cn5pinTE5HqRcpckBNIgTrGC4a0tmeyH3qkVQifnfisJjKJjQ60Io4rPSxK19mnfFWov9TEZKVispHyYYuvh5XxrRv/IxQ08c0mOlZoAt28stHuIF9uxoJsJVdRWfn8/P9of9Qi6E30zP/s+o4GyPORc/hrRkpVAE2UwLRL+FogqLUHgeTrkmi4ujQsPZRPrVVg3FUIiY/oDsejyZJEY0gHOdx9PNu8fpfWeGC+kqDTAWfgEq1nXgEXSEQvPzM7ro/S5t9dYPgcEmPXt+aXsaTO+gRg43PbMqVBy6rWarcNHCFxbIc4xLOC0EfLoPt5GYlANQEmBfWNe1ISEeZpEwaV3NHTA1Omfa/4VvIF+YWAWuRBXyWkuKUd4/MO1pWt0geyLS1W0QX3gGJKJv2joxUEwD1pxtCNd39pu5dkl+XK7tDcRjXy0zX5C/OV36hRnSJbIXaHgnPI7LlwodXxuw/3H5kRnLDx2wRT0XS+hndK0aJutx3zWJq5vI+sqJlJcFJlrH4UweByQmrjshjU8FVeZCEFWDWz+DFxId9B0T4dQ8MzRB/a7uE+9yQtuL9K+dJAV2HWpAdhSY53uyTrj9/Y42dWT5BhJuNi2EL5g6jI
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(5660300002)(44832011)(26005)(110136005)(54906003)(64756008)(7416002)(7406005)(66556008)(66446008)(66946007)(66476007)(316002)(91956017)(76116006)(478600001)(6486002)(8676002)(8936002)(41300700001)(4326008)(31686004)(71200400001)(6512007)(6506007)(2616005)(36756003)(83380400001)(122000001)(31696002)(38070700005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MzJKTTBzQk8zNnBpMzlFMVRSSUwwN1VmSE1LVXN3R0lxMkUyVDdQRWZJOFVL?=
 =?utf-8?B?bllkbVZYdk9Qd0dyL29ibDNqZkdnTUVLS0diTW0rd29iTi9YZjVXWDA5c0RO?=
 =?utf-8?B?QTZWRDI3Ym55S2ZJbWJWM0p5NUVGTnVQYzFRRVpZbUNLaGZvODJLS2RYWGRa?=
 =?utf-8?B?YnNFRzdyUS9VcURyR2JqaE9Eb0tLbkNKdWVFM0FERysyVDhjR09aRmI3ZE0x?=
 =?utf-8?B?MXlxeHVja2xka3cwRFc0QXl5bmxuZ0JlUUxIYXBxYXdFazZ5UEdralM5Ukw3?=
 =?utf-8?B?M244aENhUVhPd0ZCMzZyMmZZSDNtalJsNVlLLzlxSDNCak5lVFJXT3FwVjdL?=
 =?utf-8?B?cm41VFVZaVY1VThWVC85YTU2WlNSWC9IcHVGcGxZZFNHdFUrMHlxWDhxLzJD?=
 =?utf-8?B?aTBHTWJTbjE5aHNnczRaYU1EeGFCWEZRZlB2OFh2L2tWc1RYbHV6ZzRKNWVQ?=
 =?utf-8?B?VTBUTWFyRUNwWHZpVHVLd0NENVAzVUdBSzBNOHErOW82Q1NUeVlVRGdLOXE2?=
 =?utf-8?B?Q1lRcVgzQXpsTFp3eHZzazVRazcwcU1yM0lyUWttOFlHMmlDdzZabHBBcjJ4?=
 =?utf-8?B?bzJoVUI2bExZd0RUQUZTaGJrS0I5bnlweWtoZVQ2YWdkbVVLc1o4VUVNRXlw?=
 =?utf-8?B?TnQ0Y1BIRzRxVFhLbkxlcDRsbDArUEVVV3JRTXFIc243aHZDOE5YS3FwZUM4?=
 =?utf-8?B?VVZBZDhxRmFvaGlPaTBXaE4rSnlWT211RHRuTXV6ZGJHR3BjWTk5S0ZYV00x?=
 =?utf-8?B?Yjllam9KdGF6UTlnV0o2S2ZjMUdRTmRNeWJEZkJxZzMyYVlGK2ZqWU8zbm5R?=
 =?utf-8?B?UjNHZWFqQUFrRkx3NTliTDU0cFpHc3BYN0RVc1Fyam5YeXFaZ1ZCQXlRRG9a?=
 =?utf-8?B?V1AveStvWVJYZzF4N2JuUG81dnlCM3BSNUJvdFc2VTRDTlVEVzNmNHVQREVn?=
 =?utf-8?B?RUM3ci8rY0MwNmcwM3hYTFNVUXdab1dHV0oxb1pTNHZBK3M3RkRuVEZtMERp?=
 =?utf-8?B?Um9lYWZ2UmpWVWF2Y2FCQ2tvL2IzMHlKWnJrcEp4TzlwZjh1bHpGekkyam9P?=
 =?utf-8?B?QUVOT1h3V1NEVDRvbk9RSGIrT04xNk0xSXBvYi9hbWg3bno3c2x5NkNGN2c5?=
 =?utf-8?B?WFhBZHUrRXRnaE1GLzAzN2ZRaUdNRWFSSGJ2WVVPU2tNUmZuR2h4anB2eFJX?=
 =?utf-8?B?UjBRYk00SkVWSHA5QXY3SURTTWEybFo0Ykd6WS9lTzRCV3Y4T1I1VlhwM1pr?=
 =?utf-8?B?UlFtbzBWVHBPVkp5SlloN1VzRUtMdm1PaHBXWXd6b1hNQzdWU0lBTDdQbmNW?=
 =?utf-8?B?YmlEQy91b2ZQblBTSHFGZUV1SnZlZFJPb0orb2VuWnlBYUFxYjhERlprWUwv?=
 =?utf-8?B?dERoTHBFM0I4R2NKa3ByQVhVQnhKSFl6aEtuY1RaTHkrNC9KQU1YTnFqQ01B?=
 =?utf-8?B?Mi9yZlkrQld2eUxhM0R4TmpBM3QwRWlEV0JTMjZQS056WGlscWF6aTVYWi9B?=
 =?utf-8?B?VHdYQjROMFhkdmFqdktsZjVqcFl1WEJWSXozRytISDF1aHp1K3d0aU9JTkxs?=
 =?utf-8?B?QUx0VHFrZm9YUG5GaU9yd3FSYlhFY2Z1ZHo5dDdtVjFISEhwOTBuVDU5Wmsz?=
 =?utf-8?B?QXlFV0VpVDI5blVLTGhQR09hMXdSVllFS1YxcEtCRHI5bEtKRTl3Skl1dmhU?=
 =?utf-8?B?ejg4dy9MenBScW9OdmMxN1BNK3AwRDl2ekhuQXp2YTFsa3NNNGMxSTB5eUkz?=
 =?utf-8?B?NFVIWmxoNndORFZBcEtGOUFjRDlLRjQveWNYcU40L29uM3daaXRxYy8zdm9r?=
 =?utf-8?B?L1pqSVYvU2xxRE55UmNCUnJTMlNrVEtmbmxsbjhDcVYwVnZYdHNRUGV5S3hO?=
 =?utf-8?B?Y2xyS1QzeEVNdGRvcUJRQytWZVR3bFUyc0tETVVGd2VhS0FMZVZmM2I0clRj?=
 =?utf-8?B?TjFJTGtqaWVRNzIvMTE3Yko5cmwrbktWUHY1YUN2WTl2cW9xdittdnZxZ3l1?=
 =?utf-8?B?d0p6OVRRc3dqSTZEMW5qQmpWdmdmQ2hVOHpIaVdTWE03RmtQRnRWMUIwTVZk?=
 =?utf-8?B?b3BqVFZGMTFwa0thTCtHdFdPWHlUZThvL1VydTZMMnltRE1JZWxpTnZYZ2RT?=
 =?utf-8?B?RTE3Q0R1cHFMZlVMNDNMK0RjMDVnUWxiL2RiUlhidlE5S3ZvdWVQekFOY0pV?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE717A6A5BF076408D2246EF3BB0A85F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 218ac041-548e-410d-5e97-08dbbb57436a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:32:47.0193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAk7y0aeDxHYQ20kT6ogRTG3Jvipk5kIW2XEYdHfyhRQboTSDTCtIblBXn+0h5+icqleVH8bpkX2BG5vYYHyRc1k/P8Kr0luG9yJkKBZDxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3016
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbog
 end@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWlrZSwNCg0KTGUgMTgvMDkvMjAyMyDDoCAwOToyOSwgTWlrZSBSYXBvcG9ydCBhIMOpY3Jp
dMKgOg0KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2VybmVsLm9yZz4NCj4g
DQo+IHBvd2VycGMgb3ZlcnJpZGVzIGtwcm9iZXM6OmFsbG9jX2luc25fcGFnZSgpIHRvIHJlbW92
ZSB3cml0YWJsZQ0KPiBwZXJtaXNzaW9ucyB3aGVuIFNUUklDVF9NT0RVTEVfUldYIGlzIG9uLg0K
PiANCj4gQWRkIGRlZmluaXRpb24gb2YgRVhFQ01FTV9LUlBPQkVTIHRvIGV4ZWNtZW1fcGFyYW1z
IHRvIGFsbG93IHVzaW5nIHRoZQ0KPiBnZW5lcmljIGtwcm9iZXM6OmFsbG9jX2luc25fcGFnZSgp
IHdpdGggdGhlIGRlc2lyZWQgcGVybWlzc2lvbnMuDQo+IA0KPiBBcyBwb3dlcnBjIHVzZXMgYnJl
YWtwb2ludCBpbnN0cnVjdGlvbnMgdG8gaW5qZWN0IGtwcm9iZXMsIGl0IGRvZXMgbm90DQo+IG5l
ZWQgdG8gY29uc3RyYWluIGtwcm9iZSBhbGxvY2F0aW9ucyB0byB0aGUgbW9kdWxlcyBhcmVhIGFu
ZCBjYW4gdXNlIHRoZQ0KPiBlbnRpcmUgdm1hbGxvYyBhZGRyZXNzIHNwYWNlLg0KDQpJIGRvbid0
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBoZXJlLiBEb2VzIGl0IG1lYW4ga3Byb2JlIGFsbG9j
YXRpb24gDQpkb2Vzbid0IG5lZWQgdG8gYmUgZXhlY3V0YWJsZSA/IEkgZG9uJ3QgdGhpbmsgc28g
YmFzZWQgb24gdGhlIHBncHJvdCB5b3UgDQpzZXQuDQoNCk9uIHBvd2VycGMgYm9vazNzLzMyLCB2
bWFsbG9jIHNwYWNlIGlzIG5vdCBleGVjdXRhYmxlLiBPbmx5IG1vZHVsZXMgDQpzcGFjZSBpcyBl
eGVjdXRhYmxlLiBYL05YIGNhbm5vdCBiZSBzZXQgb24gYSBwZXIgcGFnZSBiYXNpcywgaXQgY2Fu
IG9ubHkgDQpiZSBzZXQgb24gYSAyNTYgTWJ5dGVzIHNlZ21lbnQgYmFzaXMuDQoNClNlZSBjb21t
aXQgYzQ5NjQzMzE5NzE1ICgicG93ZXJwYy8zMnM6IE9ubHkgbGVhdmUgTlggdW5zZXQgb24gc2Vn
bWVudHMgDQp1c2VkIGZvciBtb2R1bGVzIikgYW5kIDZjYTA1NTMyMmRhOCAoInBvd2VycGMvMzJz
OiBVc2UgZGVkaWNhdGVkIHNlZ21lbnQgDQpmb3IgbW9kdWxlcyB3aXRoIFNUUklDVF9LRVJORUxf
UldYIikgYW5kIDdiZWUzMWFkOGUyZiAoInBvd2VycGMvMzJzOiBGaXggDQppc19tb2R1bGVfc2Vn
bWVudCgpIHdoZW4gTU9EVUxFU19WQUREUiBpcyBkZWZpbmVkIikuDQoNClNvIGlmIHlvdXIgaW50
ZW50aW9uIGlzIHN0aWxsIHRvIGhhdmUgYW4gZXhlY3V0YWJsZSBrcHJvYmVzLCB0aGVuIHlvdSAN
CmNhbid0IHVzZSB2bWFsbG9jIGFkZHJlc3Mgc3BhY2UuDQoNCkNocmlzdG9waGUNCg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPg0KPiAt
LS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMuYyB8IDE0IC0tLS0tLS0tLS0tLS0t
DQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYyAgfCAxMSArKysrKysrKysrKw0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMgYi9hcmNoL3Bvd2Vy
cGMva2VybmVsL2twcm9iZXMuYw0KPiBpbmRleCA2MjIyOGM3MDcyYTIuLjE0YzVkZGVjMzA1NiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMNCj4gQEAgLTEyNiwyMCArMTI2LDYgQEAga3Byb2Jl
X29wY29kZV90ICphcmNoX2FkanVzdF9rcHJvYmVfYWRkcih1bnNpZ25lZCBsb25nIGFkZHIsIHVu
c2lnbmVkIGxvbmcgb2Zmc2UNCj4gICAJcmV0dXJuIChrcHJvYmVfb3Bjb2RlX3QgKikoYWRkciAr
IG9mZnNldCk7DQo+ICAgfQ0KPiAgIA0KPiAtdm9pZCAqYWxsb2NfaW5zbl9wYWdlKHZvaWQpDQo+
IC17DQo+IC0Jdm9pZCAqcGFnZTsNCj4gLQ0KPiAtCXBhZ2UgPSBleGVjbWVtX3RleHRfYWxsb2Mo
RVhFQ01FTV9LUFJPQkVTLCBQQUdFX1NJWkUpOw0KPiAtCWlmICghcGFnZSkNCj4gLQkJcmV0dXJu
IE5VTEw7DQo+IC0NCj4gLQlpZiAoc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQ0KPiAtCQlz
ZXRfbWVtb3J5X3JveCgodW5zaWduZWQgbG9uZylwYWdlLCAxKTsNCj4gLQ0KPiAtCXJldHVybiBw
YWdlOw0KPiAtfQ0KPiAtDQo+ICAgaW50IGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9i
ZSAqcCkNCj4gICB7DQo+ICAgCWludCByZXQgPSAwOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMNCj4gaW5k
ZXggODI0ZDk1NDFhMzEwLi5iZjJjNjJhZWY2MjggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvbW9kdWxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYw0K
PiBAQCAtOTUsNiArOTUsOSBAQCBzdGF0aWMgc3RydWN0IGV4ZWNtZW1fcGFyYW1zIGV4ZWNtZW1f
cGFyYW1zIF9fcm9fYWZ0ZXJfaW5pdCA9IHsNCj4gICAJCVtFWEVDTUVNX0RFRkFVTFRdID0gew0K
PiAgIAkJCS5hbGlnbm1lbnQgPSAxLA0KPiAgIAkJfSwNCj4gKwkJW0VYRUNNRU1fS1BST0JFU10g
PSB7DQo+ICsJCQkuYWxpZ25tZW50ID0gMSwNCj4gKwkJfSwNCj4gICAJCVtFWEVDTUVNX01PRFVM
RV9EQVRBXSA9IHsNCj4gICAJCQkuYWxpZ25tZW50ID0gMSwNCj4gICAJCX0sDQo+IEBAIC0xMzUs
NSArMTM4LDEzIEBAIHN0cnVjdCBleGVjbWVtX3BhcmFtcyBfX2luaXQgKmV4ZWNtZW1fYXJjaF9w
YXJhbXModm9pZCkNCj4gICANCj4gICAJcmFuZ2UtPnBncHJvdCA9IHByb3Q7DQo+ICAgDQo+ICsJ
ZXhlY21lbV9wYXJhbXMucmFuZ2VzW0VYRUNNRU1fS1BST0JFU10uc3RhcnQgPSBWTUFMTE9DX1NU
QVJUOw0KPiArCWV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnN0YXJ0ID0g
Vk1BTExPQ19FTkQ7DQo+ICsNCj4gKwlpZiAoc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQ0K
PiArCQlleGVjbWVtX3BhcmFtcy5yYW5nZXNbRVhFQ01FTV9LUFJPQkVTXS5wZ3Byb3QgPSBQQUdF
X0tFUk5FTF9ST1g7DQo+ICsJZWxzZQ0KPiArCQlleGVjbWVtX3BhcmFtcy5yYW5nZXNbRVhFQ01F
TV9LUFJPQkVTXS5wZ3Byb3QgPSBQQUdFX0tFUk5FTF9FWEVDOw0KPiArDQo+ICAgCXJldHVybiAm
ZXhlY21lbV9wYXJhbXM7DQo+ICAgfQ0K
