Return-Path: <linuxppc-dev+bounces-12656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD45BB76DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 17:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdYHz6BKrz3d96;
	Sat,  4 Oct 2025 01:59:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759507151;
	cv=pass; b=V/vddff75tgzGqDpWnd7O6iTZtcGirj97DDKB1ZahkweV7FsTNKRg2qcj9VBmRZw8yvPprGSIJZl6XY4xWmA/rmt+zDwamcJCvbYNKwmiEZeU88OAnpXJzUh+PTL4gIp312/NkSJHNMU0NZyZ/V1sPE4TqizG6q0yxCO30t9YKhvfmwnDWaqzwuiK2LhpB0vmCvCSvv4NDABlYpR3peVbGRnPWzbMipyVHtNlkrkvfbwwboxFFpvdv77B1tnTTGeloPY/3MnrMRuFxk+rpnp+CAcfcWqvqSOYX130QkEpc1BsY8xeYMXjjUBSat1i0zu9gmosxYgQEAbPhZD/rvXXA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759507151; c=relaxed/relaxed;
	bh=kEjxMeKFTOXOc/EF+wAfGaWqUoQMKZgJA18WsCmIX/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Phgo4GSto6k9WkVj8jAq4VaOdU+yjbY01ECbQuv7Aqg+Df/WkwfI3H4I0mUD+P+pltaFlQaOts3LBWTQGyngfrSO5i4KwGu/RA6y7FJGpsV89ANSlm8VkLfNWp6xnzRkUvBvQNarYeeDJA3CxijoaE2+ZKf7DaNXe6cDt+d6UQDxZhsk5EB7yuIW2ReoxcwkHKylqHZub8GsJpUMKOE2fNJPRHV28j2gq9f3UB2dKkgTx84jwSxC21LL1B9oTX8xaMf5znb177upu2qXMV6++QFWxayCiYMW7fwOIBr2PqUHmJTPgvyOkpX6eH1Jig9fmH92kECysv27q0V77F2usg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tQRh2o0T; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tQRh2o0T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdYHx1JTQz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 01:59:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP1URiFtXZIISjd7kF2q1WG3Fd7MdtDI3QqEeaadd7ZrSJ0yzdha5OlvokQ9lG3RlHltyIubMxsgMGzECEX1SfY2AtMXTROQf2ivrAgPBYm9458ClB/wZoDVhq5LGLSuBsBZJ8QlulUu737wY90YbCE6hAyjueQELH6sZmAp6Z33GldJA0HV1Z7F8ZJr2fZDHHxYuBTTQMcM3o5E7DzlBQOUV07RhJAiuQ3AfqMHQyJDxPA+6H/Hr1fFLluMpBbKqAOjjIumXByStMGfRx+YU9G5MIY7wBF5BzF5IfnwTlctXA2VHDVj1fSl1fEq6D9uLcNa0/C1ZurOu8bDXeJp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEjxMeKFTOXOc/EF+wAfGaWqUoQMKZgJA18WsCmIX/A=;
 b=tN0EPj6jSVDFZmznsiwM4bKInUiDCrdnFfBor26oVht4PwKPGS9PSz3ICvgeJgtK12joeoKGDYhJqdCoymbFlwytbVucHJtUoEMbZiOSLYCVSnhL6OpEsfiKhIZLLJu7kwAvh3T/5l+RdVIzKBghBv5z2Q/i9WovwTfOTmLv09CvqL2a6YSCtO7ZrvTVF7UUiRMlVsQl5wVm1XFA8czS3VlQho/fHKGRNlmUk9I6YhCs/G3M91B4mhpTYn3W3H6tWDCakvch2YUJWpu5Q9C3bizFO9rYo6u4e0Lk09ug85EQWviNn0Ha8FXHpu49f9LB+vMgE2nRHty9Bm/j+cj67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEjxMeKFTOXOc/EF+wAfGaWqUoQMKZgJA18WsCmIX/A=;
 b=tQRh2o0TfWLkocJAlrKcZQGi7JLWFdP/GrFxSkhYjW9XBqsSkF7gaAjU5w4wugevmnpLz1awLL3KAQFkgt+RQg22RZeAQBdk8S9Wq+BvOo4NQ7ramlNCdH/KwJU2ALplEOpsy5o67M+Ou6XEOWoFCVgRwGPSa8RTUuDDKkz3ZEfARUcq7PiPj7ShFE04PmOujCfuJDBA8plnvB1hPa7p7vGVBy3ZtCTLZuzcs9FtysaBIoP1lrxIuG03hOjHs4ljyy2NJXCJ1iVh8HKLrdmnUkOJfMrEjcdfAp6yTDiQ48TkMQoBGQPvINMdnMGVO+Z+5sE55WLwodgVMcBRP+4FBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS4PR12MB9585.namprd12.prod.outlook.com (2603:10b6:8:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 15:58:39 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:58:39 +0000
Date: Fri, 3 Oct 2025 12:58:37 -0300
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
Subject: Re: [PATCH v1 7/9] vdpa: Convert to physical address DMA mapping
Message-ID: <20251003155837.GF3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <fafaec3eb3830aa726b86ac7b145763c8be25a8a.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fafaec3eb3830aa726b86ac7b145763c8be25a8a.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: MN2PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:208:23d::24) To PH7PR12MB5757.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS4PR12MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2c6507-e867-48d5-c797-08de0295b805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NImKvexlca9Tl68Nd5mJYW5N12yeCeMvyu+pkiTLQzwlxPnfvtF41tJVIUyI?=
 =?us-ascii?Q?IVBp7oFPq5JBK390bW5Iwh/D59pQBncwsYHS8xQzuTP6oBZr4b1UmLxYNO7y?=
 =?us-ascii?Q?tDABN94tiwDLqQVweFmTrUIzeCjT4GCvzzXHodytI4oPz4KDZNl2ObrvaKzq?=
 =?us-ascii?Q?wf2vJaNqtDLb0tkC6P0CqGlyayRT5hKaKiPnYR+dHFOm4vQgZyGR8ivZju+k?=
 =?us-ascii?Q?nbWW51jfCEuuaqDwff95mn1hRYROAuNIWyc2upPHewAjzclr9jt1Lt2heeZs?=
 =?us-ascii?Q?avw4rFRCP6x8MaIb6e23WirXX6b2+tr/vHZPZmTXvL5LDhUcfchjLLBN1uMl?=
 =?us-ascii?Q?76ppRcAaPINpkK2rytz9LcJhp9tJyn03jJ24URmmK5SzvHTGLPz8XNRZfzuI?=
 =?us-ascii?Q?P9N3M01lnXLPnAl3arUAPCPvCIacX5V53jqc7FKXwrQ6yuC+jy5RqnBuSEP2?=
 =?us-ascii?Q?zVHvzgpHDg+K9B9CHqipRSCYrFC+sWN9Rr/af4ONDygyOihi8tRQXFYEbOWF?=
 =?us-ascii?Q?1jSSGQeQVq1QrHfz3wTd3xQwva6Yc66RC3OAo9j6g4tFJPoWvQqLDB2yw4oI?=
 =?us-ascii?Q?9gCMaLlHT/rKR/B8j+EDfWZM4H9ewoVZEmEPm9NilqgxY7A8KdF22kKuJ2eB?=
 =?us-ascii?Q?mg7aX87HepaEFkA1g9rkUjKCcLMDs2wA1UurqIkaDgeHlxNOD2n+NMsMggyz?=
 =?us-ascii?Q?q9qhrR76eQRpngFmTm/yrdj1v3qmxjGSoAQ7Bp0MJn931OoUlOY8+qA16zht?=
 =?us-ascii?Q?gZa9v575kc5FLNjwOmWKLsSV8m3yymkrABGNShz3GozLsw3AKyR60uJnNCFF?=
 =?us-ascii?Q?KCPHwgWlpBgiaF+kST6VpIulYw2ZS8ZiqiI8gk9bMVpMXeK92g7enjnoX6gU?=
 =?us-ascii?Q?KrlVWtlobhml4skIAH7v9h01o4gfXHNxlbfW9hDXOxVbGRWUuEKqKvdIML3j?=
 =?us-ascii?Q?pqGrsrg8zF5FFmXefZq6FQP5XRq9UZDpZO8FvLFxbmrBGSahLXIxIYVPKQaQ?=
 =?us-ascii?Q?oDwXhcMjfiY10Ff/lr4ZZgUNT1ViAmXVhvtDfqDthIWttsBKAPpn/JTaGmg+?=
 =?us-ascii?Q?xg/GZBmMpV04s+qWvQBACIbBkurdQ6XSw3g5ospcmHnUHz8KwHtDizSHZImX?=
 =?us-ascii?Q?EtP9JG2l9z+WDaio9DsAQKZ7txRZ/MyLUVp8oXg5Jr1lEkdJVQFIyotfHPsV?=
 =?us-ascii?Q?7OUprL/y8Z80pUUckCjMk6STAwX9/J8/2TfprLQsg5wuTF5nQ6VG42l4SX44?=
 =?us-ascii?Q?IDIKfPCBTVkXh74p4bZaTyOB09rGTmDlk8XD1Lv35acbWRtz29M9galUqKmx?=
 =?us-ascii?Q?89o1U6gaCDK/nJz5kEQ7+AYdsWuzpBZDF0bxxCWjyiKsVkDKJ+g0qZfooAiA?=
 =?us-ascii?Q?Ai5SM7gpDFbTVOu2LKP/XMJ1VR9UWf17x6+Nt17vfp6U8/2yN0y2aBfGWcv1?=
 =?us-ascii?Q?JmIE7Cuqvp1h/tO+VOby84rVNweEVKfB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FMt7hJqYmoVNLyXENrqR/DOuf4iDPs52+IqacU6CYAa5+i0ooh015R9K7EU+?=
 =?us-ascii?Q?dPRs2dcBm8KJmEfMDW6a2zEQqVbhog92Fv1vbf6KqY5q9gm7ilJa79Y8yz8E?=
 =?us-ascii?Q?Po4Mw5bIljBCNchHiPduvCunhMoyi82mDrlINoDY1Cs3v+4lvPFtn0u1QF12?=
 =?us-ascii?Q?snR5OtfaKj8Opq8veFO4UL1E6sO0kXTUJGaOVn6a5u/NQU1Bco0fOLCa6KQG?=
 =?us-ascii?Q?PUp6RsChHl39rkvBxJrZF/qtTquYUcwgWhQmy7y7XmMZaHnK8XzCrpgAl2/a?=
 =?us-ascii?Q?Bio6vKyna7jUXtiEH7bToTy0c6boapCjURTwB+qbNKqg65EGchK0q8L5m3O1?=
 =?us-ascii?Q?eJq02ZlPR2W0L00c9obI77O8xQi+PHZq2+ldtUVY6J2y39QOvwfwxyvsZqxd?=
 =?us-ascii?Q?D7j9gcb7021XuYqtF1D7MmAyP/Od3Sp67zYy7QngLR4u7u5LPPQ9tofpYJ+W?=
 =?us-ascii?Q?6GoWUOWp559x7beQc8dqP3eSE4I532Rd1l7D0NZ82P4ztZ1AgC6+/Vc0CTWg?=
 =?us-ascii?Q?VN1U/gkpM2oD70VjuhgGH/Qog2JMUL0KM7GqV4ZA1cRdE5jZf0heh9942xbQ?=
 =?us-ascii?Q?nT926LYk+Btkg4+Oyl3j9T4/Ko3W+oo4TiWx8ywJTbnhJ1vGBhIdYSmcLC+z?=
 =?us-ascii?Q?v34SqzxdgP0BSpZjk2ReMSrdfDYgiQruuOxGOb/enl/3tjEbpzQLekU0v3yQ?=
 =?us-ascii?Q?Dqco4atGNIK10qSF4HbBbVqYunmtThdN7UTIvdqnoR0xMVCbF3lGPy1sIWaZ?=
 =?us-ascii?Q?tQ4cC6fd8h6qgI+ce3nGfOrGUha3LvCqGC69lyzXmm8tJpt/NA+1ZC5WGO25?=
 =?us-ascii?Q?FaSzIiii+PMNb73uH1lIfypOhLqqilbHhkvuIRJaOYbugMaPUPPkXwkUtF1K?=
 =?us-ascii?Q?lfHNQHnTMdHiFPRdo4OYGsJdN6XPG7mV6CT2v2m+yX5QwtbWQ+KjPj0LCe84?=
 =?us-ascii?Q?QEgQgKncFE5euHphcjK2ZKRoktyXxbDEJBf+ddjVGR41EqYPjaCfi/GNeF4G?=
 =?us-ascii?Q?aoZNi+7qSnJjmEvl6rnaN23kmrz3aTcLMmt9PYJFHRpLQ1LkS+C4Ld+RGNaT?=
 =?us-ascii?Q?agIBxNtSLFprZ0z56uPHQ+DNFf4YWxTdTu38rYxR10gAD8S3sQHPTNPEufXA?=
 =?us-ascii?Q?FKQLWvKjbe9eozmeeTpwGqRmg+nq0u282GcdcopUZADAEfCuojmz9CSPFcqY?=
 =?us-ascii?Q?QWNui7Qhio30c0ISuRZY7DXjxkxrgSixEHGpymK+JNNBWJda27zqRr6XYlFN?=
 =?us-ascii?Q?2pQZMgpRi4LQ1d1WaTStoBP2T3nulON2jTBoB2Fpm/YbZ2uT84gu/kmcpmw3?=
 =?us-ascii?Q?pMUyKDtnghq6zJJRYjOiE6ITglb5np2FDD6XuFnMnNI016fQ5nYfRnS/ZP0N?=
 =?us-ascii?Q?1A/hmE8aTlsNdjyApZFLNA3gFH/CoPIOxWP4Vsu1elijTp0pAROtvylu4dFJ?=
 =?us-ascii?Q?qdNaipLTYqgaNNl08c+DkB3/HSL5Tci6m8QFNSrdY943jK9nQjEsrMmlYP4U?=
 =?us-ascii?Q?KL6RCPBe1exapwBhEh9Gsx1O6STL8H/K3+igZdwMyO6oZ3qqMH9f8UPYZmZK?=
 =?us-ascii?Q?iNlSii0HIs7wKl/OU6w=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2c6507-e867-48d5-c797-08de0295b805
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:58:39.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw704Lby03+lcXU7De56vytxXA/PSUKALMu9a6yDcBOwfprjgLuuuqjHwqlOawNy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9585
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:27PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Use physical address directly in DMA mapping flow.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vdpa/vdpa_user/iova_domain.c | 11 +++++------
>  drivers/vdpa/vdpa_user/iova_domain.h |  8 ++++----
>  drivers/vdpa/vdpa_user/vduse_dev.c   | 18 ++++++++++--------
>  3 files changed, 19 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

