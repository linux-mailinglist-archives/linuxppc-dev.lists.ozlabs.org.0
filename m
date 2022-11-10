Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBAE6238E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 02:34:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N74BY5B3Hz3dv0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:34:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3Tw+sX0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B3Tw+sX0;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N749X5hpZz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 12:33:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668044017; x=1699580017;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TkY9xe9VRhHHEMgQO57IySIsxFYa7haWrXrer0WoONI=;
  b=B3Tw+sX0OViBvvGMV3q2Ul/CzfDnEBl6m2iRl/98L4Et1fccr4VdBXon
   JWfx0UVk5IZ1gZZ2xc9cADRwiw/c6GqqwfkK9waxwJuWrgC3wY2VO+EE6
   C2VvDSU4WoLCkil2fma9cNEJLhGE4HqA5iBinB8+tSS1tbdl+MqCLF/6v
   CgxslJXU1dRIi0uuH6l2Dl3iKJKbc6OwWyE1McoF52DOZRWAi8f46dx4y
   pqIQUJAu4HLp5Goj37m3j1ZN6M9eozGndSulln0HH22u44GzGjurdz17V
   YjZC4wseZxjMc4Ni9uDPY18dICsu/PALqUq2YN9/rQAFFfDzyI26qQ/1Q
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="311175596"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="311175596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 17:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="762095155"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="762095155"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2022 17:33:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 17:33:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 17:33:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 17:33:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 17:33:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B48x+6e3cqlmJjoNPZx7yHzQlxsgl9u2cNe4p4TDPnov9r5t/qyf4wEGtVIZlh2MWSbTlfqTmAhbBGa54X7wqQAvhmZgATYFpCvLPtTeLN8jVfNe6udM3eLPT9vZazk2iW0sDh3zfN7UvHK0h5gZjOOwYuioFf17JSRt1nPhPbSRIQXdf81g7dmc8LTM1PNY+RWeD7ozmisvgYUwx9xk9D4PZTSgysEaDNGRIog/bD71dJwm2IP+uV1ItETaa/JHZz2d5fxIdUWMT83wV5Bwmn4mdfyhPMQYxdtqyd+J/WyxwW+7EWDRgdDTcKg1IQ5o6PzSUCmhUUF3sV/TMCOfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkY9xe9VRhHHEMgQO57IySIsxFYa7haWrXrer0WoONI=;
 b=LbD5j1/YSAkzwlEwtviWG9oUrBPT4JrZyYEivonF9r9MiCaXT/sZK1H9pounEzwGROIAsBvbvtaXytUOfArkiRpvDaRV4QZI5DcYKki52s1wMhdsXQ/6QAYti88kQ3TK4jDdEWuhnaJe/jrGSHZTbdHc/jwcdL6SBApeN15KTwH5WL+vIz2zHmIAhL1erN1cVBP+TXsQXPtB9RzL1eB6yq1TMz8ab9Oe2CY+J8q5mjV0L+j29cHvkciGvEgEIQYa2ILv/BBMp8kSjkVoEh7IaXNCPEORrul/ZDVd2pGmDSmDwC+zjhoab2edZmjiiivAVsYZ4hx267igphdg7QiuLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 01:33:24 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 01:33:24 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "Christopherson,, Sean" <seanjc@google.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "vkuznets@redhat.com"
	<vkuznets@redhat.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Topic: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Index: AQHY7xJy2pUg1L4bCkib6AOkbzD9bK43arEA
