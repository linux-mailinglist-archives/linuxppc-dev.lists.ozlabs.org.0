Return-Path: <linuxppc-dev+bounces-16517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFSWLrCMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEFECBCC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4Pjk3swxz30Lw;
	Mon, 02 Feb 2026 22:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032250;
	cv=pass; b=LIoMe+qjidhsOQibVRoC2Lc0pY/DIwkLvo84n6+k8I6/0ac6S7MhwZhV0ecTQFna5Ew8X1bbpm3lpim/3KERDpXjqxT5PJnov0LQhi27w2Uqxde1Neg+KuxRn9rHNZLHGIley2ikXbkvLOQhSiA4l6AZddSzfP8nIBZ2ITchp+Su+0NlmxjtlmvEDgYQRny1xJKcwnoFItuYntAL/QUenq59LRIifjAIkmXUVh1cN4KJPIlCoIBXJHNE9tJmS8YeUJda2vcpaTjJYL/BKnldLj8n3VPSSaOLM5P/aRlAufkC75EeCIVBijC2W5CsNT5qc4JVUI6MvuXdiUR3OeU7Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032250; c=relaxed/relaxed;
	bh=dXXVqLFZzMvuIG8fUgLlO6oXpxs490K5Ahb+VJfzGgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L/FdCq6UKVurZufwUlD0SgxdKEufI36pKSPtvAvlQbB2udlbZzv+O4i4PvxxrnQhdcrCU3/bGkr0mq9Mk4ZugYuWEhftAA3g5b0o2XoixNo7iUxUUfIERqN1o2IVgH2DFSIf3aIQmcpaEu6Rt8br5iNF0kS/t4NIfV/5OB1JY/Ca7+kyB8iJOkKcPF7sgIarWQlceHrWrzdqIxWRUZ9ENXzwxPz2J/9HnH+WZ+BzcLpUdaGQ10ymP9mDOj7iS9ijcCQMiNSbA8VmsD46//J5VJpjDtOuwz0UKJa68NCTE86kjdPDIPLGal0aMVdbkgL9D5jxTKSUp5x+kUb9EIzBCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pR+59zPK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pR+59zPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::5; helo=ch5pr02cu005.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Pjj4xRXz30FD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kdh+67dhSXySSGQkBkFKjlL9Uce6bCo1ZJf/+AsM8CjFcAN/pP0solgdZV7kh1bjPuuUZXsXkEjhs7YTnRqvEOrZKdN0IXS+tVJKnnXSnEbj2y6kundwQQHd285x565aLoGzt9lCXRBHgGH48CfllmIipjDUA6yxjEqsRNaxsoTXEQ+9SMshq6vYYfBD/33B5MWQhPTZQMlTTnjY1n+af7rW+kdQ05I22TWqtkZoPHCl1n96DL1pYqnvFwPjrmxg5CbRDxUtHYhldw5rfhQb8tWwZvkpYurR8qUM1P0fcF+rIDCHfrqEqCYB8YpnSNEYoLIcjs9wWAu75dIhZ7imxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXXVqLFZzMvuIG8fUgLlO6oXpxs490K5Ahb+VJfzGgQ=;
 b=y8KiVElrLz06Z7CpEdWQNNXBOPc3RxVRCQcHoXDxRece/mLhzIZJ6kHw7/5eAxHNtQatS0/GI4IXvZZhuEn1wjIS9Y2QP3lWAdNowX+KMAUui4G5UovR9stjIaJX2qkIsKpi9Na7Y38HwzAmV+01Ug8Wyd39c+YOYA30Y43FdyIKoaXFdGub5lq5xXZ6MPG0u2fJ1e8WyvPtHcam2SyXIjiNQm+Q9AfwHWekauU6fS8H/s+/zFzO44+vPs77U845ulPgExNXdwtRyNQgQ1CAyXPhH7Wxy55YVWXDz4UxD9hqYPd+3BMDbthuVcR9Zduw4spug3orldW7Lf8J2R4dbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXXVqLFZzMvuIG8fUgLlO6oXpxs490K5Ahb+VJfzGgQ=;
 b=pR+59zPKFFphKGkEKNL9Ts/M6nDsJdKGHoVrXTKXlvJ5Fqm0x9orvyiKYcK2svGA5ruXdORXnDds9KQYR05d8bev6k0SPakIC2k1QMVnPpFXwPGkUzM4V4up31gbVEr7KfpRepvmQHDklSSZ9q6hkN2+KCRuIsv4gfXKghsl14qs30Zk4xO38roYHAeLIyD3KFnazxj/y2/cU3/ATa1m0AqBqGNPfE+sVp/9NhPbD0s4k72C2+PFe4AkAV/ms+QkIXHo3/2v4zL93Z5ncAcMgVMJn25YDPk813FpOKemQM5mAbU+3MDMitOZdbSCju4smZX3yDIBH+TyYSaionVJLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:36:50 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:36:50 +0000
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
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 01/13] mm/migrate_device: Introduce migrate_pfn_from_page() helper
Date: Mon,  2 Feb 2026 22:36:30 +1100
Message-Id: <20260202113642.59295-2-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba07c36-b260-4072-a923-08de624f5ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ezcHg+i6R6dPOyR5GD7MNoVqEFKy+6PXSucQBILGzBJn2LVfvUDSw6PCN6pu?=
 =?us-ascii?Q?aT8IM9Gv6PHDdDzG29NL6tvZxMXxGWhws5dLr78L4mWpJy6VZYULMZmZANJp?=
 =?us-ascii?Q?HUZQxnYE1/jqKJljUQGoE2crBSL9AimSfAAEZqR21obKWfz8+ErP5NdTIwaE?=
 =?us-ascii?Q?ScrLn5b0I0g6ebzkWIEeZHNAZPlhn81aa5jFuXN435W+yazBetFR3qmQqble?=
 =?us-ascii?Q?L850GkNOl3dG/VLV4Q1svyKEyfsjaOYI98OEyWVnq/K+5Ayt99H2mJia2/uK?=
 =?us-ascii?Q?0kehhj9KQWkosIvYynolgB4z9nGhm+WFFxd6mkt9jGKHkKfowO9MA/VrZnPP?=
 =?us-ascii?Q?ZAZjqLpc82M3503p0ydGnBm8/gJzsirzNWhANdmu8QghUpZOocFUW7hoWnOV?=
 =?us-ascii?Q?tPRQTKND20Y/nOSzzWxAaPEfuc2Fqi7ol/4eG83WBCpq7SYKcK1ZroXIJ8rL?=
 =?us-ascii?Q?pMdCNBbPAnrL5vIps/nXEBPwPJsXiaTbhlOQOyLHe7urq8uQeQ8R31v7JIdU?=
 =?us-ascii?Q?JGz0muVEPEQdLYyrrC2o9nLoLyFiUSgP5hK7QcpXKvJZ8ghdX6Tt+Z9jeUFt?=
 =?us-ascii?Q?Xc6PrPUa5137Eyh6d7G7w227Wi24n1wT+8h2E9CBru2uh7I3CPE2T5KET9tH?=
 =?us-ascii?Q?E/QAVuZX6B5D8Y8YfGiw0+B6lOmXOMRNJoJO8pE7fm//T7pvTC4/Fvj0nvOS?=
 =?us-ascii?Q?WgMV37VFWFYzcksAkJ27ZZL44qsxiVT96DnFwot5xB2wn/0YNfd4n0eQvCPf?=
 =?us-ascii?Q?opkzaQljZHqBVGK8ikCcbzmdQyEwLSEJd5f9qpgCNzjHQrEWKXkJKUgApipN?=
 =?us-ascii?Q?d/5HVfZ/Q9lIpOgEJhzNfbgGkfixaj27KHodRby6n6TNZcp2kpIzvhz4/5vY?=
 =?us-ascii?Q?XDIeviS3+8RwFcflwdiuD9kdVoWrPoAniY/q+hOp/cmoUxqNMVFFmqYoOMc1?=
 =?us-ascii?Q?rp5ZQv5UL3w+HCp+qAsPYzRFWIvMxUTQfL96Fj/UXCQksdNsESrpRJxOvHkz?=
 =?us-ascii?Q?SdlpASQ2HFZ7qxeoj68mETS+4/h6kz0kwfBhZx2qdVFhGbshfgC/8+0YNvQj?=
 =?us-ascii?Q?/cpUtn/ZSpl4uZNNPz8MQcXY0DWUS2j0x79ltdx+VHGLX8UfJbEsC+4ZKrOP?=
 =?us-ascii?Q?Vr2TVDUckcNZ3YBnslCYG2Fie5yo08seobDPvOUu+3Hj5OeK1b4xrlJkQGR3?=
 =?us-ascii?Q?nPJ9XikwUkiQf0bygxpRwVLboc/79zGTI9id6up9ZI3lR4OOUwZPmSfqjX+Q?=
 =?us-ascii?Q?a2zWG3LxU2l0e1JBw1kmc8Fsb7bha3jGKaGGpxE+w294h0mUniZSv4+auwRG?=
 =?us-ascii?Q?zZ+ZO4fEOCIlptdyC0AjkgJKVWwaW3SPEKIuTwGlvnloCCsWXeGDl0SFlsIu?=
 =?us-ascii?Q?l0IMghPCZHhlxALIzOMlat35oCqJBfXUhc3G+/EfzYqqLiHcLxUpyKiGDj+J?=
 =?us-ascii?Q?g1QtsGn/AbyTZBBbFoxwnUZ+Xh84GPaPPBD/E5purXsVHQGjlzdPm8CDeLG0?=
 =?us-ascii?Q?FvJStRhHCluBykIz/i9E8ar94OTpaq8CmehYq8xaTPMMSpQl9RGOTLtKZPn9?=
 =?us-ascii?Q?pcdUJS+VbeMmCgJn+20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E05bGWI3xoPtzqO4YCjXmMROMO5TmrfVaJfsKsq8LELDwDHvbWT0TZxsGClC?=
 =?us-ascii?Q?0xFIDJbxG2BpH3P+61n5AjQ9/RKuUtzfsvukMPPI1wIhl6EcSZ+c63DUyqPZ?=
 =?us-ascii?Q?DsDpP1uSC6OKJz78ACo6/xRa5v2aRBjcu2x/6JRCtUIdwBRztbz9cH+L1WSa?=
 =?us-ascii?Q?jjeM/euZbQsEk+nt6zy9Bmaxwv606P1SEjHiQCIqlL3b9uP4e8SwGRHK0UO5?=
 =?us-ascii?Q?dSXEVhihSo5pHQ676r/E+uQ6EwFRsGoDFjBl/zJGNy+WRux/ywT43x3pyVBz?=
 =?us-ascii?Q?D61j2MzI3hg7q2WK8OFTQ7S1UdaZPN7+fmDqLhsr4Vw4zktrFoMA7d29H95U?=
 =?us-ascii?Q?IVWvRaPEo0D8YOHdnVBDvosL4iqJ2IBn5XRa7s2SJi+chplEFunDtvBN4O5F?=
 =?us-ascii?Q?uBtD1B4LS1YJJ60yBr4ud99jx7XMM24kFciHnUHCSRycUG0M378iP1atmaIJ?=
 =?us-ascii?Q?IvmxvVGbi4EaHpLm+ShK9V5z6MAmcs1Ms3UtelmcI0IT/1l3WcnHmPAy5dtB?=
 =?us-ascii?Q?9h6G2bl0eAZhxWuWfe+NwUtcrY1f1/TjMd8Obb9kQa3buJvtESi1vKSg1EFb?=
 =?us-ascii?Q?ceU6HwtyLR2UW2m21fKC4E/V/KmVeTND0oRDVjljCd2gNI8VDa4ENH5x0Biw?=
 =?us-ascii?Q?Gu7gB1bxSpX/pTqbEKb56eQBxC4QRWPJAwqJmnzcN+erSBGHxJ0NS4ewbw1n?=
 =?us-ascii?Q?brz9PnQM46YK1PYtFp849/xDm/ikC0yvZ1ntMjsmKvfNiRwM0mOv1LNjz26i?=
 =?us-ascii?Q?EhW5XdJ62QRJhDelVKy5hbUpTEDhtc/Yw/bBBeZNKs8+xMosv8sWCBX5XfLN?=
 =?us-ascii?Q?hBpwqA+LZJtohpM8aNYrS9HzUXN6P6s7Apjm6L/R30DpA2nYS+gxkRHz7riz?=
 =?us-ascii?Q?aJJnv+VNHSwxALZXEvfRs+Qpwb8zPbz3gSVSP4evpklhg/Hot+fVfj/n7t5b?=
 =?us-ascii?Q?e5yeA5CfEvPWoHu6Qq2xf6Tp/S9PpYfPis2zfqtrslEKXUaPpYC8LQ0dF1+D?=
 =?us-ascii?Q?JXFEB851+yCi5qOhvTnR6BeYKIt+uhLm0yyYx1a0FzetBk81ladFEUJ80zRk?=
 =?us-ascii?Q?muJH9W9rgL/4T/QM27jG2rqNWzTJCGmOxXucoDRfBrOvk2ed4qxakNgI0GKg?=
 =?us-ascii?Q?L8vhOkILSFBA43IUopkP8cLDb4jQ58fvca0hMn39ziEgquSaB2Debzq7tsO5?=
 =?us-ascii?Q?zb6fGi339SL3m9cz4xNnAJj4o7VLLOU5b1VhRqRF2EdNa6gt+eNHdf92zCRv?=
 =?us-ascii?Q?HbaIt1MMPCX+iHocVMyR0LcAou87DC249IcA2hgW20Z822Php/t2wx33jJA5?=
 =?us-ascii?Q?z8+pNOvXHrgGhG8GEgAehLd3meuZ3FzV6wl+1witNKqzF7xjyCsO238yPIfv?=
 =?us-ascii?Q?Pbwk2Xbavbq36fAdWziXN+D+UiSJEBPeE73jlGoZzqAJiSmtjzucWj8ML4nx?=
 =?us-ascii?Q?Mcv0IpMtEEICZC008gkzyRGdkJzMELHLptaMg7Ct1ObLNMI38WBOFul94yUB?=
 =?us-ascii?Q?pj5KE1R/BmXSeU+ADHG+srIGNdAsKljqLbXzWi1va1QLa2BoXL7nOKY7K/0K?=
 =?us-ascii?Q?cZGvH3uz1vexlEP0raF/C2zPSai772pZIjSlJuOWaiMeitxeqe5i2HReUGB/?=
 =?us-ascii?Q?qOPtM1SczKcX8GLdi/aCicXQ+i2MwFphUiu4fLx7FcgLKUuAJ7mr1hv4gPhL?=
 =?us-ascii?Q?Q9Vw5htBKia6AzKxg6IQz0AzfLN/mWxIleeQ5dZFacN3kMMKkxWj5vHWETnv?=
 =?us-ascii?Q?a3e3VVvbfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba07c36-b260-4072-a923-08de624f5ae0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:36:50.1365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FB/+1fzxEeWvwt0A3gnL6vLBEZov1wgBUB93PeiW6oUvHLt6V3T/r7cq4e59niJsoH5Sio6UO8JucSAeSpEHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16517-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Queue-Id: 1CEFECBCC4
