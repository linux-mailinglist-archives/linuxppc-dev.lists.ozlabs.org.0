Return-Path: <linuxppc-dev+bounces-10387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C831B0FD4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 01:22:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnVY03t54z30T8;
	Thu, 24 Jul 2025 09:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.11 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753312964;
	cv=pass; b=IfDPDrELnhflxr0RJdqC6PI9iFV3Ldh0b+lBYlqsvxZlK+j+i+sYnnrq2EOqCNConeVw6YFP+Ejr5UCLA4dDxTJV6Jr6TdG0VODNJmEkqkrdxF+0pSNL4hsCu5MrYFfcJiabKM8HvAs81VmWBuOdzrR4bkMEWnzrJ7BMS66EkrS+NtrDwpJUlQXJ7igjeafdWE2VFihRJlaxmj6u2xuM2PV5IwNnsFYGx22wbePCgZhsvD09NlkWJ54MxCEJxIm1pd2/zn/X6Dkv8bVVH4UA6ARFuD8eqMvX2dm7U6qgOC0Xr34Nid8fG/k6fPauCzv54SnqZLsG4w1oCuG+9M5sQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753312964; c=relaxed/relaxed;
	bh=wNgbn9Nkd4DI2k2kvDhVaDwruO0NF20bGQvNXIOEIKs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E+8VxPbaIfPjfOH3lqeABLk69INen8/dDwjNO3hMoamUqfNjrgtZ8pyNspbEgq/skhnykqR43PCbJYpRSQVHyGTyFonC+CyqOU45eQc7DNCc9kd7rM5jt38YF7Jao/JHv0YRJAYyCDei1gt4Anbu6D9/U1X67AXKYDalneP4rtofT/ZvJvSucnZ3u0rbSryJKapLjX5cRCsmjaE4RKKTyK2kJv5o3XSwZD72gaYwzLSqIMOUKCjkgDUFIU19Th0xG2ItsP8YuU0WyP6P8Z2IFjV+4TxNA32PVgs8E6+U+hJzZJ0UWtawCxqf4OqLsnM7jOU932CRNKntYzPYCR85Fg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODon828s; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODon828s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 24 Jul 2025 09:22:42 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnVXy1rHjz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 09:22:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753312962; x=1784848962;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wNgbn9Nkd4DI2k2kvDhVaDwruO0NF20bGQvNXIOEIKs=;
  b=ODon828sHf+x2ahhvVx5uU9yQGuDOFTgcUWjCiaaRSJ8Ky0Px7+tUB/O
   xjcpR/fRaKj+e7Aeh9G3vOIxc8d+aUQxQPMdzOyl2sX66iRedq8bJ2iya
   Wq2sFFxSbMgmILgVaco6bWmwC61cqUuYCS+BNGp10vEx1xKYjly1V5dpU
   8xZ7VFJmAJJfwj0Ybvs8b6tXQtoWQmJ66JfxX5SuZO4PtLBMBcb5O1vEf
   mh6mYSWEPmbIZT0wSsQLTVuGPbQ6++Bd5W1CyBc7LqGa1gR4lWXa0rd9i
   KVhQeJKkOmtBHdqkSHcgZG8meyMUPAE9HpsbDQ1qRlP7hiW6S54TY7qe3
   A==;