Date: Thu, 10 Nov 2022 01:33:24 +0000
Message-ID: <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-39-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA0PR11MB4623:EE_
x-ms-office365-filtering-correlation-id: 76d1e07e-31da-4d8f-474f-08dac2bb8f3a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTBqLXzqOxt9OgBLaVjpyL1S/we7vZvHTFGfP5EFr/zfOeUe1/K7RHSE/FdeCCCHwx5kwisiArgIsshONbpp1DnRd0ISVKwL0xYANsPvqeuVbQZq4+XEdALqR/2q12k4V9dWk8Mzwm3gMZzEihw8MJnrVvIEgFikK4o1xehXQD5NBMFhqFmHZb35QVhGEByl7Lg4WKinmTkGBhcc1yHQVvE1UfYVnmeQlDAecLOKTh1qt7YrbyKpVbUfvg/6k/0FjPzqqyKBy5miZThIraO0Cfgs81l8gJoBre2dgSF1AAcOGKHW/kIGyYwp/JDtQEjcV5qbbZPYrUS8dd13lgUGPX7HzwBdfz+4Zp8goehHI1ylMLVmyAnn96xEfy+QmGqZ2DoGKEPd3WtIXciKmgPqi+9je237X9GUf5pDGJgDQ+ZesdRszqMB9znTawd30u9fBWt/SGkrml+aTbEEaTAdf7o78+Bv2xqNybMe1/eCAtENY9mrvnjzqyW9tbHWOsRtfEnoDJ2IA4nG6+tGDk38d8hAzNpcJkgpPsyopYSVlayh4LOrpfdpm5urwlg314XG6+xrwLasXQcE4oWKgYeDX6GeQZ8jMNHL4KQfVickiNxsaDI7NTa2vRBBxx/RyjVbQKPSw6TT4bB2U1YRUnQ9zxljIM6d8iz8NvIv5f1Ji83W2HWMuPu2hWazq3WwdZICxSH71U3eZSWTpcYQpS1ZhbvAgGDIiLI4cchv7lG9vwpHJAUFyuzOq3nPPAROC/YeJNWce4cczBeC050jlM/zXaGA7bk95K18F36ZIKjL38U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199015)(36756003)(6512007)(26005)(38070700005)(921005)(82960400001)(38100700002)(122000001)(83380400001)(110136005)(186003)(2616005)(6506007)(2906002)(8936002)(91956017)(7406005)(7416002)(5660300002)(66556008)(66946007)(66476007)(8676002)(76116006)(66446008)(64756008)(86362001)(4326008)(41300700001)(478600001)(54906003)(316002)(6486002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlEycitRcndZMHE4T1BaeFhtV1BNc2NxUUV5NE41S0NaQmgyNWpCUXNNMWFk?=
 =?utf-8?B?SFVSeGxyUmRwNCtwa2hzcjl0U1FlcTFuV3prVDd4K3NjMnl5RTQ0bkY4WVJX?=
 =?utf-8?B?Y2RsZ295RzJlZzJkOU1hVmVndWxGZ3lhZlhRSWg4WmMzeDEvU3ArUzNYbml2?=
 =?utf-8?B?d3NQTEpsQUZrUFNoY20rSTIzdmJaSzhCemFUUnAxZTEvQlR0dkVDRm1IcGNy?=
 =?utf-8?B?QkFlRDJPeC9LZWVYT3NDL1V0ckhGLzhqNUpQZ0xQNktOOG0xaDVNVTdZOTc5?=
 =?utf-8?B?MDU3WFJCYUxpa1gvWWVYSVUra0djdGM4ajlIV0tRcU9UNzM4V3phbHhyOWJm?=
 =?utf-8?B?YTM4aThqZ09ubUZBSDRPSEJnQStCRFM1aGRuVEFhUVUzZ0VPUFlMckwxZTkw?=
 =?utf-8?B?d3pyNXV3Rnl0YmVIa2xCQ1NDeHpiTXl1eUZzTXhUSUxvbVJITlA0aVlOSzhj?=
 =?utf-8?B?QkpWNHNVVDkyelVleldBQ0kyL3g4WDFnaGZOUFQyUG4rRVBiVjBlUXVlQ2xo?=
 =?utf-8?B?UHNVZksvd3RSMnFsUUtzQzJrNmcrd2s0RVlvYnlCUzh5bk5lRDVjb3p5Vk1J?=
 =?utf-8?B?eU94M2xmc0YzanhMWXMxWmtiYW9WcDREWmIzVjJZa3pqQWZKbERXMnREamk3?=
 =?utf-8?B?SEpKQUNqaUpMQ0c1K0RraGc0V2lzSHcwbXhZR0tQUWhob1Yrc3RpMFRESWFL?=
 =?utf-8?B?WC9FQ0ZSZU1FV0E2b0did2xrNmZsN3ZYK0NtN1grT0dzTmdlQnpSVXNXSGZJ?=
 =?utf-8?B?WUI2OS9kYlk2OGhiZktmcEZRTXI5aEw2U0F5a2RIUmJjY2R1R1FHRWFHOEph?=
 =?utf-8?B?elFHdVR4YUlVYzNkZDhRb2tST3dCM0J3RHAzT2hzLzFHZStIWGlLcjJ0WlpH?=
 =?utf-8?B?YkhqTEhFUzdDV1N2UXpwK24xTElGekM3SU5UVzRwcHZDOFh1c0lpOGlMZm5I?=
 =?utf-8?B?SjArRUIvbXlkWGRNRWF0TE10MExmZkxDMUxoMWZPdzFBUGowaG16MnBhTGhJ?=
 =?utf-8?B?TTBTNlV1RHlBeXV1SXB1ZzV4aUpLeHJ0TTEvWGJPTjdDZkhzNmVGN2VQWVZu?=
 =?utf-8?B?aEp1dUNwdkdoVDQ0R2kyRzdpTE53TS9oZ1BMTUU1NFptREJPSFR4ZWZkYUZC?=
 =?utf-8?B?c0tPMHV3UWFrMWNMYnd3NGRDSURidW8xL3VMbjNWYkd6c0V1OTcxQ0tjR1VS?=
 =?utf-8?B?SDZqREcrYTB6WkhoUnM3dUtLbXI1ZlBqdytlRDIremtkUGI1V1BLTHNhOHRI?=
 =?utf-8?B?Zm5TbC9XMFVQem5FOFBmdWlONjYxRTg1NkJzeVA3a0ZxdEp0b3VnOEoyUTdF?=
 =?utf-8?B?cnBSK3pjWkZFRGdnblE5UnZUR080OVp2ZlA1OTY1QjRVT3dZVmMweEFIc3pr?=
 =?utf-8?B?MERNaXJVRi95czJQTHNvQmxpY0NINTlKblNDeE95bFd5NThtWHlpcmVNMTZX?=
 =?utf-8?B?eDFGZG5pdjFZVkVzb1BHbE1kSThScTdtZVAyb0NXVTRyRVNQeWk3ei93L0pV?=
 =?utf-8?B?RTNFcnNHd05USHdFeUpNdHd6dXNNQjdhK1FwV25RTTVZbGhOamtLb0ZKeFBC?=
 =?utf-8?B?MmViVUxOMUY1a05uNVUwaTZoMU5EYmR5b0tjTHlCUUJHSGJHMUtvWUp1eDJH?=
 =?utf-8?B?QUwzZ2hEVytZWFBGWG1GWVlwV3RGMG9SYklwZHJrOG1ZejFoWXVzVkJPSWZH?=
 =?utf-8?B?SENMTlZsOVA3V00va2RONTlXeWJURVZXaEpHMGttK3lSNTg1cHJlSnVKQ050?=
 =?utf-8?B?bU9SaVFpSmZmUDV3c0lFeURvV1Z1VzEvSWxlVmpYQ1dYaVNwTnRSckU1MEg1?=
 =?utf-8?B?RDZKQTh5M0ZncmZVdm1neXZ0WEo5dVBZeEFLZ0p2OFl3djMzWTVvR21KZ1BF?=
 =?utf-8?B?NFBQeTB6S0lmUmFuMEVnL1R5enJPekFnZUlXKzI1VkJlTkZtWDVTSm1BNWVl?=
 =?utf-8?B?cGtkMmI2UDB6YnZlcUwyYkFnTzAvdHViaFdzK2JPaU1QQ2t1L2dCYk9odHFN?=
 =?utf-8?B?Z0dDQ0JNeHk1RkhsTGtSQkJUclFPSDBpVzFaUUVoK3ZYeE9BQmFLUkhKR1I0?=
 =?utf-8?B?T1hpMzdNcTdvS1ZxVGJPbUNtSVF2cnpkdFc1VExoeUJ3Nm5DcitXVUM2Ui9Q?=
 =?utf-8?B?WnoyV0x5Q1d6RHloa08rOHNGTlUvcWdDais1azVVUXllZmh3VlBWODBGdy8w?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAC50776C82C2D408B9A4C7A80A90724@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d1e07e-31da-4d8f-474f-08dac2bb8f3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 01:33:24.3355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXp31sRQFOE374i/gEEVtG9bJph8iJCDRqW4ST1MAToMWe2sww2814eSG22Iu/jURZU8cgMY1Lc+PSbiP7EqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao, Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv
 @lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBGcm9tOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPg0KPiANCj4gRGlzYWJs
ZSBDUFUgaG90cGx1ZyBkdXJpbmcgaGFyZHdhcmVfZW5hYmxlX2FsbCgpIHRvIHByZXZlbnQgdGhl
IGNvcm5lcg0KPiBjYXNlIHdoZXJlIGlmIHRoZSBmb2xsb3dpbmcgc2VxdWVuY2Ugb2NjdXJzOg0K
PiANCj4gwqAgMS4gQSBob3RwbHVnZ2VkIENQVSBtYXJrcyBpdHNlbGYgb25saW5lIGluIGNwdV9v
bmxpbmVfbWFzaw0KPiDCoCAyLiBUaGUgaG90cGx1Z2dlZCBDUFUgZW5hYmxlcyBpbnRlcnJ1cHQg
YmVmb3JlIGludm9raW5nIEtWTSdzIE9OTElORQ0KPiDCoMKgwqDCoCBjYWxsYmFjaw0KPiDCoCAz
wqAgaGFyZHdhcmVfZW5hYmxlX2FsbCgpIGlzIGludm9rZWQgb24gYW5vdGhlciBDUFUgcmlnaHQN
Cj4gDQo+IHRoZSBob3RwbHVnZ2VkIENQVSB3aWxsIGJlIGluY2x1ZGVkIGluIG9uX2VhY2hfY3B1
KCkgYW5kIHRodXMgZ2V0IHNlbnQNCj4gdGhyb3VnaCBoYXJkd2FyZV9lbmFibGVfbm9sb2NrKCkg
YmVmb3JlIGt2bV9vbmxpbmVfY3B1KCkgaXMgY2FsbGVkLg0KPiANCj4gwqDCoMKgwqDCoMKgwqAg
c3RhcnRfc2Vjb25kYXJ5IHsgLi4uDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
ZXRfY3B1X29ubGluZShzbXBfcHJvY2Vzc29yX2lkKCksIHRydWUpOyA8LSAxDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxvY2FsX2lycV9lbmFibGUoKTvCoCA8LSAyDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuLi4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwdV9zdGFydHVw
X2VudHJ5KENQVUhQX0FQX09OTElORV9JRExFKTsgPC0gMw0KPiDCoMKgwqDCoMKgwqDCoCB9DQo+
IA0KPiBLVk0gY3VycmVudGx5IGZ1ZGdlcyBhcm91bmQgdGhpcyByYWNlIGJ5IGtlZXBpbmcgdHJh
Y2sgb2Ygd2hpY2ggQ1BVcyBoYXZlDQo+IGRvbmUgaGFyZHdhcmUgZW5hYmxpbmcgKHNlZSBjb21t
aXQgMWI2YzAxNjgxOGE1ICJLVk06IEtlZXAgdHJhY2sgb2Ygd2hpY2gNCj4gY3B1cyBoYXZlIHZp
cnR1YWxpemF0aW9uIGVuYWJsZWQiKSwgYnV0IHRoYXQncyBhbiBpbmVmZmljaWVudCwgY29udm9s
dXRlZCwNCj4gYW5kIGhhY2t5IHNvbHV0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBH
YW8gPGNoYW8uZ2FvQGludGVsLmNvbT4NCj4gW3NlYW46IHNwbGl0IHRvIHNlcGFyYXRlIHBhdGNo
LCB3cml0ZSBjaGFuZ2Vsb2ddDQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24g
PHNlYW5qY0Bnb29nbGUuY29tPg0KPiAtLS0NCj4gwqBhcmNoL3g4Ni9rdm0veDg2LmPCoCB8wqAg
OCArKysrKysrLQ0KPiDCoHZpcnQva3ZtL2t2bV9tYWluLmMgfCAxMCArKysrKysrKysrDQo+IMKg
MiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jDQo+IGlu
ZGV4IGE3YjFkOTE2ZWNiMi4uYTE1ZTU0YmEwNDcxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9r
dm0veDg2LmMNCj4gKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jDQo+IEBAIC05MjgzLDcgKzkyODMs
MTMgQEAgc3RhdGljIGludCBrdm1feDg2X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KHN0
cnVjdCBrdm1feDg2X2luaXRfb3BzICpvcHMpDQo+IMKgCWludCBjcHUgPSBzbXBfcHJvY2Vzc29y
X2lkKCk7DQo+IMKgCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVfZGF0YShjcHUpOw0KPiDC
oA0KPiAtCVdBUk5fT04oIWlycXNfZGlzYWJsZWQoKSk7DQo+ICsJLyoNCj4gKwkgKiBDb21wYXRp
YmlsaXR5IGNoZWNrcyBhcmUgZG9uZSB3aGVuIGxvYWRpbmcgS1ZNIGFuZCB3aGVuIGVuYWJsaW5n
DQo+ICsJICogaGFyZHdhcmUsIGUuZy4gZHVyaW5nIENQVSBob3RwbHVnLCB0byBlbnN1cmUgYWxs
IG9ubGluZSBDUFVzIGFyZQ0KPiArCSAqIGNvbXBhdGlibGUsIGkuZS4gS1ZNIHNob3VsZCBuZXZl
ciBwZXJmb3JtIGEgY29tcGF0aWJpbGl0eSBjaGVjayBvbg0KPiArCSAqIGFuIG9mZmxpbmUgQ1BV
Lg0KPiArCSAqLw0KPiArCVdBUk5fT04oIWlycXNfZGlzYWJsZWQoKSAmJiBjcHVfYWN0aXZlKGNw
dSkpOw0KPiDCoA0KDQpBbHNvLCB0aGUgbG9naWMgb2Y6DQoNCgkhaXJxc19kaXNhYmxlZCgpICYm
IGNwdV9hY3RpdmUoY3B1KQ0KDQppcyBxdWl0ZSB3ZWlyZC4NCg0KVGhlIG9yaWdpbmFsICJXQVJO
KCFpcnFzX2Rpc2FibGVkKCkpIiBpcyByZWFzb25hYmxlIGJlY2F1c2UgaW4gU1RBUlRJTkcgc2Vj
dGlvbg0KdGhlIElSUSBpcyBpbmRlZWQgZGlzYWJsZWQuDQoNCkJ1dCB0aGlzIGRvZXNuJ3QgbWFr
ZSBzZW5zZSBhbnltb3JlIGFmdGVyIHdlIG1vdmUgdG8gT05MSU5FIHNlY3Rpb24sIGluIHdoaWNo
DQpJUlEgaGFzIGFscmVhZHkgYmVlbiBlbmFibGVkIChzZWUgc3RhcnRfc2Vjb25kYXJ5KCkpLiAg
SUlVQyB0aGUgV0FSTl9PTigpDQpkb2Vzbid0IGdldCBleHBsb2RlZCBpcyBwdXJlbHkgYmVjYXVz
ZSB0aGVyZSdzIGFuIGFkZGl0aW9uYWwgY3B1X2FjdGl2ZShjcHUpDQpjaGVjay4NCg0KU28sIGEg
bW9yZSByZWFzb25hYmxlIGNoZWNrIHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToNCg0KCVdBUk5f
T04oaXJxc19kaXNhYmxlZCgpIHx8IGNwdV9hY3RpdmUoY3B1KSB8fCAhY3B1X29ubGluZShjcHUp
KTsNCg0KT3Igd2UgY2FuIHNpbXBseSBkbzoNCg0KCVdBUk5fT04oIWNwdV9vbmxpbmUoY3B1KSB8
fCBjcHVfYWN0aXZlKGNwdSkpOw0KDQooYmVjYXVzZSBJIGRvbid0IGtub3cgd2hldGhlciBpdCdz
IHBvc3NpYmxlIElSUSBjYW4gc29tZWhvdyBnZXQgZGlzYWJsZWQgaW4NCk9OTElORSBzZWN0aW9u
KS4NCg0KQnR3IGFib3ZlIGlzIHB1cmVseSBiYXNlZCBvbiBjb2RlIGFuYWx5c2lzLCBidXQgSSBo
YXZlbid0IGRvbmUgYW55IHRlc3QuDQo=
