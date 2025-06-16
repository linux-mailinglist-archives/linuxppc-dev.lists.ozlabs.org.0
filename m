Return-Path: <linuxppc-dev+bounces-9402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA8ADAF80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 14:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLT7g1TDyz30VM;
	Mon, 16 Jun 2025 21:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2009::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750075167;
	cv=pass; b=OS9JbBBxMYStoNlt5GyiXUmMoU+onYjD1v3nf5y1b9R73XANM6XQEBp10bEqqS6ZSQ3YcDGOEYnr0rfuLoT4jlBiyeXCEiaTO6oyhT+Agk3p0vqTpZXHv9NHxQ5MpgdSRvN73Jr5nwkrFC93wNbv+pdq7jF8WJiglo1gHNK4ze3BT4fwljrP26UnXVKPQj+nwPzSCsWNxTwOu+wBaDi0laf9Pr07WGwGQO7x+d7tzubfICWStCbZNFgJmVfasJy25hsuE8t964PamP1a28DHwyhAO/JpuJQV/r/f1Me2fXbNId2+xW1G6G0sc8sCs5TseAIwbF4n2SdijhWPOuQPaw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750075167; c=relaxed/relaxed;
	bh=sijNo9V6YWT1MypOVwwfYBiDipFZbnHefRq9olQAM/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llNWdJ7gu/w9TKUhjkT2lvEAvnBIM5U9L2VRWboQSgNUnKgeLGUJ60juU2ArMYL8Avxa7rKTbYmWWMxIXeqNuFxPn2WNsqDCIeKb7D/6X6zS8StfBh5LL9mnil5EPD+S91vL7hJa0fG3c75KCU/lB9w9osbsR5P8EJg+sNXfqWjMNLt4KbzGHBL0Ms7/643DIXGbUal2dDZhEWZUUNsRQ+C3v1sD+BR7Ao2RFZYiPZ0/3eD1R3BZQRXTUa4dC1Y0T0HTvYmVOldd/jBW954pgGrQN/qY11MmDBIE80bSZ64dEsuzrMkVJWEw/Yhl+H1Gha4eXyzGo3ndXiRNED1cmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gVglkIyC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gVglkIyC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::627; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bLT7f4Tjkz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 21:59:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rtv4jzLI2HxpLkvkl8Jd3O/4PwLBYxXeqmfoXDdQSB0JUmOS6FvwkZXKV6OmTOgTebZTBoFORqEkhvQrKpwwe8oMlcibQVXNLb0Jh6KSC4pOye2pO9fmPwmXJXr/kTnMieuwUVDVv+TOTO27d/+oeI2Z4ev/jZdpudW4yRfDqct3zQhXByOpNhDKgs7XPqiqlVoDs5d/QCFlG4muZud7LIwfUVRv2me/F4VtK2OKct6G0cqEy3Px8tnXQzbhRf/1bYC7Fg3wmCbI1BHo3e4VpvRovZLCgDnCjhTQo740Q4PL7RWbVaCd/tOXNH+Rn1ITSwr1TrbZLI4EwcMRa9QLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sijNo9V6YWT1MypOVwwfYBiDipFZbnHefRq9olQAM/M=;
 b=Ffa/pDEsH96eHs+BkrIiJFuGF10haQjFYhLs8zbr4ejcY24OWRgNXSL004y/VNzqrRuQZ2UZGlOlPeHieRnSCX4EVmcbX7vYhVlvnRNe/P5cghgIXrXHp0zHaVDt34h/Pg6P1l9VAgPx/kUHnr1cEBAzX28Q+fixjrgI+TfE4ElhKAFilyoMZ1EUYmrYtLCghLLg3R5U7yxXLXII1GKOUhbS5+SxPjkSVc+WMy5jkIy+dQPLEik5jx9Ic+n8T37fo8RSq6ccNdW2oxg+s4V9ZlM8PWr9c/2ZYnJ9G5o+cclgJjnvaW94HMojeku6s5SiSIGLrQwCTOHGoCcb8Ejicg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sijNo9V6YWT1MypOVwwfYBiDipFZbnHefRq9olQAM/M=;
 b=gVglkIyCcoBEurKrut79I5WMnvFZR3HuKdqUj7+8FJsQpZM6bzayiyrHQ6E8Vnt9uDre/g9yRau6TWk9Ykf/jxFzzxn8b4X7wzgBoXV6kqltB/j5ladOlpnAfDaM1ftU40lh2FwQuqeMXr8xo9k4DhJ1/nHqaxwTYQWkgTTsn0yFvh47EVFi0SvzNR2HrAQpmbDHLU8963j3a7GGy8cpmmXeRavobiPNUkvUcwEmbwp1CtEF6H6o5zaRLQPRiWyhD5SCV6pt/35jjav06Or7OAAN4n9lSHnAVHGWrf/cCwZ851kYeKSNMSwx+bw4onoXilZtYoCQZQYWgTq80QzSPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SA3PR12MB7878.namprd12.prod.outlook.com (2603:10b6:806:31e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 11:59:21 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 11:59:21 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	Alistair Popple <apopple@nvidia.com>,
	gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com,
	jgg@ziepe.ca,
	willy@infradead.org,
	david@redhat.com,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	zhang.lyra@gmail.com,
	debug@rivosinc.com,
	bjorn@kernel.org,
	balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	John@Groves.net,
	m.szyprowski@samsung.com,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 09/14] powerpc: Remove checks for devmap pages and PMDs/PUDs
