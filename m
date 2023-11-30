Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58007FE5EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 02:18:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q+vUeptO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgdbv1M6kz3clH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Q+vUeptO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::605; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgdb00m4lz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 12:17:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDC5eT71Unj2/FRJfzIkZKCCveUP9lG0NhBeQjIiOIKlG95gscjq3aI2V7wDwQH4jI6/FE8x9p7WLh3QtriB8N3NQ+CjLxO3XKkAk+NcXtlEQ81JlgPWB33Op5yjQOTqQdbp4iZcYCi2EihEXybjbORg2GIAhoXQL4lNmlVTS5uT//ukYTp7pExQsNmGt2Ai62+1Y0yYGYGZmpJLXcWAoLflhWe/r3TXzU8lj0ZvpB2BxbGnqYfYgBNN9I2iHcmdm97ntha+VkUYmQpx43/VMUujMz+rW8bcbSk8vB5whvgZrsBxf5h9BVpnKoeWWmv2LEB3Z8RuGUeiJmybJsQ4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJybaXKoxS1ij6FMe+0qHBjC839Sq+sEYShCZGWfrf4=;
 b=hnU9e1ZvbCQm7OkK7Dtke4dhPu2ClHX7mIXCNIDApSV5psZSrViRrW9bM5Q70320q+5GkO/A3sk8XZ/M9xGvEoJTfZlWsLz9HxGltEy5TMTZphv8UCcnsaN2ROmVCvj2Jgq35iZdmmf1fO+oBtGpvLtF/CczZjNs5Kxjm0lipZALiIfxZAtXWY4kzYZNYiO/8wqUMBzyajyJyFa/iJMaZ0sc5Dpun3lB3T1zUbJi1Ba6E8DSjj4vkDhgB+f5vYu7rZinBBGLjVat7e8QndRy/ZBwYlCDR3uSqbmrj2Ll3EUCqqFpPjx08AoBH5eDRy0c2N2Y//VZydKcA6qscy8l7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJybaXKoxS1ij6FMe+0qHBjC839Sq+sEYShCZGWfrf4=;
 b=Q+vUeptO+rYAcRNQmtTI7hvhAuTYTh1kNnie0VZJITxBxF2M1uQ+nyY58b4jotqYwSPwI7mkkXHR02MM8ZRrurijaGonAePqnqT0UUfl907zahnuxN47lPRgWdsz3mAmY6wsTusW84ub3VgH3qK9LjIJlOkE0WRnT4grUM5UlfIFUmWC5rjUlcXpz1yVYMeJmRYIs3EB9h31AYfRb5zbezcV32WqovIeP1UJLrFSFQNIOoBD6lsZXpzDWgpMHzCnZeVfEnshWbtAlLO4qYFe8i4HFL/UT1CkGbilAp1iK7oGIqD85XCQ37h9YMtUQrY3/Kb5jnaR6MJJ+7Fnb3Jo9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Thu, 30 Nov
 2023 01:16:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::60d4:c1e3:e1aa:8f93%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 01:16:52 +0000
Date: Wed, 29 Nov 2023 21:16:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
Message-ID: <20231130011650.GD1389974@nvidia.com>
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse>
 <ZWagNsu1XQIqk5z9@google.com>
 <875y1k3nm9.fsf@mail.lhotse>
 <ZWfgYdSoJAZqL2Gx@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWfgYdSoJAZqL2Gx@google.com>
