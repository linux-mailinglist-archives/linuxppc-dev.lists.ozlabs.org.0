Return-Path: <linuxppc-dev+bounces-4068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C26BD9F0007
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 00:23:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8T7K3R5rz30Wl;
	Fri, 13 Dec 2024 10:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734045837;
	cv=pass; b=bWXwYbW2ebKqt7XMfPnuGbODdaGwg3eVKBFOazOfZ+hK3PGdjJ7QFi48w/bZBpC8T7Cox/HeqcQs+g0UYphs9uMnUYqrtv3x+P7b/fYFldcJPbTpYUteiCjjxa+6+5ZgcgHXJdqfNVIAjXZv8ZC4rLB4yZa4ZaTg6k1WyZp9ECGVTt71InSXAIUx5ipdbc1J9NAeVYB+NjLkliTAaa06xCEIDyJbQh1bCrvrLECMZJQ17YOg+Hli3J6EA2sKCA2nj3lk9+XYAsZ1Nw9ccAI7IEw2+mcPY1uIlZtNTcKqjyk2OX4N0F7MuUBHfn+h4aDoX2kzfVhdT52RkZrS0oKQjw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734045837; c=relaxed/relaxed;
	bh=bnlxJ0qxYgOZ9Im+efCrHalg4ItFI/zq87QP6zYwQx4=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PVExH4NVvycX7q/ZRl30PzzkI5Qskvt78LISVxTCYjJqEvkqxDv9ptr6QYB5CAObuPfgl3IMzdpJBBwZUKY4rlZiLtJydiPdFGfnjaPeLufUM07jwRCx00juPuvyjHtezBCY+w8uS/9KYW/R0BsB9iytouv5lzfcYEY+YvoRDeGg3RjCUbmij/WZqw8aHIxafnL57Xs6yQsCAHJSQX2vTwfhaayVXPPCk3uVVxUBbflDqZnR1HALX3mPUV4Cin35WzBPWJ0Lrt3PxQIRyLZo6LmJhtX/ScyQlycmfBjP8YrfQE7He1EcQnJ/PDDeCdKbByBmAUutnmxO7TqOjkkwow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=jxEXSEKi; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=td5Yp3w4; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=jxEXSEKi;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=td5Yp3w4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1868 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 10:23:55 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8T7H3jJQz2yjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 10:23:54 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCMgCKc023113;
	Thu, 12 Dec 2024 22:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=bnlxJ0qxYgOZ9Im+ef
	CrHalg4ItFI/zq87QP6zYwQx4=; b=jxEXSEKiiBnD/Ouzn0DdbFRGoqKuD25PFa
	Mc+d0OHFDSkb0YSciYf7JHgLuL39MYXicckmf2UKJXFYjZCt1d5VjZxfJcLoXYTS
	bwF/3XY4cFiF3paBNGRDfUsMjS5Q81b/ndeY/7GwC6fSYCxWsnMmR2Sttzx3tVuD
	1BvUciSNeEWTkNNTDnKJ9yjUKmoUwaIs1z4W2U1wVWJ+zbAU6rCGvRfOUg0DIET3
	a8HK2wB3q3YaPmK5s99BnWx2kg6dkeMW4msPFJwGIXjs9yFyng2k3HHOy2QpqCwb
	aOWa9ww1twYpOmfTfGnlNBexWom9eVXbXU3IGmYGHHuYcQZiPsJQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cewtcen1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 22:51:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCLe6dw019258;
	Thu, 12 Dec 2024 22:51:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cctc1hdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 22:51:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0Mv+wmBRp1+tpPH6KQxUB0ffeMV9uPxbVNUa8xxJDo2olu7s7Pz2nCSVQuyJAPa9RsjoDtsxyzcb67smrhp74g2aX5Dzw9pq0v3vodNJjrFeCKQq4Rvmt+5ROIM9luUA3YB732gkQBJk4IiT7uil3cmoAAGBXBeoc8AqfNW7cBQEM9gWRnmOqExxqgWRRTUhhQXVjicea8IbaYpyzKOvd8CSz5qaDKa0kWO1NGHWB9lX4g6wHn76UmBlUbCthKEQKytdmjY7VHxCxQ/DtDVxdrqVMbJfeTC3WTEEdtkZxo+HvED07rAv4YmT8ZJq8zye8H6JYJR4hDiXtHipEPOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnlxJ0qxYgOZ9Im+efCrHalg4ItFI/zq87QP6zYwQx4=;
 b=CGY1HF+ZzjoLG9W8YzNpMCR/qaheUvMHNmvfe3tgbv2LtdtqF9WwbCJKU+KQ7H9GrJ6r6MOeeCuCdOU88isvOIKwE73HfxAuc1ZLgq7PSy0aBDs5nLnF5I7Toh8XSIux2rO5ei4mQNoIXxnw6zSPjmHMW2sxsn9Bfc1ZoIV+QiGPji78+egFvKeq+8/ltXTsaJZvvRqYFdoXAi8WnqwS21DEpq9/t5my4KhAnuOfR1oOtlcj5mVy+/acdnLDRUWlYH2TgejNGO1wsb/4NZc28+9xeRses+/KtAeMOfHutNwDaCZ/qoIBDgiljVcVfdfDO90ByuJI2jPzoD5r1/BtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnlxJ0qxYgOZ9Im+efCrHalg4ItFI/zq87QP6zYwQx4=;
 b=td5Yp3w4GJw9L9U7ZwBjp0cPdTv+yTUBXmNpGgZQnxC+91+N3m7cLMS83OFdEVO6pAgAvcYdMqXH9gCmwfToP8d+/rl6mP4fdTmdra63zWF+1/usoUDbm8rykTmSxgToCwcYSsgHRvq5IaP4nMxNqjSvogniHpaXzmM0S2YiLT0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA2PR10MB4521.namprd10.prod.outlook.com (2603:10b6:806:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 22:51:38 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 22:51:38 +0000
Date: Thu, 12 Dec 2024 22:51:34 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
        vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
        david@redhat.com, minchan@kernel.org, jyescas@google.com,
        linux@armlinux.org.uk, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
        dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
        andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
        jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
        leitao@debian.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
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
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA2PR10MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: e71b4607-5fd4-453a-2ca8-08dd1aff8970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XvXyyntWcT9X4fy+8awqqhelSxZTkYsjZfO6xT21jaa8pkPCoznyfuNbv7CJ?=
 =?us-ascii?Q?IfxgQItdbtZEdPVqGsdtfiXKvcmvL0zP3/4znxtZWz7QRG0PGFD2fRz/N41v?=
 =?us-ascii?Q?hwHetYaFLNchGTcH/4lPuJNIBuOfMOn1Vbt3wyPHPfdWi31OtymJpav3nUAV?=
 =?us-ascii?Q?keLNVKs0VMA0qGqe3PZ4o9Ist0xnFenF5p0oUdLZzPwAlz87cWyIQGWrw9Lo?=
 =?us-ascii?Q?jKC79L4B1VfT/e0/vlq1cRjJk/d7B0mhtUAjRfc/3uqmuGyt8TG+4Qo+27py?=
 =?us-ascii?Q?8O+Hau5XhwW+/h2d+XFlq7xEXog49fOFmQ8BPTYopNg8aBDmvZBE78CSCGgE?=
 =?us-ascii?Q?fkmdqMZlgSonMV/+jjpvufItmSk6ZgIHIoHQ9iWEYcfmMJNutoXTX+x3uKuO?=
 =?us-ascii?Q?S2RKnsle9BCDkQBO8Fp0XbP2MFHq/TuyBUafhQFpWEQ1E6FEh9e5lCDycEcb?=
 =?us-ascii?Q?lxLboi695oXEy6YD5/AsQnoqaWqLJf/tnj+sdn6tOIeLozQIpKuAlVOqCFTZ?=
 =?us-ascii?Q?NcWs6h/lR5NkxOnWS1S/r6psQP52CHOrP/PjmKfWQu4eZY3u76L+YR4YwayR?=
 =?us-ascii?Q?k1ggB2rLj9KLEwdtqQs834m+RABxiY/i/LZPhz7c9E9ZCI1tQWZXHoyON3jG?=
 =?us-ascii?Q?iM4A/cm8j93NmEqJ2pGHmkwOylv0Jg8/JuDPoqhNpRDf5Jt1yJHJMEmFmQve?=
 =?us-ascii?Q?DI0G45V57kyv/D2GbsolllQ411igYyOEDyc1Btk+iBPUH35nBWd4T2GSxQGF?=
 =?us-ascii?Q?kAYiqn6mdxY47z8eT4lSgd2QPOW4gWtzl2pV2pKoluAMFoGRMtQykEe16ewZ?=
 =?us-ascii?Q?MrlwubJnVrT4fI0IZARuQLdISGLrR44f/yisUsk2yBV/DCMEZoR4+zPc+HNr?=
 =?us-ascii?Q?kiJ4NZCTjKRlti2HjmqrX6gfQ7OwfE3fgOtkiwB7muty5BlLSPg33670D9fZ?=
 =?us-ascii?Q?5g/M00DVrWACWBVYryK4XRhZuoydlZHuPACeWrO5qeW+NvHuFFmaiyU3LxvR?=
 =?us-ascii?Q?yradFpMvk5PUcx6/ELvxmw5txTrw1DsE8Hd0QnvESzpQXTVskZCbf6GHgpKs?=
 =?us-ascii?Q?krFx+5tABDlrmnl1GqSLvlhm7DrnePZ4MDD5o3ceMGMDlBd+8B1MWYgV+YaS?=
 =?us-ascii?Q?XKCerVOdiqKppN8NKUVUHCDV8TS8UAMBSiNvzFA4Iz4ma+lXZURdlW639yxh?=
 =?us-ascii?Q?oyC0x0uQ50Tje/4VifPHpY1dNJ0wxPq7vMRz8q2t+lUC01e8NhllhCTRwx0b?=
 =?us-ascii?Q?o0i4PUJz7DYClymW0IybwvV+uZdt1/5BDkfrovgC65DGz8ySetfKbTKPKAGd?=
 =?us-ascii?Q?IWoN+Ef4RMX7mev5trXeVrOltxZKGoVJDqNRoJDnlQat+2eJO9HhfjmrcD74?=
 =?us-ascii?Q?4g59IBCxJhN7cxPSjVullgyiJjNGJJ2xTEhs/8zSTXGgbmSmID14um19aW7i?=
 =?us-ascii?Q?UdxN3U1DgxEbXlPOvwGT6gNl6j20mho/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2dujTpFwwQ2JbBHbnIvGbZ3v+R4iXeuG0BHsfv01RVR1mba1OHMfoAAIfDYl?=
 =?us-ascii?Q?bgE+5lZ8SqgyBr79ZC3Tv70oLxpRHP2uHvnOEjqbN96P9i5jac1zZocQa2rQ?=
 =?us-ascii?Q?qjg7jeS78uO+84cl1PuZoh9+A0vks09oTiTqlUwud1Iphb+66K/tJfP5AIXW?=
 =?us-ascii?Q?AuCKeI4gNEs23Cg2pE0vk4eSz46ud/SUPmP66yMalxtDXcFgT8L8AumNRiF/?=
 =?us-ascii?Q?1r2tH63qLBcxjOtW6n8ZeUu2EEWuFHKzj5s6/LvdzTe/uSzjXlyxKwdP3yIs?=
 =?us-ascii?Q?3VFdrhf+ExVZT78k0H841TafFgzA3ZkJ/KUwhBwRPag5ALa//seL4WGsUFxc?=
 =?us-ascii?Q?fo4d9GssMhaa/uoiw8jAnxj7SMzG3rRTi2hoVqSJ4sxKcQVNvLFfLsifgqpI?=
 =?us-ascii?Q?OMvea0hRFNFbYEqJqIw5H8JqCHi3zhBODFYq2G2lFeiXOowyP28xBm4aYFJ1?=
 =?us-ascii?Q?2vMxkJw/YQpA7Gotny5eDMFFDuVL+77KkD6u40SsxHIaShm66yro750VK1Ji?=
 =?us-ascii?Q?GX586UXUXigYw2GBLnjQ+rRrjByPUFtjEIY2Vn+ierHf6YMLz/ec2+WNv1Dp?=
 =?us-ascii?Q?g+4zaKpnJH5QUuNXcmOz3dRJ73qd2+mvZ5BTRc2/HI6MGw05djuRiuJtrAfO?=
 =?us-ascii?Q?m7+cIq46gBvPaacHGN+5fQAaxdPr8FKX/YoNOoRH6T/19+UbqBo0+B1Y7tvk?=
 =?us-ascii?Q?iBcFTApuSftq7UAZd1gfICbffRl9BTHNaGJoA+j5Kc82lXdRGdY3ODCuchgp?=
 =?us-ascii?Q?ipIt/Fg1B/q1H71oxBgkqLV0a5tBzYzkiyYVuRsfIYJZrwLV2y8V7qNSIsAU?=
 =?us-ascii?Q?eHcJ8aBkz8juL0eIHDkArlbBF+ilDfst4/jCFuseaT/DEanCCfMa7AKptPda?=
 =?us-ascii?Q?knkY+BGQzEWnAfIWlMhR5GNWwEyY21YTemTfMgNB5IvpkY4x10KnofZFCO9v?=
 =?us-ascii?Q?YgAZmTqMuCigHQLAsRSun4NklUazzlyY4++b0yM28f/FH9WzNqnjIuXKC1oR?=
 =?us-ascii?Q?kynoShJQY5zi3XkhlOoSR8b37a8X5T4ly54ek/lSsIDDs36TwoKoaeCtGhOB?=
 =?us-ascii?Q?uTH+BN+OP1GP3cEhjldfG6qljN1zc8+G6cQH1I6JfecHSPPQLNPonIyIXUW3?=
 =?us-ascii?Q?lxRkTgM7Vn2eFTr3OTMq1NQlSiIsX9oT95dpbTcO/I62rC7pzvQ4t+IoTV1L?=
 =?us-ascii?Q?B9ysjMvgvdoyU/95iUc9Ouft5ae8tnYbeDftCSXLbkr+vutno4meMWUhRyMv?=
 =?us-ascii?Q?YX0nw4mQyanb47NgdPV9hjVGZazmEXUz0PIDU+njbymPuq2b1h8goT1ND010?=
 =?us-ascii?Q?9bmnmZh2sQ8hghLm1VvRgCxNRElcuLc9iVxiL4mXrdKj8ftlI5Cq7lfWpTcg?=
 =?us-ascii?Q?mzohYPnVM/vsJK0Zy9/tJm+FbNF1YdSHQCf6fI31Wa5elgRa14OvXbp9r/9h?=
 =?us-ascii?Q?LHLRnrJf07gQuYY1POha5AYPe686u/ExBw6487DrzbNch3mpeBvay9gU49Ck?=
 =?us-ascii?Q?7ZJRCVPAvHAMLWUeOn26Khf5q9iZHa2FRsVPBx8ojk2jlqbh8T1mVFcUyziG?=
 =?us-ascii?Q?0LWu+YkMYgZFnDVCGVI2tsyiN3LHGUw4oMQaSv/4+piuCB1wG5X2R4eKTMEW?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XUPgrODeX1GP5LXCz3T9TRq5heOBws7XOg+qToZM9Fy09Vk9IrcjXgrTEstJY4UvrvyX9b9ALwN512H6R93jLFj9ko2phk7cvQS2bq+SsMOvUd+TujYaCVmXBBjcwUzm+YwSGgf9QKuke2WLKZ7dwe7BO2clsZMC3HZC9Cz7Mrtb76yvJmcJoo9LiyxqHJNMRPfPHTWX4AKAg3MV+UP5pkzJUNzj1uigbmwTSdK+RDKTEBw32UgPJC/y/ZHxq4LKDPdwlwYaSYWIvuGu4x8LVDjWC6dI3ZIoPgH/o1kMbM65cYyNPVvA8i+44JpNNZI4/rrkzmXW75OgR2/MjXSwftuRs3woXukIFtdjOClDE8KyBrhqSS/hAw3cQoJctnJj5sgZVAk9HrOZBeEm/nIfoYQRbCvaY0ngUVHgKvHr6lx6lfxCsXet23QuDRHFwYZgf9xCDf7zwL1WgR+XUfZ2KzkYwEeyRQ/6b/bxeSz/Cnge0mVZXdvTvqWgAVSRgs/4d0tGvdkg/a0MeYgM0p2RVxo8SsHev3NFl0yv+/lORqZ8Vgy14q8yyXYTayNdSl1RUVUpt1m7DdmaZxidgWjRWLgqM2URpxpqF9BVGkIONwY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e71b4607-5fd4-453a-2ca8-08dd1aff8970
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:51:38.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfIhQJWQbroVXGszNVBZQFjIZ44YH7hLh0L4E+zaVp8e891Q32+FBpnhFGa7wBSeeVdpqNcwTrrWynoRqanur4ShYNOhFMCEZs1619bKuP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4521
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_10,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412120164
X-Proofpoint-ORIG-GUID: QC3GH825H80zpVuMC3twZ-SXgnV2ksM5
X-Proofpoint-GUID: QC3GH825H80zpVuMC3twZ-SXgnV2ksM5
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

NACK.

Resend this _as an RFC_, _with the correct maintainers and reviewers cc'd_.

You've fundamentally violated kernel process and etiquette. I'd be more
forgiving, but this is at v2 and you've not cc'd KEY people. Twice. This is
totally unacceptable. See [0] if you are unsure of how to do so.

You've also sent a 16 patch series (!) immediately prior to the holidays
(!!) introducing an arch hook (!!!), which is strictly something we want to
try to avoid or lessen in future, which you'd know, had you followed basic
kernel etiquette and process and cc'd us on v1.

Any discussion that will be had here with others we won't be cc'd on, it's
16 patches, this isn't workable.

I'm on holiday from next week, it's not really fair to put this all on Liam
immediately prior to Christmas, so let's just examine this as an RFC first.

I hate to think that I need to set lei rules to catch stuff like this, but
clearly, I do. I will be updating these to check on all relevant
files. Sigh.

[0]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch

On Thu, Dec 12, 2024 at 04:02:31PM -0500, Liam R. Howlett wrote:
>
> + Lorenzo
>
> Can you please Cc the people listed in the maintainers on the files you
> are submitting against?  You seemed to Cc everyone but the mmap.c file
> maintainers?

Thanks Liam.

Also +Jann, another reviewer Kalesh missed (he only got Vlastimil and
Andrew so 2/5... of those required...)

>
>
> * Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> > Hi all,
> >
> > This is v2 othe the arch_mmap_hint() series.
> >
> > Changes in v2:
> >   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
> >     special case of the hint addr being "enforced", per Yang Shi.
> >   - Consolidate most of the error handling in arch_mmap_hint().
> >   - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
> >     Patch 2 ("mm: x86: Introduce arch_mmap_hint()")
> >
> > v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/
> >
> > =======
> >
> > This series introduces arch_mmap_hint() to handle allocating VA space
> > for the hint address.
>
> Why?  Could we get more details in your cover letter please?  This
> entire email has as much detail as the subject line.

Yes the cover letter is ridiculously small for what that is doing.

>
> I don't want more arch_ anything.  If we can do this in a more generic
> way, then we should.

ENTIRELY agreed.

>
> >
> > Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
> > issue of mmap hint being ignored in some cases due to THP alignment [1]
> >
> > [1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/
> >
> > Thanks,
> > Kalesh
> >
> >
> > Kalesh Singh (16):
> >   mm: Introduce generic_mmap_hint()
> >   mm: x86: Introduce arch_mmap_hint()
> >   mm: arm: Introduce arch_mmap_hint()
> >   mm: alpha: Introduce arch_mmap_hint()
> >   mm: arc: Use generic_mmap_hint()
> >   mm: csky: Introduce arch_mmap_hint()
> >   mm: loongarch: Introduce arch_mmap_hint()
> >   mm: mips: Introduce arch_align_mmap_hint()
> >   mm: parisc: Introduce arch_align_mmap_hint()
> >   mm: s390: Use generic_mmap_hint()
> >   mm: sh: Introduce arch_mmap_hint()
> >   mm: sparc32: Introduce arch_mmap_hint()
> >   mm: sparc64: Introduce arch_mmap_hint()
> >   mm: xtensa: Introduce arch_mmap_hint()
> >   mm: powerpc: Introduce arch_mmap_hint()
> >   mm: Respect mmap hint before THP alignment if allocation is possible
> >
> >  arch/alpha/include/asm/pgtable.h           |   1 +
> >  arch/alpha/kernel/osf_sys.c                |  31 +++---
> >  arch/arc/include/asm/pgtable.h             |   1 +
> >  arch/arc/mm/mmap.c                         |  43 +++++----
> >  arch/arm/include/asm/pgtable.h             |   1 +
> >  arch/arm/mm/mmap.c                         | 107 +++++++++------------
> >  arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
> >  arch/csky/abiv1/mmap.c                     |  68 +++++++------
> >  arch/loongarch/include/asm/pgtable.h       |   1 +
> >  arch/loongarch/mm/mmap.c                   |  49 +++++-----
> >  arch/mips/include/asm/pgtable.h            |   1 +
> >  arch/mips/mm/mmap.c                        |  50 +++++-----
> >  arch/parisc/include/asm/pgtable.h          |   1 +
> >  arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
> >  arch/powerpc/include/asm/book3s/64/slice.h |   1 +
> >  arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
> >  arch/s390/include/asm/pgtable.h            |   1 +
> >  arch/s390/mm/mmap.c                        |  51 +++++-----
> >  arch/sh/include/asm/pgtable.h              |   1 +
> >  arch/sh/mm/mmap.c                          |  83 ++++++----------
> >  arch/sparc/include/asm/pgtable_32.h        |   1 +
> >  arch/sparc/include/asm/pgtable_64.h        |   1 +
> >  arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
> >  arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
> >  arch/x86/include/asm/pgtable_64.h          |   1 +
> >  arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
> >  arch/xtensa/kernel/syscall.c               |  31 ++++--
> >  include/linux/sched/mm.h                   |   9 ++
> >  mm/huge_memory.c                           |  17 ++--
> >  mm/mmap.c                                  |  86 +++++++++++------
> >  30 files changed, 491 insertions(+), 424 deletions(-)

Yuck. Is this copy/paste really necessary...

> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >
> >

