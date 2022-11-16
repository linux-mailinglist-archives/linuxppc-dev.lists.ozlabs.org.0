Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0562BDAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 13:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC2Kg3QbXz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 23:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bdacjDGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bdacjDGA;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC2Jf4x3gz3cD6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 23:23:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668601410; x=1700137410;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=l9Cf7nmpscukURdL/GshkU32GpTSMpFzcxryPat/iVA=;
  b=bdacjDGACr18D398CL28XV5S/4OjldygPVcoMpyXUJdn+5Nme4YvBPzM
   TRBBjjaScV+NtI0GDLUPn8xN1elg+GoghTaigQfD3Br2TyxrHvWnpEPwa
   0Iodrsai3fbC1qPjYgcfH4zTBdOR3VH7ID/WJSDyJnOVE+RJH1GHF1/Ol
   Qe7CqkezcGsILaC492wFFCr7bjVnKbHty2EnLK1goD4k1sDvBBI0iJzag
   /GqmBNaSzZpi79ei/fBy9WsYTrJ9Nfb+PNmIqdLmAFyTacJB+//P0/IRR
   FjegU4848t3ktNb2n+7V3y0maoECQve7R285WibAS64GkG9OV7vmA99gc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="339343688"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="339343688"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 04:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884386392"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="884386392"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2022 04:23:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 04:23:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 04:23:25 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 04:23:25 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 04:23:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZQOunF4FrWpDKQZ/Ab82nZagi0BN5EKb8itKJSE5/4nwwUfK/BZD/iHD8DPqM61joARXe+V+5Lx3ryXfgV3GOZ2j6rBqA+ThKFG9cNd0EO3JrVaDVW0VaDTgRauyP5Wwi5d1eCL1XiGtcMjFI1vjyuk8ftrclh5nTH6p/JbG4rIfE4qqoLvWW20kLA5u3ej82Ke6YpLmSyJiy6TASSCIn4KQGi42NklYuuK1lA8QA0rz7Gky+syUB+ktqST9Yi0MgOv/mgK3OuzVJhc/Hdlh6geN652Qov/C5ArcpZHIHfS/HeH+IBbb6n37Np88ScI+WWqA4TEsRp18RVaHVSYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9Cf7nmpscukURdL/GshkU32GpTSMpFzcxryPat/iVA=;
 b=gCI5ITvRWbmb+6SK5AD2u444WE9yVCEuOsc2YRrOLTXkuboWjBpfqlemDW0IUgeuYtOoh44DgZBijpGe82YvHXv/p4qNtWVp1Ge5E0/tshKKKodVuEqre6nTojpPUredsNwhJ0qRvKSqZ6eKAdJtlVwBb/DRvCTsBaM846NiKxFq3eGE1lMnkxFXJivtFoz6mBX52tvmrxWvqJY8sgY1yA05Kk3ARmjddS2CDTh60ndQzfdSEQY6T1CG8xxb01+7dQkLJL8zf4KDUTt0xv/A8dnNrkKoJX4FrP8vqEFSb//30ueW37CiGCz4ermQtTStFAC0/+PiThByDxl7XXZo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 12:23:11 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 12:23:11 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Topic: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Thread-Index: AQHY7xJy2pUg1L4bCkib6AOkbzD9bK43arEAgAAKuoCACQqcAIABDjUA
Date: Wed, 16 Nov 2022 12:23:11 +0000
Message-ID: <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
	 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
	 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
	 <Y3PzhANShVlTXVg1@google.com>
