Return-Path: <linuxppc-dev+bounces-4935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7AA08738
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:02:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrdX6WBMz3c5B;
	Fri, 10 Jan 2025 17:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488912;
	cv=pass; b=PPJKvygli3ghq4GjJBLH0rQEwFofQcqO6UauoqOUHIYBMPtZU5HAk7buoqAL9vHXpROnE+Adxx5J7+1rd/gFzxSQlJcZk6KD+KE90fsATGMp6FzlINHmCnzkc5ybUnKo3R7AS5BDass0ko7WjvJtrG5rq+rVa0rGdrTiDqw1JrM015jQDLFndDsNValFiZlX1uIhTJFZsul7u/P6B8qnKWt/RRSJcajvlAp6MK70qJbRGE4SEqvNnsY+t71xZROSGFHYbr1DzxBPoE9QXKZgo7qreMFqjVmsFQUTQO+mTs77qJDxDEjVPGxosQbdlHRXXi/LywaRgpbTOtF3Ny8Yzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488912; c=relaxed/relaxed;
	bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkjV4S4zRxkjBKL2OIlEdAbKzgvRIAUtiwlRaWFTjqGVB87MvddhqhXoRI/1tzr8Yg/bqhndnUyq49ZJrIiBQyr1+SkjAfkAptrJcrCLOW6QbG3sykVWTo+0iVnHg+lSVmj25Nmk3jiL/8U04s4SuwNuwwktrCO+83m0BRqOJpFbjc/wEWEfHImnL1bAzbIEhEfOcr2lZy/Wh3bo9NJi4Z++yn3L6jb70DjOCb5WwxkorIjcgLcS79p5N0oHQOMZIgFrnFdjEcW33VWkmPLzz3vFRNoZZRDTMj6H1sPRaWjMPhg7TlZj3BYn4ApckfrSGmhUbZOmHC+rr4XeUUccaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Yk+eJDRX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Yk+eJDRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrdX054Zz3c66
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:01:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qh9tp4/0YbZn2nWeTLXHyrTNOaLsGZMofCYl6ceaUO8Nua+qvE+5+IfYzPJ/9JryvQifl2Y4Gt53cgx+HxdFpVctWnMalfcCy8rs+1djtw+cLsHX0JE1op55Pf43SrWc1E97AsDwb5QEAkLs1Go8OB2NF1dDKqmsIqSHjpsyLqUzg40DKSucmqSDwzB6hLNy80F/1RI1IHDMERmxo9WurJxahGBOj25g8/PACYga8Alw6tOwuFJZygqUG3yuCbqIcuC0Cig3I8n1ByvExyyVor/xjiQrAJGvkq/WJgDrt6tyg4G5+881A+JwUZLzrpu41CaGsZJf6K3gJNkzZS90oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=;
 b=P6xhkPFHUfVq0IkXfjFojZw9jo/q+XLv/ONYNxFzXcd4Mh93NV27oHVvR5TxvLJc56ypW6+wmMuttFLTWiAmW49FnIIqp+0A6Z1Sh0YeX/YPVqf+uzQnKDOuyAsJHqbzmijH6BLJE+m0kRFT5nPO+0Hpj2q2fVgN34/zj8GjWWOd8RXBoF00jjZRlErb06JbQ0eQlC1DDH2I/N9YdtGPs+RhfE6P4VPKMLKDrDhXiaPrjJ7B2tBerC5cft7e7O4p5Y6WFrC4l+gD13C0As+rG+99PkpWFa4CMRxo0LC00Q0vh6FmE9qU7DGDGgl4AUosaKKQGuDtwbuDH4yl+7hukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvasEvPAGqJVTP+K8N7EJhMBB0n176CNkNnXIKkArIk=;
 b=Yk+eJDRXZgSscbRqcEqbPoZlFRsC4DaIWgZURApVdJzENdpBOYemD5oTtk7Bv3M7miQcoVWKhxQ+0zOGLa6notZnQqS4lAN825up14i0mQJhFKWj0pzFjDGYPsPJUxHlm6hEOjxjY8lAKNZpfi3i7qC4cehHD49JCQeKYGRH31wm7ae27IYlfdcmOKDa/LUim6lUIC1fBB76ejuDly0FedNv2bRd5PeHvT6Rsgc9KnSsvlwkTduupFYdIKdZUOjdD1JRbH0VdhrXgeXCk4aGRepBpT6eiKL3TVSNgkhQuD70xVX1KkBgTMTsc7q1UlLiI06q1A6cDKrl+5u429mKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:44 +0000
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
Subject: [PATCH v6 04/26] fs/dax: Refactor wait for dax idle page
Date: Fri, 10 Jan 2025 17:00:32 +1100
Message-ID: <55b287f58e47f27e171308494295a169a9a9001b.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0094.ausprd01.prod.outlook.com
 (2603:10c6:10:111::9) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 471635bf-7752-46a4-8f55-08dd313c4252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SJBiFmmmwOAXH7sUQb1zVj4/9eXHOdFPUQg6GYVtU5LeRYLdMmON9/wOvLye?=
 =?us-ascii?Q?dtVwzjVuaHqTNTy+e8VGp1VuFrYVTsn1PR0yw2K/7crhvGFnenov3I6TwGw4?=
 =?us-ascii?Q?ptLmK8y4FpC84L0aZmee42E9bl909tQAxLb+lzBxTh9F5tLu7e9QPOpwPmKM?=
 =?us-ascii?Q?2iNy3t4qsC0cjvNl0Mm19H/BbaF9x2Jacap4rQiXyqulryaagcqmDu3NlX2/?=
 =?us-ascii?Q?77DTWJdDNz2Xztprsu1OeAcnb6fuOAPkajWogGUBcwhcA6Iv1TEpRnnjx0WC?=
 =?us-ascii?Q?Qnf1c+MFdPX9AXsMLHEqhVVvwd2uiWhxynaek5OAk8bGzcYR9HouM8dNe0Et?=
 =?us-ascii?Q?kkqeHfFJQxcefwI/FoBiHpDp01qT2H/P8lZWYBWPE2QIBFwnJdu4gLWQxRaO?=
 =?us-ascii?Q?U8pOIR6c90a+3Bfah0vz6lu4dvIza1mqjEOvqtID7CpiP3TLXfr5Oc3bt5DQ?=
 =?us-ascii?Q?6utmFlWiOLfaAN7fmu08V6l1JX7KYtLGd1JRm6MhRbUHNfujlpMoff0FGtui?=
 =?us-ascii?Q?7EI2cEgFzeYSpDZcszj2xyexrn/HNRAsryn/P2EpSQP3X6y/dDS/adCMaQ4W?=
 =?us-ascii?Q?7G3aS9K8OlHARbCN4+ORb4to2FXRzuy3+vuHNJQtkhq1d/pRuDJdXIocNRN7?=
 =?us-ascii?Q?ZNJB87CTr96JmIuKGCNzxxr4g0UTSqBDZ17IVHrJPMXwfidXPTLcRSYudvLD?=
 =?us-ascii?Q?afqmRqnMGJJbS+gg+SpYSSFfxjylPlDyUBvrCUfMhUILzqNnmfsSyahiY7Jv?=
 =?us-ascii?Q?pTRl4C0AE0LvDPTHNy+kkFUztkfWitF5IFgQEa2nly5Hcu3oh7p616xQWrci?=
 =?us-ascii?Q?fJ4dVHH+t5OqtLx+axN1FptzLGezRckRVFWi5EG4WXV8iCYeP+OZyqIFpi+b?=
 =?us-ascii?Q?b829XQoUPmdotsmbgJEoUvg7s5C3M6Fe0ExxB6SMCWObq6q1KlVCrOq2Kc1r?=
 =?us-ascii?Q?WM98muSO9P/SrLwFPlmQFaVMUc1imGl41rY7CUsK/PNbOhdsUFfjh28FiuNx?=
 =?us-ascii?Q?wjCHCCSGlpsmeGvr6e2Nef+pyguXp8yCWUnXLU8nMfBEa+uKJJ/ZUZxpfZV+?=
 =?us-ascii?Q?jpcD2Ut6NMbFZ8oJiuq/l7/roYF5CLNO+iGWVhHCRucZS0L7hFEeMwhV0Vxj?=
 =?us-ascii?Q?medW8e9c5OXXzJdGXG6IZI2k+gPlssY8crBNIoBdBsq+xIL6mO7cBoAK9qyJ?=
 =?us-ascii?Q?aBMckCc/hwRAGMOkprLqaIAzHtGfFFD2tc0/gchGEJWM+dBfVqNBcaVVtsj8?=
 =?us-ascii?Q?wakE7+nJH5Tb9IQ6TIA5jelPJJm4yz4xPA1mwUiDsmxaTcPrbZ4RjcUjQ4A3?=
 =?us-ascii?Q?XEREm29LsodfbPd/TmR9s3FuCxN8cn36qLYZjO2CC5TjPRwnp+TfXxjgs0D1?=
 =?us-ascii?Q?1eISN2C7OQGrnk7zrtf0tSYVN44o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?11e2SI5VM20SEn+FQ7HnP/QRQ2wpQ6iEJiET4C0ab/4UdpvxxO+VJmxJPwO8?=
 =?us-ascii?Q?iHF1Xts0O/clnRez8lrYwfVOOIBxbDGOofkZWwvSK6zFqsH2TR+IY/xQd3og?=
 =?us-ascii?Q?UBcxZaLUEVqrWeMBRXowimNVA8K12SCs/3XryxVORdwOl2kiZBbZ4Ph/Wymw?=
 =?us-ascii?Q?VAKX8otHpNqcV8p57JZah8f5oN1YbrZv/s7eyWySa8bbTR2T+NLErxMHlwM5?=
 =?us-ascii?Q?IW57OPe0mTuW89+Vv+yE7/ZMBcQpKX6oBiJi8nEG3GCnJv8nSufEhlgX8glr?=
 =?us-ascii?Q?+YEZx48EUJceSiR+tfCe3T/N8PPtRlKOcBXP+4wltTiEjNIpDwgdwJatu8Tr?=
 =?us-ascii?Q?dqJNFn509Z05mgKs2QcoBRSi48d74/GBdQYLVqFrlsYd76WHVJ/HPAAnwDrK?=
 =?us-ascii?Q?S1gksLRCr3ae/t8juhyO6ILMniq1xf/vrwx7akoqEZi/uc1sjcTDniwCMjRX?=
 =?us-ascii?Q?jxhNmREPOj8zPVilLaZIMDlt81KVuNkRQXcOFtDi3JYLlJ6QDskD2+sklfrm?=
 =?us-ascii?Q?9HBLuTQZgXHq7l5ybHUGgFSzIBDvjfLHCnEyl+478kXWCzrdv61oUWzl42qG?=
 =?us-ascii?Q?ywV3uQ3CGFRVIUp1msLjSet7o1lXUftljJwhuj4lUXDgxHGz2fCr98VWEXIA?=
 =?us-ascii?Q?DVv6VLS5NnD2V4X8cHk8oca7vm7pDSwG3wgquLgRpuYMW+67Wynx4GdpFVo8?=
 =?us-ascii?Q?0K2K0HO0puR8y72saY5DFOm8YhW2G5U4RD9zTn3S/6xRENsUsiL6nmC3scff?=
 =?us-ascii?Q?qASyP7IUkcvGibdKL3ik0h0t//wkisZkqCtTf/fpwyycVD9jOs5txd4NXRuG?=
 =?us-ascii?Q?5AekI3d9KcsRwEN9P/Sx/360ca1RQvzVqsxmKdvAPyFQKRE81rOE3YrkDBiM?=
 =?us-ascii?Q?RSbCePApLo+3zNTrMjK17935uKae3yv6T3i1eMLxmBN32eIB9QhecubksAhc?=
 =?us-ascii?Q?OmKsW0qGZ3UsmDMASGDgu59DSm4PgX7S/5BxrJRWSJyrZPW2iYPXvxWWX7wQ?=
 =?us-ascii?Q?7kVOoFfIU93JAOXs5KtnRxK8XtwMmWobEW5rNV3ylRDC2/6WC74IK6VAAUd5?=
 =?us-ascii?Q?yXvWNphdPSXa58DqpG9GPYOrYbdJFj9tv7qQb2P8ufHz9XM8KzyZDL9uRZOt?=
 =?us-ascii?Q?FXdrmygLsgBA0zXiyZ6tL/+pfTMN34NNDkC0Y8LM51kKYYavT4pTJYiHT9j9?=
 =?us-ascii?Q?UGU+EYMba76iXy05XsKlE0PPdeFwZlfe8g/EVqxM0K4MM3EL8SuS32CxqdKh?=
 =?us-ascii?Q?G1Af3zJoy5hIE9TVVDPg+x/AeFNHQHIQCYU27qH7jgo6mKV7pXxYdlC0fUY7?=
 =?us-ascii?Q?ioJvKJChghMdyHnoYmbTXcJgNXJb6XWMeV1XKnUCw6D3QgD5pYI/ySzE5fFF?=
 =?us-ascii?Q?LvQBJgR8B2jZjeeI8zHt8NHnIwAEnfyO9o1SCm0N2yXOWuVnYte5WOou+NkU?=
 =?us-ascii?Q?Su+R+r6MejwCUGrglsvy295rE+hs+Lg9l7yExwdqEjYCOBJWeHHoUJV/MBBk?=
 =?us-ascii?Q?AsdLiTcYyhIVoQygW5wjXChkxiwv1VbO+y71e+wYlEbBVxaAhNPr/qxN4MmM?=
 =?us-ascii?Q?B4PWhkMPB1lzf0GG95nN1rMzQ6nPCm8CfzSUu9O8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471635bf-7752-46a4-8f55-08dd313c4252
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:44.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+s3S6WFCfVxFIKPT1mPpHjB/ajx8zj/Y9j3Ln04d0fSMYiQlcbIAwDkqwe9r1N3CA/tXLzsC8H5+ejWgjevUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

