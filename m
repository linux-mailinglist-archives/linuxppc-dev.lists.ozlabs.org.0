Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C068B6C4C49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 14:49:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhVFS4Qb0z3ch5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 00:49:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fC5yY0ef;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fC5yY0ef;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhVDV2qmrz307t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 00:48:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKdEgYCyfuQz27S/zMVk7nNrZLkhm+wd5mLfNTxs2ffB55CCoVClcGjBcp1pe3A9Gx8XTGwaMAgABj2zNrUJIefNjm9Nn2NePc+n75lUyzjXu8SlAqxYG2ELtidHeeRKmG+hmVO4oI7T/D6mUDCZQyCRQOw2mjj80hG2UZXYzVUUR+SOdXlz61pSCcgk4HEKac1uedlqCpPKhXc5EUaZV2psE4nc1Fpq6B6yJQKRaPcjptXTgBi78IAJRMQ8lOn+dtoQK+xb8lGjs4YsWf8nFqxeWvKt0nwyynqwmvUm1lkEkwrru+9QnwK6M2MY0hjYMLc8CQKay3He5xePnZgjeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIjjMddBoPYhuP5rP96WyDFkIlPoDytZx0h+zKahtNo=;
 b=I+6GEEg3i9G66yYrTltqqm+3/ONHrJW51BVKqLAvfSefcghUGf8b7TBCq/Jh3nB8bX+b2MH8trXX+PPqz6qxw3S+DABuQdlbTLrkIcwxx2mkQZOt5Kw2sD3SubJlcL4Vqz7gB2DhsjHricg0zT6b318g10JCxyjUTDenBRFL4XgUWzFBc/sRKWKSrRO7C1i6d3FSDt11rGjlP3K7uWksYzDlURWkugLFwv5jyUMiPGcOwSg+lpXIZx/VcYMBVmoUHBGFkAiecWaImuSCQsKWoaHzXZvSDHEl40NwG6xq5P+ETIdcyw+SnYTXsjHaHuU+lDONxjMalZfO4utxF73Vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIjjMddBoPYhuP5rP96WyDFkIlPoDytZx0h+zKahtNo=;
 b=fC5yY0efsekT3b+Z9xpPKq0Ktr+bX1TkCi0KftSk555SbD3nBLsX28H3aqOR9GbnCxF8/6Be0kKXaudeugTrWjwBDTAEkZJkylcLRKgY8RDyXzBIWGP7uBMZIhHOKGpnV+L4A7jm/uYRuGTiJXtayHAD/gi7vWcvo+prnRBCLiTqvQyrIcHGXVP2VtnNwVVIQ75Zb6Mow03r8EpVoE/Tq5fZqmsIXrNCEJyGUcUG1RcTB/BS4YJHa8mdYT1QftUrYsGy7RRs6FqtoP0QtFXdFtkdQjPseWXjt0NPFAmmadk1+MUL9R+TlMqkhJBXIphQoYgKPjArYD+0sKnon3r1Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:48:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:48:02 +0000
Date: Wed, 22 Mar 2023 10:48:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v4 0/7] introduce vm_flags modifier functions
Message-ID: <ZBsHENhAFsBYN4HI@nvidia.com>
References: <20230126193752.297968-1-surenb@google.com>
 <20230314141144.6a0892e6.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314141144.6a0892e6.alex.williamson@redhat.com>
