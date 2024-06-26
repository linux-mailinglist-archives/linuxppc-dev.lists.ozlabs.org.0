Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BCB917611
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 04:12:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqzmAxVh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W84vl2PVFz3cYl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 12:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqzmAxVh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W84v03gPcz3cPh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 12:11:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719367886; x=1750903886;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=50WaMEwBZ3dy1a2cRL2cbHgRtrZFdVspwOeyKGn5+hY=;
  b=nqzmAxVhsB7AZ7kct3fMacwrua3GgVfNsiIj3YbNzoDjI9x2xXTLYOYX
   5qR8NIr3cCmz/oN3+TKDtX9cZq1bZBiqQfeqai3/cgy/Aom3sIpiPay1b
   7gXcGWqczal8fCkRd7BgpBoj/BqhG6xto0/BWwizWY/5E3Ec+UooBwGv2
   f4LzgxZyyYvAydYwONAMyfs8OFA/V0YGBxxnhF7bmMFLXkYz9X9AovG8F
   +ZLDHvZsqf0E7mGOHpGw8NlAGNOe2+osmiIXqwk0pQi4lCEvQ1AxeS7Zb
   NYGURJFyjf+fZEK8SPNtGp7tMoLgvsIkceA4LMMy2d1ngc13Ejrxkw7Dj
   w==;
X-CSE-ConnectionGUID: cXGPJsjUQdKSEJjnFx4HZw==
X-CSE-MsgGUID: B7+yBWIdSsaB3l9sMmxKCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27560690"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27560690"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 19:11:19 -0700
X-CSE-ConnectionGUID: ECe2zXpSRc6+sE2LvGdEPA==
X-CSE-MsgGUID: WD13XVggQ7yATXYZq7bnJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="67057432"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 19:11:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 19:11:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 19:11:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 19:11:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwqI9Of0yA3VJ34gMAwe+VTMsEJOHi8/a4c8uNF29+OWI8ZOWaodtZW3pyEwn9g9MPFwTzYfzqsbxkOOy4PyVTQ1zO8V10STVHJbITjbZjZPOkJ4PXJrRDgAKwK6btTXRBiUU+VyrcTKuRyt6A3XGOsREUak7LYAYPhUAz9gT37uQ1gbQCozpa4N0ZJkdIcqxunJaIf8x0mEWLP1QVo5vvd2nSznxjz2g86w6j5HPw5jFrJVx7SpRrcetL7KVQUFN9MUqOfuAogkZxDrU4EaLlLnpkBMKh+8l2bOiHy7slt913tKtWAf5MIGQ148gGkLOMMJi7oY/8aWVXLXz9Kn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oscf9f3Z0/GNVRKSzzvOfl2dekrQjhT3kW11lZyZWfg=;
 b=BwJFdGdYd/JyYX3UouusvVjg51gONKT3sUqjwhazVcD1q0mCxW0Z0rPz3DLDkNhMN9rbTWIiO6aHts5xbeLlHmarYvSsaeTiSQV6uSwPBUHIG2gbBZtrt30HJXudfTbhMH4ax842VwOpe8ZSJhT3UqRL+kkKPugqECzemGeZd8LgtM6Y58mrHs/yLBlyN+07kTRyuK688QApi8nz5P/7gDEzlmcKj371Gk4J/u/sPyz8kw/mz5/jNwqrCz7vRELvIxJfpm6r0FpvuuYNDEoz1mOdLUPnSYf/2Vn2gq/7qxCr14koI3uiktv0yCNqL4TJePeLvERUozdNXR93O8Lo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.31; Wed, 26 Jun
 2024 02:11:04 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 02:11:04 +0000
