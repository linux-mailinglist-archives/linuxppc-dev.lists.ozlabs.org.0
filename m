Return-Path: <linuxppc-dev+bounces-8994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEE5AC78C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 May 2025 08:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7Gl44crVz2yf1;
	Thu, 29 May 2025 16:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748500368;
	cv=pass; b=maQ8z6fwcqk4eqFgozfhwaLpKxH37p9peHcvPh4onSUFG+VmkeNK/Yt+sMDzZ7xCZytVNzFTVvTTfh52QVjLaBQPYeOyai5GvH7gl1LObcWiI3U99t7LhFJYCrcdsZCYImGRpbHjCuIwPu9ktPUGiQIzTfVWeKY+Zgc52Bfxfc7QLXei45PBKvA9b+L8Hr5HQy+b5kOtsM+aqnQpOEmP7lYai2j04OI+HpgrzNz971NGqUQZvze2A2+8S/azPIs5BGh4nG34SthCkSIrTAbYnQoD00cmMxEwR5FkWvb/5OYB245fz+p7izWOco9pymAInnZn4NjQ86gRo9UkoMIJZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748500368; c=relaxed/relaxed;
	bh=ewy3qHMejZflwjpE5dVdFIabDHqLfFEDCxChc8JRT4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FFFipOKtolYOxnLQVZmVyLcJfekY5Dd5JLweXPKfLJA8fV8JoGyD6OSd7p7VSjpdA8BSfMIrtwkHcItFd2dC1Thmt884ueaU1AL2LqB5Vyxk3+m6U5+SY/F5cKMV/HFCvz5yeKKTfvULlKUCo2uk31dgD43V0tpUq5hFUu8pfIQr5aQze6Vmf8JQzbGNtTsHa5GVfXy6jIz6i0/Zs3IDtwwVkhm22P9qamNJ3+v9GLaBMdKrxks6nP/zoz3PXJ892HgTaEKP+7xTsvmbv1melRj2zUvz5CXR+r0lf762/OKFHH45I7igxIQ1CCVi5f3C8Bg9SCTH5o5tLN5tBrmuNQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rssoRzPB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rssoRzPB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::612; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7Gl34SXyz2yfD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 16:32:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W15l2TPQo0wg+cviFEvQw98gDxtB/oK1BHTTXnJHxp6dbqM3tK3X0Lz3QKUlwNZJBUckeJvk320+Bd8Oz8eF1kjG/hs5MozOQz9mMbyk2ufmdcVhDMKRMvq//zgYch1M3P1usTHFsD2aqe3HMVEpFzxoSUW8NDJLiVyZpq6BBYhOG4WUfnOHJSawTR9kOHK/oNbBri/1XAUwF8ceERGDux0lTE27dr+o9ph00oS2xcZ7aP8aEq/nO4SZ+hx197U0QsRshf+v1litxcKZMgxgcHFUNPnAiv6k/vouLb5xBfaGkwcgW4ACVH/i/e2vAd3dwMSlIPBQT9NjUObSSg4Hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewy3qHMejZflwjpE5dVdFIabDHqLfFEDCxChc8JRT4s=;
 b=aPm3Bhqlqs8PqKulKurLYQJeTeFoMA4CIOShczM/mPh2El3GuwtCRbtqzG30Xc23YN+jdLB1vDI+8lyq0TN/44ycgtCaNXrVqvN5z7aGDd+NKeHtcabfwkktPc8w288Mf0UWaCDY53VxNAfQwpWYfmis5VqUOulDMBfQR5WkeVOmxSxH+ebxco6tsPjXa688Wx6lQM0MIIoAKbuF8CxAuUiTwWtJXBMT9keh9wJp5lvUCEm3xm8eU78Nxhch0KuEeeIQ8AeT4n9IMAbxgtXSxZHBnCdw9iB+7RjHowSwDO2o3rfmwv/V3MMUOxMXLpBGF9F85RTENDJHk/wRMJxxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewy3qHMejZflwjpE5dVdFIabDHqLfFEDCxChc8JRT4s=;
 b=rssoRzPBo6vEMcxPVqcKOn7tFy14PpEaIjLGXGGLMFnmN/qVUY3g22mGr4FzkNnuUESfwkOezDfTk0kUviooJO4kQUEmhH7IUVn147/WmtxyzpUjpfZBnZpF3JcCKW4Fhg1rPwJH5A3x7rximMy2pg4WzNIYiMbZEWQPIn20F3uy7AAy8P3M9Qvqw/eJ6tpKyVGaznQma+jkffjuS0U1p5Db1sRhZD9fmHr1c/8UE0oRv8LmJfQjKv4pfwALH+k6vcMDsaRv5Ozg7sIXV/lu6A+d+OfmcIAHk+2q+9cpkNY8q5n3uTyKUcdR4ej4/JrhWF3ZKGdv/QHqO4pkZP8dlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA1PR12MB6092.namprd12.prod.outlook.com (2603:10b6:208:3ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 06:32:35 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 06:32:35 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
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
	John@Groves.net
Subject: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Date: Thu, 29 May 2025 16:32:04 +1000
Message-ID: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0094.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::12) To CY8PR12MB7705.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|IA1PR12MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 7611af1c-a40c-487c-0bb3-08dd9e7a98f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EpYilxnJN9kK5DsdvIlxBdsagffY0ruSN2GugyAa4jXkuYiMyd3VuRI9vb2H?=
 =?us-ascii?Q?41n824ZRq9ctGmdDkt3gnJWFE0kJKzIg1fxvXfyCVP7bks1h6CLeGAerc5rC?=
 =?us-ascii?Q?+61bBQYRRRb9UP8SvvpjbzZizsmkGfhVm9xOfosYyPHCQpqA5OY0hO1RLAiV?=
 =?us-ascii?Q?dJpIOYc7U3KY4kW0nZk/DbSKVYqF5npAurfPBm7QLKHjiDLrTRywuiX+pAPo?=
 =?us-ascii?Q?e0n+awr3wCcKVkh3d48jG5GpMeQw889A824PK25UJATtOdtBzLGdXfClnWby?=
 =?us-ascii?Q?4HnDsvBd6b4iC855Ib0tavPTxNx/V1A990NIdfyMAAOS9CWcvy00l47Qaxd8?=
 =?us-ascii?Q?VKR0ptJuNdk1SZe6dWlXoCBlQUlmouTY79PqbGGFBaVdGfxhCeWOAuNhKwUE?=
 =?us-ascii?Q?I5U/e49XXQQDvAWR3T6nSU541wsTG7JLqS/LecHiOAydce40GjGtvaoB9s1Y?=
 =?us-ascii?Q?AEG1bp51Xb5pTvfPlr0Gwlzdf8WFCgCktPvTT0BLrQm8xBLXgKifzfdY+6zK?=
 =?us-ascii?Q?35dT5GlAApzFQuX8REc2eF0vaK1+HhP77o+bbA5KTgW07mglWn+cbCZngvD1?=
 =?us-ascii?Q?FcKfvbrL3qCuu3YhtfZ9eddsmE5KwULSfTKboZ1FpMbOf9oPHwpkXD3dc8rx?=
 =?us-ascii?Q?I87A+Ma5krWBGw8YzSkeRQuCdTctx7EOfLRzKJ5DVGGH52oJw7KxycYZusel?=
 =?us-ascii?Q?6ldARjK+MdnlLw6uC9Jdxf2TT4UF9f5c/aAk1a0HcDSRsBwxu0peXaHq5kBJ?=
 =?us-ascii?Q?oRuChhSSUlAox3nQSuIDLJtF1Z/ioLs6hnwTBoQkaVL+vvz6fHkRoRfp8lH7?=
 =?us-ascii?Q?8bgFxtfLC3ib0yfpsneaJ9uzBp8b+5Pb0HBkV213UfSD9wbgeaXga5MLn7g5?=
 =?us-ascii?Q?TIC7llMmNINUl4GWPUErRUNTfjGGyD3ya/Hes7WoE7jbW0ce3Oxm7XdI9NTk?=
 =?us-ascii?Q?2rxjGYUluZiypO0e+kuarTqcH14NoasvbRa3ghgx6gNWTilmVQCQKqM254g3?=
 =?us-ascii?Q?x1H2t4roDSjjE8Njk0aVrUFZwl6HupxtrGstOkX5juqwVeYYej8bcftIG5C1?=
 =?us-ascii?Q?PUAsA5V3SREmeYtcIHtpazpVsT1Yc+oknkIC2PAtanMWzxH3Z+L6lTqwgrUF?=
 =?us-ascii?Q?oDogenLg/y36qQVjsms3Pn3ZA6YDRJmoqdUDfctw85QeKbbNe3QhIxIUnYsW?=
 =?us-ascii?Q?f5UK1tVLdg0rEB3d7A+7mbLbPAUlJn73QvQ8uSr93OC80YyvIVL5hk5oQH9U?=
 =?us-ascii?Q?o99Y5G76w4xCZWIhwbCDfSGqhYSOQpwUzWCKwGg25Q1uGC3FxTk5Ec4HYP5W?=
 =?us-ascii?Q?bfmC2rx0T6O5HMqfQzv7VRiPWubhlD453vZsprGXWiorO/hB2xgoCAJlvoBX?=
 =?us-ascii?Q?F9YFMaOjEajmWOzLudCRAaVyeD7NIRfaQ0bWdqhvwvWTuvRQfK/982JcEdSe?=
 =?us-ascii?Q?clIsCfUM1ck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CoPkSGfZ59NGNkdcYyRQsIccwmMyeCc22RY32HJiTIDEamua42CQbQiA4DIM?=
 =?us-ascii?Q?QPQxZjprO/sqKvWmO5c8IOCbyp2o9yyavUzw8/3pGAxl0Oto6yfEubsKJR8Q?=
 =?us-ascii?Q?IlAzYVH7R34WrRtA2a6FJJ2rIRrTzFWIRQPS4a7x+bSsPoAcf5k4lQLwlqLQ?=
 =?us-ascii?Q?L9TmkPIPW2swtbQQFJWjIkkHgDkmRkr7eQ3S6ddxlDcYRBWpqvjCBrMRVPIK?=
 =?us-ascii?Q?/RVdw8goxsCFfc/niZn/1kZy2pCbdr1fUnEctqwIPlyctpao/E8ck7Me5AtO?=
 =?us-ascii?Q?oIgY2b3iDIjpaQo3Imf4VHUYRN/H+6xjIm6+3DaXvC6YbaB1wsfkSgkQCPG7?=
 =?us-ascii?Q?ZMAhomo307q/3P/3oDtPEi5jHTF1qx9g26c2CBzwAQ1dXm0AZ4HhwedAuxUz?=
 =?us-ascii?Q?PKuYqNQMZ1iEBPRIX4SjUVY1ktDZixv2dAy5q2OijVUNCkmfPkhPMFuyc5NJ?=
 =?us-ascii?Q?Xv/8sLICi1moFdEAsuXZ3BepQbhQPopRvmiYtk8oG1I1syTgkQQPVIjMjBzD?=
 =?us-ascii?Q?OvQ+32VACKeMtgMPmFFDqemntMJ5xKgC4kefUQUwzLY2kyA/7oTRXxghnm5U?=
 =?us-ascii?Q?2Y2D+jb4zRKCNEYTyFbweoVlv7yuX14KTAo6a1SpAZjTIwzO9NU2NFliTImW?=
 =?us-ascii?Q?iypH0HOCjRTVzQPUq37OCNSIuBo4DnSkp+9peQTvYDdfuqQ7ah4AAOCrP7Ov?=
 =?us-ascii?Q?ooWS8GBg6afOmlh8KqQqNiE6vGcdrAHXOg1HNVFi+4ordQqr781mxumJYQu6?=
 =?us-ascii?Q?kjw1UKrgfktH4pb1CRsblTikE6YJu1TqYvh2V4YeQO96AbJJFzy1iuLdo1NR?=
 =?us-ascii?Q?1huZ++MJ3skc3B8yc2e8XogmJJm/LKR8hED46jia8n2ZIm20XHn15f9TL0rD?=
 =?us-ascii?Q?EpBgetKVAIdWH+ee0s6aLdX7yxI9CInrBk631pIZsoEnE0s2ucU7fTLS+EwE?=
 =?us-ascii?Q?x3BloS/vEvVV5dNNKfEaHdGOZmm8xcOQ5mP0iMdxaNByj2IfSILxDFW1FR4r?=
 =?us-ascii?Q?6UF3luTheJZlboVf9/67xNDFouK72bvm2YZLQzEL/KXh0Z5eqY48a99kVHSA?=
 =?us-ascii?Q?tnejZXBbYGysgBei/SXxDCWGR/pkPwoLGwYlnDpT+kuEg3aiV95RHVyhkoRJ?=
 =?us-ascii?Q?HhMfVI8ZlbAEfpV8x9SIcbjyKc1NDtT+88v16JVEGqYcmTWWJ9A3MrvPrU3P?=
 =?us-ascii?Q?CqvuFitD5iphTwRw4lwssPMvc6K/V/IcGokkH+Jhq2w/AUR9hENH4Szh28NU?=
 =?us-ascii?Q?JT0kzZJeJ7RS6TQ0frEL/QKx8F95CEw0VdEOe4lYOiekbPwuKtNqvzdJWNXh?=
 =?us-ascii?Q?IG4NnGvRgAK49Qc5uq5VEt6cJSjpD+RDneas7KoS6tCwWR10L0t2+elqTp5z?=
 =?us-ascii?Q?ykN+CbQichSwPhhFopypV1dQqQMMObRQN4QcBfked/+4T3uRo+mIZk/UxxI/?=
 =?us-ascii?Q?inF12qfnfTSQr5AHr+wIhCly13kmzBfSpfxv70qSg7jh5kL9mj+B8P5EbJrh?=
 =?us-ascii?Q?1gUvsximT/Zqahq8B5wMYFY99t0uQKUY8sFfR6Fg+0ugqHco/+Zr4qlMUYMO?=
 =?us-ascii?Q?qSfVUqUrnAH9ZG/DeQpTtfwlpbAKahJTDzysTSQY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7611af1c-a40c-487c-0bb3-08dd9e7a98f6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 06:32:34.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64hVvnMPSTgCqasuUlpUYYXIACh67sfndFzq37qE99b/7ZPs4EFdw2yN7quAcnkF51H+C5IXBHBYhwEsd8a0Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6092
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Previously dax pages were skipped by the pagewalk code as pud_special() or
vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
refcounted normally that is no longer the case, so add explicit checks to
skip them.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/memremap.h | 11 +++++++++++
 mm/pagewalk.c            | 12 ++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 4aa1519..54e8b57 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -198,6 +198,17 @@ static inline bool folio_is_fsdax(const struct folio *folio)
 	return is_fsdax_page(&folio->page);
 }
 
+static inline bool is_devdax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
+}
+
+static inline bool folio_is_devdax(const struct folio *folio)
+{
+	return is_devdax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e478777..0dfb9c2 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -884,6 +884,12 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
 		 */
 		page = pud_page(pud);
+
+		if (is_devdax_page(page)) {
+			spin_unlock(ptl);
+			goto not_found;
+		}
+
 		goto found;
 	}
 
@@ -911,7 +917,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 			goto pte_table;
 		} else if (pmd_present(pmd)) {
 			page = vm_normal_page_pmd(vma, addr, pmd);
-			if (page) {
+			if (page && !is_devdax_page(page) &&
+			    !is_fsdax_page(page)) {
 				goto found;
 			} else if ((flags & FW_ZEROPAGE) &&
 				    is_huge_zero_pmd(pmd)) {
@@ -945,7 +952,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 
 	if (pte_present(pte)) {
 		page = vm_normal_page(vma, addr, pte);
-		if (page)
+		if (page && !is_devdax_page(page) &&
+		    !is_fsdax_page(page))
 			goto found;
 		if ((flags & FW_ZEROPAGE) &&
 		    is_zero_pfn(pte_pfn(pte))) {
-- 
git-series 0.9.1