X-CSE-ConnectionGUID: UcjrU9F3TW+E9bbWEBTNww==
X-CSE-MsgGUID: G34MkZsiTpSxr6CTAwuq3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66175637"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="66175637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 16:21:33 -0700
X-CSE-ConnectionGUID: 6ZgzTgRsSoeh1qTzxfWHhQ==
X-CSE-MsgGUID: bmZ+XgU3RYSY+awP/M5RQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="164292383"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 16:21:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 16:21:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 16:21:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 16:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDB9ZpnT080x1o6vlGThjKEhuUsuy0U2tW34Hg93kmqTobyapO5KJBkh5QIMAsLd1cDbRPjYrd81jrDiv8uQTQ1YlUtQo8FXWH8fCZMoXpw/GFbPHUi1mv63U3ewD2d9IVnOcixJH15+EB8k8qEoRleXTQ1x3gB/tthQIbWzfa8tGNhXSiBeUzn8Z82ZANG5Dh+pXAbUbdZF+hKqTcVDe2pJ7aPR9wRT2ocdbRaUP6OSOl+K2vOaF0BlxvpIAtFW2WF1yNCVB58nPc3vZ3T/ccmhK9LP+4YQJJSDewMtkjkU/Wwht4T3Okw9JZ/PDUTgk7LE5wA/lQ41FWBbCwbM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNgbn9Nkd4DI2k2kvDhVaDwruO0NF20bGQvNXIOEIKs=;
 b=vFe2hqEqORuYoKsLKU1+RB4waMtEwktTx7qG1VSU8tPlsGfS888FPV4C+QrfpxLKc5C5auX8D/WNdczGkI2oIftx7RFi6/ZnLLJw6zeBWLlzwG9AJWEqEGhiNf/1qdeVjm0HhRLMtze+qRDaLdQc4d91aDjd3WhYgNC1OlKEVzX5ttqbrrIENMOrPvTkeSESg6weKNfiCwznHRvoHd3Lf2h0gvA0jj1u3TmeNJwEuUL5gA70h6VSgypSgQKYyuHfDuqht7ztigOA9ZEsSViseLTI1RaP/UmBBnC69IBYgzkWKxfPo8zE8MGdybDHsvRyMDozHaMb+lASN4VJbRBBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 23:21:28 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 23:21:28 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "leitao@debian.org" <leitao@debian.org>, "bp@alien8.de" <bp@alien8.de>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "xueshuai@linux.alibaba.com"
	<xueshuai@linux.alibaba.com>, "acpica-devel@lists.linux.dev"
	<acpica-devel@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "oohall@gmail.com"
	<oohall@gmail.com>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "osandov@osandov.com"
	<osandov@osandov.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"lenb@kernel.org" <lenb@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "guohanjun@huawei.com"
	<guohanjun@huawei.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, "Moore, Robert" <robert.moore@intel.com>
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Thread-Topic: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Thread-Index: AQHb+ynEYh+BU5c8oU6hhOfTwrXwQ7Q/xcqAgAATGwCAADj7AIAASNEA
Date: Wed, 23 Jul 2025 23:21:28 +0000
Message-ID: <78760c59d6327585dcbd18ca51186c7860a47975.camel@intel.com>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
	 <202507232209.GrgpSr47-lkp@intel.com>
	 <cdlrppnrheyq7z3gmwmwsmktpmoiwq7g5hxa67rcx4iem5i6ge@jksa5o5use4w>
	 <20250723190048.GBaIExYJYiHWnSBFye@renoirsky.local>
