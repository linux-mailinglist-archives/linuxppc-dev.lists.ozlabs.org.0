Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D1640694
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 13:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNsQC5dw9z3bgK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 23:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gppXqPqK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gppXqPqK;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNsPD2Kj2z3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 23:16:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669983392; x=1701519392;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iMi9cp3HVbc9+2IblD0hRNZ81/PXaoT7ZFy2T0sea+M=;
  b=gppXqPqKbCUXJq7fOmj68KPo+MeyDPA4yz3gIdfwa9EtaJuKwucTHlwZ
   gnReNu8DAjTrD4qFryJAN3GLfRmOxPfqAe13zPeS7y+Wd29ZYK811ghbb
   kcSgjTS2YqkCveGMMxuj/hVgLhmdKr4DBdsZZb0uoRTC00FAiw2MI7Vhq
   wxyS5sxtFPAi/jwXteXWxTl3RoRrkX5nCu2wpWWm9SqYA6+4ZXNUGANP1
   XL6VCSS2Rh7/UKS+0hdtBKtqwbr8r2Bnvqhh7RWYCer7rPsk0qxB97Qgs
   mBeBw0z/ON4jhdSyU7PWD9mqfGNhb0bMesB21+AeJL9IZVWykA+hTQKNU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380230648"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="380230648"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 04:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="713600670"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="713600670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2022 04:16:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 04:16:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 04:16:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 04:16:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 04:16:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4iSgLCb2DNUupUOnUr8tamzTGn1o070pM+aNo1B5oGNpS3VWSwKoZEUSGc04SLBJNSAyoBkgvbCkdsiZSccrMSi75MqsVAM6VZwN+iNolaFhTc2pWJd9r+/GxyT8nOPGld6Amj3Y1xT0LsqXJoNeTSv2gR9dashAr4kBBWtBMi5ZpuqU191ltZz6LSU2ZXLJMcMEP55PIYV49nIMR232ui/88GKjcptfX5zPQXPwNj8QervYAsXEfexeSVdBHe4MXf1gJUBe2/zY+7FJyCJyjMBqgXFR3ZzIGZjdvln+D3shlbycAPVU+ImweVkLDAbKzat10APUC5lXrOJmSS1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMi9cp3HVbc9+2IblD0hRNZ81/PXaoT7ZFy2T0sea+M=;
 b=YPZYsKpaoSN45P3CyUVBQDTNt3kEivnsBIPJOmK5ngUvmfgpaULNCWsDrKO9YoYwas+VKUl7QpQMHx86vHi/gySAoCNEQ13BZ+j/O/npmsO7bxPWJfoOhc4GhB63OJdQitbbjFeEAQqemTeFXTScCgyadR1YrcjG05VARc/nzFM5EcZeA9tLONe2WwD8eFN4jBSvD7/iUc/AMr+V1MpuPgAp1uG6dGzkRW2cGcHSlKmPX8mycpQaZoEOqOsVWZC9Bht39OZXh2nQH4MiBcm20iZiEI5d46WBFAdKf0MFjCX/EbK4WxQPiSE9YKMhlN+WunDHZ/e3oY9RBue7b8psqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 12:16:22 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 12:16:22 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
Subject: Re: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86
 code
Thread-Topic: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86
 code
