Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5EF5E9930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:05:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXKQ2hv7z3cjQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:04:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fd2Dddpo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.55; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fd2Dddpo;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXJl3gQtz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bre8wUXq5My0xV1jJH6Okk5DVuFclJHskAM4QqIMfyc7+YXt4NHKONldPm6cnvN/xQFxKcyLRcHf3ry9EfFJT5SiTvm5HZEZxSC3806ChLI7/k+FRfw6QMkxyxsARZpvK1YxmYYR1lCKLwgH8zdIIfrElJY3ihjZ+839Q8d9spR9tKi4yHpQcg4cnsANLoMRpWZBrYMCnaf077d8OmN2htdzOXEcrmimRtc7C8QOvOQ9kvTLCqzOKgKyyxZfbahB9OhmeGoj+DIM4YUjg+Ujj6a790/xw+vFArC8QQ2CgHp4lt3ztdcflfZA4gefyRj6PEiz0opynXoQuUkXWD+TIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfmayBrPzfm2vBjXB22ucTPOdvFdJZResjuDJxpiP8g=;
 b=OKFs5+NWq2/jxw78tsZNzbiZrgVbbrbVKOmlSbjj10fV+QKQEp8h0EpOYv1wEUDSnQM9NCjih4JPqdu/NrXwgD6Q4Y08xJ7XnQG7z2PUgOXWCnNWLtnze1Gjm1REd4o3JqI+jZjf6ZVvCfiPPZPVge0Omdbp741ANohwkLqjFCRUnpPm1eIwrD8w0d2/ieof7Vjzgs/dyxDE40Lj6+560l3prGglA1OcKbtZrEVj4Co/EXkQ8Knw5f2PhU6xOpa0o4ZhkXfy5UIHsjpbRPu+VzNXSH1jwE6LajFHDvoy7QrBtpzkgt/VL2yx+LYVDDBcMt9GYrdLKM02nAe2hga8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfmayBrPzfm2vBjXB22ucTPOdvFdJZResjuDJxpiP8g=;
 b=fd2Dddpo1N85HeTWDORuq/73A4a5FMsc3WWXE62IgKWT7teV9TPJwnyTqC1YCYZNyWRcDD2+XqUEvFDHdkIjku57sNfsDQEvxTBYedUGugwc9016/7CL/kow5gUO3lgqiXsOm77whXuxOpfhd+lBpEr1N4CGn3fVwVkFnoVTO6H38VKvqnEU7mk2gdt/irHYX2BITp8kbtsZ5CRPaDCZrVkcSYCzWiMaNBwLvlaGDL5mYVI4Tnnuui7lND0P9MMmFNL0aZyAc2hG7KWOZi/CmHdQyTWhKxBHuXp2Ytwt9JZEPRJ00l/46hvSaNPSzxyOh7FfKP0FWUaXc7y3o3rOtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:02 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:02 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/7] Fix several device private page reference counting issues
