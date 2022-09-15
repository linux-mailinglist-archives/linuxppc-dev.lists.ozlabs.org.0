Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984875B9D2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 16:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT06V5T2Jz3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 00:32:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=2GCtkOnC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c111::9; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=2GCtkOnC;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-centralusazlp170130009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT05j430qz2y8L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 00:32:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHeyFDBD+AItx7PhTsSNX0O9s8yFr5IWkj28k8PjvC/Kt/FYIXqh5vctYF/ak0wHljtoZEII2RLXHcPHHRWRak/EWjN9f12Sru/qkFYCczF+A8xDJO6EaaVf6ChEDl/9Ll4rXxK0OhTSQtqAklDRYSsi/X2WlNboO29H8gGxs6eEYKKcwO1SE254v3JcJGvUpGyxrHmdt8tEncZopa1hzAqKEQFsxVCuwKFOEPJyIN4DEyHs4Xok3CgkUvfP8vDBq5BktZ6D/p0TalxLfeGLOxeMFqCNg8hRkCyW7YvQvOz3vANY9CL3ZFKaWs4JIld6Rg04AOI7nCHHD3tMpgfYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU9/jwik2S/Ca1+WTB2qizOF8aMDF1VlWAbarjk4we0=;
 b=JC+pr+Uzy7/ELQbWpY99or9qfnCPUTRQh7XwpR5tqLhqqcbLwuLAaSKIszzF56K/ONoaF3+t8I6fmzsa9NACt3gWRWDAtMr5rvFvctF+b1Xs6VgKSXzc2/0sNbezN8Edwrlhaq0zDFmAvyDwhjtCbE+O1EfWbKevaQU7nDjksMJCdm8jtijaYxbFttRmIq0xtq4ePo52VQnbJHCwVoesmaFY6swTuWG85tzFYKvvfB5eEPjBuvfBhcoRbFQlE06AHOf12/macKsRe3x5W/zPw3E/fVDwGbDPT+87hWFy3MNSNgT5U3C5GkfevmIzX8Pd8psg4eHfXt0Ksy16EbcPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU9/jwik2S/Ca1+WTB2qizOF8aMDF1VlWAbarjk4we0=;
 b=2GCtkOnCc7AytbbpZx53V0W+EN0rP6m/PTG5eO0d18eNU0lR7S681UUQRNqiH9cIOyTLprtmvfoJ6nH0PfhAbLEY9RpWNZyWL+MgAmPj3fsFvB2YQK0LGD/goefq4/YHe+4Q/LDavlmRNfa7G+18HpRJb6LfqZMujRcWBXrm4qI=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by BY5PR05MB6931.namprd05.prod.outlook.com (2603:10b6:a03:1c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.4; Thu, 15 Sep
 2022 14:31:45 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::e46:a7cf:acd:c835]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::e46:a7cf:acd:c835%2]) with mapi id 15.20.5632.012; Thu, 15 Sep 2022
 14:31:45 +0000
From: Nadav Amit <namit@vmware.com>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Topic: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Index: AQHYtgB7WHPVSXtcQ0CQkErpE23BFq3WrNAAgAADEgCACXcNAIAACaCAgACDMQA=
Date: Thu, 15 Sep 2022 14:31:45 +0000
Message-ID: <2AB9EC05-16B4-46F8-B716-53941C1C9A50@vmware.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
 <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
 <1125554b-c183-23c4-5516-95b918a761cc@arm.com>
 <CAGsJ_4zkRv7RYCB2SC0uydMSQWfwXs3-nkjxMoR7wgn2nt43gA@mail.gmail.com>
