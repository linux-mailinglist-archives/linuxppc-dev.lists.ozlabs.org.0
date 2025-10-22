Return-Path: <linuxppc-dev+bounces-13140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BBBFAC96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs1xX2Xqdz30Ff;
	Wed, 22 Oct 2025 19:08:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761120480;
	cv=fail; b=bojip0KPNIbPvhVpaR3SSFVBrPbz+QhQd+CMqt86AMIWBaR+21HElI70mZHP95KM+PGG/id+ZZhsp5s1WyJc2hUrCUNRxI5hnTYK9O5/woAdEIch3kMaLVVSFjFnUClCHuU2AQoSrHnuA8CQQD6Pp19noA8qPGLalDCSVZHEkPdb+iY6AGDJflgrY89R/T4djL/4FaSYMN0yV1udHOZh0DGNa7MLLWwKgKN6wf7i5udATF1rHI6cNb01Yhfpy2qFdEAGEAa0D4QAr4LaVuHOzcDtEspvNMZpYcrY1fiB9cNmnnaGRxySFx2tCOtkTqKfLa6oZVJXpVTv5YKfTkMNEw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761120480; c=relaxed/relaxed;
	bh=IHSRwHbsN2R/vOrKrGGVn5R6vWbpAhtNMKc/JIu5aQ0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFCSdHZfEOV2vVg64KY71yUGaVCLbc+lNy8wmvvGUhAAkIRLctjnC7Yg8qkWzCBctCEO4DUgqADOn5BUtydES/jUtOQ0D7ezGRa2CWJwu54+RjqaxzwQg0bxDYRixm56Ou1aFkHaTPxtmjMaIrmK1y1yLrGsCkCqYTojsHKIVJHYo9RlF6qiNOHJCwpKrguiPYu8jT2jBngmpuZVNKWSl3ZQKrHy39y4/916agyb/eRrXjZEeh0vowKI5RJlmfg48oMTDvymZtm3O7cNfBq4qew8lxhMPxXZtVsIyk6GDlrOMm4WGC+KE33tXpiWQV4NodhtCMnCpgFKHTXMsm0rIw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y5sU8h8f; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y5sU8h8f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs1xT2vRfz2yjx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:07:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761120478; x=1792656478;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=pczPPfLH4WylHGx1Ac3jdCIygm3mtg/ZBngBtW0Pxw4=;
  b=Y5sU8h8fzPWJovkm2iEry+mAv4TLB7ga2E5CtpH+9W5+HuJ9Rjl3MG8z
   vYDiBfO6ERgZuEwOPEEQI2o9DOliF2APo3XvM6sItxkHgTAZuevQ/xy/w
   dgBh+SMIzSQnpnqu+QnTxui0u7VeDNFrWRhyPj45Fnv15Z1KR+DB0CPkF
   H8WyE3Y1sipnTBIL90ul+EZkEOsPq3v0DrSMywRhMw9XSTC77l2XJYWEY
   nKtTIeSb4rhm1oi3dMe9vQ6BPMJLlTgverMnSnS6E3RlFIRK7dZCXc6Nw
   HWR6lpnQ0ViZSGBtEPu4LCORcIteXXpmV3s0NxZtIBBTv2nNuyPA+F3sY
   w==;
