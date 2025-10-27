Return-Path: <linuxppc-dev+bounces-13327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF2C0CAA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 10:33:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw7bN2GxBz2yyx;
	Mon, 27 Oct 2025 20:33:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761557584;
	cv=fail; b=ezqRvhebdnTDL6PNc2z6DMrh2Bth6sWf55ZMG2UzabwKOG3Y9dXjZmIlMGEKMswx6V75Qa+GHI1Axglr4/anwwWuQouNAMrsxqG5rtcoXeRKMwUAt15fEMM5jlDgfbIUgCsvNBknJ9rBFuiVWz0heFbHPZsl178clYekQpOHMXGNhft4EUN4Jc3O/avStyHNgt07e1igxB4qKc9ckoseBZhhFk6FB1fyMfi3Zod6YwW8YRd7O1Mu4eG8cJy/qvcvLFn0+GRumQKOaogEJ6PPKhiMgJ0H3vi1ckzrYsNROV3EjYTpIpLqgc084P5hYb9YbiqCBSDJMM7rfmM5zZZ5dA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761557584; c=relaxed/relaxed;
	bh=7t0iBqMi1zFf55nUaYv5jIir4tG3cddNstN/yNlKu6M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BVbyYpen+uwLJ0/vej++vhkoeKuRY0EqFwinvLoMIU2hND9py3CbLWAIk4OTnBJGN8TOrTo8KiPHuUV7vGb/MbmeodVf60tNHfkZYw1ZraelG8OepBmQj2z9xYNRDkwNYzwO88gZ++tF+FweGdM3oCdeKy9sNHAsuItmo2eGZixrZxN8DLRX6op4bIM6QwJ0rBnicOIFT69HemPx3JO7QCbocfz4u4ioHwLM4E7lAc38xuHKxVXEtMD/qlO95xo0Zd/4w8e2q/MP54zH7afq+GCwN8XRgli1pyNZRy0BhNa5uTKG6+TASbb/iOce0tJjKRWlXmxUOnRFL+XmTKE9Uw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jyPxi7s/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jyPxi7s/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw7bL2wqtz2yjy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 20:33:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761557583; x=1793093583;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=4NrRZIOxsOjE4hZ0JMM3ZHmBNZfuWfcj/iHtqU7KUCo=;
  b=jyPxi7s/gBe2xBSDijFABHPlJZ+Y8oR0FH538nahZ8XSb8e8xmrsD5G/
   Y2XyFJllhnJQiFiCDtHn8mVhmkyIcagGd5UjWyCfie0OTS8FEZFg3oeNB
   rFxzh8+kkwI4Pk4kJlQtlRDo4mHiaJBIkmLYInL6Ivg5J2KfNx9jZh663
   ikP8u/S1Tdh7UEX4EvMSOPcE4k13ZBRA0Kx1rSN3GOe//VuuunzSQyi+u
   AqII8YTN+ARzyPDsKFwLhdXYPv9s24vqAO7Lae2uOTOrVTQtjKNZ3FyU+
   /e2bUisznjeWEqxvETwyxFFElLKYcVdcxJyxbspEeJzkCHLtejsf2xQ6y
   A==;
