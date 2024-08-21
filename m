Return-Path: <linuxppc-dev+bounces-261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9E95970D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 11:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpghm73lYz2yDm;
	Wed, 21 Aug 2024 19:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::61e" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=aKiKHnrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpghm4zW9z2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 19:17:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZwxjiuiO2AEnmWpgxqvfBFd4/lr47/KPwQuBLA8ltdmi+pBbpf7nsmualVh8DAR+2dONjpdvOU8RXqcLSBRg0XGZl/h9KkSPySoJsVeHcuh0c/qAO1Qg8hlKjC39TM1QrzgFNOJUI82Uzzjy1QJEWttrIzOdbn1G49MF00AIC2A5qh79KK35KJf2z6GLQgWmePSI5jenXXY9BPW2V2pdgvFKHuH5gVHK0dZICKvts5Ge401Xj4IcQJu+eaKmejt0oODRwdSxBdgdLI5Hbwpxb0gTqFbFI7nXF9hWy58iQHqNCoi96PPYs8LkfrbdbqGWfDY/42Kql222VFVXIDllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYIcDl7LiHkaJTLPTD/fi7xvGa2JPZW15bkE/bGh5yI=;
 b=p+u4Oway9WvEV/j8iV2ioAwCsHQ/6j+sIv5wKeUS3XSfd86IIAeK4oUS+/bxqtWcgfaq66RpLVfHxKxOfi1/I0ORNNzXC/6Rqa3JscUCAOvPV26R33hY43+3+PExFJBlgOouC3wGPDtmAe1DN4eXYQAyqLXBNTSFvoBXWBqR8QjgNGT91o9s76yeAiDig//KyvqqF4YDJr6PxhmOZKwWgCONBet9h1XNyGcPsL2cgWHWa5e7IBz552lILhooDt7Fd+ZznS0BwKIy6T8Baog+iST6xVCpZkTUOZJolDKcGlN0sPaMQuf8LnU6x3G76IeAeu1w4Ng8idKZ50S4KbgchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYIcDl7LiHkaJTLPTD/fi7xvGa2JPZW15bkE/bGh5yI=;
 b=aKiKHnrX01511UlVLyGnd8UhRg8Gr+/Fuu0EjsYqc5PkNkQzGp6Q/OQ2xgm3unruX7EHdNtoF179gHWaqczjDSS/dbFshrdC1a6Fp7C+5q4WGezW3NQ1TE9yFbjCiIZGD3beYV61dNbnEGH6te7c2IHbBywbQ/mS8JG+s/oSe7OmrxfkC+AQNqZCMniMZCAjsNitmsWpaIsV/kOsprFN9IsPjIkgNrt940JBRzAD3s1hfq6LLlPDCs4zIMvbSRcwyyKc81E2UJTlVA5ukVzozA8r3M5pMWV3QUA9kE9bBvR+b0/JLT1Jf/TA4juhK+c8Mae/sOc7GUD/sClKq43aBg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AS8PR07MB8101.eurprd07.prod.outlook.com (2603:10a6:20b:370::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:17:09 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 09:17:09 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>, "david@redhat.com"
	<david@redhat.com>, "hughd@google.com" <hughd@google.com>,
	"willy@infradead.org" <willy@infradead.org>, "muchun.song@linux.dev"
	<muchun.song@linux.dev>, "vbabka@kernel.org" <vbabka@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rppt@kernel.org"
	<rppt@kernel.org>, "vishal.moola@gmail.com" <vishal.moola@gmail.com>,
	"peterx@redhat.com" <peterx@redhat.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 06/14] mm: handle_pte_fault() use
 pte_offset_map_maywrite_nolock()
Thread-Topic: [PATCH 06/14] mm: handle_pte_fault() use
 pte_offset_map_maywrite_nolock()
Thread-Index: AQHa86L2C7L9i4PU0UqhYgOj/GpUYbIxboaA
Date: Wed, 21 Aug 2024 09:17:09 +0000
Message-ID: <6a586524-5116-4eaf-b4f3-c1aea290d7c1@cs-soprasteria.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
 <239432a0bc56464e58a6baf3622fdc72526c8d57.1724226076.git.zhengqi.arch@bytedance.com>
In-Reply-To:
 <239432a0bc56464e58a6baf3622fdc72526c8d57.1724226076.git.zhengqi.arch@bytedance.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AS8PR07MB8101:EE_
