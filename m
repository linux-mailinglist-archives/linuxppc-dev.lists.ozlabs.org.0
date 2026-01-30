Return-Path: <linuxppc-dev+bounces-16440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC9CFY+NfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:53:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E456B99A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2XrV1Xvhz3cMD;
	Fri, 30 Jan 2026 21:51:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770314;
	cv=pass; b=e0CcLJA1x/lxNngWi7BZjY0zjOmL++s13RFSV1QDt+xYuFUp1aRTSHhGoluQemEngpdcICCLTWRNSXARZULke2e25yZmA7vE9cBuYj0TsS+i2qIAchu+oaSV4/RcgX5B4GxFconNNNU+RNVIsdF0txzG/CAImlmPjJWN9c8J/nC9W+Y/9n/VnsLZu7d7ZXloJOrJuqy/+Mblhr33g2ufJVG/2d6V0fJpiVaYKiLupbrWBAvZIR7nrUeYMSa5zBvaQdT5Ho7Fbba4fovjkUo4dGpI3se7gAUCwGv+3wjUK/9y3m4WdhnP6uWMbxbfLoATZRlBprnt9M5irAj6V9iqKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770314; c=relaxed/relaxed;
	bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m+1ll9Ylofte+13JMboaXjCnFZrQ6NLlw16GvTIv1lZPRp+WCzI0Oc+1M41Qsb+zH94XCJBoZ76T2ACouWozAcjLUrnkjRPeH0kfpGpgmyIpsW0W6/y2evM6nM8T5y4OuSgSNRTo2rqZAG62vjFDxaZt1IPma1AMKYFmx7WgDsZ7oXIIjkQj39Sbw+beWWAVKlVxc8iU+kTjQDhO6YhN1OUjHgDcM0sVKpaMrYAkJjd2MfUs1/yb+ez9uy+Zo39/LxXIRkrwFcWLTZstky8BcyMHD2RnR2Z5cuTEtslIwErXQhEsc8+xlJVUAQiqfObpk8Oh3ovDHQbIhaR2duSW/g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GinAugHY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GinAugHY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2XrT3cKrz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUo9VsdIzhDyPRmgdh61WqLGU/2bmyyKM6CjC4af/fKwjWz7oi2esOsgXSJyPJy2AC8HeEmdGHnbTSRF2IyZO1OX6IPcfu6MtJoybpxtIe9wrF1N42clekqeWg61sWj5hm+qlMMheog6m3WrizjvezUcW4NCCfHUZ0Mt976AfLvo5ZOQfAxzmIjq9v1tWk2SfXDjFpjLv6aKun/H+aDRAEvBCz2NIzRg03keryCNFaVuE7i7q8tGdf5p25P2HUQl5MknkplsRsG3dMwE/7Cw+U9YninIE4/EYuT8bWA/7Xiv7HqJ+lr/qb2O+iP0DG2WQa5K5H2Vei+jMBWDHnCAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=hdPXOw+ErBL21+6SbAwN/UBJKTlmpCNDVqCW0U6AG1aFaVLxfjcoe3FOsQTHxHNdwqVHHOhkNZ7c0c76a/0ExHb9+pl/Baqm5l1s+SUFzjeot+YkvBtvGpraPDmfDSGfPA+k1mOVGmGYORAnS9PgFO2KSJDOi2PCfzP0Ke5QK1+MBUt2+dukSKlsA3UBHXdnbSZQJ6sgXWnXVb7iP1ua3J60Y8LEeOefkq21aLYnaxHQhpbXQJhGm5CA4YE95xl34giOaDA366xZoEu5siWOx5OSvnrUEUigSfmT27GxjpLmVTfXjt6sxTNsP/w+bU4EMdbBTAoEvKjndKk7J/ECOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+sCdI7CXE1phQDuSk5W5X7UWsQbj3O4orbU6eVepQA=;
 b=GinAugHYGH5JYoqPZvfyGpx1WicYW5YEUf0t/RSjUVYeVLOKReGYR/eIVFz4lfdpgOAK9g2w+xQKpxxrPatyrmOPrdY/6XaDrD98GTxcNN0XqdWUkPr5gde1DTrHWCsWQZhGumMcCFE6eRTkAWJU/ROvFOl2rw+hfQ17Sk3HqRJAkn0CrD0Ok9kAgtxfpzlH1oiTPXjtU3cHuLgkiI9/psXTdHr7VqQxvVahLiwbbFb8u1KU7CVSU72hGVhPk8Z+GiMSRNVl38cLjshkesO6uZg9Si/FZ/O2CSyQlvspCXFbE+PD+yUx/bnA7qsSLiwi+fAkmrHngJ4xJ05VJL4MwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9760.namprd12.prod.outlook.com (2603:10b6:408:2f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 10:51:43 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:43 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v4 12/13] mm/hmm: Add flag to track device private pages
