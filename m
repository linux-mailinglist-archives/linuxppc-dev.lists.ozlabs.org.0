Return-Path: <linuxppc-dev+bounces-4934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E847A08736
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 07:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTrdW5l8Qz3bVF;
	Fri, 10 Jan 2025 17:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736488911;
	cv=pass; b=ayvnpduyNe/GkD9X6go4HbS6L9vx6TsEXq6yVmgSWd1Q+Nnw6SrX0BEX06OU6CnQZj6cmN2y7njkyAmxrk9BFNllavcojk37zAIOIp7Rf9ZU5+K30M3VNagjAhq1CylQNWggUlmEnzJyWO8kCPQKu7+gDswkCWq0nvFAX53HkE5OthIAVe7sd0QUS+7/K1O6BAqnbCQ7iXYTehP33jfoQ99eLsyVUKGPLY9vtQL23PXQTjW24/qZhkNTdd4EM930YnkA2meuoCYChmCTcpGJA+p97HmHA+SBzdq+z2PHQFm9f63LzMWg9KEGqnn/E4hzqpVcuTZqZYKZlXxs68vubw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736488911; c=relaxed/relaxed;
	bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OUGAF0/nBLyUTe/A8kzntHnhjNiGTS9DOltPfTm8lOFreBiz6UlKadyjcWVyAFoAV7bsGZJpd801Cxggd3T7TQ9LnvQCKipqINK3buzyASSX7l8MPRJ6mZbDQa0kZsdmsmrojEayKp+4nzQ9r2uOOYHWQD2l8ZkbJ2fxOXIt6fD/EKeOD2ZcW333h6NfgYjUOTmUO6GFRv68sGvlEV6w/h16A51vdCWN0Sh3lTzaw/0orWLrwEeHV4v9VxLnxTpDzXKW2jzQqb8dEBET/XsDQ0Prv+EBMJEr6Bw6t3lhdna+jljqapA+ykRSGFBdvypdKYfHKbFfw9X+0r0rUAv3iA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dUwjIf9S; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dUwjIf9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::610; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTrdV3W0xz3c5B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:01:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpxvqaoIWSZqSR0z5uEPch2vk3IBEX0f3Xi00SzTp2RHiA6QCFijKvzLaQjqnCFueiX30ijAO1Kmfdr040oMm7PWv4hBdNDHdhJYsj4K3uST0i4JdB+Zh+v6sXI6pvGYv87PsvkNyu8eVmCbGmc0HfcieM1f+Fv7avl5As7ZB6Xv2Lye5/1YWf8swREluOz9YPzJ1/9qu2ZMM/xU0EK4KtRznNTPyq4PU1JB5Fp4pOAa1e0FL6iASe/HEPIz4KqeVSlYGoFXi4UkyQvzZ9VQRiaxzsBB/1YHP1pqoOeXHZz3gRc6vajWU4FfHe2R2OJoXY/9jeuVELFmJ+5VUTscxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=;
 b=kPBXLnzfaXWq9g3kgRQFIdILu7pU2MLeOvGhIuTl+Wb725zbPz+5U5KnBAm4Fc5+4B1mGKJTnoAgMbBcH8Bo6r4JJmd0X2w5sSlXfjYV69qryUNbzLIuzI467tRFuP/pHlCUhTdXU2waDcI3uh7Ec2p/gbzukH31b9R0KFotelCnJPEBsZpIq96DY5x+/336fbtx0/UeTVQjtXYZHahEOCWhhpfc4fkgRCP4xtYmL8LgBdy3Q01nt36T6oT2Y+SVoZzm2qf3haTic3i1Qlasn5E5Eu5bEXgUpyrxQXwjwaEky7/eWPyL7krbqufUQ4xQ8uBuh9vs2nou7d60Le1Vhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5+bIA5D/ZXBMmnESNZ5YW8DsaUjooc64ARwvTry73M=;
 b=dUwjIf9SbGKfY5G4bLU82HeZgF9ADgFS9zu1OFHxCugs2La9JvfG0KnEPhSJnng2T47Bnsk+ZDNKawHf2/9W2DbryT0L1nhXebNA1mM9/7t9yH98sH/Tks69IL+SDSLuYwkfMi+FS10TUjTCP0FybusO9PmZh/2c5thazTWCX/Fs07wt2fbDUaqR6SaBOOHTzhlbHDTXGZSCFKVAP5sYYm6VzJ1x7vTMt5MCIVTOCHtXl2U4RWDS5pD2o+b/rrClZvOHUAMOB101XGSKKvd9L2gaT8ahbr6mnl3bCSw4AfSC4VLdZMI+naf3C8XDEWxWTpRdukgIX6JWTS53RhEPBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 06:01:39 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:01:39 +0000
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
Subject: [PATCH v6 03/26] fs/dax: Don't skip locked entries when scanning entries
Date: Fri, 10 Jan 2025 17:00:31 +1100
Message-ID: <742791bcac80aaa46b964c8a09b45be4dadca294.1736488799.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0082.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:247::24) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d6767834-2fc8-4ada-eb71-08dd313c3f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LkcVFy9PRsjeMfFYaLxOZkAdUZZBr2XXNCbQ1sBDorqP2w/2JIjLx2ufISs3?=
 =?us-ascii?Q?czoN6ugkv9fBKroHlkVjM8XldGcbn7sKvfYaqkOWYCBYsxEwmto+tkyH/aq4?=
 =?us-ascii?Q?MQlIqan8f64aVJXpSlrqBXbfWeSAsqFxhQTR/yWvCWD9W0Z3/VoK6YrSVoG0?=
 =?us-ascii?Q?abBxYh4+nO1QzWM8Ipe+iUCUCccd8E+2nffBZv7deWbKju5BHDffDB26L+aU?=
 =?us-ascii?Q?N4r1mJBzztKpvBs5mw8l88ssdFQ5MTVSqJ32DFQkTzpIgy/YVrQfFyQ1QhPi?=
 =?us-ascii?Q?VSGb+Wh8/ZNe/ECY4yZzF6tOnB/fKqNiM/RpkHAcA8g79xvA4fvRMUILMsNV?=
 =?us-ascii?Q?PXBYD55uc5sft6YUa4U8nmg/FPTXuAOE/ucEzd5Jqst/mhslEUkbbRFvYw+p?=
 =?us-ascii?Q?6lJxqUfCPnsQ8xcIUFzVBrJtj/lJMZSXxIJBi1qtbQqkCuWWJajlHEd22zgD?=
 =?us-ascii?Q?90KwrMuGhgyElxKjpA4DiiRZ82sIOpXcLvD31hIXBk+i8WfArdPniiaZLHkF?=
 =?us-ascii?Q?ovU/AyJieLRpRE9al75Y26gbGCaZ7WtwMSqThTFBLREaHwePXGSmGaFVc2RD?=
 =?us-ascii?Q?cCm3PC7ErNPIQ0eLesucirN0fjOooga0gznmQsYyMHAelxD0a/t+RnUFG7wQ?=
 =?us-ascii?Q?lU6RONXMDvOS48n0SqJYAprwaJawWpgzJ826kCE6bYmd6cUMprf6u6sD7lYL?=
 =?us-ascii?Q?ntON3Qmgn2imHpA/AQo+slLnQHzJHEjRQ6WaX5qHXai1+9Ax1rNccCORRfQR?=
 =?us-ascii?Q?+lsIJw+4KPRjIGc8O/9NIjHKDQJZssdkSlZBapMmVosqk7R0tZktCiwR09rf?=
 =?us-ascii?Q?fjqlIWsjgwrLVlCL8htygIrDK+m21wf3NeGMg6s1BFjBxi724h34V6o7WLab?=
 =?us-ascii?Q?HVTDrGy5BaKD3dIfZOk6n25qnNVNfk1AqBl8spEJA8MOs78Thtvz6OLPEUv0?=
 =?us-ascii?Q?d+igqZzuJ9mErFD4Sx0K1DcTMULKvCrUlLGVnFjbbTsbrBBeVfkSgyHaSQXW?=
 =?us-ascii?Q?O7dSIn5sRz7IGCrRjfFSTFvkxtmhMtnKsAipNQ/qfT/OfFys/gWiFY7v3Fnq?=
 =?us-ascii?Q?hFumovcTYaTU6VBnrPBO2KwYgD3ZCnGYX2yFf1MMQq43Cp1sxsLDm3uuTjwe?=
 =?us-ascii?Q?rMvYi3YGV35AOMJn3fl/PDFoJ5S1vLQLpQyCXGWnfWAtIgceYygLrL7vLIc9?=
 =?us-ascii?Q?afyymLtXap3LgRce4XpfZJAHN9B8i6shRv0iosMGU2imWxQgja7Iy6ICYFaq?=
 =?us-ascii?Q?itzAv1XYD/bU0MMTwj7VdUtqntyPPA/DTp9qWo+EYuWxw9jvBxEYKBCCSopx?=
 =?us-ascii?Q?Z634OV4piNIQn7xo/SHAh0nBC7DC2ezXWJgq+EWjPuS3qAdYoqwLwHf52BtB?=
 =?us-ascii?Q?I9kKAOuFTLg68VDB/2p6rRLH1h0R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/D/2TNH/syia8AXqxHP5KhAuoVV+c3ilcmZXfOYIyKJM+vT3NnGbOxSvBDHL?=
 =?us-ascii?Q?tDdGyGbmwhDnV5iZcHrGsT0ylFTbDzR7UbebNiHOQGqIKnCBqD1Ev9LReyuD?=
 =?us-ascii?Q?dPFcnQQZy+qcYKqrIRYZ3f+EeJoUt0GcZAF/BHzVG2S2ODPZTIaJBKOJveb+?=
 =?us-ascii?Q?AN4OMYWjAsjnDYW7Iv7mJNejiQkZvyycqLNHS9A+fVfR9H4drzQyRCyMj2Gh?=
 =?us-ascii?Q?Yg+QHJRgj8vp1qTB7sFSAaT3zM48emOGjgUVfYQmVd/44AWguG1C4c2WNQWy?=
 =?us-ascii?Q?rxOeuSn6KT5OoQdfLYvnzqjNLlMRs/Da02ZHCNoBocb66LnNx/JDBAzMARvC?=
 =?us-ascii?Q?WZ87dY/LtAeNSDRxjEr7oJMl487VDujwMkbQc831pCe0jdkm83SMIl8I99yv?=
 =?us-ascii?Q?1DhCwthHCrsnYyFCZv7XY0j447t3k9VGk0QmFRNiXGpCiVvw/obs69ogPq+P?=
 =?us-ascii?Q?BKaV5VOwOpLfTHEGqdEKhvjWyQR+rldBnJganGuklHpieUq1ynMvzyhmCwQ9?=
 =?us-ascii?Q?gvUhqo8aab/i9k/94oahGgdSYLzueQJ4cqMo64T0c+3oL3zuW3J1WxBnSquN?=
 =?us-ascii?Q?gFNtq8uaUOAMtYK9lTb2RLrmDjJGrcfztAunFAtxCyBpO0Fzfg/2Hj1be/BM?=
 =?us-ascii?Q?+tn6J9g8ERkif+xc8ETAP2edYEYXeyXpyM4PE1QLlacZ6b1cm40uM/xndBEc?=
 =?us-ascii?Q?AgnnazHGw8Ex+iMpZiLCrYgcOlPrj/wwsAnMYLPrHZtvEl9vfMbk1XZ0L2wO?=
 =?us-ascii?Q?JEswmYWEWDwpmhNoXn7HRWbTjbVzFkXyBCnSWhxTdTfL6LdaMO7Oj9YAUMey?=
 =?us-ascii?Q?Hn0DUoA30U1LAK3kNbYh9UX6i94tDfteDBv8OIQKl2sW1ii+eG+StISKSE2l?=
 =?us-ascii?Q?RX5TKgUKSvoPQZiNqAms65VJq7JfeFu2rPH3B9/8XJHrWTANRYanq7fUjtzG?=
 =?us-ascii?Q?X8KxkdbjjrW1ZittZCI2hfjo1QzQnPeI4gjOdAZPorqxBb2ZCqeLdAQPF2lT?=
 =?us-ascii?Q?1JPaSREIbvUrRB7fZa2001mliVB8qdWPbsdCJhvcR0Td36tGv2pY63fs1429?=
 =?us-ascii?Q?H/eTLxkth/w1ezPq2OIbIKmAbFP/1f/fLas3vzWCjF0YxdhyJlRmJKNrqoRd?=
 =?us-ascii?Q?/Qjxa4kW5ho/JtN9ZwjsVAdd13fWyN87Dgm2Q/iwM2mqYpyRLPHZv644D+t7?=
 =?us-ascii?Q?hwdBKYpah9UZlRJ7Os94NivpCEsrxxOJ6SVQnWAeWy9QY1Kj9vmhRGFhxJhf?=
 =?us-ascii?Q?bJ564aPa9pN0lWNsnl86QaVufzs7GPq8WVPNqoj7vlzCVnWyCXmxDDtgpTFu?=
 =?us-ascii?Q?KpPPBAOuViNeWAL83F+X+C32T8/58+rwQ3atUMZePcHUdnrXSXSEYw5vdUbK?=
 =?us-ascii?Q?eMPRv8cBmIvGLig9E51St+fbTEYM6X8yvZ3P7+lpyzy6MXxqOxdw0ZK4/pRP?=
 =?us-ascii?Q?4feYDWFAqn/u+HHnW2Vd1u8l10qx29C43B8GCjWSKNJIUdn5LLLkogfFU7f1?=
 =?us-ascii?Q?8kUU6Bu4Gu+8+gTi+bG7cV30C4UpoE/DQ3E1nzTwUGQucA47odRAPPVFudyG?=
 =?us-ascii?Q?dNrnuWd8pWwg01G4zigRX7dUZUod4tbjPrY9NxTK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6767834-2fc8-4ada-eb71-08dd313c3f73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:01:39.1760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLBQz6/k3gwLQkFb+F3y6EoZw94HJsChHCY7CT5Np83gFIkdjKcJuBty+g0I6DVtzyaaIuOMtq1f+/92MXFJGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Several functions internal to FS DAX use the following pattern when
