Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C797E919D51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 04:36:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AE10sN/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8jPn20RCz3gK2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 12:36:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AE10sN/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8jP15yKjz3g91
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 12:36:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719455767; x=1750991767;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Tm5fXzj/0p2EHgLOiFB38ADrMsp4/BzPcBMAMvA3Zcg=;
  b=AE10sN/CUnKoPQnur7OPX3X+ZQBaljd5vcR9tk29iwrkHdlqa3mlBa+1
   F9KArwa/dLJjtQU7h0GFfOZVENI+OdPn1sI8e/4l8gd7n2TTFm7pbXpia
   t0Ob1Jp5mTHv46IDImBwaSDXtd+s5LfX5U2f3nBMGiLgaa/m+F9x4zpE9
   o7vAGmvEvxzxcgVDhxMyCIANa9NBuL0d8kNS2Ap28DVCmfOf8VUcx3bYJ
   UxDvAmd6IFKWOohsTw0Zhpx1OvltYzo6WJU/BgG+jESQEptyYdLpWtLNa
   c/DcXt9a8Jau/zVgvfgGwB6ecVCGh0k9tnwBQo4cmPyRWGvO69lSS4ToS
   g==;
X-CSE-ConnectionGUID: D4ppWZdUSa6ryIrYEkog2w==
X-CSE-MsgGUID: bWNo+wzpSVWzeEm8YQuHIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27150866"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="27150866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 19:35:59 -0700
X-CSE-ConnectionGUID: j10ZU3/DQnqD1weyP265+g==
X-CSE-MsgGUID: iUcHYBtvRKG8/JVyWBtSnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="44643323"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Jun 2024 19:36:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 19:35:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 19:35:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 19:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekMKBmk67ur17JmKVOIbQXZ1fARbRMGad4UXkuRY2r5YWVhRlmYLRuAa+tk1/jQevXtZHlBL8lUxrEMhSQJsAURlKSzRRiRw0jEbfll1whAAun0sBah1iYobacA6l5JVeYheJXjv+ThwF0/cdVlkV6FbZRrf1v9yFFidoWgXOJ0ZDKV9PTlyKmuQvshTXGPE3dTjc0ErAMv8vh95mcvW7Fhst5mLVb6+KVI5wsNpPZWsFw/F2t7Xfc1zrwjTNiZciiNHPCHR3eufqHQmDBlNg0exJng8atRJBdhjD0Qlp0TygNLw+LcMRT/bcdj8s56rYC49D04Rl+uTrDmRjXJX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jSD7+FSTNy4cDlgbUVR5l0uy8U1HhJxiVCdYXXKGto=;
 b=cS1onbZTaz6hoAaeHtDFbFFAoLCBqY89YJ0ChMu/l5JygZp83vUplEo1j5ino1QNK0G5wxNYjBav2K4grmtn42ti+SzaiVdJQXHKI2rSYMyt6vlHYR4NtdibDCki+rI4OzvLVJPtupLeN7/ryWBhwuB8cVD62dKxeySX/pzy2w3lI71tWZqfH+s4TY6x7F4SxSh9qsfL8m6gpv1LlU5Xsg2aeJEpec41cykvfRENtheWAohONum+gjJQGsAsHQ7g+hhZIBvf2SnCXF4YVi4La+KNibZcbdQTWYAzAYwY5RdzxJEN4WWwBIgChOqdJcnKa9UeBmftpbkYiZTnwp1e4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 02:35:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 02:35:55 +0000
