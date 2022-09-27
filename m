Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16D5EB73A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 03:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc2hD65fKz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 11:53:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LVjtIQtA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.243.44; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LVjtIQtA;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc2gT3xxZz3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 11:52:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB4zD8bZ+9Kdno9B0MaYZXmq8x+1hCuq/lo0wYvOHnwgTDFfvrOwb6DpO0RAQ4Wlywu4xPJwX0b5upnRhwQTJaChy90k9U8VwussptC+wqtlWd1yePWftemU4q5vSiO/oq4YGlvIBVNlx8FeDFnRC42pUNRxDSs5A/V/ZDKLEIjGOFXadrftxgpT0RUgdDvJlzwgIRRNHqclbiyjzaUVGkmJRxAMeI3xTM0e/zzllJflsSlsxwPzhqIjESe7oM81axNZYLUVNouMb2JULmR2HqvpLPzdy8GlkEbJ8WQB/kkXpk9EgFARTmFs3fg0ddcfBR0+2xGxR7DKup6OrLXL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/E4dQx6G1ofnK3ejPAEat8fUgvWAnZY4HtRoSKYH6Q=;
 b=XNKiYJhi+34V0Mo88q2drDXveyxfJmCsQ96ZQPK6em6izpBvEHX1lmXzbVQrrSO17yPgMQU5eZmUy/Kh3NBS4LucDWUq7SoPrGCCpxjuSOtzV84smldzgGv3h7E7QaNj3TuTDhj63PDG5IthQIo5KT4qdDPiu+U1leH3O3CKVdVpBBJflR3VjcufS5yQBTy5AUPn+WH3cgnQNtlD5N3iKUunlCjkyj8nj1hOsB3Q/aBZ1zoStQPKaaeZZA4lfjeF5SPCwVSLNgea9L0uvl26m3eLw87Vc96Sy5sdq2qxdHeynS/OX8mjLa3hTXwUnHT8ztjRxHC1rw91RtHaCwzcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/E4dQx6G1ofnK3ejPAEat8fUgvWAnZY4HtRoSKYH6Q=;
 b=LVjtIQtAlI3GXepLLoeW4mMDwKcPOR/1C5UhSctYumxtck2bmxU22LvXLXiwg0vQFxHWbHZKdB10Y6TybwHppnjj4lyfj8+J0vOBTgSepXd+52KHjt/vgb+ntjL1PCn2tV5gBkGae+4Q32X+2bEpiFqOxEQVxOBLL8WWAB3McGnk6uNXm7YUdWTyYvDrBrbshw6GdZVfG5J6NEB2aBttD1aRk8TrKI4lIdatCsg3D7njBYwFxZAHJhaxA/ZH05z02q1vBXfTKg48o2NgiVl4ut6yuWsO1tbbKsQjc5HTZpRpE4dD8j4pNAy+l5ICFS1y1/YX0V1BmFuuXZr4UI9Teg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5770.namprd12.prod.outlook.com (2603:10b6:8:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 01:51:59 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 01:51:59 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
 <881735bda9b1ba0ecf3648af201840233508f206.camel@redhat.com>
 <7ca6ec0c-7e5e-3b24-8f8d-650df357130c@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 6/7] nouveau/dmem: Evict device private memory during
 release
