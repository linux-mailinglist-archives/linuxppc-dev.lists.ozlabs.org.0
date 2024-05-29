Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAE88D3518
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 13:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7RLiti7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq5mN05mKz889q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7RLiti7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq5lZ1VVTz78c9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:51:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716979868; x=1748515868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WAuqbneYpqfCPkKmo7X4KbRUYPtmq2ITGPGsTMLTmKg=;
  b=M7RLiti7+mwZk/cA6sN8z5KIrwKS11lNUPknlu7Hk6RwL92L9/ET1C83
   X4M4kuqIYC05xGQH2pZMcPmjmq0x8Amp7ps6JSoYDgYqynhlswX94tNag
   Zzez/63JBbozjwcZ0RGbZ/kzzG0xWV3t1WS3W1IqkuX9agw0Bzc86/Zso
   j2Qo1PzxGfUjSZnOl/CJ3FbFE/UTB0Un576RBjeQLaQMJCrvrSRyDT5nV
   6S+lN1FL8K0lHuCSGKlcnA8v/fXkkYebeXyVShIThGxqbg3NunHT6dDil
   M7MYNc7SrlzgFqhW67WAR0q0TXB7Lh0PTfEiQsdblPw5AXDoRXNO4sr2/
   g==;
X-CSE-ConnectionGUID: HBuXtHzWSuu/3BKIuDntLw==
X-CSE-MsgGUID: AoOMmXd4Q6+XwJoRyD2/wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13495709"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13495709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 03:51:01 -0700
X-CSE-ConnectionGUID: dRKfLXMxTk+IHSn3ZluApQ==
X-CSE-MsgGUID: BfPfubCsRs+qY8j3u5Q+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="66270587"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 03:51:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 03:51:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 03:50:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 03:50:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 03:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6W+GFxDRJANMMYx2rTi1STVdkr7P1gmcand7Ho1hwcmDt6cU8ksgHBxRcBqhJ0yuwRVQ67MdftlCNyqwDwmvqZj/r08x7XM97mxyDPBGQBAbFqY3V4+OsVEE5r1d3U12g3b37CFpPj0sWQdcJfhvvpROSQrxkNgeuTeRim9JGg+fC2cTsEhKvrOG3zYeTW+YB6t8XQe28a9DLm5U8GNn9j3e+XeXRV5+o1K9DQRLLCYAneZttYXgOmEJSpOGzPT9Hqz91A9wDaPIW/qsHxuOTOarl8XnXmN7qtbzlBz4M+pLe+hqlmI7nE6Fd+3J42HCojNynr99sN54a+QQlD4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAuqbneYpqfCPkKmo7X4KbRUYPtmq2ITGPGsTMLTmKg=;
 b=Npk4eAyaFFrPJoyE8FMp1hfIaZF7UzLjCzyCMFzQAKdVfk280ndrkTVp0rKgVcLZiSGLfOT2UkiCHE6pIp5vtXJYM0JmU83Xw6wbOppZRn9Lmh1UcMGEL9GL9zupwMPBNDAaXBIIR89P/WsNSv3VsYBxQA/7ygE7c6JtuD3NvPdGj/8G+XqQNitYMBDgP9FQFv2KrE+cMyFb3Zl4H+Vcu4CeNcjAvHo/gQvn6r3Z7btfNsmcXx+6VU8ZxW9PYjRP8Tts1JYGnTZmU9qLQnlmz8JsRDU9fM8pvU2G7dIMGTsTMqo/HWnzGJX3d2hhGK8GOz5Fpg0akTQRgtXJBp2d2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 10:50:57 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 10:50:57 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Thread-Topic: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Thread-Index: AQHaq+kvNSE54PKrvEmweOF4RZvjhrGlbnoAgAegs4CAAQUoAA==
Date: Wed, 29 May 2024 10:50:57 +0000
Message-ID: <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
References: <20240522014013.1672962-1-seanjc@google.com>
	 <20240522014013.1672962-4-seanjc@google.com>
	 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
	 <ZlYte16cvQpPGHkx@google.com>
