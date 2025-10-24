Return-Path: <linuxppc-dev+bounces-13262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE7C059AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 12:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctK8530lcz30RJ;
	Fri, 24 Oct 2025 21:36:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.12 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761302197;
	cv=pass; b=PRZSXQjni8EeiFRAKw443MQtpnITqoxNLbOlBeScK69HS2/2vZRmDKpz+D54noBiDekkNriNCdAetBVdxm+PUFit0/XAN5AQFrGIZAiqPivgOVBifQGs/bsjpGJSNnPZhSA57PNAVYbz8cEzl56wFkFTObJEydBkxnvCHP+IwNObujOKGjIelOucSsR+5K0nwSEWrlpZ8yxfsnRGvP9VoliB+rqwJkLYioCbUhRUfwytv3WxkSGDNdW8UbZCvgmdGWMWfxvSnJ4yHQCTPBvMBB+E/9kmIy6Zy0naigQtOSqCMI8zaWqLVih4AvBUkVIuMKS/oCsNK/nt/0Vp+6l4hw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761302197; c=relaxed/relaxed;
	bh=/jN+DOhOaigTb6TqSvTZ57PPzsWum0/IveQvERkwj00=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B56JOKi7zb85w030hGH9qP0AP9ex/2qPK682dsDp6sLVCvAJhiVIEep6YDwCQ1nw45negRkCbUlnGsRffUE5bvGudGf7X6seI74+yopssnESv3k3Qazv/84ApZoQLh3ogfeiB8tRtpTgfxXBLwIKfr3cuCYWkfcqFgs9Es3vKJuJj+2WTkNY1NKUPHTkNhrUzqcmM1U582eJkHbt6j8Xt/laNKFZf64MgwD9ik4+dxMnylagBiaTK1WDXG/w503hnn5oqBUMSGrrxUVGTtvPpOdRCS+sZIfZ5/hud7yTLUVnnYnPZqAiODY5CMi81fAh6z/LM+/0Vx29IlCr8OIy7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUA2/BIb; dkim-atps=neutral; spf=temperror (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUA2/BIb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctK8214tZz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 21:36:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761302194; x=1792838194;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/jN+DOhOaigTb6TqSvTZ57PPzsWum0/IveQvERkwj00=;
  b=iUA2/BIbnL6JwvLcLW2aHjHDPsZCW9Q2vkM8o6TL4X6bW4tM6ZxgC23I
   Zvi8SM8vL5Rong71btE+DiuoXWzSTLSdwsGQnHKuxgvm/P6/A5fO4vzel
   3jAi0rGZa6pXMk5q2ou5zltZ7ZwSJQXRTovRdxKY9kMSJ7Sebss0iOXKA
   eWMYSgKuHRZF4Rz6LzWomTj0xvpyWTEf/7M9gxLM7kXXvljl8CBNPuQkr
   b0rFimMsmpeLUZdGuK4wj8BFxb2wdbuoxeBDhmbDOfQb3LtOyLMGMmzLU
   J6AvtQjXju+uvTmDOWkLy4+9LxI7KlPhvOZSOwFdfqx3wJwpDlAIqCavs
   w==;
X-CSE-ConnectionGUID: +hsrHAvIQ/eW8ZKUjy2l+w==
X-CSE-MsgGUID: CQQ3Z7jqSn23PqW57ZzAxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74924527"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74924527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:36:09 -0700
X-CSE-ConnectionGUID: WDsmbiBRTOmJYTeKz0cFHg==
X-CSE-MsgGUID: d++AjsUOTP2SbcHjga8B4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="183574381"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:36:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:36:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:36:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzOQFmdvjmmfQo9BmMip2ESdIeVbdzCf7UwV5cs4K/57EFstAr4gT95O0EqQevyW4R5yn0FugrW1Sm4Eoz8cbCRGz74No1BW8sXAeIvUVhC++mo1wyywhHittqBUoYaaOFE5wBMv+5wiNjCp3xXn8SfpG0QEDQDY4cQ+MHd3rvZR6D4GrJxBkGAoCam3MMpzduq0RZ6uPbv9F2JMAX8MLWICQPeztVJJSY5XZ9WDL0d8gsBZhBreINiYlTg4zYP3H7h8lUh8eDyf/l+8+T19zM9PUCiv4gyGaB9Ott4gu4poA6D4ZrW56b3E88beUeLUopItzsoTHyVo549XIey5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jN+DOhOaigTb6TqSvTZ57PPzsWum0/IveQvERkwj00=;
 b=WoSwEgD3eave1qQ8iUEipbGVQJIS2TTpHj7kJh+ouV8bu4gh+YrN2/Bp8hfNoll1qjadz0+QnXIOLxRrj6obf9H7unc2AIcnu8rN/PJtnuSclFqKb7f6wXIAJG4pu38wtVaUIyKiwjq6E3ZU9wkDRWZWXNqVsxUzFceh7QHymcN8g5o0Z6aWoolvisPKjk9TtBOr8GCHWNXetunKLeeM9H62tg/d0a5TxsH2lwaHfmQwM4+NaCncHrca1LaAwDCzSWAOXCZK9w4JcYfzfddlZXiWQIF2Dno5V9lvprMfbvRMK70clQE63L+FmW2a4ZUGOXd2oTh5k/nsvv//3AyKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:36:00 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:36:00 +0000
From: "Huang, Kai" <kai.huang@intel.com>
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
	<linux-coco@lists.linux.dev>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 22/25] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU
 to "unlocked" vCPU ioctl
