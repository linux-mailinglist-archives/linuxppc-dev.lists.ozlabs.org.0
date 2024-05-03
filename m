Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5968BAB68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 13:11:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btbZIVqn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW7Qd4kDzz3dBH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 21:11:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btbZIVqn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW7Pq5F0sz3cZ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 21:10:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714734624; x=1746270624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=StZknxjRQXESSe4yzpvG8862rPX16COBTCWJG24Y4YA=;
  b=btbZIVqn40OQypoOMMnhfyrr4w8ZV6PLvN0TZLpz5ksbmsJbjqpJ5UoQ
   vu23KurufoTAlH0FTCnNGFe9URiBkfVrA1iEGIgJMJ3V6vG5NMwlf78Ze
   H/vvigjJzj5RkZIXXwJZsxyvYnqcQuv87Er3C6M4t9F8mSqXwqEQ2mT/v
   TsVaJDVyRl1ctqRsWgpfAuQ4PD9eBCFrOdcmjv5gMPNSB8BMdsBWxwFUW
   00d7n0jg5O38DF89kOQ+Lf++bodnfZARCG0tAZuesbaR3K4cigeVIBf8/
   lNqVJxjyjelB7vYSRjflpL8h78Fob5CydSCLIY4m1tbwv2hlQwH0UsqZC
   Q==;
X-CSE-ConnectionGUID: oCnqOhrnQxu1bLYNBecoWA==
X-CSE-MsgGUID: C9rzP5hnT/CQjbYcS2d21A==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21692099"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21692099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 04:10:19 -0700
X-CSE-ConnectionGUID: 53pSUduBQYGXu2kDOlik7A==
X-CSE-MsgGUID: B+9vPks3SXua0KTd21E7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27308164"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 May 2024 04:10:19 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 04:10:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 04:10:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 04:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmojjQvsO1gZBzl1TZFrKXceWK2nNYiYpuJsEYnn/kQdkNmuWoqiHFPAAHmHz1e42KVcqVHIh1j6qHCUES6SSuYw0qK9hZai7HcaDJsbK6n3LOVf+6f+mKnMcnTmRdNKKfrc7ixorf6vEAbQmZjTQrWgsBtyRx9kRdVW4KFUvN+Jr81k41vsGQsSCnNk2QX/DG2I3wkWwJED/2gxJF99VZ89QmQ7dV8ISwFuusGV5BzNCaZxmGrPoXw5b+/LYXjIO5kSRXcLmSmIRK06FY9SglVXq8s2B6Y2OwKgiQGdzMWCHoFhix4zQMhkXZ0LPnPKcshu4fWtW49NtTlKLm26EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StZknxjRQXESSe4yzpvG8862rPX16COBTCWJG24Y4YA=;
 b=nK4Nfg53yZhZBRUqyaV5Z1AcnCai/1htHW2FZ1TSQscsreQYMrPijWFZ07dKR/0vBlBRkduOYb9Wvx23jeQP+ypZtgG4r5lB8QYUy9CeO8TijbnVcHVrgdqxWTIwrYW9j+geYfHNTHVAY9BuDPAWhw12RHlhuQoIFRCRmaiC2pDX/KFAVPqqRvxeuIxo6pbopN2FC9Y7PYwU+2GL2v95zBs3e/yozDvE3xdCfJovmj56YCizf3VV4jKolqGCrUoh+CgBxdTYII1HFs0NyztpuF4Jw7nYuljGLSm4PqgBuk0p2l5oXpHbAEGDnGgrOuTKAmS0IdbKOmDOkgpJVmoolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by SN7PR11MB8044.namprd11.prod.outlook.com (2603:10b6:806:2ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Fri, 3 May
 2024 11:10:15 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129%7]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 11:10:15 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: RE: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Topic: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Index: AQHakI7e85jyDjVvVkqdnwboxKPALbF0f7+AgACn2ICABaA4AIACRenwgAVWMICAAAhbgA==
Date: Fri, 3 May 2024 11:10:15 +0000
Message-ID: <SJ0PR11MB67442AD841FAE2C224BC6313921F2@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
	<20240417061407.1491361-2-zhenzhong.duan@intel.com>
	<20240422171629.00005675@Huawei.com>
	<SJ0PR11MB6744EC971D1BE6F3119EEA9992112@SJ0PR11MB6744.namprd11.prod.outlook.com>
	<20240426171158.000024d4@Huawei.com>
	<SJ0PR11MB6744C3EAA6E9D738EA0D3BAC92142@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <20240501132429.00002b4a@Huawei.com>
