Return-Path: <linuxppc-dev+bounces-12655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3ABB74EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 17:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdXMY6P1Mz3dBr;
	Sat,  4 Oct 2025 01:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759504633;
	cv=pass; b=YWp00cfVaSmEcOYpCt7P9O8OGil/I2BvwZNf7R3akU9+mFG4ujcd7/x4O1XFGG7yWG50sQ2rgD8VqOBkrZb06G7DlyYmZRKuUeroRVNQyCJoOdMORpmWByZOQQd5PgtX4CbIW+gOwphnZ/yoo+PtMIn0B5L9rr3Yc7hy9yRFnkecv7JrqMtcXmboFKJHlEPyAjQ+s7JQ/OS9LhI4axexCPAgbi0Wivwd2cYhSA+Qw7e32EjjGCY3tB6sAxs6zL3CUOKbuPtN7n4QUw4ra4qN2iW+ZcM+licpEOXrSV3/kwNXBN1wRJwuSztBZ9I/Ok0COYgdu+IxOnsR0PF3eE6aHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759504633; c=relaxed/relaxed;
	bh=GDJxKoxhLV4aah00yEHkNFBw3RhiY0+y3Zm+8MVNi4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E6LayCkZaVKYQtoW2UUssdkgdVUQIxz7bjO/iBKZIyRpsnT8X/VRyIk+sdOmKKsmCUXKykqX8CmvU6VgXlHS2yLyWIcHCqoEr809UZURSAQ1Q5a7fLmjLe8TL/6TrfNQKGuXSJU8EjqE68TF+SzOavzwafWZNPRCjEIxh0UbZb5jjgEgubmMoGSoNbXLkc882QnhTOPgZLj6n4uwrr1vEK2aYz9GvwnhAFXiJgD/CcmMIVQwfGE5XlKc1ehEf/Lv9aqJr0N4yVY4nkAQp87JCTyDjDuyg1JB2ZTP1hjJRV660V5Ieo01ZM95ZPK/HvyWlWcNURJjBASEz+e8IdeEhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RbWR6xe0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RbWR6xe0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdXMY0xj5z3dBY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 01:17:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8yceTHtKyP1dFcSHKuk6VCSadJpOr3klqw9vXCdd6WvzPy6/znRvFH3bpHJMOtB8y6D1iEVO+cA/BWY/Svt1eREtvUAORIrVVxEYqxp+DEnQ3gCZWo3NMhQggFdxKwuJ97Z/SfK80B/cQOJU/Z/E+IccXw/b9E9pDFBCyUL0XrTyzeFnjHmfEwNviS3I1vcePIbkC6ZK7sWg/GwYCgFzZTgel4RHnX991mnOO6sX3HjhADt7A8jll4eXLFCvbuOoADzXsG/jF4YpWUxvFhxxBxwjEHoebALBUdPpHplllMjvbZm8Y2RU7hXWw5eAylfJNSeuq9ccsosPpxhv8pdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDJxKoxhLV4aah00yEHkNFBw3RhiY0+y3Zm+8MVNi4M=;
 b=nHKS16Ym6U8yZs+EogJpIJDWEzAViJ8oDw3EuNYUruJfJ+C0UjY4vToQEYOKqmQpz6jczfaMidMF33/YGInEH6ZqXTon8kNyFDH+i/kqADY9ekGqKEsz4/vpIfDWinqDfv1Yue3zaldgAtxGLP75AnJMQXQPCvJJY8EOQKAK892LFANDYR3bHAgOWxAbUk94UmgXzpcL8WerhRr7lDurjcUzTZ2iIlIPy8S3AofJ/Bw8oDYgRxwTMR3k/UQ3bpwAB6JqPQf9oe+de6fYJ892Vp22jqDu98JEJWKDjNbeHE5kmfrnT7Y8k/HfHfBGmu41qCUEXGGwCLTYtmEbtaUkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDJxKoxhLV4aah00yEHkNFBw3RhiY0+y3Zm+8MVNi4M=;
 b=RbWR6xe0APi3lFOHQMulQrSl68fRpptSogVOWoEilWXkkGt+SBw9DxiUveTSMu6drNFmLB3o1/OfCTxAADtiiFCm8CY3n7+qCjH05wKjWfCNi0fHUulayWGHbMNE+nAC1FPlumRPuLZztPrmJoE1K9zyoTxyyslt+MQBOWCKxSa9OuYs4EPcnRTb61NhkzEgWXngwRVjDfiplyC7yXor1qDC+PexuKaVHGo76NbznPKyHagt4RLWamwxNR0wZJKDGetfUwApFiICGN4VrQfdJeojq+TCHB7UA4KvXSS9tzHbswewTG7yBrvkobkW1aES2lSBoaN7Cgx0v2WtfcFqBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH7PR12MB5783.namprd12.prod.outlook.com (2603:10b6:510:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 3 Oct
 2025 15:16:49 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:16:49 +0000
Date: Fri, 3 Oct 2025 12:16:48 -0300
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
Subject: Re: [PATCH v1 6/9] x86: Use physical address for DMA mapping
Message-ID: <20251003151648.GE3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <d3ce41b94c8facae446c67d85f731c031bb6ff35.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3ce41b94c8facae446c67d85f731c031bb6ff35.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN9P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::22) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH7PR12MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2781f4d4-e408-446c-e467-08de028fdfdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RZTjW/Xpq2mAqdXl8DR0L6hQNHkzBkwaVzaeQdOBik9ge1JB1gaCjCJOT/76?=
 =?us-ascii?Q?Sk6kaOlO+8lCgj8OIZxBStioOeDjFJMbAjz+Wq+7mr+3SRMrQvchyKUW/CGK?=
 =?us-ascii?Q?HfzZTp5K8UdMpMS8hzd2l3s6mRGIv1dIRWytCvTmS+gTvhrJF4TNHiM1gBOi?=
 =?us-ascii?Q?GyL/EBOkF+jTuhInJDtonk55CCIiP+eHIV5HFnVtdIOSMX6SxSHrsYnF2OYq?=
 =?us-ascii?Q?v0NY9bqxr1owaNnX+2EVo4bRmqv1pmMn9KX48ViTmS0Ewzuy6ISdAJY8Rko4?=
 =?us-ascii?Q?llMVllZRP6v+ss25O0/uSs0BppzBZbuLXjzVj14sMAF1/V1baKxJd+GOGVtH?=
 =?us-ascii?Q?S5eDaKMdeKynP2hQwRGV3GvjTDJ8nfm8lJUwXhRsOv8fvQxt3MKUuPFO670Z?=
 =?us-ascii?Q?4r5wvV1oEHI5Jp5dxfQ3rxH4OBctHccwGrWBsUPrCQuP/mAEuZb5Bq91ABRp?=
 =?us-ascii?Q?6/2n135nUIVV+WT5PFVNStJJqEeLrK5FzuPTm2DNU4nPESZ5qTmIsA1F//Ef?=
 =?us-ascii?Q?7ly5LTJnwRuEIhbVlKHx6Yo//TIqwY1IJ0h6jv+LmXcEHLvBaGO/grg+VD4C?=
 =?us-ascii?Q?7LHoa62rdZJdi8L++o8ltesRQ2fI59KD5NbIUHkFhKMK8JnvraWZIqBZoy6+?=
 =?us-ascii?Q?8VLzK4iRhY/TPtHK2GjhqdyAyCk9tDS0IZ0b9AY6DPmdC5Tz50Cne3wl1Cq3?=
 =?us-ascii?Q?LorY5uK2hob207/VtNurnr/R68zPQm0iWsvltEMpN9ERfFXqYLsBG89MUBTb?=
 =?us-ascii?Q?28+88nrXAKXJZAYbWoNv+a9LevIM3X+w+MpTJmb09eWr4eQ/f28EEK9WeV7O?=
 =?us-ascii?Q?I8ygVP4VKdOyoslRRtDGZREhU6nbCvF08daSj/7nIAP0gxcnS2bgG/d5/RyP?=
 =?us-ascii?Q?1T31jXmoTHZdwn1TwAzrdZu0/irbbB03afjmE8eo3yB4tzPO+TAWmnUz9G1G?=
 =?us-ascii?Q?3IkBbi1291DJkcX2FddFp18ztBw1hwUJ7aj55fWZwmIp1DTaKnlgsAjnTLi7?=
 =?us-ascii?Q?ieQ823eLn6bTQf72GA8wCuJd5Pp9yjxcGHhrm+wA3KjmMmDmWqH04zabrsGu?=
 =?us-ascii?Q?BRbxOwT0fGbrTnPkn2BN59kZLLovJlVqThaJJgo0IiK1dvHuv/K0Aq2XKorm?=
 =?us-ascii?Q?IIdRknX9uOaPRM1tdCpunoTn/r1qQJXa9bWCmkUrraz/jWpdPKao/nyZA30o?=
 =?us-ascii?Q?yIAZDMQennk3GNP5YjDXp4Rpt3A81ofoI9ycB7YvU0EFLALWooUiaMD6Vhk0?=
 =?us-ascii?Q?yELlM8qW0GbWHTJqyfSjOPcMn8oM5ghNqH1aNbSreWTKiZ98GcvaQC4q6CCf?=
 =?us-ascii?Q?i4QRl3A74vahicmqwyyIjdH+vVCGFqiXcpLIY7gEimk2sCwiiuyZvPsH/YqY?=
 =?us-ascii?Q?Ps063VQxv6Hd1onv+aVjbwujSiyin/3toTVYiaSDHPtJrRE5WNeorjKk8ziL?=
 =?us-ascii?Q?vv97yGFIa7SAHI5+6EYu2EsUX6tt7exF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eA8ckMl6/TcfwDYlbrlfMbgs+5FO7OWvWaUkaWzRcXmD481yR/gwfDVrgCDY?=
 =?us-ascii?Q?493/pfdxjMr+vgRzpaPuDgueVZP43jIrvnnCJHmZJ7XGe4Mdmj06D7oPEbGo?=
 =?us-ascii?Q?5YXGdlyxFJDaaWMu1/mqHDflWRTuEZbB/yr/OVpsktnZ9HB5yL12+p088I3D?=
 =?us-ascii?Q?kabc/kd4b62Bs/bD77FmuTn61O27/slut/0bXgAT2HxwLNM2vnUPdh0htJnc?=
 =?us-ascii?Q?zc/ZMkVbn0GuVeSYrwKYX4O/ahh3A9eFd515x5POqbRtnk4uFncW6DY/6KPB?=
 =?us-ascii?Q?XHJNaEvwmLJxDdMm5JTGk57ZRwhogxJetur7w/jrOHYDVJBmBsGNGi2Awc0M?=
 =?us-ascii?Q?23yTu/hKGuXbSAKyeyJbSBrkAbp3k/NET+xpD9LR4iIRpvXQKOMqsH3mj+Eh?=
 =?us-ascii?Q?hnU8aMoZUL0XdXrKxORMROILv+mhTnCp41LOJyccmGxVucAh5WJdqWEGXR0k?=
 =?us-ascii?Q?XnGNDRSAT27MAi7+L6xw3JytkHE/7rwq7yumRplXGDIb/ro4lNNfFmUOU4EN?=
 =?us-ascii?Q?ixSV58Hz4OSBQjQOfv4+oo7wliwdbaXTVFqv3TeBdqO7cGyv8Fdt1wLwi3YH?=
 =?us-ascii?Q?k5iUXASpTXX3fxfdWjFuzh8D9UGJPf38Vkb9fJpul4CchqD3Lpyd44ZXb17R?=
 =?us-ascii?Q?nK8z0ItijA9EZDHPTkOo2TceKNvg21xxlKd34IjoHNs2GCtNt2HOaJwZawiz?=
 =?us-ascii?Q?6t1BBq+9iR87lOdtV90dtkzu4F+M0XiRQ4qGEx5igMJSvOB1luRT21I1RgAP?=
 =?us-ascii?Q?Bjwh9kivi+sc/EpJWhNLbEUs780oE5VLfM5l4KlOTnMGm18yZyrAVhAoMIRL?=
 =?us-ascii?Q?FK/3kLB2Xex1rMK9hXWEAf4onafMZGJaTSEPPis7RSlexh8WCefVgxvMU6gL?=
 =?us-ascii?Q?xSRbzj1pPy71o6iDgRD33ZVLXT+XhVQGv/NLxJgKXWQUXWztb6+xCNM76oCw?=
 =?us-ascii?Q?kAK+a4lALYvGHYjz0BC/Wk4rq9/F77ehvo8nMt/D0dloECQYEbn8BA7hJa7c?=
 =?us-ascii?Q?KMhAV6gn+OXLaXXR4WSoJvWDcgRFeuwRTr3KzOt4JFD3THLsECuWs5mLnabM?=
 =?us-ascii?Q?z1O/D7djKsfNex8E/7VPVAjmARivNHMEvLties4v/dU/ADeTpjGw6o3HFdBQ?=
 =?us-ascii?Q?aq+0TIU9sBCcJokcN4P6+gyvx6e2kw/RhlskZ182RjJmm/8s7FA9GN1aY5rC?=
 =?us-ascii?Q?rx/GKgFczSoMnzYAuKsMg6dM6LFLHFJ6rBPX+qr0RP9SucSxMNhdfG4AP/Zc?=
 =?us-ascii?Q?edrSzSEQplLe0gSloLoOyh/nDVbpfMzEm4WQEvaDB5gwkE46aJMhv1UtjWvF?=
 =?us-ascii?Q?Z3vc/FI7F4/JUYKLQ8FFGmSYbQdKr8PFtbWvjpeB8xyAQNMOyxaOSCagDdRS?=
 =?us-ascii?Q?3kjrn9UEWqTePBPAJuxN1VXyEYg26mWHUy8lMir5+E5qgl7YgP6V0dMeKmIc?=
 =?us-ascii?Q?tpswTQn1fXjvOuqoxmI8JrLoPSdqFJE3h5NaawgdeRTo0257fVIe3kSNSiK7?=
 =?us-ascii?Q?rw0P5B9YW4gPIXjLXoRdOsl/DEJDEzhwcD3G93IfhD0wWjOC0I/MLcWAuZCe?=
 =?us-ascii?Q?17wKzKA9XjBtSwcdLWM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2781f4d4-e408-446c-e467-08de028fdfdd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:16:49.4041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dT37MwcogbXUaiUFjThBHf5bDoitlj4hr2FOApGNCumdx+lnXKqLXTG4hzW1K7/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5783
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:26PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Perform mechanical conversion from DMA .map_page to .map_phys.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  arch/x86/kernel/amd_gart_64.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

