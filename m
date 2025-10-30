Return-Path: <linuxppc-dev+bounces-13612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F02FFC229D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 23:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyKLN3q4Gz2yyx;
	Fri, 31 Oct 2025 09:59:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.19 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761865164;
	cv=pass; b=i8UdKFJyscQbgTsSxUukHGT6L/z+5jVK7h2DZreiPGxWWb2sN//v/WfwC/bv2Ua37QIM3C/EP4xzMSTOGW1Bf78GD0rqGhSJIsgGHT1DqhvLVpeNh/PjNvhfz7MBanwR4hGec0DF540nIXqS8+Y3BXbscxMV51Rvh3bmnNGNkncuw7I7wOwIyDWZHcwpnPE23UdpGn43GV7K0t03MvoJ7pgrXwc/84bB34/ti92sBjWttNWPZsiJsEM4mp3Xw628wkyL1LGGb7EEisEphJv6Lfg6a8A+8HnfjyXJqYE4+iyALBOyjSsbrLxfsWryOFugUvICFrHoL7D6BeHLqkcefA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761865164; c=relaxed/relaxed;
	bh=udjJJAhMhrPvAeawa7H6g6P1PTug+9ksQqzhzEQAfaU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JtI2GSt/TxG00sLvuLUNPVtYmCu5vnPQF+k9HEz+seiwCuDbIUx4p9U27wgkyVbiqeIy2dZyYyzEvySYvp3ZfJ4niZEFo1lO4VRWdlKT+KudnVNf59nwGCTtXEgXiRqMndg5x/nVh10hKyUUnOAYg4y0Tp4oHIszX0RVhGdPz7Cku1eEpN43oJcq1gStL6u6BaU+lGz+Uj4iKgnQySLA6pKyDtt1umdaMRW/zECTZpEGtWNizLNQ+mzeNQbwGpqBxZ4Bqf8D1kjt1gqi2bzvyxrVBm1tF81Q49kyzi6/3wgRWYGr6F5GY1PiIeHNTBMHZZuPKKY1UmoVElpfKCbJQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UQKLiDmn; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UQKLiDmn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyKLK6Cvxz2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 09:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761865162; x=1793401162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=udjJJAhMhrPvAeawa7H6g6P1PTug+9ksQqzhzEQAfaU=;
  b=UQKLiDmn7w24M7Y1Nc1ZDUx+vYi5e0zDQ1uCjkelzXa1GxAEZ3mJNy7Y
   GwyrKrATB+emjyXpjO0CMO85HTCKV3ymxQRKkaw5JSH1N/+2x4pq3yJnj
   R6SeNvlXNsa3ChSGAE3dtCIc5R4JM6Sp2WwRXetoUtg7eMZPh84h4TRtZ
   oCFe/7MtWvKpxP+p4dzAFfTDACI+/+/w4pOLgX1uLcPtEcSYqlZQZvlBd
   XL29NsF8k5yt4PcOyx26gZWmThlaVADpmHNVWiWz4T6XUVLnEj0QcfN5F
   shyVZ81FFGKkdMkIjtogzdOj99/LLPOGVxzIK2baJSJeknfkTVvB/Tfop
   g==;
