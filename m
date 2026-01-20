Return-Path: <linuxppc-dev+bounces-16084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JcdDIoKcGlyUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:06:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9B4D7DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwjd15yXZz2xrL;
	Wed, 21 Jan 2026 10:06:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768950405;
	cv=pass; b=BARa+LTdRJ+W3RMsPl2txwlsxRuecKdKNtvg8YKdLs37so9PnUgEsrhM2EZ//DMcGhhV3rHFuLfgDgJRUSs43gVgJUSzWCkEBBZnmJkrHx6KXuaHyg/ykwwZLoHq0qZ03wmpm+l8+3IYEzuxVYi0syYFj1jLOKQhNLRppvAC3rKN5EH0zUgweWv9CsgSX+oWU0wPM4q1I2ZYJBasIv+FNs2xUe92IdjdnR0wucist2JFzNz0dZG13eZ3S5Ov9xuw/YCfZpFcHgWZOP3HcO/VWmO8VMhHapjIfquF1L8WyLEstF2KgTBDkEWWjCNqjtlAt6whUdT5dg/nYvqUsVPpew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768950405; c=relaxed/relaxed;
	bh=nnl5Ay8DyENmAYPGsHVNnjpqZdwkvLk/ZYsiMLftvcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c2lZnEuG9h3VSksP6PkItR8iKzuS+NZKPyx2NoeZbv/Q2VWNiAawqXUkLepRYNrBdm9RiOpoX1LMB4cHO2MOh9zboE12wyzkV09B/Begc+Y0/CrXZhWlhIgr9DuGO5FJjVODDcBnct5zVHHSmUOq6zmVbi1veYlxuAD0sQhB/4Sv0TPjtCkWxdu+2RTDeddx+TYdJULe07byR7Epe5c8f6NinZYOxtRDzqR0nvcvDrZAz2bNoL78qHbBpYYv7pLsvj/U+m5P5ObxmQCsb36+dO5M8gTccYcSO4Qhu2wfOptQ01PFpYs6K/lgEN/qFNE5VeI965Tz73RUhEq5yzWuug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rtnrA1cq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rtnrA1cq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwjd05Mb6z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 10:06:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKb3ce3PKovTsd6wHyFuVttlqvozqrgSIUKleXjZD/RUgRCjnyHe5i7vBBEmX8fOgwyvou8li8b0pdNtZB3tHVj8YuUFeWxsOELiQ+nE40NN+3ErRmS28oF0xR2yrpWaUu5KTfN2S4qJ4m+1Qbd1tBNo3GrnjjgJRPvGI/VkNsVSHHT4tqxx/Cyr2d9LPyEmxUTxkVAralcw7l9HmAzWobODhSKwVxCvBbJ8EJ0KWxcVaeaPWaoLJA4Dh/sIVQtUQ4nX1UdL9UyRfS01THDzkAriygC5A5H8LIhflI3hb6cAH8aR7cS58FoEtFbAHCdw+cXvBNuMZ7rXNOWrp7Q5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnl5Ay8DyENmAYPGsHVNnjpqZdwkvLk/ZYsiMLftvcg=;
 b=mw6U+C/+yQlNph5dAShVQo5LeztNRuUhjqE6gaiSoi1GUYra/h0yJBkhbF5qTL31r1OKdpfFd3TZwCakubgQsmQPyavdGacSYkaSQ8G7WtWe4suWgQXh2jBbHxzotA89IzaYaItJigirbVxghqHHQVe/O0iR/fiX1N1q1Ns6iMb75UPD0jU81+2HLuVcytCMUA7xZ1bcy6r6Olf+9iFG+zgY9D+UBoC7kowcWu0gAkaqmac6Fdw5zwdQIWMofwFMjrLI7sQ8gDRXnfMNwhfUdCOXlR4szS/JCNMyEwHuGQfrXf39Z6L3vLkZXLpfrK7Ck2KwhUJxN8KccaYP0+1bJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnl5Ay8DyENmAYPGsHVNnjpqZdwkvLk/ZYsiMLftvcg=;
 b=rtnrA1cqZcXLCvI/LvI1otULrFjaDKHFbHDvU4CxoTL9oEcsdZ9//2kw72+G+Q9qjCRGOGTZYNPIcfE+hei82QBAA7e8HFJrfAm07iwW3g+dgt6MjFz4IvypYOLjOaII6OO2Bq/QhjtH69CDst//fwBg3mKa3U9FIjwpnlQCwWmdDQljtE2AyG4hKyCgqMLvB0AUPCE0DsZoDUXQ2AZ0qXGNhkyn0mpl/hKpcmnj51zCEA2vWF/CD14s+QVu44EsirDJkOIJnvMztC6nGq143Kf7EAKTeRk3IfPQHapGumlPYE2fcDAVd2nEguNLrH684w2lzeUALq0GBNjohDEVdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Tue, 20 Jan 2026 23:06:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 23:06:19 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Date: Tue, 20 Jan 2026 18:06:11 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
