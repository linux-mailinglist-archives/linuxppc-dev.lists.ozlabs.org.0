Return-Path: <linuxppc-dev+bounces-16639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEggBl4ahWne8QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 23:31:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355ECF81A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 23:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6X5N2jF7z2yFb;
	Fri, 06 Feb 2026 09:31:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c206::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770330712;
	cv=pass; b=SiGpDkWpkmUf1RycEdK8fRBgVmepM4g3VVoNFnGwNBQdgPlmkQSxjE6JWQ16xAZ8djFrK3ZfdbAtC/1S1+ikU6dqKA5yjbUSHhLuxtRmQnTT9qg55HOoMYQEtUxi1XhccmhtTb9IhgZkqM4JBri2lZW2JwktwAi5k1xvI5sWtFRhV8PDGMxEp88H5n9a2Ia9IBsimlY3almNl7YKqKV42GgZNBDaXUZRrS9vrbMbpGLZlLWZCDPz0Kkwdja/O4151mEjt8RxIjToqk+jaKURrOTO7UAQZ4EY1Y9mrArJ+61CYXA4d1GH+7eEGf6foLcmWiEhwpqZKhApW/vHMAh9CA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770330712; c=relaxed/relaxed;
	bh=KS83uiuF2cI1EHYv52i2+VVIIWzuzTKjkqhmQEcgMM4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LWHzvcMGKk4FzWi6FV2pbNy6bFi677BmtxNKxGgjtfGfiZsTdGtyhvjANN1f1hcoOAejpPDFiaAQlmRu0g/1xOKF/d4RN0IdEeGiv2EfeoShIuZ5GAkuEfw3GnAbzsjnxnJjvFV53oyz3EtpFZMr+yGK3l7VaiLf0ioGunzcCn0XjUdYJ8RbZ3Sb9yXNK1OCqewRPPH7ybOiOXf5pSmKO1sG8vCgRj+cOqq4oR2xcg9SUdAsQTGfap5+BRfIOrmjwNvSOgmitXp+82zJGiuowwp92QCSywnv4zq8zg9KGjWWBFJiSlXO0HnQBWOF2xr0KeEDevJ6LwWwzSSOf59PHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=jT4b4fW6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c206::3; helo=cwxp265cu009.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org) smtp.mailfrom=garyguo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=jT4b4fW6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=2a01:111:f403:c206::3; helo=cwxp265cu009.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=lists.ozlabs.org)
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c206::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6X5M0xGSz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 09:31:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iepIm0tvSPrUk/r96HUtgxun4R27HmBhzkedjsrVvq8dPo9B9sNd+gavrCZQmCKqjbQPzM4BaWfaxbqGxCUIjo/cVGYEOyP25ltTep6zpeiRFnnKyVCszzHNXrMLeBwPSJJtDJueAKBIqwllgEfT8hG2e2i66IG2k4mQ6jUJ+PH25w+vPuuuzxx8LIDlCPH/FIzFg6Xa4q2VIqvglWQVBbQAgh2PLohg6mqnlp3AfQwr+Gang5fYaQ6Kgn/joR3t8F3GF/8m/hsnHWh6KoMPmt7S32VEiKkyK3vNMSB7qnOgteVfVTy8d1UywYzmeU0plx6eNQ415rp6tQXRlEwpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KS83uiuF2cI1EHYv52i2+VVIIWzuzTKjkqhmQEcgMM4=;
 b=RWWssPs61cuQfO51Tx6YiMGr6LhgkooC6Doun/c8PUolqexSuJ1E/aC6IaLXRsYPVgvg73+pQOOH0n8/ndLbvafKWDKcbXoDMWYGFTEcEFSxU24GNupsWHYbj59GkDB6TaNbwx5XN0AtLJjTrhMIQNHGTLXeRmyiaxQXvEVbSLIVK9MqFdreRZueKvj7O9qIT7DwNAi1ibPu05IeOz92t6iQ6nFoTicq5CbB4xqIsR3ZXq0xG4rmYwCWtx3N1D403mVig5Y8DPsETimbrNufRmJ3xFTwfdSSJ15AuwDwRJeEDbYDckNFUmDE1KosLLIiDPCMpT/z0eY/YWnvb5qG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KS83uiuF2cI1EHYv52i2+VVIIWzuzTKjkqhmQEcgMM4=;
 b=jT4b4fW629VDcDgD5RMmAmiM680vC6xi+TmV1/vBajTxRHnBvcT8V3k41oC+twn/ld7CGNBgDE+C3nllvRD3G+9c0FCY6TL7+jKLGVcMUN7ECA7oJogr8HoPlq56TyKB0d8+097ByMpXIopQoOeqAJrEuj56v09Swxz+l7qrUIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB1948.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 22:31:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 22:31:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 22:31:20 +0000
