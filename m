Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA883BD05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 10:16:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=CKGWEFIi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLFZZ0wKfz3cSP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=CKGWEFIi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::715; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20715.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLFYl0pr4z3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 20:16:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8653EfRsF/a9nJNdUlRrcawJ8T7gZpBar/0YdzSgI3Dhn0xZF+u8TtqLiI9oLDE/QTXA1MiuzlHlTxFte4b39o3klhIDGok7/04FdLmwGGBnGiYYupFlhx0bRyrqEIuu0oSH6ILmvWIr9WZjOZ16UDPUXslp2oBw0hs3uxQZwnIlp5jPFswRlRxzxYVCi0hhhGXwVcW+eA+HuhXOsM5f9FVlkH0o7fqNigL2zD9JmB1ekfpzf7h3LPoGpEBUp3UfRuXklNYotBqbiFlDWubpNYYBt1GmIR+xKpFtCg6DqrzabIQk7gT1sFFNsmj5nnWzdc6e3kKJJEQlVTdTJ/Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p29qIyBkJJbBf6cKrviAtpHOBGDvsKpEFWwzsi/1bDA=;
 b=SJwCxlAW4tlzu9ebFvMwHUjtd8ewXCcPfPblHFHwA96kKuwgblHIzdXkjaY4bndV0TGndoeyKRs/HFrWu3Xnpb9WRENePnjYdRUk3gMHYtoqibcNwTF9H6jG8PrEZPlgu8obIHXFo5yH5nKoytdGT2JAGqIlKTCVTGLUZTwUv0aBOImD5pT+EWnGRfTk3CoXbY3I8XCxdXN3+O2TOg4Kw5gfOk1YGVQQpCgNlOa9rkR5YgQaPjgKuLMhC0XF+BsFNvxXIbwXoW21Szvj3BPgX+YW6Oa5GTYIjO9UCYKNO1USPasrKD6PbtmOONyAc2JYYIG+tqzoK8VwGo9x+h2zBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p29qIyBkJJbBf6cKrviAtpHOBGDvsKpEFWwzsi/1bDA=;
 b=CKGWEFIi4KxwIjR3porQOjz3TjtAtBloDOtbRBJ6Cpig3tO00oVEjzaJGk+wB4BZRJE2zLxGStXDMYjzTLI5ELDEQy4h0N5dziIkqCeU/db6DOtCGXwNvGUYq6+CoiOXpCLMYqbIZ4j73Kj7zLQJdFl8S9sNCPVxQ0gHD8JoRyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BN0PR01MB7104.prod.exchangelabs.com (2603:10b6:408:153::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.27; Thu, 25 Jan 2024 09:15:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Thu, 25 Jan 2024 09:15:45 +0000
Message-ID: <1dd52bb0-f905-4eff-8044-9e99e689ab06@amperemail.onmicrosoft.com>
Date: Thu, 25 Jan 2024 17:15:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
To: Mike Rapoport <rppt@kernel.org>,
 "Lameter, Christopher" <cl@os.amperecomputing.com>
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
 <ZbIObaA6t9WbRw9y@kernel.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <ZbIObaA6t9WbRw9y@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::26) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BN0PR01MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: d1089ec1-2367-45ce-2569-08dc1d8635fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1uXeGa+RhL0vCeaH+oDHOD445E7FQBjuJYZzHn0RZf6119CHRWPl5pYlyGNGds7fo8qxAgY0aWATxoAW/fhGA9tVF1oP71A1BtS7z5bvSKTmkO4XbWjX1uE0LQ4n16KNMe2CHHR3X4a9qFj6Yp9K1M1EHu6+BLU4cIYeQSXC9CQwZhREeeIpTi962vug120ddxjPeTYHIBCTi7e0ZTXtfI4V5HRCHDBqpn4sz6UE4GHXTqHHyfkukyfcTv5TaIrTeS634p/eN8GHDssqyL4cWa3oA54BPO0Y9vCItIyOeIefBJPP9gP9kJI+we0dVFGmUQ5ILPLX2nZDN07CphQgijcdYag7IgK2B0GctPE5PwZJ7Cv/ptuzlSgF9YDRfu2wH3gK0XgPpAvnPzTaLf9/4luboHzU/8io1xAi3f9WNEklO9E3wnYxLu7WkkiJYIR9kpzyQVzCLRW7xohlkHkvq31PabbEdeyOowH63bXxH4qE9ZzrTkflXROt1UgONnNOnRrmHCLLj8+gqNsxAM6XrO23R8/8KN2Q4j1KxMwhCGzE7dUk7lj6IMJKtXcqUtLf6udGAHabR0xWd8UQwebb95dRJiW8AARB2ArGCqEHKyGJbXH5VVaC4GU/+qyF5QUqpUwehL9Hr7f/papmHA/wUWOnIyivbm+I2S6Rve6xlHo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39850400004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(6486002)(478600001)(6666004)(26005)(2616005)(42882007)(6506007)(6512007)(316002)(8676002)(8936002)(66476007)(66556008)(66946007)(110136005)(83380400001)(31696002)(31686004)(83170400001)(38100700002)(2906002)(5660300002)(7416002)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?U2J1a0hVQThyWEVMdHpzNEQxbHNRNjZaUzdTSXZveGFnblMveDd2bzlXdGQx?=
 =?utf-8?B?VTVvTC9HU0JUVzE2TE9yYVFCdW1sZVpkTXNBcHNkeFRQT2xlOE5ZVENCMElz?=
 =?utf-8?B?dllBOW5sY0xTcWREU3VkZHVxVUo5YjRiRkFKKzZSL212KzFDYUcwQzhWSm1s?=
 =?utf-8?B?d0pyZHFkMGZjQ3A3VXpIMllheGNQWTh6Z0xhYndjb2RZSGJLcW45ak1WVCtX?=
 =?utf-8?B?U3RURHZocjVscXIzZlJGbkkxK3RlU1dYUW5pVGtQVHVEaDJ5OHhOWEpzWWxa?=
 =?utf-8?B?UGdvaXBjU1RqbnFHdG5JS0FqYzNEUkk0TDZiaVRIZHJpMDRTNk9nMjBKLzBI?=
 =?utf-8?B?czZZZkpsVm8rUjk4UjNzL0UrOElZczlKalJ3V1BxVXdHZlFnZXJTbngxVzQ5?=
 =?utf-8?B?Z3A0dldZc0pjR2F3S0VDbUFUVld2dnhxSmtvMFBhd3Jhc0xVUkIrcVppampa?=
 =?utf-8?B?UldzMzFKcHlUdUEzbDZIQkJUME5hNHpVN0dQTVZadVdkdWduRXI4VlY1aHBG?=
 =?utf-8?B?NS9oN1FmTHY2c2pWNUY1bGYya0liV1NobitLcHpRV3NPclBXeU1IRk1nd1Bo?=
 =?utf-8?B?SFAxSUlnY0k2Z1psY3h2ZFpaY3J1ZHExMTZiSCtmLzFJMGVrNkx0NFdCNmZl?=
 =?utf-8?B?NGtyQmdrTHBTMHg1ZWdwVHNxQ3lCMThxK0gyZmY0UzZzL1p1WWh4Y1VVends?=
 =?utf-8?B?SlZIRTZ1NFBWQjZvblBMUVR3Um1XcGZaeld6NytPaWFSNU5pbUxjNTVsQWpT?=
 =?utf-8?B?TExjY0t6dGF6QUc4MmQrMGl5b2VoaHp1OFM4RzBoRWQyUmR4SzlWNjYxS3BQ?=
 =?utf-8?B?aWZkQmNyNVkxSlVheUorS3hUZXMyVUhsbU9raFQwcUJBUm5iTVpISHZxUFE1?=
 =?utf-8?B?VWRtdHVJYWdIWUFiaFFHU2UrNUUyQVpVU0IvMjZ5eDM5YUtwWDhUdjJoSDFD?=
 =?utf-8?B?aEhsdm5SSmd5TjlUM0xIRDdVc0k3L29nRXAzYVlNOVNXRFZnVFU1bjg2Qk1Z?=
 =?utf-8?B?VHllb3piTGEwQUx1enFNcG5uMGJOQU1oQWZBSHhpUnRZWnVGWEM3VnkwR1RC?=
 =?utf-8?B?Znc4QThPVUJRY2F4UkNrSnVuTlhBbTh0c3pET0swSFJEaGhSdEp6bXhFeXM2?=
 =?utf-8?B?QWVzR2FQK1QzMGttTVk5d2FyeFhoVm8rNDRIbEhzZFNoS1NSSVE0aHVjTFQ3?=
 =?utf-8?B?ZFFGd2NSWjlmYkdyZmVRWmRKa0FJck92a2VTd1VQMlN6WFBPOFZVSlMvcHNY?=
 =?utf-8?B?U0dFNmtqbHhZNStVRmpUWG5xM2hoNHlaTDBxejBKZURUVGRFbGtUV1ZyU2hT?=
 =?utf-8?B?ZmVQWUlPYUwxVFlQaTJDOWVYYmVtZ05FcUM3ak82NURyOWxBUnYyQUhpSTBF?=
 =?utf-8?B?RDZ4QTRFdDhGb2ZVZm9SVTVzbWdoRmgwdENYUTYvdHN2c2dHci9JS1JaSGJZ?=
 =?utf-8?B?TDgrMUExSWY2RXl2WWtFOW44eG4wcVBRcDJXeVlXbXF1RTQ4b2hMSm1RT0Iz?=
 =?utf-8?B?K3hFMGE0c1FQbEo2a2tIT2U1N0dGa01RMS9lNm9TWUhHR0JoYVRwMVJzZ0h1?=
 =?utf-8?B?MkUyZWdKeElCK2hWL09vTDF5bkNCQ0dveTdpd2ZQSzNPU1dTSExSWlJudWJQ?=
 =?utf-8?B?cWd3a2Zsd1RydkgrQ1lCNkY3aTQ2c3dFeDVJM0I3MXZBRjNMZHFFNllGV2dG?=
 =?utf-8?B?TVpkakpBcWhEVHVUVm5KTEN4aUxWa2tCS3FTU3hyZ2lQZElPRDRCd0NGbng1?=
 =?utf-8?B?ZWNJRHlFRm05UC9Nc2RKS0JnU3UyczBEdnQ5TGpDU2hoS0UrS0dVMnlVdStz?=
 =?utf-8?B?cEF1N21EMWJYK3RJNjJTTnN1UTl2ckFPUzJQcDJVVUdVTUt6cGEyTTBmTHdH?=
 =?utf-8?B?NFRSbEFTOC95NnRHVUdVNFY5SnBqVGdXenlQeU0rYUtBM1JYYlhhalZiYnRh?=
 =?utf-8?B?TEh5eWVaTHdHYUpaZUtmZUdOTjJ4RlZBUmN5R3pTOTlyOUVyMDV4MWplMEU1?=
 =?utf-8?B?QmxoT3dLa1labVh0cUxFb21WeXpSUEk0bzdzNmxVZ21RV0RWaldwZmhrOC9q?=
 =?utf-8?B?YWlQOGJ2amlwVm9pU255K1ZhbEZML1RxWk9PWWp6WkVVTnBzOGUxVTk3a1dK?=
 =?utf-8?B?ZVQzOU8xK0xGM0ViRi9weTh5V0s2UVpjS09BdDVUWFFMZHRlVXNNZDZTS2E3?=
 =?utf-8?Q?t+s/3935DxPupirjSPZcz9o=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1089ec1-2367-45ce-2569-08dc1d8635fa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 09:15:45.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZmkyzdM708JAR0H6K6gGE5A5GfmI21MKylBnPCp/DDwobUWRA4cby4oJultOIYHrhN3Ai/6Ck047c7+uae7Fa08VQo7n4AYqY1zEIamwh0Afk1v0O4a5RhEY+CI7QV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7104
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, vbabka@suse.cz, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/1/25 15:31, Mike Rapoport 写道:
> On Wed, Jan 24, 2024 at 09:19:00AM -0800, Lameter, Christopher wrote:
>> On Tue, 23 Jan 2024, Huang Shijie wrote:
>>
>>> During the kernel booting, the generic cpu_to_node() is called too early in
>>> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
>>>
>>> For arm64/powerpc/riscv, there are at least four places in the common code
>>> where the generic cpu_to_node() is called before it is initialized:
>>> 	   1.) early_trace_init()         in kernel/trace/trace.c
>>> 	   2.) sched_init()               in kernel/sched/core.c
>>> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
>>> 	   4.) workqueue_init_early()     in kernel/workqueue.c
>>>
>>> In order to fix the bug, the patch changes generic cpu_to_node to
>>> function pointer, and export it for kernel modules.
>>> Introduce smp_prepare_boot_cpu_start() to wrap the original
>>> smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
>>> Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
>>> and set the cpu_to_node to formal _cpu_to_node().
>> Would  you please fix this cleanly without a function pointer?
>>
>> What I think needs to be done is a patch series.
>>
>> 1. Instrument cpu_to_node so that some warning is issued if it is used too
>> early. Preloading the array with NUMA_NO_NODE would allow us to do that.
>>
>> 2. Implement early_cpu_to_node on platforms that currently do not have it.
>>
>> 3. A series of patches that fix each place where cpu_to_node is used too
>> early.

For step 3, I find it it hard to change the cpu_to_node() to 
early_cpu_to_node() for early_trace_init().

In early_trace_init(), the __ring_buffer_alloc() calls the cpu_to_node().

In order to fix the bug, we should use early_cpu_to_node() for 
__ring_buffer_alloc().

But __ring_buffer_alloc() is also used by the kernel after the booting 
finished.

After the booting finishes, we should use the cpu_to_node(), not the 
early_cpu_to_node().

> I think step 3 can be simplified with a generic function that sets
> per_cpu(numa_node) using early_cpu_to_node(). It can be called right after
> setup_per_cpu_areas().

I think this method maybe better..

I will try this too.


Thanks

Huang Shijie


