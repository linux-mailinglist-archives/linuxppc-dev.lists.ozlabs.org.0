Return-Path: <linuxppc-dev+bounces-13240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7655C03AA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 00:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct0rP5B7zz3bf4;
	Fri, 24 Oct 2025 09:21:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.11 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761258117;
	cv=pass; b=ZKAHmPiXoLbuH8rNCUxde0Buwz4rRPEiVnVtoLsVkowMQ642/ATayfbcw4Iwu1oKIbpWMSp/oyon0UFPBLd9FNHjdSG7w/Wd1R7VGfCyEWfRpEI1h/Ad7SWd4qFOsJkr02W99SqSrP8P3xy6aHzfBxqxFjsd/1Ry4BxDh9RnlYzhjj/HPVTn9GUmWvb03+VMhDqtTkDDzLW/pyA9Z3rwlpnSk2y+k5U5iv9c0xvgJ/06F2MXhyo5tb2Vloo9q+PFYOfKErsJpzjzo6KzVpd9eLr1iBwq5pLWZl9G3nQAO4PP8TYPYYSmuY+5vGXo7umO/B0a+ygOxjQr63cAgCAe8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761258117; c=relaxed/relaxed;
	bh=WIdEWNXS8v2m2QouRgmwZlY0R59t3YhEUuEmyXxF28g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mIe0Hta3NClQsNsAEumAY3YeF88UUiQcobIQJx/NRCPELm6N7M8CkjLcy7p4uEuGUO7q9LTNnU+f2M9IDvlhL5/LHkcP4riGaA7FHlN8E1+ePjWi0Il1zf8AWnQtvorRSGmjtuhW2SuxV448RboQrA8QGIEHs+qizeGdH3m0hKCHCHsqdWjRXHMkY6t2IcYdc1mkyRsws486rFA0a+3w/XcimGM5hRUmk+wu5JhAJaWPbUU5D0tBHkyc+EqwMhua23/k+hnnbUzoGobxyak6zPtzuKPAHbodxfIXnySnILqjX6Oc4TJdlsUnRPNf7t88eRj0kSwVNwxVPjd5bzX5UQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YnuH4hQM; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YnuH4hQM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct0rN4HN9z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 09:21:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761258117; x=1792794117;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WIdEWNXS8v2m2QouRgmwZlY0R59t3YhEUuEmyXxF28g=;
  b=YnuH4hQMe0fMQ1NHzY+BF5yRpmL6Gz40jIYhjU9VD/SAFPzGQ38Yi7XJ
   /1kaFAkbv8YM+BDtvF+DS4PqzQKdwgBQqBHyz2bq447zLeCN7TZYXIYmo
   CB2ZRzRsMdcQQXjPzyhFSt2Z//TtJMj4eTEQ5LG8rhkSe5yY6Eqmqn1is
   n9BxpgAoKUykP2JQsQOQFmaqND/VSuHzxdz5Anrtrb3wbmQUemV6rOjHc
   xo/KTYICQEfY96J/JmkLHA90Sul94E7kraqxMUUyjidM0y2q9V4goYKSw
   mPKE2Dg0b6AfQlPRPRrErnK7yXvR9t88meE8aj7j1649+YIsClNdEA2f8
   Q==;