trying to obtain an unlocked entry:

    xas_for_each(&xas, entry, end_idx) {
	if (dax_is_locked(entry))
	    entry = get_unlocked_entry(&xas, 0);

This is problematic because get_unlocked_entry() will get the next
present entry in the range, and the next entry may not be
locked. Therefore any processing of the original locked entry will be
skipped. This can cause dax_layout_busy_page_range() to miss DMA-busy
pages in the range, leading file systems to free blocks whilst DMA
operations are ongoing which can lead to file system corruption.

Instead callers from within a xas_for_each() loop should be waiting
for the current entry to be unlocked without advancing the XArray
state so a new function is introduced to wait.

Also while we are here rename get_unlocked_entry() to
get_next_unlocked_entry() to make it clear that it may advance the
iterator state.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 fs/dax.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 5133568..d010c10 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -206,7 +206,7 @@ static void dax_wake_entry(struct xa_state *xas, void *entry,
  *
  * Must be called with the i_pages lock held.
  */
-static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
+static void *get_next_unlocked_entry(struct xa_state *xas, unsigned int order)
 {
 	void *entry;
 	struct wait_exceptional_entry_queue ewait;
@@ -236,6 +236,37 @@ static void *get_unlocked_entry(struct xa_state *xas, unsigned int order)
 }
 
 /*
+ * Wait for the given entry to become unlocked. Caller must hold the i_pages
+ * lock and call either put_unlocked_entry() if it did not lock the entry or
+ * dax_unlock_entry() if it did. Returns an unlocked entry if still present.
+ */
+static void *wait_entry_unlocked_exclusive(struct xa_state *xas, void *entry)
+{
+	struct wait_exceptional_entry_queue ewait;
+	wait_queue_head_t *wq;
+
+	init_wait(&ewait.wait);
+	ewait.wait.func = wake_exceptional_entry_func;
+
+	while (unlikely(dax_is_locked(entry))) {
+		wq = dax_entry_waitqueue(xas, entry, &ewait.key);
+		prepare_to_wait_exclusive(wq, &ewait.wait,
+					TASK_UNINTERRUPTIBLE);
+		xas_pause(xas);
+		xas_unlock_irq(xas);
+		schedule();
+		finish_wait(wq, &ewait.wait);
+		xas_lock_irq(xas);
+		entry = xas_load(xas);
+	}
+
+	if (xa_is_internal(entry))
+		return NULL;
+
+	return entry;
+}
+
+/*
  * The only thing keeping the address space around is the i_pages lock
  * (it's cycled in clear_inode() after removing the entries from i_pages)
  * After we call xas_unlock_irq(), we cannot touch xas->xa.
@@ -250,7 +281,7 @@ static void wait_entry_unlocked(struct xa_state *xas, void *entry)
 
 	wq = dax_entry_waitqueue(xas, entry, &ewait.key);
 	/*
-	 * Unlike get_unlocked_entry() there is no guarantee that this
+	 * Unlike get_next_unlocked_entry() there is no guarantee that this
 	 * path ever successfully retrieves an unlocked entry before an
 	 * inode dies. Perform a non-exclusive wait in case this path
 	 * never successfully performs its own wake up.
@@ -580,7 +611,7 @@ static void *grab_mapping_entry(struct xa_state *xas,
 retry:
 	pmd_downgrade = false;
 	xas_lock_irq(xas);
-	entry = get_unlocked_entry(xas, order);
+	entry = get_next_unlocked_entry(xas, order);
 
 	if (entry) {
 		if (dax_is_conflict(entry))
@@ -716,8 +747,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
 	xas_for_each(&xas, entry, end_idx) {
 		if (WARN_ON_ONCE(!xa_is_value(entry)))
 			continue;
-		if (unlikely(dax_is_locked(entry)))
-			entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
 		if (entry)
 			page = dax_busy_page(entry);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -750,7 +780,7 @@ static int __dax_invalidate_entry(struct address_space *mapping,
 	void *entry;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, 0);
+	entry = get_next_unlocked_entry(&xas, 0);
 	if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
 		goto out;
 	if (!trunc &&
@@ -776,7 +806,9 @@ static int __dax_clear_dirty_range(struct address_space *mapping,
 
 	xas_lock_irq(&xas);
 	xas_for_each(&xas, entry, end) {
-		entry = get_unlocked_entry(&xas, 0);
+		entry = wait_entry_unlocked_exclusive(&xas, entry);
+		if (!entry)
+			continue;
 		xas_clear_mark(&xas, PAGECACHE_TAG_DIRTY);
 		xas_clear_mark(&xas, PAGECACHE_TAG_TOWRITE);
 		put_unlocked_entry(&xas, entry, WAKE_NEXT);
@@ -940,7 +972,7 @@ static int dax_writeback_one(struct xa_state *xas, struct dax_device *dax_dev,
 	if (unlikely(dax_is_locked(entry))) {
 		void *old_entry = entry;
 
-		entry = get_unlocked_entry(xas, 0);
+		entry = get_next_unlocked_entry(xas, 0);
 
 		/* Entry got punched out / reallocated? */
 		if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
@@ -1949,7 +1981,7 @@ dax_insert_pfn_mkwrite(struct vm_fault *vmf, pfn_t pfn, unsigned int order)
 	vm_fault_t ret;
 
 	xas_lock_irq(&xas);
-	entry = get_unlocked_entry(&xas, order);
+	entry = get_next_unlocked_entry(&xas, order);
 	/* Did we race with someone splitting entry or so? */
 	if (!entry || dax_is_conflict(entry) ||
 	    (order == 0 && !dax_is_pte_entry(entry))) {
-- 
git-series 0.9.1

