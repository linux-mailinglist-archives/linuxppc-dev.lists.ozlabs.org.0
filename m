Return-Path: <linuxppc-dev+bounces-12659-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0010BB7911
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 18:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdZ65049gz3d8t;
	Sat,  4 Oct 2025 02:35:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759509340;
	cv=pass; b=LlXXTSgwIXPSLF0647QZjG1RCrVc/PpkNFobOD0nLS2I3f2OINH5srOwUzJWnCRbnfDQ8po4S4WpWepi84KEzkAuquZHdrjBJCULdpPwBE+zbG87ic4ArYSDXQc6ZCwzr0zdBb4FDaFoCYv27sos8YfjOgBFL/ghaMzBaA5F4mZ//AM93tSg0Ms94JBYJfBq2dVEbf67NaUUD+0bdQhRgx+Tt8J6j00qOprZPzpxkjXKx/qT/URdLu5ZsrLfBkXdIn+pHbD8CSI9wShKUcGjpjUO8Cypr7hiDjzR7z0xuLAedL/t/bNEL6voyJfR8rRjRXPDAUyHe95vieAvCFU3kg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759509340; c=relaxed/relaxed;
	bh=D5WNBozzU3ocTIOjymr3/7NM59JREOHeSWgMrLaWOBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ejfc8GTdOhgy/H08W2b4LYK4bVZZGtPJsiPzt2fy+r3/+F8zXLnXMet+k8SnlaWR+lHW/UGuBrLJZy9SnjoRCBCP2p0bDOio1F90WXX4JeH0+rIxBihKrZIiSXCVqnVvFI0y81LnkKfZ1+dGkyZw0oDnlJuMQ4ObGOH75ho/3DzT96oXcK0dChvDWnYRr0DYusdd8lAl66rLpFmxjKT1y0aTlKCaXq50rib8fiTuE8lUk+ACYC5c0WuhLmiJ3lNNJKkvFTYPuVpKudZYJonDT8TojckmPqWMn4LCtCEg6Qcagd71uwq90Z7P8IYR81SsO2BtculDIuS6cE9daWc+Bw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZQCtV1re; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZQCtV1re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170100009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdZ640RwJz3d40
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 02:35:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5TgKN1BAVreZY1YvW99Q8gujaAOvIgtprZM7RAubxWICUBRuM9aAc4W2ksNfuWMX1ucDBNTCZph6wlBEQJaS1opseE5ky8np++cVqV1zLXA2kIxUiaB+6u2CgrpZKX3JTGp///NMljHZLWDkG9wjB0KSk5KOJq0jOXmIqvQWnP22qo0wYu/DNAPezXDByAw43yHna6pfb2MfhvtbppKtnQtVk4ewN8KZBjA4EXc2u2btjK5KthrwsrWyhC+eyykuZ8Efi2qyaNMQzct4CT4xHq8KT09itaw76XyfIwo1KCCHdtGq49BcKLidnHutmjxmg7iPiMi9YR84N5VCdfRiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5WNBozzU3ocTIOjymr3/7NM59JREOHeSWgMrLaWOBs=;
 b=ju6i3aMRAfNM/gzs3lxnpISLhRfT+tPsCciMUEr9dMru3gFLIsrf1kbeH8Cgs/PyE9ZZ/vqMVsxeYNqsaZt7KGpk3+DbZL6/8EjGybTfYb/Onux0FR/KgvFqVB3W4I1YzoiuSNrIlQDMSkN0I2ab0jCJiXX5paUGbJ6BZbHFnSDnbBeUNLDD0rNS4eWJvDIFp4Xdm8rp/LR3tZxhxw/UEYTd/6Wqni9YWUbzfYfnD4W7T+mICJLFBJuUYcF/3qbuhjgddjHAqwlzrSrVZYBJ0OBIZBQxwF0IMUWc/tFkAwKkrmW51CGbLdZ4epZDtPQNQtFI9jVekA3rWhnxuNc21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5WNBozzU3ocTIOjymr3/7NM59JREOHeSWgMrLaWOBs=;
 b=ZQCtV1resScx1gP+zfFuGAe0ArWregRy77vLlwuNbZX87D+aR+0A562LhnPB/ckEnLFg1jUTgthSYFprIzx5KSoZ7MQecevMsVo7tNdznmmA4ykPvG+0UiMOr0Ag9tbkHfOCMU8kH+xgoXiASmgLg51YjGRgpvEYUjinJ0hz/rWTnk/MjVzIHrSj4Tch/Xae1fGNlWpsNDlE5ypg87FVyPY5XdYpJ/etaWi4rNqDi7V7pWB6CPiiGW4G32t4BT5+ezlMul6cFKDc7Mt6t1t12HxMwwC53hyCwZBT9oa8JxjJ7PM+5GewsjyGlZJFEEPUOEBDiYrTh6D8cSibGlKcyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 16:35:07 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:35:07 +0000