Thread-Topic: [PATCH v3 22/25] KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU
 to "unlocked" vCPU ioctl
Thread-Index: AQHcPv2tYj3ZOZLnmECCUkNFZGgaZrTRJfuA
Date: Fri, 24 Oct 2025 10:36:00 +0000
Message-ID: <012443190436b44a58dd683b8c98b75276c71955.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-23-seanjc@google.com>
In-Reply-To: <20251017003244.186495-23-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SN7PR11MB7091:EE_
x-ms-office365-filtering-correlation-id: ff728de6-40f7-4125-d9d1-08de12e91fe6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?bXNMOUkwSEVMN2paTGpvVXo3SEFYRDYvTzVHdmFxQzd5NlZ6clh6SmoyWUox?=
 =?utf-8?B?dEpOL2pJU2dqZGFFKzRGQWI0UnpYVzRyQmNvL2ZQbGhLTVptWmdkNTdFOUpC?=
 =?utf-8?B?ajdsMFIvczRaM0NSTFhkdjd4a0RDUHViL1BnRVM1d2QyZktpTFIvODVEaE9r?=
 =?utf-8?B?QmJLTzdWc3M3aHBVZVJkbkErRjN6Z0lvQU9LMmxmZWJFeWxjWkZISXlFOFhn?=
 =?utf-8?B?MHNYSU16QmNYSTFJYi9JTHAxZmRzTnNiZ0VKd3dOcVJjRDlXRkgwVCtRZlY1?=
 =?utf-8?B?QnpkZUpaSWJvRDl1NXA1WDQ5eTBXcGxCd0ZsWUs2c3o1WmxLenNjUXMweFdl?=
 =?utf-8?B?MHZSaHJJNEZHT2J6eUVyd1ZLY0p1U2I1dFMvdVR4NXhXa2Y2dkEwM05lTGdG?=
 =?utf-8?B?SUk2K0J6MEVTc2Z6Y0VhaGlXZUJTZVhTcFo5UWMyS0k5ejRGaVAyM0gxNHNX?=
 =?utf-8?B?b05Ia3ZhRG12a2hxM2theTE0TVh3TUhURVg1ZFJxb1RpNkpTUHdNYk1NYlNu?=
 =?utf-8?B?bGgwVS9ET3prRkljTHZ3ZFVwOTdCMmovZmlINjV6dTNKT2ZBZE4veUFwZ3F3?=
 =?utf-8?B?ZFNGZlBPby9NK3RJYjNIL3ZXZUZ0eTFjcjdQMWc5WWtQM2Zmay90ck15dnlC?=
 =?utf-8?B?NE5VclpZT080eU9wYzNrai8xVndvTHE5cVpNSjV1SnEzcm1ibXIyZ0dxazB4?=
 =?utf-8?B?WnlITExPTmN0c2wyRE5HYjYzZ2cyeHhYa2pJZGNEOU1lbzRJVTl0eVFiNUtw?=
 =?utf-8?B?QWFoakJVRjE2TzQ3TFYvbkZsL3pRSlQ0MlBXbXhqdU5ucVE2WFdXZnVzNVE2?=
 =?utf-8?B?ZGhnV0plcGY2WVJaUnpMWUxzSCs1VlFmWVVQK2xlSEZkQ1l4di9ZWWw2dUND?=
 =?utf-8?B?KzNzbVZaRkwxSWNVcTFuT1A2OUtuMlVEc2tnMDRSMWRPbjd5L3V2ZFduUkRT?=
 =?utf-8?B?bGtla0UzM1NvRzRSR1ZDMGlka2E1eEdxTnJkVTRBZjB5bU1Ud2pKeThHSXpl?=
 =?utf-8?B?NVI2QWw3TWYrOXppbUZ6TWY5REczU1NKUkVqODd2cU55aDF6Uml2M3lpZUdU?=
 =?utf-8?B?R0FIdUNob0NweEo2TWhYbUQ2MzdXOUxaNTNVbitidjYzNkZXY2VYQ0ZUaFp0?=
 =?utf-8?B?TVhiM2dmNmtkZURWNEFEMkJDVjVMTXpiMldFbU8rQ3I1QnhGdzZwNUtmSVRS?=
 =?utf-8?B?eElPOExwVFB4bkFTY0lhNnpiUWVpRmppRTJtb1J0Vm1hRFQ1OHdheXN1ejlE?=
 =?utf-8?B?RzRlSk1KYjU3ZEdZUkVvdFlBeU5MYXNWb3l0YUtQUlVpVjAyeVBZb2pucjRj?=
 =?utf-8?B?NENIOEJFUnB3NVVhVGlWOEJQNzNXdUF2cWFEUzBmN2FEL0lkaTF2MG5Ta0Fr?=
 =?utf-8?B?ZS9GTGdhbFJ4eFBVYmxUVGVSZ3ZNSFhPNUI0MExweGdkS2c3eFpkdFZienFH?=
 =?utf-8?B?dW0zekZkbjdOT20vL3ZleStpck12UHJ5Z3hWZDVid0xZdjBZdDVLWmVyRVl6?=
 =?utf-8?B?ck9ML3VKNzkvRDh1ZWxJNnYvMWZrTnFaOUlzdzFkUlJLMXdUZDFxek9EMTRv?=
 =?utf-8?B?QmlXS1RSUExnZnA2akJHbm9mdkRkeGtwMGFScFNOeTRzQUMrZ2ZmV1J5WVp4?=
 =?utf-8?B?dWxDZFRHWm1VTWNjRnBMRCtIYWp0RWs2UEdZWk4vRXJDRjArRXdoSkxFV0lZ?=
 =?utf-8?B?eVZ5NU5MN25PUkorNTZhT3VZWFdnVEdpUFFDbFhQOEptemptZktHM2dPRnpo?=
 =?utf-8?B?Lzg5b3VMOHdscXJIVXJWWEkxbTR4a1R0UFlnVU5TOXhqcWRpRm43eE1MM0Rr?=
 =?utf-8?B?c1pabWU0UHFreTNqSHRSZXQ5R20xK1pVNlk3QU11cENkUWFhZ2JuWVZmdkw1?=
 =?utf-8?B?TW5GRFdTUitNdFJKdlJNWnJpTi9nUXR6YS84dlFVRXA1TEhoMk1pNDlJMWRu?=
 =?utf-8?B?VU5qTlhBSVNpVmJuTkZmRXdQZ2NvcjFJYk1id0dVSmpoNzNNNHBzRW1IZ0dB?=
 =?utf-8?B?ckpZM0owZVlzZlVGemJHUkFSVGxIcmJrQlNNZUNtM0RlRjNaT2ZBRDM5OG9F?=
 =?utf-8?B?ZXpmQUhOZy9wc3lnWDMxM1MySEFRMlE4ZzhLdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzhQV2ZCNENEM3BVek5DdE1tZ2M5K0k4RU1ZN2Izcm83bmlCRUtoZFNHMlFB?=
 =?utf-8?B?SklTZW82SE5RaUlnZzJLQlR2VW9RaDNvYUNhUTBnanFuTWNnRFVVWHpmd3Z2?=
 =?utf-8?B?MGd4WWVVZjVpK3d4YkR2Wno3SlNldjFpajB5SUNBd1AzbzFwdHFBNzlJcDNJ?=
 =?utf-8?B?dkpwZzJ1YzBabitLVG1TQVBDYjFkR0Rxekd4SFQzdTQwY1J6d1NkSi9FQjF4?=
 =?utf-8?B?RWRncjhRSTVuQUZJSjZvSDJrcE95MklYYzVGTnFISzU1ejZFMC9vc2p3VDRY?=
 =?utf-8?B?UEJCVzZFSG1nMHM5ZXRieVJtelhiU0trNy90YWtFai8zN0l1Q2Z3Mk4rakdj?=
 =?utf-8?B?SElxZURpSXRsQWVIRVp0TmNqWWpTaVMzdEk4ZWRvN3YwUTAwU1N2c0xsaVlu?=
 =?utf-8?B?b1d2cGthMWhtdE8rVWlEdVhTU2x1a3FoaUNEVG9SVk5VRDhtNUJDQnIrMHJF?=
 =?utf-8?B?NjJlOWtyUmhxYVlNbVZWNktVbldDRnh4UHkyRW5xUFpqVmYzNWNqaGNuRGZW?=
 =?utf-8?B?Y3lWdjEwY29RVW1XN0Z4UkNyOXZFZ2tVaG9EQjUvRFEwSFo5UzNsS3RHcVo3?=
 =?utf-8?B?M2FNcG1BMVFoelEzMXZ6Y3pTaFo5SnBhRWM0NjBKQVh4YklUbUFVaFdpOWtN?=
 =?utf-8?B?WTl3ZUZvUTBtdm44RURJSFg1QmJsY1gxZnlnYVViNlVVSzlNRytrVWZ3OUNa?=
 =?utf-8?B?cGlTL2NJYVhJWGpxRFhzb0llMW91S2lDN1dZVmN0cTlqN01yZUc5NEZOZ0ZX?=
 =?utf-8?B?Wm1OK1c0eVQ0VnhKc1FkM1QrSC94VlJmbjNxeDhabktqRjF6MnN5SWlxTi9v?=
 =?utf-8?B?QTA5bHQxck56NWhOOVFna0MzbHI3UXFyVy9NMGdRSmQ5cEh3T3VUdmRGZkNW?=
 =?utf-8?B?czh1clJQM3NxdFRSa0cyTlREYkFya0F6U1ovcCtBRTJPUmJ6bndmeWV6bU40?=
 =?utf-8?B?NnQ4UUlqcGRHODZ1cUxMN2ZvWCsrc1VJT0kyK0ZoVE1LdUFnTWQvak5SdkE1?=
 =?utf-8?B?cWs3S3BlM0tmd3doNFIreSt5bnNxY3psV0pmK1VsdXpqbUJYZC9tZzVuNlFF?=
 =?utf-8?B?QnRwMG9iTjY5MkVocUZnd2NNUnJndkV1Yk9BV1dwZVlvNkJ1K3hIYkk3NzB2?=
 =?utf-8?B?TUxjSDdnT2FLSkZNVVRDeE9wSy9qZWhpa1pSaC8xeEp3ZDlxS3p6UHVkbFhN?=
 =?utf-8?B?eWF2S2RiL3o1dHplRUlwNkV5L3FxU01qcjV5R1BCYnI5MzFaWk1oRitrTm1z?=
 =?utf-8?B?YWIzNjIveXV2NG9JdFhFOXFJcHJ0a29rbnBLR2wwTmQ1ZWo5NlRRV09CaTMr?=
 =?utf-8?B?VVRzWUlBWFhVWW1mV3hWb1lUb3pZRFBmL3BGc1RyUGRyK3NRbHBBem1tNlMr?=
 =?utf-8?B?N0lmUlpxZ1FwT3ZuamhraURzYjRkdTZsYTR1OTZ3L0k2bWdLR1pPSEIxaVpB?=
 =?utf-8?B?NVY4aWdiZlloc1ZhbUUzeE1QSWtOWEhRY2c5UmtSVnVlMUMyV3lQZmxMam1j?=
 =?utf-8?B?N1psbGJqMnVCOW5hWTFaL0w1MnJibmgyK3FIcm53VEdhRysrN3JVc2Z2a25a?=
 =?utf-8?B?MEVvYWUxSGp1YVE2c1lJcjkzeTRVYS9RdElPN1R2QkFwL2RkL3BaQWZ4SVhQ?=
 =?utf-8?B?a3B5WThNM2pIYi9OOFUxNnh0VlF2N3FIWXM3NUdyTHFnejcrUzNCZENDRHZx?=
 =?utf-8?B?MWtUQjYzZ0ZqTVExcmsyaW52V0dSMGNEWHJUZlRDMXNHcVRiOEt3VmVMejA1?=
 =?utf-8?B?RloxMHRZMjRBcGtUZ0dYOTJ3ZE44RUdiQ1V3REVvUjZpa0dkcWhFdWJoMUpC?=
 =?utf-8?B?amVkcmZ6Lzh3S3VJRGR6RHcvNjBtNm9LTmtPeHlRbHllTTBVMEFxWWN5NDI0?=
 =?utf-8?B?dXpWOUNLUmxLSW9ZV1hxVmhuTkZCeHV3MTk4MVpQL2Nuc0wvaTIwV1UyMmRQ?=
 =?utf-8?B?d0R1TnJ4ZHY4TUFIaW9YYVNUVzNoZG5sbkNEK213bWFqMTB5UENNUVd0V0J6?=
 =?utf-8?B?NUk3S3lROFo2YVo2SDJyajhieDZsVDJ5YzAxZTcvdFFPMXRzK1RWOVBHUTNj?=
 =?utf-8?B?d3dKL0gyNndiTFZZNDhnTzB5RURROU1zRjlBUnlEMGgrWVZJMS9WZ0JpalRX?=
 =?utf-8?Q?uaJUSoSZBCUvY1yNRC0AoC5Cj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67E2C4139567E64AA83BB1D98CD3798D@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff728de6-40f7-4125-d9d1-08de12e91fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 10:36:00.4947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh5D4I14QIOUr7Life4LFP/Xw66IoqvaK/QX2GVwwelvDjj1GTqOJqxDGu499d8Hx9s4KWZU+zmamZCjiwpluA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBIYW5kbGUgdGhlIEtWTV9URFhfSU5JVF9NRU1fUkVHSU9OIGFuZCBLVk1fVERYX0lO
SVRfVkNQVSB2Q1BVIHN1Yi1pb2N0bHMNCj4gaW4gdGhlIHVubG9ja2VkIHZhcmlhbnQsIGkuZS4g
b3V0c2lkZSBvZiB2Y3B1LT5tdXRleCwgaW4gYW50aWNpcGF0aW9uIG9mDQo+IHRha2luZyBrdm0t
PmxvY2sgYWxvbmcgd2l0aCBhbGwgb3RoZXIgdkNQVSBtdXRleGVzLCBhdCB3aGljaCBwb2ludCB0
aGUNCj4gc3ViLWlvY3RscyBfbXVzdF8gc3RhcnQgd2l0aG91dCB2Y3B1LT5tdXRleCBoZWxkLg0K
PiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBDby1kZXZlbG9wZWQt
Ynk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWWFu
IFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEthaSBIdWFuZyA8
a2FpLmh1YW5nQGludGVsLmNvbT4NCg==