In-Reply-To: <20250723190048.GBaIExYJYiHWnSBFye@renoirsky.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS0PR11MB7443:EE_
x-ms-office365-filtering-correlation-id: 2e452d6d-f3d6-4eb6-7989-08ddca3fa6db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnNEQ2xKRnArM2lNaFFXcUVQZFM4VHR6RnVqL2gxUHRnZ3lqL1FpYjhScENr?=
 =?utf-8?B?K29oU01NQ25CTitKS1NsK3ptd1Ezbmk4bkpIWk55MGxtSmdQMHhiZ3ovWG5W?=
 =?utf-8?B?M0U1QkZ2dC85MVEwZGNvQzNnMzRwNkFOYnpDR1hLZ1RyNUt4ZldrbjVoVVpq?=
 =?utf-8?B?Q1RMQmZsY3J4ZDg4R0twOWk4VWVHWVVKekNuZDJjWXhPbktDYytDN2doV1Bv?=
 =?utf-8?B?RHpPbStnUHY2N00xUXg3Ri9pMFRCZTh4RVBRQnJjTnJpN2c0YmlKcElOVG9G?=
 =?utf-8?B?RWNqbUp5dmhLMmpleDA1eWh2MVZoa2d4aWV0dG1TMHZoeThFQVlXNlcrSDBi?=
 =?utf-8?B?ZW5jTkt1T2pkQVFOSThNLzFuQnVuYVN6bFlBWXloY1dJWmNYanRmOHJBWjNC?=
 =?utf-8?B?Y241NEpvUmhlaG5RRmhvTkc2U2FHcHZ6ZHBUSHBqdGc0a3g3OTA5bVhrUFUz?=
 =?utf-8?B?cFFPNlZXOVpGRDZsMGE4Q3k3OGxhTVBMQUtrZ211cEJpeUNlQjNERHNaZnNK?=
 =?utf-8?B?U2xNa0R0UFlYZ0JpVWpmaWRRL05FUG8xYnNRQWx0THpqSE9aRjVPamNCZHNI?=
 =?utf-8?B?MHlBRUtXRmlNMzN2dEE0UTkxVy9GYmcyMXo2NHpqc3FVNWlVT3FtbUtFVnZU?=
 =?utf-8?B?SUpEUWN3WmtKejcyVTFFb3ZuckxNYk1kQnNGelZJd1dBSzVRUXpyL21LMzMz?=
 =?utf-8?B?WUR2dEgzWDU5cy9Sc0hLNjh2bFBONEpjTUkrRi81cW5xQm1CWFZaVjRtelBE?=
 =?utf-8?B?OTUrWHI2RkZLeDNIWG01Y0VIK24xZ0hISk5pd24wV2REN2RZVlo2WGFJU2JV?=
 =?utf-8?B?L3VNQVdsa0RRZDI3R2dUZkcvU21xM3o0QnpWRFNLTUdQV2J4VytIVzR4RWts?=
 =?utf-8?B?cURjNzVWVVFvcFVaKy9uNUJmVFZKSGdVaU9saWVjdDh0ZTEwWHdoaldNa1pR?=
 =?utf-8?B?cm5TQ0kxclZmRGhLdjVKVEpGeXZ6VVc3YWQ0cmZnM0JTejF3dTdjRjhhT0Qr?=
 =?utf-8?B?clAyNUgvT0hMRGwxdlNHMWI3YkhwY1ZaejVadnM3L29IVWtRTzR2V2cxNEgz?=
 =?utf-8?B?OTUxcUllTE9sbUhDS3FzSDNvSnpqVjBFMVhRb1dkMXVtSDcxdElhTkRSRTRC?=
 =?utf-8?B?RTRyc2lIZGtBRXFrU3FOQURObXFuTFBiYlNxN0E4TVZsZDBvU1Jpb3F2SmM4?=
 =?utf-8?B?RWgxdkNnUXlwWWh5Sk15Y0VqK2Nrb0M1R29WbGxzamNsZk05YjBSTEIyTW5W?=
 =?utf-8?B?WEpkcDdzOWozT0pUamhxSWE4b3B4MG1tTXJuc0FrbW9mYThLQnhUb3dEdUMv?=
 =?utf-8?B?SVJHbGVjOTRnZFZMNGZTZThZVUtkNjFpckpuWDdEQ1pDRDllNTBsbFh0ZG9K?=
 =?utf-8?B?clNZaDdzVTRlaFBBM00yTmFMS2hjbm1KS0RSL1RBN01yNG5YU3hrVzZqSWdU?=
 =?utf-8?B?TiszNGs0MVFiUTJGS1E4bFA5YTJDQ0txeFFRS2plM2hWc0o1Q1ZQWUxuVkNI?=
 =?utf-8?B?YnZ1R2FyV3ZwZjdTczUyQUplbElRMVBPWjZKcUFLZXZaNG42N2lkQ3NBK0ZK?=
 =?utf-8?B?dnpoclVKSC9RQTJqQjE1VGJmb2tMb2hqdDlrUnEzUlNVUTdLUVp3aXloVEt1?=
 =?utf-8?B?RlBOSkFMT3lsU2NuQzZacTVDOXo5K2t3R2lQQXlJL21Kb0g3dFZEbXlCMXVp?=
 =?utf-8?B?S0ZhSmtyejhub1c1WnI4MkZZYnQwNFNnQ21EbGN6MWU1VmYyem0xcGZUNHY4?=
 =?utf-8?B?b1Qvd2E4VFRvQ1FjTUdaalJuUE5xRWkwNFgzVXFkUk1CK0FaeEt3K1RUU2xv?=
 =?utf-8?B?dEt4d21ETEIxUzB4WlpkZkowMCsyYzUzSThsUWFRd3dDeXJHRDU5N3RXVDBX?=
 =?utf-8?B?bm5ISGRIYm5vSDZZelUzVGNFdm0yazkwbUwzU3ZyNFVkTjRxOUd5VDV6Sk5E?=
 =?utf-8?B?UWd1U0hXTkJ0WlhMdm5ZWGRoL1lqKzEyTmYxWFhwRHRoTHJLcFZBcEttMEdk?=
 =?utf-8?Q?1DVcBryvX/rLgshruYe3g7p3V8DHKA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDF4NElhVHMvaWtKMGU2Z3FPVmxPN3lET2p1SlBBOWppMXdtbjJ3V01Kb1Fa?=
 =?utf-8?B?NkhSNlk4YzgvSEdJYzNqdFZUNnI2M0FEZUhtSkMzYklXczdBVFpEazFzUi9p?=
 =?utf-8?B?UmlFNEs3ZXhEbWNEbVdHbGI5a0ZlQVJSZjVRY2QyTjVKQjJuTld6QkJIQ0lH?=
 =?utf-8?B?K0JQS09PMFJmajRxZ2dCUnVTNTVUNmJGTWZOMTZSa1B4Y2E3M2w3eGYvbkFz?=
 =?utf-8?B?ZE1mdFBXWEpxczljZDB3U3hhSzBxbm1wODZrWnQ5ckN4WWtQa2xkTmlKUzE2?=
 =?utf-8?B?Y2R3OTR5OVhiSWxUVGhPWjkwWTY0RWhKK1ZqQVA2aFVtckVNKytxeXRiNWZy?=
 =?utf-8?B?a2N5QzZnUVVReGpySjhkYWtaUFZPWnVVVGthVkF6QjNiYU5VT1A0UXp3bEFJ?=
 =?utf-8?B?YXlYci8rRkFlOW83bXFLamxKRWc5Y3ltbWhhWGk0eU5NSXZJV1dSMW9KcmVz?=
 =?utf-8?B?V2RJYmJxVCtGL1BzMEg2WGw0S3JSRkJEcDlGbTFGR25ISWVmQ2hRNysyemNr?=
 =?utf-8?B?YjBMRWJVbFJXVW5HMkpiWUQrR0o4MFBkc3pkMjZrZ05iQWdnQVRnRHhXRXcv?=
 =?utf-8?B?MVNINTdGcGVWMWVwUElUSFlLc0VyZnFJR0owM1BqeEVhU3cya0FsdnZVdG5z?=
 =?utf-8?B?cGNtbkFDeENHbWlkckl1VGNEUFRVWkpsU3NiejZhTlE1d0RFU296M0MzRk10?=
 =?utf-8?B?bmpSSzBGb0lmUC9ZaUpJTndST08vVkVYbUNrbGhDTEJiM3ZCVFZDM1lRc2I2?=
 =?utf-8?B?MWY5cjVXYWtUclgwQU4rZGlpekdRTVB0aThzdDNyTTFpc0VoenZtbENqcVhh?=
 =?utf-8?B?YmFqUVFWUWkzaFlXQ1BpMXhFTEtvWDZiVVYvQkMvK2tDWlozUE1FdEJ4OUNV?=
 =?utf-8?B?SFpoY0dydGc1VUdNbDdKSkxyc0E4WG1GVjlydytpejBtcmExaHlTeCtqMXM3?=
 =?utf-8?B?Q0N0Z0Exa3plWDhnd3dvWlluVGxucmxRckt3NGRPMnF2OUhPN3lVNFdhZUsv?=
 =?utf-8?B?ZUlVL3FNRDhsZklmM2FheTBCYlY0SnZOcFhPNGRkbGJuODQ5WWJkUXRRUjlw?=
 =?utf-8?B?Vjl6N1ovREVITGpzc3dYVnJCOE11b2M3QVZJOFJteUR1dWxySUpMOGN2NWdk?=
 =?utf-8?B?UEl5dmhYbHQ1UHZPNEpQMktmUzVVWFVrZDB3Vi9Ib25ySklNNlhJZUhHcXRa?=
 =?utf-8?B?QndVWk1pdUp6Z0FieENOWTNRaldYcnhTS2p6dXFaYUJjZWZVUnlQWlJOOVVS?=
 =?utf-8?B?ankxNWN5T2thenRpVlFQcHBEZzVMUjg2dS9EdHZqbUNLOXlySkNDRWlNakRC?=
 =?utf-8?B?ZUNTZE5Ca3JEVWlqTDU3SGczZG9wNFVVdzYremEzckRhUUNNSDdjQ2NGb3Yr?=
 =?utf-8?B?dnJkNmFuOWZma1dMVVU1NEFnS0E2TlM1ajdaekQ4OXh5SkNwbEFtdHBjN2I3?=
 =?utf-8?B?dUpyYjI0WWt3b1k3UHVsT2pUM3ZCQVBDNjcwVTgveEkrajExWU5aRmtrcVJN?=
 =?utf-8?B?MzUxT2Z4bGRjdElzYW1JRzk3VVZFNHE1cG9vaHM4ZE9YK0NjV3VvSGRyTlN0?=
 =?utf-8?B?U3ZEY3ZRdXM4Mm5EQjRDMndLZTVMMFBHU0FBcTBhd3JxQWxXU0NqMnROSTBF?=
 =?utf-8?B?TlFGeGFHbVN3RnRmVkJBUW56RzhLQVhrLzBoaEdEUUE0cE5QMjNlckFsSHF3?=
 =?utf-8?B?RVJUNWl1Vmw5aG5mOGVTMi9hNUN0a08wVG1SSFduU2ZHMThSd0hhNXZiaEtZ?=
 =?utf-8?B?RXM0ck1UbWtUQ0c5Q0cxSGp3ZXpkekRBMFRUK01sY09BV1JmV0pTM2VNWlE3?=
 =?utf-8?B?YzhVUUdPRDZ4Z2ZEeFpqMDNmcVY5V3NscFBxbFE1S0VmaEhkcnZ6MjAwV3Ja?=
 =?utf-8?B?VUhLb3ZESHE0TmFKR3RPTkhYdno2UzJMWkd6bkdrSWdDaVA4amE2Qnp0UVV4?=
 =?utf-8?B?bkp5YzNqUGY1ZFdlV0tyOERsWU1aVXdJaEhGTTByN3puQjZOL0RqQ0RjYXg2?=
 =?utf-8?B?K1ZrY0lwdkRTQ1N5UjcwckhhaXltTnpGS2NGWWpLZ3hCOC8ybEVnZnNkNE5M?=
 =?utf-8?B?Qm9MeUN2N001SzF4U21Zc0VOaFgrWC9FRkx0R2s4NHFxRVNBL0pvUHdneldB?=
 =?utf-8?Q?PcCBBFz7vbzL5O0NjOje46rFc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3014D64609907D40BE595F54E9B90C39@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e452d6d-f3d6-4eb6-7989-08ddca3fa6db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 23:21:28.7230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wyKvtQqrM7/c8DbI0+1PKFf2ZNSTknQQ46+kLF2uAK5peNbKy72EqiVC6ntAMorWPYmnw1Jpmi3jwnr9LLFEwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gV2VkLCAyMDI1LTA3LTIzIGF0IDIxOjAwICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIFdlZCwgSnVsIDIzLCAyMDI1IGF0IDA4OjM2OjUyQU0gLTA3MDAsIEJyZW5vIExlaXRh
