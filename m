Return-Path: <linuxppc-dev+bounces-13785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41E9C34581
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 08:50:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1ctp2sxsz30Qk;
	Wed,  5 Nov 2025 18:50:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762329026;
	cv=fail; b=LSJGA/R/81xclpiUwOH/RuCIPyJakyolbptjrxqwvghKd2bJkAYdNfcSL6gj2CaNS1RJmx9u1C5d3adInR+IvBSoDrkHolomSPT4ayFmGbOQSaeSQwQTw4t88rk2a17Gs3vD69hkrtCTN1aQUfrCRmrXcpyqZVaLFginWDroTWcjMfhnNbJ5v7CmO4YF5veITw4tLuPP9ngyqU8zQR5u9/cDQ4Did5BY8N4Wlu3ZoMKV6itwGUEvIKndH8EzC1IEZrchCMygkBRZtrND2TQuDwv11gXGeQnn4M7uEQ/eXBg3d7GydW11m3vBqymFuySghteh+mw/oEKP48CieFG2BA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762329026; c=relaxed/relaxed;
	bh=H763XweLnSfFOo+PRrBmFAIVPvUbd9MxqaCXgLJ6h9M=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TDNWU/yqdHHlD8Gh1ViC9sxPXQ1cGbytaqngNlWM8dVlo9cRHrMs5+p2rBm0eyxnle4TNGcnvkEL+7eweyXjoDHkhV9C+4/3VXroyKHbZpHFtFjpWzcKjq057Zf1RwClfyTd9bD34XqL3Lcz/0fKtx4hIKGP7jmhH11rp5Y5RWp9LdNq9SwytuUcHEjEhv0mAFazmVD6D7nnd/ctR9GgYY+h+XEl+zQKaUJsEbbloo8nvIqefkf3g/v4xWTwN2b3jAaMsEhHFQmzZ89tr0Gukzo8EDoP1H9K36gXpt6WLR2JM/SA21b8uhk2aBV+374tWWz8Xds5Ibco4otl/CidtA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kuMi3CIw; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kuMi3CIw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1ctl4V0cz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 18:50:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762329024; x=1793865024;
  h=date:from:to:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=xSVZXDY0znLHAquPH9GWLVC3lLn4OHkxYQHQ6IfV7so=;
  b=kuMi3CIwwdGU/BHUb2PTHWkNnB1PI175P/2sMdsqbCHAhPESBSUIGDtM
   yXyRdKSOjH8i6K5Q8CcH1dUSWT36c8U9gTMuHVZEmEkDM1PHx7t1hUEbo
   6yMborTX8anMan7MO3OBV1Ala/802j2NcjeQntuSez7vt2tgzWKB3h+lr
   Q1y+mID7F0ro2iX/xO71QtEB725FbnkpByE2KhqO2ghVfDy9SIsUCsGNG
   nZ4zsJ5KZvcl7FFSLQjtuI9QNfisJvAkqAWaSIMEdLhMkFJTduIo+8gLU
   tN5IGAvqk4xDQGXT79CHZor4Y+MoSBHMyjy+YpQa5aqseKbXTWI/R/k1i
   w==;
X-CSE-ConnectionGUID: FYGNd3QhTV2qDHEqn/NPbg==
X-CSE-MsgGUID: obdHfrp8SM6ZRGxqtPFSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="82062813"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="82062813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:50:00 -0800
X-CSE-ConnectionGUID: /URWdqlmQhirABx2oJ5+wA==
X-CSE-MsgGUID: HFnd7MhQS/ypmFv2FAX2bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="192460516"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:50:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 23:49:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 23:49:59 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 23:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nw/WOF9nmqsvM36EY2tDKBWT4PbkMwVYmNJicwtVfzkcF1Elqfbi3IRxMoD0UFYkPk7+Z04YgGcFwRk/J5JbtrkKtic3QVygNn0IdQiI45q1DaIQVYKAhWoSuvdzyU4enK4rbZEgb3sS4oyz9vr5oRKQFM6z7kuXGmSto3EsIO6TdG9AOswk5ugXxysisXFAGsxJPlZBpGkXeY9u8FuXZBQAJy2OZl8GibG7tbgFnrYJnuqikPyNYj2c2S+yDk3EutKM5gFThD62i6MAlcPwzABVFbRFu8c8aG2/5RDnXszYwWGd3GDUm9Z4oLS/YrU6vKLzuerQ+2QPgto2uPNCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H763XweLnSfFOo+PRrBmFAIVPvUbd9MxqaCXgLJ6h9M=;
 b=Cc0TzMgeb4vDP+clogZGst4NQaObKyZYnXje4g/o0fbdJ6FexwiaM8qC6Nxj3w/W1oI26LdMQ+zDOQC5K1aTMzThyM38ZG63St8usGD+6GjIz0r2oZdGWGDt+la9qtFK0erT0yotAbNkOwY/zZCm+Xk30GBuYJ4yNAypfRKOuUcST/OULRU8xmW3GpULuBHY3TeAazqcdHm9uOPfTZo/A0dPNVK1IYFTxiPtrDpSOYFJQLS3saN0vQz7j+dWA9NkR6QXsHjM/CBFK8zYPZDfQ8WAucbTSmhPXhGcb9BtZrv3s0z6h7jSZNbKtzkqs0kKNuGSCvOmXJfAFL6PsOQqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 07:49:56 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 07:49:56 +0000