X-CSE-ConnectionGUID: LStXJ4cMTnOjepCAIitSFA==
X-CSE-MsgGUID: 2iU54C+ZSW2WR5Ud6OSwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63042181"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63042181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:59:18 -0700
X-CSE-ConnectionGUID: PtfcKUuHQ9y+dfeBV3MYAg==
X-CSE-MsgGUID: sjAnN6yWR1O8Hp+9f4L6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186819371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:59:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:59:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 15:59:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 15:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNbHTty2IhbSWbKFWRqXkP+vIiJ/NiXq/2sT+57aUV0RjhLqx9ZW+7YacPRAU5ZETs3Q39Zuprw+9UrAUuUtq7bFCTGaQO9ZXesBQ0F/z7Zm9ePw5U3LEjuCetmw5uxgvsfQP6D0dgn7fTg43bw8cNYNnGisG5nzQ0UH/a5Okukc96nCQ+tKcKzHPO4gHJbrvJc74R5C349zaDC3vg6ulf918O11aDGmD0+6Hc6G9BxU+oLNYfzrTO04KMssouAv8HlSUA59TpGIBQ3GjOJ4IA3xcxR6Cynhz91Kp6p4ajott0FJtOx7VM947tMICEkugcKEaZxqljV806XnD85pIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udjJJAhMhrPvAeawa7H6g6P1PTug+9ksQqzhzEQAfaU=;
 b=NYNqGWg0X7cRJtMtCtgVEtb2gQ4U16+RRmys9lJ8dFZZFLzDx8BWkYcf840lMubDTJxKJtuQhdMETsJk9H1YQUzKbG77spxTA7DAX+qmT/OD8KmioftU8S6IWBkz9OzBGgExRDDWcWNeQXt/D6T8ZtZoltzBKrwWhC7S4yAM1IGD411RAexrHnbHNPDVPa9lN7rOyhw8JR9AQ1aL3QOScJ7IoZTopdDRZ6pqOYmuhXRLpPw2yq6ocMLwh6cCHJDJm3jDy50q7Uoj8LjIe/mdYkN3ywGHgMj9jkw+/EERLXSC0VSoFeyWQ+zzNk7nfFWBYKPj9uLfc/IubRfM9ZxWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 22:59:07 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:59:07 +0000
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
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
Thread-Topic: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
Thread-Index: AQHcSdlJe5RLgiFVpU6t9BHZboMY5bTbTeAA
Date: Thu, 30 Oct 2025 22:59:07 +0000
Message-ID: <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
	 <20251030200951.3402865-13-seanjc@google.com>