X-ClientProxiedBy: SN7PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:806:121::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: c5797e53-7458-4c87-ac7e-08dbf14208d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3bF5QNpTAam1PN/BHwfcZQUPwOILHDN0xVdJNrzDbt0+F4nY1MT9mzEZ0R2hs6V1F8hWGm3P5EbZimeKAHytzaKDf2FjDNZkyollAK8kv4QxJ8aE+PPdonQ3F8HTO9wTRfAE7ZD7GaTBoJgOK6b9QliJh+d5VrdI0Y75WQuLC7aXQmAqEDQVTwrAXkfqKtvrVDIWCghbZ5Gywxl8tCF3cy4W3av7P4Hw9CVeGSxkUlyDGCx36Da/W4kkhcFvFT6ovj2Uwt3LAECCalioWpRldfHY81ZHs/Tk3OA7v4v3MCb58zBbU2YrboLvSZtFvl3CG7ndc92DtF86Tk13m8r20+7RYVTOcwVvLeTv3udDz8nOIzuc36wC4U+nkM40dmtEL0FLTMJN8f/vFM0ZnpQaffafXHZjUyaj4yFPrd5ipqq5jYuN0qH766Bq2Uf7G4O8qfEc6g3G95gsGq8aF4kZznNQRbCkehQiEIC1oKQwFRBmS7XW2TB1BU4krc8BIgyp3oYKGWM6r9GFKnbFhLPOY0CK0wgxp6/py27R1r1FVyU9NKZ4e65tvfxxSsyCT5i22e7SFDrRU3Vu6XJ7uoCw2svtBem3Xg2m6DGA7xBrQMsCZBeka8rKp8Z6zskCCuh7hoxLX9TOfbPp0U33Zg+5IdPb4o3EOem/iVJXxfbEXp0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(1076003)(202311291699003)(26005)(6512007)(8936002)(6506007)(5660300002)(4326008)(66556008)(8676002)(6486002)(7406005)(7416002)(66476007)(54906003)(478600001)(6916009)(316002)(66946007)(38100700002)(83380400001)(86362001)(41300700001)(33656002)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Da/nBxj3F0ZIeLjhsfYx9TaIvvy8N5Ga/0bHvPPcmk5B4okAdeIDASjzJufm?=
 =?us-ascii?Q?cqR1sl0j3NjeYVAuJKVqjU78OwufSl8gLmS2fEh2C6gSnEI5fkuaKCFRXAeF?=
 =?us-ascii?Q?GCxvKn9mnjnQ2pA50E2SDNTV8LUUGdH1byGUX9+HJfB7KMlvgCWPAQiwA6FW?=
 =?us-ascii?Q?vstKA8GbLjr3PBODD3zGFwj1Pf5p+uiFrKheERWnnoriz7z6EW4ybWVTcUgm?=
 =?us-ascii?Q?jy8jctMXyVp5iUKJ/ZnFQPgm7tVUOEkaVF6VC3A0d/ihIXwmm4E7YOqsSpJC?=
 =?us-ascii?Q?LZrQqZNxYrdjYVB+9hkUqnQQOxdprbASkPvIog31S+2OCFNYSK5uxzTDIGx4?=
 =?us-ascii?Q?sWmFxJz7SRTOSkv2k2zHJOuwWStykEjphUzsV+ZMaczpmpawv6SEHjM3bJct?=
 =?us-ascii?Q?BFd52tP06S78cNfadyc1iqSXP9TxUHLhAVvtNmUyO/0n89U0HtC3muHl+TN8?=
 =?us-ascii?Q?Mq9+pBzh7ckWs49K180+w27LAaYuUkmittPtrwo+x/UHD9EAp7NPYkuGheXH?=
 =?us-ascii?Q?d2DGN1dUuE2qfe4j8cSD7Lb9eNsaEVfn9zsOGQ+Rgyryx4kIYkJ764BppM3l?=
 =?us-ascii?Q?Ok1+0uVf/Sq9TA3YVDdf5/a3uIifAp/CyTtHPXuhps8wWlJCP0HZwn3fdhMR?=
 =?us-ascii?Q?/X1zEsobptMwxUi9gNWmKXwE94fiVFzO1+hnk2g6cV0HZjOJCV14FSrhZpSp?=
 =?us-ascii?Q?NgDnYljyC+n/GV8AOCG47SAoZOlaIdXYc5rCeZnDcaEUjhWB6Dhb8+OzpJsy?=
 =?us-ascii?Q?ERVe5apUsOXD0ajlwiyoHEveGib8epN8IHhHwCFtWV63hHsIhL9CuCOp3tOH?=
 =?us-ascii?Q?m87FyohKaeFyVbYMomgxfN8Rw6WgrR9sY8fSpqnllHlBHuCzWKFyRmLTa84e?=
 =?us-ascii?Q?v4J8YcuGDH/OX9JNg/Hw6D+c/uxnt8LZnwBr21nEqShPpeAw2Knjg8XuP9QY?=
 =?us-ascii?Q?YFEkVqMsrm3GlspNPmYXfKcw1tjv8LyYQoACZ+aS2abJXYCPeEXP0NgmNx65?=
 =?us-ascii?Q?mFoiT0Zg25KsNGu3EQM2gyzXiFysGLtqRqBPyyrImEqykHyt6miBLStkxial?=
 =?us-ascii?Q?CQMCsKxQsCUY10CcTEZ/E2obLPa7DhjhAqfJzT3UV0MSQaGTG7rc7PnpKCd8?=
 =?us-ascii?Q?xV64iN3ePINWNcJJTG214/DrQjLLFmM+Z4uRVSZZfy8Um4+jIYESAOBw88Xf?=
 =?us-ascii?Q?5dtmhqKfTOqoUp7ogtZ1OR9lxblYp0UIXZ16HdS17fTV/X/tFeD7f3fMJ0rl?=
 =?us-ascii?Q?OXg92TKuZ7KTQsicNifWgfGs3N5aTmBlUJnfSKQabBp60zWWHHdT6tibWkZL?=
 =?us-ascii?Q?79hg/5NFHA+N6/5GL8PmtjV8YGvkC8ly98kQmcboFEQyVe7j/m6cMzj7Bugz?=
 =?us-ascii?Q?cQC4wQPd+n89gRtVGc9cyJLqmlzIzdBb8f12PelMUdJBIQOBwvFS2lx8g5T7?=
 =?us-ascii?Q?5O3yqgKsJTVVC7KfDw+R/4GzBXnDqqu/nPMnd22YXFz6NdzFalUJPGia5oxH?=
 =?us-ascii?Q?xaaWo6ZFhzs9eVU8efyvDzPm/JQNauRBAGYqpRtZaAGBQRhQUv9sqMH1+fQ0?=
 =?us-ascii?Q?K7SoiMDAxhbtLe9iZ2hf0oJr8lfNt9gnYuZbtp1O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5797e53-7458-4c87-ac7e-08dbf14208d5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 01:16:52.2389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi8fNVD39stje3lQebAL5yh829kd1t4Ex77o2RS8hFFqsG4uVqeCeX2V1ozRkJru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023 at 05:07:45PM -0800, Sean Christopherson wrote:
> On Wed, Nov 29, 2023, Michael Ellerman wrote:
> > Sean Christopherson <seanjc@google.com> writes:
> > > On Fri, Nov 10, 2023, Michael Ellerman wrote:
> > >> Jason Gunthorpe <jgg@nvidia.com> writes:
> > >> > There are a bunch of reported randconfig failures now because of this,
> > >> > something like:
> > >> >
> > >> >>> arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning: attribute declaration must precede definition [-Wignored-attributes]
> > >> >            fn = symbol_get(vfio_file_iommu_group);
> > >> >                 ^
> > >> >    include/linux/module.h:805:60: note: expanded from macro 'symbol_get'
> > >> >    #define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
> > >> >
> > >> > It happens because the arch forces KVM_VFIO without knowing if VFIO is
> > >> > even enabled.
> > >> 
> > >> This is still breaking some builds. Can we get this fix in please?
> > >> 
> > >> cheers
> > >> 
> > >> > Split the kconfig so the arch selects the usual HAVE_KVM_ARCH_VFIO and
> > >> > then KVM_VFIO is only enabled if the arch wants it and VFIO is turned on.
> > >
> > > Heh, so I was trying to figure out why things like vfio_file_set_kvm() aren't
> > > problematic, i.e. why the existing mess didn't cause failures.  I can't repro the
> > > warning (requires clang-16?), but IIUC the reason only the group code is problematic
> > > is that vfio.h creates a stub for vfio_file_iommu_group() and thus there's no symbol,
> > > whereas vfio.h declares vfio_file_set_kvm() unconditionally.
> > 
> > That warning I'm unsure about.
> 
> Ah, it's the same warning, I just missed the CONFIG_MODULES=n requirement.

Oh, wait, doesn't that mean the approach won't work? IIRC doesn't
symbol_get turn into just &fn when non-modular turning this into a
link failure without the kconfig part?

Jason
