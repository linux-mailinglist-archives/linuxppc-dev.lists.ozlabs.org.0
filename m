Return-Path: <linuxppc-dev+bounces-15386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7FFCFE84A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 16:16:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmWpW2p7jz2yFh;
	Thu, 08 Jan 2026 02:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.195.22 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767798995;
	cv=pass; b=DIeW3n7S/notGO+iRkci1Xt57NSJAewkbB1Ucin9EyvNHagv2C4gaeDDiQxOHlscfcZ6fyeen5x3Fdgm2ry5TQizEsdi8dix192LufInjwrCC6SFI9WMyRA0GximsxcC7E1VaFKx5uw9uU0Hn9qNoaRmTn1Sj05MhH7iNWEqQKHxut2WMMIXT1Ig8qI2cTwQJC/KGtPIM3G2pEKcdLcP9YhsHzTZSinGtimZdj7xPIwEeNKN/Xq/LhMxyHhr3AAtFfk+/k63pDw4LfqDaLsNofsdkIFZ7XHoqis6mE11lYPC8FQihmXH14zzugIwROVijCS7mNh3w0Y1cqcpcTbHPA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767798995; c=relaxed/relaxed;
	bh=NhgD3nke99H7HXmDffeeBMnzWHx++DHdLlzXH4v1F7M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g22/v740Jh39RN2+/M/SH+uNyINuVQP+6XBd2tjZehOjmy8NNRlTyPHkCrLwijmvMJdL9E7rSdWUdEAJsnKUvXZS3O2Qvyyt8+6kuXLTFxSbqJZd6kGlJ+g3H7eJLfh+VZK6iRsGafdn1YiyFwwcl06qsorJ00JZHXRATeTITM+ET4h4kYCflwpEfFkqXmN3qqbbFRc+QkS2ofFdvGRUmcP/fWTgiJ+64du71MNVDNJzzb6wNgp7fVNQhohM83JleH8HxIK8cpGcxFzEkcr4eHMwRygFg+z6F4h7ZjV5lFyEpl4FrvgpCwDm5Q7fjVL76pfenqz75FnuiiZTqkm/gA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pm8NZip+; dkim-atps=neutral; spf=pass (client-ip=40.93.195.22; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pm8NZip+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.93.195.22; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012022.outbound.protection.outlook.com [40.93.195.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmWpT1sHYz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 02:16:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdgeiT7yq6v9HoB4b2+6Eopgv3f2lXzKwPE97bTP54UVGz3a9dcLq8J8JyQ5PQMj6gKDbh9G8UosYD5U/EqgwuYcOZk5g9l9r3289y4DmTixYFRvfIBxCpGJlqi+b1em7/k+6wR0bfiNcInRzZVPnErsXZPB/iSCrw/lnRZkfKUqQM84FdvcTAp86e+eDYNth0TReG+9tLWTt2PrJuDW9uYGlgM0bfc6axI90qle6Fs2TgueeLqx97n8xll96Cn8G/IIxHiRdYtIjNA0O1PS9B1Z0QB74Mj8NXibQCV4e//mSZMrPx136VUvQDN/R76r1f+oHyUD8aMgoTxZEhGWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhgD3nke99H7HXmDffeeBMnzWHx++DHdLlzXH4v1F7M=;
 b=F/OFtVTSJDhPBpKIby3mDwCYpCPAeL1Mls8cDWjZbUfbaRMNXzzzkODUbfMpAu0IOr7Fg1RlBSPm0NAHKiuHDLhoYxRT6cSD7If43VHzV/oLIyjtS4cskAx+2PErTebIa0+3x+mQL38qhYwacpsuXht4BNSrqK9yvkvj8/z4XF8jeOQ22uWjwPlewvPKvcVDedtSTSIsqXKmesdyudSiF8FklxwNetggcTmTBo+yzmuhHXQtU+oLBGVTRlio9yRzJ/zW+Ow/CaHCbe+XbdFJ5S3qIG4bX1rKAQXEKPwbwSfvKpINpGyzt4KE+LJaiPtnGSqrz4e6kmphzgixeBCiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhgD3nke99H7HXmDffeeBMnzWHx++DHdLlzXH4v1F7M=;
 b=pm8NZip+jvCCqSO3lW3c9V25B5rSXcxIqLpWaf/MBHh5DA6MqRCua+ocydNXTF4hJV6rAYPi38bth2gjtQqJjnxqNoo4cPtYaOiCUXtTKx8N7kvm/GklzEuARbIqXGz4fLq9WEIFaOUjthczfi7j4rQ6NqKYTsJPUkXuQa8x44g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9199.namprd12.prod.outlook.com (2603:10b6:806:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 15:15:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 15:15:44 +0000
Message-ID: <0d76a0dc-aebd-452d-bbe3-940775a23761@amd.com>
Date: Wed, 7 Jan 2026 16:15:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Brett Creeley <brett.creeley@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: ae892f47-7ddd-4fa7-fc97-08de4dffa093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnRJY0NkSnZmWUhnWVJHSzdobFBiNG14RC9BeW8xSTBxZGgrdStlRFM4QW92?=
 =?utf-8?B?clg1aU5McWcxOG5ZMnZrbXhoemFjMWhqdE4vdDF1TjVnRlhldi9UNm5OK2JP?=
 =?utf-8?B?MStCd0tvVnFjNkw5YzRqazk1Z1BIWXF6dXZUVGU0TUgzRVlwUEdsREMwMHU0?=
 =?utf-8?B?TmFwOUZ6blhTK2ppOCs0dDJoZ1BZbFpxeXQ1SHQwUE82OGprb3Z6TElrTUU1?=
 =?utf-8?B?VHNBUSt5aDhicXZjOG41dkxscWhYMlRiQkNxanVVYVdEbzZxQmk0TTg3VXIr?=
 =?utf-8?B?RURHam1MRm0xc001MVg1RmJhOGc2SjZpTm4vTDFQVmJvdTlQdGh2RkltNGdP?=
 =?utf-8?B?eEY4blh4WTJNaXRGWExUWXdHWUNDb0Y1WGVmeWpwZ2xNWERvMVVpNkpDZTdB?=
 =?utf-8?B?Zk5lVGZHSWFQbkY5SEJQTFd6M0lGL2NWYzZqQndBVzFmeCtvRmF2WEFkbWNK?=
 =?utf-8?B?WFJWTXRkbTRoMkw3ZlF1b3k5OU4xR3h0eGUwWEdtYStiMVplTkRGci93RlJq?=
 =?utf-8?B?QXJmTVh3OWg3TmNWMFcvdXdZRU5QOUtDanV1NlF4Qjd4Wk41bXgrMW96T0dt?=
 =?utf-8?B?aXVyRkkrTkpDU0ljWXdkSFp2YjJZb3RHVEtaT1dGL0xlTFhEMU11NXBySG1o?=
 =?utf-8?B?NXptN0o3TDlDRnZYZTNEOENOVzNqYlpMQjJZKzdXTEdjT2UrRDhNNm5kMjFG?=
 =?utf-8?B?SVNaMzVvay9XSEFoVVc0cXBzNi9xUEhJWXhiZlNDTDFXdjNick1XdThZQ2dy?=
 =?utf-8?B?MEl6SVY3Um5KdHltNFRNL0JGaG9rUG9jNkpoV2dUN0xHanB6dS80NHhpaHFk?=
 =?utf-8?B?eUc3cXdwZFlBMy9iRmN0OHJJMlQ0bmUzMW9TZVdnbmlYMUJ3eFhSZkdTWVc1?=
 =?utf-8?B?ZU9KcmpGSXkvQnFxTHExMFBtUFpibWk0aXB6TXdYTmVWR3lEa1JDUGh1dHh0?=
 =?utf-8?B?YXdhWTlvRHR1VlRSelRWRk8wMlRXSVpaUDJyUHpHSlhjdEs5WU1Nc045ekhM?=
 =?utf-8?B?MCswMlBrY0w3Vmx2OC84OGNlNnRmSHc3VjBqT0Z4OXo5THNlWk9pNnBqWWUz?=
 =?utf-8?B?cVJHU1FZbnRYOGhPeURuWVU5R3dYUFJ1QWlkVTgwR09YanZRSGM0b1pvOFRO?=
 =?utf-8?B?VHU4elVsckMrZWwxODZjL0ExeTMvZlp1RFR2OWpZVEZWNlF4R2F4bkZVRFJk?=
 =?utf-8?B?TFRtbk5jTzRuY0MvZFo5YUNxMlFMVXFsb3F4TVpsZkhuU2lHVFFreFA0S2Nv?=
 =?utf-8?B?RUJ6eG8wazVKZUlsckxDR2Q5REF6VXRxN1Q3NjhqUHppeWFGc005T0FoVkxI?=
 =?utf-8?B?MXplT00rR2x4bEZ0bDlaeFhSZjgzZlo3eG81MnRndkdCT09JaGFwM3dTdng4?=
 =?utf-8?B?UUo4WDZ5d2JlQ0MwcGRlYkJLbG5rZ0x5Y0o0MTZyZkdFek1vdnJwUkNiMUpy?=
 =?utf-8?B?bFJBdWhvZEpWUWhhem1UWHJjNEFZbWhUS1J1STJQR2J2WFZnQ2thZmdZblo3?=
 =?utf-8?B?ZVJnL05Lck1qZmtoWk42dURSTnRFOWc0UFhDM3ZZbmdqanJCb0lDSGVWYjJR?=
 =?utf-8?B?UEhHRGRLZncydWRPd1lsSE1ZVlRNd1lCLzA5dDFrMzFkbmErcDA3eUJKTmRI?=
 =?utf-8?B?elR4TVhZMDdtdzkwUUJtWS9yNEVwVGZuendxMWtKRExiZWNxNStQam0zRktm?=
 =?utf-8?B?YmpzVGxjeHhtTnptc3NXWjY1WmNYM0U1TGNtMzZVWnVYcFVaSFFzK25XSFVq?=
 =?utf-8?B?U1lKMDU0MzVhK0xVSFh6TW15czJENDVScmw0VHJzMU85VlB6ZUlPbHdTWTFt?=
 =?utf-8?B?b2hQVi8zM3NzMWsxNVR5Y2tUOGZIc0tkd2lpcHZmbjEyOWZ2SHErbXYrSzAw?=
 =?utf-8?B?a0hHSjJIOWZhM25xRjBpRmlHbk5VRVc5MWpWYktKUmNOTnhOVUF3NUNyKzB0?=
 =?utf-8?B?cWpONGNvQklZaUNzeU5xd1MzN1ZhMHVFQjM3NjE5R2k2WGFuUW11OEh5SzFu?=
 =?utf-8?B?UlBCRDJqcDRIVElxVFAyUDRYL1hIWlU5aTQydVNFTmZQalcwMWthd1EzTXNR?=
 =?utf-8?Q?BvAFC7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmtEV2g1ckg5cWpOam55a3BIdkZ2SkxNWExyck9xKzNNVzdsSTY1dWZoa0w0?=
 =?utf-8?B?UktYQVN2YXpGeDdqbWxWZkdGbGhBdTZTVWRzRzhHZnJTMXFjQnFjeGJQczB6?=
 =?utf-8?B?eEtjemtxK1ZZbnowUEpqU2hQbkpHcGJxRG0yWWxZb0psbHc5SXFPc2lZZ0Jh?=
 =?utf-8?B?RGNxaXBvMUYvN1p4SHpOQ3JnNHB3NWNraXRGQ0NjZHlNY2o4MDgxbk9XcTRy?=
 =?utf-8?B?cnFOQzBkUjFOQ20ybTJ2QVBaTXEwWHlPV0RGMXdZUkU5b3lEbFdNTVFUZFlZ?=
 =?utf-8?B?b3QzaldjcU0zY01wdmxBa2tBTWpjemp4VlpKZDVicFlhQmFKZ0EvWjZhZldR?=
 =?utf-8?B?eTE1TlhxSVNrTXh4NHpRVDlsL1JQZEdsOVhrVk5RV09Na2NUSUp0eGE4L2hl?=
 =?utf-8?B?b0NYdWNsc0FMMVBSbHlvbFY4bVhQQUY1Q0hQOENhQjJGWFowcis3Wk5Yc1hO?=
 =?utf-8?B?TVlFOW8wVkhLdTJPSjE1RzlDamJXY0I2eGg3bGpMdWFwQkhjRXFLQkRaUDRj?=
 =?utf-8?B?b1JCNG9tUURZSStwSktKc3dHSnNueG5HMllrNzFZQVNhb01WcDFrRitRUjlV?=
 =?utf-8?B?RWtScUFjUzlRM2ovT0tJQ1k2cGRkeDg0YktFNGszbG15clM3elJPeEgzbkIz?=
 =?utf-8?B?OEhaeUNtS2pzZzNrQVl1M2hybjZFejdhdDMrZHpldTNZWXdSOWRiNDBCS1p6?=
 =?utf-8?B?YnROb3FVdTVvZDF2VjZRT0k2RDBXdE15cFdtayt1OUxSNmtkbjZkbUFjZjZ6?=
 =?utf-8?B?bE1qcXUycGJqWXJRbnJEcEdXMmJxMFVmVzVkZ1Y4ZGRvaG9YYXYvLzMwUG45?=
 =?utf-8?B?aVhBbFRVTk5VZ3U1SXhZYU5zYlBKR3FCWEZRT1EyTVhGR090aGhrZnRCdFp5?=
 =?utf-8?B?eWdiQVB4NnVnQWdoY2RPamdlY3pNUVlqb0h1TER5NzRydVVLeFk1UXhKV3Ax?=
 =?utf-8?B?Q2hJUk44L3E1Rjd6Y0QzY0JHRTRSZzNaaktoTGZhU24zOWZKWXlIeTZINGN4?=
 =?utf-8?B?Y21mZExFUmV6aUNvU2dKWktORzFUMW1xUGsxWmN3V2Mzc056MGtjdGhZR203?=
 =?utf-8?B?cmFFUVhqcjNIR0JhRlJzb3l5Z3MybTcrdUJHWVF2dmliakdPTFpYOXVFVFZh?=
 =?utf-8?B?UTFGb2x6KzNxeVFMT3BHM0MxYStkVjFuNlVEbHlvMDB1V090d0tBVEEwajZF?=
 =?utf-8?B?L3FUd0hreDRDWG4zblJMNmNrQlU0bjhwcy9abUZhZkhvOUdBNHhoYWR2ck9j?=
 =?utf-8?B?MFpNdjFsSlN4UFc0MzRPVnJBTi8yVzRpLzRhd0dvVzZ3QWU2UTBNK1ZDdmt6?=
 =?utf-8?B?ODVBZmRHRXM3dTd0NGVQSjhSYmF6TU82cENPcGh3Y1ZNZThGSUY2L1ZFZHp3?=
 =?utf-8?B?WHM5NGN4eFZyd3kxeVE0QncrNTU0UC95VWlLS0ZUaFRWL0hmam82eWdXeFg4?=
 =?utf-8?B?TjQrdmxjcFF6aXlTM0Y5bk8vVDE4RXA1OGxDZlhxQzg5bmlVQitvVllZcGd5?=
 =?utf-8?B?akdaU0VTQWhzc3hUZWJnbnhNUFpJSFFaaWxIZ1hNSFcyMGVJbkxsSlRPSkZq?=
 =?utf-8?B?ZGdKcW9IZXNqZlVXUUlOUTgzcEpnRmlLTThHNmpJdWtzR1ZUSnRGYzNZQmJ4?=
 =?utf-8?B?QW1uTjFtUkxSdVl1VlBwN1JqZk03NEsyaTRmcThlVXVUWFRGa25RYlR0amxP?=
 =?utf-8?B?K2JIQkxubEduT0djM3lUZ1ZjdUU4K0lqMG1BWnlObFovNFlNU3kwcUlGaFhE?=
 =?utf-8?B?Ky9ZalFzQ292clJPd00rSEZkOXcrdEFaSjlSRFBhMk9GQW1OTC9XUFJnQjM2?=
 =?utf-8?B?Qy9xRWdKWGJFb2lqWU5sRHpQdXZzb2swRlNNOTZWNlJzNVRnVFRBU3N1eEJH?=
 =?utf-8?B?dEE1c1lLQjBVVkROQUxaQzYwME14bGVJS3VaS0w1ZExqUVJ4NkFSVm12VHAz?=
 =?utf-8?B?UWJ0MEViaTRQcVh4RThZTG81a1hXQXdmV0pKVXFsNHJZMDNLNVp4bThwNGFB?=
 =?utf-8?B?V0JwK3ZtdWJ2OHBSRVEzdzZLbVhxeVRGb1VxSTBhVHZuYkNyRnUrSXZIUmta?=
 =?utf-8?B?blFnYjdxMGZSRHhQbCt0QVJFdFlQWFpIV013blVhM3B1WGRmQzh3d1BmUitn?=
 =?utf-8?B?MVNQT3FidWdnZisvQjN3UDRyeHB1N1hrVnVDNytIVVBYajJud2FPdXQ3TE9U?=
 =?utf-8?B?M0lVbG9vMFBJL05KNU9WWUtBZlN1RWY3UnhWUUx3bEw5Q3E5SHlYQkpNanpT?=
 =?utf-8?B?bkNBeGVRZjY1WkhJUHBzSWhkRlRzc0N5eVNmV2NCaWpHOFNrcFNVM2hVRDRs?=
 =?utf-8?B?ZFZrZnlEeGtpZVRTMXc1akZEdVM3NDViOGlXOFJySEVPbzRUZHQxdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae892f47-7ddd-4fa7-fc97-08de4dffa093
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:15:44.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peyRHNVigLjEsuDcSvt8buhnI7l1Oev9R/bL+/EJsrBrxGGNx/ABGN7a18yWthL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9199
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/24/25 04:10, Vivian Wang wrote:
> The Sophgo SG2042 is a cursed machine in more ways than one.
> 
> The one way relevant to this patch series is that its PCIe controller
> has neither INTx nor a low-address MSI doorbell wired up. Instead, the
> only usable MSI doorbell is a SoC one at 0x7030010300, which is above
> 32-bit space.

Oh! That sounds like a really big show stopper for a lot of PCIe devices.

Pretty much all 32bit devices are impossible to work with that.

If I'm not completely mistaken that even makes the platform non-PCIe spec complaint.

> Currently, the no_64bit_msi flag on a PCI device declares that a device
> needs a 32-bit MSI address. Since no more precise indication is
> possible, devices supporting less than 64 bits of MSI addresses are all
> lumped into one "need 32-bit MSI address" bucket. This of course
> prevents these devices from working with MSI enabled on SG2042 because a
> 32-bit MSI doorbell address is not possible. Combined with a lack of
> INTx, some of them have trouble working on SG2042 at all.
> 
> There were previous dirtier attempts to allow overriding no_64bit_msi
> for radeon [1] and hda/intel [2].
> 
> To fix this, generalize the single bit no_64bit_msi into a full address
> mask msi_addr_mask to more precisely describe the restriction. The
> existing DMA masks seems insufficient, as for e.g. radeon the
> msi_addr_mask and coherent_dma_mask seems to be different on more recent
> devices.
> 
> The patches are structured as follows:
> 
> - Patch 1 conservatively introduces msi_addr_mask, without introducing
>   any functional changes (hopefully, if I've done everything right), by
>   only using DMA_BIT_MASK(32) and DMA_BIT_MASK(64).
> - The rest of the series actually make use of intermediate values of
>   msi_addr_mask, and should be independently appliable. Patch 2 relaxes
>   msi_verify_entries() to allow intermediate values of msi_addr_mask.
>   Patch 3 onwards raises msi_addr_mask in individual device drivers.
> 
> Tested on SG2042 with a Radeon R5 220 which makes use of radeon and
> hda/intel. PPC changes and pensanto/ionic changes are compile-tested
> only, since I do not have the hardware.
> 
> I would appreciate if driver maintainers can take a look and see whether
> the masks I've set makes sense, although I believe they shouldn't cause
> problems on existing platforms. I'm also not familiar with PPC enough to
> touch the arch/powerpc firmware calls further - help would be
> appreciated.

Over all the approach looks sane to me, but the radeon patch needs some changes.

Going to comment on the patch itself.

Regards,
Christian.

> 
> My intention is that the first two patches are taken up by PCI
> maintainers, and the rest go through the maintainers of individual
> drivers since they could use more device-specific testing and review. If
> this is not convenient I'll be happy to split it up or something.
> 
> [1]: https://lore.kernel.org/all/20251220163338.3852399-1-gaohan@iscas.ac.cn/
> [2]: https://lore.kernel.org/all/20251220170501.3972438-1-gaohan@iscas.ac.cn/
> 
> ---
> Vivian Wang (5):
>       PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
>       PCI/MSI: Check msi_addr_mask in msi_verify_entries()
>       drm/radeon: Raise msi_addr_mask to 40 bits for pre-Bonaire
>       ALSA: hda/intel: Raise msi_addr_mask to dma_bits
>       [RFC net-next] net: ionic: Set msi_addr_mask to IONIC_ADDR_LEN-bit everywhere
> 
>  arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
>  arch/powerpc/platforms/pseries/msi.c                |  4 ++--
>  drivers/gpu/drm/radeon/radeon_irq_kms.c             |  4 ++--
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  4 +---
>  drivers/pci/msi/msi.c                               | 11 +++++++----
>  drivers/pci/msi/pcidev_msi.c                        |  2 +-
>  drivers/pci/probe.c                                 |  7 +++++++
>  include/linux/pci.h                                 |  8 +++++++-
>  sound/hda/controllers/intel.c                       | 10 +++++-----
>  9 files changed, 33 insertions(+), 19 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251223-pci-msi-addr-mask-2d765a7eb390
> 
> Best regards,