X-CSE-ConnectionGUID: ZAcQgiHdRMG6IXZ8z57CdA==
X-CSE-MsgGUID: XM0Lvl6OQASM/qhWKSUyHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81057713"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81057713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:33:00 -0700
X-CSE-ConnectionGUID: m/9yGOL1SN2dQFGo4qwVaA==
X-CSE-MsgGUID: Bvdgx2v4QMWeTyuHnOuilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184224607"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:32:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:32:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 02:32:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 02:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwEzxrmznzldFsbjVCjcE+qC9QoYLjy9mFdAiNVXpgLxDyvVD6ocAElVAIOgQd/FxzIrytiDy2eBnW+wSM0hvzFi9V+8q6fJqx41tFbaBOVDY0O0G1bgzHTPfaMiXq/PtgAjjrHXujtxc43IALXQtK6y19eKmfjIQHACN8Eu5YOddI2jrPJYDBVGZIDHlw5tKbe/ssmY0c1KCggTLuNNUspTPRXyj9539jJZ2YxfL75CJoPKfdddwm+7n8UMXNX3ficUM0R+pgIFHDL8u3dUGIW3Fh9XAKh44hpvW1xrtIUnxfm3W7Y9jkHxUFD1xLcecykevOIg8Mo6tuCrfvnrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7t0iBqMi1zFf55nUaYv5jIir4tG3cddNstN/yNlKu6M=;
 b=EvRR+JEws9+rgnG+jVFp2ru6wAXqv4E+dyF5gUJToaVSzco939sK0QHX1nVVaxxTGl3H60zdRO7QFFCsfpITLe2mRD7xYpwcgxkWTBOGqy7gjhGf+BXhsD4G58SDMkYP3iUR/N8rEnjhnTyHcmUKlHsz20DwmdRf8e9glYxZhENKnKAP4wE6w6HJaGxE8O/xJZFCuS3q/qIBH+1tBKHiujh9s+WP81fa5QFH16pvLmTZG6A8Y57wm6qYQf3vTUp/XQenBvcGIJj8LHZ3DsBaBbbyzs2qFHmkOi4/GwQmA18ZuQnFWmJB7xxZ+SxPIjdQh3qu1m7cBR1o8eYGrRd8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 09:32:49 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:32:49 +0000
Date: Mon, 27 Oct 2025 17:31:20 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Kai Huang <kai.huang@intel.com>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "kas@kernel.org"
	<kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "Vishal
 Annapurve" <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
Message-ID: <aP876BCemBr8Gm7J@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-15-seanjc@google.com>
 <442f5488e4a66f6a1517082df3d2ae47316be010.camel@intel.com>
 <aPuq33-qEJsDhdgG@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPuq33-qEJsDhdgG@google.com>