X-ClientProxiedBy: MN2PR19CA0059.namprd19.prod.outlook.com
 (2603:10b6:208:19b::36) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d463ae1-340e-4fb2-6282-08db2adc0df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UavkykGsxA4J1ScUKg/POZEXAhk4VhwHHUBzYGdLS/lV/oDf2FqClHqoqRVzd4H24SMJEbbf945cIQu5U7AiCwSPatYLgt8BV6KYjmVGNju+AFiT1NzZdZnLjnOCwvw5aODglZDuemn69LH+Mpk5CT9bP9Uc5EuobUOcENS82nF5ZN6P7dsmvTGfW6svsbE8Cn0N3I+UdqgShDWl89huf++kwV467/BFU0lKwnsVBHjUXLG354Q2JVULM9lrBfpJ96mH4tQdk8StK/dENSLuoBlg2gNmrK1X/MeJb6afY8twZTSZFjOrhP2H8jINa6dZoOwh8h9kfzz2ifXS7vS9zfU409LayDaRD13Bwb0qP2ftO6hDv7TQV8jBJzSMIGeZ4cS8+Y9Uah6aF6np+mWcKHNLoO2mcZ9RdreaJwTGuZ+jW+Q6m5ukRCRrzID/WqKMbrfKLw9TTmeeggozWGqYp+y1L+gUPDwEhQg/aTGfczg8xZQ0ZoaEV32hWWnjtfhzhzXafzNgsKtN1RbGyLmE63iM3Eh6FQZWvZBJZlGTYi0lNLa9gxqb3TDca/S0L854ZO//5RPG0A4HltRvbu8nhpOhvksms56Qb18omDXgFSq8i0/Bwl4Ews4dspj5zhxRt0A/Dtw3MaS4YoHPqKggYQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199018)(2616005)(478600001)(83380400001)(38100700002)(6486002)(316002)(6512007)(54906003)(7406005)(186003)(7366002)(6506007)(7416002)(8936002)(86362001)(4326008)(66946007)(6916009)(26005)(66476007)(2906002)(5660300002)(41300700001)(66556008)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cZVT5i8ERGjqz+oPeC9ubbxno/QTcUJUwrU5v4eIn7meqVH8Pi9SuVvY9Y25?=
 =?us-ascii?Q?3QJ4AhSqbCJtX9eVAlmE9UI2HH60L/FvaUrUiS+FuaZQZaj1tBVsnOmz/5AH?=
 =?us-ascii?Q?+4I3E0DmtrdQZavlDW//O32r7l1zEXs9Kmafvzmk7er5dQom3gt/lHp3yqFl?=
 =?us-ascii?Q?V9NMj/OIM9mM9o2GSR5Y6jquraEXiJb6EcVGOU++B9+HL7fuFF1DVsSXjGyP?=
 =?us-ascii?Q?D0AUw/ZxXXLuQ6MbI0nX+rtg0+30Frt5ndx+j4MMB76mEUCELTdnZC7lnnKf?=
 =?us-ascii?Q?c026OvdAYuro7lXzo7EEk2yjUvySWoWC+WBUhmy7AH6hGAN/5v38SPbs1yga?=
 =?us-ascii?Q?RP5h8IqfSGPCPAkFLcF24cyVMY9Do0VLfGr9CYi461HV+7AsrJDAkOhnIVOA?=
 =?us-ascii?Q?3ew3CQ+kvWcsH5IP6cueUVgDgx10YddyOSQ/ufJ5KYwwj+6ekrTS6cKyBkfq?=
 =?us-ascii?Q?F/lqiyWLPr99+FiRpst9ejDdcNF0TThtI8J7Jh1wBiUB/8kSED78I5Jyoi5e?=
 =?us-ascii?Q?VxCCmzzzGCH+4VcCEkqK/Mumj9Eg2x5omR6wUa40nHZHPA6MR3uUEtPww4v8?=
 =?us-ascii?Q?cbMuautRR2sAZGcsCNwkSROh55sTiji9cM+LZc9Fnt0apv6yzhcYbkx3Il5i?=
 =?us-ascii?Q?cou2mts9Dy+OVZTLYvYlRCcNYjcAs49bXLMvoJNLtpMiik/ZEcI9s6ixtpgs?=
 =?us-ascii?Q?S8FkK85BCDYRKYCfE510OeSY3WpuA/MeuFuS+tRBg+QSzN7sfpScInk8axdr?=
 =?us-ascii?Q?DW6mHg+enyNgCHbG4mdfFn0ktn+atPhD+90JxBAhFXmL2L5hWFD9Ppw4FRW9?=
 =?us-ascii?Q?LQ/Afv1dGJTwUB7qqdQzwvURzd+EGkpfASQ33KQDl/SxsSWt3Xo/PIwi7bgK?=
 =?us-ascii?Q?lTHDVXVuvDgr+19wgVvwenRmnom+LuXPEG0UrWTXABeKD3d37LbgEmL/7mnj?=
 =?us-ascii?Q?Hh4WbHsetvR/G1gGh4Cg22rnzfsBjJD0lJqf0sME+AC93/15OQSppN++MENH?=
 =?us-ascii?Q?9nrqh2RKuhKdxAcEAvA0q7pv/kDh5uVboTHz0uG3o0OmimRE9enY+fgoO8P+?=
 =?us-ascii?Q?qqumb8VRQHJnINqutSzebPAa8NO3zKzNRj8dC9SMSfKwCS/rkuUkFBZxsZ38?=
 =?us-ascii?Q?7TAImut8q9CA//8+DRxURqbKl38b/XWlmJu2ETwG5gza4CSX+AOLyJKaOVZc?=
 =?us-ascii?Q?9wj1iHX/zmZChJq7CmVwGyd7cAV7jgn9db2bqZJImCQXj1VhmTyMDIAEXurP?=
 =?us-ascii?Q?LMli/4X9S6NW9f0jw3++KudBRND7CKPazci3NMQ1A+M8dfVDF3Fj4f3yDXT0?=
 =?us-ascii?Q?8Q5sK+pjshgZoixLeO8NxaMuZaM7xoy2F6kniKnsvlPCydYyZzi5bTMz1s8r?=
 =?us-ascii?Q?QZyy3e6HNyp5JYeA7QcJffdvU/1wRaE2xGvFXRaesUMgpls32oaCTnninQ+9?=
 =?us-ascii?Q?mIYFn7sE0jtie2Sb+1j0A3a/3NyT/sfeo1I++bl+WMDcTTbcpXwCNT5ZrbtQ?=
 =?us-ascii?Q?S3hFR+kfglICUxw5lU7YoPqEAArykg5RhniCUgqaNlS96eWIS2AY3Xc/iU6R?=
 =?us-ascii?Q?Iy8OEQTSDM7WsmfSC84Px+gezlMeKINcPwI9NHE2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d463ae1-340e-4fb2-6282-08db2adc0df1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:48:02.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3h7LNVVuB/nuDGXeQA3qw/DyYFZRVCAn/e80lu0fOHlkEbdMFIoFtsFfZzOgW9u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, Jason Wang <jasowang@redhat.com>, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.o
 rg, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 02:11:44PM -0600, Alex Williamson wrote:
