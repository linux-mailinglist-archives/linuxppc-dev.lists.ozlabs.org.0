Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F0D8325FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 09:52:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=zXID8gJx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGYJy6LDXz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 19:52:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=zXID8gJx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2418::700; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGYJ74by5z3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 19:51:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8pk2QU1FzDr8062uRLLFJpsggKrIoB+Xy6I7pEXHsl26OYCxtT5FqFJCxu3C0hLcAIfM82Zxmb8rrMs/WpG0QeaaPFuSfV7vJPrxZy0F4Z/O5IxNHB1av/esREU23WXL/EEoerRsIGzFYDJZw/E+4XW41bvs+TSU3o7BTf96Ztbesa5YUjN/iqeH5SGjUoYBgw8AdNuIEVdrwPGXiqv1gPv5/Kd9TnMet48iPbkQ618ClVABpWHthgsnbKtCZriHFEip+oM8L1AJxto7pCkemjHAgxxPUf3xkf8lcab/WkEnw9U7FXndLX+Uk3dlsuZRassKp0EIzgCD9cWfimVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3iiGy0ADGM92s0ECxkPq4rJLSIGVElnc9D6RypFUaw=;
 b=a6Bd7BWGkoQW0JUXDSFUTXE3SnpJSVmJuYygr6Bvscmmvor+9fgU1/PKNJEzC1JwZEaKfo8N7fyn87W3GzEklQ8Xh9BXAQFuRXl7WBkY7mjyAj23FFILLThVPmfZCu314P8WvyDTvCyWCOLXZ3IWyNi0shioftZ7Bv2Ci5iBAu6KuwGBbubNX+IBPnbwNDqXg+E3zV91kReNItwSoycpO2iEJ7TJilrPeFAi2HXmcxDn9gaewsaMVfgHpWFMBQkL8hxJsrrg8BvPy2UOgaW8hBgfPnC6w5bQI9L0l7HpAhZYdiKaQDLtblEgQJPSR9/9X5mmvrPG7wv+9wjQIyrkUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3iiGy0ADGM92s0ECxkPq4rJLSIGVElnc9D6RypFUaw=;
 b=zXID8gJxcVBcFK+w9E0GCEMrsYEQudH3NvjVimUWnJAtzoztmdKf724zjDxhqNEiTJhQOA74XB91pwnXC8TJgxXqINuuVGR3L21F4IoC72eutmQf8O1/WdK4h0TL9iYXim1K40KWO2nNSwOxJqhcGduKZhrthiux3t65tWWYqV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 DS7PR01MB7567.prod.exchangelabs.com (2603:10b6:8:72::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Fri, 19 Jan 2024 08:51:08 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 08:51:08 +0000
Message-ID: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 16:50:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Mike Rapoport <rppt@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zao13I4Bb0tur0fZ@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::20) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|DS7PR01MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 43278f3c-1f53-4962-2382-08dc18cbc760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0iwyAJVQD3Od9QS419cmU0MoRt+Mjm2gw66INIrJ5uQVAmupcDRo0/CDE+mm2S0aNFp+Ms/eNc6AxKW6/Ar9oRILRROB3GGzaCGV/venrE67WBuq3UUQnlq1UvfuJOLMj9FyBRPeM9Jlh3UU1xKTVSS4pd1m27lWge8MbaP/QuGPTIXt1nmYEp2rAjlMdMo9aJRda2BwmTwo64spZtC2GJ9p5VIyq3cHMarZj3mMtMZifDWFODWR8YEYGyJM8punqfSKkf4GkKZCTPH+M+BB64uXZMaJqoWCFHIPc1fMYqJPAkAqZVhRvcTbMxhN2WIWMqbPZDGsT5acT5CW5kyLinucLUziJ4NgxxxXtdVamFT31bi3zigpa1TSFmHzYHgFpLpJtlZyyTUkHKJWnuKuiTFLAf3SaY0Gyaa+92AE7vSBrxJMV9IZc528bVNZjDStrjTl41uqAGRj1TGXN+bc+of3lwvtNeMCICQH+4ZPJ6uT6tKnNQUKT9K2aCUSCGztTnixV7sDSgamh0ZuoLLxypqupasLaN5U/ClzA9vmfFue/JGuto7YkHUIGydIT1vwxOC8XLg+d+M072gouSuZI/MyiSWOAD6yxwi9DZPvxdhO/F88HcwnkkLAvVkD77Aa
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(26005)(7416002)(5660300002)(6512007)(2906002)(6506007)(6666004)(107886003)(42882007)(2616005)(66556008)(66946007)(316002)(8936002)(8676002)(6916009)(41300700001)(66476007)(6486002)(31696002)(478600001)(38100700002)(83170400001)(83380400001)(54906003)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WWFzRU13N202REFWU1RMTkRMNHRpSEtzRVdMVVFFcVkyMUlVNDFOamdqUzdh?=
 =?utf-8?B?U3lTVFRMRE96ekFaQzVzaXQ0c2FHcGdkRkRTYld5UHFZQ3hZbVc2eFREeCty?=
 =?utf-8?B?SVNvcktKZjM4WU1XbzlJS2VpOGYvalcyT0tGdXVpYU1NdXdGSHZDaklJMGVz?=
 =?utf-8?B?THovdk5ZcDdwUGJqYUxCV01ITTFETU1jQTNTYTlsRldBekhHNjgzeHNQMUli?=
 =?utf-8?B?Mm5RdE5BUXdxYmZ6eEZ6eVVkUUFLR1lIdjZySW9VWHhlT2Y0dnFXUzNvNlVQ?=
 =?utf-8?B?ZFVDSU9neDA0eC9neXQwdEF1aEdZTUc1Um5vaVYraCtCckFoKzc1c2hXOTU1?=
 =?utf-8?B?SXFZMGdwUGtDR29pOXJ3TEEwTWhOOGJJcitFT2hkZGI1cnJtU1VEaXhMTWND?=
 =?utf-8?B?QmpLSlpKNXhxT2lSTVhCUjd3NnB1QVdVbjVXSDJrSlpMb2JkK0o1d2s1ZXFl?=
 =?utf-8?B?dkI4dmVDN2QyQWZ1dTNneXUxWU9jOUZLWGpEaUttZUJxZ2xheldsVmdSdU1N?=
 =?utf-8?B?VXZkTklRSDcrUmQycnVXVUhxTlNSUVc1T2hjeHp5REo3cmFuSGZQajZ0VzNt?=
 =?utf-8?B?N01hTzd3N0JZZ3VGbUl0WE1aQ1RMbDA1VktHUXdJSmFUZzc1QkxvTUhsVEVS?=
 =?utf-8?B?VFNleW9aZlJjemVlVElDVHJrdGVSaU1UeTU0ejRnM3dJQjhzSHg2eWtMb1pV?=
 =?utf-8?B?bXcrU1NYUmNQZU9nLzZXRm9kd0ZpVzBwRTRvMXVodUVma24zaG0xRjc3blhQ?=
 =?utf-8?B?Q0xOUnhLcXphTjhaRCtVNVdXWVRHeUZnZWlVQ1o4aHV5elg3QTdiZ0QrempH?=
 =?utf-8?B?STZKWGZjM0tqMTdGUUM2LzY1QXM4Y09oREZISlo5RkF3aXFMUy9taXBRb1Vi?=
 =?utf-8?B?TWc3TnFLQXF3WmVPemdVb1VKdlJFOU9oVEpEMysvTzJ1Q1ludWRXZGxkRzR6?=
 =?utf-8?B?dmY4L1hQTWJRcURXdEZNQTZDclNEMmRCVHBUVFh1Vjk3bzJTVjV2Z2ZKKy9D?=
 =?utf-8?B?eDNtVmhKa1BjT1o3WWJUZzIxZy84d3dRMGJhalFKREFWNmlKdWw2dmVkdDVD?=
 =?utf-8?B?YmF6VjJoYmU5clduaTdmK09nTHIrSTRNdCt1d0lvOFZnQXdXVkwvYW9TanU0?=
 =?utf-8?B?eDZCYUw2SG9SbFM1K2lNTkRtKzNiaVpORk5NNm5wM0FXUVdSMUlFMlhQSzBI?=
 =?utf-8?B?b2lZcTlXdkFQV1NjUE1QRzFuWWxuck1WMFl6UHB6YzRNblhvWVIza2JxeHRz?=
 =?utf-8?B?OXA4L2E1dCt6eTdhZHBGaUhKcERteXpuMlo2VG9uQmFieTNvNTJFZStVUDdI?=
 =?utf-8?B?SWx3OVBXZ2FMb2VXZ0hPL2gvV0p5S0hoMVAxajBPTXV2cmRjLzYvaUs3Y3ZY?=
 =?utf-8?B?ZmRIUEZBU0xDa0ZzeHBCZzZkYS8xaFd1YStnU2c5NUU0c0ZpWXNWdG01SlQv?=
 =?utf-8?B?RlMzOG44eFNQbkVkTDBxekkrL3lRcVVpYUJSYVlNN0xPK0ZBakJzWVVRbXNS?=
 =?utf-8?B?UGp6dXN6YmcxK3RmZ3R0ZlRVOS9OekluVDBTN2hIa282bjRnbEk0aGMwb0dx?=
 =?utf-8?B?U3ZQVDNTZFBWTjVXNVg5WDhIdlFSUVBsTUlaYnlVNk9LYjkwbEFacG1aQXMy?=
 =?utf-8?B?UU4vZFZKMDJ6WDRIZmkwOGY5V0VWOGc5aEJHMHZIMGtmaWpYcjNMbkcrdnQ5?=
 =?utf-8?B?aUJYcll2U3VYZXFNV1ZTTnd6Z2FiZ2xNMXFZYUtVbERZUy9aRGhVNHFaMS81?=
 =?utf-8?B?V1NYaUdKWllDQ2VGZnZnWGNQVElhbml6VHJTTmJxVFVid1NvUzM0cXVXa3Yw?=
 =?utf-8?B?UUhlcVFtRWNGSy9NNUd1Y2JlQnRZcG1vSnBLWHViVExrWkkvVkJzRTlBZFhq?=
 =?utf-8?B?bDZxSVBVUHNPbE4rVEtFU3hRWXNrMjJ5Z2UxKzlaSE1SckREM3BNYzh3QnRG?=
 =?utf-8?B?K1ZhSmdoZ1FMbmppeThwRE8zRm9od0NMb0l6WG9DUkVVRlp5b2hnYS9QNGpm?=
 =?utf-8?B?VWJBRzc0MDJMclRzTjVlZnBhSnFrNElJNTNVeGc1N2I1a3VBRHZHVFRob05M?=
 =?utf-8?B?bDNKcmJZY2Vqa2lDUVk2a29mT21BM0k1V3FodnNiMU0vdi9pQ2owMEFseUph?=
 =?utf-8?B?dnJJVlNRd3l3VFVrT3pJTGsrZmttaVBhemE5WjNrK1dzaXUvWUg4Z3ppWStK?=
 =?utf-8?Q?eO7bIPr6cgVldQDrJWm/mA0=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43278f3c-1f53-4962-2382-08dc18cbc760
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 08:51:08.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oSkGiYmlqXlfiQazflNhxShN1MZpL3lSG9oeuX8F0LigO0LkyeKwCUxRAJzZPGsKAAQGTKHcmUGglVxzjpAPcwdysF2MncRR7KbIWYT09Ys9hCJtDaOXQkF8sox5ifU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7567
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, cl@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, Yury Norov <yury.norov@gmail.com>, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, vbabka@suse.cz, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/1/19 16:42, Mike Rapoport 写道:
> On Fri, Jan 19, 2024 at 02:46:16PM +0800, Shijie Huang wrote:
>> 在 2024/1/19 12:42, Yury Norov 写道:
>>> This adds another level of indirection, I think. Currently cpu_to_node
>>> is a simple inliner. After the patch it would be a real function with
>>> all the associate overhead. Can you share a bloat-o-meter output here?
>> #./scripts/bloat-o-meter vmlinux vmlinux.new
>> add/remove: 6/1 grow/shrink: 61/51 up/down: 1168/-588 (580)
>> Function                                     old     new   delta
>> numa_update_cpu                              148     244     +96
>>
>>   ...................................................................................................................................(to many to skip)
>>
>> Total: Before=32990130, After=32990710, chg +0.00%
>   
> It's not only about text size, the indirect call also hurts performance
>   

