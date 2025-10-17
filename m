Return-Path: <linuxppc-dev+bounces-13018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550EBE8FB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 15:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp5gn6Lkmz3cYV;
	Sat, 18 Oct 2025 00:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760708757;
	cv=pass; b=cx3K6CE6NyFBTPk/FYP++OcOMzyUW7XHJC7ar7XiUgG0/hBsz7P4cMhcHaYtj80KSs8939msJGBMM5INS4O5rZ0qCeENmRRtJ3SCXBcOs1Bp2DhYl4t/sECTV0/5aThrgWnxcW3ykx0m9vqSH1QlfV1NqXUQdohh9J7Tsp/Di2RZF22TchTzfU9tUdMNTyTR5X6FYAMBl0OO2HG1dxy3RPKlO3+osJScnXowI9LZp1Ppvvoozsln7g8GKP+3cuyTx7Kb67I/+C39Af3/XQIlFpiLFvhwWcCHAzxlUg4ldtjeydoMoFAvvDefVwVaoDlYWPN9RNYIyQmJhNMo9Pq5gA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760708757; c=relaxed/relaxed;
	bh=HyLYKdM7qdudvU9dzfHPJoxwN3QuIFTAlCroH6KGdf4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mCFtrTg68NQoN8oSJ2AriZzuHcnmsD6GT0MHFtTYvK4uom7VMgCMK+gG3BH7ntsLYwcV5vnTAzUfpf1JBWoO9l9cHw7LLyGEZZt4qALq9LTR5hxY60KktMyPYCjor7G488S1herRMKc6tEE7dpo2v3HwoB5UfzbnXlPpP3Wo9j6zob/dRGkAHXVAQLR0MokLX4B4zPSu3o9gHMEK3gX+KGP2NGtgDz3rAR2c9WxUDoN1E3hAE6wGKr6VH1+sin68aSZFCJGN11kwhE6ObvVMIqy7KFvHIhdKC7IrGjBhLqEczvCqrI33sHA8GJIzeKCL4VPKz7mYZSJN63Qzu2iYSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=RwJqor67; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=RwJqor67;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp5gn0lCmz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 00:45:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cogWU+cG4gxd3YaleO77wkbylOMcw0ZogvcfFVtLqGQagfL7niqI9nzVMwGx5PQxLd2cmznq1SHL0HOTd0GM1rrX2W3g1xpPZRiBFXsfzRG60T1Wb+BKfVvGckLCppOx8cH8kweHTeTESwXjjgWmaOenOvkK5miVpWQ4dhcW+7xqd3Pynj4ynMMmqzg5Ec2XxkqmZcGOAiWP0FFGTF0mgGy7kAjudA9mbd9yZ/oNu+AZIC/oXKVbDtFwPuTua12v/B3obR7sa6HW2FdH4s1ybqTEgAwR8u1V73//ncPyxjUixxMHwDgusi7SYBXdvI6mbVj+RJaoR0kM01HoR8RO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyLYKdM7qdudvU9dzfHPJoxwN3QuIFTAlCroH6KGdf4=;
 b=x8N3htqUpNOPFHAzhyza4RVGAL5gsSINwU8KvaSSZW9Bsxf5VsjPqg0NBU/4ledLcCbY0G4zC2lNBy65XBHR2ZLIfqNtjb9Di+GDqv4/JDVI6iwjZ8gllm3GChnkqbrIkN3jgy3WsJwMQ2z01eW5KdGIte87MipqEXwOtlXkyVT4RjnFKnFJyKwmYCzIXJQEyTguCrqx0nmMb4rrJZK1D1Gel8FSW81wgh2ybSfaaEEdKczRguBKFmU1oKyAucZVodwG100k0wZmZmVl2aSFJsenQWdg1VdTiZldURxyfY2rwmn/h22gZT1U9UWqrpgvIgmhANmUAVFznxEWuhfP5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyLYKdM7qdudvU9dzfHPJoxwN3QuIFTAlCroH6KGdf4=;
 b=RwJqor67F57SnR9CAaxjannbg1PGuoF+9qPT1Nh8ZSNC3YJ37AasQSpcKFwen3RXWWKE4j1BTlRLn7CjjmD/4QUUlhZGm8182i6wbh1BAXZuwfoEgb5RfQla9CCUD036ohY3kG6ajgkxgxGf19nc5+Ep6VGETuZ2c8u5eM41bJblGs+ZDFTAxT15lIaN6M5PMY7BD5ZnUgwoU1KBsRsJiwLeLm/NDFHagUKqcnAiG5n/znT2w1Zymet1XXpoWIlh1GQ2r6hxDEhdMDevy4DROKjd1c4EyW2AHyeYaXVk+nLC5tADzXNF5O9ANnzs+mElRS5lluGxYlDXLwxtFH/elQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT1PR01MB9467.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 13:45:34 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 13:45:34 +0000
