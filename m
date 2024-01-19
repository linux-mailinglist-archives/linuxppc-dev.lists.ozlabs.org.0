Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6538324C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 07:47:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=EDhQMB5P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGVY92Fqmz3cS3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 17:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=EDhQMB5P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGVXH6qhtz3bXv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 17:46:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToxSrkd73ZGalQ3rTv0/E5aCuSPiZaP7el12HgdzvDghy06BxQTD+Dk+JQ6sT2LvUQ+y6zsce3gmhMFKzShdLDqzfCezyBDBlQx9rObKh9RzDCGEpi6ys2jtDX+0Px95s2kFTxpDfjfctlG4PzXtQ8gnMBkezHCoANQ2hpe0vvOv+ld8470iHdcRt6pSs6ljiaFZWZx4uarOgbAFbyzv5F+c3A6/sSeK7xtgy/TOQzHh673LqEzFbBSexqi9ZBm2d9WLxY5mJEkytUN0ZDaGLg7G8fECr5lqeN2lM0ymwINFh+yioJBcvYx/kbyAtGKuIFMYzySaoY6AqUPj/hwp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuvYuY28tX/CjPLdBJzvpF9TuCjSNkmWkt/BUdLf5zE=;
 b=fs9WqPxOULVVU5dXj5MOlUIwiuaZsT0i26C932y1cSa3hgdm2wWUzFQTIU0yok7y3sDSczhDC4AqrsApwS8uyigzbqmgs84gldfxP1qY/95dJw+Mp7SeiqA+GEONgeRiwieeqi55/UJXBl/iYM5J59G4nkVcb4oK4buP5vrSZzBGnZmrJ2ulLR0zVFux5xqlpb7k5d1jGjF3KJouwqJRRQgbJEBznXuL9dCoAENkQxoK2e9fKBJzvdIe+Iu1WsIIsN4qt/chMLns/2hbxrNdBeAiETyk3e9UZBPx5/wjpQiFcrukikS5Dfa+MwXiB2H3px+Q4pY9EXCMyN2sIP4ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuvYuY28tX/CjPLdBJzvpF9TuCjSNkmWkt/BUdLf5zE=;
 b=EDhQMB5PpxrJXQjZx6L+fAyha2CqtyIlxwvTSbuYGg7ae1MiHuye/H1DcEgaFgHkaRPkZ/y4FrDt6/Kv0vnOSM7Q6pYI5/uc4szG78aLPoI65CS1KSBVy9PC9FnzuURNSZHzA3JdXxcbZCNag82i8WYjvhSMj6yKR8ovtjAWh48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 CO1PR01MB7291.prod.exchangelabs.com (2603:10b6:303:156::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.26; Fri, 19 Jan 2024 06:46:31 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 06:46:31 +0000
Message-ID: <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 14:46:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Yury Norov <yury.norov@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zan9sb0vtSvVvQeA@yury-ThinkPad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:610:32::22) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|CO1PR01MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a71be4b-4d28-4475-f9fb-08dc18ba5e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XkTx/JxRN3LuU7scTj9pZMjdworz1bZPy5bNUWL1hw3KMe9IzHtySEg2FHKKrcMbZp3UwdOqqolDgk87L4uKwGYTAypPcS5i64OcecxaqJK1iu84R2vBzPO5JIemsxt355eLW3zcq++G983X0VaQaLoleirsLt+UiDHTo1jA1IDSXgD8YBSKvZ1yrAF1zLVosD+uawYKkF1SWDtb380DWmYFZ1dPh3gp9hCHUTvOe9K5SqFsKSEMILbofWUnO0PCfzJck7p7tAZOyvjYiEOcXVgzPuD3qIbw50ouDi36YTx8wkU4VnbegUVgeXuOKOsOeMBHniqrpJjH4PSeRYIfPlMvhqpYXNTck8ORHkBMBD9KVylb5sbMJCeXyVqOKCokdaDMkwQer0/CufMCGzsGJ2z/ZW/Tz3zH7aiZszMMlnKYzSM61HMuO9/UjkYWuMDp8/XdcHVyiqoroZeg0y8NB3boRnLYTsLr1FVEmdMFMXdG/my9D3F3zd3Z4TVpBk00R7H3kmg1mWrlClP9T8SCNnGPLpVxrXP5VyY8pUfIqvDXSd4qtdVUVoqn6rMV9cNwrfLmQ7eOZzNDzCdZ1IDAVfHQTwOgfeop3dPkISHa4LTK0OhUMfgXt3gSCBtvWx+u
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39850400004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(107886003)(2616005)(42882007)(6666004)(6506007)(6512007)(83380400001)(7416002)(5660300002)(2906002)(41300700001)(478600001)(6486002)(110136005)(4326008)(8676002)(8936002)(66476007)(66556008)(66946007)(316002)(31696002)(38100700002)(83170400001)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Wk1OR1hhSFA1L2tFZS8yN012Ykx5Q0ZpbE96N3pEVHg3ZEhPSTl6blFkSmFy?=
 =?utf-8?B?WGJlYngzQm1wL0NzRVFJQjN5R2hZckpJOEM3dXJTR2ZUV0tBcHlGREtyajc0?=
 =?utf-8?B?NkR3dEVuRU9lZHZxRVd2YkFSaFJIK0w1RnpOTTZhbVdLaHRLanRVd1RUemQz?=
 =?utf-8?B?VXIwMnlBcEk3QlIreHkxQnNVeDZ3dkJNZzlIVG84REM4Ni9EWkRCNy96V2t4?=
 =?utf-8?B?dE5KZ1ZvOVRwVzVVdk1qRVFDZG5tNmJ0T3pjMEF2dldBRVEwTmRsWmxBNVBu?=
 =?utf-8?B?ZkYxUDQvWVVta1NmOFRaU1FhMWZrV3ltRHN0WlpHL1N1RjNweE5vUnVJM0la?=
 =?utf-8?B?cUpaR3NlZld5SXowMWYwdnFRbEhWVm9sY3Z5UHRPS1AxUVZBTmxac0c2UGt2?=
 =?utf-8?B?eDMyaEVSVHg4aWxwNVFOQS9QTDVHY243NGhLd3BzZHlWRVlsMnBIVmU4RUdi?=
 =?utf-8?B?Wm9yOUQ2b1V1Z1B2T3VENnZLVHNRRWlaOER1cUN6QThJSzF4YXRXUVU4L29r?=
 =?utf-8?B?eE5KWi9iUkJsU1BtZHF1SXMrdk1uc3pJazJhVmRNMDhlVkxFOHV2b0sxSWJt?=
 =?utf-8?B?WGk1aGNYS3lCMStKaWJRRG11RllyM2dJckptYnh6ZlVSMHZkQ05ic0w1OHNh?=
 =?utf-8?B?SWI4WDVhakFYZFZvTmFTU3p2REg4R3BBbnZncVJhREJoYnpjU0R6Qk00a3Ro?=
 =?utf-8?B?RUkvNjR6WHJVWXhpUFJ4VWNjOEpnT0lTbWpLVENJSzczTll0MldvTjQzQ3dL?=
 =?utf-8?B?ZVVoK3AzRkloUlVGWkhkMDgrcG04Z3AzMFkza21jb045VTZSUGlpVldvSnhk?=
 =?utf-8?B?Y2NHQ21SRDlxOUFxU1d6WTdMdWNZMGxQaGxtQml5eFYzdi8vY1pwRi9sR2Zq?=
 =?utf-8?B?QXFiTkQyU3Fvb0hkLzc2eVc3YlU4UW03RGdJQTdtUlZWSUtkYVQ4OEJCdklL?=
 =?utf-8?B?L1FTVUl4VTc0cTEvRXByS3lOcDV2OEtxMlJ3a1J1a1ZwYi8yQzYyTkJ2c2dq?=
 =?utf-8?B?MjYwWmszY1oySlhDRGtKaFN1dGgrQlJRU0RZa0lwQjBxMFNFbWpHV0h3M3ZB?=
 =?utf-8?B?TkJYdFM0U29pUGxZcmFpcmoxWUdaVldoa3BURE9yUjhLb0pTUS9TQXgwS3Zs?=
 =?utf-8?B?TGJBUDVYNmNwdWVOUGFVbWZjUGdrNEg1eWNTTnEvb1FTbjZrZllhd01ROHhp?=
 =?utf-8?B?MWcrNUhJVUROOXlGbk1iOEowWVg5STZZekJPd1BUajZrZHd3RC9zdE02bWVh?=
 =?utf-8?B?SVc5N0tVbG01eVlmajAvK3VlL1ZkZXM5akFaVlFjaGo0Mk96ZEVpRXovNDZ2?=
 =?utf-8?B?N0Z5MFNxQkVFMGc1WU1BK1FabEFPSlI5U1k3c1NjSU5vT0NPQUhUSHFsSXY0?=
 =?utf-8?B?YnVIMTlaUm1jZHZUeERsU2JwWG9xMi9DaFA5T2hhUjM4UUt1cllkK1Zza1Rk?=
 =?utf-8?B?MVo1TjJVcmZNbyt3SDdxNzhyR2x1d3lFVEdNTVRZdXZ3ODd2eG13cnI0dUNC?=
 =?utf-8?B?d2N6TmdzcnVnZmx4Ym85YU1zMDBJSzVRNmRwL0xiNXZxdHFKQTcyWEhqNDBX?=
 =?utf-8?B?S0lwcVZ4UWxwbUFQZHMwNnMrWUNmSER5dnJ5YTFNN01iTm9QMHRrMVBjeFhJ?=
 =?utf-8?B?YmxYMURrSlRWOVlvd1JvakIvZlE1cDdYYkZBdWcrOEcxTnJLdVZhV2MxRmIy?=
 =?utf-8?B?YXV4dGRIcXdBV3lXOTNuMmlPZS9NR3VHL1NyVFRwUG1mSWVTRjBPSGVuM1Ev?=
 =?utf-8?B?dnBvaDFPa0F1Tks0VUdqU3Q1U0wrR1FHT3o4bVhIQjRUY2Uza0Zta2lzVHdR?=
 =?utf-8?B?NFlPNlA5dTUwMVIxc0crVXcyQlRQa0JMbXhJSlNlR3kySmkyL3FFdjZXVlRi?=
 =?utf-8?B?QUlFbDJWeVlsMFNqaXFtVjhQWFAvNE9ESTJaRkx5MlpDak5RaGEwN2VTYzk5?=
 =?utf-8?B?RjRXZnJ1TmNIZjV0dVM1MmNPUHZlMmVRWHQ4Z0xCWU1YUnY2cXRGWWhnSWFr?=
 =?utf-8?B?c1Y1NmNmQit1aW5VNWJOMFZtd3E3YUR1cVlacUNsM2RneVBUeHJhQTh2VHdO?=
 =?utf-8?B?aXRuLzRtYUFqM2Y3YTc3bXNoZzhwcGZnS3BQMzhqaGZvK0JRc1NRN3p6RDFl?=
 =?utf-8?B?aXh1eDMvRjI3b2ZGYWVKaTI1Q1hmQjB2OTl4ZDlSN0dNaTkrM1Fub01laUNo?=
 =?utf-8?Q?B20T2V3cGUZIlLJgRJacLEQ=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a71be4b-4d28-4475-f9fb-08dc18ba5e97
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 06:46:31.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL3NMB/llKCtTPp63balqZ42Tl4RRBeAJeirXOZ7LmljgdrDW1oFiM1OcbTxQDQK51s68scd4lSctql53pA6PiB5e9R2H2Nsh+LtUUKfylp/AJ3mCRjqaIT1Or84w08p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB7291
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


