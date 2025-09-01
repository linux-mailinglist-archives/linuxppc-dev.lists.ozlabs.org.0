Return-Path: <linuxppc-dev+bounces-11546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA539B3D859
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 06:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFbzd4RPFz2yrl;
	Mon,  1 Sep 2025 14:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756702253;
	cv=pass; b=omeKL0q7zQdWlYb6bqx9IsV6pHezPh/jsL7IkRmwGITVNuEJRunQWzvtsyJgRwHqmySeQWPhdckmQygR8LZFok3STCuvXNf0kffIN+/shonetxO1lZWmKDRbp6wQrJBP01e6e4wlC7oIHsCusGuihGjI+8b0aWO9j1rievd+S4J7lqIYSFaHX891WzPLELTNGEH239sLGiRdtr0MNGh0LO8HBobfz40OXu1D4+FcBF6AF6mC0Y9zB2uAksQKBMNw7Ag8rqfXyqX1g4TAv084O4NpUiI9wHYZM7NNsWYJ0QkOqSFrT55TDr85QsfF56RhIf0pVRw+ppxRBHq5s0JSWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756702253; c=relaxed/relaxed;
	bh=Cq1NeBbYl00zpxDpTfpbjZFRZNHRBTMO4fNHP7OPUW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=okyup3/TbxGC85og6njQhTiJPcStZobjdHzJvdk6pDB3sBAN986AX+a+TsMTXyeLr1cCYgEUFoaxR19EfMCpptMrk1sMdcOzQWB3GoAyjjsfl8W6slCZkre09U2X41PxhxewzAQpZfkLq8N7xKUC739wE6lyeUGiGFadw+itDv8ljJiVaoG8tXmb2XbyRCXx8IFzX/B8vEldgWy1u7cM4W3McV5GJNJCNrW6o5OZjKjHZVu4avglvWaIKOVatATmFp89fdKnFMPshYbbVlPzsWxmbadTJ9Fxl8N3ulLfThGGr/4iw8SIzq38fWE96pU8mXq4/5Wt6UFLLQZ52NrYtA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4/bi6uuK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::607; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4/bi6uuK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::607; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFbzc2RV0z2xSd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 14:50:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX0qNXcg0BANqVKnzlWSA0hL/qXh6ff6a1/h6lAyWTKaHd8WqreCLeXo9vYq0MAv+ADMxW4B+C8GZ/Nzt9UvNNLCAKge0mzeBztvZkgi3zfcyEKcKiaZBFnNRaJ+LWNx6Dr4aIWwsOXe2bqxtY+QHTvOR3hj/568BrLNG6rsrVnfd4FMokJznwS/0rs9BE3QjyKx3BpN12i8oQJYmORpelHauFRuxshGYdq2hqjiVdw4SSJ+IfivvFNPJ+iLBxJNzBynCAbEkH2+BFkW+gd+yBxGZwubH35a8Dtn8JQhoFOZAgPqnoK4arzLSkD/5BK4157/lLP8J2LAP32XahuCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq1NeBbYl00zpxDpTfpbjZFRZNHRBTMO4fNHP7OPUW0=;
 b=euK1CnUl6QSuRVZvjz23nDboRRMltQbrwF99ioNsTX2Vi14XIdOJjvAan76PcBOGgTk66hIPvqSkuFr/70wA9H6wfHewWCNnaf0y+3n5CYWLfbk5F/XhCPj97Udcf/tx0/YDl2sBiDoy1z+kRECPNq+u7doW232618DZXGdmx8eb/r61Y2RwnQtQFgszWCPqaEobvyVKsqPGtR9nA/sp7netXOg22gdEpyaSMBA5hV+7/cW345NiZK4WL8kc8+y/qvIcykScCBWZ0cO8nyM79A2ZwdEEeb/sTH/dH029lGETRTXKZIWbciIXz5jQGWZZXMeXR0eSGOBWGR64CGykmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq1NeBbYl00zpxDpTfpbjZFRZNHRBTMO4fNHP7OPUW0=;
 b=4/bi6uuKwsMU+cRiMYij5z8kiqahBUtJJ8KYuVIF5EARQGRjGagasLooRgSfQZ+AkceA5MV5TqESMqBpLjpy2JyPUQzk6ao8pSED//lfFJ7apRIX55iiOKvUTJwL3TBo5RL5W88EShpOWwp9yF12pMAsxorw+m5Di81YqbSAb6M=
Received: from BL6PEPF00013E11.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:17) by DS7PR12MB6263.namprd12.prod.outlook.com
 (2603:10b6:8:95::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 04:50:31 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2a01:111:f403:f903::) by BL6PEPF00013E11.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.24 via Frontend Transport; Mon,
 1 Sep 2025 04:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 04:50:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 23:50:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 21:50:30 -0700