In-Reply-To: <20240501132429.00002b4a@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|SN7PR11MB8044:EE_
x-ms-office365-filtering-correlation-id: 863256fc-7966-49f6-a7f2-08dc6b619be7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?ZzlJaW1sN1orSkpKU3ZFa3Z4WjE3ekZ3SGRPNG9zUTJmTUdqeUpURVphL2gx?=
 =?utf-8?B?cHpqQTBDdjlYYUVibWg0b2g1UXF0MnBKbWJPbnlOVHMzeWJiUklaVENaK1ZV?=
 =?utf-8?B?QzF3RytvNkxDQUtiNkkyTG1weEs1YTJMZ2EwTlJVcy9zNHZ3Wk5HYzl5TS9z?=
 =?utf-8?B?MjFoRTJ3cUR5SDk2QlkrMjZxdmFxc3lscDk5U1BqYVI1VmpBUGdLSEF6SlZU?=
 =?utf-8?B?bldyendWOGI3M2lwVXZHWk5GT01nSmR0Z3Q0MEwzSkQ5ZWFmWmdYUlIySmNM?=
 =?utf-8?B?VDJja3pQN1V3UWJDeG8yMVQwU1ZSU2h2RWpxVk5Sd3FreGRWZ3dCUldoM2Ja?=
 =?utf-8?B?MHA4UlJOZ2FuSE4zY1JlVmVGc2RkOXZ4S3BON1UydjZIU04rVlZwNCtjMndl?=
 =?utf-8?B?c2ZiRTRKMzdsajIyNTZvbXdYSXdHNUVLdEx3UWt6QmcrTHJPVmhWbDd4MjNV?=
 =?utf-8?B?S01IN1I4aGwvWlZzR0FWNmYrNGlwbDUvVndWa3dtWmwxaURZclZZcHJnUmsx?=
 =?utf-8?B?QmloT2ZDb1pVT09rVWNydTJaUUVneEJFSnFqS3pzakNGc2E1YmdHT1EzcGh1?=
 =?utf-8?B?Y0EvcXhtZFQrcDN0dUdKQzlHMy9MSjIxWU5FTVhSRVpYMmVHY3k5MWwxWFF4?=
 =?utf-8?B?VTRzMk1oZ0swclFsNjUyWUlWaEIwUVhFZzVGUHRmNTkwd01vVEJHNWhGQ3dG?=
 =?utf-8?B?WGZlNlNMOEUxeWVFRkdpWkpEZSt4ZE8zRG5wREY2QjhQNXRRWmN5K2RaNEt1?=
 =?utf-8?B?MDJua0VuTm52dnc0c3VndEdxZzFFYmN5blFkaGNLUmJhTVF0VURRLy9BV0tY?=
 =?utf-8?B?dWlWMWM4MVJuTVUyeG5vRStZK1l0L0tnQnlRMnFvZ1NkY0FKUTg4ZU00MUhy?=
 =?utf-8?B?RjBNaHpLVDJ6MDlXSytRcEJaa1pBcmJyVTEvNXZZM2RtNHZLQ0lqS2NjZmVz?=
 =?utf-8?B?TkFUYTU3NGFWQTkva0k5cGg3U3d0dnhKYWlNR2orVUF3bWVTU1dyc0JFSTM3?=
 =?utf-8?B?clhaNFFFZzg1YjRraW1GaXgzRnUyQ1QydUttdHEySndaNFdIai9DeHJWbm1Q?=
 =?utf-8?B?UURGOEpoRFVaZ1FUTm1BM1pLSmhaQmVUUXhVeTBOSWpvYWJRelR5bVJFQTkx?=
 =?utf-8?B?RUNPM3kwQk9uQ1FSaGt6R3RwZVgrWDlUdU83dytER2V6WVN3eWJMK2xPYVV5?=
 =?utf-8?B?anl6VUt1VG9qOFQrWDUrM0IraWY4ek9icEdLQjMrVzNySWNwazltT1BvTit0?=
 =?utf-8?B?OENTV3ZvZ1VCbmdCMU9GT3pNZlUweXZWWkswOWo3NlpGdGIvZFphSjAwYmdF?=
 =?utf-8?B?TG9xVHJXZUQ2dWROMHFyVDRweUFkU1gxbXdpS3gvRWtiNjVrS2o4OVRMYU14?=
 =?utf-8?B?NFlqVHVIK3dCa3h2bW1OMzJnNURBRXFjUm9YQTZiWmdOdVp5eEpZZnpKME5y?=
 =?utf-8?B?MFNXM1o0dkkxZHVTc0cxMDN1bHhUYklqSTFuSnhkRFBMMjZMN0NFeVRoZ1BR?=
 =?utf-8?B?amVnVUgzNzUyeFpJUEFXRkNvVjNmSXF6a3o4V2ROTHhpUVJ0SUpnYW5WcXhL?=
 =?utf-8?B?ay93N05vYXlTUm81ejNSMkUraldadTd2bmNDZkdPZ2RPNGVRcWNGTGEzaFJJ?=
 =?utf-8?B?UTRHZmZoVDNoam5zckUvaVF0VFJITC85RHVkRkFXSUdWdHFkVjloQUVWems3?=
 =?utf-8?B?UHF4NEtPbFpLT1R6UmJXbkhHQnZxNnQ1VnNzY0JlUU03Ym5kaGV4Q1Z6dTNC?=
 =?utf-8?B?UHBuUjd5YnArdGVadm4ybFU3ckZVSGFQZGNldFpvQzVzSnJ2U2ErMFdQa1k1?=
 =?utf-8?B?N29hcWo0RmJYR2Y0SlluZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG5aS2ZiektKbU8xR0FaZ2c5WEpNbmsxRUE0QytndFk4V3J0dHByZ2JPcmpt?=
 =?utf-8?B?eHRmZFdwWSt4eGZ5bjhidllHRzQzUGJBWkx4WGRMZlJDZE1DQ1N1Um9qQXNu?=
 =?utf-8?B?bmJkeCtrNUE3SzBsNlppdlUxL3hJZFAvOVhoUUd4WGl0MHRnVUN5VURSYWY3?=
 =?utf-8?B?TXVIcDNkYVNSc2VhTnZCeUlzNGJmS093REVRQmhMVi8vMHRIckZEcmp2a096?=
 =?utf-8?B?MFlRQ1VCU3RNdUlMV0x5eU9kb0VNVmV6TDJGWVZaYVFlUGlKRnQ3NGFIUEt6?=
 =?utf-8?B?ZGlpU0EraitMRnZLT0ppTFFFQUFLR0tSN0cvaDUvZkh3NnRkZCtSVnpKU0Q3?=
 =?utf-8?B?eXROc0l2MFc5VWsvSi9ueVZyQ3FGbHFJMms4eFNFRnM3WDRZejlrMUJWbFJS?=
 =?utf-8?B?UXJVcm1waE1HcUNpM2dyL2hseGdOVWxjOVJUdkhpWnRTRjBMUTlCQ1VmSk4r?=
 =?utf-8?B?YnJEdGpRUm5iakNDWXkzSlVnbE9uMzNaNXNGSm5yNzZiQk5jclRHSmxHUjkx?=
 =?utf-8?B?aFp2dk9iODlZZ3ZScEMrVXBMUW83Wngxb2JqVkNldDhsSEgvbGlkbWNwOXkr?=
 =?utf-8?B?TWR5UkZ5RDRJSW1CUnF1NkZLdGVJUUJDWnIxS3B3bFdDaThLaTdkVkpKOFpa?=
 =?utf-8?B?dWxvcjkwVitGVVZ2QklyUG0wYThiS042RDNxbmtqdHBrS0JzMkJYbTBHZmNZ?=
 =?utf-8?B?OWI1WWhqbWhSYkd2OXB4QWdobVN3aWxSdGNCQ0hySE9IVkxXeEdlVmxKYXlX?=
 =?utf-8?B?MHFscGdseUp2MXYyT1BJYnJOTjFBU3o1UHhqeDJRbWtKQUVWaFRRR0RSL0xu?=
 =?utf-8?B?dWFpcWJESkZoaVR0ZVFzWGNPL2F1N1RNRUNRdXpodThuckdhWEpMVjhGemlG?=
 =?utf-8?B?dWUrbnJZcnJKMVlZeW42RThhRUVscTBLUlVNQnpsTFpSaTJYV2tUZmRrbG44?=
 =?utf-8?B?YWxSQ1MvUE9XZzd5ZjZEdFpsNlZBUmJjMW5kY0RXNFRHdEx5MUlhWjU0ZTNQ?=
 =?utf-8?B?eUVRUWhkbFBXdnNZMjI1aGVpRDdUVVNRR1hmZmR5cjQ5aGNwZXZMcjBiR0Z3?=
 =?utf-8?B?bFFNS0JaUGl1eG1pamlIckRQem0rRjlzTTVZV09qTC9VYkV3R1dleS9zZ09R?=
 =?utf-8?B?RWloTkNPaU1tY3NBeWpITVg2aUFLNG1sdlVGSWUxcjBhQk04dng0UnY2VVhI?=
 =?utf-8?B?Q2daY2hmSTVBVmJpWUVsZnVGS2wvM0E0akpXZnRjN0ZPcTFXcHp5bG9wbHBp?=
 =?utf-8?B?RnY0VjcxSzhYWUM0T2t3SCtqMWV5VzU1V2UzWDBEeW1zakRkdlMwTlFpVnZp?=
 =?utf-8?B?dXYrbkVqR3dnU2pBSGc5Mk03UTh5S3pkcDFwN0x4RmtqcUNwSHpPdGF5MXR4?=
 =?utf-8?B?Y3dMbDQrWUFYK082bGhWenJRRXZvZllwVmV3UFJEd1NHYy90WDk3L3hiVzlt?=
 =?utf-8?B?V3pPTjlvVHBEaks1VFE3QllGTC9PVFVPRlFRaGRub2xzaC9QbmMrNHA5V0dI?=
 =?utf-8?B?bm1OZEI5bHdSQ0ZFVm1HQ1hOYTVQTVZhZE44TnMrcDRaN1Q3TXVjQUJTWmNB?=
 =?utf-8?B?dU04Qm9UdXRud3BTL0hHcXNXc0hKZjU0eVNjTVNHRWd2bER2dGNhNWdDTG9W?=
 =?utf-8?B?Zks2ZFBlRFpvUEtyVzRQWVd3OUx3eFd2VElZNFlVekgzV0ZmTUdCV2Ruem5V?=
 =?utf-8?B?WDJ1WEJneFUrc0ZieFdvOVlJUzljL284bjZ0NEJmSXk0Q0pkemQ1c09pK2NZ?=
 =?utf-8?B?TlZRK1Y0T0Z5alpidW8vbE5MYlA2QVBvVG04bnpyWWdJSTJSTG5IeHZnSzQ5?=
 =?utf-8?B?ZkQ0azlkbUF3VXZlaG1EOHBGV0FvZ05wOUdrNnV6d2hERWs4UStUdUt0dUJK?=
 =?utf-8?B?SVZ4VEc2Z09MblYxNnd4TndjT3g1WUdVNzE2blB4Z0lrVlVmYkh3SytVKzl2?=
 =?utf-8?B?RGtlUXpId1NSYk0zM0tMc1I0VXJXVDZhZWw5RjZ6QjVYRTJsZWl0Skt0UXVS?=
 =?utf-8?B?Wm5lajJySXQvb3Q3akFzbGVsOVQzby9KVVZsZ3JBdXpMTGgrNndQYlBRK3Zp?=
 =?utf-8?B?eWdvdXVQdHBNNEVzN1BYVi9LUlpjT3FHeGYyZGhCYnd6RExPNDkwaDZ0M0xl?=
 =?utf-8?Q?9Nm9VagLzQB7Tme4racu4Nlti?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863256fc-7966-49f6-a7f2-08dc6b619be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 11:10:15.1398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/h6DmGF3t9WhBXlLZuMf1EWv05xaIPYBaF2Y4AxijsAiUVTwJa/QWrkbOHkutjouvmINFs6v6YzmQi6teoHIp25VblGspava5CBMvvSV3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8044
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield,
 Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.
 com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEpvbmF0aGFuIENhbWVyb24g
