Return-Path: <linuxppc-dev+bounces-13255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB912C04AEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 09:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctDpl3ytRz30RJ;
	Fri, 24 Oct 2025 18:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.11 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761290479;
	cv=pass; b=QvuewExK/Dc7hj5Ni7XFUudNmufi/2KUbSShF6I6tBEjcoeR+NnO12PZlLUn31qpBiL3F25v8Pc8ZBcdGkLK/TyeDma5endh1eQVZfKZk727Dc2OdcLsAeNPvrFXsdBNtw3Cc+JBdcf6lj52nwHXVo5vZL2xl2IVl0fCD72aVBbpACzhG6ZJdomOCDAm+cUeLBX+pr1eCbDj7UAsNQQfl+/nd5ZgMNlqkhqpwHMuhvlEmyyLImGEdCBl4Af7w6LxrYjkN2C+e/3sfF6zfHlFrupsQuSsU/n/eckz9vmsg4x6El1MkQQkbL/sHTxwftVNMHMi8/Ozli26A/cN7jcJtw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761290479; c=relaxed/relaxed;
	bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AO1KunH+VMqepEvuO4md2/FFWFG3X7FKj5gWsJ2LjH9opQIck18Hr1XQFAtrTOHAnJGPG5DaAlMd3wMD3oQFy0MRSF9x0Np902R/FovNl1zZkaUo2o7IYH/3uJC81HPfhxyJAQ/esTyvHMGZgPyZl6KuK6rwvOb+G4ktrw2MYu72gz/vLVKq75P4UEmf9a8v88waQHBrGvR7Kz8a/Jtce6L7xrRLQWIzps/qWexrHvKyF0ljyiYUx9ixzGTHcT8IRHZHEkgm1iyY70OXOGYGujdYTIDA7zwLWBspL8f8aR2Ibv0qqxUmgkHdXj8as5GuKKudmXTJnTrp5m04NX/SWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYU9I5rS; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYU9I5rS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctDpk1ythz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 18:21:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290479; x=1792826479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
  b=JYU9I5rS3/fl50cQv+eXOl3IDe0SyjLkFEhcaz77VHDqY9hOQhNh+hxb
   TUMoyaK7WhlNo/qXXIrFVfsVHkg9+m3QMlIJ/ZaGXDokyjBnP0Dd3/X0F
   jpQfgpxJKT6ayG1yNU66PzSGor9lWy71EwS2vYvyuP2o6jolZoPdVM5bs
   ecxEqZPpuYe2A3Esz3y2LxKOGEkXoNq0LRnb3o4aEMpgCPqNw1ZiNwm4k
   ugdgmDJXB5RDj1k/WyUgrsQa8V/DlYA2aNDibcv6z4ZcpXjPPy7GQy4u/
   xDpRu6+Q0JDRjBz9MQ6r+BoNvh/PQw1Wmua9e2wazi08JABRJmWvBwKKW
   Q==;
X-CSE-ConnectionGUID: AuBfCY9TR8W+XMkr0Nu+yA==
X-CSE-MsgGUID: yKjjVMZcRXqzpie9XQMDOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73758486"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="73758486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:21:15 -0700
X-CSE-ConnectionGUID: VP/KcHN0TmGbBZT5X4Pa+g==
X-CSE-MsgGUID: 2PvxHhNTS0iq/dZzrexlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="221563593"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:21:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:21:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:21:14 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELU3uw/QAB1UZJikHUNLZSEi03nVc/bzxwJmwSY6eYzlucHRDsYjudKC8SlaN9BZileOj9T0Ah9VSW/2B1nUawAM/81CwWSSZms2OsJtVk+8/T99Oibf4PiyK7hriAohqnooWANAwxZR384BUYyYJGT3E94D/c3h1cCnVPhOhc3A4xhBB4StnIcu0fx4J3C6YEk7DjmBI+CxrqMTb44lKFPp0I3/WRslC4H0r3lCtVWPFEqx8CeLY4A8gpOfNkDOr3PR1HIf7620CGDp59sxEXkF3LWOoQKVNWW615G1gHHmYdxT3oeUYfZTOc02916nLebshFyaMj7IxbqbYlkD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWTvcTtz/Y4shwInQhCt05XxdQ5d95pyJw5PJGm5CW4=;
 b=HOPbXLvsdQQ+dvD7rNEnDISUklSznIspernebgRGfn7YoFNiwLF3fJdhrWE4up/97aR6zMRY9cOkyH0C4AeGLeeSZo9ccPHX28JoA475tmVCvG1qH22y01xrc67FHEZz0vFjNzeYcYah/8VeoeyPBUvwLqTrGNNWc/ioTEU74T4jGAD5dqPyJhJtYMF/VK4JOeTC0W09MytwKZQsOBpFGj8NT9Mk3tVFlFN3ETXGRuXWL2FedFigLsX7JneRJH8/27LiXCVfRzV+M/x54HbAQ0wOnrJZYiNebXlEi88ELN8LhbaEAk3gvBAF3aZQbWQdVtkzW/3bY3Cy4pf6DSmJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:21:05 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:21:05 +0000
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
	"michael.roth@amd.com" <michael.roth@amd.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "Annapurve,
 Vishal" <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Topic: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
