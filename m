Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02499081CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 04:42:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYVH6PbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0k8K4CTzz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 12:42:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYVH6PbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0k7Z0m7jz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 12:41:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718332907; x=1749868907;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s2pZbGdCMO/yG8t71UTreHPvAblrHFhKKmF0fRvFfWw=;
  b=AYVH6PbEeQgQ3mz2+KEa2mu0fA9zFz2+j6jvnnCF0C3QDf0iethkgfEA
   qj5jN+CouS/NayA3V4I9UUssMTOL/wXob1yiC9Qfh8RZ1ZRVqKdH+Hfem
   +WHS9XEJMQmrc/uwt2M0B0fhZ7d0WYPOnmQSToVyXkerqXS4Xzt6/Xr1P
   v6OZzTnR9JJ+34BfkRJPlppGlDPzO4pNYDvxykh45q3tWHJcG1iWiodFP
   4RJq6PaCgtwnZVzoWDrKZOTIe2TkwOYef3wqSJ4HPloJkTC5dNfgnjbZ8
   t8s5HEfwWzxPrvycnSq3o+dM9hog7Q5ucMRgf/Gy0MmVZAw3OzvxTV5C5
   w==;
X-CSE-ConnectionGUID: CxWLHqXTTj+fsvyb1VlR3A==
X-CSE-MsgGUID: 9CTE81GmTViT17bt9pG8/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15076309"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15076309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 19:40:40 -0700
X-CSE-ConnectionGUID: gw4GqzZzQJq43M1H9EbkMA==
X-CSE-MsgGUID: YOzHeZy/TwG7bBDBHNcFOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="63549071"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 19:40:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 19:40:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 19:40:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 19:40:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GocOffmg6brikf9AGiZl92gIWEx1o6fRJ7b9CVWfVpBulX6fjp0zI51qgQeb4ZrzEqBTXfbY4DDVai9CR6TXUG7lJSmHYJQLkzo+1XRDTlypN9Wa5qJF8BOKsz7EAufZuRMyv4UHU89Vn5iPjnGXCo9tNKKVEgYacRTRHR+SimnbYd0i/Q4keEipqs1EHHV2ZPu95I9qtDPjHBmHRQDjhcWdHhTFCNYxw2bbO3CM9DS7sX9+uL7w4bDnuGgfQ8CIWZNUgufqjqnrG7Tiw7AvkRbq2hVmnYDvWaXqED3CIP/fbAjRzOd6ie1f9glRL9OuZhHBIvaMgTTb5tON3CyYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2pZbGdCMO/yG8t71UTreHPvAblrHFhKKmF0fRvFfWw=;
 b=k9TyTRH/lSF+e3dYGLCTFpuVDV30oXgCc1ef65ob1NdI0jrT9octgqIW/HNSh5zRIJk1opQcu3M2fleHcfsBUx5QWLeDPTILEj3/Hn1pxYtfEZiZvfxXwxFlyEvf3NqiOjPS3FSJ7xyG5xv2k/EiIMhDhGrvK9YSJ+sCqUbkYHLiWozTVA8RP2RZsV0C3VVaapFpBqP6n1/TCQhKbDIVLas/FJFgsBmhX3dHIRRL3D8NndpVY/gCKUDeNWfVC/lSJ0oaajUotMVtKKC2xKeCnE9xohAqAp0rm732CupToeRWxwrjvZej3LAIINbO3D+izYfFHBJ2LnP1WNzPSY5uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 02:40:31 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::fe49:d628:48b1:6091%7]) with mapi id 15.20.7677.019; Fri, 14 Jun 2024
 02:40:31 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
Thread-Topic: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
Thread-Index: AQHaoe4mlRR3GNinU0iQ6ur/VhIPBLHGhrIAgAArzzA=
Date: Fri, 14 Jun 2024 02:40:31 +0000
Message-ID: <SJ0PR11MB674404B356BFEB3E3E099CFC92C22@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
 <20240509084833.2147767-4-zhenzhong.duan@intel.com>
 <9ce06552-79d9-4bd9-9a3e-2ffd72c4cf4a@intel.com>