The cpu_to_node() is called at very low frequency, most of the times is 
in the kernel booting time.



>>> Regardless, I don't think that the approach is correct. As per your
>>> description, some initialization functions erroneously call
>>> cpu_to_node() instead of early_cpu_to_node() which exists specifically
>>> for that case.
>>>
>>> If the above correct, it's clearly a caller problem, and the fix is to
>>> simply switch all those callers to use early version.
>> It is easy to change to early_cpu_to_node() for sched_init(),
>> init_sched_fair_class()
>>
>> and workqueue_init_early(). These three places call the cpu_to_node() in the
>> __init function.
>>
>>
>> But it is a little hard to change the early_trace_init(), since it calls
>> cpu_to_node in the deep
>>
>> function stack:
>>
>>    early_trace_init() --> ring_buffer_alloc() -->rb_allocate_cpu_buffer()
>>
>>
>> For early_trace_init(), we need to change more code.
>>
>>
>> Anyway, If we think it is not a good idea to change the common code, I am
>> oaky too.
>   
> Is there a fundamental reason to have early_cpu_to_node() at all?

The early_cpu_to_node does not work on some ARCHs (which support the 
NUMA), such

as  SPARC, MIPS and S390.


Thanks

Huang Shijie

> It seems that all the mappings are known by the end of setup_arch() and the
> initialization of numa_node can be moved earlier.
>   
>>> I would also initialize the numa_node with NUMA_NO_NODE at declaration,
>>> so that if someone calls cpu_to_node() before the variable is properly
>>> initialized at runtime, he'll get NO_NODE, which is obviously an error.
>> Even we set the numa_node with NUMA_NO_NODE, it does not always produce
>> error.
>>
>> Please see the alloc_pages_node().
>>
>>
>> Thanks
>>
>> Huang Shijie
>>
