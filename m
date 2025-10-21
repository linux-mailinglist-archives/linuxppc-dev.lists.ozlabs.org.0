Return-Path: <linuxppc-dev+bounces-13074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E589BF41C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 02:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crCNm57pLz300F;
	Tue, 21 Oct 2025 11:10:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761005416;
	cv=pass; b=Ifarlj8abU8m8RdWhLgOq7czc+np7SeFS6iJRixsoRvDBv+wfHHBWfCSZ8r1aBHzmGnp1Y8FsYBVq0QTpL1fQSvJsPDpYPjoEGhnw4/kC/W7/X7lEWQH5+tACbNUVCqEwqR6YicmkrpdG9xYJKiHHqZWSymWtsBXHKqlJDWA4sfZVTtoPSr0LwToBgWyalXUU/+IO7Imo4qt3/36ipnSTa0VNeGN0zYNNfeoR+YI0LXNM0H/zK4TdzHjFd7rvLfu3LjuI4wSte7Qy0MJgn4wIHUOZHj9PDNp13XoO5//OLoYCRmTBFIwjzIUhj+BNX9RANOYSrwgUFsVj7KSn20spg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761005416; c=relaxed/relaxed;
	bh=MSHGHL1kg+91HRrpNEijpyeXDhwtChoLLZaPDhiqhPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cM4u3SIN6ueI3Zq6m6tvcRN8lk6NO8fi+1sN4+VSFLWF406SbU3+1MaNmLPPcrco5SCbZoJ3PWwUOSV26xiQ2UzJKKtADowQh9sjDEIeEnXrPP0YU+l3+yBnaDmQXKd1RGheT/OvzFtLtCFLyIwfbYoNaa2fVwZjazgS4Fjp0r+/JC7Fr6NDweGVBss/GK7DMkOWS1oZbuDukrX2ChK9I0H8zgMTMYqO/7reuqOGLFHTyxFU5iKhAezFR+DPNPahMV7ty/HcHY3z/3QAUw1Z1NY0AHCLEqnpU7QdR4v63JPbVu5qbuNcdi9GT4sJ2TjXLLCMV7EmHHJpQjj3wJENTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E0SLvCnv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E0SLvCnv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crCNj6cp1z2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 11:10:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761005414; x=1792541414;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MSHGHL1kg+91HRrpNEijpyeXDhwtChoLLZaPDhiqhPk=;
  b=E0SLvCnvMyVJf/WsPw9ugMppjQDb0KMlAvlz+hWGGFFTil+aoTYpY1/a
   3FldUCs9yq063ZmfOT48KYbSOi9//ipC1bJCnDOyRDYb8GSuLr2jNOkwf
   8T7G2B+NoPHpqTFFVaSLYbr6JArToXd6S6+P5TFpyXGC/8p3fsPhMgcnd
   bKxVjkPC3tiTIV3pHPlPPD75JImyCsqiUuh0JeExBtb8qGTZqQ6ttYXpz
   mUkVdQpYJGd4SaCSdynsvKMS6gVIZkdXvfhDAlTXskJtl0nwJyOTFVRDm
   iu1cnanlp3efKDHogr0P0TVgOwEds4r2xXsZOssVeAV1tjLv/c0l1GRx1
   Q==;
