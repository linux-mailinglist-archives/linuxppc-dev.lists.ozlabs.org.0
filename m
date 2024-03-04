Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD76870246
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 14:10:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m2vJX1SY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJvn3VV1z3vwH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 00:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m2vJX1SY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2405::601; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJv34nfCz3vtF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 00:09:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=couN9LnNMXDWBEo0KrBFluMcoxvAoS7U8z1P32RBWOaJnFlco/hfEOALmG9vrCI/vjPyk4NfKPK5+2KU56VucjSw2SZi1AG0ZPSTPBX72XEI6Y4zMQR2KNMyj+wNhNx8tY+pEadQrm84x9G3G3b5JxKwplMQKjdzGWpIq7cfzBSbvFAiTEL2asM2PfOT5LzgWabfrOcykptwswh/KWAxQr1lkMYui6B/kCdNdcgizYksP/RgprUIrjs1l9AsSS6X9FgR/upUUfFT5dB2mFEmiL4uNjeUEms+LG4LDPF8ZL5u+iRh4rheCWXE9NmtDleojKBHCM78/7I4kHu5EeQKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBFkcpAQr1IxvB7NZh85JyiRF+WsniORMHIIpbJyrvs=;
 b=mx7HYUKMp7a5DC1sH0TddvH6EUjSeozRpQRkzOWc6PmWvx9s9W+MzM6UyEESIocB4uWUblDwSkApOvFw1+t4mUtn3N8fE0elBmdb9Gk6+BBlSxPEuCS2Meq5HFAx8PxiAC4c+RSdqItwc571AtRVhySCXHvniURt4z1+999xAL2/naSBH8VrhPV5dCjrsfmsIEKr50BCAimwjueCwjajS5Az5b8q2PwBThODTqvReiBEiaMlmcVzHlza0FLrUareDFl3rBHt9R6WNSPOaLrsQY4fTqPy332XtU/QQtegZbOullNXfqC4ZbN5dZm9c8LWo7iBZai3Qe4cTfCvMzjvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBFkcpAQr1IxvB7NZh85JyiRF+WsniORMHIIpbJyrvs=;
 b=m2vJX1SYKuXUq52JyJaJw8egIyJkxrGU93VCtsn8ldoCuSTxe8Hwwh0Gl8zDqFPZy3KzWrC0r2nw9w6L2JlQ+/Qorqj7Xqy71qs5FJHNsm2raaESl8q8V6OW/H3q30DjrOtMxkZMlxIOExOZilvKiG5l+kXgOq0gXZ3pi+JI29Lf3LuMeECfHJKKoXlXKXdL+vAgkGmR/bNVp2ijUf0ibiH4cHzPdhnHRXNvIUHxQo/g75sx0fqWxNlBcBmrDFFSvEQWdMzrxBX2jGHEim1rYcSCQY/TiV81HkeGb4DzL4Vk+Povo+OqQ/zufZiiu+DjRcwyP8Xybc/xt7hZqfxpXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 13:09:25 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 13:09:25 +0000
