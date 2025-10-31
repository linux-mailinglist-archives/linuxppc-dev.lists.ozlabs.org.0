Return-Path: <linuxppc-dev+bounces-13630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DDC23CCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 09:28:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyYz32VsNz2yqh;
	Fri, 31 Oct 2025 19:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761899311;
	cv=fail; b=eqyQEYN5zYMtgRWzJl3A9K66rVT2DsNvYyFAFjzWqqLXANxM32a0HJEPZcMZT8HDSaq/0kx7hGMTuOJzjCrZAaDx9bbvK1aajmO+A07NhAgOwYJyZ/Y3bZzFhKf1QOHa+nIz5JPjhZ+QL2Tdodn0zNFxkz/LHq5lmRDXOV3jLw3jctlgwFjGZKkEidbEJgKbUML3a1aADKShoxk+RrxJA/27FDa4viyHrPrpzxNtDAS5otHw+X8Txlercp/n3GGfanyZGV43PcjlCvZHMpPiIn/b60rarn2FJN/IL9W9VSmgcD0lMOFRpZ1U4R5ahcijFz0/+uZqkU84jvM8Zo2JhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761899311; c=relaxed/relaxed;
	bh=tGtyYigZDkABpi97+oP+IHR7pUTCRMifrbrAXJoA4Rs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Il1OLfA4+6SX4y+3RE86V1akaOeAYnrCS+f+3LN5LdEIMdhyvMSfjkp8YU+ZucSx2KsPxadLXOSxlyUSHHO1wIbP6PBYk81DWipjHAxxhQAIionJUI7W+pXmvpaL/ZiTwV+bAViaGtoBtGzBeKBEXMS5xRpbFba2Hwl7+/SRrVkBWhoho9cuqDNW+73bZ+k9VSLT4vOuBjuIXRWvG3dtNcZcIKamdngMIXS335gZ30QbUyUbSnxXXjYTKYNSpvh+vYECYyq2MrO+7Q70/KtcTNeZGxNkOwydfDSS6Ngmg12glag7NDvw9RlCTvkQhY0ey2rykDvW06z4hcR7Vxy3UQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGYNXg9K; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QGYNXg9K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyYz166qXz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 19:28:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761899310; x=1793435310;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=wrTvE02KVhRkFZHI4kWxXty2XqCcQnro9W6pPTtcJic=;
  b=QGYNXg9KeDmobzDw73dRUwDa1YmyQoUKFLKNaOMXkMVqJH4YDxq/d4xQ
   lislbDB6NCLvF8JdnC8WEWngHIlamrsmcKaTX5/3FadcHZdgQrb5pxv7q
   +jlCVSiIqD7tQKh1nzwKfAilWQVibvQrG1lQidMomowlErDThL01ccnkD
   1h+oi6tQ5llukRGazoTzBNhSidUh5jBGFlCgnYsnZkUoUmEg0WhTs0JPQ
   sOu4Z5nG0riB4gLdeS8Qhy1sj9rtkEwhXfjkb1C+nedblNP9L3xVgKOvl
   WjrLCusRBPIfg8hUJ+BOjnHpstpBjeM8LSkN5H3HlWV8GkIV7//88rp36
   Q==;
