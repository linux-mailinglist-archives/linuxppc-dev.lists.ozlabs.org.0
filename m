Return-Path: <linuxppc-dev+bounces-2476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 066959A95B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 03:54:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXZwQ4Mhpz2yG9;
	Tue, 22 Oct 2024 12:53:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729562038;
	cv=fail; b=LRfumFjrDNyfXpHp7JaM2T71T73kgzAW3wp5KgYJEe987CGDAY9H2t4IbXaJrpAGtn+r+LSsvrLc3H5x205M7y+QVQSbXQHiyvbzRp4vmimC4FXi81y6NrSUjSiMKwogg4LonhB/gLCt/fBfL4y6HURUjsbtepZKUOrL+6OOCgYHwj3/6oGXR1SBMo4IzMGjXG7LHTl+rxTYTX/zh6OoOZ2rl+PvxX8qR1tCAD8EnuMmTiUldsBNWJ6IubrT7TBU+dxcmnhS3hJ1rdddjFr2tsb6zYgxeSFVeGjcwVkLq1n2uTxQLZMerJ6SyGNaW+lilYtPjpZ70SBbv1ZPQYN8oA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729562038; c=relaxed/relaxed;
	bh=TFsb6o+JlQRCNV1Y+Rv6m0AvxZKtom8l6g4tN5Coxb4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P/4axhsbIgcT/Oiq08OPK7VLvD6/9PQLoNC8XAZhkau29iqRH0QBNNTSStTZpkpHBF3W0OQEVAbxt/ieFl0hc93nTECW3g2iJrSiEAtEAPV1gd9GIcEEynKDMDk7Nf9RYtK/NVf1TLPiipsgo3f/3GH6X2l50Uxakvm0M4uP1j4NqjzHCslz92NM5VEbYKnrC3VHEi2SiQbXcOQm5vk3fjcRGocFGFLek1KhNVT8NnvyXiO/EfEQlcSsT5/bFCe8v69jVB4/8101W4WoxHy1BU5+qVADU0+IZKcu1R1GZnV3vKrzQTH8DsQQGQ8ioJr+dVgkR0nkYr4n4RdHMJx0iw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYpf9sUR; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYpf9sUR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXZwL4tr6z2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 12:53:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729562036; x=1761098036;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XjhrJ2fQOxX8pzclig076w+FmnMCFE9SZKR6Xc5K92g=;
  b=dYpf9sURlh5D77U0viFtI2Kp62pa+d/GAomzd1W2ggeKGHX4hXfOMEIf
   V+DFH6w2N37wkRuMCo8jQzJbla9Rsw2S8Nc+4Gs6qDLfUoJ+IKoIpevmQ
   C3UKVDUWInwg6k+Gbu+xRaBw41/Fc4MtResxpvPiFhgxcxrSnHeOQEhXM
   fPS6oW+ewnrF91oMly2ATRibpuWNcSDlLKyuqoQFCVGnGmCEvfPwlhYzV
   cSAkJ14/G1ucqmvQTRt3tp8xE3FaCSMnXEqPUKtBLIurbxl6Md2nc6nZ/
   kfpQ68cowBFeRg4hN5i3l3+YnDp5HRvHUDpoRY+HHKU3LjNUeaiS2qa6F
   w==;
