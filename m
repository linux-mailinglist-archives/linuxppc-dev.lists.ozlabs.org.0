Return-Path: <linuxppc-dev+bounces-17627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJOvOgBAp2kNgAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1951F69FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQRj85cLQz3bt7;
	Wed, 04 Mar 2026 07:09:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772568572;
	cv=pass; b=Tl0N/IuU49abs3Y6+abTurnfd8FTu7DTBnvNtXvhMfOo9UxFkZon3fltMKoE1dBJAlrnb1NgIfd6RN8LUcQq0h2T/WqVWV7Vy6CAOJfrZeCFqtOvXNs81fXcGvHv7xXJalxMn8zqcIzZZGXZiZEzr+Rullhua0TTDgd6ZOfHKR+EH9KPCvn3ksK50gUYDL7b4xo7yPCSibQNX0xdPb1C9oxMVPmApOZJjmPCNPq2DFdWTE0AOS+yM0oMLPN+uNXaPScArBAMr//aWLBp2hURf13sIN34/Cm4Zp0yhefNN/428Txu3O/yByGUSOK4fIjq4y+7RWwSoh47jlRR99Ot/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772568572; c=relaxed/relaxed;
	bh=27DUdW/HPm5nU9WlnZsVSg86SZ/MEi6qsykxvB4SFuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gU3Dn6JN7snkfdoBzPviqn/PO0nRxydGxszg3l2TbG+F/FVsxZPHShK49BABY1TiKTjyj3IEosWhbA1f+yb1xnEQty6wMwjs8sGOhnpDjBkncq7k8k5F6B264dkll3JPCaJJUQepw/v7pBASc3RLCguu/No/yQZSBZgMxyhgsuumRgUnGswvRf0E6kz+aZYbu3mEROUiNr1g6t840lDJrpKcHgogRGJAfQp7eeG/HZXF4NsMnnL0CbHAlnzTzZ0B9uFJG4a374bZ9FYu0A6EtPjAvteiI/B2bryOdhvwhiHJmK8LR+rOXrOSaPzo4at3rl9pysLfHiAOM6xy+lJFXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pVtNI2yB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pVtNI2yB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQRj73XfQz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:09:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+LEe0SZN0/YV7Xk8Uae+MV9M8+4Pwi8KWja64a5sVTo7UweqZudw6yGH24FEI+4/3/8W+RQbvVxAXAu9mpPctdmG+GUE5BO7iojgfoHw+4Dc/IX3OiIsRpRZ7VRJ032a3nivTCn03Z9775hy2DFFZX/yormaUGkLW5Lri1NvAkp8zp5DsOHCB/zUX78wd1fH/4ZT4uEMsqMSNXTXPj5rvnS/KQEE7jtz7wI8Bvd+a2UvLCZ8VkrLwWSKJv2VQXdp54FJsfC7BETvQ/Qi22ri2v2sexYJY0TgApzlY10cYLHEI98V0dLKjDJviX3dLnIBxjYZcRGwFZi59JSSx5Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27DUdW/HPm5nU9WlnZsVSg86SZ/MEi6qsykxvB4SFuQ=;
 b=NSbpTP2Ok6K2/LQ3loVl9NRNWEi66irOfClcAOBimhRurbeaHOga8csC9mcbSJLnV4ooFnpY+isrL2v+5v+HC9F62VBD6NbunQBlXHO085T9wDQV3Kxo8scMJh5vFF8FGwMKkgiRj6PzmpqtAQ6cMqvqiHwfhr6gV0unRpVCwVRpQeLQkxCi7FUhM0JNqodORrInSuUoc32krO2Wtumo585TV5uNypog0UsR+8mHRTiV2H0E0sQkA5DLIMsW8b98UNmH3ciNF5TZoE0xspGLziiYKwd4chUQk5QgpcI3Bko2hLIVL77EFdGsucMUB3ikBMPCMvzkWoSK66JbptJwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27DUdW/HPm5nU9WlnZsVSg86SZ/MEi6qsykxvB4SFuQ=;
 b=pVtNI2yBdJU+DURzf3tkeSivnIn9VlFnQ9a39lM7LCXuTgH9OqvFG8qMDG3kc5rXfWD41rWGJe7bF+1gyJm+Tu8zLt3rH64qvCiyJAJZFOmhWopczMMMRKpGl7j6jM5q4hGkKUDqGE2aJUALny+kTKx3Lm8RXRhITMqwssnWouJtFB4hCSgKUFR/QSGTK5o3ge794luVPzzl9FQm/dto9feGLOPV0l1ehic3KNuiBw9Kaflw7gHLDnFQkJZuVMRoKjmwXhKowrlVdGnvSgSAlYMDJ7ZZRMVrk8hLluUuiWBCdIH1mQup3+/d8GJAcHh+K265VO+yH33q8/ltDLjBhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 20:08:50 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:08:50 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Yury Norov <ynorov@nvidia.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/5] powerpc/xive: simplify xive_spapr_debug_show()
