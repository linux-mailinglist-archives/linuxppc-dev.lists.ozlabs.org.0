Return-Path: <linuxppc-dev+bounces-13416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97CDC1291F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwY2d4hbbz3frF;
	Tue, 28 Oct 2025 12:39:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761615577;
	cv=fail; b=Zir+zS4WtTxWeWdq+M8iAv8xMDcpRWEc3o+NCqHwreDugZQEBlmLnGmwuvNROTkPKOyPKmfRCvrNwz0VVmss2BwY9TXLif8RMQnBN/vLAFWkIecPBHHsCa+FKD1oDvep0WCP0o+iG1bHBlWxHFn1WjSymrXYitgRjvRTKjmaiQDCHmN2kAhDj+vQZ/Mv8jiitG/TtEfAmaeNan7Kz7Q2JI2VoXKFN5AY8r525GOn5rMDa55thKgy1ifNeeufBed7JONBfAOVMpqZxIXXJugp8ldUeJknL2srwVBq82kWA8JpdS72N2LmJ85fpPtY3RqbDaIQ0q6813KMQFqQkLSWjA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761615577; c=relaxed/relaxed;
	bh=m6MLg7v7yQ+soFgsw37Q2JBnJHZRfQcFhC6ilajngEg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XrhgFpyaaWp5hUD+sKLDlv3C5mvztjV8t57/w+uEcXOfaB6kMwLahJX/LeXsTAPuHlu6zxPMfJytzzGzsJO9i6DoaIOhaJ1jK2N9CJN0cyRHALYSdzYjVYX9lVwT/V0R7OXwI7L1uOisQJDJ9UBCslig1plScn7DLxZdollnb69hIdxXi6yM++femNnx8cYgb3jKMa4gEAmbcpO4xBJ5489B5CKBJcSJg2bqSX5+gOfgnfLYH91Cx2kHk9iI0+7kWOQXiDWvvrC06mSt3oowRCGaWuia2rfwzHEg8n8yDhXXnV6OwYPwcJMZyye0KhuHr5maaJaQrhrEHc4yMbJeew==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U2nbfAMP; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U2nbfAMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwY2Z3ZZkz3fpf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:39:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761615574; x=1793151574;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0qEOgFqxS8byCB8rnlPAGovSB1qn9i4mePwB3HlbtYU=;
  b=U2nbfAMPVogsnWTOOF9WwOcE/QkDb47z2WWHGI0RbIYynhALZ0J5ZGho
   /klqaL5qPReWyQnqHv1muVkQdnlDD6FDerFp6zInkFp3OnFbqgI9Hq+b3
   MXNAdDCNqgKcJ6hvt748ElUkkfZfq8EUqSfplx/cLgvYs7K+b2WgHaAKG
   CrZAGv/+gY+zoW0GuZJgq+/h1JJhWsdZOuFEUdYTeDGaZIvetnHtUMi2c
   sWojUCcNkMP1yngdu+gj/a+NCkUWSobzI6ReeffZpE9XniohDzTdFnoZr
   QcFU2n+25J+w/YC7dXVxV+ap0KhnjKZt6+2u/XKCH/qStyguDz2/NALwY
   g==;
