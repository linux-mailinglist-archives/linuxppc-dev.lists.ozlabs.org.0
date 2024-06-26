Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA79178A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 08:13:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GbIlGQFQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8BGM55B6z3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 16:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GbIlGQFQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 26 Jun 2024 16:12:53 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8BFd2wbLz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 16:12:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719382375; x=1750918375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t5kFOL26FKqErH7/75/kLz8JVthUyyur+5ROSrjsM28=;
  b=GbIlGQFQ5GGIISWafujEtt5IizYU9f4mGgEpnMx+MEAJnmcqjmsXp1Im
   gCB8JJfQWY79MjYqeeQeqzK3FLDOnR5EnWYtNBqurbHsz6wwbqbxK5ivv
   0fzjEaYa9ytF2FEscZXQGfHV+V+KdhG5DsuLfU/YyRHazPaXo6EkvZoPS
   h5ecPexSOi+LQp3f7UBLdwBETy2AMKDiw4fnwl87utoOsOCdKoJlToSmy
   O4TlApwY9PaGAXQDplm75VJTEfHDcbIRqSDOD+VNUwviVRbRj8bHKp4u1
   4mhQHPShBK/TvnuW6dxJvWosi+Vudd/5OTn9mtdIeHvqXUNMe0aVHZ6da
   Q==;
