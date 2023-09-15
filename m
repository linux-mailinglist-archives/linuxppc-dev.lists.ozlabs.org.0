Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D557A16C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:02:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wkyd5EMl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn4r46JtVz3bZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 17:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wkyd5EMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Fri, 15 Sep 2023 17:01:24 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn4q80mfyz3c60
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:01:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694761284; x=1726297284;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=M9GjEY03fiX8KCiHZYYoK8RDlfaIcSXwjSnIoXGA9B0=;
  b=Wkyd5EMlWM/bERkleps6/vWWL/+XrhRcIoc72cudmh0w3TBdDuRD92bP
   TKhv22yFqqDEN8RXZYlqvbQuzE4TE8pYOM73e8rAeN7jsZqs8oAZDEOkD
   mEDBTsJU8BaZp+cEW2K5iqHk45EiQ0/zn6BLgAb2IMsD8bDf4TtDQHDFL
   e1sdhpgPjvM6OSGLrTXuxTj+R6N2EGu3VdcDE2albygUu+1kN0nnJspKc
   7Fxhj4i3sBsedvtMZsbFsGaopGrJxhW35vvHjB2rdbHOnnCaEQiZwpm4S
   /RHvVkIcXJ36xZVbHv3hs3k7Nq/XjSt/JURnSv826LKkiCUOs1D0glJGC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376516863"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="376516863"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991735383"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="991735383"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Sep 2023 00:00:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 00:00:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 00:00:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 00:00:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 00:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hr5wmzI0XkgBmwYmMcO3hykqhVemAjzZovt8sg8PZveqmI75Fg/g2mYsA9p79E6dz034XQZJLYZtHJQ4/iXNIiqrukfHkda3dgEK+WN8WUhGnaeCrO+qUULyI+Qk3JL0i/C70VxTkiJi5cXLojEfbOsYMhhGuaPfZSLmJKw9KiXwLk93FTvAB9LmPHUbUWcAIZAha0Cz7GyUpMeuyscwjmaX2+wYlnUncuJuKHX0YFhRrkvKxs/UpianhxzrVmQGtcOKhAS3g00i7x2WiqgvACFCI64I+puRFjtrlS+OC3MZ9Rh8QMeUrn+DG6WT9va3+YW9CFZ6TqtxXzzSmen6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBtuz6enzGqcqo0B/WUQJ5kcTFtSVAZy38ivF/2KSJo=;
 b=KNiVtyOVrTw0zRSlye1uOlomByDpzvNtXNjrInEflsGY+iE1bgs+cBKQ56CRB8lDjx3XLFPCKjVr/DACQKH8HZtuGoIoWrXn261roNDvEJLdIO7s7tcyWH2La6NdUyuLh8O4P+Eq3ZMzA4Lg/DJMi3OV4Y/JHdJ6jCLEsZGDRYYw2+0NlpIVR09nqUQTJ3xHCAo6U8K1yKG1va7bbP980K5+pdFHgIVK4yo0XRO1GHgDf+mQr8YrY2LTlYluRSrg7AcJDVw8FodAoWvEPYn8L1bNf5K013fNd/BC3i2EhMu6jcBLb6kl5y/RWsOmVW/23ZFuteoY7r9O6wYdexYkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MN0PR11MB6181.namprd11.prod.outlook.com (2603:10b6:208:3c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 07:00:08 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::5e79:2d52:51e:f602]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::5e79:2d52:51e:f602%6]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 07:00:07 +0000