Date: Tue, 27 Sep 2022 11:39:57 +1000
In-reply-to: <7ca6ec0c-7e5e-3b24-8f8d-650df357130c@amd.com>
Message-ID: <87bkr1lh3a.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SY6PR01CA0010.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::15) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7606eb1e-b1a9-440f-a44c-08daa02add84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qnDweu8Ko5XIHx9viJGSpFwtl3pWkdRzfeV/IV0ul1q02pgZL4wM8zopUju/cmgo6MUrvvfaA+HC9COlAnBlW5sCjVWCpVqRvUrpYuTpmQLngjB1th//pVs1v7IbuwC0E+R5d2+F4WDWasZdgtVu5YbnfM4Ye02AKyOQG/PA5hgYFV+oh5hpTfuax03xTPIgqkYVn1Mbie2jV+UG6ZiwSbR1rMxvGv9n0eugWfSmwcMmqiKyGWuy0jDsu6n+pyY8beAzzPIl/a6inK42gqvoFLLE2DG4MViKW5HJD9bw5imGj6qkIS7Ln1r1nWmrOtYJY6r2rOyu8W71XCeF5qFM9T4xfU5ZWnHUdwFEDILuOKjQ9cj4LiUsKc4t9w9vq+a4TaWADRlTTxFXcYoTB9S8lqa9udKQEsOBPRmYPk1h7W6K6ZFPmBEqCu9U1NIFuNeun3zACJu11KJ6bIjRh9Y5oSvgEMTJ0Dhf4DZhSntjwjl4MtKiDkT46qMGww0VLg0IjdTBNeruqjdxHjW3iITczmGaX++UnKdVfKlW1Ligat6NnTnMtq2ghU/AEtZxrhqlRduQM95y6QCgCFjt9hG1IAZ/2JH5eeOTcy3ByvwhdKKU9Yi8RLYru0KUAvx552QS3v4nrqNWarTYzmHaHd6YILbb50iQzhSQc4e+t9uXi6m7rHJNYQkct/FzwI1z38ktK4fZUYVeeVgDJ+U5WtaDWA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(38100700002)(86362001)(966005)(2906002)(7416002)(186003)(5660300002)(9686003)(478600001)(41300700001)(6486002)(6506007)(53546011)(26005)(6512007)(83380400001)(54906003)(6916009)(316002)(8676002)(4326008)(8936002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dGszaUVuSmdwZzRhTTFZRDl2cUhKU0p6Y2lrS3hTalVlWHQ4clRQNEFmcXRy?=
 =?utf-8?B?NHRsQTlLUENFNlhDRFBaWFFtNSsyNDkyWktxK0p3UHF6TGJKWHRIQzJ5RjBq?=
 =?utf-8?B?eTNLOGNoQ1BaWTRWdURvT0VST1RYVWt6VXh6bSt1VWhYcWErdDhNRkdiRnJz?=
 =?utf-8?B?U3dzMjZMTDFLY3hjQmtvUkJ2K2tXZWNkQk5MVUpVRU5YUlNrUFpBZHZjY01E?=
 =?utf-8?B?RCtLVmtpS1RVU0RWZDhGSUdjWGJaUEczRUpJeFk0Zm5WckVUT2s0cEREY0hO?=
 =?utf-8?B?NmZ0bjZxanBTTUN5cERVSmVsV2lzWnpjOTFuZG9QZEpGeTNTZkRNL0x5NUFk?=
 =?utf-8?B?RndjaG5tR3ZKeHRpZTAwdW8ycU5JVjh4bXZOTUdRK2lSdisxN3Zua0krRVF6?=
 =?utf-8?B?eDVBNTdWSFl4QVNDU1hNS2hCL21PYjhPdlJWSisvZFdZYW43cXk4Y211R0ov?=
 =?utf-8?B?eVlQQUlOOC9nSEk2Rkp2dTFCYmJUMUREQ1JWc1dnbEorejk2ZXJSUm93Tlhn?=
 =?utf-8?B?d0xwZHY2cm84bmZYOVc5ZTNGSkJzRzU2WUxXYmpOdnBsZHJiWlhRK1NiSlA0?=
 =?utf-8?B?TFE5dDY4RGpWeUkzNXJCUnRZdURtZ0FyeHIyYTNMQWhXeUJXbHRIZXVUM0pT?=
 =?utf-8?B?RUxSNGJZNi9nUzNkMDh0elozV0JxcFpWVktKall2RUtabzNxNWI1c2VyU09M?=
 =?utf-8?B?d2NGeEJyc0drcWZJeTAyWmVhbTZxVWFjMjVXbENNTnUxK2Q0dzZjckswaWkz?=
 =?utf-8?B?THBlU0tCOUVSbGp2NitrVHlKOHd2bXFCbjFvZ0NVVEd5VmpETDRWY0s5Q3NM?=
 =?utf-8?B?aXEwMmQ3ZEtNOXpRTUMyRlpCYXpBcWhHN0VuS3g3QnRWdmUyaWhLblU5cHdS?=
 =?utf-8?B?VzNKOGpjWUtMMjR1bWIrNTU3SWtkeWtNUUVEdXBnU3lYQS9qWjNiTzZrMXZx?=
 =?utf-8?B?K0tVMTdUOGRRZGJwczl4c3BIV2h2UjM5b01CbU5xRTI2OFI4MGtnWjlMNGxx?=
 =?utf-8?B?OThRcXBYdng4MTJhblBYeWhNSjF6TmJBWW5jQm1vSVpUOEVLekRKN0tpTHdX?=
 =?utf-8?B?Qm1Uc05CV29lUFJrVU5qRzNmVFd2cEFJMFV2Vk1GZUNOQUF2MytJM3dDUk1v?=
 =?utf-8?B?Zk5QYzBoYVpoTFhSM1NjS3VTb0MzYWF1WThCaGNRNEdJMUQ0THF6SUpNT0lT?=
 =?utf-8?B?VkwxWkdKSmUvMU9LUTJJWTN5dFg3VDZFSXNyVTZoRXBHSS9HdlpLQjNYOGtO?=
 =?utf-8?B?bXlZTmN0d1B3Y1VXQURPTVV2ZE9zUXBmZVhUUHJiZmtneWFxM1huZ0lqM0xj?=
 =?utf-8?B?cnRnZW9EazlzU05QVVVocFVTVDdnemtQVXZURlJBbytveEwxSmJ6ZW94cC9N?=
 =?utf-8?B?ZzliSGVUNE8zcXhFYllBUUpwTUJUbElBQ2RWdDhhcWNwQUhvQ0FXYS9EaDcz?=
 =?utf-8?B?dmRYckRQUkNkaENuYzhBWWxDaThxSGV3cFhJZUpHbk5IMDdBTG4rSEp4MFd3?=
 =?utf-8?B?Wlc5S0E5ZUR3bjNFVUNGcDJMWUgxcHZNalh6RTV0YzEyVmlkdXBCSzBRdDRF?=
 =?utf-8?B?QzB5RktvQmZCamsrTC9ZSGdEUVd6MG43a0JVTjY4TXM3bXVIRGZRY2Qrb1A2?=
 =?utf-8?B?NjBtUklqa012ZzFXMWRXNTlla0pZcVAvVXVxUjBVRHNQeHZxbFZsVm12Rkxz?=
 =?utf-8?B?bUVPMTZ4cFpzTU1ZQkltNDJBS2hnakV1N29Ma2tpUE5PRTFpU3BlTUY1MzNK?=
 =?utf-8?B?b1NNWmZPUG1veGJoZEtxQU9sK1RrbnRhTU5lWWZFVnlrQXgwQXBTVEx1amF3?=
 =?utf-8?B?U3hEazdaS0Z1L0J4U2IrRUxSeFBoS0h1SVZScUpiRm1qM3RDWHJodVJpRTdQ?=
 =?utf-8?B?YTJ5RzA3dnpuWDQ2WWxYckxHK20rbzA4UEc3dVNrTzduT1FoQUcyd0RvNjhy?=
 =?utf-8?B?YTNmMWNxT3p6ZjJ4eWU1Y2gwNUM0ODlkcnBsOXgwWG1IS2ZKZHExeUorYkR6?=
 =?utf-8?B?R2NFSlRaQ1k5SE5VSDJLS0NtU0JqK2VEbEdHWEtOcnpOSkRTMWp2dm9tbXZ2?=
 =?utf-8?B?ZllmT3BUMzJOYm15UnVDeGVsWGRReWhxVVlmTS82c0t0MmFzc1V2L2UxRjNG?=
 =?utf-8?Q?q9Txd7frg3mLY0NSj/rcwqeVZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7606eb1e-b1a9-440f-a44c-08daa02add84
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 01:51:59.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qSC/x+rOJGIGPPSI+4/vc2oahHYORWstd+eLrY1HPgV5J6JMfJUyHdBe40sCo8R03hn4nxGpJZrFy6/5NNVPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5770
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Felix Kuehling <felix.kuehling@amd.com> writes:

> On 2022-09-26 17:35, Lyude Paul wrote:
>> On Mon, 2022-09-26 at 16:03 +1000, Alistair Popple wrote:
>>> When the module is unloaded or a GPU is unbound from the module it is
>>> possible for device private pages to be left mapped in currently runnin=
g
>>> processes. This leads to a kernel crash when the pages are either freed
>>> or accessed from the CPU because the GPU and associated data structures
>>> and callbacks have all been freed.
>>>
>>> Fix this by migrating any mappings back to normal CPU memory prior to
>>> freeing the GPU memory chunks and associated device private pages.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>
>>> ---
>>>
>>> I assume the AMD driver might have a similar issue. However I can't see
>>> where device private (or coherent) pages actually get unmapped/freed
>>> during teardown as I couldn't find any relevant calls to
>>> devm_memunmap(), memunmap(), devm_release_mem_region() or
>>> release_mem_region(). So it appears that ZONE_DEVICE pages are not bein=
g
>>> properly freed during module unload, unless I'm missing something?
>> I've got no idea, will poke Ben to see if they know the answer to this
>
> I guess we're relying on devm to release the region. Isn't the whole poin=
t of
> using devm_request_free_mem_region that we don't have to remember to expl=
icitly
> release it when the device gets destroyed? I believe we had an explicit f=
ree
> call at some point by mistake, and that caused a double-free during modul=
e
> unload. See this commit for reference:

Argh, thanks for that pointer. I was not so familiar with
devm_request_free_mem_region()/devm_memremap_pages() as currently
Nouveau explicitly manages that itself.

> commit 22f4f4faf337d5fb2d2750aff13215726814273e
> Author: Philip Yang <Philip.Yang@amd.com>
> Date:   Mon Sep 20 17:25:52 2021 -0400
>
>     drm/amdkfd: fix svm_migrate_fini warning
>          Device manager releases device-specific resources when a driver
>     disconnects from a device, devm_memunmap_pages and
>     devm_release_mem_region calls in svm_migrate_fini are redundant.
>          It causes below warning trace after patch "drm/amdgpu: Split
>     amdgpu_device_fini into early and late", so remove function
>     svm_migrate_fini.
>          BUG: https://gitlab.freedesktop.org/drm/amd/-/issues/1718
>          WARNING: CPU: 1 PID: 3646 at drivers/base/devres.c:795
>     devm_release_action+0x51/0x60
>     Call Trace:
>         ? memunmap_pages+0x360/0x360
>         svm_migrate_fini+0x2d/0x60 [amdgpu]
>         kgd2kfd_device_exit+0x23/0xa0 [amdgpu]
>         amdgpu_amdkfd_device_fini_sw+0x1d/0x30 [amdgpu]
>         amdgpu_device_fini_sw+0x45/0x290 [amdgpu]
>         amdgpu_driver_release_kms+0x12/0x30 [amdgpu]
>         drm_dev_release+0x20/0x40 [drm]
>         release_nodes+0x196/0x1e0
>         device_release_driver_internal+0x104/0x1d0
>         driver_detach+0x47/0x90
>         bus_remove_driver+0x7a/0xd0
>         pci_unregister_driver+0x3d/0x90
>         amdgpu_exit+0x11/0x20 [amdgpu]
>          Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Furthermore, I guess we are assuming that nobody is using the GPU when th=
e
> module is unloaded. As long as any processes have /dev/kfd open, you won'=
t be
> able to unload the module (except by force-unload). I suppose with ZONE_D=
EVICE
> memory, we can have references to device memory pages even when user mode=
 has