X-CSE-ConnectionGUID: 5HbqMeG9TdybkdGzNTTQog==
X-CSE-MsgGUID: CMbcXJcIQwChV8XuCs9kfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74044428"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="74044428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:21:54 -0700
X-CSE-ConnectionGUID: W52qiHJNTr+N10LUhWSHww==
X-CSE-MsgGUID: Fo/2O6DbT5Wqx1/gBvm2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="188334278"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:21:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:21:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 15:21:52 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 15:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrBUlVp+WKjlnfjLx8os24BUC5gb9LFIeyDFqi501hyD2PoY0NJC7Q+NgAgX+ZydNhKKDK7eX1N1sS5dkv/+a+s4cewr8oeEpWryU3ZJvHwX70o6VkrkXzaBfz8CopsjTlHdPaHEaA8Y7IvJ3VVot0xW6K4QaQFvdJQzhafm7afJj9/2NiM+248NmQRNXakt/dvz2D5Xiwwc7M2OEIw7buWGa7SNZwLQikiw/QtL8wmw94DMmKePR/9tHALTzC8yZWLDgBfpwUqBajE0Ovh8ovYuXdMwolt2fb6oxK4faONte+zqCE2Syf+JjeXM71BtfA++P8pDrHFS95Y1baC++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIdEWNXS8v2m2QouRgmwZlY0R59t3YhEUuEmyXxF28g=;
 b=cpnOv9QNaVEvGQJ/7KGo4fEL4yhpv+uQ4OYeAU03n5vsAcwWMDtJycm2FadUFFrqW1aYqp9oPt/wpULU8hLpkagozKT54IK6ToeI9T/a3G2aR2MTQYaGMKz1sqll2ZhZ1RyP9/ukTAAYNI64zuFFHWILcRc7ijOWlMdjETtwi9v+lQzDaAeu5IKYPUjJL/H//OH/DGr+w4q5M8hU/+EIKlQZU35e10CD76ddE9P/6JvRIT95NX7IuJMQGHXeSO7wW4TFYuGSmtkfqiIN5oHydPRJIFfkB0eIncOLcMTOzgs3dmNUiSUSDRqxldRI8nX/4TpC1CNQ2MoqPcs8Gl7Rmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 22:21:44 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 22:21:44 +0000
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
Subject: Re: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in
 tdx_sept_zap_private_spte()
Thread-Topic: [PATCH v3 11/25] KVM: TDX: Avoid a double-KVM_BUG_ON() in
 tdx_sept_zap_private_spte()
