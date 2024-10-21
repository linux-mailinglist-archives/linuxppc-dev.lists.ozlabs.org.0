Return-Path: <linuxppc-dev+bounces-2457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC69A62C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 12:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXBLQ1hr5z2xxx;
	Mon, 21 Oct 2024 21:26:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729506398;
	cv=fail; b=J8wBuul8yxxFNE+M3cKaZUTQH/nKlJjJCrClejQ7mdoTZJfNjcOF4+0dc0mddh7MSkXgAKso9AndWO80O+fqdPDbNHXFmUJD9r0YCLaAR221zfofpSyTcA4jhBpcf+jZnmcn0UhMqNPIAJNDHbKzEVfU/rHHZI/ygeIalI1qVZWS9dt95po5saEeuIofSlRkuany1sPbKk3NzkCDA9LjmLykMG+2BRC/frBXuTNdWyEgwTdicOEoYpLkLl3jKtF5ZtvXhSv4U2q7Q1GD1sMjgQzIOyg7zoPsR4WIYQFVXeU9uB93vWmbngXelKBE62pQePJd5FBKL3um+zHYx54g1w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729506398; c=relaxed/relaxed;
	bh=ZA6yGTE6mfswUJ9xJfEadQ2/fxT/Jrnsp+jIpe3eya4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JCwb6Ov5B2ZK6VdSK7f9F6Vll4Tgd5YkdmiEp+QHy7Br56hhS/k9CbR4KIwLCQUJZs8jxzI4XR3AHLP+2X2iNjYBupKSrsGa60SI/LtN6pjn85FBG2iuLWmg0DXutr/dj8Vm4xcsJx2b0bXPzG7djtJ453W0NPPZKQT9sqn1Tme+MVMhOHo6PFDb+usytzAVgL0+3+DfnxUCu8nzKO+vBrOFq9C0Gv7JQr+ChFIbJdXJFx86bSX+gLkWD/f/Esly7mawBefYDqX8BC1MJsBPKIuVBzYd9iuWb3hO1xK00JnvxVgmjakl+poxsjlPf9u9wwVq6wHYlDpFe83y2GNXew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZH9rZNHL; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZH9rZNHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Mon, 21 Oct 2024 21:26:34 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXBLL5f9xz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 21:26:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729506395; x=1761042395;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5zB52uVuqlzAAFYguBNLLglR2Vd/St7NN8j7fLUatVU=;
  b=ZH9rZNHLbzzKHAWdPEBJSoDk1JXNOxOtDa+cFm6GPwkKQ6jCG69aRkKP
   YHtjsIC1F9/1eM088BcjFz7LMui7PiT4z+MHKNAS8zeDTxe5/JbmESkwc
   7xeESGGFXwyU8k2Oh4O63HbUQ5xED0znkU/WqzQOwXSpKwwVAFEojft5Y
   n2GmcSVxVo9TQ8xb4RLsVepI9uz6FzYOCEKDkpPThbYRv2HC/aWZdcuKK
   37vCH2NvrBcWo3bQjHSbk5FhXeRiuh6f/u5lR1VlSN5foA6+g0/d2xjdH
   EVY2dMp2LHvLQm6/lr+CkJxrfYfspwvFwRN5Pg4vZpPvSxR6xWzXSGBeF
   w==;
