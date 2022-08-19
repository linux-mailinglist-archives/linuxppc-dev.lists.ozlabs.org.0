Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D159A819
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 00:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8bgF2Ctgz3dx5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 08:15:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=B4mGVAGu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.94.49; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=B4mGVAGu;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8bfW2MWqz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 08:15:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/RQJLGTVe38geDW2woV8pz9WVPkpxYdYbGR2seuDwymvmzCP8sFM6oqhk9AVjfmDsAI34WSUD8jFsXdJ8vs62D7xkt+az/nFtS4Z3Zn/tqAEjm1rUqxW1R/osFD2kTYxlBmMB/SWZVBor0PmkN7zHUMT2aVSTzQkN57gjrQg3v43Sl11ACDdvMbY+uvY5JLdZ2aoqUTKN2V7bDIOk+5XNbCgMr5wFVbdVBOXspNUPxBRFpNeTlZYjryEQIvB1rGLX22NwfItDPR/WnclMWORma3Na3prgz9kTsYZCibyxc1VTtaQ1n15zy/QBZLaPnJy0uiKb/iRdAiQhzlXWz9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfKhgoPnJdztvV4ulo+0DCVJiyfyWY9zEn1lbQd2K6M=;
 b=jWfzFRgOtB73mBp69eNbNJhg/8coFqYK43t66/y7bS/kXRx7bggiG4wGUOIAL8outPKyFAIBn/R6L0iMfFRFAY+WMf3hfojuSl/fqgm0g0bU6h7Vz94nc2NJZJG1CNqLU6Jrs99dCSAzOCzsXRCn5swI3MHs5OGDe0BNzGElvTUmBb8rLIBDxh0HunwnJXwAgsJbxwo/Z+VvrXnIQeMBdvKAO91/Xj3WjW4PuSswzObu3fIKJxtO0NgWGwuj01QcFEj4navQK2JRHWMaSjzWqNUknfRVdeRdit/+WJlxpY8f+NIaeqhglNCLxX1RvVAOH8nVw6DipGp0cTfbMDmpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfKhgoPnJdztvV4ulo+0DCVJiyfyWY9zEn1lbQd2K6M=;
 b=B4mGVAGumUQOr0RrgxBoWp5dJfEp7DmVDh0XfiSgN59HKxfpx20Qe2nDggoi48fKFJLBBZ5ediP8GmkbifF/OqHdaTTshoqhgDfvRgINsJLOO0YlUlVlTbCySD31rJGv96ajNBuk4YqgyqyEoyzoR4mtxGRtJoj/L+26K2Etz58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN1PR12MB2527.namprd12.prod.outlook.com (2603:10b6:802:23::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 19 Aug
 2022 22:14:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5525.019; Fri, 19 Aug 2022
 22:14:51 +0000
Message-ID: <20b88926-3252-cc70-a39e-9fa76a6f49c9@amd.com>
Date: Fri, 19 Aug 2022 18:14:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220819210112.7924-1-rdunlap@infradead.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220819210112.7924-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:610:b2::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29d9d66-ff1e-4fd2-5287-08da82303c67
X-MS-TrafficTypeDiagnostic: SN1PR12MB2527:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	a8m4b0+wcv6TMnVY/f63WZDeQfHXCzhRk34v7ZIREGgwjBaKs/NYJc2q+qQsA2CJwvHKsrWtirRbt3HmHPc8hn1S4UEFyC/QIJQAQb4bia3N2SXhps4tA1HOAmAPeoC+fmdpDMPrE5lJ3Dtz8NVdU0we8RWYZUNVMMjxD1P3MUFVSTwcGVIZt4DajsiaOX4WoM7yhGUlctq3es+BRWg7ze1lVd76H8xsmX6OfNbowAMzVYJ2IMYO7emEnq9P122T3f/XlxHmdoO86Sd0RKV8OHtzyzYcJwqTdWNRSMxwwZ+2UwtlB1IWPIU1sY50r37brXtPZur8ThNpoylUjeq5WBu6+q6OupRqg6IckIEsmeJwWJaIndvmb5liTafkM9m+M4EWBcnvYAe5JRZabzj9oB0EAdzzEBQ/nhNH/q/enfk2w/gYfuF0t6rzsAu/VPhJdNWIxq3bgFQGPgj1lpoWnJD6rghuuAFjTeENvPdmWyvMwSI/GfwrXcowZTfCVd2eAcvVMkS9343+I+kAo60PZQnhM6pQAcwwJqvX98Zh+6d3SBN9QgNkuEFqfLAj61aEzhxkWhBNkG1fPPrEkE61GXuINZAnQ2SHQmT/zGeQOOvXA052vPji+MKqPFPqIN9b4CZ1HCqiqwHkON2E7lVdBy7HQRUX2OQtjCSF0OyGv236wA9drQtxu4AKUXEZMCPrFZcQeGHfn7x2LmKzguJ4wus0Pz/Ekuh996KoEcL149XqjxFD8KnlUV7VUcUW0qDhk0dmDTKGsrh9PqHGHkWOHTa1AcGLW+dqTRoXzL/haxU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(44832011)(41300700001)(6512007)(26005)(6506007)(2906002)(36916002)(53546011)(186003)(66574015)(83380400001)(2616005)(38100700002)(54906003)(6486002)(36756003)(66556008)(4326008)(66946007)(86362001)(478600001)(8676002)(31696002)(31686004)(316002)(66476007)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z29hdTF4eCt0dENyYXpjazd0bUNCcUFpYkRjaUJTRjR0bEMxK2lRVExlbnZY?=
 =?utf-8?B?S0pRUEYwa3R1OVllVGR3SkR2WHlBSUhGMFFpZlM1ZlNaV0xZbEdaL0xOeFFN?=
 =?utf-8?B?bnExOVU4V3NxUy93UkV1amx4dHh0SmRhenBTSnB5Q1M4REwrbGo2VlpFcHNq?=
 =?utf-8?B?M2hrd2FRR1NsS1FidFpHV1lCYVZ3aE01THFxYkZocW1pTHhtZUZzMG1jUW0v?=
 =?utf-8?B?dGgxU3BsYVI4Rkk5K0cxb2xuVDY1MnZlYzRpTnpCYklTU2ovbVdrZGhHNUdU?=
 =?utf-8?B?QmNXY1o2UGpHMzBieFV3RUZLYllrUzg5dFFMOEdHVy94WmpFK0VveURqeGxC?=
 =?utf-8?B?bUdZSjFMQk5tbWxRK2pCRXAxbHMwOUpDOVRlUDIvcThONkZRa1VJSEFjMXV0?=
 =?utf-8?B?Mi9xc1lkVC9LVWR4Qy9yL0V3dEhjWnJGbFNjTXR2K28vTlBmenBic051QzJ1?=
 =?utf-8?B?aGRzVmEzTUFta29xL0c5Z1JBVWgydkpwWnI4bTJ3ckFVVWVQUURwVjhXc0JJ?=
 =?utf-8?B?ZjMyYzNXMWs2UnpjZWtMdXdpZGx0ZmErc1ArSkl1OEhweDhWV21SSlQzUW0w?=
 =?utf-8?B?L3JKbTZLTElQQkVGOGlIWnZVeVBjNCs1dFd3Z1BIZzhXNmczOXEzcmI2UkYy?=
 =?utf-8?B?WWFTZTJqUTVnbGhFb0pkK08yazB2bE1FK0lpK0s1d1JINHFjNWduZG5DU3hz?=
 =?utf-8?B?cXFoaHRkVXdwY2xzSXBMb1ZHTEk1QWJMdVA4OW00aU9qbHk3Zyt2MXRLVVJN?=
 =?utf-8?B?RFBUWmNyTmxIR0o0aDR0ekZpVHZsMzZ1MmQybVhXZFpUZmJUTkpJQzhFd09T?=
 =?utf-8?B?Q1owQmc2Y3Y3RVlDU3VlRU42VkJCSFpLZUg0TDFMb09NNlJ4Zy9uZUJuR0NW?=
 =?utf-8?B?VzRycDA0OEJrNkJIMEx1cjh0RWYyeVhwQWMvZW5mOEFkWk4wWlhxV0J4UFQ4?=
 =?utf-8?B?Si8xM1BWTTBuNGZMem1KZmZIMkpZMUpxK1lqcFhlV2RXclQxZEFtODN2cWxv?=
 =?utf-8?B?NXk3eGFPZ1RPTit1OEk3OXI1MUVSbW42SFVOdjB5bmVUV2dBTnVPVGFzcDUw?=
 =?utf-8?B?MHNiTEhXSmZWT3RKMlUxeVBySnRmQTlMZjNuUWtMaTk3amNOZm01cmdSODd6?=
 =?utf-8?B?S0tQKzA4bGFRY1pWeEJKVnhyUWttS2NSVEY0V3hVRVRZeWNwNGhLNGJ0d0dX?=
 =?utf-8?B?UmtHQXJoMDRUdkczdGxzbnFHeVVBaUlzeWJxOHY0cy8xVUlkNEdkQTN2OUta?=
 =?utf-8?B?eElIMXhlU3g5MnoxYWkwZGYrK25LcUJ5SUN0K1Y0K09ENlhRdWtHd2VVWnJ2?=
 =?utf-8?B?Tlp6aUdyZTA3M0xZQWJ3QVJqNXZsZDFnaEIrTFU4Q0FmUUoxYWhQK3RkVVdl?=
 =?utf-8?B?eFBmeTRhdzM1QTIvK0ViNVp1VER4QzBnTG9DWVdkcTZFRGU0bWZRdkdIQ2Rs?=
 =?utf-8?B?eVU3Z0NhTGt4d0wwYS9sZXo1VXZReC9kWS9VWlNsS0Q0ZW1TWFRMVnE4cDJ5?=
 =?utf-8?B?Rm9mQm93Q3E4YnRlUkFBL2UvTm5URk16Nm5OOVlWVFUxOXU3Q2p4VXZYanpo?=
 =?utf-8?B?ZUNBUWI3RFV6S2dEMmcxOFJSaXd2d2NldlN5V0ZzRTNEZUp0MlFrNEd0RXVa?=
 =?utf-8?B?U3Vpb0dtTmRmQjgvWm5LcTBqcDhxSDJsQ2wzeGw5azQzRzN4Z1FseTBzVmZT?=
 =?utf-8?B?ZFY5dTE0QUc1MkJzMy8yblZBQkNMeTZpM0ZxeHRndGRwM3AyM2YyMVRFaDZM?=
 =?utf-8?B?cWU1d2dUM0x4cGo0K3dMY1R5QTN2VEtFSllSU3Btc0s0eXBVMVJjOUJLc2U2?=
 =?utf-8?B?djFnTmdZUkYyUXIrdE1jdlA0cy9qWVR2Zjd5RFdFa2ZDSk5QUFlML3EzMU9j?=
 =?utf-8?B?ZkViaGFmZmF0S2hCWk1vZE1WZFM3UktKdWxZN0pBMjN6dmpuUktSQnloSER0?=
 =?utf-8?B?QllEVHR6ejVvWmhRaTZ5b09jbHBYc0hOL0E1alpQM3hab3E1ak5wR0NzWG50?=
 =?utf-8?B?L1FJTTFoU1I2Uy8wS1ZkbTUweExiQi9tWGdBUS9lQVNWbzdtNFdGK2VNMVIw?=
 =?utf-8?B?a3c3YWRLRXBFaGVzTE05U2dNVXBEYTBDN2dxeGRlZXkxNktkQ2Rld2VaVFln?=
 =?utf-8?Q?Ahv44/c51LdDI2j0+1d4J2y/f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d29d9d66-ff1e-4fd2-5287-08da82303c67
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 22:14:51.0885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DPayuRARk8S1FGVaG5hC8tmlm5WKPhwUw8bb88zKetw/n3jZtc0CUyfpDE92Fl4F0vNugnv4gjI99CuojDl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2527
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nicholas Piggin <npiggin@gmail.com>, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2022-08-19 17:01, Randy Dunlap wrote:
> Fix build error when CONFIG_DRM_AMDGPU=m:
>
> ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> by exporting 'cpu_smallcore_map' just as other per_cpu
> symbols are exported.
>
> drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
> This is an inline function on powerpc which references
> cpu_smallcore_map.
>
> Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm, thread-groups"")
> Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same core")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   arch/powerpc/kernel/smp.c |    1 +
>   1 file changed, 1 insertion(+)
>
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -86,6 +86,7 @@ DEFINE_PER_CPU(cpumask_var_t, cpu_core_m
>   static DEFINE_PER_CPU(cpumask_var_t, cpu_coregroup_map);
>   
>   EXPORT_PER_CPU_SYMBOL(cpu_sibling_map);
> +EXPORT_PER_CPU_SYMBOL(cpu_smallcore_map);
>   EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>   EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>   EXPORT_SYMBOL_GPL(has_big_cores);
