Return-Path: <linuxppc-dev+bounces-13456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE603C15A7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 17:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwwC61lX1z304l;
	Wed, 29 Oct 2025 03:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761667394;
	cv=pass; b=Eh5AEiQU80qGwgKxdeGLpa6emQYr2EQ4iQJahtJq4FzRqclLph0jpjiaEfDbFyiXpaozV8PMY3fewt3K3is+YUlv3Uj5CXrHiD2AgVNvyFazObKYLPgtrAKcfUGeQro06C6D66aStoa1je5ijkk6rOQ8k69yv6Wq6Tlvje5YSkWod0hLH2sY0nXgGY7CbIpyIYF4jf4KzKhDHRoL+JUGUeU8wDrFMa4RZubEoEtkUTPhOq+juc7lGEVN4jY7TgRQiEkf9Lq/BcpJJsoKDEv1SSopLvPsEMmKaPIkULIV1UAwoOxuuErIPOtcgyolAZErZQ3OoDgBfUBZVeaV/O7WAA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761667394; c=relaxed/relaxed;
	bh=KflPJSI06ozZXGwEo9egUsnOpuyP9kTPOh5JB4mEeSg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Uv6Cf09ZrtAaU2vek/UMeMFWUmvGaxJEH4LsOnRxHUZ8cPwYa87NCv7s37t5EF4kVJPaPUhJctNNchez7arnXNYT0j9sD2E+FhYmzYHcPD3pyqnTOWW7c/Q+hDzzPb0BfSHJUmFmRNgBwuDXTP6nZ+FSBr8q2eXu+D9WurAinbSVdDxAxeK/bA0cOtYY8OoUiiD6oYWCVFMFa424fEtlHORQJzWcwZqqw3p7oeU+p1n4kzVvMBHbGCPNlrcYyxkuyt8u56XPbRMhqrrhK1IpkuMz1p9UHzVXdg6+l/dRMa3RCoRGPZjwgQTuuKa5PrQRblkWaZYDB0Uv9Djt6DrmmA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=M47S5qYC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::1; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=M47S5qYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::1; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwwC41jtSz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 03:03:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r82Od/cErI0pHqtnZHeaNnb8aL95Vz3/se5QUigkSNS4hdPLMqlJ+VtXtlNzlAXrB2MfN5JUi6ppx5cSmOfq6gh8pL3xxCSxOINBUMNN2HwQZcPgaH7gsk/xUQURQsMVJ+7jj4XWqgAzNXnnjUXb9uPth/1W+ZXlqAIAIU/14qw3MTg9WMUAc88YRQhSnlOAHvczUwyZn7N19IdgVQoXSKzR3ayy633XtQ/lM119x27SLyLlvEso1CBsMIotxBobO6v6qno9MH+ktKtcKg4w6iHXicvmSbbPf4WxygTL9aNufzstpnIb+ZhE/NyqE/OgK+19fQ5ZJVG+OPSr59O1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KflPJSI06ozZXGwEo9egUsnOpuyP9kTPOh5JB4mEeSg=;
 b=KQA6BPxMF/v3G079w/JTO/Osxmcwpye7vtp0wsO6Vh2q+ZxevgT5D4Kxf7kiY59zvi03KZDo8OMhaH7NymeZcZVnV+YQxaA6mOlElrerAvaRzPBH+5dK2foOGX4vUE26myv6ObhlEnnejiwQsM7eiFOfH7xcaZPRg1hrRwdg9nPjdGqRSYsY3J3RoIyUxe98bJRuwEUwOFsnQxjuzYeah9qQLnyGXKX0znqaIFs/MXN4Szz11wzJQRnx7h5Oq4LgLdkESoFV7Nlq5zS5IYZvtfaKkASFJ8g25oHXvlHuSdtwP4J47ujMppcV7bWTbxQ0gU64uZD+D/rwaVOFJZJEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KflPJSI06ozZXGwEo9egUsnOpuyP9kTPOh5JB4mEeSg=;
 b=M47S5qYCUeNu9zAEEEGxe3TUf2qe75XDnFR8oChGw00D70OvdWBxteGMyKoiEb5glkdO4v7HSw3eYUswweilNpXdVCZNPfVz3jxb0dLPwPtn8VyI+I41D+VKsVUdQzgklS5J6lYMhhZhUeNVg/KGxVbKi3X4neKVJS5A2PtvAwOAJPV6wmsa/yV+rTuFag0sF9dlGiFIbYLvsRSjPIB2tDHwMZva7w/iVSSXhxar1tgF1NLMUPfJbEpvWgcMn/K7eQDK9rYHN8HQ1LOAGGUifOpRSuuK8Xe9JoyME5T/lghSpW0TjZNKwroBMnVvIKrNBbNAwo31ASszlelihI82rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR01MB10579.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:75::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 16:02:42 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 16:02:41 +0000
