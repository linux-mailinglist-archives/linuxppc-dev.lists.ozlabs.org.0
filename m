Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329576F66F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 02:15:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O85PqLIU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH5pf6PvDz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 10:15:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O85PqLIU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=giovanni.cabiddu@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Thu, 03 Aug 2023 19:52:58 AEST
Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGkfy3S6tz30gP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 19:52:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056378; x=1722592378;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TuKFzz3MlRqvgsdCaykX2SELXmxJFCo0/Of+pz20f6w=;
  b=O85PqLIUbM/o5F8Kc++ZRndm7GzzOANPrsPbPCc+bDc+9OOsFBhi/OdB
   SNNkIcreu1cO+i+sOykxvycouEPzk5N6uoiCyk2riPrncPHId5LXkUJQS
   iabSXtoQbgKVfnX4piDbbW/DL7apOE6HqV1ZBaOjOKL58Jqn0ucB4Qh+V
   v2mKpylenDZ+LL0LGQPKfRUHIr9demqNy+0to13a48WgiKmL8o2KuHsg2
   Gcw1Liy0fVbii/t4l/iJdw4UHchwo+Bh+bVgAQnXdtXbX6XTcGbtzNvC9
   LMV8t97SfjGaMoh9Hws8Q5uSSFGmSr4skDb3V9WoKgLp8U4v+/XOHAAs2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433667474"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="433667474"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799484559"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="799484559"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2023 02:51:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 02:51:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 02:51:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 02:51:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 02:51:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiwkCQLrnX3vCPUBvH9SF14ucGP0LiLHfyMmCo/jsjcc9fX2/NHNUm9WR5fSrBphLBhxbQ1LaMT9j4M92JImJ5cmsF7d4yV4K0+ZPjzRKvsB93Zjpj9cms59Qm/rB6OqRUemk3RTodpzJCCuJjqFKFAB6wPG84tGsHScuB1T/ytEVwccIit6/GNuq85Qz2VOZWJO2aoeK9cSaociTzYB59MI5+KA22WMilk+MB8SSr1rVnGE4H7xGU4Oe3BBDrz+woi03DNOt8VsGK53HPtbMaKZb5S4qyQfT5lA/sNzilEBBTyCRKC7rXy+ISHZs/EI8LoEmlG6nNhXOpHe3dsdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dblz5LMCJ3tcTxBm4uadKsWwuVksbu+ZPdIg0ZkLtk=;
 b=Xvjd5HHlOR9Xu34gxxPTysNH5EfIcDhYAXMzVFVLjHNnWJJ7wSmkAyw4Ib3gh1CckEvSfKLDC03qUkUBjmZzh5MVyEt5K/jL+N5giCyYD7NxE+UtJwHNfMEN6ZiEg81YpMr5MunXIVOyfO3WFqfoKrpKioYlgLD/le/7SZECb15qmxfGrR0ylFWMBQfyeRLrlafuu57r4UbuuW+GwzyVQMUFMzvz+vVdwHBEelcNzRhq+XYuHjJ0YO22GG3IXe8A069iTgynD3g11irbXB1lAJiuA3ydvE3Fk2VWZgLApwfp570B2xFB7eJQD18zlDeduAryFry/Ohk90XdLLNEXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 09:51:40 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:51:39 +0000
Date: Thu, 3 Aug 2023 10:51:26 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH 01/21] crypto: scomp - Revert "add support for
 deflate rfc1950 (zlib)"
