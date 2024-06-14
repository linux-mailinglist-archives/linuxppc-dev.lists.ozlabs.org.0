Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDAF908284
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 05:34:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFHoeihG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0lJ76VKwz3cY1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 13:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFHoeihG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 14 Jun 2024 13:33:34 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0lHL5Vjyz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 13:33:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718336016; x=1749872016;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nDBJtRWECGHMQtpLEfaoZAPOM6OrhvOgMxY2QVLipkk=;
  b=kFHoeihGtwNtP7f6e4zeQ7hCHy9P/+qnnZaW4uCLRfZpuwH0nEVjO7eY
   xtaYWA/mzSicQ5HM5Ln2toghMzcYXzF0HU3FzaVmYyxWB5TZNgqsDBZEB
   fTOAOCUiAMT/yjc8SOZ9LsKFtBbSeW5+Gk0FyB9vA3aD+7VK4YtmRJ1z0
   3HdqdoZc00guAXGD4fKTZYlulapYUISb1pfhUKXlPHwSBL+z3JVLnuE1U
   zeWkGQF7w41+6NJowB1hBTjkoO3wsfSJK3D6iSmujyPtgajIlpAKK3Moa
   +KEGPiw3hBJRlPoD1OPWHGPoZQS+xDQQAxkTL+S9ZhJKCgAmJPbLWMgl8
   Q==;
X-CSE-ConnectionGUID: S7LAWZc9T6KC6rsnD8T02Q==
X-CSE-MsgGUID: xFGQsWW3T7m75m3GBp5Y7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15356287"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15356287"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 20:32:14 -0700
X-CSE-ConnectionGUID: RAOM3wgTRpG5SfAhTu5RFw==
X-CSE-MsgGUID: I6Uv8+/hSMurJCHugcvrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40475157"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 20:32:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 20:32:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 20:32:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 20:32:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXwoMqoYq234n6YMB50GQ4vDET+HfYNXP3HdGyr2THeGlgcF2iPYHnhu6v9qtZU63OGlWcU+UE2LEfMxBI6QMXSawSqi2XMpYyO7dLRun5bGwO3S8zlFK0Z9qdCFYoSSYVLb3iELrnmwh12W3surseOK2T5waBu3UEVU2TegFyVoabQ4tkWyMq9zkqV1n+gRkdMdL9XZpAKHwRFE3B3scIhl+qsjUZD2dgqad57YyQqs+NFZyENdcqMnoh4gG5dlggemwkrY7IDSk2iKMIheh2J2E8nGUie5AtKKrcSHhCYEFzT2hg1TC9jK/1lyEIwUmPY47FRpfLfGRMUBx2LN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDBJtRWECGHMQtpLEfaoZAPOM6OrhvOgMxY2QVLipkk=;
 b=mHM4yQX2kbDzwcJhpGjFa2tYse7ULDGq3BrOl1yrNIHlSpoRdLKwkAV70JzyUPKah1e+sfcxDgd2lANOVIp0RdzAwj+I8LLLdNXqCZ9csm3CiABsQU5sj1/Lb5VovAPB/SHvKBE0F2FNQA5k1SsYHNME5t14OkVB9JE7wC2VV8kpixK3phpr4oM7RjBoPcatRerR3Ihy0JKnUG4pLUOJ5PISG5pU03lGQJXWS+ZoQ+xzfaSawuerjZbW2InRRPjpNI7TmGZ61mR4/KXi9dhBstNbzSNCQPYUG0nJN5RSshOjWsbiJSoeDe0HLhz1LAW3EMf4QnwVlaRr+Cz+W3o0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Fri, 14 Jun
 2024 03:32:11 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091%7]) with mapi id 15.20.7677.019; Fri, 14 Jun 2024
 03:32:10 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
Thread-Topic: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
Thread-Index: AQHaoe4mlRR3GNinU0iQ6ur/VhIPBLHGhrIAgAArzzCAABzBgIAAAv2Q
Date: Fri, 14 Jun 2024 03:32:10 +0000
Message-ID: <SJ0PR11MB674479B3386C96FF2CF85F7692C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
 <20240509084833.2147767-4-zhenzhong.duan@intel.com>
 <9ce06552-79d9-4bd9-9a3e-2ffd72c4cf4a@intel.com>
 <SJ0PR11MB674404B356BFEB3E3E099CFC92C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <1e04a69d-225d-4e62-9ca9-fb7fbbc16f67@linux.intel.com>
