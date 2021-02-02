Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3D30D01F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:05:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVhlf2GQ5zDrPx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:05:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vmware.com (client-ip=40.107.93.87;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=qPfK4zqx; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVGSh1nX1zDwh6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 18:21:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhbQNYtbPGAngUKtpbTfaao1+MQ5coSSi86aHKWeXLzncX1qGhI3y+ZQcsUmjBJuoA9A4wt50sOcOBy5oMrrFeTnJOnhOoMFxDYo6deOnHbKGqBx4hjgpu4rDb+EOCF6jViPoLqW+SaU53T2pDlXy+6/55zxJMa6qFzcvR6x+dHCmGdn8yUAVfsptTdZY1eKH3G2EPmGFoU1YI/aoM0PPP759BoUNnFP6eLVo9Qla5XLJ6O9oY6xnyYpmLcponEXaZRrbFTXJpW6F8l/oKGwj7FRQL9PYgwemFXxIjzRWEb7V1wpNqPq4Otguxx6iTB9cWm272N+4q1gicOmaXPKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECO9x/qK3uc0zyJRSS+rrNDNKoX8+fHrNra1uqEALsc=;
 b=fgaeXPUYXV6huSln3uUfanguSPrD+czu38GUlAzOdwbEJfjbqIpJtHp4EV5/6mNd8TCDrQ5wxdWRr2Diq+4pK/H2y8vXjovoOn7p2V9uAYoiJOTMwgy2t29l/a0b/2Cmjw7iUfjV8q8Zf2XV/x4Np9rQAESF5iQ2rpHmRBnOgnCLpWpYR/m/MGjtg5YrxhC+WNf+cQ4+uUc1ZQElWCkX2NthjwDifO9KzsLhhWAitOCprFkker25h6PNZYpyQKS0MH6F704wS+8G5AMri+P0bFNT0nP2gARZsEcY3nC+wCC/SXmn0gQQ32fjUvP+lWZme0qhfnYLfhkMdC4UK9i4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECO9x/qK3uc0zyJRSS+rrNDNKoX8+fHrNra1uqEALsc=;
 b=qPfK4zqxu4FQ7ndS5OZxty/Wklp0OcMMx/BQFGNfVSyAXXwoJQLfAXZ6lvCHQZAbLVqbtlkv7ew4KmcP7uTALWS50YL8n6Ho4TpFyRNDyaWPhQDe2Yj9GDMwp1obAmejC84uOcrDQrmui5Y76g6+j3JejNLzqI0nqZP1ui3KhY8=
Received: from (2603:10b6:a03:4a::18) by
 BYAPR05MB5528.namprd05.prod.outlook.com (2603:10b6:a03:75::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8; Tue, 2 Feb 2021 07:20:55 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31%3]) with mapi id 15.20.3825.013; Tue, 2 Feb 2021
 07:20:55 +0000
From: Nadav Amit <namit@vmware.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Thread-Topic: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Thread-Index: AQHW+JMuIjRLErxJlUWOv0AHOQSsJqpEa7AAgAALDAA=
Date: Tue, 2 Feb 2021 07:20:55 +0000
Message-ID: <F1C67840-C62F-4583-8593-B621706034F6@vmware.com>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
 <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
 <1612247956.0a1r1yjmm3.astroid@bobo.none>
