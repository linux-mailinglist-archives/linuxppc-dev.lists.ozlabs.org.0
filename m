Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1C76C0B1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 01:12:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OuSlUNQJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFrVH4y7Xz30RV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 09:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OuSlUNQJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=vishal.l.verma@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 02 Aug 2023 09:11:35 AEST
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFrTM5Cy4z2yVl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 09:11:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690931496; x=1722467496;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+oxrQNVJCfgBf19ddmSEoK+NrmHPUofLo5ca++ep36E=;
  b=OuSlUNQJNd0O0Xld3SKrhAGGJADC67IS6n8twtPBKCsTLMGMcFFiEomd
   EsGMD44C7Ps55rsgfxxDnz8nGgN8EE31UtWTLiZhwvY9gPEC183k39yOP
   JTk3VY820xiNWNwVFfy50iWjjhXruJQr4q5uVu5N8y/P85aUF0qsXNpvU
   857C75Th0M0GYMqGz649wqcT8qfa1WQuv8rJtNHEAve00K8kkxul0qZAC
   xnLARyCeRta8sKp+0MOjOoeJc5J8huEs37pfOwmqk38NwoIoVdGnh0ZsR
   JjvvWNdOmvwXvDYIofJRzaGGPLfDkzSSAfb4bPTSzAxnsdBzLVa1bUhvj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435758600"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="435758600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852648888"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="852648888"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2023 16:10:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 16:10:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 16:10:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 16:10:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 16:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb35ENkW8CmM9SWPKIIuFI0cppV8SX/uwA+YSRfHpDAmPqXaaDobdcjy8t30QPTe0xv5GWLUsoA38IMNhy0Sn7u/SNi+NUJ906wy31Nd2tPc1VQa4ks5M71CkYfe8cURT+Bo3tJaa1zHomiaemSIemiA/1C9zYiY4Q5/+weNLGRAiyTgLufl6l7rg6kQwa7wWEDS1D2+4YqqqGitAoIbzAUHxRTT5OkvIjXAjg/H1+TERa88QzFgPKqbi2u+4xlgJvG4uE1uHc4xdWGOj6OZMS2JlpFZAoPfGm45lZuYLb8Czu4iAEVn3wNPEjz1hNPUFmJPft+bH4PJA+mQTuW2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oxrQNVJCfgBf19ddmSEoK+NrmHPUofLo5ca++ep36E=;
 b=PH2l0DfSSF6Row2jI/VAifR9RUqJNDCM3QJavcSM8TWsI23/CC5Xu5PB3ZQnIHde3x8JAlqPjXbj3a6Iv4qBrG9KM48rLB8DK1Jpkkod5W+6BUf7+Q7l7m8TeU8s7JbftdTj3FySsCdoZkAXOebpBejzYM39TCWnJvQwYnaiHiaDERVpEbX6Exx32sZ6l7krsRGLuga2Oh24SWtnEhQgh50H559wgnW7ad/2S4yNxqDLuE4U4IjiZ3rTBzDmBM6jD06kqBIXyzEIYz2MEsv5C7/3MnUzV8wZP/AP38H4qjqtpQBDE0hf+O8NbvNO1zE833SmHET7h0FAbjpgdfEPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Tue, 1 Aug
 2023 23:10:09 +0000
