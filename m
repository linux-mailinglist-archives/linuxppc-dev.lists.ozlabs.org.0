Return-Path: <linuxppc-dev+bounces-13443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB75C15146
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 15:12:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwsl167Yxz2xR3;
	Wed, 29 Oct 2025 01:12:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761660733;
	cv=pass; b=TIDiQ0GVcKBbCJnXurJ7GWl2gCdtZD2HFUZDYcE2RX9ejijf6ONUlVVzDKztVlahIyAgsUnSLECWV/M5YkdY1ZtgidqcbH0Q3YTrv/g2c1VefUF+mrpET0b1uKvYIfly7+oV3YtyP2n5CK8h5ncC0uO/JDks6xutVc1IIbS5aFHDRDDCVPcmRTn3LLhkc4+gMmqK50TRYrpm5RERAyLJVrUa6puf25eC60+WmHgTZ3W6beauVY+CNnXRzxxABQoo//MoaEg6M9sfksKkd9iBQoCKKQot+p5R3sTxWc2XrMahjFV3PjV2ND+s+SK304XsFzc/OzF5GJxLJFNNkYOLhA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761660733; c=relaxed/relaxed;
	bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JH8eogldLTMFksrm89BSsf9QPCCPwV7FoKNZGzj0YREGulr32oCqHpMQuF/onOTH+0Tge8XzM0ooih4uALOypYEJFtW5XoaKMKG4ntZwXo7X4HqyXLroPpOwqkH6gNv9SUtP3EN6pTQH/8ekmqrTIh7/f6U64wKueKf3faf5zdbv0DI45k78Vv6yZCcYgMzwPJ1tOTCKp+YdWf5sdFrlg0sKdLPXzpaHeYeK8txEsUATeGwJTxcvj95I8zIwMKpHoXkGBxgPib7scoGTxeM2S9cD2maE4IUmXXv+fdZV+ZNptSFE8sb6mZN1eD40zozXgxrtP1cC+3/0mbI2oeNp0w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eMHtqJAy; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eMHtqJAy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwsl04YW0z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:12:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scqSkGXA3DO4DmZ0XJ5EanOWAyYU9py0/YAN79eoDQgQI8Ym4elsfX1ssUgiTSUnW/t5PicYHb1i2XLeysqNgaj90eQICE3ppRmsVJLth388CgaA/ZN1bpVtYdZw+K4hQ6W5vrCmWKHc06r6Y07QHILpHqNoB4DikJMmCwAVnV9BJqKGNNfDqW+h3rSySexOtp2AMKOxKCnZD/zPeuaurwIZuwvbUOLq8Q0W+K+VI9JUjlBy4EQjGYfpW5N/vPdUGW28F/L09F7ZPZaUf7NakZgKj4RhE0W1clx017bb6JvVlmP5QAOlb0leX4V8/do8PAHk9VO60zJYry+WNvOd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=;
 b=Zw3FS61neI/SRlqkr97XZlfJVtdN5mGsORE0YwhDJQbWCw5topTaxDBwN5wnu8Ab9KpyQqeu8bs/N8CtM3pOLnUsGoJYXinW7QUpPle4I3WsZYanu/btz5TEgB35FFVhBHAFT9iXpQm6QiKsODix7uUtrwBtmBIvT369IfaboZxiyT/EWtkQS3WX/xUPXtzlDhlOq3B4HNxjyQtypROzPPeUrJXmr5MHbQP4ij+GGF2oL5PxwMEk94nyVakCI8Mru9UNjU+T6wbaCreLYztPQOf2+1UqjEc6+ADFzdMCzef47aYBW2gY/mqlmGmwQWE2UCpKoIBHg2DiTFIYWWBjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3PhbknjB4rowKoIAFN9ZBuKLVF6qLMdZ+tMOcznx0k=;
 b=eMHtqJAyBUs6oL9fNdY74EjUPzL3lMKEhDTC4ULoplnccEPTJ6ODwrml4yLyYb5C4qwiLCoqUzM/VKNwNNm4mKwoZdGU0ZDu+kQBx61SHvcEN4NU/mC2PiAhrgRqTJ3zHId2Y6p7RErjRLZSP2ApltvJ4NIzkRXBdN/hnH0XzU1m1dlYELv2kB4tES9YfNjiH0JEOWRVAsqdjvtqvyv91HWH85en1bW3m5pHy6WZU/yD5BCC9TU+DjhZcpeuso/U+e1twZknZGecoylarSbpMLeor4iP9XKBwrf+A5Huo3NIq0L0QEt+Fm/iy8OQjFyigWUDoIH2wEkIPmlOC36Otw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB8789.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 14:11:47 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 14:11:47 +0000