Thread-Index: AQHcPv2n07zQi2kCh0qwUFWmoDYx07TQW8QAgACTwQA=
Date: Fri, 24 Oct 2025 07:21:05 +0000
Message-ID: <8ccad4542503eedfcd09eca990ab5bed77dab154.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
		 <20251017003244.186495-14-seanjc@google.com>
	 <233d0250d457abd153cbd63cc8227f67b9a3a933.camel@intel.com>
In-Reply-To: <233d0250d457abd153cbd63cc8227f67b9a3a933.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH3PPFD6B8A798D:EE_
x-ms-office365-filtering-correlation-id: b3f6003a-8a01-43c5-6ed5-08de12cde50e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dVBUTFNBM1RPOUJZYlRSRElwbHhDMkJqc3FlODdDbFZRYkZrSEpkK1NYZFpr?=
 =?utf-8?B?blI2NFQ2RVF1Szh3RXlnUysza0lTYTRPazRqSVVxUHZzc3NaSkMyUDBYcmkv?=
 =?utf-8?B?dkJJRk5iTCtzeGZmU1ZPQmVmOExLZnErY1NhR2dvNENrbjl6WUlMSnh1SGhT?=
 =?utf-8?B?WVJWTVlHVG1yTEFtZlR1QWhVQklYVjl2empKT0htbHZTR2xMRFk5SHlOOGhk?=
 =?utf-8?B?bTA5Um83VGpEcnNzQThvQWtjSkJ2Y2x2MmlQaktMREVJZDlHWHFpYXFVNVBQ?=
 =?utf-8?B?Rk9ZSm1vMlRSUXJLL0IrRkkzc0xnR0VIT095SjFXRy9SMWhIdDd1bVhhVGsw?=
 =?utf-8?B?SU9MN2VwWElxVG5kaTVCOTJBRElObkpZRDltMDNTR0dvLzRnTlQ1S3NBZGl5?=
 =?utf-8?B?YnRaWnF5Y1Mvakczd0xyd21nSTY1S3pOK0RCOGc1clI5UkNOekZ3dkFnd3ZO?=
 =?utf-8?B?SStPK3ZrSVhvWW1ObnZVeDM5VXdFcGJmY0VMMkdlY1JEWUtFUzZMNWtvZGV0?=
 =?utf-8?B?a0s1cnlPcFFFN0JhWFlGVGxVU2VjRXlDYjNHZGtYSDBYdTlpRnFZMk5icEJY?=
 =?utf-8?B?Tkt2U3o1OFd5anFRMGYya1Vyd3NFb2l1TndIUFBJakNWNXJ4RUlhTSszVjFq?=
 =?utf-8?B?VGNzZWYzL0cwdEdKNHJRK05XRWw5UFEzcDE4eUdWYlQweGxEYW5sTExVQjl3?=
 =?utf-8?B?VzFDNWFjVkQ3UXM0ZHN0cnJqMnFsUEhPTlFwS0QwQ2FMQVlWKy9UTmJwOE5B?=
 =?utf-8?B?b01YV2N5dm9mVVJSK05vT3kzZy80UjN1RzhQbnVkcWJKdGlSU1lwSzhmdU92?=
 =?utf-8?B?bGErVDJrVmRPNzFOUW1uUFlnakFSd2hDa0l5aDNnN1E3c3pmL250alhiNHJp?=
 =?utf-8?B?cUJIR2czaTI0L2NaWmk4U0N0TDluUENuNFNWYklkSkNydE9qSitQRXBUVG9m?=
 =?utf-8?B?SnJ6bElSNXlVRUtCYTV5enZTdnFxaWNYT0ZQdExxYi9MUmpqUktWSDJUNXBI?=
 =?utf-8?B?b1Y2YmQ2UzE1dXFFZkozUGNOaHlISU1KSjNjQUxPRmNKeXA1eUF5QVJVS2lP?=
 =?utf-8?B?SVFvZWFHSmZ2SkQ4SCtvREUvU2Q1TkI5YU5VM05DWWQ4OGM3bU1ScXVWTHRG?=
 =?utf-8?B?SkhGR0g0OFhvcm9mQU8rdHduS2o0R05qY3BSUnBLY2tQbUYwVm9nZmgwTWpR?=
 =?utf-8?B?cjdYZTR5S1RZQUdXVW5ubmpaK1p4VkovYUIvVysvdHJING5ISzdxOW44YWtP?=
 =?utf-8?B?OTFDc1RYZG1rcDJzU29RNnN5eUpSbnoxV0VMVzZhZXd4bHhpc3hpaHlqUVh3?=
 =?utf-8?B?cXc3ek5SbmV5THZ3dFQ2TS84cmcyQkdZSDA0cEJLUmdrazhJQkJFb2pmcTdT?=
 =?utf-8?B?YUZ4UnJIYkpiK2tNZncvQVlGRnc3R0hpQ1hpMjdGTW1iaUhWRGZqKzFvRFlr?=
 =?utf-8?B?UWY4Z3JXcUVXRXVTck90N2JVOCtFQVlpWW5za3d6Z2NCSFZ3eVIraVFtMjhj?=
 =?utf-8?B?YU5uaTE2TXZobGozQjVTQ2tza1ErN1J6elB2ZXlsYm0wQklSdlNTeFZMWVNX?=
 =?utf-8?B?Vm0xN2hBVGhqSFN3KzVsUDRxOUhnaEN1bVFkNExxVjZTbnJLWkFlbEc2Q0lq?=
 =?utf-8?B?dWZhRFdZendRSkpGV01GdkhSTTBqdTBpT0RLOUVIMGoxTjY3TUJMM3BEY0JP?=
 =?utf-8?B?elc5Mjd6bHBKMzJQUW1ZRUFBQ3VOenJiU0xPTFVGOWkrY2FFNGhlcFFRbFRp?=
 =?utf-8?B?VUFKc1RzZkRlU0pUSGhUSFB4bndOd2RWTkR0WVhxR1BYMnB0OFRyT1JTU0J0?=
 =?utf-8?B?eFh6dFJsSlNPMFRyVW5MVEhBVWlpSlNyOWx0ZThRb2prR1lVZEZCejYvWXg1?=
 =?utf-8?B?WFFHdHBVc2xITkJCbFVTTWNrNStuamNCWHg5ZHV2b3hvUldqUm93VW92RVhx?=
 =?utf-8?B?Ny9QUkN5Zk1lWWdsR3NweVN6YStIZnJZbi9ucTl3RmhpRWNoVVF5ZmRObVYr?=
 =?utf-8?B?dk8rKyt2cVpGcmkzb1BQd0R6V1hYa2djMk8vejZ5Vkwxak1Tc09Ca3JDUnFz?=
 =?utf-8?B?cEVkYVVWc0x5Rm9vZjExaEo5cTVMOU8zYTdsUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXk0YTBHTndiYnNMS05yTWM1Ly80VGlEMys3QVpLS3JhbmVtK1hPaFdXZnda?=
 =?utf-8?B?bVB6bzFFVysrY0pFbnRuQVFBNTF6ZXVnVVhYMUlKZllaSDJZMENvaVh3QnV2?=
 =?utf-8?B?VjhEdXNyL2JXakJxNFNqQjRTZ08zQitHenNSYXlyR0hTUHRVY1FnUTFneFhF?=
 =?utf-8?B?L0xIWHUvVEs5dndkV0RUVk9vMmhJdGRqbGxlV2Q2U05KeDVXQld2RGphU2lU?=
 =?utf-8?B?aUVNbWZEUVcyZHp5ckRmNFZDcFdqd2FBYnFodFhnRW9JM0tQcE56eXZDbFZP?=
 =?utf-8?B?NEY5NW1yRGJaL2JGdzRCRHc2Z1FvOXdnUHhmbHMwTWV5Z2RwNyt2bnRDUnhR?=
 =?utf-8?B?MlY5c2ZvMnErODB4YkZlSXV3ZXVyRXhjb2VQUzVnV0ZyY2JyK2RTckgvR3Mx?=
 =?utf-8?B?TVpaOWx3Y3hrellLK0QxRkIvOHFjWjJ0Y25sWjdFdVRWWVAwa3RKakZDZE5Z?=
 =?utf-8?B?Rm5YZmpQN1l1TDROck9HSnlWT0kxclc4K0lnQ2JtYVlYemloVDM2V0w1YXIw?=
 =?utf-8?B?V1pyd3RMNGE1cWlpbDkra1RuRjM5V3M1NUoxQWNmZVdsRlgreGVJK1dvSkhT?=
 =?utf-8?B?dkRUcm5zZU9ScmxsbW9uTEU5cHQzMmg4TSttcmdadXVmS0pOMlRVSTQzTlQ2?=
 =?utf-8?B?VWNzWERtR0txRkJPWmJoaDJFMFZyUWVPQkxsQXZHYWoxR0MrTGJYNVhWeTFa?=
 =?utf-8?B?NDdiYXU1ZjBwS3dxQ2FSMFErYVFxcUlQdzZ0UHhqL1RHNjV5Y243cWFPVWp4?=
 =?utf-8?B?TENPV09OTHkvTjZkSXlJS3pwK2l0SWFvTUczM3VJcFFEN1pRaERmK2JxeVpR?=
 =?utf-8?B?b3hWb3I4dlA4QkNrM3Jod0cxNnM1ZXV3VGwvL1ZjTFRFNEdjemVOellMdVpY?=
 =?utf-8?B?eFFsNFJrUS8xVG1QV3NpU0JLLysrNGRLOTdyd1EyWWlvNGtGdThHLzIvdnB1?=
 =?utf-8?B?QmZHM1pmQ0t5dEI4ZmExOTIrMC9nL3E1Z0liYVZTLzY1V0o0TzY0YU9VejFy?=
 =?utf-8?B?OEUyTTh5Vk96bStIVlRRVTlScEpVNlQ3emtLR1U0c09pVGFnOGxXSEREanZT?=
 =?utf-8?B?NlN1YVRQUG9hbUZPM0Zhcng0RGEwSUpTUFZHK1JxQStHUEZXZmZDTU1HY2Y1?=
 =?utf-8?B?UUlsZUhNV3dBTE5YU0JqWllnam5WckY4eVRLQkovL204QnJnMmxWdWREeDkr?=
 =?utf-8?B?M2VEeFRYSVFMYzBHTmlPeWYzMFk1ZkFUN0J3RjZPanVEaEVNWDBpZ2ZkSnpM?=
 =?utf-8?B?bThrWU9UeU55M3pGNlhTZnhSTXdZRnN1blROaHdueGxFdUUxdWY2dExIc1E0?=
 =?utf-8?B?ckVjd0JBNnY5bTNDeDNyWlA2TkV5elBkNGkyUk9FWjBFQzBpMW9HTDlnNWZy?=
 =?utf-8?B?YU1Sc2hvelhFU3l5dFRtcXpCOTlNL2lHWGEveStzQlZsb1Y2MjN2akR5d0JQ?=
 =?utf-8?B?TW9VSDNjRDNRY0FUaHh6bkpHNzdBS3hQQ1dvajB0dURaMEtMRHR2eUFCcUpt?=
 =?utf-8?B?TFNrNXJpbDA3Y0RUSERQS3pNYlB2YUprTExuSFRXeXdudkN0UWd4d0NyK0dU?=
 =?utf-8?B?NFNmWXhnRDE1SlBHMEVRZjNDZlBCTk1YRGdpLzNoSEpTUTNTVkxzM3V3dGFY?=
 =?utf-8?B?RWxCUUtzcG9VTXVZZVllZjNLd3FHaTZtSVU4c0tqZ1EwY2o2bEdPckJ2VkN2?=
 =?utf-8?B?djFoU3NHYXNWZlU1R1prb3lxQmRsNGlvZERmcmVsanZhdHhsTlgreFEwMlg2?=
 =?utf-8?B?VnpLOXhMMWNpUmdlekNNdi9ZMHRkQ3B4ak5MSlhjR0dEd1d0MnNVSHpVWThN?=
 =?utf-8?B?TXg1c0hSWlBDdks3Z3ZNRFBHNjJlU0Z2c1pYMXdOdVRyUDIyb25UTElQbktN?=
 =?utf-8?B?VktFVXhxa1I4Z0RqN0ZMUFdhd05BQy9BVTZpZDA1cDBhRWNJeFRJVVdEQXlo?=
 =?utf-8?B?MkNwTWxpWTI0S2NPK3k0Vjh0S0tWQkNhNnAzR3ZkWUJZb0N2cFNiYTFJQmhY?=
 =?utf-8?B?SVlzRzBSRXFjUDJHZVZTbzMxTWxqRTgySjIzcWsvUEkxVWNMcVk3Tk5ieVhM?=
 =?utf-8?B?QThoNVlwZ2JxdWJxcVVjSkd5b1k0MnZsZWs0UEVQa1lLSTdUMjJzNzNUQVNt?=
 =?utf-8?Q?RpF0HzG7SBGzIUYLYdylaohtk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1716770DE66B9E4CBDC7FFFAFF9C4ED3@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f6003a-8a01-43c5-6ed5-08de12cde50e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:21:05.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ICuBXN0KD83ZyUATTksfLNIP9Tg6XQAwratVmrgh0kpd0K0l1OHaNPEtSl5bngSLvCalwDYkK/1Q/PT0cREiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4gKwkvKg0KPiA+ICsJICogSWYgdGhlIFREIGlzbid0IGZpbmFsaXplZC9ydW5uYWJsZSwg
