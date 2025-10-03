Return-Path: <linuxppc-dev+bounces-12657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE05BB7848
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 18:18:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdYkN3Mndz3d8Y;
	Sat,  4 Oct 2025 02:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759508316;
	cv=pass; b=MVCCrceg4CCqj2cCdDSVbI8BvqLJWbbawluwmTpAMfmMmJxkA7caRXOa+x2hXTUvs9Y8S5uACS1mULyaZJeYQXZXmHLmL/TgP5XV0NeFw7OQOnzeB42YsVQUvC7VXODEP13or0RXp37Yh67XX4+eJLn97+TKUoSrVhFVILCa9emKhAYyA/AoPYrT4Y9s0njG+riCjKu1dKu2bXben5GncriZ0nS8yTc+eOuyxVuOEaLr6P15b3NGbt8Ct9ldI1CBFY5v28ID4bdu196VYaAeKVc/jO3fIqDFEj7vwU6l1A4U2+/MILTIuVf52NkSAVigS2aUJ6+sUqKhU/0mDLZ7cw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759508316; c=relaxed/relaxed;
	bh=FlZ+gnL/XTR96HbtsyOEB44wnaRXFMTn+X/+GKczHSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J6eB5r0UoGVu4vztu9PZLNrlVENfWylB1DuM0JwO8ZouFrbRSfjAcTzveCRkeKCpJZV3OvvLDL3xRSB3nQWJ71rkOvLZF7gywE561fmVXpdLj8NiiACG7jUatLiBBA04ECv9mLAYNDywAXfaQdwqVLZf/s9Mh0KYIhZvLqrq4J4bBbxb7xTx6IRW7Jst95pjWP9a7f95uYm+U2lc1WSDFJBYO3IUesEKm3r4VILI3cB3tkTCfyDYD5U17Nl7s2Q049OHAnwJGxo33sxw+pGmY2j+Jm3wVjXmgHCUqZEcyavgqQfDTptNibjLDuEBay5uyfYRuWheCHaAtzq39biIYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uDO8k64W; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uDO8k64W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazlp170120007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdYkM1jRwz3d7n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 02:18:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCMAglROZbOzvnlT2EuGy9esL/pjN7mDQf5wb/yWy/7b+oTzvsjuqP7LJvGsKb8Et67JkF60EbzP/MKwszGHJZHYn4RO2pEnhscF8y3Np5ikIMDqqvaKpTY6gm4DzL4Fx8ivOJtpaFcia6CCJPrgJo38ZGWYovMTvgKpyTmBjPoGm+ukvvdF1YaJ0Eaqn2c5CxJatAk2arHwrnoFJVOcKbkTv6lKAtA9MiH2jxLFtstZjoL2zli5r0YDbkmeGI23/VxpPgtP/00X/EFH33cRiExAVDOhL6bpQrSjJtHAyw6sacjB50WROvRl72gB+atbDUf6MLL8s/NXeEUYNscQpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlZ+gnL/XTR96HbtsyOEB44wnaRXFMTn+X/+GKczHSA=;
 b=DnT7GiRMkAQqqd1kQtnyeIQFlOvT7CVOZsc1Ip8qgEXgmIAVYJ7RoBKMlHtmgIbya+ABMrRwG4o4YPB58Q9V9nExvZ/fYs66m4u1BGc24UoUPRc0Ig7BddBdnISrXYpk/1tcwjoaFDE3yUtuCAqQGjUSfwv5PHJll+E/Rf26dblhurHi4v6xPsHr5+oui5APvqZFC7ySbOHhiLa6VBGsAL4HqBKvATNm+Am2w7zLC6QegnY6D1fP7e5A38++mS82oYAy0cPVux/O9nCjRVhZ5JrAxcFgSfUBJaAr6oiSs9g7m2S89Xhkjr/1ddwXjTKlWbhRbhDLsndQ2wxpbtkbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlZ+gnL/XTR96HbtsyOEB44wnaRXFMTn+X/+GKczHSA=;
 b=uDO8k64WmN6OIzQhMUotd8LOeTV9vowVXvQWptXZ07id3mLYvLkZEqNeZxd61rQf9rxAbCwvto0A/zLLGFOknkDn+V7F2yk1NBL41ATeA7IPFUNuND9sQjwYwCLN76mJmz0blCp28VxoUcE5jHpLxyfM6nlNtNKEaLYGH0dxu3qwdxZCUOt/YLRz3wafyKek+5/CO/HySELq4HN0AAweivaJJeJbmGsiDIF447BphzF08krh6pg0Gu5lqm4Mp5i+yIhHrlnHkwthRDPcJrWCxxUr5cI1MK9+mYcaKgKAJW+sfQc0ZLJNtltD6fqwGuI7iPm+duzmB+LfzHzeF+a/5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 16:18:07 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:18:06 +0000
Date: Fri, 3 Oct 2025 13:18:04 -0300
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
Subject: Re: [PATCH v1 8/9] xen: swiotlb: Convert mapping routine to rely on
 physical address