Message-ID: <ZMt4nkfpdCXxAkr5@gcabiddu-mobl1.ger.corp.intel.com>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-2-ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718125847.3869700-2-ardb@kernel.org>
Organization: Intel Research and Development Ireland Ltd - Co. Reg. #308263 -
 Collinstown Industrial Park, Leixlip, County Kildare - Ireland
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To CY5PR11MB6366.namprd11.prod.outlook.com
 (2603:10b6:930:3a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6366:EE_|PH7PR11MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 1028c133-db60-4560-f441-08db94073bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQjqdLRRpwe9YEhvUoY8SsLHb9WcO6s4LirCZMFB/Owtc8iynTHqnZ//Quk3KCcjGlVaQuIQ8psKSsz6j3LXyBiTxEVjJWVnNU9tPjPt/M+lgqqNnDU0j1JZN2OC8YucoOvE3ADl6QtEg6Mwzz+a9rCe75zJ6oL3FPsW/AbF7M8hvilzfnHbZeiZRnpWgpBVLk+tueEwsAImWOWnhRJaX7FlplQvCf8FB6Z64EzCOKL79rII20MhwQcLKe+nTaxT2lumY+rIV60KOC5oYWFSWDhyM3GCxbvyyqbpodyGMZgSnY457krdiuNvPn/K8f31kx55HsWbY/6X47ltLT/nD3pcyPHIdToKDsdY7zerZ/FNcVz5cq5c5mE2l/myyHUnEdnkwTIdPNI9mW9eLySKllagBONjIJIXUryUo9XDOuZwx2tO7KH0sBjBH6+qYih1jls5K8Qzj06XFQv3gVMsyv8vtfus7OGcgf9p6kICJSf9+nT68jrMaB6TuJB377YrjI9Flmw4y3aOQI+nLDBit0D5b6MRDxDu9DSYU3ZH+2Hfj5BP94Ol8cT70qqK/xUanwiCjfwsTnYJH+4LxeF8HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(6506007)(83380400001)(26005)(186003)(316002)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(6916009)(44832011)(7416002)(41300700001)(8676002)(8936002)(6486002)(6666004)(966005)(6512007)(54906003)(478600001)(36916002)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lga4pFFs7leZF9HX5L4F6WkIevbbgsCCXMKaTRj49zNbwQCcbEFGVXpikffX?=
 =?us-ascii?Q?GIdzTR5MJXCzZNhPKwKoG/zFCr/EyNRvxU86iJpfV6u9ow/Q6dCwjcDfAAr/?=
 =?us-ascii?Q?etXX29Zr8WU+s0Mkm2ikuGyDZC0RE2+mV+98EFHNE2piyI85xv1xm3bLoFWs?=
 =?us-ascii?Q?NkUPIR/d3qC3gGDy/tScKQd9Gc5dROhuOs3g8mtapD1HkHlpy7ibgZEh2VsC?=
 =?us-ascii?Q?Pc5K5SyoLqfEjXEtklQjwZCshsBd2VIpMm9EH8OGgh8dSUytuvV2/6U/NUCi?=
 =?us-ascii?Q?kR6IqyThgNayxLBmxzdJTkVhMpLn0tBRhXWajiPAkqEXFOG3Cr+upSBiZCiP?=
 =?us-ascii?Q?N3bpEu6XhAQhEvdwMon9h4lEbU5MWAllj8JeZu4dDp4/trKGsEuWNyorI2qS?=
 =?us-ascii?Q?6tVEdYpn0VAmycHAaG2YylmzDumlVcLx7oQCzOhfiF8cPqxKqTttJb/7YRNg?=
 =?us-ascii?Q?6SMBm+aEqcl7c37Mi9D0e3CsV2E7qAys23bJvcdJ6/BjCSLdZY0ja9VoGKPF?=
 =?us-ascii?Q?qIlucEzkH4R9j0sS5ZC0gpSpNyyhJoCPo4sg8jLt8TJYX5IGAwrErrZK1E1r?=
 =?us-ascii?Q?Tkq5awRSvuUz3Kt4gmArjQja6aci8Xr5gv7+9CZ+PzDOrj1FJYMhikweCr9e?=
 =?us-ascii?Q?eRBT/QPdsO/SCHxqHZKfRYbjIOA5/SvOnJs310n8921i2oM+/XSgOOpmtdHm?=
 =?us-ascii?Q?R/kN/YguC4c1NdqFflBtWLFpyTojf08kW+GL1x+aNq+qHqmW+aUNJF8e+ov2?=
 =?us-ascii?Q?BJYWvukW+03HM7L7dvhaHXvPWioqcRtebSilJN3fQuaDMQxXuqltti/gRiD/?=
 =?us-ascii?Q?yKfLn3/gU0f+7MArIXU1tcLHuY9W9gj3o6PkwNHo94BgM1Wes+vvnWTP8l9m?=
 =?us-ascii?Q?WxrkW4+Cj0In8c+vwW+DM/ld1XzOHgpYh0mWETtaILUL45K5zxwY6pODaV8R?=
 =?us-ascii?Q?HEY8dMQnURimtR5jji8diY0A6LoDqA3GEoiMNTr2/rZVWSrxwtG+qys+50Fr?=
 =?us-ascii?Q?B8OyIlOOa4OYf+OlEvhZe4DH1iGrEV0TAcw18ep8akGj9+yOTUlOwguyV7Co?=
 =?us-ascii?Q?pQYIGmufoWVs0IOkYyDj+9F0sVLQu5nzknnKRA08DzVRefFnornQBKEh7rIP?=
 =?us-ascii?Q?rJ/W1TgUyIxNxy0RSKOhWv9a0QbBAmUyQX54FRTXMZIqU95H8vOBU6ZEF2sz?=
 =?us-ascii?Q?duWQXDhYyO9YCz3QX1VkJyoKegrkIvTWMmvLoF044UW/h10dPSzDs6qLZzjy?=
 =?us-ascii?Q?xL5W5PDk7A4KAxGrPGVCyVviKUV0f0anTKYLH5FhBiCnIk3+/lg2HIihJlCS?=
 =?us-ascii?Q?iJjuy6r+IRXP9cpYEtV5jTQ1G7i8FlMCzjXspzb0xrwHxSywPv3eEzzKIvCg?=
 =?us-ascii?Q?AFGY71HgC37Zm3HLm4t5bLUtIB5uBBsZte6MQxGqhM4mIpC/W6WmYFWO67TG?=
 =?us-ascii?Q?9/fC8pV3A/YwkxQemNRRAM/Z+2+0Th+pCJZ1lJKDJq9L9IH+/NtteERcH3Rn?=
 =?us-ascii?Q?92liXbfXKqbJWFG9XDuGcWIbPmWJodjcE1TP88l3tRyFa03kE7v/LkmeN0gP?=
 =?us-ascii?Q?BLAxPLzJAmA+Rs9lK9it02pKWOTIklSmH/JAjwNs8KjQdt5OgcC9CG7eQjbt?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1028c133-db60-4560-f441-08db94073bd1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:51:39.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBfUJuNll9ZGLMZYQHRtdAS+rk2qNTLE9GJvBuE+weca+edJG4bbe1U6e2PCh9+MtLzJXEKJne6S2obnsGQLoiOQBryVbidnak+p+eGynaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 04 Aug 2023 10:13:42 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, Steffen Klassert <steffen.klassert@secunet.com>, Kees Cook <keescook@chromium.org>, qat-linux <qat-linux@intel.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>, Minchan Kim <minchan@kernel.org>, Nick Terrell <terrelln@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ard,

On Tue, Jul 18, 2023 at 01:58:27PM +0100, Ard Biesheuvel wrote:
> This reverts commit a368f43d6e3a001e684e9191a27df384fbff12f5.
> 
> "zlib-deflate" was introduced 6 years ago, but it does not have any
> users. So let's remove the generic implementation and the test vectors,
> but retain the "zlib-deflate" entry in the testmgr code to avoid
> introducing warning messages on systems that implement zlib-deflate in
> hardware.
> 
> Note that RFC 1950 which forms the basis of this algorithm dates back to
> 1996, and predates RFC 1951, on which the existing IPcomp is based and
> which we have supported in the kernel since 2003. So it seems rather
> unlikely that we will ever grow the need to support zlib-deflate.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Support for zlib-deflate was added for [1] but that work was not
completed.

Based on [2], either we leave this SW implementation or we remove the HW
implementations in the QAT [3] and in the Hisilicon Zip [4] drivers.

[1] https://patchwork.kernel.org/project/linux-btrfs/patch/1467083180-111750-1-git-send-email-weigang.li@intel.com/
[2] https://lore.kernel.org/lkml/ZIw%2Fjtxdg6O1O0j3@gondor.apana.org.au/
[3] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c#L457
[4] https://elixir.bootlin.com/linux/latest/source/drivers/crypto/hisilicon/zip/zip_crypto.c#L754

Regards,

-- 
Giovanni