In-Reply-To: <9ce06552-79d9-4bd9-9a3e-2ffd72c4cf4a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|IA1PR11MB7855:EE_
x-ms-office365-filtering-correlation-id: 3a08ccf5-4fbc-402b-51fd-08dc8c1b5c14
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|376009|7416009|366011|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?dEhvcnhhU1JISGQ2bGY3RnNhaXhScmRaUjBxRkZ1MGRFYVhNVHZNOFduSWJG?=
 =?utf-8?B?T1pJUWF5dlJRK0hQKzhBWmJDTFV0RS9KZ2V0bExKOU9OcS9ZS0JrY2ViWW9T?=
 =?utf-8?B?dG84eWVVR0tGTXdERlZkYWJReS9EV1YrTFlablRjUXQ0K05PQlRhemJleVlu?=
 =?utf-8?B?Rng3UXkzR3hhSStNc1RZUlZUSTQ1QlBsSy9GNmI2RnR6TGhvbmZDNjlrUHNH?=
 =?utf-8?B?a1VvOTZzVUtEdmVUYnhBcHErZjdyWGpFSXppbDEzR2VsSXQrY2dKbVpTMkFs?=
 =?utf-8?B?cmV4NXhvdlBNaXVlN3BrMVRrdWJTbEVuN3RMdndWY0NFSFFUeEltRlJrUnhM?=
 =?utf-8?B?WFNTWFhUOGppMjVCbjlURDJoRHNxUEFNMXRydVNmdVlhVHNDQ2tHcWVLMXJL?=
 =?utf-8?B?UEJURVVad01DZU5MUmVsYVZzWlhyc0FPdnhMbzQzNmlEajZ6YjB5WXhZRGJC?=
 =?utf-8?B?aFc5VG5jemlyY01qWE04RkZuSUhVU3lMZytLL210c1d1R01QbGFNUG9rWDFv?=
 =?utf-8?B?Z29tNjZLQ2NubmRhdFhVY204VWxjZXBaTjVCa3Bud1N1bWdTRTlSekZZc3Uz?=
 =?utf-8?B?U29NWWRTbW04MzVjQTNNNEpqVFc3elVlcE8xUzVlWHZUTlpFYWRaRlJDUk5a?=
 =?utf-8?B?bTBva2tCSDBmOFcyK0szbVlvemdVdUJkMnZYd283cEhuS1V4MzVxVmkwdkN4?=
 =?utf-8?B?ajR6V2lhOE9UaGJrN2JlRmo4bWMzTHV1eTNiQkVWT0d3VWRNOEhiNm9aNjl0?=
 =?utf-8?B?RFZBUEZFTjdHRmV0QmE0UW8ydWRnZzJCL2dXb3ZBODhwZ000K1BYVEtwc1oz?=
 =?utf-8?B?cUpWTGRndUo5K01UakdrUlRpWHlZd2hzSkVUN2NTbkpISFNTdGJlcktvS2V4?=
 =?utf-8?B?UThNVFlETzRBRTc3aE04RjlELzVIWnY0UzNNTUUyODBJd3poSWJkdVR5QlMv?=
 =?utf-8?B?MDRmdjNRdnJEM2VWVXNySlNvRGpNdlR4blZ3d1NoTnBMSGR3WEY4MEJQcHBm?=
 =?utf-8?B?UzAvbUR1aGFIUnAwTDRtczltVkJWMFZMbUk5NFBLeXY5dFNxU2tEdGFzOXBT?=
 =?utf-8?B?cjRndmpnZHAxc2ZZOW5xVm9KT25IQWs2YnExNytLQnBiM3k1UWxHSE9vNU0w?=
 =?utf-8?B?M0VIcnR3aUN5OXUzZ1NOYnNHZ1NGeHFWVXdNY0lDZXB0U0JYQk9MdHp1U2lM?=
 =?utf-8?B?TkIzMUkzWUdlNU5QajEwZGc4WjhFZnlNY2ZVT3dTSjRZLzhBdDlwWWZkU0Z4?=
 =?utf-8?B?MVFkNFIvdzF1bXZCWEx2OG5HQnhYV0JzbklsMUtpVE5XTGVvaUZSU3lRY015?=
 =?utf-8?B?bTAxbGRVdXZQNnZ2MkN6aGorbEJtMm9wZExsM1JzQ09zcm1RblI5OXV1NXhi?=
 =?utf-8?B?Y1RPQXdVR3gweVNLclJTb2Q4eTRieUx3UnNWTzVDMVpJa1VYSGRhekV1Smpz?=
 =?utf-8?B?bUJRZWFRYzd5L0pjQUE2Y3FwQThmTGZ6VjlublBZQzBuZUNhMlJFOUpTMEVn?=
 =?utf-8?B?RWhmOUtqMjNLd0RxYUMwWlBzRnc0dWx1WUxOVVlkYk4xWU9ITHdCZGZjNTVh?=
 =?utf-8?B?TFJVNlJTUTR0SnVaUCtseXhsVlppVXpzRlJRMjB1VFFpWEl5TGdOQTlPMG5j?=
 =?utf-8?B?aHBQTmZ1dXNmbVVlR0ZBemhBeXp5Z0dVSXJWZVg2VWs1Y0kwd3Y1eDBFS3kr?=
 =?utf-8?B?Y3AzZTBsNlFaclJ0Qit3R21TRlc1QXRFSDZiUjZ0SFlLRlRSMlpZdTZ1MWti?=
 =?utf-8?Q?mOwON4k3TCAoU0cuUy1UY+U8FWgHeuIJIWo3GiV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(376009)(7416009)(366011)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uyt4M0dlZlp0MU8xMnJSWGU0YzhVdDZJSHg0V2V6TzFSa3M4QUZsMWpnY2h0?=
 =?utf-8?B?TjhXcjFuMUUzUTAyN09ud2RraGU2L2kyRk92YmwvNGFpaUhGb0hsbkIySEdu?=
 =?utf-8?B?cXlscVo3OU5iVmYyZmVwRFhCNElNTmlXQkdRWVBIWFY2dHdLTXI2QTEyaHo4?=
 =?utf-8?B?dC9KZXFRRXgvZmlLWlF0dnB2OGRKUDVpYmVRNnhEME16SzhmNURQUU5BNjV0?=
 =?utf-8?B?Y2M2eC9MS1NHM1MvaU5mZGVmeDJUVWhKZUp2OVI3cjR4cE5NVk5ScXNyWEJ5?=
 =?utf-8?B?d2VnYm1nZks5cDB1Y0Q2RGFmSk9wVHczSHAxTENwcUFEWlEzL0x2TjRYRGxJ?=
 =?utf-8?B?Z3g3VmY2RUcvcnNkSlVDbWZ4Y1pOcy9BVTlLUS9JRkIrQW10a0MrN3ZuR2ZO?=
 =?utf-8?B?MVBWVHAyOXY2amQ4bWVtd2dKL0JoS3BZWXpzUFhvU0pnT2pKSnBEVHA3YjBa?=
 =?utf-8?B?azRTYmVpNlZvWUtxYWE0QldtRDB6emhVUnVuYlNOdk0xQ2NUaU1hNDdlQ2xP?=
 =?utf-8?B?VXNiK0hreWlaQURRNFMyWDQraGY4WXh0VHFxMnR0UjFJRVczcGhhRWVoWlcv?=
 =?utf-8?B?Vjc3TG1jR1FWb3lGdVZOL0FobmMyUzhwa2h5Y3VyMmFURUgxK2pZbUxtc1dX?=
 =?utf-8?B?YnNTdlpZL3RNMVFNb3BBTG1wYXpsaURNU2NsczlQSlI4dGgvYnJ1MkZUY1pR?=
 =?utf-8?B?T0svSkpsL0c3UUNLREEwWVpmWDcvNWgxb2tmcmVBc2loaVBnTWIzS3BuMGww?=
 =?utf-8?B?TFlGa1VJUDc2bEo1VHM1NjJFbGJoZW14T0FQNGJYMzZKLzNVUFpRTnNzSWR2?=
 =?utf-8?B?RlNKclpaSnE0Y3RDb2p3MmJ5UW8yTmh2SXNNWWJ2NFMwRmNOZjJKa1dRdnZv?=
 =?utf-8?B?eFdzZjBacE14R09VUEFVTzZEbzc4UmwyQ2RYcDFyYUo3V3c1NmVzT3N4V2c2?=
 =?utf-8?B?MXJ1YWt4anlWUis1MHdWZ0pNZHZld1B6Tkd3cVhvWjhyUm5USVBSTitxaEN1?=
 =?utf-8?B?M1l1RjM1RE1lUHhxamJtazJ3WWVEVlJaVmNOdlVadlBpZmdRbzZERjdsUlc0?=
 =?utf-8?B?WmdjZ3EwcnZncmdtNG54RHlNTmlmVngwWFI1Tk5SZ0xtUGNhZ1FTQ2lxdGlN?=
 =?utf-8?B?bnBJRTlheE1uL2crOWhFZDU2aEVlV2pQQjlRUWNURTNOYXNYczUyMXlmTW1Y?=
 =?utf-8?B?OGxEbXVhSitGWGdRMEYvSjNWRDRGRGcrWjBRNzZ5WTN5ZzJsR2w3aVV1UHVr?=
 =?utf-8?B?UVFrejBZbjFJdXp6U3lpOTlYTERQaThaemJvbm9YNXM3WER0aVlOYUFRbmtk?=
 =?utf-8?B?YzkzNUs3YnJnNGdpMTVWbEhsWnFxZUZmczZlelJMYTFzZysyVG0vQm5ZT1d1?=
 =?utf-8?B?bm1TRW01MGZqK0tzWVNqdWN2cGdHWDBCdGJvUnZHenloclA1bXZ0M1lBODA1?=
 =?utf-8?B?OHUzckFPSk9KOVhEbGh6RTFQNlBxaEY2THhhWURrS3kySnROeE8wd1prZVlT?=
 =?utf-8?B?cmw5R2NQTDNNQWtXd0JUNnVYMUt4Lyt5WU5XamdBaExJMnZ6NHJUVk9UcVd4?=
 =?utf-8?B?Mk1sL1VIWUN5MFdPYTVUdXh0OTZaTDF6NnllaWs2WDlyb0JraHZNYTdqVUx6?=
 =?utf-8?B?NWs3bFpoS3VTSHdSZnpMYXhUZWhuQXJ3UnJwWVhlSG1CUWZwZzI5RUs4cWVw?=
 =?utf-8?B?dEp2cU5MUmo3RmE4RTJNZEZ3VW1iU3k5UFNyRmNxcUxIQ3I3SklzZU9LOERF?=
 =?utf-8?B?M0w3ak1wb2l0eVRyWjRHUnRpbWtaZ2IxMEFYbkcwaVZ4c3hralN1SnlrTFBR?=
 =?utf-8?B?Sy9xVTR3Sy9pbFVtb3lsVU0zMkI0N25Gd250MWhYdlhPQi9xczlXRmtuS3pY?=
 =?utf-8?B?WExLbGsvMjgyOGFCNVI2VEExclZlNkVWR0pJTlZzRm11MGFyWXNvYU1vUHNM?=
 =?utf-8?B?WjVlU1pDSEFJcWhNa1p5dWdyZUZ6QVRjSG14NGUrNjNybjJqNUlMUngvNlBH?=
 =?utf-8?B?UHgwOW5WU2xzbjg2ZWxod3VWSi9NYWF2b1loT1A0Niswc0tlV1NONEtPQ0w0?=
 =?utf-8?B?Kzh6N2NQVFptSkc3eFJJcjROYjBsQlFDMW1rMzdQVUM2NGVjYWRPV1hUV1Z1?=
 =?utf-8?Q?5AqeSSvE3l4oDgJK5iPRnkmi+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a08ccf5-4fbc-402b-51fd-08dc8c1b5c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 02:40:31.6454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3G7QyIk4R+avgTco3I3GbyAq4prLZqkZC054KtmpjY6JUgOgDonzlV9as21Cvq+cJH365pfmZGgNaOkXYQ9bvg1aftYe0DhG/O6zvJuwVjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEt1cHB1c3dhbXksIFNhdGh5
