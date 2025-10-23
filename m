Return-Path: <linuxppc-dev+bounces-13201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA4C008AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 12:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csjFR2ZtCz3bd0;
	Thu, 23 Oct 2025 21:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761215947;
	cv=pass; b=cZSbLsj7MHqmuuRuYis+Zqeri0wofmZ5xEibh2rO7AaK/gJGJV31hOd5vMOWjsUtzZz+IATkbVjtQDlInUj9cI6hYaJrYr7rVVt63gTgtGAktfJiZCWVNFyUE0l6J8UVKM+zySj4+pDJh+t68TIDI8591lEZFJ3ZyiGNL+9YG834lTIY0C+mAYiT9dUD5/rRjdN41h1hZhko6MI/Gy3twPbVEYqDx3axwbl7p5gU+KtE9jMUK7S9bDpdMnc8n89/KkQ/GnR60HX7nWvl0jrpXj53Jxx/8qQrnnWwBB/0vBHqU++ZS2fUJKxbaqwI0Y2oy/Yjy2NeFmm8TLcPG28YVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761215947; c=relaxed/relaxed;
	bh=El4gNiUfIxmYNUTGLRj7GgfYlaNuMpUzwiqVDBfI0Uw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YjlXP3gAbTb7FD9vlRsSrSoDp/Ihcq1zu2SoQTRlrMjRmnoGV2U4pAOyKeKVEXE1SXx52qwK2x3f+KfHEPcb3HnvpIOQE58Ro8FPoKcvbtJ4c5QSmZT8QDk4Rn48FhFsZ0+34kNko9lst93jYsp0h5qc3lzpbIs1F8S8rTW0333XgDXFOllVQkFe6xj+ZU0uC6HgeNoGUOyoB9Ro0o9v9q9IkAeowylwzaKwvP8KSev5qcQMsY/ehNnHUqm4UVRyyyOw13XehQXpXboh/Cpbf0OO2PQP0j8DGGjXMIInp0TZ0+niUrUsnDjn4Gkpst+0c5WC0Om50Ag+bHrBA88Y9A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oo42gvod; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oo42gvod;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csjFQ0MPMz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 21:39:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761215946; x=1792751946;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=El4gNiUfIxmYNUTGLRj7GgfYlaNuMpUzwiqVDBfI0Uw=;
  b=Oo42gvodk0GJA24om6qXnd9pth6WpS4E+qnHEvaOs42p/M4tgSDtFVT4
   D4y7rL9seIJbOCxbSuYUu5lmtWLsXGWD/c99yw/wUkYhU55iPeQGzN4t4
   l6bTpL/qu+cUNAGnBsg1atDxGzlvMw5ctgTPYz956UifXtw3wDomyoKnZ
   6Xt6UaIUs/5VU0NmdalNsi1cS7vHhSEORVR+A0lh+5xi8H4uU6lczh6CY
   SQWbRFgGDUE1PN/pLoi/T/99SLFlfCc2SbNFyujusgHy2QqPHpOkbb55v
   p//cJbztTevQplhgxLeLI+qkhnmTXNb7zrtOf1Kwf9aiyiWdYCguF6Rid
   A==;