Received: from [10.136.36.137] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 23:50:18 -0500
Message-ID: <ab3cfd71-57ba-44e6-8954-bf531294351b@amd.com>
Date: Mon, 1 Sep 2025 10:20:16 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC
 scheduling bits
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Andrea Righi <arighi@nvidia.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<thomas.weissschuh@linutronix.de>, Li Chen <chenl311@chinatelecom.cn>, "Bibo
 Mao" <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>, Tobias Huschle
	<huschle@linux.ibm.com>, Easwar Hariharan
	<easwar.hariharan@linux.microsoft.com>, Guo Weikang
	<guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
	<patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>, Ricardo Neri
	<ricardo.neri-calderon@linux.intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Vinicius Costa Gomes
	<vinicius.gomes@intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <5f1a9ed6-b551-48b9-8c62-8ef0f2bd2fca@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <5f1a9ed6-b551-48b9-8c62-8ef0f2bd2fca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS7PR12MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 172224cd-befd-49f7-5b50-08dde9131422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUU2NWJGVGNSNWVLaERJYTJLdldpNEpobVlhQzNkTHE3VUZuR3d0amdOVW8z?=
 =?utf-8?B?NmJiTCt5UDZmRzJhaUUxSXN6S0tQdlY2dXNlOW0vaVg3WUx0emYrYXltTENn?=
 =?utf-8?B?Rzk4Tk9DaHlPOGNWVW1FeUgvV2hmYnlnOFQ2VmtZSWYrMmtNWHZKaDB5R1Z3?=
 =?utf-8?B?U05IaXpHeWhuOE1neFkyMWk2anFmWG9TTTluNkYwSUE3QjkrQ0gxZUM2eS9M?=
 =?utf-8?B?ZFlURkVoNGY0L0dvdWRzdVQzaElVYnpzaS9FWE5ySDlIVEdLVVhDS0w2TGVO?=
 =?utf-8?B?TDFIdGZPT3VkUW9WcWdaNVVjWHBwU2ppZWFSN1llZU92MFhrZTlyTEZiTWRB?=
 =?utf-8?B?cXZhL0JTcWRJVW5pcFZJN0NoUmZxZER6YWltTWFyUFFUVGRPVW8veHNENFJn?=
 =?utf-8?B?WU94VHVBN1VyVHJZMllpbFNLYXk3aHA3eU13blBTc2ZOTmNmTVpVVE4vYklx?=
 =?utf-8?B?blBSM0VtNEMwQnpuQmpLb0hvd2NEQzVmN29DOW43aHZQY25aWk82elhkcyt6?=
 =?utf-8?B?NVRZOWdUblJROVh3bG5lOUtvdFVtWnpEdWJoTXRTM1JjdVIwbElqQXBibEdP?=
 =?utf-8?B?aGNEaUxUR2JqQVZrOXFSQit0V3hIQVJxUDF4OFBaTGN4ZDR2NDhLMTl5QWN1?=
 =?utf-8?B?cktVeUJtSVVreWswcGhNL3o4d21SNXBISHVLb2hYR1A3ZmVnNitQc3V4NVAv?=
 =?utf-8?B?Vkp5U01VYVNTOXFpRjIxY2MrWWo0aUpqOVJabmprSWd5bE1zZ3h1S2V2dWE1?=
 =?utf-8?B?bjN6Q2dNK2dSRUI2cU51SjhBaERLanNnd1pvbmhSbkFRK2ZMbG9wZ2pzL291?=
 =?utf-8?B?RXhYRk5BSXl5dHB4eTNTOE1BaXRJcG9pd3RJYU9Ud3BOd2Y1clhzUUwrM0FL?=
 =?utf-8?B?ZTFGckJ6NnUvd0o4dCtIMmxRajZmVnlhalA3di9GY0NrRHFQSXVnVCtFOUdn?=
 =?utf-8?B?RG1WSEV4ajZVVTB3ZGhmTFY4UzA1c2doa0E5aGdlM2ZFY3pDc0FweXpMYUxT?=
 =?utf-8?B?QXZBZHVTa0hRaXdrWVFOZk05ZTZkc3g4dVJHR2Z0OHRjV2dSYUZMN0RYZW5z?=
 =?utf-8?B?YloxVm5tcEViNzFPS1R6S2xtTHdsbGpXeW9EbHM0UE5zNnJPeVJZQmlMN2RG?=
 =?utf-8?B?cmoyd2ZxYnYwR1laRkxEb0pWK2xOOFpobHZ3Qy9QQjlDeVJrdXJJL0pJdEtw?=
 =?utf-8?B?Q2lFLzNFck1aeVFtRjZEdTVvOVJ4N1RtVkJkbVJ1VWJtQ25OR0gyaHdhcVhk?=
 =?utf-8?B?a1ZHZ3FuaGR5eU5jckxvY2NxclUxUnRIa3k5OEM1cU5GTEdiemlRV2s4WkpX?=
 =?utf-8?B?azA0OHFRdTBoQzF0bkRFK3hGT0hScVcrM0ltUnUyb2xjV2YrMmRCOTVrVTlX?=
 =?utf-8?B?clhETENKMVQxZys0ME9yQ01ZdGdIaEx5bXF4UG1YVUJUM3RyS01OYXVYVEsx?=
 =?utf-8?B?VEd3bmpHek43eXkydUVya3BiRktaSFBrYUFHZHNmNExKK0VYTXA2c3dFSnV2?=
 =?utf-8?B?ckVZTGRvWExHaDQwdFpNNTdXVnRzVU5TV3RGVk1rbG10MDh6NDllaElXaTVB?=
 =?utf-8?B?OTJwd09LQ0pPYUJGNytyTkF4OUpvMGZ0b1BBd2dCYU9QZUg4bE16N2JVY0Qw?=
 =?utf-8?B?SmY5WUNMVmZwVWEybDl5Q0RYeGtLa3VTUTh6dk9iSHlycTZPVE5mQU92TE52?=
 =?utf-8?B?eWZQS3UzMXVGVVF4Nmsrdkw0VGpUNXJOL0RNcUlWTkprOXZxY3duWEdrR0Jx?=
 =?utf-8?B?U0dDRW9Cd1kwa0lsd3pxejFxSGorVEhwQkdBNjhlcEl5SHdST3p2QmtKSFpK?=
 =?utf-8?B?M3dyczBMeGEyV3hsVlpSemRYNHJQamI1Mm1CUXdybklyZlF1bWZQeE9BQW9N?=
 =?utf-8?B?WU83TzdUblNkbTNBMUNrNkx1bDZZZ0NQRWFCclZjWWYyd0tkWlN6YmU0SHoz?=
 =?utf-8?B?OXhEc2tYMnJIekNYb2NLSkZSZE1kd3FsU1gyK1doMlhVZ3l6QzV4Yk1nbmpQ?=
 =?utf-8?B?bEZWTlFrcWFreXNzK3F5YmxnWXByb0tnQWNNN29WMTJ4Rm1sWndCdEU2ek14?=
 =?utf-8?Q?r9Qh3w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 04:50:30.7477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 172224cd-befd-49f7-5b50-08dde9131422
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/26/2025 2:57 PM, Shrikanth Hegde wrote:
>> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
>> index 86de4d0dd0aa..9a320d96e891 100644
>> --- a/arch/powerpc/include/asm/smp.h
>> +++ b/arch/powerpc/include/asm/smp.h
>> @@ -148,7 +148,9 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>>   }
>>   #endif /* CONFIG_SCHED_SMT */
>>   +#ifdef CONFIG_SCHED_MC
>>   extern const struct cpumask *cpu_coregroup_mask(int cpu);
>> +#endif
>>   
> 
> Is ifdef necessary here?