A FS DAX page is considered idle when its refcount drops to one. This
is currently open-coded in all file systems supporting FS DAX. Move
the idle detection to a common function to make future changes easier.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/ext4/inode.c     | 5 +----
 fs/fuse/dax.c       | 4 +---
 fs/xfs/xfs_inode.c  | 4 +---
 include/linux/dax.h | 8 ++++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 7c54ae5..cc1acb1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3922,10 +3922,7 @@ int ext4_break_layouts(struct inode *inode)
 		if (!page)
 			return 0;
 
-		error = ___wait_var_event(&page->_refcount,
-				atomic_read(&page->_refcount) == 1,
-				TASK_INTERRUPTIBLE, 0, 0,
-				ext4_wait_dax_page(inode));
+		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
 	} while (error == 0);
 
 	return error;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 455c4a1..d2ff482 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -676,9 +676,7 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, fuse_wait_dax_page(inode));
+	return dax_wait_page_idle(page, fuse_wait_dax_page, inode);
 }
 
 int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index c8ad260..42ea203 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -3000,9 +3000,7 @@ xfs_break_dax_layouts(
 		return 0;
 
 	*retry = true;
-	return ___wait_var_event(&page->_refcount,
-			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
-			0, 0, xfs_wait_dax_page(inode));
+	return dax_wait_page_idle(page, xfs_wait_dax_page, inode);
 }
 
 int
diff --git a/include/linux/dax.h b/include/linux/dax.h
index df41a00..9b1ce98 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -207,6 +207,14 @@ int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
 int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 		const struct iomap_ops *ops);
 
+static inline int dax_wait_page_idle(struct page *page,
+				void (cb)(struct inode *),
+				struct inode *inode)
+{
+	return ___wait_var_event(page, page_ref_count(page) == 1,
+				TASK_INTERRUPTIBLE, 0, 0, cb(inode));
+}
+
 #if IS_ENABLED(CONFIG_DAX)
 int dax_read_lock(void);
 void dax_read_unlock(int id);
-- 
git-series 0.9.1

