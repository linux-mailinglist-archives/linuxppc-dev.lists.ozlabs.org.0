Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A745559AF46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 19:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M95n14gzrz3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 03:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KM4ynYlW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.51; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KM4ynYlW;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90051.outbound.protection.outlook.com [40.107.9.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M95mF19PPz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 03:51:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHLOJyYqPdPgtaH724n2LbAmHyYBpd1cnehOXrqX6X8VcAiSIpuMaa1BtGAUdWbFRM9B2tfTNl5M0ueACHakmabxI46M+rWFbej5145A+qSBkFeiUyZnB+5p09yK/9pn+sDrc3JWYV75ftgXuO0GE+SqsGyUxwJzwXwoQ5IPyKVwLFjguFBLoPc1PRDa9jxkLCMHvGruy9JNzPhS/Nr9PqH2XpFqPf+TyOPtId74Cjv6M/iZMCQK+f9rytm7ZimJtc2sgLO9fXAcUuut/+XVhN+F/G5tWx4d4HdLTunnMOQfqR9BBJ72QvFj31OqMbLAZPvIGDiA4HH2mZq0VtRtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjFzc2jBvhOAFIvuSn9ckTRUOoAMr9IisJvKrfsVbIs=;
 b=U1CR7vARm529ZBMBYbKQMb2lpEjoWl9a0J/c+wi/KlBFEXHWcUYYleyJNiD0ZeDtmtZ4ydLJ98jaftILfE03Xr2qrwshShxi5o6ItdsjC9JwzrTFCVwid4NsqvVJBJt4wlC/KwgTAp6wpY52geyIxfgMjGbCgaKofbn/si0xjvt7jmJmLaSoxUwFt1MQzuKzjeA88U+GF9G4xVZ3goNpsVrpNL5px7pKHxdAdkQt+XUO+f1PBlyRIbbSi5VcRIjLfrBWVAbUh5X79QTpxYUWCbae3vEmQfMBsXOsc9vBydTk7oRW5itPV8jLt//eACPUS0Qkn/Qcpp1AalirhkX49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjFzc2jBvhOAFIvuSn9ckTRUOoAMr9IisJvKrfsVbIs=;
 b=KM4ynYlWVEkLURofDhiS5n2/N6gQPHnXiFI+1qIhO4kgKksD6RdFALTHRu149Rrlnz+la9bOxR5GB9K5kY9VntWqCXvJwbnbj/RLth+s/Z6VkItPeoGHEpwDB1gHj+SX7H9HcRT9dKAii1hZw48JbwLPD8dBfxXcbTySn0zcsgaEXQ8qU1SYWNSQe+V53pKM85Q7Fhua4mdG3Q4DBGF7B5rDLlEB3bcfyK6UnE3lUwmrE50VCKwqDiowBL2LmULAiV2XML0BuGZ68kJVNicrq94xCoLcWCTy73hQBlh6qSwiX+kriBwmOKb77LlCQkESNcj5OBSjXoK3AZw/KY0RYw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:254::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Sat, 20 Aug
 2022 17:51:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.021; Sat, 20 Aug 2022
 17:51:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Topic: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Index: AQHYtHvmHBMhgvHYdkutxUw4JYFhKa23vj4AgAAXVgCAAC53AIAADfsA
Date: Sat, 20 Aug 2022 17:51:38 +0000
Message-ID: <0da799d5-aa19-b116-89ce-0ca37780624a@csgroup.eu>
References: <20220513113930.10488-1-masahiroy@kernel.org>
 <20220513113930.10488-3-masahiroy@kernel.org>
 <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
 <CAK7LNATKh4DrgSeN+E1r7xmh1YL6mwWL_g2zL-rz=NYuzXT1bA@mail.gmail.com>
 <ad12004e-1eef-cc77-97ee-ef1738cfa141@csgroup.eu>
 <CAK7LNAQnYQH4BhYkw2G3KMDYRY3mzU9Yd1NudCABG8qpDVRtrQ@mail.gmail.com>
In-Reply-To:  <CAK7LNAQnYQH4BhYkw2G3KMDYRY3mzU9Yd1NudCABG8qpDVRtrQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17d4ccf7-a555-4e30-039d-08da82d4a1f5
x-ms-traffictypediagnostic: PR1P264MB4261:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aOqe7ldD0Uu5nU2Bp1utCug48yUzKBk6zeotjjzpI2I2wtlPFzK++4Zuk9CervkhQeYXalG0zBDjbSKmjtQWQfK1lFot18BdH/kFyPTSWDNrxgF6jROi3Qw7GCcAMmVtNDLhzfXVwZTyqwZ6KtDtvT44Al65eevjYlWYolB7vFWaqHB8ouh4eULv5ONmQz38BQl8taHAwEPy4v7+xoMeac6hFd/4tunqfOcfHJd2b+thXj6dUwzE5bsw2qYqIpnLRlMIMhLj6YpkC050p8D5XC7ms2JsAB3ZItfvSSNXVwyj/bbz7N7yMjayaA4QeaWtAIzlGOac1DADpFLeBPlHJfASVHXogBnC/OrKrOIQrt2xnUnLN1nhMw183iS5NtMvlmi+GcSPM/D5lQ/wbyhC3zLPP5Nn8lqeP1J1TWkp4IHCg6QxvJu7fwPvNKjMG+y5Trh1Lbt/C2Qej5YW/z5quEbNYgnMLHfmigQ/ikQbM4zsF/3ORbPKLI7AW5L2Q6YrFDZGH0GuZ2du92tj+66l8r252C9J1SrD9jQ/LQfkW2is/uKIZqPp2PJv0POrgUUSVP9tlUCZ8Mb+dmgyaRgq9VhYCnlxSFuLBDwTiZL2lwnZ4boC8nC/E5eUoQo5aXqKgfsG5aZLbbnxPZyavuDrPVHpuQfXxVDUr8DXrnE2dqq+89UaL/bBEPStj9HzCjAzJDYUEYflbUt4wU74/nqxTZgEbU6wF+y27REVRF5z0F8UzL/S85g+6I125vz/ccSBWSryqm39LCuaSf81XV0vDZxgizhdhs/1Z5cMDIlRaeefymAqCOAzqmGW0ydqaSDs/V1x5WXoO9lQn+CF/FLPyPLqaUac3AGcwsqDE7+qdZw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39840400004)(346002)(376002)(38070700005)(122000001)(86362001)(31696002)(5660300002)(2906002)(7416002)(38100700002)(8936002)(6916009)(44832011)(26005)(6506007)(53546011)(6512007)(54906003)(316002)(478600001)(966005)(6486002)(71200400001)(41300700001)(4326008)(8676002)(186003)(2616005)(66574015)(76116006)(91956017)(83380400001)(66556008)(64756008)(66476007)(66446008)(31686004)(66946007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cUVzN3VtY251aVpReVFKSlE2TnArdmtjaHNBMWwxRlprUGdvbjE3Wk84bWEv?=
 =?utf-8?B?TE03SmFYUkROSlI1TEdzUjIxV3h5YXJEUC95cmxETVNnQnFPUHBCRDU5am1w?=
 =?utf-8?B?WU13YU5XN3Y4YUdlMDV2VUM5ZG9QalBYRWFGbXhZMFRqTzJpTThJZ0trcFFa?=
 =?utf-8?B?Z2xoZzhIVHVLMDhGVGZsQXJEVkc3L3l6aFR6dm52SCtMN1dsOGdCemxSTWVL?=
 =?utf-8?B?K2hiZXhUaFNJZjQ3RVRkWUFNT1dwZzhyVkR6MEtWMVNzT1QrYllMU2Q0K3FW?=
 =?utf-8?B?V1hxL0p3NEFSZXhISW16OHBNUTYxRnJHOVpkaWhBQnBER3YyamVLRURjZzVE?=
 =?utf-8?B?RUg0Rk9lT29GRkcxSUJCOHBJalJHOVdLQS9VdzVhekxtbnVVelR0ZFVoSmdw?=
 =?utf-8?B?LzN5OVFuSy9TM2laQ0p3UkZpT2l6bStXNzZ1T05OdFY2L0FpZkpicHQzNmY0?=
 =?utf-8?B?NDN3cDJEUWcwRjlWV0UrS08vZFdGVlBRcDIxblBMWWx1Z2t0aWZJZVJ0emkr?=
 =?utf-8?B?cm9CbHhucXYzV01FWXNSM2R0WDN6bG1ydUtWcGt6dUNJSGNGREgyVkl2QXdz?=
 =?utf-8?B?YjVuVGVxdUJRS3NneW5wUUhqY1A5VlNQQ3dYZUZERW1saXhuYmdrMkNtU0xz?=
 =?utf-8?B?dnJ4MkplREQxUDUxZmdsMEVOQ3ZwZGtiWmhiQzJYYU1VYmdlejhPenlVR2Na?=
 =?utf-8?B?UWJObzRENmtPcm5GdFg2bWNZd29DamQvOFVIMjkyRk1LM09INy85U2NMRnp4?=
 =?utf-8?B?a1V4WWp3T1REa0N2WW81Qy9mQkZPWUsycDlreWpnMnVNNmxpMWU2cmhlYUJk?=
 =?utf-8?B?RFJBSVFJbHNXRU5uekNxRHVSM2JwR0JIWFM2M0VGL3p2Mys1SmF4NEYyY0s0?=
 =?utf-8?B?RGl4V1g1YThFc3IyTjJNcHZESnNEWjhheG5OM0srZUh4aDRUQmt6STdYQnRO?=
 =?utf-8?B?UnNEemQrTnVTTkFLTDNYMGF4WXF0RWx5NzQ2Z2pqcmo0UHZTMEFHUnplZVY2?=
 =?utf-8?B?MU1TNzJUbGg2SjVTZHQ3RG0yd2g5dStnNzdMbUJibjdJeDVHWlAzNjdlRHQ1?=
 =?utf-8?B?ZUlTbUZpaXpNQlRrdDJiWlYrL3A4L3JUV2ZGSllmdWMzb2REMlF4NzF0WDVH?=
 =?utf-8?B?RTZmbnVmTXhoaENVangranZ6TlpwT0hDbnhubmkxOXVTK3hZbjhwbHpqQTA4?=
 =?utf-8?B?dGtGVnQzVjZCZEhOUExveEdoaWNKTjZTTnU0Zm5DdVZqaWlsNmZGMnZuczBs?=
 =?utf-8?B?eWNVQjlQcUhOc2sxRVY2NkZXdGdzbDJQYUUxS3pCOTh4SjRPY3FsWGFURHJl?=
 =?utf-8?B?MUtuMjRzbUZyWEVFVzhjUmluWWg4eUY1eXU3UENxQ1pQN0Z6NW5IanJzc2xI?=
 =?utf-8?B?MkQ1UnVXK3ZkZHU2dFMwUFNRRnBTSlVxc3EvSkNmOUg4N1FLM25NQzl2ekZK?=
 =?utf-8?B?T3BiWU95Ym5wbHFHUjBVR1MwMlJwL3RucVByTTA3Zm5Hc3Z3TkkvQ0NoUmZ5?=
 =?utf-8?B?RUlXZjdpU0JUcElENVlnWnU5VHZCbTh6Y0NEeVdPdVl3cnhMTHcyU09NMkxs?=
 =?utf-8?B?d3J3cnBUV0pJdVlsc1RROHdBZ1ZPUEM2dkJpUVM4eFlRYi9HQTYrbjZHNlNs?=
 =?utf-8?B?TERWcGFsSU15L0hMeFN3UTJRQWFVd3RYdkdBdC8vRXY2bWVmNngwS243ZTNQ?=
 =?utf-8?B?R0JPekYzQWFtVlU1Tko3ZWx4R2FWYW50aTlHVHFJMFdwSmdxczFDTkdBNm1Z?=
 =?utf-8?B?QzUzNVZQdjk4RXVMWDdYY2dBdlRSUDUzb2p1enRyYVpYeEJJNE00MkNQM3E5?=
 =?utf-8?B?QXlvVE03YjdyNnFFNFFQZFJqcEpvRHM0UmpUMm9Uc2I1WERhRHFaRmFXalp3?=
 =?utf-8?B?ckpRdVVxY1UwK3BiNzRrWVJEOHNycDJINmdOaENsbkxPUHR3T1gyVmZxQ25M?=
 =?utf-8?B?Njgya3VOOXpmNDJJOWppZWMwOXFhQU42cjFhV1RidGRQdGVpenRQQmpJeVJX?=
 =?utf-8?B?YW5SUmVZd25UVTFrVXNjZjk3NXZpZDFyWEdWcWJyNE5ZTTdRVUhrUXQwcFAr?=
 =?utf-8?B?NlZGdmhxRDhmZVpjdjZWdnJaaFNEbFBaWCtyM08rYmRwdHlnVkEwbStuejVS?=
 =?utf-8?B?V2M5SmhsT1gzaG1MUGlWN3BURW9uMWlmOXgrYTlMMnZNd2VLeUhiMUNqL2g4?=
 =?utf-8?Q?aqEsakrr/X4pJ1D0yigzn6E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B1EBF6A7C408944B6FE267942534F50@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d4ccf7-a555-4e30-039d-08da82d4a1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 17:51:38.7588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pakOXttOD/D25HhBzuBT0UBoebDR2rZwimo/dh1iX46zVzNcLdDYHeKPD/NhYVmYPCfvpu1LD1uaRQNxSzYVNtbSWawuFvABVm02irsfGms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4261
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Kirill A .
 Shutemov" <kirill.shutemov@linux.intel.com>, Sami Tolvanen <samitolvanen@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMTk6MDEsIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQsIEF1ZyAyMCwgMjAyMiBhdCAxMToxNSBQTSBDaHJpc3RvcGhlIExlcm95DQo+IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMjAv
MDgvMjAyMiDDoCAxNDo1MSwgTWFzYWhpcm8gWWFtYWRhIGEgw6ljcml0IDoNCj4+PiBPbiBTYXQs
IEF1ZyAyMCwgMjAyMiBhdCA3OjAyIFBNIENocmlzdG9waGUgTGVyb3kNCj4+PiA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+IExl
IDEzLzA1LzIwMjIgw6AgMTM6MzksIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdCA6DQo+Pj4+PiBp
bmNsdWRlL3tsaW51eCxhc20tZ2VuZXJpY30vZXhwb3J0LmggZGVmaW5lcyBhIHdlYWsgc3ltYm9s
LCBfX2NyY18qDQo+Pj4+PiBhcyBhIHBsYWNlaG9sZGVyLg0KPj4+Pj4NCj4+Pj4+IEdlbmtzeW1z
IHdyaXRlcyB0aGUgdmVyc2lvbiBDUkNzIGludG8gdGhlIGxpbmtlciBzY3JpcHQsIHdoaWNoIHdp
bGwgYmUNCj4+Pj4+IHVzZWQgZm9yIGZpbGxpbmcgdGhlIF9fY3JjXyogc3ltYm9scy4gVGhlIGxp
bmtlciBzY3JpcHQgZm9ybWF0IGRlcGVuZHMNCj4+Pj4+IG9uIENPTkZJR19NT0RVTEVfUkVMX0NS
Q1MuIElmIGl0IGlzIGVuYWJsZWQsIF9fY3JjXyogaG9sZHMgdGhlIG9mZnNldA0KPj4+Pj4gdG8g
dGhlIHJlZmVyZW5jZSBvZiBDUkMuDQo+Pj4+Pg0KPj4+Pj4gSXQgaXMgdGltZSB0byBnZXQgcmlk
IG9mIHRoaXMgY29tcGxleGl0eS4NCj4+Pj4+DQo+Pj4+PiBOb3cgdGhhdCBtb2Rwb3N0IHBhcnNl
cyB0ZXh0IGZpbGVzICguKi5jbWQpIHRvIGNvbGxlY3QgYWxsIHRoZSBDUkNzLA0KPj4+Pj4gaXQg
Y2FuIGdlbmVyYXRlIEMgY29kZSB0aGF0IHdpbGwgYmUgbGlua2VkIHRvIHRoZSB2bWxpbnV4IG9y
IG1vZHVsZXMuDQo+Pj4+Pg0KPj4+Pj4gR2VuZXJhdGUgYSBuZXcgQyBmaWxlLCAudm1saW51eC5l
eHBvcnQuYywgd2hpY2ggY29udGFpbnMgdGhlIENSQ3Mgb2YNCj4+Pj4+IHN5bWJvbHMgZXhwb3J0
ZWQgYnkgdm1saW51eC4gSXQgaXMgY29tcGlsZWQgYW5kIGxpbmtlZCB0byB2bWxpbnV4IGluDQo+
Pj4+PiBzY3JpcHRzL2xpbmstdm1saW51eC5zaC4NCj4+Pj4+DQo+Pj4+PiBQdXQgdGhlIENSQ3Mg
b2Ygc3ltYm9scyBleHBvcnRlZCBieSBtb2R1bGVzIGludG8gdGhlIGV4aXN0aW5nICoubW9kLmMN
Cj4+Pj4+IGZpbGVzLiBObyBhZGRpdGlvbmFsIGJ1aWxkIHN0ZXAgaXMgbmVlZGVkIGZvciBtb2R1
bGVzLiBBcyBiZWZvcmUsDQo+Pj4+PiAqLm1vZC5jIGFyZSBjb21waWxlZCBhbmQgbGlua2VkIHRv
ICoua28gaW4gc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbC4NCj4+Pj4+DQo+Pj4+PiBObyBsaW5r
ZXIgbWFnaWMgaXMgdXNlZCBoZXJlLiBUaGUgbmV3IEMgaW1wbGVtZW50YXRpb24gd29ya3MgaW4g
dGhlDQo+Pj4+PiBzYW1lIHdheSwgd2hldGhlciBDT05GSUdfUkVMT0NBVEFCTEUgaXMgZW5hYmxl
ZCBvciBub3QuDQo+Pj4+PiBDT05GSUdfTU9EVUxFX1JFTF9DUkNTIGlzIG5vIGxvbmdlciBuZWVk
ZWQuDQo+Pj4+Pg0KPj4+Pj4gUHJldmlvdXNseSwgS2J1aWxkIGludm9rZWQgYWRkaXRpb25hbCAk
KExEKSB0byB1cGRhdGUgdGhlIENSQ3MgaW4NCj4+Pj4+IG9iamVjdHMsIGJ1dCB0aGlzIHN0ZXAg
aXMgdW5uZWVkZWQgdG9vLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlh
bWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+DQo+Pj4+PiBUZXN0ZWQtYnk6IE5hdGhhbiBDaGFu
Y2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4NCj4+Pj4+IFRlc3RlZC1ieTogTmljb2xhcyBTY2hp
ZXIgPG5pY29sYXNAZmphc2xlLmV1Pg0KPj4+Pj4gUmV2aWV3ZWQtYnk6IE5pY29sYXMgU2NoaWVy
IDxuaWNvbGFzQGZqYXNsZS5ldT4NCj4+Pj4NCj4+Pj4gUHJvYmxlbSB3aXRoIHY2LjAtcmMxDQo+
Pj4+IFByb2JsZW0gd2l0aCB2NS4xOQ0KPj4+PiBObyBwcm9ibGVtIHdpdGggdjUuMTgNCj4+Pj4N
Cj4+Pj4gQmlzZWN0ZWQgdG8gN2I0NTM3MTk5YTRhICgia2J1aWxkOiBsaW5rIHN5bWJvbCBDUkNz
IGF0IGZpbmFsIGxpbmssDQo+Pj4+IHJlbW92aW5nIENPTkZJR19NT0RVTEVfUkVMX0NSQ1MiKQ0K
Pj4+Pg0KPj4+PiBUaGUgYWJvdmUgcGF0Y2ggbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBwcm9ibGVt
IGJ1aWxkaW5nDQo+Pj4+IG1wYzg1eHhfZGVmY29uZmlnICsgQ09ORklHX1JFTE9DQVRBQkxFDQo+
Pj4NCj4+Pg0KPj4+DQo+Pj4gSXMgdGhpcyBiZWNhdXNlIHRoZSByZWxvY2F0aW9uIGltcGxlbWVu
dGF0aW9uIG9uIHBwYyBpcyBpbmNvbXBsZXRlPw0KPj4+IChhbmQgaXMgaXQgdGhlIHJlYXNvbiB3
aHkgcmVsb2NrX2NoZWNrLnNoIGV4aXN0cz8pDQo+Pj4NCj4+PiBhcmNoL3Bvd2VycGMva2VybmVs
L3JlbG9jXzMyLlMgZG9lcyBub3Qgc3VwcG9ydCBSX1BQQ19VQUREUjMyDQo+Pj4NCj4+Pg0KPj4N
Cj4+IE1pZ2h0IGJlIHRoZSByZWFzb24uDQo+Pg0KPj4gSXMgaXQgZXhwZWN0ZWQgdGhhdCB5b3Vy
IHBhdGNoIGFkZHMgYW4gdW5zdXBwb3J0ZWQgcmVsb2NhdGlvbiA/DQo+Pg0KPj4gV2h5IHdhcyB0
aGF0IHJlbG9jYXRpb24gdHlwZSB1bm5lZWRlZCBiZWZvcmUgPw0KPj4NCj4+IFRoYW5rcw0KPj4g
Q2hyaXN0b3BoZQ0KPiANCj4gDQo+IEkgcG9zdGVkIGEgcGF0Y2ggKGFsdGhvdWdoIEkgYmVsaWV2
ZSBteSBjb21taXQgaXMgaW5ub2NlbnQpLg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIyMDgyMDE2NTEyOS4xMTQ3NTg5LTEtbWFzYWhpcm95QGtlcm5lbC5vcmcvVC8jdQ0K
PiANCj4gVGhlIHJlbG9jc19jaGVjay5zaCB3YXJuaW5ncyBhcmUgZ29uZS4NCj4gUGxlYXNlIGRv
IGEgYm9vdCB0ZXN0Lg0KPiBUaGFua3MuDQo+IA0KDQpZZXMgaXQgd29ya3MsIG1hbnkgVGhhbmtz
Lg0KDQpUaGUgZml4ZXMgdGFnIHNob3VsZCBwcm9iYWJseSBiZSBjODU3YzQzYjM0ZWMgKCJwb3dl
cnBjOiBEb24ndCB1c2UgYSANCmZ1bmN0aW9uIGRlc2NyaXB0b3IgZm9yIHN5c3RlbSBjYWxsIHRh
YmxlIikNCg0KDQpDaHJpc3RvcGhl