Date: Mon, 26 Sep 2022 16:03:04 +1000
Message-Id: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0081.ausprd01.prod.outlook.com
 (2603:10c6:10:3::21) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: a8188633-15e9-447f-bc83-08da9f84e948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wQhPdV8aIOxcEItEidRJGYOmT8fzCVW/4ZZtD7pBxbJ1pa1ydhqTQ8ba3VhIFqPIhORVhPt0jkL5VOHd9T9RowjNIJltmXJFifdd0bdHsSsWaRGgGFIK5ke1kUpo64mdR4DVhd//7Ecrkakv6iD/p1ARzbIuC0L+3sMmMfOC+L1dipCIzzGhisFZ6xiwZtDfMieXiskQG99az0kn/ATCLI/Y3lZEKJQS2i6rVyDE35aRCHhQ0dVcWlI3iNe+c2zKQQ0Z/+WhtDj5dldOlGKmo3dI2DLg7Qi2bXMr5rkTZYKVKM8pNrfVzLitBH09BsrujtbECgbZkkWoputrU7wL5B370TnlNBcfFIyHCrc0uqeOV8B1apOG72AhvFVCp7xdD14u8EhiooQvveoe1f7K0fpNaGqA07jn989Tp1vm+cocXPcwwZLz3siuQMKXilC+fd/UeEqx+d60gTeYB1FPcOA/LzRP0qp7eQayIcsvS2v936wNtB0KkIXZ39AJbfYIM8+Ikv0LOhM8cqRb/boUANxPes3UlpyyM0uctESS549JYVtXkDFmWH1Xouoq2XgPUtiGFDlMB5NZI/kSs76e7Z3myoNJgnDOAslTHltVt2ZTMlgs6WFkqCFrlnmtv6+owgbXFgUDD/txzoRv8DwNc+vN7SMqQTorM6N2X+XmRdgI9/sm5hmP0OqAIaKuzFqYW81sArRYNs6a5meNalZwkbi4x8XAddsgZkIDhdw2vDZu4SJR9OHxoBHhpuVWsAGH
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(7416002)(2906002)(5660300002)(83380400001)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(66899012)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ldHX+lBNsRQv00bMOrK9LeQSmyDnWEnltLSm2tpfQ+du12JZTtzMdeRX3+rY?=
 =?us-ascii?Q?CEPSVV40z5ox3aUfMbVtKyEFwIJdkiLdpvZuYw1HLdBeBbB1ePFIsp2xTUiE?=
 =?us-ascii?Q?SJJKEMDe4KHIOqojBXl1HuueahdrSdzPV5EXSFGwjGuzNzJpE+miOsl7NXHi?=
 =?us-ascii?Q?06DdtJ2gKh1w6/reJDquCeI3OYcQmdxYqMq+EKOdReOVtXTd8Dty22jFurvJ?=
 =?us-ascii?Q?nAiCsW5oXf48bzAgS6gVDG/2SDPD3e7ZVKEQUEdZhPvhD4jhEDTCErTwPHVA?=
 =?us-ascii?Q?rW0jT41z/Rwx2jBKdophPFWyl2KCFxwt044H7iaXD28HFPGiZp4hQu1UttjB?=
 =?us-ascii?Q?hT6g6YKkTHxWL1Ym/OLQRdVFoCcWFjjbgpAnNhEoxVuJf4yU4XZA7fcSlP0b?=
 =?us-ascii?Q?09uPfb2ZROYr9Qx9ZZn8U9SsTGcRUYIWjkRqMlwThqjGuGrEIgstxvNOMJKw?=
 =?us-ascii?Q?MO1nFYawhHR3VBODHZ6+dJObc53Iy0nn9P5FlhqLVMT+RyuUBbrLuaSmKQZV?=
 =?us-ascii?Q?W13zRX43a5eRsyrDrp0j5so73cWXtdNAPnvjZ0a3hhfkG9/kW/wJpq5NkPNd?=
 =?us-ascii?Q?Tx2DNT8WMquCsE3mzIvdcHiOOOUS6Y18+1eSLrT7JnnqzSuV5DA37RBKKxaC?=
 =?us-ascii?Q?pogWPEX7WNqJP+NHIVk1+kETq5Mj8fQP4o+0yLFdgdoQl+tzgFeqh1dl31yN?=
 =?us-ascii?Q?O0i71qYkZLTtL96llz5DE5x7ylxJ/CnQUa+Gc75Dea4Jrqb1+mW995Uatvm6?=
 =?us-ascii?Q?Iq4ox3JV8ivO68l77eDMqmfQpJnJo2cj2HpSprVbihs3No0KjepqkOHwUAc8?=
 =?us-ascii?Q?dxqwgx2zCAOuhUYHeTNVCpNf719AbgUk+pK7lPagIa4rivlCsjiEgDj/t3WA?=
 =?us-ascii?Q?E9/j12Pgjq9Xl4ah5NgeE+/beHjy+czCGUIrMZJwrTX3sY7WeTDgAETdmEXR?=
 =?us-ascii?Q?ndC44aybctmLArRmPIqGymzeEOxeucdJNh6M6JfcGis095GkMx4sYX3FI2No?=
 =?us-ascii?Q?99yVgt0Shc+xth+GHWisxTPkORJZe3erTNrLTUudaT6N27TiJk6IWgmZH1Fh?=
 =?us-ascii?Q?16YLyaLgGVYMnXFi2vEbN2Pptc8vgHlzQeHaBQ5TnIhgJtnkrNQ2w+7j30oP?=
 =?us-ascii?Q?DwONl9jERKsIktOtbOl1v+oCo07CIWyZpHvxnt3d5+YW8tNxa2zeMR7sU1sZ?=
 =?us-ascii?Q?zrfcqC2hj+mC5Y/IIns7cpZ866cxZQml/6EdIJZ/mIDDvxoML2PC6aOw62rE?=
 =?us-ascii?Q?Sa5UA4C6edBNCNPtM2Q8zKAFs8zGTHmUNaoUUT2Sxx7yk9kJWOmNl0al3K9d?=
 =?us-ascii?Q?0lyOd29SNoNBXWL1jfc8Yqw7nUcRgEl4Kag6VlZguNsP5LXmLRLps8MbrDFR?=
 =?us-ascii?Q?kH6tK2e3JkHOAPKcaZUMbWGuqrIOkAGfTT73s/172dJF9F+K9BSL4cdXqH/w?=
 =?us-ascii?Q?y5ZGkl07xwi+iW0r0h5VWOSyOI7x6QUyNlh8z/9L6NsZ/hBaDMYdr6zSITcA?=
 =?us-ascii?Q?cCAOC3LUGA2pZmCHf9P9G62MN7NesbzyIJG1Z/Kpb2QjnPQiaPBjsyj01+DT?=
 =?us-ascii?Q?O/qIRq3IFs1GbbrF24sVju1V3f+mrdRUyT0PKFFJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8188633-15e9-447f-bc83-08da9f84e948
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:02.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlMuqxxESz5Ri4xo8ffb3tWmdbNbE/xMGtpq0/4LDMq5bPk+MJM9zpQOXsYI0fu7ZnvVkuwL/qmJ14kzPxEKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series aims to fix a number of page reference counting issues in drivers
dealing with device private ZONE_DEVICE pages. These result in use-after-free
type bugs, either from accessing a struct page which no longer exists because it
has been removed or accessing fields within the struct page which are no longer
valid because the page has been freed.