Date: Tue,  3 Mar 2026 15:08:37 -0500
Message-ID: <20260303200842.124996-2-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303200842.124996-1-ynorov@nvidia.com>
References: <20260303200842.124996-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:408:e0::17) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab6d317-6d60-402a-66d2-08de7960addd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	WyTEAvBe/q6kzv0hR/ALYAMPmHbLcFLdR1bR19q/Vh2JE9gjc5SjnXawrQsi1OAtDHWEbJXpNZ2LGatVlkpBesKWlaw9XfVYWcuED4lbKYHT3wGpy/Y6NUQyyKscPkyYe/xVxSuToNH7+PNjfA154emfkeDh7HQFbPu4eon+jqxiuzR9zXQQ15l30zctzmUslYmCOIrVZhIpB7DE9Z2rX7CHm4vnWGwRgDWrgMm/nGqpkWPqs8r0DXLk30uZaOIXFRl34oQoKMr1Hnplw5Q2KpdlkNl601uszgdHOW1AodOH4jmOp1ZD0EfO24uaT8rIjNCK91/li4PnVrVn1MGUQa6O0YQfMhqyELYZwCiO98Gl2oglH3EDEyA2WeNDmJoZ/wraeKnhDmzypRyzybG6Iyq/PBtdkZEC1F0Fst7WRlx1TnAUtUMZo4Owzk6d3pNm6D+cML8fTD4KBQE+J2F5OKGr6SW2D4yPMclUwknsLeXBsRxmnsbaylpWvZ5X8ot4xd4UEj866wCUHC+NwbA88rfzNiDx8LbLlNM8mt6i2rbZdudwL9aCX73yu00JTYB1xNmswYya3TdyD0a/zPdjvGBoc4HFjWFKXJYhr/zLzsIPqpFvktK3agJeb/KCSFi05jg9Bgsw0fg2Ii/vpA98zjk4tk12ZsRehEEund/peNqzSnml7WTEz89RlUwNaw5ffGWIm2jbJPimA3o+zXMulvynugryXOYy2hlen49p+QRUXAKrPF+QDss6pvREWykGPtq6TXV6Lvbi4NaSgVUl7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wr/L8CM6aqKm8ePiEk1MZBVYhzCLVJFazBT97qSj5bUnIxWwg/sVmjeNQiyS?=
 =?us-ascii?Q?xl2PZnsDZl2Sw436niucyEFa33vVQOn2hbSkMXMmonMbxaRwlNRC8KBZx9xG?=
 =?us-ascii?Q?B5a0MtX8Kc5H5B5zTIxdndNqGBJNJ1mHInLM3xFukTyehoDKUCEC/2zWIjmZ?=
 =?us-ascii?Q?1Zp++Kd+giqOgV2UtAct7v/hppd6lHHMMNi4s3bZnnKeCP0Wf/T70qcb8CWL?=
 =?us-ascii?Q?PA8vxCeVtnog0SIcGWciFtPX9eSxq17U9dUPRZnaoJN4hxLm/0BUPGpmwDMe?=
 =?us-ascii?Q?Eq36aLtkb/Py/+uEUV1lhkfs3AlEE6nN5cjRnzp1Y6iKsFQukttSTU8QH4GW?=
 =?us-ascii?Q?2eFuqq27SwdGZpfcbiTfWdxhYm7tZbnd9kUXbtZiDKdQ/3wQk0zA4tuIomba?=
 =?us-ascii?Q?GWGis2b4l1JISbnX+AlRivQZ33mmgAeTSyxc1YEyJ2ZUTkyga6OB5NTqpeRA?=
 =?us-ascii?Q?YMhH0WkrQFP4cUTDYYTxDHnUcRlBVrseCaMAsi8m4UXJP5Fnni+k0sU17P4Q?=
 =?us-ascii?Q?ZV1XmP2FOtQefG+j5AedLpE3Gd8KJifqIIqE/JsQKPgagVa234P33uO29HNS?=
 =?us-ascii?Q?xu8jI+sGiytyUz7iCtTTtKftm4uG/QOwjQuLc4JnqXE0QOvar+u9b1tGeh+t?=
 =?us-ascii?Q?4DYlMRNIh9Kl1OQcYmQybITIgIXRbgwWdFW5yP2xE+MFY6WkMkn989r4YRUT?=
 =?us-ascii?Q?ah1eoi9TwHqsSjedn5cqfZ7ybx3LJQG7EHyqyqAsQl8Qk6haWKiB3OWH1YSF?=
 =?us-ascii?Q?0FWzLmpKJ7eDIPie+Vk4QyLa5M7RUFwYrPoJIMz3r2fF1oQgk1ELD5hOGG9/?=
 =?us-ascii?Q?ikbjrqXQU9F4v87Mq8tFOW5ztf1b49SSDwaKvXPDKrsgrLhAH/qvW9ctMeN0?=
 =?us-ascii?Q?3woOjPojCQZZW1iq26xyXDf6JcxG3mmtreU5WYSLIFVKxIlLmNyVKRqvpfe4?=
 =?us-ascii?Q?awA1Laxv81kSqxo7dlSkRK3bAyblaLtwPXTqPvA+lje6cNLqc1KQdcfD5RQP?=
 =?us-ascii?Q?55jOsGZBHi/H+JqfcBrFX+WgpaIPz/48NRrD4bDGqoupRawiFFTpcL+CIqfR?=
 =?us-ascii?Q?DhNnNOrxFTY/FZdwMK0y8paCsWeFojx69MPcM8JuyabOUEWj5FIvOt7lPER9?=
 =?us-ascii?Q?vktblWvN47VHpE9n/SbOwmGi0Jt41x/fhJHgpaXcg/Y56POs+od9agt9IiRU?=
 =?us-ascii?Q?tSaZk08megTrDCzbtAPTxR9XtU8EoeJzdXsrZrAFWDNljdYbQyLFFM5bz2J+?=
 =?us-ascii?Q?kUzQPLOboaxu0hzgJUTx+OmSxL05m1Kfc0N5ijwk/32gEylAryA36ib7QLhN?=
 =?us-ascii?Q?2MfUiP/+nUkqQjJDbpOugbECs4OyRTuFTu8YUQliyGRtvBOpj+l60SWwuLo0?=
 =?us-ascii?Q?aiJIPqUCv0aRzcTzUtBbDdkm4YV5Gj5j6by11m0km8a2DaxnG8nx4gl2snp8?=
 =?us-ascii?Q?lAWdy8X0RieOFVJazeYDkyN9tO1ECjPGs/INSnDqLeVyujboNxUILIhnBFb3?=
 =?us-ascii?Q?2b4mtxtT/5Ya6id8hbAafiQYXMJ9fSlwQ1mjxWwVWtGUkjIidWbvFzWyL0ba?=
 =?us-ascii?Q?Deaz0K53xFWLJDEwPCYJRjtQQ6A9xKTCIWqkymygFGQrQnglZZRS/FQjxYy7?=
 =?us-ascii?Q?SBkx2GLQeLc1qIkAdkY0Bs/5bfer4FS+Q8AS601r6DEgYqDIddWrdEt1jBT7?=
 =?us-ascii?Q?LB7kGGQ79HWyWg3//lrTHIzxY0hmRG141WPT6zLBFpwH9Kz+3gL1Hq+OMayU?=
 =?us-ascii?Q?QQE53sZHljlawPNqM9p+j9wu4dI/evYH+iwlyXC9CbnHgWc7IKjz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab6d317-6d60-402a-66d2-08de7960addd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:08:47.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBymKXTNwEJj1lWu+Z2mDY6MvUj/6WYVljnxPi+xxu+S6FsASujVquto7G7BBYeondeiT0/ud6ddnqua+77ZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 5E1951F69FD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,linux.intel.com,linaro.org,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.dev,redhat.com,weissschuh.net,intel.com,lists.linaro.org,lists.infradead.org,lists.ozlabs.org,nvidia.com];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:daniel.lezcano@kernel.org,m:mingo@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:russ.weight@linux.dev,m:sshegde@linux.ibm.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:linux@weissschuh.net,m:yilun.xu@intel.com,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:kuba@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17627-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

The function creates temporary buffer to convert xibm->bitmap to a
human-readable list before passing it to seq_printf. Drop it and print
the list by seq_printf() directly with the "%*pbl" specifier.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 61f8a8acf81f..fdf52c78ac02 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -667,17 +667,9 @@ static void xive_spapr_sync_source(u32 hw_irq)
 static int xive_spapr_debug_show(struct seq_file *m, void *private)
 {
 	struct xive_irq_bitmap *xibm;
-	char *buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 
-	if (!buf)
-		return -ENOMEM;
-
-	list_for_each_entry(xibm, &xive_irq_bitmaps, list) {
-		memset(buf, 0, PAGE_SIZE);
-		bitmap_print_to_pagebuf(true, buf, xibm->bitmap, xibm->count);
-		seq_printf(m, "bitmap #%d: %s", xibm->count, buf);
-	}
-	kfree(buf);
+	list_for_each_entry(xibm, &xive_irq_bitmaps, list)
+		seq_printf(m, "bitmap #%d: %*pbl\n", xibm->count, xibm->count, xibm->bitmap);
 
 	return 0;
 }
-- 
2.43.0


