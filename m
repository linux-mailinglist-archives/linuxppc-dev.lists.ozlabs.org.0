Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACEB75D796
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 00:37:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I8v/8hCE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R74FH0V9kz3cZv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 08:37:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I8v/8hCE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 22 Jul 2023 01:37:31 AEST
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6twW3pzqz2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 01:37:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689953852; x=1721489852;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Wqod9LTZW2Bae8goPs3VGBb2s/oZouTBylKg04HChQ=;
  b=I8v/8hCEbthFsB6zFlMUMpFtlkiOp8k/ZXCZSGfBio1j/ILyjSG/6CzB
   aw5br5SSPl3cbKQet6wiL+fATuTv6RRzA8PJFalf9xfVMhUXhNkqWJh2c
   YWbiId5PlZMYNcCZGjFuontNmbqn6vLsK6+uesBkTChb1bL6woiROTptL
   R/aaxGBMIEcGzrjQT76/FL3IyfHZUMmWdUlzGyXeyTps13VEZbLJQDnwX
   SErWWeHO/m5QoS2QjELAZla72hu5pwCMxpCmbtZKf5xA5YKmCxGHW2Toj
   6mv8Dv7Q8EquHMtBLCvKKuOmN9bSWaldSRBlwIl7M/4h+p7Le57sEHu1m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430841330"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="430841330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728146347"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="728146347"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 08:35:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:35:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:35:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nixad+aHsy+0My+Xu/F057YpyG8EQ8HSZZ36dlaXpV2xZ66pvdj1lVx8WLKMxU4/gTkcV94SN/8ObTtD/s6OSkd/fmA6f9JZxLV+1F3VIcKRnygioGwYxj6Ni9paO/SJwFkGTio+3K1aiDOIEDywo+0JT80BXfBUgKiDK6bt55aRgdWTtF3KW5330elK5L8gnv13pOaXs21Q12CQaFHCuctNU/5vC9Cv9PvtplXnIxOFsuvZZZOrhEv8G28B+fGXNRjFvQcrMYpiPlggVpQh6x+XKwlEb+w8R38JtqMVgGb1bQoMomjyD1mhXpFikaOU4SmGzxVvZHPNA56GosXnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nB3G3yjQ/X6UocWtw9I576wS3BrLgDQdwl3SFgCc84=;
 b=TIq12PYVC/Qk6ubeDRAr/QQYTSdwJ/V+e9NV36/tpB3G8+MCRAzW8R9PYgSLrGkFt8PggnxAlOczN62hlsVL4tY20Yj7o+cljS7HDSTX/CcQRXhdXs7HTwcjrLipcqSOehRP+1K9UGrhr6WSRET+xwJOJ7+myg1y3fR7UsxCwI4FiPxCKuociKBSeFIkZ2ig0Ke+O/H3wCtAkdWoKteZqeXxcKQESmzmNTsiCVbSqtuqdVZb53+37VW3cjKlmUU/EdQmO+t6pUINaMu8yOKHSmhu3eK8aaEVGFFt3l9feS/vv9Vv6PNATgIQQ7lObfcEuCDyTsWf8QXF+/QhBkArNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 15:35:53 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 15:35:52 +0000