x-ms-office365-filtering-correlation-id: b13d4860-010d-401f-d64a-08dcc1c208f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTIvaE1EcUE3MlJEZHArdVgxY0p3WWpWcFBiQjl4L2NUaVFkOTl1eDI1YnM0?=
 =?utf-8?B?VVFITnMzRXZBdUxXRlllYnFlakpGTGdWYVFyWGllTndyVzZBVmVEbkpZb1FK?=
 =?utf-8?B?YzVUSmZxMW5MZWRsR0lhalRQRHY1Q21iTmVxMGhkdUZXZ3J5SWx2YllMaVdq?=
 =?utf-8?B?VVhRVnkwQ0tXdktidWtVS2xSZ0hZZ3JtZ0tIRnVaeVBLYmUxd0ZkSWRsZzZC?=
 =?utf-8?B?dVVjOU1jcjdvMWhFS051bTl6aFdZT1p2MzRneW1xVkdPdkhQcm5QL1NGOW5I?=
 =?utf-8?B?ZE1oRnpmWjM1eFMxMDJlOE5WL3ZjOU56cnRRWk5mWE1admVCOXhMMWFrbDhi?=
 =?utf-8?B?S3dBMFNiZEQ4QkVTeFlGSEtySUFuNmJuSVJ4S3Z5Qm5qU0VMRlBnYm5NSnU3?=
 =?utf-8?B?N0ZOaFJadThHSjdIaTJ1ZVI0RlRONmMxeUF0VzJNUzV5M2cwc2Zwd0dITGI3?=
 =?utf-8?B?aGtyTEd2SGZpZDVHSjhqdVJ0QjlnVmdwWVhoM2YwYUM4K1ZMNmI3U0xFbCs0?=
 =?utf-8?B?THF5b3UwNkFXSHcvYWJqZmdPdGVBSXBGd2xPZXl0MEZaNVVMaEZBY2Nza1J1?=
 =?utf-8?B?M0x3UjFvNmpCUmdXRlpHeUt3WEhLRFNIUFI2Wjk3eWFqcXRRN3g4VE9xV3px?=
 =?utf-8?B?V2RrOGNpV3VOblBtZThiM0ZlYk02dTVpRmlnUy9rYmxpSG9GN3NhdzBXTjky?=
 =?utf-8?B?VDJxRW84MFVia0RZd08yN3F3TXpyK1RObU90UUNqNU5yZExsdVcveHhneTFz?=
 =?utf-8?B?SkdrbjUvcHQwbEJEU2l1MExhMTAxQVN1N3hjOGVQM0lOZlI2YlA0WFVjZDBG?=
 =?utf-8?B?cUIrL20vRlZHSVNZeUpZaDc2REF6Yjg5QUJwYUJFaHh5dGdYeTVXMEFpeXNC?=
 =?utf-8?B?eHVUS3V6c2xPdDladnArVDVIRHl1dnRDR05idGU0Um1sMk8vVTJxOWdJcFJV?=
 =?utf-8?B?SGhVZXJ1ZmFNbGI2b25MRmJ6MTd4ckx3MXE4a3BVRXBvR3VNWFcxL0cxamcw?=
 =?utf-8?B?RlNoTm9tS1VNcHlTdWhvRlk2ZytBQmFVSkx6OW1RRTU4ZjJoL0I3R1ZNRDNS?=
 =?utf-8?B?Mk1UQXJhVGx4dXNzVmJsRTdDREVIRVpVMFBUT1lWNGpVWE82TU9wR1N5VjB1?=
 =?utf-8?B?SWRJK04vbXFldGJKdFJjQ1JkN1RoL1p5K2ZIaTk1dFp3anIwUVRTUU1PcGNk?=
 =?utf-8?B?ekp1MkFwUmRYM0VTcXNZWHVhekUrbDB4OXNZeGN2WkcyYkhnSTUrNFFpb0N3?=
 =?utf-8?B?dXFGZVVVMjdIMFRQeFd5ckt5c0NsK2p4S2hCSWJROHRHeGxWUFhvSnhjeEdF?=
 =?utf-8?B?empPMGtFSU16cy9NSEs4T2xhaytSSGthZ0VaRHFOM0NDcmc3bWcvci9HM3Uz?=
 =?utf-8?B?anRaOGM4Mk8zYzlxWEV6OU1aZWZCNVVPWnB4S3htTzRraFNYVnZINGtwZVIr?=
 =?utf-8?B?Yk9aM1puaU82ejBLd29jRXQzVVR5YUN5RjBhcDBaMUpyN0RkZjh0Wng5QTBF?=
 =?utf-8?B?MnBvNXV5d0JtYzlISnQ1akIvbjlxT0JvQWFWWEo0d3l1cWgvQ3Bwd1Z1UUlx?=
 =?utf-8?B?clZ2K0pkL21jRkxQdVRtTm5ubkhuN1ZVV1FjWVFEdDhPcDFDa0kyWXdxalpR?=
 =?utf-8?B?U050azRqU1lvTUdmanVodlFWODN0cHFjeDNqY1JSMGdaY0Q1Y1R1bVdJakFl?=
 =?utf-8?B?dnlnRzNjcjNhWWNyWU9QNUVXVjBFdyt5VXJqa2ZEbzFNN2NKQVBhTTdURG0v?=
 =?utf-8?B?SFNEU3llMENJZ2tXT3kyWk4zUlg3OCswZWN3WDhpRjd0RGwvcGdVcnpySFNk?=
 =?utf-8?B?UGx4RVFDUnRYTzc1NkdvVmx6cE9xSldFOTlqYU55eXFpMDVKck5RL1JJOWtN?=
 =?utf-8?B?R3NKY3hQRmZ3Q3RnWWVKUGc0RFlibEJPU2JUSERta25HcG9objdhOGk3ZFpx?=
 =?utf-8?Q?pzp3lub4MJs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEVsR1E3d0NxZFZNVnZJRnBoeXYzSzg3SVRJajBIUUpkbDZiWDlZZmxYTXM3?=
 =?utf-8?B?bU9EMDJyWjZ2Qm9kR1ROTjh1cHFOT1dvU2tUZTJMazRQYnltZU5UcHJSYldI?=
 =?utf-8?B?MEtXZ2o4eko0blllK2tmekI3SXFXS1I4czcvY0FyVXlxOVIwUFIzekRGTnRw?=
 =?utf-8?B?aGozY2s2cnhHbkd4REp3SlhqVVN3NFlVM1JLMEpEYVFhVEkxekY2MTh2aU82?=
 =?utf-8?B?RmQ3QklMSlVMOGtZWEN2NGs2VENGRjNWUS92M2s3cVd2SmNLbTNiNzlWWUd0?=
 =?utf-8?B?eWh3Ky9PR1o5SHUxNExMRll6Y1pnMGhyNjNOcGtNVEYvbkhZRmpTcDJEQ1F6?=
 =?utf-8?B?L0lYai93bFc3YkFHYXd0aXpadmNYZzdDWUZsalQydm9weVhFckhTVXF5U0hy?=
 =?utf-8?B?VytOQWFySFhDVjd3cFdYVGZ3RXQ2VlFnYlcwUHNVcW84V242RVJUazRQdERu?=
 =?utf-8?B?MmNRYXVhSmNRMGVoVXlzSjdIc29LZ0VvazU5YXFCRTlyV2lmUGtDL0ZiM041?=
 =?utf-8?B?UC9iaU9rMThOZnVHV1N0WXRRdXh6ZS9GemJ1djhPRS9ZZnBGWjNVOTVHUjMz?=
 =?utf-8?B?N0NGeUV5V0x1OFR0REltcEJWWTVYaFpRWkxkOFV6Rzc4b1UvVDViaVlBQnFq?=
 =?utf-8?B?Z3phcVNVUjFPV2xLNjloM3IrZFd5dmNJUkZDbmQ5c0dzN21USVdRSDA4WndL?=
 =?utf-8?B?VGk1ZUZvdGxuNDVKbmwrMW5RMUZKNng0dkFlQWJMbWYrc1NVVkdVcHpVT2Zj?=
 =?utf-8?B?bnA1TDh2U29lOGhPWUVMaW81WUQxWURpanBxREJPM0NoY2hJTG1WcHBvNkkv?=
 =?utf-8?B?dG1aY0pQOHVEUFo2Rkt4cCtxekt4M1A3cjlwM2pkWkVwOHVwRnoxd3E4MEZJ?=
 =?utf-8?B?dXc2ZTM0RWlFaU1TYk40NU5oNmMxalVjUUszS3ZZOTM1U0YzbVF0VnJxdG1R?=
 =?utf-8?B?dG95VWEzUEpWRi9yOWxaRnlaK2VVTlllMHlhemN4VWdPdEU1a3JBS2JOVlNm?=
 =?utf-8?B?Y1NETzRRdE4rQlVmZ2xPcDk4K3JKK2pIM0ZaakR2Z2ZFTXZVTXVPTVMraE1C?=
 =?utf-8?B?T2EvdUtFbDE2SStnYnBnL2g5WmVvcWlNaEVKYzlSOW5kWHZ2TzNQVmZxazJl?=
 =?utf-8?B?RVF1SE8ycHRHMy9VTXB5SjhoNjdVRm5YdGZVUEJESG5aVGZPdHJsS2d3cVo1?=
 =?utf-8?B?MytBdjFjWGU4NEJoWGJwZDJKNmViaU4reE8rU25YNERUU2M1cnhpQkRXRlJn?=
 =?utf-8?B?dm1KdjhibXVpcjdsL3pmcTB0eG9rTmtBVEtLbnhXb1lhUStsRkJ5U0xJaVRO?=
 =?utf-8?B?OGMzMEQ3QVhUUWRjUW11eXlpV0RrY1pYWGhWbjlUUzlDMTJVZGdFR2ZQbHRk?=
 =?utf-8?B?MTNwNVVjbFROa3R4TDhJT1ZzVnNiMmZ0bjlaSlRjbFBoOXBWTXAwRHFScncx?=
 =?utf-8?B?QUhJOUtKVVZGU1RNeWJPeEcwWCtydmVXVW9SM29YZ2JwYksvSENQRHJFMU15?=
 =?utf-8?B?b21IWE44bGt3ZkxHQ3pHMmYycU9tNnFOMndxYmVkRUVZZGtzQjJUc01tUkR5?=
 =?utf-8?B?S1VMa1RFK0oza0JWUUhZTTdEMWFkOUxTeW1MVzBMOTFVbEpsQkxtVGlOMmI4?=
 =?utf-8?B?ZVdJbzdDVHZodU5pem9VYyt6OEkvMDQ2RmFZQXpsSnZkaDc1WXJycjhDdVNz?=
 =?utf-8?B?Tm94NWVyc3hYQ2lKUVpBdXpwU0xBbExGd0gzcU5pVmRudDdnR21IWWZ5MEM1?=
 =?utf-8?B?K21MSXpLOG9TOE9WK2h4Q0ZFeGdwa2tHWmVYNGx2dm4xdW56ckVNZzNvd0hW?=
 =?utf-8?B?WUpBbUd3bzRJeFl1b0p1YkJtajRMc3FtNTR5QlNOMjJsVVNFS2JqMFVmV0ZR?=
 =?utf-8?B?WDVDYXhLbUtqK2FIRmNOQSt2TjYxTC9ZRHVmY2xKWDhHdFgxSTMva3dkWmRS?=
 =?utf-8?B?Y1hkL0dEcnEyUUZTTEd5RDlxc2pjc3BWbmpEL0IzVDJVaGpUdm9xVnBuUkRo?=
 =?utf-8?B?RUx6QnNhT3pTYXZIQnFxVVhxM2JUMHZKdEdpRVVPeTVzY1Q0cTRSWGo2KzNI?=
 =?utf-8?B?MkdHM3RpK3RycUJiRVdmaFh6LzdyMkNNdUszL28rU3lBVjZHWXRGTHlIQm02?=
 =?utf-8?B?cElRWEo0SENYb01jaEtMb0orOE8wRkhEUVNGM3RlOW1SSFBYRmpENmMvRG1F?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2A3C64EFB8E4D438D44FD53175C315B@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13d4860-010d-401f-d64a-08dcc1c208f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 09:17:09.7641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Wtkru4m20pKFzT/qAHgtT0LWlEdmSAaH8+lSTb/SZQjTGRCqMY+fArk++r+Twr7jqttYVB3JxLcbtv09ijkoNZOpMrym+gp9EVQyRKT34Jq/jTASVFlcnZYqfmPV1b8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8101
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS8PR07MB8101.eurprd07.prod.outlook.com