在 2024/1/19 12:42, Yury Norov 写道:
> This adds another level of indirection, I think. Currently cpu_to_node
> is a simple inliner. After the patch it would be a real function with
> all the associate overhead. Can you share a bloat-o-meter output here?
#./scripts/bloat-o-meter vmlinux vmlinux.new
add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
Function                                     old     new   delta
numa_update_cpu                              148     244     +96

  ...................................................................................................................................(to many to skip)

Total: Before=32990130, After=32990710, chg +0.00%


>
> Regardless, I don't think that the approach is correct. As per your
> description, some initialization functions erroneously call
> cpu_to_node() instead of early_cpu_to_node() which exists specifically
> for that case.
>
> If the above correct, it's clearly a caller problem, and the fix is to
> simply switch all those callers to use early version.

It is easy to change to early_cpu_to_node() for sched_init(), 
init_sched_fair_class()

and workqueue_init_early(). These three places call the cpu_to_node() in 
the __init function.


But it is a little hard to change the early_trace_init(), since it calls 
cpu_to_node in the deep

function stack:

   early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()


For early_trace_init(), we need to change more code.


Anyway, If we think it is not a good idea to change the common code, I 
am oaky too.


>
> I would also initialize the numa_node with NUMA_NO_NODE at declaration,
> so that if someone calls cpu_to_node() before the variable is properly
> initialized at runtime, he'll get NO_NODE, which is obviously an error.

Even we set the numa_node with NUMA_NO_NODE, it does not always produce 
error.

Please see the alloc_pages_node().


Thanks

Huang Shijie