Message-ID: <561981b8-4d30-43fd-9deb-47b776f1b032@efficios.com>
Date: Tue, 28 Oct 2025 10:11:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 07/12] uaccess: Provide scoped user access regions
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.546420421@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.546420421@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0384.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::13) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: ed607d9d-b573-4aa1-6d66-08de162bee19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1pmbjBXUUhHQXVJY255ZVZrRysySHg3NHY5U2NjcVNwZkhjaE1rQ3pnQ0Jz?=
 =?utf-8?B?Qm1CNVB1K2V0SFRwT1pBc0IrY0p5ME5nd2d6SjNiTHZSaGs3WThwK0ZNN1M3?=
 =?utf-8?B?NDkyTWU1WHlkMjVCUnRLcTFHUWMwTnRTVnpmT1N5dm5DMEJkVG51Mkloejlh?=
 =?utf-8?B?aFBsRlNtRktTRkZHT2NzVS90aTdzbDlZaktIaGlZNzRKaFBtNzVod0dmNmdF?=
 =?utf-8?B?RDBYVjMyQ3NZWGYyQWZFdDUvSWhZd0xuclNGYXMxQ1hmMmRnWFlKWGErOHdP?=
 =?utf-8?B?VHBLUGxDc0g1dWRtZzh4TkhNMndUQy9mMVJDU1kxUkVaSzVmRU0wRmRmdEtx?=
 =?utf-8?B?SEcrK0ZUZ1ptRWVhc001SlJocXJYNTNDYUQ3R1NSK0JDejQyRC9TcWF0cU4v?=
 =?utf-8?B?USt4clpITWZlZTRyd1J2Qm5oaTBQdExSZkd1VXE3N1ozdFRONWNQbWxTZVFH?=
 =?utf-8?B?TmtpNkNLNUlaaDVBKzhGdGxlRGo5SXZWNlR5S2llRFA4WXNQRzhybjBsWUNL?=
 =?utf-8?B?SlpGKzRvdHdtTHhxMXR2ZzRiS3RVakxDc2dOTzFlTitiQnlPMGx4ZXUxMmhK?=
 =?utf-8?B?STNIUDkwUU94N1EwZVpwbTJ5STlYcnovOExxTWxHc3grK1Q5aGpCaVRkOGRH?=
 =?utf-8?B?bnc1RVRpWkxyd0hiaHRYQjRHZTZQdENhUGJPUG5jeDFPaGZySEdUUnJCUzlP?=
 =?utf-8?B?Qy9tckRXc2t1Mkd1L3k3ZGpIU1Y4N2gyS0gwNjZKMDNGT3JLUnZYR1lHYUNq?=
 =?utf-8?B?bUlwTkgzS1VEMDgvUDJhV1cveGp2WlI5TUVpSVRPWHJmVWRmeFhSVVRNczVl?=
 =?utf-8?B?S3pQY3NzbmZjZ0dHMmpvNUpsVUtHb0RFUk12djR5YzJFQlpQTXdIem1WcEh5?=
 =?utf-8?B?aDNkcHBTbjNZQ1Zld1RJOHRNTmMvWmV4VjBObjdEQmJ6THlqRnUzYXgyVUox?=
 =?utf-8?B?ZHQ2SDErTktQTGliOStGMUdkdURScFR6YjNsbFI0OWZ1YW5uVnNwK3BSWEow?=
 =?utf-8?B?VXVlQ0RNUEkzZ09WVmp1Y3FLcmdYcndEN3kySDVKQXhHU1hKci9rZnRmOGZO?=
 =?utf-8?B?Q1RuUVAzdkQyYUlnakdFQ1l5M1ZXMkJTMWJyZUx1MUEzRERiVG9kNmpFS042?=
 =?utf-8?B?SGpHdWh6Q21VY2RYSXJLTlJtSVA3ekVma3pSQ1ZIS0JsdWVLQkJmRGt0cDE3?=
 =?utf-8?B?MU1SR3NPNy9aaGJBaVIxNm1WQUwvS2M5N1JJK1hNYytiRk1nQXdDeUI3ZjBx?=
 =?utf-8?B?UFlXRnRiZHNCWmVseTJ1TW1VbXdURkowZ0RtV3o4em0vckJFaXFzQlNlMEhu?=
 =?utf-8?B?WmtIZEJxMVFiZzhvdy9KckFXUE83TE02aDAwd1JzL3dRdkhBWDhseU1TYnRQ?=
 =?utf-8?B?aDF3OVNPWWJqNlBNWTIrZ1U5TUdXdURWRW9qZ1RKVGZrRkJVdk1zSlNrWWtr?=
 =?utf-8?B?Zkt0T3JBZm5FUWhsM09za29rby9FeTdkU3JibUxuVFYxVWhQNS9Hd1QyQTZJ?=
 =?utf-8?B?SGxIalZFVFpsZHRGaWIxNzBhN1F3NkpRak9YakFjU2hvb0cvWjhwSDVXeWNS?=
 =?utf-8?B?TkRNK3Z6bEtjdVNxY0hmZHFUR2pnRC9iazkrUG41clpQYU1nRTkxQjRvQVVk?=
 =?utf-8?B?NWhVL0w1RG16N2VXWFg4Y1RxdmpLTkJodFdCTWlNTjZLbzRHUVBsMy9Sc1hu?=
 =?utf-8?B?c0dqSUpITmNXclcwTnh1R1VQOE9hRHUwMk9oelVvaVFnN0VibG1yeURmci9X?=
 =?utf-8?B?Q1JuVG1ibVhvM1hNWXR1Y0VxV1FCSk9iejRDNlF0UXJETHA0cHh6NWtIZmRB?=
 =?utf-8?B?Lyt1WVE1NnNzVHRKb2s3WFBqaHpyMWIwdWxmaXVNVEVoRXhpdFR4cXlEYXpX?=
 =?utf-8?B?V2RxMXFkbHlNMExrNWdHM1dBOXprejJtK3A0YnFoMUF6NHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vll5OHFDSGtyNEs2VWc5UkE5dFFYUmxrWkF6bDRpbzB1eU9ySXdsdFFNOVNa?=
 =?utf-8?B?MGhUQm9DOEZ4VktOc2wwTUM5eDc3NzNPL1dmTG9nWko0RGN1Y2ZxQlUrVmFN?=
 =?utf-8?B?VjR1MTRHNE9zZldWaHpWa3Nhdm4vcEk0OEZrTUNhejhXMmZIV2xEdzJQSWc0?=
 =?utf-8?B?emJpOGVpdUMrYlI2OWRoQ2NCSFNkUzd0UFZ5cDREUElaS1ZrRVdVVVFiMEZP?=
 =?utf-8?B?amZrZWpCSzV0a1lCN1BpNnNNcFR1Y0FGK1Y4MUVEU29URzF0TFpwRS92aE0z?=
 =?utf-8?B?TUtGSnVXczhxMk44Ymdib3JvWFJiV3Y5cXovQ3pHQW43MXRVNC95K09GMndV?=
 =?utf-8?B?dmlPVjMzNWdjWXJXZkJyc2RhT3hGbExiNXRVUmJtaytqcnJVbG5DS2duMm04?=
 =?utf-8?B?TFprVGhPazdwRHBWdUhWMXk5WXFHSnlUQUpxcGFvWEFuL1JzWi9sYzJnaWZH?=
 =?utf-8?B?eDUvdkNnZ0FCR1hTbm5jemE0d0Y0RG81ZEl4cUgvSGpqTkNqWlVUZ2NBVktt?=
 =?utf-8?B?UXdaNkVqMjUwVFFONGJTZVhCak0rTFZtaVltdDZWbDI2KzlCWUhUQXl5MGdQ?=
 =?utf-8?B?c3lRam9WczdIZ2JqeUhKclVUYmNyUWM3NFdBZE9ISTNxeVhDU2h0UGpnRjEy?=
 =?utf-8?B?MmppUVo4M05xdkF4U3hBbzRKYkxMNmpLS0tlM29KRHRTMlYvQndNeXFDdHlL?=
 =?utf-8?B?NFF6K0ZUVUkyMHhESCs3aGduWk4waFlIdllFb2FSTEZicWtJNnhncjVwaEZ3?=
 =?utf-8?B?akdNTEoySUM0dFBjdWxsUHI5MENSWDVXUGlVbjFlQ1NXVExqTzcyc0lacWNB?=
 =?utf-8?B?bjFmRktrOVY2ZVgweGlyTmFYcnBmUXM3OFlvblBIamRCZVJhWXk4VHY3MnRR?=
 =?utf-8?B?VWkzajBrMmpwTmtmYXVkT1RSQzV3bS9JSDlLOVdQN1FMSWNNZnR0b3M2UGR2?=
 =?utf-8?B?YkFNUm5JYitRNVFlWjBJSG9MY0hHK0VEdzgwMzdzaGdSdEMvQVFveS9Veldk?=
 =?utf-8?B?Tkg0b3VFcThqMFpzaUdsZlNXRGVaVVBCWW1ocDRxSEtVbXR6SklNMlgzenNu?=
 =?utf-8?B?VVJkSjB1S0tmS2Q3SW9Tbm1zamo0THFldk5WVVdyZ3FETHNHV09nTHN1UTJm?=
 =?utf-8?B?anhCcHp2UGErYVBPSWlkaUJ3N1dRVHBYSkxHcytKR1BVeURoTnYwMGRFaHRV?=
 =?utf-8?B?RWJtM1d0SHMzTVZ3UUtKbVpiVGg1NVdNWFZHU3MwQ0t1ZDlPUXFraHFTbXhv?=
 =?utf-8?B?Yk50NmJrL1lXUzlSVGcrMG5WdksxMmtDaG95N2x0M0N2cUxORlNwdFdGenhB?=
 =?utf-8?B?V1ArSnB2YmNINHJIc0Vvc2Y4cGRXMHpwSzg1U2RJbHM4eDJseGpCSTRpbmsr?=
 =?utf-8?B?YkZ2UkVucVhGdVB3Q1V0TUlMbWlWM3JGQ3FzQlpxMFBvTnEzb1N2SXZ5bE1l?=
 =?utf-8?B?Q1hqc0NEcDZNek1lbzFaM2h0Vk5hMFF4eVJ6K3RsRW93MnBZbmVCSkxBNTZL?=
 =?utf-8?B?TVJqTUFIVmpyQmxCcVFFWFYwMC9HZmIvNUJYUmd1Q3paTGN2L3RRcjk4MGVr?=
 =?utf-8?B?YmVKcmlaRXVHaVE0cDJ3VjkxQTdiUmRzVnRyblBhWnFPWDhPUE9DOSsxTlBL?=
 =?utf-8?B?K0NOSUt3MkVGMDlhQ0FQaGpmYVp2Qk5peTgxbkt0NnFjTVo3S0NPeXVVRGMz?=
 =?utf-8?B?TTJ5eDZNQ2JFa1VVZjRjT1NhWnJUTFd3M2tpWEhZbnFRaWxRdHpZN3JCVi9M?=
 =?utf-8?B?Y0FzZGtDNU5ZempPNHBDaGVJTHFNMDVTQzEvQzNFQ1Z3Ky9MMTFjdlhFaEFB?=
 =?utf-8?B?MXFSZ1VrcWE2d0NoUDNleUtqNkZyU1RHcGhKKzFzYWVMb2c0SGtlVUpoZ0h4?=
 =?utf-8?B?azZPY3dEL0NGQkQzVHFxZGxHcW5wU092VHlzd29SQ3I0bVEyYWN0bkpBeE45?=
 =?utf-8?B?dE91TkR6a25ZZEdrM0FlZkZGQ2w5NUxNZnpEQUlORENpRVE3Q2JVUkJjYXFY?=
 =?utf-8?B?OEI0bDR3S05iRURyYTBwWjd6bjJNc3FPK21vdGlsbFB5UG8yNG1DMkN4UUEx?=
 =?utf-8?B?Vmg1RXJvVnN1V1VnaU9jeWdIcmJ3SzIxVVRIQVpnSDdRcjlCSTdFbkMxa0x3?=
 =?utf-8?B?SHA3cG5RVTNZMWJTR2JHTUtNQjNjbTJJRWRpM2sxd2RFSGl6Sjdtd2tCS09H?=
 =?utf-8?Q?l00KehbBiwEdiI+YOtDxL/Y=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed607d9d-b573-4aa1-6d66-08de162bee19
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:11:46.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rv1hT0w/RvoPm9oZmw0lS9vOIR2JaOk2dmRUyj8KbD2OqJiBAtgDQ0K6+IKTjX/fhDGpgZ3xs4EEUsngy2Z3ieSEgsIzKs+MwgeLFFu9DCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8789
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-27 04:43, Thomas Gleixner wrote:
[...]
> + * __scoped_user_access_begin - Start a scoped user access
[...]
> + * Internal helper for __scoped_user_access(). Don't use directly

"directly" -> "directly."

> +
> +/**
> + * __scoped_user_access - Open a scope for user access

[...]

> + * can use @elvl or a different label outside the scope, which requires

elvl -> elbl

Other than those nits:

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