During normal usage it is unlikely these will cause any problems. However
without these fixes it is possible to crash the kernel from userspace. These
crashes can be triggered either by unloading the kernel module or unbinding the
device from the driver prior to a userspace task exiting. In modules such as
Nouveau it is also possible to trigger some of these issues by explicitly
closing the device file-descriptor prior to the task exiting and then accessing
device private memory.

This involves changes to both PowerPC and AMD GPU code. Unfortunately I lack the
hardware to test on either of these so would appreciate it if someone with
access could test those.

Alistair Popple (7):
  mm/memory.c: Fix race when faulting a device private page
  mm: Free device private pages have zero refcount
  mm/migrate_device.c: Refactor migrate_vma and migrate_deivce_coherent_page()
  mm/migrate_device.c: Add migrate_device_range()
  nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
  nouveau/dmem: Evict device private memory during release
  hmm-tests: Add test for migrate_device_range()

 arch/powerpc/kvm/book3s_hv_uvmem.c       |  16 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 108 +++++++----
 include/linux/migrate.h                  |  15 ++-
 lib/test_hmm.c                           | 127 ++++++++++---
 lib/test_hmm_uapi.h                      |   1 +-
 mm/memory.c                              |  16 +-
 mm/memremap.c                            |   5 +-
 mm/migrate.c                             |  34 +--
 mm/migrate_device.c                      | 239 +++++++++++++++++-------
 mm/page_alloc.c                          |   6 +-
 tools/testing/selftests/vm/hmm-tests.c   |  49 +++++-
 14 files changed, 487 insertions(+), 160 deletions(-)

base-commit: 088b8aa537c2c767765f1c19b555f21ffe555786
-- 
git-series 0.9.1
