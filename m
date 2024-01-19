Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CA8324D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 08:03:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=/AO6Qp0n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGVvs4lltz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 18:03:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=/AO6Qp0n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::731; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20731.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGVv03DVTz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 18:03:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPvfWeqdKL4Wm/C4vV9CbD89UYtPf/XuS2aTjdCnEyDGO50dqosJqkZ2VU9MgBnLFtoP891ycI9jciuIfhv1YLuE6j+Xo9SlJdtEXJAY6vllH8BjqKVjFlsPF5VoOyqPJiFvkZVmGvlYt4G43zmemDqsJZdv1XkcPcJu2XaMsKJ5cM32i/PA1J3xn6b9xPIYdskGEN8sTZf+VxKV+PftS2hIyDUB1Y9JXEFqsnooS9LcCu0/uDGx7mkYI4Ybwc201g70AFNkBGRa7YuebJlFZEKiQTqmsU+XjcMUQiZxYdKfNJthy75pPTIdQEALAXzcdIs2x3fpdW0V4w91tzY4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+2XYSl4mpJYa8fH689AmNJ7/fkGOad19+DPwD5u2no=;
 b=I88XrNGSlhJKc5fzas5+IJ2l/MFmOXzlH++fNm5TZpq3L4Bq+Q7Gr7YHUSF1Dc4YXiRbYljZfRztm+oN1oNj8Df7TBDpolD5HIfhzFzlhnFOEDQBiomgK5crsnApOsXqOX8H3b0HETL8vY4vM49NZxkJtSn9wbbKoOV4zf4l8ZTuLwl+5pZzVoDkiOY3X32TOVPLwSApfNIoQBMkbrqQNzcy73DKklhumUBsDNZXHbM1wOKPAh+G2pumKyzyP46LGkjdw4cv5PxslDBISQlWNk/9aZFAsLioDgqpi2xRPsFR9zzTxzPnUNdiwfhjh/dT1fIOiWrX/BNMjo88L0Wrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+2XYSl4mpJYa8fH689AmNJ7/fkGOad19+DPwD5u2no=;
 b=/AO6Qp0n3yIjHyUXHzbtBbRu/Ej361HxO6nTY7h0VvAqVhiTK54kZi3fqQH/50RA3PEny1NMBPDTdKh9rWNub3SSHZq57wbOPxmzLlZJXGEVkzBKb0dCm1sJEXz04BkSjw4swIR26/+PnoujwWn/BLwi2462lAfBeTn4GdDdQp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 IA0PR01MB8240.prod.exchangelabs.com (2603:10b6:208:482::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Fri, 19 Jan 2024 07:02:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 07:02:44 +0000
Message-ID: <c7ad2b9f-0ff2-4f08-a666-015284a289dc@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 15:02:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
To: Yury Norov <yury.norov@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
In-Reply-To: <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:610:cd::33) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|IA0PR01MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 626fb682-a410-4c40-f603-08dc18bca2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/5axF5t8qaO7Ghct689y3957hZIQ6knksQ7xsUi56cSsZTQJNYmfavYbJl+QqWfw5oYdVIxxsQtbIs/w/PdvraogqI2JCsK9torwcmBjiOtyOlALJp5ewLjRtfxk07nY34MA3sOPR9bisk31/U6oO8TxixtVhAfusajyeJM8bH4Fo+PKmDRYleMh3/o158SA2OcPmBe2HJJTv6EwqI5KihpvhAi8T9Rl3oKSWU3ijbn9PxgqmdEJ3mhVNuPHEzkA4n/SGMqN8EY0yTnIiCPT6clBU90H1kFRY89O6VTdhBXnxO/lHK42XOS5IjAeAs6ZvONmS2VqCvqmndKUfdfuuGGmM4MMvkzgJS6ZKlxoiDvwqs2T5SoPeTsB1D3UwKFIxXwsUDRhqlQu3UD8ybrT1ST8NKA21dosE0Q+ogcBk1RR9aZ4fHSTWYbTrmzSHuFSPukK1ugh11NywUClnbuurZ+GNx5ftTJUBHbDCw4XJOACrs4V9wGWSK2Xj2sEfbjwtiJs6j1X6Eu3jBtQiklHiJZKQhXtgPHjdYQelhAc5INMtDr2VJRmCP4pTQwSF5YM6RKTszDtEICmsW62dfVR005GIMkPZchY4Ka0N1rh6jU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(39850400004)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(478600001)(31696002)(66476007)(66946007)(8936002)(316002)(66556008)(4326008)(6486002)(110136005)(8676002)(38100700002)(83170400001)(6512007)(2616005)(26005)(107886003)(6666004)(6506007)(42882007)(83380400001)(31686004)(5660300002)(7416002)(2906002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MzJybVNUZjc0SFNDdDkyWUNKVHZJVXlMc0ZtV0F1MW5aUDBjYXlHNWw5RzQy?=
 =?utf-8?B?TW1UcGowazJpU2hTK0RjRFRhRUtLQXJuaTJ0RURmd3RxdGdiTlJWQThZYWhS?=
 =?utf-8?B?L0lFZDhBWHhRT1R0MnIzVzJKWE5NZC9IemhSZ2NyWDlhVVdsbW9uYTh4dlZk?=
 =?utf-8?B?N1U3WjJsVU9JdmhsM1BBVUhlbm9Ma2xrdFp1NXAvRTlINzVIQUVWNlVkVVNz?=
 =?utf-8?B?ZU5ZMGVnQmhLMWwyY3ppQWJVdS9TSGFzQ3JzdW9tc2E0RWdTVnhPQlZqWkxI?=
 =?utf-8?B?QkxqQmFYRGN4OVg4MUsweDVKQWtOV2M2NW5VWnpTczJpcCtzN0hFbnR1czFs?=
 =?utf-8?B?RnN3ckZKR2RSMlBQR3F0ZkxSMVFyY29CNW5LYXRkUDNIOWhRb3diTVNHMkR1?=
 =?utf-8?B?TTdySlBFVm1KTStjQ3pHSWNJZzdJZ0paQlNaZ0M4all1UmpzTGUyZUFINmgy?=
 =?utf-8?B?TStaaXhTbzhPR2JSZEF5UnowWVh2dENLd2QraGQreUY0WTcrQWVuU1EwdmJo?=
 =?utf-8?B?Z01wdGptK0llMzRvelpZZEo2WElndWx3T0pNYytlb1BXaml1VCtQR3UyTFpv?=
 =?utf-8?B?OW9zUklUdng3Rmo0Vm1iY3pvenVwYUZoaGVoK2FLbHFIL0Y2NHdlb3RhZ0pa?=
 =?utf-8?B?TEE0N2VJdTVWWDkwdklHUHZHYVB2VVk2YWUwZlh0SjM2cWZDVWtlbjk3cXpi?=
 =?utf-8?B?aU1WaGFUV1B3OFB6WHBOT2MwaWhpQ1NkNWFXTUIyd3EvTCsxdTFQRW9UT3V4?=
 =?utf-8?B?Z3N0YldVWXJoa2R4UFZ2YXVQUmRES2h0NVdWNWRwMXBUOWtNdWs5Rm1ySlQ5?=
 =?utf-8?B?bWIzb2trcUFFMVpXdEZZMTBtVEkrMmd6Q0FxWExyVUhNMm83NEZaNnY0S0F6?=
 =?utf-8?B?dDRCK3FrWWxkd1R1RXcwVGVXZGVKU2VESENVaHBhTS9QMmR3UW5MSFdoM293?=
 =?utf-8?B?dWdxajE5bWlGRXFLYmQvYXQ4T1pmQjZ1aUNvSWtjNGNpRUR2YWh2aU1UM0d1?=
 =?utf-8?B?ZTc1ZzlXR2JCRFFuZUQxbTFFT2hBVTV6NVpBVEVvM0l3Y0lsbHhYNXo0RERk?=
 =?utf-8?B?b095Wmt5TGJKMmpxTktwS0dRZTFGdWR2MlpvdUYvTWdoUWxMK2xtMFdwUnYx?=
 =?utf-8?B?VnJlcUVqMzNNUFFCcUxMektFbGd4ekViYS9aV3lqSzhpNEVDWEpWaHN0MHNh?=
 =?utf-8?B?ZGorY0ROdWxlUHZLWm1pOVNUbmpCTlIxWnZvYk5PYjZIU0cyQmExQ1lvc2Nk?=
 =?utf-8?B?SUNzaHN1RUdvTUM2c0QwZ1pzVXhpV29KaVJzWGZqbkVNanVTa2E0dXl3bTB6?=
 =?utf-8?B?SzNkZmtYRTJWYnZaVnUrWDhLL0lUNkMybi9DV1M1Ym9wTDhKNGp2VG1JNVNt?=
 =?utf-8?B?M0sxQXM5aXphTVdTSXdIRkc1QkVNM2VjQ0J1ejBXdEtFT0Fod2dmNU81Y21y?=
 =?utf-8?B?T0luMGgyNU44UEFoU2tPU3JjdnZ1bGRSYVJLMys5MmQyNlU1MktKMmZHZUwx?=
 =?utf-8?B?Wjl4NWxGbi9ldW9YeERGamRsOTY3Smhua2o3QklGVXVzaXFOK0M2VEx3emdQ?=
 =?utf-8?B?ZTEyQVAzSFJFMnlyTCtLamN5d2dNZk9FQ2VVV1FaODdMdmorcHhMbjNwZzBB?=
 =?utf-8?B?NE9YN0ZEaU1LdnJjdkNwMXJtYVB2Mmc1Snd2TUVrNFlENXFrSE9LL3lHLzhJ?=
 =?utf-8?B?Umt3ZmRYWm9aakxqWUkwTzBSK2g1dU1aNWcwVzB4VkVnckh4WWFyNnM2YmUv?=
 =?utf-8?B?Z1cwZ2VMVkRGZTFQTHZOUmY3cGhEQmFvUHRaUXAwU3VRNG03bU9RMHB1VVFz?=
 =?utf-8?B?WEY2YlFITkR5NkVDdDhqbWIzNG5DcXoxWlFRYWpGQjN1YlhUMFNMVElSNlJk?=
 =?utf-8?B?clNNLysrS3VBR3BHdTNBSzRnMnRZVlV2ZEErZHhoWFRiY2cweXdUS09iRkEx?=
 =?utf-8?B?WG91NUtMS0lEWEc1MEhiV3RtcjlqK093Ui91SFMyaEE0ODVYSjByUTBCVE4v?=
 =?utf-8?B?NWsxVkk1RTlWdDViY1F1RUh2bTNhdzRoZ2dvZEVvNndRUnZiMTZLNHhZalJu?=
 =?utf-8?B?eExoRmdIUElVcmNiVG1wdCs5TzBSbzFVZjY2MTZJcWxoSEdBMW9BZ0ljOVE5?=
 =?utf-8?B?TmRyME9xdDVTUlhTUU1xdTdMM1h3UkU2dlliRmprcDVTN29zTzhucXJFRUFp?=
 =?utf-8?Q?XHmXj2LKbUgIW249gqufHHw=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626fb682-a410-4c40-f603-08dc18bca2e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:02:44.8603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2dgaVkCykNwQiGwp025k2ge4hFVNFjJNnLlXwZoqoB/F/2vulqsKgRPEIZ1srUXIf13/F7EVYJUw61xgN5KBGZPz56eDwyMrDSeN2ZpGzdLpiQAaLs9coK5z0wu9WFG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR01MB8240
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/1/19 14:46, Shijie Huang 写道:
>
> 在 2024/1/19 12:42, Yury Norov 写道:
>> This adds another level of indirection, I think. Currently cpu_to_node
>> is a simple inliner. After the patch it would be a real function with
>> all the associate overhead. Can you share a bloat-o-meter output here?
> #./scripts/bloat-o-meter vmlinux vmlinux.new
> add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
> Function                                     old     new   delta
> numa_update_cpu                              148     244     +96
>
>  ...................................................................................................................................(to 
> many to skip)
>
> Total: Before=32990130, After=32990710, chg +0.00%
>
>
>>
>> Regardless, I don't think that the approach is correct. As per your
>> description, some initialization functions erroneously call
>> cpu_to_node() instead of early_cpu_to_node() which exists specifically
>> for that case.

sorry, I missed something.

I am not sure if  the early_cpu_to_node() works on all ARCHs.


Thanks

Huang Shijie

>>
>> If the above correct, it's clearly a caller problem, and the fix is to
>> simply switch all those callers to use early version.
>
> It is easy to change to early_cpu_to_node() for sched_init(), 
> init_sched_fair_class()
>
> and workqueue_init_early(). These three places call the cpu_to_node() 
> in the __init function.
>
>
> But it is a little hard to change the early_trace_init(), since it 
> calls cpu_to_node in the deep
>
> function stack:
>
>   early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()
>
>
> For early_trace_init(), we need to change more code.
>
>
> Anyway, If we think it is not a good idea to change the common code, I 
> am oaky too.
>
>
>>
>> I would also initialize the numa_node with NUMA_NO_NODE at declaration,
>> so that if someone calls cpu_to_node() before the variable is properly
>> initialized at runtime, he'll get NO_NODE, which is obviously an error.
>
> Even we set the numa_node with NUMA_NO_NODE, it does not always 
> produce error.
>
> Please see the alloc_pages_node().
>
>
> Thanks
>
> Huang Shijie
>
