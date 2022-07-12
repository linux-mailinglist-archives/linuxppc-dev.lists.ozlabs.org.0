Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E917D571332
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 09:36:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhsxt122qz3cB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 17:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWQ6LaaT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=yujie.liu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VWQ6LaaT;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhsx36z3Lz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 17:35:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657611337; x=1689147337;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=idf2nxWahT4qBjTAxGGUkD5DxSaYPOcAXDtHAM1yuuM=;
  b=VWQ6LaaTMWKkUNfm5x/6QW7VxfEzCu5RPTbJP/E4Dl3DynGZHT9qyD2h
   NA13L5tbS5ysjnmxMjgkbVNFFWGmHlG7KLeNuELQ/MFP5Gg4jOtL4loWK
   AJaSFKo5K1WSDZK2Y64OgfNjvWkgkMpYulMy9CHZ89FzZaafMMj3rTWoy
   Zc06OkAsok2ksmgcRimO7X4vNfT8uaOg19kn4wwkfEmCjt935QpfNQVlk
   PP2EzqfyzNMDO21f7KjVHv+pv8ZcaHb6bxTgQgP+oHboJUWPMjK6E7uFn
   lhYypotQu7USh01RgVrAufdFWCcOXlxnjalpnVuX7QAfIsE9NPOJS5th/
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346546091"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="346546091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 00:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="622402483"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 00:35:17 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 00:35:17 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Jul 2022 00:35:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Jul 2022 00:35:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Jul 2022 00:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq9sy6JfjJwqIl8rtPFfrMLNV9jHZV185fHDPyeiNEV3i4cbAgMDF6U3Gq4BPaPbts2dT/q1PD3z51i+mD5XvKRfBiUekveccSGXgeg8qu6l9n++HzmikdMaXaqD1d15dHHiTetU47PF5+rb5ZdL5dKcSMFBTc1Dn3zL/I7tPLGiNa3NdTTNFpKXee4/3td3+sswigpdfWcncve4mg+PJy9deK9DvNDLlM2GFQzXHG/NO57+Ghnaou7X0yO3V4ySldcjJIhjofUD9B5eJCGVlaWeeVQp8Ruyv5GmMZfLKMTlLbd2UY/crdZiLgDy4UbPhlaghzPsJ1qoib64Xvb2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KSEGwsGhN7wPYxlSZ4oEEpG4lL4Xt2s9e0xbQS3iMU=;
 b=Zck1jZIyImLv/oY1AneCDXK4TVyp5e3tQjtKaxpgiiXmENtZCc09zDZbQ9Yb2OLAyr1Kq068baFQ7T7IVLWLcU4gP0n2SVmMDxXsJJj3Vz2C/13elabOlti7YxsGP7MqF+AD7bA21QiTgmRe1yH5xrwMOT10kTrwmOQ/qLYhU1ZgttXIumYfwvlwi5UjNKQmoD3ebeibKqZuzOV4uwhO2NakNFrjv8U6nzgdWxs9vNqFhZ98ip2BwPhykhMS3x3OTOpaovhpIJWvyvJ3/ANPY3DTFNek6VLvRs0vYhgZZaW57Ay6DqpmumOzQ24JspBrFsOeOKbYUHVnC3TCrgC3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by BN7PR11MB2531.namprd11.prod.outlook.com (2603:10b6:406:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 07:35:14 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::71d0:716c:7d6d:94c4]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::71d0:716c:7d6d:94c4%3]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 07:35:14 +0000
Message-ID: <1f339b66-4de6-3d29-6a2e-2ba28c0f461e@intel.com>
Date: Tue, 12 Jul 2022 15:35:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and
 asm/pci.h
