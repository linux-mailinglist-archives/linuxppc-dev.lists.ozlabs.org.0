Return-Path: <linuxppc-dev+bounces-12665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2CBB919E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 04 Oct 2025 22:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cfGfN63pvz2yMh;
	Sun,  5 Oct 2025 07:02:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759608156;
	cv=pass; b=N/axPxcXcTH63gSmi4NY+eFd97u9lgHcNvgrsR65nNBU7q/YuKTcKvNp7BgH5Uii1Oo0rcwAmcMU/WdAyf06+pvhimX3PRhOS3OSGYDJq66L1Yq7xkFIJCb7cnduAyVEJEJKJPlv1619WKzXT57AkMVQuu+qMlQRShXKtWtjLhLNC+NA1aUuIW+eb55lEmVVG9MyMfCOYBE+1EH6z/oclONyJvipP8BgcE/8Pd9m4LWJonby/0bxq2Lm8ihKSl0s8fQEyWaSUQOzvYXEMpd6zK1kE3hQhFzE7P4/GnL1K5PU/c80UKTszxvUXBz3rrpCHuGfnnW/zEy43rdd7N3mCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759608156; c=relaxed/relaxed;
	bh=4ggoiRJiz2Tz/RE7CqNPZ9LXqpWAZN17aMszM2aHEb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lx5pZrcg1u0qMIIkhVTmGN4+CxlZfcMoJIcnUQQdqJfvxYpSMPCQzAR+8ZhqXs4NBkJJdmvXm5FpcX9Ej8K8V/rkpXew7S0lvQq04bGwpoYHnRJraMYySxlVK+nLeYKv/MjcaIGymM2grnPMR/ZGLUPhuyWha5Gpp0R6NPBQoNaatcHpodkN0CAJgpeAiwUaiE7ga19zLECT3ldyjTPyFnTAPehd9ps82ysQmZNhQsmyNl3MUwKiLp14U6MtQL7/bgGaxnfHbqw7ecubrelA8CMiD6W7jLmlAvWoAidVMnvy9qgAKuQcW6CvTh9YnxaIa7YYONLYnYctp2KjOq9dzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DTJUp8zC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DTJUp8zC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cfGfM3chZz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Oct 2025 07:02:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhyKacLjUMDthF3K2Mi/orOdbBLNqjB7CKeHsCsMDIvTu/PZnfNPEOGWzpwb8enzuV5YPVS5JGFEYjMn5/NXyjJtEMVyDoIU5LC0dbk7E25qiSFpe7xHlclMVHo2DFAdh+7W/l5v/SrrwtCCFNLoI+KBv3NT5ZmWrO8aE+j9/Wdw/qhERMN2QceSgCIuv9O78wyvoXKsngSTTHODGD6Vtexzpdi3DaUODw2oh2bHtXIRtYKx98BhV7IDttLOm2uqeFFF3RNM/0x6Vrir7PTHiPy8ERGwtRqr48pG/XylqaRCzPM38VMs5EYbVbUHs/lU7aYcGenrfDm7WzeZeBM/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ggoiRJiz2Tz/RE7CqNPZ9LXqpWAZN17aMszM2aHEb4=;
 b=MYVqB6xnUEl1ZpJbUO5LQX1ibif6TJEpOtxd536WJY2mn6+6tXJ9Wu7V8pxEXO+4GTDE5h/zbrGmyNpfgga6oBUEQHwllO+/0DN7Vjup/gTyvghv1cm8obDn0LiVL0bCzQ2n44xjx2vQOtP2fbCZyAX7+A2cyT7/kaaVZhNgkRK/AOtVqbDlvMT7Ah5uV9MvG61RFpSjlkgevHT4FI+yxrQML2CSJod+1rjI611QMq2MZMD5Qq0qx1rqaKmLANbpnyKsOiPWQmNnbPUFobM13IHYADGfGmLdt7yC/vdebP0nwK7TDT5aOSXOk2Lzp7h4ikOplFkqdADe62yfF7F1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ggoiRJiz2Tz/RE7CqNPZ9LXqpWAZN17aMszM2aHEb4=;
 b=DTJUp8zCi4kNEi0XzYC7PTJ67pqYffvYJyOE7e/GlAwlRERNWV4zBctem7JYDq0OcSGzA48GU0oKKYBW6luTq41Yub08qbnqvh/kC4BKTXbnw94iQKYbDbFqo0kwuCkKKoeuZgwjrzRQ6qU3ApPlJM8HhOVVGDrwlON0rNZNeo8+aKRGmg3xwsGrsGQeGbk3gOEJTHzjPoVkcfQvg6KKkT/OJ5GfbD4lLH1Oy0zwgHekzLBjLH2sEyprc+7ahV6Lzfbt19LOB8o8dWZ0LUaSt6SAn24UzNHW9b/h08ON7/Ggas+8kcZbjz30i8C48iBnWm9eara5sWOKsWdMO5gINw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sat, 4 Oct
 2025 20:02:06 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Sat, 4 Oct 2025
 20:02:06 +0000
