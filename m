Return-Path: <linuxppc-dev+bounces-16956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHv7ErF/l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D32162C08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:25:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5xn1PjPz2xQB;
	Fri, 20 Feb 2026 08:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524886;
	cv=pass; b=QGF92ghqccnvyIanw9GlTCGhVrJh+jY3VPGI/9UcfRJCSaw3CU2H9bDrY4togXWI2HTEXeiINKK0NRN3tJjVQPZ7AfojD+arKERx52MGJAhpbO4+Bt6kJP7hEFsLvfmfnZhKUF3/TYh7+lND/SpkA1vjX8xsQG5p0iQVnD1mQ5i6MFK7MbtWj67T5h0R9QNQhW5GSEWTks7ikqVyZzWSjr4LaHGcRfSSp27T0MluP+gzlmVyJgu7Fqh525opEfxVTJoxAFa7DA8jjq4L/tR32cCgUj3HzI+4FpSilm6ZNIyon/1ESZPDIngnZraEotx//nKW1V40tFXXCkecyETCTA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524886; c=relaxed/relaxed;
	bh=MjsnQgFi33SN6Kr7EqRfoUgvMmh4bPMME5RXOuJe0W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O/fQcCBy3ovds9BUU1/qdUespgGa+jFszLrUN6Jd0I6rjhJAEr8u2MQm4+TdEDxaLtwqwyaQxq9UXiw7IwSdVPW4NDt7gv/9oEnEkjQUOIHhkrzvoY99bVbAVG3NmltkQpu+7NrQCYypIUrLo0gMw+ijdL+FwxsWHhcoRR+xhBLDDknU5m1+WCBERrwRHsRTdNVj3qp9hGkxc/bxGF3Y5nUzbLVUULiOvEs4Ez3qcxXWlye9ZZS42uT6tthnSeoVFK1u4HTh20/Bu5OfL4Ta7XqI2ZGbq3Jp60TV/eLqHMByZp5xaDwNNQAmrTE5xxTwg32QACz1O1CLefy5XlmW1A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iBPpa7RB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iBPpa7RB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kF5qbFz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:14:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgxRRM37Jy+zLIKYgV7OujhysWjJpFMh9t9AplPwHMjOYwP6zTEHsQ6CiyLhQCF70C3fcOURu5ILzxGReSNltvcF7bmkumDYF8iftTE1OqWuYPeGoCfMb/AhW3QCy2ZnBBRf5WOoXIsi5CDlVMLw11l4uE5vcfcsKj1Xvtk2Q+o+bd9tKDogme1wRVIbKHHu/KGp/fkxr40w/nEVkGVKJ9J7m48+S5xLgBjvuOn4Y8zAlx7OwdS5eNpBlU62s0b5YqAFrKJQ8mek7U9JYuHtHBi2no8qW3J/BTY/MBmnxEcKJvRjm+mrgHktH8pC0r4d4iLrjjcyvzHLAtvKa8NaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjsnQgFi33SN6Kr7EqRfoUgvMmh4bPMME5RXOuJe0W8=;
 b=pmlUgT9t1ZFRlXOJ80W11iJPQQt/Vm4B690U1ZxUtPMeEPuN1V//2RGmIyks4taT5uPbTGmyFWFknSNzQpS6Fhz8rCHiziumgMcq7ycJCSzLhEI4XJUHcHve367DCQ5c326mYBt6YDozNEF+qAL3QPlVyf6wlTWruGFNbQZySFM4LlA8J1t8ygDjboB0q7KtwenyNbYYkcsY+RuSL03Mc5iFIee2bTqnTJzlGjdnC5bVVUp8Ks3CW58HOjuYX17W86LY0njqDwY6z/ShlVIud07kQvwgkafs4LU87/Lw7HlMW4rMXBsB7spiK4hZMoHjFz51XJhME8XpBEAo1z8r/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjsnQgFi33SN6Kr7EqRfoUgvMmh4bPMME5RXOuJe0W8=;
 b=iBPpa7RBkH9Rso/HCcp6ocy1RVfvhWrp46kq0ptLV4ILt++Y8/137PZbGBbA38D800Ca+C4WP8bBoX8O7v/LUGFuxjVmC7lKzlHeFxSnNZW8bCCT0iKuGRubPRtX+Nu9y76Rg7rTzXMLp3i0MjFLHKqD8+95d0s7ruWIP7Nxwk920ohbeTabUWKIJD7UsqVfovwkIzdKQ3upR4KLGym84s6ogI1v9R/PczhW9GX/mYn/Ni1jwNjPcfRYzuZVHtMMvwTUPeBUJF5qJjaTsvq7oIQxDG46gCJCi9mKL4djKqBvOxJfsXPpgQ7j83d99n66kfmd/1NLLD6gG6lnacYOCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:15 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:15 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 02/12] octeontx2-af: siplify rvu_debugfs