In-Reply-To:  <CAGsJ_4zkRv7RYCB2SC0uydMSQWfwXs3-nkjxMoR7wgn2nt43gA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|BY5PR05MB6931:EE_
x-ms-office365-filtering-correlation-id: 2fd87c49-7d2f-4c91-f73c-08da97270419
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p/l/a3ULHbnWmI8p16l5x7McwxcbPykOMk7prk6v6JcpaK6U6zTgijBlq6f0oHQlN7mdizkKVDaZvPHry/xJwCmp5CkwMKbB6ius44BxgXY45+MG9mhMcnWhRKcFT6adS7tUshiwvR2KPHur6mkZFP0n72ribLma8c6qF4s4dX4mSlkVG+Fe4Ado/AqPiViCiRWRxjtTag2pkqPOZQUj0i3eqncbyB0wTucXwtDqava6oUuuQL4YxI16Pzz1OBABPK6ViF7An5HRFM4Xgn/g65AvGd3G6lXf1aOPQKLc7B0F+wP6X1mJNZX26mkllo+Qa2ogM9UScGvERBrc4JiWNgq3+UFcQZdFiKra9FXsH6EVDS12Rcr1QANGpRmHoqAFWp/WPuHFMKMqJx1+qbqSaAVTp+adwiiHfwvmCYLliQDOhqcof8fuyOedUqxn/ruytw/syPL7OmdTwdo5Un99EcaKKB6zLPoi9rmjZzC50lN+sG/Tzcuo9qT0iXg/f1P9/6AYDPMpCMvp3OKfbm9GKTFvElOYSaM9FO0EA8Z4W89IRANO48u/Uw0nqOUjTdlTEx+EggVCQjEhyg6OQpqlJJatWBvLO5dLN75KknRoGUP9XPKr6VHPPj5WWks1ABYl3g9qza10OS8bLoKFbFcm2slYZU34q/dKEQzpIDgXlJtG/o2yUARD6121/o0m0s16281UlOf+k+5mdVFGzHsSksEqtmqb8ynmcvwiWbIXZmOBDTL4e4Y0QD4SCiMPe/J7z3o4b0Vcqwr6OHAogRHebVFIVGRs/37PRjLJGSGUzCiYEG0QU9NVIqD14MPwlRZjjQhYJqDBA5Vu2ooBjoad8VIpPwyF7j5J+hHTn4JX33U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(38100700002)(66446008)(53546011)(26005)(66556008)(41300700001)(2616005)(7416002)(186003)(8676002)(122000001)(54906003)(6916009)(316002)(6506007)(4744005)(6486002)(64756008)(2906002)(66476007)(76116006)(4326008)(8936002)(478600001)(5660300002)(66946007)(7406005)(86362001)(6512007)(33656002)(71200400001)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?d8Pv7Cy3K+TOApWdCapKdbFvTEWoMZymv8TKkx7s5RofwTab/ZyPN+qsPvbW?=
 =?us-ascii?Q?mifE0bd5OiG7/Bk3aMOasgq2djUQmFMQejZLguAQVk2o4pRTPFAz2sEH/0cB?=
 =?us-ascii?Q?1vl7BgiQDSOgCgzCh2eFj5uiJhdWU2i4IVYJWE7zY6EqO3kh5xu2cZdSFukD?=
 =?us-ascii?Q?UUhPtMBP5CDoNVJgOrhKkGUOCl5QU/OLvXfHJAQaeJ58DVHN79fCpqZVlw9z?=
 =?us-ascii?Q?qS46Col+GUCPFfCMJm+bJKqmGYXq1l4xvUOm711jHMcTs49DMk8/hJgXfLXm?=
 =?us-ascii?Q?5Xwod9AsI47BZhaXtwZcsQHBiE6rLJfSqGufKD9boWiGtJJOAdiFmSbJBHyR?=
 =?us-ascii?Q?VVMVvH1eQg9RQiIjQTSj8Jqc5DdQ2FF3iNo+V9TOBZY6YzRcBTdhKxVAFU0k?=
 =?us-ascii?Q?yT0BWO4wmJTPCWxkalDkJFE6TNj87iqRRNFDxCQ+7K9cleZusu4IPRt/UGI8?=
 =?us-ascii?Q?VGejVAHg4GvrqV3R+y7CQS4+IADCMT4iVENz/rHG1CEBZp2FLxFZt8+LlsCt?=
 =?us-ascii?Q?4wZyW03ioYjzQ7q+OSMxROrBcAQRylljUEvD+p8X5XOiusyeiRuykOn7Ho1y?=
 =?us-ascii?Q?Xh3UfGbhQMTzSIbRImpnFTGV2YIkyJPWuAZzCGtyy932Mj6vnc3530sAZa1J?=
 =?us-ascii?Q?X7zdqsH/qbMXz6GLcE/FDMLEPWqnfkbHo6e6Oqk2f7LhjK10Y5U+WS8im+PK?=
 =?us-ascii?Q?qceBFhEnnuyCuIX74uivOn//RZ+PNooCJknceL0kzXOJy8u4Yq5ZPXhxjJtb?=
 =?us-ascii?Q?ryjaLO4sPnyzMwg9jxVvcyrkGdf7KJxbeqEdze1koupIOfp0s+KZV6NBaTmK?=
 =?us-ascii?Q?EcxO9CijBzpI59ymKQIwGO7KWUZ+EExYkQZOLWOHI9N9q7s49MTt2pKQ2BKA?=
 =?us-ascii?Q?o5F11pmnpFQskPGSJH0eT5Nmk0grwC+WeR4da28JyyUjzo8su2IkS73tUpBu?=
 =?us-ascii?Q?2cE3bArUC4lLs005xDd0yLsTaNeMQ3m6CXP4I4dA2fRBoWxAyGk4kQITmNE7?=
 =?us-ascii?Q?MtZIUR8IKQJt2oFFjplg1dV9K0my+sAosB851BcGtOLO2AQZwzTGpUISaN2O?=
 =?us-ascii?Q?WdlrJaZolHZxFbzGUyZuDQRWuIzkLR05WoFHmfW/DwoosVrbIjzWLrHWZvrb?=
 =?us-ascii?Q?rlKbPSy5tNTb6supuoGLED6eWWVox8Jc86qVqpyEZyGqK5QbxgOxI41BPgCA?=
 =?us-ascii?Q?dPsf6F28gumgJaqWn5+Bc/rRvrRc0KMhAuO8UBocKPp+UfrHcoJUpnEZO0im?=
 =?us-ascii?Q?av4a6Qw8caN+SHtJPc0yqzCbrkD9jlxQDrR75Qp77N6N/poL6sQtnyem58l1?=
 =?us-ascii?Q?s3pxGtlvzAaajxxA8PmPmKoSopf+yDjNIL6dB+jGvdq3gCGQk3U/HfHZeHVh?=
 =?us-ascii?Q?0dihMDbRqHZoGdOZmlc6A4266tTiJQRPBQ/Eda9m1p+ICVfrETipkBhg9dON?=
 =?us-ascii?Q?Uay+go5mAl8aQW9nmxo6ahbraHZ6t+8AyCEupOPqB7pKuZFxZ1CnckKAUAeu?=
 =?us-ascii?Q?bmX+m8YkjZvqeP4R0/Vc+grXrzs6gKwrWTYD+j1u1SLu32pZfyOiRE+pX6cY?=
 =?us-ascii?Q?07ZXzBjydMmplwjTgUcYcvvg4IzYMy4ZE2grc2lP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <011A480CEE0FA44B9996ADE03C86ECEA@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR05MB6931
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "realmz6@gmail.com" <realmz6@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, Linux MM <linux-mm@kvack.org>, "guojian@oppo.com" <guojian@oppo.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>, Mel Gorman <mgorman@suse.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org"
  <openrisc@lists.librecores.org>, "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Yicong Yang <yangyicong@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Sep 14, 2022, at 11:42 PM, Barry Song <21cnbao@gmail.com> wrote:
>=20
>>=20
>> The very idea behind TLB deferral is the opportunity it (might) provide
>> to accumulate address ranges and cpu masks so that individual TLB flush
>> can be replaced with a more cost effective range based TLB flush. Hence
>> I guess unless address range or cpumask based cost effective TLB flush
>> is available, deferral does not improve the unmap performance as much.
>=20
>=20
> After sending tlbi, if we wait for the completion of tlbi, we have to get=
 Ack
> from all cpus in the system, tlbi is not scalable. The point here is that=
 we
> avoid waiting for each individual TLBi. Alternatively, they are batched. =
If
> you read the benchmark in the commit log, you can find the great decline
> in the cost to swap out a page.

Just a minor correction: arch_tlbbatch_flush() does not collect ranges.
On x86 it only accumulate CPU mask.

