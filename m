Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C37DC69B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 07:32:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dvlfvTOz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKL0t6xySz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 17:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dvlfvTOz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=chao.gao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 31 Oct 2023 17:31:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKKzy3DhJz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 17:31:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698733918; x=1730269918;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gwre9Xkm4pt6rxmGJg1oxmyhKGmfr8wSV38S8y/3Yqs=;
  b=dvlfvTOz5jWxMhNwdyUCHEgLjNsVIvP6fdHKRFUuD/rBeulZJElUl4NF
   mR5UGBh7s5azY7/iaxblj9zJHT5yTblyMD0uGda89acDYJfVxwb/Sd5Y/
   toedrFAT2VqrCKntR9riREtUTEgsJZEq7ac/Smh38leW+VWEkPtfUT9wH
   QS0LEB3D1K5r9173ywWkly2NwynYSGWz5+e1wAKX5g+42WnIpbh5SnQr7
   1WiC2PMv+C3MUG1cx/EDZFIArlb6+P29KomY2Hjt1xr5oaNjARnvXC/rl
   OBwpYQOThTrZQSSDpf801LJcm2Z/vaaehEaDxkR1Nj0zg7hphe5g0L8Yh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474462979"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="474462979"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 23:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1091894127"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1091894127"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 23:30:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 23:30:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 23:30:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 23:30:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 23:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVeuadb7v1hiqCjj+AHFamvfSyKRKQUjAuXv1NOjBTVoHoLynXDCvDKNumHj/wCg30Atalit9D98NRKJeQpvRTNLQcLFspIWisuCl9q4AbvqrLXvTgPAlt+GlqnRq/MVbLKu6+plLcqhxo+BJnfxPpvZOvwHd9ixyyWKFd26AZw+29MUE/mHf1RWeLR7TnCRy1kcE7/k6Q2uQMhPv9gyM+DSp74WRWtrj15Er7Y3j6IqcV9OvcITMW57yO0o1lidDx4CKzKyzPFtGcSFMmi0odD5q8AFyZgKb/s5oWnsmMG9eN+c8CpEdoWk+U7mQpYqVgMvHaQkyMUOJD7Eap40KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aYQ3hE2o0Pll8uyiM921Yg1krv76UJ0kxUntqgLesA=;
 b=DuoQX3xzlHwWdJa8/xoXV/C2OxHxaAQC/aOLIMLdWQXLBQ1akdr0JTen6bDW6bp4becynnKd/Z/zyZzZ3UAOQUQXHNQuEq5nPOnPyPpRB1UiLLM9xnFXUxQ74/QlDqbmw0enc991eugkFdiq2mue0uvC5Vzg/PqZs2VckTpO6AmVu0tXO+j0d88jNSAg4oe+5MLY3KYJo5J9r2/P4MOshbvNfNaQGRscx2hmA/qaocRo1HZIS2OgRROs+hDHz8edcdIlpi6O1vkwflCgSY95R8UBxTBgQBtiCDG//2T8Grb84LELsTgNz70CpLkyFKQvmnigiyNwH0RXAz8/+E+u2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Tue, 31 Oct
 2023 06:30:43 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::6227:c967:5d1d:2b72]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::6227:c967:5d1d:2b72%5]) with mapi id 15.20.6933.027; Tue, 31 Oct 2023
 06:30:43 +0000
