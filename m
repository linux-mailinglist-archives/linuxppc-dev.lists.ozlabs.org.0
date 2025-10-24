Return-Path: <linuxppc-dev+bounces-13260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64DC0584C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 12:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctJYK6F71z30RJ;
	Fri, 24 Oct 2025 21:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761300597;
	cv=pass; b=nMeSJHNaSmvrbWgNedWkT9Nd4m1RmfYbKGz1UZ8H8nrCHEU28AgUKEHTbY4O/SGNC68WbiEiUPgXsXLGiZc32BM4B95VDEOSELCEL/BELZjYnrhpfdG+GJyZ4vGZ3NiJJl1Jwhw01kGz3eB70xQuh+gSLiTGGbpKVNCFveivyOVoCqJS0wU7I0e78Cuc2ZVazK6uwfPuVjTVQXz9b1CVioKcO4GWHpWYbQOBIiCL7TG1Osr/zjGTW43TkTPVMSGbLOUdxYKWEUwRbdOHqdlQFk5PnLy1e1EkF56+RBb44rBevihIN36dCEH066pRs8QeiRnAqheOAjd9BC/l3+/rwg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761300597; c=relaxed/relaxed;
	bh=9AHkVOndAom1/uIYaH52Jns73yt+Yo9fem6OgOXwrB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VT4RIqYdC+WMHkGF1K1LuyYq7VX9sWqHivorx1zOYKG94rFWgKKqqWYLjcxZ9GGdHQoXK4JZrTj025l5C35paeENM51kkKo8qIbEzgGX1j4sKH9TE5WxZ6ghwLAqOSqzPmrChTCu71D1X4KJv1A4Z+XyLQuaxdNbG0x2GHDbidGBX2yCkMXXZfBIIE0BMIZ9/eu/rwaE0BxhmkX4J2btp8DDriGv0f71CxnFPQ19Kpti+gp6eL28JJgLbJZstvT6+n4ZAD7N1A43rQaAYGBidYg2a1C4fVmIHiGuuj7/UIE1xkcxkOZcRVAftiXXhl+6xEDj5HD7/EPEe8l0j+9yYg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+xpIFUa; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+xpIFUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctJYG6Q9Dz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 21:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761300595; x=1792836595;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9AHkVOndAom1/uIYaH52Jns73yt+Yo9fem6OgOXwrB4=;
  b=W+xpIFUa/yrGl03rmB4mEzJsb/iFWOQPcrGtqVOJ+iRXqvDR0ACWNz/s
   NmnP0Io7rRoPBzVE3Y4MqSUE2c6L22iohBLq17h8YnOa/+rvOnnSAiVtb
   QLmJfxmsUlHiL2a8q2OMq0YbRL+tMBegqwu1RkRGUk7BQFNflTMeED5Wu
   DmYaymRspIQCJlDXZJkgJXAd7wNCIH1spGYizb4VSY0PJ4jzwVqClFPQw
   wz5pokia/wY2qxcxo7WigydqMTze6u7/zxDzMEmUlq4YNQhUCbpw3Cpp4
   vswMm/AZi5ZPS5P5JwPrdcVM+8SzC8eYBG3nJ/cYVbV3RbTx7kDA7ZaHm
   Q==;