Message-ID: <1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
Date: Fri, 21 Jul 2023 17:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
To: Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
	<peterz@infradead.org>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
 <20211015142033.72605b47@gandalf.local.home>
 <20211015142541.4badd8a9@gandalf.local.home>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20211015142541.4badd8a9@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad375fe-aea6-49cf-8af8-08db8a002ab0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIaxNZbB4YwGV27vEsszD2dWKg/d0iNiIqrs68njlcIzZZiURS97XLHLbaoz5J3zkbt3TPF/csMjKMulwDUmPqYfTGMB15m+KxY8P5nBjZcm4Zz+6xv9T1pXiDVUM//yYPo+lBLVun5PAsFkKrtqpz5MHhlEADhQzXZVGcVWS+p93D2Vq4y2qc01Zb9CPb32scnqjspnD/VXWCIHn6wTRSPgPl3p1WIZmjqTiE3vO3aWHfWqSbfsjOFuEoh2IYdka5pzu5w6VaMnYJNmytm73hc0Bz0FK0uS1gROCH9FQHcA4oP1i41mX0t4KGgXIs0Q4xAo6n4cEQC0mX2WqDVk2tgqJYd9aR7LJ4r/GlA1+oxOw3ch3L7NLh+6iOj99pYV2rUURTUiPoacBzKzWtSV+r30w/3jPhO4aAOi9rTv3S0RWpkWp+daObZSK61Sk/P+PLhvzSVJaRe9QSoqsA8aASGxLTIpKaFOCb6S/7hFN+NBz2M/kzKNw/+SIGwfcG6FBynkCdMQoWTskO0c4/xURD/WAHpgoPwKdy2sKnC1xUW8F/+ehsRmjIps1PV9rQpCVxhScfmRgTRJmuXVLv9zol8+fLxYItiiMWrITkX5J69COK7cSAvAJlM0i4B3SDwfwE6Ci0V3GdWYwqwd9jMe6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199021)(186003)(6506007)(478600001)(26005)(31686004)(66476007)(66946007)(4326008)(316002)(41300700001)(66556008)(86362001)(966005)(7406005)(7416002)(8936002)(8676002)(54906003)(6666004)(6512007)(110136005)(6486002)(5660300002)(31696002)(36756003)(2616005)(82960400001)(83380400001)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCt4Nm9ROURHN2ZEc1V6Rks4eG5TOVY5SmcwN0pKU25pZGwraUxFaUdrMGlM?=
 =?utf-8?B?WU1TYWNhOE1jNVVKRmRTMzNyZU1vaU1ZTFlwb2ltZStZd3lnLzVBWm9NWFBB?=
 =?utf-8?B?TTNSVmFFNjRGNDJpcnZYMUgvejkyVW12dmxZK2VzNDZDT1p4MytWNmE0RVdh?=
 =?utf-8?B?b2lDQUZFdDVkZ0pHV3ZKRUFiTDJXKzNHaWtUSWlvWDVRb1AvSk4xdTBaYkRL?=
 =?utf-8?B?blFLT0dSL2lCRzhiMG45WXhway9CT2l1Umx4Nkg1MERZQ1c4cUVnaC9WWVZK?=
 =?utf-8?B?clRWSG5hZXhTVWNmTWdTdnBVZ2UySkplSGlMNk1zMUFWMkVvSlBHNzZTdlBw?=
 =?utf-8?B?bENWNE5ockpyYm5qTmFVK29JaVpvejkxVExsMmdoNEwyQmg2SS9zdERlckxF?=
 =?utf-8?B?dFFHc2NpaG93OWlBMjVIdGh2c2FNRUJsa1EyYmp4bkZGN3REVjdYK2pqd2JI?=
 =?utf-8?B?Q1ovd2hHYXYvVFlYUzRJN3ZJM2hqS0VLS3ZjZkU3bjhxUXBEUTJvRjZXdnVZ?=
 =?utf-8?B?ekJsVFZYaUJJNjl1ZjNOUWsxZThnZWlPMTl5MkVZOG5BNTZEZU5QbDJVKzRI?=
 =?utf-8?B?WFMzQS9IZEUyRExFQ0xGMi92SFBOQ0VrSFcrNEJSRjMzTEpPaThTc3EwbXNE?=
 =?utf-8?B?ZjZhc0RhQ0JiV0p6SlFudDFKbmE2QllwT0pXWGJkeEFJSXY2Z2krY1NTa0Mr?=
 =?utf-8?B?QzcweXZOMEs1L0ZwQXNid0hRNnI5YUhYOHNvcG9PVGdmVzhWYWMvYXVteEgx?=
 =?utf-8?B?YmhhMkEwOUh6eUtrUmkzdjBXSFQ1MmtkOUxUV0xJbFBPUzhiYjBSdmhvazdP?=
 =?utf-8?B?WWttUDdPaVA4V3k0YkwxdGgxdUVyUmRXWEpPelBVMjExTHcvaXF6OGN4bUly?=
 =?utf-8?B?QTArSGF1eXV3SVRpZGZDYkNOUndrenR6cEtCbDVwTjVycWRiWW9wOUtkUFFC?=
 =?utf-8?B?OHFQeE5kbHVPQlFDdmxSZUZrOHJNNlI3YTR3VHl2TmhsQkR4aUNZdE01ekJO?=
 =?utf-8?B?aERqR0drRU50T281THYxV2diMGxxNWZuNWJrZGtZN1FPMkZSWXNSZlp6MUR2?=
 =?utf-8?B?YWhQRkpYZ3J6RnNsTlNteGI1L0NyQi9VbEt6SFhseFRmMzNGdHgzSHFRYzZV?=
 =?utf-8?B?MWhFSEYvQ0FlQUZUczl0VEd4OHFIVFpGdDBKN1QzU25tR3pFdThIOGhiM1FT?=
 =?utf-8?B?cDUveVJ5anB0dXFUcVk0ZllMSnVZKzdEZVU3U0tGdHBXa1kyekRaekg0dHU0?=
 =?utf-8?B?OGMxaGFWa0JIbGlhbFhuanlRRnp0Ym5EVUNJVzhlOGo3aC8ybllzMWxraTJO?=
 =?utf-8?B?OWxEbmFCSVp6aHNaTVlGajNvckR1WVdzaEVYenNvS0ZLZEkzNWFmN1BsS0Zo?=
 =?utf-8?B?Nys5UWoyeFBhKyt2VHY2bUpnYzBhUzNCVlBsMVozVmNyUlVxa05XVHE1SVZk?=
 =?utf-8?B?RkVrajdOSmlUSjNQYjFaOU81MUV1eDQ0aXU5ZmNtTGtjVDQrUGYzYXU2NmN0?=
 =?utf-8?B?SHkrNTc1S3RXOU9aZ1FDekgwUEg0dUtvVmVUeTFjQXQ2L0RsN01jN293OUZq?=
 =?utf-8?B?NFNuWXhOOGhUMzU4VlhEcFhoQXdCM1FKWlFNbkpSb3lhNGhPakZ1dlNmZGdu?=
 =?utf-8?B?MTVvWkhBWVdvWjR6QW5ya2V0bXM0dlhUdjFlVXUvNnZ5MTV6emJoQjhzSFZK?=
 =?utf-8?B?aVFZNHlLNk5IRnpOZmRyREVCRDkwbUpLamwvcFA3OWxxVkRwWEpzeStONFY2?=
 =?utf-8?B?UVdGSXVFdlVmc1pvRWM1ZmhXQ3Q0bHNMUzZidlU0UEpJLzhMNUVnNXB6YjFU?=
 =?utf-8?B?TGRLVzllcHpEQWxPZGhzNlMxWkxyWSsyNURvaGt6ZFVtZTNGbGpoR3hXRHdE?=
 =?utf-8?B?V3VXYjdXenhPeE9tMzBmZ29OWVhlOHdWT2xVcStrZ3p2OSt5UFVzVit0enFN?=
 =?utf-8?B?cm9DMWVWRGlmWlNwYVZJWmFjakVhTXIvRGZ0dXVaTkRCSDE3VGxXd0NlYjlH?=
 =?utf-8?B?T3JmMjJzK2xKWHlCZ3JBZWQrM2JYNTJtdUtYTStZbTU1dVZ2U2xURHE3OWUw?=
 =?utf-8?B?UzF0M0RGM1FqRUNXSmFJZGRrOTAzSEpUV1NNNllQT2gzemhqdGIyc0FkdUdF?=
 =?utf-8?B?ZE1qR2ZLTkFjMTRpMWo5RmRQajdzUnNkNmg0d0lWOU5iTkg0MytEbG42SVY4?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad375fe-aea6-49cf-8af8-08db8a002ab0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 15:35:52.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tviXYHacr2sryYgwYX++sQOxqmA3Py3ugXyNwYZz1V8qqnsY6AEkhIxQ+X6y77X4u2nPCPCVJyiI7em+fTmvvDH44siSUn2inF2vYxtjbAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Paul Mackerras <paulus@samba.org>, Jisheng Zhang <jszhang@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>, Albert Ou <aou@eecs.berkeley.edu>, Jiri
 Kosina <jikos@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>, Colin Ian King <colin.king@canonical.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 15 Oct 2021 14:25:41 -0400

