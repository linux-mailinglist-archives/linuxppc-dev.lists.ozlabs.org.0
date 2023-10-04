Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A127B83D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 17:40:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqjcFHxV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0zRh1VVsz3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 02:40:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jqjcFHxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0zQk1FCfz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 02:39:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696433998; x=1727969998;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9ANFE/HRHP+mUU0GcZrZ5gom+H5eSQwVcpt46qD17D4=;
  b=jqjcFHxVdNbvwjLqcWVdXUQab6FM68wU2yz9rbpOYOUBEQI+PgOdimj8
   gIbkKFBJ6cJ+spjxpIjXcyYjilWeFzaiau5QfCDXajaBBfRlcKbQxw5rC
   uMkmp+TRcXiF0u7BXtNOX4MI7Petk+GOZaoGsWyTi/xzYbt++q20Z2cLC
   A2R4j9gXykXj6QdH4Nd64EqT4HwU/veGLWDt80FV1WinzSHf4uAMUJ5BF
   ImPrBaJ8B03KHSGxdUHHm40F4YAE+RkvbiMZbEGOIvBjxRWxnlzJUNs1b
   86d7uQZWQ0pw4NL5hNJrT3hN7nlqn9IPc6lhUkZc/jG9U7K9Gim5CAqQH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368260914"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="368260914"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841910596"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="841910596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2023 08:39:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 08:39:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 08:39:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 08:39:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTM9x1eRhRmt93PtN4WFY9YVzMsC9FjlFw+DzEaFPN5JGpjw1KmYJRhCivhs+7LOceNdpn6mSkQvo9mDveXuSG9I9MtfEM73T8nTD7ZX8xv/9HrVqJQIbxrng3TjGP2dZAa7x+78VXWt8Tu935Hddw55CP5poDUnaomHRE++0RvyJ9RlvEQTy6aruxBxGRjy5QrJYe/iv01Lylb9WbhpZPTMIQoxCVIvviedXsmSUaBbOL5guZhuU/cBMNLWv2N7QJ36USQn322fOY6Ze37WzWnCdYNOl5HMA0AuQKV2aVWOCovJ+dmrMB4fIuuppS3iSoVVoexrbJ/A44c2r7bdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ANFE/HRHP+mUU0GcZrZ5gom+H5eSQwVcpt46qD17D4=;
 b=W9eR86un39KHwM7XhlKdk8UJbsm9lX3zu7+sd0pqC+dd0wXbENwGvzpjvLxk5J3ukCmS8RLPtFhUcve43E3y5ozeqyqWHT4KafrwvDAMDssh3hYmoYaZkIH4JeOPXfKHLd94TGV4TOFYwUHkcl4AdJB3bYDktO38+BTg705Pz107H2AGTihZ89VmByba0+d6wZSJYz+JZ5Hiwg6FM3+4X35TnjVh0Ox/OhdzA0eo3KHeoe19GF6bv9mAhLcK5xipvwdc3ENFWpwIt/sTf9bK98NkGKI8vR1Jd88OCDV8neR3O1fZW0CqKfh2Ocbdaj8Cfv26yGaMTzoHO38vskmTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.36; Wed, 4 Oct
 2023 15:39:26 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 15:39:26 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Topic: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Index: AQHZ6gIbIXJGUlk14kaIslF+Xg+n8bA438mAgAD+GoA=
Date: Wed, 4 Oct 2023 15:39:26 +0000
Message-ID: <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
References: <20230918072955.2507221-1-rppt@kernel.org>
	 <20230918072955.2507221-4-rppt@kernel.org>
	 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
