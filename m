Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25375C80D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:42:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kmnWQwXb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6rMM11Khz3cbP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 23:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kmnWQwXb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6gHl28j7z30hW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 16:53:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689922403; x=1721458403;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=yUQll0rK4kVTUGOeG0Yh0uOwjDQL88UV6m+/2FtQqVI=;
  b=kmnWQwXbgJ6zI7qvk3+4t8uFbSoW3LAxxLV+LxBol8pX9gZ7OPGZ0X3G
   y6kOKf97O4WgN2hA8dCFWuj1upaL/2/6emp1lOImAV1gTrtzTNe4gfHvC
   7qLlLOT8bxg6v7UpOaQH0HzqXhVAm1fm8X4yFyfqbIaa2BDKEWS72g50O
   CxSToxTOcpMlwPJicvv15U6P3Q+ax44HFLzPxfxbnUn+ouj5Tm/q8hFrs
   AobAcH1GwPeTAfB7wVSukJA3tWw57NbKaY71v8+y4HuL0UICxAchMN0EW
   4ecqW5+k5C+iAZh3K53yFlSxVIJ4lMYbDL6sNXw03cSpafC3NLKRZfFDr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356939374"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="356939374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 23:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814844557"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="814844557"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 23:53:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 23:53:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 23:53:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 23:53:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 23:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0qzjW5tqHXsQXnvBpV4ekR2SPY/BCYQ7pDxaJ7kDCxX94oKuBcCTEddxFVjL1ceuRuC8I00MLgqQs7iY9MpwPnonPXA4NQPIzmsQNeUEPsfWtz4DYBR7aBnR9vp55ZCfZd6Qs2v6rYPZjMj60zrNVfiwK1Kf01x8rPw7RPSOip4ToQD7WbWwXnL1StP+/0Q6Mk9J2nPXvlYI2oTa1XpWUp0BFP8lgD9uytAq0vQvMQ+udzUe26SR+gvZ27huSMrUbkU21ph5lKGHLNZtOUhvG+U9Lr6+FiN0wC/8+oHDXuTPjqEoJm1atSjeSiKteTxlWSBBX8dRXdQRMn3xdASMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnG3RxIBu4FDgBaLRsmAkxiC0xAWcmlPyisYnsYn2vA=;
 b=FfS90Tq0i+SpWMEQQ7yLDUJ3gg7G4FJpTbwPgHESJG7vTcMM0CpTRak8Uk/xm/8TcLC+L2VCAWqmrBgBsKjDIHQOYORl1T/9oI5SbCtsf0VBWCP2HeItwT8lbL6BBBR2WWTpqgFhavzMMa8RsA3my0lKXUKSfEv6Pb+sgrEPEzzTFZo+fR87leQ3gUDNfKYfSuAbSFyMpcP6wcPo7U2OO9P2clKjLwF3Y+TF6P2Tmb+P4dytDSu1QiU4+steA8b8r2/u/9hDro7U0Rt9MkJZRxmk1NA+le/YwvC6SI4bzB5ecZY7If1PgUvQeU5xWitMrlO++oBuG3HO8QTOFoBzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33; Fri, 21 Jul 2023 06:53:05 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::1b1a:af8e:7514:6f63]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::1b1a:af8e:7514:6f63%2]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 06:53:05 +0000