Message-ID: <d58b798a-3994-438c-9c02-678f3178b21e@efficios.com>
Date: Fri, 17 Oct 2025 09:45:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V3 08/12] uaccess: Provide put/get_user_masked()
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.315578108@linutronix.de>
 <eb6c111c-4854-4166-94d0-f45d4f6e7018@efficios.com>
Content-Language: en-US
In-Reply-To: <eb6c111c-4854-4166-94d0-f45d4f6e7018@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::18) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT1PR01MB9467:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd7d902-5a10-4abf-6434-08de0d83724b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEFza25nSEYwdW1PVnNlSHpKdzJrZjVXSDlnWk5MRE1OLzlwNzFwSHlSUGww?=
 =?utf-8?B?b2lBUVFCYzFTdzRaa0ZhQlNUSW5XRzdyT2xYZkVMZXZrVVh4RUpOalVUZk03?=
 =?utf-8?B?MkVzbWdGUXhIYTAwODY0UVRtYU5kSTdVTjdDTzVsN2REY01FQmhJZjRab0tl?=
 =?utf-8?B?eVp1NTZJS1RRWXMrREVuVFBsTWRjbXZQdTRiZ1NWOHNybXV1L3V2S2JBQXJx?=
 =?utf-8?B?djFJTHByWUdac2M3TWNuQ3laRW8yREVVbzQyQTk5TlA1QmpqMVF3Z0NaQ2ox?=
 =?utf-8?B?dENUa3J1UGNjSHEwZ3VYZzJ1THJKUHN5dGtYblowNHVIT1RieVUvODdDdytM?=
 =?utf-8?B?UWJtOTh1TGNrbmNaUEZBQWdsVzZpMzY5R2RFcHBJdGRVMGxrOHBpa1o1ZWRY?=
 =?utf-8?B?eEJxN3NSSXU3NVRWMUhpRDZqRWdIYzI4S0lNaks1ckJLV0NMZlNhaVB2VGtu?=
 =?utf-8?B?S3JIcVlpMTEycjQzaXNGSjkvejEycm5nS293MWpKa2RQNjBlUmhOWUVCYVl1?=
 =?utf-8?B?MG9sQWRDVXpGSUF1MkZNcUMwOUJqU2hWck1oU2ZEdHptL0pSWnEvNTNrbWUw?=
 =?utf-8?B?NFloVk9IK0RkZExTdVRmVjZVMy93ajVIUysyb24wendrbnFjUEdoMUtraEVT?=
 =?utf-8?B?YnFWWlpLZnN3ZHpoT0t2TUJKNzJPNTRkaU52R3BwcGdGVXNCZEVNSXpWMC9s?=
 =?utf-8?B?NDF2Mk56dEhVYlVtZ2NoQW9sejlXTzN0R1Z1SVAzaTRKemVhTmhFbEtpeGNT?=
 =?utf-8?B?T3lMNzdzSmJpNTZBVVFrL2pzY3J5VksvZlR2OXQ2aG4wa0ozY015S0JScEVk?=
 =?utf-8?B?Sk1iMEVta2wzckxidm1XNUtpVGQ3eUZYOWp6Y0dTRkYxbXA1dGh6OTZsSnlp?=
 =?utf-8?B?aEgzVTArdDBGTDJLZWNwbnh2VEpyWEZ0bFVmRlpjOEtQUzQyMVcveFNHa3NE?=
 =?utf-8?B?eWFLQmpjNy9aN3R1d29wSndYZ3ZnOW90aXY1dEhOd1d3TGphQjVIVVMvVU54?=
 =?utf-8?B?VnJCSUxhdVB1V1V5YU9EM3B5dzZQSExUNk5xVzhkS3FGTDBJN0RTSVFoSFdm?=
 =?utf-8?B?SUZPaXJGbzNsNkJJVVZKNmhPTG5KaEMwSC9OUW9PaXNNeGQ4azlsdzd5TUdH?=
 =?utf-8?B?SFJaZFBtYzByUkZNd3ZPMlhyYXNOTk5WNkdRTkpHM1Zob0JmUHJYMDZPWlNO?=
 =?utf-8?B?SDRaKzFoaVNoUkZaSGVlV0tqVUR5MVRLNWFLTTh6OTBHQVJGQ0ZRWmphTmkw?=
 =?utf-8?B?VVliN2YrbXlMcWgxdEpoRG9sVytwd2IydndnM0dYOUJXSjR2RXZnYm5Pc3F5?=
 =?utf-8?B?WGw4QkJOTGNzUFFpWVdES1BWdlZTMzF3c20zVzUyRjNYNFA1QlpFb2oxRzVO?=
 =?utf-8?B?UjFMZTdzL2RVNytEZEp4MzNQT2tXNEZOMlRsZzJQTGFqLzcwNzhnZkRHUU16?=
 =?utf-8?B?N0E4dzh0YmI5K3lnWjA4Yi9ra01UdWNvK2NUTTJyaEhmK0tWL3QyVWwxY2RX?=
 =?utf-8?B?MjUvY0ZES2NNN09EWXFMZ0Fpaks3WHZzRmI1VkladHJ2Rm01Y3FrMWd2dDVu?=
 =?utf-8?B?RnREQ0J0OWExN2hmNHZKS0VWSWlxbmVUY1NiUWxjeU5xT25WV3hvNGZJMHA3?=
 =?utf-8?B?ZHlxN0tqZ0tWY3o0SklBV2NKemN3bWhEYkljb3l1K2tyakFPc21tanpKdWU1?=
 =?utf-8?B?RDRoV1VBdkNyTEJqc01GTG5lSStQaVREdnJ4ZnhvNWpwaXFrWWZGWDZ4ZnlZ?=
 =?utf-8?B?WWRJL0lGRXZPbkUwdEtNLzRIZ21jaDRkN1hTVzFvS3VsWWRkVUJMUU0ra21H?=
 =?utf-8?B?U2FrVFM2WFNVS0ZSOWJiclNqY2VPS0x2UzBzcEpkZlJjczZPZ3JoOTIxZk5u?=
 =?utf-8?B?bmxSS2RXcm1WOHZCampiOEJqZlUwQmFjWmxxbFBPbkc1NkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25KRWdqTkQ5Wkd0aldYRElCbndTck5xQzlmREpHSmZnTzYxcEhJZ3U0VUZ3?=
 =?utf-8?B?RE1XeGY4QmR3WG4vQWxSaEZrZ3p5KzJidDEyNjMrNnhNeFdUNCtveExPVmZB?=
 =?utf-8?B?eHFhcFVkcWVtQXRhM1hYZk1jN0hiQVQ3bTBBTldnRG83V2pzR3k0U3lwZUx5?=
 =?utf-8?B?T015V1QrZ05yRmpIWXRUYllJYnQ5clVQNk1DbDhzOWkySXZ3Zi9mYW5tbGdD?=
 =?utf-8?B?Vis2VEJzb0pTakZjVjlIdXlMU2dkazM0WHNkTFFGbWdJb3VTbHNrVFpaa3I0?=
 =?utf-8?B?aXk0VnVXS3JLcjVRUHdqQ1EwSVYyajlweHJmSjMvMzhjMkpaUXJIbllkbzEz?=
 =?utf-8?B?WDdiNnJsWmJJNGkwZmxXOGRaWDMrbXZ5R2Z5a09xQ2p0YjM0SlNBd2hTQWxW?=
 =?utf-8?B?RlE5Ny9jSksrQVRhWm9vQndBSnAzYmRvTEF1anJPUEhqRUdzZEV0MGk3VE9y?=
 =?utf-8?B?SGJNTHM5T3N1S2luSGRGT0pvbjNwRmZudWdxMy9hNHc1NStrRytnMUNNWXgy?=
 =?utf-8?B?cFN1L3YrOEhGS0NtaVR3andoWnAxUXNDekFCT3l3SDQ0bzQvT1UxMjdOZ09U?=
 =?utf-8?B?S2J1ckpPMk9ZTW1SaC9sS3FPRVh5ZGJWTGxHTFJYdjcrT05YbUpqWEFtc01s?=
 =?utf-8?B?bTBQV1VQdmk1ZzVEQTk5bXZ3aDJJQjE3dEdxcWU5MkhicGsraSt1cXdKeHJr?=
 =?utf-8?B?WU1OT1NjeU5YcDJLRS93YXVlYVJvTEJYL3VlWUZUb2lWVHpUYWE4SlN5em8v?=
 =?utf-8?B?T3ZnMm5BTmRJZWtnem9YSElRM3NVKzRBZFU5RGg3L0ZRVkdiRVdaa3N2bitt?=
 =?utf-8?B?NVpiRHAzaldnUlpXaTIrdGxGSFBTNThkNitFT0tZY2ZlaUFsdFJta0lUeFc2?=
 =?utf-8?B?N3BvbnQrTkhQaFNDRkJ1WFhUSXdhS1RPUnZOdTZCQnhXbm5pSHdoSWp1eStE?=
 =?utf-8?B?VGo1N29Ob1FybmtsYklBelp0S09kL1N1Q3BJZXdYSFNXYzBoMG5CeWNpWGZy?=
 =?utf-8?B?T1VoRzV6bjMxYXlLbm9pWUxKQ2twSTk1MWs1RVM2bVkrSDdxR0xzNEM1eDRl?=
 =?utf-8?B?WjBZaUZ3VVVGbURCQllxckdKOXB1d3d0b2U0b3dxTWtROVF4WHpVY1hTZDN2?=
 =?utf-8?B?UHpoV0N0UTJHbHJtOFRIQm5TbjdNSFQ0TER2NjEyK0R3VE9qNEpPN0xRdEhq?=
 =?utf-8?B?NjdLTVUxZ3kxbVRZVUo0R1NDTHpWMFRZS1k2ZWxWTkMwMXh2SUw2aFFDYTI3?=
 =?utf-8?B?YUU2REpnSHJvS2NWeC9ZTXc5TEtYZDc2SmtxbWgvZ0k1S2tkQWl0d2d4NllM?=
 =?utf-8?B?VUZJbit5aFQ2MmdUd2UrcmVFQXI5emlZQnB4OWVtNnRtMmtCeUJnQllFM3Ni?=
 =?utf-8?B?dGhqeFNJakUwS0ZwYmE3T3FxNCt4bk4wRjZrNXZ3Wlp5RXcxT2l5NlQ4QUNX?=
 =?utf-8?B?dlhBb3FVTUhWcEVBU3kvbjFVZTQ5dC8vT0hFK2UxcEFVaDVaTTNCZWhZWGZ5?=
 =?utf-8?B?eHlYblNaRjVPbWR3K2JTdFoyNU1QVXhRUkFuQ3daN2oxMjVIL29JSWwvWDZ5?=
 =?utf-8?B?anhhMWZvUlZmMjF5K2VyQm9uM2JOSXhMeHBscE9SOFFyUjlYNnIzTGViaTdn?=
 =?utf-8?B?M2MyVVdHMkxKVHRBYWZ1alViTU1TUnlmQzljQjFMeGpHeXpTeHEzajdtZXQ0?=
 =?utf-8?B?aVJXWTFLMkV1SVpJNnpSSXZaWkRMaE5yQjF2NXJnSmN1c2k5MWlNcW82UTV5?=
 =?utf-8?B?Q2V3VHRWWVllQ0ROcXB6dW5YV1ZNVlBYZHhxem9WaVZoSGxwdXlxdTltTXJv?=
 =?utf-8?B?Mk12dWNlY2pyUXhNbXRrRTBJZkNMY1d3WTJpQk1nWmgvT0VuWUtMZnFRWm1G?=
 =?utf-8?B?WlBtUHcrODNiK1J5MDFQWXQxUjBwTFordTNHVVQ0SXlSbVJHYjNDemVtRStZ?=
 =?utf-8?B?Y2FwY1hSZTBKNVYrZi85OXNBZWhpcndsVTl5MjJCbzdlYmh3VHo5NHBEOVRU?=
 =?utf-8?B?ZmJkVjhFUjQvTkdkR0puTDEyb3JjUDNKVE5KbDg4RmxkMzJXeXZWalRSUm1V?=
 =?utf-8?B?SDd3dW1Wc3U3UHorREhtYnlkNTl5YTlLSGYwcjhySFExZjA4YXFOdml6MU9K?=
 =?utf-8?B?elhUUUVDRjNnRnZ2eCttdmEwaGM2amkxcXNXdkk1QUF1QUpHamM4R05KZW1Z?=
 =?utf-8?Q?BL9sKAg3S6Cy4+TX6YzFCZ0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd7d902-5a10-4abf-6434-08de0d83724b
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 13:45:34.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osdfEw9yIPE7i6w91mvdnQDBZ6ZYtq80nRPr3U/eRTd6Z2C+glA5j60LRU4thf0OJ4yq3QWwcskRr4wCDEPO+PYL8iwjwW05pMhfWs+gVSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB9467
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-17 09:41, Mathieu Desnoyers wrote:
[...]
>> +/**
>> + * get_user_masked - Read user data with masked access
[...]
>> + * Return: true if successful, false when faulted

I notice that __get_user() and get_user() return -EFAULT
on error, 0 on success. I suspect the reversed logic
will be rather confusing.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