In-Reply-To: <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DM4PR11MB7301:EE_
x-ms-office365-filtering-correlation-id: 0d351aed-438b-44da-c4af-08dbc4f01765
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xGSe0wKSvdwwlx5rLiSnEKNM9PWy8GS+KIYXK+n6RSDGFh6POyylGRcoj0naC0PF3Mqnaik13BblAUesfCWMGWwIhMHjDNhZCrTtMnJ0aONBQ/yTSSa5dkt8zXuQZp3QIGn7QYP0+YjUfnRaN9nE7EDlU7nHv+p426CTQvz0a4BeVphOHCNM7g02BelGFJHHT64Qh8TZFx+bT8z5xDaxCsBL7+kL924mkui/jj1YZjmjDV/f2Vb9FuwZHAe7r/AccygLrQi1pLdzSdd18IoNvOVPHISu39j8ryZle1jYDLtdIUJy2Mhz8MQFu7GdVqGkk89m0pjkZHqEXl0vsgY5z/3acq/AxAONBXd7tR9llzzfe/x2rM+ancDzikW2J39rNjLcNAecnnsw2oxhJCaNhDnGMoPdosmVZkKE0LRE8kpIg17StwgArRXnUMLzj9qwsNygpvQF3vVngi+DQ28g9S9TNc5DBTr5GJTZJJbDDGSunaUE2BvSkj2vPnrcIkf0ZD5M/ernwnY8y8QDCE3iF/98Xw48USS0ZjCS4yRFN4sabp5yxZbF9N+X9avUDEV0EKZjzxwNW7qg3gVc3Q/l3idengquccylMh96e5M+65rdxsTQ/0xC605tkXhkEfDI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66446008)(64756008)(54906003)(66556008)(66476007)(66946007)(316002)(41300700001)(76116006)(2616005)(6512007)(26005)(36756003)(71200400001)(6506007)(478600001)(6486002)(38070700005)(38100700002)(122000001)(82960400001)(86362001)(83380400001)(110136005)(91956017)(7406005)(7416002)(4744005)(2906002)(8936002)(4326008)(8676002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3psenlnZUNGYklRdlJFbElKM2dkNmEreklUNWlndFNETFVjQXFxUnZBNTVP?=
 =?utf-8?B?eWtjaUNoL3hxRVBZM1RHb3Uray9odVhsSFkzeXd1aWpORFpDVktMMDBvM25a?=
 =?utf-8?B?RjMwWFhaSzdTMDN2cGlUY2hCNHlKVEZiNW5tNFNDZDJFeVArSE1vdG84b3dw?=
 =?utf-8?B?QnlpUXlITFMyWUpVRzdFdncvM3ZJMjdRbUtjSm9sQitvVVlpNnBtY3h0UVk0?=
 =?utf-8?B?ays0U1FRUVRjWUFTelR4VnRDdmNtQVNvL20vNnhheFhYK2ppSzJqVTk3VFNv?=
 =?utf-8?B?a2VyUEhDclNQb0NTcWRURDluMS9JcEQ1VGtjK3FYVDlZREZqeE8zMTd6SFBw?=
 =?utf-8?B?Z1R6aXpabFZ6Q0FiWnJZdWg3UmJXaVFYNWJUaDIwZmNQRTVlaXV2cDBRbWUz?=
 =?utf-8?B?UXJvTU5tSDBNbU1DNmFWMHhXVWhWV0hlMjBiZE91b1pIVS9OcG8xZ3VuNDdK?=
 =?utf-8?B?UGZWdzVTYTZaWjh4Z1B3SlBEaEZRT2xQeVp3NzdNc0hCN0ZGRVE1WXVBQ08r?=
 =?utf-8?B?SUFYS1lkNjNFWUZ4WERqYnN3dVJ5b3N5Tk1lQitUQTRLcGUyNVBkVDFHOVov?=
 =?utf-8?B?K1YzeUt6RHNtSTNBZTdWRHFlVUN3ZDVyUGZ0T1VUWEFHOGhRM1Vva2JRV1oz?=
 =?utf-8?B?K2xqNGozOGp5RFFiQ0dGRVlqSXJDRFdJb0RLeUpod2JSenJ4TVgwY3RRVFl2?=
 =?utf-8?B?UlpZOThkKy83bkcycHVDRTBGZzM1TEovaU5LMFlaRGp6WW95RTBlVlJhTzQr?=
 =?utf-8?B?NHV4REJuRnM3RG1Bblo2WGFFaGF3a09jaDZ5NTMrTllyWjU3bVpYK3Rjd2hL?=
 =?utf-8?B?bnE3aXVBUDgvV1psL3BWMjd1RVdxRFowbUtUWjluZUw2NGM5WDV1WFMyRlZQ?=
 =?utf-8?B?NU1xRldPTHVmNTFyTVg1WklvWTY5REVDU0c5OHU3MW1UQmhVOGdHdG9SSXI4?=
 =?utf-8?B?QWkzT2UwTHo4dkhWODlBU2xhQUtBYmY2SVI1ZkwzN0g1SlFpV3FUTmgwOUVD?=
 =?utf-8?B?dlppWGU2TEh0Q2JoL0ZOSkdHV2UyNThOeG5CcXBiVEZGMmdhY2hkOTFDdHhJ?=
 =?utf-8?B?RXhoV0pZTnBneHRYVGhyMk5FbFd0ZW9RV2tGbk5uTEloTEJvTDBadlkyQlc1?=
 =?utf-8?B?TVRwQkQ2ZmFnaVJjY3U5SnJJQVFSbkxIY3JtZ3hEYng3S010QmdYMkJaNVdr?=
 =?utf-8?B?RzN2RUZGTWRBZm5GbEYxYUJ2ckhOeEoxV041aWl1N29RN1d0NGxMUEVHREtE?=
 =?utf-8?B?K212SWZkcEhCQlR3bGw1dDVFbHRyckhJZTkvUE0ra241cVVnZHpOUnVxNWdl?=
 =?utf-8?B?bWxzbEd4MUxTVllnb1pnc1N2dGEyaFdUVk02RGpRc3FwWkFhRXl5c1FkSUwv?=
 =?utf-8?B?Vm0ydEpqMTMvWjRpbk1NUXZ3T0FGTjBwN0pLck1WVTlkcWRWTDZpbko3UXo5?=
 =?utf-8?B?T25KNDFMZUl5QldPdWZmdFh1SUlJSUNFUnhxa09xYlNNRGhPSi81cXZaTEs0?=
 =?utf-8?B?NG85U2JSSWMxc3pXTHlTK2pGVEF2SVh0NmZyd1VEa2REWXpxZkV5NGJhaVFn?=
 =?utf-8?B?YzZLdWZPdzdTdUpjanFkeXVtc3owamZnWUlBeFd2M2R0WmRXREFISklWYmRk?=
 =?utf-8?B?TlZHbGtEamlqcitTN2NJcDdoVDdRNkhKRlQrcldiQWJzVkJreTRkQVRuWGV5?=
 =?utf-8?B?YzlZUElCQnFtcjlKUU5LZDBWbHZhRmIzVk5xT2tlaHBHMlZ0UmZPTGtlc0ZK?=
 =?utf-8?B?aEtTS0txVU11OFZ3bFZkZ2RoZHJJcHp5QjFrTWVHTERlQ2U2R3psYk5LcC9w?=
 =?utf-8?B?TUtKa2NldkM2RmNET09UR01sa1hZS092dThSeGRFVXlRdytoczNUaGVOaFpv?=
 =?utf-8?B?VUJRQWszNzRrdE5Wd3hXcjN1VDlsWG9lSDNOaHdyUlFVMHg0QkJGcXpYNHQy?=
 =?utf-8?B?Mm9ZeVpBMGt5YmYrN3ZBMjJ6QVRIL2xFaGxKMVpyaVhLbTdpOU5ha2hYZlo2?=
 =?utf-8?B?SDJPcWhUYkZoZ0cyamwxREIzUUJrenNQL2d2SGRCeTBEdHFOSzdPenZ1QmI0?=
 =?utf-8?B?a3h0YVhtTEhZRklrMWoxbUtDY2wwMEI0U21XalVoSVdvQm5uU1poU3VqOWZa?=
 =?utf-8?B?b1JmUTcvTkNnQk8wZGRHWTVKVW50aWJ3elE5VlpFaGFHR1l0WFdLQ0laU1lD?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E91FC509556FAE49B5E3F179A0FCFBFF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d351aed-438b-44da-c4af-08dbc4f01765
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 15:39:26.6651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HI3tCNvwO3lPdZXkPFUQpSyLFpa+j4BHHNVDfeNY1HYd7pXCFbEnopGFYhMg8EW3KM22sl3+97sPirClc3mlgdnp3IbJ7IcgM3Yctg5+wsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "bjorn@kernel.org" <bjorn@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "lin
 ux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "puranjay12@gmail.com" <puranjay12@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIzLTEwLTAzIGF0IDE3OjI5IC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3cm90ZToN
Cj4gSXQgc2VlbXMgYSBiaXQgd2VpcmQgdG8gY29weSBhbGwgb2YgdGhpcy4gSXMgaXQgdHJ5aW5n
IHRvIGJlIGZhc3Rlcg0KPiBvcg0KPiBzb21ldGhpbmc/DQo+IA0KPiBDb3VsZG4ndCBpdCBqdXN0
IGNoZWNrIHItPnN0YXJ0IGluIGV4ZWNtZW1fdGV4dC9kYXRhX2FsbG9jKCkgcGF0aCBhbmQNCj4g
c3dpdGNoIHRvIEVYRUNNRU1fREVGQVVMVCBpZiBuZWVkZWQgdGhlbj8gVGhlIGV4ZWNtZW1fcmFu
Z2VfaXNfZGF0YSgpDQo+IHBhcnQgdGhhdCBjb21lcyBsYXRlciBjb3VsZCBiZSBhZGRlZCB0byB0
aGUgbG9naWMgdGhlcmUgdG9vLiBTbyB0aGlzDQo+IHNlZW1zIGxpa2UgdW5uZWNlc3NhcnkgY29t
cGxleGl0eSB0byBtZSBvciBJIGRvbid0IHNlZSB0aGUgcmVhc29uLg0KDQpJIGd1ZXNzIHRoaXMg
aXMgYSBiYWQgaWRlYSBiZWNhdXNlIGlmIHlvdSBoYXZlIHRoZSBmdWxsIHNpemUgYXJyYXkNCnNp
dHRpbmcgYXJvdW5kIGFueXdheSB5b3UgbWlnaHQgYXMgd2VsbCB1c2UgaXQgYW5kIHJlZHVjZSB0
aGUNCmV4ZWNfbWVtX2FsbG9jKCkgbG9naWMuIEp1c3QgbG9va2luZyBhdCBpdCBmcm9tIHRoZSB4
ODYgc2lkZSAoYW5kDQpzaW1pbGFyKSB0aG91Z2gsIHdoZXJlIHRoZXJlIGlzIGFjdHVhbGx5IG9u
bHkgb25lIGV4ZWNtZW1fcmFuZ2UgYW5kIGl0DQpidWlsZGluZyB0aGlzIHdob2xlIGFycmF5IHdp
dGggaWRlbnRpY2FsIGRhdGEgYW5kIGl0IHNlZW1zIHdlaXJkLg0KDQo=
