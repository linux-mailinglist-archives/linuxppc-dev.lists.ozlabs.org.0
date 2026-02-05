Return-Path: <linuxppc-dev+bounces-16621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK2mEX+0hGk54wMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 16:17:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B43F4827
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 16:17:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6LRt5TB5z2yFb;
	Fri, 06 Feb 2026 02:17:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c205::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770304634;
	cv=pass; b=XwP3XJ5hE8x6qjjdXUcuwr/qXoHTQnCZ7UU7hThArZRPELWsEM12TYVbD1zP4GWkHk+EHV08Nlf1KRQsZ8N7yN1u++cU4nKUdZxo4nvquNTrkk+vb2Sy8Q9d6Hx70P20F3HkzP99XfPHmdiYQmrlncb5WBaLlDO0EKXNvLXHVisTqzUqP3kjaRrvPn2Rr20OxzxT2LSchNjVl9UvBShuQg0NlGdp8wbVRYh0HZYm61Er6ZfZ7cshD9OFymCdSYjU2gj+0VyjGbujZCSNxD4Q6lnwxITmdOZ9V8ZNdH8YWBuEHTEyvVUGMYoZUmdLhqKBY99UqccPxTB4CTbBphXVmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770304634; c=relaxed/relaxed;
	bh=TZJ/X+u8U/29vh7fI9M0yehytG9DbTBIQlZW3zGqkqg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=XJlE9ukCzGCq5U7frFATmhGeXSGW5ipX5XBbcKEn3co6L5io0Ka0pfGOc1ikwiD7eudxBBvnyg/hY9voz5A/VB2PM/3ZsdFfpJqqAoUBtkBVUeIo3aPic+r3Ucvz/XOLD3PAdOsVomJNZnwpvXB/XixlIiJTY/Z1RQ7+Oo2URXeJy6eSZSU4nWkT5mJbIy60r+lhMpKhq1cTjA10WvvmLADgo26x+frJsL/CV3G1IgQpqr/CAOUfyxh+b9lCs95jCWAznGTY+6vQfp7bqpQsyuAG8fKXal4UuXDcSmC6Pl+uagONWgh+P5OKq5qNs+EzmwZWafFLXDO+AISpWDOylg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=KLJE+NEt; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c205::1; helo=lo3p265cu004.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org) smtp.mailfrom=garyguo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=KLJE+NEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=2a01:111:f403:c205::1; helo=lo3p265cu004.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org)
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c205::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6LRs0MTnz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 02:17:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiXRAqkrOW9T4Ug66PthWY9F71F3CIiqR2PrNogGAbMrDYFd/jbtXCgYPvrrf74f0Qa9oR+EXzEcPpOOuEfs/zLS/mhCwZg4ViNWKuZDNafnhvnv1sskV3uXxGqFL0syCpqn6bmfTVVkZAkEpgtsojirl7oGSZLV0fK3bb2qU7QTiyOEixfIzyF2J4xO5jxsYeo35nw6NGwUtpeVSgJf0tssDw50dJKeU53c7ZVUL5L6F82mTaWGrb0sPg8goUx1UP25HE+siS0B0oCvdnxCYKHok9bcRGgnpk1/d/lQpn0G5GxccEZMEbZNg30HgaQ8B0tXTexFCP6ZOKKELV1krA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZJ/X+u8U/29vh7fI9M0yehytG9DbTBIQlZW3zGqkqg=;
 b=WtkY3cczBTSXQ4liVpjTubTW3ea3s6xEAMq9eSyNG3Qg8eCZg90vem/9kV42KKwkXcmqe4IhGqGEnrQqtpG6ahVUPZd8sYnBMMqHWk1abaRqaZmR3CsgmySEECh1drAchwRtuWIr1rBcu+jfcc3OFw8kapBBdJ8emOAH5ckmveKUulGoHFrbayambj+ZJj8/fkog+7M6KOEyA4tmuBnIWZVZg5MsY2dTOwjPoxxqQ4koGc4ulNDEYNULLInskNmTqeOEwvNUivvsdTGpnZuiLrmWfyf4lXKIlUAUeDYjbnYnKzJXNqVd3bT5J4mmWqebrxzgBWuM96pOWGpJywT1mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZJ/X+u8U/29vh7fI9M0yehytG9DbTBIQlZW3zGqkqg=;
 b=KLJE+NEtC/lxYQjk79RNWRNsVCnHmQscVpg8ur9Oz4uSUZARJPMj2X+ec9B+Xi6uDeSouD2FYR6ChfwIK7y69/6CX/7s5pKcmHss2mXlsQApx728jEOj5EJB3VL8CiRhik1hwkWeUS/Z5BY1Vncco1Y9JGCqe7FVkixzwB0OeEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7927.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 15:16:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 15:16:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 15:16:41 +0000