Thread-Index: AQHZBRD2PDkXQ8EFfEOzFA5Z56fIH65ahaKA
Date: Fri, 2 Dec 2022 12:16:22 +0000
Message-ID: <fdc18aa646a1636d0523b3848d938e43e7553725.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-32-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-32-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH0PR11MB5657:EE_
x-ms-office365-filtering-correlation-id: e48cdc5b-63ad-47ab-afd3-08dad45f0697
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QKM/oHcYYUILrWMGqgy4u35nYTK+Kv+7ODn63hf0hIrQT2L7paFFN/EkaeGihhIz4SoFJdC9vd+ffVpXMXxLwFR6ol31qgZxEArMjKQCKwIx1nygq16mdHwj6WfOUWxm9W2T9/gkLnIxfjyzDlGq/hd4pqAqbXdzH9Gztkr5OJ0C0snT08DLugu1KFQoLseR+V6cmk+4O8kFzTYOdWwOGxWvxqAgrVwVJ4SZYTwLx3F3Otu8yTgfMpH7DfsSFs/RGDzt5rdvSlsTjEynTCWEhndaBBelHae0JDwSWqSL/Qvjnx37bu8/otGTWM6MCX0hKF0EIWNuhAjKl++shy5Lgt5HHbMkUI903DITaG0smQ7rUeP4v+QvtbhVtWgOB7GLaMULXzzK2H7N9e8Lsd3Y/lEQKtb+3Vo1+xYl/j/HrQ4yXm9zbABcSdVbvGpPgFd0+9hRcA0mXk4XqJBAWDU3GGQeidl4/wm+VedrXk3PRAraFVrNSKfQWvpY+bArLYtdnPVoLuBpwUusv3frRYB+K/C0YBST3a+35wnt9PhyOEUBR5JwDIlSx9BFoktO4hnB6HOYJYGf6dxLAye2tLi3TCncsnrS7dvIGZ7dKoeDOkjo4TynYtx+rY1uhuEOT+qUpeF6ilo43Hbi4CK4cN7RC+QEVLhXNtyECPSzi7nzA6d5PcJNQAvZfGm5j6UBGtMoW/mHBdE2AI8+HnZ+cYaENj0w0aBtiyZ33OjYqqJXv5M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199015)(122000001)(82960400001)(38100700002)(36756003)(921005)(38070700005)(86362001)(316002)(110136005)(54906003)(66556008)(66946007)(76116006)(8676002)(64756008)(4326008)(66476007)(66446008)(91956017)(6486002)(478600001)(107886003)(26005)(6512007)(71200400001)(6506007)(2906002)(4001150100001)(83380400001)(2616005)(186003)(41300700001)(7406005)(5660300002)(7416002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0FENFNHdUhLZEM3L2RlODQvcWVoZFpqaDA4Tm1LNURVQVpidHh1NEM0OW4w?=
 =?utf-8?B?MzRqaHg3SEYxaTNSblpIcUpKYXRNNytYb0ZEUEhrM1I2TmREclB3U3FKOEgr?=
 =?utf-8?B?TFhSWkJjblU2STdsdGZuZklUaS91blJhZCtWNmZkQmdqRUkyQWZ5MHc3SUdS?=
 =?utf-8?B?WHgzeFc2OFM5UisvYjFPYkhsNkN4QWNKRmd3eno3TGU5WGpZUjdlbzI0QjEv?=
 =?utf-8?B?ejk2U09OZk1GRERkZkY2cElaOXlKV2ZUVnRoODg2YWFXWVFaU3RtWTZYQ2ZH?=
 =?utf-8?B?RVhUOU10TXAwR0VIdkpOTzYyS3hLbXY0R3JzazQyWG5BUEpNYVgxLzlUY2NC?=
 =?utf-8?B?Z2NZblFuM3BVem9FTnFLZEZ6cm9vUEo5RVo1enMvMHN5VEw5MlFOSCsrdGh4?=
 =?utf-8?B?RzhObGZWWXNYeVpsWnc3SlF0Qm93SURZZU1SbmtCeFRLdjRPT3ZLbUZobm5p?=
 =?utf-8?B?ckVzTHlJM2hEelZkR1JIQ0ZhRW9UN3lBUWFZK21tS2NZazRDMHFVSUFjamNp?=
 =?utf-8?B?SDBWeHkxU0JMQUVsVWNnbjZKc2taSGFGN1hHZGd4bkJyMDRaZFdPSHVTMVZR?=
 =?utf-8?B?TEdiOFJ6bGZlZ0NDOXZnbjRJaXMwY1hWMzg4YVBZYjhFZHo5a3VhRHUySFNI?=
 =?utf-8?B?UzdWVUhWK1ArODJyQUMxV0JLaGRHNFZTb1lqbFgrY01kaGp4U0JEcU9QbmE5?=
 =?utf-8?B?U0ZZc05QL1hiT25CY3dLa1NreTRyRVRrRElEeDZEbCtTQ0tpZjN1bGpFcjJs?=
 =?utf-8?B?YTRpd2JZWWp2M2V0YW5ncnd2MG9nc2c1alFMMVdpUnI0YlA3ZmlaS2o4Wjl6?=
 =?utf-8?B?ME5xWENiNEtZbCtJTWRvYTUzL1BGNFQvV2cyeDlrRTl0Ky9BTjgyWTNMdXQv?=
 =?utf-8?B?anFvZzlZRWdPamt5bk9XS3l2WjN0OE1KOUtUNk5ldGlPQWZvdTZDc0hCNWpm?=
 =?utf-8?B?UFdvc1JRbFIxQ3ZzRWdjOHpOSnRKUjhyY3hIc3NjTjllY0VnYTJVbXMxTTdY?=
 =?utf-8?B?cHI2bmxtd2ZjeFVjYy94VVVQOHJ0OWtMdjJicGs5cFZDVFJ6ZG41Vy9Wa2JU?=
 =?utf-8?B?dU1RcEFnNUdkZm1CTnBKQk5VLzI3RER3dHhDQmxiRnM3Z25UQWJQblVvREh6?=
 =?utf-8?B?bFRhL1VlbHNtaSt2TlhKSmQ2TXRJWkVUVXRRZzI1KytyUFRLK0t0emRFM3pL?=
 =?utf-8?B?UmdjTzRDVHJuQjI4bnM2RXZJOVBsVHJsaGl0a1VyQUNSaWtGSjZEZTZpOWdH?=
 =?utf-8?B?VjcyY1AreWxvcnZRYjQ3TDZ3Y0U0RUhlUE4yN3BDVXFqbUY5RCtmR0pqa2Z4?=
 =?utf-8?B?cURxenM2WFRIWGFuN2xJTGlvNGhTaFE3TDlKR25nQW5TMmRoM2ppaHo5ek5y?=
 =?utf-8?B?RXZJclNRa3dvbjg4dUIxMXN0bjVZbWZiRklGMWFuUFpGUi84dmFaNHplYzFE?=
 =?utf-8?B?K3lGZFowdXIzWVNURVF3M2RqMmsyd0tJL1R0M3RuZmFDVVMxTlRiS0E3enpa?=
 =?utf-8?B?VHNjUlJwZldqRXhBU0pkb3dON2VUeVlFQXVqbGF6TU03d1FGWVdSTUloS1dO?=
 =?utf-8?B?cWcyNHpjNHRMdGRCQmRIMFNTY1BQdFZlVm11QVpMTGV2amxSMG01R2dqbkVX?=
 =?utf-8?B?SzdKNDM2VzBPNlR2LzVqVVBxUWQvbjJOWDhPNytoMWcwS05rcE9RQTF5NDdM?=
 =?utf-8?B?NmVUQVB1eUk1UVhDcGFxcXZLTE5PbnZKOVA5YWZ2dmJRTkM1Zi9HVWxNZlZX?=
 =?utf-8?B?RnF4bUZRZzM2eUQzNzhWOCs5MVZXYlFZQ2V5Vk12YVAwUFlhR29kOURqMTFy?=
 =?utf-8?B?OEdzTHJUUEZTQ3N4K0lRbUJGWjcxdTNWZ1VjdXdrVTk4UXpEenM3ZCtFdUhE?=
 =?utf-8?B?MGJBZzJQVWU2VzByM0Fka056cmE5dFJtNjA5cnF2eTd1M2xqc1lVM2dBb2J2?=
 =?utf-8?B?ZkI3Ui9GaERqR3NycGJWcUh6M2ExQ2w4c2pGQ3pWcXYzYmNlY1c4YWY5Z255?=
 =?utf-8?B?U2c5dllXMEQyVGNVbUFsQkdzcUxKZlZPanFUYy8rMW9kNWhyUnMyRW9naXZp?=
 =?utf-8?B?WlBqTmRwRHVrRWpUcU1LYXZ3ZWZuYzJDLzNpNnpDS2hETHhkVEtYQ294aCs5?=
 =?utf-8?B?SDk2a0xQK0VUa2orRmhncERsRlhHVTBteWxDSS9iK1F6TUhpM0ZFcDM5T0tt?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <728564E9A355194291ED5B0EA1135406@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48cdc5b-63ad-47ab-afd3-08dad45f0697
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 12:16:22.3776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7RHcwjIm102bqYiHSz1Qs8a6ixcOxMqT3uUkhusGMkamDpdPRZAV4PY0va+P8fUGfh4v1lanozVoR4dq2FlIhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao,
 Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTMwIGF0IDIzOjA5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBNb3ZlIHRoZSBDUFUgY29tcGF0aWJpbGl0eSBjaGVja3MgdG8gcHVyZSB4ODYgY29k
ZSwgaS5lLiBkcm9wIHg4NidzIHVzZQ0KPiBvZiB0aGUgY29tbW9uIGt2bV94ODZfY2hlY2tfY3B1
X2NvbXBhdCgpIGFyY2ggaG9vay4gIHg4NiBpcyB0aGUgb25seQ0KCQleDQoJCWt2bV9hcmNoX2No
ZWNrX3Byb2Nlc3Nvcl9jb21wYXQoKQ0KDQo+IGFyY2hpdGVjdHVyZSB0aGF0ICJuZWVkcyIgdG8g
ZG8gcGVyLUNQVSBjb21wYXRpYmlsaXR5IGNoZWNrcywgbW92aW5nDQo+IHRoZSBsb2dpYyB0byB4
ODYgd2lsbCBhbGxvdyBkcm9wcGluZyB0aGUgY29tbW9uIGNvZGUsIGFuZCB3aWxsIGFsc28NCj4g
Z2l2ZSB4ODYgbW9yZSBjb250cm9sIG92ZXIgd2hlbi9ob3cgdGhlIGNvbXBhdGliaWxpdHkgY2hl
Y2tzIGFyZQ0KPiBwZXJmb3JtZWQsIGUuZy4gVERYIHdpbGwgbmVlZCB0byBlbmFibGUgaGFyZHdh
cmUgKGRvIFZNWE9OKSBpbiBvcmRlciB0bw0KPiBwZXJmb3JtIGNvbXBhdGliaWxpdHkgY2hlY2tz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2ds
ZS5jb20+DQoNClJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQoN
Cj4gLS0tDQo+ICBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIHwgIDIgKy0NCj4gIGFyY2gveDg2L2t2
bS92bXgvdm14LmMgfCAgMiArLQ0KPiAgYXJjaC94ODYva3ZtL3g4Ni5jICAgICB8IDQ5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0MCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYw0KPiBpbmRleCAx
OWU4MWE5OWM1OGYuLmQ3ZWExYzExNzVjMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3ZtL3N2
bS9zdm0uYw0KPiArKysgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jDQo+IEBAIC01MTAzLDcgKzUx
MDMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBzdm1faW5pdCh2b2lkKQ0KPiAgCSAqIENvbW1vbiBL
Vk0gaW5pdGlhbGl6YXRpb24gX211c3RfIGNvbWUgbGFzdCwgYWZ0ZXIgdGhpcywgL2Rldi9rdm0g
aXMNCj4gIAkgKiBleHBvc2VkIHRvIHVzZXJzcGFjZSENCj4gIAkgKi8NCj4gLQlyID0ga3ZtX2lu
aXQoJnN2bV9pbml0X29wcywgc2l6ZW9mKHN0cnVjdCB2Y3B1X3N2bSksDQo+ICsJciA9IGt2bV9p
bml0KE5VTEwsIHNpemVvZihzdHJ1Y3QgdmNwdV9zdm0pLA0KPiAgCQkgICAgIF9fYWxpZ25vZl9f
KHN0cnVjdCB2Y3B1X3N2bSksIFRISVNfTU9EVUxFKTsNCj4gIAlpZiAocikNCj4gIAkJZ290byBl
cnJfa3ZtX2luaXQ7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJj
aC94ODYva3ZtL3ZteC92bXguYw0KPiBpbmRleCA2NTRkODFmNzgxZGEuLjhkZWIxYmQ2MGMxMCAx
MDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYw0KPiArKysgYi9hcmNoL3g4Ni9r
dm0vdm14L3ZteC5jDQo+IEBAIC04NTkyLDcgKzg1OTIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCB2
bXhfaW5pdCh2b2lkKQ0KPiAgCSAqIENvbW1vbiBLVk0gaW5pdGlhbGl6YXRpb24gX211c3RfIGNv
bWUgbGFzdCwgYWZ0ZXIgdGhpcywgL2Rldi9rdm0gaXMNCj4gIAkgKiBleHBvc2VkIHRvIHVzZXJz
cGFjZSENCj4gIAkgKi8NCj4gLQlyID0ga3ZtX2luaXQoJnZteF9pbml0X29wcywgc2l6ZW9mKHN0
cnVjdCB2Y3B1X3ZteCksDQo+ICsJciA9IGt2bV9pbml0KE5VTEwsIHNpemVvZihzdHJ1Y3QgdmNw
dV92bXgpLA0KPiAgCQkgICAgIF9fYWxpZ25vZl9fKHN0cnVjdCB2Y3B1X3ZteCksIFRISVNfTU9E
VUxFKTsNCj4gIAlpZiAocikNCj4gIAkJZ290byBlcnJfa3ZtX2luaXQ7DQo+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMNCj4gaW5kZXggNjZmMTY0
NThhYTk3Li4zNTcxYmM5NjhjZjggMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2t2bS94ODYuYw0K
PiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMNCj4gQEAgLTkyNzcsMTAgKzkyNzcsMzYgQEAgc3Rh
dGljIGlubGluZSB2b2lkIGt2bV9vcHNfdXBkYXRlKHN0cnVjdCBrdm1feDg2X2luaXRfb3BzICpv
cHMpDQo+ICAJa3ZtX3BtdV9vcHNfdXBkYXRlKG9wcy0+cG11X29wcyk7DQo+ICB9DQo+ICANCj4g
K3N0cnVjdCBrdm1fY3B1X2NvbXBhdF9jaGVjayB7DQo+ICsJc3RydWN0IGt2bV94ODZfaW5pdF9v
cHMgKm9wczsNCj4gKwlpbnQgKnJldDsNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQga3ZtX3g4
Nl9jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0eShzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAq
b3BzKQ0KPiArew0KPiArCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZjcHVfZGF0YShzbXBfcHJv
Y2Vzc29yX2lkKCkpOw0KPiArDQo+ICsJV0FSTl9PTighaXJxc19kaXNhYmxlZCgpKTsNCj4gKw0K
PiArCWlmIChfX2NyNF9yZXNlcnZlZF9iaXRzKGNwdV9oYXMsIGMpICE9DQo+ICsJICAgIF9fY3I0
X3Jlc2VydmVkX2JpdHMoY3B1X2hhcywgJmJvb3RfY3B1X2RhdGEpKQ0KPiArCQlyZXR1cm4gLUVJ
TzsNCj4gKw0KPiArCXJldHVybiBvcHMtPmNoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KCk7
DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGt2bV94ODZfY2hlY2tfY3B1X2NvbXBhdCh2b2lk
ICpkYXRhKQ0KPiArew0KPiArCXN0cnVjdCBrdm1fY3B1X2NvbXBhdF9jaGVjayAqYyA9IGRhdGE7
DQo+ICsNCj4gKwkqYy0+cmV0ID0ga3ZtX3g4Nl9jaGVja19wcm9jZXNzb3JfY29tcGF0aWJpbGl0
eShjLT5vcHMpOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IF9fa3ZtX3g4Nl92ZW5kb3JfaW5p
dChzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzKQ0KPiAgew0KPiArCXN0cnVjdCBrdm1fY3B1
X2NvbXBhdF9jaGVjayBjOw0KPiAgCXU2NCBob3N0X3BhdDsNCj4gLQlpbnQgcjsNCj4gKwlpbnQg
ciwgY3B1Ow0KPiAgDQo+ICAJaWYgKGt2bV94ODZfb3BzLmhhcmR3YXJlX2VuYWJsZSkgew0KPiAg
CQlwcl9lcnIoImt2bTogYWxyZWFkeSBsb2FkZWQgdmVuZG9yIG1vZHVsZSAnJXMnXG4iLCBrdm1f
eDg2X29wcy5uYW1lKTsNCj4gQEAgLTkzNjAsNiArOTM4NiwxNCBAQCBzdGF0aWMgaW50IF9fa3Zt
X3g4Nl92ZW5kb3JfaW5pdChzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzKQ0KPiAgCWlmIChy
ICE9IDApDQo+ICAJCWdvdG8gb3V0X21tdV9leGl0Ow0KPiAgDQo+ICsJYy5yZXQgPSAmcjsNCj4g
KwljLm9wcyA9IG9wczsNCj4gKwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgew0KPiArCQlzbXBf
Y2FsbF9mdW5jdGlvbl9zaW5nbGUoY3B1LCBrdm1feDg2X2NoZWNrX2NwdV9jb21wYXQsICZjLCAx
KTsNCj4gKwkJaWYgKHIgPCAwKQ0KPiArCQkJZ290byBvdXRfaGFyZHdhcmVfdW5zZXR1cDsNCj4g
Kwl9DQo+ICsNCj4gIAkvKg0KPiAgCSAqIFBvaW50IG9mIG5vIHJldHVybiEgIERPIE5PVCBhZGQg
ZXJyb3IgcGF0aHMgYmVsb3cgdGhpcyBwb2ludCB1bmxlc3MNCj4gIAkgKiBhYnNvbHV0ZWx5IG5l
Y2Vzc2FyeSwgYXMgbW9zdCBvcGVyYXRpb25zIGZyb20gdGhpcyBwb2ludCBmb3J3YXJkDQo+IEBA
IC05NDAyLDYgKzk0MzYsOCBAQCBzdGF0aWMgaW50IF9fa3ZtX3g4Nl92ZW5kb3JfaW5pdChzdHJ1
Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzKQ0KPiAgCWt2bV9pbml0X21zcl9saXN0KCk7DQo+ICAJ
cmV0dXJuIDA7DQo+ICANCj4gK291dF9oYXJkd2FyZV91bnNldHVwOg0KPiArCW9wcy0+cnVudGlt
ZV9vcHMtPmhhcmR3YXJlX3Vuc2V0dXAoKTsNCj4gIG91dF9tbXVfZXhpdDoNCj4gIAlrdm1fbW11
X3ZlbmRvcl9tb2R1bGVfZXhpdCgpOw0KPiAgb3V0X2ZyZWVfcGVyY3B1Og0KPiBAQCAtMTIwMzcs
MTYgKzEyMDczLDcgQEAgdm9pZCBrdm1fYXJjaF9oYXJkd2FyZV9kaXNhYmxlKHZvaWQpDQo+ICAN
Cj4gIGludCBrdm1fYXJjaF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZvaWQgKm9wYXF1ZSkNCj4g
IHsNCj4gLQlzdHJ1Y3QgY3B1aW5mb194ODYgKmMgPSAmY3B1X2RhdGEoc21wX3Byb2Nlc3Nvcl9p
ZCgpKTsNCj4gLQlzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzID0gb3BhcXVlOw0KPiAtDQo+
IC0JV0FSTl9PTighaXJxc19kaXNhYmxlZCgpKTsNCj4gLQ0KPiAtCWlmIChfX2NyNF9yZXNlcnZl
ZF9iaXRzKGNwdV9oYXMsIGMpICE9DQo+IC0JICAgIF9fY3I0X3Jlc2VydmVkX2JpdHMoY3B1X2hh
cywgJmJvb3RfY3B1X2RhdGEpKQ0KPiAtCQlyZXR1cm4gLUVJTzsNCj4gLQ0KPiAtCXJldHVybiBv
cHMtPmNoZWNrX3Byb2Nlc3Nvcl9jb21wYXRpYmlsaXR5KCk7DQo+ICsJcmV0dXJuIDA7DQo+ICB9
DQo+ICANCj4gIGJvb2wga3ZtX3ZjcHVfaXNfcmVzZXRfYnNwKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkNCj4gLS0gDQo+IDIuMzguMS41ODQuZzBmM2M1NWQ0YzItZ29vZw0KPiANCg0K