X-CSE-ConnectionGUID: P7YveammRo6heiadocSkHA==
X-CSE-MsgGUID: VqBjrYjYTAafYZNXeZA9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63614223"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63614223"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:39:11 -0700
X-CSE-ConnectionGUID: JBHyLqc/Sl2Gw9H9+zIDBQ==
X-CSE-MsgGUID: ZDXIa3HHSrOreE9ZrY/k2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185963692"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 18:39:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:39:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:39:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwz3Bmzb32OugWah6/EjcCLo3PODjtRwhm9UzEPwL0sFK5Po0kvvU2rHcdVf3Ub2srl1QlDVinedG4AodAvqlx0lmrAl91IBANIUZK4xY7MT9fc/sIBQvYp+BlBFrK+I94i6BLKzB8H44w3TCdpNXUyymb7USvonuyB5ZHn3wf6pEiXGrWFC8DfY4eg/VcIHOUKAAqyoDCwUbGfC8NfMAvP6Ud8iNjuFpNmtrQWdMEKGm06TnbH8E+VTwXbND/1aiB2KNC48/F4VMhIvm6YeBPpGqbxL0ANe1PUTas9x9jjXkR9Cuvk+yUJFRzIIF4mfz8p69d/vY/kMEALGM+hGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN0UXd++EQV9tIQejojWBftPqUEbLCOAHSJ/3a3GZIs=;
 b=ezuYooIjT+OEF19ShFwfPMHI7f/gxHsyOMyzi24wazzIRDSMZD3vJJ6PkVMkyT1C1R7xGSu4jPoeGXWcX6m32vbg1Qqw1ZoW2sWBgMWVR6HNtKOwYoIWrUMcR2dz3rtV1GvBoH/iZRmwJRYKuGwu46uV1ltJyFuBD562w8Nj3koxwlT54nixSvNEnrCr8SQTX3eY/ZNoK+FuncjxhP1pGxi1PwZDiJ5CvN4QqNORriqBDvLJUiEwlOVz7cA+9q/2Urx9+XadBB/wRvAZLvX06QEw9X4WKfTG12c85T5B692fDQXThcW2ym4pQebmGf196ikDwvuQyPfWFE+AQgyA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 MN2PR11MB4600.namprd11.prod.outlook.com (2603:10b6:208:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Tue, 28 Oct
 2025 01:39:08 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 01:39:07 +0000
Date: Tue, 28 Oct 2025 09:37:05 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
CC: "seanjc@google.com" <seanjc@google.com>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "x86@kernel.org" <x86@kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "Annapurve, Vishal" <vannapurve@google.com>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"anup@brainfault.org" <anup@brainfault.org>, "Huang, Kai"
	<kai.huang@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org"
	<kas@kernel.org>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
Message-ID: <aQAeQV+xrQB5IFBF@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
 <aPuv8F8iDp3SLb9q@google.com>
 <aP86sdBZxXm5I17f@yzhao56-desk.sh.intel.com>
 <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
X-ClientProxiedBy: KL1PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::18) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|MN2PR11MB4600:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3f323d-269b-4b0b-f423-08de15c2c920
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S58biPjkBzQWQwelfug4uVNLWfl7G2x/vwGlKsFxCt8QPYTKZYV4mI9m8Y?=
 =?iso-8859-1?Q?LWjzqvbhGWFLSByGb8i6CS0x1m/u7CICOmAqBx5aFBDdKyEwL4kM5pt/eI?=
 =?iso-8859-1?Q?xevISIQ6iDoeHT4bDgUwltI4g9vALjupyB0hdLNIZoN7lMDT/wFxDt0VDd?=
 =?iso-8859-1?Q?uVg4lL0KoF6N7tLb4I9mUVlT4dR5eIWM4Ri9h6EgRJiPJCalbAJNO4tO3T?=
 =?iso-8859-1?Q?HPfffZNVH9kMutAhnzDCf0FZez7s3Z7DQvJwWWpijS5p4FVUi8+1WIsLQ5?=
 =?iso-8859-1?Q?zHW7+Q5KrgfuJojKQX20mU4OAuJao5a8K95K3zGhJYQeYy0fYWPx5AIk5w?=
 =?iso-8859-1?Q?/eVg8kC7Doe58IF8Pm+JgGkJ58wFLu1QMU/o8904Y6cSrBg5zfRjq22GW0?=
 =?iso-8859-1?Q?kae7OMb1bOVieIOZ5IjVx/8lmgfH1IyBOn18z8bVV23S7WLyeabm1j83BF?=
 =?iso-8859-1?Q?jeop0NjGNnFtHfR//Re+PDogJoU0QRiy1RD0cwRduJylFmj1bFZW/fCiSB?=
 =?iso-8859-1?Q?eDXaM2MKIcW7FeegKi81JirU9Yjl8O84XeZlJZHxq2e98j/SkQuO5onN/t?=
 =?iso-8859-1?Q?Tsu1C8sN2maGl30cwRRRv6umrBInuv0e1LOYLegvzGPHyr39MOaHjcZ0Ks?=
 =?iso-8859-1?Q?fQ2zHKnzAK5fqa9SlAKl5OSjKbPJwj+cxmMDRr0zxnmYPoK+2UV5qi6i7v?=
 =?iso-8859-1?Q?m8AO8wMwUW2RzLP9t13KKONDqoJ2pghSaziS6bux74i2bUvJ1nmxME20Jz?=
 =?iso-8859-1?Q?9devC6A4Z6SwhNIhoFHpXKE4XiNhczyKzZ6rx5JlWS1NdEsG9i0iTjTfoc?=
 =?iso-8859-1?Q?vJIMzhU16qWYocOolWkfmukn3o7uzUVtIq8ThuhNr+MKsagLVXmaOKL+d5?=
 =?iso-8859-1?Q?Z6F0RyHlR4sYX4iUgOm1IMXF3O4DScHZ205BijJ9zFun3RpIvoAKfK9cxo?=
 =?iso-8859-1?Q?BLsV1qSMCSHsmU9ADI4G9T59kcI4R3tTwUn7Lrk+8TEE5cSD0aUgePL5eO?=
 =?iso-8859-1?Q?q5Ij/82xcpM4ZSetB8/3y3yjng4Jj/gbJjEjfeDR85wUJ4NGPPa3VNiB+b?=
 =?iso-8859-1?Q?mfoBJZ97eT2h/uJsSx+Mm/z+JIY2FfNtzxZ/76W4YQbpW9WoZD/F0BwpyN?=
 =?iso-8859-1?Q?sZ/GD+mrZO2k+OeODAJl1EbeO+q18/wFU0iWuQlr6EaL8Vcq0Sz8NuD2hW?=
 =?iso-8859-1?Q?efBvadkVMOkngccXjqFd0iA7ZRVoL+cA/oBGUAz9AT7K+PrJqV335hqOt1?=
 =?iso-8859-1?Q?NTh2zki7z+6lNDrkIgQWjnLmkBGxuqsIAEX1vOpv8+EqX5jc/sJ07Gto0H?=
 =?iso-8859-1?Q?z4+qJDer6RTpPpMxs2HpJjJKsyV1D7Akrx5dXCwc5Ozx/i5daEPauhd7Ww?=
 =?iso-8859-1?Q?7lm30v0SRJ5sYm4ae5rNZ5+222PNaiVnRjy59OTFVu8BOHKBxn4I6FzMFP?=
 =?iso-8859-1?Q?Kq/rvjdQlt0U2n+YE9XqiB2+xSJFM05oQ3V0Vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1wzqaF31IDJMHeLTV4jsnALPJgtaJZJkPLA3W2XLJEIa8EhvfXWtzv2BA+?=
 =?iso-8859-1?Q?ZbbCxutcQc+3j/UehBVqQZjikUIiqpez3ln1PaBZasQptA3PYjARFQuU6q?=
 =?iso-8859-1?Q?8V//1uPaT+soNlPS+PEgwkeUd/7Iq+PSjElA13wpUsIDTXQCudsjZNMPDh?=
 =?iso-8859-1?Q?9rMsB2yZ5OGtVNJpgh9jTUSxYmn6iaWlJv34SjH9gQEJXp/WA9Ka38xSXV?=
 =?iso-8859-1?Q?/dw6lMwHgZAesDB7+4mNBI89pnlPUplnnBPS5OKj/G6sSZAxew7i4cONdo?=
 =?iso-8859-1?Q?+iSWgJsdVYLEDN3WUP8OROGovStOxzINIpHgjicYmtCorLlxVXEnWU0MH1?=
 =?iso-8859-1?Q?FpygeNOC93xmKRZwodDLbW9wKh2Ncp/mxO5DioDaD4CTe/N4ywAbUoHS84?=
 =?iso-8859-1?Q?mbxFDQsb5mTDEk20osyovN5Rt3GPapOvSWY4oSiTST0PXPnz9nj7luVYh4?=
 =?iso-8859-1?Q?CMFAzOA7tniKEhbLyH/QyvEefPpGpxX7z7yFGoKq2beZvCjgTyqg+0vKPy?=
 =?iso-8859-1?Q?P75A3LEfn88fcnBnm4+/CxnNBCW8rADd5xGNhgmlzvVEnKdqYDewW1XpnS?=
 =?iso-8859-1?Q?nLj8P9Kapykd2hojlK8KQScO1nT8hiOmi1lgSvBgLjoGW18gx77YWpxxgf?=
 =?iso-8859-1?Q?CT1N3Ao/SGeuqiYlkhSKcApvoFgx3p+jRxIVKDhkzntJHVbas4HUX4E82U?=
 =?iso-8859-1?Q?1gQYDYeV5Gbu4kCYTrCJdSB7mP5OUo6A5p9f2O6LY3gzxsnSKcN62/Y8xg?=
 =?iso-8859-1?Q?rvooQZUn2rTMUeAWMDELFMYxjdQXM8X5dpWZAG5Vln3NLJb+joinwsN0wr?=
 =?iso-8859-1?Q?gLu0KeKW+8CfZ4bpLL1k/9mHQ6RZ0vQ6NOZBJk36b4PwF9RfreJpuyPKcL?=
 =?iso-8859-1?Q?oXYAQPT8a1Ub/Qm3oCeUBZD0B6ANMo9PGowN0V0flF1bCSXB7LvhfMUDPB?=
 =?iso-8859-1?Q?xLd7mHSXCB1cM4rHhFWNtOlDZnc1DhWnQEvl0upqfEuXbvX2D1SPi6xwbX?=
 =?iso-8859-1?Q?n3sIQzd+NirzHWTwSUHYtAgkUmniKFUoOUWpgepgs+rxcwBPExm1DzHSrK?=
 =?iso-8859-1?Q?/ZWaNRTMaK2+ui0+dfDYIurgD5MntVy16OFkr/ks6igTUB9T1Qg5bVUWze?=
 =?iso-8859-1?Q?t9N+EbUAlh94X6x0cGCd0mLy64MXIIZ9j0+c02pY8G+TXH4VEr7ePIdajp?=
 =?iso-8859-1?Q?e6+5uLRIPtbEbQeUya/Cnjc3a8eBtdBD/btf5jmcGWGQHbxQFGQc40+n7k?=
 =?iso-8859-1?Q?oSp0f20jNHyoSpvoW8jMQigr+Ly3cuPb+g4HLxC2XUxBcXES4eNO/g3Yhd?=
 =?iso-8859-1?Q?ib7P6ZuIo8ZFF9Sg2EjtJXIeX2HceE086gHtOzAwWmgmHNlFve47HGcNfS?=
 =?iso-8859-1?Q?a6zv0duD1+9ure054Z703n+7PnkVicZgP/1JDDIoXdFS6aIzl/sCG2xe3g?=
 =?iso-8859-1?Q?BhqTmrxdw3RtXwYHxrScYqLARF1MDvnHt626dmSiiMWCowxf1+fS/M5zGl?=
 =?iso-8859-1?Q?VGIt1Qmo0Uqaz6CRptu9i9Xb4R00QHYy/tvYshG+afOtwJ+fw+KsGvZgcR?=
 =?iso-8859-1?Q?rWolgDkWTi9cTs9rcF4/XpsRs9ghrP23aBh58jUh2J1JqC3cfb3jGSqkqI?=
 =?iso-8859-1?Q?o89BPliaRhSpmA6nXHloepEviKLUl/C+in?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3f323d-269b-4b0b-f423-08de15c2c920
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:39:07.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqmZWw5b83oRLCqjfweqeVSm9bzyRSJVPtWBA4ZXWn/wz6KjQTMQag39CQEm2jFHraeaHZau62u0v6YlGXkCaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4600
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 01:46:03AM +0800, Edgecombe, Rick P wrote:
> On Mon, 2025-10-27 at 17:26 +0800, Yan Zhao wrote:
> > > Ugh, I'd rather not?  Refresh me, what's the story with "v1"?  Are we now on
> > > v2?
> > No... We are now on v1.
> > As in [1], I found that TDX module changed SEAMCALL TDH_VP_INIT behavior to
> > require exclusive lock on resource TDR when leaf_opcode.version > 0.
> > 
> > Therefore, we moved KVM_TDX_INIT_VCPU to tdx_vcpu_unlocked_ioctl() in patch
> > 22.
> > 
> > [1] https://lore.kernel.org/all/aLa34QCJCXGLk%2Ffl@yzhao56-desk.sh.intel.com/
> 
> Looking at the PDF docs, TDR exclusive locking in version == 1 is called out at
> least back to the oldest ABI docs I have (March 2024). Not sure about the
> assertion that the behavior changed, but if indeed this was documented, it's a
> little bit our bad. We might consider being flexible around calling it a TDX ABI
> break?
I apologize that the ABI documentation had already called this out earlier in
March 2024.