X-CSE-ConnectionGUID: 42Ae1lcLT7+BlxE/SrfOYQ==
X-CSE-MsgGUID: 1dOv4hgTTJO4+M9PcOrJtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73865860"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73865860"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:07:53 -0700
X-CSE-ConnectionGUID: Kz0PRg7sQbmCN6HP73cqCg==
X-CSE-MsgGUID: OSIgGejKS06FNNRJu6Rf7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184292889"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:07:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:07:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 01:07:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 01:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfdDAuU3cfXwkaBy8BtSS+i9pyyM/77sg7RNUSjVWDe8sVegGBt5jtF45B8QEkoSmn5QcRQMl5PjGE7w3eIu1xnwQURcmofF6y2FXysP6ZbSWyJfmxtbQmxjTGw4cXpIbDlSXtu7rmnadp/h+iIqYI9vyAdfImrXZOn0hJ+yhUJIagR8YqzCH22K6gd5rcTrxm5R6mvZGZEpu4GYIQxYZtnIKWF0LfvCztYWcB+RNEdm64xNQgcIwUCWlieWkCJ8dlGMvA12hxUNE3MGwIep588LQAtprIfO/ZTrS8QplAicVkkH0GCFG1SThrAXPUiFQd1mAV3pfCVesUVIiLbOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHSRwHbsN2R/vOrKrGGVn5R6vWbpAhtNMKc/JIu5aQ0=;
 b=LjWSuI2Petn4QAacrUj98JrA0FVT/ndofPuabhIRzIWeLDPVCGfCV0QW5zJNeLoa4IpjbdgGPeY48WmLhjhSkYjspfXdNmSdU6wZ6VkbiMQwIfVEikIKaklMBvkqXIaa0m913FJhfjkB7UXOBT3fA3cNOQznedU4WER+oo97cctuQde6iJV1jLTDy/ui4sLs2gxQ8h+wz1fCNS8dF5Hn80TxAq61OOKS5KqfIcm6xrQmSweywk3mOdNqgXgj/rPDdZ59V5reKecslUFpCvVabzcJro4P3l3DkbR88626BiSvu4qG4YCHqK2MhChW8cdlYYcAKj8C8sifbbo6t/Iknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CH3PR11MB8703.namprd11.prod.outlook.com (2603:10b6:610:1cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 08:07:49 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:07:49 +0000
Date: Wed, 22 Oct 2025 16:05:52 +0800
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
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Message-ID: <aPiQYBoDlUmrQxEw@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
 <aPe2pDYSpVFxDRWv@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPe2pDYSpVFxDRWv@google.com>
X-ClientProxiedBy: SG2PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:4:7c::29) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CH3PR11MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c611376-8e5e-4aea-68ac-08de11421756
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?99VAqi4k+o9govoj3IVHds4kEgMDEOYunZ9ur41nYtby9lSheJPfCjZAXVFr?=
 =?us-ascii?Q?hn1vAGFOMzGhB9eO4ovruK9VVHEYnuGPoAz28Z5DbwsXGaM1r0d+sGT68uxt?=
 =?us-ascii?Q?b95UckTBeRzt4m6U/yZvoj89nC34+/jQOd3kait9/YszamMt/vFn0sLN9C32?=
 =?us-ascii?Q?CjHGuCXbFbpyfDl+jHT1rvdENDz6BMtsyriF4JdgW8/1mPv+g+GAFmzJ6I84?=
 =?us-ascii?Q?YVxkJnj/FmD19e1BF88cmWuPBRWH6kgPWhfZxXtmcuS762UzLTX1Isa2mTZ8?=
 =?us-ascii?Q?ntvC4Yw3QLaeJa8RRhEsPUQMuxptiX4rD/gHSG5XNeDvht+wcU1diNZwKI5u?=
 =?us-ascii?Q?IyJ5rn/8/ZyesC98UtbZ1VqKGxe0lojGY1MhF//qik7vdZqhZiJPzZo5h7tF?=
 =?us-ascii?Q?P4bkTlDW+ugBWPoMEkatto61PQcrDpPvdGED/c0u3zsu0IYIvPNNsNQjUrYi?=
 =?us-ascii?Q?GimfOVGjxl1C0yAnh0+dExHdTWk5NXKOYuzg87bKK9H5tMGLlm+t6sQ/CAp/?=
 =?us-ascii?Q?VQc6uztAT7Mlqx1snAEjXPCupUXwzIRMsgTe87rbQ5I0lOXS+mpmbbZwC5/8?=
 =?us-ascii?Q?NJC00kInwYmo8zSC/ed7EYd3AVHBTj7ZA35YNsPZ+OxCeodl/pzTrq/DR7r5?=
 =?us-ascii?Q?Ug0F6m7PKa4rHBl2qKzDOq5/iy69EM4XVoFOSGtV3UQYLNNtDusoKBVEqX3s?=
 =?us-ascii?Q?41W52vecRuzcaMPq1RqfDoN/rFNaLzc+gVBIboVaf6AijsUMjrP6NGNWs0wm?=
 =?us-ascii?Q?rRJPNqLo342pIj1JHrArI8d7Uoybws7cUPjVG6ksKgm1C5UFvjK7C9ZTnQqN?=
 =?us-ascii?Q?k3EEH4YEbT/xEHZJrudgsQJvpmOfGtE7al7Rj/71mPkPCXwJYHR/H34/gbPp?=
 =?us-ascii?Q?tg/jgCbwWhg5iZfz8MIYDHvLpE3OZ7cMU9KtvOf+hrJXJl6OQtcLfTblt70I?=
 =?us-ascii?Q?Ir+1vZQENNs/fwbdDX9d890J7YRNDxESfHqMo1PLpYNh3eFqa8WOoL4MfFaP?=
 =?us-ascii?Q?7H6CugnN70fO81EhJOEhDOgAs30h7nJInG/IOO104njGwtkEbIhxP2gefycW?=
 =?us-ascii?Q?IqZZlxFgJcNBn58NNazGc3lGXMNuEZ6d49zGshwLxr76UUhBIsmE0YPTczPo?=
 =?us-ascii?Q?mEbOJGbdcO0vo1BEio/MLlUdr9V9yRrKgsei984Sdk8GkMLIFWTeW3gikhlN?=
 =?us-ascii?Q?2OKFPjE6IQE6cHw6j5aSx0GxzynjAs6cUniLAE0dhixWHCcxl70uUZXXUB+8?=
 =?us-ascii?Q?Vf0B+KS3qm5A+qDetVrMbw7z/S/A/QodIZTJO/ARuGlgcFBIsW1/pwqkMDq7?=
 =?us-ascii?Q?yQbMi6xJ7O5GuxCLWLoxjlZJ9OFGbzS7D1jQcQkJNQ6RV8+EUcF+IuOOEfos?=
 =?us-ascii?Q?6v8YrumaXDAISeUG/XOBKyN7vFJ+DId2G54HHzrsknbzrvmjzz23GpPrCo3s?=
 =?us-ascii?Q?wdRHfGZCmPtKp6JkVYShf1AZ6CJ4jeRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rAomLKUYTVawK0hwpOHViRCuRDYQ0vqoHKzWmhuKtVwgjYZwYXLLG1qE+cw5?=
 =?us-ascii?Q?XKP/jzZKCDbCjt+BDmoyfN30D+EHCQs0dKFe9st8iIZY6ManHgaKlWWsHaqu?=
 =?us-ascii?Q?AtjD681xLBC9SBF2DM3SHBMfNXHypcJd8yaBe5vtgCLryxhSxRAKQyPWab8M?=
 =?us-ascii?Q?lOmBG2Lhaqh0tW8GY1cCBSk/xY5jgmweWPVdFunEQmYIqhRABrjQxpbpf0AX?=
 =?us-ascii?Q?/jhBnG7upB4BL/JaeM6nl/k2vEhwkq6cuIHVL1VnNidskAF9gemXQamHXX/i?=
 =?us-ascii?Q?gkBWh5UT7WygFm7LQghGcn/ECc5eb21AJat0DKVEIFQZ5LB444G83Nmkubul?=
 =?us-ascii?Q?L+t9B3HiI3zLw+s4kwPmR0bG0Or1LznGnAQuiIsEieSrU5J7f8FuYpveIEyF?=
 =?us-ascii?Q?oG7W035p2/j0OkMqXYm33ssVqggQGgwn5sQ8axQKoxfITqb9ZKW+UQ9lbqW6?=
 =?us-ascii?Q?NpXaaIAvYdGbGXtOWtJWLFUu8gByvQy460P5WyVm64zRj9o0O4So4RSAV8r1?=
 =?us-ascii?Q?O73UP2U9p068kWzkxsdiVxuoCDUvAaS98NCSnIJaT4cKjzZUyQUpigaWnX56?=
 =?us-ascii?Q?8ciclFuPRN9s+H3Hb2SYGSLMB1WnbewvZKES5ta4tFX6eZWDdjUW2kUzrSEt?=
 =?us-ascii?Q?1dr31eTlbj9+bUaXJNE5KoSUMy1SGXsuwWM/nzkrO0E8Ltuec/3btytENBnk?=
 =?us-ascii?Q?u81pZ7fP783J/uJ6xuvkIXWhEK3tLlRdAvSeUr71uKCUSlxO9Z/MZ4oyZMeM?=
 =?us-ascii?Q?/jywzSAWplYMX3W+shipmEmyOLTqYbFNdmFZeqEasVL+GqvxP4hH+65A5+OD?=
 =?us-ascii?Q?mUmKNZ0jkyYoOKmvZnaN5FOzALkFdXbUYrDkXqOIx2I9QgydzhDm6/dvTNB+?=
 =?us-ascii?Q?PvVVItCwYMV3Hrhcw5QtBDNhfEmk2yunxKZCYLKWJxvr+Y1WtTbEuAo1JbMr?=
 =?us-ascii?Q?xY3HhWYFxpcBzAEB6jMSNGAaGSLi9Q+NxON31lMSK/+gn5TDu8xmVIMI7c5G?=
 =?us-ascii?Q?AnYKR54+vR0o/0BpdcL0gcz310TLiylFFmHY67NCYouepTcfSxRYJqkwPkI0?=
 =?us-ascii?Q?PrJRiM3taTy7NQKB9RBXrRNPNGATbb9L7kcXZucnIFniZM/C+GELE2WsVO8Y?=
 =?us-ascii?Q?bKVtPK/CfkC+WJ5lyjv83WRfFvmK2YJ2dIsGIEOGJQj7fmr/zO0H6LgjLpdt?=
 =?us-ascii?Q?y3EiNaF++kWFPcDHvhGsgguGSEgAvyB4FmUfF5h87o96DsGmZhoSwtHZcdFY?=
 =?us-ascii?Q?vBaVNXpsVy2pjJQQb0sBo6Klhn94oKXVA7YwhwEda0ugoDw8dxOOYx+EdIaA?=
 =?us-ascii?Q?w8PuSoYOyp3k5gM+o/84LP+LtjKZ8XHi828WzBJjNZ8gqP0xduyywvlm+/I5?=
 =?us-ascii?Q?Ei3IZjtrYvzshiJSeLGcL6vP10Jz7IN1KtsaKNZ5hWZ4DyRuN/oD69GhM56I?=
 =?us-ascii?Q?23DcuxijcCQSAPv8lwKNfYR9gqz69cTWl9l/JqKvqnHAT72ykagzg3Yur6bF?=
 =?us-ascii?Q?ySxxSz6HV/scQhOar7xuizlidC/oSDe4obWbPQXvcB9zmVF9AxqJQyOz4G8s?=
 =?us-ascii?Q?7lMUGbC+MusU9elpbDH7t8nfkMYwle96PTvE8lUa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c611376-8e5e-4aea-68ac-08de11421756
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:07:49.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKVNgjG6Xz6YqubyNB2bCsXNSRBOdGrARTZAgSzsMQwaGwkmRYZ6c8Cac1SelBvT8rMr8iiRyMSIi6xrD8HsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8703
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 09:36:52AM -0700, Sean Christopherson wrote:
> On Tue, Oct 21, 2025, Yan Zhao wrote:
> > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index 18d69d48bc55..ba5cca825a7f 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> > >  	return min(range->size, end - range->gpa);
> > >  }
> > >  
> > > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > > +{
> > > +	struct kvm_page_fault fault = {
> > > +		.addr = gfn_to_gpa(gfn),
> > > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > > +		.prefetch = true,
> > > +		.is_tdp = true,
> > > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > > +
> > > +		.max_level = PG_LEVEL_4K,
> > > +		.req_level = PG_LEVEL_4K,
> > > +		.goal_level = PG_LEVEL_4K,
> > > +		.is_private = true,
> > > +
> > > +		.gfn = gfn,
> > > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > > +		.pfn = pfn,
> > > +		.map_writable = true,
> > > +	};
> > > +	struct kvm *kvm = vcpu->kvm;
> > > +	int r;
> > > +
> > > +	lockdep_assert_held(&kvm->slots_lock);
> > Do we need to assert that filemap_invalidate_lock() is held as well?
> 
> Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
> necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
Not sure. Maybe just add a comment?
But even with kvm_assert_gmem_invalidate_lock_held() and
lockdep_assert_held(&kvm->slots_lock), it seems that
kvm_tdp_mmu_map_private_pfn() still can't guarantee that the pfn is not stale.
e.g., if hypothetically those locks were released and re-acquired after getting
the pfn.

> to first assert that the file refcount is elevated, e.g. to guard against
> guest_memfd _really_ screwing up and not grabbing a reference to the underlying
> file.
> 
> E.g. it'd have to be something like this:
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 94d7f32a03b6..5d46b2ac0292 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>         return min(range->size, end - range->gpa);
>  }
>  
> +static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
> +{
> +#ifdef CONFIG_PROVE_LOCKING
> +       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
> +           WARN_ON_ONCE(!slot->gmem.file) ||
> +           WARN_ON_ONCE(!file_count(slot->gmem.file)))
> +               return;
> +
> +       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
	  lockdep_assert_held(&file_inode(slot->gmem.file)->i_mapping->invalidate_lock);
