Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2483B651
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 02:00:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=a4KS4gHy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL2Z356qSz3dHC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 12:00:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=a4KS4gHy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2408::701; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=cl@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2408::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKrKv2Ntfz3c5y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 04:19:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGgnvf10UmaZPOYtp8BLMUXtan3/aKcKv+QUm6li7EtzjcbzDc8JWl1AppEx+KEMx2PyykWR2vTMlFYxtcL4cNZSSweZacLOJyHomUbhZEHcsGNP1ozwTFgh8TOPUDNA53Z+oIRPyY/raIchiTtjbdgj8e1RUSZUrOJW1J22YLxn5wNHCMDsPv/pXJM2b15bpSKveEIB1WX79uB7uXpviTpXJV7KTmvxxO+HJCeSSSl85b3wzp7vPqFxVwNC05+7+XtofrL/gQwTKNL9KJ5wX4FwqyBNNXodLVyI36c1opJ/rXXPVCVIimBasYZYWPf+Z30/nHD9MMRhuJs1DOiP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI4HfpUTtXNvuwQSEGlM8qBcZ5ooEkInp13eGkE6DEI=;
 b=kJPeYqVfK6ZKviy1FJGWCUejFMMLSBIxvUQRKk/IRYsADF1TPlJCvFxJmeXIA6NCuG/dXnIcWwSfSucD3D9SEigwbFdI0WCx/+whINKmmHr4/2bLsSi1Pa4DVviG9GaUlR8Vkf33JTkJWffP/7WGtfq0f7gxhNwshXs+0GLGMvidcJkZomm5zHFhVUzpWf8j1aLOnXJjH1AyovwkD2Qes8wOe2s9WBAFMvUgqqpIG2UVyZpwf/YgyDZpXYKZpStINs1P/xb6SQ/15mfs3B53Ml0b8ZOsHZMkcIrM/HAokUfkdfuD+0JA+mcVdoLSxZH3MUNgT5JkHpBrT9GTINMj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI4HfpUTtXNvuwQSEGlM8qBcZ5ooEkInp13eGkE6DEI=;
 b=a4KS4gHycZsd8gzGZq7gQloRVMAudRUpObt9RqTkE0QreUggyp7A+wadsXq4/tmjea9wSV26PJh4qMQj9rwiFnZgOxIS7PJHolDkRNGP3Mba/5tdRJJx8ZT0tk//oR4TJWuS+X64rUrCcHx7CbN4XQvL59aDhI0aUJdvxgRaY8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB5259.prod.exchangelabs.com (2603:10b6:5:68::27) by
 SJ0PR01MB6479.prod.exchangelabs.com (2603:10b6:a03:29e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Wed, 24 Jan 2024 17:19:06 +0000
Received: from DM6PR01MB5259.prod.exchangelabs.com
 ([fe80::bb57:ab51:7c62:74d7]) by DM6PR01MB5259.prod.exchangelabs.com
 ([fe80::bb57:ab51:7c62:74d7%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 17:19:05 +0000
Date: Wed, 24 Jan 2024 09:19:00 -0800 (PST)
From: "Lameter, Christopher" <cl@os.amperecomputing.com>
To: Huang Shijie <shijie@os.amperecomputing.com>
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead
 of the correct node id
In-Reply-To: <20240123045843.75969-1-shijie@os.amperecomputing.com>
Message-ID: <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: CH0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:610:b2::12) To DM6PR01MB5259.prod.exchangelabs.com
 (2603:10b6:5:68::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5259:EE_|SJ0PR01MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 451d01bd-5263-49e2-6a6c-08dc1d00910a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Cfn5wmL2clSA68s9xzy4SwBOVPrYYNf4aPfxvyd2YX+uUhRdu/uuBHoMnCc3PuEAz3pFSz5oLxj33Uof/lXWPXMhPh8tanN9buNGXdCZDj+IbHC3WXKE+bZ0hjzLuPmzTTO/bJgVwF/JGNcmOYgDG2ojOt2VH7xbuf2c3SCHc6HZgWDN1K67RcGnja1eubn+G0PP7Nw+3tGnee28Jv07xvFPw4dyYVMLiNHOVKiJ0nce0JefNYyF7qG9iQ6xc2HwlEhZwvQazWBRanPWsLB0+jIqrotFGZa72NqhhJVUPQ//b5S4KUAuA19kwUGXrVU0ImWxi0kzogfLPb6EVEub9Q/o02cxfiqgbwaRgZKCJkPqgcZbcZBdvNY66wIQhGQbQoex3mPsDi/HQOUOktrNwQ8LBwWF/DTUGslOxkSWMmkeTr/XtpMQnn92ogFSW8PZhtGtl9p2H+8mq66D9uB+B2QukTC497rEg+ex9NCs/7HEQLWhQeemmIczOwMvR0s1pBgjrayk/pvdIE7m4sZA5WZosP2GUyr+7vR3uZrQL4BHdI2JM9C5Bqyv2UQdCbQ72NAgfuYG1fvNnRPoIBCMaJ5yDXl5FhsZ4N3VltgBXcrporvKIfgb+hinOLry9E4d
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5259.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(136003)(376002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(2616005)(6512007)(6486002)(26005)(38100700002)(5660300002)(4326008)(2906002)(8676002)(8936002)(7416002)(6862004)(478600001)(6636002)(6506007)(66556008)(37006003)(66476007)(6666004)(66946007)(316002)(41300700001)(86362001)(31696002)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?H6NdgnWRJOfUbn1r6TVJsmVhRuXealrDl7I8c7BgggiMOcNCgAf+3cfZ6kmO?=
 =?us-ascii?Q?KsXvRJjXkGVmjF4v51KMvhOg+cxdCPq4Q81zDB8g7wQVsNyS5ORNwJp1KQqw?=
 =?us-ascii?Q?N1Z0idggreBnOHRJJ8WypdV0LOtV7diqTmt4JYNtGY1TJ1//PZv0PstNr0gr?=
 =?us-ascii?Q?esOwSF22xS5sFCS0b5PEPA8adrIrUtUNiNyYT7oqrj4kqvJUZTlD5By9kOEn?=
 =?us-ascii?Q?q6zUtdfumekcrqObpwiYg4gCsvNU9zw0iPabUQqfON17xKC53Smj96y013Cy?=
 =?us-ascii?Q?xyeAzLs2GUNTZ6g/24A220/lc0CPJUSbOn5Rxj7LbJF8XQ9Oui2osWUk5hYt?=
 =?us-ascii?Q?Cdhg1BQkiIWOBD1pCgBKuYUHhVDwornVa5c5DtSj7Z9L4fUyN5VbZJuo6+5n?=
 =?us-ascii?Q?FB1Ghw/Ll2T8RhubQ9QV9rvDRCM4VIKMXSDBurFGMVX9Ph92ep6a8TNI3ILL?=
 =?us-ascii?Q?L7fhYUejlcwrR/azcr9EeyJWel79pA7gKVqrFPKncfpg2/Va48pf/IVa7KSp?=
 =?us-ascii?Q?xAE8KpDFNOIRS/8YrC84xsHT0UcFLYjyfRR1XMRJYQcUXnFgAVue5qFSKdhD?=
 =?us-ascii?Q?LBlWPEGhwTxsatWRjyrvwFyi9/y0sqeL+GZPOOJbu0RHVYKc4P/uW1l/qmSo?=
 =?us-ascii?Q?IeKh5fUJCCJ25QtZAIumAKuBU2jz62CmzukBcLb27uss9EJVLvmnBrUB6IJq?=
 =?us-ascii?Q?pDSdSS16wTQSeIB5pZJ1KwgagYt1mIQ7fzLne94K9BcZcVE+vrenhFw74KzB?=
 =?us-ascii?Q?1V084oXgNxX0+qcYSh8sFFU897AsRGRt+zCPg8UY0MWDsBqzt5XctpuIjc/W?=
 =?us-ascii?Q?YtbhxZEdxfhvP8i7du6txlNFMVffanwbN4tvatFw92zJGDESnnJ4NeRLLm/B?=
 =?us-ascii?Q?PTGzN92Awl68bVvWu91RnGdujf7Br9/f3lTgtcxCiGDlUCEgy1cWi/v+nIla?=
 =?us-ascii?Q?+vDBVOR2NLwU6AZODJ4MiMDApm3+KNrCCfRAqAWPpWpLDW2i3Pphia3K+ewU?=
 =?us-ascii?Q?YNAVymJhSKZbtTatRUZLN0eIINooVh27tuCG1f6hKquN7aBGDWJPwIPMN2WL?=
 =?us-ascii?Q?3qcODodXOGr5vD2cknB2I9ue8CKS22KdC3mmZvzfAeP++Ov6c9qjoeJ5Mbyn?=
 =?us-ascii?Q?y7i7tnwbPx7cSC4CfOn9I37GL1VhqxIlpS4J/3l3iaUYQvECk+cPeHHFHFc1?=
 =?us-ascii?Q?qRQqDn0z7BbOVttPOYSgvQT0CGTkOY6lAujyhGbTALzGX5qbQ1d1ksBHbxU/?=
 =?us-ascii?Q?Mh/jXkX4/2Q1e4yaj+oT5ZIE8PUk9SMuBKO+tCawdqRmU+YHP4I6TGbXIYme?=
 =?us-ascii?Q?gnrE/sV6nMRtKAhSVbS7M8RvvMJj/E2U442cWITJm+A5ob6/+gGexcdE/zoK?=
 =?us-ascii?Q?ofnY5F/dG8oZzEqd2klmLagnPHF/jZLGlGQm9w2VMMQSu72eJImbMScDsKKt?=
 =?us-ascii?Q?9oLq8z1l3sg0N0NWef3XU7VLrPYma3yZK8Lt/whXPK9Ziju3a0GstyQncNW8?=
 =?us-ascii?Q?Ot4C0fDTMk/3ns+TO4HtLxMup0NLkEOQBDCh4xLGeCKXHb6LsHRqAMwpgZVA?=
 =?us-ascii?Q?U8gTML82mQfVzC15nXGW2wTW6MQFukkrN0KITKyvGww4jVYaNOZB7eLo2k+z?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451d01bd-5263-49e2-6a6c-08dc1d00910a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5259.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 17:19:05.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KMtxBTJGu0dCKRUx6l8us5K3cK1D4eGG3V0PeDWSUexZBgXDex9/Hd3CgRd4IQt/+00UUYMd7NZl/OXAKRyZkWlv2Vh8gaZqJ/khGiO2hE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6479
X-Mailman-Approved-At: Thu, 25 Jan 2024 11:57:05 +1100
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jan 2024, Huang Shijie wrote:

> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
>
> For arm64/powerpc/riscv, there are at least four places in the common code
> where the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
>
> In order to fix the bug, the patch changes generic cpu_to_node to
> function pointer, and export it for kernel modules.
> Introduce smp_prepare_boot_cpu_start() to wrap the original
> smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> and set the cpu_to_node to formal _cpu_to_node().

Would  you please fix this cleanly without a function pointer?

What I think needs to be done is a patch series.

1. Instrument cpu_to_node so that some warning is issued if it is used too 
early. Preloading the array with NUMA_NO_NODE would allow us to do that.

2. Implement early_cpu_to_node on platforms that currently do not have it.

3. A series of patches that fix each place where cpu_to_node is used too 
early.