In-Reply-To: <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CYYPR12MB8703:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc9b058-3c18-4851-61fa-08de58788545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHVPQmJvMnIxZ1FlSHJkT1c0UHpPczlUQVhXZWpwNW9oRGdlN3RCQjNPT21J?=
 =?utf-8?B?ZDg0c0tRRHFSdkhYVU5KbGJHWWc2WFdiR25ub25tSVdWN3RYY21kTWlqU1dn?=
 =?utf-8?B?aDZuZEhuN3hVc1pMV1lMKzlIa3VnczlKS0xTcldBK1pHbVdrNlFjM25uMFh1?=
 =?utf-8?B?bCtmcHVIRkRBaVhsTEh6KzhQVmNVUTdNZXRtM1RoQzZSSEJDeTAxZWhTejBV?=
 =?utf-8?B?aHRiZFMyMWJjNWdMOXdtQzJPWjV5bUZtMGJ6bzc0TWxhNVFLTUZLeEVFL3lM?=
 =?utf-8?B?R2c0L0JGcEVPcnZEZ2UrMHl2ZVpwRGkwVDNpbGUyenJ2OWVvRWp3MmJKaU9i?=
 =?utf-8?B?SnpXaGlxdlA3MWRlbStkSXpqekFKb1hFNlM0dWptN2loV0VTTkE5OXpFdFNa?=
 =?utf-8?B?UHZVdkVKVVdXemc2SDdFN29saVNkSW4zalYxQ3dZZlNtZ2FLNGFja2htdVlC?=
 =?utf-8?B?WjdyYnNZdFNXbmh6NTJZK3RkK0NTSmpxczdNRDJYZE9rUVNLVTNlZ1NYMndw?=
 =?utf-8?B?NVR6bG5pNzJ3MWY4YzlZQTZQSjYxbnd6OWl5ZVkyWVVzNHczRkVyVEltZUZs?=
 =?utf-8?B?ZVJNQzBYVHFNWlVxMmtTY0s2bjNuN2p0ak1MdE1xL3M1NUJpcWFQTkRBVzJh?=
 =?utf-8?B?ZW4vbWxkbUE1RjZnSEl0bjFmQjQ1RmJ5dHR4UkJ2SUkvaDRjNVNBYm9wcVNS?=
 =?utf-8?B?QzZaYm56NWRLTHJUdDJ6Z0VLQUc1M29VdEFFRlhLS0VCUjdMeG1VbUVhaXJ4?=
 =?utf-8?B?YzBEckFoaXMzelhvWFZJNUV4c2FXOXRNRC8rY3NrK1VxN3ROSGQ3Nk5sbTFr?=
 =?utf-8?B?aEZHa1BMaCtySGV1RmU3UzRHRkRXa3JoTkhVT1hJVXZldkxDREhSQ2U4eFBV?=
 =?utf-8?B?bWJDNWU3YXJjRTkrVUlCb1NIejRONUtMaUNsMnlxWldnVzVyclJEeUlJalNO?=
 =?utf-8?B?c3RZTE5mUWx0aGUranRsZUp6dmE3R1Y1YTRnNGZMZEtmUmIzOUpPeURTM1hK?=
 =?utf-8?B?dDBFR1BLcE1VaFVpUnRheGh1djZuUjdRODhlbndvckhqcjJkN1ZwTmY2eTV1?=
 =?utf-8?B?YXUrQmd5cGJocWJZckhUM3BrWDdFWE9BYVQ5d2l1RnIwQk91bmhPSmhzVWRx?=
 =?utf-8?B?TlFRWFlqeXVGZUNPVnB1anc2UWdjaDZtLzRjODhnMSszemRQRXFVMlc0aFd6?=
 =?utf-8?B?a2NHRnNJQjJWdWpNcXJzeHQrOCtQbURvZnFRSXVsQTFVeDdycjczekEzUEZO?=
 =?utf-8?B?VTBQZ0tsVHFyVEYzRGh5amdkU3RBZXBKZ3kxVms2V2xhVWt0aTVTOVcrd3ow?=
 =?utf-8?B?Um5kMGU5cC9uRmsrZTl2djhhUHpuVnJQdk0xcWY2azh6WmlnUjhnVmRuTExt?=
 =?utf-8?B?MjlmMER3SWxOUWViRlJXdVQrRjcxeFhjVnR2U2hlTlJzaDArUHYxbzRvaDV0?=
 =?utf-8?B?ZGhtMzd6bC9tWWNmclFaSE5MTUs3bUpXN3V0Wll4dFNHeHZxS0ZaWjU1UGh5?=
 =?utf-8?B?SHg3TzNDYmF6Q1VSK1lUTENaRFpFQXIrcTFQclhHaHc0RllzNk9HY1JTV1pR?=
 =?utf-8?B?UDU5bUhSWkhxUjUyWW41ZXBvZjNXSXJ3bzNoMWhQeVVVVW9Ud1BUQldqMkdx?=
 =?utf-8?B?OTh3Ym5HUGp1TWxQTWR6dUZ5U1F3cllEL0pZakJTYmp2UFl0LzhLUlQ0SXpY?=
 =?utf-8?B?WEY1dkFBUlUxSnZUbDRWR3JNUFNWZ3RaeHQyVEt0Sk5RckpOY2Z3dmFudzBn?=
 =?utf-8?B?RkVHQVBrODVzYzlGM3plL0lzTHFSQldybHNKZzk0ckVKQy9GSTJEcm85TmZw?=
 =?utf-8?B?TldSUHVPMC9jOEVncy9NWmtwSlZ3SWUrUnpyNGlKV2lwZGZFZWNSdllQZ1NL?=
 =?utf-8?B?YzNlemhObEVXWlRJZkJ1RDkzenNHOFVibGR5OWxnbnlieE9QNm5odW5lcGxS?=
 =?utf-8?B?UnphczZpdC95K09wS1hzUTk2WGVuVjE0TEVOM0RXZzFYbUVLK2x4Y1E3LzEr?=
 =?utf-8?B?N1YrUWoyeVNUL1hpekExc1VHQVJOak1PYUlGQ3dtMUkxOVhobkdjcUVuVHpC?=
 =?utf-8?B?VDM4VzN2REthWGoyU1BvaUFWUUQzTFNoRUpobHlkYzd4cXo4cHZJTTc3aWdr?=
 =?utf-8?Q?pve4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZqL05sZk9HRnVNamxCMnI4VFA5UW1qM0pBK2djUkdQdVJqSjdlK2pneTI5?=
 =?utf-8?B?bEVqbDFaQWNzTTg2YUt3MlcwQ2J3Rmp1UnJuUFZQZi8rRWNHem9QNjE4SG9P?=
 =?utf-8?B?cmhKM2NMeVZYR1ZmRVpXYnlXVVZWaHB4VWdXTGN0MHpvT0ZaNDR4a1VzbEZX?=
 =?utf-8?B?eHhQRHQ1SjhQMFdzTWtrWmNzanVKa2hMS3A2U3cwNktxK0dPcnU3dnlqTlNC?=
 =?utf-8?B?bmpFQjM1eDJUWGRVMUpzMFgrNERlME5SYjM4eWkxSXM2MGcwTmNVWWk5eU4y?=
 =?utf-8?B?eG12Ylk5alZLR3RISytnSXVpNGxZazkrWXVQTFdkQ2g4K3ZMOG5XcXRwQlV3?=
 =?utf-8?B?L2NRWEdMZjNyUTBza3ZpdHRkUGlSbC9lZFZ3TG5NNU5hcWlKT1hIZGtVc1RH?=
 =?utf-8?B?cTNEcTBwR05GYXZiL05JYWs2cXhKOGdxYWV6bEVjblNGR3pOZFpVN3c3czdn?=
 =?utf-8?B?KzN4RjlvNWxudk5teStNREZpaVNsdzRtbzZ4eEpidjArRnR1aDkycFVwWktJ?=
 =?utf-8?B?ZHlYajg4S1h3MllNdnQ3dUF3VXZSYlFIZ0dwL0JUekZheFpteGc2aUpQWG1F?=
 =?utf-8?B?THZVdHVDeGpXL0h5MmkzVmVpVDdCeTVZOUtITisrU2FUbitkWUYxam9vM3FB?=
 =?utf-8?B?L2FHckZNeFVwenpOdGdYQXBJTUxnc092WG9ZQklFQTJlN29OaVVCQTNlMFQw?=
 =?utf-8?B?TjJwemJkbGxNT3ovUzdUNGZITVNsdmRla2ZtUmhTZER1aFBSeWFZUkRnL3V1?=
 =?utf-8?B?bVBKZnJjMEVHUWs4QXhkTUl3TzZ2UXlRYkVPSGFyVTJnLzh6ZGpSQjNvbVdO?=
 =?utf-8?B?RWcwV0M4cXlVdUFmMThhalZmWEoySzlJM0FKcVF0Q0ZuK2YzMXRZVXlHYTBW?=
 =?utf-8?B?c055WTB2T1U4clhTUXBrTjNiaTJpYmtmS0xhbVhZK0VMWXpDa3pSQ0tqTGtP?=
 =?utf-8?B?ek1UL0o1MFB3MUJ5c2NCYXhKT0dDbkxVTDdlS25kQ0VmUUdmMHkrVlJiRGw5?=
 =?utf-8?B?aUFTUHE5Rmd0bkNUR0RJWGR6LzU5dmdIS0ZQYktoNWdrNURRUUl6SzZ0YW50?=
 =?utf-8?B?eEdjM0pSUEdRTWp6Um9nTnloRzVzaG91VXgyeHJQTERyU25peXZhQkNJd2Zn?=
 =?utf-8?B?WEk1dUpURnErazVRYUMreVdCY2dzU0Y0MWZORDMxMHFjMjZhcm5IbWI1dWVk?=
 =?utf-8?B?dUVjQmpocGtyRnc3bWhKOGNjT0JJc3o4M29saDBjWFBFSTdXdFpTMGRvK21P?=
 =?utf-8?B?VnQ4SnE5SE5MNTdoNC9MbHlaU24vdkFsbURZM3ozMGNta2RtckhJMjFyamdn?=
 =?utf-8?B?U1dSTGsxbldLeFJOMlR2VE84SEJrNlVzcDRVcHVxWFZmQmNVVkdGZTdPbHBE?=
 =?utf-8?B?TEJFdTlTdkNPWm1mSDkzRlROY2ZURnhKSWZoTitDT0JvcEdyRWU2a1ZDS2dw?=
 =?utf-8?B?Ykd3ODBEa2pmcUVFNGJmeStwdEozcWlWaExGaVU5SnFtNlVxN3U0bFhWc2pU?=
 =?utf-8?B?WW56dG1GT3NWTDJGbnE2b0J4L3VpY01qS3N0WVlBY1VxV1laNy9nZUdWT0Rx?=
 =?utf-8?B?b1ZSYjZmZTZ0VjVQQlowTkMzUFdHa2ovaHMyeCtNaXU4a05vRzY3cG5mUXh5?=
 =?utf-8?B?UmdHZlRaaEExWHUybEZGYndJTUQ0dGtXenFjeDBVczZIa21zajhQbVhrcXUx?=
 =?utf-8?B?SzlBdUFzekFmMWZBTDZKendEVDUzOU03cEp4RGZocTMrR1RQaGZhYXFzbk5R?=
 =?utf-8?B?alg5dG9jVXduRURIUlhSbUphZDlrcG01aHQ1K2JpbXRaeEZ1d0ZuOTlMT3Rn?=
 =?utf-8?B?V3Z3em04b29UZ2dpN3RrRWVHY21kVllJdkl6MXh1azhmaTNOOXoza3hGeHFH?=
 =?utf-8?B?bjVRWVQ3eW9GUUFQb0M5OUFZdlBtVHNxdCtJTVA3aVdmZWdTRHpEL0FnQlVZ?=
 =?utf-8?B?R296SnB0cUZvNHh1ZHVNYVRELzNvbVYxclJUdnRWQUp3QkpuY2E5ZzVFZzZw?=
 =?utf-8?B?VTk4bmZPWnhKc1BvV2gzMElYdERDcmluMnl2eENNZy9yeXRERXhPMVdWUWxD?=
 =?utf-8?B?aDc2RGpnam9MZmpaTWhhM0FNOE5MU25OSTVNOTh4cXJNZE8va0MxWXhpNXFI?=
 =?utf-8?B?dnBOY0J1eUxqRzZKQWxqUGhhU3gybGhjWCtQUFlZYytBMjlzVmcvZHRBMGEy?=
 =?utf-8?B?eVhGSmtNTXhUaFRpaWpjMFdjVUM1M1h3c1JyMjBhTi8vNUhkc1hiRlNRR2JX?=
 =?utf-8?B?Z3gwMnNoQVQ0b3dnSmQ5VVRrZ3hsdjRZOHVQei9MQVpEVEd2ZEtmOUNWbjRt?=
 =?utf-8?Q?sSjZ8XO4+E//lOEf7X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc9b058-3c18-4851-61fa-08de58788545
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:06:19.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz6g7bGuj+xu9UdL3KZtvDS3UYo0Yzcs/iQWcDbRWRFnuUXJLLQDujK0koq4O9A2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16084-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 7EB9B4D7DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20 Jan 2026, at 18:02, Jordan Niethe wrote:

> Hi,
>
> On 21/1/26 09:53, Zi Yan wrote:
>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>
>>> On 14/1/26 07:04, Zi Yan wrote:
>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>
>>>>> Currently when creating these device private struct pages, the first
>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>> address space large enough to represent the devices memory. This
>>>>> allocated physical address range is then remapped as device private
>>>>> memory using memremap_pages().
>>>>>
>>>>> Needing allocation of physical address space has some problems:
>>>>>
>>>>>     1) There may be insufficient physical address space to represent =
the
>>>>>        device memory. KASLR reducing the physical address space and V=
M
>>>>>        configurations with limited physical address space increase th=
e
>>>>>        likelihood of hitting this especially as device memory increas=
es. This
>>>>>        has been observed to prevent device private from being initial=
ized.
>>>>>
>>>>>     2) Attempting to add the device private pages to the linear map a=
t
>>>>>        addresses beyond the actual physical memory causes issues on
>>>>>        architectures like aarch64 meaning the feature does not work t=
here.
>>>>>
>>>>> Instead of using the physical address space, introduce a device priva=
te
>>>>> address space and allocate devices regions from there to represent th=
e
>>>>> device private pages.
>>>>>
>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>> allocates a requested amount of device private address space and crea=
tes
>>>>> the necessary device private pages.
>>>>>
>>>>> To support this new interface, struct dev_pagemap needs some changes:
>>>>>
>>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>     - Add a new dev_pagemap::pages array to store the device
>>>>>       private pages.
>>>>>
>>>>> When using memremap_device_private_pagemap(), rather then passing in
>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space=
 to