Message-ID: <20251003161804.GG3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <573fbadd743851838a91a8dbc84b4506cea2192c.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <573fbadd743851838a91a8dbc84b4506cea2192c.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BN9PR03CA0422.namprd03.prod.outlook.com
 (2603:10b6:408:113::7) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f46e32c-014a-48a1-be1d-08de02986f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7GjaRnRDYBA/QqXFP+/OJnU7q+CyzNWZ8swwnfR5onLJIftnZ6y8wQ8hPXmp?=
 =?us-ascii?Q?9nFrUNMiuag5dmM3pcy0juu1GxOmliI/nxD1FinLa5UkKU61EIccTsD/iqSP?=
 =?us-ascii?Q?q3WgDu+4WZUlodd2ViaDJa5E4noyV+KaZ5MPYSPLKL/JKt15a5HLN1qa4IDW?=
 =?us-ascii?Q?9omKV3B7tTu+AKqMeA3qrHhak2+zipONJN/XK7LCDg1b6VBqxZ0AuNQgdis4?=
 =?us-ascii?Q?t0JTKo9fC9RValVhwETYrCN+neo6dFVLD3kiSBzTvyLLBvSG4HHe4BebKHMf?=
 =?us-ascii?Q?fwv2TTQrsZd3WoaAQQfGuTNMhvoxJK3VQENQy0VKgY890MkCcRXwmaDsWc9E?=
 =?us-ascii?Q?lV6AlNXB1+VJ9ewaxldyENDgvZblkLg3Ot9pB9My9I6Y/8ci/k2A2DSr66U3?=
 =?us-ascii?Q?BbP8I5JBtctmBjIVjsliu2K25ti+k2rdXXq5uBxHAa3eAJY38/CRuu5T5iUY?=
 =?us-ascii?Q?j+8Hh4vsJhtoG9eCFNiPdjcAX/ZUqksN8PjW5NP+uLYwWHJUgnFXo0wn9WK7?=
 =?us-ascii?Q?hxMQIB/uB1seCO1tWA19Zc91b2FBDu3w+kwvogY3K/zlv9GFB6mxridN+/y/?=
 =?us-ascii?Q?4gdYGLRU5U6RfGNXcy60Wm4lbT6E8TDldZ6dQJ4Rh6lopf6pRj0XDF1ebyGn?=
 =?us-ascii?Q?jMHR/JKRRd0ecA511Uas+IadHN1CqzwigHe6Fq6Fi26PRgSDTp/LRC275Lxx?=
 =?us-ascii?Q?lzpqt4U3cu9LT4e2HUDNyCG3jTC3pbg5Ds6HITcupCwCBp5tXyyuTcg7GW7g?=
 =?us-ascii?Q?j4eBfmZg0FYVGr3Fa8o/PBJqWFh3tvOUrWrOrl6K1ir/wTmY0P2llSlCEA0P?=
 =?us-ascii?Q?Se7ngy6f4iKiu8HnsQ3RdDVgJ4kDAuWbe76DgcUlrI4782PuG/9JlHmxrSGd?=
 =?us-ascii?Q?3P4GJDm1dDiutunOHKS2fkifLF0MZr37RJmwOucsnfVPScsBBcvwj/RkkUkS?=
 =?us-ascii?Q?UCbP6igQ5VYk6zWearZOFHpL9I8wsNTl/jsnj/79D6GHVZOvg9nPwk2T9Rw8?=
 =?us-ascii?Q?SCv1dxiYMP7IjDmRCSKsHv2WBJCAR0+3JOpAeOgwRYjvKf5fYs2+gGSkfs2g?=
 =?us-ascii?Q?ztN75G74CxEbmxbjgh8YyYe8gogyK+aedoLiXv5Pokv52KrXjJF1V51GENrU?=
 =?us-ascii?Q?wtOiBnnBBPC1OP0r0FG4WYEUNiS48PriTWkMdle/9c5/tPvcOEQYPspf37Wb?=
 =?us-ascii?Q?EMl0pNpyYiakn1TVbo5PJkw8GCJqJJBsLnPIWl+SApYQCH0T8QXx8vVeOUs5?=
 =?us-ascii?Q?T8Eb3quXvBz8QHLqx/cIVNQA1P+F3eLByiwPvkFVcq90X27gAK4kIwWegaIy?=
 =?us-ascii?Q?vrdZ9Rgf/YPhsbxzL/zmW+pT7SPiXAlhRUkOW/eUqm2HR/aLMdqKonwOYVee?=
 =?us-ascii?Q?awmEWeZ5fl2WQm/7EOAjnuodlr8g37TSqTlAyg7TG/4rbU+9qpUOz9u2Qhr7?=
 =?us-ascii?Q?ElBxyc8jk9gnQUJ3T4m5eG/5+dT4p8GX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mFZUeNgXWC8yrVCF5BKdt+bZXkBmq6YNHqU3ZQGaqY792xNwKJa/62yVFsmI?=
 =?us-ascii?Q?849Xxbz6TwVR/NHPKs9Sa+TdgqplcMJJdace0ZwIci63/RyjJT3uGi2i77nV?=
 =?us-ascii?Q?f0Q6cPrBJ8LI4XzNI1hcDmb5KOsOFnJVnzrkvlplHkqgogAivDKVo7gL+aMQ?=
 =?us-ascii?Q?JpmMsLd6ap/gF6L1IhTgaY+fWMxiFfv7QV38GFX04Z+3Nf/epnqMf0OtaoSZ?=
 =?us-ascii?Q?W5lokoYAqU7fmzcbZNWIAxGmrhg9bXu30tN5D6bHAPQPyjC/qaNYhW2Ae4p9?=
 =?us-ascii?Q?1pnEdgpIbfuJ32FT32otWtamamSA4E64FTHAFIYt6rO64vyiAaR8pTUbUAAb?=
 =?us-ascii?Q?feGSeU5dFr4c6bg0PO6qtoIwPBexMNlXQTM33I5lOJC7LdY0Z/OOVUbihdFZ?=
 =?us-ascii?Q?22kTEyxWkqF0s8CWr6Lfj7J7D1fbLgh5swK7ghvcs2A6fiSSglE2PAU/v2Jm?=
 =?us-ascii?Q?ILfhS/tp7LGiHa9ByrqE5ZhVyJS8dNeyETcqYeBA6O7RHA+nf+IarDQWezn+?=
 =?us-ascii?Q?ceFC75KfvSqzjXlBwJjUdt0/DzQNP5ORVFp4I7foAQ5ORRUd5SOOL0Dl7Y/l?=
 =?us-ascii?Q?FC8XcGQtRlPYCjPxR29ne6WFzpMtCu4SRBNfz0M1XY6OfeDqTeaJQyXKodvn?=
 =?us-ascii?Q?Daa95j40Ywdn5sevXrOye+4f7DTMA/KDc5y4PMBiGj9kBSGjKmVEFEfond76?=
 =?us-ascii?Q?kciUAE31O72cPsFmS+hcSRCXyzto/Y/6n0EGQ9NytYLIrARovEgq0NZIziU+?=
 =?us-ascii?Q?o3m2xJ2Ip5hYHsL2vpvOG00lZLYAM3Ff//phjAjgkM6SnTsONyGXFbO2D7t6?=
 =?us-ascii?Q?Fa3+hvzqryEGu0YmKwU13WoMnM0z4ENrKOmAlEczzPCdAZ4Laxyo3haF+zpf?=
 =?us-ascii?Q?BPZ0gjuenOHBFQWgnNljq750RCKcBiKX4dDWRo96V3oNySjweqXXHWG3H5Yu?=
 =?us-ascii?Q?XeNn1TdxZn681yxvVyceIIPlsZCskCvlL/Ne5oWzMU4cRuPFJZmhWRMGqhBf?=
 =?us-ascii?Q?WHP9FwMA5PjHr5zwaj4hahv4jOo+elIrecFHvOU6mfDiGsLExgUIBnzJLev5?=
 =?us-ascii?Q?5mbi3qmyIHtKoLzQHah3dPf4nYf98rufoTYap51UHfUTNnyUSox2PpcpHfNr?=
 =?us-ascii?Q?hlv5TGcaXT9S/EZTP4u9wdGnofhSFX+x9dzJJZ9BONRMVVKf3k0A19uZUVwi?=
 =?us-ascii?Q?SXwpAXFjyF+6171HwGsOmV0o80ke8U0CRVKIN3TrdGBMiwal9fa2ByJAyDxs?=
 =?us-ascii?Q?sW6DGYZAxOeGDkKs2c8xF4KLA7V6yvoKivH3+N2Rc9VON+6v+PgnOAZKUG/X?=
 =?us-ascii?Q?vQTqgFcX5lFqbqO90EzMHzQZt4F17BttpopxXT7zUqM5DLYZs+D3G+s0DSGY?=
 =?us-ascii?Q?qVyf2KOEdXqdElnwHodVDcdLVl5a9G11iCPtkno+5y+ZgNZl5TqMIUYapvx4?=
 =?us-ascii?Q?rtSiQ7U8BZ84WPJ/Q5HAH9r5lHS2JXgV+1Dp0acUVwWDhZ0hF9XaYh9TUQLl?=
 =?us-ascii?Q?DFQekkkvafNWEIc0bMpsiC00/Pa6Al7rknyCHubjqK0yhXVRk57wg4DakluR?=
 =?us-ascii?Q?hz5T+Vp6X6dxYBkLwj0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f46e32c-014a-48a1-be1d-08de02986f13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:18:06.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8e/ww0X5zcQzL43/Dkk+4JNvpnO8rYrhk/s7ZQ61uWqZbAmG78jVq9WhDD/JTCY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:28PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Switch to .map_phys callback instead of .map_page.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