Date: Fri, 15 Sep 2023 14:32:06 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
Message-ID: <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914015531.1419405-12-seanjc@google.com>
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MN0PR11MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 4301786c-6c79-4955-7eee-08dbb5b9653e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pAyYfDDNw0hfV7ILb2mMMJitM8RhBJAsF/lboEXMiHuQPiAn6mvGwke/qaCIAOX6MiOtoz2ZDjrLiMc5D2nuL4eSTQr1be44ydcJi5VlD/IzT48+51OQG/lI6gV1bhrIBup9hyuBlhP0fauOAXC7rd2CddOx8DkcYZlCawY0m/kPFXGoZlmwAdSIt8Ctk1ReL3nijKRGZTaUjYAc9o+mPP9f6HzQ2XwJfq6tJuEx6gLErrVuoc3PuTC6QumHqeo2Psxo+IVqyMVXGeY+S1GFpPeaBLj+gbovCIiXLvmRh3rUyeKiOPpzl9TZ0qHtvayIqCy3htEIPH1yfBJqnGS0Zf4ECcApsep5DIuzqS74qc0vo4xxPpeEsPAte62Ia3uvoqSJweQQavRrDLUgO+EnQhXAPhPqKarGK8PHEfFLWUbaMuBvaIQikQuwqcAUlcp4ntuFAI8x5MbxFbPN6wtgJBBPCjdPaONznnnSh1zO5qoErMbKDdBV6sZi+TIQU1nStN7Wpffklnxtclmu2CbTMEoCAhsugxldikH7/ZwkQEsWed06kVriGJ/hOJcsei/B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199024)(1800799009)(186009)(7416002)(2906002)(7406005)(8676002)(5660300002)(41300700001)(4326008)(3450700001)(478600001)(8936002)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(6512007)(6486002)(6506007)(26005)(66899024)(38100700002)(82960400001)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJ/xVeZqbZbggo9Tjs7RGGngV/kc34E/K19QCIH+UGGk5dpgfayBtzcjmJ4J?=
 =?us-ascii?Q?hRi1GfByQ1/sMkhg6cmDG+BTAKhq8vW91KaYutCDfTswfsJnddx9VO77Hh7t?=
 =?us-ascii?Q?QyPHP4ZWHpibXQOyXYjzbDsrYANxr4chxgM5mfpE30OJgDRI90dduk/RLCKi?=
 =?us-ascii?Q?IkQbRUVAcM8gADdin2olj3dNhwsajzgipHF73IzcxqR20IheDX9X2GXwbwuO?=
 =?us-ascii?Q?i3hBEE4XgUmrM8WReHqBvGkd6X9nCVocugi3lvwzIxvjvONUNa/40rafY5S9?=
 =?us-ascii?Q?SalJlqw8/P5romUexK1UmWcDiA2swyUJcHteFRYZ4d9abFEe7lXgSV13Zes9?=
 =?us-ascii?Q?zTZp6j/6+CHpD2UqT+bAkNYty0YsD7B6R1my65uOvawNRuGOIwNycd2F3kAq?=
 =?us-ascii?Q?rq0QGiBFO9l8iA+OQq3F3UNwctlU9VDclNGbbqhT9/Uv1ZvtPA7z4xIEVnQ9?=
 =?us-ascii?Q?A8eKLE0qxdY2tKmGvyc542vKf09m7/G+wBz++BUIYnwAPnUOh+CDV/ztT9u+?=
 =?us-ascii?Q?l5DTQlJEuJkxVSuNQrHbPPlYfybEFFfCgLyC/s7LuH6sqcqyxGdFdyLUxAIZ?=
 =?us-ascii?Q?XPDP8WXodLSJe0BglSVXBKpy3FZqwLO2HWneojBUqi15LOuC+iPytv8m880I?=
 =?us-ascii?Q?rKQbv8icrfRO7oy+7d9WIBGQq8TPuLc5q0FsjijQdkHaPWgIZoNFhfbgI0Ky?=
 =?us-ascii?Q?HP6npdAskBi2gWlWN/q2Im0l/zJGcAKx5PwoUapGiPE2eX65o4cEZ11Xa0fB?=
 =?us-ascii?Q?Xsb1ezRkkBK707Joek3uTdslbvmwDcpizUusZrWkptrfZd19eaz9opUTLOYO?=
 =?us-ascii?Q?rij46Yftz0JgKKZJECHYZmz7KX8GaLJHylr7dMnD7gjt6C/SGBEWEZHMy2hR?=
 =?us-ascii?Q?dIv8TCQaT0P3yd9aXo2rIbQOSA+P29YuKdHdRfwJZrti+ljZk21qT9tm2ENe?=
 =?us-ascii?Q?xvP1TD+XYgaRR+QzwzgLOxeL7yQiPf17bddTXGT/Ca8CNpJvNzKCcoNZoWyy?=
 =?us-ascii?Q?VhV00fbREkQO0JeRGYGF1j8lxV/UGA+w73Kjq0mmNFK4NPC1witSsDXCFPHS?=
 =?us-ascii?Q?7uiM8h7EEGODBbI7ZPPp0ZazgSOx30I+5d629+ArKktv3epC+Ik+pNpsoeNA?=
 =?us-ascii?Q?lgM32FbKW2W39nFBpDJoiTuIp+P1WSyzFMEm5UeDv5cSi20iNlfs4h7eOutX?=
 =?us-ascii?Q?eM8ysPAGfz8BoLkxfy9LYzIk477LKR+clYWXEeWZiZBfBh/VfuYnbgAnFuke?=
 =?us-ascii?Q?V6ZrlBvq4xsUkiPmhFcuF8WY4J61Z8IEUGp2ySvOguTd/+gWHTTryyFUNR9n?=
 =?us-ascii?Q?WaoEA8wikUm3FBgNXEeSAOOD4mgt04s9dZnjJpMQamfQXDn0d63XigeZGCwn?=
 =?us-ascii?Q?Qk8RwMbE/ZOEoOYW9NvF+/wUlJ9pWXAukTa7aaqxiW+Cbfhv8/JljPma2pdC?=
 =?us-ascii?Q?e4e/vL/QRFuhRXYVtqUdYCNaFyFd+UoNs7zqQTkIxv7C8vnb4TTD7JgNi5z2?=
 =?us-ascii?Q?zvwtr1g1lY/WgjCIRd47Hz6HxzGvuvJmKUnVHM4v9k7J1wXoTBFA9iNKJd0v?=
 =?us-ascii?Q?lgCVoW/Wo06h+F5JzTn96s4nfYvQFOAV48BiBITy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4301786c-6c79-4955-7eee-08dbb5b9653e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:00:07.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m06sK2+7ALEC7pkBv7zLGGHvlo71jRH/OwYBkf30C9UZOGi4hGOe5o2sCizMV6ce4HTBpLdB/ZGyMmYQnsLmJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6181
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@orac
 le.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill
 A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> In confidential computing usages, whether a page is private or shared is
