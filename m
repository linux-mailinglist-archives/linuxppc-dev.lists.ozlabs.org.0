Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC225BF777
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVC93KHCz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:19:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=M1Da2f6k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c112::; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=M1Da2f6k;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVBN65S2z2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 17:18:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8vznlvv3a+MBfEHgul81D58WTHR7Sb1vi+01e2obJWwUMlmJl2t2wSpw6HniCxXfDaKfd89eJApDJNi794j3pIbWri/X4MuPoDZqjxVCYOdZEPDW8YyGWkTQKSHZF3A0DeSwcENhsR4BhZpM0c0JjoPqYMd40VGtXUAzfecNxti7qEBG1bj6G/OFlNxkLbXZjWMk9Fnvq71cSwTOiKdyPlknWIqeuxA5t1GYfWeSQmgKZGom89brkzhlIS5m415ugoH7nkbD/4LlFakdJpg0/vZ5PVUodja70liSZ4leGItNHF5cEYoQjJPLROIf3029qxcKDmkuOxJvfJTKVu9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZA6SaT1wuHCo9Mt0BBpdOovWMtMfcCDZb2bQkCrwkCM=;
 b=eC1232EfagsqIw89PDOIWeYNtJMDH/VjtbHTRhAMXpUQwTGPmCJ9en3PDu8/YOz8S/azGrn9v7cZ7xmJi5AnXGt8LivYx0gkFAeXhMhl0bTWD1c4SosX0Qx4/zXdMp0b/3dh4YK6w6whTexMBG6zbstkqmCVLyhoNRLwHFeo8OlPK6b2CG4GULgcHXyzXMFmmrGgXKOmBjyzAs42/Y4xnE7y2p4tTFD2CFZIk+hyiJlRMc2dyBGuwSB1HJjqyJ02gtokW8y1G6lY1S54LtgujpM1snWtlkL+V4Ucg+hFCtfaZtiIjXQL7Yp5OyENu4aXVFZ0Js5ZwAezdq1qKRwHEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZA6SaT1wuHCo9Mt0BBpdOovWMtMfcCDZb2bQkCrwkCM=;
 b=M1Da2f6k8qYiQKY9p2peANYDd8FSvaqqM/2MZF45LKE6X0xi6Ou1ul0Xfds6Ho8ybx8dLHnObkiMxb4JUD/4eJ8lfOpVStzaCKHzxSW6gziWUX0C83a7AULFBk97KjiwEjLOvcS/27TkupBp47YZu2VU94VVYO9RNMtmP6eRBtg=
