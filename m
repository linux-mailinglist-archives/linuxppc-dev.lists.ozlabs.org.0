Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284B5EB612
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 02:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc0CK0H6sz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 10:01:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S1/1cCZ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.236.41; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S1/1cCZ/;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc0BY0K9cz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 10:00:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9qEbuu97hP0845r9fJFM5cDhtzraHHw8dhErpTJii5H+irjnzWs5tMYsAZl2q+hLvldwY+d1qr2V80Qhr7BgEw4BlG89k6+qWf7gBiVpHGJ6hfGUxP5HhbzTqWWv9P74GXmAhOeqMj2d7byGrRNrW2znbe/XoBowj6DRHGuMZUx8SJ2a6nPkQqto57MuHlT2XRHk35c8B2jJrBejMwORB06obF2/pXAMsjkHCsdnsY5WeaQLmw+PHEywkrXcLTvonB28mhWqyhXc7h0Z2Yg64M83mLKZKP6ETWczv1s8g7c5FoUVCYa+iNevX2Q6mukmn+cE096hjCMHUIXTKSQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpJ1PU95AZ/sqJVwfGjry3rRbeSqoSyrkxv5sBfHq8M=;
 b=GbbtpwuPJLmfqIh5Jm2atgjMmvA7BgKfa+Kci1GoHHoWz0rg6u7rFSG4zq0HwuQcyw+kupCvD+7f/LUvRtqt4M9KZhTKHnxKvhFGrVYeWxBzdY3qYDRwM722cexemtFzQtzNRPARPtigmTFiBV7SF6doGng4lgVMJQ24ecLeC0EhX6cjR6R6vQG7njvf87GyxMizogflxQf5B5cvFqExYypsdp1J6UlJjWJzAuPeVct3/rAUWZUcazPvxbIF8UNX7F9cFosbNu6KLhWiXHCZUEG7EInYYOWkDSWxktya7w8po3H69K5fSin3qRAt+LSp3WCaWgm/AAmWCObgSoC0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpJ1PU95AZ/sqJVwfGjry3rRbeSqoSyrkxv5sBfHq8M=;
 b=S1/1cCZ/zOXD5h5nbYDBFo8u6XF1RVbD+f7/FuiYyNJG7LRCW6n4RsmQ1W72b3dX9+YEe+NOk4bfZ//1o6Rv/GpHiGrG592lTM4FhY+azDh/RIT3R4BBSV65936EzxarGDMzxA3/csq6RMEqZX4Sv3XqN+C8Hnurq5o+Ml+vw0Bw/SquWgWtkR4dAJ6mONSGB/9JgeoVeu1R7yErkIKLfcyW6wKOhiax04R8xsisx879wGFUEIC0TqtRyBem3vcUasfwGXfqxoMIOmOkn8WKwDkoVK8xaquJXrBrmUs1VT3ltA5FijdsIDOohFurC6DTX7GdIYo6EI25/NTJ2OArJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB4182.namprd12.prod.outlook.com (2603:10b6:610:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 00:00:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 00:00:14 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
 <6ff9dcc5-c34b-963f-f5e7-7038eecae98b@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
