Return-Path: <linuxppc-dev+bounces-13445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535DC1526A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 15:25:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwt215tXxz305S;
	Wed, 29 Oct 2025 01:25:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761661513;
	cv=pass; b=IAjN6q6q8M8ULF4xmCcpZDa6CaAnnG++YEw8MJNPDCgzOwqwIPaHW5FKvvxcLFUvtKHG1RhLVP4qWZVSVftN6qEIMoo7KsqblUmlXodUsHDxMqMnMySCKUIEA07OlupLDe/WPS8SDk34r/w4kMIu7Ns7zP09aWCjnGaSy3Hg/tH2kjUemzTvZtYXfoPadSmhpYz4ZeeIRk4zXgh+FKPblugi1QYntuUsKz6CdRB6D7XIeAKQfu+h96ha4mXisKWnALemW0n5jIcbVXbx/mfCH2XtXjdam6jGdOesbPg5OnCI2Gl7R/QKL4F+155253VhsxLV58bJqj82eAojqX+RIg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761661513; c=relaxed/relaxed;
	bh=ZcGwAUSPiRO+unlWLvVjeAjqhSIKFvHIsZ/BTGa1ytw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XHoMGDFFd+y/QBmRz2/lKGhVTGS5UBjxptgQP8JpD7xZIbQBh5UdO73vqHcPe4C9tLbB+wvd4AIIXuOYKdUFxiXhHZCwXmFlvfnwA0QBzS72ER4QxgL/XGd6PIgYGyYG37MdylTRgHEbDGhFYFLbEZ1GUvD+vD6bL3dWAQ9c9uL/96YO415Fap/Pr+h3NteLydvYycmIYQ0PfA0hnd4xhZwYw7rlRZgE/azAI5LgFF93eXWZ5OUfLLxXmjYixKaHWgYKY7LgsbKexR4hX0YaJB4YpKZ9N/BgmJ6q0u0CMPniH/XNwdOg1qaf3DlYjdTp23aPdHu1uO6d1+eAURM0og==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=az+1/ub/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::5; helo=yt5pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=az+1/ub/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::5; helo=yt5pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170110005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwt204KmGz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:25:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myecyUjZnLwgm4vHSMBI57YSci1B5tUKWAipGnzqZmHoUJElVIcj9DLKawzWzxJ+Mk+Tv/t/5Hi2IqjMXiEiyhC91EQzw6ecdVUC0EE0cBEaXzkVS/NO64qr7TtcUnN9FKTGVTeTcBjCwAQmTX0fQ7vKEon8oL9HnewpmEiFts65hBnh7mBcXXSVRQLfybRdlcIKYwE2tBJXz5ZXzq6mfGEc8EXTK9ofwhFflS9vDkTnbPnUHdDRcR27+d5iGIt9p4Wegy01D26u6nBpSI+y2jSGAGIBXWgSSWvIgVbAG98+NtDOZO0r/lLojHCL/imOFRSoseTKCEKbVOu7cENFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcGwAUSPiRO+unlWLvVjeAjqhSIKFvHIsZ/BTGa1ytw=;
 b=cPV33M4NFm/KQmuqDa0jSzGWjK271Npywt5xXPodHWYTq7LW5w2h/Dj4QMooqeFYH+4u8UWf6BPIIj4G1B8YWL952BHFSdQ2wzeZ97JNJZ3NAs/Liv5upvTQCH3oWlrzTvIa28NuGmojySALuGkKs5Xdy3jWvLq4kYY4x99Gk3IkjGYqeKBGfqTJqN+g+l/DHtTk5sxz0pyhoH60N6gnVXUNf+cIOwJzqu96Egsg9KHUJTDmUucf8iBjg0vRxf/IqHw3EOoBVFITwInU6fxDXtGSUS1TaY3dyrvSwb1ktUCQloU1KugDMpLUs7o2lG5h82q3B3FoB73QvWEKOLiZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcGwAUSPiRO+unlWLvVjeAjqhSIKFvHIsZ/BTGa1ytw=;
 b=az+1/ub/CXUB5oqXIL9giJZzbJ/FX8o24MWlk8FaekY/2geOGJ4INZ+87YX3xe/JAULAiVRCWCo6atqXaksu1uUjUy/QwGyg96XT+UjxHv4WxFNa4WyNbPdY1NY20S322QaHgGTQY76HOwf7dEJpIaPHcgZclC5ONSQGw56sYmNS+CNav8qI/hzsUZIATLXLn5YahXQBTKUGmuqcWhBhXUiTPUj4Bi6EnCK/K48VJSE+IELZ71G1Zy/jblrs/CmYLyUOeKe4fP3M4DlbXHHuJVYQHtJuvF91piaApfjH+qUHjEwdYw8DDrHRyMyP1Nzi1G+TWFK2d3MjCysbFVVx5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB6062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 14:24:46 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 14:24:46 +0000