X-CSE-ConnectionGUID: IZWU2Ca7RcWZevhms18w+Q==
X-CSE-MsgGUID: lrMP6FeXTQSFjXQSl4pGQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29102523"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="29102523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:25:25 -0700
X-CSE-ConnectionGUID: Pyk3IXmWTJmNNWUaiDmshA==
X-CSE-MsgGUID: W5qzy+hDTHGRSWW8Pp7f1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79836880"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Oct 2024 03:25:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 03:25:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 03:25:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 03:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERN7lO3pF4FK++tIzzZvgACZmutQBjJu/JVTw+TWxcUeTXgwvDdu+x1sHJvNTXetOE8j8U3hE5WV0HYSMK3TkxX3P2ukWIsOa41VLXEl0oUArMqPKPiIjKwf+8x4U8ZlYB1LQkdShXkdk/r7skstGOmjtY55hAkfO8hEmbMWlueoV6ErG3mZ13jhwgNk7XC7VMhbQNFEUqkLmS98T7VUz1hi9y2+JnUL1CDkQNixbZ+ux51wGK1t77BukJFCUQCsN+UVuu8GOiYr/3nnON9Sx01eAIRdw/X31FGUhuQhtaQ4+PI36DiJwhlY9eOhbKau8sH2IEaa48bZhTyTDW8VTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzKT1U+HIyCR98Km/N+kI/D88MO23aC04lBxvwoUu5I=;
 b=pa12i13Nfge0Y8wA/67y8ZkA30hvU88ICsIxGwMbT9cB1wInKbBejqj/0aDVQQN2jXuuuvcwMU1zWF72+0BuGrKaI8yGBTpLPEDJo6euKrbBiYTrCTBiMIGGqk8xFkDlIMu2nWIwEIfIKHczvJMCAdQJ869KYC/CGXTrZSe/CtEPzTEFr0QxK9a++uF/tS++Qv1cfhJpjxI1PxoddrhfOWdV1b7e4qzK+8pBsOYlq6WqOXJOFy4kS4bETjToWO+ACZ4sKjf/HhVFQNh+/D9AqwV9Zne+FQm3nDsqFnw9MSc4GWP+1jo2WeSDd2vMW0l2BT2mREx7xgQ466r4oQVx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.26; Mon, 21 Oct 2024 10:24:51 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%5]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 10:24:51 +0000