I determined the locking behavior by reading the TDX module's source code,
specifically, from public repo https://github.com/intel/tdx-module.git, branch
tdx_1.5.

I checked my git snapshot of that branch, and I think it's because back to my
checking time, branch tdx_1.5 was pointing to TDX_1.5.01, which did not include
the code for version 1.

commit 72d8cffb214b74ae94d75afce36423020f74b47c (HEAD -> tdx_1.5, tag: TDX_1.5.01)
Author: mvainer <michael1.vainer@intel.com>
Date:   Thu Feb 22 15:36:58 2024 +0200

    TDX 1.5.01

    Signed-off-by: mvainer <michael1.vainer@intel.com>



In that repository, the latest tdx_1.5 branch points to tag TDX_1.5.16.
The exclusive TDR lock in TDH.VP.INIT was introduced starting from TDX 1.5.05.


commit 147ba2973479be63147048954f77a0d7248fcc35
Author: Vainer, Michael1 <michael1.vainer@intel.com>
Date:   Mon Aug 11 11:53:07 2025 +0300

    TDX 1.5.05

    Signed-off-by: Vainer, Michael1 <michael1.vainer@intel.com>

diff --git a/src/vmm_dispatcher/api_calls/tdh_vp_init.c b/src/vmm_dispatcher/api_calls/tdh_vp_init.c
index ccb6b9e..ee51a18 100644
--- a/src/vmm_dispatcher/api_calls/tdh_vp_init.c
+++ b/src/vmm_dispatcher/api_calls/tdh_vp_init.c
@@ -114,6 +114,17 @@ api_error_type tdh_vp_init(uint64_t target_tdvpr_pa, uint64_t td_vcpu_rcx)

     api_error_type        return_val = UNINITIALIZE_ERROR;

