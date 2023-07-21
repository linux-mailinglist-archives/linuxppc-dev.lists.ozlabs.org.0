Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB475D797
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 00:38:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gFl5AKEy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R74GD3Yvnz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 08:38:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gFl5AKEy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6vfd3zpwz3btp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 02:10:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689955833; x=1721491833;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oBeFpAJ21FCKhRAXCinE8JQeLIrhHy95Q9oiEA+U0oc=;
  b=gFl5AKEyRd2cDDo7TJ06qx/N4iUs/sj2wGXJJ6aGthAOJ4WiXhYsT2L6
   oubHGXppf6LcD+O3paxZQSjTcDOBCx3UKlYMrqc4IT05oSH0kjKU69YLA
   TPkyaX4KZ0GjGrFA8DEcjwkXKDn3VZ+rDmGbyKJir9PjY8FIR9DYgkFp8
   hxKmA0dmWtDZKT9NfnvaTZebwbrIBxXwN1dwlm18KkCZd6EVQuQvOdaNS
   BEKxysfSyLFGBAO/6DrhWpOQxkElDm660evHJf548fuv+2rjI/AYP9qus
   v7BiqBBz6QUNeWTu8qm84BOKnk0FtJznImFJouJyTBADHxLucMGjUlOQj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346660788"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346660788"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790244238"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="790244238"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2023 09:07:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:07:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:07:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:07:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0mMxW8DVXAqDq+GW9b1DOZfhxRocSy44a8sHIXCzWkBpbyQzuZwziEe1IUOkygeR8v/akER6wBXzckEydj7E0CqAq3Rk0R/M44mZZTfkFavW5AtPM7egfryp/NTmwC84jUSpsexyAJ8EMgR46F0NJCDYZLWC93CxpEiTgA3DGXX3gE4S4t7bQu4IWswPogbVsCc4RWQ+/kq18khAV+eDi2oQ2dXLUFrine9Ikx4vf/pPLit/1g0JaWHIe0wfvl3zLAnQJPRj4OuMrJIFoN5eTWOIq2hUkKnVou6Fbyn4TaVQvVdJiPoJzfdRNnJe17Viia1HEenJgVTY7c9ftwxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkomsUumHIzR4wYpoUu50SOSI6bat5+d1sWlE/uO/sE=;
 b=LjLDEegwPk2gY+QU7Huuejbc9GcwFbz4QO5WuTqSzpTY6/USNqSvpqyA7zZ8wJbenRY+pm0HLflv2pGefyLxt47y9uAVoeUEFHH6IVlFllihTYypcByCOCs6XMYzJZs7DhDAz6bsSyPURKG0wbb0MTOsrq2Y4vK/3s1d4184IHA0ap8LNKd6t/+CTWncdIp91FDJhq2FDZfEESUjsZjdMoKlOA5hsrzHmiwuIhupmCEm5oLKiMVuGDxgtfKW3KNdUyETOqPPW0WJvodgJL7Z1irwTg0QU07YQWOCa6+kJCvrgWKfxD4MOUlnyw4xtQrRxZd2O8qZja2STXWpQHKqCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 16:07:20 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:07:20 +0000