Date: Fri, 30 Jan 2026 21:50:58 +1100
Message-Id: <20260130105059.51841-13-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: 3418e7b0-97c3-48a1-a2d0-08de5fed8e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?igNSNrF68+BbbpM4ltpjPa5H3rKdk7yqMnsHnxzL5ZNNqgIpouP4Y/9aROi8?=
 =?us-ascii?Q?2b0OCruXHl+V+jz0c/fs5mQkXeS4pdLxPd6RKBG/l3igdIUhtGRpRV/Svpfv?=
 =?us-ascii?Q?m1o0Lx7MPErPZG8XriPtmwNfZMa7e6EbmtRcgCVWTyMl+gcRi7bF0KROdk1J?=
 =?us-ascii?Q?GythlzhsLC7LF+fcR0Lx4sXEDy4juocD/e/URhDApH2YcGtMy99T59TpXGa0?=
 =?us-ascii?Q?e1pR2LbY6J2ibvWs9vU1YNs45adyuJfMIxKkQcR/0i4uzjrd/Wp4uJshiHUE?=
 =?us-ascii?Q?dLK9Ru0cmKBahfKsSkQabVgGGococUBkhp8IoUpeUA5ACYD4/DoO5hGAqnvA?=
 =?us-ascii?Q?b36xySNrBJzaocm3HXsrykq/6M9zFonTgUAjF1Jej6uIH+QXSiwMrnJPlHou?=
 =?us-ascii?Q?dswPeUSYqba+wZ1WD25z0dZIJQTsWl9HKLU2ROd5YzBW0QlN0aeYESLwYwwU?=
 =?us-ascii?Q?NxSGTtqq2jfjTnf0PyL8eq4aapPaHzsojZ1DnrEK6MOs/Fyr8bMxluri8gwC?=
 =?us-ascii?Q?/vFwYYZLlO/aADJM/6/C2Y+4Bbuiy0oRnt49oESZTnehI8xvUICcZs47uvxu?=
 =?us-ascii?Q?3FJTEr5f8NvvjERlQzzpEcCNq508gi4mS0z0Xh6Cg26k5LSR2w1c00pQ9qw3?=
 =?us-ascii?Q?8vy33d+s6baYVBVUL9EcKC1aPaoYquKR4kDUuS1QupTdKszQv548TzUpSzPA?=
 =?us-ascii?Q?QPwmpnbLqKNcovg21HzmZW7u8jkNvTaQj99AiGaieDF8h8IZpauquA3JdRZU?=
 =?us-ascii?Q?4b1aQ/LJ7mBr3icM0d0D/CeaslsjWJ5cKtK/xwzHIhHXMOpHpYOir2BiVZUB?=
 =?us-ascii?Q?x3NUiSchRjMlzy44nCRSZPHvUMeN5Ls+zWw7bJ3B8251R9E6D1FWz71uFOWq?=
 =?us-ascii?Q?yrkttl4rE1/HxlcxyxDRMqY8h0DGpM2g/Vq5vCZu8sd5BfNAG9t0HHly8lcp?=
 =?us-ascii?Q?j/KvtZtCCrO/1zKCvpsnicEaHDVd0Z7Uf7Z92HSEQjuk2vBFrDJRoR8wpX5G?=
 =?us-ascii?Q?Q+RDa82yI2ukCuiXkIWIkBr1e1l01LxxOtYIGhBfLHNU3PSI1kVKBte4IbLi?=
 =?us-ascii?Q?M/wQGGbBUR5AY9BV0mWsB/vpYffYRiLccGjSsc6tukCsQTC5AJsdDsvqYJKs?=
 =?us-ascii?Q?k/uhQwEESWycPtT4nZUPjgBfmuwvwB/6lDJvXBcZfsXdm1hjmNYMY0OIXQcT?=
 =?us-ascii?Q?pgCui7mu+VFwB3fYqGghFhlMOlWMgSL1DY3xQTrbA0niqQcPAvWkxFMdywZf?=
 =?us-ascii?Q?Xbyq4pwihhjXgJQH94h3RHLgGmDkFQpJTO29DGHay6B3/wU81ww71jd7LU5y?=
 =?us-ascii?Q?mHGTLbvHVhkVa8NX9PagewvdR+KbXASi8dhVvaZ9fAfRtpPVUkUA1Iu/B701?=
 =?us-ascii?Q?oeu1xmeqmUe5MJixjU3Umr+xdR7jkrRnoC85JemwYLhLZBo7bwfZUWZFusQh?=
 =?us-ascii?Q?n9LiXxKuk4Hf01cDn6aycHmWC8VV830cQ4l6b3gEGZPCcf0+CHTEfPGKt59W?=
 =?us-ascii?Q?cW5dfocxlR1UNami5UM+WEPcfDHYvViuTjjHS4uwtYlfBYZx0PLyk+yo//Lh?=
 =?us-ascii?Q?ZEMhgpMG+FPqnLjMK6A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MZj8jZwCSHw5LWn8ZlOxoNxqZ7kOyTLTdZPKlK5vfBlOBzW2iC41j5npgIeW?=
 =?us-ascii?Q?l/7cyesqbX33xCd+vK2q5ksEFOd2FJsp4XX/7/DdjQXm8UGXvHbSj5WHGPyc?=
 =?us-ascii?Q?/BgW/kZbUoF3XMp4TC5wjUiw6RMwQ3+1G+aRFs00Z+qncdxuKMMrKMX+7s6U?=
 =?us-ascii?Q?D/hj1nYP1JLpggwojRd+SfBO6TSuCLCJEgQYnQhiOmf0wadNF55IdP09cQ+K?=
 =?us-ascii?Q?EmLBZPNZuDZLGtwh8f1B48eEsy8OTqRdUwgLKJHWSU537gnr9qDxiF9iIVlm?=
 =?us-ascii?Q?nb0zVCkVT5I0BsV38aIujBgWtzB4BiHVd6mUN8mk1y4opLT02QCakkES7vOU?=
 =?us-ascii?Q?CClg+DcssyLmNbmX+IEuDuoxa3Tyfw33yXld7/w02l9Xr0t7jjtdHVSfNUxn?=
 =?us-ascii?Q?mIB48yUId1nx+kUC/Zwsv3Uw3uMpo+ObZ0BrolNpONFsmdCc5bvvdat922CZ?=
 =?us-ascii?Q?IAF5kezvThYk4AqSwbZ7lT706jfOY16QycCFh2cjP2r2S8QaIP7kCK2aLrtk?=
 =?us-ascii?Q?A6SQM3mF4MFx1UzSglgol6gqy9weeIRcUFzzCUjgCVjl6YhmnU45xNtl6aUE?=
 =?us-ascii?Q?hVeejITHOruTxm+Ud7NEQCIuPWRZ+9F2uGEwjl3Eb0L3lkRpf74OQYtZ+Mby?=
 =?us-ascii?Q?gWyyw+oaux85ylHD29ylzHlVjORyjkhuU+z62ZqLsp57+h9FccpDCJG6DcYz?=
 =?us-ascii?Q?A3rZrvguXL6mpXastt+loRaxMfNXhJNSUjleap19sjz19A2lkREbbVckIUuL?=
 =?us-ascii?Q?J9FL4u9b2K2000mmbRXHVhxG9WWiIZDtIKJQzz0y0OleY9EEctVWCoIWYiG7?=
 =?us-ascii?Q?sax03Q1fDo046ogVvCIUoKl9od7uwDh1LXFtPVGeWpcwqp/3GDP+en9qwl+n?=
 =?us-ascii?Q?wUYQI0QtEwBlhyPuLHbACC6+RQbgLGJ1DflKO6zsMvU325GwT031k+5VLYJK?=
 =?us-ascii?Q?gopibL7B5pQqOc3SCYSykhziFAOElTZnW7PcsAVMU/XujCVpi7ILVt/YSzP7?=
 =?us-ascii?Q?h6ooYtCdYu74p7XEXGBtuYJOa8Dq9Vg9vAq6o8va5e0RsWiXvXTRrCTwNh+7?=
 =?us-ascii?Q?pvWsBon292UdvPcB0GIZcgR1LLnSvb3MQG5iVSSAlhRTCOLYLn8/HaWyTvTX?=
 =?us-ascii?Q?wEniKCMO7zBQ/fmQpAiaJeof1s420cYUzG5pG/AV23vX4oZyQOWNNSwNwj/I?=
 =?us-ascii?Q?aIozT54H0TOcgTm8hVaFsbObFFMrFeEA7JHrlRm632OEuwANKsf4sttjikox?=
 =?us-ascii?Q?S2FtlovZhXNYkZa6Jm3HvUX6e5LslTG/M+hRi2uqH3WdxCL1GouqDJY0gO9o?=
 =?us-ascii?Q?LxXIrAOnmWUxmNXLCz9ABB6Jiy+Hx4/++tn987EdluJ3fZwN4OBiPzVeoetv?=
 =?us-ascii?Q?S17zjCWPkZypEY02FQNb1sG6MK6zWzjR/73OWvjXsiFKF+UKxKYOPkallwqE?=
 =?us-ascii?Q?wQWJU5xScpdsGxuDTJpmRt6XmM4z01CSqNg7btRf5mcxGfHQP4IaExmbMOK4?=
 =?us-ascii?Q?QoRctPgitvbvUYmYXB+O4GyvRwbEOHfGH558JPjT6z3soE5Y9DKXKgOwI3/v?=
 =?us-ascii?Q?LDMSJcje8RWvr3CZcfEgvjcgydgq4fm8Oi5iARyQ7msv/5PVcwQ9mCfZsIqm?=
 =?us-ascii?Q?qf4vRZ0+bpJylW9N22MGo+W10TZl+qdPIX8n40vCS36/PhPzmlAerOAapvN6?=
 =?us-ascii?Q?LmA5cxgnlzFMYNKiX8sXviVhGnInIKC6Een0am8a3tcmGg1ceyIr+g12eWRJ?=
 =?us-ascii?Q?aubGd2UNNg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3418e7b0-97c3-48a1-a2d0-08de5fed8e78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:43.9271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGlbHi8/7/0SMwWn20ZXujMxyk5bcKx/fEhqJXhDcbv+a+WRlCP4rUy81Zg7iDgy9bEpEVSN1XuQTP5Qu5S9Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9760
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16440-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9E456B99A6
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
that a hmm_pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
  - Update HMM_PFN_ORDER_SHIFT
  - Handle hmm_vma_handle_absent_pmd()
