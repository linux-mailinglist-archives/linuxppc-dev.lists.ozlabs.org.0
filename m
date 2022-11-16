Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC062B0E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 02:58:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBmR76R9dz3f2r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 12:58:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=Sm5v1q3r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c100::1; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=Sm5v1q3r;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBmPS4S8Cz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 12:56:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8jz/b0W+vYFf8KO8x00pcFEXfvUlEdVLl9JzWxU7/P/+oiFw8uoHOJjkjPIGNnfqSC5Gxp5XrzwgTj/F0kETvImlYYQGy/CaiuVg1Wyv/G74/Bdl7CYeKWj0NX6dPyPBj8pRc2MtKi0CZan8kKAf0z7TjY8hprsk8gkUx5z/Ssn8v0izWY7XmCpqmKi1c7vWh70C8400yWQ46qxPh+hRn97pWM3TOVqQvDalhZf09lBS5Jjx8VhYrLqbuutzkyNDk/jrpR3k62X6gVBRf9/UopCQpr35qVDtyx+KJ2sxmfP+vv6v+EDqGtuX3L4C25Qe6OFY1QCZrcN6NntHJLVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP8cNn3K36TFbFh33MybPemOzKedlmEn6e2CMVJ1brM=;
 b=CxuipGCh3Vo0RsRGWckujhGSOb6RzuO2EEECoL+Lhsx/vKoog8+yUKFCjNkX/pDx21Zc3pt0tTm3lGovPQIkOTl4rlSI68ZaGeDWvPElre4Yrx4lkTGL+BBEAMr/K0fCIcGeQaoS7iYukyGK6pVkqhg4sJhanCt/RmMsB2QIgpO8fHO6gpqFd3S026F1BrFspfSqu6xi6eKKPoo/3U062Zz8d30zHbA50t5is0pXZUs/qxCt8xThpA2ZDOx8HnJHLsfYtAPz4B+KLtcx/eo3CSdt85xbyDp/PprjR1r4BgQp1Hz2CVp57QWnqH1NHyyDA6QNe1DixUE9WXCilhN87g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP8cNn3K36TFbFh33MybPemOzKedlmEn6e2CMVJ1brM=;
 b=Sm5v1q3rT5FMLJc+rX0zs1EeDdayCOZuVE10T443T975Igqn+FVb9wxB7t1HZ3GqmiqspsVUKAj3LCsQKIZuy/zP5ZOf3lv7rmMWNnnf3ODjTAayNKnwoeb3J0u8GsiUZvONdl8awZbWskDm26Te7v/c/mj38hH8vBGqPC65TzI=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by MN2PR05MB6623.namprd05.prod.outlook.com (2603:10b6:208:e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 01:56:17 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::f57e:85ed:97ea:b642]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::f57e:85ed:97ea:b642%7]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 01:56:17 +0000
From: Nadav Amit <namit@vmware.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Topic: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Index: AQHY+KCRQOqO5HL84U+KIvlNnJJGba5ApXuAgAAlAgCAAAF6gA==
Date: Wed, 16 Nov 2022 01:56:17 +0000
Message-ID: <E3756C83-767A-4C68-AE3F-8C979F47A029@vmware.com>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-3-yangyicong@huawei.com>
 <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
 <91e4804d-cb99-fd22-dafd-2f418f5c7ba9@huawei.com>