In-Reply-To: <ZlYte16cvQpPGHkx@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA2PR11MB4956:EE_
x-ms-office365-filtering-correlation-id: 7cf63ac3-31db-4a7b-8be1-08dc7fcd3867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YzVQYkFYeGJIT1NlcG5Zd1JkNDduaGxKWGQramQ3d29ZTXhrZmtscFNxNHZr?=
 =?utf-8?B?TlJOVmU1Q0V4U3hWUjQ2MGNUaVZIZmdMK2VnemMxNzV0aEpIemY2QjY4UnZZ?=
 =?utf-8?B?Ym5zQzhMaXgxaWJLKzBTT3BxbVlZTVR1ZEtXQ1ErMTBuUm9raEMrNWZ0RE5k?=
 =?utf-8?B?TE4ybjFwZ0JweEtrb1Zqd1FQaEkyanNjZ2kyVFFURGozUGo2WU5TZ2dGL21J?=
 =?utf-8?B?SFU0NmcrU083U3BYL0lvdlorVXFHNTY1c3lGNUlIK1RNWm1yZllKTTRObG9T?=
 =?utf-8?B?MmVVZmliQ1RsOUs3ZDVQelVXNFU1aWE3VStZMFd2UnRRSTFqaGxSS2lSUWJP?=
 =?utf-8?B?U1I3RHdvcmw4TmQ4T3FITUJEc3RNVXVZWFdqUlptUnJ2YVhVUzJ1bjlMVVY5?=
 =?utf-8?B?Uy9FSnFCMlI4U3NoaU5CVHpIaDJqSWRQQ1Y1emVNNzcwZmFaNkxIYmo1WENm?=
 =?utf-8?B?SEwwazd2UHN0Mno1QVVEMFB1TU1aMnRERlZjWVlqeW9mWXZyU243KzNSZ0FH?=
 =?utf-8?B?ZHFxZlJlN0FBSnZSK0tyYTF1bzgwdVo0dmNiaWxEYTJWeTFFVVlDckdMYVk3?=
 =?utf-8?B?TTVTUTJRK1ZlbU82emdxVFhBV3JlbGxHMzVrVWxWMFl0VjEyUng3QkRoemho?=
 =?utf-8?B?dlgwU0ljNzFOUGRuTWJhVmpjTHRHMGNsOW8zV3laSWlsaHY3WGV3anVlc0ZY?=
 =?utf-8?B?N01VUHB1RksrNlZTUGpYbDJCSDc2NHlqZC9Ia1V6T1NoaTlsdzNVM1F2V2hL?=
 =?utf-8?B?QmtqZnpHbWdkN1hxMW9CUFMydUp2YXJwNUN2dU9PTi9uNEFsNDVVWGJQME1u?=
 =?utf-8?B?emN6cEltdjBkeXRhWWhJVmtWYWxlWHkwSkhvMFI2eTh0SkRORWNHK2xSQzQv?=
 =?utf-8?B?bjFIZ24vSmwyMnBYYTVTOEUwZUJDdTRhZEhyOXpucXV5RW1ieFNpckVHbnNr?=
 =?utf-8?B?SVFmUENiaHBod2RFT29xVXBiYks0NFo3MThtZ0UyanpZT3MvdHRnd1BnOHRn?=
 =?utf-8?B?c1Jic2hSN0JHenp4MmE1UnpIYlArcG5BVHhBYVl0UDM1Y0RmWHIrcXlzZlRq?=
 =?utf-8?B?aWw3Skt3cVFySVI5MnJBVEZlcTAraUo1eWFSNUFzeHQxREF1alBuUUV5V2pi?=
 =?utf-8?B?enJ2bFp1ZGVQeG9jYWs2S1RGRTg2cnJWZzVTT2RMRm90YlJJcDNYUFh3QzdM?=
 =?utf-8?B?MUxPZkhNYk1IM21SSzYvY0dHQVFscW9VZHFMN0ViTStaT0hKZmNPQXNCdTNy?=
 =?utf-8?B?d0k0cFlzMVBhOVVJNlFMbGc1VlRTakk5Y1VhNllDSTlPZFNRemdZQUIvN0Zx?=
 =?utf-8?B?aitGcy9tMVhwN0pwMDNGVXZ2NSt0ZGx3RjZSb1ZFNitYRHFCY3VZWTNVSEd5?=
 =?utf-8?B?WWZ3ZXczc25EMEV6eGRXYTFBcnE2aVdmV0RmME03b0ZPQkZTMVBOOEYxS2VQ?=
 =?utf-8?B?SXVSUU9kNnd5WFZMYjZHNzUzblF6RUlZbktEZWNsUU5hZU5TUGtoaTYyL1NZ?=
 =?utf-8?B?eGY3d2k1QXJDZTBoNHBIWHh1ZUV4TlRpekxuaU9CVjljNzZUUGdMY0dCMXl6?=
 =?utf-8?B?RUwxUm1zMzQ2YU85Z3NEMFl5a3QvN3IwS2I2aGpLSGNnSmxSc2hYSlZCdk5L?=
 =?utf-8?B?ME8vTFhic1hDbnVSaEpUQUhCL3NsNzBRTENJaWp4L2I5U1J1eThBR3NBOWxJ?=
 =?utf-8?B?WmQxVHRNRUxXN0RPSUF6TVVtVmx0RnZPcWtpWENqNmpOSElkdFBraUxIa0I3?=
 =?utf-8?B?UlYxc1luT0k2d094Z25tTkx0alBOaElkQlJkcjVyWEtXbmU4L2wvNzZwbmkw?=
 =?utf-8?B?bGpoNk1sbTduWmlYMHV0QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmtuOFpDNE5La2pjUmtVSGdMbEQ3SHFQM053WUxvSDAwTWNMa3NTQ2E1bHYr?=
 =?utf-8?B?OVJZZXJKRVZwemtPazBXMTVrS1hSM2NjTGVHR0xoMTRNLy9NdnNmMklhN3d4?=
 =?utf-8?B?Wi9HeDQwNXlreEZiZFhrbDJNa2ZyclVGWWxOUm01dCsxeUIvei9GdnFZUlR3?=
 =?utf-8?B?V0l1Z3hqMnk5M3h0SVBXZjNicndCV2hBVmswZVR5MU1JL0lodU5nYmd1cDRj?=
 =?utf-8?B?Mm1jRU5sendVWE9teEpsRGlIOFpFUmtmV1dCaXQrZHBkellzeGtlUVNpTGpW?=
 =?utf-8?B?b21WNFc2ZUowcXJWbktNd2FDRGlpRUdSaHRrWS9LTzIyK3hEZm9MUWtLcFdy?=
 =?utf-8?B?czRTbHZKQnRJMm1HZ2hZcVV1M3RoWVVoSlVwcWdzeG5jSXN6cHhoYlJxM21D?=
 =?utf-8?B?N0tmbmEzbW5wS2RnTUoxVGsvWnFMbEFKSnd6TmxnQ3Z1Qldad1RMbnliZ01m?=
 =?utf-8?B?YXZ1Nm1DK1pNbGhveFZJaUE5SWNZNTY2NHUxU2xydkpRYUhGQmdMWmtLVys2?=
 =?utf-8?B?SkhneHI1SVdvMjR5T09USjlsT0wzZi9yYXBtYUxjMGJKSy9hc2M5RDZhYlpO?=
 =?utf-8?B?bThjMS9ydWRTZENOd3FaYnlVR3BGclg4bnNZUmk1dDZremZXVUtJV0tTcmty?=
 =?utf-8?B?cTdzZlM5anZUYytQc2J5WS9BSXo0V2pJbXExYXVlSHVJUnRZSml2djNmcklq?=
 =?utf-8?B?bGo5MFhBaFJLS2VDRGNnQVdMejRjbEN2Y2ZrVzljbFdybFVCekV3ZTRKY0Jm?=
 =?utf-8?B?bHEzemNXenVjYTRYU2RBTnBKWEQ3WXpnTk0vRks3NkxoWmowZFcreFlmd2Fa?=
 =?utf-8?B?T0JRVUVCUTZ3cFFwQ2crRlEyNTR5dmxWM1NoakJMWXFrYVV6SFNqM2R4SGh6?=
 =?utf-8?B?U3NKNWt1YTFoakdONEJWZmJuakM0NVJJdFg2MU1mUk5NOVJGVTBvTlY0WVhG?=
 =?utf-8?B?ajJlUnhxdVZ0RWtPSGs3ZjF5S2NoQkMvcXI2UEhjZ2Z4dmFxdEZSWGRyOXIv?=
 =?utf-8?B?a2JSbnRYWFVCMmM1OWVMK2tPMUlLWXZCVGZFWlRXRmFEaEVGd1NsNzIvN3Fv?=
 =?utf-8?B?SFA4MFFBUFBCd3NDRnNOYzdMMitPUjV3cytRTys3Z2ZFbHpTSUdnSUE5RWpj?=
 =?utf-8?B?Tm9qeWk3UEtqSithc0dmK1FSMVVuZjV6RTVJdm9hamJxTWkxRmVOZGE4eXFQ?=
 =?utf-8?B?VExrRk5OSDI2VkNSeEQwTXJIZGg4K2lrTVBNWnpxaExEbWVqdmE5dmpFMmVx?=
 =?utf-8?B?eU1kc2FmdmdlZG41N2ZoUHVGdXU1ZitxV3dueHpzaXBDZklpVHhjbm1YSTdh?=
 =?utf-8?B?bkp3Zm54eCtvSm45dDJaQURIUTAyVnUzMXlsdnkzQWRyaEhJdTZPc3ZzYnN1?=
 =?utf-8?B?YjhUWmR2SU05SW14bWhFdmNINk1ncjVqd0ZudGllTDFiTDAvTFZRQVJYTWoz?=
 =?utf-8?B?MnM2bmZzZWpSWFo1SHpodjl1UzRjeEp2TnUzcExFeC82d2hyQStVcWNzYkox?=
 =?utf-8?B?MVVjdTJEYlZTY1NWT0l1Wm5nMVBDRTBSNDdDWGdIRE9lZ2NNYTFrTjVlY2M2?=
 =?utf-8?B?Zzd5NC93ekNYZ1JsMzhGU1p6S0lDV0YyZjhLeTRCUE5mOXRTMDloNlJIRWhG?=
 =?utf-8?B?OGhkbGNKNnozK2ZwZ3JvNzErbjJYLy9UQktUckVFSjU5eG1hajJReUlXQlJZ?=
 =?utf-8?B?a3B5TCtUTmp6bS9Ta2xqSWd1T3RMeG5taHlocTJlK1RMb2pXbkpUOEp4S3pB?=
 =?utf-8?B?NFdEVzN3TkR4UFVtQnQwYzNVTjJTNm5aVnJOUHZnVndwRHRVQnV3OFc3Lys4?=
 =?utf-8?B?RXF0YU5PTndRSDdMQUJzQ3NRVkJ5RmhXN2hFaCtnU28vMFd3SGdvdE95eENF?=
 =?utf-8?B?NXZTYm8rNURoNDhUcFppeFl0OGtNOXE4Ky8wa0J1ZUJBUzZoUTVydThIVk5q?=
 =?utf-8?B?S0djYzIwVnE5L3dxVlNjWm1hazFCa1V5cTVlZmF0WEFSTGQvamlpdXlmbTdz?=
 =?utf-8?B?ayt4citabnNCazBPaVJ2d2c3RHpLQkdCR21zUjFLbXlTMG5Ya3luWHYvUU8r?=
 =?utf-8?B?ejNYLzdVb0tlbU03OXdxNXJjV08vU0s4OGJxY0ZnWFdYSnMyajY4U011Uzds?=
 =?utf-8?Q?y+4lHuu0Qj5aW37zD3bCBQgbZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <631E382FB1C5D74A8A59B6B59663346A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf63ac3-31db-4a7b-8be1-08dc7fcd3867
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 10:50:57.0856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kfCcSuoEjZg6W7iD8m5BSjtjsH2bY6AcbtyLdQVKVYHTlDHfeMc9dDRyNtBrMrydKG7uutenDephrVvv+779Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "anup@brainfault.org" 
 <anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDI0LTA1LTI4IGF0IDEyOjE2IC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBGcmksIE1heSAyNCwgMjAyNCwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+ID4gQEAg