> +#endif
> +}
> +
>  int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
>  {
>         struct kvm_page_fault fault = {
> @@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
>  
>         lockdep_assert_held(&kvm->slots_lock);
>  
> +       kvm_assert_gmem_invalidate_lock_held(fault.slot);
> +
>         if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
>                 return -EIO;
> --
> 
> Which I suppose isn't that terrible?
Is it good if we test is_page_fault_stale()? e.g.,

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 9e5045a60d8b..b2cf754f6f92 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -257,7 +257,8 @@ extern bool tdp_mmu_enabled;
 #define tdp_mmu_enabled false
 #endif

-int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn,
+                               unsigned long mmu_seq);

 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 94d7f32a03b6..0dc9ff1bc63e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,7 +5014,8 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
        return min(range->size, end - range->gpa);
 }

-int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn,
+                               unsigned long mmu_seq)
 {
        struct kvm_page_fault fault = {
                .addr = gfn_to_gpa(gfn),
@@ -5032,12 +5033,12 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
                .slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
                .pfn = pfn,
                .map_writable = true,
+
+               .mmu_seq = mmu_seq,
        };
        struct kvm *kvm = vcpu->kvm;
        int r;

-       lockdep_assert_held(&kvm->slots_lock);
-
        if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
                return -EIO;

@@ -5063,6 +5064,9 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)

                guard(read_lock)(&kvm->mmu_lock);