This is gone in Peter's squash but I added it just to
remain consistent with cpu_smt_mask() above.

> 
>>   /* Since OpenPIC has only 4 IPIs, we use slightly different message numbers.
>>    *
>> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
>> index e623f2864dc4..7f79b853b221 100644
>> --- a/arch/powerpc/kernel/smp.c
>> +++ b/arch/powerpc/kernel/smp.c
>> @@ -1059,6 +1059,7 @@ static bool has_coregroup_support(void)
>>       return coregroup_enabled;
>>   }
>>   +#ifdef CONFIG_SCHED_MC
>>   const struct cpumask *cpu_coregroup_mask(int cpu)
>>   {
>>       if (has_coregroup_support())
>> @@ -1071,6 +1072,7 @@ static const struct cpumask *cpu_mc_mask(struct sched_domain_topology_level *tl,
>>   {
>>       return cpu_corgrp_mask(cpu);
>>   }
>> +#endif
>>   
> 
> Previous patch says cpu_coregroup_mask is exported. Is it exported in any way to user or modules?

Just "exposed" to kernel/sched/topology.c bits :)

I don't think this is used by any generic module / exported to
userspace.

> 
> Also i don't see similar gating in other archs. It maybe unnecessary.
> 
>>   static const struct cpumask *cpu_pkg_mask(struct sched_domain_topology_level *tl, int cpu)
>>   {
>> @@ -1729,10 +1731,12 @@ static void __init build_sched_topology(void)
>>               SDTL_INIT(shared_cache_mask, powerpc_shared_cache_flags, CACHE);
>>       }
>>   +#ifdef CONFIG_SCHED_MC
>>       if (has_coregroup_support()) {
>>           powerpc_topology[i++] =
>>               SDTL_INIT(cpu_mc_mask, powerpc_shared_proc_flags, MC);
>>       }
>> +#endif
> 
> Just this gating should suffice IMO.

Ack. Your suggested diff to have CONFIG_SCHED_MC configurable on powerpc
looks good.

-- 
Thanks and Regards,
Prateek


