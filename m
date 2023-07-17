Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF714755AF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 07:44:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KZay0SAN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R49yC6ZyCz2yFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 15:44:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KZay0SAN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5a::604; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=gautham.shenoy@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R49xH61y9z2yDJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 15:43:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxBCfrtwNzDnJkvqkCZBRP2InuSST4R1wHJDNSBai8cJb5nV+M5o4SpeNDe1VSLGxhL71xfpkgTqmRxvuePVmtSRZ+G4UqykTi86YstwhsAlTC8YcPfmpd+Nb26Rhv8qtoYy33CvNGhkqH6g2f2cWgxKxAp3+WAhlzy3b46rwb+2apBK/speHk15DL0Z91QEX7TKUCD3ZvJ7C1x+VYb+h8bcbyEJwmSRycVC2CPpUKhvm7Byhcb5eSus+Zm/FpsuLMQtR+I5RoM0VCkr+mVgX/Z7iG1t3jcZUjQlcZ6+3pdFRD5+AotkrkjIbxm1MtcL53I53I3TSfK0E/MdevIBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsYd7YVuH5WzhEZwoZWUmEm+L//4WdOSLzlMZaAj5qE=;
 b=a8KKsUanMPV7DhMaYGbuhydlhneK1Jnldo+naqY3rjlH4MsBbfSqgcLVGK4VKL4DpmMXl1bSrEOCRsFuBLsR5HNYwS05D8CYdzMxclWUOmeSdYv+vDqxWT9sTY188N4XP0gmkd80JFp2LuuiMhrkoTc16iJVwfzfbGkbcpEwV/NrxBZEByVCPW+GHr17FETgnsmndM2LOU21BfEws3zq1jIT+hpdTiQ4Z+Q+/GnMHUhn0l7rhSMx5qiIHYTydBYdcsPhwleCkET98XzE+7I04wJtO2Vqw8u0pb480I85J+DEb+FcZEtB49l0oIXE8ntCzeKVj0qPxo8NleUDbReT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsYd7YVuH5WzhEZwoZWUmEm+L//4WdOSLzlMZaAj5qE=;
 b=KZay0SAN7M75MBGqqZWEOw3UGA8vq0p1HTu/1mXmZi1dcR414oMazX0iAM7Fx+R4peq5JLwYREx92ie0CKPgh3xyQlrtroCvxF5XdDCJQW/tcl6wWvSd8Bty1rbWJMZJDMWsLzZkBuLs9a6gdnUojc29NTIybMNkB8SsilqHqXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) by
 CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 05:43:18 +0000
