Return-Path: <linuxppc-dev+bounces-15345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DBCFB1E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 22:44:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm4SW0mt3z2yFJ;
	Wed, 07 Jan 2026 08:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.198.16 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767724705;
	cv=pass; b=SftIwgR94vZfjlQPjpuj5fKADHqvquFBgrNs6dOjYUJ+TsJknSGM1dTRdsDKNyfoEl3InFQ87pV7xuvXcdtKqNIFrU98aNtd8HWOAOqFYhNG3SgNYiIvspiu8PMryYL26mAJA5TdPS9AMG54s6LPD6xdS0VJ6dV+hDMiutNtWIDPIpcpo6K6yi0ejy5x/N9lwHGMOBsGPC7JQZ3DcTxRX0aksuUJI09jvonGAZck/xz14CFI1If3FxO49fwhbcZKdnyAAe1/VTI6kxbk+iX+3hr7ojDZln5BllBRwMuZ2hEJmPYw4+lVHdIJxDSq1+zYFW6Lpv/tTpM87CVMrRrDBg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767724705; c=relaxed/relaxed;
	bh=cGwxJRjy5P4Eikg+OVZ4YWzML+eiJzjES88GFKtE4Uw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nJS5srRn+MTS/EcY+d/MQCYAdZLXsHXxT4gR5fw6rIKww/mlLjvAItSqQwUagxxdS+THZsLPiu92cx4GEdI1uhRxBJPXvLKmgqjWG5C/OCAlNZijRXq4xZjiHfrSR+LPTTKmxwy/VqRh4tcaosDvjEm2l7pwfwmwu8YqyqvgsCl2b0z6xaCBgqRHlY8+IqFyW7DgwB5dGW7NwpvCXCSzwWkr2zRGScnXkut+YOFJCfr3aGvoe22DoIle1OfWrk8IjFDwXo4DopPtopf2P9kkDcRvIjXip/Xn/Xb2+0SaPOzYGX7IPFb8w8LkSI/oMPZU9M3aP73eGM0aXFiv5au0Ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TJR5dZGK; dkim-atps=neutral; spf=pass (client-ip=40.93.198.16; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TJR5dZGK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.93.198.16; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dm0Kp3yRQz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 05:38:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huayJrKUtgiLtgCI7o8XwF3IGMie2GGgqzdDsEJ8ol7QsVDEfIM3KWGFH2jbzoMotvGexb+ihqJ9JF7vr71pX0B4q3GVF2+E321sndvv1A8ygnyg1diKIK6+aQrvuZOq8c2gNuj5zlM+RoYudjFzQubYgWI4Oz0UTl71bpKas3X2/fQT7i39ulCFUMR7hO0Ewhg79bNwnl2mipLQUjhpaZnWtjmQuskpDrKB7QOoX1Nc9KEhMuQgKoBDcw1k+Fqkhh/R2fc7g8Q74GWMDz2Yx/vgK4CvaW9TtNtBO9sewrE3659FPIEUgitHAxFOzqg24rBIWyvdl4NB+Rw2Z+dBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGwxJRjy5P4Eikg+OVZ4YWzML+eiJzjES88GFKtE4Uw=;
 b=cWfMhysqM80SNpdYdjy85WWzcjhmj35OxoX9wyaFnFF2JK9wGKVWlUXKodxTVQloLYrJIkME4FXmb7/V8eNYgAB7YyCr7ogQAt4qkdOvHv3dapa+Id3WR+urysDSV4yTxKLLaNLWQkNnsVh6Kct5PlbjtoBjMk9S9dlUgwP2F4Z8FSljd4Y4MlCsSoJVB+H663LOq1XzvjIO1E4x+xrVIHowoRerKP4/ZTBqIvWs8K4tzJVjsmxbtRcujIG1I5oMumylfJbQvXLv6EquG9GrqXI1xKvtjpBEahA7imfD1BgHQlfMDU7P8R+qtRU7gvvlhCsk04pZ39CvOloEzHfOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGwxJRjy5P4Eikg+OVZ4YWzML+eiJzjES88GFKtE4Uw=;
 b=TJR5dZGKX4hF5jR3q47a+NycbuttAk+bIddMpnh46UbnX1tkArIJMRpIBvTbOkgf/xbKOPjuWCZWkJq/4+3ZmhUBLuLdNAaOgCLDmfprPNkybISP5r15+7RoU8I6unfNcduVvmcmvJ2UPnyJlqFPkuM1pY3WWXpc7u7h3vJ0Jbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 18:37:40 +0000
Received: from SA3PR12MB7975.namprd12.prod.outlook.com
 ([fe80::9b66:22f9:86fd:fb74]) by SA3PR12MB7975.namprd12.prod.outlook.com
 ([fe80::9b66:22f9:86fd:fb74%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 18:37:40 +0000
Message-ID: <970e6955-d345-48e3-8ea5-83c577ecc563@amd.com>
Date: Tue, 6 Jan 2026 10:37:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 5/5] net: ionic: Set msi_addr_mask to
 IONIC_ADDR_LEN-bit everywhere
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-5-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: "Creeley, Brett" <bcreeley@amd.com>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-5-05a6fcb4b4c0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To SA3PR12MB7975.namprd12.prod.outlook.com
 (2603:10b6:806:320::11)
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
X-MS-TrafficTypeDiagnostic: SA3PR12MB7975:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a32090-a167-46fa-ac68-08de4d52ac0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVhlbzR6WExDMjI2L21CNjhJdUVQNUc4M2xsSGdmV0E5RW9qTDZNUGtCdHEy?=
 =?utf-8?B?Y0h2VUprcHVsdHFkZzRjYVUzK3Zyc3k3QVJtT2U3SHg1Q01JMzVNdTBYNGhx?=
 =?utf-8?B?RWF5bUJZeFVOTW84NndNdGpVS1lJYzB5cndORC95dHMySlh6Y0twd0tDaUxB?=
 =?utf-8?B?cHRabnpaZVVsa1phRGx1K2ZJem9ucFZvUXRCTTlpbFFPQ0lJV0JiOE5ZSU1h?=
 =?utf-8?B?Unl3NW1NZU1DQ2NiUWJsbDA0RHdXSU1kL21wMVJVYzBKb1V0NVBMUHkyR25R?=
 =?utf-8?B?Z2Vic0R6b2gyUllLZ1JUeFc4a25hV3dFWWFKN3RsUGdLSGljVXdZd0tmSlpa?=
 =?utf-8?B?QU5zdDBGWXFwemQrdVhhYkpzMUNxeUZsUFJ6WU1wRTB0TTBuc3BuUFJoQnFX?=
 =?utf-8?B?OVFybUpFdm96K1dWU0NNMVhYdkQwSWhFWFk2M3FGU082N3FnYkYzaXJ0MnNx?=
 =?utf-8?B?d3hQMHlFbk4zK2VlRTd1TFVvbjJYdlBwQmQvbWVKTTh3ZjY1VlUwNGxhWWFS?=
 =?utf-8?B?MURzYm80aVgvc2RWWGxtQ2NHOEI4TDhXdEJPMk8ydG9CM2huSElxbThGd05Z?=
 =?utf-8?B?QWVISzFBazBLTlgzNm4yZnlDdFR4UjcyQS8vRThWVHJuenBqbWVMWDZUdnBi?=
 =?utf-8?B?R255OTR4RThPMmhsa1ZQaW1NSXNNYW9JYXUxWnRNVVRieE5PclRqUEZNUzhN?=
 =?utf-8?B?VENLYUd1Qm9ZWnh6Y2VtUHlmaVRSNVhWek9FVkdHaDBFZGU3YUFpdCs4V1Bx?=
 =?utf-8?B?N0tLLzU1U2NucnNKYkpKUFc4TFFlbFJOOUcwYW13bUQ0amxuQ200NzlQZHZB?=
 =?utf-8?B?Tng0RzhhNG1rNlFJbWgyRk5KTlJ4R0E4NllLSWJlMS8rS3VjT1NPYnUydEtI?=
 =?utf-8?B?b293UCthZlhLYkE4NEtSZHB1ZTBSQzFRRVA0Y2piK2JuMy9ldFRnbjBMdmNj?=
 =?utf-8?B?OXZTODdyVGhvQnlsSVp6THJIYm51RXFDYmNsMjAwUmExUWczZzN4enRPWWY0?=
 =?utf-8?B?UGVWUFRWdWxFQytUbmxvaXdNbGo4T29zMmw2QWpibXBZT1BaN1FrNFZDck5X?=
 =?utf-8?B?N1Q5ZWhUN2ZTR0pLekI3NE5QNEY0S1RtbDVWL1NhRmd1MkQ2dW5YUHhvdTdC?=
 =?utf-8?B?Wkp3SFMrTFZ2Yjc2ZVZnMWRPYnhJcmRZRVhUVDdLVDFDT3pqN2pQSnYranlF?=
 =?utf-8?B?S2pDQ0RoeFNxNlhCN0VFbnJDSXg0VWRCS3ZIRVpNb1RYV3U4RFJDNzNuZ2lF?=
 =?utf-8?B?OU5nZk1LT3NiWXZRYnNrMHI1aEJnQUVPVlRob05XWFN0emhGaWdrSGNzNmVs?=
 =?utf-8?B?dDJqZ01qZUpoVy92bzRyK2F2UkQ5Yzh5RTBCWXFhdGRmd0hHYThUc2xZMTRu?=
 =?utf-8?B?Z2huYkNXdnUxQnh5RnRpY29YT1VtTzBXdHhVbnFLcENONFJHL1dOZTNabEgv?=
 =?utf-8?B?S0FKK1RDcVRDMFM5akI0YmpLL25TR1pUMmpmVlk5dThMUnhxK3FLMndVMkdw?=
 =?utf-8?B?TE1GWmxXQjJsRndITFNISmpaNDRJSi9sa0w5U09iN0N1RW52ZzNnK01PWE5h?=
 =?utf-8?B?MEVkWjhLekYrM1VRdHJ2RzhSaHlYbjBuVDlmVUY5alBrZ2ptRDdWUWNnK2hV?=
 =?utf-8?B?cEwyNkQzQmJMU1JxWU5mOStBS09vdzJpMHN2MTI5cHo4bXIzMXRhL2NyWWtT?=
 =?utf-8?B?QmxnTW0wRWZ6V2h1UmIzZWltMHk1L2dhMk55WUNuTUp0Vi91UmJ4N0s1bEJ1?=
 =?utf-8?B?bDhXVWhqamxXMFBLeTJ2Y3lVb3lIMnRUTC9QZGl3S0t0Mm50WXBQMVE3TW16?=
 =?utf-8?B?UzZGTXFxeWd2bXczTWNqbkJOQzNwWkZzMGNyR21vRGdkemNEYW1ybFhrcktJ?=
 =?utf-8?B?ZW9LN1M3ZnNKOTAxLzE3bW84L3VXdnYzajdxcEFKcjF6ZlVtTnFWemhFMEVM?=
 =?utf-8?B?TWVkWnc2SjYwQTFxYldGRjJrTVhwbmJ2MUNPK3BjVnRXVlQzaHZqR1pmODMr?=
 =?utf-8?Q?8NEDH4vandg1xAnzYs8tJSiuKkibNk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7975.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkt6bWlOVGluQk5zTkZ6MDhFeTk0VGduNDdDKzNmTm5sdDdlUG5JalRSZ3lo?=
 =?utf-8?B?bkZXU2dwSFhFMXdiWi9Pb2dlczBYTG9veldUTnZjM3FueUZ5K0krUTA5ano1?=
 =?utf-8?B?WlBldnhmTUNxOEFJVXRCM3p4NHFUR1lCaHRrN2RSU0xNdzJnM2U1b2lqK0dV?=
 =?utf-8?B?RHQrNkNNU25YeXNRd1psNlIvNVlQejdjbFBZdldOYWg2WDNlbnN3ejVxNndv?=
 =?utf-8?B?L29qeUF2aHc0SzE5bERwVVlKTmRwTVF5ckdDK0dTTVRoVlZJd3NPM0Z1Y0Zk?=
 =?utf-8?B?azU2N1dETThnRC9aN1pXZmVia0RYL1Q4QUpJdFkzTUt4Z3R1Z1hFc2YvMVpu?=
 =?utf-8?B?bnNyWGlJakpmQm5OejhXcE9mNHNwUE1UVjRybmhITjlWQk1xdVBEY3ppd0Yy?=
 =?utf-8?B?a0dOUjhQQXhHUm5IdXpDVmhXd2wrcUM5NzF5ZHNwa0JqYkxoem51ZklsWHJ3?=
 =?utf-8?B?QUhjc2hBcmhxcXZrN2R0dk5wK3pNcjhSVFBGR1BTK2RyajNjU3ZKVUk4MUdV?=
 =?utf-8?B?S281NVZXNWgzSXBMeWMyRXA3dzA0Tk5MUHB2Z21NRnBPMWYxbFlvWHY2MGNu?=
 =?utf-8?B?bTNRYkVOMDFsREREMDc4UDdud3pGZy9nc2NzaERVSTBkSGtOTjA4QVVSNHd5?=
 =?utf-8?B?YWVqemtpZjBwZWYrNkZQbTM0eXdXbkpVd1F6UGNNUzVhT2UxMklITmVHbEVN?=
 =?utf-8?B?djRteUlpTnlzNlI4YlYvY1BZTml1R3gzL2hBWmFQVTUvMitNc2FwQ0p0S1ln?=
 =?utf-8?B?RklKdk5KTzFpVWczZ3YrLzRCNHNuK0l6OTc2aW1yWVNhWEY2Rk5iVGZmMEFC?=
 =?utf-8?B?SFdvOFdzcmg5NkVWOHBBbTJDMTNMRVpEWEhOdEJvMkJyNVhPaG5maEY4NXFl?=
 =?utf-8?B?Mmd4V3NPT1NmYjZOK0tVK21yNDRqcnVjSEVjUkI1NUcwWmViUy83aTliUHRv?=
 =?utf-8?B?T2ZEdFZJeWs0RU5ta2dIQXpkRUY4M2FMSWxKNW1LNTZwNEZwb09EdmpZUmhl?=
 =?utf-8?B?RXM1ZWpkUElxWHRMTXN5M3djYUc1T2dlbEk4anArQytvcmdHbmZMU2xVWnBx?=
 =?utf-8?B?QUdjN08vOHhZQUNaWmM1SkdoZ1RiUW1aRkxIRVFldWl6WWlWQTdpTDFPNUpO?=
 =?utf-8?B?cDZqNmdKNHByMEFnN3lZQmplZUF4Z3pvZjczT1VyTmFMbXowclZ3SDVidVhG?=
 =?utf-8?B?cEhBVStvOXpITUNUSEswOStTSmxXOGtSZ1J2bTl2QW1ZOWR3OGczMUlJcnRk?=
 =?utf-8?B?K2FBd2ZaVHVlVlNBUHFpNm5wdlhaSU9FTG13dmtvQU9Nc0piNEo5VW1Ebk1w?=
 =?utf-8?B?S2R4YjByNmRqQ3ljZXBvTFlUdjhYTXJDTEp5d1BQbWFNMkVGd3dqbGhqaEZU?=
 =?utf-8?B?dlRtdmsxS2pDSi9YWExyRmRJTXNPcE9YMHRQYjdXZEJxT2ZTM2pmWitSeHRD?=
 =?utf-8?B?aWpGRm5iQkc1ZEZjVDJpcm4vcGhTc0ZrYjRPMStNRFErQ3phbStJTndiLzdN?=
 =?utf-8?B?dkl2cDBlK3Z0V2taMkVwT092c3puUmV4dVFMMEhSY0ZwRzdYTFhNUXJrMjBX?=
 =?utf-8?B?R0h0WlBJVjBlNUdhY0RHWkNtZ0RJS0ZKZG5hanZlWUp4Y2dCZGFVQVBXSjk1?=
 =?utf-8?B?MGlCRFVheXhlVUZGU1kxVlF5Y2NxNDdXYTRJd3hlOGtwWG96WHJjWE9nWXRV?=
 =?utf-8?B?VWFzTHgvZUt6ekViNjh0RGRtdzh3NUVraDI1UjF3RXF2cUp0SCsybHAvSGVT?=
 =?utf-8?B?UWdwNFVnKzhMaVhqQ2ErbE53MS82eHh0SzFKYTlMRUROUUlJWEJOUDg2MTVG?=
 =?utf-8?B?K2tQb0Uza3dUUE5PTEhEb0hnRXVVTUNTM1F5cW5MQ0oyWjFHbnE5L3dBd3RS?=
 =?utf-8?B?djFXK0cydzVjZE1BelVoSDFQR2RaWTdNUER3SkRVZ2prRmZwb1poUDJHRDha?=
 =?utf-8?B?NDdpdmFWVVl0UHJvZU9ybFoxME1WTllwTkhzbzdnUXoxNEJhSXd6M0lWckxh?=
 =?utf-8?B?a2xXcGhjbVpESXphU0NuR1IzbFFrb2w0TTJGNkZVNW42SjRaWUlaWExUR0hH?=
 =?utf-8?B?ZzJGTzhya2lzUXc5UCtBbFhUNUEvWkFNY3l4QmlMdlV3bWRsNWtyOFNWWFBR?=
 =?utf-8?B?emREZjhqT0dhQmFtM1JVSE11OG5QVTVZdUZCcTZsd0FFdVFhK3Z2aGtkdE9s?=
 =?utf-8?B?MzlCNTRjcThpSmZjQ0NZUXdXQlI4N0thZlE4cFNoVy9vVCtxNWJjOXZEdGhH?=
 =?utf-8?B?YkU5ZFgxcHdydTVyZWNYUnJWUnZ6aDlnelZYU0RyVFVyZEhiMkprZlFVdHRN?=
 =?utf-8?B?SGdkUXV4VFZmNjhEdHZBaGl2NWhFekhUMytBUzJzMDV1alE3c2VnQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a32090-a167-46fa-ac68-08de4d52ac0c
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7975.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 18:37:40.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiAFnpVteD4H31FbTHaaGCBa1g7ii+AU6uiwGSKu+cXfw8EhxobL+c5s+hE1cc7y1/AKT69Bl8RaPfkIfE/9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/23/2025 7:10 PM, Vivian Wang wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> The code was originally written using no_64bit_msi, which restricts the
> device to 32-bit MSI addresses.
>
> Since msi_addr_mask is introduced, use DMA_BIT_MASK(IONIC_ADDR_LEN)
> instead of DMA_BIT_MASK(32) here for msi_addr_mask, describing the
> restriction more precisely and allowing these devices to work on
> platforms with MSI doorbell address above 32-bit space, as long as it is
> within the hardware's addressable space.
>
> Also remove #ifdef CONFIG_PPC64 wrapped around it, since this is a
> hardware restriction and not a platform one.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>
> ---
>
> RFC because net-next is closed
>
> pensando maintainers: I don't know if this is the actual restriction,
> and do not have any Pensando device to test this. Please help with
> checking this.  Thanks.
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 0671deae9a28..16133537c535 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -329,10 +329,8 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                  goto err_out;
>          }
>
> -#ifdef CONFIG_PPC64
>          /* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
> -       pdev->msi_addr_mask = DMA_BIT_MASK(32);
> -#endif
> +       pdev->msi_addr_mask = DMA_BIT_MASK(IONIC_ADDR_LEN);

I'm not sure that our device has MSI address limitations. I am getting 
an answer to this locally, but we might only be limited in the DMA 
address space.

I will get back on this as quickly as possible.

Thanks,

Brett
>
>          err = ionic_setup_one(ionic);
>          if (err)
>
> --
> 2.51.2
>