> necessary information for KVM to perform operations like page fault
> handling, page zapping etc. There are other potential use cases for
> per-page memory attributes, e.g. to make memory read-only (or no-exec,
> or exec-only, etc.) without having to modify memslots.
> 
...
>> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +				     unsigned long attrs)
> +{
> +	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	unsigned long index;
> +	bool has_attrs;
> +	void *entry;
> +
> +	rcu_read_lock();
> +
> +	if (!attrs) {
> +		has_attrs = !xas_find(&xas, end);
> +		goto out;
> +	}
> +
> +	has_attrs = true;
> +	for (index = start; index < end; index++) {
> +		do {
> +			entry = xas_next(&xas);
> +		} while (xas_retry(&xas, entry));
> +
> +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
Should "xa_to_value(entry) != attrs" be "!(xa_to_value(entry) & attrs)" ?

> +			has_attrs = false;
> +			break;
> +		}
> +	}
> +
> +out:
> +	rcu_read_unlock();
> +	return has_attrs;
> +}
> +
...
> +/* Set @attributes for the gfn range [@start, @end). */
> +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +				     unsigned long attributes)
> +{
> +	struct kvm_mmu_notifier_range pre_set_range = {
> +		.start = start,
> +		.end = end,
> +		.handler = kvm_arch_pre_set_memory_attributes,
> +		.on_lock = kvm_mmu_invalidate_begin,
> +		.flush_on_ret = true,
> +		.may_block = true,
> +	};
> +	struct kvm_mmu_notifier_range post_set_range = {
> +		.start = start,
> +		.end = end,
> +		.arg.attributes = attributes,
> +		.handler = kvm_arch_post_set_memory_attributes,
> +		.on_lock = kvm_mmu_invalidate_end,
> +		.may_block = true,
> +	};
> +	unsigned long i;
> +	void *entry;
> +	int r = 0;
> +
> +	entry = attributes ? xa_mk_value(attributes) : NULL;
Also here, do we need to get existing attributes of a GFN first ?

> +	mutex_lock(&kvm->slots_lock);
> +
> +	/* Nothing to do if the entire range as the desired attributes. */
> +	if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
> +		goto out_unlock;
> +
> +	/*
> +	 * Reserve memory ahead of time to avoid having to deal with failures
> +	 * partway through setting the new attributes.
> +	 */
> +	for (i = start; i < end; i++) {
> +		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
> +		if (r)
> +			goto out_unlock;
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &pre_set_range);
> +
> +	for (i = start; i < end; i++) {
> +		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +				    GFP_KERNEL_ACCOUNT));
> +		KVM_BUG_ON(r, kvm);
> +	}
> +
> +	kvm_handle_gfn_range(kvm, &post_set_range);
> +
> +out_unlock:
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	return r;
> +}
 