Received: from MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::cb1f:f744:409c:69b3]) by MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::cb1f:f744:409c:69b3%4]) with mapi id 15.20.6631.045; Tue, 1 Aug 2023
 23:10:09 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Thread-Topic: [PATCH v7 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Thread-Index: AQHZxDKxSSmtDGeYkUKj5UlMBaq2Oq/WEjqA
Date: Tue, 1 Aug 2023 23:10:09 +0000
Message-ID: <715042319ceb86016a4986862a82756e5629d725.camel@intel.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
	 <20230801044116.10674-7-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230801044116.10674-7-aneesh.kumar@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7125:EE_|MW5PR11MB5859:EE_
x-ms-office365-filtering-correlation-id: 59d29966-08c4-47c5-92b5-08db92e473b4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GHyIerYZMltafqbDM1SlHGgzbwVBy8tZEe+aB2GMwH7P4Hfd1mVspCnYuNghev8OoElQwScKxVqFK3BFgdTtXyPzVfu47g1vJl3SsxfAL3Rd60FpSfoB7KrSB3T2qlrVthycncaiLGHfobnSN5I386KLccSsYBqrlfrWOTLs73uRMB25PjKOwY6y/kDoz96V0fDASWspxMdhRN+/U4/Ombc3d4KYB4WawbEAESMij75wf4zpDCYsWzfzty1wxTrZKfEKBTxHae/hQh6mClpp2S29wd9bd9ut+gouQ/8Pt18FwgSgWGw+MhuBdmSooywH8TvmuEZql/qp6y4q5Eo8p1yaM8DrS+Yv/g0RmQFJKPIuZqsL1zOP/Rx5SrYA05bE97AwPc6N/IQRqcGcoDyRQyfmFtiAWOZfGqtLxnYG42O70B+5VViNmycX4kZlUJ98Das73i1ezQbtPfZaArqVEyGhbE7GY+1F6XUOY3Xs/0FxKjqpWRPJRz/7UDd6cKmYInvZAJRnBb569q9REriVrY+4xdQ8C303RInezDuWtg+ILNxJ1A23f1uhauUwwfyFBgzR7UXn2VNvBo0U1sYZyVN6nfwrys7NlPVPivFkSAKZe3PCHuxzoI/4hRb3k8oL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7125.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(2616005)(186003)(36756003)(6512007)(316002)(86362001)(478600001)(122000001)(54906003)(110136005)(38100700002)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(64756008)(6486002)(4326008)(82960400001)(6506007)(41300700001)(26005)(8676002)(5660300002)(8936002)(2906002)(38070700005)(7416002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vkxodk5zVFpMR2NEQ0tWdE5RUUp5MThBaFdzMlJGTHNPL0dQRFN4a1hmMTM2?=
 =?utf-8?B?L3BSTStDdzNxZjl2dlFtdTgwT0l3SU1FZmMxSEFyYVlja1U3U2JndjNkcUtN?=
 =?utf-8?B?VVFvVlh5ZnhDTDJRS3hSc002V0Nwb0dnYmxMM04rZmJtRTgyeHRKS3hlcEtn?=
 =?utf-8?B?TDJzNHFrdUNxYmFFM3ZMQm1PY2Vsb0hKKy83VGNQQkZyZ1JxV1Axb3FmbkpI?=
 =?utf-8?B?Q3ZKL1NMNjlrNWZoOXFmb2ZmVERyMXdCaVJzRld4Mm9FbXFtMzZkb2kvQTJV?=
 =?utf-8?B?NHZQenlaOXlEUjcvUjNUWTFnNVFhcDJWKzUvT3pRWlNzZ0NiR3NZTFYwL2Rz?=
 =?utf-8?B?UVF0Q0E3MnpWdzEyRVNUa0s0MTJhcW9DdFJybEpWUzM0ZlRHeGRoeERsUU9v?=
 =?utf-8?B?cE5aYWtpVGEzTjYzMFExQUxCS2c5TEM4T1BOZm8xNi84OFo4bGFqaVlmU0Jw?=
 =?utf-8?B?dlJ4UkNHREVMZ0ZuenZmcGQ4TzJwUGp2UThjTW5GVGh3ZWZ1Vnc5N1hLUDBE?=
 =?utf-8?B?SExJdCtZT0Z5UnpvTjRjNmc0NFlCanNmdWZQRzlPa1B1N0ZQOFRPVFJpeFhi?=
 =?utf-8?B?UFl6eHBValNpcE1qalJIdHhPY3E0Z3M1ek0weGlUU0NaOFhPamhNZC9JOU82?=
 =?utf-8?B?UDFxQnR0bWNoRlVTc0hMQTRua2taVkVCeCtuR29sbVZsM3pNblFjaXJPZzdI?=
 =?utf-8?B?ekpZTnZYY1k5Q2NQR2JIZ08rbkNwYXE5VUNJWVlzQUVYWlBSWmgxY0t4TEpk?=
 =?utf-8?B?TlNJYTZlSlNlNW5oQ2ltcDFkNklhZ0huN1RlaTc5Q0lrcXJKdWlvdFhHOFdL?=
 =?utf-8?B?MmFKdXZjZFcycytReG8wOFpXOW5aZml0Rm5oeGhxaUVVN3o0TGF4cjQzNWdH?=
 =?utf-8?B?N1Y4M1A0N00xK1Y2andGVU81Rm5sTTByVkxYbDd1cXg4Mk1GWURGRU1YdVAx?=
 =?utf-8?B?TlViSW9HYTFORjZESElsdVBBZkdKK0VZZGt5Y2hGUWs0eUN6eXBQNnIrb0tE?=
 =?utf-8?B?L1lHMXhJZDlESzZxN3lrSHdRd0t3TTZldUZTdGhqUkxOTzVZMnYyY0FERjJH?=
 =?utf-8?B?bXBudDZvM3N3OUgvTWZucTltOFFSWDBQTDZDUTQ3NUcyNlpvTkZPTzZmbkdr?=
 =?utf-8?B?UmEySDFqSTRETFFva2Era0JDNUNjejR6eUNCMmpid1ByWWtGNE1NdzhSQk5i?=
 =?utf-8?B?TXJaeDErWmNFK2ZBeHY3SkwvcmxLbngzMVhDYkNNSWNnYndIejcyQ0w5cXhn?=
 =?utf-8?B?TWNtd0VJNHFERkJvY3gvOThuenZENmtKQWxwQ1ZIQmo4cEtaS04yNW5xSU5E?=
 =?utf-8?B?THcrSjd0eUtQaWVNTzV2cy9VSUVVSkgxLzR5M2NoUno0ZWZHTFYxRDg2Ky9q?=
 =?utf-8?B?RUFYK0JEZkNOS3dLbzV4a3ZlUDJVVkttRzZOeTBmUWNZK01rek8wMHFkZ05i?=
 =?utf-8?B?Y0xyb0IxTkFqaFpwVkNNS1dRU0RkOFpNQWhWVU94akQrckZZOC9NNzhWanlk?=
 =?utf-8?B?TlcxSkRPVDlKSlkxSjk1UDhXL3h4RGxPOUJDNDcyWnpFendYMlBJbGxmTzBj?=
 =?utf-8?B?cEQ1MWxSdEhVckJBZlJuQmo5RHNNbnFLRVlQRzVEa2pDNFljZ3lzM3oxV3ZS?=
 =?utf-8?B?eTJNVW1QckF2dmF1SDJFK2RCeml2Yk8yZlhjcmpjU0Rmb2FoY0duSFRWelVP?=
 =?utf-8?B?TGFwUVJ5eENlYXRmYkNDdmNOTzZoaEVRaTdaR3JRV0Rrdjh2QnUyT09nQWRl?=
 =?utf-8?B?VHJ2VTA3SDMzazlkNkFKMml1dnBPQ3gwRnNEQjYyRU12VkNrRVR1bGFSUG1y?=
 =?utf-8?B?YnlxY2JwL3BRU2JqWndYNTN2alJNbFY1Z2ZsVlRKTWlPV0xvTnVxVFNwdnZY?=
 =?utf-8?B?U0JZVjFSaHF3dWUrWERXRGgrYmlscUFaSFRwVHd5SkJXbG5YczlCY2Q4bXg0?=
 =?utf-8?B?cU1ENGZYTHJVU0RkMVk3bnRXSU1qZ0FsOEZ0SDh1VHpFYzNZdVhKcUFBTXJH?=
 =?utf-8?B?OGtGV0ZOcElNZjMrKzFjNUlNRlU2TkczNkZSWFJKYldweEI2TDljb2hlejMw?=
 =?utf-8?B?UU9nbVhnWG0wUVBncnovSU4xV2tLMWIySHVFcW16Y3B6VnZxWWtMek1FRmNj?=
 =?utf-8?B?NWp1MlRoR0xwNyt5RkZuOENJN0lPSTdQdW8vNnpIUmRyckxHc2RQeDRZTis0?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74F62BCBC7A53B468E6D7DD915EDD9B9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7125.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d29966-08c4-47c5-92b5-08db92e473b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 23:10:09.4215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDzqN1oTCQpeAPc8bXoGkdO/bU01VqUHvSJzPVl/h6wszSRIq+38yGe7YHOGM20fz7XxNt+xcEa5luBYn8S6ZE08uq9hQIkG9QhgUXcXWeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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
Cc: "Hocko, Michal" <mhocko@suse.com>, "david@redhat.com" <david@redhat.com>, "osalvador@suse.de" <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIzLTA4LTAxIGF0IDEwOjExICswNTMwLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3Rl
Ogo+IFdpdGggbWVtbWFwIG9uIG1lbW9yeSwgc29tZSBhcmNoaXRlY3R1cmUgbmVlZHMgbW9yZSBk
ZXRhaWxzIHcuci50IGFsdG1hcAo+IHN1Y2ggYXMgYmFzZV9wZm4sIGVuZF9wZm4sIGV0YyB0byB1
bm1hcCB2bWVtbWFwIG1lbW9yeS4gSW5zdGVhZCBvZgo+IGNvbXB1dGluZyB0aGVtIGFnYWluIHdo
ZW4gd2UgcmVtb3ZlIGEgbWVtb3J5IGJsb2NrLCBlbWJlZCB2bWVtX2FsdG1hcAo+IGRldGFpbHMg
aW4gc3RydWN0IG1lbW9yeV9ibG9jayBpZiB3ZSBhcmUgdXNpbmcgbWVtbWFwIG9uIG1lbW9yeSBi
bG9jawo+IGZlYXR1cmUuCj4gCj4gQWNrZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEBy
ZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBLdW1hciBLLlYgPGFuZWVzaC5rdW1h
ckBsaW51eC5pYm0uY29tPgo+IC0tLQo+IMKgZHJpdmVycy9iYXNlL21lbW9yeS5jwqAgfCAyNyAr
KysrKysrKysrKysrLS0tLS0tLS0KPiDCoGluY2x1ZGUvbGludXgvbWVtb3J5LmggfMKgIDggKyst
LS0tCj4gwqBtbS9tZW1vcnlfaG90cGx1Zy5jwqDCoMKgIHwgNTUgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlv
bnMoKyksIDM3IGRlbGV0aW9ucygtKQo+IAo8c25pcD4KCj4gQEAgLTIxMzYsMTAgKzIxNDgsMTAg
QEAgRVhQT1JUX1NZTUJPTCh0cnlfb2ZmbGluZV9ub2RlKTsKPiDCoAo+IMKgc3RhdGljIGludCBf
X3JlZiB0cnlfcmVtb3ZlX21lbW9yeSh1NjQgc3RhcnQsIHU2NCBzaXplKQo+IMKgewo+IC3CoMKg
wqDCoMKgwqDCoHN0cnVjdCB2bWVtX2FsdG1hcCBtaHBfYWx0bWFwID0ge307Cj4gLcKgwqDCoMKg
wqDCoMKgc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAgPSBOVUxMOwo+IC3CoMKgwqDCoMKgwqDC
oHVuc2lnbmVkIGxvbmcgbnJfdm1lbW1hcF9wYWdlczsKPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0
OwoKTWlub3Igbml0IC0gdGhlcmUgaXMgYWxyZWFkeSBhbiAnaW50IHJjJyBiZWxvdyAtIGp1c3Qg
dXNlIHRoYXQsIG9yCnJlbmFtZSBpdCB0byAncmV0JyBpZiB0aGF0J3MgYmV0dGVyIGZvciBjb25z
aXN0ZW5jeS4KCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IG1lbW9yeV9ibG9jayAqbWVtOwo+IMKg
wqDCoMKgwqDCoMKgwqBpbnQgcmMgPSAwLCBuaWQgPSBOVU1BX05PX05PREU7Cj4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAgPSBOVUxMOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoEJVR19PTihjaGVja19ob3RwbHVnX21lbW9yeV9yYW5nZShzdGFydCwgc2l6ZSkpOwo+
IMKgCj4gQEAgLTIxNjEsMjUgKzIxNzMsMjAgQEAgc3RhdGljIGludCBfX3JlZiB0cnlfcmVtb3Zl
X21lbW9yeSh1NjQgc3RhcnQsIHU2NCBzaXplKQo+IMKgwqDCoMKgwqDCoMKgwqAgKiB0aGUgc2Ft
ZSBncmFudWxhcml0eSBpdCB3YXMgYWRkZWQgLSBhIHNpbmdsZSBtZW1vcnkgYmxvY2suCj4gwqDC
oMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAobWhwX21lbW1hcF9vbl9tZW1v
cnkoKSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBucl92bWVtbWFwX3BhZ2Vz
ID0gd2Fsa19tZW1vcnlfYmxvY2tzKHN0YXJ0LCBzaXplLCBOVUxMLAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZXRfbnJfdm1lbW1hcF9wYWdlc19j
Yik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChucl92bWVtbWFwX3BhZ2Vz
KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHdhbGtfbWVtb3J5X2Js
b2NrcyhzdGFydCwgc2l6ZSwgJm1lbSwgdGVzdF9oYXNfYWx0bWFwX2NiKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChzaXplICE9IG1lbW9yeV9ibG9ja19zaXplX2J5
dGVzKCkpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHJfd2FybigiUmVmdXNlIHRvIHJlbW92ZSAlI2xseCAtICUjbGx4
LCIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJ3cm9uZyBncmFudWxhcml0eVxuIiwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0LCBzdGFydCArIHNpemUpOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
LUVJTlZBTDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Cj4gLQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YWx0bWFwID0gbWVtLT5hbHRtYXA7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyoKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIExldCByZW1vdmVfcG1kX3RhYmxlLT5mcmVlX2h1Z2VwYWdlX3RhYmxlIGRv
IHRoZQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
cmlnaHQgdGhpbmcgaWYgd2UgdXNlZCB2bWVtX2FsdG1hcCB3aGVuIGhvdC1hZGRpbmcKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSByYW5nZS4K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIE1hcmsg
YWx0bWFwIE5VTEwgc28gdGhhdCB3ZSBjYW4gYWRkIGEgZGVidWcKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGNoZWNrIG9uIG1lbWJsb2NrIGZyZWUu
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaHBfYWx0bWFw
LmJhc2VfcGZuID0gUEhZU19QRk4oc3RhcnQpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgbWhwX2FsdG1hcC5mcmVlID0gbnJfdm1lbW1hcF9wYWdlczsK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1ocF9hbHRt
YXAuYWxsb2MgPSBucl92bWVtbWFwX3BhZ2VzOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYWx0bWFwID0gJm1ocF9hbHRtYXA7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtZW0tPmFsdG1hcCA9IE5VTEw7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDC
oAo=
