Return-Path: <linuxppc-dev+bounces-10181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F335B012FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 07:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdgnB27yjz30Qk;
	Fri, 11 Jul 2025 15:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::619" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752213070;
	cv=pass; b=Wb1XmJ968E1DZAKxYrJGsfGmdKb+XufO5HMsoF7NUqypevV0nNy+q4odWXwXEEIVR6+dE17ZT4gXdqNCOrgheddYF8nLIQ2dieDDl1jL2RoV74UjWyJtTcehVNL+zqCh9yGBFg2kO4CLhMkg35Tby3j0nZ9Evx6rDn7j9HvDth5KpC+pz/0s+6HmIma5gEpBsBVN3tgu6NjntP22Z8zxBCumoHAVA+lRQcsc+Uru6MEPGwmWabqDPSreGT96F5L6YGRTD4fYL5dw8x7AvCtjOIr4uCHaJ8w70c9ivLiM2Z0AVJ4b8xB26i9YllesTkkYQG3J1DQMYcY2vWBwwpXwoA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752213070; c=relaxed/relaxed;
	bh=U4Kk+aQlZms6jBTV6SiMXXXnJALmvbM39zcQ8TP6q4w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RJGRFviGnrn3qUEhwO+QZKxLAdJ8vVgqYzDc7ZHIkrX9YBmNAiS42M63PUsPhidbmSXU9PmZFXqy6RKwtdIa91Mcid5JuCaH7dhni555jxuRHb6n+p0X7jI6mtd1v2j1UvFgHc4uh6d29ZbJvIt/IdwAvRkkb7q6bJ4yirrGtxl0Xo4FXGKn28rz7PV2OoqEoTuFjgK/YGui4kOkj7YyAcB97nrzpBQkPdksttBEF1ONg7gAK+zZC89L0e+TVrMj+R/5AyDdVYzEHCzrAqfleWsD+kw+WJ5m+Hc3UOJa2RF2soBww2qFK94sihm6bHl4d3j1op20dpyJoCzPW2k2Gw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EUKHdO40; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::619; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EUKHdO40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2418::619; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::619])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bdgn615Hvz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 15:51:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLL+Lh3lHlnduD0McY3lymmzRRw5cCIHMwjzd8k1HrJUSyjgHCYfWKrI5qYdkc0TNaPtVw7wyT3fdM4cH41re/2sKzqqDwMpn3lL2cKiGaSUDVu8fPliwuA+CjbdJOMQGQS3CRvZaFv8KI6N7Xr6Wt+B8Dc4/Wye5TE8L9i3hs5VNaKOzaMNFVJC2Qs3eME8wAVwmVzONgOfGifBtNg/Q4kMJlVmD1k+GUXfGngdf1hwIbmOMHR58QbfN2TiM22YNaoE4QDlpInn/LXargUdOO0fOBp4zKxzP2eX80PG62MSszEdQ4zjDkzp6s/wN/vi7mH4iCJG31RdtSHjWMx8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4Kk+aQlZms6jBTV6SiMXXXnJALmvbM39zcQ8TP6q4w=;
 b=ryIqJ5PACt4XasT6wGCY2ODhbn7tuj9IOr0EX+NyPaW9++4cgLP/XTMVK3Xdh0tGKy0uOdDCx2Cc3cNdMXmeZ62up7Zep0SioJjNLN0Z2dEiTP1PMBNsQ/aXTkVBOvxZiSZEABRd1MHMxwXGS56l9M1UR/y04KTS5k+ublg+o5lkV3jTvc1qgRzq/WhnBBgB29rHXZNA/73mMdrCtd2NxyF0uUSxY2oLR6mZ3cGYd06xEPfN9622xPGt4fj1Ukj7W3hfVTktc5PLIvxveczeB3mxqjHsaVIyULC2j86Y9y0Qd75BaJd24qxrLQcnTV2jBp9PVQEuu8hwlkuJeZbIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4Kk+aQlZms6jBTV6SiMXXXnJALmvbM39zcQ8TP6q4w=;
 b=EUKHdO40imnmNbMNLrbM4c9xhdNIha+0h3ViyrR8qctUUWpwI1B0K1P+yXqgVXhZrp1fvlZ7VB6X+/ZwW0Xag5ofEnQtu57FUvV6AyTRxhxoMsIwF4bnqLL5wycY5ROrWaberK2M40n+VRxqhvfG67gEmCSJtWIXtcxDUKiEaw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 05:50:45 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 05:50:44 +0000
