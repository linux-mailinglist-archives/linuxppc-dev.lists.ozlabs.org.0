Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D50AF5B65C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 04:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRSS65BDTz3bbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 12:42:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=elhpZwE3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.101.51; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=elhpZwE3;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRSRM1qHVz2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 12:42:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsDTEcjnzblio2Im3niYfwNYdNWFO22/rnylF3UwAdw3Ail5LTB4poZBN1mE9V/LK+cc5+fkhBnqgL1lQYv+yo0rK1PLMiTnkUtSv+fsZojb5lbXv/Ndphl7DpD91F51Vi5VfjyfN6cZpcmfkHz72fT5u6/TIc027TRddnJP6fo5qKZbbeFiN1qcCNz4vkZwgoXZeznqpwKwyvzt3/u0vnUo7gz7kUpj1cWYehlOjxWbipGwJLAKl0RXxY9LGLIqsW7TAqKb1jQPoaJg7+vgVn/5Z/e8XPkAqwynZIfi9xhQC7opPpzTVDwtzFBOd00AEY3RIqwdvQ0nowKjkFBmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omC3X8HEN0/85hiLEF8vpnKf8kJzMNRLkGhZuYwV5/Q=;
 b=SINj4nvvOEY6teKBcadJNhKc4Z+3q21V0DRYkFO8E1F/q1lP7yDzt3f9CmP85dRR8SmoIYI9TPcdbG3RO4OvNSTIvN3rPVsyDGShbSOqwLyQadE7lJ3mmgibshOGHRIJSNtqqiifwUczJmyIPM7nW1bv+6PIMOBWudUKkgL6ARhi66OWQq1Rh9GYeCUkFDbaU/tq6mV/oowQh27AAafx3oYugL7qN0WA/cecLF7VGnemBdjukFs0KP5w8LWSPL41VBaLCZUFl6MNIR0Uu0uLW1AnFZSLLRAzmnd9Tw2vaMeIibJZ+WX7Wtc2UoDnvG6XyJ3g2lYMU4vk059a4b66lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omC3X8HEN0/85hiLEF8vpnKf8kJzMNRLkGhZuYwV5/Q=;
 b=elhpZwE3E57GnAGsVYhU3wa566794MfSNSgsJI90rReyTB041J/A/LAaL0knQYX2vMqgR3hNprd4F/UMUaSRmz4mmh1RMOQdwv1ButJPKslSEYb75yIPD5Lm21yKjhZrnp1qr5ycbN8FHb9kak8iilLVzg50Qn2NjQpFoLosaC+iKHAyed1WBMEp5mvzRPkR5kwRbqMksJNfg6KeF8dHXCSI8HWMQpPdSAYcVb2X3YlaTfaxE0vzVBCYXMuWPj7nL0eB3FH5Xz6qdmEMlqYzlpoCbi9LJAuQ7jnqOpgsNvHrMlqREEYpPTcc/RZcqRvJjEggPiUreAoKzUzP159CEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 02:41:41 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 02:41:41 +0000
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <68cf1d70f3fb8ce4e3c1a4899c19df4f6c382a13.1662078528.git-series.apopple@nvidia.com>
 <f81f6f90-81ad-7b77-a74d-e9d5d6e3bc94@nvidia.com>
 <87mtbb5soy.fsf@nvdebian.thelocal>
 <90a0441e-47ad-007f-06c1-b30e5f7bb692@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 4/4] selftests/hmm-tests: Add test for dirty bits