In-Reply-To: <20251030200951.3402865-13-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SJ1PR11MB6131:EE_
x-ms-office365-filtering-correlation-id: afd8c12b-0f52-4c8b-9139-08de1807ee74
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dUpmU3VLUkZHa3N1NGQ2OTNnNW9LWXovN0Y5NWxVR1NaQ3NzTjhrYmZVbmhX?=
 =?utf-8?B?Y0E1Q3ZXMW5hbkcxc3JQaG5nZm5hQlhuUDBuUWpyQ0tYRVNxYTBMa01MT1I3?=
 =?utf-8?B?dkprY1pUdlVHb3hSZmlsd0crcU1qc0gxWFU0VUpadktsK0NMb2dsRVpKdkps?=
 =?utf-8?B?cnk5ZkNXN25HYVAyc0VDMkIraGI2YnBGR08wTWZNdXhwUERnbUp5TGFmYnZO?=
 =?utf-8?B?NXVvUndNQzVybVBOcWhQblYzMmJxVFpMTnNxaDBVaVdVTEpqbm9zNGs5cktN?=
 =?utf-8?B?VnFHeGV3RGxwcUNBY09xQjliajFJTlkwQ2svay9MMlAyM0ZCZnJVWGJkZ0Rq?=
 =?utf-8?B?K1Q1L1BsWXpZaFVMMGdYSFFJWHF0YzNOaDlyaThIdnpucFZHamZ4VzhxTHVX?=
 =?utf-8?B?eUxHSy9GSXZMdStMaXZkelZSSjNPWXdDaEtaSnlkaitJclVTMW5SM3BHYjZ2?=
 =?utf-8?B?MjNFQ0pXTVVtZE90VjY5NjJYc05rMVNFczY1N21sWitVZW43RERWdUFyejdr?=
 =?utf-8?B?Ukk3Zkx0UnNJeFVqQkNadkcxMWtISjEvK0RSb20zQXFlVlFUQ0dkMlFZclRa?=
 =?utf-8?B?cEQ0RXh1RFJ4WUp0NGhTUUFkbjBSOG0yQmFDTVEwSDBqWlo1dzhtb3crRVBi?=
 =?utf-8?B?N2VuMmxZS05oUVpDNythMGtMU0c5SCtWcFFOcGRPUS9JN2k2SDdIamJ1SUNB?=
 =?utf-8?B?ZkdtYktUeTBQYVVkVE1mdXZUU3l1ZzRnWDJzdWxwcVBvVWx2NCtmRTFjYTUx?=
 =?utf-8?B?eTVyd0prRTBuTm5OditTNEhJaXJpWSs5YlZ5RlpGNkJ4Q1B4S08zaXJuVDc0?=
 =?utf-8?B?VWw3ckFkZzlLYStxSlVBeDJuQWlWeXNCNWFlQmFzV0lEbDV3OTFlSVJmVEhv?=
 =?utf-8?B?L1hkWFVjeGNaRFp6U2VySEtRb3VhUjZ3enBCK29rSFBmRnVuRkp6NlE3RENR?=
 =?utf-8?B?Wk9aRE12YUdsRVFtRCsyektiYmJNWUlkVkIxNlJQR3UwQTZ5c2xrMzd1TlpD?=
 =?utf-8?B?T1Y0OExqZG5jZjUrcWJHS2MzVGMzMDlvM0hOek5hb0JESjhxMEZhYit5T2tW?=
 =?utf-8?B?T0dJYzRFcHpkZXZCMHFjOHRNbVRIeUJadjlSYU1WZ0pnQ2tCU0JjWC9rOUM5?=
 =?utf-8?B?dUVBWFcwSUw0V1YycGJpeVpKdHl5bmFiMHpLL2Y5NTVwUlNUY3paTHBxZkdi?=
 =?utf-8?B?aDdMZlpSaG9TWWtpWTliQnVlUFRsR0w2aFMyc08vOE0zNEI2ZVlQSDFpb1kv?=
 =?utf-8?B?RVBzVkx1UnYrcnQwd1pNWmo3MGxSUWtoM0lIUkRiczBKYWc2bjI1UGtoQVhp?=
 =?utf-8?B?VUNXZjh5K2RldkR1NmtVb3hBYkFadloxVEFQY1J4TXZxaG8yWG04UllaemFz?=
 =?utf-8?B?RlJKKzR1UHpUNmg5VE5Da290TkQ2Qy9hTU41Q1VNTGg5T2xOTUU5UjU0Z2M5?=
 =?utf-8?B?RGtLbzEvbTg0MzdXRUFFMTI3YnFoN0VZWU9OdHBmWEY4NmhQbkhNVFU1TmNM?=
 =?utf-8?B?V29WdGc2Wi9TdC9FWjFuVUM2a1lJb3Y0cVcrYTd5NlVwM2YrNGZ4aUEzZGRl?=
 =?utf-8?B?OWdsNlNzd0U4SGhYbnhPQWsvcUV2SStsMjh1ZU9QWWJVdXZ6OW44R2xyRzBj?=
 =?utf-8?B?cEhOV3ZydktaeXEweEhSM2JHRTJyclNRNDhjdWVzdjFhREhhc0U3Q3VCdEpj?=
 =?utf-8?B?UnpVdkgvUHhVeXdhR1YwOWwyV292TmVxemZHeVM1azR1SkhrOTc0NzRRNlhr?=
 =?utf-8?B?VzRCOUxYMnh6VHpNWG5Ga1FOQWs3NUhDU3NQbTFURFdlZkhoamhVdnhTcElN?=
 =?utf-8?B?M1B1cE91ejhYK0UweTF2dGd2bWgwTkk1UVg5dUdIOW5LSE5HRndNd3dmYkZQ?=
 =?utf-8?B?WmlxZG5UREYzb09WQWRhcWR4WDlWL2dLMHFIaDlQT0gwcjZZbXFBYTk1dEEw?=
 =?utf-8?B?WTFybDlrTS9ydFpGZG9qcnY0a0h2TVhFQzN2aXhWN1BDbGsySEtqdTBaVUsr?=
 =?utf-8?B?YmhQbFpyMUFXQ3czMWM1U0RXVDBnNEpCc1BYb3NWUkI1SEljMVQ3VXB3cC9R?=
 =?utf-8?B?WE4zNGZYTzlENEtidXRzckN4YmVGek4rRXpkUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVRvMmVaenZZNVV3Z2JIWGdKN0VuRXVLK1E1amR5L0JUaUNjNi9CczN4Nllw?=
 =?utf-8?B?dU9zZXE1SGJaaGdtQWI5NENBeGdmTG1NbzZMSkpEUnpxUTJ0NXNMRm5YcnBi?=
 =?utf-8?B?cDJUUk9OVEl4d3ZUWkRUSElBNHdpdkE3ZnhNdUI4WXRobGVyYmZIelV3Mkti?=
 =?utf-8?B?STF2WHp3YTBCVjJzRitLMlE2T1ZUb0ZmQk5hNEthRzk0ckVHNlcraDdTeUhX?=
 =?utf-8?B?bGttbFJiLzVHdmhQekJhaktzVFI3dXNlS1VtblBrMldWbEFaZFluWnRsV0Uz?=
 =?utf-8?B?UkVoU0gzV3RyTHpzT1JzVUFvci9MV2tNVGd0aHY0VDZ4MjJGTkQ0RmpBSnRh?=
 =?utf-8?B?OEhTOFFKMVFhQ0s5NThBRTB0bWxVZGw3aGo0dWlBWUZJc1p3NFlXRVR1L2NQ?=
 =?utf-8?B?cEl3VURIQXhsZDNIMW9IbVBXaHRpN2Q4cDIvK3dXZzFTeUR1RHBBUzk4R05O?=
 =?utf-8?B?QzVGVDFnaW8wODRvVUZ6akxmaU5jQmtIOWpoTDRhajVaNWZ5N01UUkJ1Wmts?=
 =?utf-8?B?OFJCMjFzSThjRnlRUTVieTI3MjVPKzg2czlWTzROTFpWYkVDcjRrTFhIZExk?=
 =?utf-8?B?SUhlWXUrNE5VMHdOZFJXa0VNZjY3cVJuK20zNlNGamJtL01IYjZSRzZjUWU2?=
 =?utf-8?B?THJzTjd1QUJzb2VKUTJOVlQrM29LdjU4ZlRDUi80MWVJRnE4SUFsQ20za1Nz?=
 =?utf-8?B?VFlnbEJ4Q0g4L1JkQU95bHJpZ1dUMCtEL0pNR2lMQ2RmZDNoNFhUWHB2Ujdn?=
 =?utf-8?B?emV5UmhqeEZUVEhPbXdIdVRIdnlsemxIdEhJU3Z2TWJxVnliM2dvRWt4dWhi?=
 =?utf-8?B?eTM0dVZsV0I2UVF5T1dHa2QrM1RDcHJaa0E0RWxMdHJ3UEFSRlVlRWJkVjVj?=
 =?utf-8?B?bVFlYVNUUUE2Q2hOQ1N0M2VxaHc5eVdwUDVSUzNZS1NkZHYzUS9vRnAwMnpV?=
 =?utf-8?B?U2M0L3Rod2krcE5zUHpXQWRhcGtLSjN1SGM4VU8rK3RTVFNDVnlqOHFRMlE2?=
 =?utf-8?B?a1dTaWhod2FPNG9Oa0FWZGN6MmxCclpkMnFad2xFeXZJNHZRVjlSQklibUsv?=
 =?utf-8?B?NGdEUGFuZjU2S0NRbHhVNXJsN29XbnBHa0xlT1h2S0VMT05STUdvME93ZUQ4?=
 =?utf-8?B?WDNQaDZvY01kMTV6dGs1T3pjckwvb2k5bHhxdTErRkUraXVtSnVUQklTeXhv?=
 =?utf-8?B?WEl1UGp3SmgrbWttUENyZWtGaUt3ZFBPTk9RVEtRSE03MzhvS2dSU1VrUm5x?=
 =?utf-8?B?dXNRM05sbjBSV0tTWm9qR0hTb0hmVFpOY1VYNCtLQ0UzVGtSajlscXpqZ3o3?=
 =?utf-8?B?YjVtT3ltUWtPbFJxMEUyQjlSand4VTBaTTdaeG04QTFpa0Y1c1Q4N1hkemNZ?=
 =?utf-8?B?S3A0cVU0cVZIUGVWUGZ3MWFBSkJrVVMxb1ZjNXozMDdEWXJGVks3T2dsWUFj?=
 =?utf-8?B?WkhvMWZGTE5wc29wM2trMjZvSWtqcXlVY29oV0s4dk9SVjlTVEowaldEdHdv?=
 =?utf-8?B?NFZqb2ZrdFdQVEdDN0l0V2lCYVdTZU53Vm41MUZLbWNRN3lWRlhYdzhCTW15?=
 =?utf-8?B?V0xTaUg4Q2trVWprdzR0N1poRFVidW9BOXdBMUJMcFhvc0F5UDZ4V0tjWldL?=
 =?utf-8?B?Qk15RjdNZGh6V3k5cVRjZWI4bUpLMkVmK2tYSHNyeXlRK0VyQndabXJoK2lZ?=
 =?utf-8?B?aFkyUnhMdGlHdDY4VG1NM0ZQdUlNR2lhdGpRNGdEbUorSThZUnh2VjZjdnRT?=
 =?utf-8?B?S3h1ZGlXaVg0QXE4MmNHdThsaENvazRGd2RUV2hRNW5EakhOVG1Pa3pJb3A4?=
 =?utf-8?B?TGhKREk3QXJ6WDczZUNWVEhETjBaZmxYaUVWL0djVE15c0l5a1l5aVdYdno3?=
 =?utf-8?B?dDFtOE1CeGhPQWw4MkpYeXc3MGtQOEpIZmc5ZUQzMldkcVhFVzI1Q3hHMTZu?=
 =?utf-8?B?Tm4yb2liQXYvbFducWpaaGtPdnJ3dnNlZTlUQUxtTkkxeHhqWDVTdERSVmxG?=
 =?utf-8?B?dGlaZW04SVhSODVlZGwvVkVVaW5QZ1BFQi8yM0ZpOEVLaG9EOEQ4Q1MvS0Jp?=
 =?utf-8?B?ZWtJUDFaSmtVVW5SZ3JXT1ZBc3lIUjBPQm5rNkN6ak5jcjl1ZHBNUmlpTzB4?=
 =?utf-8?Q?znVGAwQ/hNaDwgNhHABGHSX4N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0DD142658B0804E9C0AD5228E62798E@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: afd8c12b-0f52-4c8b-9139-08de1807ee74
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 22:59:07.7518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsP52eHDECNenqZOm9XkuCgRkOfupVtJYGjU+r5B/TmfesFeytG+6lPjtTqOQ0XR6Ch+lKvCwKzeeDuD2wy0qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDEzOjA5IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBQYXNzIGluIHRoZSBtaXJyb3Jfc3B0ZSB0byBrdm1feDg2X29wcy5zZXRfZXh0ZXJu
YWxfc3B0ZSgpIHRvIHByb3ZpZGUNCj4gc3ltbWV0cnkgd2l0aCAucmVtb3ZlX2V4dGVybmFsX3Nw
dGUoKSwgYW5kIGFzc2VydCBpbiBURFggdGhhdCB0aGUgbWlycm9yDQo+IFNQVEUgaXMgc2hhZG93
LXByZXNlbnQgd2l0aCBmdWxsIFJXWCBwZXJtaXNzaW9ucyAodGhlIFREWC1Nb2R1bGUgZG9lc24n
dA0KPiBhbGxvdyB0aGUgaHlwZXJ2aXNvciB0byBjb250cm9sIHByb3RlY3Rpb25zKS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0K
DQpSZXZpZXdlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0KDQpbLi4uXQ0K
DQo+ICBzdGF0aWMgaW50IHRkeF9zZXB0X3NldF9wcml2YXRlX3NwdGUoc3RydWN0IGt2bSAqa3Zt
LCBnZm5fdCBnZm4sDQo+IC0JCQkJICAgICBlbnVtIHBnX2xldmVsIGxldmVsLCBrdm1fcGZuX3Qg
cGZuKQ0KPiArCQkJCSAgICAgZW51bSBwZ19sZXZlbCBsZXZlbCwgdTY0IG1pcnJvcl9zcHRlKQ0K
PiAgew0KPiAgCXN0cnVjdCBrdm1fdGR4ICprdm1fdGR4ID0gdG9fa3ZtX3RkeChrdm0pOw0KPiAr
CWt2bV9wZm5fdCBwZm4gPSBzcHRlX3RvX3BmbihtaXJyb3Jfc3B0ZSk7DQo+ICANCj4gIAkvKiBU
T0RPOiBoYW5kbGUgbGFyZ2UgcGFnZXMuICovDQo+ICAJaWYgKEtWTV9CVUdfT04obGV2ZWwgIT0g
UEdfTEVWRUxfNEssIGt2bSkpDQo+ICAJCXJldHVybiAtRUlPOw0KPiAgDQo+ICsJV0FSTl9PTl9P
TkNFKCFpc19zaGFkb3dfcHJlc2VudF9wdGUobWlycm9yX3NwdGUpIHx8DQo+ICsJCSAgICAgKG1p
cnJvcl9zcHRlICYgVk1YX0VQVF9SV1hfTUFTSykgIT0gVk1YX0VQVF9SV1hfTUFTSyk7DQo+ICsN
Cg0KTml0OsKgDQoNCkkgYW0gYSBsaXR0bGUgYml0IGNvbmZ1c2VkIGFib3V0IHdoZW4gdG8gdXNl
IFdBUk5fT05fT05DRSgpIGFuZA0KS1ZNX0JVR19PTigpLiA6LSkNCg==

