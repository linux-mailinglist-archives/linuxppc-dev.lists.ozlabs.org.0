Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D15835BAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 08:33:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=mbYCrIvT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJMR25ymRz3cJ9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:33:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=mbYCrIvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:200a::701; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJMQC2Qkpz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 18:33:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDI9kMHVrQxhGhNYjuBAzDFVSobDEnvSuF/b/hUDkFB3KCYxE+0ISeLUwlkNDLcXwl+gdVxl4rzGTlsUstsbtnSYGD4X/kQmjmOmoJsTn8WXm53KQtMBOVHbQyQ+qcssxbyQAiv6hNAW89ZcZ2t7pNyzc0HasC1vIzu9Qt1fdtmeckeH9y/9otV4WNoXpzHXEd7kj/NKZ6Kff+Fl4clE7Jw8jYx7VW+mpyN5GQQvtl2lvzZSm/8YX/jWMvtczTjZXldQ5Qp4n8ch5XyEM4HEpmjbPi8d0pUhdvBzO0NCt5GdriKxxxWhCgUvqzArqoHzMQHVUo4kZvlPfVQrUABUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMmLoXFnauY9KkDUcUs7kn/KAWO9NChcXWBew8e/yJ0=;
 b=buBERJQ2PScCsyFI/7X0bkt23HZtTb1MDVmEDe0iElE/PeWtcCCG4zoXsDWA2FhRnfvEHCMKY370fAQPZ1NVvAHZykkokwe+uFeJ0xeUbUuScnwChE79FC6PugT1tdvNLO0UU7qHlXsRlPHUgmLehLvarsmrqwB57nB9IrG0iDTuZ2aP1TFNhZX5IG+QberAlNnaQ+vYeBw89jydpj52vERVA1hDldXwC/gXC+P2EePLd+2a47olrR3tfklJOe8LZL6+5YWfR+3XkYCYROxqAZsI7qi1eaWHI9sZeVdp63y4F4z5QeFjN5f0SCfUSAibWgf9xVOKB8Nk/7r0aL1cOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMmLoXFnauY9KkDUcUs7kn/KAWO9NChcXWBew8e/yJ0=;
 b=mbYCrIvTyPZ2RQ/2Nb99ZRClxgU5pxGb2W1ERiWxmMpwwEbnuefC+LSr6YHa5buqHjO6lj/qxSOBghuPveiovSGzdpOShskFXScbArNSqW2uJSLEB7BdJUfbi8zIdmABJ1z9SI8rs2BRz5ACLqVrkQF+IpbUYAgis7x6GU7B41E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SA0PR01MB6379.prod.exchangelabs.com (2603:10b6:806:e1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Mon, 22 Jan 2024 07:32:46 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Mon, 22 Jan 2024 07:32:46 +0000
Message-ID: <1e39190e-3cb9-41f5-bd60-1f1124823e4a@amperemail.onmicrosoft.com>
Date: Mon, 22 Jan 2024 15:32:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Yury Norov <yury.norov@gmail.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
 <Zaq5JT6SaiogCEkT@yury-ThinkPad>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zaq5JT6SaiogCEkT@yury-ThinkPad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:610:b3::7) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SA0PR01MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a667ef-ee11-48b9-55bf-08dc1b1c53b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6TdZwVbXaJ2LXfN776XoNhi70w3d0IgW4wLwbVPcgj0PtJC0RbmhbLSII8NbY8+dPPkqhgRPB1v6wg96BG70Xc/W32bE714d/5JW7SOU+62xuWAPZDKwVLdu4nM2+u8LycBPf04hvtUKo9fVIrXGmBFX8RwHIQhWwvbkT1/s0lZF1JLZiiR6gjeNuCjKYAQ1hEOpWxZJfYAJcgsasSW/nixSqW18oHWoXKEHGGXB7doBx0v5fLpriSWkoWNPmYv4k+DGq8WsUQlvMXvuS/6HWuko5lkMKH41XpXs0xqiUeSQXHT7Gv1/LxmZ6GxEplO1Z1OlHm6ZUMR99hcVzMsfNEEht10zYufhtXWwtGAa99SYccnpGmKPdGOybP71Fp03ZY9Hpxv8fQQXRmcARY+XZdOJya+12Awgfgt18LTiIKrrnR0hGZV8WCDq4fgfbPrJ2K4no1l5cuai7tPf4ZROUnZxJh2Ks2A7Ru8yfttUTIYGy6bAsxw9LiGrP2M1hOqHYPtxOq14gxY0YSMYiZ9RmaccxQeDyv3ZG+ko75G7gtmQ0e5SW7zHO6xgroJGMZpFdNId0sErmq8pEgTE1PMqGa4ZVKOODUhesBhR76PDDRMYMJBScoDXJncLrrGWnhxmTHve5/jN6NjSko82QHeJlegLQ6Dmzlo4cSnsMPiiOjI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39850400004)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(6666004)(8936002)(4326008)(8676002)(478600001)(42882007)(6506007)(83380400001)(83170400001)(38100700002)(6512007)(26005)(107886003)(2616005)(6486002)(66556008)(66946007)(54906003)(31696002)(66476007)(316002)(6916009)(2906002)(7416002)(5660300002)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Szg2WHgxMEhZNlRuWkprK3F0R3hZRVZ2cUVsRjVFbCtoZjNkUGFtcW5tTjlP?=
 =?utf-8?B?RmxKNWp2V0NKVWRMcDRLNkFmVXUrQndNWHlSaXF5V1prUVIxYWF5WVlzbmI3?=
 =?utf-8?B?VTkzVFhyd3kvd0t6dDNmei9yN285UzJxbDAvQW45WmNXWStLZ2YvRzJWRzlY?=
 =?utf-8?B?b1kwRU44ckZ0NGU5cnpKRjlPdTNSQnNRRmhPL3ZlK0xGSEJpUDZaU3o3SGtv?=
 =?utf-8?B?WFBFeEE3My9Ob1lJSXE2SmdhaDVqS1dKWkI0U1VnUXIxME4xa2ZpVVArd29B?=
 =?utf-8?B?aHhMSmVpMWlodHQ0em4xL1ZkSDM0TThmZHlFSGRVYUcvUlJOS2REQ1FIN092?=
 =?utf-8?B?MEllRFZQZVFZcUFxaWFOMC9YdDc1cVB6UmNGcWJ6emdhM0tSZzlaTndpa2w4?=
 =?utf-8?B?ZklYV1JUZHJ0VjdPNFY0UGxTeVNyMDBOb3dKZndlbGJIblk5YllVNkVIM05s?=
 =?utf-8?B?TzdPWkhFQzJSaUZRd2pSWUxiYUN6aDdPMlRyRnhmWThEK1JDUUpMdWtHeWxC?=
 =?utf-8?B?dE9MbCtUd09nN2RGaGJHdHhvS2VSUXdUOW42YVZsQnh4ZEVUd3RQUm1zN2ty?=
 =?utf-8?B?UHZGWFNqNURLa3A4NjhTQ1FCTU13UUoySUtwVVArLzh2Mi83Z29rdkgvZnNN?=
 =?utf-8?B?ZGpyNUhIM0UvajJza2cxQ201aFQ2RnBhSDQ5d2JuOTZDQktNV1RabGpKZm5U?=
 =?utf-8?B?bi9BQXZxUEk3NUhjUHdvS3JRZng5YVR3L1E3dDJqTzhkbGhsb2Y4TmtKc3Rr?=
 =?utf-8?B?UHpZTWpZaWEzeW9XZDNtV0NvZzgyaWU5ajlLYi96M3dId3d1TlUzU1oyVHRY?=
 =?utf-8?B?TmFUWmJXWUIyRWkrbG5tYzZzQXpMQ2t1YzJYL0FtUkk0SVU0TU8rdHdFcmhK?=
 =?utf-8?B?dDdSZlFhNHRwekxXZnI0VTdmZW5JNThiYWZidTlTOVhFd1hDMDI2TVNhdHFs?=
 =?utf-8?B?L05RLzRPS05NVmN6Q1pjR0xQZDRaZGlmRlVJc09IVUM1TVlwWE9XQ0ZnNWJt?=
 =?utf-8?B?N1QwQno3MWt0VDNCakRqL09zVXdhbGV1c29zSlM0dUx1alJVMWp3SHdZMVMw?=
 =?utf-8?B?ZXMveUJ2c1lzd0Z1ZklOQWRqc0dOVjNpMjBzUld0TjRiZmUrZkFXWlhwc0sz?=
 =?utf-8?B?Z2hodmR4cUJKUlprNmpuNUJVYXlDQmVQY0RLeWE5Y1ZpaTRhMVljdVpsQnh4?=
 =?utf-8?B?S1dYckVlTEdEUWlQT2ZVbzVFR20vYmJ2UFJCQ0UxUFZ0VDUybTIrdWVKNkV1?=
 =?utf-8?B?Vk1kdlFySFpIbnRuOUZUTVllajAxb2ZTeTJHODJaUUZHWkJuZDdCNWFMMVBT?=
 =?utf-8?B?SStkRWxIdk9XZmZVNWtIWnVtZ2w0TGVRb1lZc1crV0h2aXdGRGZlTURzUHNn?=
 =?utf-8?B?dWxBQW5pZGUwUjhNZVRmTjVIU2xCUEFqS0FvbmJjVm5taXpXNGNBNkpxa1hi?=
 =?utf-8?B?dTlmSlBNQjF1ZjBFZW5hcEVJVU90RUQ0VmJxeHJGNE81WkRseDZtejQzWkhC?=
 =?utf-8?B?M1IrbnIrN0VVTFRZdGp2aTJRdjBtNzkzUllwSjhyazNGcENIcXFVbk5pODFz?=
 =?utf-8?B?b2xydkFycStmYXZaYllSTmhkKzZqcTFacFg4V214S1NNdEpGVmVQNFpNY2Zi?=
 =?utf-8?B?dDhiRjNwVDJMRjlMUWg4SFFobDNUeWJpM1JGQmdhL3ozZ3YxZkUrOG1iZVFV?=
 =?utf-8?B?NmxHWEdPUVQ3Mi9pYUVFeTlRQkdPcXkyTHMzaGJ0RUwweVg4OVQyckw3dlh2?=
 =?utf-8?B?VFJadS9ac0hEU2VUMDF2dURBNlJpV09UUVdrN2NmZVE5WG4xS1VFM3lKMmYx?=
 =?utf-8?B?MFZyMTFaWm13YVVDSVNlVk9PWldBeTBaUHlkV3o3NUZTRC8yaWViQURZbVB1?=
 =?utf-8?B?RVFnc2VxZk50ZlBvSWFFcnZjeDhJdVlCR2k1Um42Qkx1TFpDMXJjWDVkVXZa?=
 =?utf-8?B?YVJxMXRrNEl4VDJ6dCtDcWNSQWtKRlQrd2Q4MERla1dnd2NmVnRlY3grZjR2?=
 =?utf-8?B?c29hdDk4RFVKQ0ZIcm44OHc3Wmg1OTRmdVRFdXNyZEhoRGJyM1BGbGc2cEQr?=
 =?utf-8?B?bm5jUGtuOTNzekxFUkw2UTRZdlNkS2Nid1IvbXZKTG1aUXRyQUh1ZE1UZ2Vm?=
 =?utf-8?B?WGtRZ0RUcU1HUHhTc0lEUkRPSit0RVloeldNUTJqWTdUZ1J1RTkvS3Bpam90?=
 =?utf-8?Q?tV1q2wkOVhEQOZeaxCPZvhU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a667ef-ee11-48b9-55bf-08dc1b1c53b8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 07:32:45.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dykvp/O6lEy3ZHWlYAkZ8e+2942Vu8eXdL2D3VVBxgB38l+igSj2xwZ3G8Mvyr6UzlfokbKnIipxJd9nezsFrh6PvLtt5ExW5zyiduWDR7r8iMf0oiQP09cQ0KykMjJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6379
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/1/20 2:02, Yury Norov 写道:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>
>
> On Fri, Jan 19, 2024 at 04:50:53PM +0800, Shijie Huang wrote:
>> 在 2024/1/19 16:42, Mike Rapoport 写道:
>>> On Fri, Jan 19, 2024 at 02:46:16PM +0800, Shijie Huang wrote:
>>>> 在 2024/1/19 12:42, Yury Norov 写道:
>>>>> This adds another level of indirection, I think. Currently cpu_to_node
>>>>> is a simple inliner. After the patch it would be a real function with
>>>>> all the associate overhead. Can you share a bloat-o-meter output here?
>>>> #./scripts/bloat-o-meter vmlinux vmlinux.new
>>>> add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
>>>> Function                                     old     new   delta
>>>> numa_update_cpu                              148     244     +96
>>>>
>>>>    ...................................................................................................................................(to many to skip)
>>>>
>>>> Total: Before=32990130, After=32990710, chg +0.00%
>>> It's not only about text size, the indirect call also hurts performance
>> The cpu_to_node() is called at very low frequency, most of the times is in
>> the kernel booting time.
> That doesn't matter. This function is a simple inliner that dereferences
> a pointer, and I believe all of us want to keep it simple.