X-CSE-ConnectionGUID: 5uwpkuK0SpeFdWg4CUg2WA==
X-CSE-MsgGUID: qyzg1Jn1R/eFH3DzVc6dbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29016754"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29016754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 18:53:48 -0700
X-CSE-ConnectionGUID: p7REMbFwSVSUCDkja+aZWg==
X-CSE-MsgGUID: b6lAnnHaS/mwO+na22EQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79702689"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Oct 2024 18:53:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 18:53:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 18:53:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 18:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKMu2e3qhVF5HYUfRtoEtFWB+7ItTuHNGbyaVbd4gs6IyhFcEDXqN60hGVS1Fbu55t4NASsaJG2vswCniIWT3codRO/lknE1pgeRQSmEZAkrXFnQBxjZitj3CSnQpbEFMo2o+Ydg7UingNu+7eCtAa1pdsh48BQ1+kgeQNQFGTO4DryPsjYj74sYzcsNovTbSL/R2gsRrePicrW5Hgl6TvWm3KAxnWq0wJ9dE+EOMmKwFvALbsOWz0694Fa7tiMmyQH83sEhjEKvvMmPrQYWcyxsB4Xf4tRYrhtPdx3svKBNjI5EcHxtupdZf4k+hCx2nrV9QOihC3h8NrI5L4X7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF/dcXgUkYQbnq50DWqb0NBRMqntWIroKy46rNU5eMQ=;
 b=ds2K5DoTy9oLu5msJzOn3ECszjZQz/LOQaXH7iqfDciei3/IzH12+Jd+SdgFjKz84M8UF70F9Ny8y4bb3t+28GHDNO/uOBb5v/B5Zzq5IvVrMduYE0r15ug7X5WinCDPhZ5tEJ5rMIpZF1CNXCiwniK0kYODu0aKld/uy10PXtt7S7gdh/mtDr3ePuKm0/zomrKlA6ivWLNvBWtkRugqBGxwUreF5eSdrKXsyeyl2BO7WUiD9oFL3y9GS3YywXy/f3+SLF3FuFvHDFSxurwku1q8lWl4K1vgnOuIyaI8FJexINyOgv3Unm6TUePHbIh4GHmfhE42STBr0CJUIXUXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.29; Tue, 22 Oct 2024 01:53:39 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 01:53:39 +0000
Date: Tue, 22 Oct 2024 09:51:13 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	"Oliver Upton" <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, "Bibo Mao" <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>, Anup Patel
	<anup@brainfault.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, David Stevens
	<stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