Message-Id: <DG7DUN9M4YIU.KNRN6FM1K687@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Link Mauve" <linkmauve@linkmauve.fr>,
 <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
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
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write
 functions
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
In-Reply-To: <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB1948:EE_
X-MS-Office365-Filtering-Correlation-Id: 90da5a6a-ec92-4565-d905-08de650649b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVpvM0dGRTJPeEhYWThNOGN6ekFKMWU4V2drVU84TWNLMlNJWDFEaHUwZXZ5?=
 =?utf-8?B?cVF4OUJZRGtBMlpTNkIyWHowWDV1QytMSlUycUxCNDBIMmE5L1ZBdDZKSUdu?=
 =?utf-8?B?cUgvNzJlQW94c2RXS0oxWlJOSWFLcy9wVlVMa2YxMGlJc2EwNzBicXhGVHUv?=
 =?utf-8?B?cWtrTnlDRHF1a1N1eGJGeVk3SWZXVWt3V3J1NFZCcDloUzlWTFUrK3ltc0Mz?=
 =?utf-8?B?TmxkNXl0RU1EZTBQZklvcXFTeDdRbHhuMW9FdVB4WitnU2J6S2NXRkRrZ3Vy?=
 =?utf-8?B?S2EvTG1QSHp0RnlhRFNLdnRYYmJZM21taVZqdDRnRVRZWGhqUnczQmpFN0ZG?=
 =?utf-8?B?WGZsV2hqYjAwWnFHdHpWNUU5ZkgxV1VGMWZlVTgxWTBQd0FKU0NUTjFzMEZQ?=
 =?utf-8?B?T2ljckQ4Tkw2aFQ1aHFsMXMyT1dFeUo1TG1lRGw5eWcwR3I3SjlhUjlYbjUv?=
 =?utf-8?B?Z3ZwNkFnYWNmS1BkZytwOGJYWTlWZW5SZ0lQZS9WQXJ2RzRZekxKOWQ0ZGp5?=
 =?utf-8?B?aDFJcHFxQ3I1RzFIbVBrb0ZnbDYvaUhDTlNaRk1naTUwTExGbEhRVm5NZmZm?=
 =?utf-8?B?L1QzR2RaQ0FuUXVnNVBEbDV1WXlmRWk3TzZ5YUQ0NDBJeFpialZXaE92QXNI?=
 =?utf-8?B?dzYyMmlwZkxCcXordFVnOVdHYlNiVGdrTHJvUFBHZDRyb1RjSWZkMHBUL2RZ?=
 =?utf-8?B?VWZNeDhleUltQW40ZkZkaDdmYyttZm9XaFVKaVBRWDdMNlpvMXpPZE9ia1dv?=
 =?utf-8?B?WllUQlk5dDFGTFFFSUQxN0YzYWxucm54Qkl2NTZPQkl6OERuRlBubjN1WnhE?=
 =?utf-8?B?TGVkUTdTNTIwVzc4STRKL1E2VWZKVThBbEhBWlNhcEFReFpDa216OGlUNHZp?=
 =?utf-8?B?VWMrcXJvK0V6dGlEWUF6ZlMvVnpOV3ZYVEQvVTg5S3pFaDRRVVI4K1hGYndx?=
 =?utf-8?B?Y2FUem1zU29nbDQ3MUF3R0dGRmNuOWoydWkrNi9kNkp0QVBuYmxJWWZBQ3Fs?=
 =?utf-8?B?cnZhTWIrK3N3UTFlcHdsektqeEFIN0NCMEhJa3lJRm94NXpyVmxMaTZQQjUv?=
 =?utf-8?B?RnN0aTdzVU5rWG5GWG5KcDc4MjZSellqL3k1U2dxK09qakhmVE9aZ0o3TVox?=
 =?utf-8?B?YVZaT3NkTXdjSjB2aFA1SzF3UUo2eXF1VllCMmhEQmhackVzU05TSjFZVEN3?=
 =?utf-8?B?MzkrWDRudm5zeDl2Ty9hOG10ZkYzTDFOcUlqVStnVUVTa2xlMVV4bE02bFhM?=
 =?utf-8?B?R1lzSms3NWE1eEwybStFS2EyellEamx0Vk45VWNQSXIzVmhVNHNWSWxsSExv?=
 =?utf-8?B?SWFvRzI4UXhSbU9aM1VQWHNEVzFqbllCRkcya1BVNGovMldGNTl6cFBPR0h6?=
 =?utf-8?B?bHk3VVRhZzRLWkptdXNURUtES0l3alVXSy9NdHIzRjZhOFVIOHBzQUtOcDlQ?=
 =?utf-8?B?SnVKUStjc1M1MG9HcjNHcnBhU3FVajE0bGtVekx5Z3BPbjFCbG5UL1pZeGVM?=
 =?utf-8?B?MlJTWXJHTXdEWUxqamQzaDVJZ0h4VjQrMUFLcitSY2JvRkg0Ky8va0wvT1lz?=
 =?utf-8?B?dDdUQmYzTjVNUitOUWs1aTVvVUZuQkxZdHUyckxyUUNQR2k1ZXcybWs5VGpy?=
 =?utf-8?B?anpsais5T3pIVzhiTzdxNjhEakFHMWhFQ1RMUitIeUtsdEw4WjJzWmprTTVO?=
 =?utf-8?B?dzVLL0x0NXhNcmZxcmtvT1dvaWdoMGVxRjczK01kMVRBaDR2MkN3NjBlVWx2?=
 =?utf-8?B?Q2NuWmphT2ZETFhibnNlZWpRUWRZTGNESmx2ZFo5U0g0NG9SMm05S1JLZ2Uw?=
 =?utf-8?B?SVd4SFBhT1I0MC8xTkprUXhvVHorL242ZjdTWlZKQkVXMFI1RTVUSnRtZVU2?=
 =?utf-8?B?aVZ5RGo0UGJ2c0h4L29vT2Z6NFNDUmQ5K3ByT0FGdG5Ja2g4SUUwZSttNVNm?=
 =?utf-8?B?WjhvQkg5YUVIZVlPd2NMSVRicXdsVEZaR0dITnhmd1RJcGI3YXFadlVCVnpS?=
 =?utf-8?B?NnZLOSszbHcvb1BVd0dmQ2I2ZVZ1MGVXamZ6U0o4ZWs4eElRb3dubGRBci9R?=
 =?utf-8?B?NW0wOVNmT1B3UzBPLzZVUmlxRWx2N1UzN0x3OS9ZdVYyOGdUN0FjYlhnaHRk?=
 =?utf-8?Q?tInQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTg0aUtwWmlNU05oUWoycWFBRThPQWRYMGZhMkdESXVhU0FhMDhIOFFSdEcz?=
 =?utf-8?B?cFlGR2VZMlNFZ2NwNjRxTXd3MGRvdkpEYTRIUFVRdFVoeGJ5cUwvd1VtOUM0?=
 =?utf-8?B?K0NrdDRlT0doVkw3cHUyT0thY3gwWTJ3UkxnckxHSW1McndJK1NFZWJ0dko4?=
 =?utf-8?B?emdLRVhWMHcwWTJ0VVY3bzRKYXNKY2JQQUZ1N045YndPSFpOOHNZaFNpbjRh?=
 =?utf-8?B?NGgzM3dCNFVSQXJhSklGbWRKbU90ZzFwYlBYcEszcGNlOS9VUU1RSGVHN1pq?=
 =?utf-8?B?RG1wY0xnbTNHTGZ0eUF6R0FUVTd1WDBhVWRuVzEycUo3cWhkNzhBdHpVaGZq?=
 =?utf-8?B?VngzSTdGQTdpWXpnKzJKeEIrbGEzd0hUUkdVcGZJc3F4M0F3cmdqbVRwd3Yz?=
 =?utf-8?B?NnNIRTZ5bFU5MmxuUzF5L0VVOE9Ea25YYU1jT2RvRUtkbTIyTWpiMmsxK2JO?=
 =?utf-8?B?U25jNkFWaHJFTmFWN1ZmbTJadGQzc3V0QzgwZlNXS0xKbDAzWkFjK1VjWEtL?=
 =?utf-8?B?MjEwZE5XZWs3eHZGNXR1WUdLOWprL25SSWpYREE0OURDeW1SNTFtOCtqMXpB?=
 =?utf-8?B?Q3lqa1VQMHEzY3U4ZGhIaDJCbCtIRnFzdVRkMFJEbVNwWnhMWm4vaDhxblB3?=
 =?utf-8?B?K1dwaUZFTUprQ3FIemx0bGgvb1FqaHEvbENObnBxNHMrcTRXcGRGbk1Pbmhy?=
 =?utf-8?B?WnBDbWtlTU9CNlZmY0hpTHNrNU5aYllzcjhvUHFwZCt4SUhRaitrRjhwVWZv?=
 =?utf-8?B?aHRNajNDNmxSRWM3WDdqR0dsMlMyNVUxd3lBSWdOc1N2ZDcycml5RjlRR2pr?=
 =?utf-8?B?UnlENVBRZndtbjc3V2VqdzUrWjFuWUhSdU5haitmalhRM0h1amxSUWJZZ2lu?=
 =?utf-8?B?d293WUhmUVh6K0R1c3p4TFZRYkNCUEpPS0NwcUc1Uzl3RFo0ZnhNYkkrSG81?=
 =?utf-8?B?ZU5yVDBEUXhLWnJibGt3UmFtRDZKZWhHaEJ6M3JVSTVaUytCYVFWSnVVVitV?=
 =?utf-8?B?M1RHS2ZQUHNEcEt3SDFHWFBKQTU4bzJQRXIwOVZ1alFpRnBMcFBQcEdzUDJv?=
 =?utf-8?B?MGZYSTR6VDFkUDlJR2E3N0YwZ3FibnBobElJS3dOLzNwTnlyRE1pYnJBTUVL?=
 =?utf-8?B?cFN5WklCVUJLT1ZBcWVDeTlWblBUWU9CSjBRZndaWDlUZWNCc0M1SElmZzJ3?=
 =?utf-8?B?MGFSNEM3M3BRM3UweC9obVFFZUJaY2lXNmpsUjlwRGpGVThFNTlaWFFrbWVC?=
 =?utf-8?B?TW5VSThrMUUyRGMvbjlJUTZiTDR2eko1bjhYZTJEeXpPb3VmZmpMQ2ZHcjI1?=
 =?utf-8?B?cUxEcTB3b1ErNGdqTy96M0kvdFRmVVVwQkRtM2JocUdvS0U5UmtrZ0NiQThX?=
 =?utf-8?B?aVB0Q3gwbXUwN2J4Lzc2dytpWVI4cTEwS0V1ODhRNGJPNDNnUEhlN24wMGxU?=
 =?utf-8?B?dE5NYXA5Y0l0VzZSeDZCQWhvbmpRUGNRSGxsalAwclFqa0w3bEt2Q1l6czdZ?=
 =?utf-8?B?MUoydGVJVEpUU3E1Mjh0V2tqRVlhZlc2c2syc2F4WnNrN09aWHVISU15YU5C?=
 =?utf-8?B?cjArWTIwSVlhOUNmWGNrcG1JWGNWcnMrcUNBMjI3UEJWUWlqbmVXZHU4RDJP?=
 =?utf-8?B?OFZoZFZwYnBmYzJyd1dSa0FJS1piQThqVGtKTzJnWEczaUk0K1JKYTVybTEw?=
 =?utf-8?B?Vkt5UDBEVkkwNjUxMkhlOEhvWG9JSGZ3RUFIdDJSTnI4dDlxUm1ZRVdLclh1?=
 =?utf-8?B?ZmlZZTF2RFRSTEliWStNOHJMMHNVS3ovdElWZXpBUUJOTG4vQ1doOVJ2Q1Q5?=
 =?utf-8?B?dGxlUkJJY0FBQTdhbWhzNklRc0JPaWFPMkpqa1loNEdHVkw2OTFDK2lSZXJq?=
 =?utf-8?B?dFFrZXA0MTR3a0czZGVqWmNxNDlsVUN5UTlFRVhLK3R3RGZFa1dac09Da0wv?=
 =?utf-8?B?ejFJV3ZpcEt1K0FzUmN5Q1ZsQjlZcENFRy9GODVoN1pvNFN3WklwU0JZc1Zv?=
 =?utf-8?B?b2pSeHZHZEQrNHZDWlhBTU41TUc1YWpUZ2xVNVllcEJUVlNEdjRNVmJwL0R5?=
 =?utf-8?B?eDZKNGk4ZTdVWjNOdUtUeFZ4RTJLNWQyK1pxTitQaHdLOVZja1RFN00vOFB2?=
 =?utf-8?B?YnhXYlN5Uk9RRzBwQzk0bUZlYlhJcWtHUU9tSkx0TVJwN3M4Z1FWWEtibEJP?=
 =?utf-8?B?aFl0YnNLWWRYU3dJZE1aNHZqNXBEd1BOOGwwaHFqM3FjZkV2TXRQbkZ1UzEw?=
 =?utf-8?B?Z3lGNWpJOEZ1RXBFcXZzMXJndDRRVHBzcUR6QURSMElqUGRid0dOYktpamEw?=
 =?utf-8?Q?wj9PlDzgfNahpTjrZm?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 90da5a6a-ec92-4565-d905-08de650649b8
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 22:31:21.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VNx1AkxX5FdfXpQmZGjLapgL+OQBYntgwVZrwovPbvdDOozQkct4vFd+DbO/qPrEVdHROD3CN2cYqUwI2u1Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB1948
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
	TAGGED_FROM(0.00)[bounces-16639-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[garyguo.net,linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 355ECF81A5
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 7:05 PM GMT, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 6:28 PM CET, Daniel Almeida wrote:
>>> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
>>> I think we should have everything default to little endian, and have wr=
apper
>>> types that do big endian which require expicit construction, similar to
>>> RelaxedMmio in Alex's series.
>>
>> Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that w=
e
>> should head in this direction.
>
> I strongly disagree.
>
> This is a great pattern for relaxed ordering because:
>
>   (1) We need both strict and relaxed ordering.
>
>   (2) Relaxed ordering is rare, hence it doesn't hurt to write e.g.
>
> 	io.relaxed().write()
>
>   (3) If you by accident just write
>
> 	io.write()
>
>       i.e. forget to call relaxed() it s not a bug, nothing bad happens.
>
> Whereas for endianness it is a bad pattern because:
>
>   (1) Devices are either little-endian or big-endian. Hence, having to wr=
ite
>
> 	io.big_endian().write()
>
>       is excessive, we always want big-endian for a big-endian device.

You don't need to always write this. You just need to do `big_endian()` onc=
e
when you obtain the io, and then keep using `BigEndian<Mmio>` instead of ju=
st
`Mmio`, and the rest of code is still `.write()`.

I proposed the wrapper type because majority of devices won't need BE suppo=
rt,
so adding complexity to Mmio itself is not ideal. It is also generic, so it=
 can
work with any IO backends, so for example, you can have `BigEndian<Pio>` an=
d
`BigEndian<Mmio>` and you don't need to duplicate your endianness support f=
or
both backends.

>
>   (2) It is error prone, if you forget to call big_endian() first, it is =
a bug.

Moot point when `big_endian()` is only done once.

>
>   (3) It is unergonomic in combination with relaxed ordering.
>
> 	io.big_endian().relaxed().write()

This might be an issue, as `RelaxedMmio`, unless `BigEndian`, cannot be
implemented as wrapper that just reverse byteorder. Although I am not sure =
that
we even need that support, given that there's no be_relaxed functions on C =
side
anyway.

Best,
Gary

>
>       (Does the other way around work as well? :)
>
> It makes much more sense to define once when we request the I/O memory wh=
ether
> the device is litte-endian or big-endian.
>
> This could be done with different request functions, a const generic or a
> function argument, but it should be done at request time.