X-CSE-ConnectionGUID: wc1bHGePT7yVnqQmZ5wxXA==
X-CSE-MsgGUID: nlHYvpnHTZ+xbz7T4bv0zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63530058"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63530058"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:39:02 -0700
X-CSE-ConnectionGUID: Xs7HkkXbTs2jhE0ueAfFag==
X-CSE-MsgGUID: l9lNMN0ZTLiOOrpcf3upDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="183346219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:39:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:39:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 03:39:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0Sa0iVzurOupQVdVGyWUIIq30s3i/PKl5dRdym7SjspVbkRiGHp3uYX5Pf0LSicsYojzbd+4Eh54TXi8zf3v6Adlkq81bWbUkNf4X9XXBTYTf1ndDxLHmWKNvW0t1sDuOPADFi8Nvty36pQSCozbjE8Hrhx0iuFO2XsdKAMEcqBv05J3Wbg3gWF+ixBfBXB/tn0o9ebv5sQ4ppzCM2mdRzEN4bEHHIxXrixpaDd35s2WsgjPwzK4hYE+bzCThy/We/2qe54GTMHf/DmAdyfb0subHUYRzi8r5L1hakR9TjBK+xQuptZ2xM4u/RuHrDTpYOAJxYFglrKtenjfI5pEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El4gNiUfIxmYNUTGLRj7GgfYlaNuMpUzwiqVDBfI0Uw=;
 b=zMd6wNWFxb577E9DUSFEm9jdm9wdI8jsWdyZV1oozVkcVP6w53sXW+nBvhI3VxxfO35xX4YZSREUHcavL7rm1eZqDnlI3pRRMnjCgUoVEgWwZRBCxdtGQDus7oc961Jx4NUG2OmivTpFiBSF0nWIFjwHlewNxlzeYJt+mwGuu8RPEMqp4h+RyAsd4Ma+czSV6IKPXbBpI5TEkzIn+D2pbX8v13/Od0d/Ah8nkb3YEaD82Oy66D1eSF+kxON0sXc9bmePnlM0nBYXfKtbyeNPE0g97bL+IN5R5ZhxGf+oQFVAugExtACUSQByqsSX+3NEK8ofgLBhddT3bAmF8z9rpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by IA0PR11MB8356.namprd11.prod.outlook.com (2603:10b6:208:486::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:38:52 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:38:52 +0000
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
Subject: Re: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to
 kvm_tdp_page_prefault()
Thread-Topic: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to
 kvm_tdp_page_prefault()
Thread-Index: AQHcPv2fR/NVeidGckGLX6i1NYZGOrTPlGqA
Date: Thu, 23 Oct 2025 10:38:52 +0000
Message-ID: <ed3b6a3bbea70482a13482bcbba84087567904be.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-7-seanjc@google.com>
In-Reply-To: <20251017003244.186495-7-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|IA0PR11MB8356:EE_
x-ms-office365-filtering-correlation-id: 7ba10b01-fb68-4732-3a62-08de12205c14
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?L2FtdXA4V1ppY1JXbXJwMDZORzBzRmVOY2lXcERNbzAwTHhEQmxLV3NHNkti?=
 =?utf-8?B?VWFMU1c0b1dIMnBhblF4bEw5R0E4UHJKVG9JQ0NKenQwNnRZRk1iOHpPWEcv?=
 =?utf-8?B?eUhSNC9pdUlIbHNiNWpKdFp2V200dWJISDJlYUcwRkVuanB5c0puUFR4dmFs?=
 =?utf-8?B?S1BZc3hjN2pFTDFPeFp6WGtWNHRGMmhnTWtJWk1lRXBXNlhtKyt0MHlwa0E3?=
 =?utf-8?B?NDQxRmdkRnU0ZmozRXpNNHpYMDF5V3VUZDN4UGxERVZmOFMrTXBHN0tFMmZv?=
 =?utf-8?B?V2JEck0yWFlpM3lvM2czeW5VWEJkQllKR3JML3BzTXpWVXlzRW1Lb3pKZGdn?=
 =?utf-8?B?NHRQamI3cTFxL2xYZytmZER3bVo1YTNMQzIySTVtVVNqS2NrVFJKK0t0SWZs?=
 =?utf-8?B?L2Ntb0tXYU1BTVltRmhmK3lId0xQMERaTytHOXlKYzRYUzFIbVdydXAyc0JK?=
 =?utf-8?B?OXMwZUU4TXRiQ0hBU3VoTmFrUFBLSGl2SVpKeTZINnlWb2M0RlZoMjFVMG4w?=
 =?utf-8?B?ckQxQW1Ya2U2aXEydW5EOG11c05YYjFncTA3UHdjMWgyNTdhV0hJbndQeEJC?=
 =?utf-8?B?ZExkWThzS2ZwcnZrVWxBcHlDdHVYNllJdWFYQ251aStNMWtLa0pFK28vTVRW?=
 =?utf-8?B?YUw3Nmw3cFNpejRjSjlLeVp1NG9TU1VDU3NGS0NGT3owYitZNE1zQU1rc1M0?=
 =?utf-8?B?OFFYb3lndEZKcjZIR1A1WWsybDl6OXN0bWljK0lBT1lFenBUTlJHODM0TUkr?=
 =?utf-8?B?UUdiVlhIK3h0OUw4SWtULzBmc2grQjEraEdFMm14Q2NCdUQ0aGFuYWZ2aERO?=
 =?utf-8?B?bU11TUpaYnhta0dTZWFQa08wY3ppTUUwRnYxNU5ZRU9KVzZ3SHRLbnBpcTZq?=
 =?utf-8?B?OGZrckVNZWRrajE2VzcyaUhzQ296S2taOWhHOElRbDgzMlZZRkc2ZVMwWEFW?=
 =?utf-8?B?TjRyNXlSRmhsVCtScnlQUWVzZDg2b3lkWFhuZi94azVtVSt5VWhlZFllM2Er?=
 =?utf-8?B?VWY4VVFQZ255UEg2SXdYZGp1QVpsSjdOUVBuU2ZQcWhLRFIwYjlBNUFFbUpi?=
 =?utf-8?B?VHpwdGtDK2UzaGc4ZERhWEg4c3hKZWppYk9CYks2anFDMTlKZmJGc1crbitW?=
 =?utf-8?B?QWFCMEJiSmpWRmFVUm53UmFsSXpsRGNLRVNsYmNXMWdUQXVWNG8zTW1pZXVW?=
 =?utf-8?B?TG5UbnBteGZPaWo3bkVpRGFCbFpDT1VDbGcvVnplL1k0NStERU44T1FzcW5Z?=
 =?utf-8?B?YmpCUnJlYVFjc3h0bGpjdGNLQ3NvemlBczc1MVRSKzBRL3ByRmJ5SzhkQUk4?=
 =?utf-8?B?cDdkTHFwdUx2TDhGaVdHRENkZkR4Sm5uOHhoVWRGdnUvb1RsdlNtZmJVR2Uw?=
 =?utf-8?B?Ynh6N21iWU5uMTZkYkE4N21NeW9lZkJuVzVNT3dRVTY0czcwM09VajM2ZURr?=
 =?utf-8?B?K0svV1d2ZTFPZHU5RldzbmxLem8xU1NJaWgwL2RzMlJ0Y1pqUit4YlhVd21H?=
 =?utf-8?B?U3l1dy94cVlPcmNBeEpZTXExY3N4Vm52cHNHNWZ4dEpZenBHTlJoTEJLclo3?=
 =?utf-8?B?ZkdmR240RTRiU2tIY0NYVGo2OUpQeXhtcUNoR3kxT0x1YStsQWtpOVZPaHNK?=
 =?utf-8?B?eENPbGttM2NCTndzUFF1ak1VUGFQVXVOU2ZkOVAzaDVZYTBtTXYyc2F6ZTBX?=
 =?utf-8?B?UnNhU09MelhkeE5Wa3VtZ0RkZnY0dkVMSWxyZ1VxZ3R2WUYxSGNFaDgvZTRI?=
 =?utf-8?B?bHUrUXlpOCtwczNxTDI5NlU5RFhEOXRic0Y3WVAycTNySHlzWm0rSUNUbGlP?=
 =?utf-8?B?V283YzU4UzBJdERzeDNVNmVkT2JNdFdIOFptZTNvR0orQjNKeHdUWTJ5WmFv?=
 =?utf-8?B?V3ZxSzhYT0U2UVg3STZuTzZ6QzdWWnUrZVkyMTJKT0xiR3JnRE1zTkNGTWNO?=
 =?utf-8?B?bTQyZ1l6YWhPRXR2REh6dmpIVjhIMUJRajhBbWlYc25vVkQrSGxoRzlUSmsy?=
 =?utf-8?B?d095SEtEZU9MM0Y1QmRuSTh3U1hpT0FuazZtWStPNTd5N0tBdkZBeVlYekly?=
 =?utf-8?B?VXFuWTdvL1ozcG1UazdpOUUzVysvd2tIU2Y2dz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEV6M2oyWFVFMEhGZVA0NmhHNzRmSzVpYTJvcDQ3elZQTlNka0M5WExJeWhu?=
 =?utf-8?B?bVZhNVAxL2JTQVBYMmlGcFYyNVVuaGZHZHIvUFJqaEFpbGJ2cGNGMXhRNloz?=
 =?utf-8?B?RmdZRGhqbVJKZFJEbHNFdldMb3ZVckdJcHRBSThFNHhqbEEvcnFibzJnSkwz?=
 =?utf-8?B?cm1RWjZ0b1E0U0JEd3F3eUZ2eDRjTS9zbXY1Tk9zRmpFcldlTVpKUlQ5M0Y2?=
 =?utf-8?B?cU1jTHVadloxWGYyZjQ5NkZ1cmRoczVQZzBGaWFCZnkvbnFLTG9tK0lXUHBF?=
 =?utf-8?B?MDhVWFpRdjZUVGdaNkhxV0lkYUt1WWUvdXVlMU9ZdzlUdTBidU5QTEp6RjNk?=
 =?utf-8?B?YWs5MjhGM1pLQ2JoU0s1SExycGsvaVVGTEF3bk9sQllNeGJHUG9CeU5KYTNS?=
 =?utf-8?B?RFhHbFBERjBxeWdlaXBCbDZXblVqUEcvS1ZCdDdtbksvTWJTekpXcFlocFdn?=
 =?utf-8?B?VlZMNU1uMWM0eklncnA1cERWVFRnbTE1Umx6MlZ2OXpoZUhhZnBQRHlaQ1p1?=
 =?utf-8?B?VzFRaEc1bHVJL1ZxTGZYZ05sYkdzZ0xXSFpYUDNzTEc4dWNZOXllRjE4dmtI?=
 =?utf-8?B?Y1JjeTNoU3JtMmZUWG9FbjBNdW90bXdBRmZtSUNjejRwSGxobmZ5VXVPdlZi?=
 =?utf-8?B?SVBMZDVTWEg5R3F0WktiQnROOWQycXNGVlViMlVuRFNkRjZkd3RYWDNkVUd5?=
 =?utf-8?B?b0djTnNCc3AyWW95MkhoUjdsN3h5TlJwQ05DTStBOG1ydTBpNDB2YnZUWXJR?=
 =?utf-8?B?WGM0bEFnZ0U0S3ZuY0xtRUZpTkNnMTVlRm5iSlhMZm5EaWZnSXZKejE4YkJ5?=
 =?utf-8?B?ZzlrUnFaaVJKVFNhK25TWUxKOFhIbVhZekFDOHFESXIxZFdmRXBBSGJFQlRZ?=
 =?utf-8?B?S1IwcHJrV2xzMkF1dlJoQStueXlwMUlYbFI0WFlYZGpiWGd4UlI1dlk2S0Vh?=
 =?utf-8?B?VnZjWVJBOHhtZlBYd3RidFlPZzNuUmpNeFVCOGtKck1jb0svTWlpb0dCZ3I0?=
 =?utf-8?B?VWRMZTVBMUdNcWNQd1lpdzhqTWFsRzd6aWtub2hwYUNVMnlOcGY4NUcwSTF4?=
 =?utf-8?B?WmdkTC9rcnl2VWxUaENmRzVlNzR4c3Y1bHlkTy9WNFJWcmN5eUttcmNIUk9C?=
 =?utf-8?B?MDRkL0hEUG1td3Y1OWhFaklwamx3d3lrVUxWTEJZaVZZMVFoc1E2UzFDWk16?=
 =?utf-8?B?M0YzSGQxWGZnb3FWQTVBNGNIY2RBTW9KeWpnK290dFZGNUFZcmJLb1VaZnNr?=
 =?utf-8?B?WnpaL1c3VXFpa0syRXcxQzVBUDBGMkNIWElVOHZoYVdWT2U0dXFxSWgzd2ky?=
 =?utf-8?B?N3AvNkMxZnh5MlBBN2wzQkNsMGZOTWRuL1d0NVd5ZXRPNnFjcFppWXIyNHVX?=
 =?utf-8?B?Y0VoV3NIcUlyeVpTTm1Bd3M2UmFCaVEvbFBMZ0I0cUFtNmpHRGd0VjRaUDlh?=
 =?utf-8?B?U0xqUnJEOTBJK3FTUHcyOEtrQVVpbUNUS0J4UElkcCtvYXpKczZVc2YvMHVq?=
 =?utf-8?B?and5SmVudjJ4Z3owaHEzem1OYVpYRG0wYVhacUNzTUpvYnlUUGNaYXg4VkpT?=
 =?utf-8?B?Tmk1ZTJCa211MkdQd09QS0dhUjZnQVNPSXZaUHAyTm5yQk1QWXIzaWRQeGpq?=
 =?utf-8?B?dVdXZVF5N2pEVit6VE1GNXoxL0hHTjg0aXdHWFZlT1dseWkwbmNUd1JheEJM?=
 =?utf-8?B?OW54UTZPN3V5dEZWQ0VtaTVoQkhwQ2EvUnhKN2pxTHRodnp0Z3d1R3VJQUh0?=
 =?utf-8?B?eXdhMEF1d29RcUJ3L3B5UFZwT2ZNZG5zSUFaTjk1eEVkSGVURGRGc2dBRW1T?=
 =?utf-8?B?V3hsVVhOTDYwbk9kbm8zR0hGRFZSR2VDZlJGdDB2YkJEMDFvZi8xdHpPN0pM?=
 =?utf-8?B?enJqR0tNbEE3RHkvUWx6d3RBQlZGOXhBUVRaLzlHTW1XbXFVMTM1dUF6WkZi?=
 =?utf-8?B?S3JYZXVWZFk4S0hXMFBMTkxkQjM4aWhiVW5xQnhlMk5aWktEMlJiSUhRQXgr?=
 =?utf-8?B?VEpzaTFEamxzZHEvaEx2OG5kK0NZOGV2WnZxZnovNHk3dytDd1hILzN3WEpi?=
 =?utf-8?B?N2VtTXB5NkY4MDNxSU44MzhaeWtsT2YzMUI2NUtmZEQrblFDV2NqYnlsVlJn?=
 =?utf-8?Q?L/A/Wi/SH8nd5Ol8V4eriGnPb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50F477D6E7FE3349BD169221C5CAC45A@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba10b01-fb68-4732-3a62-08de12205c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 10:38:52.6253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IZ1geZxpB9nhCf7PFv0PA7ox2TaJZetXxZmvRFS3t3okVq/M2tqC61u9TdYrWnO1nJmvWcqHx1UrCBmimgGVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8356
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBSZW5hbWUga3ZtX3RkcF9tYXBfcGFnZSgpIHRvIGt2bV90ZHBfcGFnZV9wcmVmYXVs
dCgpIG5vdyB0aGF0IGl0J3MgdXNlZA0KPiBvbmx5IGJ5IGt2bV9hcmNoX3ZjcHVfcHJlX2ZhdWx0
X21lbW9yeSgpLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBS
ZXZpZXdlZC1ieTogUmljayBFZGdlY29tYmUgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4N
Cj4gDQoNClJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQo=

