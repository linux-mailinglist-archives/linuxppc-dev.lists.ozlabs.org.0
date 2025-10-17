Return-Path: <linuxppc-dev+bounces-13008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4587BE8A71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 14:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp4Q42tLVz3cZN;
	Fri, 17 Oct 2025 23:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760705340;
	cv=pass; b=kV2QugX7GCd1fCYcyUcQX8/5nAGKOyYR3GkpgRnXBntHGIpjZPBPkchqWX40z7xnWifs2aqVfqNysYsXYM7zq/u/i9khUiJp6/T6rjjm420vPpyST/hKRTsrnrrTkwx5EIzqqbbtFMq649b1Bt+7NrM28O8ivVtfbhiHoRbSJ7R+9gVnkTOcPbu6vvyG9BkogjB/jBlEvd1E7c3e2llfQXaUAW3Dex3CDAk0eKgq6SCjhln0jP5girdq+uLcEhgGS9KvDBeJM7gFY+J9sJgU7KLs4qFIC5yAsOSWkDhCk7jBVT1H4QGB6Zisp+HjTLkd6kQk/PWzZRICkMiWkQ5pTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760705340; c=relaxed/relaxed;
	bh=5Rq1yf78JjeOYqxbb6wGIiOe6BcK+7dSU1X0EQu4tzs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KXnkmtqDT/CzLUajwg9bTEQprsYbylZDDRIJylco7iHxBDBax/bSsxovUWYT03VXvBz1Ok9ZTUYBvbHoCy6guPdeG5WcfRmCAvhJbSgkZwx98J67t16ZFQAvD0Z21HzAJhA+RDWgKJO3wYRYqXGdHViJBTQYLMFFwJB9S/QgK9r1Lmno7NspHA8wnlzEHc4wrh7D6C7Xn0JNl3TqufTLg36phSQnCuvgLiaHX3NKywMMYYwQatL0XLBItlHy8Or0MOoNgBAjhRo23QaBSIOQHpPLwHDrLB/NS94dTv6cglqOYmHWdwWoh3TehS4Hi01GUvf8+dkWZxoIExZPEV6ing==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=edOuSKFU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=edOuSKFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp4Q335m4z3cYg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 23:48:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti3N999jvZHVTg2YHxjd50+jn4Xf5UVNDfN6p9Iy5/U3aJND26yqsBRNdoEitrH7VjwxyDVxX6BopbEgk9fymcTD/kuqQ0S43jIfyNk9aKyM6URO/GBFRf3YYteLiQ0iAHYWcqbvFhe9Nb+/L4ns4WksdlYVYed2tQjCnP7YW9WrvnlVuTAIXNDwgtrzng0nSxlsWxt9ofyWtpThr8LOirKXKlNKpV6+IpJDDCNFLm12dVOPyZeIwhLaftun6JAMksslS6uETYaFPSBcaeYEfwFvSglPPoZX9QCFHLnew48kSrkK/tXjsrBFxok0xgz7UNHUWfZxYr551u1iGNBmzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rq1yf78JjeOYqxbb6wGIiOe6BcK+7dSU1X0EQu4tzs=;
 b=pyDJVXtBTz2MWSkm2ImTM3kv+gSgF25Cemt0tzm+9Np02rRGidoDjqmHsxy2bPbMBIB228uFPhqVVQEd1pPICuMbq2zUqGGBrNcn6b3PaNbAt8K9O7jjvO2ofm1TR8hobLBgdinGvzLcaIMDIIuQ6QBeulfrlqCBI95I0wUKondSxSXT/THSgAhRf27NONTYsgGslJCubBTU28gjhPbQK6javYYLN65duZRSSElp6lV/pfIuo3++eHbecivjbIfakAAD5IM4TQxSYUh787qQAYHeYZzLuNH/DK+dDFr2M6VN0CuDnnS4WkGnAuXPCxD+YY1p3rqWcX1b7Y4juvBNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rq1yf78JjeOYqxbb6wGIiOe6BcK+7dSU1X0EQu4tzs=;
 b=edOuSKFUEcQz9K5oyMkhzQWjrzd9u+KthcvKA7ry7/LXVmp7oAXPIf+knDV4Wg9XSR7kl69Xj/YaLEJcGExoBjtDolhMt6JcnkJ0WU8pvm80QsPRRyN5i0VRtbvRd+pqe8Ew9vSsVk9D4YMnF0l4i5yrfo2AIUnhxCG8CH6/JX36L10lx1wbEaoqqTgUtGuhYyk5JX3QP/TdptRimAVEHtiq8UUP9aYv1GeJYr3y1WQUshV4MxuEEHWJLLsUnvmY+ohWNKhJdjx5YjjKNOfJO5oCSEPuNvh1qLlXH6TPgdgLUA9ggwgGjVEECReQcqlzMsaIXbKapOPE82/oAlvHNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR01MB10838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 12:48:35 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 12:48:35 +0000