In-Reply-To: <91e4804d-cb99-fd22-dafd-2f418f5c7ba9@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|MN2PR05MB6623:EE_
x-ms-office365-filtering-correlation-id: b1c9b1bd-475e-4808-f4f0-08dac775bfe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RpZVUd21sdtoPXCnRsVMALEDyw0aQxfJ4MccroiDsvQoATolZMa/69Rjb/wQvPearKc7A+FeH/I0hqJK+WBcXuGuQKw+oLrXWCo8aM82vjDPEJqi/biU+j2XLBahwJYj0cxBQpOKApOjp6yXWJgM73nukfta3v6gjaVxJyUc7pSBN+YLjw/Qkr19I+tVk+w5Wr62A9REe8DCQE28ue4Svz38fZtl0iWyzeqNVjcyHdPjvwmq9CLU+xHLfH1dP/DiqqiK75gv36crXn/yrmQVlaOz1UseyAAQEnhfhl641YYp6e6M9MQSkMwBWVmAKSN7+I46LFi2ISerc5jh+xPu6x95YzIDVEYQuJ+LrSUPsU3Goidkw7PfK0K4Q7CmrAGh7jdyRsKbSnV5Bn/13VIGU9UwDL+SfBc18BSBCG16oXRoz2vkvb07j7aDG5YMvzevEJ+DAQ3R8giJxIVOaqV6W8G0gIZbcjZaARqdVxjZdHrDn+K5xGyKOBUHqr4OBTiyPhp1wRCeAOxMTl+z39MJnVOXjvnqQ9jN8JFrT9Awb6Fpbjaa85tMPxV6eZVJSw6oWQD+vMoMywq67gehEtz56uuN+L1Q/v50oo+XzkwYByyjRGv3QzEQ7M9UgcHQVzepNlwwevWq5JOl918SiZksKA9psg8MjfUZubS6exOsJe1NJYKPldirTYespRmpH87N5YOOdgu69CXoeyQSXUkV8PPseeYjnNafw6xdmXrEalH5j8jXcXrm+Y0L9xDKeqT8SXolOGOYRL9fP46dP7B3Nyx1GK6/1pJkQ5QnRuH1wmk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(6512007)(6506007)(53546011)(38070700005)(71200400001)(2906002)(33656002)(26005)(122000001)(86362001)(4326008)(91956017)(5660300002)(41300700001)(38100700002)(6486002)(76116006)(478600001)(186003)(8676002)(66476007)(64756008)(66946007)(66446008)(66556008)(7406005)(2616005)(8936002)(83380400001)(7416002)(6916009)(316002)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHE3RWtEOHdOYTVudU4vVzNoeWt6cnQzRk5lZzVnSUJXRk1hRXpJNWpPTUVS?=
 =?utf-8?B?aUs0cC9FZno4YnVkWFNlQWRXQnRQSXgwUGpISXBoSXpQckhRZVBQbkNIN295?=
 =?utf-8?B?WUQ1MXhRd0RwYTJ4Zmk3Z3RDSms3OGUvWmhLVTFHUWYzVU9FNzVtWk5adytZ?=
 =?utf-8?B?R0JXb3FwVzZ4Y3JvcXNueXNYbWhpREVRK2x5YzkxbzAwNVpNQ3dUdlE1VVYy?=
 =?utf-8?B?bFE1NW5FL25aL3lyRTcyTGIySkZHbTNxVnEySlJ0V2dyTFVBVW9GbFFpSUgv?=
 =?utf-8?B?SkZrazFRbXB5NFNRcU5tT2VEMGtxYXJQRzU5d3VxdTc4WFBoM2dOeGRJRzhr?=
 =?utf-8?B?Tm0xT1hmcmtFYzV1S01KZGVhY0xGeXRpUnU5S0VRQTVsdWF2VHIwUmdXOWU0?=
 =?utf-8?B?UzZFczFHSE82cGRZOFgrcUQrcmJaWk9CdE1CMFQ2WmlTcHEwVjVxUW5tNmVE?=
 =?utf-8?B?ZHlVVWROKy9TaTVja2s1NW9PRFR3WkhTcHM1K1BrT0FDMlFXQ1VCa3N3L1p4?=
 =?utf-8?B?TGZ2YVBKL1dtb1cyVzAvMEdLV2UrNGZ0eWJQTWRqeUNqYm9KRm1zcHZyZ20z?=
 =?utf-8?B?SzRpaWlHaUZTVUVXNExDQnd6ZlEvZlhoQm5mQkhDMjF1c0dlOVh0cFJuQjdU?=
 =?utf-8?B?QklmclN0VFBKREZUUFNvdmZkQVd1NCs1ZXN6Nnl0cFYzbjlUR2NsNFpma3Zq?=
 =?utf-8?B?NUMrdEZ0Uk5qUjNGenl3RlFzSGlWWkVicXFKWitmUFZMTnJRKzFuZjBzWTJv?=
 =?utf-8?B?K2Uwa0Q1UVprWVJqNG5KRXg5ZzhWMDRkaURncHV0eUZBblhJM2R2Y3RKbWUr?=
 =?utf-8?B?WGlNSVpaRDk3OTFLSjc1QVBxOEtIWGdkZTQreHAxT3pGekJvM0lIS2RQZFZt?=
 =?utf-8?B?WlJUNW5MUmpWL1pwK0pXS0pTRmY0U3ZYNFlnNnRZaUxZNm1QM2lha3NZcDhW?=
 =?utf-8?B?ZWlZY2ZXK0xDTHJuYlFDWklmV0VMbUN2OHhuTnZNbUdHQ0FrRDkxOWlLWXZv?=
 =?utf-8?B?RERmbWwwN2NtSHd2ZGF2cXp1Q0wwUVBzMnhOaVRpRm44YythMU9INWdyUHRn?=
 =?utf-8?B?UHlsc2d2bTJLQ2d2WDE0UHBCOTU0UE54WnZGZ1RHYXFEZUJHbk16OVlES2xH?=
 =?utf-8?B?UStBdE9ETUdCTkFTTzZiY2UvdWRGTWRxOVM2ZFc0dUpQbisrSGJMcWlCOVhS?=
 =?utf-8?B?blhYQlJjZUZYaW4rRnZ6bGlaVHlMSnVsQ2kwTzBNcmtDWG0xZ0VXMHJvcGdQ?=
 =?utf-8?B?MmVoSkVrMTdIb3M2Q0Exd24yZTNwYUJYZzlzOG91WW4xeEsxcDR3WHZYaHFP?=
 =?utf-8?B?YmhTc0pYV1pJd1JMT0R0UmtGSkVBWkZkOVlWRjlzMGc2ZVpUVEpZQ2VlMkdX?=
 =?utf-8?B?T0J3YVVTYThYRTI3eGpYd0tHd2hFSmNEZG5XL1gzR3ljNXdUVHkyMDVOOUg4?=
 =?utf-8?B?blNHbjVxb0hXSkdCajA0aUhFMmFiQjNFV243V3BVMVlCZTgyZnNWQ1pQd3k4?=
 =?utf-8?B?UWJBekFQK1kxN0tLVDIvM29MOUVheS9NZHN4b2UxaTNSOGgrczNvSWZlNmlS?=
 =?utf-8?B?dnh6ZVFjS1JZcEIrZTdrVFFUdS9vbG1UUkVPb0hGN2RJS0ZueXN2OE05N3Bj?=
 =?utf-8?B?OUpXQUp1ay9vb0JQd3psUVlRSisxcVFreXBad0JMTC9Gbis2dHU0Zkk0OEgr?=
 =?utf-8?B?bk9iRm9WZ040ZmZJLzZGbGFBNnhZTXoxV1ltbWxjdUZYajFrTEFVbm1rVWNY?=
 =?utf-8?B?L21MdWIxakxSL29zZjFmS2xtUmtJN25qVVdiNXlPemI0NUlDOVpwcTJ6QXBy?=
 =?utf-8?B?TzRHbTdyQTAyN2NRRUs1bEN2MmU2MERxbVE5UlpoL2FCZmZEK2l2M3lHKy8x?=
 =?utf-8?B?N0svbTFCL0V6YnNaUzdjcHlZUlcxTjhJM080czM0bUVDSXZaYVhRWDc4bW1W?=
 =?utf-8?B?aXJmS3dVbGVvbkNHc0U4WUxMTE1WWUpEaWk3UllKUEF1TUNHYXczekdmK0V2?=
 =?utf-8?B?UVNlQW5uZWtqT0tjVE12MUdXcSt4TGpXT1ZjcjlEb1Y3RnA2MUtYd3IwRVdP?=
 =?utf-8?B?eE84anVFYUlpVnBza2xUTHI0RGJhdVB5UGlzQm5hQ1lzdk5RUGZ0K3VtNk92?=
 =?utf-8?Q?qQyffT3uL9MMY9lBRqwrv73X6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E010C85DB40064F950AE829E6AC9AFE@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c9b1bd-475e-4808-f4f0-08dac775bfe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 01:56:17.0694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4mGc9lvJBotwC+wPC5YO9JA1H26HsnVUASRIv1dYJCtmkoZ+s9F57112KSdXhBfkD0CeSVraT3zsYtYOZz5KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6623
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "realmz6@gmail.com" <realmz6@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, X86 ML <x86@kernel.org>, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "darren@os.amperecomputing.com"
  <darren@os.amperecomputing.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guojian@oppo.com" <guojian@oppo.com>, haoxin <xhao@linux.alibaba.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTm92IDE1LCAyMDIyLCBhdCA1OjUwIFBNLCBZaWNvbmcgWWFuZyA8eWFuZ3lpY29uZ0BodWF3