X-Rspamd-Action: no action

To create a migrate entry from a given struct page, that page is first
converted to its pfn, before passing the pfn to migrate_pfn().

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new helper:

    - migrate_pfn_from_page()

This helper takes a struct page as parameter instead of a pfn. This will
allow more flexibility for handling the mpfn differently for device
private pages.

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
 include/linux/migrate.h                  |  5 +++++
 lib/test_hmm.c                           | 11 ++++++-----
 mm/migrate_device.c                      |  7 +++----
 7 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 7cf9310de0ec..47abc220ae03 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage));
+	*mig.dst = migrate_pfn_from_page(dpage);
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index b021f1e56114..297fa108ccf9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -652,7 +652,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
 				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
-		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
+		migrate->dst[i] = migrate_pfn_from_page(dpage);
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 38eca94f01a1..f5e76c75e609 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 			goto free_pages;
 
 		page = folio_page(folio, 0);
-		mpfn[i] = migrate_pfn(page_to_pfn(page));
+		mpfn[i] = migrate_pfn_from_page(page);
 
 next:
 		if (page)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 3d8031296eed..3448e27bd42f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		goto done;
 	}
 
-	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn_from_page(dpage);
 	if (order)
 		args.dst[0] |= MIGRATE_PFN_COMPOUND;
 	dfolio = page_folio(dpage);
