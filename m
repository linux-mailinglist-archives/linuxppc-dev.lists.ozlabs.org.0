Return-Path: <linuxppc-dev+bounces-15387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E215CFE899
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 16:21:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmWw10l2Qz2yFh;
	Thu, 08 Jan 2026 02:21:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.200.36 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767799280;
	cv=pass; b=D8vLfEpuFgKlgqATZTL7bPFRIMhB/3qSvS9tm7g9M6ZWxP/6+uzaEgdJpuNMRkV4JhkXNh7JPDFz/AxA+8/wuQkW0dLQXExePspUUtAJsbIXxmz0VusUoBWtg/uoGMYpoVsAMUKyXlH0APnfvqPOmXgA0Q9q/hW54Ab1SAezgINvydK5JgceMlE/cmiND0wVe5MKW/4ytmpg6r20vOwL5PHrL8vWpeo9KpjlEXYxFpCtkb49LrLkhvWdwFWGBwLvgO3P4Ip0yx7KIXU6yUTJ0p06GB1hhMm3qtoo+YX1Z3KZKKd6Il+Mo+AE+oPgW5FJ5N1NMKD6ohX3zBfnW0BZlg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767799280; c=relaxed/relaxed;
	bh=K55JKBo8dSw8+kcUZWr/YgVVbJyvSrh4tZwzE/8AgfU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b3DbEgjxV21Xf3j/OyitMO3UrcTTjQLVWTJVy54DNtLRCgMSjD9FVuwcQA7PiKWW6I4RpFtwcCyfDe0Jtya0sH8rSbg8lBZPqBYEOkVz6u3ViSOXRlyYODIw7FxAGLYGoL/sLEc4Q/Y1HN3wl+pMDHALPEEMhGjgIRqecPI2c+BTimwqyT5r/8zvAoEJBS9VOX+NNfGCxxKLjRlQQce3EvhWzQeDCGd6agT9gC+QfGM929op+e9k+SMmYWu87+W8aXWiztf458c4a7fXoD23npUs5EgrH6qEGvO8Gj+BQoYkd8kIzZfCvn+bG2mlkGILwdnB3dDPpoAJuDw9F7+LMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D3Ea+CEM; dkim-atps=neutral; spf=pass (client-ip=40.107.200.36; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D3Ea+CEM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.200.36; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmWvz6PfZz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 02:21:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBAa0UIwlYkGK96F6bwxl2XQ6HPR2Bk9/6AfbU8HFzaEgLnRkDJKMqakzirTBDmSH8iYOM1mG3jdK4MHwtOqBbYVNEiCyniIdu61MVD7BnRzG5pR8yzJ2GDLdIhHnDRQqfRMtvA51IjgdyF6sIMuYUBn6CdjwmzbKPy0XB0KDMA/pga+Vh2L5TmeORo5PyIpP/JavvRp4X3IqXGBHSUO25KaMB4EQtZZkGub9uAOK+kGSLD8eBINnbG/5iD5Ukf4dQvsTxaJco2P90D650yFjqh9dV5rsYT6BKq/2jdWSLIrrcl5YSuOzxg5rPe4M7yG5B3XeC2xcD03KK/tz/1Z/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K55JKBo8dSw8+kcUZWr/YgVVbJyvSrh4tZwzE/8AgfU=;
 b=L/v7RAwMLboDY2cPVmF1zuhurM/aFmLEkwXQTukLRM45gJNIGh+wbGUINAcXZDRFAxlVBK+k08I2Y2ctM9GFYmdqgKbpBCUzezSPlwapOOZSd2vrLj5prHKC1/S36R5Ul8PM5OkIvZjw2soTBEFyv/MS5PhEmwqTWWuyUNdHCY7DPsXvmToZwobE1rmVO0ZdQQElEXnMSlYLu2iNCRS/dsor9mtIRJkUrlAJC1yOG2TA7T+l0O3BD6BiK0z7XDI1evCPyxjxw5e6+LQLa8T4o/U+tptIPxOurxuQ9smU0gSr2C+1MdfY/PSuFg7fw7WAmzonqXeUq7LzijyDsA7ktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K55JKBo8dSw8+kcUZWr/YgVVbJyvSrh4tZwzE/8AgfU=;
 b=D3Ea+CEM/jwLSXa2LA/9ZrE0do7p+RxJm9Dk/vp6qVy+opCjFVfdjRlAZLrn4fPvETLEWC25Qwyeg8gZxDKOPNv/wKaDby94wkzHWEXnmjqBf9F1QDtRVwPF+leWsVY/CuXPvoTXXEwX78vCSq0yx/qFUieMyhAKbVFxdNjpSW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8500.namprd12.prod.outlook.com (2603:10b6:8:190::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 15:20:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 15:20:33 +0000
Message-ID: <15ec03f3-f0cf-45f7-b7f6-98b075533d3e@amd.com>
Date: Wed, 7 Jan 2026 16:20:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/radeon: Raise msi_addr_mask to 40 bits for
 pre-Bonaire
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
 <20251224-pci-msi-addr-mask-v1-3-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-3-05a6fcb4b4c0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0363.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::12) To PH7PR12MB5685.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: b22c36b0-e083-4677-d100-08de4e004cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnptL0pVT0JCdUEzempXS3ZyeW1rbHhxWFlvd3NBMVljSmR0ZVJsa044WlN3?=
 =?utf-8?B?azhVdUVJKzRkaG5WTTJyTEgvUXcyb1hQZnVWZVRxOG5GbHlsZlNadElZQy9R?=
 =?utf-8?B?T2hRanNpSCtTVXlodHo5UTE5dU9iM1U0ZmxOMWpzakdPTmhYOFgybGNTa29M?=
 =?utf-8?B?cG1YdlBreUxaNlBlRDExS3ZSNHJFT1RBQ0ZzdFlKcmY4RmhNRUxkSzAvMS9I?=
 =?utf-8?B?WnZZNnoxME9jWlVDZFBqS3dncnlxUFZRdkdOK21KZXAyVlF4Zi94ZzV6eUtQ?=
 =?utf-8?B?STFRRzFPdCtpT3h1QVkvUWVnZ3dkUFFocFFReDBFY0ZReUlKZ0x6cGRYamtv?=
 =?utf-8?B?QkZLWlRBNU9vL29CUUYrSEFucm0vYS9jaXgrUlloTzJBZ2VpTG5VY04yYWxG?=
 =?utf-8?B?NEo4MG5Eenc0VzJmSHkzT0NZOTRnRXM5clVTUUF2VTRDV1I1blNqU0YrYzlN?=
 =?utf-8?B?VjU2YmJzYmo5allJcndpaU1vVHh1WXljU1Q3UGsrT0NHK2pZVVByQjFjb3Jw?=
 =?utf-8?B?dnh3WmVmRktMQnRtTkdMeGVzV3hQNWJtWGR0UUoyckJOaU1GUlRnenBxOUxR?=
 =?utf-8?B?Qi9vdnZ2VENDN0tlOFhSQTVSdTlFaHp0R3RiczlZejZnY0pXdVFVYkZGTHNB?=
 =?utf-8?B?eGhFNWt3NWRjWXV0aDZvdHN6bnlKY2RKNzRTd3dvU0pQSXRJT0VkQjJzK2RH?=
 =?utf-8?B?eVN6YVhWTTlaaVUxUmpZYzYvQkkvVmQyNkZoNTUyeitvbkpkZVcreFdMOW84?=
 =?utf-8?B?TGdYQ3YyaEwrekUwTXR6T25MeEZDeE1qVXhnazJnMVFrSFlvYkNFU0RZS3Bk?=
 =?utf-8?B?ZktWS282VnkzUFVLbWlMdEZlME5ZOXlXbVVjZS92Q2RRMUZveWxWNkE2cGdk?=
 =?utf-8?B?bGpucFAxcnF3RE9XS2JwNXgxOHlIcVFJdWxNcEphVlQ4ekcwWHZzKzA4RGE1?=
 =?utf-8?B?c1g0a3pNNHYvZzVLVG9CRk1sQlVKSnFuRE1LY2pQYXV5bFB0a1FjUW1RNTdU?=
 =?utf-8?B?ak1aRC8waFBlbjFTaWcreDJ6QUZiSnRYZ0NwYmNxM3BLYWFYTmYyQ3JXVXNt?=
 =?utf-8?B?ZUVrNWttaE42U2ZRa1RoT3VkeDI5bnpVWDRLS3lpWVdiajYzaDNaSUVRNHlO?=
 =?utf-8?B?RHYzZ0xOR3N2Unh6djJTVFFzUFl4UmJJTURmNG1lV0ZQTmFtcm5uU0dXNC9G?=
 =?utf-8?B?cXdLd1RuS0VsQm1jWXNwclVNWnJWYXBPMlFuYzlXTUhVQ3U2NE5mYUliWXZC?=
 =?utf-8?B?Vk84TkVtazZlRFFEWGgvMTJCRmtTbXFLTkdjOTNwdmV4YXB6VnFnOUg1TkF3?=
 =?utf-8?B?L0dtQlR0SWlQelV5dzNmTUJidVNNWi9zbkg5Y0svcXZmeUxWVmJIVGxwaHZ0?=
 =?utf-8?B?UVNRazM3SjRrVjhzNU9hc2hFcnRaTkVjME83eHplU1hFQWRMMVNkSEpEeXZL?=
 =?utf-8?B?MzVLNDZ1UnIrOXZaYzZEN3JRMWw4bzFGV0JReXZQaHAwdDNRdmxsQVhkZVlO?=
 =?utf-8?B?TWhOTERtcjU4MDlXS3FhZzZ5ekk1bjE5L01lZmFwcUZUYkgybDR4YWZERnA5?=
 =?utf-8?B?SjZEZXBOSlRxbzN4bHAyZzdGeG9EcHM1cURXRmkwa2ZIVThoTzNaTzYrTlR4?=
 =?utf-8?B?c0pscUQ4N1BDdndENE94UHJvMmxmU1RjaHc3UTBKNjd2eTB4U0NaWW1vYVVF?=
 =?utf-8?B?ZUk0akYxejgyaFhWQk52Wi95TXRSc3RHY2h5NW1tODZlakE4SWE4S0NXTGkr?=
 =?utf-8?B?SzlsOC9zdkRlRnhSMHNSMlRtOTQ3bUJVUjhEVkx3VEQwVXNqN2IrVHdtSjd2?=
 =?utf-8?B?emJqYkN0K0dCZ28yOURQcUxFcGQxVkk2YmxOdzBzeHFvd0hqU0t5YmZhOGs2?=
 =?utf-8?B?SVlHMXlNeTNiTG1xdXVMc2dnSktKajBteVdLVnJBNUtKMGFNZnhaYnhjN0xF?=
 =?utf-8?B?L0dmNlQzOTRZdkFkZlVZM0NvMm4ycnoxak5xRHNnb29vS3FsYzJQV2lKaGZ3?=
 =?utf-8?Q?NHGfVtlmzKFVXfAH0XdRNiWncAxLfc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFUxNU52U3NVRGdvaGJTcEZZU25NZU95Qm1XT0w2aVk1MHRDTGk1S3lvN0xT?=
 =?utf-8?B?WTROclpKUVdXeEJudURucWdYbjNNdHRvSkJyR0lVK1NMM054VjBLc1ZuME1z?=
 =?utf-8?B?QTd2eFF3VHBxTE5TSFlkR0doRjlCbnc3aWRxMFZLd29RZGFGNTRiQTF2OEM0?=
 =?utf-8?B?S2JOekZ4RXJBTFk5R3NTMVdmZ09GckJRbElIdXo5ZVNHTmFFVCt4dFYybERP?=
 =?utf-8?B?eTJYUXdnYjRUTnlKNTM5VGZmN2l3M0g1Z2tEVks2NkhpVUQ2eWgrZGM1VDZr?=
 =?utf-8?B?cEV0cFFuWnl4amxwaGRYUlhSV2VxdTAvcVdqRlEvQWFFdG1PWk0zZW9YbFFv?=
 =?utf-8?B?emxFM3c0Wm1FYWpkeTZ3Z0YrZ0tNRVc2am9ZTUM2bDlKR3lsQnBDaEJxdkZk?=
 =?utf-8?B?TDNTcFNxSkVIVm1yMlphd2V6cFdEUDR1YUFnNXRKblJpVFlFZEZzRmU2Tncx?=
 =?utf-8?B?V3g0ZFVWNjZVeVFyT2JkZlhXUXNHTnJOWkcwTUcrOTFvS1JURFZvR0tySmhL?=
 =?utf-8?B?YVZBdkhOdU5idGN3QTRLcFRJdzAyRTY1VlpSVDVvRFFyQVI0WWphelN6VDBL?=
 =?utf-8?B?ZmlxOUVneDBJSUZhS3IyL2Y1Rm8vd3pJOTlxdytmUnF2MnhPWFdQV3JOby9j?=
 =?utf-8?B?aVFuMStPaWxXVEl2N21yMEg4NlE1K1Y5VTdGbnhJZmJwOGM2VC9uUllCdnJ4?=
 =?utf-8?B?Tlh1aEJyZGxWTDcyQ0Z1UVdRMzRuUFNBUmYraUFyMWdSSGQ1Z3RML3pkS3hi?=
 =?utf-8?B?Q3llZzdQdTU2QzdzSGNUK3pBUWhlbk9Kc2k3OXNtYmlWKzgvRW5JOSs5Ymov?=
 =?utf-8?B?dEhMc0lCU1RYOUpoSVV4SUxqWmM0WGdxSy9JdVI3QkE3Qk5PREVrZmk0RUFT?=
 =?utf-8?B?QTFhZ3FYLzNTNFZHMERvT240bXFJMUZBMFNTYmRRdjJnaG00a2libUdDanp2?=
 =?utf-8?B?djhJNFV6dHY0ajVVY2puSERQcHN4bUpmb05KaU1kMDlFMElzWHNBdE9KKzRm?=
 =?utf-8?B?REpGYXBVaHk0S1Z3djR2TS9NUVhPbC9SRTQvTnY5RG56QmpWbE1WdC9YbXBH?=
 =?utf-8?B?SEMzb3FvMnJBa3ZkMm9LYVZNYkVBQTdWZllTTHN4NEtYU2FtalgzVlFlaGli?=
 =?utf-8?B?dEpKZ2dEOXRFR0MxZXJpU05RZVpzTUFTYXU5b2d0WjRnZEkrVHhhZGR1R3Ay?=
 =?utf-8?B?N2NhTXZEL1NiRG5qMFp5akRzOGJBeVk0UlJrck0yUSs5UU1ndUtSZlMvYzQ5?=
 =?utf-8?B?R25mcCs4Q01seDRTSVovQU0wT0JmeEhtUzZpelZabkxtc2NFY250Uk12dE54?=
 =?utf-8?B?Vkc1dTg1V1g2bDFJZHZWaTFTWUJtMXFmRUZsay9aZTVMMUVyTVc0bVVnTFh6?=
 =?utf-8?B?K0hnR3VEUGNzNmFlY0s4d3QwTnhrenVPL0VCUnh6Sk1tYmIrV3VGNUVvWUp4?=
 =?utf-8?B?b3NaN29aTldPSmNuLzRIa3lTOGFDMllSQm4rVjVVSjFEQlU5bWU1RVlUSER6?=
 =?utf-8?B?SUhWWmxrLzFlbzJHaHJjcVcwMzBhQnlZRThtdHM5cWc4c3Jjb2tnU3BZY2lZ?=
 =?utf-8?B?L2Zld0JDaEVMbzY2WnVsNDc5M1l2dTE2ejhjWWFPMzZOcFFBWnZpUlI2RXNa?=
 =?utf-8?B?T2JEYzVYQklFSEhnQ3hqT0NHMTVNRjBpOU5YWTZkenRnL2FicTJVa2JQdmpI?=
 =?utf-8?B?UkcxbVk1MnBncGp4MmdmY2x6STdYZVZQa0E1aE4xNEhITXk3a0FxcXdUVXpn?=
 =?utf-8?B?S1R6TnFzNnUrU0o3emZXMVVUWXAxTFVTRlpZUVM0bmdNODhzRlk4ZE9HWWlP?=
 =?utf-8?B?M2V6SjZ0Zlo5NjN5Y0pISHR5bytMTFVsdjNSUzZhczJ2ZmdMdWVNb3Y0QlZX?=
 =?utf-8?B?TDdyMDZZVlhDVUZGN2NlS0xvZWhoSWJCUlh2cDd6NmVXNXk3V2hNaW0vcndZ?=
 =?utf-8?B?U3VWVzMzdko4amo2a0FMR0lnVkFHZUZ6NHF2TXpTMkRpQ2oxay9CSk9JazJk?=
 =?utf-8?B?cUtZS2JYYWJlK1E0UUxjSUxEV3hzS3lpL1NSdGVVS1M5RGNDTU0vUjdVRndn?=
 =?utf-8?B?R0VibytENXZRbUx6bU9JclRUU3JIQkMyQXdHc3Z5c2luUmFGUkRucXNTVThC?=
 =?utf-8?B?SHc0ZEhhVU5kMXRyMElYOFFHaFExNDJ3aGRlK1puVnZ1ZTVSZWsxakhoV3VC?=
 =?utf-8?B?NEw5V3Z6S2tqNVhIRTNjbkk0Q3pTMEp0VzN5aVNYZlR3YkpoSVFKOW5ycWRV?=
 =?utf-8?B?OENpaVBsazQvTGF5WkV4NmU1V1FNWFg2ajlYOTVMYVlLYzZEaUZTdktJYU9G?=
 =?utf-8?B?SkJrREU0Kzk1RHpjSUcwTXBxeENhYklOMlRqY2kvbWQ5TitPTFVXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22c36b0-e083-4677-d100-08de4e004cf4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 15:20:33.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwwUVtb0hShOtC2gwiYGWQmn5kYsFT7ZADsUBNzkwDOjkWkdY6ModGWEB5S5c2n8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8500
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/24/25 04:10, Vivian Wang wrote:
> The code was originally written using no_64bit_msi, which restricts the
> device to 32-bit MSI addresses.
> 
> Since msi_addr_mask is introduced, use DMA_BIT_MASK(40) instead of
> DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
> precisely and allowing these devices to work on platforms with MSI
> doorbell address above 32-bit space, as long as it is within the
> hardware restriction of 40-bit space.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index d550554a6f3f..ea519d43348b 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -251,8 +251,8 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>  	 * IBM POWER servers, so we limit them
>  	 */
>  	if (rdev->family < CHIP_BONAIRE) {
> -		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
> +		dev_info(rdev->dev, "radeon: MSI limited to 40-bit\n");
> +		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(40);

Well, that is not even remotely correct.

Please move that close to the dma_set_mask_and_coherent() call in radeon_device_init() (file radeon_device.c).

The check there is most likely already what you need. Should be pretty straight forward.

Regards,
Christian.

>  	}
>  
>  	/* force MSI on */
> 