> closed /dev/kfd. We do have a cleanup handler that runs in an MMU-free-no=
tifier.
> In theory that should run after all the pages in the mm_struct have been =
freed.
> It releases all sorts of other device resources and needs the driver to s=
till be
> there. I'm not sure if there is anything preventing a module unload befor=
e the
> free-notifier runs. I'll look into that.

Right - module unload (or device unbind) is one of the other ways we can
hit this issue in Nouveau at least. You can end up with ZONE_DEVICE
pages mapped in a running process after the module has unloaded.
Although now you mention it that seems a bit wrong - the pgmap refcount
should provide some protection against that. Will have to look into
that too.

> Regards,
> =C2=A0 Felix
>
>
>>
>>> ---
>>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++=
++-
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/n=
ouveau/nouveau_dmem.c
>>> index 66ebbd4..3b247b8 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>> @@ -369,6 +369,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
>>>   	mutex_unlock(&drm->dmem->mutex);
>>>   }
>>>   +/*
>>> + * Evict all pages mapping a chunk.
>>> + */
>>> +void
>>> +nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>>> +{
>>> +	unsigned long i, npages =3D range_len(&chunk->pagemap.range) >> PAGE_=
SHIFT;
>>> +	unsigned long *src_pfns, *dst_pfns;
>>> +	dma_addr_t *dma_addrs;
>>> +	struct nouveau_fence *fence;
>>> +
>>> +	src_pfns =3D kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
>>> +	dst_pfns =3D kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
>>> +	dma_addrs =3D kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
>>> +
>>> +	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHI=
FT,
>>> +			npages);
>>> +
>>> +	for (i =3D 0; i < npages; i++) {
>>> +		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
>>> +			struct page *dpage;
>>> +
>>> +			/*
>>> +			 * _GFP_NOFAIL because the GPU is going away and there
>>> +			 * is nothing sensible we can do if we can't copy the
>>> +			 * data back.
>>> +			 */
>> You'll have to excuse me for a moment since this area of nouveau isn't o=
ne of
>> my strongpoints, but are we sure about this? IIRC __GFP_NOFAIL means inf=
inite
>> retry, in the case of a GPU hotplug event I would assume we would rather=
 just
>> stop trying to migrate things to the GPU and just drop the data instead =
of
>> hanging on infinite retries.
>>
>>> +			dpage =3D alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
>>> +			dst_pfns[i] =3D migrate_pfn(page_to_pfn(dpage));
>>> +			nouveau_dmem_copy_one(chunk->drm,
>>> +					migrate_pfn_to_page(src_pfns[i]), dpage,
>>> +					&dma_addrs[i]);
>>> +		}
>>> +	}
>>> +
>>> +	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
>>> +	migrate_device_pages(src_pfns, dst_pfns, npages);
>>> +	nouveau_dmem_fence_done(&fence);
>>> +	migrate_device_finalize(src_pfns, dst_pfns, npages);
>>> +	kfree(src_pfns);
>>> +	kfree(dst_pfns);
>>> +	for (i =3D 0; i < npages; i++)
>>> +		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BI=
DIRECTIONAL);
>>> +	kfree(dma_addrs);
>>> +}
>>> +
>>>   void
>>>   nouveau_dmem_fini(struct nouveau_drm *drm)
>>>   {
>>> @@ -380,8 +426,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
>>>   	mutex_lock(&drm->dmem->mutex);
>>>     	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
>>> +		nouveau_dmem_evict_chunk(chunk);
>>>   		nouveau_bo_unpin(chunk->bo);
>>>   		nouveau_bo_ref(NULL, &chunk->bo);
>>> +		WARN_ON(chunk->callocated);
>>>   		list_del(&chunk->list);
>>>   		memunmap_pages(&chunk->pagemap);
>>>   		release_mem_region(chunk->pagemap.range.start,
