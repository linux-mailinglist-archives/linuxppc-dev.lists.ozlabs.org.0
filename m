Return-Path: <linuxppc-dev+bounces-12670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B6BBCE03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 01:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cfzFg375yz304l;
	Mon,  6 Oct 2025 10:32:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759707127;
	cv=pass; b=S18jMf4jFnt8lVWcxww2opWz4ryNae3JVACEtNz9HwAfJkUoZ5sXzwcG7tY4eW8zaE6DDtblPSr7tzUexh8pTZdmRcx7v51atBmwmaykzz4vXR+ZwYrYHnYwNiR5kbrsRRpuMCHwe+EkkdZH+FzMh8aZlpF/pcdk0oFjG7HupPw5qXwj7uBo8C5h7cDzp+dJEXF+7oZ55hc6uK/6FQgo+Oa9Gi1/17eyn+GWJfVNUHwsP6yEMxSHI23CjCa8mSH8F0k95w32a7ch6aira1AG8rnjAaVpVSArSvrp1XskciHb6tGWJYFuUVAHyngnpVpicpowYACCPc1K/ei/wkxCCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759707127; c=relaxed/relaxed;
	bh=D3VfeQCUMUsmMpFfPOO4y2t7ySTZjeGBUMDQ/ZIED6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pb2DfBXZXj+wIrD39otiziUxEKMTZIHA9aoF5FdsNJIHnSsZcgDJc53mQuWGuPg46d1XrpWk/KPZ1CMLd7HYe8fgbjb+8vDUCIQJoDEhPpWlJ4J/fD3ACUGpSeBMrJpVF/O2pI/4WbHWsQGXrsoacVezZPk0rPbaCxOYAyyi2rTUm9toYFOfO2QQwq2P1lLzbLUe2tGrOiYK+WCJ5ZQh2epIdXHJxyBEg/YAPKZmFAXrmfNuQsAvT2lXX8u9R46itQYxC1RxO+rY2tTFLgXXxlcIUpK/hT03QPypamD3EjLnE3v0C+vQUQLCbQRZV4CnjmkuyVDpcoX2Ud7fUp0/qQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LHPrPKOV; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LHPrPKOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cfzFf1nxdz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Oct 2025 10:32:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btyAggyeWvns5xtWH/OLtTgUi1ZJ5fOxc/5KIU5v0oxBdgtCBLYmkr2/OlFujkBellNdY8UxzcIeTdksK5MPCpyXG/Xa66EzE+hOOb+RYeKnDBSemOJPaubij+RvvWVfp1BcNJzRrIv0BvQoEGb9mN+NEnWDalWbJWm01QQvQ0IJbdcHwcbY1xJgjJAzzxiUn9QAyMDiy6MBegzro1+HCGKb54hzxdr35GyZI5DOfjOOeFdDQ+G6+IMLo5smgsOI4e1DjUvete/FuN5FW51/NuiS8SOz/xLb957ZqcutQHtqzKCqHgEs3H8iX1hMhrSp1PZZiiwisCBiewrPyjyLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3VfeQCUMUsmMpFfPOO4y2t7ySTZjeGBUMDQ/ZIED6Q=;
 b=UhxCXNLWQoRq/7sszZhKicDoYJR+m8EhWMDZUJsD+mYuYEhpAwN5SfUZdAi2uGBSSw0Pt/F2XN221/BLOhpjc2Oivmdk4M3KtyEbaYYHz5uiSrQsO+x1sCB1FVxt0YEKwdt8gMnqBJ7Hlz8MsYbtKqwgu0LBGD+udNb1Pi3jt2zkJ1+DPfdkEu7P6I1SXxregyWxg2eYAGLugmUEqKnxL9OpPyawIAaEO1A8FlrByhWaj8w/5tBenSiNI1vVEu+yeQEX6i6gJO9aiYx8Lh38ye2eM6I07UAjOJ9YUej6Z/e102dnI0WGGjLOxVE4uNcF0KahPhTxryElAOvM2dk/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3VfeQCUMUsmMpFfPOO4y2t7ySTZjeGBUMDQ/ZIED6Q=;
 b=LHPrPKOVugldV3CsBIIowMzOUt/IuOo4D5Hy4V+TzivSl9hYyNheHEcyaTd31TsQJF46HcJvhLQydcUtAea8d10NDIQY42TyAgX2s0ib9j/AIAyCrw4wDSs2ICW/rAhoFTIHvd3Cyn3+FtyazGd0kkHPmnI5qRReIsgLHt7seiRDWvoVtFdJFnLyG0td1voZow7sotmXmAXV3ANcCMKkjOJTygTLt6vye9r8bcyPBbNXe4uO4FX8Twe7ATdB9HixyNysVAsTuSdNbdaRLE0bmMDUBhaKGQaymKBlAJxLVfbCAWx+RGMKoVy1LW5MDeBMZTcluFFVIG6NOJfbXrdwig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by MN2PR12MB4190.namprd12.prod.outlook.com (2603:10b6:208:1dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Sun, 5 Oct
 2025 23:31:35 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 23:31:34 +0000
Date: Sun, 5 Oct 2025 20:31:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Message-ID: <20251005233133.GL3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
 <20251005132259.GA21221@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005132259.GA21221@unreal>
X-ClientProxiedBy: BN9PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:408:fd::25) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|MN2PR12MB4190:EE_
X-MS-Office365-Filtering-Correlation-Id: af03c48f-c699-47b9-ada5-08de04675295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+kHDCf2iitGPITE6yErE4/xfQVQOWnpyGjRHbIrpSBfWSlVQsiL3UIr6ae5O?=
 =?us-ascii?Q?4d9wWPmVeIndJ9TmEZD8gOsC6CwJ9Kr2V98w+WUMbjFF+/kH3VkvVF2yeBxE?=
 =?us-ascii?Q?GoBNao3y26MMjvG5cMlTT6FtDhm9NZnTXDPjij0BHkhjygNJd56jEAvE3Y8d?=
 =?us-ascii?Q?zS8spchMBEFgAb3cMwqfau1CGlN7DxjrbczDvuoxiE9GanpHm8N3H8nAcZdV?=
 =?us-ascii?Q?l7sG4F6AoCw4syE24IrKu/1LImTCFvV4+UvQKmIqOfmlBQbZYsGYW6/mvm15?=
 =?us-ascii?Q?Vz7UwvWnx1pU/HUh6yzpJ0M3IGPz2mYZ99dyu23hzq2vldWv/MJx022Ja527?=
 =?us-ascii?Q?VtHqKi8Od7YKo2oeO92JddJ/fQkBEf440Mm3Q76YiYvzPgWBLsCHdGBYfbRq?=
 =?us-ascii?Q?guMpoiuAuXFsXfKfLPKKBEiINx1nT6eKEODVE4V7JJWgVytl2X6gX4dZFpmM?=
 =?us-ascii?Q?TrAq75GOo9Jp3tNpDGW+wGQ60rAaHbF28MiAZGzrfcnAbHQYdxPecl1E79aa?=
 =?us-ascii?Q?BMsnMYP+cJwVETXYs8IIX3L+gauWjq6bqghWwBAYox31LE2CbhVikzVovBOd?=
 =?us-ascii?Q?EwHwwF5mHkK+RJPBp0t4uSOV0s9EwJJf8nXJcEkKA1LWHcgqxanvrKqBeyu9?=
 =?us-ascii?Q?69GCg9puOCO8qOfTNBzFtBkKZz98APggL7KnOgpdFYYcYqJCwSWg3421XTTQ?=
 =?us-ascii?Q?2LZAKBZXvNalfJ6+HZoJ4XwBK/sFqGdIT1qHiLiFHHAYfH8pBLEeuOSvL32E?=
 =?us-ascii?Q?drnEdyagYVc6d+ZytFvf0+9N/X6dQOPw9ey7dkByAT4KxEUQ6OdU/sfTFo5h?=
 =?us-ascii?Q?ycuXm46OXSLyp3bRKBFhTdJbQjLdD/sFKp/EOtafIH4g2arEXBczireY8WfR?=
 =?us-ascii?Q?WuK32402eL5xnBFnpBslcYuubsWF+V6t0uzuCqf21HyrXZJ8iDzPJ5jebl7q?=
 =?us-ascii?Q?gRLKaVcXEHjaAkGmhANBRFIqcrFs48/9pCUDiINPb0WloravAX/5XN/YjL/h?=
 =?us-ascii?Q?y+omkkzKGU7Qsw405Q+H7nN8QWkwkeeLHcsA8NPCQyjRphgDiK124JmeU552?=
 =?us-ascii?Q?AHeVVryzFcjIdYlmW8h2jo4JFGAd47gh6wtmAKelC/ifsnhRq9kuYIUzKsDz?=
 =?us-ascii?Q?BXyBEmFrk4z/JSpHYAdbWC7FuR5rfDwAmseg67hbiL0YRyP4YRQcdg7ihUl9?=
 =?us-ascii?Q?qjc5LTOkcmiLX/SAb5kwH4Su1GpYqQt3jesKzRsCxwpV5uriaECzg3C9rQ1S?=
 =?us-ascii?Q?Xuo8l5mHvVF9TUEMPVFozuzIoVLLLVfGK94+i818rLOIFCDZc8aDPxvl1Xrx?=
 =?us-ascii?Q?bfD6vTxyhlewQbpB0XEzQgRSSLCmwDeXeTeyH4Fj5tFz5O4rQpyb0bPXH9c6?=
 =?us-ascii?Q?ey03Yjh1Fp0vy8GNKlSDST9iZJgECGG5dL1gIR7y/s4mcOLEDO8Nt1XIk7Xe?=
 =?us-ascii?Q?5lEa9/dRwinMoHHmPCQNJMdcbCj4ETte?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F/GHjGCqffUgrE0EKTIMZKLnIBeyxCoqQT5UV/dC5RuJMYLNh//aG1+OACBj?=
 =?us-ascii?Q?056G56v2i+lu8kpP1pesRt4a9xrXy87X15lpaPrslDMczPuuO5qXmBrv1R8U?=
 =?us-ascii?Q?RMSXjOfA4P6K8gthADq7sBaq62heSM0lqO9J5nm1Yu8rSvNndlqymW5QzBGf?=
 =?us-ascii?Q?DLi6RQfTEyEZAn5Ag4pOPelufdEV/gEgI7Hi+d91s1nVtJxY0QKe02qNOJhE?=
 =?us-ascii?Q?Us2EUsQGitH5zLDS7U8t3jKnXOvs7G7WhcYPw0N0b9k2R7l2J55yvJQdU7GB?=
 =?us-ascii?Q?+p/uE2g6fc9F6wEU9iQuK2yB63QWywOhWtAQpnhoydWO08SFBYmnaG/lhXpq?=
 =?us-ascii?Q?OI/jFUpAbft1A3TyQye8VcY9B0PvyIPQpAMTZx2zxd4XvAneuAeVohlKtB0+?=
 =?us-ascii?Q?8Ob3DOko6kMYL9NkuFYRrNVEpzRghTFjG7/jO42TjgeFk5mokKTwaiVNxOxg?=
 =?us-ascii?Q?DrjM1du/WcCpCmlhc2vNq64xbs3xJfTBu52PF3wg5bg4vhv879PbnCutw9DZ?=
 =?us-ascii?Q?Ib3ivKwgWkj/h5QJh7OSBQpZva05WwrnvBsfDUIGpKqG+eFDd5J4RD1Qzo8R?=
 =?us-ascii?Q?1sCz7yCRaKqQjPy2h9uwuU/KaxuwNf47djmPf5VZglAob9qrOBzUwAsoFX+u?=
 =?us-ascii?Q?6YIuLBpak6q/pz6fAD+HWkbUyjTd3La9XL4ld7dz0CdepdU64vQUNVv2TkvQ?=
 =?us-ascii?Q?/Yt63aZ86rvyIibDKyngGMGZEEZ8EDnv7mL6X8FxEi5Cv049WtlY8MmipAUE?=
 =?us-ascii?Q?zbH0HroeikAIbUVvw5A2WaiWGJXiWTSIyL1bxdDALHKo77ltwxJpt1pi0QdK?=
 =?us-ascii?Q?s5SRP1UApS1UNhcUSx+fpV9kgJBuQt/YLtiMk7yScUXX5DMB0wVdzwqnYgPz?=
 =?us-ascii?Q?RpqYd/faDpEJ46+0cunSZOGRgw/DAt0/gAT+TcG8lFV50lqNTC01j8VR2YvF?=
 =?us-ascii?Q?WX8Vdn/pdXDN6ADzHnRZQYVUTehOBWbB1f/hJBSsXYJepJrUbixYjIMdyDYi?=
 =?us-ascii?Q?cdd9pGcuuLvYVpD69yu+XF58gjk2k3xGigz9i3o8scvz0BAuVu8JpaIRcguB?=
 =?us-ascii?Q?bQ+GUtjhnV2ku93Dtzzo4O0BxTFYZLwAaRtxD0AeNhymQ8PGosRAQr6dgeoW?=
 =?us-ascii?Q?8CVkQUDOH07nHuM0l8uE2tczG+eSsJooc6s+mIWCfVYPd65vBfDlN4zCQ2K4?=
 =?us-ascii?Q?HN6M/GFO4KiE8FDzu+qM56DuDcZIiqxpPeewGenLXf5J7vXAozASwzCwwk7o?=
 =?us-ascii?Q?Tg6MafOiTVinU7n56QYwb/x6NWdgP1p4+J303ZMu2pTjkkSaY4LUAp/YXPWl?=
 =?us-ascii?Q?JHTvqU/mu3E0bGYQ2VQCm0bNKGtDpN0E4ieVv6zUfacl58B9Hk2/z2Genjo8?=
 =?us-ascii?Q?QuE95BZF7YOtpZff2g+st3e3olAhujOIXEca3ASD3QKH3JQDdQixYsZr3cUw?=
 =?us-ascii?Q?dCvgYuKNUBoYR2d1iYb0Mr3sjLF0QybY4No9JN+TPFdVP/hPpY2dQlP1wI6I?=
 =?us-ascii?Q?+CtJCEkp4CkGMXtKsMbLXOOxGu/IjEQYs8G8T8i/Kz3f1k1cutXF3+Et/NAN?=
 =?us-ascii?Q?m0Aw+s0+LOdH43TQlTE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af03c48f-c699-47b9-ada5-08de04675295
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 23:31:34.8422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mi6mlMyoDyIEp8h5YorBbJ89sb8bIsaYMbnBLXKRmFw1RzU3ebao7AFERFt6Fvch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4190
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Oct 05, 2025 at 04:22:59PM +0300, Leon Romanovsky wrote:
> @@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
>         ** Grab virtual index [0:11]
>         ** Deposit virt_idx bits into I/O PDIR word
>         */
> -       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
> +       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));

Don't know how I missed this, but this is the virtual address for the
cache invalidate James mentioned

So the optimal is to drop the lpa() and to use phys_to_virt() to get
vba for this instruction.

Jason