Date: Wed, 26 Jun 2024 10:10:49 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnqGf49cvy6W-xWf@infradead.org>
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 53969801-6740-480e-603d-08dc95853ba0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|7416012|1800799022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jH3y+3Pg9FbsmGD6XbEaM8bVW1QpjH/Mh71CH1kEonnHhpP2n+cPYrnelyAT?=
 =?us-ascii?Q?QRb1Mw46G9+qdY11hgN9Xhh4lzgi2f5f6TbmIx2HZwcaLEDvRxWS13wNr3HR?=
 =?us-ascii?Q?W3nUwanwKLelU1PjrTHe/p9nEvgv8YN7wcSoW+kL7pSX/0tqWxm+QMcRvKCn?=
 =?us-ascii?Q?x5vrxf+uX6czt2yI7J2CxvIQPAegcvppYtox6C3Gq55gUtvzVMwf1tIk+wgE?=
 =?us-ascii?Q?ej6TGxn3OqMUoNZ9s1cobMNyJhEbaLEKYJqqrg7QtMaHj+se+8uQV6A2Dyq0?=
 =?us-ascii?Q?23v2c4oz/rJXqOGtPueSLozDC/ti3jT2Ip5tVgPZ7MfkgWk0TkOPWilhpFec?=
 =?us-ascii?Q?eYCThOdX89idTcPmgiTYH4Pcgy5iPZzsqXMVrsJgFzbi2IZVJEbx7yZOROUJ?=
 =?us-ascii?Q?hRRFHevEGKC7XRkThAQBNF9VWAWY12cOphom4+XMa9cgHmKcBsMvDkUVSPQO?=
 =?us-ascii?Q?KJ/jI5Hk6aNOtNupDlrtkqbd7MqHfQCpR4u7/ciLJAsrVA2F4KJi7JLBtg+I?=
 =?us-ascii?Q?3ZFIY8++5orGT0hJktOFGKf8VVgkXBOJvs35Cx/3wjV2qjNVyUPlIgBb9Jdb?=
 =?us-ascii?Q?zyNvEJYIJ0qfFhrro/Q4sDCBObtFa20tZwEdNci9ADC3MiXkSDV57YzEF7m0?=
 =?us-ascii?Q?p6Qvpe1ChDQMto2LZ5WHhevnmq+ItSFu031rrakdIpDjTg29mAWSpzEHkdwy?=
 =?us-ascii?Q?SLxQg2SwAedMZxxjvtZFJSvyYWDILI7TNDWW1igpVj65J/0Iu6laU2yAloUL?=
 =?us-ascii?Q?cQn77b1TdQ9bWnQzXXR4gLT/kRcXok1gosUuuRacsHJcF9XXhU7NmpLBtTv3?=
 =?us-ascii?Q?TxQojaCcb7cWvgCsYoBbTVQ+016Gkk5f7nxrk18MGcUiJFJx5fVKUAoXdJeB?=
 =?us-ascii?Q?0Tw8xoR6GbjbwkyjUA0a6XpgXR/saESRByuO3dttFJ0k2tC7zTzHDDW5SSpT?=
 =?us-ascii?Q?OneodMFjnZ59Up+3anZw+Mo9wOibmWMmjNg4VtcolBQO261eRM5cNMGVVo2+?=
 =?us-ascii?Q?DE8bezQbQSaK2FO90WKUV5b8O9IcAGlZWKXh63K5uKsHM1RXSAO/A8Htc8eN?=
 =?us-ascii?Q?U1TVXfTY+VQ8GqRAPfk7TeI8V7EO+AMWWD+FlG4Dwx4tZZhCoWyXEjRlMTyi?=
 =?us-ascii?Q?q8bOKa9LZ1L6ck5ejKC8RJFcbUgSgRvIO7b+Y4TQxqY2vPdcXxfe18eNLOhT?=
 =?us-ascii?Q?1SyKhmhI+pSH/n6LZg2h3UlkNHb47DDT60q0lItJa5erG8pL08rUU6IwhX2a?=
 =?us-ascii?Q?MBuPgYIaqlDfFk3DhslicMdqxCQBfiJLqSnrwCd2xwK/vAI7qrbddhg5Tt64?=
 =?us-ascii?Q?NJDpeRDK7KXEiGX6yH+57Gjj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sn0+CWWVLMkBlc+RT5HVtdeEGBu2DKgZ902iQEwkqv8fsg8k77S5f68x5gsZ?=
 =?us-ascii?Q?oMZK+a14C+q64wfteolkcDyfz7ov0zscW1SdsEdKTf/gl6ePcLGIEUhIF4FE?=
 =?us-ascii?Q?IxBkjpUg1vA32uoGAgeaGOlgXRWUL4d19LYSQNpZXubFspsJlsjcVeMmqiob?=
 =?us-ascii?Q?fE3xIt+j6FW08lL5pl9gk9vBuNC0F/eB4a34r+/JoAXYHfi1QXIsvIgJcgfQ?=
 =?us-ascii?Q?1BmhPK5jF7fDXfi4dT8hMHcId0AIwUwo9PpdgT1xXyYjIcJkSC9yFgMZZKQs?=
 =?us-ascii?Q?ufIsWiUbQfpd21FN4yBQ92gqONMWVJ3ZEK5SUPgJHzLezdcQNtv2mxaKpGL3?=
 =?us-ascii?Q?Es0iGISlXYxg2vsJOSYAe/2VePWrMXkAxzbRxQnYqzy68kJ4wq6RwtdzD4i2?=
 =?us-ascii?Q?ZAqqzTsMuKtTCoD4VjR6SHKRHcp/XCNmjNLJ/PYvjCoUqxPvcOG7S0F7lUDB?=
 =?us-ascii?Q?xCihn+FjoAOR+f/cqQUmOPGukg3kuO7DS7lCZVowUq9W76eagBhSXDuGpS9W?=
 =?us-ascii?Q?gtm0FXoA37P38M2GMBgY45Rzbndm1+j+toqgajR3lgKPyoQgs4r96bKWuB3b?=
 =?us-ascii?Q?BHbSlJTSENwrnSrqyyhZBb+vBAwnMWrM2U6ClhfXpHvF0aX+Qf1L9i0RcJKd?=
 =?us-ascii?Q?ZtHdUX4q5Ax+LjUcjdZtDQmUNGmKY3Ld13n3x7xcmhKa682bV0UBqAn/GGoL?=
 =?us-ascii?Q?yxm7/AkHsSjWwpWAS2dtMS4oERBqIIfu1rOB2nvOBEPwTK1se2sFIlUUZ+FE?=
 =?us-ascii?Q?zlJC3MLh5bomYLAAhPZYdZuE/dI0MIvsxw4rKHYmgJQqi18iDE8Lnj31zJV8?=
 =?us-ascii?Q?l4/AJDN+m3hcOcINlfWc+YfMLk4wsb1HaT2uwyHRO/pLzFFIpnzmA+RiBcWy?=
 =?us-ascii?Q?J/ZWrHfg9sPlSVC65qbbPy7su6OyqX22YmzC3PLOpdbOKJedvxt/SbVQtYg+?=
 =?us-ascii?Q?sUjJchqZMLZXo11zzIBGR79NBQlQUJ2hleAzbJYJEiGIX03zuWgGqebm2hyh?=
 =?us-ascii?Q?5NetMgFNDpjLEvoBLQgFQnOcc63ShX+H0bLgYZ3RT1GGi9T4/8UPp6E4LHhf?=
 =?us-ascii?Q?k0739mz3MuIp3WwiBfaops2sPP58Bik3LmnRVhDNM7RFU9Klrh3W2p9out//?=
 =?us-ascii?Q?LrZ831O3oFKL/IF0o7wOcJfHkRh8Go9B80zDzsNjMiOSUxQuapPxiAggxyK1?=
 =?us-ascii?Q?DUSyTZxZAL/TkiWiA8Z/UifXkjrcLx/cjAUG1e5VmehwOtZaQMCoNd+VJlnh?=
 =?us-ascii?Q?ST4hFZlvRxZb+pIj/hy0Z6jLLFUEMgY9VUkroinSZRnku75Y3HWtQoQ+FAPe?=
 =?us-ascii?Q?QZxxDT6RpKUGxNNSHILtKjKuAFYsu4HA0DjmQoD3QxpcRxtTBAmlBIoCCViO?=
 =?us-ascii?Q?ilMMzqLsenAY+2bOliucCuXHSUKuyFNcBgHFyG/6JTYpEjHET4tVxkwyEKmw?=
 =?us-ascii?Q?OrEofpenx7QtV074qlyzWD6hjzXDTLFR8cPb7Hy3lIIC90ofNTxKDfWo6wSf?=
 =?us-ascii?Q?+RMS8OVYZnBtNhPTjM70XDsd6NMiHPeoGcp+2EKnEky50+BHJNz8x+V2am0d?=
 =?us-ascii?Q?dBpKmwP6UCz2KBOV9HRSfBs4SSXgDN1HTjelC2AE2tCriXcLTCV8PC+ch8EL?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53969801-6740-480e-603d-08dc95853ba0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 02:11:04.7215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k652aKh7WsrhahrW3ZgOpKvWkmIcgrVckMgb6d37h7foNeuiIn+oYNTTUrMoEWkRrIDvtHioU9Omt6SfbcxKog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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