In-Reply-To: <1612247956.0a1r1yjmm3.astroid@bobo.none>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [24.6.216.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f6a5cf-fe57-489e-23f7-08d8c74b1477
x-ms-traffictypediagnostic: BYAPR05MB5528:
x-microsoft-antispam-prvs: <BYAPR05MB552855887CC6022D24FFB8D6D0B59@BYAPR05MB5528.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BZfDT7DcahSHxx3VOBloQg3kv1zvejH2pt+Q8obe9B6QkrglRHNVXQL5IynE/svJbp/K3fKBEQ2O4K/6GDWfPtCUcV9rlGAz0ke9ALSCFHZ7oR7VjGj8vOAychmpiLv7oUme+zFmWuVdsHQmng0Zrw4q7ttVNqEuAJPiS2/75glgL7R6mJzi+JbKI+qtwVoQcLksJ4poNYQ/31tBlQ3Nhv4FdXj9/9ACFrjJX7QW34ULoUZFxDBQaj6suVnEQgvQ6wZokpSy/IeytnVViz0JzabuVBRCtTR6UWTIP40b7PdATMIYC7bvQQUJqFiEyCrFHV6s8ERpSE0ETqpzKKA9ew6nmLVa+GVfh6SYpAOUQAvZ8ZUO3y648BO3d+myiZDtfVp3NnEG2FkJSSpmdH1Zh5sTeL0sqaQ4i0Rm7TXOSW3KWO41p/LEmkxxNC5Tqlfi519JMRY8BsyjqvNKw/SvbRhzX8MhybCl1dveCPD5PMs93LQMSW58PVrhcp+sU8eoNpiivjop2zQwdWX3vbt9id+cjBLnzRPJ9KDfXZc39y5w5fySb9H/1Oc8LhJ2CN2wZgUXWTwW3ydlth75WerXrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4776.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(66556008)(6512007)(64756008)(33656002)(86362001)(8936002)(316002)(66476007)(36756003)(7416002)(4326008)(5660300002)(66946007)(54906003)(83380400001)(8676002)(6486002)(66446008)(76116006)(71200400001)(6916009)(2616005)(26005)(53546011)(478600001)(4744005)(6506007)(2906002)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+/YPFtQOtQqzARpaTimB5K4lX/TY3dFSH3u/ggkSx30362QxfiJREoZx8h3e?=
 =?us-ascii?Q?Kl1cFRdTPblEiWQtmBuV+iGI6piq88xArl+Jl55PIuqDdnxIgqe++n7GNxz8?=
 =?us-ascii?Q?/f/3Mnng3U9MTeTh7TawXObgAI2uG8W8Pt/OfjnR3UVZqhScE/iSJSgAnu4T?=
 =?us-ascii?Q?8gS9JB4fgppjAX53gx1xhkqnw7qga38p2y5KNw7PZHGPUvM8+SCPBycJZ9O7?=
 =?us-ascii?Q?zkghqZNh7et/zrAU387CDQrE8+iiBm9Mu1B3QBFXf5nTb1CJ12CCbH7Y2GZz?=
 =?us-ascii?Q?Ep0WnIob33C4HSXW5f3c8roUKSfHrJHSbzCEkfJuDf45Hkd8EPpxtAVwQUG+?=
 =?us-ascii?Q?WJBSjOHdL0shBXLThNtbkvtALSBHp7NGICM0/i/oiiy+ae8PIzLTQRAGpSwQ?=
 =?us-ascii?Q?C0cyhezMlRaLCg6rp1f+7h5af4quRJit4VnW34v7Zx1p6psKvzaPkU3FFnZz?=
 =?us-ascii?Q?hIvYCs5q69F15zEqyGvTQpoR6iUtyUyqCPyP5qJRJRwOZvZAljsiNR75c8Py?=
 =?us-ascii?Q?mKkGNBFQ8XXIpcGQQW0B6saNFIA0jzlaRBLpZ+sYh6w5srOdNquiAgTv7oZB?=
 =?us-ascii?Q?8tub7OAodUHfFOCZF6qwMB6ozj4EL6cbCs/YUDwU+kgca6XDAQe/BM4lW61+?=
 =?us-ascii?Q?dO9nX5ymy0MNhgxy0VYnkcAQsXPHczh0WvSBdtXfgWXqER6xzmmI2ZDwmI9A?=
 =?us-ascii?Q?9qJaxAXBmRM+Rv9Dlp6aWAKH64A7odzfxPN3ERL5fHPTebjpiRYXhANbFIW7?=
 =?us-ascii?Q?H/V0HIy/M82BZKSAJMgO/GS/qODUgszaHzvPxSaNtsLa33DgPo5V8rb7xcUi?=
 =?us-ascii?Q?TpmsPgCJtdXWPUQuWj5WmU1RP+WJseybG7/UsJMVjIU6xKDHTNU6q/ekK7ux?=
 =?us-ascii?Q?bsYKlvB7PCsMX6ZpxT1CDD2Z/Vq0yyf0yAD0VAub9Hd+gTLjEm0SF8EHyVPz?=
 =?us-ascii?Q?703bKXq5MjVnA/bVDXKorMvVOtLGqSi2St5kdEAc7DsYb4zMPmWDXXLHtoPD?=
 =?us-ascii?Q?Hbv4jCn+9l79sRMMbPoBkM82i6qmdo97kqy3xfFa56il88OIzZvDM6Ebx/Pg?=
 =?us-ascii?Q?bXezC47B2YUvNdFQqUB1pZn9hw/G68rMwpmbNxS31ubnM/skQE6QhzU3gT0+?=
 =?us-ascii?Q?FIxQ/vZdYZbGIF5/HAzq3XFnpQaZ9yy9p2kTFIyd6OZTorVjkY2unXblOoA4?=
 =?us-ascii?Q?C3/RopJkIOF8KeYkIgczjDFRGgWM6QE0q2ZVtYR5XDt7weVIr2S8hA10/V28?=
 =?us-ascii?Q?HVFeTYOVw5M5EBoOyQEigVgao6SRDqMP2/k+DIljxvNUN2qo/a+P05APsysQ?=
 =?us-ascii?Q?8ORHEPx7KShY/MWN0+Ucv3SO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <36FF6560AB7F494FB9A440197E9AD6F6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4776.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f6a5cf-fe57-489e-23f7-08d8c74b1477
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 07:20:55.1482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGkUZaUFOl8GpBd74ArrXovY8ZpbELcQRD7kNIyObdCBv+JYoyCazDd5MJAOOYzpqd+hMc3RWW16CTgQLg8muQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB5528
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Feb 1, 2021, at 10:41 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Peter Zijlstra's message of February 1, 2021 10:09 pm:
>> I also don't think AGRESSIVE_FLUSH_BATCHING quite captures what it does.
>> How about:
>>=20
>> 	CONFIG_MMU_GATHER_NO_PER_VMA_FLUSH
>=20
> Yes please, have to have descriptive names.

Point taken. I will fix it.

>=20
> I didn't quite see why this was much of an improvement though. Maybe=20
> follow up patches take advantage of it? I didn't see how they all fit=20
> together.

They do, but I realized as I said in other emails that I have a serious bug
in the deferred invalidation scheme.

Having said that, I think there is an advantage of having an explicit confi=
g
option instead of relying on whether tlb_end_vma is defined. For instance,
Arm does not define tlb_end_vma, and consequently it flushes the TLB after
each VMA. I suspect it is not intentional.