References: <202207080257.3FTiq7CK-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202207080257.3FTiq7CK-lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
From: Yujie Liu <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202207080257.3FTiq7CK-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e5e4c21-a300-46e7-7af9-08da63d90f68
X-MS-TrafficTypeDiagnostic: BN7PR11MB2531:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x2X+c4L3UYPZpv9btOrstTvwouLvl4qIUU0Y+4P9dQA5rdX2Og0lG9qxhK1T6CMs9I2MDePE7WdQ3ZYvYHySqRfVNLtMa/7rUCTHA269Tall8+oqFpfb4Eu9M2pcqJbrHV3CQLCZmO6en2cvH6gGphWu0dx3BwXrRQTKbBXuAkp4bjF1C4CjVFprmnVKjFIqlb0iyLE3Oatea/1bnN2Ul9pAEhfWBW7JMDo9FZWZaQiIZ/eXyX5GtIbbKri4Pbu4wuol+cn0P8k9d8eMSSgfP3EisrwZwEYRpypK/9Irq0U/kqUSwGAvZuGcxiv4UNi/Wtu9hHx361nXa/kVbpgMqyiUTod3hy4LTUYGyifaJVClJBw+r75g1oaIAXs/8xzgabKT5mMM7Db1TboykhsY5WomtxWa1tkKxZBau2A8hWWxQckWeJVgg7JLTYtDJ+vPcDOwmNEsKdiU7X/VfhlPCX5uxvRGYxaxzihcRzj5HfFM0MVSO0fj5wIZVNtRGr1zmNFG2jmXSQgO8OhZmseTupTWGvyGyznoxqiQstQWvcJpsVm1X9K+FWO/sBjY1/IBGDH2oM7dqMXe1Yko/Mm5sbKijXrs1AVNxhHqlaO2u+5DGhEgImmMuXFafS3kP9ZoDzyx/KISbzPTR7gh0AEMf3uaoNv4pbTGTRlYUoIC451SySN9Nfk4H+kgzuix2vEvcbbm0TeJ/nFOnQslFwujtYAVWWgc1XI+MigmzGRNbmdGDMKDRuGvdWP1JRY9ZBKavBUX7SAFmDiaEzbHxupVd2O6bUGycsMVL7B5ldBlrTwTz2eZdLKv4q6Jadg3+My9KBKP2Y7fv0tRVE3xBazA/jegMqZ6xEVnhd0s2dL+uOLmnBqsKA15jTgU8yBhTa2BFKvQkGrOoKm+D6rqVqcw5tuYPUEkkm36hDL+z5jDJcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(376002)(136003)(346002)(110136005)(966005)(6486002)(31686004)(44832011)(2616005)(4001150100001)(36756003)(38100700002)(82960400001)(478600001)(2906002)(316002)(186003)(5660300002)(86362001)(8936002)(4326008)(83380400001)(41300700001)(6666004)(6512007)(66476007)(66556008)(8676002)(66946007)(6506007)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUM5ZVgxT3BnZ1o3T0ZCWGRZdy9RTm5wQUJtcUt2Vko2WmtZUEQzK3J1ZHhl?=
 =?utf-8?B?RDZzK2lzQ1B1cVRMNlR4RnJuQnUyM0crTEZHWlF2NklJTWZXTEdTd1lSTERK?=
 =?utf-8?B?eUh5anVDQnZTODBGNTFrdUJjZUtQN3RlRjNPVklkV1BXTzRISlpBZE5YZm5I?=
 =?utf-8?B?MVVjcDJMbmRRcFpOOUp2cnp2WmZwa28rQXROSC9kN0V1bkJoalhKbk15NGVR?=
 =?utf-8?B?TUJSN1htMlRnZzVEWmdvM1V6eTlKblk2MUxycnJ4bU1uR29uSGZ4NlNxRUVy?=
 =?utf-8?B?S1NyZFdReVd3cmVzWTZORUpheXNoRERnbXhJZWVRbU1nRVNRVW5yOWdTamh0?=
 =?utf-8?B?MGVMdkpQV1UvZ1ZMVXhMc0p6enVzNmtpaFlqb0pUY1k5NnhHQ1NSOEFXdm9D?=
 =?utf-8?B?N3JKSC9aNDdIWUZBR3FLSUR6aGo4YTIzZjlPZ040dHJHaDJqZDhuQ3RabHZR?=
 =?utf-8?B?VkFkd3dEN21RVkd6K3ZiM25ZeWZQRWZqdStJUDVZMFdKMzZtbW1PU2k3aDdk?=
 =?utf-8?B?MktvZnJFSVhLWHpXODNBWjcvUi9OYkMyUnhlV3FUVzErZmpQdjF3Yll4VEg3?=
 =?utf-8?B?Rm52KzlWb3JzNFBKK2NPKzZ6YlZlVjBzdEhxdi90SkVYMzZNTFlia3ZlNEVV?=
 =?utf-8?B?aE12VTJVOVNaeHZVVkg5Vy9DTzNnTnFEdFJmSjBtV1FPMUhuSlF6TUZZUUNZ?=
 =?utf-8?B?SlY3WFF0bldKYW1YaUVFZ1F3WkJHSEFCbUI0dVNpY3JSQzJ1dTJrbFY4b3M3?=
 =?utf-8?B?eEdDaWE4RkVRL1Q1RkdOTlU5NlRjN1V4Zll4a2ZITDR1ZFBwU1JrQUNxWkNk?=
 =?utf-8?B?ZFpPN2E2OTlDVmhid1puK2M4MmovWERoRDVtU1grbG1KQ3Yrd0lpUU5nT0NZ?=
 =?utf-8?B?WHd6a3J1YjY4ZGc0TENOMm1IbkxVcWJVUkVVMEVLYzdpUVBhVnA3bGUwT2V4?=
 =?utf-8?B?cVFxTVpJcVZXc2VPbXo4YndNU0ltWmNDRDlkZzZQeXRnY2JOKzRUemhTRGpz?=
 =?utf-8?B?M0t5R1BrK1kwVkZqb2FKR2U2QW85SU9jZHA3aDhyU3FPdnpVeVpIMTg1eUdS?=
 =?utf-8?B?RWJuMFowY1VqSE1aVzN3TmJaRUh6OVErNWdIVWVORytrMS9EcUo0NzhUZUhN?=
 =?utf-8?B?Y284N0ZnM3FMcjYxSk85a1pScTU3R1U5YURBVmFsek83N21EemgvL1VJWEVH?=
 =?utf-8?B?QW1pQzFxb3hmL1VCYnVyRDBvMGxCdUUwT0pLNW5YK3FwQk5mZmhXR0tZZWdS?=
 =?utf-8?B?dmxCOFNGRjZKMFBPaFZOWGxVRDlaaGozMyt5cnI1MXdudDFGQ1pmTUFiek5I?=
 =?utf-8?B?Q0dhaVlINFFVMnJjeFYxWElrNEJseFUza2ovR0hxTjJ3TlZYN2JQaU9kSWd4?=
 =?utf-8?B?Rmh4TFJhYXVGSmphV3ZlNXJoT2pubjJzZFFhc3gvbmR4WUpmc3loRnNwSFV6?=
 =?utf-8?B?eitaV0I2aFlqT0h0L2Q5Ymh2aU1Oa0YrbEtubWJTRnU1SUdIREZYZCtzdTZr?=
 =?utf-8?B?S0EzeDY5Mm8xd28xQnA3a21qSmo5d0piNnZtalB5QkhpSUFGN0lGL3gyS0E4?=
 =?utf-8?B?eXBnNjVvbnhQN3FEYUZJTzFuZmxMOU50ZWFRcXpobWkzVWozSzk1bFZoKzJu?=
 =?utf-8?B?eVNQMlRjN3M1Sjk4ZkhmOCtrSkFGRFFhZkNNaUV6Q09jSmxNWjNJTTRwZ3ZG?=
 =?utf-8?B?cGYrKzZ5dGh1blljMWllVmk4a1lGbDhhZVVRU0loTzlhUmc0bkN6bng4ZzJO?=
 =?utf-8?B?QXZQTzJ5V1psK2NmeU1DWmVtUGJuNzhrZ3dzdkpBQ2pBTllnZzRQMXBnYWQw?=
 =?utf-8?B?Z1cvZUNrd2VpRjROOWpQOW9EVzdFbUZHS2pHdHMwK1NPRG9VSWgyYitIOE9J?=
 =?utf-8?B?azc2eC92QmhVSDZTeTltMldMOW9WOVI1NWw2ZTlUeDdmYU9lSE44OWlYcTRv?=
 =?utf-8?B?b1NLeGtmdDRFRXk3WVFobVp1Q1ZyZHViMGxicGN5QXJuTzRnN1JZbWk0MlFZ?=
 =?utf-8?B?WldtZXJGYUlMbTFocEJ0Sm9YdUxwNjAwYVk1Z0VEQjBFYUlPTmtsVzRVZEI1?=
 =?utf-8?B?bk1weUFZNHpXSGJaOGV2cldpeTdWRWN3anRQQUo2WHRWUkYzc2w4cFVXMnpW?=
 =?utf-8?Q?vJ3z4Jwb7Ins0hSwNt2WP10Vl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5e4c21-a300-46e7-7af9-08da63d90f68
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:35:14.7510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6fqm+d4r1wXQJs2aZRzD+0RCkw4cZoqs1x1mkQQ5qFZZMNLQuoJe2GUZfcm8S/jqH4ldylFcuU/bxmWha+V2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2531
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/master v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/video-fbdev-offb-Include-missing-linux-platform_device-h/20220707-222906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-s032-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080257.3FTiq7CK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce:
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # apt-get install sparse
         # sparse version: v0.6.4-39-gce1a6720-dirty
         # https://github.com/intel-lab-lkp/linux/commit/0e553b9abdcfd7c1f63b072e9d9280ce759c0c3c
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review Christophe-Leroy/video-fbdev-offb-Include-missing-linux-platform_device-h/20220707-222906
         git checkout 0e553b9abdcfd7c1f63b072e9d9280ce759c0c3c
         # save the config file
         mkdir build_dir && cp config build_dir/.config
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>

