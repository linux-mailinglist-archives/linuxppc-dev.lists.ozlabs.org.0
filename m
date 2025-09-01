Return-Path: <linuxppc-dev+bounces-11545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B287FB3D851
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 06:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFbln0Bbkz2yrl;
	Mon,  1 Sep 2025 14:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756701636;
	cv=pass; b=kbP5pgkdGBebQG836hv2DvliX9wkYACD9q0smLvNEcPGqZxbJIymphQLAaHClYaj2nBVEzBlA3JHIf+qDF8ai59Nh81v3GaSXeUK+HweToA3khKxFrWpJ24I5lrB1qCE5DojIhCbdatUZDeCo4iKpNvfskU60tFe2v4E1M2xO9bfG/kQ882kX+NWxs9yb+g1za8ddyzqMD2C00lKu7dvn/5jCX2O3cF1J55Bv5OSISl4R5M+v7rBV0vvzuwgI+4FkRWLiL3yVC71F5f38jbxsfzn9WvlHuWm47eTcx95QhQMtTF3oIILVh4M4aoeRBgqriNR28sReUXTXVEqIyAcog==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756701636; c=relaxed/relaxed;
	bh=bDwJbliK11Ingf10pHkPQT0Yq3jRpaXvSYmmWZ37510=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lx8TMrIuLo7kuVa+3VcSmyH87EMcbwlJ95lZ84ziZF3jhcVoJYbdmnbxsz/iSZZBAvrirziAIKZLnzaIM4tncYYODCOk7P0/xB4I0Ef3At0zKpEZXt1WnKs1PaQD2H1vyVmI6tMe1FEd2KxcdlqdRR6aik2i/Zo5R17XtlFOKHT2qegk7/a19qze1TentmPsmOp1nbIIXnuWOQiZukUT5MjCdq8GNYhyCew7hxxilHP2/finsiRGn8eRalUPl9AlTmq2VB2cQ+XVlH9D2aL2jzRjfSh34Ok4RRv7iCtm3VvsX1k6PJU49VEs+gnPfbRZftn//1pfG/ZBcmGdO8c8vQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eKV0GOUx; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::62e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eKV0GOUx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::62e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFbll2Xdmz2xK4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 14:40:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiQlIcrFVptIJrOsEYcNQJJ6WeD4jqWvtRz4Ci1IjvEWHqlhJoCWkyBexjoRsw0a/iBRZ75QNbFalh2jMdt5LNUmyU04Nv1VmODZkuiAHf9VFn6dmVjqDnV88HmDf2wep/yuAX+4jkwTpQ2I/kGGdtJ+2tPEhaA4dMILJIYCR21xYS1HAEGG/NFrCWBvTHgs2A2/oE0v2dm2EmiMlfKagPjWtBNvU9G+s90sWE/AL0bP9o2YuXVQKAAKmn2ezHrSXSC1EUBON+STuplzn+KqE74YlisT1EfdHgY3wPZXJDj0rz/ewR0LrPYkIjdoHwXcSjRNtWCzyrQ8Nhk5D4F24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDwJbliK11Ingf10pHkPQT0Yq3jRpaXvSYmmWZ37510=;
 b=VQwtPis3+pZzFFye9beT7yWZE0zAqitTYi66y8iq+02xJ/+l5oD0iu1Uh9vXnpuSGuEafZ3228WwjDLBOAvdAchcIXkdbSKsfizyqAxAyvYBkAIh2yJvZfCG2Yklhki1IkH8zmMUwUFFSHPUTx471vnK0NsDw+cEm/JBVrJDLSQouin1ORKLNszDX9oJeJ8gr6u/IxJY+39yPo58ei8Hw8zm+z0eGYUEQFa+pTItxzNEiUiJl9BbjhmEFEP/VfSsHpLQ7yET6ovv0hfmfUhCniaZ2F/Tm1f1bh96ex3pk12gLKNd7SwBP3GqN0/91eHs1FgkpmdHXDpM2GtNCt1mjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDwJbliK11Ingf10pHkPQT0Yq3jRpaXvSYmmWZ37510=;
 b=eKV0GOUxOthahA7U7zFJU2rRvP1KgaVcXqBPllATEWyHfT8oo06KfmlZgIt5oDf5qCUY2TWYrIkCdYLtECb5I/UXWUNh/PDB+jteRyv91PmXfNUmIByf1TpXxxnKvSpQcgfKNu/TcBPIDkRhqd5kAiuSI4AnC3iKhuMeNRgsy+E=
