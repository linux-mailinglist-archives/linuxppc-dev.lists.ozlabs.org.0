Return-Path: <linuxppc-dev+bounces-5830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F6AA27E75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 23:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yndp41wvDz2yLB;
	Wed,  5 Feb 2025 09:49:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738709340;
	cv=pass; b=RhyPtNtrYoRVosXUd48PdHKnYmvc0FDUZk59tBDI+rT8qicl4L8Lis96wAi/jnePC+s1h1k8G04KSB8sOvU0qopfmqyC+iMsR3ANHQr+STbFxD530u5YMa7Zo3strmg7XCj/EuropDBIJ2YmuOwHgF+55UF6tHg+IKAyViVzz6LYpUz/tv++6Bg1aUb0mDFIaC6y7l9+Mge2mxrsdjg5t4j6vi82829gG5Hy7QG9yG2oWThdnvX+p7X8RX0QuG/AaB+v9XYI6G5y2qv7mLeL5taZoSTzD3rGRcnehOYSFAzJ1XOY8k1HS5ziQ2l0VMfSJDZt5Xn9fkhJxG1Iyikx5g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738709340; c=relaxed/relaxed;
	bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gApepppBUd+uTAPRZOOu7NEa18M8jqImVqrpQAxATNyrh00kSZjx+mEwGVQyNDrlZSc8RWhuSNsE0vGjyp1VlaHgebYTNayXtCrR/zBtbvPqEg8PYTIgj/cvKvqtRrZRk0nVpWvw9krqLmv9pP/MADRIUDqprROEAGnHzKy+f0QEu30yg6GlUJkoPnNFdoWmd/SfUUnpqLBn4cOKhiaOUVBxUTSzzy/XFIwIYV08i3KEttN/XXG0knVAEZu7GS1B9kdowjdrYJQE+bfYRGF/321oAdc2qcyhjsBGZ8wntjh4gqcCxudu5TKd5LYvXkCSnCzZditc+sB4NJ2fZpUNzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iYXWRh0k; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::616; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iYXWRh0k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::616; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yndp34zqtz2yvq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 09:48:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igbXI7AwUY+/zcXGmse+b6AjzXtTc81D6u7pFVkVD1ZLd92Wh31E7xjoucbYrcOeRKDBjIRePmYza8SZrS1ae03dn4m4lR9BRraXU5Pwdu269S+ZJqB55+vngfKRL/Smn3DJ1Eiy3MopEOSl0zaZVmIEjL8lsOfz0jEgQCBHSIyqWdpNGP2hag12XJuUsp/ZGv5Kwq2SyaE7Gi9J+/TZpLeEPAbVMQ29I+wiirjdeppEiHjnnWbo4XJcnYkWVhCMd8OJqMb0f/soqFbFa3/qXaPok13bI9AC6/K0SxL2P7LY/SrFlBesYiGeSe7gjaUOKb8xeD7CMZyE5aI3Zvuv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=vD52Z/5IQ26a+f4d2F/wlhOpm5tEOcB4BhvzYz2tJYYwbfI6UAAuoSj0pBaEx6UgcXy/8L01wolPoh9Zphj2s4Kfdt11L2gPLmqrUiJfOLCSlE7K6eACgLZmRnr8v2KjpYGaH5gCEGZ19CnBBH6Cu1otXdMMTyfIu+t2H7oQed+dRGWDQVlNnkv+0Tk6+JWiW0Q+p39aIeXG2Kyd1NKUBrIMp1CAl0sQ2gkJWLbcRIukGz0c6O2me9enbHHrAJ31ABSInkSaDC+yLIrVssF4kp7P8K1sxU9KwhTgKaiXQaOPnzmwjDTWiDZH9vaNcTBv6hY5selNJ84TH+OFRKb0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy8qh7i3mZHDo6zytroBAIKc7I21BKCOmZX9uuIf+jc=;
 b=iYXWRh0kdopltWs0Bmv3QN7bS792gQ8iunuLfKaZm9sJOAmhWpgwEP2KV+PekTVY1J7BRCdH6s0C3TfITJeOfJjv+ro4FwHb1sMZwAWNGzuGRDOpMnodUwA3MT45QIdU1ZqR3LoryXas/ldSu1ByWkST1mCKdUR8P/ZY7ND2+eX4SUJnzxJp89OxKcyeuBZ2VyhrAL/8//i00YqaYee8O/+oyv49kMVHA6sN+uEs38eRjlmMpIBaAVABCD7lWKI07OknIQdj92XjGyE8j2DiaF4Gt9lIgTyIK3NTl+70RKpAZf5AkRxfY3IZc2L9phgSxHrj3+QBwKBs+F88ZeIgXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Tue, 4 Feb
 2025 22:48:46 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:48:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org,
	dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	Alison Schofield <alison.schofield@intel.com>,
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
Subject: [PATCH v7 02/20] fs/dax: Return unmapped busy pages from dax_layout_busy_page_range()
Date: Wed,  5 Feb 2025 09:47:59 +1100
Message-ID: <23432568750f099d32b473f64b7e35f0671d429e.1738709036.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0147.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::6) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb8d060-8c54-4588-b70d-08dd456e150e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mOEyr54a6D5XFS+w9L7gjCe4u+hot5lR8g5eit9F+Xh0+AYugKYGkjy1Qq55?=
 =?us-ascii?Q?ucL1HR+3+ROEDZECehic4Yq69XyDwRaQyUFN/PMP6KbmpSJt4p53z/8eBfzq?=
 =?us-ascii?Q?V8xR/d6sI1Lt78H7xn6j5mfzcF0l81An6cMLnyWtQp9eRV2xBwQfDyTqTIVU?=
 =?us-ascii?Q?49oZqCReK5n3v11oonv1wqEp8iYSnjGJeh4Q4DWaejw/nqTC20kK/4w2CCD1?=
 =?us-ascii?Q?4P+h311mvNkCf/IUhKrogZvkt2x0NCkqLPQNPVrh4CpwKg9DRoHEj1I0t95n?=
 =?us-ascii?Q?DBRAoFLP0VWaugKXXb2Qo1afjzLzXjVY+opaAmhKFRUusV6hOhMwMWYjvx3K?=
 =?us-ascii?Q?OEp90ZyECXUCJgPQeT7NfXDoJw27DtCL6lIETovEugG0W6X9+lqP7/KjV2L2?=
 =?us-ascii?Q?jj6gKRFuy9HP6gm/XhYQG78DAdz1lihJaPPEUr3ydFZlSm/ccSmhJUB3gv5Y?=
 =?us-ascii?Q?0gA81WeDVQqRjf4gVfBxQY835iHTBlrPgyQZ76zaLII+IkzgZJXRk8ZF7JLU?=
 =?us-ascii?Q?X71oYuyFPmEYVe7xFoc6hbwW8coKNtOGCNjsKrJJlnGekxqyKhEHI2vULEpj?=
 =?us-ascii?Q?sCaKy8NwJVt2FdJXd33ryW8bjFvo9pBepbTTUNkRgnx/KSOUHRWKN/UqC+Zd?=
 =?us-ascii?Q?cE0T/9n2CaL+R5oLpDPJjsTizGkj/O2ya0tJoeNmJfDnlUc/zznvrDGH5Acr?=
 =?us-ascii?Q?wsov1yteaWvDke5An0H1BAfwto6x60vvloEDsqfjkLrJLOa3NhfkDClDI/0V?=
 =?us-ascii?Q?U9TIOvD/1kxr0XwNTGQsjIwdC95HZ5TS0cXxWzUsvnwjxJPXNVTPxVbmOefM?=
 =?us-ascii?Q?+0rlBF+NsDxsx40B3bUKRjZzqVgQ0AUa0kmnxv0psOBIRTRx6smibnd8//N8?=
 =?us-ascii?Q?K+xJSnweyBPMMb4O+0r0FUUaLW+ur29EYlJ0VNy8FerN8o4eY9DscAODXw9m?=
 =?us-ascii?Q?LzwTlzkxJwrttWxygrnEKqt578jBYM7LqV4NotMYCHy1+YrEctcyNh8KH9hQ?=
 =?us-ascii?Q?UGmkZF6it5PnAZuyYpFyDfvyk/Lf2Ao1J5HpgiG1WLeDMNwNxJsaC3E5Mogt?=
 =?us-ascii?Q?l9yfUrvBcZkrp6dn2je/+EP4PFLl0MKyo7PUsjUxmVNKi808siOkpeIpqnfQ?=
 =?us-ascii?Q?YNWN+aU8r7VuXckDwH/BJRgbVvl/IWDQJRM4TaBCwi6cAJjldygyRweJXv7m?=
 =?us-ascii?Q?sLoL3+L2ncBkHtw9RmKFYIGUti8dzk+q+Rigm8h8mrOUnVdJnZx/x7ZFB/ND?=
 =?us-ascii?Q?Hf9TEVbQNjnFdKs3QqqXyiAypQ3IVRIpcLP9tCURI7fjtxlNqmOhi5JQwZY1?=
 =?us-ascii?Q?iH6keH1X5M3+seMuqq8w8IvBwdijkJbB1bqq0Gxfpqg+5grm/nksf8rFtf6G?=
 =?us-ascii?Q?UF4Aeh2mZc8haYA5nqvjsAGFOF/6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dILrTOIXuKFcGczDMogueiHpyrOzJeidqVuHq5LcVvBbz+M0BmJOktpy0IfQ?=
 =?us-ascii?Q?10M6MoBzYW7Q+7qYu8rDOYXBMeid+OXh9EHRHLpvtsS2j2xU3tJiom/GkDR/?=
 =?us-ascii?Q?jMwzH3PDOwed7Ksa/zdAvN4gcUvM6a/Eqhap1od84IjJuheJVEMzGYaBrnxJ?=
 =?us-ascii?Q?U/oN83a2gDu7Vi4/qxIW0gdfOk09Gn6noX5Ht69JqLyxTnanDF8bqqqgRPer?=
 =?us-ascii?Q?k7MWOqz3lQ91waSs8hnrJe/i+qJEWVsDlhiHCwh03B1eAjeaN/Mgge3oX9SG?=
 =?us-ascii?Q?KNaTet/6UaXH6M/mpRCQYpHgp2w9+7zNBx5iYWEncXfKMlnjpDW+TkwynDxO?=
 =?us-ascii?Q?Q7Uj7X6By8sAm1WQ6dOX649IQRV20lGJMZrP6YpIV30UDPrLDppHLJ73JHi/?=
 =?us-ascii?Q?f+CoRCEJ9OJO5eOuuf2EL92DY6CYBbp5tvZTFUc2MpxuaK1VOQLx46EoUJZW?=
 =?us-ascii?Q?+SwKmFry81ZPYtBcriXfWJodo6TB3NzsFG6VMuUeme4qeF7raco7p9nObIbq?=
 =?us-ascii?Q?1B8b2QhKeicZOxvI8DBa2tteb580J0oGyIt898MZMcIQGM4lJFSVb3gF6/Jp?=
 =?us-ascii?Q?Cg9KnaD280hLOIMQSoaHxR+Y7iPR8R/ltECgb3pWRJOm/98WfvfOHxzJnnjA?=
 =?us-ascii?Q?X7/6Iq9F1qPfeWF2776xWnWxtXmijam0npGETBYj6hOwyHezcxYSE3kq9gIc?=
 =?us-ascii?Q?xkazylKMCbnw3IaqKgzhS6ERLufKbyjyp81e/R8EWFiPJouXV/5RckJ/m2OH?=
 =?us-ascii?Q?KtN/gu3HIFCZIdAzPvAi00o7540hb1TOAFmWjrZVm7k5SAbXwVZFbpalaz0Y?=
 =?us-ascii?Q?fLRncWoiLCCNF8j/X1XyF6aA/tGH4D2t/CZiZMw4d/b/RAdu5wNTO3sda8TC?=
 =?us-ascii?Q?k7H85OMOCdI80O1VqItME7QXDRl3HwLxwI+GYy2zG18T9vmCiQqPlAyou1nh?=
 =?us-ascii?Q?z/a8emu+qZ8KIN3bULbRHHT0FpYmSc8KmwT4QfaeEM41yRHnYfBvXru4uXIC?=
 =?us-ascii?Q?F4vadSBTd45/wj6BKjHmSLl2QELePi3M3oOZr26zlQqcANhWGqEn6Uc41AJu?=
 =?us-ascii?Q?hL5NcEepHptHwKJK4Ad3mST4Q4C5IQtSI9hPEFGw5DqW1gnw7YGHWlIQVSgt?=
 =?us-ascii?Q?1WnzKaV2tzb7mI1qcIaMKS0Vuj3XdOQVHUcRn9ob2Y6sB/sQwtKD5a58622c?=
 =?us-ascii?Q?51pJAXRb4Dsrj+vSCsUJCg4/xZAECKm8K+g81vI1nL83UgrwiCWZ84qw4nk1?=
 =?us-ascii?Q?noeI9V405AAsNjCBSp8N7nk67kstdBOKq19MGkfiNJkAY+Q8zS9RCx+xOSn4?=
 =?us-ascii?Q?wXZICrUYIZZdIReqCnqnY447H99THs3/xgHJaIKfw0dgTPwNzt78KCVgRDGh?=
 =?us-ascii?Q?StuvcHCNoJy1HPEnYFQ/G3mFSMHwvyRuPpPaEV/JZnfyTDk+Fd4Az7jw+S7j?=
 =?us-ascii?Q?6fHUdurpeOqREpLla7fn54yKlwkwsvR0X01v0ThADepxsx0eLHl828zhTE7C?=
 =?us-ascii?Q?opnuXwdmGDgzK5T0PI6oFZc/hzQ0gRLZ0bFGPh28cy7Xz9ySMuWZhjjuj9GQ?=
 =?us-ascii?Q?jwZfutkUBjEoGrHeILkIAfbU0SWdrRGsrhmql39n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb8d060-8c54-4588-b70d-08dd456e150e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:48:45.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUdy80ipMeX4mocuzkhDeTzlIC1WDKcecGvDuTnnC2wGs8E7VXFzZPSmSscx8LdtzQWSoLKtH6Hbs2t8ymD4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

dax_layout_busy_page_range() is used by file systems to scan the DAX
page-cache to unmap mapping pages from user-space and to determine if
any pages in the given range are busy, either due to ongoing DMA or
other get_user_pages() usage.

Currently it checks to see the file mapping is mapped into user-space
with mapping_mapped() and returns early if not, skipping the check for
DMA busy pages. This is wrong as pages may still be undergoing DMA
access even if they have subsequently been unmapped from
user-space. Fix this by dropping the check for mapping_mapped().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 21b4740..5133568 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -690,7 +690,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
 		return NULL;
 
-	if (!dax_mapping(mapping) || !mapping_mapped(mapping))
+	if (!dax_mapping(mapping))
 		return NULL;
 
 	/* If end == LLONG_MAX, all pages from start to till end of file */
-- 
git-series 0.9.1

