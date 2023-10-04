Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 933FE7B75DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 02:31:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfaXjooI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0bGV3jpVz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 11:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfaXjooI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0bDz1xh2z3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 11:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696379411; x=1727915411;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5Qa+IHBeExD4AXx/rsptNAADo7WJ1Hgdh7xwiQi+mOA=;
  b=kfaXjooIDterFZyIG/jluEyceVPMWqTBcn2ott15pHXJ5//eQKW0p5Ez
   ke95ncSZgnTyG7AWnN/NdzpBya2ErvruXB6dAcATK78w0qYFsZMK35doC
   x2pCB6jYj3yAZHOxw08bCtHfpd1YCL8a1CJVwBOfBFOvoIrqDc4y/mLax
   DIY0Cot53Y3NuG8H7GXRH78odQIk6Ky5/W6xurFnafN9e7jRn9j9UWpfU
   0zNieBs+WBnnWKY8nPuyfxYqRWJP0pmrBViNycH0zDxsENwpuFm3doi1S
   M2BvuWTf3hP02D4vIeAJ023zmwR9IbLUYzWqaoDga7xvHJuXqvm6juLEY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368068449"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="368068449"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 17:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998253743"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="998253743"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2023 17:30:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:30:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:30:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 17:30:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 17:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esnZqJzCwAZG7E4w9s/bT+dk/LEXuYaiNukhNk1cyleAZaYB49WvrAybWj/KywMwGjZ7/2/8karz30qYwdNr3IrGGV+Gbe93UhUIx6Gwe/UanHs3VFvQTTBbv2hzm0ISd2HRjE2x/wO6Iu2csW6fxiKytWL8hB1/T28yTUWQREYpI9wsAd+2wwZcoNZCRc2MynMgUXNHddByeS2AZB4saFYEoe3MP2bCkbq3bkH3X+j3FH1dieF1wp+uWdsW5yrowlKkEICtsLz1tA75jwgcn+uWEPJiC+tNOjysjSf8y80bwchC3I6G7OFJUpf8w2Q87OxLCMVip8NfU16nW2dM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Qa+IHBeExD4AXx/rsptNAADo7WJ1Hgdh7xwiQi+mOA=;
 b=GJSi+vwCyfhor+vcTO6fo/Pq+5UxB2zuLN+O9LFlga3jErAhSQVRwr/GZfMyoHpD932d51AahqucHCe6S16Po7guZ38r8UluV8Sy/z52EI2VZD9JiQtUk/ZDByxPgwd0MUb5c2ccZ7kw6UNkWGQ/Hc4GhsVk/mXKsb1wQzoFxeipCoHUhvU9fttDAtp3v4mVBym3PFTBSjIFtjGBFF8xRQurqLpQ+af94BxUDGrqjMOybwe5ZUzIWAPy3g6B8e05ksRCTtsehIlOVe5rSmVqdYfcTy1NAJeGEwTwT5zOFLhdT9W8ECP8U0MFUxwzPuxJHApaTpQb1BZNK89KG72LDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Wed, 4 Oct
 2023 00:29:58 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 00:29:58 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Topic: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Thread-Index: AQHZ6gIbIXJGUlk14kaIslF+Xg+n8bA438mA
Date: Wed, 4 Oct 2023 00:29:58 +0000
Message-ID: <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
References: <20230918072955.2507221-1-rppt@kernel.org>
	 <20230918072955.2507221-4-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-4-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA0PR11MB8335:EE_