ZWkuY29tPiB3cm90ZToNCg0KPiAhISBFeHRlcm5hbCBFbWFpbA0KPiANCj4gT24gMjAyMi8xMS8x
NiA3OjM4LCBOYWRhdiBBbWl0IHdyb3RlOg0KPj4gT24gTm92IDE0LCAyMDIyLCBhdCA3OjE0IFBN
LCBZaWNvbmcgWWFuZyA8eWFuZ3lpY29uZ0BodWF3ZWkuY29tPiB3cm90ZToNCj4+IA0KPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vdGxiZmx1c2guaA0KPj4+IGluZGV4IDhhNDk3ZDkwMmMxNi4uNWJkNzhhZTU1Y2Q0
IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgNCj4+PiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oDQo+Pj4gQEAgLTI2NCw3ICsyNjQs
OCBAQCBzdGF0aWMgaW5saW5lIHU2NCBpbmNfbW1fdGxiX2dlbihzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkNCj4+PiB9DQo+Pj4gDQo+Pj4gc3RhdGljIGlubGluZSB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRk
X21tKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCwNCj4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHVhZGRyKQ0KPj4gDQo+PiBMb2dpYy13aXNlIGl0IGxvb2tzIGZpbmUuIEkgbm90aWNlIHRoZSDi
gJx2NiIsIGFuZCBpdCBzaG91bGQgbm90IGJlIGJsb2NraW5nLA0KPj4gYnV0IEkgd291bGQgbm90
ZSB0aGF0IHRoZSBuYW1lICJhcmNoX3RsYmJhdGNoX2FkZF9tbSgp4oCdIGRvZXMgbm90IG1ha2Ug
bXVjaA0KPj4gc2Vuc2Ugb25jZSB0aGUgZnVuY3Rpb24gYWxzbyB0YWtlcyBhbiBhZGRyZXNzLg0K
PiANCj4gb2sgdGhlIGFkZF9tbSBzaG91bGQgc3RpbGwgYXBwbHkgdG8geDg2IHNpbmNlIHRoZSBh
ZGRyZXNzIGlzIG5vdCB1c2VkLCBidXQgbm90IGZvciBhcm02NC4NCj4gDQo+PiBJdCBjb3VsZOKA
mXZlIGJlZW4gc29tZXRoaW5nIGxpa2UgYXJjaF9zZXRfdGxiX3ViY19mbHVzaF9wZW5kaW5nKCkg
YnV0IHRoYXTigJlzDQo+PiB0b28gbG9uZy4gSeKAmW0gbm90IHZlcnkgZ29vZCB3aXRoIG5hbWlu
ZywgYnV0IHRoZSBjdXJyZW50IG5hbWUgaXMgbm90IGdyZWF0Lg0KPiANCj4gV2hhdCBhYm91dCBh
cmNoX3RsYmJhdGNoX2FkZF9wZW5kaW5nKCk/IENvbnNpZGVyaW5nIHRoZSB4ODYgaXMgcGVuZGlu
ZyB0aGUgZmx1c2ggb3BlcmF0aW9uDQo+IHdoaWxlIGFybTY0IGlzIHBlbmRpbmcgdGhlIHN5Y2hy
b25pemF0aW9uIG9wZXJhdGlvbiwgYXJjaF90bGJiYXRjaF9hZGRfcGVuZGluZygpIHNob3VsZA0K
PiBtYWtlIHNlbnNlIHRvIGJvdGguDQoNClNvdW5kcyByZWFzb25hYmxlLiBUaGFua3MuDQoNCg0K