YW5hcmF5YW5hbg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy8zXSBQQ0kvQUVSOiBDbGVhciBV
TkNPUl9TVEFUVVMgYml0cyB0aGF0IG1pZ2h0DQo+YmUgQU5GRQ0KPg0KPg0KPk9uIDUvOS8yNCAx
OjQ4IEFNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IFdoZW4gcHJvY2Vzc2luZyBhbiBBTkZF
LCBpZGVhbGx5IGJvdGggY29ycmVjdGFibGUgZXJyb3IoQ0UpIHN0YXR1cyBhbmQNCj4+IHVuY29y
cmVjdGFibGUgZXJyb3IoVUUpIHN0YXR1cyBzaG91bGQgYmUgY2xlYXJlZC4gSG93ZXZlciwgdGhl
cmUgaXMgbm8NCj4+IHdheSB0byBmdWxseSBpZGVudGlmeSB0aGUgVUUgYXNzb2NpYXRlZCB3aXRo
IEFORkUuIEV2ZW4gd29yc2UsIE5vbi1GYXRhbA0KPj4gRXJyb3IoTkZFKSBtYXkgc2V0IHRoZSBz
YW1lIFVFIHN0YXR1cyBiaXQgYXMgQU5GRS4gVHJlYXRpbmcgYW4gQU5GRSBhcw0KPj4gTkZFIHdp
bGwgYnJpbmcgc29tZSBpc3N1ZXMsIGkuZS4sIGJyZWFraW5nIHNvZnR3b3JlIHByb2Jpbmc7IHRy
ZWF0aW5nDQo+L3Mvc29mdHdvcmUvc29mdHdhcmUNCg0KR29vZCBjYXRjaCwgd2lsbCBmaXguIEl0
J3Mgc3RyYW5nZSAnY2hlY2twYXRjaCAtLWNvZGVzcGVsbCcgZG9lc24ndCBjYXRjaCB0aGlzLg0K
DQo+DQo+TWF5IGJlIHRoaXMgaXMgYWxyZWFkeSBkaXNjdXNzZWQuIEJ1dCBjYW4geW91IGV4cGxh
aW4gd2h5IHRyZWF0aW5nDQo+QUZORSBhcyBub24tZmF0YWwgZXJyb3Igd2lsbCBicmluZyBwcm9i
aW5nIGlzc3Vlcz8NCg0KQ29waWVkIGJlbG93IGZyb20gc3BlYyA2LjEsIDYuMi4zLjIuNCwgc2F5
cyBpdCBjYW4gcmVzdWx0cyBpbiBhIFN5c3RlbSBFcnJvci4NCg0KSW4gc29tZSBjYXNlcyB0aGUg
ZGV0ZWN0b3Igb2YgYSBub24tZmF0YWwgZXJyb3IgaXMgbm90IHRoZSBtb3N0IGFwcHJvcHJpYXRl
IGFnZW50IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBlcnJvciBpcw0KcmVjb3ZlcmFibGUgb3Ig
bm90LCBvciBpZiBpdCBldmVuIG5lZWRzIGFueSByZWNvdmVyeSBhY3Rpb24gYXQgYWxsLiBGb3Ig
ZXhhbXBsZSwgaWYgc29mdHdhcmUgYXR0ZW1wdHMgdG8gcGVyZm9ybSBhDQpjb25maWd1cmF0aW9u
IHJlYWQgZnJvbSBhIG5vbi1leGlzdGVudCBkZXZpY2Ugb3IgRnVuY3Rpb24sIHRoZSByZXN1bHRp
bmcgVVIgU3RhdHVzIGluIHRoZSBDb21wbGV0aW9uIHdpbGwgc2lnbmFsIHRoZSBlcnJvcg0KdG8g
c29mdHdhcmUsIGFuZCBzb2Z0d2FyZSBkb2VzIG5vdCBuZWVkIGZvciB0aGUgQ29tcGxldGVyIGlu
IGFkZGl0aW9uIHRvIHNpZ25hbCB0aGUgZXJyb3IgYnkgc2VuZGluZyBhbiBFUlJfTk9ORkFUQUwN
Ck1lc3NhZ2UuIEluIGZhY3QsIG9uIHNvbWUgcGxhdGZvcm1zLCBzaWduYWxpbmcgdGhlIGVycm9y
IHdpdGggRVJSX05PTkZBVEFMIHJlc3VsdHMgaW4gYSBTeXN0ZW0gRXJyb3IsIHdoaWNoIGJyZWFr
cw0Kbm9ybWFsIHNvZnR3YXJlIHByb2JpbmcuDQoNCj4+IE5GRSBhcyBBTkZFIHdpbGwgbWFrZSB1
cyBpZ25vcmluZyBzb21lIFVFcyB3aGljaCBuZWVkIGFjdGl2ZSByZWNvdmVyDQo+L3MvaWdub3Jp
bmcvaWdub3JlDQoNCldpbGwgZml4Lg0KDQo+PiBvcGVyYXRpb24uIFRvIGF2b2lkIGNsZWFyaW5n
IFVFcyB0aGF0IGFyZSBub3QgQU5GRSBieSBhY2NpZGVudCwgdGhlDQo+PiBtb3N0IGNvbnNlcnZh
dGl2ZSByb3V0ZSBpcyB0YWtlbiBoZXJlOiBJZiBhbnkgb2YgdGhlIE5GRSBEZXRlY3RlZCBiaXRz
DQo+PiBpcyBzZXQgaW4gRGV2aWNlIFN0YXR1cywgZG8gbm90IHRvdWNoIFVFIHN0YXR1cywgdGhl
eSBzaG91bGQgYmUgY2xlYXJlZA0KPj4gbGF0ZXIgYnkgdGhlIFVFIGhhbmRsZXIuIE90aGVyd2lz
ZSwgYSBzcGVjaWZpYyBzZXQgb2YgVUVzIHRoYXQgbWF5IGJlDQo+PiByYWlzZWQgYXMgQU5GRSBh
Y2NvcmRpbmcgdG8gdGhlIFBDSWUgc3BlY2lmaWNhdGlvbiB3aWxsIGJlIGNsZWFyZWQgaWYNCj4+
IHRoZWlyIGNvcnJlc3BvbmRpbmcgc2V2ZXJpdHkgaXMgTm9uLUZhdGFsLg0KPj4NCj4+IEZvciBp
bnN0YW5jZSwgcHJldmlvdXNseSB3aGVuIGtlcm5lbCByZWNlaXZlcyBhbiBBTkZFIHdpdGggUG9p
c29uZWQgVExQDQo+PiBpbiBPUyBuYXRpdmUgQUVSIG1vZGUsIG9ubHkgc3RhdHVzIG9mIENFIHdp
bGwgYmUgcmVwb3J0ZWQgYW5kIGNsZWFyZWQ6DQo+Pg0KPj4gICBBRVI6IENvcnJlY3RhYmxlIGVy
cm9yIG1lc3NhZ2UgcmVjZWl2ZWQgZnJvbSAwMDAwOmI3OjAyLjANCj4+ICAgUENJZSBCdXMgRXJy
b3I6IHNldmVyaXR5PUNvcnJlY3RhYmxlLCB0eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVjZWl2
ZXIgSUQpDQo+PiAgICAgZGV2aWNlIFs4MDg2OjBkYjBdIGVycm9yIHN0YXR1cy9tYXNrPTAwMDAy
MDAwLzAwMDAwMDAwDQo+PiAgICAgIFsxM10gTm9uRmF0YWxFcnINCj4+DQo+PiBJZiB0aGUga2Vy
bmVsIHJlY2VpdmVzIGEgTWFsZm9ybWVkIFRMUCBhZnRlciB0aGF0LCB0d28gVUVzIHdpbGwgYmUN
Cj4+IHJlcG9ydGVkLCB3aGljaCBpcyB1bmV4cGVjdGVkLiBNYWxmb3JtZWQgVExQIEhlYWRlciBp
cyBsb3N0IHNpbmNlDQo+PiB0aGUgcHJldmlvdXMgQU5GRSBnYXRlZCB0aGUgVExQIGhlYWRlciBs
b2dzOg0KPj4NCj4+ICAgUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PSJVbmNvcnJlY3RhYmxlIChG
YXRhbCksIHR5cGU9VHJhbnNhY3Rpb24gTGF5ZXIsDQo+KFJlY2VpdmVyIElEKQ0KPj4gICAgIGRl
dmljZSBbODA4NjowZGIwXSBlcnJvciBzdGF0dXMvbWFzaz0wMDA0MTAwMC8wMDE4MDAyMA0KPj4g
ICAgICBbMTJdIFRMUCAgICAgICAgICAgICAgICAgICAgKEZpcnN0KQ0KPj4gICAgICBbMThdIE1h
bGZUTFANCj4+DQo+PiBOb3csIGZvciB0aGUgc2FtZSBzY2VuYXJpbywgYm90aCBDRSBzdGF0dXMg
YW5kIHJlbGF0ZWQgVUUgc3RhdHVzIHdpbGwgYmUNCj4+IHJlcG9ydGVkIGFuZCBjbGVhcmVkIGFm
dGVyIEFORkU6DQo+Pg0KPj4gICBBRVI6IENvcnJlY3RhYmxlIGVycm9yIG1lc3NhZ2UgcmVjZWl2
ZWQgZnJvbSAwMDAwOmI3OjAyLjANCj4+ICAgUENJZSBCdXMgRXJyb3I6IHNldmVyaXR5PUNvcnJl
Y3RhYmxlLCB0eXBlPVRyYW5zYWN0aW9uIExheWVyLCAoUmVjZWl2ZXIgSUQpDQo+PiAgICAgZGV2
aWNlIFs4MDg2OjBkYjBdIGVycm9yIHN0YXR1cy9tYXNrPTAwMDAyMDAwLzAwMDAwMDAwDQo+PiAg
ICAgIFsxM10gTm9uRmF0YWxFcnINCj4+ICAgICBVbmNvcnJlY3RhYmxlIGVycm9ycyB0aGF0IG1h
eSBjYXVzZSBBZHZpc29yeSBOb24tRmF0YWw6DQo+PiAgICAgIFsxOF0gVExQDQo+Pg0KPj4gVGVz
dGVkLWJ5OiBZdWRvbmcgV2FuZyA8eXVkb25nLndhbmdAaW50ZWwuY29tPg0KPj4gQ28tZGV2ZWxv
cGVkLWJ5OiAiV2FuZywgUWluZ3NodW4iIDxxaW5nc2h1bi53YW5nQGxpbnV4LmludGVsLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6ICJXYW5nLCBRaW5nc2h1biIgPHFpbmdzaHVuLndhbmdAbGludXgu
aW50ZWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5k
dWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvcGNpL3BjaWUvYWVyLmMgfCA3ICsr
KysrKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMgYi9kcml2ZXJzL3Bj
aS9wY2llL2Flci5jDQo+PiBpbmRleCBlZDQzNWYwOWFjMjcuLjZhNmEzYTQwNTY5YSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMNCj4+ICsrKyBiL2RyaXZlcnMvcGNpL3Bj
aWUvYWVyLmMNCj4+IEBAIC0xMTE1LDkgKzExMTUsMTQgQEAgc3RhdGljIHZvaWQgcGNpX2Flcl9o
YW5kbGVfZXJyb3Ioc3RydWN0DQo+cGNpX2RldiAqZGV2LCBzdHJ1Y3QgYWVyX2Vycl9pbmZvICpp
bmZvKQ0KPj4gIAkJICogQ29ycmVjdGFibGUgZXJyb3IgZG9lcyBub3QgbmVlZCBzb2Z0d2FyZSBp
bnRlcnZlbnRpb24uDQo+PiAgCQkgKiBObyBuZWVkIHRvIGdvIHRocm91Z2ggZXJyb3IgcmVjb3Zl
cnkgcHJvY2Vzcy4NCj4+ICAJCSAqLw0KPj4gLQkJaWYgKGFlcikNCj4+ICsJCWlmIChhZXIpIHsN
Cj4+ICAJCQlwY2lfd3JpdGVfY29uZmlnX2R3b3JkKGRldiwgYWVyICsNCj5QQ0lfRVJSX0NPUl9T
VEFUVVMsDQo+PiAgCQkJCQlpbmZvLT5zdGF0dXMpOw0KPj4gKwkJCWlmIChpbmZvLT5hbmZlX3N0
YXR1cykNCj4+ICsJCQkJcGNpX3dyaXRlX2NvbmZpZ19kd29yZChkZXYsDQo+PiArCQkJCQkJICAg
ICAgIGFlciArDQo+UENJX0VSUl9VTkNPUl9TVEFUVVMsDQo+PiArCQkJCQkJICAgICAgIGluZm8t
PmFuZmVfc3RhdHVzKTsNCj4+ICsJCX0NCj4NCj5XaHkgc3BsaXQgdGhlIGhhbmRsaW5nIHBhcnQg
YW5kIHN0b3JpbmcgcGFydCBpbnRvIHR3byBwYXRjaGVzPyBXaHkgbm90DQo+bWVyZ2UNCj50aGlz
IHBhcnQgb2YgcGF0Y2ggMS8zLg0KDQpUaGlzIGlzIGJhc2VkIG9uIEJqb3JuJ3Mgc3VnZ2VzdGlv
biBhdCBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1wY2kvbXNnMTQ5MDEyLmh0
bWwsDQpjbGVhcmluZyBVTkNPUl9TVEFUVVMgbWlnaHQgYmUgbW9yZSBpbXBvcnRhbnQsIGRlc2Vy
dmUgdG8gcmFpc2Ugb3V0Lg0KDQpUaGFua3MNClpoZW56aG9uZw0K