X-CSE-ConnectionGUID: iEK5/g0PQHiFaMxDHbcMWQ==
X-CSE-MsgGUID: x0jCujQNTyixYzDTsn6pqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62830378"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62830378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:08 -0700
X-CSE-ConnectionGUID: xP+SmBUOS4SwiMv6SWqg6w==
X-CSE-MsgGUID: jW+WdEUjSIO7RleEpuvbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="187481773"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:10:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:10:07 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+Xh6Q1nrvkZ6r4qkTaJPmaC6jjIVnUYV0/dSv4SrJGrNC2IFcOaIG7Em9ZiSGgFmbkMhk4OJTV1uZcUGKr0GJumERlbQCqkk4gGWFOouO+Ic77+6KhHsyriiOc9E9EVjcgfBIhu5VROoFWfC9VnvtrWb+JPfeiZD4o0KTTKQb33cMqH7SOKmJwiTP/e3DXXx6Rn13s6ueMxKP0+kP5zhU7U0gb/wjYKhPHXGN8O2pOQM7DdTtVNlr7gggMbtxP6slE8+nqZnvkjqqvNv/LfqYdGP/w/qg+eE0HBESZbviwYWG7FAGhE7WbC+/xsLVJHTQVTMjsqOYShlSMGwRzJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSHGHL1kg+91HRrpNEijpyeXDhwtChoLLZaPDhiqhPk=;
 b=kprgCuPdf3AbWW5uFc6lLor47oINBsIMjbx2w8329cUvlA0kMIiWcoHsSWE2A35tlJ7IhzMW7L+E6MF3Cgjs2SV9VRgZe1eut4InZ8aFkRiRZKcCS6A4tNMa+d+hF5h0XZ9YXxT4wcqykcz2n7zBsMhBJi9DW10oG3chvR/+GdAQPdBylPK8CVVzSJBVcAlwNFNYWAScvk1Ew7rpdJusCOs+ru0j1ip+vWUROCxl9aJ5vkzOVQT8t80qf7fuTM1ChVWsMcKlwXGULMAF1v9Wth+Qf1UyYuhTVeHeocNtY9GGY1NcHtoYQRga9ic52tqddXF8KZZ/AcuiDb61tapkPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:10:03 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:10:02 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com"
	<frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com"
	<imbrenda@linux.ibm.com>, "zhaotianrui@loongson.cn"
	<zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, "Zhao, Yan
 Y" <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira"
	<ira.weiny@intel.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "ackerleytng@google.com"
	<ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"Annapurve, Vishal" <vannapurve@google.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in
 tdx_vm_ioctl()
Thread-Topic: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in
 tdx_vm_ioctl()