>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>
>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>
>>>>> Represent this device private address space using a new
>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>> private address to a struct dev_pagemap, where a specific device priv=
ate
>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>
>>>>> Device private address space can be reclaimed and the assoicated devi=
ce
>>>>> private pages freed using the corresponding new
>>>>> memunmap_device_private_pagemap() interface.
>>>>>
>>>>> Because the device private pages now live outside the physical addres=
s
>>>>> space, they no longer have a normal PFN. This means that page_to_pfn(=
),
>>>>> et al. are no longer meaningful.
>>>>>
>>>>> Introduce helpers:
>>>>>
>>>>>     - device_private_page_to_offset()
>>>>>     - device_private_folio_to_offset()
>>>>>
>>>>> to take a given device private page / folio and return its offset wit=
hin
>>>>> the device private address space.
>>>>>
>>>>> Update the places where we previously converted a device private page=
 to
>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>> offset, instead of looking up its page within the pagemap use
>>>>> device_private_offset_to_page() instead.
>>>>>
>>>>> Update the existing users:
>>>>>
>>>>>    - lib/test_hmm.c
>>>>>    - ppc ultravisor
>>>>>    - drm/amd/amdkfd
>>>>>    - gpu/drm/xe
>>>>>    - gpu/drm/nouveau
>>>>>
>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>
>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>
>>>>> ---
>>>>>
>>>>> NOTE: The updates to the existing drivers have only been compile test=
ed.
>>>>> I'll need some help in testing these drivers.
>>>>>
>>>>> v1:
>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>> - Update existing users of memremap_pages():
>>>>>       - ppc ultravisor
>>>>>       - drm/amd/amdkfd
>>>>>       - gpu/drm/xe
>>>>>       - gpu/drm/nouveau
>>>>> - Update for HMM huge page support
>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DE=
VICE
>>>>>
>>>>> v2:
>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_AR=
RAY(struct range, ranges);
>>>>> ---
>>>>>    Documentation/mm/hmm.rst                 |  11 +-
>>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>    include/linux/hmm.h                      |   3 +
>>>>>    include/linux/leafops.h                  |  16 +-
>>>>>    include/linux/memremap.h                 |  64 +++++++-
>>>>>    include/linux/migrate.h                  |   6 +-
>>>>>    include/linux/mm.h                       |   2 +
>>>>>    include/linux/rmap.h                     |   5 +-
>>>>>    include/linux/swapops.h                  |  10 +-
>>>>>    lib/test_hmm.c                           |  69 ++++----
>>>>>    mm/debug.c                               |   9 +-
>>>>>    mm/memremap.c                            | 193 ++++++++++++++++++-=
----
>>>>>    mm/mm_init.c                             |   8 +-
>>>>>    mm/page_vma_mapped.c                     |  19 ++-
>>>>>    mm/rmap.c                                |  43 +++--
>>>>>    mm/util.c                                |   5 +-
>>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>
>>>> <snip>
>>>>
>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>> --- a/include/linux/mm.h
>>>>> +++ b/include/linux/mm.h
>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(mem=
desc_flags_t mdf)
>>>>>     */
>>>>>    static inline unsigned long folio_pfn(const struct folio *folio)
>>>>>    {
>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>
>>>> Please use VM_WARN_ON instead.
>>>
>>> ack.
>>>
>>>>
>>>>> +
>>>>>    	return page_to_pfn(&folio->page);
>>>>>    }
>>>>>
>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>> --- a/include/linux/rmap.h
>>>>> +++ b/include/linux/rmap.h
>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(uns=
igned long pfn)
>>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struct f=
olio *folio)
>>>>>    {
>>>>>    	if (folio_is_device_private(folio))
>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>
>>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_p=
fn(const struct folio *folio)
>>>>>
>>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned long=
 pvmw_pfn)