In-Reply-To: <Y3PzhANShVlTXVg1@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MW5PR11MB5929:EE_
x-ms-office365-filtering-correlation-id: 43b95de6-8a5f-4f9b-73f2-08dac7cd53cc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OmjGqUZ11UU5k/ZibrEQJQm7UjkSS7ofD3k4/aHMJjbR0zYFXMFcLtO9Q+KfL5ZEyo5eLvdvYG/CbXnmM1F4oaoCzZ58NiyrMOH35gy7s5dPpxbkWOId8OMaJmL2uCqJGCfPLhs1DX5psxgvM7WsqZSiTNZ9qVtUeMur+b3olB23oFLst2zAAEr+0jgwIZjmNVsSEi6VPx5KkZXc2u/5VNxYJvwOP/BuyTvL7HCLNkD10/7mDZAo8GwhleWLG1CucRBJh+4Pr7uI3+4wS+yDjnhpMUBzLGGw9GMQXNWHsy4SRXPg7SP/GgNDjUwF7pIe2hiuKQg+0aQj2wZxbM+vSaf5f/zalTFaTgERvRrFQvW1TzbZiwUjEvPF5Yph3riuPd3vDH1FBCcuseGuyNHm/PnGwp7dH/Vwf0/5RmQMQ+TtJli5oghZXEfrdWL3eW9CNU4Jb+G5jSHsc8+zyTk6bIAzWy3h/BLoQhadJF0WthRjVUiRjss3xfO4nVBw/17sSqPQK9tKDJ5twdyf1BGOqDeZJNR48wDta6s7+kvC5/A67JNlHgSTEN2wIN36bnyDNkwcUKeQ2Zcp7qZWTEaYCWUcYvUHvy3UGhT2UAifcsgToJmuF4/Ksr/HGRuCJja4IZsrabafmEqmRV5sVuLmO/TFYAonESX7VnkuTjAoOrIai4wF10nwxIT4VHzr6r9m+6ygWoQE2PXojuzRA2eRXWO5wgGS2kKEpJsWcqBSMmzIk35eQXjdgTsC5JAdMjIZ8ON1/NjRhVGFPzRNGdFf7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(122000001)(71200400001)(83380400001)(86362001)(38100700002)(6512007)(82960400001)(38070700005)(478600001)(6506007)(4326008)(5660300002)(8936002)(91956017)(64756008)(6486002)(76116006)(66946007)(7416002)(54906003)(6916009)(66556008)(41300700001)(66446008)(316002)(2616005)(66476007)(186003)(7406005)(8676002)(2906002)(4001150100001)(26005)(107886003)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXNUVGZFUkVkWFRRcmIxK280NFhkenhPSmRvVjd3R0RSY0tjY0IyZ1FHU1BT?=
 =?utf-8?B?T2hBR2RSblJlK0JpN3Q2ZjFGdTFJdERqOFlnbFRnK2JGZmlFS3pzYmNHNHRJ?=
 =?utf-8?B?SXRYelQ5V3Q0NHo2R2VobFFVSEd3bnZva1hBM3RUUjB0VzlRTnFrNzFGWlJO?=
 =?utf-8?B?L1RjVGQ3RVA1WjN5RVhiaHAzbittQ0RNZFVQam5NdW1JZDRYMVlKSktNcW00?=
 =?utf-8?B?ZUZLQTVVbENTdUFYQThQUTgrcDVaTHluNkovNVlodGZWVE1JWW1Ba0pmK3FN?=
 =?utf-8?B?Z25oQzhtb0drVnc1MElKeEwwTGpXMXIxVGVGWm41cXlteXkyM3ZCMEF4aytV?=
 =?utf-8?B?em0veG90bGcyNUdXaW9GbkNVVjdMVS81OXBTUHQ5OEphT1NaOWYrcUsydUly?=
 =?utf-8?B?b1BRTzRvWUQzNFVtVjlZR0xnV2ljbWFtQXVYT1A3a1RyeFFiR0ZVMDdlWjY4?=
 =?utf-8?B?VDR5bzAwbFUva2k5bzZBaGVlbUNEN1hFeUwyd09URUp6WG04Z1Y2bzk1UVhR?=
 =?utf-8?B?dytIbFRHWGFLMTlGNlMvN3B3ZUpkZ2RONFI4MjQrSGRvTzFLM1RTN25EeklS?=
 =?utf-8?B?U010V0lXbm5mNnBBbUtFQytjdXZMWElpQlNCUk1scmh1ckxBdFhSVTFBankw?=
 =?utf-8?B?a1ltQTVnUk1DWk1iVnJyUXNWWkVxSnExZlhuVkxvbnR3Z1prVHBpZzdLTUdW?=
 =?utf-8?B?VFFQOUVFWmd6RFJoNDhsMlIwRyt5M1htS1IyZ2t2Uk9YcHE5N0sva3VyTUdB?=
 =?utf-8?B?UjlHV1FEeE9KendSUHFXS3RKdFBYVndjbkFYaUhQR29OWTI4cjVVNEl2bC9M?=
 =?utf-8?B?KzFoVmNrOHR4d2lJdHErQ2N4T3ZNTXpZNUsvTi9ORnZTTkw4MHVML055djgy?=
 =?utf-8?B?VkhsRHUrMGR5dFR4aWdzNVZwRjFiaHc1N3A2R3p2TnhQNkVGK2NSN2lpYUxS?=
 =?utf-8?B?TTFqTEhaK3dnNExMTWZmcjRxb0Zjc1R0MjRpUnIwZXlVSmdheGNRZEVnU3ov?=
 =?utf-8?B?YkFxbHdHaEJNRU9NSUhjTGE2WnQ0Q2M0anVZUEI5QXpSM0kvUGtVS0xUbUVT?=
 =?utf-8?B?Mi9kU244NjlrLyt2K3ZncnF2Z3JjMmgrTVlxL2d6R3dNMUUwNnV1RDYrZnhq?=
 =?utf-8?B?bDhWYVcvZ2NNOEg0TWpJRFh2UjR3MjN3S1BOMDQ3cm1nYmE2aEd5YVpudzZU?=
 =?utf-8?B?UlR6QnllR2RTSzRpMEZBRi91bktlT3NnbFFWSitEb0dBNHBtRHlFMVpFK0JI?=
 =?utf-8?B?aUNZaDJxVlFVS0RPQVVFa2hhMEVWbG4yZmorTE5vRXRoU1dISkp4VEl5RzlH?=
 =?utf-8?B?NFN0bjZQTUxPYkkwdFFmSFdjMEZzdkp6Q2RQaEhlZitWR01EVWlTL1F3NTRa?=
 =?utf-8?B?K2tXZVZNdlJxM0RGK1N5aXp1WlpVckFESlo0RkpLbFlVNkxNMHdaS0lSa2Jx?=
 =?utf-8?B?ZzRJZC9VTlRDcWNETmcyMXd4dnBhU016UDRCVHV3VXRoM0RieGVhWkppUito?=
 =?utf-8?B?WEN3aVl1RjE5NUwxZEV3YWZ6cG1uc0VMaFM0c1pPYk9hMFFkNmtSRzhTd2Fp?=
 =?utf-8?B?Z1BQWTRta09vNkRiM1NORWtnb1pabmhEUkRsMmx4WmFaNzF6NGhuTG1lNTNP?=
 =?utf-8?B?QWoyQmxnOXV5NUMySEtrUTZWZG1hMnBhSnlkY3NTZGdOa0ljYldiazVzN01N?=
 =?utf-8?B?M3JEVDZZZ3pSVVc3NW1ubnA4SU1HTkZCV0pOcFV4d05UMjVvb0xvK3pHTUdJ?=
 =?utf-8?B?MllVbHB1aEtrU2E5cm9IR2RhV1JSa3dZdmNpbSsrUFd3ZU9IOE1UU0x5Z3Jx?=
 =?utf-8?B?R044Lyt5WWlJS2VGb1hITWVwS0toVVU1MjhYTFY1YTkxcWExSStiNkdGTTlt?=
 =?utf-8?B?Wk5rTXZjMW4yNzBjVllyampFYjdHR0lQSHh4QnFvSjdFTStmblAza3orbzNO?=
 =?utf-8?B?eDk1UFhFTjJJYmhYQjFJVVF6aDBEbzYxeHhvU01FWXFLWElLUGptMmc5Yncw?=
 =?utf-8?B?QWVXVC85cDdpZXpOU3FlV2QvZkZ3dm9seXpabFQrVkdhRE50SDgvK3ZsazBV?=
 =?utf-8?B?WmhxN3UweVF6OTh4aStQcDc1Q0RienZFUFl4U2I5NDNWSnJHeFhWT1Q2bndY?=
 =?utf-8?B?TkdXYStwa0hqVzZCT3lvQm9nU2NVL2dtWlVpV1hneVVSMVlwbzhZUkNZVHZ4?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C949F2A0591B7B48BBD93D7E48E733A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b95de6-8a5f-4f9b-73f2-08dac7cd53cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 12:23:11.4008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5tCkf9A1IzIpQj4OKefYM0O9TDCRafpz/2yAnHueclaJSCvASx1LerQt1bO+H2bAD+p2OTaZN5I5VhqvANcZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Yao, Yuan" <yuan.yao@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutro
 nix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTExLTE1IGF0IDIwOjE2ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBUaHUsIE5vdiAxMCwgMjAyMiwgSHVhbmcsIEthaSB3cm90ZToNCj4gPiBPbiBU