v2:
  - No change
v3:
  - No change
---
 include/linux/hmm.h | 4 +++-
 mm/hmm.c            | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7..d8756c341620 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -23,6 +23,7 @@ struct mmu_interval_notifier;
  * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
  * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
  *                 fail. ie poisoned memory, special pages, no vma, etc
+ * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
  * HMM_PFN_P2PDMA - P2P page
  * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
  * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
@@ -40,6 +41,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
 	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
 	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
+	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
 	/*
 	 * Sticky flags, carried from input to output,
 	 * don't forget to update HMM_PFN_INOUT_FLAGS
@@ -48,7 +50,7 @@ enum hmm_pfn_flags {
 	HMM_PFN_P2PDMA     = 1UL << (BITS_PER_LONG - 5),
 	HMM_PFN_P2PDMA_BUS = 1UL << (BITS_PER_LONG - 6),
 
-	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 11),
+	HMM_PFN_ORDER_SHIFT = (BITS_PER_LONG - 12),
 
 	/* Input flags */
 	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
diff --git a/mm/hmm.c b/mm/hmm.c
index 4ec74c18bef6..14895fa6575f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -267,7 +267,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
-			cpu_flags = HMM_PFN_VALID;
+			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;
 			if (softleaf_is_device_private_write(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
@@ -347,7 +347,8 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 	    softleaf_to_folio(entry)->pgmap->owner ==
 	    range->dev_private_owner) {
 		unsigned long cpu_flags = HMM_PFN_VALID |
-			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT) |
+			HMM_PFN_DEVICE_PRIVATE;
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-- 
2.34.1