dGhlbiB1c2Vyc3BhY2UgaXMgaW5pdGlhbGl6aW5nDQo+ID4gKwkgKiB0aGUgVk0gaW1hZ2Ugdmlh
IEtWTV9URFhfSU5JVF9NRU1fUkVHSU9OLiAgSW5jcmVtZW50IHRoZSBudW1iZXIgb2YNCj4gPiAr
CSAqIHBhZ2VzIHRoYXQgbmVlZCB0byBiZSBtYXBwZWQgYW5kIGluaXRpYWxpemVkIHZpYSBUREgu
TUVNLlBBR0UuQURELg0KPiA+ICsJICogS1ZNX1REWF9GSU5BTElaRV9WTSBjaGVja3MgdGhlIGNv
dW50ZXIgdG8gZW5zdXJlIGFsbCBtYXBwZWQgcGFnZXMNCj4gPiArCSAqIGhhdmUgYmVlbiBhZGRl
ZCB0byB0aGUgaW1hZ2UsIHRvIHByZXZlbnQgcnVubmluZyB0aGUgVEQgd2l0aCBhDQo+ID4gKwkg
KiB2YWxpZCBtYXBwaW5nIGluIHRoZSBtaXJyb3IgRVBULCBidXQgbm90IGluIHRoZSBTLUVQVC4N
Cj4gPiArCSAqLw0KPiA+ICsJaWYgKHVubGlrZWx5KGt2bV90ZHgtPnN0YXRlICE9IFREX1NUQVRF
X1JVTk5BQkxFKSkgew0KPiA+ICsJCWlmIChLVk1fQlVHX09OKGt2bS0+YXJjaC5wcmVfZmF1bHRf
YWxsb3dlZCwga3ZtKSkNCj4gPiArCQkJcmV0dXJuIC1FSU87DQo+ID4gKw0KPiA+ICsJCWF0b21p
YzY0X2luYygma3ZtX3RkeC0+bnJfcHJlbWFwcGVkKTsNCj4gDQo+IE5pdDogdGhlIGNvbW1lbnQN
Cj4gDQo+ICAgLyogbnJfcHJlbWFwcGVkIHdpbGwgYmUgZGVjcmVhc2VkIHdoZW4gdGRoX21lbV9w
YWdlX2FkZCgpIGlzIGNhbGxlZC4gKi8NCj4gDQo+IGlzIGxvc3QuICBJIHRoaW5rIHdlIGNhbiBz
b21laG93IGVtYmVkIGl0IHRvIHRoZSBiaWcgY29tbWVudCBhYm92ZT8NCg0KUGxlYXNlIGlnbm9y
ZSB0aGlzLiAgSSBzYXcgdGhlIHdob2xlICducl9wcmVtYXBwZWQnIGV2ZW50dWFsbHkgZ290IHJl
bW92ZWQNCmxhdGVyIGluIHRoaXMgc2VyaWVzIHNvIGRvbid0IGJvdGhlciA6LSkNCg==