Date: Thu, 19 Feb 2026 13:13:54 -0500
Message-ID: <20260219181407.290201-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0759.namprd03.prod.outlook.com
 (2603:10b6:408:13a::14) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e6c1ccf-0029-4039-c729-08de6fe2b0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ed7La9BCz8yF1P5mXNOlSDbthprmiA1kHh9w0d5F8cGvnyHs2Fnv64A+kQvG?=
 =?us-ascii?Q?VFq7lNzxyuREzV51UgwNvRY9gRsOClLulRbyn4aZvnrD9bvx13JeMLX3XqGe?=
 =?us-ascii?Q?r5AP/m5zKEyzDRi1ujoao/ot4C399IDWbix+2DOk8GZ3US8O/UQQQxMERPWf?=
 =?us-ascii?Q?KPR8qSNTbA86R8NBUR0fjuitPQ5LOxi5q28yjOFjPdAbpEyfYShNMkMMjfCC?=
 =?us-ascii?Q?WtQ956X+hZi42A6gwTLjztqMQXEfciOQEJ40NjtU8C0wzE+7cGnePa2TUjg4?=
 =?us-ascii?Q?Xc54U+lzTYHhghDb0pPqySs2dQ0XLHRCJFvT086bh1pT3GtyFvCs+6QDUtRz?=
 =?us-ascii?Q?+yzpOVQym0sR0zO3j4+jpWTP3UTBLbURwKqM8bt8RvnR2FZD0Q/6iiObzd1e?=
 =?us-ascii?Q?phSCxJueQBLcfx/ZcUOfrlIE5FyCkJOHba8O4l6er+RAyZZpfn2aqafaOBF5?=
 =?us-ascii?Q?j8NdGF+JvakLy4bCHbud2s0LhGHu486W7KlfdPQg5SENBm4ofpSBSacCGJpI?=
 =?us-ascii?Q?Xo4pMqvzMPFhhoEeBlW2tP8TFuAR8+VXiZL7QbmmrysmSeeTf6TKwQIeP4Lk?=
 =?us-ascii?Q?V4NED+ypmhMo6hABXjtT5EdgE1fHPFUzU2Te8kOUGAR/l9GqHgara0v1uoX9?=
 =?us-ascii?Q?yRl7umskt7HbnSNrqNpFZRYOZb6k2UTJBY7Q5Q36dla7dWFA8r4PgczmIk3Y?=
 =?us-ascii?Q?gGRGVQ+Cdm4YJt2iKXgpKZ2HCLX2jL/+z2v4hy7M+3BxtYGf6BOsrDeyJLdP?=
 =?us-ascii?Q?SCZ7lMVmfjVFJLzvUUVMiMoL3vUdi6wFy65kzNFJfn0DnPt2KxJFSjm9g6ZS?=
 =?us-ascii?Q?+arQu8Hi9HuUa5sAWuDm4UTg3Ts78woyz2fHILk61ZTjUJGCJaGFT1+bTU3f?=
 =?us-ascii?Q?JvWnDfxVBt9ItmCjb3Pr2I6IvOgD3mLv4TKXrBORHlEbp6xTjSU6qJBNd8er?=
 =?us-ascii?Q?DEM1VGKoYmwHPzYkZjpJx0VyU+BdI3tiz9nFNoqrT1CsH88lkEO7/juUbXdS?=
 =?us-ascii?Q?yDrglAcjds7bVeFiGjHgex3dF6N11zUJcQXfMNDnNXxAzGNALIJnsZFnFVJK?=
 =?us-ascii?Q?jbu9IJ0aoHszTRf9uDDkPa6rssSl09IPY8ULC4cnenHe5fvuj0btB14dMvrZ?=
 =?us-ascii?Q?SVlxLwaxkpLpfag+goIKt/lJ3wIVLNZqSiKFP/lHwM8cE2L6ZNpIlcBKlqiz?=
 =?us-ascii?Q?TCpvN1qHqH9Arg0gVpkTWhfQZrS6M+cIsM+ZmWIL98j9X6CNP+W8tP12VbqT?=
 =?us-ascii?Q?8C5DVdysnXqzTfX5hAoakJVvM3SW6+3OlnFzQYv12NEGqqbeU6b0SM3560p0?=
 =?us-ascii?Q?VQxwcC5nt6btjUSPGoyPdxnNozggYD5kUryJ1fdf6JjDykm+nF6ZoL64o6Sx?=
 =?us-ascii?Q?LafhPypAR5nB9iVct64TYbtCTZ9odtDUElttklEY2ZyLVLxEtyKKPSZ7rQ/w?=
 =?us-ascii?Q?ldIRs8xcHs85OVx8yhZ3q4HsuQG5lb/zgnpbXqu4yKAJw2tM0gBTnZHQqJ0X?=
 =?us-ascii?Q?Qcobhtk3BiZ+zWRHA4h6RykSB2aC0uouM1Owa0PKJlF1bjffF0mWjH2NjzO5?=
 =?us-ascii?Q?CSY9JIDoxf7PMYpBfbT2FzWVSeMZvUg02WiH0dQyWvfQwyHO9Bo4MjYeu4lI?=
 =?us-ascii?Q?xA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bu/X4XD7/rURwICvOTzHbudbxhzeauMXlcUfO5ui0vuKP6JMK+q7jYtar6LX?=
 =?us-ascii?Q?TKSAmsMP1tw6ri9jR6Q/kjz7Zs2hphvNdPJmg7i9OXCgyZCCAhP/Bc5iDcry?=
 =?us-ascii?Q?hMon4Q4tBKHk6uwtGyK6csuTDXKgg0muX1rBvuciXg3/KBU6gLfN4bbDilgo?=
 =?us-ascii?Q?64dU0XRCWB+ExyFnkkEiyuDGFVh87BdEmx6MnCMo+qnVl2R9T9RL9mOxZAar?=
 =?us-ascii?Q?bKhj6d434NW2AW1DQcgakzrJuT3gPvRNaP/aAkU9Ys25p1e2pUuTvt/X5Nhg?=
 =?us-ascii?Q?rLv/QB/4urg19+77BtB2SG7oVEVopneIzngxbFH51r9jAzcTlI0V0+fiOjsx?=
 =?us-ascii?Q?znBTDnZE+s+8KPm99YmV1goarr5SngNxggzotCPdzmcsdfS8qUZv/dU0sWFN?=
 =?us-ascii?Q?o1y8qrGOLez07cA5jJCz5iNsPNaxFgucOg7IZrvefmid0W8JVHSEruKJsfyu?=
 =?us-ascii?Q?WAUy34R+ZFnkbG2VBvaB7Y9Sx2OYrtRhCUzn96/hy7515hAILGCVq8+/Sgux?=
 =?us-ascii?Q?VLGKOTwU4NYqKkIYQiuKKtrbOI4vfXclCip/zfz/qDqLXoTvND8TG5v4zOU9?=
 =?us-ascii?Q?64MH01Dacv6N40OFeqWSvnP80DvZN+czEMK/Tu3ZYgIsiVJJknkazzpcElku?=
 =?us-ascii?Q?HtB7+m7QfLCWwgObtYbYDzseagTR02FGzS6shYwyzin+RlE7odrKSydswMmN?=
 =?us-ascii?Q?efDVWH6ldsddGpgdntfglYnQwP6qxf4cmVxCDtuReQae2HL3HKltp5YIyJOT?=
 =?us-ascii?Q?JWHjmm2xQ/bqy6895x5pOZG1sKw3wJ/3ZNQobGvtMKlSTjJuD6L/GQnYYTT0?=
 =?us-ascii?Q?T4X73EOX4LZ9T9IDq75Iit65SxFRUH04Eg/FOpFh2NmIDCmDfGaKSqLsnKWQ?=
 =?us-ascii?Q?JBOuspKr62JRahaytfmOxnxS2tQvWHHYroruSCRb711l75oKhv8sMEdcveAT?=
 =?us-ascii?Q?zhS6Oyp+81aOgTspFIUpPwBeCO6pw9x0xAPm2VBfn9kDlxTxFzc2j8NW64tl?=
 =?us-ascii?Q?WmPNyFfo1A+7ZdE7IlinZuQlvaSSbEW9+jQBZaqcdO+D0eYd+7TnvJoZedQ6?=
 =?us-ascii?Q?Wodf2P9ttRUapJKaDKF5DUWG+PGWpqw9d9T5ZA45w/OLiZYGAc0/U1v/MZAt?=
 =?us-ascii?Q?j57c7pnUb7LCAGm01iiF5T0X/TmKgHD7g3+SL39HXhbl3kQTA/VIN+PN7nvV?=
 =?us-ascii?Q?EEXJlr+8jgX0+OSPdLGhz74KiONW+00bjk+wz465yQmM82xcUkA3O8JtgeDz?=
 =?us-ascii?Q?qyyis5HmaUv4ShhlXKWymOY01v4r51HYFe87Vm3X3C2RBF8B5Kh+xp27hhKt?=
 =?us-ascii?Q?nOXyD4OzFuEMQJkKF/xeboRje+VjWr/LIpmXc6CSBv4mmMQZnuQovIYGC0RK?=
 =?us-ascii?Q?CInrgHWQUQUB6YaZlSDigwi9DVfvhtrbe9ntXuF6tbQxaF1oqGxOJDKqTjLi?=
 =?us-ascii?Q?LHAGx1zR28qlSvr4zQ4qrQW8i2uG2yGgxBNiL0ZYOcCrZcGjPhZx8eZWI4/R?=
 =?us-ascii?Q?hrVJ8cry2F3ucFDGcfV6q4PDca1NByaiN3lxc1E7zsguk6taPeNRsi6iZ4DI?=
 =?us-ascii?Q?pOrEmI+lVYU34EcWi1PetUaK7KzW0W83A2XPOeVy3wiUPUsgNHXLl/4+Xtd7?=
 =?us-ascii?Q?YvO2FLDP2DkqYcXLouwxPkkhLwdTFAVugFR8mY3Mlsn+pr/sZyJ98gwq0MQZ?=
 =?us-ascii?Q?7zLfXQ7vodVdOXBSfRNxGEfxGH7Xxq77mecqOOpCNZlcYtGVliJqYEPan+O4?=
 =?us-ascii?Q?a86X23TCud41SAKLqsDl0+xHQR4ZPwwLUV4Ab+Vg6xpsAqVEYYdO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e6c1ccf-0029-4039-c729-08de6fe2b0b0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:15.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PcZVAPhuvEz9tP1n5RS3rnFXlIA15+fjt+bwacpgdC+zte0/o0WNtdFqJGzbSiAXdfChmraMVYmflYCCIQ4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16956-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 56D32162C08