>>>>>    {
>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>> +
>>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>    }
>>>>
>>>> <snip>
>>>>
>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>> --- a/mm/page_vma_mapped.c
>>>>> +++ b/mm/page_vma_mapped.c
>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *=
pvmw, pmd_t *pmdvalp,
>>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned =
long pte_nr)
>>>>>    {
>>>>>    	unsigned long pfn;
>>>>> +	bool device_private =3D false;
>>>>>    	pte_t ptent =3D ptep_get(pvmw->pte);
>>>>>
>>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk=
 *pvmw, unsigned long pte_nr)
>>>>>    		if (!softleaf_is_migration(entry))
>>>>>    			return false;
>>>>>
>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>> +			device_private =3D true;
>>>>> +
>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>>    	} else if (pte_present(ptent)) {
>>>>>    		pfn =3D pte_pfn(ptent);
>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_wal=
k *pvmw, unsigned long pte_nr)
>>>>>    			return false;
>>>>>
>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>> +
>>>>> +		if (softleaf_is_device_private(entry))
>>>>> +			device_private =3D true;
>>>>>    	}
>>>>>
>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>> +		return false;
>>>>> +
>>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>    		return false;
>>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_wal=
k *pvmw, unsigned long pte_nr)
>>>>>    }
>>>>>
>>>>>    /* Returns true if the two ranges overlap.  Careful to not overflo=
w. */
>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk=
 *pvmw)
