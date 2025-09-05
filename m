Return-Path: <linuxppc-dev+bounces-11786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8A3B45682
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 13:38:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDqz3H1Bz3cYb;
	Fri,  5 Sep 2025 21:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757072303;
	cv=pass; b=WWm9Kzboa1vV/Jk1sGOviCCT3ajR6ujQX0rfCZ3DfvqgIMdyPogWyQcfaVPqrHvbXC/44oXBoLDukwhQCYBQ6jtohlvoc10DInf3mCVzAJdbBpp357y6ATqafGXzSqeWziTmPAEK1eX2+4Du3qBM9DNEd7koQ5t7IZkZ4fU7l7+InaZ9s9vlLmCnRpgLWhEQfDNwlEhWyXj+kMT/TK8jyqdwD9fdQSMRL1nh7O6VCNEY5MgVNiUA5taW9rnZHxNH8mR5TzQfXYFozlJhNK6uKwFjfDM1ITruEygC7yabh4y0F8kOrLf9tQvGQ42u1uMzurOXLDPH4sC7Re7o/fG+Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757072303; c=relaxed/relaxed;
	bh=SbkDXHUl3oiXFJv0so7ZQL70BEA76gG0eDXK4p6frbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=is549xYfw361PcmfoD9dNVRpz7M+yH6KopPnWpFjAvG4sNPgpI9V3ve2AJppj3At8Ttchl7CiReOMxWxItdPQRZsxSN+MvUVNO0j6doxohKDjL9P6dh42FcqxgzImeY+mcODtEr/0W7QTdAZks4gaVbkpwSLJlwuiCOWULNu+48V5ZwKArLC32X77w6DwK/suBAG29+bqeYJPqrI1OA1DzMdMlIeR5OKc8gl/8AWb0QvQ89BxiTY6IuKtTuf9xDKiVvDZo1xo8pmG6RJuW/mTTBTO6KrZY/pl+DOwazYhVPtWrdy0vS08RtQ3eF4Y44eV456gJwg2BjZUuMHRF12mw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gXCQ2czk; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nfkDbjY/; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gXCQ2czk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nfkDbjY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJDqy3kBtz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 21:38:21 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585AtxlR004280;
	Fri, 5 Sep 2025 11:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=SbkDXHUl3oiXFJv0so
	7ZQL70BEA76gG0eDXK4p6frbw=; b=gXCQ2czkuFqWkFOQGOAsyG4VJ6mHO/eWNI
	Qjiow/4vFa2mnZFMNUb45FtPGxMLPYjKmjpigYsEdj6YCUbTwyI/2BSV+VOg/rfS
	niSyS0rNAanbQlItLHMu1qMnDGwMhu5uLWHLPnqfdUgppQle0KvTsE2dPSB+juCn
	ox9MrHgfnaR2CZS9PGjXs3KRjK8XvKd8KLl5sgTqk6JxrhxNoVkOLF9xZf7o6W/7
	rfynIfqJq+IkG+rsw0JCMrTQ087dqE/0wwXBDjeloPlmzvriGYInNxHz9IpEMi7r
	o4V3YZPjZxVXPaX+sji7uO3o7SnxDPxKzicHERiDNN7gbIeVfMow==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yx2jg3jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 11:37:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5859Jc49026155;
	Fri, 5 Sep 2025 11:37:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrcw92u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Sep 2025 11:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yuo/vYE1qoNnnOsr+h5h8sIllc8rhwGL9vQOFs6W07j0ROVPlB0XjzzapwOHcXVSML6q8Jjw+VTaZvNiwpI4cNSLu3n3i5SAROIHTzlONG2zybLB5WK46fvnvmFM+6pb8eFkKzOnj7dj3N20cQ7mOySdAD3AkPzGrfHOpIPuweE7TUFh1wV9IWhlxFEBMn/G0WLSBSuNG7RDboS6f7K8URrT9VV2afIZ23R9drT6xnPQeDBrZXYLumIba34Sy9Wtotppj+NpDCmgLgPrBXH7YqMlD1ZOPrZu/BJRQkmD4RYKLQmqJ82YnZEUfDS5NCzP1aSnBWRRWEysXv6fQeBu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbkDXHUl3oiXFJv0so7ZQL70BEA76gG0eDXK4p6frbw=;
 b=hSFRwcNtOO0k43BgdaUZXPS3QYbD1DySv7NldOlt5hbNALhYa5p8BV1UhGTD0AgUARJYR8+9Q/r6pKK1rKeNGWWUFc2pKma0ii6hl6dEnP8uXpspeCfnQrMCPbzl75p9pF0E04x8enqU2SsZM4quzJdKdZ5T/0mnAPyvY6uE7dmel3jxzQ2dCqqbUppBbN+rpQhQ+pSU0ZgTuQaMsbOt9ZkyySbKQVuC8Kjliug6x/duVD8SwKtkacvelseNCXigNMDFur6FIXJZjCEObea5YpK1vK/775RKWe0b0IJiNoP7+saMgUc+cHdgX2SUNh9cwpH6PQ2qCl63XECU8+2IQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbkDXHUl3oiXFJv0so7ZQL70BEA76gG0eDXK4p6frbw=;
 b=nfkDbjY/56XkUFZ6ixYsiQ9F8cp2XvOoIc1cqrtjJOR2Sph38zxN0xew53nJeeBhbg8+xiXokPmh51rTsgpUl8JAJOeaJBhiqdXV9TypbpWKxN4Fl/jrqpYfdqRJBijU1Yopmr9m8u6PkXXnA4SAV9Ag+PvwEYRS7H/c+hDbs+U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5001.namprd10.prod.outlook.com (2603:10b6:610:c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 11:37:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 11:37:16 +0000
Date: Fri, 5 Sep 2025 12:37:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
 <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
 <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
X-ClientProxiedBy: LO4P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5001:EE_
X-MS-Office365-Filtering-Correlation-Id: fc49c42b-a1b0-46e5-9486-08ddec7090cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C6XAMNQV/QDaDHTxLITrg66EQd18uZGYd/ta1lZfl72etSjxoV1fDX5k4UeI?=
 =?us-ascii?Q?+15JMn9uF1aduCMUHCnssuowQ8ZZV4dcOLRy6Z/LmAcfvM2/lmf2kiiLygD5?=
 =?us-ascii?Q?J9jqA3nXJ/n9QduD+G5UaCbC1aaruMmiq7T28uZYf7E19jvw4YH+kndKQ+9S?=
 =?us-ascii?Q?0R9ESstJcDQuHn31cA89g8d1upwcBJpOklYyvqNcFOzc0qkK+kuW2G6eooGd?=
 =?us-ascii?Q?t3G4rH7/GvrZ1b8vjw/+1J5p0dBw8IEmeHPSeIfvlHJh/YIFL3ndLqqe/lQd?=
 =?us-ascii?Q?tpiHC0yuqfsZNdsRlEe8Yb3EcnCmFAoT7FZB5Ot3A9xqwiK7eD0jhRczskw7?=
 =?us-ascii?Q?J/HcLor7zKg+8LSvx0jzaIGPqQNnd9awPVzcnn8xObhrZCKbGPfi7dIL1wtm?=
 =?us-ascii?Q?qiRoJOVVXqm4StNRLMo5Sb9x7BLO3Aut0Ty8RsgIQS1/BDjL8rX18LL5F98+?=
 =?us-ascii?Q?2BOFh8NW6r/vcl1q2YgdRAPfxo4tfo1PraTOY2iRBq5WMsJdJIEqi2mDlKhP?=
 =?us-ascii?Q?R70I6ns2JLVxQTesrXK/apL/BK090jFNqxgPXl+KeTcNGKdet//Xl2DQPEPY?=
 =?us-ascii?Q?zBsQA6jQu+6ikU9Z9Ouuh8b20Qco5sTa4U77bI30SRIGLqcMNuew8gnkwK11?=
 =?us-ascii?Q?9lihNecT9YGyvCq0KoLupwgUIeR68dBsF/dbIgWnMzghIlvSI5WTeMLMTXSC?=
 =?us-ascii?Q?WZ/qvjqHaXVbaXgstUgchTTrBPKBxj/+HXNomSyKSwJHmSl5Upr15z1dMNXn?=
 =?us-ascii?Q?SdbUeaanQbKhUlXEaKZwwbBo2Wfv/mecEV6uvX1/gVMghD+93vrlXZ8PpQJG?=
 =?us-ascii?Q?BHJWZapVPnfCuGp47Q2096m/vWVEk7afkqZnUhf+LIWCGd8gRIoNiG1nnFXC?=
 =?us-ascii?Q?ZYJ137sXe9fbw1Mm8ONbXsR3aSrS6mlx9IrrYKwirt5ce8sen6uNQ5f6QjTx?=
 =?us-ascii?Q?rxo1YaRtxDjqVaX4ivkOA+n28G4FkImIdAgleziPvyu66g53p6tuL2a4kqQb?=
 =?us-ascii?Q?PiebBKFMygzA9ifU1PLy7XQpK1Vr8S138xq5rQa7Vg7oeRPX28CbtAoYZCLS?=
 =?us-ascii?Q?gspDqQYMgIpZvLaXdN4QY0cMJRPDjv1cShPzorSn+JWbScZqLRNcHlan99B4?=
 =?us-ascii?Q?H5Nvnzc87Tl7/zoaEWSlbsz+mozj51Jpi0flDD/Dvyx6eWlAghQ+8i9bXFgg?=
 =?us-ascii?Q?7qVeRsykqbhbXTT6gwiT2TGtDkv5PnoOGHIaDHwtuujf/la5HKqnKOb5+r5A?=
 =?us-ascii?Q?0pP2vp83dHsHA7nFQBpTBw89PxCHXIqv+KvaW7i+5J8ZBNFtKhf1jXEDriMB?=
 =?us-ascii?Q?oNT1kQPKGQcCcPKA1FDTKqzyPBVcaRf4teFbGU2ic9mE+G7Q6ffC7138SOou?=
 =?us-ascii?Q?qEzu9S1BL30TsPIo5ivGQqq8VO3Yuy8keEFY1XmMN1BGFGEJ82I4xUqB6ce8?=
 =?us-ascii?Q?kBuvoBGTRA8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NL3QSfZfb5DnlPEhZub+gSkfJ+BWZtnZZ16Bwfp1HQCBd3g2RRAQTsDQ3qxL?=
 =?us-ascii?Q?vAG3UXN71aJKKOlnsNbscucGOB4nVjatuqII+2vx8dbqpHsXzWQALLQKhIcU?=
 =?us-ascii?Q?UevAY2MeLQ5YmF4QulGwgnplZCzDOadZo+1yp3byqXjGgPFsOaXwbs1IKlAH?=
 =?us-ascii?Q?vernW/mcjk2zvuYTUdinnJrvMSIbfXNRu8P9S55LUhJ+f1qUOLYVn7vUe2HR?=
 =?us-ascii?Q?2gsxnDTh1no6FweUt2gNdSfwVGBxb6nmVGD1vuUdioMx6NYMGPj+nT5JbN8D?=
 =?us-ascii?Q?BfhiKdwoi9E2CWpaa9IqB3rU6sP6ya9Ckv20vDT+xfS0xjfnXrOAcSsEQsZM?=
 =?us-ascii?Q?2G8X+8s04pHx8fNE5XX4hBmCSxdPJtgO0PvxUD909lWJJWAIxb2V7XNF+680?=
 =?us-ascii?Q?a3+KutrB+8zh7AGvKNTjdodBvNpvNc8EhcVXl/bP86342ZOqu5IDgnOCXGPs?=
 =?us-ascii?Q?vAIxfxos7fH3E1JqAU8P9qX43wFud2u1mEVYHkUntsIQj2ge3T/+gPOyx0ch?=
 =?us-ascii?Q?iRZqH8rcFtBMSuK/nXgjexMMXf22SCep3SM2eOdvf3h0LrlcMaaoa12rYWeg?=
 =?us-ascii?Q?pe95AiSE3GdjJrN8+loq+WeffTgC+GBFmfJrqcdaxHW4gFMpGyHioKaPqsL4?=
 =?us-ascii?Q?x8yVUPSrM5gBNM1htT6trnDbZMGwoShU5G/IIj9p8xc5Bq19lRi8F5VHv/Z1?=
 =?us-ascii?Q?4mkFydP9W3na38/zRaj/8xt9DGORQNlsXbLjSJYUE8pMmXeJBhjBioI3vgqP?=
 =?us-ascii?Q?iHl+5v9YVtwiFJJ3n+nDhFOR3I8iaeVo0bc0Teq+gGITw2GUPXpuZ/nZbH72?=
 =?us-ascii?Q?hAyE2VMQqH6oJGx9SpZD1mX/1/VTUVnrGv6Lvew5KMPwTGMxG1MXiVOvfHE7?=
 =?us-ascii?Q?HLepnw6w2+as1h9MknFwi8UClZWCoWvkKk/AdY+T/YaUcdod0rLqxIwPO4ni?=
 =?us-ascii?Q?Pem1vJ3wzqCjS7LgoVbSoBQQrSVstBf92kzAqPhmj+lgJy3N8nUri9R6wEMV?=
 =?us-ascii?Q?U9qs2D1ORo1M6QMgaxZKKAj2zqCE2TAhvI7ecUqBoNEmy50R5EHUzi3zh80M?=
 =?us-ascii?Q?kaZ6uEz8LfpR7sy0YuSZQ8ho27rwKsCWQqNedLrfAqFkWPljV+ZArPGCY2LJ?=
 =?us-ascii?Q?WkafYUGDwJW6DFgGwk4ImX5CERbdTgiNk0wuJg//bkz2vkHGex+qTjz61e6U?=
 =?us-ascii?Q?WxiGzEtDSvkylucTk+J5Wh6kfjOM0M6TY9FRRCvZGv8Ibx8MLoL/KqJKCIGg?=
 =?us-ascii?Q?3vCcm7lBR5lfZ7GeS//yrmEypIfdpFO73uyM2DFHKkK9nb8nlT+vwvE5+z66?=
 =?us-ascii?Q?MEiNNNdAQTpTnC9ZGXC42ACBAw5jJqXAoLQG749A9NSsMNhmB7YIwHK4w/lE?=
 =?us-ascii?Q?uf4B8+l0nqb9v7nCdHu5MJxs9oh79rc1l+R0d/Ht+bhMhkz3wRIUAi5SptEW?=
 =?us-ascii?Q?LAH0jvZVMS6NBu9S8ijJPTE5xIi6jOgv+BSEyNlFnAhQEOeu1qu3XDEjygMx?=
 =?us-ascii?Q?O9VzD2klIMBl+l7RRubfRM2I/Bck1qzyKSgTx6qJNnNjcbgkF9nyLoNHh+sV?=
 =?us-ascii?Q?VPM++gOlmS/d6vw5T/4wsPl6OpA4EgMHT8qoD9AhvvNnRauMWHJB4dxlX0T9?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c+bZnZftEnXUmrYBBtIHppAP7GjdenmPBTwY2niEPjZS8f8lG0Y5fZPbWTVr/6Tm/cprcgLOQYF082ErfEa0GVc5dSYT4aoox8vKBLXhrT9wheEqbIPL9PmDSMSJM5/1chmvEOK9etxpCIMS5ZXXpWuYB0nureMz0QMLNfuNebITzSYUUfIGu0SI9M4wqa9dO7Np95tbc8gq9oAm/IfzjsMHAf8C+38ly8vmse8+fCGsiQahqj89F3ODHduPPxxO1MsEirpWZiBIkiY72sbLwuo3WFUYDFVTWZbUcxw1voqmPyzF0xjN1WWHe+fypuNl/C8Zcog8ZHxNdELFL+I/SAOfSJSCsS4FQr/gc2kNyNxGp6dNb+9zwW319IN1Jw1P/lHVn1e3cpKsYov6L0barzkge8TU1wUu6r4LxXBhvWNciu5WBy1EKdwwYV86HlC22SRbLYrUEF7BqCNM6iEHuhk/4q3VM0NgztG23Al6ctRrqATovkkdukm/IM5YFpT2NyjJnidpTORYMyPS24YDQZ1kanswGTa9UgFvVo+lO9Z55Q9C2jJCuAZmQShdqoBZQKaF+iMiqS/ZqJq3K5bJsZnyzG8lS/4UnqaA68rFlLs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc49c42b-a1b0-46e5-9486-08ddec7090cd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:37:16.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dNlOAEL0eaf+T6kt230J0oqZ0K0THABh0XEsdPQ5Fmgo9UKpuIXSertBETPG1zVM69EDPWZr6xXvzpju9ofaDNdS68EHjw9ljOCGXy8lRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5001
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=529 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050113
X-Authority-Analysis: v=2.4 cv=S5LZwJsP c=1 sm=1 tr=0 ts=68bacb75 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=k0bjli3dSpF5586gfPcA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 cc=ntf awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA5OSBTYWx0ZWRfX9Y/AFm3+mYEA
 BgFw3Tsl7UbWYEwf/W+zGPl3aTIcZpGOVy2T0gPrnTAk3CxgotAmHIbS0rWpOYLLghsPGMVW7MB
 sh9zW3CtRXTBmkTB1Sxs0LiKKV4WbJLZtVokaf25Bvxg3uXto3de6S/m9E7A+lz1uGeCKWnyD5G
 2gAJJv3nXJLjXl7ZQva/AthbJNNXqpxrHVlh9rnRPpcp5FuWw/aPckCKfSNK5660NMmLhX4TD4Y
 ZOal5O686U3QhuEoODfU3revcacsCW56DiVgideABrDqPIILIhbUh6GQhjPy8xtLyEM/VTbAvm+
 pjGgoydk+CErPng9eB7X9gH9VDrQsWZsCFMb+SntZSOWmQdzLahdyFQK2Zg9teB8RhQj3T9oScV
 qODw5Q/rjr2opmSks2701j8vw4CeIg==
X-Proofpoint-GUID: L_lVgzNe9MXAU-MQbQYbTCyXie_sA9if
X-Proofpoint-ORIG-GUID: L_lVgzNe9MXAU-MQbQYbTCyXie_sA9if
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 05, 2025 at 12:21:40PM +0100, Lorenzo Stoakes wrote:
> You should really base on mm-new.
>
> You need to account for everything that is potentially going to go
> upstream. mm-stable is generally not actually populated all too well until
> shortly before merge window anyway.

Just to note that mm-unstable is also fine. Despite its name, it's substantially
more stable than mm-new, which can even break the build and appears to have no
checks performed on it at all.

But mm-new is the most uptodate version of all the mm code.

Thanks, Lorenzo