Date: Tue, 27 Sep 2022 09:45:35 +1000
In-reply-to: <6ff9dcc5-c34b-963f-f5e7-7038eecae98b@nvidia.com>
Message-ID: <87k05plm9j.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYYP282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH2PR12MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: d710396b-30d7-4da0-116f-08daa01b40f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Rh9jh09XpjxUZw+MSu85pgVXuEsxpyz2CXvdFLGqOCjp5JCt4Thv+ioyQ1eBCgH6rzm9trYQupScJrQGODXBB7bwQJL96E4uAlLm7K1EOT8heqR/7FdpW3pt4ZfsKc7Todu14EUJUVdFjfUOi06bT05lgXm5GZp449ZOdrLtXxNr/olvZmtK3Ohy/Upab9C5biYpfKMxN0DAIKBJQgkMilDQXHPKOfICFJTZxxI/H6Nc5SFSppcRWKWC7OR6xdTeHssbJgVGMp/Z4Ppf22HwynRkAvBGoX2dIor6BLBQu8tZ2bgSpa3BCcgitSaVY+aiavWsE7GIqngepJ8fQ5HavoAt9wnGXdttHFzYA8GfdeOTn6jRaYNAN7Fn1opPAJrdiG9O36GrXfY8sPtmqsobed9XHwym1hmrWTMqvZ25HO8TqaCZkGUU1pI+dtn3aZu5kTJzFXrQ5IVlIzDg9bw/VmiGqv52nn4QDCVAWSmCZDuD8NvHC80iRXB0v5mTRqMSqsBu/li9EXJfSN80Fmaz/s28X1sWofy+2xcEiyKqyWvnJh4O0YYeMb1C7PiOOx35k2FNBSaEEl8LPfM+7ASoEe7vncGPVeJyH/gAABlJ4H6omgbk3ymdiv6T1SL5pnypGWX8mLSuS0oLaBuV1GYkq7jremTn2Ch40vJT4/XHStSY7Wx8HgiFwMH5B1mDTEqQXJp6CUI5vGy2djTipIhMxQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(6666004)(83380400001)(41300700001)(26005)(9686003)(6512007)(186003)(6636002)(86362001)(6862004)(8936002)(2906002)(5660300002)(6506007)(7416002)(38100700002)(54906003)(8676002)(66476007)(316002)(66556008)(478600001)(6486002)(53546011)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ikLGqD/7EEDvQ9bkzYFeeqN8oLOLGuenq3C9dWhPJAUtAM4+LeU9HDvn8xiA?=
 =?us-ascii?Q?ZtOvxIwITQdpjq/UG2Hv2Xki2WDFdmgSaT0ZdIArigUf9Dgxmnrpj9ACqasA?=
 =?us-ascii?Q?NfMXqZbz5rNWrUH6TJo6VtcmpUUxwTlSJ3UcUdj760NZ7vBXPqtdZnRrkffi?=
 =?us-ascii?Q?A3LC6VR6JaFqugIkM+ool8WtsupBhbTsK8BSKyh2VQE/pDJag3+J3YtBBF7b?=
 =?us-ascii?Q?5C80OF4uRxIPFLjOMTgbgIpjqViaol7jC9NnyRUT0CtH4BOcNkZHoHgdnywz?=
 =?us-ascii?Q?XdVSavFpVkIpruEmATfckQtzTgOD5ljzdXTh+MWsJHv0pRAo60WgFNOvlSnh?=
 =?us-ascii?Q?56mBGYq6Zl+gNqjMhSjavZzqE2PXT19zB+naAqp4Aek6HLvPMYMjUH9xvQMW?=
 =?us-ascii?Q?5tWL7I7/a6cKCDuKYjGYEFRXP9oggwDfeleZo6Z6scfgNoUETinx6GfYBxGl?=
 =?us-ascii?Q?5Z2XKANJ2WcyW0tvR+Q4RBJXCEvEaPcIZAUJyZxYLBKM4N4fSFeYHlm3xyON?=
 =?us-ascii?Q?Zhk8lzaRO/SdSzzyJkBcYBh1rZ+mKYsB0iE/2BXMSLC4iUuq+Id7qB9OC6Pd?=
 =?us-ascii?Q?s0HRxbn5cg8sN18yL3bRBnmoF8fxhB8iexS7vOp3/wYAaP0oO3XyFBt1meY7?=
 =?us-ascii?Q?xX7oKqjTMavhbhSO2HQXtsS3tcA1YGPTCAbTp/iX/FHJP8dKKuWl1IPqGW9M?=
 =?us-ascii?Q?aQnUis+U5SnsjtVOzCgBAeNpWtVQEc6ZruSj77LPCtX7u69nYv3qM9E66pe3?=
 =?us-ascii?Q?Eg4T6NlqA/yVOxm+wooUZEpZ0gcy0ureSX/uprA/hcniYNVlamxPPYEAQ8kA?=
 =?us-ascii?Q?/fiuCnLKaIgpdN/YrNEJgujPbkfMawRqdvYUollFISn6ZFOjUs4GYSBEN2r3?=
 =?us-ascii?Q?wbNV3HprSW8Al8FazZ7lFdF/KdkR1oT96syAHoSFe/NnSVUcKpx3Mve3CW62?=
 =?us-ascii?Q?rSOnh5J71gNpEk6Me8+IUPMB/hPj592CoUuuYP9WffpDEZULULs4J19P27ro?=
 =?us-ascii?Q?46JIlVOATiSP7++3KHU36/2G9kNYA1r6UxiVyUrn+aj1WA4wcapk0/W+pxoB?=
 =?us-ascii?Q?4nepUMe4zjefaHN+k2L7lFfsP3ZJaztiADwZabZ89BCIwY0l7fN1KeNLTPVr?=
 =?us-ascii?Q?ygWP/2BKBgCOgM8m2OqZIueUFXB4NPDL1IbilFTiWGdup4zytJtLSwWa9rmt?=
 =?us-ascii?Q?hklHWR42oBt2U+TtbxwjEepSR40OxbAItlwZGeueqC8ZYVWl7CJZrCSZc6TJ?=
 =?us-ascii?Q?mddtXF8f64KaNXC/iCjJNcRe2qesJl7Bssqc2Tst/TAuqsFfzD6VGMgP7Ja1?=
 =?us-ascii?Q?AfZkDMZnWKyXcISKwd7rtTiqGGyqdJTuXSmtl9n5g4gwZdwtwViwaP0Fscar?=
 =?us-ascii?Q?qp311p1amvItGn1m6uhiZ80/xmnnCkUfyPlmB0EbqHl8ENFst+eOugPiKIfx?=
 =?us-ascii?Q?xiWLKV/fazUIIUBrnyQcNz66aD9g/3urZXwFc/DWmQ49CBnrQ2tlKUk9kCXO?=
 =?us-ascii?Q?KxeaBkOtnnjwwurmDpy4D3yad6yiYEc0lWVB3AdonumW0NhLF3dcSIeV3lfx?=
 =?us-ascii?Q?4oAx7mmQ5cC9ema9AEY3pfMmIUMXgUedPmBgvTjp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d710396b-30d7-4da0-116f-08daa01b40f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 00:00:14.2050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzlfprhBapPoQkzJVuDZaeaUhK3msi3tpPICnuY4euJgDmG6cG6QICum59gjGHdWB5DaVRD8psbfpfKZgUi6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4182
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew
 Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