>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct=
 page_vma_mapped_walk *pvmw)
>>>>>    {
>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>> +		return false;
>>>>> +
>>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>    		return false;
>>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_=
walk *pvmw)
>>>>>
>>>>>    				if (!softleaf_is_migration(entry) ||
>>>>>    				    !check_pmd(softleaf_to_pfn(entry),
>>>>> +					       softleaf_is_device_private(entry) ||
>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>    					       pvmw))
>>>>>    					return not_found(pvmw);
>>>>>    				return true;
>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_=
walk *pvmw)
>>>>>    			if (likely(pmd_trans_huge(pmde))) {
>>>>>    				if (pvmw->flags & PVMW_MIGRATION)
>>>>>    					return not_found(pvmw);
>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>    					return not_found(pvmw);
>>>>>    				return true;
>>>>>    			}
>>>>
>>>> It seems to me that you can add a new flag like =E2=80=9Cbool is_devic=
e_private=E2=80=9D to
>>>> indicate whether pfn is a device private index instead of pfn without
>>>> manipulating pvmw->pfn itself.
>>>
>>> We could do it like that, however my concern with using a new param was=
 that
>>> storing this info seperately might make it easier to misuse a device pr=
ivate
>>> index as a regular pfn.
>>>
>>> It seemed like it could be easy to overlook both when creating the pvmw=
 and
>>> then when accessing the pfn.
>>
>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) t=
o
>> return the converted pfn instead of pvmw->pfn directly. You can add a co=
mment
>> to ask people to use helper function and even mark pvmw->pfn /* do not u=
se
>> directly */.
>
> Yeah I agree that is a good idea.
>
>>
>> In addition, your patch manipulates pfn by left shifting it by 1. Are yo=
u sure
>> there is no weird arch having pfns with bit 63 being 1? Your change coul=
d
>> break it, right?
>
> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6)=
, so I
> thought doing something similiar here should be safe.

Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
by almost every arch, so it has a broader impact.

Best Regards,
Yan, Zi