PEpvbmF0aGFuLkNhbWVyb25ASHVhd2VpLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIIHYzIDEv
M10gUENJL0FFUjogU3RvcmUgVU5DT1JfU1RBVFVTIGJpdHMgdGhhdCBtaWdodA0KPmJlIEFORkUg
aW4gYWVyX2Vycl9pbmZvDQo+DQo+T24gU3VuLCAyOCBBcHIgMjAyNCAwMzozMToxMSArMDAwMA0K
PiJEdWFuLCBaaGVuemhvbmciIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+IHdyb3RlOg0KPg0K
Pj4gSGkgSm9uYXRoYW4sDQo+Pg0KPj4gPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+
RnJvbTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBIdWF3ZWkuY29tPg0KPj4g
PlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSBQQ0kvQUVSOiBTdG9yZSBVTkNPUl9TVEFUVVMg
Yml0cyB0aGF0DQo+bWlnaHQNCj4+ID5iZSBBTkZFIGluIGFlcl9lcnJfaW5mbw0KPj4gPg0KPj4g
Pk9uIFR1ZSwgMjMgQXByIDIwMjQgMDI6MjU6MDUgKzAwMDANCj4+ID4iRHVhbiwgWmhlbnpob25n
IiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPiB3cm90ZToNCj4+ID4NCj4+ID4+ID4tLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gPj4gPkZyb206IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0
aGFuLkNhbWVyb25ASHVhd2VpLmNvbT4NCj4+ID4+ID5TdWJqZWN0OiBSZTogW1BBVENIIHYzIDEv
M10gUENJL0FFUjogU3RvcmUgVU5DT1JfU1RBVFVTIGJpdHMgdGhhdA0KPj4gPm1pZ2h0DQo+PiA+
PiA+YmUgQU5GRSBpbiBhZXJfZXJyX2luZm8NCj4+ID4+ID4NCj4+ID4+ID5PbiBXZWQsIDE3IEFw
ciAyMDI0IDE0OjE0OjA1ICswODAwDQo+PiA+PiA+Wmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5k
dWFuQGludGVsLmNvbT4gd3JvdGU6DQo+PiA+PiA+DQo+PiA+PiA+PiBJbiBzb21lIGNhc2VzIHRo
ZSBkZXRlY3RvciBvZiBhIE5vbi1GYXRhbCBFcnJvcihORkUpIGlzIG5vdCB0aGUgbW9zdA0KPj4g
Pj4gPj4gYXBwcm9wcmlhdGUgYWdlbnQgdG8gZGV0ZXJtaW5lIHRoZSB0eXBlIG9mIHRoZSBlcnJv
ci4gRm9yIGV4YW1wbGUsDQo+PiA+PiA+PiB3aGVuIHNvZnR3YXJlIHBlcmZvcm1zIGEgY29uZmln
dXJhdGlvbiByZWFkIGZyb20gYSBub24tZXhpc3RlbnQNCj4+ID4+ID4+IGRldmljZSBvciBGdW5j
dGlvbiwgY29tcGxldGVyIHdpbGwgc2VuZCBhbiBFUlJfTk9ORkFUQUwgTWVzc2FnZS4NCj4+ID4+
ID4+IE9uIHNvbWUgcGxhdGZvcm1zLCBFUlJfTk9ORkFUQUwgcmVzdWx0cyBpbiBhIFN5c3RlbSBF
cnJvciwgd2hpY2gNCj4+ID4+ID4+IGJyZWFrcyBub3JtYWwgc29mdHdhcmUgcHJvYmluZy4NCj4+
ID4+ID4+DQo+PiA+PiA+PiBBZHZpc29yeSBOb24tRmF0YWwgRXJyb3IoQU5GRSkgaXMgYSBzcGVj
aWFsIGNhc2UgdGhhdCBjYW4gYmUgdXNlZA0KPj4gPj4gPj4gaW4gYWJvdmUgc2NlbmFyaW8uIEl0
IGlzIHByZWRvbWluYW50bHkgZGV0ZXJtaW5lZCBieSB0aGUgcm9sZSBvZiB0aGUNCj4+ID4+ID4+
IGRldGVjdGluZyBhZ2VudCAoUmVxdWVzdGVyLCBDb21wbGV0ZXIsIG9yIFJlY2VpdmVyKSBhbmQg
dGhlIHNwZWNpZmljDQo+PiA+PiA+PiBlcnJvci4gSW4gc3VjaCBjYXNlcywgYW4gYWdlbnQgd2l0
aCBBRVIgc2lnbmFscyB0aGUgTkZFIChpZiBlbmFibGVkKQ0KPj4gPj4gPj4gYnkgc2VuZGluZyBh
biBFUlJfQ09SIE1lc3NhZ2UgYXMgYW4gYWR2aXNvcnkgdG8gc29mdHdhcmUsIGluc3RlYWQNCj5v
Zg0KPj4gPj4gPj4gc2VuZGluZyBFUlJfTk9ORkFUQUwuDQo+PiA+PiA+Pg0KPj4gPj4gPj4gV2hl
biBwcm9jZXNzaW5nIGFuIEFORkUsIGlkZWFsbHkgYm90aCBjb3JyZWN0YWJsZSBlcnJvcihDRSkg
c3RhdHVzDQo+YW5kDQo+PiA+PiA+PiB1bmNvcnJlY3RhYmxlIGVycm9yKFVFKSBzdGF0dXMgc2hv
dWxkIGJlIGNsZWFyZWQuIEhvd2V2ZXIsIHRoZXJlIGlzDQo+bm8NCj4+ID4+ID4+IHdheSB0byBm
dWxseSBpZGVudGlmeSB0aGUgVUUgYXNzb2NpYXRlZCB3aXRoIEFORkUuIEV2ZW4gd29yc2UsIGEN
Cj5GYXRhbA0KPj4gPj4gPj4gRXJyb3IoRkUpIG9yIE5vbi1GYXRhbCBFcnJvcihORkUpIG1heSBz
ZXQgdGhlIHNhbWUgVUUgc3RhdHVzIGJpdCBhcw0KPj4gPj4gPj4gQU5GRS4gVHJlYXRpbmcgYW4g
QU5GRSBhcyBORkUgd2lsbCByZXByb2R1Y2UgYWJvdmUgbWVudGlvbmVkDQo+aXNzdWUsDQo+PiA+
PiA+PiBpLmUuLCBicmVha2luZyBzb2Z0d29yZSBwcm9iaW5nOyB0cmVhdGluZyBORkUgYXMgQU5G
RSB3aWxsIG1ha2UgdXMNCj4+ID4+ID4+IGlnbm9yaW5nIHNvbWUgVUVzIHdoaWNoIG5lZWQgYWN0
aXZlIHJlY292ZXIgb3BlcmF0aW9uLiBUbyBhdm9pZA0KPj4gPmNsZWFyaW5nDQo+PiA+PiA+PiBV
RXMgdGhhdCBhcmUgbm90IEFORkUgYnkgYWNjaWRlbnQsIHRoZSBtb3N0IGNvbnNlcnZhdGl2ZSBy
b3V0ZSBpcw0KPnRha2VuDQo+PiA+PiA+PiBoZXJlOiBJZiBhbnkgb2YgdGhlIEZFL05GRSBEZXRl
Y3RlZCBiaXRzIGlzIHNldCBpbiBEZXZpY2UgU3RhdHVzLCBkbw0KPm5vdA0KPj4gPj4gPj4gdG91
Y2ggVUUgc3RhdHVzLCB0aGV5IHNob3VsZCBiZSBjbGVhcmVkIGxhdGVyIGJ5IHRoZSBVRSBoYW5k
bGVyLg0KPj4gPk90aGVyd2lzZSwNCj4+ID4+ID4+IGEgc3BlY2lmaWMgc2V0IG9mIFVFcyB0aGF0
IG1heSBiZSByYWlzZWQgYXMgQU5GRSBhY2NvcmRpbmcgdG8gdGhlDQo+UENJZQ0KPj4gPj4gPj4g
c3BlY2lmaWNhdGlvbiB3aWxsIGJlIGNsZWFyZWQgaWYgdGhlaXIgY29ycmVzcG9uZGluZyBzZXZl
cml0eSBpcyBOb24tDQo+RmF0YWwuDQo+PiA+PiA+Pg0KPj4gPj4gPj4gVG8gYWNoaWV2ZSBhYm92
ZSBwdXJwb3NlLCBzdG9yZSBVTkNPUl9TVEFUVVMgYml0cyB0aGF0IG1pZ2h0IGJlDQo+PiA+QU5G
RQ0KPj4gPj4gPj4gaW4gYWVyX2Vycl9pbmZvLmFuZmVfc3RhdHVzLiBTbyB0aGF0IHRob3NlIGJp
dHMgY291bGQgYmUgcHJpbnRlZCBhbmQNCj4+ID4+ID4+IHByb2Nlc3NlZCBsYXRlci4NCj4+ID4+
ID4+DQo+PiA+PiA+PiBUZXN0ZWQtYnk6IFl1ZG9uZyBXYW5nIDx5dWRvbmcud2FuZ0BpbnRlbC5j
b20+DQo+PiA+PiA+PiBDby1kZXZlbG9wZWQtYnk6ICJXYW5nLCBRaW5nc2h1biINCj48cWluZ3No
dW4ud2FuZ0BsaW51eC5pbnRlbC5jb20+DQo+PiA+PiA+PiBTaWduZWQtb2ZmLWJ5OiAiV2FuZywg
UWluZ3NodW4iIDxxaW5nc2h1bi53YW5nQGxpbnV4LmludGVsLmNvbT4NCj4+ID4+ID4+IFNpZ25l
ZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQo+PiA+
PiA+PiAtLS0NCj4+ID4+ID4+ICBkcml2ZXJzL3BjaS9wY2kuaCAgICAgIHwgIDEgKw0KPj4gPj4g
Pj4gIGRyaXZlcnMvcGNpL3BjaWUvYWVyLmMgfCA0NQ0KPj4gPj4gPisrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gPj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgNDYg
aW5zZXJ0aW9ucygrKQ0KPj4gPj4gPj4NCj4+ID4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9wY2kuaCBiL2RyaXZlcnMvcGNpL3BjaS5oDQo+PiA+PiA+PiBpbmRleCAxN2ZlZDE4NDY4NDcu
LjNmOWViODA3ZjlmZCAxMDA2NDQNCj4+ID4+ID4+IC0tLSBhL2RyaXZlcnMvcGNpL3BjaS5oDQo+
PiA+PiA+PiArKysgYi9kcml2ZXJzL3BjaS9wY2kuaA0KPj4gPj4gPj4gQEAgLTQxMiw2ICs0MTIs
NyBAQCBzdHJ1Y3QgYWVyX2Vycl9pbmZvIHsNCj4+ID4+ID4+DQo+PiA+PiA+PiAgCXVuc2lnbmVk
IGludCBzdGF0dXM7CQkvKiBDT1IvVU5DT1IgRXJyb3IgU3RhdHVzDQo+Ki8NCj4+ID4+ID4+ICAJ
dW5zaWduZWQgaW50IG1hc2s7CQkvKiBDT1IvVU5DT1IgRXJyb3IgTWFzayAqLw0KPj4gPj4gPj4g
Kwl1bnNpZ25lZCBpbnQgYW5mZV9zdGF0dXM7CS8qIFVOQ09SIEVycm9yIFN0YXR1cyBmb3INCj5B
TkZFICovDQo+PiA+PiA+PiAgCXN0cnVjdCBwY2llX3RscF9sb2cgdGxwOwkvKiBUTFAgSGVhZGVy
ICovDQo+PiA+PiA+PiAgfTsNCj4+ID4+ID4+DQo+PiA+PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvcGNpZS9hZXIuYyBiL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMNCj4+ID4+ID4+IGluZGV4
IGFjNjI5M2MyNDk3Ni4uMjczNjRhYjRiMTQ4IDEwMDY0NA0KPj4gPj4gPj4gLS0tIGEvZHJpdmVy
cy9wY2kvcGNpZS9hZXIuYw0KPj4gPj4gPj4gKysrIGIvZHJpdmVycy9wY2kvcGNpZS9hZXIuYw0K
Pj4gPj4gPj4gQEAgLTEwNyw2ICsxMDcsMTIgQEAgc3RydWN0IGFlcl9zdGF0cyB7DQo+PiA+PiA+
Pg0KPglQQ0lfRVJSX1JPT1RfTVVMVElfQ09SX1JDViB8DQo+PiA+PiA+CVwNCj4+ID4+ID4+DQo+
CVBDSV9FUlJfUk9PVF9NVUxUSV9VTkNPUl9SQ1YpDQo+PiA+PiA+Pg0KPj4gPj4gPj4gKyNkZWZp
bmUgQUVSX0VSUl9BTkZFX1VOQ19NQVNLDQo+PiA+PiA+CShQQ0lfRVJSX1VOQ19QT0lTT05fVExQ
IHwJXA0KPj4gPj4gPj4gKwkJCQkJUENJX0VSUl9VTkNfQ09NUF9USU1FIHwNCj4+ID4+ID4JXA0K
Pj4gPj4gPj4gKwkJCQkJUENJX0VSUl9VTkNfQ09NUF9BQk9SVA0KPnwNCj4+ID4+ID4JXA0KPj4g
Pj4gPj4gKwkJCQkJUENJX0VSUl9VTkNfVU5YX0NPTVAgfA0KPj4gPj4gPglcDQo+PiA+PiA+PiAr
CQkJCQlQQ0lfRVJSX1VOQ19VTlNVUCkNCj4+ID4+ID4+ICsNCj4+ID4+ID4+ICBzdGF0aWMgaW50
IHBjaWVfYWVyX2Rpc2FibGU7DQo+PiA+PiA+PiAgc3RhdGljIHBjaV9lcnNfcmVzdWx0X3QgYWVy
X3Jvb3RfcmVzZXQoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiA+PiA+Pg0KPj4gPj4gPj4gQEAg
LTExOTYsNiArMTIwMiw0MSBAQCB2b2lkIGFlcl9yZWNvdmVyX3F1ZXVlKGludCBkb21haW4sDQo+
PiA+dW5zaWduZWQNCj4+ID4+ID5pbnQgYnVzLCB1bnNpZ25lZCBpbnQgZGV2Zm4sDQo+PiA+PiA+
PiAgRVhQT1JUX1NZTUJPTF9HUEwoYWVyX3JlY292ZXJfcXVldWUpOw0KPj4gPj4gPj4gICNlbmRp
Zg0KPj4gPj4gPj4NCj4+ID4+ID4+ICtzdGF0aWMgdm9pZCBhbmZlX2dldF91Y19zdGF0dXMoc3Ry
dWN0IHBjaV9kZXYgKmRldiwgc3RydWN0DQo+PiA+YWVyX2Vycl9pbmZvDQo+PiA+PiA+KmluZm8p
DQo+PiA+PiA+PiArew0KPj4gPj4gPj4gKwl1MzIgdW5jb3JfbWFzaywgdW5jb3Jfc3RhdHVzOw0K
Pj4gPj4gPj4gKwl1MTYgZGV2aWNlX3N0YXR1czsNCj4+ID4+ID4+ICsJaW50IGFlciA9IGRldi0+
YWVyX2NhcDsNCj4+ID4+ID4+ICsNCj4+ID4+ID4+ICsJaWYgKHBjaWVfY2FwYWJpbGl0eV9yZWFk
X3dvcmQoZGV2LCBQQ0lfRVhQX0RFVlNUQSwNCj4+ID4+ID4mZGV2aWNlX3N0YXR1cykpDQo+PiA+
PiA+PiArCQlyZXR1cm47DQo+PiA+PiA+PiArCS8qDQo+PiA+PiA+PiArCSAqIFRha2UgdGhlIG1v
c3QgY29uc2VydmF0aXZlIHJvdXRlIGhlcmUuIElmIHRoZXJlIGFyZQ0KPj4gPj4gPj4gKwkgKiBO
b24tRmF0YWwvRmF0YWwgZXJyb3JzIGRldGVjdGVkLCBkbyBub3QgYXNzdW1lIGFueQ0KPj4gPj4g
Pj4gKwkgKiBiaXQgaW4gdW5jb3Jfc3RhdHVzIGlzIHNldCBieSBBTkZFLg0KPj4gPj4gPj4gKwkg
Ki8NCj4+ID4+ID4+ICsJaWYgKGRldmljZV9zdGF0dXMgJiAoUENJX0VYUF9ERVZTVEFfTkZFRCB8
DQo+UENJX0VYUF9ERVZTVEFfRkVEKSkNCj4+ID4+ID4+ICsJCXJldHVybjsNCj4+ID4+ID4+ICsN
Cj4+ID4+ID4NCj4+ID4+ID5JcyB0aGVyZSBub3QgYSByYWNlIGhlcmU/ICBJZiB3ZSBoYXBwZW4g
dG8gZ2V0IGVpdGhlciBhbiBORkVEIG9yIEZFRA0KPj4gPj4gPmJldHdlZW4gdGhlIHJlYWQgb2Yg
ZGV2aWNlX3N0YXR1cyBhYm92ZSBhbmQgaGVyZSB3ZSBtaWdodCBwaWNrIHVwIGENCj4+ID5zdGF0
dXMNCj4+ID4+ID50aGF0IGNvcnJlc3BvbmRzIHRvIHRoYXQgKGFuZCBoZW5jZSBjbGVhciBzb21l
dGhpbmcgd2Ugc2hvdWxkIG5vdCkuDQo+PiA+Pg0KPj4gPj4gSW4gdGhpcyBzY2VuYXJpbywgaW5m
by0+YW5mZV9zdGF0dXMgaXMgMC4NCj4+ID4NCj4+ID5PSy4gSW4gdGhhdCBjYXNlIHdoYXQgaXMg
dGhlIHBvaW50IG9mIHRoZSBjaGVjayBhYm92ZT8NCj4+ID5JZiB0aGUgY29kZSBpcyBzYWZlIHRv
IHJhY2VzLCBpdCdzIHNhZmUgdG8gZ28gYWhlYWQgd2l0aG91dCB0aGF0IGNoZWNrDQo+PiA+b24g
d2hhdCBtaWdodCByYWNlLg0KPj4NCj4+IEdvb2QgcXVlc3Rpb24uDQo+PiBBZnRlciBmdXJ0aGVy
IGRpZ2dpbmcgaW50byB0aGUgc3BlYywgSSBqdXN0IGZvdW5kIEkgbWlzdW5kZXJzdG9vZCBpdC4N
Cj4+IEFuIFVOQ1VSIGVycm9yIHJhaXNlZCBhcyBBTkZFIGNhbiBiZSByYWlzZWQgYXMgTkZFIGlu
IGRpZmZlcmVudCBjYXNlcywNCj4+IHNvIGluZm8tPmFuZmVfc3RhdHVzIGNhbiBiZSBub256ZXJv
IGhlcmUgYW5kIHRoZSByYWNlIHlvdSBtZW50aW9uZWQNCj4+IGRvZXMgZXhpc3QsIHRoZSBjaGVj
ayBvbiBQQ0lfRVhQX0RFVlNUQV9GRUQgaXMgYWxzbyB1bm5lY2Vzc2FyeS4NCj4+IFNvcnJ5IGZv
ciB0aGUgbWlzbGVhZGluZy4gSSBwbGFuIHRvIGhhdmUgYmVsb3cgY2hhbmdlIHRvIGZpeCB0aGUg
cmFjZToNCj4+DQo+PiAgICAgICAgdW5zaWduZWQgaW50IGFuZmVfc3RhdHVzOw0KPj4gICAgICAg
IGFuZmVfc3RhdHVzID0gdW5jb3Jfc3RhdHVzICYgfnVuY29yX21hc2sgJiB+aW5mby0+c2V2ZXJp
dHkgJg0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgQUVSX0VSUl9BTkZFX1VOQ19NQVNL
Ow0KPj4NCj4+ICAgICAgICBpZiAocGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChkZXYsIFBDSV9F
WFBfREVWU1RBLCAmZGV2aWNlX3N0YXR1cykpDQo+PiAgICAgICAgICAgICAgICByZXR1cm47DQo+
PiAgICAgICAgLyoNCj4+ICAgICAgICAgKiBUYWtlIHRoZSBtb3N0IGNvbnNlcnZhdGl2ZSByb3V0
ZSBoZXJlLiBJZiB0aGVyZSBhcmUNCj4+ICAgICAgICAgKiBOb24tRmF0YWwgZXJyb3JzIGRldGVj
dGVkLCBkbyBub3QgYXNzdW1lIGFueQ0KPj4gICAgICAgICAqIGJpdCBpbiB1bmNvcl9zdGF0dXMg
aXMgc2V0IGJ5IEFORkUuDQo+PiAgICAgICAgICovDQo+PiAgICAgICAgaWYgKGRldmljZV9zdGF0
dXMgJiBQQ0lfRVhQX0RFVlNUQV9ORkVEKQ0KPj4gICAgICAgICAgICAgICAgcmV0dXJuOw0KPj4g
ICAgICAgICBpbmZvLT5hbmZlX3N0YXR1cyA9IGFuZmVfc3RhdHVzOw0KPj4NCj4+IFdpdGggdGhp
cyBjaGFuZ2UsIHRoZXJlIGlzIHN0aWxsIGEgc21hbGwgd2luZG93IGJldHdlZW4gcmVhZGluZw0K
PnVuY29yX3N0YXR1cw0KPj4gYW5kIGRldmljZV9zdGF0dXMgdG8gbGVhayBBTkZFLCBidXQgdGhh
dCdzIHRoZSBiZXN0IHdlIGNhbiBkbyBhbmQgYmV0dGVyDQo+PiB0aGFuIGNsZWFyaW5nIE5GRS4g
TGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYmV0dGVyIGlkZWHwn5iKDQo+DQo+V29ydGggbGVhdmlu
ZyBzb21lIGJyZWFkY3J1bWJzIGFib3V0IHRoZXJlIGJlaW5nIGEgcmFjZSAoc28gYSBjb21tZW50
KQ0KPmFuZCBleHBsYWluIHdoYXQgdGhlIHNpZGUgZWZmZWN0cyBvZiBoaXR0aW5nIHRoYXQgcmFj
ZSBhcmUgKGxvc3QgaW5mbw0KPm9uIHRoZSBlcnJvciBJIHRoaW5rLCBidXQgbm90IGEgbWlzc2Vk
IGVycm9yKT8NCg0KUGxhbiB0byBhZGQgYmVsb3cgY29tbWVudHMsIGxldCBtZSBrbm93IGlmIGl0
J3MgdW5jbGVhciBmb3IgeW91Og0KDQoiSWYgdGhlcmUgaXMgYW5vdGhlciBBTkZFIGJldHdlZW4g
cmVhZGluZyB1bmNvcl9zdGF0dXMgYW5kIGNsZWFyaW5nDQpQQ0lfRVJSX0NPUl9BRFZfTkZBVCBi
aXQgaW4gY29yX3N0YXR1cyByZWdpc3RlciwgdGhhdCBBTkZFIGlzbid0DQpyZWNvcmRlZCBpbiBp
bmZvLT5hbmZlX3N0YXR1cy4gSXQgd2lsbCBiZSByZWFkIG91dCBhcyBORkUgaW4gbmV4dA0KdW5j
b3Jfc3RhdHVzIHJlZ2lzdGVyIHJlYWRpbmcgYW5kIHByb2Nlc3NlZCBieSBORkUgaGFuZGxlci4i
DQoNClRoYW5rcw0KWmhlbnpob25nDQoNCj4+DQo+PiBUaGFua3MNCj4+IFpoZW56aG9uZw0KPj4N
Cj4+ID4NCj4+ID4+DQo+PiA+PiA+DQo+PiA+PiA+T3IgYW0gSSBtaXNzaW5nIHRoYXQgcmFjZSBi
ZWluZyBjbG9zZSBzb21ld2hlcmU/DQo+PiA+Pg0KPj4gPj4gVGhlIGJpdHMgbGVhZGluZyB0byBO
RkVEIG9yIEZFRCBpcyBtYXNrZWQgb3V0IHdoZW4gYXNzaWduaW5nIGluZm8tDQo+PiA+PmFuZmVf
c3RhdHVzLg0KPj4gPj4gQml0cyBmb3IgRkVEIGlzIG1hc2tlZCBvdXQgYnkgfmluZm8tPnNldmVy
aXR5LA0KPj4gPj4gYml0IGZvciBORkVEIGlzIG1hc2tlZCBvdXQgYnkgQUVSX0VSUl9BTkZFX1VO
Q19NQVNLLg0KPj4gPj4NCj4+ID4+IFNvIHdlIG5ldmVyIGNsZWFyIHN0YXR1cyBiaXRzIGZvciBO
RkVEIG9yIEZFRCBpbiBBTkZFIGhhbmRsZXIuDQo+PiA+Pg0KPj4gPj4gU2VlIGJlbG93IGFzc2ln
bm1lbnQgb2YgaW5mby0+YW5mZV9zdGF0dXMuDQo+PiA+Pg0KPj4gPj4gVGhhbmtzDQo+PiA+PiBa
aGVuemhvbmcNCj4+ID4+DQo+PiA+PiA+DQo+PiA+PiA+PiArCXBjaV9yZWFkX2NvbmZpZ19kd29y
ZChkZXYsIGFlciArIFBDSV9FUlJfVU5DT1JfU1RBVFVTLA0KPj4gPj4gPiZ1bmNvcl9zdGF0dXMp
Ow0KPj4gPj4gPj4gKwlwY2lfcmVhZF9jb25maWdfZHdvcmQoZGV2LCBhZXIgKyBQQ0lfRVJSX1VO
Q09SX01BU0ssDQo+PiA+PiA+JnVuY29yX21hc2spOw0KPj4gPj4gPj4gKwkvKg0KPj4gPj4gPj4g
KwkgKiBBY2NvcmRpbmcgdG8gUENJZSBCYXNlIFNwZWNpZmljYXRpb24gUmV2aXNpb24gNi4xLA0K
Pj4gPj4gPj4gKwkgKiBTZWN0aW9uIDYuMi4zLjIuNCwgaWYgYW4gVU5DT1IgZXJyb3IgaXMgcmFp
c2VkIGFzDQo+PiA+PiA+PiArCSAqIEFkdmlzb3J5IE5vbi1GYXRhbCBlcnJvciwgaXQgd2lsbCBt
YXRjaCB0aGUgZm9sbG93aW5nDQo+PiA+PiA+PiArCSAqIGNvbmRpdGlvbnM6DQo+PiA+PiA+PiAr
CSAqCWEuIFRoZSBzZXZlcml0eSBvZiB0aGUgZXJyb3IgaXMgTm9uLUZhdGFsLg0KPj4gPj4gPj4g
KwkgKgliLiBUaGUgZXJyb3IgaXMgb25lIG9mIHRoZSBmb2xsb3dpbmc6DQo+PiA+PiA+PiArCSAq
CQkxLiBQb2lzb25lZCBUTFAgICAgICAgICAgIChTZWN0aW9uIDYuMi4zLjIuNC4zKQ0KPj4gPj4g
Pj4gKwkgKgkJMi4gQ29tcGxldGlvbiBUaW1lb3V0ICAgICAoU2VjdGlvbiA2LjIuMy4yLjQuNCkN
Cj4+ID4+ID4+ICsJICoJCTMuIENvbXBsZXRlciBBYm9ydCAgICAgICAgKFNlY3Rpb24gNi4yLjMu
Mi40LjEpDQo+PiA+PiA+PiArCSAqCQk0LiBVbmV4cGVjdGVkIENvbXBsZXRpb24gIChTZWN0aW9u
DQo+Ni4yLjMuMi40LjUpDQo+PiA+PiA+PiArCSAqCQk1LiBVbnN1cHBvcnRlZCBSZXF1ZXN0ICAg
IChTZWN0aW9uIDYuMi4zLjIuNC4xKQ0KPj4gPj4gPj4gKwkgKi8NCj4+ID4+ID4+ICsJaW5mby0+
YW5mZV9zdGF0dXMgPSB1bmNvcl9zdGF0dXMgJiB+dW5jb3JfbWFzayAmIH5pbmZvLQ0KPj5zZXZl
cml0eQ0KPj4gPj4gPiYNCj4+ID4+ID4+ICsJCQkgICAgQUVSX0VSUl9BTkZFX1VOQ19NQVNLOw0K
Pj4gPj4gPj4gK30NCj4+ID4+ID4+ICsNCj4+ID4+ID4+ICAvKioNCj4+ID4+ID4+ICAgKiBhZXJf
Z2V0X2RldmljZV9lcnJvcl9pbmZvIC0gcmVhZCBlcnJvciBzdGF0dXMgZnJvbSBkZXYgYW5kIHN0
b3JlDQo+aXQNCj4+ID50bw0KPj4gPj4gPmluZm8NCj4+ID4+ID4+ICAgKiBAZGV2OiBwb2ludGVy
IHRvIHRoZSBkZXZpY2UgZXhwZWN0ZWQgdG8gaGF2ZSBhIGVycm9yIHJlY29yZA0KPj4gPj4gPj4g
QEAgLTEyMTMsNiArMTI1NCw3IEBAIGludCBhZXJfZ2V0X2RldmljZV9lcnJvcl9pbmZvKHN0cnVj
dA0KPnBjaV9kZXYNCj4+ID4+ID4qZGV2LCBzdHJ1Y3QgYWVyX2Vycl9pbmZvICppbmZvKQ0KPj4g
Pj4gPj4NCj4+ID4+ID4+ICAJLyogTXVzdCByZXNldCBpbiB0aGlzIGZ1bmN0aW9uICovDQo+PiA+
PiA+PiAgCWluZm8tPnN0YXR1cyA9IDA7DQo+PiA+PiA+PiArCWluZm8tPmFuZmVfc3RhdHVzID0g
MDsNCj4+ID4+ID4+ICAJaW5mby0+dGxwX2hlYWRlcl92YWxpZCA9IDA7DQo+PiA+PiA+Pg0KPj4g
Pj4gPj4gIAkvKiBUaGUgZGV2aWNlIG1pZ2h0IG5vdCBzdXBwb3J0IEFFUiAqLw0KPj4gPj4gPj4g
QEAgLTEyMjYsNiArMTI2OCw5IEBAIGludCBhZXJfZ2V0X2RldmljZV9lcnJvcl9pbmZvKHN0cnVj
dA0KPnBjaV9kZXYNCj4+ID4+ID4qZGV2LCBzdHJ1Y3QgYWVyX2Vycl9pbmZvICppbmZvKQ0KPj4g
Pj4gPj4gIAkJCSZpbmZvLT5tYXNrKTsNCj4+ID4+ID4+ICAJCWlmICghKGluZm8tPnN0YXR1cyAm
IH5pbmZvLT5tYXNrKSkNCj4+ID4+ID4+ICAJCQlyZXR1cm4gMDsNCj4+ID4+ID4+ICsNCj4+ID4+
ID4+ICsJCWlmIChpbmZvLT5zdGF0dXMgJiBQQ0lfRVJSX0NPUl9BRFZfTkZBVCkNCj4+ID4+ID4+
ICsJCQlhbmZlX2dldF91Y19zdGF0dXMoZGV2LCBpbmZvKTsNCj4+ID4+ID4+ICAJfSBlbHNlIGlm
ICh0eXBlID09IFBDSV9FWFBfVFlQRV9ST09UX1BPUlQgfHwNCj4+ID4+ID4+ICAJCSAgIHR5cGUg
PT0gUENJX0VYUF9UWVBFX1JDX0VDIHx8DQo+PiA+PiA+PiAgCQkgICB0eXBlID09IFBDSV9FWFBf
VFlQRV9ET1dOU1RSRUFNIHx8DQo+PiA+Pg0KPj4gPj4NCj4+DQoNCg==