Date: Mon, 4 Mar 2024 09:09:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 5/7] mm/treewide: Replace pmd_large() with pmd_leaf()
Message-ID: <20240304130923.GS9179@nvidia.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-6-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229084258.599774-6-peterx@redhat.com>
X-ClientProxiedBy: SA1P222CA0151.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::21) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd8965f-9b39-4479-ca41-08dc3c4c50e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r5+G+vRjjMuAp3vKHNXPnYOWs7WTK0dFjE0TFbzvmvfeWQe5fhOOTl8SOuSvqt9sHvtc3J6XRFziI2lB41ehnPcBOwgN9CTEa/suCJ4tzu8p9IUJUwSv3o3wNH1Q1YzYNsqJ0Ls2ibWpUMJZ4nYGb7uP+kqSjnNHrC4Hg4Vij0zqMjjyUcNAwEdHl6s+HfaCiDMf8WEwaM3dfKbRyIQjHux8cZge4gzNlOJJg/0YXnTVjSx63Xn4k0R22P5gVOfAp4zgsvDZv6u7ZMELLKI07WMjC0YUSiOSXPdvmihoBp+qrWHHphKVLxzHGryZEIn5G2+5eVdF9awk/MIEh5fKu/0+ckwv72jZYvtdmVAEuj9kJu9G97xtWyDrPztd62tO21OJZpVnlBYLJizcwuGi1giiHUUKKBquN2qxiM+SHcGyrnDdh9qCuASZABslixy82gHVtJoP/YqrDA1MDvyKbUyA5If0w+gMZCJXoQ8VZ0FCFrRiWTdFjTexi47gxybFpr9zyb9Z5qLlz9ysh+v1FasmXOg96AhI8hP5BXTwa35bNOAKbPwsLWUDTip4FvBisgPY08OkE4nd8Pwu/rtUV75zdM1PlAhlCxmXSZ3HTsAGKorXY+jKLSgC81gVvQB4H7E9dYJBUnt2Q/mWVmiGSCwhgvFIQzwauPSXhnLj//o=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ILZgjobZwDvnARzrM0XPDD1anmW2I3MI9eICN9W5KKg1B+L0SX6qlN02wPbb?=
 =?us-ascii?Q?auN0p/D9CP/AoqiWM2O5tNtFIxuUo3iGfKW5IDLEYDNox1o+/np9A5yIlQ08?=
 =?us-ascii?Q?4sngz7ytgIwfyYj+VdvUlYZGzjxYeKZeIfXdo0/jZV+33nHi/ybYCt9Bs8Qj?=
 =?us-ascii?Q?MenCsNnPNQDqBVmuJ42NbhXg/Pw2rxlYdQJtNlox2urGZqAeI/NttBkwANDQ?=
 =?us-ascii?Q?T5PqPeJYSU6XSi0JyYrp840PlJYIocbeWrqaoddMiHbl0Q80N1/NxlhxuT2H?=
 =?us-ascii?Q?p933VWANE2dbj7XjwdJo1ap9PKEowk960nF3Nm2/0q9uWdhFSVrWo9PCiprn?=
 =?us-ascii?Q?66qFrXZW/SdK26yI7hHj9wspw4M/2CAbzUuAV/GiUhBAg9Tc942Jo+BK0h4V?=
 =?us-ascii?Q?TMSgAM8ITvrQVlnuD+XI9sXiygiuZPvoxTzuO5c0bJQkSE/unxYnpmXqiMkr?=
 =?us-ascii?Q?nsU/jv22fek/Y7uCZyCuL7EXZAUM1O63/poxiB51GCSNycWfM7+DN9VgmvY4?=
 =?us-ascii?Q?/cmzWOa9TGryYwV0OKOGUV0zKaLJTKX0N04ZTPG7ipCmHCHd5Pyr/Jqpx3BM?=
 =?us-ascii?Q?8124vTeTP+UM03xjWRASYoF3JqPFJlAJdtkP+9tNhmKUJEBBJm8TOtzHeqLK?=
 =?us-ascii?Q?fBoUAljAUUyOfpDIQpUhRjf24WtUgPrMwr/KvAuoxMp7HNTVJmpV0SacCHpT?=
 =?us-ascii?Q?X93Ycpq8/07Ci+p2YdzwKtxRQOjXDC/zUVTqiWoJXEpOjuWE7nGi9PbRY4VQ?=
 =?us-ascii?Q?uOMNNrzOPMnIE3vdK457bUnfCeFU17iQTvbLgFRrNtuG66Oo4zytA/HyhDmD?=
 =?us-ascii?Q?cpcl3w8VHdse0qmEmOnMUfQDagN8wRIHiVPC9v8bYjaGOfQF+vBFOzhU5/bX?=
 =?us-ascii?Q?QXm7VuJFgQkM8FQupharB3mTeFOVjwuh0F3gUbkUWbXcpkrPmV3dmQt6L7tD?=
 =?us-ascii?Q?sDlTp1RN2IFFv8Ukmur5daUjSVCwllae+7u5yUEl8XYLCRdfQTGoeqDIoe8h?=
 =?us-ascii?Q?NivQn4OibPgvIQ7JHb5nWQwke8W68/9M9V9GMN/gM4UbGcFPoyueuISSZR53?=
 =?us-ascii?Q?RYdy9QaG1qFlCrEj5ba3ZnNsUwo4Y96TAcPcgkYHUpH69fIYc2gdF+OJNxqO?=
 =?us-ascii?Q?wK1P8q+5hytSZjI8V33eS2PP20+FkuqZqyTUeQw0us9TSqdagYvNl5ep+pjH?=
 =?us-ascii?Q?JLDGYTmro3Yo+N22ekISKDsq54ktGypQaKDRis72Dk9jOmJA2ohZhBFRY/09?=
 =?us-ascii?Q?DUekcD213UKk8CPHHH5P9FRMcpAUNUBm9nAHnFuVV5orZWodYVwQhTL7/hkB?=
 =?us-ascii?Q?Fxahau7uuS6ov9I538xOBSRcGP6XQzJD8GGDZzQaL8d5pluN7lqjhz9WJUZb?=
 =?us-ascii?Q?4G1QIrCeGouNkj7AyZ6aKtb91TI4FHm7DWebudGD6m8rTNWezlAeH5nLbDAb?=
 =?us-ascii?Q?SfpUfzjSlNATE1uItfKtTFyvpGskRaAb+TZMRcQl0th0TXy3tUBOnJMJncsb?=
 =?us-ascii?Q?dcYcipHWPSpteZGxvlzuAs/QwCtqbFkNZc6Fez5YbQv6VLfPAQ+p1lkhgSJl?=
 =?us-ascii?Q?pGJJFU1rHGIqhhd3SDY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd8965f-9b39-4479-ca41-08dc3c4c50e9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 13:09:25.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mnAR5iBv7nQO6HluAIIL+a2h+6I0xiDfkT6LMhHCDn0QS2FutVlqmbenWCkxkMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 04:42:56PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pmd_large() is always defined as pmd_leaf().  Merge their usages.  Chose