Thread-Index: AQHcPv2wOE43VneGUkej4wzVYW2G37TLwBqA
Date: Tue, 21 Oct 2025 00:10:02 +0000
Message-ID: <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-24-seanjc@google.com>
In-Reply-To: <20251017003244.186495-24-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS7PR11MB7950:EE_
x-ms-office365-filtering-correlation-id: 29c03703-c7d5-4587-0045-08de10362e8c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cFhpNlRJQ3BOTG9hbERSRGFkdDlhdXE5RHduVjFKQVJQVXAzMjhyNGxSQmcz?=
 =?utf-8?B?bXZVNjhWaGdYaERBdUloMmp6Wk8vcUdpMVB4S2R4K0RFTmhwdzFNTVB3T1RB?=
 =?utf-8?B?eVU3dHE5N2ozM2svYXRmMCtyajdtMm9MdHJUYWtZRTA3bi9adHpJb0ZVUFUx?=
 =?utf-8?B?ZmZneFQrY3FTOGJmTzdGYnF5d0JGSG8vUUlYMXJmTEVMS0ZXcTFYZWk1Z0h0?=
 =?utf-8?B?ZWN3aGJyanU4Tm5TeVpVTk5DOWVnbXhWV1dJcndwa0g1cFlFYTdTMWpUMlI1?=
 =?utf-8?B?dXBpNnNFcU8rRWlrRUxPUFVyeHB5UFFlQmFJdHFPaUk4VmVWSlJoNlBET2cr?=
 =?utf-8?B?MkF4NXU2TUZPeGFwNjFoa3BlKzdjYURaV3MveWR3L3M3MlM2c3VINUYzcm1j?=
 =?utf-8?B?WnlYcUp3b0h1Y2VZWHRVbE9laHpWVGZ6ZWdvekdSbDVOS0c2QVFkMVVxRlZ3?=
 =?utf-8?B?TFc3akcxRk9HSCsyemN6VmlZYzBPZk9HRjcyWHRsOWlZSWdCZ0J6cERRUVYw?=
 =?utf-8?B?VGttejExUUs4UFVZcEw5R1ljWGwycGZGWlhMS2JYN1BTYWt3YTBOa1JWWGlj?=
 =?utf-8?B?dmt5QjFBR2dBYkJZVFU0R1N0VFNZVDBvdGpEcEo3a1Z3akdxYWgxTzRRcmlY?=
 =?utf-8?B?SlFTdkdxQUJlb2VSYVNDWlhVVHNyeXdRQ1lPdytsQk0xNkgxakkybGNRRDlQ?=
 =?utf-8?B?RURpdHhjWWN5aExTNEo5SVl2WlgxZTFEK05GVDZydXVGd00rbVdnU2lMdG0v?=
 =?utf-8?B?MSs5NWJvalpNSkgvNmRzaE1XMmpRWmxCcXMvcldyOTRGNXJpOVc5OE9Md1gy?=
 =?utf-8?B?QnRaaHVRcU0yR3prZkdHblh1N1BlekV6Q3h3cmVjSjdRTFJyMmZYVHI0Q3Uw?=
 =?utf-8?B?RkdCMWRKNHRVTUFjK1JhRWRPMDFNajBRWFhEbEJMd283YjVyVDQwdW12QkV5?=
 =?utf-8?B?QkhGajhrYlkwNVA5ZkpiUk1XOXJYczk3NnhkZjZKSjh6bjBaWnRlU1pDSy9Z?=
 =?utf-8?B?N0xueGltcFlraWZ6WE9Jb2JTamdseUNCNEltblNvWFNrWDBLYlZySlIzcEVD?=
 =?utf-8?B?ZU5iZ1Rjc2RrdE4wTGFIb2luT0JFbHlScC9PZU5vc1V0M0Fud1RPZW1vUzRI?=
 =?utf-8?B?eXNyMHFBSDFMTEFtYzRWU2JLam0zd2FQVXc3YjdMQll5OUE2MmpWTTdnd2hz?=
 =?utf-8?B?QTNBcEhLTTgzOHl5NHZqVjVwcG4rL3FIbnZLdUJ6V09tMTRsVFJWQ3BMQ3FO?=
 =?utf-8?B?V1VsOW5rREcxY1hqUm4xZTB5cGkwaEVtd2FEVjF1T1VTK3BFeGI4a1VmbWhV?=
 =?utf-8?B?TXZxVkFVZ2IvamNBOFJWb2l6cHN1OUJhYTc2VnpHSnlsY0xqQ05jZWNVTDdp?=
 =?utf-8?B?TjFtQmI4bWZJVS9PMGpGMTFzRCtOd1QySU9tVWpseVBJbFFQVnlBcStNSVlr?=
 =?utf-8?B?Vi9pUjVoeExRRDZ6bnA4TFNpQUtBeVVneTZHY3FWVTNoM0tXb2M0U21UVDVM?=
 =?utf-8?B?WGxkY0RFSnY4L2dhbHY5ZDRjNmVicDVvWHpCUVFvTklpODJWcHBYUGN5a3JH?=
 =?utf-8?B?Z3JGWTdpQ1lXakRPemQ2V0dmR0Z4QUJCUGpJN3o3NXZ1bXJ6NGU5R2ZtN3pI?=
 =?utf-8?B?SzFORURRdjJreU1vNm9ubWFwN2tsTmhSMHVGeEdNNHBqRWVyL0hjdTVQTTha?=
 =?utf-8?B?NWRZaktKSWc0anhpWllaV0dlU1Z5YWFnZm1veUhhQTNKMG5zVU1hM3lLbkI0?=
 =?utf-8?B?Wk1DYkNrazkvVkMxVG53aEc2MWt3VXYwMjJ2K0JWcTM2Wnh2aDdSNnhNaEZO?=
 =?utf-8?B?UmZWZmNhQ1hxN1RwaXBnRUU1YXVUa1lyYlR2WEQzblNPbW1vSlN5WGxEYUhi?=
 =?utf-8?B?N2I4UTVGOFFjTzBNSkt1SUZQMXowZ1hQRXM3YVhrTkFJaHd1QUlYL1FmcURS?=
 =?utf-8?B?clpzVEZPYVVmYm44WVRoNTdkMUpFbDVDOHJTVnJ4cC9UaHAxUndTcEc2b3Qr?=
 =?utf-8?B?eHlnbXA2YVFaQjkzbUtZckJqNXJNRkhvZlltNmFmQnJBRTZrdFFQZG9JWEpP?=
 =?utf-8?B?TWhOd04zK3ZobStEcUEzVU96V0V2SEIxZVBIZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTUzY0Jxc1h2ZUVVVHk1MUdMVllRL3UxK3E0cnhBbVJ4VnN3Z3kwb2hucFFV?=
 =?utf-8?B?SUR2aThGVmxLTHBrdStTL2ZNTnY2bjJJbnFRMmZ6cEkxVHRPdXVCZFlOQkpV?=
 =?utf-8?B?UFZTZ2Y0VnJtY2QxMWFkek1CSzZtUVY5bm9aQUZFQXYyRGg1TExJc2FEdDJv?=
 =?utf-8?B?aTNqbENrRFNkNzlPSWNOU3Z5ZFI3Qm1POWJVMmtHZitNNUJlRFVPTnlscDFG?=
 =?utf-8?B?SUwxcUlMZFNUU01hZEtIMldFOTZOZGJ2T3hzYmd5YUJndm5KNFJPTG1jYWxR?=
 =?utf-8?B?Q0ZhcnNzeFg5emJsQ1h0a3ZJdjhQbGczM3pCS3F2MjFIOW42TC9SZ2lxL25Y?=
 =?utf-8?B?VTRMNDltN3hib3hGUmtQR0hzVGpsU3BBWjZqRTZZSndYb2owZ3JDQzVabVFn?=
 =?utf-8?B?d2NDUHhrTWt4L2VJQngvbE5HcS9CWitjWXplZC96MkpxMi9NdFJraGJ6MjJC?=
 =?utf-8?B?YS9VRVRNQkRHcHFoN1FieXFOWTUvUDlLa3VEZHVVMkY2OTdqdXdjbWM4RXVY?=
 =?utf-8?B?U1VqT0FOanB2ZDJGWkZOUTZWbWVseTcvdHIzK2l4dWNac0tCRmJpZ1RkQ29w?=
 =?utf-8?B?VEw0NTJmRHpTdkFOVDhpblA4bVIxWlk5WlRkcVdrc2xVY2hUN1hrbG5jc1pz?=
 =?utf-8?B?d1RsV3g5cjRralhrUU0vWHdseDFvZ1hYMmFFSE9CODRVZDBFNmk1ZWtGVzhk?=
 =?utf-8?B?enlkL0VIdTlMNjhqM0ZCQjZMclVNN0l4VThWcjdXSzFoL2Z5MTZ3bW1WaGxn?=
 =?utf-8?B?ZnIyTVR1d2VHbkFmeGczWkVHMUxibmE1WGs1NTlEbFJwaTE5dDUzc1MxVWFK?=
 =?utf-8?B?M0l2UlZxUEcxTi84VVp6ajJLQUlBQWVUb253QVdBQnVnMXoyTEdzTU1JNUJY?=
 =?utf-8?B?RTllZElDRllDU3ZQVDVVQThXWi83emRUSE9SMWJ3WUxuVXp4NGN1dC93Vmgv?=
 =?utf-8?B?MDVRckMwZ3FrSkwzTHJUcE0wckJESWQwUlJVQkgvQWRVcU9CYmh1ajJNNWJh?=
 =?utf-8?B?NEY5M084TzdIdVFvVzNTTENxZFMra3NKWGdBd1pBcjdGMFhwNHdycGZ0TCt0?=
 =?utf-8?B?dnc0V0VIYU1mSks0b2pKdU5oN2Q1SkkvSFJ0SGsvMEM2OTlsV3pOZUo3eXRK?=
 =?utf-8?B?MjBMb2lrTXVUa3JNK3I1YlZqZEhmajQyT25PNFRsSTVmYVl1Y0k4NGZsWEFr?=
 =?utf-8?B?Q0Rydm43UFd3WHRtWkM5eWk1NldwYVFNNGM3Z1cvdkVaci8yQU9DS2NsWXlG?=
 =?utf-8?B?YitjM1RHUjR0djV3c2Z6SWJiQW1xOHdjMUpldWt5U0lBQ2xQeVhJWWZFY3d4?=
 =?utf-8?B?NzRnVXdrd3NzMHlvblYyMC9rZzIyM1JLWjlEakhtZ0l3c3B4SDhaeUFpbmFj?=
 =?utf-8?B?RWV4dW9MeTNiU0l3K005d2Jpbnl0alRRTVJpSStjT3FWVTZqOWJqUEM0ZExv?=
 =?utf-8?B?YVlwR29VRmtzWUR5aUtraVpVcUQrS1NTT3ZiaGU1MG9IK05veVBuNGRvS3d1?=
 =?utf-8?B?UU1XQWlGYzIwTE93LzdiT2xOSU0zRVZsTGtkZmg2SXBmMTRXTXcraDlKOGI2?=
 =?utf-8?B?RXd1NlFBMkZmN2xhODFwczE2dmd2YkhkNk96MkM0ODlxaXNLQklESU1jeE5h?=
 =?utf-8?B?YmpqdWo2VW40WFhPNW1iYjU5VmVBRi9FYm1TMUJ4UERTcWI4eWtkYktNMXVj?=
 =?utf-8?B?eHZ3bWtWeXE2V3BYelFVK09HREZ2a0hnejJ1VWU5UzNtcHNmd1NHUE5QeUdW?=
 =?utf-8?B?TTE4R1dabGordXZDUFRSRzdOMUhHalFVS3NMUDF4MGpSYWdLOXBzRUhwZ2FM?=
 =?utf-8?B?RjkxQkFicC93QjdKY1FjZW1MMlNwY2lucituNFBibTlBUlpCdmJSVFdxanhO?=
 =?utf-8?B?b1NmVmlZVStZQUxDL09aMnMwSnJmTnRvS3FyN1h3MFpJZ0RFaWJlR2JaVStv?=
 =?utf-8?B?bTFESzU5UVk5a001Q3Z2bzdDMWhMY1F1ektKZTJ2cWdnVW9Qb0FOdVorYUdK?=
 =?utf-8?B?UW1lWTAvVGRxSFhIV1ZJZGNSV05GdDgwRmJwNjUxTy80b2JZdzczUHV4MUtD?=
 =?utf-8?B?dEtDTEJ2bzBlQlZ3Q0JGR2pka2FrSG5zYUphRWE5bG1obkt4eWgvWTB2dFNn?=
 =?utf-8?B?d3RaeEZUcm1MdGhKQXJrUExJaGRJb0R2SzVGZHdvN2ZoeEwzbXp6c3pDKzQw?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79FE8ADA9364F14A96032BD3EC1BCAB8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c03703-c7d5-4587-0045-08de10362e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 00:10:02.7909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6l5Q5W+qaqaptVSxPgbRKAttoqB++aODfQ6bbirSGEtmcIt6vOa9pURyddiDC/vcIhrCrcUZk4Od0G4Fso0nXjNuS9ON/DYQ7PFe3G7C5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBVc2UgZ3VhcmQoKSBpbiB0ZHhfdm1faW9jdGwoKSB0byB0aWR5IHVwIHRoZSBjb2Rl
IGEgc21hbGwgYW1vdW50LCBidXQgbW9yZQ0KPiBpbXBvcnRhbnRseSB0byBtaW5pbWl6ZSB0aGUg
ZGlmZiBvZiBhIGZ1dHVyZSBjaGFuZ2UsIHdoaWNoIHdpbGwgdXNlDQo+IGd1YXJkLWxpa2Ugc2Vt
YW50aWNzIHRvIGFjcXVpcmUgYW5kIHJlbGVhc2UgbXVsdGlwbGUgbG9ja3MuDQo+IA0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCg0KVGhlcmUgaXMgYSB0aW55IGZ1bmN0aW9uYWwg
Y2hhbmdlLiBJbiB0aGUgZGVmYXVsdCBjYXNlIGl0IG5vIGxvbmdlciByZS1jb3BpZXMNCnRoZSBz
dHJ1Y3QgYmFjayB0byB1c2Vyc3BhY2UuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hy
aXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KPiAtLS0NCg0KUmV2aWV3ZWQtYnk6IFJp
Y2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCg==

