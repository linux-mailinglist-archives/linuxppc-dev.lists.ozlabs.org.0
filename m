Return-Path: <linuxppc-dev+bounces-4950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D2A0876A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:04:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrg82Ptdz3cBx;
	Fri, 10 Jan 2025 17:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::617" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488996;
	cv=pass; b=HXikOzl6EfCqI9oRoty90utUt8CMqk6EgrLD5lPsS2PMdPLPqNnNSkRdjKhFVT8lp0s7zuu2qseRhdodrj0s/F/RREdR6sxTpFGV5oN9fL7wAzLRTSH/mmkktf+s+EJWOmaMaz2/xMjwqBaCOxk1hP2/uRCqrAlU0QOjKYBsAHhBsdtYj0gtb7kVlZie0hTeDo1FghhWjpCPn6M7IatXaI+HsfFLj2JA4ba8yQ37q9zWlxbIQf0Fln0Eq+6/uLpXZJrH8xh3434gCSSKUHJ30Alrm417A+J+O9qrbfXPco8ZdjxFpeFOUR36fVwTg4ISwPRZkc4urUOjPFdWnMuhNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488996; c=relaxed/relaxed;
	bh=XvFcZCSCKcpqUQ54gxypRLCdDBXUc+Lz/TVUpjcAZiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gwkNohLQl6YhdBOo57r/IA20FeJzMfQyoWYUM0m0WG/Tz9BVNlu/pQf0zOe+nP65oYAmCwXS2KpM1QPKl4hzDwJZrj91oRWoNXw+CiqP3/afl1ZAatulFUUSZrxXk1YjBuJCuDpI0VzgPNhkkM3SruibDeOcla0Z4OdlBn1hRGOZ1PBXfUIClf1akFAFzsUA8VMuNFlR1ofGJFoW4R4+ulPv5g5z0MRvd0ir6rfSzHRc5np0NYdgYK9sfe1DkFHkTCxVwi+wYE17NmMRL14/YuDMHWQhuzHdnTjEHzqIlJ0P7dx2Iltd0sdGaj1TkRbTDC7KvKHFDg6uOa1F+iw4Og==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UgLDriv9; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::617; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UgLDriv9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2413::617; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20617.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::617])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrg75SGlz3c7b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:03:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os0j4QQ9AVHD3pIManHjassG3FqG0GNCb/Ku8DlBVKUexQi8eYH2PuIYRsqauR7xJVKywVoXRPEVMN5JRNer3jHzbcFhCDOymkK4BtTPHAyuCMNnYWOKCtmqZ2UwjxhNkFMRLg4iyc/NmxL49KGZciWDfaIds8yKwqnS703v2igc6xcSWH0jErLF6TGCRyzmdrubdDj96IyB/5LvTSfaDYwrE5x8xX+E61xbuR+CpC0EdaWE9HdaF7aYb8jpeUiZrpi7Os2/I2uP1UgzKU8iKuLpFqCF9NGrmPUMoOlD2Www1drmYwPewFivmJQnXpSnaVXt95XXgPYkgEJPe7j9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvFcZCSCKcpqUQ54gxypRLCdDBXUc+Lz/TVUpjcAZiQ=;
 b=Tl9dUe6S6Veh3DXb4l0UrA985PTlyK5ieSH7ltckscoeFl+9i09ev6qYVZ1dS2o9GtUyGT0/4nDe/5ujSPmH3tIOqWBPWNtNzNiqZ0Cx20JMpn/+0bt7mkC+mY11+cILbXR0yZC25pVz9+//WHo9kEFZpTtiMddYc1TKiPrA0EPT/vJO2Qi9N82mSMOaXPH0cE6uDMFOEe4at25AzTxiWZmsjyf2Ck0rXngBQ7hsI2ggPTHILcZrjGx1OFZJNpc8mdbYUIjED6SSwMeHCnqxpM6QJDpkTYzAFJJpO7b7VHmIWshX/hePYyfDfOg6sEcKFdo0RDeVUZyWBGEvSk0Klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvFcZCSCKcpqUQ54gxypRLCdDBXUc+Lz/TVUpjcAZiQ=;
 b=UgLDriv9nCvZ2Wi1DRqHranyCDqSB9FfjRiLaCzRCHdxNMAS+JGoLhYLRpU9Tzm5e2an205RRcYTX8aWF19FvH/R9/wdGyVGiu9niS4FNiJjcSYL2tmWzu/iGyqakwdbKdGqYg5ytGjbeeie7LqjJTM/bW2iGdODIqGJfZJjZMoa5wuiBiyldLTErYXA1uNYUWRGkRHnGFtgikzqcF7ru1euh0RcveMJCgedml/VkBMjV40WXz2uaLTC0aJMnKj2ZYgToCgIhTq2gDGglte41a3iYnHMXcllBugLbd4GlxLyhPk2FikAoIoKX7wx4Qauz5W4TNheYncleOodzzynUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:02:58 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:02:58 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: alison.schofield@intel.com,
	Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Subject: [PATCH v6 19/26] proc/task_mmu: Mark devdax and fsdax pages as always unpinned