LTE1NDgsNiArMTU0OCw5IEBAIHN0YXRpYyB2b2lkIHN2bV92Y3B1X2xvYWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgY3B1KQ0KPiA+ID4gICAJc3RydWN0IHZjcHVfc3ZtICpzdm0gPSB0b19z
dm0odmNwdSk7DQo+ID4gPiAgIAlzdHJ1Y3Qgc3ZtX2NwdV9kYXRhICpzZCA9IHBlcl9jcHVfcHRy
KCZzdm1fZGF0YSwgY3B1KTsNCj4gPiA+ICsJaWYgKHZjcHUtPnNjaGVkdWxlZF9vdXQgJiYgIWt2
bV9wYXVzZV9pbl9ndWVzdCh2Y3B1LT5rdm0pKQ0KPiA+ID4gKwkJc2hyaW5rX3BsZV93aW5kb3co
dmNwdSk7DQo+ID4gPiArDQo+ID4gDQo+ID4gWy4uLl0NCj4gPiANCj4gPiA+IEBAIC0xNTE3LDYg
KzE1MTcsOSBAQCB2b2lkIHZteF92Y3B1X2xvYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQg
Y3B1KQ0KPiA+ID4gICB7DQo+ID4gPiAgIAlzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2
Y3B1KTsNCj4gPiA+ICsJaWYgKHZjcHUtPnNjaGVkdWxlZF9vdXQgJiYgIWt2bV9wYXVzZV9pbl9n
dWVzdCh2Y3B1LT5rdm0pKQ0KPiA+ID4gKwkJc2hyaW5rX3BsZV93aW5kb3codmNwdSk7DQo+ID4g
PiArDQo+ID4gDQo+ID4gTml0OiAgUGVyaGFwcyB3ZSBuZWVkIGEga3ZtX3g4Nl9vcHM6OnNocmlu
a19wbGVfd2luZG93KCk/ICA6LSkNCj4gDQo+IEhlaCwgdGhhdCBkdXBsaWNhdGUgY29kZSBhbm5v
eXMgbWUgdG9vLiAgVGhlIHByb2JsZW0gaXMgdGhlICJvbGQiIHdpbmRvdyB2YWx1ZQ0KPiBjb21l
cyBmcm9tIHRoZSBWTUNTL1ZNQ0IsIHNvIGVpdGhlciB3ZSdkIGVuZCB1cCB3aXRoIG11bHRpcGxl
IGt2bV94ODZfb3BzLCBvcg0KPiB3ZSdkIG9ubHkgYmUgYWJsZSB0byBjb25zb2xpZGF0ZSB0aGUg
c2NoZWR1bGVkX291dCArIGt2bV9wYXVzZV9pbl9ndWVzdCgpIGNvZGUsDQo+IHdoaWNoIGlzbid0
IGFsbCB0aGF0IGludGVyZXN0aW5nLg0KDQpBZ3JlZWQgb25seSBjb25zb2xpZGF0aW5nIHNjaGVk
dWxlZF9vdXQgKyBrdm1fcGF1c2VfaW5fZ3Vlc3QoKSBpc24ndCBxdWl0ZQ0KaW50ZXJlc3Rpbmcu
DQoNCj4gDQo+IEFoYSEgIEFjdHVhbGx5LCBWTVggYWxyZWFkeSBvcGVuIGNvZGVzIHRoZSBmdW5j
dGlvbmFsaXR5IHByb3ZpZGVkIGJ5IFZDUFVfRVhSRUdfKiwNCj4gZS5nLiBoYXMgdm14LT5wbGVf
d2luZG93X2RpcnR5LiAgSWYgd2UgYWRkIFZDUFVfRVhSRUdfUExFX1dJTkRPVywgdGhlbiB0aGUg
aW5mbw0KPiBnZXQgYmUgbWFkZSBhdmFpbGFibGUgdG8gY29tbW9uIHg4NiBjb2RlIHdpdGhvdXQg
aGF2aW5nIHRvIGFkZCBuZXcgaG9va3MuICBBbmQNCj4gdGhhdCB3b3VsZCBhbHNvIGFsbG93IG1v
dmluZyB0aGUgZ3V0cyBvZiBoYW5kbGVfcGF1c2UoKS9wYXVzZV9pbnRlcmNlcHRpb24oKSB0bw0K
PiBjb21tb24gY29kZSwgaS5lLiB3aWxsIGFsc28gYWxsb3cgZGVkdXBsaWNhdGluZyB0aGUgImdy
b3ciIHNpZGUgb2YgdGhpbmdzLg0KDQpTb3VuZHMgZmVhc2libGUuICBJIGFtIG5vdCBzdXJlIHdo
ZXRoZXIgd2Ugc2hvdWxkIHVzZQ0KVkNQVV9FWFJFR19QTEVfV0lORE9XLCB0aG91Z2guICBXZSBj
YW4ganVzdCBoYXZlICJwbGVfd2luZG93IiArDQoicGxlX3dpbmRvd19kaXJ0eSIgY29uY2VwdCBp
biB0aGUgdmNwdToNCg0KCXZjcHUtPnBsZV93aW5kb3c7DQoJdmNwdS0+cGxlX3dpbmRvd19kaXJ0
eTsNCg0KSS5lLiwga2luZGEgbWFrZSBjdXJyZW50IFZNWCdzIHZlcnNpb24gb2Yge2dyb3d8c2hy
aW5rfV9wbGVfd2luZG93KCkgYXMNCmNvbW1vbiBjb2RlLiANCg0KSSBhbSBub3QgZmFtaWxpYXIg
d2l0aCBTVk0sIGJ1dCBpdCBzZWVtcyB0aGUgcmVsZXZhbnQgcGFydHMgYXJlOg0KDQoJY29udHJv
bC0+cGF1c2VfZmlsdGVyX2NvdW50Ow0KCXZtY2JfbWFya19kaXJ0eShzdm0tPnZtY2IsIFZNQ0Jf
SU5URVJDRVBUUyk7DQoNCkFuZCBpdCBzZWVtcyB0aGV5IGFyZSBkaXJlY3RseSByZWxhdGVkIHRv
IHByb2dyYW1taW5nIHRoZSBoYXJkd2FyZSwgaS5lLiwNCnRoZXkgZ290IGF1dG9tYXRpY2FsbHkg
bG9hZGVkIHRvIGhhcmR3YXJlIGR1cmluZyBWTVJVTi4NCg0KVGhleSBuZWVkIHRvIGJlIHVwZGF0
ZWQgaW4gdGhlIFNWTSBzcGVjaWZpYyBjb2RlIHdoZW4gQHBsZV93aW5kb3dfZGlydHkgaXMNCnRy
dWUgaW4gdGhlIHJlbGV2YW50IGNvZGUgcGF0aC4NCg0KQW55d2F5LCBldmVuIGl0IGlzIGZlYXNp
YmxlIGFuZCB3b3J0aCB0byBkbywgd2Ugc2hvdWxkIGRvIGluIGEgc2VwYXJhdGUNCnBhdGNoc2V0
Lg0KDQo=