> pmd_leaf() because pmd_leaf() is a global API, while pmd_large() is not.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/arm/mm/dump.c                       |  4 ++--
>  arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  2 +-
>  arch/powerpc/mm/pgtable_64.c             |  2 +-
>  arch/s390/boot/vmem.c                    |  2 +-
>  arch/s390/include/asm/pgtable.h          |  8 ++++----
>  arch/s390/mm/gmap.c                      | 12 ++++++------
>  arch/s390/mm/hugetlbpage.c               |  2 +-
>  arch/s390/mm/pageattr.c                  |  2 +-
>  arch/s390/mm/pgtable.c                   |  6 +++---
>  arch/s390/mm/vmem.c                      |  6 +++---
>  arch/sparc/mm/init_64.c                  |  4 ++--
>  arch/x86/boot/compressed/ident_map_64.c  |  2 +-
>  arch/x86/kvm/mmu/mmu.c                   |  2 +-
>  arch/x86/mm/fault.c                      |  8 ++++----
>  arch/x86/mm/init_32.c                    |  2 +-
>  arch/x86/mm/init_64.c                    |  8 ++++----
>  arch/x86/mm/kasan_init_64.c              |  2 +-
>  arch/x86/mm/mem_encrypt_identity.c       |  4 ++--
>  arch/x86/mm/pat/set_memory.c             |  4 ++--
>  arch/x86/mm/pgtable.c                    |  2 +-
>  arch/x86/mm/pti.c                        |  4 ++--
>  arch/x86/power/hibernate.c               |  2 +-
>  arch/x86/xen/mmu_pv.c                    |  4 ++--
>  drivers/misc/sgi-gru/grufault.c          |  2 +-
>  25 files changed, 49 insertions(+), 49 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