Date: Fri, 10 Jan 2025 17:00:47 +1100
Message-ID: <d7a6c9822ddc945daaf4f9db34d3f2b1c0454447.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0022.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 456f7415-3a4c-4d56-0d10-08dd313c6f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pJnuwXBuF/7HAFkP/p39Hn3UsYnbbfdowcFCWovW1DjPxy+Klq2M2WBYgHl+?=
 =?us-ascii?Q?Lv7TXkIwGBR2mQGE2JKuR/JyVMbPbHO2spguE50xpjNhfDkbdHAAp6Mb9mlL?=
 =?us-ascii?Q?8OflNeYdVkTNsIW3velfoLnxKV53MjeV/L0muz3LqtS0E2qNsJBqziY/b+ki?=
 =?us-ascii?Q?Yw1gP0ZHPdmHxZeoNoDrKeNGIBK3yJ+zNsbj8Vq1IkuWsd83r0ztYAGGIq97?=
 =?us-ascii?Q?W4j6kyN63e4Jeh3j5YZBEoqZMzRe0TavnSlfsJXf5koO5ua+w0zutlcjNQvh?=
 =?us-ascii?Q?rNSDvhaYp5YPd64J44wzY82CwHtda/jC8nKPRNVxd//n2KWdcMUh4xikUk8r?=
 =?us-ascii?Q?dmzt1ryLZ1sp5dI9VpJCXdySQ9+FY3jEgRNeaOi2E93LiQfsNMHqv9l571kg?=
 =?us-ascii?Q?04xsx1ZbpkK37Ql4utq22x2IexPWe39looKaPWHdeUgvy6kz1icXNvUWnAe1?=
 =?us-ascii?Q?Of+dfcEapxqL4dV60P1DCIEZdeABMVpMdgKWNY0l456N+UU0eHsxdMtVaGTF?=
 =?us-ascii?Q?uM3FrToE0j5z29GkDXQ8zPCngS6V6kpPDPALS9qo1oLZ+R5m5dBLPtfjMcl4?=
 =?us-ascii?Q?RrxubY2//ZTtvRC77sMOACRM70ffGGIRsQwhObdaMixrvovvE4rn3VpsjBrJ?=
 =?us-ascii?Q?njdxylsopy0RK9I3TGLky5trYGrXzcMYb3u9yM4LIn8KKDFq+72rS9OlgNds?=
 =?us-ascii?Q?KJYIbQ10RBWhTpzcl4iPayETXlZwJOa8tb4o078GN7j2DHltTaAxRMgj6kzJ?=
 =?us-ascii?Q?TYBxVIDGKpkFKl8C7yYUtpvytPCQkspHcTbZLrOa+JZioNP/HsfZZ8cAY/7R?=
 =?us-ascii?Q?CGHTLpdzAVhb0ZyD19jrexYwqVcoJl5ng93GTtlZ+gjC1HCY6HDljni19qcY?=
 =?us-ascii?Q?WidO27wk1WVRhUa5kaja9/dT5nrHFIItaLU8yV08h3du3NPMeCvgiN3ml0P4?=
 =?us-ascii?Q?y5t95ixgKsIJCpqq7cX8ENid8CX74buWf/cFatrdW7Yq3wv6/Q7goqFeMw5i?=
 =?us-ascii?Q?gycjz/VWFqcnmYUVpLtEkm014Jx+7UPliLOt766IrC5XOve/dsdh1McWqZIX?=
 =?us-ascii?Q?3Q8TMns2Wgk4zwpu1vjTOMeRA2D2O0UU0iFt8WvPJJ+rLgGbS1SRFkbJmmJc?=
 =?us-ascii?Q?zPW/u3uYuNCvbJRqMXUCIjy7cm/YczjmJSZhFXL8BRBFPJ/zgiCdzXnoeOUw?=
 =?us-ascii?Q?0LTut522AkULrE7Rbt6SFx6IAzi92glax+eJmVKH6lOxscflYgPsF3fROPT7?=
 =?us-ascii?Q?nliuNComm3tHLD/Uq8yPhN8VRh5kc/6N6JHklpY3IbOO8UEXvYiwbjxDOxHW?=
 =?us-ascii?Q?hI3Qmjlb7NXF4dms2YuvIJ+QrzEB6JrGrxKonqRQ4UEd/G6CrbdbD/gabCrS?=
 =?us-ascii?Q?HkOmd07aXn0D+oIel/L8ZOlBs4qy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/G5kQu/rWqQRdtzAGzszb69dvat5O+2SVsPRaiQcw/WTDICZZqGpBfMBL7EN?=
 =?us-ascii?Q?3UPrd5TJT89+lQtgZgAlGw/Z5fhDQvgugCKL+wPxZ3/CDFQqsEJMFHDwZq0m?=
 =?us-ascii?Q?kLbQ+STSxGv7cc59MpjW7qyZPNyjSjOECW+xlfG0SRWk5Ge17ePcOplJosZP?=
 =?us-ascii?Q?MBGwxF+EYhaW4vBgXRd684Rv105+i6fS3Yk8aPeyqwMw+WgPmJ2AefxWzgVG?=
 =?us-ascii?Q?ntEDVjH+raLP5Tt6z24pw/hKJhqogNU6QHwOJxG0KIcCRSr1dmsCF0VdFx5x?=
 =?us-ascii?Q?/I8yWNGvZ9rYspSHZLcYskqtKN+VT0dRSjhpbBxE+s2KfYXLRKwxedyn+adj?=
 =?us-ascii?Q?ZtopgO3n4FPFTlfqpGvGC9BDInbVFk18p3/fgNoqBkXVu3WwdPPi4gm+SUqR?=
 =?us-ascii?Q?0v8zcKSvlUuZIOlxYX90rtXJQTZ7dxPalz1kKMvX79rTthG9L/lTe8ULnpFB?=
 =?us-ascii?Q?e385Cu3mJVC/oi5DsB/Ux8FmswRSPMUhPC9qtMRmB18Ygdme9GhXTwlxVx0D?=
 =?us-ascii?Q?BGr10xOaVnS2Ssjgu05DHUbI3oFiDIwGOfCbs34U/wivGPohxEFD2yEIm4GM?=
 =?us-ascii?Q?rFdgBMqFm7sz9qSanhx+bUcR9VOL0/1TuQwLUeFLrPAQJAUPreCwoFcHqcha?=
 =?us-ascii?Q?SLp5/UzQYs3sxtOA3Sn/niG9ZOg1U7LpFu8WwACsC+d8omS8f8/WFHTtlik1?=
 =?us-ascii?Q?rQK1/lgdZH7q7p0LMEudlXvi5bb0CBxWmVWne/JAjLgNGFeh1LSRZGzIrw3U?=
 =?us-ascii?Q?b5PfExQQ8EMt4ZWPt6ZlJq+fHzcN1r+9IIhgxGk901uU8IxQdExxGqBur77o?=
 =?us-ascii?Q?SAYtFvujDPdTlkTxy9d4v/555cOGkpkEkJgvqPjw9r7CKhC3x4uHssonvADM?=
 =?us-ascii?Q?zF2XwPBbKJvcelz4TIYusxrnpExH3CJIUxwLQPHNUyPoneo/nDSOWanZ5hvR?=
 =?us-ascii?Q?jPUD2D1MEg0X0gUxJp96JK1KyHmi7ujjHlTwZvsrG3WFfz+qYiMVwZQB95X1?=
 =?us-ascii?Q?nMtO827mX95PG/qukxLg009x3NWY37ggkt1OMZP70IuywTUMrd5cmzU/8Lew?=
 =?us-ascii?Q?u8Siwkvu1dZGvxiZsx9Z0dX4BeDkKSJ4NbQN2+H5d12ueMEdbB0KLqKF2FXb?=
 =?us-ascii?Q?kCJaK7yTh5spVi4YkfzXnoMocrrt0fX9mHl7vN8pyRkqh9xUWEHrHxunQANG?=
 =?us-ascii?Q?zWe7aPDlurNsUQBdNN+q+0sxuJ5qn4cWCAEswrzv215P08+ASmKefvtXb3d7?=
 =?us-ascii?Q?RjWHFO/gefVkM9gKhsXDKd380Sg9pfgkOINCzX32J5srMkrrZU4aleXEFlK+?=
 =?us-ascii?Q?+4u6JvcoM5/xSv2ZpNcI6sH6X7fWClQK0+SmyjJ/qBR4JxRCF7IRfksC+Y4w?=
 =?us-ascii?Q?Vey3NlObJYC5f01xRySXFiKyxA3XftqkmAs9FoX5TAu87TJ5mE9AMA747gq+?=
 =?us-ascii?Q?VKPYPE4HbcpwIuri+M9bylu/1a9m7T+mohk3cm1jYLgvLld1fzUnQqH8lQE6?=
 =?us-ascii?Q?2ZuXNKHmZ4fOzuqyNb248ufA8MzYIBLUlaFEZvppAwVGFYw9fk+QE8b5mw5d?=
 =?us-ascii?Q?Ffu+U2QZHLORD3V2osX8hluB1MVdqmSkjxygGPoE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456f7415-3a4c-4d56-0d10-08dd313c6f04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:02:58.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cno/dOo2jInqHkixqewlGVAKXyDUOLosISXpA12oyJUhC7N2j26/5YmjPX+S2IljlOzk5X1XxVZOJOQJf65rJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The procfs mmu files such as smaps and pagemap currently ignore devdax and
fsdax pages because these pages are considered special. A future change
will start treating these as normal pages, meaning they can be exposed via
smaps and pagemap.

The only difference is that devdax and fsdax pages can never be pinned for
DMA via FOLL_LONGTERM, so add an explicit check in pte_is_pinned() to
reflect that.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:

 - After discussion with David remove the checks for DAX pages for
   smaps and pagemap walkers. This means DAX pages will now appear in
   those procfs files.
---
 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 38a5a3e..9a8a7d3 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1378,7 +1378,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
 		return false;
 	folio = vm_normal_folio(vma, addr, pte);
-	if (!folio)
+	if (!folio || folio_is_devdax(folio) || folio_is_fsdax(folio))
 		return false;
 	return folio_maybe_dma_pinned(folio);
 }
-- 
git-series 0.9.1