Message-ID: <ba4dbdf8-bc37-493d-b2e0-2efb00ea3e19@amd.com>
Date: Fri, 11 Jul 2025 11:20:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] smpboot: introduce SDTL_INIT() helper to tidy
 sched topology setup
To: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Li Chen <chenl311@chinatelecom.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Bibo Mao <maobibo@loongson.cn>, Tobias Huschle <huschle@linux.ibm.com>,
 Mete Durlu <meted@linux.ibm.com>, Joel Granados <joel.granados@kernel.org>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
References: <20250710105715.66594-1-me@linux.beauty>
 <20250710105715.66594-2-me@linux.beauty>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250710105715.66594-2-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c17b1c-d5be-487b-a475-08ddc03ee04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkxOL1MwdTVKNkoxa0d2Z2ZTaVVrMjh4dWhnYUZxT3JXZ0llOUNtLzNVenRH?=
 =?utf-8?B?Q2VTMVc0Unl1dUc3WTJaZkdvYWlkSGdwbGdpc2JOSFRDUURqZ21OTVA2aGF5?=
 =?utf-8?B?Y2hnL1o5cjRuZTRNY3ROekJtYmVTbzlkdnRQU1kxUmNYdktVTW1EZzgyUFFo?=
 =?utf-8?B?TGpDdmw4YWJFUFduQ1B5U3BvYXdIcFdqWnpkTDV4L3B5eDE4YjZoNW15RTB1?=
 =?utf-8?B?TldHc0cxVXlXUE9pWEpIUndUclRscUxoWmNQemhtTGdJT1dCSk9uU1p4QXQ4?=
 =?utf-8?B?NGhPbFZkMFQvV3B3YldvRFlQWU4xUDRRRFZBdEhxKzdVTTdybGRHamVmS3Zk?=
 =?utf-8?B?elBaMmkyOE42MzVkMkpFbTQ3SXBkQ1RHTk5xaFV6KzZtdk5XT09jaWEvaFJs?=
 =?utf-8?B?dFlsRklpRTMxekowaHlXTUh6dkFvYmZ4RytBbnloNXVRa1EzTGJPeVBvU3BG?=
 =?utf-8?B?Q2MyY1IzdTZ0R0FuaGFvT0I4VCs2eVVNOUM4Y1RpaXNGTTB5TzZaRnZubFVN?=
 =?utf-8?B?QndUbnRoL0g0MGVyY3hQNys4N25PMmtVSXJkV2hDS3lxVGY4bkZpSUw3M293?=
 =?utf-8?B?a3lQZVNOM3B6ZllaOGx3Wmo0bEMydHpyVkF0SkhLakZITXUzajcwUTZmOWFL?=
 =?utf-8?B?ZkpJejd4Sk1XZmFTZ0hQMzVFTGNoajlHRWJwaWtxU3ZRMWhHaWlnQU9NQjhY?=
 =?utf-8?B?TXhaakk4Wk9xOVBvZmliSk14OGtoZ3JkeFZFSWRhVW5vZ1VGeWRWUzg4a0RD?=
 =?utf-8?B?Q0tqM01QK0JHNlh4RWplRm9uQ2hPQmF2TkRhckhsbWRxcDFFcTVyYzgxTUZy?=
 =?utf-8?B?RXEvaG1VOWwyaDduRmJ2TEZ2dWF1VUhvd21SWTg2R3VRdzhzYmNsRDIrL1JU?=
 =?utf-8?B?QWNxQjRKd0daTFFaMG5OUE5RK3FXQW8rNVBPREZkSDNZUWRSQmNMUzRvaW5G?=
 =?utf-8?B?N0p6dklDZ0NMRXZndy9xNU9nYkxYRityZExpQmFXeE1ZaUp0RFlaL3hQOEx2?=
 =?utf-8?B?cE5zem1rakpWaTR3YmJXMjkyZUJIQlVBS0FKK1JaM0pQZk5McmZkVjB3T0JL?=
 =?utf-8?B?MTdmSkkzbEZXQ3NVU2pTdkFCR1hBZFhpb0R1M09qcmdxR1B5aDQ2WTNFVmp5?=
 =?utf-8?B?ekxZVXVudmxMNnoyMnRyc09oQlRrVjM5d20zWnhnUEF1R2dKT2N5ZnJUV1NC?=
 =?utf-8?B?QmRQU3JkSnZHbjM2SlNzVUtTcVVwTlpqM0U1cSt4UHNvS3VJYml4blJPM2hH?=
 =?utf-8?B?UFRIOXhUbjQrTnRtblVyZlcrUXBXeG9tR0JNQUxrazJNK2EzL2dXbkJTL3N4?=
 =?utf-8?B?N0NRK1ZOM0JJU1NsQzJrbEFMUmg2N2ZEME56TVRFbHZDRGtrVWZZdXBSaVdN?=
 =?utf-8?B?SlRRaUhQZGVtc0RHVnhmWXZma1A0QklTRW1YRExSS2ZKRXQvdW5OT1NZV3d1?=
 =?utf-8?B?cHhaMVgyR1hSdVo3d3VtS0M2M0Qza2NUN0M4RU1tTXdzTEw3eldJMTU3NU5u?=
 =?utf-8?B?ZG9sM3FESWM5RGpLTzY0YW9PcE5iYXlQRFplSVpqdmkvVEV4N1VmdFIrMUZ6?=
 =?utf-8?B?OGt5N2lrZms5L3J2Y05rWUkva1RDdjBNc21OSXFiWGlUMnlBbVpKTmt5Z3FE?=
 =?utf-8?B?dmI4UTVEZTY2UHh5bFpta1N4VWZQNCtCYnJveDdsSmVaam10NndUY1FNQWFQ?=
 =?utf-8?B?R1Z3QS81TSswdWdNQ0RxRFlOWFpZTlhtdWVtbUJvdTM4ZExOeDljdlpQNWcw?=
 =?utf-8?B?R082ZkQyTGhSS05BVS9BQ3JoSmkwZHhYN29qcTcwYWlKVVd5U05VeUsxZGFJ?=
 =?utf-8?B?ZzRUN1BpNVlXd2dKZzErNTh6SDhKQXdyaEVaZXZqRXBVb3lTUE1TODBsN2lr?=
 =?utf-8?B?U2lCcjdlTVd3V0JHZUNFNVJvSk1DQmdhcXZYZVFMZjZrOWVkcFdGSGNGZGd6?=
 =?utf-8?B?T25WUVFBNG1NRnpVL3VDK1UxT012SUVzanZLRzB2dXNMbHVOeU5od3kzVWVD?=
 =?utf-8?B?b0ZsN0ZtRHdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1JTS3NUTU0yeUd6cEIvRDBjdlNUMVFsSkFDZmZ1SWxXQ3VVN1ppMGEzeGJS?=
 =?utf-8?B?S09UWE5FQUlEajN4SlhhMWVJdmhoVklRM29BTDM2SEg2UGRUaEtrQnAxWmxa?=
 =?utf-8?B?aWxQSGxDYjkrdnJZcE5zd2NNNXVpWVZNbHhTSG45MGl5V2VqOUxISzlsckMx?=
 =?utf-8?B?SEhhZElxLy9MT2JGYStpaHRzeGdmQ3owNjc4UllIbUtNR0FNYmhEV3ViV2NI?=
 =?utf-8?B?UVhFeENDZUhSQjJEZ3gvektDdk9UOE9SZUZNUGU3SFpZc1N5SE04UEpVamdF?=
 =?utf-8?B?Mlg3cFVqTVVjdjVKSGRmRVlMVGp3SEJ1TXZtQWF0VElZOXRCUHVtOHJkV09u?=
 =?utf-8?B?NHU0SUltOU9rc3NQTkY2amQvSnRnSXZmeW1nWTQ1Y3ZCSDBHb1RPakNyQWR5?=
 =?utf-8?B?dVhsTGFxcGJXb3JqNkdqUkc3WFZ1VzlBWXAyeW4reCs2ZVpsd0xIUDVlZmlp?=
 =?utf-8?B?WWU2RTlOZnR4YkM5bHhtemd0cTN5UGtpS3ZUYngyaW12NktPWERSZ0xPOXpB?=
 =?utf-8?B?S1JMN0dDTWpISEltbTVkZ2h3VDZOeVJjYlNSSWtoc3FjMjlhdWxjWlE4TkpW?=
 =?utf-8?B?ajRDbTlKb3cwN3UySjh0WWtBSDQzUFB1QXhWOStZcHcreGNHRTI3ZEJTNmtW?=
 =?utf-8?B?T3RXTE9SOU9BRGZIdDJkTEV5dGVvc1F1TEMzcUlRRG0xSG4wOXIyc1Mva3Zo?=
 =?utf-8?B?TFN4VHpOL3FRSkpDUmcxOG9pbVJNTVFwejJHQVUxNnp2d1hsR3JrL2ZHY2dw?=
 =?utf-8?B?WmEvWHRST0RURUQ5WExHcEhuQW5GVTBoU2hJa2JCZ0J1QzN6YVFiRWc5TFFP?=
 =?utf-8?B?U1hFOE5aMnBqVFg0TVlSQWxhVmJBMTBvOFZLeUZ0a2U1STFjU052SHR6Y1Zs?=
 =?utf-8?B?cSs3V0YzV0FVamU4L0lRQlQ1VnFucGVXeWFmSjVrendRL201b3dteWdWQVJ0?=
 =?utf-8?B?cndUK0VxTkFoTThXMGRGL3Rzdm90Tjd2elBIYi9hK1VrZFdJY2hydGlNVXVY?=
 =?utf-8?B?eG9IUUlyNTRFakk2ajJzL2dnaEdrRXA0TWw5QXNZVlU1VHNqYnhGN0hFTTdH?=
 =?utf-8?B?RWExZTBKL1lnM0lNYXYvY2hESjk5eGlmRHV0RW4zajFjc3lkQXZ1MFN1b25G?=
 =?utf-8?B?aGhyZWpYSGxhLzdLRTVmRzRPa0V1TWVKVytEZThmTFAvRk9YZThPUkI3bGxm?=
 =?utf-8?B?dmN4Y0l6NGZybVh6ZXEyNWVDUGF0S1hXTThFdlR2Z09CWWJYRUVORVJJSll3?=
 =?utf-8?B?TXRvaFFzQnNyRjBlZDBWdUJzUkdCQW9vWGVxOWdVUVJlNUcrbmF4KzdNZ3BU?=
 =?utf-8?B?Z0ticTRaSytheEpxdDZubmNBT0Nod2dPNEt5ZFd0dnFzeGM3MEI4WlUwZ01Q?=
 =?utf-8?B?TFRkRFB6RCtiRmdwRkViN3U5NlBvdWRzUFlIV2NSdDdWc1hqdElKTllJYUlu?=
 =?utf-8?B?cmZPRElDdVhXVDVJd3EzSEVjS3hvWWVVaGZUZHRkdUVyUjc1SUpDeWF5bHR4?=
 =?utf-8?B?V1RoQ1JRckp3a0lCTyt2aTZ5NHg2aUJpVmtlNkFXTFJNeTF5N3NIQlRSQnh0?=
 =?utf-8?B?TTM3bWRIaEZVZFkxRHpMY1FNM1lTNUtETXhFSVVjQWVnVDU5MHRUemgvdVcz?=
 =?utf-8?B?b1BMZDVTekVnQjZhdzFoYVJMUEg1Mjkvb01oVlg1aGZLRWRZVVpXK0hsUGxl?=
 =?utf-8?B?ckJscEVlZ2ZIUDNlODJNL2V4MDVCNUZXdS9GRzB3bWF3d1FQaFd6amNFdXZX?=
 =?utf-8?B?T0N1RThyRGtWUUR3YVNlWnYyNVdkQlNBWDJXMTZOdm1iSXlNVGtZR1lodXBQ?=
 =?utf-8?B?dFA4OTROc1NSNDVMZ01NaEIrSXBtUks1Q0ZZSkQxZnZJdXFobFRSOUxGck9s?=
 =?utf-8?B?YnNXd0lkWmpJQ29BKzZCcisxUWQ3am04cGRkQmFwQU9abE55bGRVN2NxSmFj?=
 =?utf-8?B?akptM1RmclQrbXFOaVhmemtmc0NhWVpYVjZDK00vV3FLSmYraElIdjJVQVJm?=
 =?utf-8?B?ZTNJYSsxdjNHQkFBZ2ZpdFBHTHhCVEdkWGtmS0toU1JyN21zUW1iRmxlUHcw?=
 =?utf-8?B?T205ZTFndG1UNjYwQVgyREEvSlJBUXI5ZFlJMlo2ZHZsOWtBajNxSk14NkpI?=
 =?utf-8?Q?3EVveZ/TSf4bg7FW7iifDmC8p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c17b1c-d5be-487b-a475-08ddc03ee04f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:50:44.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpr2UWyX7FNz+9VsSSoAKRcheGuTkF0mRYSOjBR6ep+MPw+Fi62WYHOG0Gk+qFErQDxBtAdo6NJeZx/aegPavg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 7/10/2025 4:27 PM, Li Chen wrote:
>  	/*
>  	 * .. and append 'j' levels of NUMA goodness.
>  	 */
>  	for (j = 1; j < nr_levels; i++, j++) {
> -		tl[i] = (struct sched_domain_topology_level){
> -			.mask = sd_numa_mask,
> -			.sd_flags = cpu_numa_flags,
> -			.flags = SDTL_OVERLAP,
> -			.numa_level = j,
> -			SD_INIT_NAME(NUMA)
> -		};
> +		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);
> +		tl[i].numa_level = j;
> +		tl[i].flags = SDTL_OVERLAP;

Tangential discussion: I was looking at this and was wondering why we
need a "tl->flags" when there is already sd_flags() function and we can
simply add SD_OVERLAP to sd_numa_flags().

I think "tl->flags" was needed when the idea of overlap domains was
added in commit e3589f6c81e4 ("sched: Allow for overlapping sched_domain
spans") when it depended on "FORCE_SD_OVERLAP" sched_feat() which
allowed toggling this off but that was done away with in commit
af85596c74de ("sched/topology: Remove FORCE_SD_OVERLAP") so perhaps we
can get rid of it now?

Relying on SD_NUMA should be enough currently. Peter, Valentin, what do
you think of something like below?

(Build and boot tested on top of this series on tip:sched/core)

diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
index b04a5d04dee9..42839cfa2778 100644
--- a/include/linux/sched/sd_flags.h
+++ b/include/linux/sched/sd_flags.h
@@ -153,14 +153,6 @@ SD_FLAG(SD_ASYM_PACKING, SDF_NEEDS_GROUPS)
  */
 SD_FLAG(SD_PREFER_SIBLING, SDF_NEEDS_GROUPS)
 
-/*
- * sched_groups of this level overlap
- *
- * SHARED_PARENT: Set for all NUMA levels above NODE.
- * NEEDS_GROUPS: Overlaps can only exist with more than one group.
- */
-SD_FLAG(SD_OVERLAP, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
-
 /*
  * Cross-node balancing
  *
diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 0d5daaa277b7..5263746b63e8 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -175,8 +175,6 @@ bool cpus_share_resources(int this_cpu, int that_cpu);
 typedef const struct cpumask *(*sched_domain_mask_f)(int cpu);
 typedef int (*sched_domain_flags_f)(void);
 
-#define SDTL_OVERLAP	0x01
-
 struct sd_data {
 	struct sched_domain *__percpu *sd;
 	struct sched_domain_shared *__percpu *sds;
@@ -187,7 +185,6 @@ struct sd_data {
 struct sched_domain_topology_level {
 	sched_domain_mask_f mask;
 	sched_domain_flags_f sd_flags;
-	int		    flags;
 	int		    numa_level;
 	struct sd_data      data;
 	char                *name;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 20a845697c1d..b9b4bbbf0af6 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9926,9 +9926,9 @@ void update_group_capacity(struct sched_domain *sd, int cpu)
 	min_capacity = ULONG_MAX;
 	max_capacity = 0;
 
-	if (child->flags & SD_OVERLAP) {
+	if (child->flags & SD_NUMA) {
 		/*
-		 * SD_OVERLAP domains cannot assume that child groups
+		 * SD_NUMA domains cannot assume that child groups
 		 * span the current group.
 		 */
 
@@ -9941,7 +9941,7 @@ void update_group_capacity(struct sched_domain *sd, int cpu)
 		}
 	} else  {
 		/*
-		 * !SD_OVERLAP domains can assume that child groups
+		 * !SD_NUMA domains can assume that child groups
 		 * span the current group.
 		 */
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index d01f5a49f2e7..977e133bb8a4 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -89,7 +89,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 			break;
 		}
 
