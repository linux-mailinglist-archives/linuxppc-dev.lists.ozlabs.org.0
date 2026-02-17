Return-Path: <linuxppc-dev+bounces-16911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHwCEx+zlGlbGgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 19:27:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19E14F1D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 19:27:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFp623B49z2xnj;
	Wed, 18 Feb 2026 05:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771352858;
	cv=pass; b=ALKllv4Wfluxnu3Eo3g50GjU7pJO23JJgCANVEMjzIh0xHHOlizHObcKhZ+eo4ANVQH/PiIrvrvpsr3fHgLqp8tGteskIYp207XZm/o9X9lZGnual59wC1udnrczz7TfzIMKSGJK1BvFUSds0wCFsNKD6pXA6nZJglcWgTDVhBbSAL0k08KBK1ZFnLH8CvRsEsbmbUt1OpIsfbf+QCRn/xANZnZzWYAZY/OvNkqG7jqhXqgpnks+J65p2RYlMsi0WmVcoEAuYguY2JrYYVdpKuuvFsMBFSbGNMaaU91YouiX6WSCumQmF7x3QT0NY2ynkKVWjs5MMwY/g5GsLAgtgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771352858; c=relaxed/relaxed;
	bh=Y7XGOpST/2qb2IafhoTaIGdIq9+h+cWXh3MKvoF8hKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N+XyUFs/3aZA5UU7qXFrrXfZkmkxvJfamvF1kL5WpgGjHkPe2W0txfdYf2pXCAJs+03tYAb1STQtJhvo2jwmqBS+8BfFT6L1ZYIlO5Q3aXgU10nbmx2KFYrg1pzSvmi2Qm/D/Tayupm74ltAvO3+DJCmRPpa16SDUdbmzi4OFh4uYJPZTI6fPkMtPelJ51KrkoUvLUoqI9dB0t4PrmC5PLasC9mPYAcv8Q7NB/I5TTbSdgf+xiIoL0qpP8RfVqx5D6V4ckrWp1pPNqL817tGsNLqES896Zp/ClG/i+dbChPmgWzfMhVGvBU2ghnVN6B95/ypMJAIq1GWE5CjcrBuWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=p4xOgisw; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=J5QbXwwo; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=p4xOgisw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=J5QbXwwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFp601xWnz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 05:27:34 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNLdD3789037;
	Tue, 17 Feb 2026 18:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y7XGOpST/2qb2Iafho
	TaIGdIq9+h+cWXh3MKvoF8hKE=; b=p4xOgisw/vIOSRkXbcKDpKNocPP90lQsq/
	S3ys9ML9Lkx9hDO8BekAvblMhfYDbh0FR1OCSErVoPGP0LtDcPLFH/aJwc/Pz+66
	Qp/COtpSI78eYj7Lpu70xm3iRbyQ4H+L8d23ZvnfQfdn0b+IpCI5xNmgGwSDztdz
	PCiv5MXdmq2TXGa5EkhhjLJHHj+r2fgfgtF0qxfcdAT2szsyhvUBv7Au8G/EA6ag
	DJBjiiftK0FbrufKC9AFA9P4OHCctmVYRZADOOpReTnSC/ncUg3jnRZ7ioAbONXC
	k14xcHLpKO6Tk8Vswtf+VkmZWaBDBgY2hRgA+rFqSX1rSPe4068A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5r46p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 18:26:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HI8o5T022914;
	Tue, 17 Feb 2026 18:26:50 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb2cjyf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 18:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiFSWdddJDULKaeFcJY1+wbCaWnoDP5oZ5/FoPpv9JqrLZspHWoYGwMgmBl06YeRmj+hBcocXlorn/IobeLFZsfpElhh+/rcbY7njaEhrBjMsRsA+4DPxYjkj3W8mVIlBBPUEyifa9FuyzukY9N/tFNUtUVdv9OkZlZjiGRGr6NSdQj2jKyVgrnKgff4MPaQ5Ts5Rcpf1ESBLx0oVy5ZiEoe3O4vCKLtK5lUo15J2bOlMzG7kHXwnmP10rg9H3BSgtaPq/nZvs3x4kWSY92TuVbiJ+a698g7b0S+jgrF/lOmvwD/MDBkZpGqRVBFS6p44k+cBpXEFDOSeWoDK9YfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7XGOpST/2qb2IafhoTaIGdIq9+h+cWXh3MKvoF8hKE=;
 b=qLPFD1MZzPFSdS+yB5p7bVH/3t8rE9AYaQNyDTrdy7O2d3kaM6hy1PyxKixSRB5g9kz/YZJWKv+6ddS/DZbN1C4xi1Q3aENs45JJAV6sFJuvnIOkXcTPhRhkzfH30AuFMH48hkAq/IvdMkbFTNmEAzb2uo0Vyn9TYFUzen892RCdwU0oQwdiLuxqCegKgKbkl5V8tCbnOnY2hjtwd6VARc6s4s6W8yvDKnVeYjSBgiECUd9tcS4IfffGFawwtJrf+/4RILIeR4Cln3l0IvemHrHsuvNBAm4wuqZ6Oq9pCsUgRQ5slHeKIcoKezGjlOkruFqcWVCq6A669zOUqPrxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7XGOpST/2qb2IafhoTaIGdIq9+h+cWXh3MKvoF8hKE=;
 b=J5QbXwwowdAV7g2vKUlNl3s2X+R+n8poix5U83loRTsuwCbgcmPa/uGaIuBErpD5oP/O2f3LVzJBj2nXzkoRDoXJOVKwpOkwHoTpUB+OanHOsoPRkg3SzQChwCdGvULrovnoNIWywF80Pnr84skdHYOw6eepn7LOnRH6IRSzgh8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS7PR10MB4863.namprd10.prod.outlook.com (2603:10b6:5:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 18:26:45 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 18:26:44 +0000
Date: Tue, 17 Feb 2026 13:26:39 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
        jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de,
        kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au, chleroy@kernel.org, borntraeger@linux.ibm.com,
        frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm/vma: cleanup error handling path in
 vma_expand()
Message-ID: <hoezvrhluigvmhklz5mn36wghkzzi46migabgqa6ipoefdreyv@ziljtzlif63y>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, 
	rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, 
	maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260217163250.2326001-1-surenb@google.com>
 <20260217163250.2326001-2-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217163250.2326001-2-surenb@google.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0479.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS7PR10MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bb5d5d-b821-4a9d-1d7e-08de6e521aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?if6iyZ5xLL/g2ZmdjTsuuTNwt2yAu0VkwKolmIRgupZZW0y6AZUpAHvraRgd?=
 =?us-ascii?Q?f455fAbz1jyaGlJ5x9xoVaSrydfnFIeP2waw35zYqSubabY9IVqxih1fVMgS?=
 =?us-ascii?Q?CNAGLx575JotGLVmY1y/StoP4fjss4euW/RD1l2EvddLnGzogPZS/TCrpFTr?=
 =?us-ascii?Q?eO1fxYUmLT4TMGQR+pUkU8nXJTMH9S0bFZRfqenYw7adTfeJ7sxu8bcczoyg?=
 =?us-ascii?Q?i7R8n6x368hOS2V2Jif4fOiwb/fWMXOKMO5adaaJVobOt9wFUJymFerskwcy?=
 =?us-ascii?Q?8bZA7WyEGs9WAFYYE5wI++62G0UMdVedafoM5Y4s2ShYGtxZ5KdtZOUchku3?=
 =?us-ascii?Q?nxe7bdi5aDAGMFzA6f5u4XPdWWkHh/9fgz2Oaht2DetnN7kBFZ5Rn2eL31Xa?=
 =?us-ascii?Q?iez2a2OjGpkxuEyBlpWRYBsX/3E24Jz+qhkA2juDze/lY4uhBHPNJHitTxy3?=
 =?us-ascii?Q?vxq3qXKtKYmgLjJNm+zK312RjC1iWnM4AeAL4q3EGbpswaH92KSP84tmRZGn?=
 =?us-ascii?Q?8ulg7TK85nOoLar8Jm47LZLlOqsngruQcTWNL7fMx/mm+kZ41wxhMq9LZBvm?=
 =?us-ascii?Q?K3AqlFzwcFU+JGX+H+NNxe5P3rFJfA7bjYvG+5PsQ+1Cs2cdZuwrB15UOqWv?=
 =?us-ascii?Q?nCp9fFJjCP7KS6odTsrNEYUewcQWK2wfz649DljvrObhZubgqdATkxk/F+Tb?=
 =?us-ascii?Q?1iQrijsN0r3yuFatfoIxafnlzc05ZNisj8cJPtShdxzlyTvt8OYJ2Jk9KV6S?=
 =?us-ascii?Q?jtYuJxu5EuKCDLy1Mj10ghbOr7g49SIn1Jf4R0DAUaGTD+mDLrVuG+z5VFah?=
 =?us-ascii?Q?c387ZdzpzkKn811cdrNTJcNMC5R+ZlSy3rlvFInkMToYz1ONVWeocLPNudRx?=
 =?us-ascii?Q?C2KN1nqmlWZVvG7A8syNKrGfQmafLdZyfSzIfRS8NJpFBlD4rQVn7rUYv9/c?=
 =?us-ascii?Q?rjEw/8TqrDGBe6ZS43owMwzVfu3A1zxFPqSgOjjm5tepW7slVlXFk8d19hiO?=
 =?us-ascii?Q?uOzZjrRRfD5MFgW3YwV/aagx71pis6iad7IBhBD+z/sW8ECSdPFK6XmFI3xa?=
 =?us-ascii?Q?Kwy0Qmn6VGblnr6a68e3uvoYOUUx/4pzPDkyyqe93CJRqfGsTJaF4gdOpFFz?=
 =?us-ascii?Q?2XzNZFDSczeTt7IiTpL7/GAvciMJL5Ff0HUcmELLcnG2hn63/Z25FqhQV2zi?=
 =?us-ascii?Q?ZezxHPKGyNf1marM+8jIvL3CvXZd+N0SaOzY+TGKZaNkYsuw4Thpsv6TxP97?=
 =?us-ascii?Q?FSN41u/7IBeL2Rk8fq1aUfXoAlOmhG+moyq32PEPAK+KflqfQaHd53FeNp5M?=
 =?us-ascii?Q?D2HkoPeHwP+Ac96RofL5UkyIyVv8gpotmrRynP6lCfb52Rnt/lhcfr9YlA2m?=
 =?us-ascii?Q?Z8IpGN7Et8ghBujt8rNaQb62QLfj5izHlDU3PB2W847NjjYFgNc36Qsb1pqk?=
 =?us-ascii?Q?6wSk6t/QyVd64lzz6u8opFinCfyWPIernawflqJ7hyGfPi6IUmuTebzKD6p2?=
 =?us-ascii?Q?/TAUbf1RhEGDzk0FiqnSo2Uf7PTONe0WY/BT1i4TuJRTNKD/STgjo5QfW+Pq?=
 =?us-ascii?Q?QV9memHL+M66EEePN5k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edM7PQ6PrGNv/k6L3OofTJeqkLdKi1xIs1vky6hij5Uof29RLptHtS71NOYZ?=
 =?us-ascii?Q?6bsYCCWpXd/nm1ljxVnNs1o/hK//14Dn8H9nWWBBvF6JQfXpe5DzfwZ4Az6B?=
 =?us-ascii?Q?2FU1hDRweJt4STKAmBX7LrarELQl3y4lBjF6ooWfi2DIYDcJKpKWOcd0xhDp?=
 =?us-ascii?Q?VeRsiKGZGrgVTfddW0SMTIQPbbIUL/Xx8QCimuKbyyQkV3yx81WQKCplvhpG?=
 =?us-ascii?Q?30t38LPdKExNXPSi5OU9gE7byAtut3gewXCAPIQisD2lm6Y4iLf/8rVUZY/D?=
 =?us-ascii?Q?bcYPWq4ckpr1ECRPEH7OMb6tkLIzjgUqarbPutxaIkn9mKbSF5OJCUfjm446?=
 =?us-ascii?Q?Yqi6RUehVkzEqw82k8dKDYmoJaPw0/AkbyXFu1DmJtLxOztDPWbMsgJPJz55?=
 =?us-ascii?Q?vyXOGX6t/g/e07jaFCl/Qt7QOD71eQlfMMsmMHm7dD/jISonk1Fdor4fKkyI?=
 =?us-ascii?Q?Hm/CKnA4k1PCqL0Z6Fu75htOlVDFY/bOpEkVFoFZy7G+bEjTfD9IGZy5cFOt?=
 =?us-ascii?Q?e1mIUDjqqE46MBnbIMFE6rwpAPJHAxxSsy74wh6SpFuKU10/v+u8U4e1PClW?=
 =?us-ascii?Q?JocXL4ORtBOOhN1P0mXbC5RTJGzX2BZHqoXEBdvUrdWQhDJ0Uk/IOaVpyiT7?=
 =?us-ascii?Q?OE+NHNrl646QGZpu9+EJLU9KFg09C9YQioo3Az32Xmy91x4evhcVYH7XPM2B?=
 =?us-ascii?Q?ptuyMmqzctXav2+lJZmQ/2SVwR+9Sr8teDrPYaue9nTNjK6iEvz5ECvo2orZ?=
 =?us-ascii?Q?Oj87HoQVqCPeYFMLSaCusxVNe0iUJQoIh+VjOE+J19zLtGXXuYPXQ7P2hf1b?=
 =?us-ascii?Q?jcLjZACBHsPIACfX3IY0diXKFCeNjcqM2zSyzwoz7BAfA4wxmkHOOS4n36eV?=
 =?us-ascii?Q?EocHjB0HfMO+0NKVl6ti834p0xhHjeiV+gjslWVDzrNZzn8DNwvsLy2qyMfC?=
 =?us-ascii?Q?ExhQhU+FtOH5DJczyFvcXVDoJaXx7OMBDtJhow8sbOpXRWS8TQz5alHNt68P?=
 =?us-ascii?Q?hbwdM/OSIuQn0aNpjBtnaOOfp2l62DDQ7kRD8wbzruQcsIr1T34lw7tQRUOn?=
 =?us-ascii?Q?ZwQq17LMt458qjZJIdnrQi1sMFxoosapOnbWgYHTu1HCfPBKGOWD2RhgWADD?=
 =?us-ascii?Q?CnnqlEolAUa/baLCTHPi2qKW/N/1PAtXQPq2Gq6k/IaP31HAwE9qyU4Ubyc5?=
 =?us-ascii?Q?SdAuQyVOoN69E7APKU+42LTHdF9jIDBjzXuA+T48V/qNfumoeD+1mqgSeH71?=
 =?us-ascii?Q?jVLXBVBW+cejVGBaRfjEUcRHqEML+Q+D66BNcTXeMakCyk2R6xpqJUtTPY3C?=
 =?us-ascii?Q?xwOw4wGcN/g8ngnSndOi3PveUMgtQWDfucOiT5Mls+NuqCDj2kGQFp48H/Tm?=
 =?us-ascii?Q?r9S1rOIOSvOPv4NtG7QVYtgUbQtOPDj46jwqf56Re/b6DyimlaG6L8aenCls?=
 =?us-ascii?Q?225OJsRsyoqMCnmF8o4zI3cVaCTvp6ZfG76VlEypnMun8OLwqQ3MUGWOmtgO?=
 =?us-ascii?Q?y0dxTofLzbP7KSf8+32fw5OCdknvovLzByWG8QhN8ngxUuXOz7Hu4e2dhwI+?=
 =?us-ascii?Q?cXoiWkZNcARGkqBFRYsTf/bI6ABozVyQojGbZvVacZVxBMiVvA/iiNMhrraN?=
 =?us-ascii?Q?xoXk04GeQIRLVwd/u2Er7PBzs5qO+Xuk8V4SfzKyT0eKcbf5ozOjOF+rYtrS?=
 =?us-ascii?Q?EjijqgdI1tBa1P5/wI9gWWEh6WhCL5EfEjLxfSBzZEDqRDDGAixF9bVvLNfs?=
 =?us-ascii?Q?ZVxndt9Wow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MDpP9Yi5A2K4TayYT/A2+3h11ARfBSFQqWYWKySZBlReJgTzymRPlB0eSGH7Pdo6v6+IfEexpubJ+aNChHnzDSYbVJWN9OyyJaOp5YwDoHZrA6Cq6pQtd6rDZU5JYlnLDyBYnDVU7Uc5opgScIhNEQ0tS8NnKKKZfsrd/RQxsIwrBaIsZ+HRwHrlAIYkeIvd/7enKgQ6q78W3nx1czkdxKfPsF1sYuHSravpUf+bLFaacFKbUfMflBxwrYG2oiYvl4QKMP7BP6ZV+HiVYoDrZrkbI88qiJzv9mmQEdcwQmIjvK8t8N27G6clOaRf8/yGpt0nFkthAQjn/PdhHCaqoAmVjK+mmiFRJKEnjRK1zwG9WyXTaVHktW0WKylvaf4HmL3EQAXzLMIAtYzn77cAgfFOp4F/Ej+YaHuzWIFJ6Hv0KSxnD9L5dtmwup9b6WLWIpzL9PKRv++XsOFqO8ri1DP60yOcGtN2AJApPT0Kdx2wMqFUfJVHqrvGngor6/zebgtyB420UUz7J5fw0KbxMwlcb3z4Ernw/ADhB+nrYxgn8q4hioj83Ez/AzGfhCsxxzj3qQc2XF5qFV52GDULRH1LSK2zGlV4ppmek9G5X0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bb5d5d-b821-4a9d-1d7e-08de6e521aa7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:26:44.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiU2hlZl33imna0qK9/TyAlfuR5jKCS+WCawc0hy+JFvFyLe4OPKRa6XqZRSmTKwUP6iFkOipUVuJQ6qZMbXqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4863
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MCBTYWx0ZWRfXyxQKPKLHHUXn
 RcL7ydngSetFLID/WVFy8KbNurAqiP2+PFPuCtfKkspovBNhcACJ5SGMH6ndwFUw893zukMKZUF
 ebv7Y0Bjpa3KNIOp0KK5+Cp1i87RFG7W5A14yIcKPN1KNJEzX2onvR+iPNjTAL4JFvnjhF2mi3b
 T69XPPmT8LNbUyMy2RUhCXGW0Iu4AcQIPtAWtFnNg976EBu9eww+F+zeeOzQGwAeSidq4j3XvzQ
 fxcX2MQtvMrMt8ozkw/OvcmP00ORMenFytDA8ng3GcVPWCnyJn2UucHKEdU+d+97wfB7IFLa7RN
 XkbJooQf0/vQ4M/VPcG/O3jpzD4b4mfdAOgy681+VW5wlFANpCYcmsXiqPttQfzFPpXfvm4/8fl
 KEAuykdGhQq1uF3E+V/+NHLfy/3aCWX7T8cdPYbZYQq+tcebyDVVOMdQczxTBymriOLM9wdPUYP
 FABVhsU6j3wUWOAm7B+zCJBrblOYZT/dxAW5gyPk=
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=6994b2ec b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=yPCof4ZbAAAA:8 a=OF6kxwJpqsOYwMMz9xMA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12254
X-Proofpoint-GUID: rFW1u1pdhtmWnT4patd4s-6baux_Btus
X-Proofpoint-ORIG-GUID: rFW1u1pdhtmWnT4patd4s-6baux_Btus
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16911-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuahahnjy@
 gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oracle.onmicrosoft.com:dkim];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CB19E14F1D7
X-Rspamd-Action: no action

* Suren Baghdasaryan <surenb@google.com> [260217 11:33]:
> vma_expand() error handling is a bit confusing with "if (ret) return ret;"
> mixed with "if (!ret && ...) ret = ...;". Simplify the code to check
> for errors and return immediately after an operation that might fail.
> This also makes later changes to this function more readable.
> 
> No functional change intended.
> 
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  mm/vma.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..bb4d0326fecb 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1186,12 +1186,16 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	 * Note that, by convention, callers ignore OOM for this case, so
>  	 * we don't need to account for vmg->give_up_on_mm here.
>  	 */
> -	if (remove_next)
> +	if (remove_next) {
>  		ret = dup_anon_vma(target, next, &anon_dup);
> -	if (!ret && vmg->copied_from)
> +		if (ret)
> +			return ret;
> +	}
> +	if (vmg->copied_from) {
>  		ret = dup_anon_vma(target, vmg->copied_from, &anon_dup);
> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (remove_next) {
>  		vma_start_write(next);
> -- 
> 2.53.0.273.g2a3d683680-goog
> 