All warnings (new ones prefixed by >>):

 >> arch/powerpc/kernel/prom.c:891:5: warning: no previous prototype for 'of_get_ibm_chip_id' [-Wmissing-prototypes]
      891 | int of_get_ibm_chip_id(struct device_node *np)
          |     ^~~~~~~~~~~~~~~~~~


vim +/of_get_ibm_chip_id +891 arch/powerpc/kernel/prom.c

b27652dd2174df1 Kevin Hao              2013-12-24  871
9b6b563c0d2d25e Paul Mackerras         2005-10-06  872  /*******
9b6b563c0d2d25e Paul Mackerras         2005-10-06  873   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  874   * New implementation of the OF "find" APIs, return a refcounted
9b6b563c0d2d25e Paul Mackerras         2005-10-06  875   * object, call of_node_put() when done.  The device tree and list
9b6b563c0d2d25e Paul Mackerras         2005-10-06  876   * are protected by a rw_lock.
9b6b563c0d2d25e Paul Mackerras         2005-10-06  877   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  878   * Note that property management will need some locking as well,
9b6b563c0d2d25e Paul Mackerras         2005-10-06  879   * this isn't dealt with yet.
9b6b563c0d2d25e Paul Mackerras         2005-10-06  880   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  881   *******/
9b6b563c0d2d25e Paul Mackerras         2005-10-06  882
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  883  /**
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  884   * of_get_ibm_chip_id - Returns the IBM "chip-id" of a device
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  885   * @np: device node of the device
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  886   *
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  887   * This looks for a property "ibm,chip-id" in the node or any
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  888   * of its parents and returns its content, or -1 if it cannot
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  889   * be found.
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  890   */
b37193b71846858 Benjamin Herrenschmidt 2013-07-15 @891  int of_get_ibm_chip_id(struct device_node *np)
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  892  {
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  893  	of_node_get(np);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  894  	while (np) {
1856f50c66dff0a Christophe Jaillet     2015-10-16  895  		u32 chip_id;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  896
1856f50c66dff0a Christophe Jaillet     2015-10-16  897  		/*
1856f50c66dff0a Christophe Jaillet     2015-10-16  898  		 * Skiboot may produce memory nodes that contain more than one
1856f50c66dff0a Christophe Jaillet     2015-10-16  899  		 * cell in chip-id, we only read the first one here.
1856f50c66dff0a Christophe Jaillet     2015-10-16  900  		 */
1856f50c66dff0a Christophe Jaillet     2015-10-16  901  		if (!of_property_read_u32(np, "ibm,chip-id", &chip_id)) {
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  902  			of_node_put(np);
1856f50c66dff0a Christophe Jaillet     2015-10-16  903  			return chip_id;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  904  		}
16c1d606263ea37 Michael Ellerman       2015-10-26  905
16c1d606263ea37 Michael Ellerman       2015-10-26  906  		np = of_get_next_parent(np);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  907  	}
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  908  	return -1;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  909  }
b130e7c04f1130f Dan Streetman          2015-05-07  910  EXPORT_SYMBOL(of_get_ibm_chip_id);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  911

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