Received: from BY3PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:39a::23)
 by MW6PR12MB8836.namprd12.prod.outlook.com (2603:10b6:303:241::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 04:40:14 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::cd) by BY3PR03CA0018.outlook.office365.com
 (2603:10b6:a03:39a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 04:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 04:40:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 23:40:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 21:40:06 -0700
Received: from [10.136.36.137] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 23:39:55 -0500
Message-ID: <e3e216b5-445d-4d63-a700-102f996c5e10@amd.com>
Date: Mon, 1 Sep 2025 10:09:48 +0530
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
Subject: Re: [PATCH v7 0/8] sched/fair: Get rid of sched_domains_curr_level
 hack for tl->cpumask()
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Valentin Schneider
	<vschneid@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, <thomas.weissschuh@linutronix.de>, Li Chen
	<chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>, Mete Durlu
	<meted@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, "Easwar
 Hariharan" <easwar.hariharan@linux.microsoft.com>, Guo Weikang
	<guoweikang.kernel@gmail.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, Patryk Wlazlyn
	<patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>, Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Vinicius Costa Gomes
	<vinicius.gomes@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <b64c820d-084a-40d9-bb4e-82986b9e6482@linux.ibm.com>
 <20250826101328.GV4067720@noisy.programming.kicks-ass.net>
 <xhsmh7bymlg2f.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <5ec9ca8a-9ba9-4600-a7a2-f7bd790fca83@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MW6PR12MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8065f3-87d6-45e5-df90-08dde911a455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K041TTZwVEU3Z3czNDc5TEx2OXlmemdVdzBiUjdXeTYycTNmUlNxOGNta2xG?=
 =?utf-8?B?MW1uL2ZUUWNwc0JmREx3amZPbkRpRm8rMXN3Qk9XMmh6QytkeXVMVEhWZ1k4?=
 =?utf-8?B?UjVRb0xHZithOHdDUkNlenROb2g5MzByUmpTMmI1WjFHQS9EYythTzdWNGdT?=
 =?utf-8?B?TDM2R3ZUbEwzVXozNVlvakVaV1oyTlhHeDFla2hDTzJCTitmL285QXorWnZT?=
 =?utf-8?B?WWFhdVExY2pQQ3NEbEZoSURNY2Fyclc2ZC91QXlaSU4zUTZpU0RCT2gxRHJl?=
 =?utf-8?B?OU45SmtybmM5QVoyK2hEUUtuYjY3VSttaW9iY1dDc0l0U2hEZXpHd3AvVE9V?=
 =?utf-8?B?T2JMSFBhNEh6NndIUVg3MGE4RFRGdzZiRlJQT1FKZ3pJUEJudEdNQVhVOUVT?=
 =?utf-8?B?aU1rUFFZVVhKOG5PS1RuZ3prWi9MK0U2L2NaZUU0UE9sbVFwL09rdGlhMTlV?=
 =?utf-8?B?QjB4YmQvUXRQclpkaU9pNG5MTTlOOGJhNUhyRHNZbG9BcXFJNE1UdGtSL01G?=
 =?utf-8?B?bGVYRlpsL2NTMFZMeWk4WU1RTDd3V3VERjhibG1vamlwZ3U2bUdTVzhhemsx?=
 =?utf-8?B?d3AzY1VtVU53T2l3djFsM1JOeVFYQ1I3VENyMGRiK25qNnFFNXZreGdlNHFy?=
 =?utf-8?B?aGk2bko3d2ZhbzFCdDU2UEtCTmYwVDBIL3dJR1lya2FnWi8wd0xUVHRwS3dw?=
 =?utf-8?B?VFBneEFwS2JJM21jUUhaZFc3REs4Y2pIUWs1elhBaVZSUFNzbHUxcE1aRkps?=
 =?utf-8?B?cWM3alpxMU4xU3lUM002VFVIWEkzV3J4UWtkWFpsSndnSUp0UXAyby9UUksr?=
 =?utf-8?B?Um9sSWZkUTk1RmdneHJXd1RkQytERlNQMHdueW1PYmFzWGQ4a2VzMnoyZzVt?=
 =?utf-8?B?Q3U2UjN0N0Z4aWlncVVRZUtMRUplSjRFcSs3cHd2aUhwYy94R3lHQkszRkE2?=
 =?utf-8?B?cXdEYWhjaC8zeGlBSSs2cklvYisvL0lrYjR4UXlRMGZ5bVFSOUVOSzMrK0l5?=
 =?utf-8?B?SUV6Z2lsRWxwcWE1dXpZYVhSem9aZEVUL1FFNXlFNEs1bmRkZW5NQU9jZTZ2?=
 =?utf-8?B?UGtxeTJEb0M5SzZQRk9NemFKS1RUemxBc2dJWkR2dHhlT0EyT0FtWmg1Q3la?=
 =?utf-8?B?dFdBUUJ6MHU3NDEzNUlSSnpBVnBEOEd2dHk3dHdPbVYxSlBWb09oM09FNm5n?=
 =?utf-8?B?RUxGOWp4MWF5Ynl5NFJrSFA4YzlSdUlabUZSc0VTdnNsZTNTd2tFalFiU3BK?=
 =?utf-8?B?eUV0RHVQSXJWNndFbDB2empieUFkSzQ0Y0FxODR5UnY2akVPYlIwSXFBcXMz?=
 =?utf-8?B?SEZTK1Z0TVkwYWg4T1pnWHpsWjVyUEEvMlB6QUJWNE1TbXhvOXdFQ1FiWFd6?=
 =?utf-8?B?TDMzd2RxaWlodnpDR2RRRm1INDBvY3g2QklmOWcvSi96bXpCRm9LaTYvcU9r?=
 =?utf-8?B?c3ZHN0p3dHdFcGthTlFac0NhNDN3YXJUR1cxMHRqTW1WZzRqSVJhN2hpbnJS?=
 =?utf-8?B?NUxZU2RkTytEZ1JseGhNeFFhaDJsVTA3N2M4QjFIUXBITTQ3U3dLYStEaG5L?=
 =?utf-8?B?RjlPZmwyYjArSDIrTTFucC9tU0t6UUFCOVdmUzREeEpzaWdEUWU5RW12US90?=
 =?utf-8?B?VWZJWXRGdU11eW0xbnhlYVhTbDBXc2QvVFkydURYeStTbTg1S2hlMU5uNWpG?=
 =?utf-8?B?V0wzWUdsaXF1aERxRW45ZTNVeGx6QXFGTFVIOUtMQkJETXYvQXF0SElqak5a?=
 =?utf-8?B?Q29MLzNOYzlwa1BDeTlDU2dJdXlVeVZtSVJtd3VrUjdXTmxvblQ5VHAxWU1W?=
 =?utf-8?B?RUF3MUkwQUg3aEI5WUpLQkt3NzlBMzRJNmliWnd1VXV5bVI0SVJhQkVhaXZm?=
 =?utf-8?B?UkFhRnlrc1hqNmtObmNQRkFsUnhEQUdaMG9pRzJTdnhsVC9kNjhEbDViSFVo?=
 =?utf-8?B?VVBITzVzZmdNbTUvN2VQR3ZMNzhYSmgvZk56Wk5NS254ekJSZVlwYlhpNTFu?=
 =?utf-8?B?akE2SVVaR1hJblRQbk9RL29HVjVMWjNYQTRFWERDZjllSTlSU2lWWlRkbFlH?=
 =?utf-8?B?OVRwTDNBdCtxNHdrVFdKUnk4YVRyN1J0b1plZz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 04:40:13.5943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8065f3-87d6-45e5-df90-08dde911a455
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8836
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 8/29/2025 2:23 PM, Shrikanth Hegde wrote:
> I was looking at: https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/core
> 
> Current code doesn't allow one to enable/disable SCHED_MC on ppc since it is set always in kconfig.
> Used the below patch:
> 
> I think since the config is there, it would be good to provide a option to disable. no?

I think this makes sense.

FWIW, Peter added the "select SCHED_MC" to keep it consistent with the
current behavior.

> 
> ---
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index fc0d1c19f5a1..da5b2f8d3686 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -170,9 +170,8 @@ config PPC
>      select ARCH_STACKWALK
>      select ARCH_SUPPORTS_ATOMIC_RMW
>      select ARCH_SUPPORTS_DEBUG_PAGEALLOC    if PPC_BOOK3S || PPC_8xx
> -    select ARCH_SUPPORTS_SCHED_SMT        if PPC64 && SMP
>      select ARCH_SUPPORTS_SCHED_MC        if PPC64 && SMP
> -    select SCHED_MC                if ARCH_SUPPORTS_SCHED_MC
> +    select ARCH_SUPPORTS_SCHED_SMT        if PPC64 && SMP
>      select ARCH_USE_BUILTIN_BSWAP
>      select ARCH_USE_CMPXCHG_LOCKREF        if PPC64
>      select ARCH_USE_MEMTEST
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 68edb66c2964..458ec5bd859e 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1706,10 +1706,12 @@ static void __init build_sched_topology(void)
>              SDTL_INIT(tl_cache_mask, powerpc_shared_cache_flags, CACHE);
>      }
>  
> +#ifdef CONFIG_SCHED_MC
>      if (has_coregroup_support()) {
>          powerpc_topology[i++] =
>              SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
>      }
> +#endif

When I was looking at this, the whole of .*coregroup.* related bits in
smp.c can technically go behind CONFIG_SCHED_MC too but that is a much
larger cleanup and perhaps unnecessary too so this looks good.

-- 
Thanks and Regards,
Prateek