Date: Tue, 13 Sep 2022 12:33:40 +1000
In-reply-to: <90a0441e-47ad-007f-06c1-b30e5f7bb692@nvidia.com>
Message-ID: <87czc0m1wd.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: cb83a520-b19d-48fe-2db5-08da95317d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BANjnYoEB68rwRPwWEp68uKdZ8LkPf7pWy90KmlxxfQffcOOtA5uoZuLiQeRw+D/MDN3ADiSC5Uqh/fH5jUUTkE5ZRyt9bRAbRROPQeaUb8WTYBWoY/pJb6UnAix+FmNh5iM2l+wYR84hlta0DOSbx2/ohzgu5JWAZsXlOiJEgDZrxLYWzTntMUaMtkuDW8oBomnM5zgqt3rK2OhkM6zTIS9SZtNgLbzqZghDW5AHC/1xxQbSUAluqZ9a1myyi/Qs1KsOYio+D+DzPok0tEjCIT9gtokTCg6srD2ba9cDmBEUdNSz0924k5yzLXEYSr4P1VsmFQPo+dEI9tdkzpJ3MyuG+3WYPv7fvcUnTfhxt+14Kzsq3n5LP0bR9kLKbozqD79GOYnozO6fUEtg42Y0aLQalc9YDXHUrRi7IcSthMpi3MzTWQ02yZYdhUtUP6j5lYd76WGhWXg34ycbw4tBFfenWnyNeSs6tYX0zTQffWFJixTgb4b2NJ3Kx6vY9UJ7Y0M1XrJcfkG9/U7rXNsjZ3Y58Cg+G0r15hF28JfI0m6nepOjtHOYL5GYxxRgfc46zSyfWebQDa80NXbarhtNZM/7NhcKZICLc3EniKTCCgOTxHYRhmkESb4WzzPNka30yeZItgkMDvHT8WOiE/JlNL0jD41bfJxW+84nw1ybw1lr6+5PAfEGXq7UKiFGow/IwvuUiTQmjbFzo+Hwdsb+8qg7rHUojYFS9Co/5xmxIeSq/QLEYFOD01KSbp6LcQYwX65ZztpPRIgGb0kQORBGg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(8676002)(66476007)(2906002)(9686003)(86362001)(41300700001)(316002)(53546011)(6862004)(6486002)(186003)(6636002)(6506007)(6512007)(26005)(66946007)(5660300002)(54906003)(83380400001)(8936002)(478600001)(7416002)(4326008)(66556008)(38100700002)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KaCH68r1cOfK6xkHEEUmKitGj0h5DWYR3Ure1vwz20giz4+xCugEV/DcRoZu?=
 =?us-ascii?Q?a9l2L97a/9YBaltC34p9/LMIoKKy5FndVHpRTAyzKT7i5uUHa193FNVZb0RU?=
 =?us-ascii?Q?OmYhMoqdK1EXjqXwz60sF4z1X6OQP4D343j6kyLbyvlhgIODB7w0tqiVJHg1?=
 =?us-ascii?Q?lcUN+2Q1cCSEJXkEQsartvLC+Z0cr5RLK6QZejL6b8LfvmC2AV8JASEfo7/j?=
 =?us-ascii?Q?/h8mXPBfvpSRtBgzHSvrW4+z2zTz8muOTex0mSn6wxWkuo09IsYHndHE8YCl?=
 =?us-ascii?Q?GqiX+T1pvt4vq3DJKzdlfGOgOVLZixU06OmC2tD2SyX6PPTOJAp20C3OY5Dc?=
 =?us-ascii?Q?WZQIq2Tc937SorP+yTz+jWObLyuqLmKWMr96kVEcv3DkkwkbcayPCp/m8ud+?=
 =?us-ascii?Q?EixS8u6cb4esKlAmnRKGR5ElpZqeI8bByJMtmilyRCB+sYQUPbLT44arUmge?=
 =?us-ascii?Q?UxK9ZssHbkgJFb3QvjMFTlNZQf/iNu4AL5GsWvSzc4Tb9tba1NkK1MNHDSMG?=
 =?us-ascii?Q?tUC2zoBMDKRl/Cek+NinNsCz2r9XzUnZe/Y1bxcAgO8OvmkepoChxmPsRpsP?=
 =?us-ascii?Q?MPi93x4BnJTQs/tyOzcGtBXgMNMBaLFEOS+Y48MCdg4rm4z+zZWMx+bK1RaB?=
 =?us-ascii?Q?R0jRBcbNKnuv9kA37Jm3R+AeI5S+wbiJdIJDlkoPeJf4+jw8veULydKdQ4AG?=
 =?us-ascii?Q?2Hii9ybyPO64dmi0Gnjr9fbWP89JUZj4VvWgqLwt6MfEEEKGrettg8+5czF7?=
 =?us-ascii?Q?cXYz5YdGC+nwgPBdtKgYJkYBp51LlB81te0pVXRyYSek87+uzZeIgWqnHWUo?=
 =?us-ascii?Q?vNtvjMaDHV1NT910rz9jR6auuN9ISOXCpL7dk1Co72OTsCTuzjMwLn3iH9oj?=
 =?us-ascii?Q?28sKj8Uf7YvkVNYoajMHTZ0dwPPBnOhKZWQs1rLQzN+ZA9qFEitH5yoMvZvY?=
 =?us-ascii?Q?GTtELIliy/sdDlkdu0WhLYtGjG7dr8tU7vbGEJwyvET73wOXipQGdTtNlwll?=
 =?us-ascii?Q?4vr3PjK84ir2lQjE+n8dAO26OnHhocKntgv0bWJl4/ZMUt/8KtnddonFeMJy?=
 =?us-ascii?Q?OFR3g1cCoYEVL7zd08rRLiLIS/8dAmlgngVT0vQmhFwJpkeP4lRbf0mafTmf?=
 =?us-ascii?Q?2k4tOTLfFsVN0IiLybGQZUheP73T1C/kcj/5BTVbYwizktoXYa+aHKy72xxb?=
 =?us-ascii?Q?7AMg7qdzSxa2409jSXcApJqXt35Z44tBo+kMpwPhdKXNVH3WGHhwS7vFPsd0?=
 =?us-ascii?Q?ENIIejwtnchbdaVGLNEpLnByLZsOTQXgNaMhNcS1vK6C4cgEGC5hUXHJJkYM?=
 =?us-ascii?Q?kFkmgPiYFoQjPfaMYcvuuNzyzyscVYhpJ3qihqcWCpWinh1z9D/n1zAfWtAP?=
 =?us-ascii?Q?XDnbcRvTrqHWAHZFN4SKfrjihXcHyZ98OwRtz1xY6R2RCtlXup5fhfLY2if/?=
 =?us-ascii?Q?fxazVUZ+SVvo1h0sut9v++SEPNVoEmE8Fr5hvrIopPJYYObpVmlD22eo/Bbv?=
 =?us-ascii?Q?0viQydzOTjFCAdnqgKP3aJtBjhCKME1EQRgPWMCF2j3hXTqzfIvhjOD/wIo/?=
 =?us-ascii?Q?l+A+28gE5+fzZISAzZWcUf7XK3TjQ7BHEWit9+ND?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb83a520-b19d-48fe-2db5-08da95317d18
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 02:41:41.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKCoKgiYhGEnYEqOLpmZcT5nVh4BQ/vm+PtYfcPE8Al7Y3r6J91eg8NlXT9Jm8QRA6DkAqDE9HDdt2stL1Xizg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