Sorry for such a necroposting :z
Just wanted to know if this is a bug, so that I could send a fix, or
intended behaviour.

> On Fri, 15 Oct 2021 14:20:33 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>>> I think having one copy of that in a header is better than having 3
>>> copies. But yes, something along them lines.  
>>
>> I was just about to ask you about this patch ;-)
> 
> Except it doesn't build :-p (need to move the inlined function down a bit)
> 
> diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> index 4d244e295e85..b32e3dabe28b 100644
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
> @@ -77,6 +77,27 @@
>  /* preempt_count() and related functions, depends on PREEMPT_NEED_RESCHED */
>  #include <asm/preempt.h>
>  
> +/**
> + * interrupt_context_level - return interrupt context level
> + *
> + * Returns the current interrupt context level.
> + *  0 - normal context
> + *  1 - softirq context
> + *  2 - hardirq context
> + *  3 - NMI context
> + */
> +static __always_inline unsigned char interrupt_context_level(void)
> +{
> +	unsigned long pc = preempt_count();
> +	unsigned char level = 0;
> +
> +	level += !!(pc & (NMI_MASK));
> +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK));
> +	level += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));

This doesn't take into account that we can switch the context manually
via local_bh_disable() / local_irq_save() etc. During the testing of the
separate issue[0], I've found that the function returns 1 in both just
softirq and softirq under local_irq_save().
Is this intended? Shouldn't that be

	level += !!(pc & (NMI_MASK));
	level += !!(pc * (NMI_MASK | HARDIRQ_MASK)) || irqs_disabled();
	level += !!(pc * (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)) ||
		 in_atomic();

?
Otherwise, the result it returns is not really "context level".

> +
> +	return level;
> +}
> +
[0]
https://lore.kernel.org/netdev/b3884ff9-d903-948d-797a-1830a39b1e71@intel.com

Thanks,
Olek