John Hubbard <jhubbard@nvidia.com> writes:

> On 9/26/22 14:35, Lyude Paul wrote:
>>> +	for (i = 0; i < npages; i++) {
>>> +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
>>> +			struct page *dpage;
>>> +
>>> +			/*
>>> +			 * _GFP_NOFAIL because the GPU is going away and there
>>> +			 * is nothing sensible we can do if we can't copy the
>>> +			 * data back.
>>> +			 */
>>
>> You'll have to excuse me for a moment since this area of nouveau isn't one of
>> my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means infinite
>> retry, in the case of a GPU hotplug event I would assume we would rather just
>> stop trying to migrate things to the GPU and just drop the data instead of
>> hanging on infinite retries.
>>

No problem, thanks for taking a look!

> Hi Lyude!
>
> Actually, I really think it's better in this case to keep trying
> (presumably not necessarily infinitely, but only until memory becomes
> available), rather than failing out and corrupting data.
>
> That's because I'm not sure it's completely clear that this memory is
> discardable. And at some point, we're going to make this all work with
> file-backed memory, which will *definitely* not be discardable--I
> realize that we're not there yet, of course.
>
> But here, it's reasonable to commit to just retrying indefinitely,
> really. Memory should eventually show up. And if it doesn't, then
> restarting the machine is better than corrupting data, generally.

The memory is definitely not discardable here if the migration failed
because that implies it is still mapped into some userspace process.

We could avoid restarting the machine by doing something similar to what
happens during memory failure and killing every process that maps the
page(s). But overall I think it's better to retry until memory is
available, because that allows things like reclaim to work and in the
worst case allows the OOM killer to select an appropriate task to kill.
It also won't cause data corruption if/when we have file-backed memory.

> thanks,