Message-ID: <8901f58d-3c3e-4d22-af7e-e28613a76a16@efficios.com>
Date: Fri, 17 Oct 2025 08:48:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V3 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
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
 <20251017093029.938477880@linutronix.de>
 <dbf58bbb-9315-49dd-bb10-4e05e368f43a@efficios.com>
Content-Language: en-US
In-Reply-To: <dbf58bbb-9315-49dd-bb10-4e05e368f43a@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::13) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR01MB10838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7847f82f-aa73-4b46-7270-08de0d7b7c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eThyMlF6OVd0Snp4RjBFRVcya1AyNmNYcC9Fc0VyNE5HblRBM1p4L3pSUjl4?=
 =?utf-8?B?dnh6NFpucjVPWUNGeW1XU29xSG0yTFFnbXBjVFQ3d0dBR3dWTFMzclhmdUdG?=
 =?utf-8?B?Zy92R0p6VUJKTkFnNFd3ZUVMc2s2R1M0dkdUamdYcU9PcnZtdkpIei8zTTQ4?=
 =?utf-8?B?bUdrclFRTGZVd2pFdjR4YWNPN1BRSVRpQm9QZ3kyRkt2SXpvRW5CVThxR2Rr?=
 =?utf-8?B?c2thQVJYODVMRE0yV2I5MnhyTU8xeXgzb1BVeXo4d1F0QzdNbkhZckl2YUt2?=
 =?utf-8?B?TW5vVGdqVStnNE1WQVd2b285STl4bHd3UktGcUJLcjdFUUV6NDhvYnNGaDA3?=
 =?utf-8?B?cDB2WlZyQWFYNUdLUkFBQXNCSHlvYkVoNnNINUl3Z2tjbWNPQWNyWlVoZ2I5?=
 =?utf-8?B?eFROdEYwUEhEZjN2WGNPWVFzenN0NCtRV09rTm9CM3dxeXZKOFkyckJXWE8x?=
 =?utf-8?B?YlN4dHhoZFlDbitETmk2TFZvU0xzRTAyazBQOXBWZy9ZSyt1VkZWN0ZpY2hP?=
 =?utf-8?B?YW5BQ0RaN2VMZlVBMkd4Vm1YNVdkTlQ3cCtzMktnUUNNY09LSC8wY1FITmFM?=
 =?utf-8?B?ajFjbmFKb3hnYkUzUEZOQ2M1MnQxMDVsbkxxZWpQQ1I1UXBCOTE3NzFDOGtz?=
 =?utf-8?B?S25ReW1aWTFIenA1OTROQkxoM2xVbVh1N0w2aGlhbitRYUxhenJSd1NHMndM?=
 =?utf-8?B?azdNMWtqWUFwRU1YK1lrdXZtNGJxMkxNUUNvN3FVeEh1TWJ0S3FFSnhJY1cw?=
 =?utf-8?B?KzZyc0diamJXUy8vUTFmM1hTaVI1dFJ0NmoxYUw2RVZ6UndhVDdSNlIrdWR3?=
 =?utf-8?B?VTNwSTJEbzVoQi9ibHhhZ3I3K1dTYlBsMWREVXFGMWlva2x5RzR6MzBDaUc1?=
 =?utf-8?B?OVJ1T3F6Y0ZQWHB3NmVBNkZtd3pEUy83dkZ2aTRRYWtRSGtrMTRSdUxad2ZX?=
 =?utf-8?B?RjJRdCtaTk1wcXpnZHRFRm54VEtmT0RBNklNVVV0ZWJZV0IrNUI0NE1mNGpD?=
 =?utf-8?B?VjZ5MUVSTncwVVFBUGtCVTJZQnVtZ05OUm8yTGtSRmdPRjhCTlpacW9xejhq?=
 =?utf-8?B?VitrZktUbEhlTy9MdmVRMTc4VlBYSlFYUzNlR3EveXN4NlFoejZycktuQ3A3?=
 =?utf-8?B?WFR4S0lBVjF6UHgzTFhHekVheWJmNXNZaEd5djhxa2FiZytySGUrTjhTRFBk?=
 =?utf-8?B?Y1BDZVJzek5EMXFjamsweTBHNERTRFVjVmVlWkd2VzljRDJYcS9ybG9RUmc3?=
 =?utf-8?B?V3Vjam1RYXhtVVJHR3BRWm1XVWxJNFh6MlVkVGorcEdmaGIzMlZNVFo0OW5y?=
 =?utf-8?B?UldQVkxOb0NuK0xONnZHSkRXMi9EN1JiVmZnY0Q5SGZLNnJXd1NZcGlBQkoz?=
 =?utf-8?B?S0I0MDRTangrdVlzVGNqWjJaT0NDS0p1QXpyTmdxdEJndjlhb1AwemRyUHRN?=
 =?utf-8?B?eFRXMTJ4NTRuY05aM2VhREtvS3VKOWlRN3ZTenc1elB4ZjNYcFRXUkROang4?=
 =?utf-8?B?KzlHbzA2QTNjbG5wS0FscXBNdGFFN0l5TUxmdW92L09sWFJlMWM4TUZGRkdV?=
 =?utf-8?B?Q2JqdFl5dCtvam5Ubmp6cmI3ZnJLbllDVlBQY2VaeXNHTlQrZUlycE9zMXFq?=
 =?utf-8?B?OFRFMkNhaXJzZjJzTEFrSG9NS0hEUk4xOVlsQkVtdWtuVkYwUkNtWEZwUjBh?=
 =?utf-8?B?cUI0YmFPUlNCejBIZ1hQa0Jxc1djc0VyTmFpV3RRbjJ5SFVOdVM0V1VxdVln?=
 =?utf-8?B?YzhweG9wOVRWN2FzZ0JQa1FIVGcySWtMTllQMHdGTWlBMU52bmx5Nk5jTTZN?=
 =?utf-8?B?RW5sUE9HbVlIZERBTCtuQTVFbnRZaCtqcTM3elRkVDBvTzM4dWZ4K244K0hi?=
 =?utf-8?B?K014ZnFhV3l6aGxWRmxqeHplcUhKa3EyV1FiVE1SWmZKc1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME9YU3pjdlF0V3NjaG96K1NhaVpzLzF2REN5SGh5aHRWWkNoVkRyY1dvYjZz?=
 =?utf-8?B?eDN6c2w1cndRcWdiRUJ6MkJ5bDZ6R3RERHhvL0QydFA5U2EwNlRKSnNPcVp2?=
 =?utf-8?B?bU9oSXJiV2Rkc2J2OE56NGloVVAyUVIwV3lHcmxsbnB5MUE1eThLcEFOcVN0?=
 =?utf-8?B?eDlvUFYwUHMwT2lnSElwN1FFbklueEptbjAvcTBFRXozRWpxallTY29UYVZW?=
 =?utf-8?B?dGM5V1pBN0wzenpneGNCRWJwQXYwR1ZmeTJ6dGdCQnMvL3huNmJidmFBZ0Qy?=
 =?utf-8?B?Z0MrOStkS0ZlQTc3ckxIa3lDekdacTdLYnZ6aWE3M2lLc2FZRzZhcmc1OGdN?=
 =?utf-8?B?T2QxZzRMRUc0U3VHUGlSakJETGhFZ3NHRENVaVI4bTg0VXB1Qll2WEpZbnpJ?=
 =?utf-8?B?cUkvVTNGLzlscHNwSktzaEFRV3ZSczQ2dklya3d3ei9SWWlFSlVORE9Cekxw?=
 =?utf-8?B?bWdwM2QyY3BKQjVOMEdIMlBjZzZiOFlkdFJ5UHVyRnBtbUxUYnpYcXlORWJZ?=
 =?utf-8?B?VjZDV1FMTVA0MTdoc1h4YWtuSmFkenNwM0lRZVJDQmJTcnVlSWFyVzcrSmpL?=
 =?utf-8?B?TG5FZDJvTmh1dXVLaElRZTdsT3NsR1Flc2NGUGRIMHVKNGpHMHhWOTRmb0Z1?=
 =?utf-8?B?RWN0TFhRZFRZT1oxcm5SYWY2QVB5VjVldE8vTWNmWlhxQzUreVZSMWtBSHJ2?=
 =?utf-8?B?cVZDN0xZN0N1ZVNURHlWTlJrbzFMVWVOK0FicUE0R3dkQXk0MEc2MHVKWkR1?=
 =?utf-8?B?NGxNWGFoTmFSSjE4ZEVOcXNkQmI3TzBPWWlSTlMvN1I2NlBvL1ZlMWpSTnZs?=
 =?utf-8?B?ZVRWeU9Jdkg2UXd3R1lYWVZaSWJUREozTExXcU5jQ0JxbUtza1B5YmFXakpv?=
 =?utf-8?B?UGkyblAxN0dBWVl5YWNZdTFGN1BkdHFYcTRtRmphcE9ZU1doOTJUWS93bENQ?=
 =?utf-8?B?QVFScXZMRDRYVW5LMDF1SDNjN3ByRHhrVUcxUm93Wm1yaVhmdXhoNHp0Nm8y?=
 =?utf-8?B?bVkzTFlpU2pwOEswQ05YWjJYa2RRdy9jNFJPcFFNd0V5ODBOdVVYVHU0aXJ2?=
 =?utf-8?B?MlFnaENIN054cEVzcFVRSEVINTJIeTlrSVE1MXQxVHlrT2ViSzJQOWMxengw?=
 =?utf-8?B?UWRxRVJPRUtGckJmakRRa2wwdVJpUEZzbVg1dCtPeG9lNnFWL3cvbjRzdksw?=
 =?utf-8?B?MlNOcVM1anUrdWt3QmpwK1dzNDl4cjkvb0RZZEdqU1pMcW92aW0rQXJpb1R6?=
 =?utf-8?B?dnhIR0FLd0wwRTRNOWQ2ZEhERzdzWnV6d28wMWM4dVdEZWJkTkQrbldIQWFP?=
 =?utf-8?B?blJJcEcxcmxCOW0rZ212a05CbjZ0S1pualdoY0VZeWk4eXFYR1ZFWXNMWGtk?=
 =?utf-8?B?MXIzRHJHYTlocWRORDdpaFBFY3VNY1FMMDA1WkxEWTNPQjNSREZ2L1RMZnJD?=
 =?utf-8?B?bVA3VzZNK3B6eXUxOUVyVFFua1ZDOHNVZWx2ZG40aEE2QXV5RCtaMk1PcUhE?=
 =?utf-8?B?NUZnMVFnVG5HRmVObVhvMjFNNjRicWRvVDdrK096eVpPWnlRUEdnQ3NPM2xu?=
 =?utf-8?B?THlPdlY5K0FrM0lsWnZHUGNEVWozb3A2Z3ZMa3hRYk4ycFJtRFl6eGRlRmlh?=
 =?utf-8?B?bzF2M2NOM0hkK3ZNS3dSci92OWZsNmhQZEJnQnpLTnowTUdHUmZmZTFUR0Qx?=
 =?utf-8?B?bjhsck1IV3NGQ0JaeGhoVkJ2Wk9CdllNc1RVMlQ3aG1zaUQrbmFDVnhLN2My?=
 =?utf-8?B?UjBJbGkrbTZSLzJUdWFBWmJHNG9VQUdMQWpQWEJzZzcvQ1ZzL2ZxZ2FsNXRN?=
 =?utf-8?B?ZVkxMU5NL2xGR1kxRDE1aGk2ZjdPRjdDZXAyWWZiVjBKMUM0K3NJQUJNU1hB?=
 =?utf-8?B?cFVFUDZkTFMyOG5TQnB3UndEaDJ3eksvOWlaMUxJZTkwekR5T0IydCtzUVh4?=
 =?utf-8?B?MHlFVGM4Z1I3RnJMeE5MRndSQ1d5NkptR3ZvT00vL3RqWmtYTUs2cUZpUThx?=
 =?utf-8?B?SFZKQnJGTm05OHIyL0d4aU9LTGUxd1V0VHYzMHEvbko2d2JPQW9hQnMwR1hH?=
 =?utf-8?B?MkRVTFpGZlYvWmY3UlZrNGFlb1lIeWRUVk1WdlFqbFloZ1RXY0ppeW9BWXgv?=
 =?utf-8?B?S1B0eCtyTjJxamNFMmZFREtaM0NxakR1UENid1NyS3VEVWZPMHJYd2ZEZ3BU?=
 =?utf-8?Q?q8FEztlMUiCg8RbTL9nV0sI=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7847f82f-aa73-4b46-7270-08de0d7b7c62
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:48:35.3651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRz7k6IVlQjWeNxKozeD5HFdON9wq+WcoGMUCOyVP/aS5UrH75PQ0UJETnlBq02qWWUCovv+n/0KgrMg2qtB1vNvQP7nLCcuv7gxRKS54eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10838
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-17 08:43, Mathieu Desnoyers wrote:
[... remembering to trim ...]

>>   long strnlen_user_nofault(const void __user *unsafe_addr, long count);
>> -#ifndef __get_kernel_nofault
>> +#ifdef arch_get_kernel_nofault
One more thing:

This is removing the leading __ from __get_kernel_nofault, which
AFAIR has a defined semantic about needing explicit checks. Is that
on purpose ? IOW, would you rather have __arch_get_kernel_nofault ?

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