Date: Thu, 27 Jun 2024 10:35:38 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnuNhkH26nZi8fz6@infradead.org>
X-ClientProxiedBy: KL1PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 674cc3cf-f9ec-45c0-a6a8-08dc9651dedf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TRxfcgNOCtfec4hTwWFvMGMk/COYA0kIqOAMmNI1yLflOEUnMrC3HKSuGvS7?=
 =?us-ascii?Q?FlZ5anx25Bn6ds9LE7sKSXWnS9P0z+RqwfQwFZKr+N8xbpF4rO4O0JckG4yr?=
 =?us-ascii?Q?18GkU0fXamh/e6RVsa6DxlKZIQ/siRR2kROXVVBspKb1TXmivGfTpqoSALDT?=
 =?us-ascii?Q?D6K8RFOdaN23OAQr/BzT579DCtLzqhLQw89jGBHWmddgAc5XlHMsoxm23v9x?=
 =?us-ascii?Q?ZGf094sZ/4Do+7jifvn7Noc+OwuzRT06IKl/5fLQ3ZslTgJRLGfgJCRJsO+R?=
 =?us-ascii?Q?b7mWhhQBVT5hsWsYMBgyyKLwtteXCPK1OH5xqdNJeH470XH+opeH3e8hYtrJ?=
 =?us-ascii?Q?yyNTwe0U7WX2XUwY8FrMtkItIBEGZX2cbquzZSy+59z9gFt7g4Uc2zBjsE98?=
 =?us-ascii?Q?Jvf3otBt+Mg9ThMrpecwfNx1wJMEsHdeaywbAaGUkBBgHssBmYiqxpEA8EAq?=
 =?us-ascii?Q?77ii0hZNzvN5Jb2LhIDw7rBPHTt8GWY3doXv2iyu0T1BQOhnfSpVgDazU6SF?=
 =?us-ascii?Q?2IoUQY14B6+aa4aqByEtt2QVDHvbRHKRVBbEZGjNBn5WAEZYT/bgi/TvkzOX?=
 =?us-ascii?Q?LwAsZ5td/r7dAQBAlBn0ikMs5cH4ulNUo9onVMsbIS+4HRuv2mNxC1EWbMQh?=
 =?us-ascii?Q?guAGtIdIstekDRPHgnbw2C0dIZu4y5YePzd5+2834CTx90RUj/X59bcH1h9p?=
 =?us-ascii?Q?CzmIKkV5lQ6qMtlBj/tGbC93hWjhwyCSmZifp/5omvOc3LVCQCgPzR9azrYk?=
 =?us-ascii?Q?/KNMniNOMacvN921845wipSaJPH84jegt+JSwAgw3fZ/wHlftemOgt75jQ9/?=
 =?us-ascii?Q?Nr0kTnfvJYjRtYWW8DyprJDkprrhwicy36nlg0fpv+rOUZlIjZruK/L13TW8?=
 =?us-ascii?Q?fWG7Q3+w/PTcceIGkWsoQwqM6YktLrnX/51grMHgplF8Jv+gvCSFD49Xrwut?=
 =?us-ascii?Q?csqVFJVPJRNxYhDbY+0DL2cy+Ugg+zoDd6jcKJAY8VC/f083O62ANCxuDGKi?=
 =?us-ascii?Q?NnPxUHYRCfJMBcN6t8DDuG8JMK/XVC4rs5gKDCyw+p5Pj2jzHmnbhuzf8cRa?=
 =?us-ascii?Q?8PzXWrK7CZVb+j8DL9di6kKrGIzUAjYGzjt/3RHS453vPktsWB7toBbq9AXI?=
 =?us-ascii?Q?GHR8zOCq+qocCiTCtGphEI4+rqenHgANTDUD1lbjRtwRjYqYPCuLkobS63HM?=
 =?us-ascii?Q?K3OZGEX3MCVDLHNrnA4XhfEKQYFnecI1PKZBLqd99TsGBPVcF1qPZQ6YcjpF?=
 =?us-ascii?Q?RpjpoLTZqRCuCe4TIGY01vwDDQm2JW9SsDj2PFuaihrMaRJxm+K9FVVf30q6?=
 =?us-ascii?Q?fshmX05BlCbat33Li4490RGv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XkJHoqEbbM3JioGWYfAmoP8lBk7qjFj2lkgZoon44AEkR4yGBxONytPQaEcz?=
 =?us-ascii?Q?bvt87CcroadHHVHWDkhzgrZPOr8Ai6Oo3vK1kK6wtUatWrn84K3MSVps9Plz?=
 =?us-ascii?Q?Q5eaG+UHCcQGUfYkz6Mud6z1tvPGKRyuF5/O0EBDqofeWMvPurkeRfZFYPqN?=
 =?us-ascii?Q?+2m03Q8dPHKXlBC2CTYZREbzJaM7sFbOzyYyewMBegAmXRNL0UFpo6QDHh+c?=
 =?us-ascii?Q?3FRW6irHhD36jivRQTtEHJs7z7qKsfvIxMZVR1+dVN5oi1UahV0Kx4nwAv6B?=
 =?us-ascii?Q?OR0HNy3/wxjkKw2Z2LsOHpxwRpYHd9+spuEXpi8sLDC1Hs4BafOMY00LbILM?=
 =?us-ascii?Q?Pnq7UEPrbKxOrAGZ0VfyOgu50nGFpYbDiNKaQAf+E+38/Z6ewWSTg+itcUyD?=
 =?us-ascii?Q?tKBd2rYqbWAwT8fQ9n4MxKtoWHf4Gv8O8Cj32SYJXLayD/bGJ0Z+v47dSI8V?=
 =?us-ascii?Q?fNx2bjPhrfVU8v0o8eKyp5AphavWzAkHAE3Fy1TTysXTXpiRqPmcJVSVI+Z0?=
 =?us-ascii?Q?Bow6fPlu2zwES1M2fMyErOgyiPkOOBsM7vKZGDKPY3yyQ2GjriCafbzfMQZf?=
 =?us-ascii?Q?xQJrtkEV7M5US6pwa9vQNwf4duLiTSfGqpDuzXa2+RFNxu9lNh5TI9h27NjI?=
 =?us-ascii?Q?a8jenYz7gz0t2CfFu4n26V/NdNtJ+f3TYubNK+it6XWRJP5WNDlYF+UzpSSL?=
 =?us-ascii?Q?Lj1Fy4HTcK9AFV0i4JKWKEPjkDcq5cxKz8KnrklZ2puizFeWJDuyOIsFqzqn?=
 =?us-ascii?Q?R1hmLstI8hD3U36TYol6f8vUZgEiZPFvItB3yJsuPup9LDWndW+PTYYZ+NaR?=
 =?us-ascii?Q?p6pecjyt06v9HMEP48DUKqBQ2V7AR+FJv0NPuB/A8YYknTXgxoSrCxRHfvOb?=
 =?us-ascii?Q?nBUSVHivLm++m/fEbMf9/ISWG1Cyu3Dkwf1CNm6rJ1PtoSPQfJ+3c4zarTG4?=
 =?us-ascii?Q?YT2v4zViUKxGQvVm1QqlN7yRm0VieczBOmGECoTtL3Ab4lSwVvTfhM17EkhR?=
 =?us-ascii?Q?79oCcpcBtlivNjLrS9dGvcph3hGtOCusnR3p9kJLJb+QFsSFd0zJPKgeVDBj?=
 =?us-ascii?Q?nQ0lRzd3afMc7qoIBREKDB7eUv7cjcHZpBfeMsNhtCuhi7TigsvplUHzztl0?=
 =?us-ascii?Q?d9wSS1OHvHR6l7GtMxb3XIdE3Thj8fpX5G1ZErs0THQKnEMRDh5xkIa6ZTXZ?=
 =?us-ascii?Q?hu0qs4qeubuRegkSL8thgXY6AcgylxwoFb1pjftNYxVZZQXT32WhfTAfm+ci?=
 =?us-ascii?Q?InvlSSFUukZnNxmg62LuKScj73V93eNWqGam7DQC48VYvCTbet23Lu3BhgeX?=
 =?us-ascii?Q?AcJJKNVtgv2JYLpgQg31EOCyxK1nqo62id1JjOp0Ku+xOzt1IoZVDUAncb2E?=
 =?us-ascii?Q?bEv/vHy6YUGIOzX9W6On4eERqHrtiXLpEj4uFgZHs50CD3cRiN/muEQlDL0p?=
 =?us-ascii?Q?pgWPxkVUCXMdEBQzT9mt5FcFMn4c5rGB7B8611DgnuepOzrcpAMqZxkgRRYz?=
 =?us-ascii?Q?fj6tdXb1MOfADBp6CPNP6OZ5c2TijvsXYdp6G60Ex2MfiTay+7Ic4GOVHWmn?=
 =?us-ascii?Q?OWwsOpxOauCPVRJfTbRJUl/4EBkIArnZ+JM6VLbc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 674cc3cf-f9ec-45c0-a6a8-08dc9651dedf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 02:35:55.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEBCTBXCHr+NZDa/x9iWUFtzY8u2lfF7JCHOgMZESWvucK+BA/PXRt59u98o1xusx6adaHjnRY53UbVFdCazpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, feng.tang@intel.com, linux-nvme@lists.infradead.org, linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, Damien
 Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, fengwei.yin@intel.com, oliver.sang@intel.com, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi, Christoph Hellwig,