On Tue, Jun 25, 2024 at 01:57:35AM -0700, Christoph Hellwig wrote:
> Hi Oliver,
> 
> can you test the patch below?  It restores the previous behavior if
> the device did not have a volatile write cache.  I think at least
> for raid0 and raid1 without bitmap the new behavior actually is correct
> and better, but it will need fixes for other modes.  If the underlying
> devices did have a volatile write cache I'm a bit lost what the problem
> was and this probably won't fix the issue.

I'm not sure I understand this test request. as in title, we see a good
improvement of aim7 for 1122c0c1cc, and we didn't observe other issues for
this commit.

do you mean this improvement is not expected or exposes some problems instead?
then by below patch, should the performance back to the level of parent of
1122c0c1cc?

sure! it's our great pleasure to test your patches. I noticed there are
[1]
https://lore.kernel.org/all/20240625110603.50885-2-hch@lst.de/
which includes "[PATCH 1/7] md: set md-specific flags for all queue limits"
[2]
https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/
which includes "[PATCH 1/8] md: set md-specific flags for all queue limits"

which one you suggest us to test?
do we only need to apply the first patch "md: set md-specific flags for all queue limits"
upon 1122c0c1cc?
then is the expectation the performance back to parent of 1122c0c1cc?

thanks

> 
> ---
> From 81c816827197f811e14add7a79220ed9eef6af02 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Tue, 25 Jun 2024 08:48:18 +0200
> Subject: md: set md-specific flags for all queue limits
> 
> The md driver wants to enforce a number of flags to an all devices, even
> when not inheriting them from the underlying devices.  To make sure these
> flags survive the queue_limits_set calls that md uses to update the
> queue limits without deriving them form the previous limits add a new
> md_init_stacking_limits helper that calls blk_set_stacking_limits and sets
> these flags.
> 
> Fixes: 1122c0c1cc71 ("block: move cache control settings out of queue->flags")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md.c     | 13 ++++++++-----
>  drivers/md/md.h     |  1 +
>  drivers/md/raid0.c  |  2 +-
>  drivers/md/raid1.c  |  2 +-
>  drivers/md/raid10.c |  2 +-
>  drivers/md/raid5.c  |  2 +-
>  6 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 69ea54aedd99a1..8368438e58e989 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -5853,6 +5853,13 @@ static void mddev_delayed_delete(struct work_struct *ws)
>  	kobject_put(&mddev->kobj);
>  }
>  
> +void md_init_stacking_limits(struct queue_limits *lim)
> +{
> +	blk_set_stacking_limits(lim);
> +	lim->features = BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
> +			BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
> +}
> +
>  struct mddev *md_alloc(dev_t dev, char *name)
>  {
>  	/*
> @@ -5871,10 +5878,6 @@ struct mddev *md_alloc(dev_t dev, char *name)
>  	int shift;
>  	int unit;
>  	int error;
> -	struct queue_limits lim = {
> -		.features		= BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA |
> -					  BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT,
> -	};
>  
>  	/*
>  	 * Wait for any previous instance of this device to be completely
> @@ -5914,7 +5917,7 @@ struct mddev *md_alloc(dev_t dev, char *name)
>  		 */
>  		mddev->hold_active = UNTIL_STOP;
>  
> -	disk = blk_alloc_disk(&lim, NUMA_NO_NODE);
> +	disk = blk_alloc_disk(NULL, NUMA_NO_NODE);
>  	if (IS_ERR(disk)) {
>  		error = PTR_ERR(disk);
>  		goto out_free_mddev;
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index c4d7ebf9587d07..28cb4b0b6c1740 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -893,6 +893,7 @@ extern int strict_strtoul_scaled(const char *cp, unsigned long *res, int scale);
>  
>  extern int mddev_init(struct mddev *mddev);
>  extern void mddev_destroy(struct mddev *mddev);
> +void md_init_stacking_limits(struct queue_limits *lim);
>  struct mddev *md_alloc(dev_t dev, char *name);
>  void mddev_put(struct mddev *mddev);
>  extern int md_run(struct mddev *mddev);
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index 62634e2a33bd0f..32d58752477847 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -379,7 +379,7 @@ static int raid0_set_limits(struct mddev *mddev)
>  	struct queue_limits lim;
>  	int err;
>  
> -	blk_set_stacking_limits(&lim);
> +	md_init_stacking_limits(&lim);
>  	lim.max_hw_sectors = mddev->chunk_sectors;
>  	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
>  	lim.io_min = mddev->chunk_sectors << 9;
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 1a0eba65b8a92b..04a0c2ca173245 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -3194,7 +3194,7 @@ static int raid1_set_limits(struct mddev *mddev)
>  	struct queue_limits lim;
>  	int err;
>  
> -	blk_set_stacking_limits(&lim);
> +	md_init_stacking_limits(&lim);
>  	lim.max_write_zeroes_sectors = 0;
>  	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
>  	if (err) {
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index 3334aa803c8380..2a9c4ee982e023 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -3974,7 +3974,7 @@ static int raid10_set_queue_limits(struct mddev *mddev)
>  	struct queue_limits lim;
>  	int err;
>  
> -	blk_set_stacking_limits(&lim);
> +	md_init_stacking_limits(&lim);
>  	lim.max_write_zeroes_sectors = 0;
>  	lim.io_min = mddev->chunk_sectors << 9;
>  	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 0192a6323f09ba..10219205160bbf 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7708,7 +7708,7 @@ static int raid5_set_limits(struct mddev *mddev)
>  	 */
>  	stripe = roundup_pow_of_two(data_disks * (mddev->chunk_sectors << 9));
>  
> -	blk_set_stacking_limits(&lim);
> +	md_init_stacking_limits(&lim);
>  	lim.io_min = mddev->chunk_sectors << 9;
>  	lim.io_opt = lim.io_min * (conf->raid_disks - conf->max_degraded);
>  	lim.features |= BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE;
> -- 
> 2.43.0
> 