+               if (is_page_fault_stale(vcpu, &fault))
+                       return -EIO;
+
                r = kvm_tdp_mmu_map(vcpu, &fault);
        } while (r == RET_PF_RETRY);

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index cae694d3ff33..4bb3e68a12b3 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3113,7 +3113,8 @@ struct tdx_gmem_post_populate_arg {
 };

 static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
-                                 void __user *src, int order, void *_arg)
+                                 unsigned long mmu_seq, void __user *src,
+                                 int order, void *_arg)
 {
        struct tdx_gmem_post_populate_arg *arg = _arg;
        struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
@@ -3136,7 +3137,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
                return -ENOMEM;

        kvm_tdx->page_add_src = src_page;
-       ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
+       ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn, mmu_seq);
        kvm_tdx->page_add_src = NULL;

        put_page(src_page);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d93f75b05ae2..406472f60e63 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2581,7 +2581,8 @@ int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_ord
  * Returns the number of pages that were populated.
  */
 typedef int (*kvm_gmem_populate_cb)(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
-                                   void __user *src, int order, void *opaque);
+                                   unsigned long mmu_seq, void __user *src,
+                                   int order, void *opaque);

 long kvm_gmem_populate(struct kvm *kvm, gfn_t gfn, void __user *src, long npages,
                       kvm_gmem_populate_cb post_populate, void *opaque);
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 427c0acee9d7..c9a87197412e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -836,6 +836,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
                pgoff_t index = kvm_gmem_get_index(slot, gfn);
                bool is_prepared = false;
                kvm_pfn_t pfn;
+               unsigned long mmu_seq = kvm->mmu_invalidate_seq;

                if (signal_pending(current)) {
                        ret = -EINTR;
@@ -869,7 +870,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
                }

                p = src ? src + i * PAGE_SIZE : NULL;
-               ret = post_populate(kvm, gfn, pfn, p, max_order, opaque);
+               ret = post_populate(kvm, gfn, pfn, mmu_seq, p, max_order, opaque);
                if (!ret)
                        kvm_gmem_mark_prepared(folio);