DQoNCkxlIDIxLzA4LzIwMjQgw6AgMTA6MTgsIFFpIFpoZW5nIGEgw6ljcml0wqA6DQo+IEluIGhh
bmRsZV9wdGVfZmF1bHQoKSwgd2UgbWF5IG1vZGlmeSB0aGUgdm1mLT5wdGUgYWZ0ZXIgYWNxdWly
aW5nIHRoZQ0KPiB2bWYtPnB0bCwgc28gY29udmVydCBpdCB0byB1c2luZyBwdGVfb2Zmc2V0X21h
cF9tYXl3cml0ZV9ub2xvY2soKS4gQnV0DQo+IHNpbmNlIHdlIGFscmVhZHkgZG8gdGhlIHB0ZV9z
YW1lKCkgY2hlY2ssIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gZ2V0DQo+IHBtZHZhbCB0byBkbyBw
bWRfc2FtZSgpIGNoZWNrLCBqdXN0IHBhc3MgTlVMTCB0byBwbWR2YWxwIHBhcmFtZXRlci4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbT4N
Cj4gLS0tDQo+ICAgbW0vbWVtb3J5LmMgfCA5ICsrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbW0v
bWVtb3J5LmMgYi9tbS9tZW1vcnkuYw0KPiBpbmRleCA5M2MwYzI1NDMzZDAyLi5kMzM3OGU5OGZh
ZjEzIDEwMDY0NA0KPiAtLS0gYS9tbS9tZW1vcnkuYw0KPiArKysgYi9tbS9tZW1vcnkuYw0KPiBA
QCAtNTUwNCw5ICs1NTA0LDE0IEBAIHN0YXRpYyB2bV9mYXVsdF90IGhhbmRsZV9wdGVfZmF1bHQo
c3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+ICAgCQkgKiBwbWQgYnkgYW5vbiBraHVnZXBhZ2VkLCBz
aW5jZSB0aGF0IHRha2VzIG1tYXBfbG9jayBpbiB3cml0ZQ0KPiAgIAkJICogbW9kZTsgYnV0IHNo
bWVtIG9yIGZpbGUgY29sbGFwc2UgdG8gVEhQIGNvdWxkIHN0aWxsIG1vcnBoDQo+ICAgCQkgKiBp
dCBpbnRvIGEgaHVnZSBwbWQ6IGp1c3QgcmV0cnkgbGF0ZXIgaWYgc28uDQo+ICsJCSAqDQo+ICsJ
CSAqIFVzZSB0aGUgbWF5d3JpdGUgdmVyc2lvbiB0byBpbmRpY2F0ZSB0aGF0IHZtZi0+cHRlIHdp
bGwgYmUNCj4gKwkJICogbW9kaWZpZWQsIGJ1dCBzaW5jZSB3ZSB3aWxsIHVzZSBwdGVfc2FtZSgp
IHRvIGRldGVjdCB0aGUNCj4gKwkJICogY2hhbmdlIG9mIHRoZSBwdGUgZW50cnksIHRoZXJlIGlz
IG5vIG5lZWQgdG8gZ2V0IHBtZHZhbC4NCj4gICAJCSAqLw0KPiAtCQl2bWYtPnB0ZSA9IHB0ZV9v
ZmZzZXRfbWFwX25vbG9jayh2bWYtPnZtYS0+dm1fbW0sIHZtZi0+cG1kLA0KPiAtCQkJCQkJIHZt
Zi0+YWRkcmVzcywgJnZtZi0+cHRsKTsNCj4gKwkJdm1mLT5wdGUgPSBwdGVfb2Zmc2V0X21hcF9t
YXl3cml0ZV9ub2xvY2sodm1mLT52bWEtPnZtX21tLA0KPiArCQkJCQkJCSAgdm1mLT5wbWQsIHZt
Zi0+YWRkcmVzcywNCj4gKwkJCQkJCQkgIE5VTEwsICZ2bWYtPnB0bCk7DQoNClRoaXMgbWlnaHQg
YmUgdGhlIGRlbW9uc3RyYXRpb24gdGhhdCB0aGUgZnVuY3Rpb24gbmFtZSBpcyBiZWNvbWluZyB0
b28gbG9uZy4NCg0KQ2FuIHlvdSBmaW5kIHNob3J0ZXIgbmFtZXMgPw0KDQo+ICAgCQlpZiAodW5s
aWtlbHkoIXZtZi0+cHRlKSkNCj4gICAJCQlyZXR1cm4gMDsNCj4gICAJCXZtZi0+b3JpZ19wdGUg
PSBwdGVwX2dldF9sb2NrbGVzcyh2bWYtPnB0ZSk7DQo=