X-CSE-ConnectionGUID: AGQKo4PBRhe6YvHVTY9GCg==
X-CSE-MsgGUID: BOzjz2RVS+eNpAmDaDaAFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89519567"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="89519567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:28:28 -0700
X-CSE-ConnectionGUID: V706WCv8SJKEhjPy7crbog==
X-CSE-MsgGUID: vj+7hwDeTrOKmB9Rt6NzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190525913"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:28:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:28:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 01:28:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/1mKfd/q5MdSHapznqThOG8CIAMHLm7v0SoRmg/c0DeaaZVw9ZC7okRgCYlrr3WeLzVZScvGMjbF2tG0Fe8PaDcAawItQJkUY6J/CoS2JYQzS4sS9U8bV1h5zo7rhPpPE7k/6X+gxSvN2W8ncZ+MWPCNjUEpX/+qSDK1iCw2mzQdwD0QWPRncpaP6SG0AYe4Wi7rkbwzUfuFD+iP4kPoRAR9GjzV+g1BWGn5G2ITWZH6MGeRM+2iLPGQt3pQUNCF31Wo8UmAH7FLyAqIr3vWU2FYg5sDZAUD5b8zkPe5d9OdT3SVpC2I/PPjhqpFv8xIJFhlo3eB+OwT0U79vl2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGtyYigZDkABpi97+oP+IHR7pUTCRMifrbrAXJoA4Rs=;
 b=wDEBWxijXg0ME66Rqj1USWYF/8kmZYa9qoRlvVKuacuoCvdwCpZM/dOBln1QBZhAhxrl7AQlcy6Gs9fZOZ+9uDjCDza8kZhgNqzwJxjagRwjUJQg1pv/BcXUEwJkyQvj/8772YnPgIxS3JuwD5uoS5kz7g7EXU9mA01S1LJhgLImZ1VZH8k0t7dYLzMH3x2MCUOOa+fPujY/9UgfM30VpIRjnEqPX51iECUyKR6wtYhYe1/pDR6fPsknroGaMTfFqDvd7A7sUOb8ee+0zkou2hOLVocpimyONqjkg0OVfX2RAu4RGcKQNI78hZg++ynnNTXPReQhKpWTkCLctudQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 08:28:23 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:28:22 +0000
Date: Fri, 31 Oct 2025 16:26:50 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth
	<michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Ackerley Tng
	<ackerleytng@google.com>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Message-ID: <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-27-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030200951.3402865-27-seanjc@google.com>