Message-ID: <76b1c0f3-6117-4554-9b9a-cf49df1b5791@efficios.com>
Date: Tue, 28 Oct 2025 12:02:40 -0400
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
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com> <87frb3uijw.ffs@tglx>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <87frb3uijw.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0319.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::22) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR01MB10579:EE_
X-MS-Office365-Filtering-Correlation-Id: 70471867-f80a-4c27-4eda-08de163b6c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3ZMNmQrV0lQQlF0TmpPcjZuZlFsWlNac0F5MWpIbGpMelkvQVl0V1M2dmhI?=
 =?utf-8?B?ZTJwWUh3c1dUMzRZaHYzK2tKNDYvRUZQanExeFdzODVHblhMVE9LS0xEWFdJ?=
 =?utf-8?B?VXM3TTIrOE1uYUIwcExFdHpJQm5uT2tHbU83RmtOQUNucm5ZYkxVQmluNGU2?=
 =?utf-8?B?aWFhUFBGeHdmeE1vZzE2VFpBbWZXaWpSWXhwaCtBcjJqREc4N2RIV3BnWVN6?=
 =?utf-8?B?REpQSlNiS0ZNUS9GMHRQbG5rUUk5RVhld1VONHJwZHhBSDNYNFVqRWUycWRh?=
 =?utf-8?B?S1UxODA0RUk0YVpwZlJYa0J6aTlQT1k1Y045RmgyZGRpa1pORVJhWjR5WmRr?=
 =?utf-8?B?N0RyWStXd1JaZG4ydjhiTUtrWVBGclpJVUpGME9wdTBETE1rM2RSMnM1cVVv?=
 =?utf-8?B?dmY3TUE0YlQrdzdhRjNTY1hTM3J1bFpSMk9BL1hqUGVqYittS3JMSEpRcWhU?=
 =?utf-8?B?WDBZckdvSlhzb1NIOVFYRTJnYUZ5SjBVWmRpWjZLb0JRMkpHenNBb1hMYzYz?=
 =?utf-8?B?VTJHV2Y0Y3VBeDYycVFNUzUxMkpYMkdjY01rYVhTemtRdURSc2RQaTJDOHVB?=
 =?utf-8?B?ZXFjaDhTeXRqNml0RUR0OUJLN1hjc0RCRUxLNU11SmVIckJNWWxQdXIyWE1a?=
 =?utf-8?B?c25hUHRhU0JpZXFjK0VjZlBEcUNYaUc2ZlVRbHNCZjlZS1FTbVd3TVUwZVJh?=
 =?utf-8?B?VSsxQWJUd3dmVWpONkVIZVRDTEhMUnp1eFZUQk5DbHpvcHJscVdEYmdQQmJO?=
 =?utf-8?B?NXlHUzNMRDRqYW5rck00aHBsY0txUithbjlUdy9uVjFXN3oxTmNqQ0RONUhG?=
 =?utf-8?B?bDdRMW9YbENlM09BbFZxaC9oM1NFZExuZDdmTndBdHZiYWlwc2h3NzRlUHNW?=
 =?utf-8?B?ZjE5VE1sNjZNUUtCRm5aWldFYjFUbzBGUFhJb1dWQmtza0UxaDlwaldFMTNs?=
 =?utf-8?B?aDdQeUk5TVNCenA5R3Q5N3Q3MkxUVWVWTkRNSm01aHpDMHpGS2lRS1N3L0RQ?=
 =?utf-8?B?VG1aakJVb1E5UDRPdzhPVXRuby9CN2RMangrR2Y4UFJwRTVDc1ptRkdDOFgx?=
 =?utf-8?B?d0o1c05GdDlNblJFdkM5anB2SUZleWx0WWthaExzeE4yVkR5Z3JMZitPcmdW?=
 =?utf-8?B?Y1Z2c09mR2E0MjJGMG9GUVMvN1grbjd5a2tmS0hIeXF2UVBhQ2dQdmd6cDNY?=
 =?utf-8?B?TSs5RS9odXVFWnhCcWNjUUhjTGk1S3lXQ2ZhdjVnM1hMK2g5bGJNNVpUS0g0?=
 =?utf-8?B?U2h5cEhrZEQzWk9qMEROTXMzOEREOElHcVRtaXErL0h3TTg0NjRFcXBnYmk3?=
 =?utf-8?B?ZTNoZWpQZEp4Wms3SlJvWUo2bGI1ZzVIWXhUK1FvT0xzY3dRa1VDOG9MYzd5?=
 =?utf-8?B?S0JjUmtlNTM0YktvZHczdFdXUjNBb2dCTGZpWDQ5eHdYZnB0Zk9WNVVZejNW?=
 =?utf-8?B?L0srV1M0UnVFcUNjb0ozdHZGM3UxTy91amFsczlyY1hueEM2aW5PVlFzM3lq?=
 =?utf-8?B?ck5yWUw0ZmNZNm9HeEc3QkViMk5mVDBtMlZldHd2UHZFUysraUpkTzNQT3ZL?=
 =?utf-8?B?Y0VFcGVwMEcxbHFRTWxmWGVQeGN0djMvMklTdXB1TGdiVnorbTFBeStjR3JM?=
 =?utf-8?B?N2NiMkFrSUhyMkUydytOODBLNUdBbWY0eWROMDBlOWFSK0g0RmVqc2ZaYXVG?=
 =?utf-8?B?RlNqTlBVQ3Y0ZUFaSzg3Ni9DNW4vM0k4L3dOc1J3QTZsMThKQVBxMjZvMFFa?=
 =?utf-8?B?L25ZdFFsc1dTSVRNNk9EYmluU0JUTW02Wm90b1BhMTlEcmhhYm1UeDFhOHJE?=
 =?utf-8?B?QzVwVEYxOTlBUlFwRVZLeElPcDhDVXRmNjQrNVlKWWUrN3FZcTZTTnlUbFRq?=
 =?utf-8?B?cnp0NWZpWTdnYkE2eXcwV0t3a3ZKV1gzL0RLMGNNeVhqVlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXBsdGxuSUxid3M3UXljMm5pKzEwcW9HcDJZdzVibkFiVklHUVc5c1NHTDlq?=
 =?utf-8?B?TWUwMUlSWUlrM0dsRjgvclZxc0NzNlY4UTlBYkV5S0xIcGR3MWVrbDA2N0Ux?=
 =?utf-8?B?VkFTSlhvY3I2WGV1MzhkQVJydVB0Z2ZPQTd0elFwZVlPYzhJY2h1aExsdkEy?=
 =?utf-8?B?S0lhakNnRjNnRnZPSkFhdDljaGEyZzFXbGtpY3oyQTBpU25HV1JiRVpCSTZi?=
 =?utf-8?B?SGw5Y3VyMnZiOUZDZ0dCTUxBWi9wdDlKYnhXc3R5RVI2d2Y5bWFweVJxSVlk?=
 =?utf-8?B?Z1orcndjMEtqVzVrT0w2dnZFL1ZMTUtTZGt4c052cExINFFBYkp3cWc4WTd5?=
 =?utf-8?B?dlpIeHhzODM1UkpLWWkyR3BPSGx3RFNtZTl5SC92UUxnUzc1MXdaSks0TkxZ?=
 =?utf-8?B?UVFqM0phQ0YvcGtTRTQxc0FvVXJIclluelY4NzA2SEIwVUdjUCt5VlJSYUl4?=
 =?utf-8?B?aDE5STdvaFl0cndubWhwdVhDL1ZpazQ0b2VOdHdPTlpPcGlxWUoxSzJqcFI4?=
 =?utf-8?B?VFJ1SmdBR2RkWVVrUjFzK2pXeEN1L3ROdHgrM3VZK0ErTENaeUhzUitiMkt2?=
 =?utf-8?B?QnVyUXprWDkrc2FTYzR5Skh5RHRPaHpJSlpRTnFHKzBQNE5FYkpaUVVSaUdm?=
 =?utf-8?B?alJNbFZEM1VWWlc1enNGZGxSZmRkY3pWVVRzSE44aGh2Mm9pOEpBQlF5d240?=
 =?utf-8?B?RUh0ZXA1S1B3VGp6SllPd0xoVUo3bjNtU1V4dWlkQWVVOFA0cnJXcDY0cyt0?=
 =?utf-8?B?Tzd5V2tmMFM3b3FnQmlzRVd3bXduMC84RVd4eGF1eTZBTm9Xb3VqVnZaak9z?=
 =?utf-8?B?YjlJTG8veHNaK2JoYVViREVRdlJYSWdraVN2YWQra1kvc3hPWUJqUGlCTE5i?=
 =?utf-8?B?N0h0eExVVjhxYm1QSkFjWURTbWdXMmpDYnIxVWJObWdOZS9za1FNVVBLVHA0?=
 =?utf-8?B?UTNlQkN5YWxTbE8wN2tkV1k0L0daNGw2QlhPeElDTEVid1JQdHJoRno0eHRm?=
 =?utf-8?B?VWZsUGt0MHFUc2o0OGFTY0pQdml4S3dtQk5SdCt2TGZUN2R4bkZYeWN5NTNY?=
 =?utf-8?B?ajEzcnhCVTBmNjRDVEhYVk5VVU95dWF5TVllVlo3NE9nRXlpdlRBMVlNUTdz?=
 =?utf-8?B?M3FNYzBNbWZsbWNkMFN4SjRPVlBIRnF4SzVwcWI3Kys1TElVZ0JFb09vdkNB?=
 =?utf-8?B?cnRVYUxHUEhBVVBZQmtNTExIZVp5cUUwSWMzNTNvUjVKdCs0Y1QrSWRhd2E5?=
 =?utf-8?B?NWlhS3J2enFNNnpBNWU0NklnZnRkY3RGTVVoL1lnUWcvRzVaeVZkVVJVUm44?=
 =?utf-8?B?QjVEbjVXQjVVclVSREoxQnptUExuMDIwYmRyNUx4NEZDcG4zRzVlNWg0SGVU?=
 =?utf-8?B?MHRBSXFRVjJsaUNySllKTURZS0lOdmJvZGxTTzJKTTBUOEsyVWU0Y0ZCM3c0?=
 =?utf-8?B?dTZueURpQkRTTVdkRmRWYWdjYVA4T3A3SUZRS2ZqVGtYRUVTU2RyRlZJVXdE?=
 =?utf-8?B?dGlTLzJGWUh3b3ZRSWNOdHZJOTJDTExBRHV5aWNkNEl2YlVvYlQ5UUpteVls?=
 =?utf-8?B?T3kxNlpQVGJHUEl3N2QzaFptNTFhRWVjYkpjeUJmWk1UQWdHYTdVT0tERVFK?=
 =?utf-8?B?VjdDOFZGS1lZNEVtSTlkeDhFWEk5anpTNkJuS2crM2YyRUpBZ0lENkE4ZWto?=
 =?utf-8?B?bzBLaHdYRXg3UkZjMzhraytvNUUxU1hiOWsrQ21COXJMRnIwWnlBS0xZenY4?=
 =?utf-8?B?c1NLc2VPSVAvaWFYMlJ2SXZOTHpYeEw1Y3pQeDFWMEhkU2NLU092WU9tUWVy?=
 =?utf-8?B?czFRMzRrRHNOR3UzVDdxUitVZVcySlE4MkZtUGRtL0JydkJiZ0MvNzZYTFRs?=
 =?utf-8?B?Y1RyK0tzVmttbXI5bHJGRWZPd1pnNGQwd1BuNjRyK0Y1ckZhQzZDSEtPYXpR?=
 =?utf-8?B?RThJTUFKQ0VvblRyU25iZFg0elpLWVJPS0RCN1VPbnhoSXhhNFF4NDVubUtB?=
 =?utf-8?B?ODZmQTVDd2lld2I2REJFT1JVTVZldjBNOERyL2tHdlllZGtjeHRucFBiWUY0?=
 =?utf-8?B?WXRFRmtlZ1d4ejBadzNUcHl2TFRYS1pyUXBvZWpFblZWQnlabUpvZlBuUmMz?=
 =?utf-8?B?WGxkVFNlbkFlRmh3eVFGcmNFS3o2VjVsRE8zWVRvZkN3RGNXbWk4TXFVSVdM?=
 =?utf-8?Q?D+mjQXQy4hEy9pTzSKUB/Kc=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70471867-f80a-4c27-4eda-08de163b6c73
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:02:41.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwIbzlylTKdf5zRwvZlXTR8+EU298XHO5Wz00BI0Qr92221DY9bip90oxWjT4MWK1c6w9WqFvEPQnPpzl3KGA5Xd3GeIPtd5I1AkC4kjlvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR01MB10579
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-28 11:56, Thomas Gleixner wrote:
> On Tue, Oct 28 2025 at 10:24, Mathieu Desnoyers wrote:
>> On 2025-10-27 04:44, Thomas Gleixner wrote:
>>> From: Thomas Gleixner <tglx@linutronix.de>
>>>
>>> Replace the open coded implementation with the new get/put_user_inline()
>>> helpers. This might be replaced by a regular get/put_user(), but that needs
>>> a proper performance evaluation.
>>
>> I understand that this is aiming to keep the same underlying code,
>> but I find it surprising that the first user of the "inline" get/put
>> user puts the burden of the proof on moving this to regular
>> get/put_user() rather than on using the inlined version.
>>
>> The comment above the inline API clearly states that performance
>> numbers are needed to justify the use of inline, not the opposite.
>>
>> I am concerned that this creates a precedent that may be used by future
>> users of the inline API to use it without performance numbers
>> justification.
> 
> There was not justification for the open coded inline either and
> converting it to get/put must be a completely seperate change.

AFAIU there was justification from Linus in
commit 43a43faf5376 ("futex: improve user space accesses").

Perhaps it's good enough to refer to that prior justification
in the commit message.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