On Tue, Jun 25, 2024 at 08:39:50PM -0700, Christoph Hellwig wrote:
> On Wed, Jun 26, 2024 at 10:10:49AM +0800, Oliver Sang wrote:
> > I'm not sure I understand this test request. as in title, we see a good
> > improvement of aim7 for 1122c0c1cc, and we didn't observe other issues for
> > this commit.
> 
> The improvement suggests we are not sending cache flushes when we should
> send them, or at least just handle them in md.

thanks for explanation!

> 
> > do you mean this improvement is not expected or exposes some problems instead?
> > then by below patch, should the performance back to the level of parent of
> > 1122c0c1cc?
> > 
> > sure! it's our great pleasure to test your patches. I noticed there are
> > [1]
> > https://lore.kernel.org/all/20240625110603.50885-2-hch@lst.de/
> > which includes "[PATCH 1/7] md: set md-specific flags for all queue limits"
> > [2]
> > https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/
> > which includes "[PATCH 1/8] md: set md-specific flags for all queue limits"
> > 
> > which one you suggest us to test?
> > do we only need to apply the first patch "md: set md-specific flags for all queue limits"
> > upon 1122c0c1cc?
> > then is the expectation the performance back to parent of 1122c0c1cc?
> 
> Either just the patch in reply or the entire [2] series would be fine.

I failed to apply patch in your previous reply to 1122c0c1cc or current tip
of axboe-block/for-next:
c1440ed442a58 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next

but it's ok to apply upon next:
* 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625

I've already started the test based on this applyment.
is the expectation that patch should not introduce performance change comparing
to 0fc4bfab2cd45?

or if this applyment is not ok, please just give me guidance. Thanks!


> 
> Thanks!
> 