x-ms-office365-filtering-correlation-id: 9e3eb437-1aba-4deb-013d-08dbc4710a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H2OptuR9NdvA+X+zZn7wUs6zdMy/wwu+eWc+W/qmgBVbJaP/TtGvhFa4qWRCSQPfsdiZ68RudY5qaaoRlrf2f8CsZF54LIK39bCIt3c/GmpVrh9qWnIUVUvJ7z46BTZOEMw6afzYHMHkWKE3PA0ximn+KwKgZwuZCwtG3AXlEXtd1c9u6KkOPiSLe0ubDh5zmDeN2dfXQQ74KzUFvJ25j9mPLylCNm1NTQJ20JnILZ7sDEtHt9m0HyXqEwsPnZi0zPwByW9c5jtmccTWLx4XFVWwzDtsMlRquxdkUVBpPnCaLimZwAas/Khy1tF+Z9VyU45GFH3QQ7Hx7dxtVeGtjzE5FOMvHv834/OA6sQBX7cwoyvlIsVuZhpehdz072zuzuwGFe3kkNwLkQkyVVPduZ/knUU9xX2W6vLGJHDcz1Rc0+OPwqjFIF6nma61ObvwyKVzBGTj095MDXAi4/JRJWywUChPhupUi0I1GRHKGT7WwjDMDzKjnqRfjPIEpdVKLXdkrbzGxDVzYnCyGG5Yp7rBIx+e5t/DG9Aj4SYROhpU9iKdUqyBt6kdzxEj9f0HEGwEvaMuLhO3AEw3WDibB4PX54bUon4xAFHL/Aa+LL8ttVlfvhjJGdXTv+HMjySZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(2616005)(6512007)(82960400001)(38070700005)(86362001)(71200400001)(36756003)(41300700001)(122000001)(4744005)(6506007)(38100700002)(64756008)(478600001)(6486002)(66446008)(316002)(66556008)(7416002)(7406005)(66476007)(54906003)(76116006)(8936002)(4326008)(91956017)(110136005)(5660300002)(26005)(8676002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGI3YU1Zb0wvU1ZZc1BGL2g0UmFmemx1THRnV0F2dEVDSnFJQmJveDNUWVFy?=
 =?utf-8?B?SXVSb1BNODlmeENvRmtnNUdFSWpxWElHUmhXRDBTcFArTHBsbDIzZGlMNWFL?=
 =?utf-8?B?dHM4ekxZeXBtRStrTTRkV2l2bHFkU3hnWXU1Q1IySlJMaVlLb2JBQWk0bzd5?=
 =?utf-8?B?VDR3MkM1dENDenVEL05uVVp0cmxhdjQyRDZudm1GZHA3eXRVMmJ0c2FhL3E4?=
 =?utf-8?B?WTFCODBQV3lETzJvaU9sUUJwcXNmRmVNRkx2dXowemFZSHd1UW11ZjJhd25E?=
 =?utf-8?B?bTc2Qzl4cmNUWlJrN3ZZNE9kSWs4NHV6dTN1VnJwQjEzVDhhUVEwQ0ora0FX?=
 =?utf-8?B?N1JZMnFLS1VnTWM2THVYUUtmeFhZZElJa3VzOUJHTU5yVlE5K0xxM2EybzJa?=
 =?utf-8?B?eVlDWlViRllKQTdsZ2lSMXdxNFFoNWtQY1BXRVp1VVo0UXAvYjRSa0lURzZM?=
 =?utf-8?B?NkxNaDFiS011MFdEV0FKaHdEYzdPTzVINWxWT2hNZ2wyRzg4aUFlY0wxWmE3?=
 =?utf-8?B?WGVNYU9NSVhGVUoyZHhJaDVRUGUva0QxQXMza0N2b2dBYWhnVXBCbkRDSHg0?=
 =?utf-8?B?d09KK2NTdThoZVoyZDQ2bTk3UUxLWTlnMEE5VmUvYjRqdHNoaFFKcEltR1E2?=
 =?utf-8?B?RVJUcFF2VCt6WUk2N0ZyTzRLVG1PSmhNY3pDNGJWbWduTk5PNkpyMGFMUUMz?=
 =?utf-8?B?eHhsMXUzYWhMZ1lzQmdNRmhlcWJXaEZ3cGU2bTQ5MEkzZ3BmYURIMi9BOU5I?=
 =?utf-8?B?eVkzbXUvNlNkR1NwL1JWTERsV3FwV095RTczMDZ5ZE9hYTNJQm1sQVNOUkgx?=
 =?utf-8?B?em1lNTZRRG9jZUpKdmtpdFIza3VsMmJacFBMSlVtVVhqZ21MQmpxS0ZDbnhj?=
 =?utf-8?B?ekJjakVDTjFKM1Rha2tiUWdlR1ZKZG5IekZBU1VJVm9ucmdCQ1piRlB5K3BB?=
 =?utf-8?B?OGYzdGxOVjlYcGhLVmJPaXRvaktPY2hHeWVaKy9yL3dDS2t3ejAyNFZhVkx3?=
 =?utf-8?B?dmRGWkVCUFlOSnlkV2k2cm9FKzFnaVM3TDFlSkgwYTZsc0ExeUw5aUVlVEt4?=
 =?utf-8?B?d3hyZGovYlVjL0VmMGUzRFdNY2tBZldYZDdvdU9BTkR0MFVXOWtib1RZQ2xH?=
 =?utf-8?B?ak9tcUJUWlE1RURRVVJjTHZIOXN1V3hQeHl3WWhJMjkvamhFbGdYZG9lN3Rn?=
 =?utf-8?B?U0FpY1hTZURXT0UvVUpSSnhkOGFwQU8rNnFvQy9NVDlnZm5LNzdOeExWU2Mv?=
 =?utf-8?B?VW1sd2xwWm5mRGpzZ3Z4cm9SVVkwSTZNcU5Ub1MrWWR4YjlRS25xMFpWVXU4?=
 =?utf-8?B?VzVqc0VTYjBVZXk0MTNrL0xhM2duOE0yK0dqSi95cUUzdG1JbHE5VWdWc3lP?=
 =?utf-8?B?dVBwWTRnM0lVNjUyVGRkNExRQUFxZ2piekRqblZGYk50YXZXTG9sdC9ZVVBp?=
 =?utf-8?B?dmhyRHI3WjkzMkVBamRPVkhPRy84UDlVRXViZEFmNkNPNmxYRUt2S1llRFN6?=
 =?utf-8?B?eVYydC8zOU02UkFvRFEwQWFLRWpZSE9lbEZOazNFZmFGNlUvcUdzMDhvMTcy?=
 =?utf-8?B?TUo2SlAwOXhxV1ZDRENtbFMxSkhMNnVNSFNZY2p0L2d6M25sbzFYQWwyY1dw?=
 =?utf-8?B?aWVsei9ONzB4a3UraGg5eDB0ZHpxelhRNEZBNEV0bWQ1UEJUU3lmYzN2dEJm?=
 =?utf-8?B?Mk5NckZ1UHNVekxQYk1vYTN1QjM0SHZ6QWJDNUxSZ2FrQnFVb3NjTkZhS2hj?=
 =?utf-8?B?bzRrTWgrL1BYVnhLWE93aGo2bnZ4QnBiN3ErdlNkbG9oUUREZGgxK3F1SEJ5?=
 =?utf-8?B?ZncrTzQvMFVVbGFhMVpXcDRJUGRWR090d0N1RDZ5UFNyaXhkVGtVV1VjWjBO?=
 =?utf-8?B?SGZFUW5rQ3J3T3R0U2hZYm1WRHlRVlQwRUNOWnZRTk9yNEtncHY4dDB4RE9k?=
 =?utf-8?B?T1Rta0ZETFFpSXIvZ0NWUnN5N1JWcU5iT3o3NEFqeVhHQnh3K2MvcHhUaXAv?=
 =?utf-8?B?U0svZy9UQmJibDdDbmNCTkxQVFB5NnFGYi8ydG13MVVHR3J6RDVjRGRvUTli?=
 =?utf-8?B?YXdRYXhjQWoreFAycHFyUksrbGgvKzE1MGxKU0YraW9LQ1BRd1JwaFBPQ3Rx?=
 =?utf-8?B?dkZ3eFZhZUhraHAwYnhzU0I3d0NqQkVNM25xbVZtajY1VldhUHpTUmwwdmxz?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF50F2DF95CF804EA4D73D98F82DF160@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3eb437-1aba-4deb-013d-08dbc4710a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 00:29:58.3414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6aFzYVqI31C0hgBgmsMawvr4vQT+/3a8FjkBeNa12zI1PhX4dODTTHvt7hGYVsbxDWgsBMag94vI513OqMTN8r027YsbijxPuWX6e/FirQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
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

T24gTW9uLCAyMDIzLTA5LTE4IGF0IDEwOjI5ICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+
ICsKPiArc3RhdGljIHZvaWQgZXhlY21lbV9pbml0X21pc3Npbmcoc3RydWN0IGV4ZWNtZW1fcGFy
YW1zICpwKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGV4ZWNtZW1fcmFuZ2UgKmRlZmF1
bHRfcmFuZ2UgPSAmcC0KPiA+cmFuZ2VzW0VYRUNNRU1fREVGQVVMVF07Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGZvciAoaW50IGkgPSBFWEVDTUVNX0RFRkFVTFQgKyAxOyBpIDwgRVhFQ01FTV9UWVBF
X01BWDsgaSsrKQo+IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGV4
ZWNtZW1fcmFuZ2UgKnIgPSAmcC0+cmFuZ2VzW2ldOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKCFyLT5zdGFydCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgci0+cGdwcm90ID0gZGVmYXVsdF9yYW5nZS0+cGdwcm90Owo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgci0+YWxpZ25t
ZW50ID0gZGVmYXVsdF9yYW5nZS0+YWxpZ25tZW50Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgci0+c3RhcnQgPSBkZWZhdWx0X3JhbmdlLT5zdGFydDsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHItPmVuZCA9
IGRlZmF1bHRfcmFuZ2UtPmVuZDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+
ICvCoMKgwqDCoMKgwqDCoH0KPiArfQo+ICsKCkl0IHNlZW1zIGEgYml0IHdlaXJkIHRvIGNvcHkg
YWxsIG9mIHRoaXMuIElzIGl0IHRyeWluZyB0byBiZSBmYXN0ZXIgb3IKc29tZXRoaW5nPwoKQ291
bGRuJ3QgaXQganVzdCBjaGVjayByLT5zdGFydCBpbiBleGVjbWVtX3RleHQvZGF0YV9hbGxvYygp
IHBhdGggYW5kCnN3aXRjaCB0byBFWEVDTUVNX0RFRkFVTFQgaWYgbmVlZGVkIHRoZW4/IFRoZSBl
eGVjbWVtX3JhbmdlX2lzX2RhdGEoKQpwYXJ0IHRoYXQgY29tZXMgbGF0ZXIgY291bGQgYmUgYWRk
ZWQgdG8gdGhlIGxvZ2ljIHRoZXJlIHRvby4gU28gdGhpcwpzZWVtcyBsaWtlIHVubmVjZXNzYXJ5
IGNvbXBsZXhpdHkgdG8gbWUgb3IgSSBkb24ndCBzZWUgdGhlIHJlYXNvbi4K