Date: Mon, 21 Oct 2024 18:22:25 +0800
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
Subject: Re: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
Message-ID: <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-52-seanjc@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010182427.1434605-52-seanjc@google.com>
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fad6aa-02b4-4f11-cc7c-08dcf1ba98eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CC3/gPQ3Sylem/JbmWsvUD5zbCSXtIA/1nmLm3ZPpX2vT3G72oEjoCJwW5?=
 =?iso-8859-1?Q?4J5jBgTiEO+wnn+mNg396m9qlzBgiO8LyQNq9c0Wu31obME614UZkFifIw?=
 =?iso-8859-1?Q?9FxWjNiVtrBFclr2s8kNnxEcXCew0dS67BweKZk47muyR9DiUBm+He2YLY?=
 =?iso-8859-1?Q?hWzVooFm/t7CEK8c31UMsFbfvAygcVhkGxOZVd1QPKJUWelV59Ex+OYa2Z?=
 =?iso-8859-1?Q?UWwMHGY+nMV5R4RPDNjR4rc6Wtz0wYDHIdlfT5GhQOYrhcySCueXcWYOHl?=
 =?iso-8859-1?Q?yJw0ApJV0BfHGLpQkJXKXgI2xe6ZLntuw18fCRqq1CtetEGwpmwLHN4KAj?=
 =?iso-8859-1?Q?DvYXJG9NTKF3a+iA3wooiOfRt3u/uXlKBGCmslGUk8eveeS3aBHkqnqvk7?=
 =?iso-8859-1?Q?KQX6dy/14CVsrYgRQp1fB8degNy074tlvvi7arVnYG4IPWbKq5zr/QFfQo?=
 =?iso-8859-1?Q?ziJ/ELiqjG4RP39BhEe+h63bYU+e7etzUJh8X1BgCARXygmSXqTJ+sOqAZ?=
 =?iso-8859-1?Q?ohO8h0J8kzyeI7KQXlJ+YOGuBjOjsRknG6Edg1MwfE0EWwgofHSauEq8Y6?=
 =?iso-8859-1?Q?mm5iSxQPh3TNujjSS/q9TV5h3wDRzVmbDt08722ulykjeBmzXhB9SGi89b?=
 =?iso-8859-1?Q?5CGrWaX8m7FpfefL+uAtvdhUBwFfW1kxJCj48oiONkzEv1Dv0tF+6DWvxq?=
 =?iso-8859-1?Q?kfsvkXSRiLiDX+K8N+RyOjECRtVTnxgPq0PcbcIDpKLrsbM8AAvErF2Zzh?=
 =?iso-8859-1?Q?FW9uDi8QUEI/0uonajeQMwfcc/g7maEfrr7BVN8vQEHpNSzqi+yV9YlfCU?=
 =?iso-8859-1?Q?I8CaKAyxC4hmhBiMUSF9ju0zRppPOpKoUXAiAsGDdNcHR42aYZ1raCs22I?=
 =?iso-8859-1?Q?6Hq/Eryd3rfdELYjRZaVklgZENsEQcLikjJCFiAuoBVipdlab++XqLnyl1?=
 =?iso-8859-1?Q?WwapfejuNlNCtYZSPuYTpnECUL4qdowyM/R+Vt4SZbx6gsCCn5OiU2edNW?=
 =?iso-8859-1?Q?DUB7jcwl0OW4jVDMmusatmPY9vBVjxSUgg5/92c2dY2zsPbXgRfjjtW+ks?=
 =?iso-8859-1?Q?r3d9n7AZDzy+51OrxG2AAckxVi//NH0TCwizDOicDTkFsQZfP5n40F3qmS?=
 =?iso-8859-1?Q?vfI+7dQUY8jgwzQ7350nKjAzXBgt+/G38Z07+ZoBs5Qab5juV+yYdq07q6?=
 =?iso-8859-1?Q?D/sj8euosTUIRMvo+RvD7VDG5kXujiPCzmGgDrOzS8f/Oi7cEY6+Dyp5O8?=
 =?iso-8859-1?Q?kRAa1Nc3DIXD2HUe1qGx0i+6LxZbK3vqYsDntTPJSMcYHtm+qzOGyv5ZUT?=
 =?iso-8859-1?Q?0e07h8j6GLGEAyAxYefEil/OH8c0T+MODLEuzpVaKTXOuEHcGUCgYWkokG?=
 =?iso-8859-1?Q?FLA5SL6Yd8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VgxrhVOsB+wPkEyYfVRi/3lujZtYpufDb29iBmlzc6DSeJTjfUfcZ46SJ9?=
 =?iso-8859-1?Q?4g1o7GS74T9II7ssuAtelF4EO18l4aZGyRYKSDGdG0X/uZsodYtSynw1zm?=
 =?iso-8859-1?Q?SUAeEBhhQ7KpJoHFa9mylsJYy8jygAQQEQJBoB90CUh938Yq4ffUS8U5tS?=
 =?iso-8859-1?Q?oqdWIr0xONvzOuPvvniamXtw4/Zsi/P7g71qIphRS3i0UzVWwpcKd/hklI?=
 =?iso-8859-1?Q?dbH/a2IIKIoPbk0QaCjqkl1XkmOcNm2MZWuSfs2AUcJ1piPscru94J9mHB?=
 =?iso-8859-1?Q?GyyI9mrKOjvMfieXJ0jHywY4Zei8+7hxE1WRAAC+yc7BMeSimbl8LvSYie?=
 =?iso-8859-1?Q?TK8Drujd/R/uEe0rfgRSuAXO1gxQwyku7Kq3k8oDkadLMreGiiwqrXDx8s?=
 =?iso-8859-1?Q?BweIL51SmwBP5r/bY3291aV8gBHcrCpv7ZNyc2CtYz+zcpJqP64MxEo+EB?=
 =?iso-8859-1?Q?b88iOqPPHvH2JWvJ3iytiIwqmpVfjIJXQSAbTTUrsvy0FYt3nfuJ5q41Sa?=
 =?iso-8859-1?Q?Ez1wOHI2SmHccnJN7M3ZomQFJooB75yR5r5yCzC29v2HLsc/hT1VBgk5Tk?=
 =?iso-8859-1?Q?KHLJVPAKIETqYiCDaBjwLLUo2IY+AJpNE+Ib3qKl6oOC305WbQmGKnKC3g?=
 =?iso-8859-1?Q?7FjceEkxz3hqhEv8BMoGQ2p0jPLuhVo7TZHdCYV797dQB4ToC6gQYCRMa8?=
 =?iso-8859-1?Q?01i0mk6gUjtim+btlnFuhEwD4tTLkiRFUeqbuITViT0hxk1W17Y3eu42+J?=
 =?iso-8859-1?Q?VzlXTCnl22HLTEebj/lO8v5wb/MA2V2/N7VuxFrJFo7ZL7LlJbWOP0Ra9Z?=
 =?iso-8859-1?Q?5FEUhBeQ3fii08K8qRwts7u1mEkuH7t6vStvYLgomZmo8WL/PHuawK0K4u?=
 =?iso-8859-1?Q?aIrWserGrtcP8oW4Dht2fy/2mowq0xBT+G1YfJHCj/sTMVfiZyv7Z3Z3Le?=
 =?iso-8859-1?Q?ZP2sETc2w6QmIXYXuangpHnfPQ9K7mn51EoLnAZ1DXIGhqZJgnROU41s0/?=
 =?iso-8859-1?Q?3M6OrvygbJgwGK7frFo9lgQqWEiuyx5aKVWOq5ZBWoz5X1E7PvATQxo7dE?=
 =?iso-8859-1?Q?EwbbJyvDDbPl2vQSJdmI9z3OZkVllNK6D/7aYzaPynT4GfQZZbebpgzGNr?=
 =?iso-8859-1?Q?uJCpnGidxRaBTu1v04OiqcXm8YK1UqSUAyuORhNlBZ6xgyLo7biqAnZlF7?=
 =?iso-8859-1?Q?+6BoAqs4BzChtRu5M5AwnTX2rGtci4Ry9IhwMevmox5Z9NmcLlY/t90FAm?=
 =?iso-8859-1?Q?FAp2bEysEyVcUW/4LMokehXtzbIcQ4M2eWfKS2HKmgDF9/ah12JrwmA/86?=
 =?iso-8859-1?Q?CC+ja6dPzNrztuNJfNbI2SsA1Uu2aRfg5Q5pN6qSWAfAwLdrFqn7OL3a58?=
 =?iso-8859-1?Q?ACU4nf8zGcaKlclkD+CvU2eWp9nibja7ci4UBD2nlURWKLg0uaefAKs6FJ?=
 =?iso-8859-1?Q?fYcfh8euEb1VkKhFQO9JdYQWifW1IexBXI/VELuB6D0U/rmtEUCsfTMu/Q?=
 =?iso-8859-1?Q?J146jKKhsiURA5W7lqPm9TXWHLSaijtAYINRKM3CRmcCoAUPEAyoRkTNKV?=
 =?iso-8859-1?Q?uWZLCVS0wSEekkxknBqJNo+cpGJdXLeXoBJXohYnpaUIs85hEwFc9mnWDj?=
 =?iso-8859-1?Q?N4YyIvm2OzX6W5B9Zbl0NvD5TfMh+IGubm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fad6aa-02b4-4f11-cc7c-08dcf1ba98eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 10:24:51.3381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd4azTrwl9MNS+uxVQUVLUHgMnC/iQJBpjIHQDy0EcdtcFVZYmGna/hxjLWVGWW7z9OXbPjhrQw2Q8eMgV4ppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 11:23:53AM -0700, Sean Christopherson wrote:
> Use __kvm_faultin_page() get the APIC access page so that KVM can
> precisely release the refcounted page, i.e. to remove yet another user
> of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> page fault, the semantics are effectively the same; KVM just happens to
> be mapping the pfn into a VMCS field instead of a secondary MMU.
> 
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 851be0820e04..44cc25dfebba 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6790,8 +6790,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  	struct kvm *kvm = vcpu->kvm;
>  	struct kvm_memslots *slots = kvm_memslots(kvm);
>  	struct kvm_memory_slot *slot;
> +	struct page *refcounted_page;
>  	unsigned long mmu_seq;
>  	kvm_pfn_t pfn;
> +	bool writable;
>  
>  	/* Defer reload until vmcs01 is the current VMCS. */
>  	if (is_guest_mode(vcpu)) {
> @@ -6827,7 +6829,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  	 * controls the APIC-access page memslot, and only deletes the memslot
>  	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>  	 */
> -	pfn = gfn_to_pfn_memslot(slot, gfn);
> +	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_page);
>  	if (is_error_noslot_pfn(pfn))
>  		return;
>  
> @@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
>  		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
>  
>  	/*
> -	 * Do not pin apic access page in memory, the MMU notifier
> -	 * will call us again if it is migrated or swapped out.
> +	 * Do not pin the APIC access page in memory so that it can be freely
> +	 * migrated, the MMU notifier will call us again if it is migrated or
> +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> +	 * should always point at a refcounted page (if the pfn is valid).
>  	 */
> -	kvm_release_pfn_clean(pfn);
> +	if (!WARN_ON_ONCE(!refcounted_page))
> +		kvm_release_page_clean(refcounted_page);
Why it's not
if (!WARN_ON_ONCE(!refcounted_page)) {
	if (writable)
		kvm_release_page_dirty(refcounted_page)
	else
		kvm_release_page_clean(refcounted_page)
}

or simply not pass "writable" to __kvm_faultin_pfn() as we know the slot is
not read-only and then set dirty ?

if (!WARN_ON_ONCE(!refcounted_page))
	kvm_release_page_dirty(refcounted_page)

>  
>  	/*
>  	 * No need for a manual TLB flush at this point, KVM has already done a
> -- 
> 2.47.0.rc1.288.g06298d1525-goog
> 