Message-Id: <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Link Mauve" <linkmauve@linkmauve.fr>, <rust-for-linux@vger.kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Eric Biggers" <ebiggers@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Lyude Paul"
 <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: aerc 0.21.0
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
In-Reply-To: <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
X-ClientProxiedBy: LO2P265CA0425.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::29) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
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
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: d150a84a-82ed-45ac-f922-08de64c990fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2hwR2lGMTZ0MXl1RFI2VEdzL0YwanRrays5NnZMa3hsa2xUWXFDSDUwa0Yz?=
 =?utf-8?B?cDBxT09BRmZTT2p0L2JBdmZxeGlHOUswbVRpWDh6MWw5TmVvM25HeU5UK1RW?=
 =?utf-8?B?REoxUmttdFl5RDJScW5NakM5Uy9iUGJIT0RjWDRGc0pSYXFyY1VoTGc2cElz?=
 =?utf-8?B?NXpRWElvbktheENJZERZZ2U5RmI2RXBQMHR5QUs1b0lTZ05GQXZNbXZFMHB3?=
 =?utf-8?B?VmZOTWdRRy9rdjZPdkY0MlhZanJjS3VRNmJLUm1nTVlmZ0FITWdVYU9rNm8w?=
 =?utf-8?B?ZTNhaXVVUTN1ZUpFL3ptOUpKY2pBYnh6RG93VDBWZ3h6bitnR3VBeEJiZjcy?=
 =?utf-8?B?RlVQZUN2N1VSWjE4bjBHN3ZqT205anVEeFgzZDY3U0lVVzZkS2JPM2hURCtv?=
 =?utf-8?B?dllPazJhVFloRi9vQlhKUmdkM1YvV2MzT3dXczhEKzNadmhtRnZnQzVLMHZ0?=
 =?utf-8?B?YVdBNGV5TUZzKzRiRENuWHJmN2dYQUFnMFhCdm92UTV3M0lZOGk5R3NEem9k?=
 =?utf-8?B?Y2VQcDY0eE1uL1BpSDJtVUZXeVU1OFNMZk9wczBVWS95angrZG5YN2VSV3Ny?=
 =?utf-8?B?czNHUEdiK0RuY1hla3F5ZWlvWWhNSXR1MExrRUwydG5Bdk9NQU1TQnQzZGhr?=
 =?utf-8?B?RkIraWFxcjVMZzhjalZRUTlsR0hpMjh6Q1FKU2NMc3J0a1NHQ1dTMXlPTXh3?=
 =?utf-8?B?cVgwbGdaQVBGMllwVk9lRTBJZnA1WTl5bEUvUmFlNGZ1MStZeXlkeGZuUWU2?=
 =?utf-8?B?OHpXRTlsNitIMEw1TkROQkFYNEprdUNmQ2FrYjc5UEtsaU5oNCtuMVhIU29z?=
 =?utf-8?B?RXU0dEFzeEVzdGVzNDBTWW5USlQ2SUk4OC9lSW9qQjhubGttYkJOcDlZcmtF?=
 =?utf-8?B?aC94Yjc3Rm9lSmtTcGcyVWJvQkg1ZXVmSVY4Ykt6V2pQM1I4TW9xNFBoTmJS?=
 =?utf-8?B?OVJ0YkJMWEpjSEEvV1IxbWU0dVNNQnZWR3l4QTduVXNRVTdGOWxBeGJYMzNN?=
 =?utf-8?B?NzVBQ210U0hWMFFmcnVwWXNhblZNQU1ZYnlNNUdWU0N5VkI2S0psNDdXL2M1?=
 =?utf-8?B?SUc1bEd3dXNBcmVIeVhHczZoNnFvNldqRzZSM2NjVzRNcytJTk91QmFNeGUz?=
 =?utf-8?B?T2xWcHg5a1hlSUtPeUw4bHYrbE8xRFNwMC9QMEt4UlF0RVVQOG5FNitlKzBP?=
 =?utf-8?B?VkFtbHdHUDNiNTFPSzhMdHo5Mk94RldHUVFSSzZBQlg4aWthNHFRWCtYb1lQ?=
 =?utf-8?B?ZURjMUp4S0I2S2NGaGxjUURGb1lhYnJqMDFuWmZuV1lTcktRbUdubWwwa2xQ?=
 =?utf-8?B?bXpQZXJqUmRSaTBjeFprQ3ZDSXYzZldYbzVBSnlYeVY4TmdPaldJeDJkNHdh?=
 =?utf-8?B?RHF6K3l0ZW9UNmF1djhHNGhiWE9Xbkg0NlBwMXl2UXRXbHViL0NrQmF5eXZG?=
 =?utf-8?B?UGhWUDZsaVhIb1pYcjAvOWhuRFZHdmJGYk45ZVZrbEI3ZysvcTEyKzF4TlFj?=
 =?utf-8?B?VU1VelRpclhDRm1hQmtuS3B1SUJpc1Jqd1lFYm51dzBFaVFPNHNDbnYvRHlC?=
 =?utf-8?B?R3ZvbWlzWVhsR0FKSmJtMEZ4d3Y2OEZ0SGFTNnFxOUlOaDBUWk9PUlpJOTJB?=
 =?utf-8?B?MU8xNmRHQWs1UWNjRkJ6UGhuekYvTUYyOG9BYWFzS0JjMnVvT0dFZFJEN0Zk?=
 =?utf-8?B?eUZ4RnE2bFpIVFRvR2IwR2dtWVN0aHJRTHhrZm94RGN1QW5CSHpJbjMwYmFB?=
 =?utf-8?B?ZkNHY1dkRWpOUzdFQk1UV1JSbkpoWVdsbUg3M1JiVXF2K3JpZkp4dWxHb3NV?=
 =?utf-8?B?a09hSVNYZ0xCTkRZMUl3Zmt2ZGFETHRPb0hsOHlJR29abGM3UW0wcGZwaDFa?=
 =?utf-8?B?M1pRY3d2cUx1a2x2SE5xb2I3dlZUVEUwcnZ2Uk5KNThaZFNMRWMrU0V2S1hQ?=
 =?utf-8?B?OUJ4TVF4TDN5cUFOdW1IYjcyRE80S3JDNmhJQjJ2bnF6WnBpSjZ2SjNXMzQz?=
 =?utf-8?B?QTFRWTVqTmo1cFZLU1NyTTJHd3A2SE4va3dkSVV4UnpyOXU5TG9SMnV3WC9w?=
 =?utf-8?B?c1I0Ti95UGhYaEZPOUtHS2FBK3RTS0JGNitOYno1SDBDT1gwbGZhbWw4UUds?=
 =?utf-8?Q?tY6w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy9jNUhqWFlYMDd4WWJ4dDczMDlOZEdLUXRNVjlWbTd1V3BlOS83M0VwcWNQ?=
 =?utf-8?B?V1NHSk1OUmwzTGVWSUdpcThEWWVMeUVEeWpPMXFnZm5od1g5U1BsVFlQR1pQ?=
 =?utf-8?B?eCs3eWRxa2wrNTlMc0ZENml6S3FoWUdFSFkvL25YWDBKeEZ1NjJ2UlNEU2Z6?=
 =?utf-8?B?YUJFMkNDckUwaWVXZUZXZVVtYjFoSVN1VUJKWHRVWXRic3hNdHBEQkJLWStR?=
 =?utf-8?B?VkdHbW9zN1pOVHJ1RGZqcDlaRytJK3ZzYmtucjdqNzV5QVdPQ0RxUWwvdXlJ?=
 =?utf-8?B?NkVhSXZRM1JiazZBTzZCNUpKN0Z6UDErOEI3TlV2a1psS0M0anlHSjcwSTdQ?=
 =?utf-8?B?V0VtSy9GNGtIc0JEenUxdXQ3VTdibmFBNzNXNGpaVXprakYxTHhGRWx1NWxN?=
 =?utf-8?B?cXUzNTJodUFNZXpHT3FKVnJCUTk4Mm94aXZuNjc5SE80ellEbEVWZnJwb21Z?=
 =?utf-8?B?WTR6bjFiZUw0b3RJL2l6K29NOGJvWi82c0hkTTg1TEpoKzNjeG45QjIydFhB?=
 =?utf-8?B?TERXM2ppQkh4ZEUrTWhQTHJTQXo4SkJSVDB6WEYyRFpDV1B3Uk1CdEVhTk5z?=
 =?utf-8?B?MW1wWlc5RmN3Vk5rWlljZXR5aW95M082bHNZYmthNVpZTks3UGtHajRIWE8z?=
 =?utf-8?B?ZFZMeXZEbmlNSEhoSkZXL3A5OS9pbG4zQjNCQnVobXlOU05venVWaVBzZ0V5?=
 =?utf-8?B?L0d1aHk0WW1nWkk4TURmbnp1d09MdVhRMngya1N3Z0J5b04rSTlWOXFETjZ2?=
 =?utf-8?B?emhIN1ZSb0pqRDVQQms0Nmh3ZENzQ3EzK3ExS2VCcWFrS05MbTZxRW50WlBh?=
 =?utf-8?B?cTVVN0JqVkVYWnUzbFJrVk5TQ1BxbHRkeE5Cd01xZCtMMjI3ZDhqWFJVczE5?=
 =?utf-8?B?KzF4Nk41RTEzb2hnRjloNTh6ayt4MW5UYm54RFJrc1JBZ3lZSHVUeUx6SjRN?=
 =?utf-8?B?cTdIZTA5SmFrY1NsVlhHNHMrRWFaeWpVcWhzaFZHOXJNZkhqZHlhd2JpNE95?=
 =?utf-8?B?M1ZhdS9DZTByUG1WRGVPZ3JOUU1qMFl6amgrQ0lwRkJFcEUyeDhwVTMxNlpH?=
 =?utf-8?B?NlhBYmk0MkNHeVIxUXpSaGlnRWs3NkE3bnZVL3ltZmdVVi9NU00wS0R5SlNM?=
 =?utf-8?B?VkhOSEhPZ1pCek1TZGpOV2tGOWp4U05TdGxua3dtRlVIenFLa2R6TlNzRDJa?=
 =?utf-8?B?aENaYkhVcGQ2dktVT0NrRTdWclRkQVpib1VwTkNLV3ZIOWt0SDJUcHRKQTZz?=
 =?utf-8?B?bzNhbjZjUXpkeFlqaWRBTzl1Z0hBanNaNjQzUW1LUk12bmkrVCtRSUhKelBL?=
 =?utf-8?B?ZnZpZ3Z0NE1HMG1KMHdONW5Xei9Pa2NvT2pqOERaY2xnMkZSaWNmeTRFV3pC?=
 =?utf-8?B?QWRldFRhRmd0NjljTkI1VDlhcWVRMHQ1cDZvTUtRNkFrVmtCeFJETHFRK1Vh?=
 =?utf-8?B?aHdsSnpiNDl5eDRxWldTVkRqeEZKai9BQjZZam02ZW90Z2ZtaUwyeXlhTEhN?=
 =?utf-8?B?dDNCNGxCS2NXVndEZ2VmSUpCcUFqWStjMmdMek5sNHZELzgvRlp4QUc5MEF2?=
 =?utf-8?B?M0NCd3pvWlptZWNMTGpLUDJMb1U0UWJXOVBqOHZIdENFN2VxWGF4c2Q2QVZG?=
 =?utf-8?B?Tlh4WlhxWnhqYmtuQ3dDL0FBQlpTUjRhYlNxbDJYVkhlUDI1QXIxZElYaDBD?=
 =?utf-8?B?OVhJTTF5SEtiZ1QxeXdmMUZpZUtjRXlqZ21SbGJFSVAyNnR1cjFGakxBOU0w?=
 =?utf-8?B?K2M3OVNHYi9KNFBqWmdqbmFoR0hOOTkwUzJ6WDFCKzUvdGYyWjJOMTdXT2ll?=
 =?utf-8?B?VGd5NTNOYWhEdm5tS2JvODcrOEVvTXJFQXF0Nm8xU0JUbVNoL2lYRGpYbytT?=
 =?utf-8?B?RWErelJZVVRDVW44Q1E0VTdKYko0UkdKR24zSXh4a1k0RTdpMVdRRG4yYllH?=
 =?utf-8?B?Y00yTDBIUkYrMXI4UkhLYW9SN2xsNWxvNUUxM2N1QlNZcXRBbWl3eXBZbVcv?=
 =?utf-8?B?eVBFSlZWQWI1VElGZ2FRZzNucE53VWZjdndZck9ZcnZpSzYrVi9jZDk2dTAx?=
 =?utf-8?B?bjdkOUtDQWxTNllnVDhLRVR2ei9OSlR1NysvZENZMjk1Vlg4WHQ0ZmZrMURm?=
 =?utf-8?B?VzJXTGp3UGxjdHBucHpPMGJ3d1l2U082WC8wWVdNdHYxVE9XUVJNK3hwMTd1?=
 =?utf-8?B?bThXT1l3a0RqT0RNMERNSFhHdzhmSUgxV01sY1JLcElPdHI2ZWN1bTU2emhz?=
 =?utf-8?B?N1k2S1N3dUZvbW11bVhCZmp4NEVlalZYZTB4T2w2ZEVJRjdiQXpYQ2I1eCtD?=
 =?utf-8?Q?k7NosQKO2LZ4AVSVDx?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d150a84a-82ed-45ac-f922-08de64c990fa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:16:41.7828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VW9QEpwV4oVq51qrrt+B5lTXcN9oF6pcmU2kH5FX1LO0fq5JZ7cQ7MQQ7cQGWMdFUY2YUpAZ01w7dRSyVBuDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7927
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16621-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:dakr@kernel.org,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 80B43F4827
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 2:28 PM GMT, Daniel Almeida wrote:
>
>
>> On 4 Feb 2026, at 12:18, Danilo Krummrich <dakr@kernel.org> wrote:
>>=20
>> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
>>> Another option would be to call u32::swap_bytes() on the data being
>>> read/written, but these helpers make the Rust code as ergonomic as the =
C
>>> code.
>>>=20
>>> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
>>=20
>> The I/O stuff recently changed quite significantly, please have a look a=
t the
>> driver-core-next branch [1] in the driver-core tree.
>>=20
>> Also, instead of providing additional *be() methods, we should just crea=
te a new
>> type io::Endianness and use it to indicate the device endianness when re=
questing
>> the I/O resource.
>>=20
>> For instance, for your driver we could have
>>=20
>> request.iomap_exclusive_sized::<8>(Endianness::Big)?
>
> Can we please structure this in a way that LittleEndian is the default?
> Perhaps using a const generic that is defaulted, or something along these=
 lines.

I think we should have everything default to little endian, and have wrappe=
r
types that do big endian which require expicit construction, similar to
RelaxedMmio in Alex's series.

Best,
Gary

>
>>=20
>> and then let the I/O backend choose the correct accessors based on this.
>>=20
>> I.e. the device is either big or little endian, hence we don't need to p=
rovide
>> both accessors at the same time.
>>=20
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git/log/?h=3Ddriver-core-next
>>=20


