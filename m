Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180F835C91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 09:29:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7mfFYS4v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJNg621Z6z3btc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 19:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=7mfFYS4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJNfG6flRz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 19:28:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6oFlIolLKcOmVUMQpJBuPuHExbJ6x11YoEnOnxe6fCf0mecbrnNGQA+OqdHjVC9C366EG9JkfJ8xI/p23ht62CY99L2+K41gpBw/8xsOSFSxK4q+czc51BLiKzRZ/+vmfsTaN6+QrmOkeoGQY9udyLzgpp2SEbcEz3kq5kqnMnxblDi6EYiO/ZKD+rCE3ChvqE3kGZkOQgaiR5rvTAcwOOLaMCF44uEG4ATJVbQ3z9Uu3+fmyZBVAgvulLqiG4WC+FG37XSBQLBNN5tYtxktRdEEymJw8OB8nQk8j5Q7AiRtukZdZWHO7+zM4ZlRdP+T1yW5ak7zK0v8fQuwzOmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/OQsH/h9MEYqYgFJAmdJ32/zkiLhRbhU/7SYMCvYx8=;
 b=a4BvI3cfpiXkBIIyoPgJWEzzQ0z5S37T+J2shbAToZcsWcW5PZiwk932n7HUZY2AlhjuLoIkL8ZTidOEM2v2yIvx6HoxAQhzPQRGVsT8LWKzU4x0btse6w5QL5sfXJbbdP190vCVg+gEpwas6im0ZYY5cvVj8j19o51OGkguSZRTMtRBw2OLJEDtcCunAO/T5+m5EHEMVlFUaNwDABP+IDmNdWWUD5gHLP0yOHtfKTTGybGUSqg8zfHHBnFNvtZk1Gflw5D6EnXEUcanTXUj6R78Q85cpTGhWsAvc6au418PJYRXzNiuvYPim8Hm2peZnBRkB2OhmPWkdXsDcejuTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/OQsH/h9MEYqYgFJAmdJ32/zkiLhRbhU/7SYMCvYx8=;
 b=7mfFYS4vCdZySb/13z1Ugz9r6RLFJ5wDO+n5xyo2MkmyfwkkCi4oZH2R0JjVsv4mHgUtFXIpHfqvTEPItcL5PHtUX3S3zYPkT+/LF+Sjc530SDBY7hbr73AntzQSJBdowAFEvp6MyYEjA3HpH3mTuwnX/WfzsH9QMBhgIBniLbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 PH0PR01MB6603.prod.exchangelabs.com (2603:10b6:510:75::9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Mon, 22 Jan 2024 08:28:14 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Mon, 22 Jan 2024 08:28:14 +0000
Message-ID: <9d9b39fc-82db-4320-9935-f760ee723064@amperemail.onmicrosoft.com>
Date: Mon, 22 Jan 2024 16:27:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Mike Rapoport <rppt@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
 <Za4cNBQBLZujlAlP@kernel.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Za4cNBQBLZujlAlP@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH5P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1f2::12) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|PH0PR01MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 4636f5cc-2fc9-458f-b000-08dc1b2413cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aNoFEUdLf58HF5Rzmwsj7WqwWnSkxnmxN5o3/B464Qn/mauxEGfzibbVchI+RAkH7lt3dv7HaL15nj/En1kFHKveWy+o5i/qvZPGXs8EwEeGCqlzRM70L5m+2V6EanhQebcXBY9I1pS9A/I7k42szI+nDm44Q6Ai9Im76u0rl0g0ghFadVame7n+Y01sLg7SD+WNtomyYx615TIgDHD6L4qfQV3WDF5rylpwAnH48E+DGR+sCM14YDYYbqRjGN/SiSgTIUbf6rW4DqwhCTmo9P8hX7zyyHzopgPQE+GW+mgKlyR1argQKi1CDziDR4T8c7Az3pgjkVeXHeHIpSjCF8jZ3pY3SzgTELq9QBfb8+1OuNKZQcoeixCcjYzhprgAZtA1fiTdDKLxrXJGsNxLN2Z7H8Q5QAdFlYVXdKaaSDD8zDpcb4ZeYEh6DITe54te4wJQz4dHhInQUsmKs8NPkEp8K/ctPsm+gMswSfm0V1ummuRg7gw3DO9qaH65XOZi1jYouiXtliazTXnL+GXVMCH4NtVqIgpLw6m+pZxQ/8TJqwP7GFBsTxb9NUBp8CdwpQn2pdeuCJn+259z5S3qnUZDha5Ya1pWm4J53OOmen3NKUFZ6VJc5g6IwGelCdOE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(26005)(2616005)(107886003)(42882007)(478600001)(6666004)(6512007)(6506007)(6486002)(41300700001)(2906002)(8676002)(31686004)(8936002)(4326008)(54906003)(66946007)(66556008)(66476007)(316002)(6916009)(5660300002)(38100700002)(7416002)(4744005)(31696002)(83170400001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SEw0UjFlZUVFVTh3OUFHVjZGK0docW1WelhrY2RXTXhPZUR5U2xnL0NadUo5?=
 =?utf-8?B?dkJsMGJ5QWVvdXYxRXNxb3F0V2FJaVNhSVRjejdtTWJSckNVblM5TnNvSG0y?=
 =?utf-8?B?Q2liKzhOQ05GNE9ySEY3VFFDdmZtR2V0VXhYeFJWQXNrWGkrWTEzeElCelZr?=
 =?utf-8?B?NnNTeEt2U200RVlvM21VcllsWlpnTWs2ZVhaQ2o4VXBMb1hPcy9QSmF3dmRk?=
 =?utf-8?B?dFhSbkZ0Yldaem5kVWF1UDFVcHorQkZVdjliOWNOajF1TjN4cVF4TUx6NUcw?=
 =?utf-8?B?L3lqYmN1WWhMZi9rbDFDQytSWlFaQStDYXZWVDlaY0RDR2RWTWIvcnEram5v?=
 =?utf-8?B?SW8rU3RIblJGNGV4cm1KcnZEdkJRZTJuMkl3K1NISUZIQ25IZVZyZWNMb0xm?=
 =?utf-8?B?eFh4SzB3YWsyRXVBbkhtbGpnNXRJMlZTZlg1aW85V3NyWk9UUHJmTEtiTHNt?=
 =?utf-8?B?WllBcDZMam15MnR6alNPZWNVV0tYZEwzRXltYVlTNWVvaWdGdmkzUUQrclZL?=
 =?utf-8?B?ZEh6anhnREZ2RWlaWEUrQVYvZlRzZjN2WjlHd2JQa3hpeGxTMDd5YTF1dGRG?=
 =?utf-8?B?UE4vdnBjZFg5S0JNelNCV1VCc0I5Qkd4cVh4R2MrYitZSEM1ZzFIYzVnQnc2?=
 =?utf-8?B?aFF2eWhWLzgzQTRUdXZabGZaQzNkdDg1YmszY2xpNndaR3o5R2NjNDNtZFhZ?=
 =?utf-8?B?bFp0bnRFcno3V1hBTFRDbHJGMktaWlhkYVM2SlpjQkdaMlRmR1JvRmF2dm1R?=
 =?utf-8?B?cXlYb3BCRHlUZ3ZFU2JQYkhJY0IzY01PV29HN3pTY1h0SG44cWZyZXMxQkEw?=
 =?utf-8?B?cXQ0aW5MWXBOYkkzN1dLNmY0UDNUNmwzUlh6WW9WUW9sUUJ3cmhEUjRwZWNt?=
 =?utf-8?B?VGh0YmhsTDhWK2RrN0tFTnFNb1p0YWlCcTRwem02Zk5sZEJERnBlQldnZmtS?=
 =?utf-8?B?U1ZjQ0VWL01vSWZHeE54b1dmS3V1SDBOZDJjd2gyM3VLaVY5K3pDSVp3Qkx2?=
 =?utf-8?B?S0xVM2hkU09SdDdNVFRzdjQ2aHZDZTc4UmxIYW9YSStYT25oaGZZZGhLODVl?=
 =?utf-8?B?Rk1LVUE3MWJlb1YzRHkxMXFiYU9Ga0U0bG5KU2xSdnZSTFA1UER2M2NpQW1M?=
 =?utf-8?B?UnNjNCtrOGlhaE5vc2JPQzQxTE12WUNlOTF0N2pXckZWOVQrNitndW5PNkdu?=
 =?utf-8?B?NDg4cE1pMWtEa1FhT3IvRlZvdC9Rc0Zjalk2cFJ3MnY3M3pVZnpsN2YzOStu?=
 =?utf-8?B?WG9yRTNnREZwMnZ6R25ST0xYY2xwTmh2RS9WME42MzYxVEZUT0loZnhsM3Bu?=
 =?utf-8?B?bGxnc0FtUmUxSDJhdlRtdGJaTzFuV1NvMU0zZGVXZFV5V1JvRFVUNEJWTjhv?=
 =?utf-8?B?Skd2YjdKc1dsVVR1NkxQNG9ibTNRSGE4ZlZTaVJUSUs2QmVUNlFTVUlIOGNy?=
 =?utf-8?B?TFk2RjlnNzEwbWVZOTkwb0loYlhGa2NnT2grVStLRFZyMGx0VG5tNC9Pc21Q?=
 =?utf-8?B?ZkhiZ3NKamI1S3kycENweVpMRlREWXJYbEsxVFcvSVRiOU1Tenh3eDJHTkxF?=
 =?utf-8?B?OXFlckpYV05qbzRYd2t0cW4vS1JLdy94Q283NU5HMjB3NjRoYXBvcGlpRW82?=
 =?utf-8?B?Q1ZBSWZyMWlkaTFUUS96VHNnNWRROTJNbGtCT3oxUVk5cE4vNjNneS93R2dB?=
 =?utf-8?B?WDBuV1hmZEtYTXBoaHJIVGE0L2NPbXdiUlI1OEdOUnZVSVRPamxlZWtOOXhn?=
 =?utf-8?B?eVR2elI3eHd1R3FZaWZUVlNDVEtWMFI3eEE2aEZlZnI1YzhBZmRUWTY2SjI2?=
 =?utf-8?B?N00yT3NGQnhQek13RUZzdEJoYVprR3NKeUtSN0RuemFzMFJoOEZDRmZtaTVo?=
 =?utf-8?B?cEpkaHFCRlNvUThwcDZiV2hvR1hnVUphbHVBYjhrWkV6ckZmN2h2Vk5EeXJt?=
 =?utf-8?B?ZTVUSlg3Zk1QYzJ5Y21sa0JUL0M1RW1Gd2dsSEdYZzhCR3YzQVhrSDJLMGRa?=
 =?utf-8?B?T3VNcDd0bjR4VlVsSm94UlVEb05QTkQwYlBnV2Rzb2RkZUR1cDREalZlZ2wz?=
 =?utf-8?B?bFFBQ0FGNjM4bVM0UytCbEUrZ1hkNTRMN09QMGJQa3JBZEFiN3F1UURoNHpv?=
 =?utf-8?B?Q2RObHlNQWN1WE02ZGIrR25LMVpUcCtNZWtGanIweHhxbktGbDhkc08yOE9M?=
 =?utf-8?Q?75qimKA5MLosMzfaujCi8JE=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4636f5cc-2fc9-458f-b000-08dc1b2413cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 08:28:14.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mns27POmZo2tUMhwRvOVd5bbbz4iztUoNj1TqB9I7OLAgLJ3z8x3KYm4LaF9U4BDX0R/3C5I4coNgEZIbZtIpDCTNwvYUm9qY6gPCM//DH0RH/oby4N+7+uWd/+M/BLJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6603
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


在 2024/1/22 15:41, Mike Rapoport 写道:
> On Fri, Jan 19, 2024 at 04:50:53PM +0800, Shijie Huang wrote:
>> 在 2024/1/19 16:42, Mike Rapoport 写道:
>>> Is there a fundamental reason to have early_cpu_to_node() at all?
>> The early_cpu_to_node does not work on some ARCHs (which support the NUMA),
>> such as  SPARC, MIPS and S390.
> My question was why we need early_cpu_to_node() at all and why can't we use
> cpu_to_node() early on arches that do have it

As you see, some ARCHs use cpu_to_node() all the time, such as 
SPARC,mips and S390.

They do not use early_cpu_to_node() at all.


In some ARCHs(arm64, powerpc riscv), the cpu_to_node() is ready at:

     start_kernel --> arch_call_rest_init() --> rest_init()
                            --> kernel_init() --> kernel_init_freeable()
                            --> smp_prepare_cpus()


The cpu_to_node() is initialized too late.


I am not sure if we can move "cpu_to_node initialization" to an early place.

Move "cpu_to_node() initization" to an early place is more complicated, 
I guess.


Thanks

Huang Shijie