Date: Fri, 3 Oct 2025 13:35:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
Message-ID: <20251003163505.GI3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BLAPR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:208:32a::9) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH7PR12MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 69592d88-e8e1-44e9-29b0-08de029acfde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lEM3/Bl8Zdm3WwAN/X5ZTFXsu9VEbQLls19Uix/0QdxkKu8gAQqwX/Wl1F05?=
 =?us-ascii?Q?2OEjpN7xKXrq9ei4tguXWHVxCylRjkLfZMqi9xpB/2kTpagZz4MHim53P4Pw?=
 =?us-ascii?Q?76oG4iZY6IFT8RjcSjYb4dF1E4nx86oYZhLh7M3toUjc0KlWn9zYrQeJBHkH?=
 =?us-ascii?Q?KASdTcttkyj/IvQjoNnbXlqiuoCONv90QYYzCmzAkqobtSPKEIo2CHCY+xnE?=
 =?us-ascii?Q?E7cLcKW8CTHurG4wzQfxnSmo5VxZLcOL+dswN2YOQMHWda7uV5Fty52hEWtI?=
 =?us-ascii?Q?Sj8dsbAxPotz5sGoDx8sc+I44j7ndj/cyYO/4fgGIbHqyJAF1/1Gl3aizAZO?=
 =?us-ascii?Q?kHNRZfEqX7kfvF7k6T4te7U44JC5soEVkDxUSCTYDpYp+Y8+SFJIbrV0TR5o?=
 =?us-ascii?Q?J0RXTIlKTI1w9i5TURvNeYMhfCUE6aCICGVux9ocKOis2JR2PeTjpqoJbm5E?=
 =?us-ascii?Q?kRu6iIOOfkjlcofPrLbKWQAzZhSw56dEbv27AgSY8UxDIdsWUg7ZJWe3YwCE?=
 =?us-ascii?Q?yWmuiUUgWKyL+8byEaGAEtbihJIYIc//UOmxCeGFi/eZ3BGfur5j26LLLgAo?=
 =?us-ascii?Q?29E/qXsW8NCZULE0G6yw4JUXzaC+s9ewunhuDKld//ZH2a2Q3BtTl69KlKaN?=
 =?us-ascii?Q?CPQ0wBQObUuraGlg/S9ijF+l3COurwDioiOn7Gi/5BT0oA8Bdr0Ry2hnHjk7?=
 =?us-ascii?Q?ujImqLS03e0P0RV4xnerMEhukWvJx1i1XyH8SlXRQD7H4NR/qPMWOpP8KUAl?=
 =?us-ascii?Q?V37Eaxv0/SO+hHZgIoZtIwl0HHiPSFgr9eIOWDNwmUcxrerT/OGvo2oWWstg?=
 =?us-ascii?Q?F7t1XS0NpJje2CCk8J0f9pRWM3sX4BoHL5hKIBuVgqsBEAI4IGS0KQfDmK0g?=
 =?us-ascii?Q?nLQJqJKkPdsLUaxZhG3Hw43HDD5o9NqIV4u+oH2Zt1IjHtwfDEt5aRANc6uQ?=
 =?us-ascii?Q?7szkzqDkAOiBQL3Y0N5Q9vnukWcrQ3TDGZb6aZ5IbPJqdxCy0O/IgZ8Z3ACl?=
 =?us-ascii?Q?p9sOWKB23Pp5cuiRQlWMY4ooxVUBr65D8/3Kwj3TcHuDuGH2uXgvTAZ7VSLx?=
 =?us-ascii?Q?JV9TOPWr1Yxh4xw9b/hR5Tcaj/l4dA5RlUj8PqPNvPsjEuMMkNrjXwlhHIFr?=
 =?us-ascii?Q?JLuplV8Z1RVNRMI5xPGq8HNBbkjXxUyarAbUFcn+cTvyikdTTEJmE6xcRp8n?=
 =?us-ascii?Q?eb7CpNI+8dar7In+hnSlHNKqYi7ofoH7zyM2ptwAK4w2JEMIFnlYZYcbT/jX?=
 =?us-ascii?Q?fXDpcvgqP9qSZGI+AsU4qL+XNDJLmVc26cIcwbX8jyQR7gk5dLYDOBaPWW5i?=
 =?us-ascii?Q?H3AKZ9phCWos6bMYNITjfMjkCUAZATW/IFWS2WXaWmzNHHt6FCjE5HsJJYXy?=
 =?us-ascii?Q?V2kDII5PtmNk49TMHSRAFwUCPLHpRDemHjZQlS/02z0VYZh/yVAfkTKT+1bJ?=
 =?us-ascii?Q?YN4Id9fbcpCYHhF/Ka2GcDPza2of9h8e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7pqlS6ypLKXfmqVS6SG7rDCaH6Ahg5LBMLnIjNI3u0xg6rQRCCVLoT/596VF?=
 =?us-ascii?Q?WyGpzmltz/nEJtAlk6zeOsFbTshewY9AdcaMWQmYBkEtJeXLCTaYECC6rLRf?=
 =?us-ascii?Q?OWcA/eQzjagzZX6n42vKHf8VM0gIDPwjygP/DFsE2PZ9Ja0+jJxyMeSnml6N?=
 =?us-ascii?Q?xvbkhJhJ9UYkFJN/71JR0mzYV/ueyeoyrwitMJfz3b/2J1qEZW9mjw9Pfq+W?=
 =?us-ascii?Q?HsWRpuMMV4PLeWO6A/NywWp1wWbxBinos+lfQMzFuenT9YJrVT/usOaJ6CH/?=
 =?us-ascii?Q?4Apbn+h7PYz7RATEXC8nvZvPNEB4zhQX/cor8Px++f0v36ONErWiZTwN65pP?=
 =?us-ascii?Q?II4Jz4RDM4WYzRC/rTvKKEml9ckeo8fP26hwg8Jxnh94nQ2uomHZkXi2AuRN?=
 =?us-ascii?Q?qiRevpCuP9tlBwvB8N2Ev4JgB4VTT3ArobyEuqL6sVHrhJkaulhc55nzd4pL?=
 =?us-ascii?Q?5VP6kVIItXbMUU8lNbgA7nCEvOaTHZl5aQP1LtkqOWCcmIPCCOgNeLv6Ss+k?=
 =?us-ascii?Q?jPq97rzeqK7Ngd48+Ui5DwEwVzagdFubtlwo3ZNuw0BD9AOSGLX+ZAorwnud?=
 =?us-ascii?Q?Gwyi6l2FwXH3tjpPdltPrHlr46fQM5buBVi8cLZ4g0LbT2L1FFI64YVhagEz?=
 =?us-ascii?Q?0xWMNmGnaPdGsJlRWkXPu2dC/2qZV3EiSqCOV4Vw6rTP8PexAJiUeG93d266?=
 =?us-ascii?Q?CaHtvyfLsl8VhteqTsPoORkmULuCAGyhF6qMO5wN4XGNNIPJYPSftH7ixwaS?=
 =?us-ascii?Q?qKWZzkuKp2Bf98zQvBf1DobTtXOJWWinlemeT3hwyuCANNATqPULIRbvZYLF?=
 =?us-ascii?Q?SjOSK4Esn1tt54CCLEBbQ3QRfziuycMq3fSv5lmX51yGs7dj9j58NOl0nvyo?=
 =?us-ascii?Q?Z2THdLiwbq3opRA7sZ5RWbv9oULtr9W5nqij9vxF4798FW/fP3Ec3LVluzY4?=
 =?us-ascii?Q?sVnkOhyMzPdtJXU+W8v0Sn4xL9I3s7mUyXwAds144nKGsZ/jJvS2xBpwIyux?=
 =?us-ascii?Q?6878wh6lLcqWmi+M75HiPl9nSvWVGb8AhMcoOa0PldpM8NtM87AiWpnaBiLj?=
 =?us-ascii?Q?LZ8lRfkCGSTx2hEwjQ3N7nTCPOWq/DPLcKDdbjwcnLGGZfhY/eT7nJZO2DSP?=
 =?us-ascii?Q?2D67jnNFutdk2q7D5NG9DmbjLNFNXktMNPtsIgL7Mje9CnM+WfwhlavWOKi6?=
 =?us-ascii?Q?AYwj5oOcWsKAMaTZOGWxfDs22aqyvLgjuQkgQd8B1ohXvHOVOLVopqj+HdCB?=
 =?us-ascii?Q?uNlZhG3b4pF7ENOTFedaJL6aimpoY65PJTYBGU2mJYIsDy0E5rgFVwegXUwC?=
 =?us-ascii?Q?d9xsho2zjFRxjWsvN5JAtsIfUkpa6nYAxPN5QhgZHi8QUI9qjNjz0p2TgNom?=
 =?us-ascii?Q?tCHmNeEqiNct47uvYe8xVrFrB7BXVKSCSo+U6l4k0SPk1SbRWY7QHMWCX1cG?=
 =?us-ascii?Q?ezY8qnRwsJrV26Qvfn/G9zFbueZdvMBcB3qisZ8AA/oM2hJ/mn7sN8L4bedE?=
 =?us-ascii?Q?hVBCbYl7qA0aE24qOpL0v7+bDa9oJ0Llvbz3ClGTK+C0l9OoqLHxBFOKhaSo?=
 =?us-ascii?Q?8h5c35Wjpp9l1H6AG9A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69592d88-e8e1-44e9-29b0-08de029acfde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:35:07.5220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUk3yiYxe2wzX8M6d/cK+lnAb7OePBsnefu2DU0fb4dEBxdFGaG3b6BO93Gv0cQD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6717
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:24PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Adapt PowerPC DMA to use physical addresses in order to prepare code
> to removal .map_page and .unmap_page.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/powerpc/include/asm/iommu.h         |  8 +++---
>  arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
>  arch/powerpc/kernel/iommu.c              | 14 +++++-----
>  arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
>  arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
>  arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
>  6 files changed, 60 insertions(+), 53 deletions(-)

I think this is good enough for PPC anything more looks quite hard

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