+    tdx_leaf_and_version_t leaf_opcode;
+    leaf_opcode.raw = get_local_data()->vmm_regs.rax;
+
+    uint64_t x2apic_id = get_local_data()->vmm_regs.r8;
+
+    // TDH.VP.INIT supports version 1.  Other version checks are done by the SEAMCALL dispatcher.
+    if (leaf_opcode.version > 1)
+    {
+        return_val = api_error_with_operand_id(TDX_OPERAND_INVALID, OPERAND_ID_RAX);
+        goto EXIT;
+    }

     // Check and lock the parent TDVPR page
     return_val = check_and_lock_explicit_4k_private_hpa(tdvpr_pa,
@@ -129,11 +140,13 @@ api_error_type tdh_vp_init(uint64_t target_tdvpr_pa, uint64_t td_vcpu_rcx)
         goto EXIT;
     }

+    lock_type_t tdr_lock_type = (leaf_opcode.version > 0) ? TDX_LOCK_EXCLUSIVE : TDX_LOCK_SHARED;
+
     // Lock and map the TDR page
     return_val = lock_and_map_implicit_tdr(get_pamt_entry_owner(tdvpr_pamt_entry_ptr),
                                            OPERAND_ID_TDR,
                                            TDX_RANGE_RO,
-                                           TDX_LOCK_SHARED,
+                                           tdr_lock_type,
                                            &tdr_pamt_entry_ptr,
                                            &tdr_locked_flag,
                                            &tdr_ptr);