Date: Tue, 31 Oct 2023 14:30:20 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Message-ID: <ZUCe/PGL2Q4OzDOX@chao-email>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
X-ClientProxiedBy: KL1PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:820::31) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: 9080adf9-9556-4df9-766f-08dbd9dae75e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rk/wukYvHueuzG8fIR8wgxRoya4Mo3GecLT4shuczyGgx8v6mi3PHS1hgpfUzAGCWzuL/lYDz/2Cy8X9MgLqcry4qWe/jG07klFTnSKciZwKIuTQ91t2MRg8svc8+Zybgh3iBilGyeABEl7rbWGxfZbe8bDGbL+2RpMgU3lbWHgjNt774o//yroIfFqFFmUUjyS/DHBD7UAi2KQWrGlw+kXOVQgjxszSKeIKrK2ColClqfp//3xxIaOFJjObDsPCZD2cx4MwapXkpRU6mgyl/0JuYi15nj8M7sSgDGkXb078aqh4gp6cB4ZH2Z+rdyWW3xIeB2VFbveFsM18kCRoNk5dMh/SekL+LIrKLkEVT4QdJbV+tEyPy3ULeMgeqjV4P4wSUAjLT5KFiKEnGiFxoR75XV5PqEkXbalVePy5TuWS6eOtoFuBD4t+J2DaSKZpiq5OBn8K3FePme+5kMrFfZ66uyxmavNQU63TIvEL3CF03YmzW9abIgUn6GF4Lv5kicqna9aI6ltxCXQYyQuPh9uyvEvLM9T9jbKoVpNvFVAzt5BPIxIsQvFmJQXP4VvM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(366004)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6512007)(9686003)(26005)(6506007)(478600001)(6666004)(83380400001)(7406005)(7416002)(2906002)(44832011)(41300700001)(5660300002)(66946007)(33716001)(66556008)(6486002)(66476007)(8676002)(8936002)(316002)(54906003)(6916009)(4326008)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZtu529NslUI8jRAJbhA+kGcDnGZOCtyuj+hBtZbU9b/T9r6moCGw6xhm/gE?=
 =?us-ascii?Q?MHAjXU77G1ef840b/mQq+D4mlwJac4qMeQz+vWKGq7bf5O+qxXSmDHlkRFWx?=
 =?us-ascii?Q?ctOLVgJ/8ho2GC4JCTQpFRgFBPdfvwOn/spUtooE+MIKX/BR7Q1ZzSHTfllZ?=
 =?us-ascii?Q?7XgZxGAf+xMd/reyVs6wBpOUWqhL3uOO3/gHXaUNilxiuXfDGUHBTi82Ddi9?=
 =?us-ascii?Q?MPBizBkWfZEkKVyTyeG4SFw5+m3SQpLoBFa5d75bc5iBgaInZKX1164lGIie?=
 =?us-ascii?Q?JA0jyH4m4vX1fa0o2BSpd3J2PHs+N+gUexodO+JiwJ18ZRgcDDx0de0aLfhJ?=
 =?us-ascii?Q?4tmpWJWFzELxekvRBByEQ4hjeNfHqPqPLftahXqlQ9dIZ4d52qH1WXppMvWL?=
 =?us-ascii?Q?PyZ8QX+CVcvN8OdHS12L36x042Wd5wKQUevoRyXCDfgBlxogM0qaZnJhfRp7?=
 =?us-ascii?Q?hLADkR6XUdhZNWQ9GW6pYO2U7QGS7JI3PDmZeihbrqIT0jdqjdqnnuW0OkK9?=
 =?us-ascii?Q?q56DboNMeErI5YxktzfHlDtD5NQDEiStSbS+vjhkAihRy9SIPZ4tQE9irVll?=
 =?us-ascii?Q?VAJlBrKDZlmXjfyA3hmk06RNjATNzV2wUqQ2H7Xby/KNVJlTKVPsaKyBsa0H?=
 =?us-ascii?Q?uIlJkPTcYYMh0koXl8xzuzWHNHwdNouVBznTKwkPET1fE8LVj+loHsAbBmMH?=
 =?us-ascii?Q?QhjPU5AZX4N3I8wg7kOldoMJ/Ouxph4ixa8z2bDA+1y/5YSY/RyKOs9QZdsj?=
 =?us-ascii?Q?K1ojJtKhUTA0T+ZhJico/GH4r7rrGNWuBPuSysNxzL7mDAfye6OQbyvNn6nA?=
 =?us-ascii?Q?FA36gDPVYx9RzR84CdTQ+VRKv101mbIChmF9Or7qLFIJ+JoU45vTNTy/Vyj3?=
 =?us-ascii?Q?jRypJ3vgLTFFYxS8TDVoT1fLUT1CZbUhSZa+qzQRIT7EnmdaO14H/O0vdPvD?=
 =?us-ascii?Q?mZfIiDJEbPh8htkVNredo/I2GQqw1LXcniPnugKcID7Ro7Ffk1YD+4mokBGW?=
 =?us-ascii?Q?vhUAwXK82PwztXAkfmyOOckncgJE0GL3ORJxLSdEO2HHQFtZ3W09W+20t66q?=
 =?us-ascii?Q?o1on0/JwWlx2T2A7krLlY9a0NuCVVwxPlF0IC3taW1gPrjT7mYBXqhdSLtoA?=
 =?us-ascii?Q?q0ujvB2LYSe9GFvpMbwIs3jcF4a4ojP4AncuVZ5m3/Db/rfXvdUMLKi42IRC?=
 =?us-ascii?Q?syz3xIgkgG3yYfx9d7HVsOu93PpdsI7LOiZg5QI3/LZblIVdUVtAWqCbOOWN?=
 =?us-ascii?Q?uiQrDqrDdHzOwi+FzmZLUfZ4u1hBnVMlioJubgfis8v8VcxuIw09dAxAjICC?=
 =?us-ascii?Q?1MoUdsTXprKGG2alA6MnfLnKhaeMfOkZZ/5lETsiIPjcK0I+rQSkkl4U2kvE?=
 =?us-ascii?Q?BPO70el2x5mdccA2KGk2lwG73rzuGSQXDxKq5h2ys4rtPFPhbYfwebQp4Rnx?=
 =?us-ascii?Q?+qMi+31Z28y76pX35aDe7RA/aXB/0dchCZrTAWj2c/6pX0AhFDxV+yIVpku1?=
 =?us-ascii?Q?tA3NSDfakVWOdBK0nWgfb3DAYF8V8slUS2K46HKjkIKnizTMhaLWg1L3+KUl?=
 =?us-ascii?Q?Z+mSnzB67WXYARFEel+SCbLgaCsdXym8ER9f6PF5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9080adf9-9556-4df9-766f-08dbd9dae75e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 06:30:41.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hw6kPRUNwq4O+Q/fpqiaFjdqEES3q0/0ZEJSJD50fq4JmNVRoxuY5dXtzMz8ykzoO5Rdb6DSREyL4EA9t6tFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
