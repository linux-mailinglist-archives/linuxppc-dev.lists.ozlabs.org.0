Return-Path: <linuxppc-dev+bounces-2754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B78609B855F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 22:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfchJ2FTfz2xfB;
	Fri,  1 Nov 2024 08:34:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::614" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730393886;
	cv=pass; b=nSqT9p7Tov0o5tK2Cdr9bnoM+DT6vS14kM27CjGNz2599sepaNm/Ly8T4eyXYojtJB4dGZYqi9hXyGytsPi1jGe6Uru3hrgCazI7QlKQWoF3Ar/oUYDi0p1kn+xFkRr9h07q53Kf9scgLhTdYNLBF07xEXmYYorRW4YXZWHYCaptK3M/Yehv/yzYOt3xCcBlFjRpvYE19/VsEx6K+aLkfJRWHo8gtldJUHT7CtpQR/kxTL0W0SSYQnv8mIG2ux9s2RnMbyvWEPble5o/dlKq/ZzJCzgPfyYBoDeuLlExOSlgmUUVnr5YxE9xQucoYJ6ofPxlExzLBMX8m92TKgDSyg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730393886; c=relaxed/relaxed;
	bh=2J+Q2+BGWSHqaMg36DYQ6TODCYe4ziNpS6isZxrSTiI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WC6/phQrkD8tiaqBL4rP19lkBv3uEKlO/N4LMIDZCP+j5PCxHmeIKja6vJnEs6l3a9vtLinx1i8vhXnoutKTUPizwPirmj7XUOlZ3IjGLSdPQosWYreIIpJQr5i7gef79as5jfFFX8FyoZCaORu6zAHSAiUqA/H7yATkX6ySYtzL7RvV9TmJfkDBTOxkZpE2EAlNTPoKlfJKztdoHikjb2x+unZhWF2IMuGUE3/rCqgyRZ2ouyqNKfZj4q1m8jVDY/+9R2v3cNkzkeeeYq7vz4Be2ar6V0rZv1U5Z1idJn1oqLLfIVdAPbgl9yYJuyWmv13uHJSunuqAASEoRoL9Dw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wRDbQLhr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=shannon.nelson@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wRDbQLhr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=shannon.nelson@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfVYS4Rkyz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 03:58:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ/D0oEjoOE6DUOnAFzQnrDW+OETpW/ucLMknKHwmSY7sPzPJlywKts7SKjmTrCziN5guhKWgA8Q6cCBnThKUsSHPPGCH9IFpUNJJkjZ5DuIz353c+TLhyUWM48vAe3+6uHYd2u0RpwhV4O/74IFzVkM2xNpc9N1bj2peYEIPBsbU1LLwQpCj79SzZBeNv5P1qCtng8N6U5+XbF6O4ki1Qwq4hljdfmi3Qv7gjHBn1rwM/NfFfTlsJBLg+vnkUxYIstUqs9dmqsmUqXYAkYrukDGFxeDK/7dWaJC2ffj+5yL59JDLlYyFnnClvzPu55fWf4OtKKgg5TEEjRuwVaP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2J+Q2+BGWSHqaMg36DYQ6TODCYe4ziNpS6isZxrSTiI=;
 b=IhOcKMgrt5o11ccVLUvdL1zenS5wjmMzawIxyMHNCT0YYn/qCKyP3w3YjfMSs2r9QZwAP1fMwf1dOZDe+HXHBh5vEJPlgrbp64mVsZF8L3koKDAumrShZoJZgMyvl1bUv45yhXSIoV/7lSjvKe7dMR6SmCNYfhHCamYS+Cs67qVzgRxKj3A9VHtmxBEVegbDqWEhPiFjn7ys9T5CTiUJ4UMzR4PyvnhoDHxpHZJGRC9WhnzDZ7E3vvfqHD/Low0rlSFYxa6yCu4jSC9awgqy7UEiQIzXcoy8Uoi2sj5y6RrriILUNap6WN3ocZJuZ/GjvrWKuKtYjTC52+VI4oJhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J+Q2+BGWSHqaMg36DYQ6TODCYe4ziNpS6isZxrSTiI=;
 b=wRDbQLhrl6lkTJcegmtIx9qNo5XyCXC/zhjOe8Kbe7uwQbI7DoK0b5mNkvSPhSJAZh88kyZdJ+XXZ3unvY+d/w6yjy6H3F6R8HuY75wWwGPjQMJUt2Hmp+4mCVP07EPv4cyuskB9KX3FWmbQyZBW/BE4KUlZWhjPa8vM6rV/v1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:57:42 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 16:57:42 +0000