byB3cm90ZToNCj4gPiBCYXNpY2FsbHkgdGhlcmUgYXJlIHR3byBhcHByb2FjaGVzLCBmcm9tIHdo
YXQgSSB1bmRlcnN0YW5kOg0KPiA+IA0KPiA+IAkxKSBtYXJrIGRvX21hY2hpbmVfY2hlY2soKSBh
cyBub2luc3RyDQo+IA0KPiBkb19tYWNoaW5lX2NoZWNrIGlzIGFscmVhZHkgbm9pbnN0ci4gSSB0
aGluayB5b3UgbWVhbiBtYXJrDQo+IGh3ZXJyX2xvZ19lcnJvcl90eXBlKCkgbm9pbnN0ci4NCj4g
DQo+IEFuZCB5ZXMsIHlvdSBjYW4gbWFyayBpdC4gaHdlcnJfbG9nX2Vycm9yX3R5cGUoKSBpcyBu
b3QgdGhhdCBmYXNjaW5hdGluZw0KPiB0byBhbGxvdyBpbnN0cnVtZW50YXRpb24gZm9yIGl0Lg0K
DQpUaGlzIG9wdGlvbiBkb2Vzbid0IHNlZW0gdG8gYmUgYWJsZSB0byB3b3JrIGJlY2F1c2UgSUlS
Qw0KaHdlcnJfbG9nX2Vycm9yX3R5cGUoKSBjYWxscyBrdGltZV9nZXRfcmVhbF9zZWNvbmRzKCkg
d2hpY2ggaXMgbm90DQonbm9pbnN0cicuDQoNCj4gDQo+ID4gCTIpIE1vdmUgaHdlcnJfbG9nX2Vy
cm9yX3R5cGUoKSBlYXJsaWVyIGluc2lkZSB0aGUNCj4gPiAJaW5zdHJ1bWVudGF0aW9uX2JlZ2lu
KCkgYXJlYS4NCj4gDQo+IE9yIHlvdSBjYW4gZG8gdGhhdCAtIHRoYXQgbG9va3MgbGlrZSBsZXNz
IG9mIGFuIGVmZm9ydCBidHcuDQo=