X-Rspamd-Action: no action

The driver uses bitmap_print_to_pagebuf() to store human-readable
bitmaps representations in a temporary buffers; and then feed
seq_printf() with it.

Switch to using seq_printf("%*pb") directly and drop intermediate
buffer.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 .../marvell/octeontx2/af/rvu_debugfs.c        | 28 ++++---------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
index 15d3cb0b9da6..93039feace4f 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
@@ -960,30 +960,21 @@ static bool rvu_dbg_is_valid_lf(struct rvu *rvu, int blkaddr, int lf,
 
 static void print_npa_qsize(struct seq_file *m, struct rvu_pfvf *pfvf)
 {
-	char *buf;
-
-	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return;
-
 	if (!pfvf->aura_ctx) {
 		seq_puts(m, "Aura context is not initialized\n");
 	} else {
-		bitmap_print_to_pagebuf(false, buf, pfvf->aura_bmap,
-					pfvf->aura_ctx->qsize);
 		seq_printf(m, "Aura count : %d\n", pfvf->aura_ctx->qsize);
-		seq_printf(m, "Aura context ena/dis bitmap : %s\n", buf);
+		seq_printf(m, "Aura context ena/dis bitmap : %*pb\n",
+			   pfvf->aura_ctx->qsize, pfvf->aura_bmap);
 	}
 
 	if (!pfvf->pool_ctx) {
 		seq_puts(m, "Pool context is not initialized\n");
 	} else {
-		bitmap_print_to_pagebuf(false, buf, pfvf->pool_bmap,
-					pfvf->pool_ctx->qsize);
 		seq_printf(m, "Pool count : %d\n", pfvf->pool_ctx->qsize);
-		seq_printf(m, "Pool context ena/dis bitmap : %s\n", buf);
+		seq_printf(m, "Pool context ena/dis bitmap : %*pb\n",
+			   pfvf->aura_ctx->qsize, pfvf->aura_bmap);
 	}
-	kfree(buf);
 }
 
 /* The 'qsize' entry dumps current Aura/Pool context Qsize
@@ -2545,17 +2536,8 @@ RVU_DEBUG_SEQ_FOPS(nix_cq_ctx, nix_cq_ctx_display, nix_cq_ctx_write);
 static void print_nix_qctx_qsize(struct seq_file *filp, int qsize,
 				 unsigned long *bmap, char *qtype)
 {
-	char *buf;
-
-	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return;
-
-	bitmap_print_to_pagebuf(false, buf, bmap, qsize);
 	seq_printf(filp, "%s context count : %d\n", qtype, qsize);
-	seq_printf(filp, "%s context ena/dis bitmap : %s\n",
-		   qtype, buf);
-	kfree(buf);
+	seq_printf(filp, "%s context ena/dis bitmap : %*pb\n", qtype, qsize, bmap);
 }
 
 static void print_nix_qsize(struct seq_file *filp, struct rvu_pfvf *pfvf)
-- 
2.43.0


