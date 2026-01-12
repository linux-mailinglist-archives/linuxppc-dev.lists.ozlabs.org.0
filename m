Return-Path: <linuxppc-dev+bounces-15525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6FD10342
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 01:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqDNM3LLGz2yZc;
	Mon, 12 Jan 2026 11:51:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.209.9 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768179107;
	cv=pass; b=gBy5qNEqeRyUYx+y0D9drBRm510F5J1w5zX0ZGgLVDeGI8l9Q8ck3r2wxap93XQxjh+s6ujJqvLMJsowoeB6dSPL7tImGA4vnS7wvIjcbysUeDDr9vAzXZigGVxOORG4ms2Ite5Lv+VFD0wODAtiFThhVAHfuex49zdbS5NuOximJQqv25abMwiXWLut6VkVJ1f91X8YOVkxK72u7pG7axzj1NSYSx9kNHAN2Os7f7w1Al8mINZuW1NyDzT7iw6wzOcCY2fYpjjRArUP4VXV48iPuveyvg8x5y927l2tmrXAHBejp36LtwVxHb1ES+lQbXDmGFbG3UC3uMDoslhgIw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768179107; c=relaxed/relaxed;
	bh=cUJ3i1Orm0zwSXlqPhqjLcyhuQ0Gix9HHcONLxkvQGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZs85YhPktE0ccHCibkdG1nfXTq2MGLtiQ5pVyBrJGVwZx+YsWrn6TojCi2Br7gcvWGY8Z3p15j/FWKwFuZZ7zGM1So3Hxzpzk5XiXAqUnkidNeVYJSEVxyC0L+Dmtqjdf8rw4a43qiqDOW+PS7NbZzJ3jJwEAvg7/wWUHacz2Iq6kaKoivg62Z8vugrn7T74vvlVaIbnM2UxcA74bwlFJ1UXb4Za4fzcSL/Zy4oy+12S+OuzPWjzHMrFy1SJ8yH12NUuNarASj2iNxbg3uylTRU+zdYv354YvLyWXu+3QSjD+W9IL7ZQ4B76T+h4R8UjLJGaEgZpN/kgu80a+FixA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dlK6I8B0; dkim-atps=neutral; spf=pass (client-ip=40.107.209.9; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dlK6I8B0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.209.9; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqDNL2f8Tz2yYs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 11:51:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcPFOFCfA4C3jmlGb2lJ1FDdy+j/1cENkR3rZJo5nw8Y/ZvydhmVS/TzMaJ/jfGErLZ7JxEM70UaN8nM9+LSQewk25n4+is6rPlLRtpKrhEuej/31vGrPCj3nPjJYUIkuxUCA2xs+VQ8c5uU5uvpXz2MBB7CtMzgVH/5ZqG1FvSyv4obgqA9R1VktFR6ki96QQfmxjV6yzi723iWNdclZKHE5aJTLiAB38itOzCmKf91uR86k7xj/lz0YJ9682uBLTJYiMoGg/f910DF4C5JfJhbA2w7StId1Nv9mXf4BCBOUYhpMZZ8RLLdGGeC5tPhuoMjiV5CHsWHoD3itcIh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUJ3i1Orm0zwSXlqPhqjLcyhuQ0Gix9HHcONLxkvQGQ=;
 b=au2nu8vjgpIom0nJhBKDhdlN23ayVb0L2kByXOt8orOt5cH/lBnq7OT9k9Yj0OcE231iai3EvvSdlS3NJ8mLoW5Pb34PJ+vN3Jd1lxMhN5lQB+VgdUoWKRcMfIqdO9mLW51WKha2J2G+WnqULRLumT2dpKSG5sBpvDkNussLY6AcKzDP7z8Y95MV+6UX531MWUBZw6HBQ+pe6tuCoBRfSdWYXCrYsI+W7iNacP0FDZoEFSLDBna5H1VtNbrPENU5sy6ncNrLxx+Yr8/mb3Br8P19JtnQ61JtnbPq9CzsJBs/S0HUXYdTC5oE4WNCdBf6yiibofHrO8Vboq7LrZSAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUJ3i1Orm0zwSXlqPhqjLcyhuQ0Gix9HHcONLxkvQGQ=;
 b=dlK6I8B0R66r4+CVKJlrAXWGLTozFlyF57RlTVEata59zgbTvS/w0CeHW303u5NTyIASxO/GYU9i88YxIT09IjjaCJYSXs4IjrImKxbcWIxuBCHgGKGfKimAJo0ltgCPRasmjCRZ8MjvCZ5eGrCtvDMDl/YhhQhzAImorSHOotwRiJs/MjlPTVVog/OoetCVSgJLlpl73I9yjQTabEbu5nnQT8Dvgp4pSqJ0sXf/u8KA3em+lOFCRQx9zw79hL4ToohHSXEDBe9VZ0bq5PP2uhMGGg8oOaRKQi0kwo1bHdmLH6i6hjsT98/NSds1Xu6MfUJ0EsjxoVXbkcWlnktjQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 12 Jan
 2026 00:51:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:51:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Date: Sun, 11 Jan 2026 19:51:01 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
In-Reply-To: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:208:32f::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: f48ea515-1f50-402a-9b7c-08de5174aa18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blRkQ2h1VzdvbDNrcXp6L0ZOZmZUVEI0eHRZaTlNNlFXSHRtMDQ5TGFJcmZY?=
 =?utf-8?B?WW8zVzBjS20yRmgwdjF6dW1qbDlESVQ2MWZrb1NUejNGQnAvYlNvVjA2Njdz?=
 =?utf-8?B?RDIzbStrZVJadFlhS2VBZHVueit6ZXdINWlhakVkU0ZJSlQzSVRhWVZiMUlt?=
 =?utf-8?B?WGxvWFFFVGJsNXFnZG04azRQOVlVcDJZQ05CeG1MM01SYlN3R0RndjJ3MjFt?=
 =?utf-8?B?dDZialN6N083RERqS3hqMk05eE92WjFKZkNBL256czkzRXVoa1d4SlhSV2la?=
 =?utf-8?B?VFcvYTVHS1RRWk00WnZlREdqNTVaOFFUdUNBWjZNMURueWk0RzRJa1V0ZFpO?=
 =?utf-8?B?akp2ZEUyWlZTcDd6WHhkN0l0aTgwQ3hSWXhuYnovNFlRbnJTS0ljVzJ4dkZI?=
 =?utf-8?B?Qm1HSnhCV3g3b01IRDRwaGdtbjRqTlpITWJnaXl3WUxSVG15OWU4ZFZOYWRj?=
 =?utf-8?B?cmpsc3k1VnIxbTdIb0N3MWd5WmZrMitOcUlUTGR3ZXY3b0h2RVhTYWhRdjFn?=
 =?utf-8?B?S3JxZ3oyaEh3ck1qQ0lYZkxMVkorM29ZeXVUZ0dJMk5qSzErUkI5WUVlK2s5?=
 =?utf-8?B?b0daTlNNcVEyTjdQa1Y0VjFHbENBU0lEaUdERDA0cU5GNW5TVGF6V3VuUGpJ?=
 =?utf-8?B?b1phWGdNVm9McWg3SmZSL1piR3ppZkpOb0xEbGZ6bzhFYWQ3anhlQjdNSHRa?=
 =?utf-8?B?S3ZGUW9aWHBYMEo0c1J6Y0ZGZllsUnZCcmIwV2dQSFF5MU9MVlNNTHBhT05K?=
 =?utf-8?B?QmZnTDlMZVRpenpoNy9mcEZRakhNa0liSEJ6RlR5VGFuTzNIdkpvVTVPaGh0?=
 =?utf-8?B?YVNOR2daajRBOHltcG82dmxYMEMrcnh6U3RxNzAvM1h6ZDZFd0JQQnJjVVpv?=
 =?utf-8?B?elNpcU1KdHVVWVphMEttWHFEQ2ROV3FoMngxSFA4K1lvN2xIREFJd2xESFJK?=
 =?utf-8?B?cmRmUUllc0ZZN2ZTbyszVXpaKzBrWG5iMU9aV2p5TEZMNVhtY3JQTVdUMmJz?=
 =?utf-8?B?bVg4dktQekdvYmVsRmE1Vk9SK2NoSVpJNEtoRVgvWVd3OWV3WkdWUXE0eE1a?=
 =?utf-8?B?NnRZWTVVTHNHN0k5c0YzUFBhbVN2ZzBlOTJpTUF5TG81MCtDRFF2WUVFMDNq?=
 =?utf-8?B?QWxzK3NJOFh4MGw5MmxVRUJiSUVaajIwSUpHVEJqeGJTS0c3YUdGNHVscXlw?=
 =?utf-8?B?emU0Y08ybXg3U0laL1pnbGV6T2J3eXBma3ptNDMyYUpFMG5wUnZwK0E4bGRZ?=
 =?utf-8?B?VkhkN1ROajFWYkVoL2FzeG9UWnBGQ2ZFYnU4QXVpRkRpSis0SWlHUnZVNEtG?=
 =?utf-8?B?MmNHMGVMNGpxd1l6YS9nNnBiSGRFS20vb0pDUlM5ODlldjZ2ckRyQTNXbVlJ?=
 =?utf-8?B?cTJFaEIrQ3dFOUVicm4waUplWkVNTmFkVk9sc3kxVEFVQkltdVJicjlhR2k1?=
 =?utf-8?B?K1QyL1ZRZnRnbWlTbkwwUjJ0TXg4TFFGczlWUU5HanUwNXFmdmp3b1dWTnQ1?=
 =?utf-8?B?WGl5UFRRNUpFejdkTThmMXRQN2ZVNUcwaDVuVE55OFBIVlpTR1B1RkFZVi9V?=
 =?utf-8?B?cUd4RHJtU251Rlo2Y1R4bmR6T3kyTVJGK21Cb1FUajN5OFpxZUhGYzZGZlNa?=
 =?utf-8?B?eUJNL3pJSjhITk1Qd1JwRTNFN1l2bVVlTXplN3hHTk5zR0pJaW9QSDAxZGtH?=
 =?utf-8?B?bnhjSzlmRzBraGw2QkM1RmkzOEZOUXVsT0VHcjZNQlVxNkR6ZFovR0xhSGRU?=
 =?utf-8?B?QkloeFJDcUxVRzZtK25RRjA1MXNzNk9OeGY3L2RUYmRCdUc3eTl5eTFORlNF?=
 =?utf-8?B?TGF2Q1lveVJFa3lTdmtqbmhBRlVsd0VOY0pPaTFYWVNKbWFlMFpQdDNtbWtq?=
 =?utf-8?B?Q25Ed3dkVkdGK0pKSFppR3pSVjJHbHh4a2dzUmQ2K2EzWlpueUJnTlpPN1p3?=
 =?utf-8?Q?KgshueTI+0eohwTQ25P3o7aQFK3SIwBB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXc0S1ZBSTAzWkNEVlFYSDE0YkJnTGY1UzRITnlRSWlydFpoKzRvKzVaOWZI?=
 =?utf-8?B?RFVWYVdwNGJBaXhUUWlzQmo2azVGai9KOGZiSFdrTGVpc0Q2NEhoY055Ukx4?=
 =?utf-8?B?cE1INFdRRmcxUUx1VjJidTJGOTRHYy9Yb3kyNFhUQVU3OEhYMWljQzRZbXVW?=
 =?utf-8?B?Tm0reGl4RkJjWFBvNkJ0aGs0cmx3TGZ2TU95Z05ZVEQ5b3RBWlczYmFkcDEr?=
 =?utf-8?B?SW5vRGNnRVJ4OEdwV1BYRTU3RjAwWm1DR0krWGs2NVd3UUFIYnF2RytUSFZm?=
 =?utf-8?B?bU5ObXBHaytjUDBTbWYyMUltd3BYV1hFUlR5bTNaUjd4S1NGOHVUTXBpU1Zv?=
 =?utf-8?B?TVVibExyNE01NWIyS2hGZ1NMVFlmbnVzTkJ5ZXhqa2RWeDZKdGVUTzVISHZG?=
 =?utf-8?B?RjYvYWY5UjI0c1hGUmMrOTM5Q3M1eTdLaDdWR1lOVlAzWjZBeE1vV0x4M3Bw?=
 =?utf-8?B?QWlLUVJ4S1JhalBLWlV0dFlvNk5pWTdkU0pIOEV3L1NDOThMbGcrQXJTay9S?=
 =?utf-8?B?Ukg0dE1TRUJYNDh3RU5Oby9PbjJ3MjFVRE9ET1pHa0c1U0F6NS9odklqcE5j?=
 =?utf-8?B?S1J6a05weUJxSk96bGcybDJrdWFrSUxpajJSM21raERrQzc1MEErclVYY0Vj?=
 =?utf-8?B?WWJUOHZHMFZJd3M2VjFVMUVjWlh0WWpHQytHREEyUG1WVE1XYTdFU25xQVlX?=
 =?utf-8?B?UytuaURaK2dCU0N2QmJLc1haQkRqaGpURzdNWHd3M09CS2NoQmFPeHpiNWNB?=
 =?utf-8?B?Zlh1ZTAxbEI1LzFVSDRjeDcvNEUxZ1I2NmlDSWhBYkdWakhXRWUva0ZPQ3FI?=
 =?utf-8?B?bkZLRzQ2M0ZPMnZ2dVU2UVdHTU9qSE5vNi9obFQyTi9yQVI2WGtpdmlrMTFZ?=
 =?utf-8?B?TUc2R3JVVFQwSFB4djFUOG4xeSs4VGl4dzlOUnRiTkNvWnoyOS9aRWM5ZTBm?=
 =?utf-8?B?bzQvMFRMTnVvVlAwVG9EWE43c2crZ3VYakUrdDRxOGVhTmQzSTIxMENFTHMr?=
 =?utf-8?B?bEdDWG1nZHV3aHlxZ1lpWUpXUUlrRHkrMHZCcmNMTytFRWVOaWhVY1lIWmdq?=
 =?utf-8?B?ZGJpdlVVcjgvVThQVHpkMWQ5RnZIN2JYOVFtYzhPcW01SE1qdnpwZGt2ZWNL?=
 =?utf-8?B?UkxIZGFzOGFMWWREUE8xN0FMeHEyT3JTWVFPSDRmemtZbTh5dGhyQkZtRGdj?=
 =?utf-8?B?eTRUVjhPU0R3RVh1QmRzeWVmRXQxV1VYaittWDZ2azdFUFFzQVFYNHNTTWZq?=
 =?utf-8?B?THRZRmVOTGNBalF1c2dXME1zRHZERGdTa0hlVlpSdjk5VVA3T2VrUnJHRlU2?=
 =?utf-8?B?UkpMdGY3UDhtU2tBTlF4RHl1ekZSWWZkMFlHSWFDQllEVkZLVDN2TFhESHVZ?=
 =?utf-8?B?aXhHUDZ3LzFZVTZlWU9LdndoaGNxL0dtMlVOZXZLMnRwUTVaa000SUFrblB6?=
 =?utf-8?B?ZHZHOVAreDFrS2Z2QnY2d3RmVnpKb3E3a3RsS3FqKzluQjJMakVvaXhTS3ZE?=
 =?utf-8?B?dHNXWFE3M2FGNnBuYUVBaGtkSDhqV2tmQ3ZIZUdia2NmK0RUN0ZEeGVIem5B?=
 =?utf-8?B?VlgvalJvN0tibUUvcGpQa2hIVGFJQ2lPQmhyaVZtdkJNZGQyNlRuWCtBZDRW?=
 =?utf-8?B?MDJIcFRGemFuNWduSklJcG5HNEwzbkNJd0hyVmtLSHBFVWw1bE9tQWw2ai9h?=
 =?utf-8?B?Qm9WOVJBSit3SUo3dXEyNXJxdlF3K3NoM0lybWxhbG1sMGs4RXFBNmFtUm12?=
 =?utf-8?B?NGtnNjJZVHpkejEwSmdSa09qVEJRUFljbHNHWjF6MEgwQ1BTcklFSGQvL1Bv?=
 =?utf-8?B?VTN5YXFiRTgxcnF4VzM0M0xGY29QZG13NDZzTVVFNWpNV0pFcEVLWVpnVnF4?=
 =?utf-8?B?Y05uaGVMYlNaSCtOcnp5bm43aytjaXFzM0ROQ0JWOEhhTEpMa3dwclZySkwy?=
 =?utf-8?B?S2dDYVdCY0gzV2pjU0l1RGZ1VHZGdnUyc0J5UU9LbnpNVWhYSG9nT2tQSXNZ?=
 =?utf-8?B?c2ZFbmRuSnhzdlBDNm5kUTVJZm5wbVdyN1Y0UVN1K3dNKzhuTW9MZGs2ejAy?=
 =?utf-8?B?QnN1Z1lGWnQ4TXpHcC9kYUI5WkRpN2dlWUJyZFk0WGgyMWFINzZjQ2MxTEp5?=
 =?utf-8?B?Unk4Z1lJZFhWV2pNOVM3bjAzRWE5dndZZGUrY1J5Wk1BcHMrOUNYdzVFQXdq?=
 =?utf-8?B?OXZMOFNoanBqc1hUWExaM0xXRDdBR1lqYXBsbC9hV3YwMzdtWnhxVnkxdVVj?=
 =?utf-8?B?a3pZSWc5dEJaRDNYVzN4RWtmMlE2clpoVkJMeDRGMFlzWFRkNWdSc0cwMjhL?=
 =?utf-8?Q?Xbhi/kjC4B6a6mKaNR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48ea515-1f50-402a-9b7c-08de5174aa18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 00:51:04.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1gdRMmkcyLBRRV/gY2daNNfMmYOHAEggMWkATys2ftH11lYog2RnRKl+59tPQUB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11 Jan 2026, at 19:19, Balbir Singh wrote:

> On 1/12/26 08:35, Matthew Wilcox wrote:
>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
>>> The core MM splits the folio before calling folio_free, restoring the
>>> zone pages associated with the folio to an initialized state (e.g.,
>>> non-compound, pgmap valid, etc...). The order argument represents the
>>> folio’s order prior to the split which can be used driver side to know
>>> how many pages are being freed.
>>
>> This really feels like the wrong way to fix this problem.
>>

Hi Matthew,

I think the wording is confusing, since the actual issue is that:

1. zone_device_page_init() calls prep_compound_page() to form a large folio,
2. but free_zone_device_folio() never reverse the course,
3. the undo of prep_compound_page() in free_zone_device_folio() needs to
   be done before driver callback ->folio_free(), since once ->folio_free()
   is called, the folio can be reallocated immediately,
4. after the undo of prep_compound_page(), folio_order() can no longer provide
   the original order information, thus, folio_free() needs that for proper
   device side ref manipulation.

So this is not used for "split" but undo of prep_compound_page(). It might
look like a split to non core MM people, since it changes a large folio
to a bunch of base pages. BTW, core MM has no compound_page_dctor() but
open codes it in free_pages_prepare() by resetting page flags, page->mapping,
and so on. So it might be why the undo prep_compound_page() is missed
by non core MM people.

>
> This stems from a special requirement, freeing is done in two phases
>
> 1. Free the folio -> inform the driver (which implies freeing the backing device memory)
> 2. Return the folio back, split it back to single order folios

Hi Balbir,

Please refrain from using "split" here, since it confuses MM people. A folio
is split when it is still in use, but in this case, the folio has been freed
and needs to be restored to "free page" state.

>
> The current code does not do 2. 1 followed by 2 does not work for
> Francois since the backing memory can get reused before we reach step 2.
> The proposed patch does 2 followed 1, but doing 2 means we've lost the
> folio order and thus the old order is passed in. Although, I wonder if the
> backing folio's zone_device_data can be used to encode any order information
> about the device side allocation.
>
> @Francois, I hope I did not miss anything in the explanation above.
>
>> I think someone from the graphics side really needs to take the lead on
>> understanding what the MM is doing (both currently and in the future).
>> I'm happy to work with you, but it feels like there's a lot of churn right
>> now because there's a lot of people working on this without understanding
>> the MM side of things (and conversely, I don't think (m)any people on the
>> MM side really understand what graphics cards are trying to accomplish).
>>
>
> I suspect you are referring to folio specialization and/or downsizing?
>
>> Who is that going to be?  I'm happy to get on the phone with someone.
>
> Happy to work with you, but I am not the authority on graphics, I can speak
> to zone device folios. I suspect we'd need to speak to more than one person.
>

--
Best Regards,
Yan, Zi