John Hubbard <jhubbard@nvidia.com> writes:

> On 9/7/22 04:13, Alistair Popple wrote:
>>>> +	/*
>>>> +	 * Attempt to migrate memory to device, which should fail because
>>>> +	 * hopefully some pages are backed by swap storage.
>>>> +	 */
>>>> +	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
>>>
>>> Are you really sure that you want to assert on that? Because doing so
>>> guarantees a test failure if and when we every upgrade the kernel to
>>> be able to migrate swap-backed pages. And I seem to recall that this
>>> current inability to migrate swap-backed pages is considered a flaw
>>> to be fixed, right?
>> Right, that's a good point. I was using failure (ASSERT_TRUE) here as a
>> way of detecting that at least some pages are swap-backed, because if no
>> pages end up being swap-backed the test is invalid.
>
> Yes. But "invalid" or "waived" is a much different test result than
> "failed".

True. Unfortunately our test framework needs some love as I don't think
it's possible to return a result of "invalid" or "waived". We can skip a
test though, so that might be the best option here.

>> I'm not really sure what to do about it though. It's likely the fix for
>
> Remove the assert. If the test framework allows and you prefer, you
> can print a warning.
>
>> swap-backed migration may make this bug impossible to hit anyway,
>> because the obvious fix is to just drop the pages from the swapcache
>> during migration which would force writeback during subsequent reclaim.
>> So I'm inclined to leave this here even if it only serves to remind us
>> about it when we do fix migration of swap-backed pages, because we will
>> of course run hmm-tests before submitting that fix :-) We can then
>> either fix the test or drop it if we think it's no longer possible to
>> hit.
>
> Oh no no no, please. This is not how to do tests. If you want a TODO
> list somewhere, there are other ways. But tests that require maintenance
> when you change something are an anti-pattern.

Fair enough, I think what you're asking for is a higher level test that
doesn't rely on implementation side-effects. I wrote this test mostly to
discover if we could hit problems with the current implementation hence
why it's a bit messy.

But I think I can fix this up without relying on implementation
side-effects - really I just want to confirm that at least some pages
got swapped to disk which I can do via looking at /proc/self/pagemap.

 - Alistair

> thanks,