Yes. I agree.

I also want to keep it simple too.


>>>>> Regardless, I don't think that the approach is correct. As per your
>>>>> description, some initialization functions erroneously call
>>>>> cpu_to_node() instead of early_cpu_to_node() which exists specifically
>>>>> for that case.
>>>>>
>>>>> If the above correct, it's clearly a caller problem, and the fix is to
>>>>> simply switch all those callers to use early version.
>>>> It is easy to change to early_cpu_to_node() for sched_init(),
>>>> init_sched_fair_class()
>>>>
>>>> and workqueue_init_early(). These three places call the cpu_to_node() in the
>>>> __init function.
>>>>
>>>>
>>>> But it is a little hard to change the early_trace_init(), since it calls
>>>> cpu_to_node in the deep
>>>>
>>>> function stack:
>>>>
>>>>     early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()
>>>>
>>>>
>>>> For early_trace_init(), we need to change more code.
>>>>
>>>>
>>>> Anyway, If we think it is not a good idea to change the common code, I am
>>>> oaky too.
>>> Is there a fundamental reason to have early_cpu_to_node() at all?
>> The early_cpu_to_node does not work on some ARCHs (which support the NUMA),
>> such
>>
>> as  SPARC, MIPS and S390.
> So, your approach wouldn't work either, right? I think you've got a
> testing bot report on it already...