Received: from SA1PR05MB8534.namprd05.prod.outlook.com (2603:10b6:806:1dd::19)
 by DM6PR05MB5273.namprd05.prod.outlook.com (2603:10b6:5:7f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 07:17:57 +0000
Received: from SA1PR05MB8534.namprd05.prod.outlook.com
 ([fe80::5117:14:be1e:3dd0]) by SA1PR05MB8534.namprd05.prod.outlook.com
 ([fe80::5117:14:be1e:3dd0%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 07:17:57 +0000
From: Nadav Amit <namit@vmware.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Topic: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Index: AQHYtgB7WHPVSXtcQ0CQkErpE23BFq3pocIAgAAGxwA=
Date: Wed, 21 Sep 2022 07:17:56 +0000
Message-ID: <36B9DE22-E3BC-4CB2-8E3F-B21B61434CD3@vmware.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
In-Reply-To: <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR05MB8534:EE_|DM6PR05MB5273:EE_
x-ms-office365-filtering-correlation-id: 1a4cb670-5c6a-4bd4-b186-08da9ba16855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uNm1YrCKUijT1CZdiI9V7KpjjDNtjSIdR75YY6VMEwp+qg8ZFQjWwX7arPY0y0Ge/ug9rtf4GhQTO3nNkuxgNJwenx6jPEWuYnEz/Kp952qCeQihdMA8Ktd4NiRpo+UqQlasTgFa+J61j8hpJFtJ+5kgtpEENV9881Dp0N09c6QsSjr7HTsHMh9Wm0Wzgs5uNkjUYmBXdmebiIcbklm/xYMJWj4pK+H6OvjfPR0GBAdwCRRlQqJHiTjcN51JciGbKry9WiiatAD9qoMZdyG+sQzTvtjA5l+IRd3xyhlubdAmHoNia92UIpG18cIgGg3mye3lOCXyKJhibvuT0R4EaEbNJu0hDJHBZYmpViVNTMqpIkrpH8RspSkqAMHBJhp8/5C/HrAQuYHRg4gFaUt5CD+TfOA1vv5pZJ/Q28F+Spw5STJxyeEbuSleHuStTI2eNgsmh+mrs6Y/EPLj5tl/+crA/qtYQPemUYlrR0yKKWpWxoqCvqCdxP20zyr+Nce0vvtdeUFf28898xLrmPUrPwFbP5jHCcoyX4aWzfyL3JoEzT2QpwjlcIu1Wj+NepRZuRsg4WzFbny+vujCZ8OItOPrjGDRd0x8K/Ks/gGRMV5qvPMqEs8+uqci/JRwsyjxtzj4G2Lg6AYq+ElU/Z/gFEFgvE2795o9Z4SxprAF2RissWRJ3j5+vp7A9s0H89YH9n6GCGkQIsaXybfcwRlPbEZZKYwNrUc5xz6TjLI8avaLKF2yX+4N6MI3KunXwFMvH8OMQN50G/Sraznmh4lAp16FmVYjKieRQsp6rxU2nh0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR05MB8534.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(122000001)(38100700002)(38070700005)(2906002)(71200400001)(478600001)(186003)(6506007)(66556008)(66946007)(76116006)(6486002)(2616005)(66476007)(6916009)(91956017)(54906003)(316002)(6512007)(36756003)(41300700001)(33656002)(7406005)(26005)(8936002)(5660300002)(86362001)(83380400001)(7416002)(8676002)(66446008)(64756008)(4326008)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OUZiaTFPb2plTUZKVDVBV2hGZU42WlJTa1djWDNrbHdkR2pkU25FSkxuYnpk?=
 =?utf-8?B?endXeGY1bFVrdTdLVUpKSFFQWGhiMVIrMzJiOGRNdnhFQWthT3pUZHZ5TTht?=
 =?utf-8?B?Z3BpMEtyd1dUMTdkUGROSnJuMys2MWRIRmRZdEh6Q2VtQUdvN1ZtZWl1RS9j?=
 =?utf-8?B?amZXdDZxbjE3b04xbmRMUlBkVTF0RE95dW9mdnphRWJaS3dCVnNmM0dlN3FV?=
 =?utf-8?B?WjdWbjY0bUNwMVVieitZc1JzWlhPMnl2VFlvZ0J2SlVUaFZZekxUSEh2b2JS?=
 =?utf-8?B?K1FhZGpyMDVhdVNxWmFVWm45K3BiWUsrYkxNN1RUb3Q5SFBjanZBTk8xQS9s?=
 =?utf-8?B?am9rcE90WkJ2aFM1eS9rUmRMNDFnRFg4SytYUjB2UnNqRFdkRjY1Y01TTWV0?=
 =?utf-8?B?L0hIdWVXUlArcFZsWnR4V29pdnkyQTFWSzdJdWt6bXhiN3RocExKYUF3VHlt?=
 =?utf-8?B?SGNtUmVBanJNeStyOThNc3JVZ1FKY0l0WmdIdXEwZDZhUTliSGtZSkZFbVNY?=
 =?utf-8?B?ODBFN2FzUHJaZGZlTDJkbWdRbzZVZTJNcERwZkJrNnZvQW8xbllONXh4Tm53?=
 =?utf-8?B?N1NQSXRKdjN0REFjMThVWThabEJ3cEk5MHZIOEcyTXdSVEdKbFdyV0VlUXo5?=
 =?utf-8?B?elkveWRudisyTHN1Qk5OQ3c2ejU3T2poNnN5dWdZTGFHbnJQSWtCV0YxcG16?=
 =?utf-8?B?eWRzdiswQkRXcGxHZndpdlVkcFVOSldOSSsyWElUS0wra3Z1ZUh1UTVQOHl5?=
 =?utf-8?B?VU1IYnlocDczWlNoOUVYWFIyRURidWlhQ0lyd2tRdjhHbUNTQXFzTWdQMTdK?=
 =?utf-8?B?WWZhL0pUajlZQmxXbmJ6QXBLeUU0SWphbXU5U0IwYUxLZ2ZQUm1XM3FSa052?=
 =?utf-8?B?S3hYTDN6U1dPRnJDNXV6Yy9Zd1VqZGo4djZXY1c0b0c2YTlzY3FQNllZR1lj?=
 =?utf-8?B?eGtYcWJXcmhWNHNWUkNZeUlOaUhBV3ZVeUQvdnBBd0dtN1RmTThxdUhtSnN2?=
 =?utf-8?B?Z28xbHZLREhxS3FnMkIzc3RUVEZGWFVRZU14QUtKaVFUZ1ZWK2dENFFxbHRJ?=
 =?utf-8?B?ZTJ0YkROTUNza01yUjN3UGplMkRidmJGY3lMK2dWeFBFVDIzWXFra2tQZEpq?=
 =?utf-8?B?RStFdUJGV0lidzg0bzFPRTg2YVNaQmJWUmtuVUN5eDYxS2dNZWhLZHlIekYv?=
 =?utf-8?B?RVNPSk9NdTZaWWxpY0dlbCtxSXlKdFJvTGFGQ2UvWXVMMTNnRjVYcE9kc1Mz?=
 =?utf-8?B?OHNEZHdoMUlVdGEzUTI5YThaSlpSdngwMlVtNzRXQzhsQU1VQjk0cmJxYzZa?=
 =?utf-8?B?YTQwNlVzdFNGdXVJWmZPdFlOVkNEWTZsTEMrZXJpTzdJcHRsdXE5emNXWTQ0?=
 =?utf-8?B?RWxiZUlkWEE2aFlXeU9DR1BEdmdmeVBKSmtRN29EU25sK0k4WXc4dGdRdTEr?=
 =?utf-8?B?akVOeXRNakduN2VndXZ5UGxyZ3hBRWNONHhEcGJNN2krUTUrc3h3T2dTck9t?=
 =?utf-8?B?RDF3TTdGUVpka25PN0FLYjJvTmRxb21DYmNiMkk2bjVMUWZjbnh2aEtzdmwv?=
 =?utf-8?B?dERzTnZXN0l6UlFOUEpkM3FzRk5SVGE2WE8xaGdhQmNQMC9CVlZsQTEzZWxY?=
 =?utf-8?B?OFMrVHRkRlA3cDVKejdwclpEK3oySytlQktvV0I5enAzOVM1UlIvRWRIOUtj?=
 =?utf-8?B?L3VORjBBYitSTSs3eU9tdVFoaDIwYmJ2a2ZnMTJVcWtaOWd6SzlXNURrQko5?=
 =?utf-8?B?cVJzNU92WHF6dmVGeWNNRGsvRFNGS2Q4WUNLckg1ZTdnMjUxblVadDVmbFhX?=
 =?utf-8?B?emdZSExYN0ppVlJEcHg3V0lkK1RsbVVtNmE4SW5iMHgzajI2Q2pIOHJjbWlY?=
 =?utf-8?B?QkFTbW8zYUQrZ3M4NXVDeFJPZktlZ1NSYmRYeEdyeGx6WFM3MDd5c1Q0NTN6?=
 =?utf-8?B?Y0Y5QVVrd0t6MTM0K1NxRUtsejJXcUpac3h1OVJvL1B3RTQ0QVU0cGI3STRl?=
 =?utf-8?B?K1NBNk55RE4za3I0U0wvaTRBUTBuTW5pSmNNVVVUeVYvem5kOFlqaUVJalFr?=
 =?utf-8?B?enplUmxzQitrVnFJdGo4cXhZY1lWa2Z3c1J6NUpmOGlucEprRDBZOGt5eHp6?=
 =?utf-8?Q?XwNyXgv4A56vATIsN9ldAqArJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABBD0AF6C16C594A87A5FC31915EDA0A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR05MB8534.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4cb670-5c6a-4bd4-b186-08da9ba16855
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 07:17:56.8207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3Wn17R9tHY95Xxxw0HrbxdEQ3cc1KIvLAQPmyaRzCLbN0NHTCMwvNCYi33hZfsO2H3GimrSOfBZME3CF43Thw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB5273
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, Linux MM <linux-mm@kvack.org>, "guojian@oppo.com" <guojian@oppo.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "realmz6@gmail.com" <realmz6@gmail.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org" <openrisc@list
 s.librecores.org>, "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Yicong Yang <yangyicong@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU2VwIDIwLCAyMDIyLCBhdCAxMTo1MyBQTSwgQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFu
LmtoYW5kdWFsQGFybS5jb20+IHdyb3RlOg0KDQo+IOKaoCBFeHRlcm5hbCBFbWFpbA0KPiANCj4g
T24gOC8yMi8yMiAxMzo1MSwgWWljb25nIFlhbmcgd3JvdGU6DQo+PiArc3RhdGljIGlubGluZSB2
b2lkIGFyY2hfdGxiYmF0Y2hfYWRkX21tKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNo
ICpiYXRjaCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IG1tX3N0cnVjdCAqbW0sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgdWFkZHIpDQo+PiArew0KPj4gKyAgICAgX19mbHVzaF90bGJfcGFnZV9u
b3N5bmMobW0sIHVhZGRyKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIGFy
Y2hfdGxiYmF0Y2hfZmx1c2goc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNo
KQ0KPj4gK3sNCj4+ICsgICAgIGRzYihpc2gpOw0KPj4gK30NCj4gDQo+IEp1c3Qgd29uZGVyaW5n
IGlmIGFyY2hfdGxiYmF0Y2hfYWRkX21tKCkgY291bGQgYWxzbyBkZXRlY3QgY29udGludW91cyBt
YXBwaW5nDQo+IFRMQiBpbnZhbGlkYXRpb24gcmVxdWVzdHMgb24gYSBnaXZlbiBtbSBhbmQgdHJ5
IHRvIGdlbmVyYXRlIGEgcmFuZ2UgYmFzZWQgVExCDQo+IGludmFsaWRhdGlvbiBzdWNoIGFzIGZs
dXNoX3RsYl9yYW5nZSgpLg0KPiANCj4gc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2gg
dmlhIHRhc2stPnRsYl91YmMtPmFyY2ggY2FuIHRyYWNrIGNvbnRpbnVvdXMNCj4gcmFuZ2VzIHdo
aWxlIGJlaW5nIHF1ZXVlZCB1cCB2aWEgYXJjaF90bGJiYXRjaF9hZGRfbW0oKSwgYW55IHJhbmdl
IGZvcm1lZCBjYW4NCj4gbGF0ZXIgYmUgZmx1c2hlZCBpbiBzdWJzZXF1ZW50IGFyY2hfdGxiYmF0
Y2hfZmx1c2goKSA/DQo+IA0KPiBPUg0KPiANCj4gSXQgbWlnaHQgbm90IGJlIHdvcnRoIHRoZSBl
ZmZvcnQgYW5kIGNvbXBsZXhpdHksIGluIGNvbXBhcmlzb24gdG8gcGVyZm9ybWFuY2UNCj4gaW1w
cm92ZW1lbnQsIFRMQiByYW5nZSBmbHVzaCBicmluZ3MgaW4gPw0KDQpTbyBoZXJlIGFyZSBteSAy
IGNlbnRzLCBiYXNlZCBvbiBteSBleHBlcmllbmNlIHdpdGggSW50ZWwteDg2LiBJdCBpcyBsaWtl
bHkNCmRpZmZlcmVudCBvbiBhcm02NCwgYnV0IHBlcmhhcHMgaXQgY2FuIHByb3ZpZGUgeW91IHNv
bWUgaW5zaWdodCBpbnRvIHdoYXQNCnBhcmFtZXRlcnMgeW91IHNob3VsZCBtZWFzdXJlIGFuZCBj
b25zaWRlci4NCg0KSW4gZ2VuZXJhbCB0aGVyZSBpcyBhIHRyYWRlb2ZmIGJldHdlZW4gZnVsbCBU
TEIgZmx1c2hlcyBhbmQgZW50cnktc3BlY2lmaWMNCm9uZXMuIEZsdXNoaW5nIHNwZWNpZmljIGVu
dHJpZXMgdGFrZXMgbW9yZSB0aW1lIHRoYW4gZmx1c2hpbmcgdGhlIGVudGlyZQ0KVExCLCBidXQg
c2FkZSBUTEIgcmVmaWxscy4NCg0KRGF2ZSBIYW5zZW4gbWFkZSBzb21lIGNhbGN1bGF0aW9ucyBp
biB0aGUgcGFzdCBhbmQgY2FtZSB1cCB3aXRoIDMzIGFzIGENCm1hZ2ljIGN1dG9mZiBudW1iZXIs
IGkuZS4sIGlmIHlvdSBuZWVkIHRvIGZsdXNoIG1vcmUgdGhhbiAzMyBlbnRyaWVzLCBqdXN0DQpm
bHVzaCB0aGUgZW50aXJlIFRMQi4gSSBhbSBub3Qgc3VyZSB0aGF0IHRoaXMgZXhhY3QgbnVtYmVy
IGlzIHZlcnkNCm1lYW5pbmdmdWwsIHNpbmNlIG9uZSBtaWdodCBhcmd1ZSB0aGF0IGl0IHNob3Vs
ZOKAmXZlIHRha2VuIFBUSSBpbnRvIGFjY291bnQNCih3aGljaCBtaWdodCByZXF1aXJlIHR3aWNl
IGFzIG1hbnkgVExCIGludmFsaWRhdGlvbnMpLg0KDQpBbnlob3csIGJhY2sgdG8gYXJjaF90bGJi
YXRjaF9hZGRfbW0oKS4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIHRyYWNrIHJhbmdlcywNCmJ1dCB0
aGUgcXVlc3Rpb24gaXMgd2hldGhlciB5b3Ugd291bGQgYWN0dWFsbHkgc3VjY2VlZCBpbiBmb3Jt
aW5nIGNvbnRpbnVvdXMNCnJhbmdlcyB0aGF0IGFyZSBldmVudHVhbGx5IChvbiB4ODYpIHNtYWxs
ZXIgdGhhbiB0aGUgZnVsbCBUTEIgZmx1c2ggY3V0b2ZmDQooPTMzKS4gUXVlc3Rpb25hYmxlIChw
ZXJoYXBzIGJldHRlciB3aXRoIE1HTFJVPykuDQoNClRoZW4sIHlvdSBzaG91bGQgcmVtZW1iZXIg
dGhhdCB0cmFja2luZyBzaG91bGQgYmUgdmVyeSBlZmZpY2llbnQsIHNpbmNlIGV2ZW4NCmZldyBj
YWNoZSBtaXNzZXMgbWlnaHQgaGF2ZSBncmVhdGVyIGNvc3QgdGhhbiB3aGF0IHlvdSBzYXZlIGJ5
DQpzZWxlY3RpdmUtZmx1c2hpbmcuIEZpbmFsbHksIG9uIHg4NiB5b3Ugd291bGQgbmVlZCB0byBp
bnZva2UgdGhlIHNtcC9JUEkNCmxheWVyIG11bHRpcGxlIHRpbWVzIHRvIHNlbmQgZGlmZmVyZW50
IGNvcmVzIHRoZSByZWxldmFudCByYW5nZSB0aGV5IG5lZWQgdG8NCmZsdXNoLg0KDQpJT1c6IEl0
IGlzIHNvbWV3aGF0IGNvbXBsaWNhdGVkIHRvIGltcGxlbWVudCBlZmZpY2VpbnRseS4gT24geDg2
LCBhbmQNCnByb2JhYmx5IG90aGVyIElQSS1iYXNlZCBUTEIgc2hvb3Rkb3duIHN5c3RlbXMsIGRv
ZXMgbm90IGhhdmUgY2xlYXINCnBlcmZvcm1hbmNlIGJlbmVmaXQgKElNSE8pLg0KDQo=