Message-ID: <ba93bc2a-b02a-419a-b39f-6fc7470c50a5@amd.com>
Date: Thu, 31 Oct 2024 09:57:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
To: Caleb Sander Mateos <csander@purestorage.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Brett Creeley
 <brett.creeley@amd.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, David Arinzon
 <darinzon@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Geetha sowjanya <gakula@marvell.com>, hariprasad <hkelam@marvell.com>,
 Jakub Kicinski <kuba@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Louis Peens
 <louis.peens@corigine.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Noam Dagan <ndagan@amazon.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Sean Wang <sean.wang@mediatek.com>,
 Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Sunil Goutham
 <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, virtualization@lists.linux.dev
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
Content-Language: en-US
From: "Nelson, Shannon" <shannon.nelson@amd.com>
In-Reply-To: <20241031002326.3426181-2-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b380b3-83b7-493c-95e2-08dcf9cd227e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M041Q3o0ZTVJRnVaM3kzRzRhV2x0blRlTkdkRzdLUERCM0JqUktGL0xNZEh2?=
 =?utf-8?B?S09sNjMwUmgvZXRMTmFscGdlSmFjeWRyME1VQUpBUnVsR0QxYi9EY3FzT080?=
 =?utf-8?B?UHQrWkYxdnJ5TWp3UlRyTTltY3IzVEY5bnJITnBOYWdnbURLU0d0N1MrTWF5?=
 =?utf-8?B?d01MeTFmcGMyVWxIMDEwYU9rVkM2WU9KMWxuWVFFZ3ZoQUFZamZSQzY2ai9l?=
 =?utf-8?B?ZFZTNzFRbE5SMkpGRC9WZkNvZEFKYVlvMnFIQ3RQQzMyWFZQSlVsY0ZhZS9E?=
 =?utf-8?B?Wi9GRnpHcTlMWkpoQnJGQ1N0Y3RhTE11SFBETUdab1BaWjlXcDZFRTNRQ1NU?=
 =?utf-8?B?WnM1YlE2K1EvZDBTUGp0TjQ4cFd0UHRWV0wzZGhrOGs2eTdLblZIMXlqdEJz?=
 =?utf-8?B?c0Y3Ry9vNi83L0paNXJ2SWRvYmFQQUg3R0grK2dacGErbmpTYnBpVHR2NGNr?=
 =?utf-8?B?V045U0hySTdmMlpzWGR6VHh4Wmp2bUh5WHR6VFdXN2hmWm50SXFnK0I2U0p3?=
 =?utf-8?B?TEdzMjdEVkhXc0NoZXk2UjE0L1pTRGlZSnQ2UWFtVVd6RXlWQ1lERjRVbFd3?=
 =?utf-8?B?VDVJeTJPN3J5WXU2QUFwM2FrSXhrSHdWWksvV01vcTlFNGZIRllPS1BHR0M3?=
 =?utf-8?B?bDlLaEE3ZmQzUUhkUlBnM3VqWFBncHUxdXB0Vkp0d1FJekcxUU1GQ1A0MlI4?=
 =?utf-8?B?V0M4NGtxMVhOMmsrYndBYzMyTFpPRnFjaE1nR0FuTUs0N0lIa0Nlclp1b2po?=
 =?utf-8?B?YmpHR0pvL2NmSUJDQVFLaXZXTTZ1SjZHKytrOVNzTXlBVkR4OFN4eFNtbVdZ?=
 =?utf-8?B?WU9UZ1ROWVF4VzRVSTRtSmRvbFlFZTZkNHVTajZDTUwyd3htNU1jZldPVmkv?=
 =?utf-8?B?NmpQcmFtSFR6L0V6STNmM0FPY3lNZzlvNzQvTzl4cEJlYmhrSUM5dlArdTJG?=
 =?utf-8?B?S25kNXVJQU53Y2lTRWhXUkZMVC9rT1ZBRDhSbERpMzBYNll4Zzh5MTdnVjhm?=
 =?utf-8?B?TFhVM1B5UncrUEkzekVhd05iTjAyc1lKR0tHeEVQUlBLVDdQNHd5V3JzNHd4?=
 =?utf-8?B?NTFuMzF2dUhQdENGUis4TVJLUm9ralIrYmFnQUhaWEJwYmYxaUxRRVdtVTVo?=
 =?utf-8?B?RUtHeFZkanhsbVRsenBpanU3ZE4wYnBFZGlJT3BuVFBrUUhJdmY3bm1TZTFP?=
 =?utf-8?B?N1d1VnFXMDM2U0krbmF2eDNCenlrbGJKamplZWlGWWFzcHRidmVyQSt5WHZa?=
 =?utf-8?B?a08reFRpcHlyZTBqZUZXcS9kd2M1YVpGcmZ4M3g5R3Ryai9GeDIvK3ZkMUJF?=
 =?utf-8?B?YndMMEUydjZ1WDljTHJZUWxXOEllN1kzRVUwNjdyd01paXI1NXAvKzNQWHJM?=
 =?utf-8?B?ektUTHpYM2hhRk8yMi9SNm8zd0E2dDdRcVBVbmJpNVpSVkpZUG9oWGNEazY3?=
 =?utf-8?B?dzlGVU9GTW51U2h4dXRaK3BnUDdTN0RYNnNlVWpBRFExeEtmbGgzd2JXUTBk?=
 =?utf-8?B?YlRaaklET0orT2NIVWthTmNTc2JPNzZUNWxTM0dEK1dVZ1RTdHcvemNjMnA5?=
 =?utf-8?B?dTU2WnltcVJXNTEwMFVhTC9nVDJnUGdHY0tWb3hiVW13OEJHZkpkbWdEWGZE?=
 =?utf-8?B?RkNvazFneFJERXZuZTVYbERCTHdoVWtPOGRZbGRiNGhidXM5RXBXczJ0M05z?=
 =?utf-8?B?UVY3NFduazllUzl6alU4aDhJTHYvWXF1SklaT1V0eWFiYnhXOThnS3VNNGF4?=
 =?utf-8?B?VVhwQ1J5RVQwWHhOTEdMTThyd2JZemx1d24yNFNaVU1NT0JWSFQxWC9PVFJz?=
 =?utf-8?Q?APdOKHWc+DWe/dBWzl+X8UJ8sXfzC7IE6g3Ps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlA4YWMxMDlSaXlxMEs1V2s3b3JDcFpHcGdzYzJULzZJRWhadGtSeVQzZXly?=
 =?utf-8?B?dFNkODRkNm0yKzAwbjJ6dDVpcmNuS3lDMWFpbGdRa3AzaFN5amZ6TDVWa1pt?=
 =?utf-8?B?dk1ZcSt5c0YyeHF6aC8vVWlCeVk3TE5TcVA4ZXFnY1g0VEdpVFFEU01Ya2pu?=
 =?utf-8?B?Zlpudi9nMmhTbEl5ODkrWXMxc1lVTncrTHpsTnFpSlNOZ1djRkZDQVlGMEgr?=
 =?utf-8?B?ZnB2RlFlQUhscWRZLzV3aVBFeVo5MXRBMWN1RWlFMnVJbmZaTVh4a2pqRk9X?=
 =?utf-8?B?a2l6TkRBY015MVlDNURQUkZTYkVDeHVFVVpWSGNkTm1uUlhxaURjdllkdnBI?=
 =?utf-8?B?UjU2dWhkUkduNHdNUXVkaGthVlFnYXdGQTlYTmdFQjZGZExpcTdVREZHUDkr?=
 =?utf-8?B?UGw5MTZHbGxHa1k1a2V6SzVVekthNTZGTDc5UFlPZ01nT2x2cDNoSlU4eEwz?=
 =?utf-8?B?NVJnSHcxOWk0UVVnWlB6cEhFSSs5TlRUVGxJNlY0V21xb2YwQTVzbVRPeDUw?=
 =?utf-8?B?M2dMNGlabjlNalVIWjdkR3NhK1FiRzRpOTgwYWNhYUpyRmZhdlVTOXA3MXFK?=
 =?utf-8?B?d2Y2emE5Z0tDazVJbS9qU0wxcmRpZmd0U3VzT2lROXc0Sm5uRWVDaEhkTW1C?=
 =?utf-8?B?NWIwQkh1YkF5dGF0Vk5Eb250US9Tc3lPcWlQSG12Wk1iK1dVNzFBSFZURDU5?=
 =?utf-8?B?MldVRmJjbkNPcHNodkFzWUdPQkRUdEhPY1dxRGtnOXJYZTlGUEt4TXFpcWZW?=
 =?utf-8?B?dFpOZ1RGcHlkNjBsSzFpQ1JHdTV3cmxyV2ZyR3ZFdlJEdUs5cGs3VVp5ZTAv?=
 =?utf-8?B?K3FBVDJ4bUd0MVFXMFJtUEorcXNNMUM4OXJMZDNiZGFTd1pJeHZUYXVPL0dQ?=
 =?utf-8?B?djRtVU9jVUZPNkxjcnRGK3VGejlsMUNHcjB3ZEdPWVhXYTR3M3QzMm5hZ0gw?=
 =?utf-8?B?Uzk0U29Ocmo1a0hxc3prcE5hQURYTG5zdk11Q0I3YzNYUy8zSjFoT0poWHBI?=
 =?utf-8?B?UTVMVFhSaDN4MERFdGZjVlViU3pYMDFVQUFwSExBTG05cWtFTUJ5NEhCTWQ4?=
 =?utf-8?B?MElrQzh2dE9DeVJOSGNwWTlFbEZTemM5RHlOdlNmNDczUEZpZ0dJdEZkRWND?=
 =?utf-8?B?WFUzYURhSkdDV05KdzI0bXpJdzZyTDFzVUlXMFlBRnQrYUtCNGU5dkh4eWZq?=
 =?utf-8?B?NzBBRWM4L1hvOTMyQW5LYWxyNjA2QU5GNE1zd01ZLy9pVTRIN1duTUFmcWlk?=
 =?utf-8?B?cGVpOWpHZHl2SkVNdVQ2V0xHdmpVNUdVVmlneVM1cmJqZDhaR0dkRlZaTnpJ?=
 =?utf-8?B?Sm5wRlJVdkl0T3VyUEJ3UWVDMVZ4eHFnWkJkdVRSNk53RHV3UFlCMGVGODVF?=
 =?utf-8?B?dFd0NE9BS0NNbHVRWlNidXBXRlhDd1FwRnJQKzdlRnFhcE5Ddm83OW5scHhF?=
 =?utf-8?B?YWt0NFFVK3c4ZThqd3k0ajE4RkNzeEZVbzgvMC9TbVZIWkc0ZGxtOVlxUkZs?=
 =?utf-8?B?anZQZzhXeTNrVnBHYmVjZEJHb2pHMnNxbjJscm9BNmQ0cFpwY01pWkZURS84?=
 =?utf-8?B?TXVKL0V1Q1I3RWJldlNkOE5VcmM4RDVXQldoR0IyWlE3cnpPYVFLV3h4dXlC?=
 =?utf-8?B?b1NBYlJoZFdGTitnVFN0ak5qdTRBaGdXazk5eUlpQVVZWEQ4VUdMRFZGcXA5?=
 =?utf-8?B?SHVSWU9mRFBYVkFwWVJRNjlwVWQrRXhHUHJwV252NzBhTVpGNGxHWUoySUph?=
 =?utf-8?B?QW1rdnNjcStRcFVuODRSN29LSlZpUWZlTzFPOFc4bU0vZ0FGY0poTWNUZitY?=
 =?utf-8?B?NCtWWW4rYi9oaWpjdmhrN0ZXb2xObzNMODdwWWlINy9wRy9xNE1FbTVmT21r?=
 =?utf-8?B?azQ4UHo1UmhBL2cwV2o0ODB0R0x4TUpxeXdBY2lsQTNTd3U4bWhkR0FMMFNW?=
 =?utf-8?B?a2tuQVVnSlhMVjlvV1RJNFVXbXFxaEY0SzRrM2NiZHpNSXZzcEFNUWNxOGwx?=
 =?utf-8?B?a3RuMFBYQWlyaFFjVHNUTlFYWWVhQjd4SG9OQitaY1QzM0Rkc2dQQUd2SVd3?=
 =?utf-8?B?elRlRnllWDNhVGE3aW1NS0VPTDVmcFc1V1dKYTNvMlZoR296SzUyU2JKNVB4?=
 =?utf-8?Q?KXRKwxovGqCI8K6jPz4uYIZTh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b380b3-83b7-493c-95e2-08dcf9cd227e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:57:42.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iq3XyI6GBSPQMR9w3P9rpdTp8qJRA7c25BU5POMzmtimG8xk637OKdzGoGj2dT3Z3QRvUdTvVVs2TjeOfLDMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/30/2024 5:23 PM, Caleb Sander Mateos wrote:
> 
> net_dim() is currently passed a struct dim_sample argument by value.
> struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> passes it on the stack. All callers have already initialized dim_sample
> on the stack, so passing it by value requires pushing a duplicated copy
> to the stack. Either witing to the stack and immediately reading it, or
> perhaps dereferencing addresses relative to the stack pointer in a chain
> of push instructions, seems to perform quite poorly.
> 
> In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> 94% of which is attributed to the first push instruction to copy
> dim_sample on the stack for the call to net_dim():
> // Call ktime_get()
>    0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> // Pass the address of struct dim in %rdi
>         |4ead7:   lea    0x3d0(%rbx),%rdi
> // Set dim_sample.pkt_ctr
>         |4eade:   mov    %r13d,0x8(%rsp)
> // Set dim_sample.byte_ctr
>         |4eae3:   mov    %r12d,0xc(%rsp)
> // Set dim_sample.event_ctr
>    0.15 |4eae8:   mov    %bp,0x10(%rsp)
> // Duplicate dim_sample on the stack
>   94.16 |4eaed:   push   0x10(%rsp)
>    2.79 |4eaf1:   push   0x10(%rsp)
>    0.07 |4eaf5:   push   %rax
> // Call net_dim()
>    0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
> 
> To allow the caller to reuse the struct dim_sample already on the stack,
> pass the struct dim_sample by reference to net_dim().
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---
>   Documentation/networking/net_dim.rst                   |  2 +-
>   drivers/net/ethernet/amazon/ena/ena_netdev.c           |  2 +-
>   drivers/net/ethernet/broadcom/bcmsysport.c             |  2 +-
>   drivers/net/ethernet/broadcom/bnxt/bnxt.c              |  4 ++--
>   drivers/net/ethernet/broadcom/genet/bcmgenet.c         |  2 +-
>   drivers/net/ethernet/freescale/enetc/enetc.c           |  2 +-
>   drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        |  4 ++--
>   drivers/net/ethernet/intel/ice/ice_txrx.c              |  4 ++--
>   drivers/net/ethernet/intel/idpf/idpf_txrx.c            |  4 ++--
>   drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |  2 +-
>   drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  4 ++--
>   drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c      |  4 ++--
>   drivers/net/ethernet/netronome/nfp/nfd3/dp.c           |  4 ++--
>   drivers/net/ethernet/netronome/nfp/nfdk/dp.c           |  4 ++--
>   drivers/net/ethernet/pensando/ionic/ionic_txrx.c       |  2 +-