-		if (!(sd->flags & SD_OVERLAP) &&
+		if (!(sd->flags & SD_NUMA) &&
 		    cpumask_intersects(groupmask, sched_group_span(group))) {
 			printk(KERN_CONT "\n");
 			printk(KERN_ERR "ERROR: repeated CPUs\n");
@@ -102,7 +102,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
 				group->sgc->id,
 				cpumask_pr_args(sched_group_span(group)));
 
-		if ((sd->flags & SD_OVERLAP) &&
+		if ((sd->flags & SD_NUMA) &&
 		    !cpumask_equal(group_balance_mask(group), sched_group_span(group))) {
 			printk(KERN_CONT " mask=%*pbl",
 				cpumask_pr_args(group_balance_mask(group)));
@@ -1344,7 +1344,7 @@ void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio)
 		 * "sg->asym_prefer_cpu" to "sg->sgc->asym_prefer_cpu"
 		 * which is shared by all the overlapping groups.
 		 */
-		WARN_ON_ONCE(sd->flags & SD_OVERLAP);
+		WARN_ON_ONCE(sd->flags & SD_NUMA);
 
 		sg = sd->groups;
 		if (cpu != sg->asym_prefer_cpu) {
@@ -2016,7 +2016,6 @@ void sched_init_numa(int offline_node)
 	for (j = 1; j < nr_levels; i++, j++) {
 		tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);
 		tl[i].numa_level = j;
-		tl[i].flags = SDTL_OVERLAP;
 	}
 
 	sched_domain_topology_saved = sched_domain_topology;
@@ -2327,7 +2326,7 @@ static void __sdt_free(const struct cpumask *cpu_map)
 
 			if (sdd->sd) {
 				sd = *per_cpu_ptr(sdd->sd, j);
-				if (sd && (sd->flags & SD_OVERLAP))
+				if (sd && (sd->flags & SD_NUMA))
 					free_sched_groups(sd->groups, 0);
 				kfree(*per_cpu_ptr(sdd->sd, j));
 			}
@@ -2393,9 +2392,13 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
 	id_seen = sched_domains_tmpmask2;
 
 	for_each_sd_topology(tl) {
+		int tl_common_flags = 0;
+
+		if (tl->sd_flags)
+			tl_common_flags = (*tl->sd_flags)();
 
 		/* NUMA levels are allowed to overlap */
-		if (tl->flags & SDTL_OVERLAP)
+		if (tl_common_flags & SD_NUMA)
 			continue;
 
 		cpumask_clear(covered);
@@ -2466,8 +2469,6 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 
 			if (tl == sched_domain_topology)
 				*per_cpu_ptr(d.sd, i) = sd;
-			if (tl->flags & SDTL_OVERLAP)
-				sd->flags |= SD_OVERLAP;
 			if (cpumask_equal(cpu_map, sched_domain_span(sd)))
 				break;
 		}
@@ -2480,7 +2481,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	for_each_cpu(i, cpu_map) {
 		for (sd = *per_cpu_ptr(d.sd, i); sd; sd = sd->parent) {
 			sd->span_weight = cpumask_weight(sched_domain_span(sd));
-			if (sd->flags & SD_OVERLAP) {
+			if (sd->flags & SD_NUMA) {
 				if (build_overlap_sched_groups(sd, i))
 					goto error;
 			} else {
---

We can also keep SD_OVERLAP and only remove SDTL_OVERLAP, tl->flags if
that is preferred or just have them both if you see a future !NUMA
usecases for overlapping domains.

>  	}
>  
>  	sched_domain_topology_saved = sched_domain_topology;

-- 
Thanks and Regards,
Prateek