X-ClientProxiedBy: PS2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::34) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a36ccaf-fd81-45fb-07ba-08de153bcb32
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KlZskL9aH8m2f9n+feqbXj35bm+dprLFdpuAoNZHvIDRbEuUhankyszrtzWz?=
 =?us-ascii?Q?BM3g5TrfapSQA2zymhZudu0KIoSkkz/hmHNAxD7cWcl6EcWkpPB/a4o72D65?=
 =?us-ascii?Q?i2WE406OD5Eja+bCNbiKyEjpzTKS9RWd738SV5M8fG7LHYPpK9evx3qlRZWk?=
 =?us-ascii?Q?tAjX+LGrfmEZCFX7rCTrHGtKxfZ1lPtV7W85JNCcG2+hdby2YaxwJ9BcbVIz?=
 =?us-ascii?Q?N3+iIenO03DRAoHoV7csqWmETqIoTg+USzFHPgbZX6BEQPkcTsj3M9fy3owA?=
 =?us-ascii?Q?4ST1tdp8Z2Gfx/Xc8buQlRE5KF5hdxPSnGM/f95mf1I4pHjOXMPG0baNH9Ii?=
 =?us-ascii?Q?72yZpd0TqvwJ4Kk1Ige9MKbWmah4zMKb0bhZPfbW9qHR3OdNDqt/f6ApN4dT?=
 =?us-ascii?Q?tOLETyeMHDoyno0kuc0dGJJbuAJHEeodF/0n8fGPI8SCNuEOY1RACW8NfclK?=
 =?us-ascii?Q?kcYNR6kJh0dJYlw+LrATUUkRSCIRfe5MjSlzI3n4WbyYk+0JfATpsipJWpmF?=
 =?us-ascii?Q?4HgZL1tNQKWlmZHgqbHlk6G0MfcONatV5bUlaMcqJN8ybBsmy1UMwOyyUCAu?=
 =?us-ascii?Q?4Pf5z60dTZkPiBgrxxXF0H3n64cLsJ6PzQgEdOfl/wO7kZFqa2RDubVP08dQ?=
 =?us-ascii?Q?TRlkMF0jdMzOc41jTbUJfmbBanNoh5u2TCkjG5teNA7m9ufTunXSDmbmsjID?=
 =?us-ascii?Q?CNOCpgsb29evq5oE+Vr6kIz7xWnW+60WTo4QWvZvprn1w+fchDljz0Yh/rdh?=
 =?us-ascii?Q?Rrbmz75CeosL5N1kgSaJ8/cDIZFwPN0UYHGVK90smp/0AD0goGLmXB5n6MZ/?=
 =?us-ascii?Q?vDKU6XGxCp3rJ5oTy+ifg/GUQuZG5iohqPzhVzir1UN5BLsMseBB0Z8R8rya?=
 =?us-ascii?Q?uE2p5+pcksX55KWSMU8qXRmzJcfN5q69LkyCOOD/0cfdVZHyNKPiob2HEGNR?=
 =?us-ascii?Q?nNNdF4CUYlM4Phljy9AYNxlX7MFNHfw55nyMuRQTNJZhDB58tw7DNvdpKB0z?=
 =?us-ascii?Q?1NXfhi5H6tyVcz4TC33hUIjh2u5NqvRyUk542r0CA8KnZvblfCtCBW3x7/vu?=
 =?us-ascii?Q?yC109tHZMVN6A7K+v5Jzz4aPoBRSX6Ozk99VVyUyaRblQgn7f0n7+ukbGE/S?=
 =?us-ascii?Q?vOGoAKM5BrYdnv5W1K7+uffv2vHH1wfCCg5uPHfBKJxdJi+a0UAWT1Gl9Q9Q?=
 =?us-ascii?Q?4EguhHsvyqqdmzCTprSSdzpyVByiTGwBH8cp3m/Pxb/Oho/UzUCtpkIR+Cp9?=
 =?us-ascii?Q?8FZA/2Fv6hIgOGt/qZu1NsxHpj1iyuF8QneHPMElj+EzbsN0bm87QUS78dyW?=
 =?us-ascii?Q?6Pw3DH01L9Rz8mLI2kAZPHkDHczsFsS8SDgc8CE9UIXki4ftD0ZsA0rIRZqL?=
 =?us-ascii?Q?z8+w/Ha5XSTrYegvWFMP9Hh+RozPgRLJFuuTmU37N6CCt2cpIQgukO+BPfsI?=
 =?us-ascii?Q?y+kWAvGKSVCwImIX/EIjnfHLFg1CGiST?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8AuvsAG/aX3W8aM22FG3GhVBEQlcs/YOxRZ4TwvCFw/P1vULQpiPgHfz5Evh?=
 =?us-ascii?Q?4bVvxWN+j7LIC3doKGcgpGpI2DRoicrTrpr8WMrHrB0FZ3MoIU6mp6rS4DA7?=
 =?us-ascii?Q?v1U4XJPzeXhNR1bWTq4bLTu0R/LSznz71vLlr0WU7yCH0PhSpfQ+vuYu52DS?=
 =?us-ascii?Q?0TgMQ93FCPEEOnuUuiOAUjqsBeBmtQlOtOV+DC8QcGeDpl7JVzpNNi0eS9Rk?=
 =?us-ascii?Q?ho0RAKP8YdMS115cmjVJmluw3wF5gk2GAsfBVw8y+tRMPEMu2yOSpYreTu9o?=
 =?us-ascii?Q?WfXU7JpKdEIccmNlzwW7xfpKMEPzjLo+64JuejU1mp2K2TCrqlpgG5TlUH01?=
 =?us-ascii?Q?gS+BvrSxL/fg0CASy3wTOODTJjnpd6Jfnu3xemgwAbAu9n7IU45j8bNwKhxB?=
 =?us-ascii?Q?x0QSn+p6BKjsBBYnmxCmTQdzsIIqRDW8WQbKrh5fRelyudUWqB9vZnIj1Kib?=
 =?us-ascii?Q?tk1C4sD/RUGpLL5R9sN2k6MT4k09g2kjVLH3HbFaLIdA0e4FfMRMH8WIJVxe?=
 =?us-ascii?Q?lOjQH/Ml2T6TGMQatJyHEupNMmMZSPMgfnmAAh4WNcflZTvaqeteGWtQsSvA?=
 =?us-ascii?Q?39JXjOZgVwXkK92g6R9sKcDfdrGYS3R/72VkNLQDi/uEBe38XV9GITiwzkVY?=
 =?us-ascii?Q?rYq630JwsdjylchCfRLbKXVYGdJzxF8Ri1oKq2bc0Ky8D50mRQTmQ3PohO+o?=
 =?us-ascii?Q?eQjOoIYzOvwH39ZjTmviLwzJH0BlMY6XVPk0gIeJxNUURHbL/D66QrMbw5AP?=
 =?us-ascii?Q?GRksA4jQDmOpshz2Rix14tXkD4sMzoYRbyC9RgK+OnGRVpOITcxq9RgEnBo3?=
 =?us-ascii?Q?9RVqs3AZZYUto09N9IP0cBvqvtFGRWD68Gy1Y7fCch7pqwR1ktGchjvoBpf3?=
 =?us-ascii?Q?GetfEXk/6GoTMmFxCf4tVKkqRwcaiaUoXbZHdQVPyhO4pUiZDn+RjNJ0fjxc?=
 =?us-ascii?Q?wHjJ9nvwHPWg+kPQclT5OdZt2Iwczc+PXexw+/4+4Wl/KpYApq5m56fjWaTs?=
 =?us-ascii?Q?Y42n88rNsNsOOjmorV5qdH1yJEKwo/VRfRT+uojF0B6834sYcYAQWbVYI5sf?=
 =?us-ascii?Q?KD8/8X+WUU056gqa5t9RWkim9kESVw4qtcBdN9bTC/NwhWw1dmhhCCAl5KFN?=
 =?us-ascii?Q?htlgd+JIJ6uENGL3K7luyUG06kn18nos8VbupyvQ6vpuKBdHQ8J5b0U5m1XJ?=
 =?us-ascii?Q?Z6fLgEe33/AGFaMmSE4HLpTJEEl5QnlIApzTPVnwBUkfUnAtc0+5Ce9CU5/C?=
 =?us-ascii?Q?rlevlN79H6ozQuUIclc8lh9LGHwO56AgMliGKZtfTxD3+m+xeHgFo08g3hki?=
 =?us-ascii?Q?chc5acpV1zi7RqQY/ydwkC6M7qJ0DiAabfIvyma0FMbEoYYA4ddo1Y1efKLf?=
 =?us-ascii?Q?f1yTa157+xpZWaT2XXUMNjY7ibkMd1LlhZ4/qHDaPB8ma0axZ4ZD/JTqNnnk?=
 =?us-ascii?Q?t3VmsnOO84ZaTXpdjT0KLxA2x9qjJEtjEoQVPFXxLBM5w6gYkyJZtXuoNU4a?=
 =?us-ascii?Q?MWQFbwdPUtOmxwISuHytk4+lSBhKtw6HolWwgq96SoxGkGvgfaLZso4FEDNR?=
 =?us-ascii?Q?drcArHOOWEUweV7ACNYadxQcH2Paj/KG1quseiQk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a36ccaf-fd81-45fb-07ba-08de153bcb32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:32:49.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMreRnyXPnsHue0fYORQcEdzGexAc4TwOrnc7fwmtPzhnASd9ZBaz45fD4aD4Y7+UJv51kCOcVbSw6XcAVj83A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 09:35:43AM -0700, Sean Christopherson wrote:
> On Thu, Oct 23, 2025, Kai Huang wrote:
> > On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > > WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
> > > measurement should fail if and only if there is a KVM bug, or if the S-EPT
> > > mapping is invalid, and it should be impossible for the S-EPT mappings to
> > > be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().
> > > 
> > > Holding slots_lock prevents zaps due to memslot updates,
> > > filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
> > > and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
> > > entries that can be used for the initial image.  The call from sev.c is
> > > obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
> > > so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
> > > __kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
> > > image, the APIC page has its own non-guest_memfd memslot and so can't be
> > > used for the initial image, which means that too is mutually exclusive.
> > > 
> > > Opportunistically switch to "goto" to jump around the measurement code,
> > > partly to make it clear that KVM needs to bail entirely if extending the
> > > measurement fails, partly in anticipation of reworking how and when
> > > TDH_MEM_PAGE_ADD is done.
> > > 
> > > Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
Maybe this tag is for patch 25?

> > So IIUC this patch only adds a KVM_BUG_ON() when TDH.MR.EXTEND fails.  How
> > does this fix anything?
> 
> Hmm, yeah, I'll drop the Fixes.  It made more sense when I thought it was
> impossible for tdh_mr_extend() to fail, as returning an error and not explicitly
> terminating the VM was "wrong".  But I agree it does far more harm than good,
> even when relocated to the end of the series.