Date: Wed, 5 Nov 2025 15:47:47 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Anup
 Patel" <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
Message-ID: <aQsBI1/SIXGbf9nA@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-5-seanjc@google.com>
 <aPhjYcOFjL1Z8m2s@yzhao56-desk.sh.intel.com>
 <aQMi/n9DVyeaWsVH@yzhao56-desk.sh.intel.com>
 <aQo-hus99rE7WBgb@google.com>
 <aQr9jW/7zwWJaDFf@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQr9jW/7zwWJaDFf@yzhao56-desk.sh.intel.com>
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9ec11a-c06f-45a9-dfed-08de1c3fe994
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WpyqhYkY92dZiBd/By/e2x2WbRfUnlxQUdWzaglJEI0AQvS2ZqmVY9Cdy8J6?=
 =?us-ascii?Q?xfX1XwaQnOyFn9qWvF5ijQT4RsJ59pq8tkGbewAYwUp1AVhrvBE1F2/Wc+gl?=
 =?us-ascii?Q?++EZEkXfP200IM2iHFuiellqD7ueVOpAPeVGqk78XA8HVlDR+G/TB2r7+Ioj?=
 =?us-ascii?Q?ji+bdWHI1DqprhfrGbB8WhhnUynbOMmZ6/hdn9190Ri/w20VoWS9BEhMHtGr?=
 =?us-ascii?Q?OhTOXV4Cb4ktQzOrNHNVLN3050FLJDswWjTHAzPqYGWysFBwmY97f/64RpuC?=
 =?us-ascii?Q?qJ4UP8CBSeevUA4l9fk0cTBcZgdIl13dQr8zGQZYo8/NaM6A2zo12rmNzjtU?=
 =?us-ascii?Q?wkhn661vjSs+Tgi6cv+HcrzWidq8aE1SN7jLW3aSqTx0vL/w8zb+dgRdfvrn?=
 =?us-ascii?Q?VtiJjs23qJTxG6/0QHe2ss9ozYWpdk5hc01jbHVSWTij1Ik8oREhvCMLENGL?=
 =?us-ascii?Q?qioGrVsKpoJ39KzeeRyM4HOhNZNG+i6uFMYj1Ul1Vl0bH13OJWI00Japp5M8?=
 =?us-ascii?Q?f+/qp5zw8vLrnbnAX1EkFNatc+3wwSny3VmWpErKY6Sh544SBQGA9NA1mQ9p?=
 =?us-ascii?Q?eJ4jJ3zSstOFA41YuX7Mwr+wewt1H8RIiPXDWlodB4juF0r8lsQBxZ5w38dw?=
 =?us-ascii?Q?MSne+PqvfxegtOfTA1vC579to1K/AcvODDjSUu0P7LUSXDm+EkE4QENck96M?=
 =?us-ascii?Q?RJ8XVPUa3oFJh6Jgfr070qt+SczJo8dGr0T8pOVpnie5IkDK/qsBfG+h6tFS?=
 =?us-ascii?Q?CkUtdNn0QYi4n+jKDzn/SMJOyj7a9TT8sn08x1RkCoUJWf99tBMmH6rzsoC1?=
 =?us-ascii?Q?pxirZfmCFXGWb6U00T5S9UAMSCXqWX6z3ZdzfjwssYgPkdcWJSNAs7tr2oDn?=
 =?us-ascii?Q?1shuDBpoUbM1P5OE6BEy/1JEKUee96rLsGa+/rS92GPlf1jPH1ApR3yPrTES?=
 =?us-ascii?Q?TPOrKrGkAnGkAPtNAxNj6GW25smNOqOl1uvg/TyNDG5Pza7xDoHSjmPpCoHA?=
 =?us-ascii?Q?fyNtUWGfd7yUitmtkBRVexPGeCfbU7lBZOWpV5MUmZxzT/XIwoeQFoOHDXEZ?=
 =?us-ascii?Q?NcNOxvODKVuFDOWPbbC2MoTamSFIFZ7SaVb8nc19GpzlY/f4XQ3K+uVV00Au?=
 =?us-ascii?Q?3fbssyD9iMq7WxDQeJxxuxyYfD1sr4eAPdVrp1NiuGJs1ABYZq8BYnB6U8Xg?=
 =?us-ascii?Q?YnXovBHktMWqf3gXjstMRBL7lrQAGa6W91KaDuwRCK2EeB41OqkGALHJO6Xd?=
 =?us-ascii?Q?VfqcXgw+n9ABLr9C1joeRPB6mTkNsTRLYLqwoqK4U2Foq5Zbr7W2sedgbeJ3?=
 =?us-ascii?Q?NT7yhAEy9PG7CualDXqy51OB1+b9fSou4IYjwbem+eTzcOKoEEjWdA4G9efu?=
 =?us-ascii?Q?we0eROc8wfFVVzLYr8NxXfZyPcVRmiI2kvUa7WNxE0PEF4QRrakbxPh3q532?=
 =?us-ascii?Q?ayXFeXdqxaZQlkOQOEQ5fh6qwv1EbBXpl/pyNUeLR6vNBCw3UmaaRwvHrAqj?=
 =?us-ascii?Q?xnb3eJ6r8LazX0+l1g7OqLjYUWkaknDUlaOc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NRCu/xLEz4q4DmC2WXRmCl9LoYnU1QHZNjtQqW05KjQKGFxuVw+96E3ui5Z7?=
 =?us-ascii?Q?xQ6gXdlnMnpFaF9q0mrY6qZ4SuWtQSsed3exWRJLioPS+4Jm3JW7RMZDZOrn?=
 =?us-ascii?Q?ooypGL8CfWVmFAHQ+tqW2UKsLWcVaKDKWp6j+purCH4zU3mN8GxHHshvzujt?=
 =?us-ascii?Q?Yb1pzTBlS5yJvshM+Dj9oo7xAbZ/VgWty5KTu5+l8EAkceYVyUXASopZv7CP?=
 =?us-ascii?Q?dQFcMI/J0mcFzYxW7pLBoSkZ/MB6k5985pgvq/rzD6UxNHW6Bd+LH7oXQwKt?=
 =?us-ascii?Q?J/wY+21y8qKf4ZKWSqPD1UUL+TsAL/SsdlXehyCIdakcpmxptVZlYPzu2LhY?=
 =?us-ascii?Q?flvfLNl1zExSc8CZGbCcXWsiRnzAdE9++TbPVgMr/2kGja5D5uwAWwePhyze?=
 =?us-ascii?Q?/tXCT8TvXRvugAT/aPn80AcTEQxZu0RQk3h5IIaFb4LzeSNL+Hf5DJiL7wNt?=
 =?us-ascii?Q?bkax67ZWv7pnflq6C9ECxLyxa8CaaBy7lnTGR+/LAVoi81qTiGRcZrxmex5g?=
 =?us-ascii?Q?F53N7dZXeP9AC6gj+i9ScLak/8Mt1PKFyEsbZy2GWXc+zq8nmDXGQRMvGHwF?=
 =?us-ascii?Q?SHrCwZAU2prkN5kRHfxkJe8AndnIT//S+G65Pm4Yxiv/+djm4zmWI07Ee7aV?=
 =?us-ascii?Q?T8u620XWZzVZbafLQpl6UmMUKTEgOEu7lPKEKJKp92hwlOo9edoI/P+Kt8i1?=
 =?us-ascii?Q?CjrEy/largU0SU7rbZTdK3lsW904d6oFv6bFtMTQHb92xGcuSwN8pqZ68CY8?=
 =?us-ascii?Q?pSDhXa7my301v+DZ2psnHqXZSFtyH+b6gduB295a2Ao71rLEmomfnVHbxuXR?=
 =?us-ascii?Q?LotqeayxdHpcmnW9SahU3sp6mnfS70OkvywZeJLvtJ9qRe9f/UNH16tkOhre?=
 =?us-ascii?Q?vlwWYQDczAwjElxhc/uLuyqJmpok6jPEmo4jEYKZAYrv9zcPt018/e7dNYJD?=
 =?us-ascii?Q?srdv39blv6drI5Cwi7bEAFDtoNTZf/+AhibYj9gz6kdEi3Dku1wxF+OUKjte?=
 =?us-ascii?Q?bqT1V1qVUJTRb5Uk1tvD+x8rfpkrczdsuCBSKpOdd84MTD+KWyegz5WPqzAp?=
 =?us-ascii?Q?46jnsAZ/Grt0rZ2V89SYHtsdOZj75Zl/R4xa1BmC7h7Od1vNkQfiYiPTPMrz?=
 =?us-ascii?Q?3Oyf44hYLcxHxd/F57g4Y0BJ6HAbRO59UwtereSc2r4TgOgYmcBb8WNYExqA?=
 =?us-ascii?Q?TLiQEySJhgyX4LA5WCTwWAE2tN3oC3p69xcHNfi72RxJ++NE8gyz4xxwGWvI?=
 =?us-ascii?Q?YOpeqEFgMja+tgPzPUWf3vF5OBCjtA1/lgEovCMs5rHp65JQtZTNubxbS7jq?=
 =?us-ascii?Q?LRxyT6MoW6eVHOu674i4nIIvnhvJIZoSSBclOdCFNJGUbsl/Za5OWv3gUx/b?=
 =?us-ascii?Q?jwk6AKcu2iVhmYkfSL7FJHEt4qL6tkdmDlJqNb7G7b26mvKom0/YdyPlUE9v?=
 =?us-ascii?Q?6l0+fVtMXntUbqYhhszSA1p7Q+gqj9UJFxH1treAOiwoC7nZFUTIiFaMXy74?=
 =?us-ascii?Q?QCawUe+E2K7hLgvIp7DhU9o83t0h/rilKqO4BnxLkShxXfTZ1jaJDYfYcNsF?=
 =?us-ascii?Q?rdZMZw61tPq/97C81eEqEoW1Ru02kZ8Ebiz+3kNx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9ec11a-c06f-45a9-dfed-08de1c3fe994
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 07:49:56.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6Z2ENmN56C9ZqeMpITc9tPGXcDncpDGiwAevvvPsclreA+aq7aImB3W3ccb8Isi1QgAbzFSVvdjJ0SRs/VvLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 03:32:29PM +0800, Yan Zhao wrote:
> On Tue, Nov 04, 2025 at 09:57:26AM -0800, Sean Christopherson wrote:
> > On Thu, Oct 30, 2025, Yan Zhao wrote:
> > > On Wed, Oct 22, 2025 at 12:53:53PM +0800, Yan Zhao wrote:
> > > > On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > > > > Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
> > > > 
> > > > Hi Sean,                                                                         
> > > > 
> > > > Will you post [1] to fix the AB-BA deadlock issue for huge page in-place
> > > > conversion as well?
> > 
> > If you (or anyone) has the bandwidth, please pick it up.  I won't have cycles to
> > look at that for many weeks (potentially not even this calendar year).
> Got it!
> On the other hand, do you think we can address the warning as below?
> The code is based on [2].
Hmm, updated the diff.

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 7b4a4474d468..543e1eb9db65 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -853,6 +853,9 @@ static int kvm_gmem_init_inode(struct inode *inode, loff_t size, u64 flags)
        inode->i_size = size;
        mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
        mapping_set_inaccessible(inode->i_mapping);
+       if (flags &GUEST_MEMFD_FLAG_MMAP)
+               lockdep_set_subclass(&inode->i_mapping->invalidate_lock, 1);
+
        /* Unmovable mappings are supposed to be marked unevictable as well. */
        WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));

 
> As noted in [3], the only scenario can trigger the warning after [2] is when a
> process creates a TDX VM with non-in-place-conversion guest_memfd and a normal
> VM with in-place-conversion guest_memfd. The two invalidate_lock's don't contend
> with each other theoretically.
> 
> 
> [2] https://lore.kernel.org/all/cover.1760731772.git.ackerleytng@google.com/
> [3] https://lore.kernel.org/all/aQMi%2Fn9DVyeaWsVH@yzhao56-desk.sh.intel.com/