Thread-Index: AQHcPv2kW3nEIamKR0CJVbn4fX3MRLTQWNSA
Date: Thu, 23 Oct 2025 22:21:44 +0000
Message-ID: <e92db81d74acf960741b4d2eeaa47639e5d76218.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-12-seanjc@google.com>
In-Reply-To: <20251017003244.186495-12-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH3PR11MB8750:EE_
x-ms-office365-filtering-correlation-id: 7f209c99-ab24-47e6-a9f3-08de12828c7e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UytDTDdKNEJ5eldhT3R5RWkxb3FMQ2g5cnd3cytNc3pmRDRxVXhVakN1dVNj?=
 =?utf-8?B?a1gzZEJsQitzSGFSQW9mR1FTWTFQWmVXUEt4Q24xTnRPa1dMV2c2ajZ0Z1I4?=
 =?utf-8?B?a3laamZRdGIxOG9FdFI3WFBkdHVrdlQ2U0JyWksrU2F1dkNCZlVMNlF3T2Nr?=
 =?utf-8?B?dFlMTzNVSDAyV0NRM1FjbG5Ub09QVmJhNVJidlI3WkFnUk9YR3NqZUpLUjls?=
 =?utf-8?B?SDFqSWR4eDJYS0c5RjcyS2dHMGYyenhsNFF2S2xoZzhRR3dFS2dRRHRuWU9Z?=
 =?utf-8?B?OGRhRG9PMWJaekZyRmZhMkp2WFQvcHI1NlNYcVBmczJ0UTlETW0wVG94ZnBY?=
 =?utf-8?B?VFZOMFJFWnJ3QjRRSWk2UndUMnd0OEFORkNIeStNRStBNFE5S0t5aFRHcUo0?=
 =?utf-8?B?M0E4ZmdPekVJN21uQk41UFJ0UTY2TGkrZkhpOS9yeEhJSm1oQmFGSFMxMytW?=
 =?utf-8?B?NjdadW42VlY5SkRBeVVZVnRyRGcwYm9nUmlNckRTeEt6QjZkNlpGNkJyQU43?=
 =?utf-8?B?NE9LaHpoUzdNbUJqRnJ0V2l2dHM3U3BReEo0YTFENlFTRTBubkY4Q2xMeEd0?=
 =?utf-8?B?MU9NTkQyYWdQcG5NUlo3MHJiS1VXdXY2UGRIcE5zV0dlNVd2OTB4cTJDYmEz?=
 =?utf-8?B?UHhXRWdBdmFDS3orSEJBV3F6MnBWa0NCTUJraU1OekVGb1pTN2V0ZnE3UThS?=
 =?utf-8?B?bjZNSXZyYXpTZG1wanIwb083bE01dG93Z3lWazhZaGZnMU1CS1YxUWFmdUUw?=
 =?utf-8?B?a0FBWUZ1b2RXQVZsL1ZwRWtJMTFuZENTd3Q2ZnlBR3hBZmpjNHllTjJPbHRi?=
 =?utf-8?B?b1BBdnhUWTBiTGxCY0FLajBwYnV5U1pDZGRha2E2eS83RjNsRnFQWk9RcHI2?=
 =?utf-8?B?TFVXdE5oWDhzYnM4eGM2cVk2RnJCa1RhNS9Qa0crUmdFSEJ1d09RM3FsUy9B?=
 =?utf-8?B?Uy92Nk9DdkdwQWNybHJscEJZdUdUVExBUW5udm8xTEtuNDYwMVhoWTNvR3A5?=
 =?utf-8?B?czZBajkxblU3Mm82aFFReFBhYXc2aE1tNVMwTWRCTExkems0SkJVVXJ5KzVi?=
 =?utf-8?B?UnJrSk9nMk9mUC9za05ldFZtRmFFZ0V5T2xtL1U5TkNlU1BtZm5hRzNvY2tn?=
 =?utf-8?B?eFcwZTlLaEpmVUZ2UUhqOXZ3WWpwMVMvNTBYVVlMNjhRZFNiNE5MZ1F2akZB?=
 =?utf-8?B?aWlOTGNTSjhKc1RSellQZndGZ2JaOWdCZ2pjS2drYzJ4UmN3WXBqNUx6ZG1C?=
 =?utf-8?B?NWlQSncvYXR5VXIzT090cWtxejRJenRnUVYwczA4ckoxdlo1emhGSUpjem9L?=
 =?utf-8?B?bW5KK2k1TXJHWk81bG5sVXBKODJ3QUhxUHF2M2FsOTY4V01BZGVOL0J1SDJr?=
 =?utf-8?B?b3lhbTI2QXYrQXcvc05oS2RuTWxRclJEcDFxdWg1aWh4T0RadFlqYWphU3o1?=
 =?utf-8?B?Q2pMRmRPOGZsQ2ZaQlBubnppWnNMdEY4T0UvL2UwV3UwU3UrRWw1NVBXL0VY?=
 =?utf-8?B?ckhaZmdKN0hmV2FKbVI3NGNXQnNIMitvVk9QbjBMMmZQY3V1bnh4b2FBaDdQ?=
 =?utf-8?B?RjdwampMTHpldFZKOTVlTVYwQzd2QkZROTRCSVZ6Y0lzSFlNNlpRZlpzUFJy?=
 =?utf-8?B?VkEydVVCNUxWbHlMUlhCM003WVBSZDMwYlFxa3hHUjJQZjR6b1JUT0FkRGE4?=
 =?utf-8?B?UDR0L096RU9yR0ZSU3YrY1dXakNLbUJtUnJuUWM4dTFWZnV0ZTloNjMzSXR4?=
 =?utf-8?B?Z24vQjRqMmo3TkxjSnYxci9CQ0h6cGhwQll3S1ROTmhiL0VscjlWUVBDay9H?=
 =?utf-8?B?b3pDd0tXTU83bTkrTXd4R2lheU8zand1S0JCWkVYYUZVb1QxZGt0VjRlUy9Z?=
 =?utf-8?B?QXduRzRWRUQ5UWRCSTZOSGdpZ0JtM01xV216ZXpPRjFQRUpheWhQa0JtaWdh?=
 =?utf-8?B?djU2SXozQ2VxRXVIMWN4bUkyYlY0dlJ4bWRlWkN0TStHYm84Tmx2U0pIb0M1?=
 =?utf-8?B?dE9wTWFUY2hoNXcyMCsyQ3RXZHp2MFFrNmE3TzVJRlBZTVZkTTZyRjQ4NXpu?=
 =?utf-8?B?eVBvejI3SW1abzJjY1FJZFlDbmxlV1V3dHp5UT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFdjNlJxTDZpalczazRpK1VFSWxEVTFNT2ZFK1JjbnNHL2MrYVFhb0k1WEFS?=
 =?utf-8?B?RCs2S0Jvd0hnT0RnYjhWck1HTko0RUk4WXFNTjFaOUhoSllZUVdVeXdQNzE0?=
 =?utf-8?B?YkgvQXhmV1YyQ01wOUszYWE3V3JJYjFFRWxPTXpNWG9UZVZhd21BTXhneDBW?=
 =?utf-8?B?Nm45RU1rOXI1WVlodWZyR3VIMTFOM0lrWUdoNkpjdFdpeTZtQVlTeEhQc0pU?=
 =?utf-8?B?TENnb3UzVTR0blpUQm1kVm1tWHdudWtyaTIrYlNOeWx0Y0dORDdYa1hXaVlr?=
 =?utf-8?B?VG5IL2hzRDJzYWRDU2VSSGtqU0pWR0tGdENHbU5ZNEpJS0Nham5VWDNMQmlH?=
 =?utf-8?B?TkdXMlU3REFjWXFLc2FnVlhUYjlZdU0rVk5qa3ptOEpscy9HUndvNlp1SU8y?=
 =?utf-8?B?bDNFMHlhbk5OamZ6eGlyWVFVa0x3OXV3cmdZRjZ0N25hNWVuMy9ObHVzUEFC?=
 =?utf-8?B?eENTY1JKN2JuREFsSjFRbEovd3RsaTFZcVBvQXB2TlJlbHd0VnpVVy9hMEdm?=
 =?utf-8?B?eEtIRjZZM0xhb3FJTFJ0ZnVEWmdieEovQ1dFdy92K2VHeStMbXdQeGRzakhO?=
 =?utf-8?B?QUVibzJFL0dycW96end3NzErUHR5c25BQzErSlRpb2R2REZSaHBOOXFCWDdC?=
 =?utf-8?B?OS9Ja2dGWHFQQWxWbTJYZnRuM2pqS3E2dmIyWG1rSG54dGt3ZXkyRFI2aHVx?=
 =?utf-8?B?Qzh3ZVFneVU1bEhKSmtKaFdxRlJ0Q2F2WTlhRmlMdVNqc09rNjREUkNpdTIv?=
 =?utf-8?B?eUdqVkNqZU1pVFljalhCYlovT2toaFFQemVueGo2YjJXZmN5c2xkRU9PQVJG?=
 =?utf-8?B?NjdFaVFOdjBtbEwxQ3llRU1LWXp4blRuUlMzVHZuSEgxYnZuOCtyK2llK0Ra?=
 =?utf-8?B?Ni9ueHlJSHNVV1ZzZXUwUGUrcVVwOCtTV3Z2Y1hWa1BrQlBuWnZ1U0tOVXp6?=
 =?utf-8?B?djJIWkdSOXVYcGt0cnlUeWNwdWQ0OWdaTTN2dEJSL0pZMkp0c1VHVEFJbzg2?=
 =?utf-8?B?OWkrMkNhcGRGK3hLQjkyRVkwM2x1cTZOcWxXdllGZC95K21oNmRSZi8vZkR3?=
 =?utf-8?B?QXRETnZYejA2azZOSCs0TnBhczVwKzdqdkxpR21QNmRZckZEcmRCR0c0d3pu?=
 =?utf-8?B?MTRIQVZmY3A4dGR3NTI2dlliaUQvaEgvM1VtTUgvZC9rUjNkb3lIQUxGcm0x?=
 =?utf-8?B?SURyNmhHMHdHbXQvOGNjczZuTmdkTFN3ZENvYW1MSU5ZVkxCRjV6cjRsTnhP?=
 =?utf-8?B?MVBFd1ZsaFgxbjJRRXRGZDI0NC84SFR5SlhJN21UdDRRYUxFQkNqaEtkazF2?=
 =?utf-8?B?eTBaQzBOTkRVbTRjVkRnNndONUt3c2Q2RHFWL3RRdkgrMHEyU0R6RHhWTmlU?=
 =?utf-8?B?S0JJMEl1YXBDOFNqRFQrN0tyZWNpNjR2aGhQWEhlOUwxNGpRUHZNbzZPTVhs?=
 =?utf-8?B?ZVJZTjcrNlpnNE9oQkpwbFdYeUNEYTJJaHdwYWFRUWhLMTNrNFJXQUsxOG03?=
 =?utf-8?B?TmFHZkJnWDJ1Z25qLytYdko3Qmw2cUt5V0VjREJuWUsya2pWN0J3VHFCVnhr?=
 =?utf-8?B?UGd0WExORUpqYzRzajJkWDhBR0RvNkVLS05ZekxUcUhtV0NDVjJuQkhTNWtK?=
 =?utf-8?B?dGRmTkw1YXZIdmpVSG01YWJ0VG1VWjgzVkVhckpZSG11dmhJN2pkS2F3WkEw?=
 =?utf-8?B?UkIxYXJ6ZExSV211ZmRlTE9SbHE4R3J0SWIvY3hyQ0w5eVprT2RkVEM0WEk1?=
 =?utf-8?B?Q1hQM2krYUFiV3Raa21PRzI1MmxBdUZyYUNyaStaUnJ1dWpOV0Y3NHIvbkNi?=
 =?utf-8?B?ekFJYXVNUjNoVk9xNHFGbnNFVXF0QndHT2FqYklhV1ZnN3ZLZFZ5UVp3RzZ1?=
 =?utf-8?B?VVRtdXhOQVF5SW04U3llbjlVTVV4NUxBLzF2a2phQmhTUUJmZkdrMVlHYjV3?=
 =?utf-8?B?N09Gd24wclF1dzlRa0NON081elVXeENVcWVSLzArVHhnbzc3KzNEUmxyaTVW?=
 =?utf-8?B?bDAxUVVrcXZBQ3B4YzZ4VUF5K0oycWJXQVV6VGlHbkNqRDFydjdCc1lCM09j?=
 =?utf-8?B?QjBWaFQvaFBFRkhxazUwYTdrTjdRckRYUUFmaUFXU0REb0d2T3J0Y3I0YVlV?=
 =?utf-8?Q?Ha++Csql+tvc2GthOXH8QdqNd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E8CACE1E28AEA429C8B038046340DF9@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f209c99-ab24-47e6-a9f3-08de12828c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 22:21:44.4855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XT6nu+7tBxEK9FZ6kgT3mc7pzOOJ+g2YmY5hu7YdY/cg6ywt5PzRPlNm1VuG6BztIijqLsYKsT4EvPZlCiCN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBSZXR1cm4gLUVJTyBpbW1lZGlhdGVseSBmcm9tIHRkeF9zZXB0X3phcF9wcml2YXRl