Date: Fri, 21 Jul 2023 14:26:11 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
Message-ID: <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-2-seanjc@google.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: c77e5cb2-7609-40a6-f648-08db89b7223d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7ZrPuq/t8u9S6s3ZFloJHsv1ZSMD9HWXazxoyuk7vp5WIA/108qZSaPRrsek++nr4LOEsfSgNSx6qMS3KYroAx8yMBYrs5rfc5LC4FaJfei5+bv0lQPlxa2ClmQV+H8iC8Z+7E2EXE+/Q2KxhawT70iOPiZG+VyJZEiigkPv16U71ExaxeOpKXDjEeU7XMsqUtoPk5EV5tE97m31SQ/G4qkv62VyiYkrZ+vtKw4AvwgDMWZbFG7Pry54YNC4i1NnGWpqFwAkbRtMDbvBqPcJMVzfr//wIDLk94LgWANyxFvzeeuJkyaVFrcOAaoJQgbk94QwXdJ6HJUp7Ry9MUsy/Mx6zUkz7fLLg42aR+a+JJIDbw5iL4F5lczxJEycZILBMC/ueWq9ToC78/rIyUQNYrMUDIPybJLdf+8BlvuurlAIEbvezRUpYVXQlAXPUvfebKy5oxm3ATMy9O9N7Vtv6xkCa6O9ml3nqnZ+ZQ6MK67xXtjG/z3849WqVb8/VClY83u4Dbhsw6xHuIqA5v4KJSyhp5KwH3gOWMrxO8GduMY6/V6BYaPV72nABBbUsew
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(316002)(41300700001)(66476007)(4326008)(6916009)(66946007)(5660300002)(66556008)(8936002)(8676002)(83380400001)(86362001)(82960400001)(38100700002)(186003)(26005)(6486002)(6506007)(6512007)(54906003)(478600001)(6666004)(7416002)(7406005)(3450700001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KaJlyRrhVeycil3x3jf/U+nArDb5ZDTUauKs8xWe+esL3seYWnNPUeq2SsxE?=
 =?us-ascii?Q?O28MX2kFSy+yQT/TbzQQyRo/7JFRUYD0KseWVxgbLVf+af+ctIesne6r0WUF?=
 =?us-ascii?Q?5DklqK/K6eUWWrgaO2OUlYZDFRk8eIpMCrePVwMM6mmQnxWheOR3xxnyz2OW?=
 =?us-ascii?Q?UStN5amunf7VTXPTji5lLwpoZ+PvCSB2DxY0yp7XHQCN2Rk1OdAlThR5tLjM?=
 =?us-ascii?Q?+m2ITHT1p3oKKnb80wCm85qM87qnkVj2F3YtCA2nPhfhMmK64tjC1aZJNRVy?=
 =?us-ascii?Q?xCfkbIWPAFypHMxCyxYhD8CLa3UCWP4ZdANUiK+nRiMo91LUjU8iOX1vOycb?=
 =?us-ascii?Q?VqH3mGROJ3ZYXjj4VJqNv5mlyNvjr5Zs+tG6b46WRF129jffz+tCwhNF6n7z?=
 =?us-ascii?Q?fajcV3+ZXWuCKPfqTPTmQx7BVHIgYloYe1RjVWuXGaAguiLdkt5+5rvQ9mBz?=
 =?us-ascii?Q?I6RPZ0e4Il1VGMxlzOUnuRvPho6FO3i4FR8bCFj3d+Q5qRDslU5sLrOX7tmQ?=
 =?us-ascii?Q?HsofE2ouhIZMikACNsj8xNzeznQE2+rxpv8WkZyhmehBZ4ieStuuWjdMfhco?=
 =?us-ascii?Q?ZJ5zcxNTsUVQOP6h4eUQbiTWGyXOk65IOD6H2fbJagBITNS9vVicddOGFXlf?=
 =?us-ascii?Q?qA1TgKja4a/opqxz02vrW7dqkKuc1XeCqVjb4ZTbftG0sH/Ek+GyJ3Cl7iiR?=
 =?us-ascii?Q?gWQyMFje6kpixNdiDUg06tgSmyEWY3+EkWdF+7Oc3fAnzbg6tf3oeTvoZuJl?=
 =?us-ascii?Q?dlyxy6a7wphx9PLK6JFhhLzr65bsauOFzoauJasu5mllfyy37noAPsPjapIS?=
 =?us-ascii?Q?4nxxDe5JHrEMFEcGS1DOI5X69Nm9dwEscWYANk8RmqeuSjxgeZU7CA5H/jJq?=
 =?us-ascii?Q?FwNn4OlvWSsBR1eWnXx6FW/7CagN4P1zJW0ev+16W1R0QKjKSPjs9J20yA2B?=
 =?us-ascii?Q?MSprym8bPYz7v8uhgawC3B8ABLM9gDnExpQ37kEzBi9w304ca/iSWmrG/z7b?=
 =?us-ascii?Q?XYZbjRqKavrjDzFlBooIwOq4nnxpZT54ITX+43wb9CapDpQE6ZFIhQSKfMeL?=
 =?us-ascii?Q?4qqv8JYIDimdzV2axdVeH7c77cD7sUGw+6BlK5+qDIe11MGrCMXj07zdKkVs?=
 =?us-ascii?Q?vVbR462LhhHvqpstDjK1Rw+mZPwBh8kCW+gCP9LK/JtcUji/RcHMl4YmH0aj?=
 =?us-ascii?Q?I0Ek5vvU0I6EVS5ZPQGEBIeC3ohNAZYau7r7xFYxW5EG/PI/AS3dA0g44X4h?=
 =?us-ascii?Q?aGCiAZp6mxDDo414H38hai0FRmRnl96Y9GYaixqGHxkrCNo2pbHiaiR/dPK0?=
 =?us-ascii?Q?Lg0LTxUBMBGyv8nACo/5EbdARbxNkCsyqvZBi+cBunz/rI4eCPRTFqakfqBq?=
 =?us-ascii?Q?ikdjBS7qoeW03p5Fpyxea6G5xe6zZkGEbhN5moiFfFauZD0JaBQG1kvRws26?=
 =?us-ascii?Q?zaLYNlr/bdcAD1Sp7m/Qf7XeXe7habhBXwM7iZmRAmLX+cBQeCIjiGQ6zQqn?=
 =?us-ascii?Q?u0FdlX8sqEdYw4gxjp7dZT1caDxZv+Y9AEzj/ReLZ3BCIdl3arQFDF92Qmb4?=
 =?us-ascii?Q?/LI9v+vhoWIu0ypINL7yGwA+1dKcbCYSVew6blyw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c77e5cb2-7609-40a6-f648-08db89b7223d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:53:05.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11A/t73+MtHjI1DmiWdfFNCyCvQA6+ZPQsGyWShXcP5qyJC+ReyKxp/Cmp/689nC/pVCfm9RN77/PO/kOkz1IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 21 Jul 2023 23:38:36 +1000
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku
 Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@re
 dhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:

May I know why KVM now needs to register to callback .change_pte()?
As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
surrounded by .invalidate_range_{start,end}().

While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
to zap all leaf SPTEs, and page fault path will not install new SPTEs
successfully before kvm_mmu_notifier_invalidate_range_end(),
kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
update PFN.

Or could we just delete completely
"kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);"
from kvm_mmu_notifier_change_pte() ?

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6db9ef288ec3..55f03a68f1cd 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1721,7 +1721,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -	kvm_pfn_t pfn = pte_pfn(range->pte);
> +	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
>  
>  	if (!kvm->arch.mmu.pgt)
>  		return false;
> diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
> index e8c08988ed37..7b2ac1319d70 100644
> --- a/arch/mips/kvm/mmu.c
> +++ b/arch/mips/kvm/mmu.c
> @@ -447,7 +447,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	gpa_t gpa = range->start << PAGE_SHIFT;
> -	pte_t hva_pte = range->pte;
> +	pte_t hva_pte = range->arg.pte;
>  	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
>  	pte_t old_pte;
>  
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index f2eb47925806..857f4312b0f8 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -559,7 +559,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	int ret;
> -	kvm_pfn_t pfn = pte_pfn(range->pte);
> +	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
>  
>  	if (!kvm->arch.pgd)
>  		return false;
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..d72f2b20f430 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1588,7 +1588,7 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
>  	for_each_slot_rmap_range(range->slot, PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL,
>  				 range->start, range->end - 1, &iterator)
>  		ret |= handler(kvm, iterator.rmap, range->slot, iterator.gfn,
> -			       iterator.level, range->pte);
> +			       iterator.level, range->arg.pte);
>  
>  	return ret;
>  }
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 512163d52194..6250bd3d20c1 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -1241,7 +1241,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
>  	u64 new_spte;
>  
>  	/* Huge pages aren't expected to be modified without first being zapped. */
> -	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
> +	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);
>  
>  	if (iter->level != PG_LEVEL_4K ||
>  	    !is_shadow_present_pte(iter->old_spte))
> @@ -1255,9 +1255,9 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
>  	 */
>  	tdp_mmu_iter_set_spte(kvm, iter, 0);
>  
> -	if (!pte_write(range->pte)) {
> +	if (!pte_write(range->arg.pte)) {
>  		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
> -								  pte_pfn(range->pte));
> +								  pte_pfn(range->arg.pte));
>  
>  		tdp_mmu_iter_set_spte(kvm, iter, new_spte);
>  	}
 