for the pensando/ionic bits:

Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>


>   drivers/net/virtio_net.c                               |  2 +-
>   drivers/soc/fsl/dpio/dpio-service.c                    |  2 +-
>   include/linux/dim.h                                    |  2 +-
>   lib/dim/net_dim.c                                      | 10 +++++-----
>   19 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/networking/net_dim.rst b/Documentation/networking/net_dim.rst
> index 8908fd7b0a8d..4377998e6826 100644
> --- a/Documentation/networking/net_dim.rst
> +++ b/Documentation/networking/net_dim.rst
> @@ -154,11 +154,11 @@ usage is not complete but it should make the outline of the usage clear.
>          dim_update_sample(my_entity->events,
>                            my_entity->packets,
>                            my_entity->bytes,
>                            &dim_sample);
>          /* Call net DIM */
> -       net_dim(&my_entity->dim, dim_sample);
> +       net_dim(&my_entity->dim, &dim_sample);
>          ...
>     }
> 
>     /* My entity's initialization function (my_entity was already allocated) */
>     int my_driver_init_my_entity(struct my_driver_entity *my_entity, ...)
> diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> index 96df20854eb9..63c8a2328142 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
> @@ -1381,11 +1381,11 @@ static void ena_adjust_adaptive_rx_intr_moderation(struct ena_napi *ena_napi)
>          dim_update_sample(rx_ring->non_empty_napi_events,
>                            rx_ring->rx_stats.cnt,
>                            rx_ring->rx_stats.bytes,
>                            &dim_sample);
> 
> -       net_dim(&ena_napi->dim, dim_sample);
> +       net_dim(&ena_napi->dim, &dim_sample);
> 
>          rx_ring->per_napi_packets = 0;
>   }
> 
>   void ena_unmask_interrupt(struct ena_ring *tx_ring,
> diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
> index caff6e87a488..031e9e0cca53 100644
> --- a/drivers/net/ethernet/broadcom/bcmsysport.c
> +++ b/drivers/net/ethernet/broadcom/bcmsysport.c
> @@ -1027,11 +1027,11 @@ static int bcm_sysport_poll(struct napi_struct *napi, int budget)
>          }
> 
>          if (priv->dim.use_dim) {
>                  dim_update_sample(priv->dim.event_ctr, priv->dim.packets,
>                                    priv->dim.bytes, &dim_sample);
> -               net_dim(&priv->dim.dim, dim_sample);
> +               net_dim(&priv->dim.dim, &dim_sample);
>          }
> 
>          return work_done;
>   }
> 
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 6dd6541d8619..ca42b81133d7 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3100,11 +3100,11 @@ static int bnxt_poll(struct napi_struct *napi, int budget)
> 
>                  dim_update_sample(cpr->event_ctr,
>                                    cpr->rx_packets,
>                                    cpr->rx_bytes,
>                                    &dim_sample);
> -               net_dim(&cpr->dim, dim_sample);
> +               net_dim(&cpr->dim, &dim_sample);
>          }
>          return work_done;
>   }
> 
>   static int __bnxt_poll_cqs(struct bnxt *bp, struct bnxt_napi *bnapi, int budget)
> @@ -3231,11 +3231,11 @@ static int bnxt_poll_p5(struct napi_struct *napi, int budget)
> 
>                  dim_update_sample(cpr->event_ctr,
>                                    cpr_rx->rx_packets,
>                                    cpr_rx->rx_bytes,
>                                    &dim_sample);
> -               net_dim(&cpr->dim, dim_sample);
> +               net_dim(&cpr->dim, &dim_sample);
>          }
>          return work_done;
>   }
> 
>   static void bnxt_free_tx_skbs(struct bnxt *bp)
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 10966ab15373..53a949eb9180 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -2403,11 +2403,11 @@ static int bcmgenet_rx_poll(struct napi_struct *napi, int budget)
>          }
> 
>          if (ring->dim.use_dim) {
>                  dim_update_sample(ring->dim.event_ctr, ring->dim.packets,
>                                    ring->dim.bytes, &dim_sample);
> -               net_dim(&ring->dim.dim, dim_sample);
> +               net_dim(&ring->dim.dim, &dim_sample);
>          }
> 
>          return work_done;
>   }
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> index c09370eab319..05dedea6185a 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -716,11 +716,11 @@ static void enetc_rx_net_dim(struct enetc_int_vector *v)
> 
>          dim_update_sample(v->comp_cnt,
>                            v->rx_ring.stats.packets,
>                            v->rx_ring.stats.bytes,
>                            &dim_sample);
> -       net_dim(&v->rx_dim, dim_sample);
> +       net_dim(&v->rx_dim, &dim_sample);
>   }
> 
>   static int enetc_bd_ready_count(struct enetc_bdr *tx_ring, int ci)
>   {
>          int pi = enetc_rd_reg_hot(tx_ring->tcir) & ENETC_TBCIR_IDX_MASK;
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> index 4cbc4d069a1f..43377a7b2426 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> @@ -4446,11 +4446,11 @@ static void hns3_update_rx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
>          if (!rx_group->coal.adapt_enable)
>                  return;
> 
>          dim_update_sample(tqp_vector->event_cnt, rx_group->total_packets,
>                            rx_group->total_bytes, &sample);
> -       net_dim(&rx_group->dim, sample);
> +       net_dim(&rx_group->dim, &sample);
>   }
> 
>   static void hns3_update_tx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
>   {
>          struct hns3_enet_ring_group *tx_group = &tqp_vector->tx_group;
> @@ -4459,11 +4459,11 @@ static void hns3_update_tx_int_coalesce(struct hns3_enet_tqp_vector *tqp_vector)
>          if (!tx_group->coal.adapt_enable)
>                  return;
> 
>          dim_update_sample(tqp_vector->event_cnt, tx_group->total_packets,
>                            tx_group->total_bytes, &sample);
> -       net_dim(&tx_group->dim, sample);
> +       net_dim(&tx_group->dim, &sample);
>   }
> 
>   static int hns3_nic_common_poll(struct napi_struct *napi, int budget)
>   {
>          struct hns3_nic_priv *priv = netdev_priv(napi->dev);
> diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
> index 8208055d6e7f..5d2d7736fd5f 100644
> --- a/drivers/net/ethernet/intel/ice/ice_txrx.c
> +++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
> @@ -1350,18 +1350,18 @@ static void ice_net_dim(struct ice_q_vector *q_vector)
> 
>          if (ITR_IS_DYNAMIC(tx)) {
>                  struct dim_sample dim_sample;
> 
>                  __ice_update_sample(q_vector, tx, &dim_sample, true);
> -               net_dim(&tx->dim, dim_sample);
> +               net_dim(&tx->dim, &dim_sample);
>          }
> 
>          if (ITR_IS_DYNAMIC(rx)) {
>                  struct dim_sample dim_sample;
> 
>                  __ice_update_sample(q_vector, rx, &dim_sample, false);
> -               net_dim(&rx->dim, dim_sample);
> +               net_dim(&rx->dim, &dim_sample);
>          }
>   }
> 
>   /**
>    * ice_buildreg_itr - build value for writing to the GLINT_DYN_CTL register
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> index d4e6f0e10487..da2a5becf62f 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> @@ -3677,11 +3677,11 @@ static void idpf_net_dim(struct idpf_q_vector *q_vector)
>                  } while (u64_stats_fetch_retry(&txq->stats_sync, start));
>          }
> 
>          idpf_update_dim_sample(q_vector, &dim_sample, &q_vector->tx_dim,
>                                 packets, bytes);
> -       net_dim(&q_vector->tx_dim, dim_sample);
> +       net_dim(&q_vector->tx_dim, &dim_sample);
> 
>   check_rx_itr:
>          if (!IDPF_ITR_IS_DYNAMIC(q_vector->rx_intr_mode))
>                  return;
> 
> @@ -3696,11 +3696,11 @@ static void idpf_net_dim(struct idpf_q_vector *q_vector)
>                  } while (u64_stats_fetch_retry(&rxq->stats_sync, start));
>          }
> 
>          idpf_update_dim_sample(q_vector, &dim_sample, &q_vector->rx_dim,
>                                 packets, bytes);
> -       net_dim(&q_vector->rx_dim, dim_sample);
> +       net_dim(&q_vector->rx_dim, &dim_sample);
>   }
> 
>   /**
>    * idpf_vport_intr_update_itr_ena_irq - Update itr and re-enable MSIX interrupt
>    * @q_vector: q_vector for which itr is being updated and interrupt enabled
> diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
> index 933e18ba2fb2..7aaf32e9aa95 100644
> --- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
> +++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
> @@ -525,11 +525,11 @@ static void otx2_adjust_adaptive_coalese(struct otx2_nic *pfvf, struct otx2_cq_p
> 
>          dim_update_sample(pfvf->napi_events,
>                            rx_frames + tx_frames,
>                            rx_bytes + tx_bytes,
>                            &dim_sample);
> -       net_dim(&cq_poll->dim, dim_sample);
> +       net_dim(&cq_poll->dim, &dim_sample);
>   }
> 
>   int otx2_napi_handler(struct napi_struct *napi, int budget)
>   {
>          struct otx2_cq_queue *rx_cq = NULL;
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index f01ceee5f02d..53485142938c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2225,11 +2225,11 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
> 
>          eth->rx_packets += done;
>          eth->rx_bytes += bytes;
>          dim_update_sample(eth->rx_events, eth->rx_packets, eth->rx_bytes,
>                            &dim_sample);
> -       net_dim(&eth->rx_dim, dim_sample);
> +       net_dim(&eth->rx_dim, &dim_sample);
> 
>          if (xdp_flush)
>                  xdp_do_flush();
> 
>          return done;
> @@ -2375,11 +2375,11 @@ static int mtk_poll_tx(struct mtk_eth *eth, int budget)
>          if (state.txq)
>                  netdev_tx_completed_queue(state.txq, state.done, state.bytes);
> 
>          dim_update_sample(eth->tx_events, eth->tx_packets, eth->tx_bytes,
>                            &dim_sample);
> -       net_dim(&eth->tx_dim, dim_sample);
> +       net_dim(&eth->tx_dim, &dim_sample);
> 
>          if (mtk_queue_stopped(eth) &&
>              (atomic_read(&ring->free_count) > ring->thresh))
>                  mtk_wake_queue(eth);
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
> index 5873fde65c2e..417098f0b2bb 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c
> @@ -53,11 +53,11 @@ static void mlx5e_handle_tx_dim(struct mlx5e_txqsq *sq)
> 
>          if (unlikely(!test_bit(MLX5E_SQ_STATE_DIM, &sq->state)))
>                  return;
> 
>          dim_update_sample(sq->cq.event_ctr, stats->packets, stats->bytes, &dim_sample);
> -       net_dim(sq->dim, dim_sample);
> +       net_dim(sq->dim, &dim_sample);
>   }
> 
>   static void mlx5e_handle_rx_dim(struct mlx5e_rq *rq)
>   {
>          struct mlx5e_rq_stats *stats = rq->stats;
> @@ -65,11 +65,11 @@ static void mlx5e_handle_rx_dim(struct mlx5e_rq *rq)
> 
>          if (unlikely(!test_bit(MLX5E_RQ_STATE_DIM, &rq->state)))
>                  return;
> 
>          dim_update_sample(rq->cq.event_ctr, stats->packets, stats->bytes, &dim_sample);
> -       net_dim(rq->dim, dim_sample);
> +       net_dim(rq->dim, &dim_sample);
>   }
> 
>   void mlx5e_trigger_irq(struct mlx5e_icosq *sq)
>   {
>          struct mlx5_wq_cyc *wq = &sq->wq;
> diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> index d215efc6cad0..f1c6c47564b1 100644
> --- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> +++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> @@ -1177,11 +1177,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
>                          pkts = r_vec->rx_pkts;
>                          bytes = r_vec->rx_bytes;
>                  } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> 
>                  dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> -               net_dim(&r_vec->rx_dim, dim_sample);
> +               net_dim(&r_vec->rx_dim, &dim_sample);
>          }
> 
>          if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
>                  struct dim_sample dim_sample = {};
>                  unsigned int start;
> @@ -1192,11 +1192,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
>                          pkts = r_vec->tx_pkts;
>                          bytes = r_vec->tx_bytes;
>                  } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> 
>                  dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> -               net_dim(&r_vec->tx_dim, dim_sample);
> +               net_dim(&r_vec->tx_dim, &dim_sample);
>          }
> 
>          return pkts_polled;
>   }
> 
> diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> index dae5af7d1845..ebeb6ab4465c 100644
> --- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> +++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> @@ -1287,11 +1287,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
>                          pkts = r_vec->rx_pkts;
>                          bytes = r_vec->rx_bytes;
>                  } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> 
>                  dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> -               net_dim(&r_vec->rx_dim, dim_sample);
> +               net_dim(&r_vec->rx_dim, &dim_sample);
>          }
> 
>          if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
>                  struct dim_sample dim_sample = {};
>                  unsigned int start;
> @@ -1302,11 +1302,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
>                          pkts = r_vec->tx_pkts;
>                          bytes = r_vec->tx_bytes;
>                  } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> 
>                  dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> -               net_dim(&r_vec->tx_dim, dim_sample);
> +               net_dim(&r_vec->tx_dim, &dim_sample);
>          }
> 
>          return pkts_polled;
>   }
> 
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> index 0eeda7e502db..2ac59564ded1 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_txrx.c
> @@ -926,11 +926,11 @@ static void ionic_dim_update(struct ionic_qcq *qcq, int napi_mode)
>          }
> 
>          dim_update_sample(qcq->cq.bound_intr->rearm_count,
>                            pkts, bytes, &dim_sample);
> 
> -       net_dim(&qcq->dim, dim_sample);
> +       net_dim(&qcq->dim, &dim_sample);
>   }
> 
>   int ionic_tx_napi(struct napi_struct *napi, int budget)
>   {
>          struct ionic_qcq *qcq = napi_to_qcq(napi);
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 792e9eadbfc3..869586c17ffd 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2802,11 +2802,11 @@ static void virtnet_rx_dim_update(struct virtnet_info *vi, struct receive_queue
>          dim_update_sample(rq->calls,
>                            u64_stats_read(&rq->stats.packets),
>                            u64_stats_read(&rq->stats.bytes),
>                            &cur_sample);
> 
> -       net_dim(&rq->dim, cur_sample);
> +       net_dim(&rq->dim, &cur_sample);
>          rq->packets_in_napi = 0;
>   }
> 
>   static int virtnet_poll(struct napi_struct *napi, int budget)
>   {
> diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
> index b811446e0fa5..0b60ed16297c 100644
> --- a/drivers/soc/fsl/dpio/dpio-service.c
> +++ b/drivers/soc/fsl/dpio/dpio-service.c
> @@ -889,10 +889,10 @@ void dpaa2_io_update_net_dim(struct dpaa2_io *d, __u64 frames, __u64 bytes)
> 
>          d->bytes += bytes;
>          d->frames += frames;
> 
>          dim_update_sample(d->event_ctr, d->frames, d->bytes, &dim_sample);
> -       net_dim(&d->rx_dim, dim_sample);
> +       net_dim(&d->rx_dim, &dim_sample);
> 
>          spin_unlock(&d->dim_lock);
>   }
>   EXPORT_SYMBOL(dpaa2_io_update_net_dim);
> diff --git a/include/linux/dim.h b/include/linux/dim.h
> index 84579a50ae7f..06543fd40fcc 100644
> --- a/include/linux/dim.h
> +++ b/include/linux/dim.h
> @@ -423,11 +423,11 @@ struct dim_cq_moder net_dim_get_def_tx_moderation(u8 cq_period_mode);
>    *
>    * Called by the consumer.
>    * This is the main logic of the algorithm, where data is processed in order
>    * to decide on next required action.
>    */
> -void net_dim(struct dim *dim, struct dim_sample end_sample);
> +void net_dim(struct dim *dim, const struct dim_sample *end_sample);
> 
>   /* RDMA DIM */
> 
>   /*
>    * RDMA DIM profile:
> diff --git a/lib/dim/net_dim.c b/lib/dim/net_dim.c
> index d7e7028e9b19..d6aa09a979b3 100644
> --- a/lib/dim/net_dim.c
> +++ b/lib/dim/net_dim.c
> @@ -345,33 +345,33 @@ static bool net_dim_decision(struct dim_stats *curr_stats, struct dim *dim)
>                  dim->prev_stats = *curr_stats;
> 
>          return dim->profile_ix != prev_ix;
>   }
> 
> -void net_dim(struct dim *dim, struct dim_sample end_sample)
> +void net_dim(struct dim *dim, const struct dim_sample *end_sample)
>   {
>          struct dim_stats curr_stats;
>          u16 nevents;
> 
>          switch (dim->state) {
>          case DIM_MEASURE_IN_PROGRESS:
>                  nevents = BIT_GAP(BITS_PER_TYPE(u16),
> -                                 end_sample.event_ctr,
> +                                 end_sample->event_ctr,
>                                    dim->start_sample.event_ctr);
>                  if (nevents < DIM_NEVENTS)
>                          break;
> -               if (!dim_calc_stats(&dim->start_sample, &end_sample, &curr_stats))
> +               if (!dim_calc_stats(&dim->start_sample, end_sample, &curr_stats))
>                          break;
>                  if (net_dim_decision(&curr_stats, dim)) {
>                          dim->state = DIM_APPLY_NEW_PROFILE;
>                          schedule_work(&dim->work);
>                          break;
>                  }
>                  fallthrough;
>          case DIM_START_MEASURE:
> -               dim_update_sample(end_sample.event_ctr, end_sample.pkt_ctr,
> -                                 end_sample.byte_ctr, &dim->start_sample);
> +               dim_update_sample(end_sample->event_ctr, end_sample->pkt_ctr,
> +                                 end_sample->byte_ctr, &dim->start_sample);
>                  dim->state = DIM_MEASURE_IN_PROGRESS;
>                  break;
>          case DIM_APPLY_NEW_PROFILE:
>                  break;
>          }
> --
> 2.45.2
> 