In-Reply-To: <1e04a69d-225d-4e62-9ca9-fb7fbbc16f67@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|SJ0PR11MB5940:EE_
x-ms-office365-filtering-correlation-id: 02bf13d8-f9b1-4706-5171-08dc8c229348
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?MlZPUDBQNkp5M0xHWUJvaERPY2J5azYrNWZUSk9pbTlhOGR3aHVjUXEvelBD?=
 =?utf-8?B?T0o2anJBbGkrS201MGRMQjdySVd2ZDZ6WmtmNDFBZ0RtSEprNjBxeGUwbU9p?=
 =?utf-8?B?RnZNWVlCb2ROeGVJcFhUUUJweERzQm5aUGpGL2lsZzZTQlBzRlhpTHhBek0v?=
 =?utf-8?B?alpDNTduK1M0WHZYQkxuSFphalpiVlpwTFNCc2VYVzdpN0RwUUt3ZllrR2tT?=
 =?utf-8?B?MUpESkVrUTVGZzlQbFVGeG5uNnlhWDNET2pzWjJTVERweEYxbjkxejEzM0pw?=
 =?utf-8?B?U0FHb0pEaGdsNmI0NTdCWG9yMW5BT0ZSQzV2Uzk0SGxhU2o1Vkp2WFVSYita?=
 =?utf-8?B?bVVYclNRUjNpbmlYSnNkUmE2SUtzK3JONFRaOGFHVmJSKzZLWnpHWTU3UXQ5?=
 =?utf-8?B?SUxoWUJRMjBwL242MW5EbUtvTkZ2eXd5QW5yV00wMzI3Um54K1MxRTFNOTZv?=
 =?utf-8?B?NFZ4TzZwRHgrMDFoSFVVODc0UExRV3o4U25peXYzY3NsbkU1OXFibDVTQ3Fh?=
 =?utf-8?B?ZUlVL3BpNUNCdnZtQjBpMnZEMTh1ai85bjQ4cHlvaFpyU2Y3T2VQdk9BSzYv?=
 =?utf-8?B?NmM4Rmw0Y01oY3BDMGhoMVFZQmRSUXR0b3BYZHlCanUydk9oUUhXc1JTOURh?=
 =?utf-8?B?ODJKenB3aVllMVNXbjZmcTgyUS83cFJWMWwya21tVGNmWHVrRlFCM3I0YitP?=
 =?utf-8?B?VitJV05qOW5qbjVjaFNFRDlqS3lMVThhOUE1VlJqWGpRZXgwOGhaWUF1ZlhV?=
 =?utf-8?B?VUc0QldzdSs3U3U2Q3RVL3BTRGVTYUtuT1dIeDZUc1NoMmdOVUdNZE56Q3BP?=
 =?utf-8?B?OEtYbjRna0M3cGNlNUdrU0srOFFqaXljd3NwTHBEbGh3RjFrVGVtOVdpdkhn?=
 =?utf-8?B?ZFJWR1NYRHJ6SnNQUk5YM0hNcUp5dVNLOUoxZTluVzJDd3lrc1FodnVydGJF?=
 =?utf-8?B?Q0Q1eU5EK0hoNkJWY2RSWmhCRHRMMkt5WFNXNTNOcjhIYlFXcWk4VSt3Z2Mx?=
 =?utf-8?B?cHZRS3phbHB4d1ZQdlZRSDBBa3lKcWVtTlBiQlc1OXlBSzI2dFUyWS9HS1lB?=
 =?utf-8?B?cGdWeHRCVk9NUFVSdEhIcGlZb253YXhheDJkcjU0VzFOOS8wNFh3WUhrU1Vw?=
 =?utf-8?B?YzFtSWkybFg1NEdmMXM0OVByY2pheFhlMENoSHdlY2FHZkNNVzZFNHFLTXdm?=
 =?utf-8?B?RnpPaHgrSGdxVFUxSWdSRHVrZlV6U3Z6TnZNOEtnTGwwdlpZRWV2VDJNRXZR?=
 =?utf-8?B?MTRHMWxuaUVPQjBBRHFzZitjdFFxWWVVY3dIaDAwdjNHSEs3MUFlckVCVFM4?=
 =?utf-8?B?NEJ0UVVMRkNMRUNlNzhUMTVoUkkwWmdJUDJZTkFmeVVIMjFDc3hqRHN4c29X?=
 =?utf-8?B?MWdNa2crQU5iNDQ3aExraFZJNVZTb0JpUThHVjR3cFJjMVRJRHlNditsMkVj?=
 =?utf-8?B?WWtCTTUzTDFzODZKei8renpOcE5DWHR2M3NRZDRtS0ViMlpPS3Jxd0E5V1cr?=
 =?utf-8?B?L2hvenB5NEFxQUZWaDdWQUpadXZkcnhWVkwwWm1ZdG1QT2t1SlVCZjJxVUpC?=
 =?utf-8?B?YzZGRFF2MjYwbDR3cmRQcVE5dXNsUXMzSW1LQjNYQzFmSFc1K1JucnM1MllE?=
 =?utf-8?B?S2ZEcWg0UjhwR3JpWnVJUzlJMktRUnVUek95Umhza2d4Z3JOSVcvTUZUL0wx?=
 =?utf-8?B?a1c3cHh2anRKeldiZDc1REhxK0F2bURTMkVMMytwTCtqRVZiRVltT09ESTNi?=
 =?utf-8?Q?uJRzvYfylr9lteXacCKCeuz7X37bFn2plZZAgV1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDloM0F5aHc2OENFY083WnFSVnFJRXVTcUpZSG5hL2Q5VzF1VUNuWDdFcHph?=
 =?utf-8?B?U3lpay9qRlJFVEdyblJ3ZlM3czZEc2RVM3ZxVUxLZmRpVnNkUGl6MjVRTlRM?=
 =?utf-8?B?dUxoZkJtTWNVS0FnNnc3VGxhUTJIQzhlZTU4VG5CbG9iR0I2cE9hQ3ZTT1cv?=
 =?utf-8?B?UGRzSkVHZ0cxUXQybWwvR0RNcnlUejFpMUNXdDROdVRmVVBpTEZ2UHFDWUQz?=
 =?utf-8?B?TjZ4ZllZTExQRkpadUFERzl1VDYyUzVMUWoxM0l1UlNIcTMzSmUzd2Qwd0xj?=
 =?utf-8?B?eG44MUxBV0sxNnU4VU9CNEVOT2RvM2NIVzljYnQ1dnAwRWVYUE9aREhNWmZ0?=
 =?utf-8?B?cnJhdTh6V2Z3RTNRR2srellwUkQ4TVkvaFRRcjI5eklrZGRIUWRnZ1p0UGJW?=
 =?utf-8?B?QUdtUWpVS2lsMUczVmZZaW5GN2IyMU9nWDZ3QmpWbmFQYUErcUFSUWpNc3o5?=
 =?utf-8?B?LzNlczZlb3JHdXhnN0pHVkZQRnJnUmdpbDZkQkhCQWtYQ3BVK0xrSVR4V29s?=
 =?utf-8?B?QmNOUnJxZDZOYWlOWXUzTitxd2VhaXQ0OFR1VnB4VnNRTDQ1Y1h1QWFoUW5K?=
 =?utf-8?B?ZEZzWjhxRmt5bnl4c1puME9rUnYwTFd5VDEyaTZiSENXeEVsV3h0clo0STVM?=
 =?utf-8?B?UE9JVUI1QWh0ZU5xdUhxSzlwVTMrMjF5cjIzcSt3bDlFcmlrbW54SHlIajlL?=
 =?utf-8?B?YnpDZWF2WDVmeDlCa25aQlpNZmpwRjlUbVVnR2hMSTk2UDYwNThCYUR5bEtE?=
 =?utf-8?B?ME1mV2NNZUcyL1ZNaHNjYXVzVkVOaFV6RXkyWE56NDRKdkxhMWVRQmYxejd2?=
 =?utf-8?B?d01QdnBxY3NGSE1TelJBWVNvdy9QQnh3UXNSYko0bmRsTkJDZUFQV1VmekxY?=
 =?utf-8?B?bFZzVU90dDRrOTd1cUhPd09vK3lGQzltUVJJREIydVFZbHMrTFJkOEdvbWxV?=
 =?utf-8?B?UCtPVnU4WDZOSWZIYzNLV0RnVjd4ZW9kd3M3eEYwME44RFJjZVBJMXhaUUZl?=
 =?utf-8?B?QTRMdkFPdG9aUkUxb3pTRHVkVGpja1hVUDh6c2ZpalJqbkJtMUE4aWhZNjU3?=
 =?utf-8?B?cWRMWUhSeE1MSzhjWnZNakY4WGF2TmhhQmpNYjFPbE4rQm5NVU51K0c1cjgy?=
 =?utf-8?B?Q29ubHF6NTc4K2Irb3pKRlk2TWtGZWhBUStkVHRZbDhaeDVjbjNaU0hDemdE?=
 =?utf-8?B?ZmlhbVdhSVJ5dEt5emF4KzVoUFFCTnppVG5PSWdvb21aZWRyVUc4Z3l1alZE?=
 =?utf-8?B?QjB2NzVPUkwyMXFIemNKNlVOTGF1LzhLNTRTcnBMY1JxSXZxdTZncDdjVmQ4?=
 =?utf-8?B?b090TkhqeHB0VE5PRkxNaC9yTmJqOHNrWFBHV3JFaHJIdjgzV0dNa0krenFD?=
 =?utf-8?B?ZjExc3EwSTN2Y0ZuVVNBVy9SbzNqMVZXa2IzSWowdW1xRjNxTFhEQVJNait3?=
 =?utf-8?B?R0RadEx6M2xvUjNsN09leWZXTlcrWVNmeHFJWGoyNVp1bFJrRFZBcm5jdm91?=
 =?utf-8?B?YW1OZ0xSSWM1TjhmczhrQVdhTVd1ZGdLTytPdkRNOG13VHB3TFlIQldSWG42?=
 =?utf-8?B?VTUxejh4WTNDVllQTFNranBla0d4VHhkajdTKzY4NVRBcUcxdXR5Sll4WnZv?=
 =?utf-8?B?TlZBcVlPOG0zQlFCKzgrUEV6UHBkVkRwRFNoVjhjZXhMaURBbUhiZmVXUFV5?=
 =?utf-8?B?d1RkMVVpemw0RFJZYzNkK0FHeXQyMmtRR0loOWcxbFV6ZXFIRzJQSkFzdm12?=
 =?utf-8?B?N3VQU0Yza3pZRjJuSVFBWFU5N0RSODRlTkJQMTdRQ3pDc21SVWZKTmxINWpn?=
 =?utf-8?B?ZTE3cXRkTllrejdrVlhTNWl0UDBsc3pVbjNaRFpxL0R4cTl0RmpmU1pKaERJ?=
 =?utf-8?B?dTh4L1lSTk9TME9HR2RHQnQ5YjhZVmw3Q216T25lWStIOEcvckExQ3VhTVBE?=
 =?utf-8?B?WW52UGFGeHlJOG9LdHVkMXpCVW4vcHlTN09TTXZ2QThvYUhXdlNTMnJ0SDZV?=
 =?utf-8?B?TWRrUzlvNG54TlJCVlFvWnUwV0g5Y0VXNEMvSXM1MExKOGJVZSswQURiYmdW?=
 =?utf-8?B?ek5XSXlmS294RXJ0Mlg4ZHFETU82WFNiREp3Vjh6STBNZ0V5eHZraFhDdW9Q?=
 =?utf-8?Q?0bPny7PChWCqnD4K1n7ZEbj+t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bf13d8-f9b1-4706-5171-08dc8c229348
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 03:32:10.7123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ol8qh/zhl7fDxrDOC2HNtxvA2O/tHGf4enjsC46rrsXZGqUL++J7U7rX0XdW3Zc7GIUF2UNoudI4lqgU1p238t5reHC3vc2EfsM0f+0HAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield, Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.com>, "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEt1cHB1c3dhbXkgU2F0aHlh
bmFyYXlhbmFuDQo+PHNhdGh5YW5hcmF5YW5hbi5rdXBwdXN3YW15QGxpbnV4LmludGVsLmNvbT4N
Cj5TdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvM10gUENJL0FFUjogQ2xlYXIgVU5DT1JfU1RBVFVT
IGJpdHMgdGhhdCBtaWdodA0KPmJlIEFORkUNCj4NCj4NCj5PbiA2LzEzLzI0IDc6NDAgUE0sIER1
YW4sIFpoZW56aG9uZyB3cm90ZToNCj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4+PiBGcm9tOiBLdXBwdXN3YW15LCBTYXRoeWFuYXJheWFuYW4NCj4+PiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDMvM10gUENJL0FFUjogQ2xlYXIgVU5DT1JfU1RBVFVTIGJpdHMgdGhhdA0KPm1p
Z2h0DQo+Pj4gYmUgQU5GRQ0KPj4+DQo+Pj4NCj4+PiBPbiA1LzkvMjQgMTo0OCBBTSwgWmhlbnpo
b25nIER1YW4gd3JvdGU6DQo+Pj4+IFdoZW4gcHJvY2Vzc2luZyBhbiBBTkZFLCBpZGVhbGx5IGJv
dGggY29ycmVjdGFibGUgZXJyb3IoQ0UpIHN0YXR1cyBhbmQNCj4+Pj4gdW5jb3JyZWN0YWJsZSBl
cnJvcihVRSkgc3RhdHVzIHNob3VsZCBiZSBjbGVhcmVkLiBIb3dldmVyLCB0aGVyZSBpcyBubw0K
Pj4+PiB3YXkgdG8gZnVsbHkgaWRlbnRpZnkgdGhlIFVFIGFzc29jaWF0ZWQgd2l0aCBBTkZFLiBF
dmVuIHdvcnNlLCBOb24tRmF0YWwNCj4+Pj4gRXJyb3IoTkZFKSBtYXkgc2V0IHRoZSBzYW1lIFVF
IHN0YXR1cyBiaXQgYXMgQU5GRS4gVHJlYXRpbmcgYW4gQU5GRSBhcw0KPj4+PiBORkUgd2lsbCBi
cmluZyBzb21lIGlzc3VlcywgaS5lLiwgYnJlYWtpbmcgc29mdHdvcmUgcHJvYmluZzsgdHJlYXRp
bmcNCj4+PiAvcy9zb2Z0d29yZS9zb2Z0d2FyZQ0KPj4gR29vZCBjYXRjaCwgd2lsbCBmaXguIEl0
J3Mgc3RyYW5nZSAnY2hlY2twYXRjaCAtLWNvZGVzcGVsbCcgZG9lc24ndCBjYXRjaCB0aGlzLg0K
Pj4NCj4+PiBNYXkgYmUgdGhpcyBpcyBhbHJlYWR5IGRpc2N1c3NlZC4gQnV0IGNhbiB5b3UgZXhw
bGFpbiB3aHkgdHJlYXRpbmcNCj4+PiBBRk5FIGFzIG5vbi1mYXRhbCBlcnJvciB3aWxsIGJyaW5n
IHByb2JpbmcgaXNzdWVzPw0KPj4gQ29waWVkIGJlbG93IGZyb20gc3BlYyA2LjEsIDYuMi4zLjIu
NCwgc2F5cyBpdCBjYW4gcmVzdWx0cyBpbiBhIFN5c3RlbSBFcnJvci4NCj4+DQo+PiBJbiBzb21l
IGNhc2VzIHRoZSBkZXRlY3RvciBvZiBhIG5vbi1mYXRhbCBlcnJvciBpcyBub3QgdGhlIG1vc3Qg
YXBwcm9wcmlhdGUNCj5hZ2VudCB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgZXJyb3IgaXMNCj4+
IHJlY292ZXJhYmxlIG9yIG5vdCwgb3IgaWYgaXQgZXZlbiBuZWVkcyBhbnkgcmVjb3ZlcnkgYWN0
aW9uIGF0IGFsbC4gRm9yDQo+ZXhhbXBsZSwgaWYgc29mdHdhcmUgYXR0ZW1wdHMgdG8gcGVyZm9y
bSBhDQo+PiBjb25maWd1cmF0aW9uIHJlYWQgZnJvbSBhIG5vbi1leGlzdGVudCBkZXZpY2Ugb3Ig
RnVuY3Rpb24sIHRoZSByZXN1bHRpbmcgVVINCj5TdGF0dXMgaW4gdGhlIENvbXBsZXRpb24gd2ls
bCBzaWduYWwgdGhlIGVycm9yDQo+PiB0byBzb2Z0d2FyZSwgYW5kIHNvZnR3YXJlIGRvZXMgbm90
IG5lZWQgZm9yIHRoZSBDb21wbGV0ZXIgaW4gYWRkaXRpb24gdG8NCj5zaWduYWwgdGhlIGVycm9y
IGJ5IHNlbmRpbmcgYW4gRVJSX05PTkZBVEFMDQo+PiBNZXNzYWdlLiBJbiBmYWN0LCBvbiBzb21l
IHBsYXRmb3Jtcywgc2lnbmFsaW5nIHRoZSBlcnJvciB3aXRoDQo+RVJSX05PTkZBVEFMIHJlc3Vs
dHMgaW4gYSBTeXN0ZW0gRXJyb3IsIHdoaWNoIGJyZWFrcw0KPj4gbm9ybWFsIHNvZnR3YXJlIHBy
b2JpbmcuDQo+Pg0KPj4+PiBORkUgYXMgQU5GRSB3aWxsIG1ha2UgdXMgaWdub3Jpbmcgc29tZSBV
RXMgd2hpY2ggbmVlZCBhY3RpdmUgcmVjb3Zlcg0KPj4+IC9zL2lnbm9yaW5nL2lnbm9yZQ0KPj4g
V2lsbCBmaXguDQo+Pg0KPj4+PiBvcGVyYXRpb24uIFRvIGF2b2lkIGNsZWFyaW5nIFVFcyB0aGF0
IGFyZSBub3QgQU5GRSBieSBhY2NpZGVudCwgdGhlDQo+Pj4+IG1vc3QgY29uc2VydmF0aXZlIHJv
dXRlIGlzIHRha2VuIGhlcmU6IElmIGFueSBvZiB0aGUgTkZFIERldGVjdGVkIGJpdHMNCj4+Pj4g
aXMgc2V0IGluIERldmljZSBTdGF0dXMsIGRvIG5vdCB0b3VjaCBVRSBzdGF0dXMsIHRoZXkgc2hv
dWxkIGJlIGNsZWFyZWQNCj4+Pj4gbGF0ZXIgYnkgdGhlIFVFIGhhbmRsZXIuIE90aGVyd2lzZSwg
YSBzcGVjaWZpYyBzZXQgb2YgVUVzIHRoYXQgbWF5IGJlDQo+Pj4+IHJhaXNlZCBhcyBBTkZFIGFj
Y29yZGluZyB0byB0aGUgUENJZSBzcGVjaWZpY2F0aW9uIHdpbGwgYmUgY2xlYXJlZCBpZg0KPj4+
PiB0aGVpciBjb3JyZXNwb25kaW5nIHNldmVyaXR5IGlzIE5vbi1GYXRhbC4NCj4+Pj4NCj4+Pj4g
Rm9yIGluc3RhbmNlLCBwcmV2aW91c2x5IHdoZW4ga2VybmVsIHJlY2VpdmVzIGFuIEFORkUgd2l0
aCBQb2lzb25lZA0KPlRMUA0KPj4+PiBpbiBPUyBuYXRpdmUgQUVSIG1vZGUsIG9ubHkgc3RhdHVz
IG9mIENFIHdpbGwgYmUgcmVwb3J0ZWQgYW5kIGNsZWFyZWQ6DQo+Pj4+DQo+Pj4+ICAgQUVSOiBD
b3JyZWN0YWJsZSBlcnJvciBtZXNzYWdlIHJlY2VpdmVkIGZyb20gMDAwMDpiNzowMi4wDQo+Pj4+
ICAgUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PUNvcnJlY3RhYmxlLCB0eXBlPVRyYW5zYWN0aW9u
IExheWVyLCAoUmVjZWl2ZXINCj5JRCkNCj4+Pj4gICAgIGRldmljZSBbODA4NjowZGIwXSBlcnJv
ciBzdGF0dXMvbWFzaz0wMDAwMjAwMC8wMDAwMDAwMA0KPj4+PiAgICAgIFsxM10gTm9uRmF0YWxF
cnINCj4+Pj4NCj4+Pj4gSWYgdGhlIGtlcm5lbCByZWNlaXZlcyBhIE1hbGZvcm1lZCBUTFAgYWZ0
ZXIgdGhhdCwgdHdvIFVFcyB3aWxsIGJlDQo+Pj4+IHJlcG9ydGVkLCB3aGljaCBpcyB1bmV4cGVj
dGVkLiBNYWxmb3JtZWQgVExQIEhlYWRlciBpcyBsb3N0IHNpbmNlDQo+Pj4+IHRoZSBwcmV2aW91
cyBBTkZFIGdhdGVkIHRoZSBUTFAgaGVhZGVyIGxvZ3M6DQo+Pj4+DQo+Pj4+ICAgUENJZSBCdXMg
RXJyb3I6IHNldmVyaXR5PSJVbmNvcnJlY3RhYmxlIChGYXRhbCksIHR5cGU9VHJhbnNhY3Rpb24g
TGF5ZXIsDQo+Pj4gKFJlY2VpdmVyIElEKQ0KPj4+PiAgICAgZGV2aWNlIFs4MDg2OjBkYjBdIGVy
cm9yIHN0YXR1cy9tYXNrPTAwMDQxMDAwLzAwMTgwMDIwDQo+Pj4+ICAgICAgWzEyXSBUTFAgICAg
ICAgICAgICAgICAgICAgIChGaXJzdCkNCj4+Pj4gICAgICBbMThdIE1hbGZUTFANCj4+Pj4NCj4+
Pj4gTm93LCBmb3IgdGhlIHNhbWUgc2NlbmFyaW8sIGJvdGggQ0Ugc3RhdHVzIGFuZCByZWxhdGVk
IFVFIHN0YXR1cyB3aWxsIGJlDQo+Pj4+IHJlcG9ydGVkIGFuZCBjbGVhcmVkIGFmdGVyIEFORkU6
DQo+Pj4+DQo+Pj4+ICAgQUVSOiBDb3JyZWN0YWJsZSBlcnJvciBtZXNzYWdlIHJlY2VpdmVkIGZy
b20gMDAwMDpiNzowMi4wDQo+Pj4+ICAgUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PUNvcnJlY3Rh
YmxlLCB0eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVjZWl2ZXINCj5JRCkNCj4+Pj4gICAgIGRl
dmljZSBbODA4NjowZGIwXSBlcnJvciBzdGF0dXMvbWFzaz0wMDAwMjAwMC8wMDAwMDAwMA0KPj4+
PiAgICAgIFsxM10gTm9uRmF0YWxFcnINCj4+Pj4gICAgIFVuY29ycmVjdGFibGUgZXJyb3JzIHRo
YXQgbWF5IGNhdXNlIEFkdmlzb3J5IE5vbi1GYXRhbDoNCj4+Pj4gICAgICBbMThdIFRMUA0KPj4+
Pg0KPj4+PiBUZXN0ZWQtYnk6IFl1ZG9uZyBXYW5nIDx5dWRvbmcud2FuZ0BpbnRlbC5jb20+DQo+
Pj4+IENvLWRldmVsb3BlZC1ieTogIldhbmcsIFFpbmdzaHVuIiA8cWluZ3NodW4ud2FuZ0BsaW51
eC5pbnRlbC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6ICJXYW5nLCBRaW5nc2h1biIgPHFpbmdz
aHVuLndhbmdAbGludXguaW50ZWwuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcg
RHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMv
cGNpL3BjaWUvYWVyLmMgfCA3ICsrKysrKy0NCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGNpL3BjaWUvYWVyLmMgYi9kcml2ZXJzL3BjaS9wY2llL2Flci5jDQo+Pj4+IGluZGV4IGVkNDM1
ZjA5YWMyNy4uNmE2YTNhNDA1NjlhIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3BjaS9wY2ll
L2Flci5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMNCj4+Pj4gQEAgLTExMTUs
OSArMTExNSwxNCBAQCBzdGF0aWMgdm9pZCBwY2lfYWVyX2hhbmRsZV9lcnJvcihzdHJ1Y3QNCj4+
PiBwY2lfZGV2ICpkZXYsIHN0cnVjdCBhZXJfZXJyX2luZm8gKmluZm8pDQo+Pj4+ICAJCSAqIENv
cnJlY3RhYmxlIGVycm9yIGRvZXMgbm90IG5lZWQgc29mdHdhcmUgaW50ZXJ2ZW50aW9uLg0KPj4+
PiAgCQkgKiBObyBuZWVkIHRvIGdvIHRocm91Z2ggZXJyb3IgcmVjb3ZlcnkgcHJvY2Vzcy4NCj4+
Pj4gIAkJICovDQo+Pj4+IC0JCWlmIChhZXIpDQo+Pj4+ICsJCWlmIChhZXIpIHsNCj4+Pj4gIAkJ
CXBjaV93cml0ZV9jb25maWdfZHdvcmQoZGV2LCBhZXIgKw0KPj4+IFBDSV9FUlJfQ09SX1NUQVRV
UywNCj4+Pj4gIAkJCQkJaW5mby0+c3RhdHVzKTsNCj4+Pj4gKwkJCWlmIChpbmZvLT5hbmZlX3N0
YXR1cykNCj4+Pj4gKwkJCQlwY2lfd3JpdGVfY29uZmlnX2R3b3JkKGRldiwNCj4+Pj4gKwkJCQkJ
CSAgICAgICBhZXIgKw0KPj4+IFBDSV9FUlJfVU5DT1JfU1RBVFVTLA0KPj4+PiArCQkJCQkJICAg
ICAgIGluZm8tPmFuZmVfc3RhdHVzKTsNCj4+Pj4gKwkJfQ0KPj4+IFdoeSBzcGxpdCB0aGUgaGFu
ZGxpbmcgcGFydCBhbmQgc3RvcmluZyBwYXJ0IGludG8gdHdvIHBhdGNoZXM/IFdoeSBub3QNCj4+
PiBtZXJnZQ0KPj4+IHRoaXMgcGFydCBvZiBwYXRjaCAxLzMuDQo+PiBUaGlzIGlzIGJhc2VkIG9u
IEJqb3JuJ3Mgc3VnZ2VzdGlvbiBhdCBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51
eC0NCj5wY2kvbXNnMTQ5MDEyLmh0bWwsDQo+PiBjbGVhcmluZyBVTkNPUl9TVEFUVVMgbWlnaHQg
YmUgbW9yZSBpbXBvcnRhbnQsIGRlc2VydmUgdG8gcmFpc2Ugb3V0Lg0KPg0KPkkgdGhpbmsgQmpv
cm4ncyBzdWdnZXN0aW9uIGlzIHRvIGRpdmlkZSBpdCBpbnRvIHR3byBsb2dpY2FsIHBhdGNoZXMu
DQo+T25lIGZvciBwcmludGluZyB0aGUgZXJyb3IgYW5kIGFub3RoZXIgdG8gY2xlYXIgdGhlIFVO
Q09SX1NUQVRVUw0KPnByb3Blcmx5LiBCdXQgY3VycmVudGx5IHlvdSBoYXZlIHNwbGl0IHRoZSBV
TkNPUl9TVEFUVVMgc3RhdHVzIGNhY2hpbmcgYW5kDQo+Y2xlYXJpbmcgcHJvY2VzcyBpbnRvIHR3
byBwYXRjaGVzLiBJTU8sIHlvdXIgZmlyc3QgcGF0Y2ggY2FuIHN0b3JlIEFORkUNCj5zdGF0dXMg
YW5kIGNsZWFyIGl0LiBZb3UgY2FuIGFkZCBwcmludCBzdXBwb3J0IGluIHRoZSBzZWNvbmQgcGF0
Y2guDQoNCk9LLCBJJ2xsIG1lcmdlIHBhdGNoMSB3aXRoIHBhdGNoMyBpbiBuZXh0IHZlcnNpb24u
DQoNCj4NCj4NCj5Db2RlIHdpc2UgaXQgbG9va3MgZmluZSB0byBtZS4gWW91IGNhbiBhZGQgbXkg
UmV2aWV3ZWQtYnkgYWZ0ZXIgZml4aW5nDQo+dGhlIHR5cG9zDQo+DQo+UmV2aWV3ZWQtYnk6IEt1
cHB1c3dhbXkgU2F0aHlhbmFyYXlhbmFuDQo+PHNhdGh5YW5hcmF5YW5hbi5rdXBwdXN3YW15QGxp
bnV4LmludGVsLmNvbT4NCg0KVGhhbmtzDQp6aGVuemhvbmcNCg0KPg0KPj4NCj4+IFRoYW5rcw0K
Pj4gWmhlbnpob25nDQo+DQo+LS0NCj5TYXRoeWFuYXJheWFuYW4gS3VwcHVzd2FteQ0KPkxpbnV4
IEtlcm5lbCBEZXZlbG9wZXINCg0K