@@ -190,6 +203,32 @@ api_error_type tdh_vp_init(uint64_t target_tdvpr_pa, uint64_t td_vcpu_rcx)
     }
     tdvps_ptr->management.vcpu_index = vcpu_index;

+    if (leaf_opcode.version == 0)
+    {
+        // No x2APIC ID was provided
+        tdcs_ptr->executions_ctl_fields.topology_enum_configured = false;
+    }
+    else
+    {
+        // Check and save the configured x2APIC ID.  Upper 32 bits must be 0.
+        if (x2apic_id > 0xFFFFFFFF)
+        {
+            (void)_lock_xadd_32b(&tdcs_ptr->management_fields.num_vcpus, (uint32_t)-1);
+            return_val = api_error_with_operand_id(TDX_OPERAND_INVALID, OPERAND_ID_R8);
+            goto EXIT;
+        }
+
+        for (uint32_t i = 0; i < vcpu_index; i++)
+        {
+            if ((uint32_t)x2apic_id == tdcs_ptr->x2apic_ids[i])
+            {
+                return_val = api_error_with_operand_id(TDX_X2APIC_ID_NOT_UNIQUE, tdcs_ptr->x2apic_ids[i]);
+                goto EXIT;
+            }
+        }
+
+        tdcs_ptr->x2apic_ids[vcpu_index] = (uint32_t)x2apic_id;
+    }

     // We read TSC below.  Compare IA32_TSC_ADJUST to the value sampled on TDHSYSINIT
     // to make sure the host VMM doesn't play any trick on us. */
@@ -282,7 +321,7 @@ EXIT:
     }
     if (tdr_locked_flag)
     {
-        pamt_implicit_release_lock(tdr_pamt_entry_ptr, TDX_LOCK_SHARED);
+        pamt_implicit_release_lock(tdr_pamt_entry_ptr, tdr_lock_type);
         free_la(tdr_ptr);
     }
     if (tdvpr_locked_flag)