X-ClientProxiedBy: SG2PR02CA0098.apcprd02.prod.outlook.com
 (2603:1096:4:92::14) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 51174476-778e-4900-0491-08de1857742e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ayDxdrcPenABoCNMzDNA8pITDpfhUBQ7+BBv2UDp1TOUEzZjEyPFEeM2Y3K?=
 =?us-ascii?Q?0OXXQTDtdTtjfylYLNw3NvlgYecKVEJ/J13AuTw+BkaDw2R3yiIagNGwtTeX?=
 =?us-ascii?Q?LvsORteInwyU3Ql6sAvtuPoZBkv+Wh3ggZz8SY2gb97vW26GNiTmyLLow6W8?=
 =?us-ascii?Q?brUb7ktYOk7rcC+vjmy8ThAfE2ZUHH+qYaXxr4mgvSgjLxrwJtSCUddcDclK?=
 =?us-ascii?Q?5FcvIa9b31v8EN0v7nvaE46nW+7+HkyRHa2vWtZIFO0G1JIXuMDHkv/8ON2y?=
 =?us-ascii?Q?EIhxwKLN+kWUAIJ+3D3KFIWPsCr5/cv0MD9bVQK4nXo0ycrrgC/fpMwGV9WY?=
 =?us-ascii?Q?Xc5V452vYoKCVSPRBeip2Ml4Bt36E46n6s1/DT2NIpQkjs19VwhL1iWL5Txx?=
 =?us-ascii?Q?xizYjNdGHY0v3cZ+Fg/SqqP/bfjtqhMIosmnoJXY8W263qR30JmjHmUDoyei?=
 =?us-ascii?Q?CuFu7imuc0GxPJ7lsgYdyX7RQB8O2n/keimkI2cZdjrnHz21Yr8s/hKGRtm6?=
 =?us-ascii?Q?pEukXiune/QXMGe3CtrvhNmgpihRaGmR7YK3F5wsr7mUfHdep9Dp57LuZCzs?=
 =?us-ascii?Q?AmhAkJEuSWAYswBDB85+UDIVfynLNKyHvMbWGU3neBXdii0sokTdUzujSvzY?=
 =?us-ascii?Q?91rHZK3/0fwvbN/uBp47ssAvX5alm6vCOZYgrBDR4jamt2EXh+dFy3lvN+YY?=
 =?us-ascii?Q?7WleAzMcvpzzqbmicAO5qPGzIrs6ajS7vBXDjBzck2slQHgQsnNCT2Cpby0J?=
 =?us-ascii?Q?iarRf+Wo7DdANRxtb50R2U2XgzZ/Fwyde+8C6rX5cUmEnbura52diSgh3Wc+?=
 =?us-ascii?Q?EN4CNkfijfEt1XV8z5BFG+1V08jFz12CE/ZwDhIyJAP08g2Dd0jlPtAR3Ocu?=
 =?us-ascii?Q?ArvmXhwFNQYnxzt39H2eJYN1+ZJnlqYrPikmBUxNb1EWOhQkyb/9FVSNiq3Z?=
 =?us-ascii?Q?YN43TlBhxB3zBcIGGcGvbqsOIV9maaHYy/nP6hfBYprr7m/dMC88m16AzZPE?=
 =?us-ascii?Q?K7SXooD3i74y22eQGJi+s2udr/pDha6vuDl0ByxL0epQTpCV170jcqerWa2L?=
 =?us-ascii?Q?NC11wPuUPPxhefYf4J7buvdpzSnF62/4f+s9pRAI8jx9e/e/O/LD7oFnI926?=
 =?us-ascii?Q?CS3291kimbdAnnCz7g5XKxDpI41xPoFycRh0wwCy3si1i9t8gAW28q1iYV/z?=
 =?us-ascii?Q?hl8QwLgGBn8v1qVRyrjL3BwySYfynHGWjRvc37SH8RlWk1wad1yEYBQh3E1w?=
 =?us-ascii?Q?XUCuttnWaXV/rtFZLyvXxFalNxUnDcjmC2/X9sKKBN4GLeVxTszH3nK5PQSu?=
 =?us-ascii?Q?T6Z6ePjM/RgmsnAP5llKTUecY71nTwk9OrGIGspel55ilQXcfvacaHddLPXI?=
 =?us-ascii?Q?V/nGpFeW2hcj4x3dds5VAmJQJQLDjSU5yJt3IYLLBtsby01edwwuxs5PVQuU?=
 =?us-ascii?Q?0eMtlaVZ4y4wH9Ihprjn5GdQbi63lPQJmJbEEn9Wsr82c3dkGP/khw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vijFV2csoHJIwiu+rtxCqYIVKNT4HGSxPUgE5nUG6L6YuePZ4ZK3yiACFyVk?=
 =?us-ascii?Q?DwphX5dcmt0s1xyUKPY9EQXhFLZCCLaAJ6gbpV4QtyZLRnyuBpMocIhNlbc1?=
 =?us-ascii?Q?odw3ExcqIc792VkTqnrO5xavUD/OMPXvNwmC4Hdixvqlr5MtTENRqDGxJkFv?=
 =?us-ascii?Q?0lz4nyKpJl6Hk0MRiZmV3lW+kLSBdOyPvv5xz3u3QzoY/0ha9h4J9VJjyrlZ?=
 =?us-ascii?Q?HaPU+MHnoB/9RRp0ml0c1v8Gql7tFeEss5lcEJzfW2k9G1P89hTrd+QpokeC?=
 =?us-ascii?Q?+qJ6XGVdrIA+O3npkBXnFdtEAjHe7qkIeuCl4sCyH4RLYoH2zAXGBSkyJSEs?=
 =?us-ascii?Q?1nvqVueJP6lsOVQZXuQAZ2nyRaxsR50dqisabCiO+HU1d0Q8CswHZDjJPHku?=
 =?us-ascii?Q?FaucEhJcNctkqfgR0vOkb53tUUOEG31hBHeHlDwzm9GJgXwhWBgdc7KhNmp1?=
 =?us-ascii?Q?haflS65/yOXiN4w2Q43DAQ1+thB/GXtXakqw5j8oeNNPFnTD2bwBHVWG3EWo?=
 =?us-ascii?Q?Ndkd+P+3/y7uq8w6cOrl4QZvUfZT2nDJbfJv/IXWWHjrHAqysSbled3o/Wwy?=
 =?us-ascii?Q?GBafaVmi3KTZv41uRqoj0fB7pQbcgqR5/DPH5PQJ7bHaBwBeYH+faP9ZvwZ4?=
 =?us-ascii?Q?WHsb41UH5a8k/LU7KaXv+VOfBSSics988ofall5/D4v0n1zcutLS7KYn6ZiO?=
 =?us-ascii?Q?evsBPs1xnLUOYhJGkby3+Ug3d0IaF5ZZLYYeMITZUODVxD/6B55ebc46dt5i?=
 =?us-ascii?Q?n2t6sLI2ANPDI2uaJXhVz57UN7D9qXML9qsuqzjNVRGUnN0ignCyZ7pW/+GF?=
 =?us-ascii?Q?s8Q8EqQghX6SKuWLw7wgDIBPcpyDAY8tALLCalGEqslR7xZ7P1YM0wc2zjmA?=
 =?us-ascii?Q?JIpQHzIlsibW4/ZGQiugRItkXyuQcjhhcVCbLrHhK7yEeM1z4Bk6JfilpRP4?=
 =?us-ascii?Q?k1wJgCpSvyvV1UK/7B5UFAJPvwydibodyfQT5TuyjFTJylHh3W1mvstyKmBK?=
 =?us-ascii?Q?RnO0W9O1oB1YNMWKDrkqrGesJkkWR2WWsvZgm9djI4rFbclHJhR2madjaE2p?=
 =?us-ascii?Q?irACzzklwFVGii+Q1/v2pBJGFRid1tIs+ol81b8Q7OjtP/9H30vNgCWfRWEA?=
 =?us-ascii?Q?aOpbeOHJuHKUjPkCS3jS0StXplNuga9aXh+h3+fp90WH3+a6jRt2LtSqBxYX?=
 =?us-ascii?Q?zxZ4SeWgyr5nvsgvJATJrjQRv5fmjIIQKUKXIvqQlmyMRQ+pMX0Z4/FU8cli?=
 =?us-ascii?Q?7XHOfsuLAX40e9a3+tX8D7iCQ4VQrFi57EHj8Jqj/tDVJRZSDZbc4/LGiVeO?=
 =?us-ascii?Q?6ECFWZESh9sfYiFbf8Ls36iLvL6lBuXlQ8XXQngK0IuYzPGnsmyKN1mbslM0?=
 =?us-ascii?Q?HYTqqdqaEgnu2LkxXooCXxFAdTKtuKagoEH5W290DNLx/vB0BtEpX9Ty5MZr?=
 =?us-ascii?Q?qedC6ncCOHVFn0A+tzkC1pqZb3qdd5Z4YrL1n7pmFn5jGiCsX/IqkM+sUtx5?=
 =?us-ascii?Q?Ql/fI8E7rbfY9ErXdRpqFmNLCJJWECEx1xSAGXjFpePz1nC0nG9BBDsrsZFc?=
 =?us-ascii?Q?JYldg5lBp/BVclP1utJmmxqkFx9zr1jhE//yFt/u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51174476-778e-4900-0491-08de1857742e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:28:22.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE99OatMz/bDfpAG0uURF6KfV7eOwCzgwOl9hObciQ8/A5uCV8tj0gLyALArMyPqNtd100T3zSAyc3VaoAgomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 30, 2025 at 01:09:49PM -0700, Sean Christopherson wrote:
> Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> servicing ioctls that (a) transition the TD to a new state, i.e. when
> doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> due to racing actions, e.g. if tdh_vp_create() contends with either
> tdh_mr_extend() or tdh_mr_finalize().
> 
> For all intents and purposes, the paths in question are fully serialized,
> i.e. there's no reason to try and allow anything remotely interesting to
> happen.  Smack 'em with a big hammer instead of trying to be "nice".
> 
> Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
s/kvm_mmu_zap_all_fast/kvm_mmu_zap_memslot

> from interefering.  Use the recently-renamed kvm_arch_vcpu_unlocked_ioctl()
> to service the vCPU-scoped ioctls to avoid a lock inversion problem, e.g.
> due to taking vcpu->mutex outside kvm->lock.
> 
> See also commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
> migration if vCPU creation is in-flight"), which fixed a similar bug with
> SEV intra-host migration where an in-flight vCPU creation could race with
> a VM-wide state transition.
> 
> Define a fancy new CLASS to handle the lock+check => unlock logic with
> guard()-like syntax:
> 
>         CLASS(tdx_vm_state_guard, guard)(kvm);
>         if (IS_ERR(guard))
>                 return PTR_ERR(guard);
> 
> to simplify juggling the many locks.
> 
> Note!  Take kvm->slots_lock *after* all vcpu->mutex locks, as per KVM's
> soon-to-be-documented lock ordering rules[1].
> 
> Link: https://lore.kernel.org/all/20251016235538.171962-1-seanjc@google.com [1]
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Closes: https://lore.kernel.org/all/aLFiPq1smdzN3Ary@yzhao56-desk.sh.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 59 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 57dfddd2a6cf..8bcdec049ac6 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2653,6 +2653,46 @@ static int tdx_read_cpuid(struct kvm_vcpu *vcpu, u32 leaf, u32 sub_leaf,
>  	return -EIO;
>  }
>  
> +typedef void *tdx_vm_state_guard_t;
> +
> +static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
> +{
> +	int r;
> +
> +	mutex_lock(&kvm->lock);
> +
> +	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
> +		r = -EBUSY;
> +		goto out_err;
> +	}
> +
> +	r = kvm_lock_all_vcpus(kvm);
> +	if (r)
> +		goto out_err;
> +
> +	/*
> +	 * Note the unintuitive ordering!  vcpu->mutex must be taken outside
> +	 * kvm->slots_lock!
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +	return kvm;
> +
> +out_err:
> +	mutex_unlock(&kvm->lock);
> +	return ERR_PTR(r);
> +}
> +
> +static void tdx_release_vm_state_locks(struct kvm *kvm)
> +{
> +	mutex_unlock(&kvm->slots_lock);
> +	kvm_unlock_all_vcpus(kvm);
> +	mutex_unlock(&kvm->lock);
> +}
> +
> +DEFINE_CLASS(tdx_vm_state_guard, tdx_vm_state_guard_t,
> +	     if (!IS_ERR(_T)) tdx_release_vm_state_locks(_T),
> +	     tdx_acquire_vm_state_locks(kvm), struct kvm *kvm);
> +
>  static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
>  {
>  	struct kvm_tdx_init_vm __user *user_data = u64_to_user_ptr(cmd->data);
> @@ -2764,8 +2804,6 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
>  {
>  	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
>  
> -	guard(mutex)(&kvm->slots_lock);
> -
>  	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
>  
> @@ -2809,7 +2847,9 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
>  	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
>  		return tdx_get_capabilities(&tdx_cmd);
>  
> -	guard(mutex)(&kvm->lock);
> +	CLASS(tdx_vm_state_guard, guard)(kvm);
> +	if (IS_ERR(guard))
> +		return PTR_ERR(guard);
>  
>  	switch (tdx_cmd.id) {
>  	case KVM_TDX_INIT_VM:
> @@ -3113,8 +3153,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>  	if (tdx->state != VCPU_TD_STATE_INITIALIZED)
>  		return -EINVAL;
>  
> -	guard(mutex)(&kvm->slots_lock);
> -
>  	/* Once TD is finalized, the initial guest memory is fixed. */
>  	if (kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
> @@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>  
>  int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  {
> -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
reverse xmas tree ?

>  	struct kvm_tdx_cmd cmd;
>  	int r;
>  
> @@ -3178,12 +3217,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  	if (r)
>  		return r;
>  
> +	CLASS(tdx_vm_state_guard, guard)(kvm);
> +	if (IS_ERR(guard))
> +		return PTR_ERR(guard);
> +
>  	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
>  
> -	if (mutex_lock_killable(&vcpu->mutex))
> -		return -EINTR;
> -
>  	vcpu_load(vcpu);
>  
>  	switch (cmd.id) {
> @@ -3200,7 +3240,6 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  
>  	vcpu_put(vcpu);
>  
> -	mutex_unlock(&vcpu->mutex);
>  	return r;
>  }
>  
> -- 
> 2.51.1.930.gacf6e81ea2-goog
> 