Message-ID: <ZxcFEQOk0MFQt0KU@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-35-seanjc@google.com>
 <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
 <ZxaZtJGfN2_5Db6h@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxaZtJGfN2_5Db6h@google.com>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4234b2-2c35-4949-a44c-08dcf23c598a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XR5uh6Iay0FxOBK2s0pBDA2OPpNMsxmkHZoWUey97VUYNqciH3YbDwPV3a?=
 =?iso-8859-1?Q?XJWP2gvbfGb5NU9iOLclj+HZ87UPpBibjTXSM56C+P81EIh8tGxLTl79X7?=
 =?iso-8859-1?Q?jdZzB7uTyNl5KaYQn5Ax3BXki80eRLplVsNj/Q8933GS6VS0EmAvCgxJ4p?=
 =?iso-8859-1?Q?ZHrfV/Vg+YrAxZAj0Nb/uq+kOlpJv+zCiAR0+3AoYLzuFea1D1cyZ/a4iN?=
 =?iso-8859-1?Q?t1IJGBU+iFc4aGJl0xH5/jmdhBs4ewDAC0UlHuUP8K7By1IYXQpn/nVc65?=
 =?iso-8859-1?Q?QsLSsqjGdDFFlWLwwYWyr3vg0xa90t07+SRiwR2Tkvnog8+ys7Ib15EoXs?=
 =?iso-8859-1?Q?dJK/9WUZaI09TYzjreBIH3GD+p5T6JUrbZRZG//Gj2SkkF2fUD9Lb38hvR?=
 =?iso-8859-1?Q?xmx32QA5XlOS7kXbjdI9qGPbhVZK57jpXi/KUd7jEOqTUSyVCwHKToKKNO?=
 =?iso-8859-1?Q?8gTR+5nNqf/4f3Lzp0/e4VTYCZf1sEzAAOpE3fM6WCv3p6qN0bfR6hC2aE?=
 =?iso-8859-1?Q?sz6/l9ldqzgP+4ngiZbkFCP+TEW3gxInu7EXc5lSXWYG3aYCWZoU5cYVzh?=
 =?iso-8859-1?Q?urx0KqRB9lzGz0UnwLi3KROy1gbLniiKGbHOxw/HBybiRv10uKXU7pMjwm?=
 =?iso-8859-1?Q?cm4W/Bg9WRnWhYSGw5SRpmej4CiYIHM9qtZ6MUN6TKc5ZONCGwrMhCbt5e?=
 =?iso-8859-1?Q?a2jNHukizwTIQajA7C/cxy26VQzV0R5xHLMN5FSE8asY/ZNk17JJILk4cl?=
 =?iso-8859-1?Q?7t1duBDTxBlamv7a+3W9wwNoawcNdNWMQIcj8BJXvhvDgRxiwE2HWylO6f?=
 =?iso-8859-1?Q?QfPC4etjhl5fdc6VGvVtBhwUtfTlolQ2JJZcCDbo78rL43ud5YVCOI0AJ6?=
 =?iso-8859-1?Q?izIA7jvLgiFVbOEGBsu2MSakr0CFW7h3aNWAH+hEqNiRMOmmG4fuwhtr/K?=
 =?iso-8859-1?Q?9O4+djOcBb5svg5QG/VLz2FtgV3XJW2Ae0W0rU4KfdiXLYMP1Wn6IoGnPn?=
 =?iso-8859-1?Q?Ue2IstwoFRodu16X2+JiZGgLmyVYow+EvqlwkG0rbHLpTQSAKSA1BcYTgi?=
 =?iso-8859-1?Q?BZZPplMCCim2jPV4hp8odg3uHodQF+zFFWuaBbCjsam9qL+j/yUabfTQr1?=
 =?iso-8859-1?Q?gwS7hF8vba5kW4sNO7eMychtC5dOt5VPoUtT29giUx11qKSejlqS1rPg/R?=
 =?iso-8859-1?Q?z2g7xIB/LawDSq7HKbBFT4p8MxCxkCJlKsXwuX78r8gy7Pi1s7IplL5sGv?=
 =?iso-8859-1?Q?DAfg8RPufnjB4/ZlbLyDrLu3PNTO5D/ZsbqKWQbaM4KcHoelNxh1rfE3aU?=
 =?iso-8859-1?Q?Nw8HXag2I5zQCyYvLJ0wp12SEQqueDPSFUshfHFskwn68IQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hhwEO92IKHH1GRQW3yu8AzzXwNkVxg6RnVONBjkHNWTJkH24c12B+qJcl7?=
 =?iso-8859-1?Q?P+TO9B394pyXEx5ZPGAMq9/5BcrEgN/v7tLZkwdFrUOOcnGB7pQFC3YIp5?=
 =?iso-8859-1?Q?3VwqgP/4na26hAT0x7yKn4w4ya6nmXgyh29bxr7X/sLioMKuWgOf4Vva66?=
 =?iso-8859-1?Q?DRcPUvbSI+fSkUDmn3UCnrVeCmOuz3oEpfx1Oya0nIhmAuRIGf2PJSAz0V?=
 =?iso-8859-1?Q?Ynck8GXj8oT4gsR7OD6QjxGqBZZczdvgpcnjNoAxkcJKdY1kkQ36LW/rKr?=
 =?iso-8859-1?Q?kiKgW/wC7ogZ0Gj8msThnbzG/yD0Y0h+7t3NWn0Kue0Y4FitQ8GkEDY6fV?=
 =?iso-8859-1?Q?kIEudk3s9fn9sJdYrJZRrTHIXPvTbJeOxvI6QfvrXK8sOxUmCPAVQjeCt2?=
 =?iso-8859-1?Q?AY1Z/6rLlDcXgCLX92Au0DT5tF7Ea8/VK/Dvqt5QdXQjmzHWDoBbbw/7aJ?=
 =?iso-8859-1?Q?/ppgiOe0v4o2j2ZXKR7YewYe80fKogK0cCHYpEftU4Sx9c9Nlv9oaWqYsb?=
 =?iso-8859-1?Q?f8l2Lue/imanUp6IT39tI8pNX5ewKOvUTMThzsxBkqD6/axEsteDPTFsRe?=
 =?iso-8859-1?Q?YiNTDpBeSbSEOyZm8mraJTezCUswI2AAO35ISbpXi77lHFlzWumO6CE/1w?=
 =?iso-8859-1?Q?BMQLKBceFIrW2ToxnN7vXHSXPibgRkukImA/hwfdvvnnbEErdoiI1tCMxp?=
 =?iso-8859-1?Q?ywSfekANh7VoXPbeh208y/UM3XqGGvA9s8AWDwQ/7g66pYEemyAgdzQX1V?=
 =?iso-8859-1?Q?axWGdHKWRqYEY2DosGS1Ep+zewHS22OfJu75BfY+2iWewC9lY7CeiRsaTv?=
 =?iso-8859-1?Q?U3a4XNjLbAFPPVO9kYS6PGwQVvbk36EI84WC1E0H/NQem3UpJBdeKlPXqu?=
 =?iso-8859-1?Q?qydVLP5rg4ovu6Zhgeckw9zKa96yxSKqnAw9bOPJDtql6kzLl15zWh5w71?=
 =?iso-8859-1?Q?Z7CN67+zRZPVpwDEE+fs9d53GlKHUSgtmiVv2alFg/Mymb0YbQ8b0foirx?=
 =?iso-8859-1?Q?2pfs9lcV77p7QBeW0MAs8Y7Y+q9OCZWVqhTNm6nUYlzkN7t7Hor0XspaLq?=
 =?iso-8859-1?Q?DwGdzyge8wUKG04eMxvrvlk7p3b3PsmZGbaxxldrPA/khHa0Qr/GTcA310?=
 =?iso-8859-1?Q?Fq416zrpjUabqOBlP7/VSxkGQew4xA9Cciq4ZWqEHoMGw5X9aHdbyREwYv?=
 =?iso-8859-1?Q?pqUPQ9MWz6Msc/b1KSXJsVJNnUA3nJwnBbc7M4HidmsRTio2T6xL50445c?=
 =?iso-8859-1?Q?K8y8OkLypduFsPkFvuGuzMW5L1IxnfcztGGaZy86rSK1mvIGNTiuCAnfUy?=
 =?iso-8859-1?Q?y+rK6oC6ana/ZHNsUti58PrO5tl5TL/23wfUT81rRFUVSmAKE39vrfVx0S?=
 =?iso-8859-1?Q?Cfl8DnnlLQ1qO06Y1OloS9COJgkZlMGDI/bKr25ezURCV1MEWsqAo/WFDp?=
 =?iso-8859-1?Q?ASvSCzHPT8SaVCY9JQZdzCsEBfB7thRzcMpe7jOLPNddgQzg6wRvA3MNbD?=
 =?iso-8859-1?Q?r18LTS0LXSLj6mBKuFEQ1kU+ZQS0IAiY4Y+N3tBmbPBdBCV4ZPlmle2emO?=
 =?iso-8859-1?Q?IzreD8EeB4WiJoh90/KszH7Y6pwEM/ZWuGURNst72DaK/GQTXRuQIyBs+Y?=
 =?iso-8859-1?Q?0ORx5krqbn61RtGKhdg4wcYmywWggvB7FH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4234b2-2c35-4949-a44c-08dcf23c598a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 01:53:39.5332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D50aO5VOQqfXGIwHC1fbS3wB9fskHfLDU3WTGhUcogM8D/opKwdZhOMgsFS54xGqFnSsfR4ulxUDNXGVweBLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024 at 11:13:08AM -0700, Sean Christopherson wrote:
> On Mon, Oct 21, 2024, Yan Zhao wrote:
> > On Thu, Oct 10, 2024 at 11:23:36AM -0700, Sean Christopherson wrote:
> > > When creating a memory map for read, don't request a writable pfn from the
> > > primary MMU.  While creating read-only mappings can be theoretically slower,
> > > as they don't play nice with fast GUP due to the need to break CoW before
> > > mapping the underlying PFN, practically speaking, creating a mapping isn't
> > > a super hot path, and getting a writable mapping for reading is weird and
> > > confusing.
> > > 
> > > Tested-by: Alex Bennée <alex.bennee@linaro.org>
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  virt/kvm/kvm_main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 080740f65061..b845e9252633 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
> > >  	struct kvm_follow_pfn kfp = {
> > >  		.slot = gfn_to_memslot(vcpu->kvm, gfn),
> > >  		.gfn = gfn,
> > > -		.flags = FOLL_WRITE,
> > > +		.flags = writable ? FOLL_WRITE : 0,
> > >  		.refcounted_page = &map->pinned_page,
> > >  		.pin = true,
> > >  	};
> > When writable is false, could we set ".pin = false," ?
> 
> Hmm, maybe?  I can't imagine anything would actually break, but unless FOLL_PIN
> implies writing, my preference would still be to pin the page so that KVM always
> pins when accessing the actual data of a page.
Ok. So setting .pin = true here is because of KVM direct access, which does not
check mmu notifier's invalidation callback.