X-CSE-ConnectionGUID: SEQt4JWmREOJ7YRrFv9jyw==
X-CSE-MsgGUID: kdPYUNDCQxmj90xoyQZK4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27841669"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="27841669"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 23:11:31 -0700
X-CSE-ConnectionGUID: bxoVJ6oBSMWWmVThbKsj4w==
X-CSE-MsgGUID: 48Q4rEzXS4GwjOs5t28Trw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="49058636"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 23:11:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 23:11:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 23:11:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 23:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJx9SUp9NndkNHVYJi4HQYyOTnLrCdT9FK7KOhxwCSlnU86VRUnAvejMi/fmDdgt1heNwZIT5KThAbnc646BUcerpKXzB1XTC1VBoyFfCK7tZ44BmHIu7NdmvJct9HRvVnmOGf/luVOElAHzXP2nWs6t78/139wCY5BPdtN2JJFhQayuDfxdw5oBSozXvHPuhdLIWxFMmI6bYy4/zhP8AJw/63gIk/7zNpgNRYnLPYsB0ksNrkX2VLj8kM4LPk5yr1NQq3gLuTM2HSAlgoQZuxw1u21OIjEYxftExrOcn0eKrHa1EQsUJz+RIiqItQ141Lgs6b+lwuUJrnphrvPqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8fSauy/TvO+99Vvwkl3RhAOh0VOzLNYuHGS202phAg=;
 b=lhiLnkbGk2lf+f7pFFALd8EuEtzimO8YXjEK42hYfcvENwx91wwmq5JGxmBTRjoYEmYDBBkLk3ACR32A0K/LcW5cm/qIwtF5rcRIyihXkGCekcGhpcL0zpfh5x6FW0DoIuVkWRguTOusniMyhsJZ73xmEZ3ZR4U34hFnuR34Tx4trQ5c+ZNU3yuaD/TEgnDrTyBegFq/9s0sm/9t74UJomkaPRQ5yAFxCxseBGWNUSmQd3P+M5Fi1u13npmCN6kSHD2CNhq4xdQwqYKoAhUOF9lh78IliQM7/1aYqN1lbSCyn0QvoEsmXCeQr5cREYjOCPtQFOr8eW8MWsUGFwbhWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7440.namprd11.prod.outlook.com (2603:10b6:806:340::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 06:11:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 06:11:28 +0000
Date: Wed, 26 Jun 2024 14:11:11 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f: fsmark.files_per_sec
 -64.5% regression
Message-ID: <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
 <20240624083537.GA19941@lst.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624083537.GA19941@lst.de>
X-ClientProxiedBy: SI2PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:4:186::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 240e8ff1-6e30-4b38-0751-08dc95a6d14f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|1800799022|7416012|376012;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?a64+Aa+OBxr+fpZKf9+yf1y8XxQTNVNIOupwG3tBSFq6U+OzazbDUoWdbL?=
 =?iso-8859-1?Q?RpCuChvnGHZHU7tjWDc7ooVlA6VzPMCbMAja43FPN61qBv/rWq4ySW+3IQ?=
 =?iso-8859-1?Q?+8XZPGqOm1/t0V8eY8yurQDDH5Ji78+rBzz/3DZpuNZP9LQgLmXHbBZj7v?=
 =?iso-8859-1?Q?05Qjjm/p1QpARKqMlDL6OdcyUX4F+1bNeuf69KcsFPatzP5TloxdE0eyEi?=
 =?iso-8859-1?Q?Ks1CfBlw9t8xzW9VpG/lz6bUT/Ir3l39TzV982XR81PPVPO/onwJX/ssUT?=
 =?iso-8859-1?Q?cgJMniiIN7QoVlvLuoCyesSBrkO2C9PB+nxMmNk9MJItrKIAmu3qtQO0x+?=
 =?iso-8859-1?Q?9J3ig7/9MzyqbmQ3a0un0vPPQzkDtG4Hf1cPYYn8yFzfwis4c/jvYAiQWh?=
 =?iso-8859-1?Q?y8U4r3kysVo3oABXf87JDkKVVIEkGW10hZB3hjFoZ5Mjfq2KYHSj/e124Y?=
 =?iso-8859-1?Q?fJlrSxSwciJxT5G4Wz5d1vfC2XraDaRmfOx2NDKZl1Lv/9rTXdi9Cojzap?=
 =?iso-8859-1?Q?cBdRUu4EZaFs9b1RdeodvDpx65C31CBy8HZa8XKpYST8ciRqZhtXS4prZh?=
 =?iso-8859-1?Q?iSIozH4Bc71JTOWm2lyku1bWS06c8WJ7nRJEhX1CnCTEs6er4Yx3dgsZ7W?=
 =?iso-8859-1?Q?+0GE7UZwzljfQgYO/3ZhlZnL5Zv72C7J5rF5mjcrbCFdu56IPptmS9844F?=
 =?iso-8859-1?Q?w0yS8szsGUAkkyKd/+ek8nMY9oRCmeJjWcefhP53YnOVwoKWpG1cHKKrPA?=
 =?iso-8859-1?Q?MOfHMQFufo3AkrSIvzxhMBQCEuN8u/defsCzzkM6TcSNTeu/vGxtkfpAFT?=
 =?iso-8859-1?Q?Jvz5MAUB5yEAOScw1mJFvuzWk2g5ifW0BJDy+IaVkKS+j8FzcNx/8x0bqu?=
 =?iso-8859-1?Q?I89VKVLPklDFddt0ZBy62XGgoJKah/KftaxouDJkVk5DQQ5Dv1ksszN5Zm?=
 =?iso-8859-1?Q?J/VxyrPgH5E/UqopOklFx4OmDf0pHtZX+mKkSYktNksKOvCosS26t3J64X?=
 =?iso-8859-1?Q?DkvkE7OjsI7HH02O+FlInjcHCtEnXwYgo19sFLCzhO5Brl+n3h1kxMYeyj?=
 =?iso-8859-1?Q?O5w5abmwsPRUYDFTk6hH7SfdK48f3y1/dy/XJlCCplVFaRdbzoRGFBDZFY?=
 =?iso-8859-1?Q?5QzidBGU9/bEDvWMMLCqX6NKT3SztMMoaOy+4cqrJCuU2W3188g9KoLWxR?=
 =?iso-8859-1?Q?bCMnfuIgUWrPJBQiA0rWMX4WAfrBeKcUW+5z2CnIG8e5VRHLPeuAC+WZip?=
 =?iso-8859-1?Q?6x+0Lu9pUPMc9IpCL7vld4H9xff+/g1/LcLiLnFp7Ed5yISS4Jc2ZM3a4J?=
 =?iso-8859-1?Q?J3qg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(7416012)(376012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?i5/fM8SHslBnAC2ne5UoVaNUKih9tn+rmnjB84Nv5+puKAdJC6qhGRglu9?=
 =?iso-8859-1?Q?CSa4ZF8vOIfTk0LcuTnMnRmCl/RUNrGLDbcCDXusEO/mjY6XlQTy2m7sA/?=
 =?iso-8859-1?Q?YYCE5CTQOkruWdHNqM2pdF27ctR7jRKFDNtseI3FnNlcYz5gRpxC08Z+KV?=
 =?iso-8859-1?Q?bCj5+WF5BCkRtKZyZnrD9ZQWa5YTw/Qjs+9FymTyvVV0sf6D8tKZ7Uiyp8?=
 =?iso-8859-1?Q?mV4a59sMNoqy/ZiCWgQelE35mVghDKZsYT7rrvfEHIS1JTY89S2f8GN2Sx?=
 =?iso-8859-1?Q?7KgvJSegPsU6A2Z8sd7XBXlYE2mFRS0iexmgq21mpRt7rtEnWNJzCP0mwY?=
 =?iso-8859-1?Q?8YWK8QfGEEc2tduEAu9Kz0LAwXCBNULbNJeapSFpU1uwJB+dt/vENYCNT5?=
 =?iso-8859-1?Q?NUYjtc+M4lTWh5/rgSulV9NsdcdiPM3hcTRwyDl9GKhYnDFr1WFlKxOKlS?=
 =?iso-8859-1?Q?SUwG1x9zzVzBlItOzkid2kje8JQ5dIt2BOsIbYExnBtm8eMHYsJbQfb8is?=
 =?iso-8859-1?Q?svbQARGnCweR6nXxM+1QdCGO5oWGFJHodP/tMxSqnAT2Zvp2AcsBASLQFU?=
 =?iso-8859-1?Q?RE7GUJ82QrTd83svc+EjhaHIB+qFdoUyNEoYehNcCGsgwqlQMCADdy3vf4?=
 =?iso-8859-1?Q?eNq/oBZztGkfg0Tk4aj+K8sjcYM5rXUl0LfgTdL+83lRysCwELX2zf2BmN?=
 =?iso-8859-1?Q?GztBGhxXpyDuCbh0mWRw5FUkyV4Urs5hu/Zhv7Sd16ocgvnudJGmu4w/Dq?=
 =?iso-8859-1?Q?ZcxyRoH9rAOGS2tnsIvjUfLbrPkbYo1YJV3lekulNTV10pf84hur52Hdj1?=
 =?iso-8859-1?Q?HSNDb4UMyK1lJhG5jD4MX5N2pAzW5es24vCtECZ1AM1lm8DLncjbZlNa6m?=
 =?iso-8859-1?Q?mv3TZMlsE6mPyp8TS0i4YV4kIL7Ny1dMvn6JL06sfqYUul2T0SvtRglLTw?=
 =?iso-8859-1?Q?mN7nywq1p8OulcASBHTK2iXYy1gFi+pSPQa7czHwOLcJlvMIjlxw+hErEj?=
 =?iso-8859-1?Q?DBRogqnmUNF1D6b6JGLnh67V+qAYYlcpBMIhqwbAC2HBRlgIRhhWZe+h9b?=
 =?iso-8859-1?Q?owIgwcnDR2Eu3crAGOsIbNswoYhz8FCO2I+aHK6e2UQIOXw/lUNit9wVgI?=
 =?iso-8859-1?Q?r4aB6zX88zlSKaZNQLG7b+R/6ol/GOjUTXDueUhfyB+DIFNA6/rtaWeso7?=
 =?iso-8859-1?Q?3mp8rWcv2C1g3dLhTT5t0xXxS4+NCEpzXMqUsYhWj3CKYBpcjoWwWFaeT2?=
 =?iso-8859-1?Q?uT1kxdbYpyvmHmIgzPjxWB/oJdeZne03Hnwd8sRIoL2HsvbqTlFGx7G0eH?=
 =?iso-8859-1?Q?EKaMlx9dXYmcFYPckmhRID19radNtaBbgbLQ8+2hjiK7R+SDeASQ5y/8tK?=
 =?iso-8859-1?Q?ln+032cY4xH2Gx15s8csP/dAe59Uhwau5fXbCy7br+ZdWorFMXOabtMjw2?=
 =?iso-8859-1?Q?mALrnt3i3aWvtXMmoEUYSKqJFQ4sTwOrpp5e3IphxS9zv98oQr0S0ls+Rk?=
 =?iso-8859-1?Q?7F2HhdjzzmH8VvG3rzgjc2rBtVtQaVmZOqSK0bp369zezyAUbsCFt7/PZV?=
 =?iso-8859-1?Q?lnwzVCj23jjdZjbcsa82aikGAjq9IjNZnlAZmrixdvzpbtXhxn4BDFfT+c?=
 =?iso-8859-1?Q?Lwqa6vw+t0NBK3vTLLe8rttDwzWcLiO/XPuQGq+B6amV+gsRayB+yGkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 240e8ff1-6e30-4b38-0751-08dc95a6d14f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 06:11:28.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rBI4MbOiujmbQZnU6yBi9cXBp9FqVQGvMABiGD37FJd/z+ZIvV86HbcSvfVmFpW3TK30K2gVluEBOTixDjIgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7440
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
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org, fengwei.yin@intel.com, linux-mtd@lists.infradead.org, linux-bcache@vger.kernel.org, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, oliver.sang@intel.com, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi, Christoph Hellwig,

On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> This is odd to say at least.  Any chance you can check the value
> of /sys/block/$DEVICE/queue/rotational for the relevant device before
> and after this commit?  And is this an ATA or NVMe SSD?
> 

yeah, as Niklas mentioned, it's an ATA SSD.

I checked the /sys/block/$DEVICE/queue/rotational before and after this commit,
both show '0'. not sure if this is expected.

anyway, I noticed you send a patch [1]

so I applied this patch upon bd4a633b6f, and found the performance restored.

=========================================================================================
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_directories/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size/testcase:
  gcc-13/performance/1SSD/9B/nfsv4/btrfs/1x/x86_64-rhel-8.3/16d/256fpd/32t/debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-ivb-2ep2/400M/fsmark

commit:
  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")
  e9a0f6a398 = bd4a633b6f + patch [1]

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 e9a0f6a398f162d115d208ad95b
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
      4177 ±  2%     -64.7%       1475            -1.1%       4130        fsmark.files_per_sec


[1] https://lore.kernel.org/all/20240624173835.76753-1-hch@lst.de/