Date: Mon, 16 Jun 2025 21:58:11 +1000
Message-ID: <818b2fb2f2cf7450ecdd698f2fa019aed3be7b85.1750075065.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0151.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::21) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SA3PR12MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: ef10b8d3-6b2e-4444-40fa-08ddaccd3adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PWAA8cXu75cBzzOfKr+T46sHGcNbMxI9HqFQ1v/glUiDKIMxW+829Zerqwle?=
 =?us-ascii?Q?ER1DLIEHpbDmtcbXic9Zp/hoijHoXLuN8ms2Cs8IcY213w18N+QQQabAmlb4?=
 =?us-ascii?Q?qUeb8hJuZMBV4Eh5PuuxiZEUrw4j9Q21rCyVl7eeUItV2zxjAar+Nx3mliAb?=
 =?us-ascii?Q?TE+Sv78aJRygWOhYSoWCxsYf5zKx8CcmkbWO/rJ6eWHMSVmXHtWeXVuZFDDI?=
 =?us-ascii?Q?EY5QQRh5tJ0vTExBfabuT0lKCL5yUJjVLV+lLIjFapBnvJXTT3muXkAmC+ke?=
 =?us-ascii?Q?E9eeYwfBE/5OA0hsaJribVGownE+uvcoyM1RoPo5qIARSp4pzyGp1QQpoysr?=
 =?us-ascii?Q?GhG4F3xhnmzHIfbXwdvIle7iNLOwbDr3hn4sJd/HO8/mZRSz1lt2Jlic7afN?=
 =?us-ascii?Q?OBeo1O8vfqH4sm+ycAHqM/gem/s0ffO2YLP40G5JcBPEOUQpI3xDD6f800JV?=
 =?us-ascii?Q?RKOopV2y9hOwXJCd8F5S4MLkk0IH4QHWLwgvNEZR9Ut6cwbLql3yaPivZF4t?=
 =?us-ascii?Q?nWw7YcrmxTu4MdV5dYudc3TlS7YhIRUy3LFduq//RrGCEnAukCSUqwlybiMN?=
 =?us-ascii?Q?v7Z0yU8m8YuNY/JMCp+128J3d/jvfyV0Bdmsx7ip4mSX8OpjBiSI2roU8bNC?=
 =?us-ascii?Q?vOHmxvFncam0v1wRThN0y+Ob2xwfnRm1N7/3oCB8NH7uL3ZTUBASiWCWqgfd?=
 =?us-ascii?Q?JXp6wIyRMWHNwbnSgCyhlVYt5zEVjiXw+kA3CfUWGUMQMXoFpYRQuZQEFwVA?=
 =?us-ascii?Q?jOL72RtHurAuZhMuybRktbsEn3uF6Q/YAeILyz4TmHmTj/l2mmjVZHdqnXAX?=
 =?us-ascii?Q?xdBZdLCSr13JRCaxUHL7wGbKfkWoO1ygBqnMbLA04WxtT91JKjoYo3wQI9zK?=
 =?us-ascii?Q?5O+C7Nwyh8zV1B5cVUplLJcKpqTnBj50R0WQzGJmKo6yoascjqTk71MIBWmL?=
 =?us-ascii?Q?F+1wlMVufC5NJGTqhVsF+JxmAWJYUMVanx9arNjBgG+e6SZAdrXijJkh3ZRV?=
 =?us-ascii?Q?6rcTpHWwOTvShPF6OgZbRvDKo2HfSNklFVeDRgR6maTz50sRqAU1oEjXAOrN?=
 =?us-ascii?Q?HCKxXZZwo72f7ZK+jxVmgY8/1w2+LcluAI6+DsuStBlTGerSgi0DlLF1u04G?=
 =?us-ascii?Q?WzvDJWuhJQrLL24Xc7Hi1IP+3fOcB3OAi1oXO+WSlaV1FaerzWAkObabv/4z?=
 =?us-ascii?Q?t9LsugtIhuwOR68C0ezvurRqybU/bS2R9YqdvUOM2ztrLrKgRRcL5wn5RQLD?=
 =?us-ascii?Q?5YMAy/9RsSuKTbBx92li4GK/ufbrCeQQ3sT3zDG1nFdpjmB7yFTaIwGZM0ZP?=
 =?us-ascii?Q?0Xw9Er23wCr/coLr57qyEHn8NoC2QwtXmhUVEbvoVoltG+1OKHRdv2UR7c0C?=
 =?us-ascii?Q?f6kMA4bX8Gn4BrzDfiGXQkKh9Q2SjAy9hFC6JRpFHUQDfxYDcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6i+p+YqZjWoyiujB545LxMMg3zFC2mIYKw0XkSzx8UWz18i1oMRND/WPZ64f?=
 =?us-ascii?Q?AQ3b19WOZyc0ZKFiKkYbBsxdUl4cBtfvEKQ3RELnwU0HqRI6C+rEEUOZG6zB?=
 =?us-ascii?Q?hhrJClGtFZCjorUce8uN54/4ie7UnXei9YqBqD+ej2wjinG0zyPCz2THvE/M?=
 =?us-ascii?Q?t/qbjyOTySl2DIMXZBRE88NLFJqjygLMMLchrILxwWqNdS4qut/a3ORm8BtZ?=
 =?us-ascii?Q?61CaPtpZ1Amkrl7AO1jOvIV5wwa0O9CkwLa2Ex/bPRatdxxq6FJMhqFnF+14?=
 =?us-ascii?Q?fiYie4v0NJnAQJ6/e5nZizkWdjTqzcAXR5WIL9kP7+S/mO2Ng17rk7AgKjOT?=
 =?us-ascii?Q?ADWRAiqFRCE+zVcBd8ioNsb+7MwfROQjxOZlQhxWP7YrvM9eflgS/mq1KZFo?=
 =?us-ascii?Q?55S6XHHbR0/MHO2IBZb0OIL/Y+DC4Oi0P72lcOoYwl1w/QNP9fuSnZVBDe4G?=
 =?us-ascii?Q?6+NCPhmegBvVf1K+0rZaBKIN1K2k7kaxBsEbhivYkmdZpa0QDzVxczHoFxq5?=
 =?us-ascii?Q?WtW82KAsLyL1YeXmXfsA9izQenkCc7f/Ep+yn4iZNJymj/FFYNrAGpPLaWnD?=
 =?us-ascii?Q?l67zUi0HNffvtwidq/hDSEUHGrwSvzfAWyz+Ie/17YWfK+yPc2kPQRRTaOhP?=
 =?us-ascii?Q?Alo6SY8qs6wXFsRiRIZA2zzfaA7osczFyraYXIShFHge8ujMJ6TcHLLL1KYD?=
 =?us-ascii?Q?OU+vRsky/rEUgKlKtE61FFAtwjus6hi13wwDo1ZylBQ7cjtf+KuCXnXM4SVc?=
 =?us-ascii?Q?T+6hxj9E4CZnohPQLjqJrW0BbbudZn6xnFV1EvXVxhd9nsRlk7dFZWslVBGu?=
 =?us-ascii?Q?FkpqTl/+mZxjzCVkjtpjTGpODAkBErkcSl/dGYrYlNR6pysB4bBrm7KhuB1a?=
 =?us-ascii?Q?HJq7tvKSU1m43Kj5QqNsW0DcHsP1NLYqMzpiwzRgzH2/L+EUYS6WMdW5sJPD?=
 =?us-ascii?Q?yuKRVp0/oAv9IjGlyzLH1HnuVpyddnEz0926tIY7A5RDldIWh+jyAsQeoJ0r?=
 =?us-ascii?Q?JTSSPB1VmYwjBIe6EkUr8yRYXDYQkIx9Uwc5dIaBnRsYVlJF0m8QPNZ8X6W2?=
 =?us-ascii?Q?YeaPYbYPnIvIf/vK/6P55UbPQ16wn0Sd6uuM0sU8WpYZ4V6JuKXmi4/gf+E0?=
 =?us-ascii?Q?taxYWWsZklttda+jPMn/4lUVks9nMfXWYFXT/OPoyS+40crjJQogAloSuqrd?=
 =?us-ascii?Q?sXLoq+ufhtIxLxXWwLKTvVQELyXXOCY7XFFM6dcDNywbnlfRlAFPove9aEHY?=
 =?us-ascii?Q?yOlrH8cEt6W8mnLyF3RQ7ElCy34dPYkzDlCaNwFa/ofDRWcvfnCWTFTLrATc?=
 =?us-ascii?Q?OnEEZJHmcvWok3oEDPd8QF1f4SQLymmiVV14150yeiDm+QKN7oUDunUcwkMa?=
 =?us-ascii?Q?LnqyKjjcqA9piqqcgGpnrG60jaknRoXGKV/rYYaExLU/epjCfxV1UHVtFpJa?=
 =?us-ascii?Q?W/QjgJV9JUMXcgFP9pX7XeECJHFbKv/bIcJFrZNK9e6xNzxD0q0nIKg7Htrg?=
 =?us-ascii?Q?EmMXtISfNKdrFodfoUu5NzJap+dXphrAIn41/ZBFn2UIXIYXCCP2zbzm/eEM?=
 =?us-ascii?Q?E5ETulqd4E5GocIW6/8PeCwDLFGL5PMia7iI3Hhq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef10b8d3-6b2e-4444-40fa-08ddaccd3adf
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:59:21.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyCIrx/VhAYcqcjhFp5gSWe8wf+MSTAXIVFEiuBE2ifY+o9TCdr5qOrT414zrWakKOigEYpfWcxG8psS5b/qNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7878
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
created, so checking for them is redundant. Instead mappings of pages that
would have previously returned true for pXd_devmap() will return true for
pXd_trans_huge()

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
 arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
 arch/powerpc/mm/pgtable.c                |  2 +-
 6 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