Received: from DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2dd6:4ccd:1695:d51f]) by DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2dd6:4ccd:1695:d51f%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 05:43:18 +0000
Date: Mon, 17 Jul 2023 11:12:57 +0530
From: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
Message-ID: <ZLTU4dP7qs8fvL+0@BLR-5CG11610CF.amd.com>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
X-ClientProxiedBy: PN3PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::20) To DS7PR12MB8252.namprd12.prod.outlook.com
 (2603:10b6:8:ee::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8252:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf5c4ab-fb13-4198-b313-08db8688b8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZcpR6baGvZKk2MCmSRe4VNUe+vVGx2/H4VPD+W85AHnbJmF4s36QnyBduQwu4IlPXPvrxBe4Cs3mByFThWzpclpHo1TBtgwdMHTG0/+t8FDQ/1EH3OftqF6c3waVAIz/+jCzZ/GSxe6iR5MlGBMB/FFz9cXijYugds0y1ynSqWZJG815AtBBPUeLxyRVhVZfadFTcKTuJb7UmFix3lynv9H878b0GOm5llzQLtEpa6dF6wtQWo1ouBXahjKW305uaWXN7S09IEZKyr0ON0QXcpM3Fk+KdtZjAE70UJHYIfLTJbHgGbEQEuV1Lv67fDlFJPaSI0U8M3kmG6NVQQ0tBawHzuPCqysRRPJJKEZidUxEs4sBCb40W9KTdqI1YgW1XMYHgNHttB8ku0grgRepAJQqkqcWX60/lu4azBEkUCrhn+2nD0YGSRYXXf1BrKCmiZBH9Ji0tr4KxVDBi/FRZUFpHOW4Zt7rzOJWOO86vk+a4y6zRQlWW8zL+N4Jr3DfGDOrzC0JKXudo0JCCOXrRFwL+9eFbvysY4vDpnmsp6pOcsegI05Jg54HwjajZYgJ6MEz4VkLbN/DBwNdbq+Q/eLpD9W1F/OaUkNCcwbrRHA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(6512007)(26005)(6506007)(6916009)(8676002)(4326008)(8936002)(316002)(5660300002)(66476007)(41300700001)(6666004)(66556008)(66946007)(38100700002)(7416002)(2906002)(478600001)(4744005)(86362001)(6486002)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bZ639Bpiqp/CIR7FQ/+D2BSyq6xverzXu90pWhoLXZQbA0t2LYPWDHFWM9CT?=
 =?us-ascii?Q?l98pzImSV/B7bKqF27BFRK/yuPklJQBs2NBV6bNi7xHY+9E6DYySoNIn4/4M?=
 =?us-ascii?Q?vB+rWslsa3UUV0pOVYKhX8j1BbBN+SichPV/ejl9shrEWzJ2lohBEYeLdAFs?=
 =?us-ascii?Q?cwULS4sEzDNf6CRgNm66iMCuHJSlFKFbZlqpd9Ev58U6AWYTnqWzzMsQGGs2?=
 =?us-ascii?Q?LAL9YtnNjSrtxj1LCgZQu0g1yXjfBXaEe2Nqnz9bJIf2YIP+QclPjVRN3kut?=
 =?us-ascii?Q?7ouZ01iPszrzedCO4aQC0OZ2u4mv24toSZgc48RIDnb8XbsiGvHFoRZA1Tku?=
 =?us-ascii?Q?RAD2L1jBrKw6J3rCb+WdIXdRW/obExqaWsrYQvssSJf8B8WXHSQq6A0CRaJj?=
 =?us-ascii?Q?yqr2Eju767f5uAyZbnNvD0lPbBG/XdU3asZl/4AaFKVACfh663he40UtV7+T?=
 =?us-ascii?Q?TyNXt0EB0avMZqFlc42Rdi32QcbrGV0IyWY1lYItHDD8CR1wsy7KC6P/TwrF?=
 =?us-ascii?Q?wBp20NYuWduj2wVp6Kw7iOo5Ah83W5466o/UKv/dpXDVHQo5UKQZK56oFlMZ?=
 =?us-ascii?Q?oVDL0hpiqGzEq6iAaCEO/ol67aRDi865FG3zXe5YgIkVgR0lx7T68uspN0ca?=
 =?us-ascii?Q?SaLq0us2RMBs+bfp08ijrRFQPBYKX7ZukvK478GzQRbFBLdJMdmUsiqP6Y9g?=
 =?us-ascii?Q?k1XTraioW1g2aV1NjFaJNmRoaHUBbVdzbfPax2+u3bZz5jsfLNJL4LIKFhNJ?=
 =?us-ascii?Q?BYa9wlwJNEkCVND/QzsYTgzGyuEPdwuggkZHOfvM4f6wQXa3WrDrDbOpFCkd?=
 =?us-ascii?Q?eXCOgDAmYPkJyVMQz7garCR7vqMGdtwNh25cTlUxsUePZDid/60zNbaa+oDV?=
 =?us-ascii?Q?meNNHs6kLPUgZ8er324ivJ32XBdt8xloCP50vHwAkp3lQvNiA0cpHU+IlKfL?=
 =?us-ascii?Q?AWW4DtBADAD3kVKeIT/CP3xSyJC78sdO9p2A7cMQ4NSh6Oxkhseio5+Mar9y?=
 =?us-ascii?Q?+R1K/yW5qXG8Mify2hSfRG3q8GIbcMHpgJUQsSVCalfMCa06pJJTdN2rzRWJ?=
 =?us-ascii?Q?7Y0Ge6SnWpmpBJMsMv+khUD5k7tmGemm+eQZdPwfbfH+ql5RSr2FTAInOwik?=
 =?us-ascii?Q?qH+nsJFfHGfTAe7ufsakVuKLJjFkNbMaL8dd6uQkki4bgryldfjKD7h0YybL?=
 =?us-ascii?Q?D/CDD8GlR6nWP9nRLbtMf3nq2tY/og1RZigAntjK0sjhEiBn3vsA6UG00m97?=
 =?us-ascii?Q?kdqwPQFGWabTFAaTFQsDd6zpI4N3pTthch5eR9P0nHSegpzIbXfdDhvP0EiE?=
 =?us-ascii?Q?i96jhwUP/r8u+6UWyzlbwRyGVwWXg0NZjh5V75/Kjv/0O5tlhepQ62VqkybO?=
 =?us-ascii?Q?T5nev+u/M95CJzGpZ89xPys8hqg5ny2BZG2fTvVtC+yLj7c8jkk5yxV6WPeQ?=
 =?us-ascii?Q?m5X4ISlG4LPwBP3KGbbrHeOXcl7ZKq/67ClJUxO2UZPMzXTwyXu2rnsi4Tn/?=
 =?us-ascii?Q?2Q4SGjaJscMxGhKcNvXYhiAYPrQx99cipK4PcWBCGyIIPnzbOV0Qguype2Co?=
 =?us-ascii?Q?1bqIXEfnwWZB+FL2ftPtwZGdnt/E62hKQALNAMCe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf5c4ab-fb13-4198-b313-08db8688b8fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 05:43:18.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmSrmrlFt6LGChxWIYKcCB8TkihHeKVVTGVDTtMuCk0LfPkkhgAE9jAhQ6A6wJLPVb+zIgX3xq1fmWvjvQltTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712
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
Cc: juri.lelli@redhat.com, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, vschneid@redhat.com, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 12, 2023 at 04:10:56PM +0200, Peter Zijlstra wrote:
> Hi
> 
> Thomas just tripped over the x86 topology setup creating a 'DIE' domain
> for the package mask :-)
> 
> Since these names are SCHED_DEBUG only, rename them.
> I don't think anybody *should* be relying on this, but who knows.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

This naming makes sense.
Acked-by: Gautham R. Shenoy <gautham.shenoy@amd.com>

--
Thanks and Regards
gautham.