aHUsIDIwMjItMTEtMTAgYXQgMDE6MzMgKzAwMDAsIEh1YW5nLCBLYWkgd3JvdGU6DQo+ID4gPiA+
IEBAIC05MjgzLDcgKzkyODMsMTMgQEAgc3RhdGljIGludA0KPiA+ID4gPiBrdm1feDg2X2NoZWNr
X3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KHN0cnVjdCBrdm1feDg2X2luaXRfb3BzICpvcHMpDQo+
ID4gPiA+IMKgCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+ID4gPiA+IMKgCXN0cnVj
dCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVfZGF0YShjcHUpOw0KPiA+ID4gPiDCoA0KPiA+ID4gPiAt
CVdBUk5fT04oIWlycXNfZGlzYWJsZWQoKSk7DQo+ID4gPiA+ICsJLyoNCj4gPiA+ID4gKwkgKiBD
b21wYXRpYmlsaXR5IGNoZWNrcyBhcmUgZG9uZSB3aGVuIGxvYWRpbmcgS1ZNIGFuZCB3aGVuIGVu
YWJsaW5nDQo+ID4gPiA+ICsJICogaGFyZHdhcmUsIGUuZy4gZHVyaW5nIENQVSBob3RwbHVnLCB0
byBlbnN1cmUgYWxsIG9ubGluZSBDUFVzIGFyZQ0KPiA+ID4gPiArCSAqIGNvbXBhdGlibGUsIGku
ZS4gS1ZNIHNob3VsZCBuZXZlciBwZXJmb3JtIGEgY29tcGF0aWJpbGl0eSBjaGVjaw0KPiA+ID4g
PiBvbg0KPiA+ID4gPiArCSAqIGFuIG9mZmxpbmUgQ1BVLg0KPiA+ID4gPiArCSAqLw0KPiA+ID4g
PiArCVdBUk5fT04oIWlycXNfZGlzYWJsZWQoKSAmJiBjcHVfYWN0aXZlKGNwdSkpOw0KPiA+ID4g
PiDCoA0KPiA+ID4gDQo+ID4gPiBBbHNvLCB0aGUgbG9naWMgb2Y6DQo+ID4gPiANCj4gPiA+IAkh
aXJxc19kaXNhYmxlZCgpICYmIGNwdV9hY3RpdmUoY3B1KQ0KPiA+ID4gDQo+ID4gPiBpcyBxdWl0
ZSB3ZWlyZC4NCj4gPiA+IA0KPiA+ID4gVGhlIG9yaWdpbmFsICJXQVJOKCFpcnFzX2Rpc2FibGVk
KCkpIiBpcyByZWFzb25hYmxlIGJlY2F1c2UgaW4gU1RBUlRJTkcNCj4gPiA+IHNlY3Rpb24NCj4g
PiA+IHRoZSBJUlEgaXMgaW5kZWVkIGRpc2FibGVkLg0KPiA+ID4gDQo+ID4gPiBCdXQgdGhpcyBk
b2Vzbid0IG1ha2Ugc2Vuc2UgYW55bW9yZSBhZnRlciB3ZSBtb3ZlIHRvIE9OTElORSBzZWN0aW9u
LCBpbiB3aGljaA0KPiA+ID4gSVJRIGhhcyBhbHJlYWR5IGJlZW4gZW5hYmxlZCAoc2VlIHN0YXJ0
X3NlY29uZGFyeSgpKS7CoCBJSVVDIHRoZSBXQVJOX09OKCkNCj4gPiA+IGRvZXNuJ3QgZ2V0IGV4
cGxvZGVkIGlzIHB1cmVseSBiZWNhdXNlIHRoZXJlJ3MgYW4gYWRkaXRpb25hbCBjcHVfYWN0aXZl
KGNwdSkNCj4gPiA+IGNoZWNrLg0KPiA+ID4gDQo+ID4gPiBTbywgYSBtb3JlIHJlYXNvbmFibGUg
Y2hlY2sgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOg0KPiA+ID4gDQo+ID4gPiAJV0FSTl9PTihp
cnFzX2Rpc2FibGVkKCkgfHwgY3B1X2FjdGl2ZShjcHUpIHx8ICFjcHVfb25saW5lKGNwdSkpOw0K
PiA+ID4gDQo+ID4gPiBPciB3ZSBjYW4gc2ltcGx5IGRvOg0KPiA+ID4gDQo+ID4gPiAJV0FSTl9P
TighY3B1X29ubGluZShjcHUpIHx8IGNwdV9hY3RpdmUoY3B1KSk7DQo+ID4gPiANCj4gPiA+IChi
ZWNhdXNlIEkgZG9uJ3Qga25vdyB3aGV0aGVyIGl0J3MgcG9zc2libGUgSVJRIGNhbiBzb21laG93
IGdldCBkaXNhYmxlZCBpbg0KPiA+ID4gT05MSU5FIHNlY3Rpb24pLg0KPiA+ID4gDQo+ID4gPiBC
dHcgYWJvdmUgaXMgcHVyZWx5IGJhc2VkIG9uIGNvZGUgYW5hbHlzaXMsIGJ1dCBJIGhhdmVuJ3Qg
ZG9uZSBhbnkgdGVzdC4NCj4gPiANCj4gPiBIbW0uLiBJIHdhc24ndCB0aGlua2luZyB0aG9yb3Vn
aGx5LiAgSSBmb3Jnb3QgQ1BVIGNvbXBhdGliaWxpdHkgY2hlY2sgYWxzbw0KPiA+IGhhcHBlbnMg
b24gYWxsIG9ubGluZSBjcHVzIHdoZW4gbG9hZGluZyBLVk0uICBGb3IgdGhpcyBjYXNlLCBJUlEg
aXMgZGlzYWJsZWQgYW5kDQo+ID4gY3B1X2FjdGl2ZSgpIGlzIHRydWUuICBGb3IgdGhlIGhvdHBs
dWcgY2FzZSwgSVJRIGlzIGVuYWJsZWQgYnV0ICBjcHVfYWN0aXZlKCkgaXMNCj4gPiBmYWxzZS4N
Cj4gDQo+IEFjdHVhbGx5LCB5b3UncmUgcmlnaHQgKGFuZCB3cm9uZykuICBZb3UncmUgcmlnaHQg
aW4gdGhhdCB0aGUgV0FSTiBpcyBmbGF3ZWQuICBBbmQNCj4gdGhlIHJlYXNvbiBmb3IgdGhhdCBp
cyBiZWNhdXNlIHlvdSdyZSB3cm9uZyBhYm91dCB0aGUgaG90cGx1ZyBjYXNlLiAgSW4gdGhpcyB2
ZXJzaW9uDQo+IG9mIHRoaW5ncywgdGhlIGNvbXBhdGliaWxpdHkgY2hlY2tzIGFyZSByb3V0ZWQg
dGhyb3VnaCBoYXJkd2FyZSBlbmFibGluZywgaS5lLiB0aGlzDQo+IGZsb3cgaXMgdXNlZCBvbmx5
IHdoZW4gbG9hZGluZyBLVk0uICBUaGlzIGhlbHBlciBzaG91bGQgb25seSBiZSBjYWxsZWQgdmlh
IFNNUCBmdW5jdGlvbg0KPiBjYWxsLCB3aGljaCBtZWFucyB0aGF0IElSUXMgc2hvdWxkIGFsd2F5
cyBiZSBkaXNhYmxlZC4NCg0KRGlkIHlvdSBtZWFuIGJlbG93IGNvZGUgY2hhbmdlIGluIGxhdGVy
IHBhdGNoICJbUEFUQ0ggMzkvNDRdIEtWTTogRHJvcA0Ka3ZtX2NvdW50X2xvY2sgYW5kIGluc3Rl
YWQgcHJvdGVjdCBrdm1fdXNhZ2VfY291bnQgd2l0aCBrdm1fbG9jayI/DQoNCiAJLyoNCiAJICog
QWJvcnQgdGhlIENQVSBvbmxpbmUgcHJvY2VzcyBpZiBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiBj
YW5ub3QNCiAJICogYmUgZW5hYmxlZC4gT3RoZXJ3aXNlIHJ1bm5pbmcgVk1zIHdvdWxkIGVuY291
bnRlciB1bnJlY292ZXJhYmxlDQpAQCAtNTAzOSwxMyArNTAzOSwxNiBAQCBzdGF0aWMgaW50IGt2
bV9vbmxpbmVfY3B1KHVuc2lnbmVkIGludCBjcHUpDQogCWlmIChrdm1fdXNhZ2VfY291bnQpIHsN
CiAJCVdBUk5fT05fT05DRShhdG9taWNfcmVhZCgmaGFyZHdhcmVfZW5hYmxlX2ZhaWxlZCkpOw0K
IA0KKwkJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KIAkJaGFyZHdhcmVfZW5hYmxlX25vbG9jayhO
VUxMKTsNCisJCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsNCisNCg==