IMHO, my patch works fine for them.

They have their own cpu_to_node.


The x86 reported an compiling error, because the x86 does not compile

the driver/base/arch_numa.c.

I have fixed it by moving the cpu_to_node from

      driver/base/arch_numa.c to driver/base/node.c


The driver/base/node.c is  built-in for all the NUMA ARCHs.

> You can make it like this:
>
>    #ifdef CONFIG_ARCH_NO_EARLY_CPU_TO_NODE
>    #define early_cpu_to_node cpu_to_node
>    #endif

Thanks. Add this make it more complicated..


>>> It seems that all the mappings are known by the end of setup_arch() and the
>>> initialization of numa_node can be moved earlier.
>>>>> I would also initialize the numa_node with NUMA_NO_NODE at declaration,
>>>>> so that if someone calls cpu_to_node() before the variable is properly
>>>>> initialized at runtime, he'll get NO_NODE, which is obviously an error.
>>>> Even we set the numa_node with NUMA_NO_NODE, it does not always produce
>>>> error.
> You can print this error yourself:
>
>    #ifndef cpu_to_node
>    static inline int cpu_to_node(int cpu)
>    {
>          int node = per_cpu(numa_node, cpu);
>
>    #ifdef CONFIG_DEBUG_PER_CPU_MAPS
>          if (node == NUMA_NO_NODE)
>                  pr_err(...);
>    #endif
>
>            return node;
>    }
>    #endif

Thanks.  I had a samiliar private to detect it.

After my patch, there is no need to detect the error again.


Thanks

Huang Shijie