Message-ID: <035cee53-255b-11a3-d7ac-ca46c05b907b@intel.com>
Date: Fri, 21 Jul 2023 18:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
 <20211015142033.72605b47@gandalf.local.home>
 <20211015142541.4badd8a9@gandalf.local.home>
 <1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
 <20230721120040.6ed2c02a@gandalf.local.home>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20230721120040.6ed2c02a@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|SJ0PR11MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: be5dcd97-ca5e-41a1-44f9-08db8a048fe3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zc4/8jM+Y9Y++JvO01v3AIMwHhR0J6t2KysKm5Um95aex0pNk38haJgTSMiooJRsRIaFjU5IXj2nXt4oTHnqN4Tdu65n+k5+5jOx1ODK4yGl2gsipsr0tEUj9AuFu0SWp9CiU0pIqEE0X5KGcAUwJFzRhhoVGIolKI0e6YSV0Pojr7t2PBhypsu+0NekcMi0m2ATCzTNZiz9IvVq+5Qji+UlJspokgG6+VydejHvXVXxjGR769Ike99jOdALKy5I7OLC/YGD4CneLy6p3GEqlt0jmY/pbj5zjN99lDXQRa3qCPaHlMsn9hD/dmN39M5pB620MtLk6RbVmI2ZbufhmLAod1yyflIVJ7atfA9a43ZjrEHYjzZuAMDrOTWsQyBmfLeHqJXqQoQe5feMJfoVF3KaTbtqFMsbHkt9/PUKTHE6822Sluye4lqWF2YBXJy/RE2gqdmSyRQ1DyXXpz1op5XRPlz1gZOYOYNlO/oSK4agCtegpIzTJLHsY2jVNyQAyaTbWBvBRhMf2NPGF3L1QgnQECtnKzcRIWhpNNwlZ5zGCG8ypG52qx++FVobOEdpP5zkGVVaRY1WmomIIEceGxINA9ZT3oZaOUCjYz2YqgmLft/T6JgFTtwUtEe+9wC+p3JPmBoPm0oAIGFzl4PKSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(54906003)(82960400001)(6512007)(6486002)(6666004)(966005)(2616005)(5660300002)(8676002)(8936002)(4326008)(66476007)(66946007)(66556008)(478600001)(316002)(41300700001)(6916009)(83380400001)(6506007)(186003)(26005)(38100700002)(86362001)(36756003)(7406005)(2906002)(7416002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkc3dW5hREp5KzVlK1ROM2Fxa3lRcVAySTkveWdGOXBpb0tGTWtuc2orMmMw?=
 =?utf-8?B?RTI1NFBHQlpaQnpUR0F6QTMvOWNXM2gwcEQ4cGlwOVgwTFovRjF6Ykc5U1Fr?=
 =?utf-8?B?RUJ6dUpyUTY0WmxVNWVrd2E3dnc2NGxERkhsdnZHdHIvaFhxZEZCN3locUQw?=
 =?utf-8?B?OEpiTURZUjlQait4S054S3JXWWhBOS9NczBkN2NYdEkxQVErZC9OZXVyK09s?=
 =?utf-8?B?YkgwODEwcXJOYkFMZnVoSDMrajdCNW4rU21oMDlaNVZHbzNndEFhdUpyVTUx?=
 =?utf-8?B?RHZUanlKdStjWWU4SGU3ZzEzZ3czeEVBcXZHQzVGQkVYTDNrSUJnRXorSjVz?=
 =?utf-8?B?ajRhWmx1aGNGUU5JVkVwUGZGczl2dGQzQ2tVN3ZHWVRpR0ZZMFhud1FIWURM?=
 =?utf-8?B?NXVJRTJxeG5KcEUrVWt0N2cyeG8ybVF6WkQwVlhhRTRhOCtuZ3VobndTVkVw?=
 =?utf-8?B?WDZXSTQ1M1RaY0xySU1QaTJrUENtbkcrNkZqSERQVnByOEJ6OHRFQjF2MTlt?=
 =?utf-8?B?N1JmcWdQaUx3eWtuejg1VzZRVlFRbUw1M0FtUG4zTHAwa2VOZytQdHBYUXQ0?=
 =?utf-8?B?VnQvQWJDVVp6Sy90TmJVTFNsVFUzdS9KZEZZaVZxU1JESXJMbjdCRytBU3FU?=
 =?utf-8?B?SnRJNC9LQi80dklqekE5VTdFSTA1dlFyOEZ3Y2tuZ1EvVklQclRmMWhwNHFu?=
 =?utf-8?B?ZVFRTEtUVlZNdHM4SFJPenovTHljU3BOMmNnTEVtcTNOTTNQazlGS1Mxb2N0?=
 =?utf-8?B?YVhDbTMzSXJoV2h3ak1CSDgwMXFDYm9PMllzb1U3Ty8yZ1loTWxmVDEvNXhD?=
 =?utf-8?B?cVlZZm5INkhIU3NJQ0oyVUxndklVNFlHZ29XNGxoRmdyZzBWUUZVREZyYlF5?=
 =?utf-8?B?VXAvQThJenVBTjJYM1V6SHRsQ1M0MXFCcXlKMW85SU1WYjVTOWxKK3RweDRU?=
 =?utf-8?B?ZTh0SDFnOHBFeEZudm5hZXZsVldOYnF5NzBaVHgrNWRJRTBnVnBrekxuZndO?=
 =?utf-8?B?WjRzL2wrVUZqaWNwazBWMjh0RzFaR3BMWXdWTU9lM3NURDk2KzFrRHRVS1NZ?=
 =?utf-8?B?QmRhQmIyVFRnRStINEtUSFFjdi95UmovdWJoRUw0WERGalJURzNaMWFoVHRa?=
 =?utf-8?B?OXJDTFgvcVFQUXR5SnRLZVFCSHVBYlF3VkJJU0tGUk4va283MHJ4eXJFNC9W?=
 =?utf-8?B?cFhacXR5bUlqdVNxMWducTdlaGdJT3pMaE0xS1NXd0N4a2x1bm8rcW9UMUVX?=
 =?utf-8?B?cCthVE1zeHdGZWh6eUlZOTh0Y3ZPR1ZYTVZNdk4yTHM2YUFuNWhpMVlwL2dG?=
 =?utf-8?B?dVNobGtVRjVJY1JPbDVxeU42U3JrMmNwbE1OQWFaOXQvc3dQWCtGcWVyWjF6?=
 =?utf-8?B?RkpFK0t2eVRKY1plRFRlWHc0NUlkUmpNNnJIN2d5RWJhNFRVTjJNck1EYmRP?=
 =?utf-8?B?RzkvRkhJM1phOGhQLzhDTk1zZFo1Vy91Qk1KQWdaVEJrWHhqUm9vTWFCVjlJ?=
 =?utf-8?B?VS9GOHR2dUkrRHhhdXVjbXppcWFoNlBWQXg3NGlGdUV1RXRkSjdQN3ZwOFh6?=
 =?utf-8?B?UGdWTW9rYUxBK3YxZU5vbFl4RVNRcFZab0xXMDVoSFhFM0xCVTV5bU96N0dV?=
 =?utf-8?B?elVhbE4yZTJMWDNwNlg0K1dkbjVGbUFrODFqbzFPMGU4d2M3Z1g2enhqYkw0?=
 =?utf-8?B?clRzZDBXSVlYbWordmRiWDhhampxcjBhZ3VMMk1RVm0yQWFabjFqTDJjUXQ2?=
 =?utf-8?B?WVJtWFd3NnZhbDd5aVBydXlBVWN4NkphMk1EMFFvVWpQVW1NeG5oQ3FNSjBw?=
 =?utf-8?B?dzZGODB3N0JUdjlUM05weDB3SnJVVUNZOHRtc0UzSGE0RGJKbmFzcVhoQ3lE?=
 =?utf-8?B?U0E3MXpKVjUwdko3QXVXV1phSm9lSlRrWk9UT3hJL0g3aUlyZUFoVStva3U4?=
 =?utf-8?B?bGVMNmVBOUM1L1d6SkM3Y0VvR29kVkMzdm1oZVE1WGZaYW9TMEdPNy8wUTd2?=
 =?utf-8?B?TUZpN0xESGg3eklqNy9zSU1oOFdZYWJaZWVZTVpUdlZacFBxbnoxZTJ6QWVj?=
 =?utf-8?B?bVExeWc1cGd3WUFHakxIU2c1YWxoUXVxb3J1dHJhQ2lPR2F0WHp4NENvWEx3?=
 =?utf-8?B?Wk9FMTlSWE14djcwNDRpVjhwK1lJcHJBRlExRmxGYmNEaEQxWGJ1eThuSWU3?=
 =?utf-8?Q?hwvov0Z4kVVE1eQSsYa8o24=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be5dcd97-ca5e-41a1-44f9-08db8a048fe3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:07:20.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gj13brAKSfCHawgyph2XttIzh3nh159/oXLMEQel+mokUt27R2ozvi6EKg9whOAT3b5i/dE2t+fOL61mdvSJd03YgAkYT3oOyO9AsOKb+c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5214
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Sat, 22 Jul 2023 08:36:55 +1000
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>, Jiri
 Kosina <jikos@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>, Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 21 Jul 2023 12:00:40 -0400

> On Fri, 21 Jul 2023 17:34:41 +0200
> Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

[...]

>>> +	level += !!(pc & (NMI_MASK));
>>> +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
>>> +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));  
>>
>> This doesn't take into account that we can switch the context manually
>> via local_bh_disable() / local_irq_save() etc. During the testing of the
> 
> You cannot manually switch interrupt context.
> 
>> separate issue[0], I've found that the function returns 1 in both just
>> softirq and softirq under local_irq_save().
>> Is this intended? Shouldn't that be
> 
> That is intended behavior.
> 
> local_bh_disable() and local_irq_save() is not a context switch. It is just
> preventing that context from happening. The interrupt_context_level() is to
> tell us what context we are running in, not what context is disabled.
> 
>>
>> 	level += !!(pc & (NMI_MASK));
>> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK)) || irqs_disabled();
>> 	level += !!(pc * (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)) ||
>> 		 in_atomic();
>>
>> ?
>> Otherwise, the result it returns is not really "context level".
> 
> local_bh_disable() use to (and perhaps still does in some configurations)
> confuse things. But read the comment in kernel/softirq.c
> 
> /*
>  * SOFTIRQ_OFFSET usage:
>  *
>  * On !RT kernels 'count' is the preempt counter, on RT kernels this applies
>  * to a per CPU counter and to task::softirqs_disabled_cnt.
>  *
>  * - count is changed by SOFTIRQ_OFFSET on entering or leaving softirq
>  *   processing.
>  *
>  * - count is changed by SOFTIRQ_DISABLE_OFFSET (= 2 * SOFTIRQ_OFFSET)
>  *   on local_bh_disable or local_bh_enable.
>  *
>  * This lets us distinguish between whether we are currently processing
>  * softirq and whether we just have bh disabled.
>  */
> 
> Just because you disable interrupts does not mean you are in interrupt
> context.

Ah okay, thanks! IOW, if we want to check in some code that we're
certainly have interrupts enabled and are not in the interrupt context,
we must always do

if (!(in_hardirq() || irqs_disabled()))

, nothing more elegant / already existing / ...?

> 
> -- Steve
> 
> 
>>
>>> +
>>> +	return level;
>>> +}
>>> +  
>> [0]
>> https://lore.kernel.org/netdev/b3884ff9-d903-948d-797a-1830a39b1e71@intel.com
>>
>> Thanks,
>> Olek
> 

Thanks,
Olek