@@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	mpfn = migrate_pfn(page_to_pfn(dpage));
+	mpfn = migrate_pfn_from_page(dpage);
 	if (folio_order(page_folio(dpage)))
 		mpfn |= MIGRATE_PFN_COMPOUND;
 	return mpfn;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 26ca00c325d9..d269ec1400be 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+static inline unsigned long migrate_pfn_from_page(struct page *page)
+{
+	return migrate_pfn(page_to_pfn(page));
+}
+
 enum migrate_vma_direction {
 	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
 	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 455a6862ae50..0cc3ba9b0502 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -729,7 +729,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 				rpage = BACKING_PAGE(dpage);
 				rpage->zone_device_data = dmirror;
 
-				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				*dst = migrate_pfn_from_page(dpage) |
+				       write;
 				src_page = pfn_to_page(spfn + i);
 
 				if (spage)
@@ -756,7 +757,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+		*dst = migrate_pfn_from_page(dpage) | write;
 
 		if (is_large) {
 			int i;
@@ -991,7 +992,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		if (dpage) {
 			lock_page(dpage);
-			*dst |= migrate_pfn(page_to_pfn(dpage));
+			*dst |= migrate_pfn_from_page(dpage);
 		}
 
 		for (i = 0; i < (1 << order); i++) {
@@ -1002,7 +1003,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			if (!dpage && order) {
 				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
 				lock_page(dpage);
-				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst[i] = migrate_pfn_from_page(dpage);
 				dst_page = pfn_to_page(page_to_pfn(dpage));
 				dpage = NULL; /* For the next iteration */
 			} else {
@@ -1414,7 +1415,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 
 		/* TODO Support splitting here */
 		lock_page(dpage);
-		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		dst_pfns[i] = migrate_pfn_from_page(dpage);
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
 		if (order)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 23379663b1e1..1a2067f830da 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
 			.vma = walk->vma,
 		};
 
-		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
-
-		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
+						| write
 						| MIGRATE_PFN_MIGRATE
 						| MIGRATE_PFN_COMPOUND;
 		migrate->dst[migrate->npages++] = 0;
@@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto again;
 			}
 
-			mpfn = migrate_pfn(page_to_pfn(page)) |
+			mpfn = migrate_pfn_from_page(page) |
 					MIGRATE_PFN_MIGRATE;
 			if (softleaf_is_device_private_write(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
-- 
2.34.1