index 15d6f3e..cdfd4fe 100644
--- a/arch/powerpc/mm/book3s64/hash_hugepage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -54,7 +54,7 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
 	/*
 	 * Make sure this is thp or devmap entry
 	 */
-	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
+	if (!(old_pmd & H_PAGE_THP_HUGE))
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pmd, flags);
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 988948d..82d3117 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -195,7 +195,7 @@ unsigned long hash__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!hash__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!hash__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -227,7 +227,6 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index 83c3361..2bcbbf9 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -74,7 +74,7 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
 
 	/* Make sure this is a hugetlb entry */
-	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
+	if (old_pte & H_PAGE_THP_HUGE)
 		return 0;
 
 	rflags = htab_convert_pte_flags(new_pte, flags);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 0db01e1..b38cd0b 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -62,7 +62,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(vma->vm_mm, pmdp));
 #endif
 	changed = !pmd_same(*(pmdp), entry);
@@ -82,7 +82,6 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 {
 	int changed;
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
 	assert_spin_locked(pud_lockptr(vma->vm_mm, pudp));
 #endif
 	changed = !pud_same(*(pudp), entry);
@@ -204,8 +203,8 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 {
 	pmd_t pmd;
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
-		   !pmd_devmap(*pmdp)) || !pmd_present(*pmdp));
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
+		   !pmd_present(*pmdp));
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
@@ -223,8 +222,7 @@ pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 	pud_t pud;
 
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pud_present(*pudp) && !pud_devmap(*pudp)) ||
-		  !pud_present(*pudp));
+	VM_BUG_ON(!pud_present(*pudp));
 	pud = pudp_huge_get_and_clear(vma->vm_mm, addr, pudp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc..877870d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1426,7 +1426,7 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!radix__pmd_trans_huge(*pmdp) && !pmd_devmap(*pmdp));
+	WARN_ON(!radix__pmd_trans_huge(*pmdp));
 	assert_spin_locked(pmd_lockptr(mm, pmdp));
 #endif
 
@@ -1443,7 +1443,7 @@ unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long add
 	unsigned long old;
 
 #ifdef CONFIG_DEBUG_VM
-	WARN_ON(!pud_devmap(*pudp));
+	WARN_ON(!pud_trans_huge(*pudp));
 	assert_spin_locked(pud_lockptr(mm, pudp));
 #endif
 
@@ -1461,7 +1461,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 	VM_BUG_ON(radix__pmd_trans_huge(*pmdp));
-	VM_BUG_ON(pmd_devmap(*pmdp));
 	/*
 	 * khugepaged calls this for normal pmd
 	 */
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 61df5ae..dfaa9fd 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -509,7 +509,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		return NULL;
 #endif
 
-	if (pmd_trans_huge(pmd) || pmd_devmap(pmd)) {
+	if (pmd_trans_huge(pmd)) {
 		if (is_thp)
 			*is_thp = true;
 		ret_pte = (pte_t *)pmdp;
-- 
git-series 0.9.1