X-CSE-ConnectionGUID: TZj4BuzeQoOTnAcw3NP5Bg==
X-CSE-MsgGUID: FGPFo2S+SoGyswr8VI6/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51058278"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="51058278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:09:31 -0700
X-CSE-ConnectionGUID: Sj7HgJ73SiCZfezq8bjeRw==
X-CSE-MsgGUID: nzGOyBTqTg2Lkv8VesMiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184289726"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:09:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:09:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:09:30 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsiJpxBUy9WU3+BwZ/sSWC8Gzhxcab4npq9+CYtjiuvRwTvJFbgL+as0XaK4+cUbtKBEsjovSMihv66RTT4sSacwvsIYT9TSG9j5ESuQMdpvSTfgKdgZTT/KWJ3FtfyYTewNHiquF/Zt2XHHiIf3V1tKjpfAFdpmpnKcpQRHKW/m6j2vfN98QDhGYQ9wjXvgdf4oEUKdQSY67T9lB9oe+sAOFVQknwwJdtrhshengIMqjMJoww469iTh30UD4q6l1E4p/D3ejCevs7pUypV+ArSnRaivUB0HOIwlGkS0Y+ZLd+P0JXrTSAODUBp8tkRmZQDr10qY/ibV18gHX8xC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AHkVOndAom1/uIYaH52Jns73yt+Yo9fem6OgOXwrB4=;
 b=o2UcmLdSb21FK10vuagOsat7EQ+JNSRKTwIYZHbKVXe2xI5jVvWrmZcUGv8BOdInpEszQAbyu26+xusJdlgD8eMfyvtn7UEYOY/tSSJ+Ep8i92VCCQcUBLBhMAX7UVi2lTt6VOBd3KCo2qIWwyIusbcdH33FW3s5PPpabmWnADvLEW0qU3phUY9Ul8+wo6TgZGbh6rHDZ1F/B+0Rl143krZ0nvNe52+5u15/zSGinUfNqdXUPoeaHZ64I2O5PdcjzYsRCSMty9PymAamgCaJXxpyvSU1+2b/Qvn7gVclJ5/717DDczWi5zMuHUsskYQnb2V+PjboH9vrYH2e7UcoVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:09:25 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:09:25 +0000
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
Subject: Re: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Topic: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Index: AQHcPv2s4f9aAwTczkmNiyIyrEI16LTRHoWA
Date: Fri, 24 Oct 2025 10:09:25 +0000
Message-ID: <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-21-seanjc@google.com>
In-Reply-To: <20251017003244.186495-21-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: e44ccb5d-5fb5-4648-3bad-08de12e56915
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TzRHUjN3TjFwYXp3M3JkMStDMmt5WXh1V3JzYmlBcm1xK0YxSVR3US9VamFM?=
 =?utf-8?B?VlBwV2VsczlyZm9RcEtOTjVrRnYvUEs3aWNGVllPdnkvTXhpRHlGSGFCNE1T?=
 =?utf-8?B?dksyakV0eVRWalR6blR3SzlJOHdIV254UUNBbC94VE5JYTNDZmJiTmVrUmky?=
 =?utf-8?B?K1MzRzZ4MG9QdFpPWlZuQkNEd0I4bVhYMnJDWElNS1FCUldzS0tKTHFJSkFR?=
 =?utf-8?B?RDFjZTQvVit1bjhZbkVQSjg0TnJBU2hUMjB1UURWekVQYXo3OU8zNzFmdlMy?=
 =?utf-8?B?R0pMT1hQV0lDeml1c3QzbGtjWk5nanBFSEtVNXVvMGtyVlJ5ZmFsZllsUXIz?=
 =?utf-8?B?UVorZFBwYjUzOEVZV2k1SFhmZkVtczd4V2R2OHQ3SVd3dkwxK2pYU3FYREQ1?=
 =?utf-8?B?dGZmRlFpU0JPZUNnSkNDSklleCtKdndjRHd4VU5GNG8rRUVyMFpFeUZTOGFx?=
 =?utf-8?B?MVBnY2xWNFlmTEx1WWYyMUQ2OE9UTXdPengxMnY0YWFoS2phN1Y4WVN0eVF4?=
 =?utf-8?B?dmFlUDR1Z1BMM0NIOFhENDFaby83WXZTckhNNmZLMlplTy82VnY3T1VwWHk3?=
 =?utf-8?B?WlJ6RFVpUnN5NDhHR0R0ZjRjdEdKZm14Z2UyY3QxOVVndGhrekVLdWkwMzBU?=
 =?utf-8?B?eFU5czBuT0pMWFR3M1pMVi9OMC9lRW5MNE5qWGFNa2RLTENwOGJYTHdXVDlx?=
 =?utf-8?B?eklQUWhBYy85cVFtUXJZclJiUW45K3FYaFJpeEllSjRlYkhBMDZqOU4rV0ZF?=
 =?utf-8?B?RlFpcE05RmV3blA3bytZd0ZpZjRzVFlvM1VrQTFXMzJLRC9rRWtySnR5Zlp0?=
 =?utf-8?B?Y1FuK1ozcndRYVd3cVRzdWVZWngrWnlodmQrR042RE9KazlJVzVvNzhZUG11?=
 =?utf-8?B?Vm5TU1ArQlFucmRNcVovWmVLbTg3djZXZ1BTdFlRcVBpSzFTc2wvSkV1eXh3?=
 =?utf-8?B?REQ1Nld5S2xUVHZlUzZCSjlzdVV6Y2R6NThPM0lOT3FHVmhjVGYvTFRQUDRo?=
 =?utf-8?B?dFZBYXpldHdHbEVUVFRNcm0xSDRaUWJaNDFTQTJ5ZTRvbWJyT1FZNXZXMVIy?=
 =?utf-8?B?dDBFU1NQbFlpUkxkY1hsTGs3aytHcWQ0U3YvK2NweHZrd0VJNXNjcVBBN2hW?=
 =?utf-8?B?VThKVVZBMTFKbVpyeERKWXRhWjB6MitHUjJVcEY2Nm9sT1hDdHdiWWVHU2dE?=
 =?utf-8?B?cllzWWMzaVpkQmJYMWd6aXVxTElTOWRta1BpRkNQZ3M5Y3NyclVaWWN6WnJH?=
 =?utf-8?B?WFo4OFlhMkYrbXVFM0l3am9YNm5leHpRMmhsOHZCbzVNKzk3bmFSRjJ1TmYz?=
 =?utf-8?B?b0RCeCtIMCtUc2RWMWZ1Z1RXRitYS0FXbEUvLzd3UmFJUFZYdVB4M2xPdjJU?=
 =?utf-8?B?U003dFVaaUx1L0gzbGV4RndKTEtPU3VldUVjcWIya05Ta2wycFNaN1NuakVs?=
 =?utf-8?B?M3lqcnVvd1ZkOVNXN0dYRXk3eTE5QUEzdVE5dDJ6N1M3OThUOGZ5QUc0Nmdp?=
 =?utf-8?B?MHpEbVNZQmpiMkFYRHViZ1FxdG5jS2VSZXNpcisyOXE0bHovNi9qaHFhOG9S?=
 =?utf-8?B?WHUwNlBFdUV6cS83OFlYOXFIaWZVcG1ZQ1IyR1Ixdi9wVnhhM093cHg4SDB0?=
 =?utf-8?B?NGd1R0lYcThjRmlzdnV6WkxvOWFGblVDK2dFTis5aXB4ZUZadUMrYnptN2pu?=
 =?utf-8?B?aFZGbHJqcCtqZmR6ajVrNjZGeTdNUzV0TmJwcW1yTHVHWVF2Q0NlTGJPR2g4?=
 =?utf-8?B?V1YxVnZOUUdEK1lyN1YycDhHUnk1WlBBTnVlcldqVDhwWkV6NTgveWZYMzgy?=
 =?utf-8?B?L0lmNTNsM0I1UDYxMHN2U0ZPcWdETG8zNlBXRkZQMlVqRW1NdlNMbTVMWktF?=
 =?utf-8?B?clpXTkpYWlY4d0JSNmdQeWVpbENDSGNCQUFKY0FKRmtvMmZnUFBPWlJHOGo5?=
 =?utf-8?B?d0pLRW1JQnBxUkVVZ28zeS96MXhXZEllZm5PYm5yV0FhL1MzbVNBcjhDeGJ1?=
 =?utf-8?B?d2s5TWNpdWxJWEpGQ0RGM0JONGJRa05xZWVRckZ5bDFENk1qZXZQU1o3cGNS?=
 =?utf-8?B?TTNxdERJVUNUZEloMGZvR1R4dTFrYzNJT1RNZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHRpcjVsT3dTdWFoYlhiaVMzazRnTXhHcDVyazFYVUpzYmNHU3Q5QTlDYVIx?=
 =?utf-8?B?YVpPa0lUOWk4cTNLZ1o1cDRFbTFPSE4rdXdYR2pxNk94dmVjV21QM0JwT1pu?=
 =?utf-8?B?QnpEY2tJenpTV2E3TUtCcUliRElObUNFNmhaK0xNRXhYWEFtL3ZtNU92QWpv?=
 =?utf-8?B?cVJlMmpOaUwwdW1Mc3lNSGN2TkhSREY2SGhFQ1k5WEF4elBDem03cUZHbE02?=
 =?utf-8?B?emg1MnZGcWxKaGx3STUrUlRSdCtHTzhGTUp2dDJ0ekVMa3hiQXQrRi96N25I?=
 =?utf-8?B?dHVHZ25VelorVXc0dkIycEREc3NlVWRVZGhDSzR3Z2h1d1UxQmhqZ3IrNWhj?=
 =?utf-8?B?WlRsVTlqMCtpSXhIZUgwV2pvbVhyZVNrYVI5VitqczBXejJBTG5sYVBJS2NG?=
 =?utf-8?B?ZkdwWnhBVmNocTMxNnh6U0o5OEFRSmtuS04vNldEdUg1cjgyU0NRS2xzNlZD?=
 =?utf-8?B?NFo3VHZIcVdvaXp3UytZRmVJTlV6RWE5WnJleHpKbkJrb3RkUHZMdFlpMHVv?=
 =?utf-8?B?KzVDYzIzOGM3SVUzUTd2RllWUGlXR3Nnc3FTelQ5VkVIV0YvVFlKbHNXNGtC?=
 =?utf-8?B?ZFNieU0wZCtrdGhFd0VGQkovTjJkeEZVdGlBd2REL3VzY25vSlJCbWhKZUo3?=
 =?utf-8?B?QmxjR0JqV0FJdEhXUXBGbGJ0allrekk2cG9UVVNrOSs0UHN2L0hPLy9FaS8v?=
 =?utf-8?B?dVdhUWV0QlpNcWl1UzZ3bGljUFBkdHArWU9YTlJZYUR5S0YvSytqampyMmo3?=
 =?utf-8?B?MzVIdkdoY0hDdis1NVlWZ2F2Uk5PNVhnVXA5cHpPbzJ0MXB4a0w0TnlnNDhO?=
 =?utf-8?B?UGJEK3hCYVZwZC85QjZCT3FLQWhhZjUyUVBJTWYwTldJR1EyL0M2anJxRmFz?=
 =?utf-8?B?bGs0VGJyVllCVStLMlBtd0xGU0RMeFpBdGs2dHVjRk1PaG8yVlRTZ09XQllh?=
 =?utf-8?B?dHhicjZiUXpPRlNKZjRKbEFsQStTdkVDQi9mdFdjUWUzUlZ2SDdYbG1rbHlz?=
 =?utf-8?B?cE8wbEtlcGtCM3lsM2N1Y3NYaVh0NlBGcDllTUo1aEdyMDkwditkaWdpUnVm?=
 =?utf-8?B?T1ZpeHRBdWZ6RHJIMTRkYW4rL1M4bUsvUDRhcktSRTRUU0dRaithU0JUb2hK?=
 =?utf-8?B?QzVDaTJUWnZRZ1lYME9HNStTRlJoZW40OFRMajV4NW9McUhJWm0zaUJzb01O?=
 =?utf-8?B?N1E5WGtYL09zZTRlU2U2d2I1NFJmeFZ5dEI3MmwwOWh4YzNyeXk0Ukp5RG1N?=
 =?utf-8?B?WE9uYVBxRVNGcWpqZnlndmYwbkQzV3lualhFTjJKajZHMmJxcGdoeStMYitL?=
 =?utf-8?B?UjRCVGwrRmd6QTB5a3VqSUlOZlV2N1loS3A5ajlnVks4ZlFJb094U2pxZW5J?=
 =?utf-8?B?S0c0eXBablV0clFwYnlLczR6azRJdVJuaUhXbjNFaUV2VGtjTndPT1o3L2Nh?=
 =?utf-8?B?ZFYrL3I4WGlrRFpmNzlMeFRMV20yNnl2ZnlWdHl6ZlYxSTdPRjY5RVdoSUFO?=
 =?utf-8?B?Z2w2WEtBNytWNDRzME5YM1ZpYTVHZ3hGL3ZaTnBFOVdRaS9COUZ4cHdSb0tI?=
 =?utf-8?B?bHp0YnhMKzFCYjhHLzVSLzFLeXNHVTdudVk1WU4wNXB6Q3VXbmtGT0F0VjBk?=
 =?utf-8?B?eWdjVmkxY2V2eGZOM0VMM3d4cllFNERpc2lHZ2ZkMGFjck5qTU1leFlCMk1y?=
 =?utf-8?B?R2Y2em51aXBpaGc3MWkrL0wrTEpQQlZqMHEyK1RoOCtpUXE5YkljaGpFY0tL?=
 =?utf-8?B?bUdTekxFU1VQNG1WeXdmV0dpS3djRS9raXVJMmlwTWdoUHZBY01wMTVtTStw?=
 =?utf-8?B?TCt3cVZKYXdrc1grcHkvbFpsRXFNQjhncjNLRm12WVhIOHFyRmluM3NRc1dE?=
 =?utf-8?B?b1E3KzgrTGptOWRnSGkwYk9hWkxEWXhsSG94NnY4ZXVoVlBRbkJIRjNKYkV0?=
 =?utf-8?B?UmI5SHppVEZScFZZVm8zZTQ1d0xsS0FVOVYrdEFaYVAvUGhyRHZ5OVY3N0xu?=
 =?utf-8?B?NENyeGphL3NqQS93MDllb09SWCtjbTlNL3lWUDE2RWE2WmMxNVBrOU4zbGFF?=
 =?utf-8?B?VFMyRnh4MEMrMlIrUllSVFYxN2pYdnd6TkRnNC85bGtmVEFPL2t3SlVEOUFQ?=
 =?utf-8?Q?1XAY7k2DGuc/6keueGTyi26sg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4A3408024519344A5DF8F59D64EC57E@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e44ccb5d-5fb5-4648-3bad-08de12e56915
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 10:09:25.2604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3zKikC1lkhldqV7talSuw3jBhOIePGaSKrUFO+HfjUAQCI9SiqHncJ+qe6qe9o8wO6ZWbVDHt4gMp/+zJAmZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVGh1LCAyMDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBZGQgYSBtYWNybyB0byBoYW5kbGUga2lja2luZyB2Q1BVcyBvdXQgb2YgdGhlIGd1
ZXN0IGFuZCByZXRyeWluZw0KPiBTRUFNQ0FMTHMgb24gLUVCVVNZIGluc3RlYWQgb2YgcHJvdmlk
aW5nIHNtYWxsIGhlbHBlcnMgdG8gYmUgdXNlZCBieSBlYWNoDQo+IFNFQU1DQUxMLiAgV3JhcHBp
bmcgdGhlIFNFQU1DQUxMcyBpbiBhIG1hY3JvIG1ha2VzIGl0IGEgbGl0dGxlIGhhcmRlciB0bw0K
PiB0ZWFzZSBvdXQgd2hpY2ggU0VBTUNBTEwgaXMgYmVpbmcgbWFkZSwgYnV0IHNpZ25pZmljYW50
bHkgcmVkdWNlcyB0aGUNCj4gYW1vdW50IG9mIGNvcHkrcGFzdGUgY29kZSBhbmQgbWFrZXMgaXQg
YWxsIGJ1dCBpbXBvc3NpYmxlIHRvIGxlYXZlIGFuDQo+IGVsZXZhdGVkIHdhaXRfZm9yX3NlcHRf
emFwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdv
b2dsZS5jb20+DQo+IC0tLQ0KPiAgYXJjaC94ODYva3ZtL3ZteC90ZHguYyB8IDcyICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS92bXgvdGR4LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3RkeC5jDQo+IGluZGV4IGY2Nzgy
YjBmZmE5OC4uMmUyZGFiODljOThmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3Rk
eC5jDQo+ICsrKyBiL2FyY2gveDg2L2t2bS92bXgvdGR4LmMNCj4gQEAgLTI5NCwyNSArMjk0LDI0
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0ZHhfZGlzYXNzb2NpYXRlX3ZwKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkNCj4gIAl2Y3B1LT5jcHUgPSAtMTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQg
dGR4X25vX3ZjcHVzX2VudGVyX3N0YXJ0KHN0cnVjdCBrdm0gKmt2bSkNCj4gLXsNCj4gLQlzdHJ1
Y3Qga3ZtX3RkeCAqa3ZtX3RkeCA9IHRvX2t2bV90ZHgoa3ZtKTsNCj4gLQ0KPiAtCWxvY2tkZXBf
YXNzZXJ0X2hlbGRfd3JpdGUoJmt2bS0+bW11X2xvY2spOw0KPiAtDQo+IC0JV1JJVEVfT05DRShr
dm1fdGR4LT53YWl0X2Zvcl9zZXB0X3phcCwgdHJ1ZSk7DQo+IC0NCj4gLQlrdm1fbWFrZV9hbGxf
Y3B1c19yZXF1ZXN0KGt2bSwgS1ZNX1JFUV9PVVRTSURFX0dVRVNUX01PREUpOw0KPiAtfQ0KPiAt
DQo+IC1zdGF0aWMgdm9pZCB0ZHhfbm9fdmNwdXNfZW50ZXJfc3RvcChzdHJ1Y3Qga3ZtICprdm0p
DQo+IC17DQo+IC0Jc3RydWN0IGt2bV90ZHggKmt2bV90ZHggPSB0b19rdm1fdGR4KGt2bSk7DQo+
IC0NCj4gLQlsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKCZrdm0tPm1tdV9sb2NrKTsNCj4gLQ0K
PiAtCVdSSVRFX09OQ0Uoa3ZtX3RkeC0+d2FpdF9mb3Jfc2VwdF96YXAsIGZhbHNlKTsNCj4gLX0N
Cj4gKyNkZWZpbmUgdGRoX2RvX25vX3ZjcHVzKHRkaF9mdW5jLCBrdm0sIGFyZ3MuLi4pCQkJCQlc
DQo+ICsoewkJCQkJCQkJCQlcDQo+ICsJc3RydWN0IGt2bV90ZHggKl9fa3ZtX3RkeCA9IHRvX2t2
bV90ZHgoa3ZtKTsJCQkJXA0KPiArCXU2NCBfX2VycjsJCQkJCQkJCVwNCj4gKwkJCQkJCQkJCQlc
DQo+ICsJbG9ja2RlcF9hc3NlcnRfaGVsZF93cml0ZSgma3ZtLT5tbXVfbG9jayk7CQkJCVwNCj4g
KwkJCQkJCQkJCQlcDQo+ICsJX19lcnIgPSB0ZGhfZnVuYyhhcmdzKTsJCQkJCQkJXA0KPiArCWlm
ICh1bmxpa2VseSh0ZHhfb3BlcmFuZF9idXN5KF9fZXJyKSkpIHsJCQkJXA0KPiArCQlXUklURV9P
TkNFKF9fa3ZtX3RkeC0+d2FpdF9mb3Jfc2VwdF96YXAsIHRydWUpOwkJCVwNCj4gKwkJa3ZtX21h
a2VfYWxsX2NwdXNfcmVxdWVzdChrdm0sIEtWTV9SRVFfT1VUU0lERV9HVUVTVF9NT0RFKTsJXA0K
PiArCQkJCQkJCQkJCVwNCj4gKwkJX19lcnIgPSB0ZGhfZnVuYyhhcmdzKTsJCQkJCQlcDQo+ICsJ
CQkJCQkJCQkJXA0KPiArCQlXUklURV9PTkNFKF9fa3ZtX3RkeC0+d2FpdF9mb3Jfc2VwdF96YXAs
IGZhbHNlKTsJCVwNCj4gKwl9CQkJCQkJCQkJXA0KPiArCV9fZXJyOwkJCQkJCQkJCVwNCj4gK30p
DQoNClRoZSBjb21tZW50IHdoaWNoIHNheXMgInRoZSBzZWNvbmQgcmV0cnkgc2hvdWxkIHN1Y2Nl
ZWQiIGlzIGxvc3QsIGNvdWxkIHdlDQphZGQgaXQgdG8gdGRoX2RvX25vX3ZjcHVzKCk/DQoNCkFs
c28sIHBlcmhhcHMgd2UgY2FuIGp1c3QgVERYX0JVR19PTigpIGluc2lkZSB0ZGhfZG9fbm9fdmNw
dXMoKSB3aGVuIHRoZQ0Kc2Vjb25kIGNhbGwgb2YgdGRoX2Z1bmMoKSBmYWlscz8NCg==

