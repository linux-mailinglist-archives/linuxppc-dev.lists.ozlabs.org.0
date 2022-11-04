Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA3618D4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 01:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3MLF35bRz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 11:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJe69avg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJe69avg;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3MKC672fz2yMS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 11:42:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667522544; x=1699058544;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DmfP1WtN2zWYZgm9zAlP7YL4qenoKXw4dE40xXnFxSA=;
  b=QJe69avgv9qPrHJ4qHYrB9iEY8CPjSr06epHLfBJ+N3YaNSiJz/2oO2r
   FvrHovcCGk/zIeUJPHOtmkLsJvMLwFa/J7T2Ur7hkzEcjk1czxbh6pc8c
   brmiVTFkBWx8I3NQJA3KR8N4nAdNwWfNdUsB2esEKh+6FL0O0NDFGa5ZP
   /2Yas28pYcYtgScTKun1ydLB6CyhO43ffNueaUt4IegInTUoMTJiDJPhl
   69/5IqZyBb+uX9ZHS5n92b4dhYVLbU14aM9ElHA8bGxROVGWzSBTXfAHM
   tM1BJWWGYjkBnqNgNyOXIPwl+3KXKbj53bY63KEnvnhsp78I02XvfKWSG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="309836796"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="309836796"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 17:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724156759"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="724156759"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 17:42:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 17:42:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 17:42:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 17:42:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 17:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SruFtt8NwJsf5Hf+As1LXFvP7A2QGeQIV0wzcFhr+jT+D+sPl3jEH2TD5yV32oudTcdVVR9sluY6ompmfW+lyKEzifEXiS/zKeTA2q5PbslxlyErVmzx59/1HA4mWEnyBgTt2Y90zzVbI2xTSaaLbwRynvovNkBhNA9hzfXwEkwxWpC8UgTXECgLPFWiMOLnJUgoy3HGa79n/29cLM6LD2lGLBJdlZb34+b0SVj9D01ZjawR+bzve5gMPXyy91E7SaLDanyHWU+uctqzlumY2p0/kj0S19h+ZmH86+ivoIEWEhlM5in9uJz8qLVaY1mikY3X4RszH5milmwCqEH6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffU+QqEDNEuZD0BiE1d77bOmWPUT6GcZGA2lH5iasdE=;
 b=H3Je0DuOkmL/JuIh4M24Lg85MLmZDv+RuggOoeB+fulcYToP/HEZux3C9l9e+ywjuvhmVjRNNt52V5XfxPf3REZmuOLUyMzGEDjXrdXovu5FT1FVxhtiS+u0J7DYUlRxXSnOrwRamgTKOXo6ryXB8bzyEKpgGoIQIGEkLFTF7Dg/Oxy+tKPC1vVLOFvfgrXiS/unaY4HLR9EKiwUlop9ssD5GAxkspR/fJB7ZmO3eySgJ0yKnolmzq5eqX6EamIip0wGmhboQHidzbet68w/lSZ7LxEwDvC01ScCqyTniedDBQc7m3OkYYQcLvSiyqbGudzuWKBVyL22I+Jpd3xE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2221.namprd11.prod.outlook.com
 (2603:10b6:301:53::18) by SJ2PR11MB7547.namprd11.prod.outlook.com
 (2603:10b6:a03:4cd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 00:42:03 +0000
Received: from MWHPR1101MB2221.namprd11.prod.outlook.com
 ([fe80::165:d3d0:6497:9097]) by MWHPR1101MB2221.namprd11.prod.outlook.com
 ([fe80::165:d3d0:6497:9097%2]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 00:42:02 +0000
Date: Fri, 4 Nov 2022 08:41:51 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 02/44] KVM: Initialize IRQ FD after arch hardware setup
Message-ID: <Y2Rfz+TIcdfcawxh@gao-cwp>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-3-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-3-seanjc@google.com>
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To MWHPR1101MB2221.namprd11.prod.outlook.com
 (2603:10b6:301:53::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2221:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbf1d8c-acfe-491b-dfa6-08dabdfd63d5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QCFAgLyomoY5y31oBn1bUcVxCGVACsdPDcNDd8gymfF7Jrwnwe1epHiH49s6AHKt823zoxBon5VuLAIvpVH3uBNqzmHvSQUiLLknnWdgnTJ/GB68F29rJ3PgqIsbb/ljh4GCur6edO1ppKJO7WIRZUQcHGneb33QozstDa8jR3F5dlWR0sSXG+8Kyp6s7xUaj6zV7BQHsV5irgqbUC4hniAu6vpFTUUG3oP0rVeZ/eSzKk8d1tle8gsHwT8gTLRRRPnzvz4Us57u9eg9aBu2oAtoKOZO3AxK4BvIYc0d/3z/3gyVUVb2MPL7TQlO3b8/kLacs4WQZkvGpxF7rWB4chuxYG8dFCBI0dpvOtTE//zsH2MLyWoPI14U6GomaBNq8wnmAfMY3IFVdUD5Y31CWdXHGqkkTaVNYKhOpDuSaBl0IZtxvlqs4dfteUBq1k89y0tDQ755ImyYqrAIIf9U8Vl4DVJjrnxXnNjOXlzNzIvEW5bXLmLpTGI4TSr2ZVN4tGT498B68tmyOlzUdX15A/ihlE5xk3E80i5OW8dFpHLf9uXv6/2FRj7YmJ+KBmG94MRfeHDugOSBBboNdT47mm378KuOZhLVMCm/T0viZ9DqfDSmupIZI4jx4ryUwsJYyd7ADtJN6fjHlOyUOh+nT/rF6BtBaEcKmx7KkjjrZkhVfBpq4hadpxsbSG185wVxg1t+dNtWHXdOHLKEIKaz7Lppn204LY91EynsAQQXNvsYHYUToQbltEa2Fw3YV2QNnJqB7DydzbCYmoHTciIPNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2221.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(2906002)(9686003)(86362001)(8676002)(6512007)(6506007)(4326008)(41300700001)(33716001)(66556008)(38100700002)(26005)(6666004)(6916009)(54906003)(186003)(7406005)(82960400001)(6486002)(66476007)(5660300002)(107886003)(44832011)(316002)(8936002)(66946007)(7416002)(478600001)(4744005)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?24gOanRhUyDupyEqWmt/xOHRJAHmyR2yhDEn2mrw3pUf1trnr7jiGEI3bNKO?=
 =?us-ascii?Q?us4J4HU8YdEWU6ju58VQ5e9hmZGku9E3m7wdXU75T5s6UF4em4l/5YR7hxNS?=
 =?us-ascii?Q?b+0CdiQkkzsVTvXnj1EOF2dACFRKBxfdvgEVO19+QfEekvdAs/ZuZI+tUyn9?=
 =?us-ascii?Q?ZF8jtKyn/pMzno3S/ol1Af3fcg5BNIbJHsjO2bKYEdnYXq+1r4egPYN3Vm4K?=
 =?us-ascii?Q?wf8ACukLeIGW6n8UUmbXS453/Wr8lqEa8v5v4cD7UGucfMHWEcLq/g6Cp+31?=
 =?us-ascii?Q?JGWt6qF4/Fl7BKJ3HLceG1frh7xEB8FWxxNBBLZIoczuYQHYkr8M1802EpII?=
 =?us-ascii?Q?HXd9kRteA+idGCiNLB+/BQLUw/QAAmSItnyegsy3ecFXJXTJ6xCl/t/+rB8V?=
 =?us-ascii?Q?v37KR4axUP5mxCsZmJCgTbkPN5qX61WeSJGSRJAmlM/RnI+sQ+5gLtrXcFjY?=
 =?us-ascii?Q?f+9mKz0YTa2ja/DFRutT9j0aQSqplWs1jIn8eoLneS6o/3HdiBFCTLOGhKtv?=
 =?us-ascii?Q?2TiWCkrzJUaqwFx1Xe05aO+F3ypo+HPg5C2Vu6L/hvAUinL8r5YUpupEm5g/?=
 =?us-ascii?Q?T5UPw5pn82m/NhXBvAnoLElmobcrU6T0U7Joa4aG2q/abs3GdEXa6NToV6ga?=
 =?us-ascii?Q?qGvJLQAvAYKovXD1YJM5IMAG359GmQX/bFDv4hbRQCPboZdeflheE9u24woi?=
 =?us-ascii?Q?eKEqfWB9dyTB6JozM4/f94TPUGtSvpX2TtaJj+TtPm/Jugivtq3kmicYl8nC?=
 =?us-ascii?Q?Wxb3rTZlRJAiNbPkilnn9+a1/k9ZZ2hsoypuK7LKqKG0sPo27Dwhb7f5pGao?=
 =?us-ascii?Q?oTAP0ZH2OcvHTHy9D8pmdQCMBVUe9uCtaVyciiS+zeHvg4sKMFCDvqgkZDgl?=
 =?us-ascii?Q?PVvFWuiUjp7HYIoQUHP4xRWd448HhWaTuDVxkl47gk3mSHh13EYbTu+GgEbH?=
 =?us-ascii?Q?F2lzkqUd3/Q6VmQ93f/56ZFt9P6f24HbkA3JQ+2RoEqMU2Eo9suRMTqJS60u?=
 =?us-ascii?Q?SkgPtqtfxO4+ZdL0R5DmpJ1D+edMBFSMYXOc/Aq9GSBc9MVtVZlQ4fmh1Trf?=
 =?us-ascii?Q?mim65O/a+6noA9IIHN+hZBoiPM9+uNQKAaMEYLZkhyUZHMu2QrQQ/LzbeRsL?=
 =?us-ascii?Q?18icDg8H6Dn429Lb28YX3RxlfnVoLaB8JkAYe1irgPxPVchatVSSWgLj1yo8?=
 =?us-ascii?Q?fElvuBnEBDpJcM7AthSJsDxr/nj4cB7dHuhuRD+B3eUz2SRLWk9BeM4dlQIO?=
 =?us-ascii?Q?m2reXxSJ84fWsHS3f+DUzAp5FvDS0Fm+IcX5ihPxYAQbF8sIFATKx5zrcQSo?=
 =?us-ascii?Q?f2Yx59OYzrYuml+oicbd1IBFa1UAgbBqQKs0UJ2e99pHU+gMK6zOqwNb3hn5?=
 =?us-ascii?Q?tUFp/IycEzNrXMuzflundNw7eBRJs6SvfeW3pJIe+/8YCAAUOUb82XAWVv4I?=
 =?us-ascii?Q?R8UjTSNWXato73Wa0EFuLA0447dDWqtk0fqf0Y7nvb2fl2Xf/P1FKMAeqZR3?=
 =?us-ascii?Q?rnhWmAcbQhzr3DgmtjAM1px+cCepOtoG9RBRayt8zC0njg2mEUMABJz9S/MA?=
 =?us-ascii?Q?hlw7HIWc3GbLZCD5Ibp0CgtEbOIqZl1IHkjHr9sx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbf1d8c-acfe-491b-dfa6-08dabdfd63d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2221.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 00:42:02.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY/iPDZJiqt1q3SKAQe1QmpkjcAT+jrq2UlvY9vDZ5f6yfa/PgRX/WhtvTFZiRMFkac5QkWF8HHCaFZ5Tqbm3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-de
 v@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 11:18:29PM +0000, Sean Christopherson wrote:
> 
>+	r = kvm_irqfd_init();
>+	if (r)
>+		goto err_irqfd;
>+
> 	r = kvm_async_pf_init();
> 	if (r)
>-		goto out_free_4;
>+		goto err_async_pf;
> 
> 	kvm_chardev_ops.owner = module;
> 
>@@ -5927,6 +5926,9 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
> 	kvm_vfio_ops_exit();
> err_vfio:
> 	kvm_async_pf_deinit();
>+err_async_pf:
>+	kvm_irqfd_exit();

>+err_irqfd:
> out_free_4:

Do you mind removing one of the two labels?