X-OriginatorOrg: intel.com
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Li
 am Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>+{
>+	loff_t size = args->size;
>+	u64 flags = args->flags;
>+	u64 valid_flags = 0;
>+
>+	if (flags & ~valid_flags)
>+		return -EINVAL;
>+
>+	if (size < 0 || !PAGE_ALIGNED(size))
>+		return -EINVAL;

is size == 0 a valid case?

>+int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>+		  unsigned int fd, loff_t offset)
>+{
>+	loff_t size = slot->npages << PAGE_SHIFT;
>+	unsigned long start, end;
>+	struct kvm_gmem *gmem;
>+	struct inode *inode;
>+	struct file *file;
>+
>+	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
>+
>+	file = fget(fd);
>+	if (!file)
>+		return -EBADF;
>+
>+	if (file->f_op != &kvm_gmem_fops)
>+		goto err;
>+
>+	gmem = file->private_data;
>+	if (gmem->kvm != kvm)
>+		goto err;
>+
>+	inode = file_inode(file);
>+
>+	if (offset < 0 || !PAGE_ALIGNED(offset))
>+		return -EINVAL;

		goto err;

or hoist the check above fget().

>+
>+	if (offset + size > i_size_read(inode))
>+		goto err;
>+
>+	filemap_invalidate_lock(inode->i_mapping);
>+
>+	start = offset >> PAGE_SHIFT;
>+	end = start + slot->npages;
>+
>+	if (!xa_empty(&gmem->bindings) &&
>+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
>+		filemap_invalidate_unlock(inode->i_mapping);
>+		goto err;
>+	}
>+
>+	/*
>+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
>+	 * be see either a NULL file or this new file, no need for them to go
>+	 * away.
>+	 */
>+	rcu_assign_pointer(slot->gmem.file, file);
>+	slot->gmem.pgoff = start;
>+
>+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
>+	filemap_invalidate_unlock(inode->i_mapping);
>+
>+	/*
>+	 * Drop the reference to the file, even on success.  The file pins KVM,
>+	 * not the other way 'round.  Active bindings are invalidated if the
>+	 * file is closed before memslots are destroyed.
>+	 */
>+	fput(file);
>+	return 0;
>+
>+err:
>+	fput(file);
>+	return -EINVAL;

The cleanup, i.e., filemap_invalidate_unlock() and fput(), is common. So, I think it
may be slightly better to consolidate the common part e.g.,

	int ret = -EINVAL;

	...

	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
	ret = 0;
unlock:
	filemap_invalidate_unlock(inode->i_mapping);
err:
	/*
	 * Drop the reference to the file, even on success.  The file pins KVM,
	 * not the other way 'round.  Active bindings are invalidated if the
	 * file is closed before memslots are destroyed.
	 */
	fput(file);
	return ret;