Message-ID: <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com>
Date: Tue, 28 Oct 2025 10:24:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
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
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.736737934@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.736737934@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::29) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 028e8cf7-a624-41e1-8139-08de162dbe5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVdqajBHYTFkRWNUS1B6TlluRUkzR2xMS3JXeUROVGhkL1ZCbnc0cExlVXlx?=
 =?utf-8?B?Sms0YjRwdDAvM1hHRWxxQlVYcStJOWZWcVB6dFZoOGV1U3J6VlRUUUxMdDRZ?=
 =?utf-8?B?eHRvUGk0OHVvKzJreXlINTEvQkRWVWZQVThBVlpWNHl2aDdtM2x5WGpkT2wv?=
 =?utf-8?B?SEpwVFV2Smg5Zm5lM0kzZjNtTlRObVNDYjdTc3ZmVzhMZmZocURNYk9vMWw0?=
 =?utf-8?B?bTZlTEhCblQ0Z21TbGJSOXFTU1VpU05VeHRQczdpUnBRR1FhakNhM0VNZXkx?=
 =?utf-8?B?dXZlZkl2WTNiT2s1Q1B4cjJsVTR3c2xENHRCOTEvc0JLZ25YNElqdVFJVWJq?=
 =?utf-8?B?YUJTbXZFbmhDODRoTXJNTzVIT2ZGV21FOE9Ib25FU3dZM1dsOUY3ZVJpb1kr?=
 =?utf-8?B?ZThRNUhzamZWZ1pZVGM0bTJxYlNrYjRZbHp4TGJSeGF5ZWUvT3ljbmNaV1Nz?=
 =?utf-8?B?dVMyc2xyWlhqSWhKZ2NhazhBbTVTajU1NWdVNjJTRDNHdTdManJLSmQ0L0VZ?=
 =?utf-8?B?QWMvNWpkSzd6Q25ZaXZTSmhCclcydkxVODErN2YxaVo0dzFmTEh2TTlNeisr?=
 =?utf-8?B?ZW53SFNmM0dtRStndEloWDFabDF3TGdZd3VPR2IyMUNOazB5YzdwZnhBOXR0?=
 =?utf-8?B?bkhwVXpaa3dlTEJOak51dkZXSzZTYWYvcW1Vcng4UjYzOWhHOEpBcHB4bU1p?=
 =?utf-8?B?Vmw2MWUzVHVxVUd5UTNLQ1ZkaktWckxJV1JvbTFJbWo5bS96NldWMWhrWHMw?=
 =?utf-8?B?VEdYN21Yd1Z0WGMyb1dycTRFS0JCMi9OMDdBWFhNTzdkOSsxNm1xTDZnYVBx?=
 =?utf-8?B?aW1FcHdPVW9aMGN5TXVPQXJHY3JMa1B6TEFhK25HN0lYajhkdS9uaFNmQStK?=
 =?utf-8?B?eGFNYU5rcDNMTWZkV2F2R2VJZGlSUFhUelU3MVc5ZmNiOHExZlM5RktLVzFU?=
 =?utf-8?B?TFVZOG5hTFcvUU4xekx1UFVpS2NaTVAzeHptZXQ5UmpybHd2TDNHWjBld25G?=
 =?utf-8?B?UU1UOFpNM3Vtbm5jbVdNU0g3N0V5UHAya2gyUTdwWCtkcVZKSkk1L0p3RUxt?=
 =?utf-8?B?b0o2YUR1R2krVGNkaDlIenAxK1NNajUwVlQxd0tMeGZmVS9rU2Z0WnFaZWZM?=
 =?utf-8?B?NlAwZTFPcUNVL25rdVJvanB1b2pVSWpVVEtOZ0VkS2JkSE9FV090WDBpalA3?=
 =?utf-8?B?d3d5NEZvU1A5eHQ5NWpFTFVYc1g1R2JVL3NjekpxdmxvWGlSK2lLdHRrY2hH?=
 =?utf-8?B?bmcrTGpWV29YYUhLa2VUc0Z5MXBTYklNU1Zod1ovUmtiVVJxalI0VDlJc091?=
 =?utf-8?B?aDFERkZGd05qQ1Z5RS8ySUhaUjlJN1Y2Sk9VN1ZrZklCMTFqb3p1YWZXQjhN?=
 =?utf-8?B?OEp0VjRaSGZLNmxqb2pTK1hBYUQ5U1pXU2tldklhTzFmTExQWmZwdnlMem5K?=
 =?utf-8?B?cytCNlU2SHkzMzFqWStrdWpmWTJYM0tLOGgxY1ZiMTBxWFhRRjg3WW1PLzkx?=
 =?utf-8?B?ek5UUnNBRGxENUpaTU04VGp4YVNwMjhqSWRXVVZzM05Na3JXaUVyYVVIZkdp?=
 =?utf-8?B?NFFwczhjTHBKZmNtWDRnNjA5Ym9Zelg3RXZpM3pYM0FhaDdqOFkzME5QL3dG?=
 =?utf-8?B?aFk1VklPNVF4SExnQW9JWXJCUHdrRXVMaFFlUFltcEpVSWZ4Mi95MXgxdFdG?=
 =?utf-8?B?VDRtenRFQU84MGFPU0U5Wlg1eFBIU3k2aUF6MFhzU3pHcWIrWVllcmVlN2dO?=
 =?utf-8?B?T01wNXo0ZW93L1crTFlKUExoU3MrRTN2Z3ZCSXJKZzlFWWZ0aDFXTXQweUxD?=
 =?utf-8?B?NmxwdWFNUE5hRjBNUXZDSGJiTTZyM1hmMHhiQUpGMDJlVHZTT2RpdnppOFZY?=
 =?utf-8?B?SW5GZnltZ0NXV2oyazBxT0lNN2UzMmR3SzZFd2MycFpmS1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0Y5L2IrUjN1T0liTkE4emhBK1VWRDlmTVlKKzI2R1dNKzV6NXRjT3J0R2pC?=
 =?utf-8?B?OHg0WFVuQlp1NlhyeHdaU2laZUI4NVNCNnYzMzZMUW5wTlNXYTVkbmhrWTUy?=
 =?utf-8?B?MndBOWFnMTZQQTZ5b0tYR3dncm5zeG1YSXd4Q3IwamhXaEZWbDV1eUNpeDVk?=
 =?utf-8?B?THkxTlc5SDJLdHZ4bFZVN2lpV0c2YVg1MWgrRytBNGw0RVBLdWhoWkErRmdn?=
 =?utf-8?B?RU9jckpPNUJ3dG9ZRWpoeExkV2tSMUJ6RnBZelQyZG5EQ0xnU21LRDBld0o3?=
 =?utf-8?B?MzRvTDNiNW9BTGRjVWdLNkV4bGhzR25tU2dvNTFNVGZ1bEZ1cnRXcWRsY0do?=
 =?utf-8?B?TmM5Q1ZKdnllZ3hzNEJnMUMyeUIxWnQ1ZG03S0RIMUo1NDZmNUoyeWRVVENJ?=
 =?utf-8?B?TGhRa05xUVRzZlpLR0RBOGJ1Vk5NUnM2Z2IwMGlKQm9GeVljcDdIdXB4WFZp?=
 =?utf-8?B?a05ZZENuUlh2NEMrdkorL2VEeDVPTzFaN3VHTCs2VnNHOW11Q3U4T0MybVV1?=
 =?utf-8?B?YW01cVJvMzRVZGtmQ3djYnJkcU5JTWo3WmlURDNabEQ5b1BrUW04S3ZzR0Zj?=
 =?utf-8?B?cFcvOE1UZk1XWnRMSFY5MVdYb0JpZnpYQ3lEampTTmwvNW1vUkJyMmpBSmVG?=
 =?utf-8?B?czdVNDMvVkQ4VnlDb3FNRmF2N0tkdkNLVVFCYXdwUWVKRExoNzBXVmRDVHdS?=
 =?utf-8?B?NXBVaGpHSGFmblhMWmYrUzRmQ2cvYlg3WmxQbW52QnhVdWVES3NsWXl1NThs?=
 =?utf-8?B?cmZkWHRqMnZERHgyb2YwYkF3QnRSR0g3K3B6WUFmTDZReDZWVFEwWVJ5UTNl?=
 =?utf-8?B?N3A2aG5BK1RtcFB4c0hYSXZGUnJNL0NFSDNlOHR1WXZvMklncnhuc1BHUDZp?=
 =?utf-8?B?WGk5VERRMlJiazA2Z1VxdzF4OStDdGVaQ2JjY3AyNnpINmNBZ0hCaC80RTNG?=
 =?utf-8?B?eSsyQzdxZkFSN3lnWVVBcHpvMXlkSTNJUTNDZEx6R1RxUmFnOE5wYVo1U2NV?=
 =?utf-8?B?NS9mOWFUc2JYTWljc29BTGw3SmtUdWl1Myt5alRRendTWkNsQ3hucWgvc21T?=
 =?utf-8?B?Q1ZmWHBzMUI3bnNQMk1ldmpyb3pPRndWQVhGQkZGUHdFbEdPWWE5T2xxREti?=
 =?utf-8?B?QkpjWXBOQXJ5T0IzRzdQdGFOL3UyQmpNWEsyT3QxODRzajM5aklRUWQ3MEFz?=
 =?utf-8?B?QURoV21mZGRFeGQ2YWJDL0V3TUNnbVpTVUozQWpnWk9QeEFDUHlXRlE2SzR5?=
 =?utf-8?B?ZSsxL2VYUlF6dmVCY291UjVqR2lvd1NvVGx4OUdJQzN6Mmt3NFAzSTg3MHFq?=
 =?utf-8?B?cUtZV2dCYnVwbUp5NGxseFZ0OVVnWFlKVnB4cGNoTHVncVBRbDNvSEFrSkg4?=
 =?utf-8?B?ZlIyc0pGUlBqQjNrRVNKMEM0a2h3Kyt5SXJZb2Z3MjdvQ1J6Z1FoaHgzQmpv?=
 =?utf-8?B?MUNwQkpPc01vUzgxeUhWS2RtMTl0OC9LMm9kbUdaYUtTRFNibXRTQVB1TTF2?=
 =?utf-8?B?dW9wd2N5Q01yNmsvanJQSFVya2FWemZOZmdCc2JGVjBpQWdESmkrd1hxYk5B?=
 =?utf-8?B?VDlyQ3FZRXl1Y2l6Vk1lV1V1ZWpsNmZPSHM4NlZ5dkxaVTZpZDZmSzNGUTJS?=
 =?utf-8?B?TFFCZmQ1ME13NFd4OFZmdDNpVmdINUJkVnUzdFV2OWRWckR1VlRCQ3krdXZ2?=
 =?utf-8?B?RjlqVWZtdlNPVGJVSndLTHV3ZUx0VDF6cXJvQmJSaVJuRGlESElPZDFmOTU5?=
 =?utf-8?B?SFN5VXdIYVo1ZXVLVXpGb1hHanlHaWZ4VVdZWnBLbTZLa05YOEptRjJ2WVRE?=
 =?utf-8?B?S2h5MlpjV0h3MElpdVdpalFRVjR2S3JhNE1PczFCKzZXMGx1dWNlbWhDV1FX?=
 =?utf-8?B?aHdwSzdTelArejhCSEhxRXlwRVdrQzhhZ2dSSmMrcWh0REgyQnBjTXJod1lV?=
 =?utf-8?B?N0RHYVY5RS84MlFhQ3VkZWFiUWJkK3ZNS3B5VDRBUkRvaFBUN1ArcHZvdEE1?=
 =?utf-8?B?NVpKRkpqYzdkREVDNVNGcXQxYUJ0Q25lMlAwYWZUclF1OGNKVDhjS2J3MHRX?=
 =?utf-8?B?Z3VqZTMwcFFTSyt5eFhxeFFVbEhOaEpRUmFxMnZZRlIvYnA5OFlKZm13a2F0?=
 =?utf-8?B?aUMrYTk2R3ZrL29ML0JKS25TT3lMcXJkTFJzZVcxM204a2JSQmxablh5UlJR?=
 =?utf-8?Q?pCbWyXlFuL+2mEnAjUjw4W4=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e8cf7-a624-41e1-8139-08de162dbe5f
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:24:46.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnVepAzm90XoyWqyBkPf1S+CmK3a7BLLelBoMh6lzGSl7Onz2qE7KOA/KOym39zA7QF4HmVUGDGxIgYS9+Rdth4YxGmX1/yUpB3Hrc1biIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6062
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-27 04:44, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace the open coded implementation with the new get/put_user_inline()
> helpers. This might be replaced by a regular get/put_user(), but that needs
> a proper performance evaluation.

I understand that this is aiming to keep the same underlying code,
but I find it surprising that the first user of the "inline" get/put
user puts the burden of the proof on moving this to regular
get/put_user() rather than on using the inlined version.

The comment above the inline API clearly states that performance
numbers are needed to justify the use of inline, not the opposite.

I am concerned that this creates a precedent that may be used by future
users of the inline API to use it without performance numbers
justification.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