X3NwdGUoKSBpZiB0aGUgbnVtYmVyIG9mDQo+IHRvLWJlLWFkZGVkIHBhZ2VzIHVuZGVyZmxvd3Ms
IHNvIHRoYXQgdGhlIGZvbGxvd2luZyAiS1ZNX0JVR19PTihlcnIsIGt2bSkiDQo+IGlzbid0IGFs
c28gdHJpZ2dlcmVkLiAgSXNvbGF0aW5nIHRoZSBjaGVjayBmcm9tIHRoZSAiaXMgcHJlbWFwIGVy
cm9yIg0KPiBpZi1zdGF0ZW1lbnQgd2lsbCBhbHNvIGFsbG93IGFkZGluZyBhIGxvY2tkZXAgYXNz
ZXJ0aW9uIHRoYXQgcHJlbWFwIGVycm9ycw0KPiBhcmUgZW5jb3VudGVyZWQgaWYgYW5kIG9ubHkg
aWYgc2xvdHNfbG9jayBpcyBoZWxkLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJl
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEJpbmJpbiBXdSA8
YmluYmluLnd1QGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3Rv
cGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+IA0KDQpSZXZpZXdlZC1ieTogS2FpIEh1YW5n
IDxrYWkuaHVhbmdAaW50ZWwuY29tPg0K