Date: Sat, 4 Oct 2025 17:02:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <20251004200204.GK3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
 <20251003163505.GI3360665@nvidia.com>
 <909c5ab3-b3d3-4b5b-bc64-8b30c220ac92@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <909c5ab3-b3d3-4b5b-bc64-8b30c220ac92@csgroup.eu>
X-ClientProxiedBy: BN9PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:408:fb::19) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ff58a9-652b-4bc7-f3fc-08de0380e4b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG5HdVlQalBObFJFMmlOV2cxbVZlVk5SNHFEWWp2QUlEQ3pUZUxzbmQvMXZ6?=
 =?utf-8?B?bVNnT2JuZkYwYnlVbERQMkxTSEMxVDdvb3pmVFdvbG1VN0ExWUp4cmFyVXBx?=
 =?utf-8?B?SjczL3VIUEREcXd2aHZPVGlDUVA5OHh2SlBNRkF5d2JPRXU3WVBPYkJ1WklF?=
 =?utf-8?B?Wm8rWTJSRzMrODZpck1qR3l3QjB2dVE1U3JTelFoa3kzd3ErZDcrZmNsWGFu?=
 =?utf-8?B?cmVzWTFZTVhMbjlHMFZCL0Z6WDNUU1dWdUhIa2FZRDA2KzdDZE1sZDIwZStr?=
 =?utf-8?B?dkozZ1Y4L0drWkp0T1Z2cTJ3eWFhenkvNjFIV0lGYmRCVVZwbjhzcUxycnFt?=
 =?utf-8?B?L0VNZDFVMlB1QmVVRWNNd2gxRk9wbkxUbytHUkpoQmZUVzIvbm5iczdsTEo3?=
 =?utf-8?B?SUtVc05IS3U0QVNkT3JYNnc4blFQR3Fyb3FWdHVSUmJrYWZQVEdXbUdsc3NJ?=
 =?utf-8?B?eWltMU8vRS9ncGtzNGdpM3k2VzJZZnptYXVFTENUSm44bStaSWg0OWZMVHlW?=
 =?utf-8?B?dDY0V3BJSUl0VjJOUHZrc013QlRpZlBJUGhhbzNIM3ZwOVNEaytHT1F1YnNG?=
 =?utf-8?B?OEUyN2lUbXRWbUU2WlBDQ2RMS1VieG9tNDFFNGM5QU9ld3lINXEwd2xwVEM3?=
 =?utf-8?B?TjdXRXRuYXQ1NnJYVWN5dFBUYkg2ZFlPUVIvM3RrYmFSS0RHallweW5ibjFY?=
 =?utf-8?B?QUNFQXVJakgvd3NIbFpJV3ZseEt1RmtyN29GZC83anhEVXdrL3A2M2ZWRXBp?=
 =?utf-8?B?ZWQzdUtzWHJZK0J4cHdGUitpWXNVVGd0ejNQeDRPSXNlOGN4aFR3S0VVSi9i?=
 =?utf-8?B?SFV4clY1eDBtU0o4Znc2cXk1Si9qNHpsRzhPRXE1akpPNUU3K1dqb0NiNWtY?=
 =?utf-8?B?SzVMekdYZEZYWEFXUzhtSHM0dDFMeUZjRlVLdzQzS0hLM0tJeWtjeUc3Y2ti?=
 =?utf-8?B?VjEzNTFtNEZSZU1zK2VkY01EUmVnam9wTnhYd3hvZ1BwTGN2MVhFcndBTi92?=
 =?utf-8?B?NWE5dzRMRUJMTHI4MkJ4MzFJcFBCM2NDWWo5bWg4NHJPQ2pja3ZvcFgyWG9s?=
 =?utf-8?B?UWFkcDVrd3JFMEZIL2NLM0tkeUZJT281RGNzRW5zVG9sbjZWRUNLUHcwY1g0?=
 =?utf-8?B?bC9IRmovNHpqcnBJUllHTnlOcHFSaFU3aDEraStWeEZuaDc5TjBQZVZlQXFY?=
 =?utf-8?B?SDlJdXFrK2ZURkQ5RFl1SXZpS2dKamVrazVGN00wc20yTno2SUFTTDJGT3ll?=
 =?utf-8?B?bERacnNKb1pxZGhDcXAzek1BY2lqQkoxWFRzY09HV1RFVnFCRENKVGkzQ0hx?=
 =?utf-8?B?dTN0ai9Xcmd3djFRVmptQ0NCTjJJUU9CSWJZUDJtaTJWNlkvdU5LNXcyd3VT?=
 =?utf-8?B?RWkvVGQxbWh1UUJTd0RwcWd5dFNENU9sSis4LzlhcXo0Vk1jS1RhU3kyWkVN?=
 =?utf-8?B?dUtkU2NKbzB4cktJWWlRc2lKTlhKbk9XZHZjd2tTczZVWWhPa25SN0VNT0Ux?=
 =?utf-8?B?RHlTYTF6ckhreUFOT2FiUGEzR2x3OGdDa2RlYWM1QVl3d0JtQmhQMERRaUJq?=
 =?utf-8?B?NndyYzJscXl0ZDBCYjZUTWhKWEtPUUFHSERKNTlkbGtKaWoybFlablg2OG04?=
 =?utf-8?B?WUhaRFEvb0tQWHpwK1hod043RWs2TlcwcEgwaVl2dGo3MzBYbzF6V2lmTkFM?=
 =?utf-8?B?WjUrN3V3M1d0QjRNUkJiay94OXNCWTdheEZ6dHpnaUg5bThCb1g0eHhGb1dN?=
 =?utf-8?B?bjFaSW4yb0UwQ1RhZFMxblFxVVMyQlQ3WFBkNmUvdE01K25JQnlQN1ZmeE9p?=
 =?utf-8?B?VnpwRVJJTml1RFlNZHY5TnptRHRDVWFOZDB5NlJuT1pqQzhOT3VuekRZVFRn?=
 =?utf-8?B?ODF6dFVXNzdhTkVyZGQzN1d6OFdMbHhUMkJrTlVrYnhyam9QYjJ0d1Bhdy9z?=
 =?utf-8?Q?axQ4JuA5qDTmgdw215ssRBzg/EhPp5Yx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNtT3d1M3ZHa0JOK0VHYUY4ZGlYMDA5TFRxclZsQUozMGQxdmtGMk54L3Fk?=
 =?utf-8?B?RUZPTE1ZTDlKSjJrUG1kTUs5eTlXREZuNGFTd1k3V1FVTVAvM1BXdmR6Y0Q5?=
 =?utf-8?B?eWxLMVZtNVpWTUpDUC9oMk13YTN6bjhqOTFWV0JuWmNkU0V4MU9pdHYwZy9W?=
 =?utf-8?B?SDRTWUZZQ1RJUUY2aXJaZmxNS1dOTnJ3VTcxaWFZNWNkaVc2bUZROTM2NjRk?=
 =?utf-8?B?MDFITmJUWDE2MEhCL2lQRmkveUg5N3l6Y2x3MmNEd013cklBZ0Q4VzZvTDVm?=
 =?utf-8?B?U3dYMUorMFlMc21HYmxROVVHRk5UY2lac2lWWWM0ejN5R1Q1VHZjZWNnNGt6?=
 =?utf-8?B?YUVuR2NVWlBPM0pTZzQxN09SUGx3TEx0aEFHSjJndXRHRlBXTk1za3d4VlNZ?=
 =?utf-8?B?SENxOXlsR0lnd2Z3UnY0NXFmVGlPMVE0ekZoS1Z3MTJiNkNUNmUzWkpHSkxT?=
 =?utf-8?B?MTV0K3NoRnVhdytJK3hkRGRNZzRyd3RnNTJwejdWb3BwVDdwdGZiZ0htbm9F?=
 =?utf-8?B?TTUvanNYMDBtSGRST0JoZktvdG55VHFTZnJZaTQ2VkJTbkh3RUg5U0IyNzRI?=
 =?utf-8?B?TTIrVFdrMytkS0E2amcyRGdvcUhtTEc2NWlDMldoRzZjbTVvL1lQRjQvc2xK?=
 =?utf-8?B?cE5TNXlmbnY5VFJRRm8vYXZNY1E0U3VMTUdyaXZKNk9NWkxBQ1IwdWp4K1o0?=
 =?utf-8?B?UlArZ2Q2VCtkQ3RYVU82c1dERDAvMWhyZmY0MnpFVVRhcnpHTEFGRWVsN3NU?=
 =?utf-8?B?WHVnZEpjU3RVV0ZacHpoL25NLzMxbVgxUGV5R3h5T1BTWE0zRGdDclE4MWp0?=
 =?utf-8?B?a0lhWkNFb0FzbDNjVmNMRmhKZXpYdXp5eGRXRFQwcWFmZlYrTW1YbEY5TGJT?=
 =?utf-8?B?U0ExcDFEVERzZXdpdVVUVXRob1ZNTTF5aTFYU01rdXZZL0txMU9nVHVDSGtY?=
 =?utf-8?B?dkVOcjI1dXFEVzRVRkJ3SXgySVlUbVVRaWowQkNIdHNTRnpWbHJIZGpOYzlw?=
 =?utf-8?B?c1l3U1AxalNtNnVkSjVtRUhCZW83M0M4enl3VUw2TnZBWHMvdTRCQmZpYlAr?=
 =?utf-8?B?YW9seTVLazNKQm9HUCs0UGM3L3RVTlExTVpmWVMvUnVpdHJqcGFVdGxXR2lL?=
 =?utf-8?B?THY2SUJZekg3QUVwdDZZZzBaOXRtZUJoZTJXeFVFY2xsWE96UnZMU3ZkMndl?=
 =?utf-8?B?dERVUlRhMThMbTI5VE1iOHJVbktrODRaRkFkRFB2Z2N0dXdsdmVSKzJZeldF?=
 =?utf-8?B?TVhZbTBwZWYwa2FscW1XVGJicHJWL2krZStxdENYTzllMHdKVjdRcE9OV0Zz?=
 =?utf-8?B?bG8wNUhQOXZ4VDFoSllMaU4vV09icHZTN2kzN0Q5TlpxckJSdWlGUVhydXJH?=
 =?utf-8?B?MGMwWVJMNUtETFE5SkRQWG9NaVA3aGhuc0hqeGRoZmlLc1Mra2N5SEdrL0pO?=
 =?utf-8?B?YTh4ZG1HK01aYU5zaVZqREpoRlBqWnYycXYrQXp0SmtWbkZOTEtIakpnRkZZ?=
 =?utf-8?B?QW1WcGRCOFVIcktNTndBN2QwWWk4UC9ERDZQd1ZlTk5xMzVMZElyOEVvb3NF?=
 =?utf-8?B?SFNyZ0IyOWMxQkM5V25iVGs4YktXVnhCTU1SWlZGWksrdDlNSVdaSS92MGVW?=
 =?utf-8?B?RVN1Q2VpekhwR1l1WE5Wa0FxZGdjZzRlZUFSVlF5YTFDSEFZR3pmdUtabnIx?=
 =?utf-8?B?MlVFRkltSDBPTnIxNzU1Sm1YMG5qRHAzRERXTnJVV0xCaW43M2lDUStlMWhh?=
 =?utf-8?B?NjRKZlJ2REszaVVuK2lrSUh3Nkc1emlwdHdHNzBDa3ZzSHRDNFNPbE1tbWRx?=
 =?utf-8?B?Y2xVWlFncTFOWVNwNlNZeGw0SEdyNjhXUFVTMVlEa2xVM3lNaXd3cC84cmxp?=
 =?utf-8?B?SFJmcUQzS3d4Y2pvMWVjdEljcVJ1L1NWZ2pJR0IrZUJ0SlVGUmkwUmRlMVhl?=
 =?utf-8?B?MW8waHd6eDhpd3RkSnBNUmYyN1d2MmJBN1ErNmk0L2JOajZqeXZMRGdvcWgy?=
 =?utf-8?B?NTlpZ0Y2N0lHS0syOHc1SGdhOFVPeUlhL1BxUVJqSS9kUGpIWDVZSDlKNzVz?=
 =?utf-8?B?eklIUWw4ZmUxREJtNHMxa25QT2RQdG5INlFrL0lxUk1JbTI2VGtUNkwydzR2?=
 =?utf-8?Q?/aic=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ff58a9-652b-4bc7-f3fc-08de0380e4b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 20:02:06.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4DvlEEQGlFkItrYRHh+eDfG5D1shdY/8IeIWNMDV7kkRWGSL+gF2kjnPJ6DwELC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Oct 04, 2025 at 08:19:40AM +0200, Christophe Leroy wrote:
> 
> 
> Le 03/10/2025 à 18:35, Jason Gunthorpe a écrit :
> > On Sun, Sep 28, 2025 at 06:02:24PM +0300, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Adapt PowerPC DMA to use physical addresses in order to prepare code
> > > to removal .map_page and .unmap_page.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >   arch/powerpc/include/asm/iommu.h         |  8 +++---
> > >   arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
> > >   arch/powerpc/kernel/iommu.c              | 14 +++++-----
> > >   arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
> > >   arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
> > >   arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
> > >   6 files changed, 60 insertions(+), 53 deletions(-)
> > 
> > I think this is good enough for PPC anything more looks quite hard
> 
> Can you tell what you have in mind ? What more would be interesting to do
> but looks hard ? Maybe it can be a follow-up change ?

The phys_addr_t should be pushed down through the ops function pointer
and only the implementations that need the vaddr should call
virt_to_phys()

Ie try to avoid doing phys -> virt -> phys as it is not efficient.

Jason