> On Thu, 26 Jan 2023 11:37:45 -0800
> Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > This patchset was originally published as a part of per-VMA locking [1] and
> > was split after suggestion that it's viable on its own and to facilitate
> > the review process. It is now a preprequisite for the next version of per-VMA
> > lock patchset, which reuses vm_flags modifier functions to lock the VMA when
> > vm_flags are being updated.
> > 
> > VMA vm_flags modifications are usually done under exclusive mmap_lock
> > protection because this attrubute affects other decisions like VMA merging
> > or splitting and races should be prevented. Introduce vm_flags modifier
> > functions to enforce correct locking.
> > 
> > The patchset applies cleanly over mm-unstable branch of mm tree.
> 
> With this series, vfio-pci developed a bunch of warnings around not
> holding the mmap_lock write semaphore while calling
> io_remap_pfn_range() from our fault handler, vfio_pci_mmap_fault().
> 
> I suspect vdpa has the same issue for their use of remap_pfn_range()
> from their fault handler, JasonW, MST, FYI.

Yeah, IMHO this whole approach has always been a bit sketchy, it was
never intended that remap_pfn would be called from a fault handler,
you are supposed to use a vmf_insert_pfn() type API from fault
handlers.

> The reason for using remap_pfn_range() on fault in vfio-pci is that
> we're mapping device MMIO to userspace, where that MMIO can be disabled
> and we'd rather zap the mapping when that occurs so that we can sigbus
> the user rather than allow the user to trigger potentially fatal bus
> errors on the host.
 
> Peter Xu has suggested offline that a non-lazy approach to reinsert the
> mappings might be more inline with mm expectations relative to touching
> vm_flags during fault.  

Yes, I feel the same - along with completing the address_space
conversion you had started. IIRC that was part of the reason we needed
this design in vfio.

Jason
