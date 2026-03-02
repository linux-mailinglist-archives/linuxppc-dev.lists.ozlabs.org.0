Return-Path: <linuxppc-dev+bounces-17538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPM5CoakpWngCwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:53:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D056A1DB371
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPhlP3gb4z3bkL;
	Tue, 03 Mar 2026 01:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772463233;
	cv=pass; b=bl34zun0QJxbFS10iwjnHHmEKFHo8mFhNY62cjWvm91vvtfZVmcfgAZPb5Ons84jtBDWYYKh1rHzqSQ2IPUMrzYG4SV4t4B0HG4+d+joMAJcmyrMMOvYyB+Q6ljC5y9Aum5EWvBlH9FOm63ARkOKZw+1UlFC6nfb2ebZheGJZOLevsaTi2Q6Ot8gPVjlGDIZulRHqol1Dh1N3cs9R1wsBymtreezNQS9hI3F/1HpMaEwdRx2sfRA85VUtYzH81flUvpbgOKV1NDEanhuQR/11v28jmGQhs5xtnF77mN11YsJxzHHzpIE811hLFJYhph7fcrHiIq3DB7LgpPNP09uMA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772463233; c=relaxed/relaxed;
	bh=aH0uS4TdhZulBj43vawFYvM0lwCnm62YAd8jJloPOQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JqzWkzhnMY6FBewCploPXRJi+bd/Szx1lRbR5mnXWIoYGoGQ5j1WCiPqHpZMY4Jd3Cp9wow93SdFE0nFbJQeXNz7vEyasR2iWRHQPb5E8UHIyRUNl94/IiGFZGN9U2rhFTuxIvPBxrpEsmN/zHBkbl9dMncwAQPoIv8dKS47r1X6L9F6FgXWTVkxa8wH1eKruGw1pS894uyGC6kWQyvrwrVvAn1l+kby4+jwLvyREUbSaX76KL3qshb3dtum9I0Y7MvcYejs3OI49IJyZynFZzIkbokQLWtjWSzsinXQ//g+e9P6MYr10xVfh/n+w4ufebMznJvOVg12GRl6tc5Q/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=g1PJrjVK; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jqsNsyrt; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=g1PJrjVK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jqsNsyrt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPhlN3rlSz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 01:53:51 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622EUQWv3618892;
	Mon, 2 Mar 2026 14:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aH0uS4TdhZulBj43va
	wFYvM0lwCnm62YAd8jJloPOQA=; b=g1PJrjVKdLj5j8V+xQWIgHMX258FQm7UKk
	6ybgB+tXa/UcWZvuOwfHBUULXOcYC6DyEqNUxeFfu/1Ke69zc7Q7clZ4HFjbE0Gg
	hNsM8889YbRZZz8VMAR/L/HlooRyDGbPJ4xJUo1FjKaiyI7fvAdxF+Kwbjqotbw9
	keZdNvyw1vsP3r6lzV3emrR3qGc2DPIeTXzRawdVNR+AIppx+47OJmUKa8EeTKit
	Ujb30eePfRYpVKNKjVlqqeBBikv1V1JfXnSnexZotKOSYQKpfZ2Nb+PHWc9FAqKd
	wTL5SPzSTh60E6o6Cbxa3/vaXcXOv86tHtl3zU884EJ/2nAm0qyw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cncc8r1e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 14:53:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 622D9FVE029841;
	Mon, 2 Mar 2026 14:53:16 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt91s8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Mar 2026 14:53:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVmHXrl+QK9rq1oVD2kFCguASMdcSJkQNoiPCcV2Vont9p3/B9A5AMyr9lqsIjd7Yr7ab2DGMmH8TFWAzoJw91CzccBK6x4Ty+vaViIAh2HX2XtCMt9fdDC3WYtK7LCg62P+cV3kqbdQzb58+V+0xamqt63QV5qk0zWzS4VNeyWFnS/vaYhZ7qUbHfajMmFakoF+Qj0WzMon0Du15Zt/RSvZnUrmVkq75yrPnGESoJTTDFYlbnDzMAojLH3olh0YTt8TKoHsmK/xn35FerJpoHz2ZLy3mAnMzqoIfHmCH1t0FSzBzr7RbquMi/4+MRA63pnqVBlHTpDBMR6geJeA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH0uS4TdhZulBj43vawFYvM0lwCnm62YAd8jJloPOQA=;
 b=BAVP59xKwM4+Bs59/jhjtoF/2JILlBZjSQ3ai5iCbrm5uksChwHiLoknulFJEP0y7B6krRa8EE9OLRbrQ5m8D4ERzJGzq8pkKCelikbwCKDQII1Px1VSv7U0nEd4akh0WYUNJ7dboOWJ6nyvmm1D87/XhqE9RtMjlptSDmM7AvhFd4XaEjYp3x1ZOHM+Gzdg9YWQaz7jUAKkPR96CaqlLYcQI+qJiX/7qRgrEG3J+mL8M+UD4k6b8kOSOaxzN1dlxRb98jw1cgIKGTAdecTNF2bzp4KUFRd+axCkW0RJmzTZtSEYkYCOE0Xz43mjs8W6e7plmtx3kS1/Yn29cl356A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH0uS4TdhZulBj43vawFYvM0lwCnm62YAd8jJloPOQA=;
 b=jqsNsyrtT7UAKSOVIEDmgJH7Yr3et3I1KkC6AHssio/LZ+LkZQlu0L9ruZw+bmDXVwhXHu7UkCv5wQKQ5yEbzNh6WKJhSKNgE96qdmrt+uI8U4Xa96pHYZIvZ2HQDI4TO6jrhvgEZcDYhyceBUanBDt0f/JP6HzKSbkC38cH8SA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB6901.namprd10.prod.outlook.com (2603:10b6:610:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 14:52:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%4]) with mapi id 15.20.9632.010; Mon, 2 Mar 2026
 14:52:52 +0000
Date: Mon, 2 Mar 2026 14:52:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
        jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de,
        kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au, chleroy@kernel.org, borntraeger@linux.ibm.com,
        frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <74bffc7a-2b8c-40ae-ab02-cd0ced082e18@lucifer.local>
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-3-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226070609.3072570-3-surenb@google.com>
X-ClientProxiedBy: AS4P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::9) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 0191ea48-12a1-468a-c900-08de786b6145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	W6+hZSFbw5TmwSZs2jahQodzW7uPjAADGTBM8QX5Azxp8aAGKVreyOHBHDs5BTPlwWoJyb9q9l9t+HP5L4ionR6jFBZpjLENxNLA/YblS4rLNhbnKP++r0o0rCMDbXbpCcutbuonfdKzDAculCahkj25vDaC5huweMDtgryQ2cpLuERJUS2w6s1G9A6p+qHxTwi9vOLEEJCZwdSx8aONYTF3wpYSuop+yUhZNiWqyC/bMOpXWMxjKOFAhYY4sr5st3IGm5mc0dDvpbEXv2ITr4OX1lYbHV20Pud3jwluzmpcjTsVQTSc5ETXHic/xVcbXwBHSXcC5aPr3xPtkRnWUz5+G7ATUuglBnsJJHUcqup1bLB8UtyxR91bQXNFSkZQxeF7PHtXF5xIPX+Benfl6XNFjGtQkUzZCW6pi9AaTkbRxcBfX113BBXfH9SZkWrGCcbDu8pfMJXEN8H6re1N1sP28R/CzzqufgcgQcPJob1Qz7nvUlVTijYvskMMQTZT6TaOD9bzogSlyHMDbAHcj1H5+X3y1zL+fC6yMMws4ZVb04yxnNDKjfdzEcp/p4fHarRTsBABjjxEDPCvkLF/TiXTzaeT6bAqrE9jordz6fwP98T/5Mq4XYJh3qgG/YC1AqYWMPsUALqUlcD0gOSuhia/89p27+Uc891e/RnFVc4VkdJYs7+qaxQjDBOz13/3T3vwJ0wOmkB+u1p4ZnW2pqQVrzDhk8mOizthw6ZS22Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X/F2w0Sllq4sogBpERAr6hpwQXiaTFG6JWGXE1en9Iq+bk0Kb/1xosvc34cF?=
 =?us-ascii?Q?mrehGF/U69fmmSURfiGaABEFYdGx05EiGJeTQFi8iXP+c2XRiW+QEe2JAzjf?=
 =?us-ascii?Q?hP+cEtLge+GhkmVUZYBeA/3qAzorMGcmG8P9mTJWVrLeMv+asvg/GKLcSnwX?=
 =?us-ascii?Q?+ypJ+qxb2d2kdGgKHktyPvHWKkQY7vTqV67DJqEAVj4pA/JhjVXuHFd21fJj?=
 =?us-ascii?Q?leI2TRwEs4YrnZ9YUvaIIMBBSj5B/SSfxXHMadz5o+udoraWJdJmlPMnVh4n?=
 =?us-ascii?Q?FzDQt2eVssBHQIH53yIeHCq4NmgDzbJ2I2GdpkPPVrdNKU2lyyJcoU/Jo8Z+?=
 =?us-ascii?Q?Cmczq6dX0FnOFUR4uLY1/3xVsB+TKZPAuvlW4i8ov+nTRmRL8BuzVXcOaH4U?=
 =?us-ascii?Q?xaTLzVCwbz4/Ipe+jlB6aZPQiIm5nfzpwj6nNLIwF7v49L4aVAUVAgF+yvTj?=
 =?us-ascii?Q?476KaTjXNyypBoVkySsNDoc9w8gXF1ibB69c04mTzx7W4INXsJr0/baCm4mY?=
 =?us-ascii?Q?rdYnpbbQLmHM6Y9PQQwun33HUQJD9XrKkmj7vKxy4/wEORA6e3s1fuTCTnsH?=
 =?us-ascii?Q?MGmwPhx+AqtCETLMdqqbOrxilQCrOcXmOGggmgXTuw5sHXkOUONPYKw4x6Ot?=
 =?us-ascii?Q?R+xuRSFXTEARkseSQryUu1OIcLVFv4LDv15JaOoEbbJBCUA8u8xOl/6ug4zF?=
 =?us-ascii?Q?l1CyBlsvSPiDzL27/B0u2V6BB8oAhG9J6ta6DF3KIhgAG2tULfXRbSORIsva?=
 =?us-ascii?Q?5G2s7AQ66V2BlNufN5nWgUYt3+vHW+OiF0lDVmaCWGtexSjO0iuRaq4Ve2Ah?=
 =?us-ascii?Q?/8paMht9AuSkHg4wUO5/JXjT0nTPo4B5iY8yBOGfP/3ETJ7EPI4lz0ZfV9ts?=
 =?us-ascii?Q?SlnI05+IuEXJVzmoGJ/hd3q6CeQXC2BJ1ZHVDqqmAoKr32zvziEP2sW9vK5z?=
 =?us-ascii?Q?psfymVVwR8Ovtskw788hSOezAzLD7h5Kx2Dq0schGp1+z/QBQAsF6OixSmtQ?=
 =?us-ascii?Q?VrmXOPqf80gF5i1BOgzhIwfhLljM7HQZVUw3W42NZRgJqUB9ZGvPeDTE2Zei?=
 =?us-ascii?Q?4pqUOf2u4DrzVdel2N7rFXJew+C/GG2A+0GIJUMyY0NGPxBHJm4Sqhx5l3Qd?=
 =?us-ascii?Q?7w0lELtDp370Q92vgiP0jq5+b7Hb5rcaXYnQuNDBU0/N/5/q5X4qocOf/xWO?=
 =?us-ascii?Q?BJqwi20ru147kBM+Ys5zLFYSjvNCqa8cC4ZMzwZRAHIbfq4nbKjltyPNlGAk?=
 =?us-ascii?Q?dfSRzk+Wwf8SS9MAmq2RqFyG0xs57mAnRH4l9gIoY7pVPJZW2eKKBsVAPaK6?=
 =?us-ascii?Q?gXa0A06fnlP5z+pqdfLyhJObKgbU3TSwzDogrtnK2c1mgDsr7CRrIa6KSZjd?=
 =?us-ascii?Q?5A5CmqhKxKSzpteO3xphFZS1GK6vaDy67igqXSgg/uOttGPapKf/+i0mSIQN?=
 =?us-ascii?Q?XY8JqnJVzd1d+dlYHAhWVeTY1Y8Kgf1XMYwHGEl0hWu0UPGTgVYxEpa1ceK2?=
 =?us-ascii?Q?Hs/K/dmF32vsGMTTB4W3F5pyCGRwXFn37p90p5k9TnLEJnWBzYCaz5oLJVMs?=
 =?us-ascii?Q?LdNM2MTph9fgd8iT+gOt0wg/95CtbxkrJ/ctXPdYV8nda6q2fO4736XtTvgd?=
 =?us-ascii?Q?86Up0b42i/uKi73e9jaPcyf0PY84rdeMAkNbWN3/ezxETYFlMd99rN5x9Idq?=
 =?us-ascii?Q?K/32eKKxHWnuB1rdsMmsVx6NpEb/GqjQCS6u1M6tDWuS0oaJsDJYEV87JZ2T?=
 =?us-ascii?Q?tBepYyeQW0dwBBDJ/5zJa7HfxfiR7oc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0BOz2L2oPt73WK6wSYY9iHFgnvcv8McIQBFMU7If/sEfikVwqhHwuMDDxghxZR8goutMcjZOhMsn9YQDmOFvhwWnVjUXmnH3qZ4NpCTqAzefYjbUDYnqQcs8Fd1jHvr8JwU5KgY/y5rdqqDk83+evWYDgH0EaBblm8cx0lycV/oAhsOYEhTBihZNHrjVjKzPUPAOaH1RrYeFebnw4AjvQPmZjn19gQhQ5gaDLALg4lqtQdG0qBmj7TqWoMnTE7SMHbhyVU8mUPqPrIbIhHIMp95Cs63F39kuY/RC2ccJs01o3ulooiTf3JHiFPiVrR9HKh7XvOpG7Xivivdxu7oRSnUT9bA+sR8M41zwQ38SKQGdq7D1Q9zH9iwdyMdlQGEwnY1lMHGWTsaIHkSHUuITm+OMJlVWuq6GdPfmfU9mPzOFfpMyAemJ6yGrAxirl7CEBJMhSi7YDV1cYfLhnfsLxadngvG81wzWUqRj34t/5/rCwaM/IwTibFsduGYLpJDWBow8KEQ/zx/kOk4o4ke7Elb98nbb2GHE5ZWe3csh+7xEkfbkNEx4TCA0Qjm8HtrcIkrrgQ0KTI5Ngd+iWEJ3CUnMZgOeTR/UfJDa9e2/h4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191ea48-12a1-468a-c900-08de786b6145
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:52:52.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgocZPMMPeavbBBFOL85ezaTW30F0kSXGwj+mTBVUSxgwydvwb8bJ43Du22q9yQDz0pfe4o0FLwykjVu63SHdiSUXH3iQLwsUS7HoBW0AXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603020125
X-Authority-Analysis: v=2.4 cv=HL3O14tv c=1 sm=1 tr=0 ts=69a5a45e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=JfrnYn6hAAAA:8
 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=0CcGc9-dyxQiiDSiPMIA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: cJSPwNM9sc4VuMbEqAor_xijizWoYCxf
X-Proofpoint-ORIG-GUID: cJSPwNM9sc4VuMbEqAor_xijizWoYCxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfXz/RUu+A19KJK
 oL82JDZssqecsfs1EKZEKUBiVcNHbKokIL2gOVudFaodWapoiKJq4zWHePT4FcOEuzwg4hvlEFB
 ONHrm6NFZx5EsIhSuWsiv6XJ7y2HwK8+h9jZqKpw4w32kWjhKD+EtT7SJswgT7nkGcEgSt5Jd1T
 7+O6txB+MaCIViB6sxI7Ik+7/eKoZAHyJdg5YenhThlc+vZsjW0/T70jNPxRysOSfS48OAoUgfj
 sev0TgN+9PHLIYAog1iphkCPwNwNAOXzDYAKE5bfpiHvkXbBtC4I6VO2IVknybWj5RQ60gPfJeO
 XFvUKK32XlJ3oHVsKJc2C7CoDTzbaymgva95eJ1wgJsgCNvAmRd907xT6O/fpwgS+bge8WQK9yu
 kNIgm8xanGh+WPNth4wtrKIugn+lMg5fynqxH9+Oe6d4gjfEJMOQ7/cX96x5xku6y5estF4c+dT
 coOHx5seO44gDwcyjIQ==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: D056A1DB371
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17538-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.list@gmai
 l.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,oracle.onmicrosoft.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:06:08PM -0800, Suren Baghdasaryan wrote:
> Now that we have vma_start_write_killable() we can replace most of the
> vma_start_write() calls with it, improving reaction time to the kill
> signal.
>
> There are several places which are left untouched by this patch:
>
> 1. free_pgtables() because function should free page tables even if a
> fatal signal is pending.
>
> 2. process_vma_walk_lock(), which requires changes in its callers and
> will be handled in the next patch.
>
> 3. userfaultd code, where some paths calling vma_start_write() can
> handle EINTR and some can't without a deeper code refactoring.

Surprise surprise :))

>
> 4. mpol_rebind_mm() which is used by cpusset controller for migrations

Incredibly nitty but cpusset -> cpuset?

> and operates on a remote mm. Incomplete operations here would result
> in an inconsistent cgroup state.
>
> 5. vm_flags_{set|mod|clear} require refactoring that involves moving
> vma_start_write() out of these functions and replacing it with
> vma_assert_write_locked(), then callers of these functions should
> lock the vma themselves using vma_start_write_killable() whenever
> possible.

This should be dealt with by my ongoing mmap_prepare, vma flags work.

>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc

Overall I'm a little concerned about whether callers can handle -EINTR in all
cases, have you checked? Might we cause some weirdness in userspace if a syscall
suddenly returns -EINTR when before it didn't?

Also maybe we should update the manpages to reflect this, as semi-usless as the
'possible error codes' sections are...

> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
>  mm/khugepaged.c                    |  5 +-
>  mm/madvise.c                       |  4 +-
>  mm/memory.c                        |  2 +
>  mm/mempolicy.c                     |  8 ++-
>  mm/mlock.c                         | 21 +++++--
>  mm/mprotect.c                      |  4 +-
>  mm/mremap.c                        |  4 +-
>  mm/vma.c                           | 93 +++++++++++++++++++++---------
>  mm/vma_exec.c                      |  6 +-
>  10 files changed, 109 insertions(+), 43 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 5fbb95d90e99..0a28b48a46b8 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -410,7 +410,10 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  			ret = H_STATE;
>  			break;
>  		}
> -		vma_start_write(vma);
> +		if (vma_start_write_killable(vma)) {
> +			ret = H_STATE;
> +			break;
> +		}
>  		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
>  		vm_flags = vma->vm_flags;
>  		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1dd3cfca610d..6c92e31ee5fb 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1141,7 +1141,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
>  	/* check if the pmd is still valid */
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma)) {
> +		result = SCAN_FAIL;
> +		goto out_up_write;
> +	}
>  	result = check_pmd_still_valid(mm, address, pmd);
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c0370d9b4e23..ccdaea6b3b15 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -173,7 +173,9 @@ static int madvise_update_vma(vm_flags_t new_flags,
>  	madv_behavior->vma = vma;
>
>  	/* vm_flags is protected by the mmap_lock held in write mode. */
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma))
> +		return -EINTR;
> +
>  	vm_flags_reset(vma, new_flags);
>  	if (set_new_anon_name)
>  		return replace_anon_vma_name(vma, anon_name);
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..691062154cf5 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -379,6 +379,8 @@ void free_pgd_range(struct mmu_gather *tlb,
>   * page tables that should be removed.  This can differ from the vma mappings on
>   * some archs that may have mappings that need to be removed outside the vmas.
>   * Note that the prev->vm_end and next->vm_start are often used.
> + * We don't use vma_start_write_killable() because page tables should be freed
> + * even if the task is being killed.
>   *
>   * The vma_end differs from the pg_end when a dup_mmap() failed and the tree has
>   * unrelated data to the mm_struct being torn down.
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 0e5175f1c767..90939f5bde02 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1784,7 +1784,8 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  		return -EINVAL;
>  	if (end == start)
>  		return 0;
> -	mmap_write_lock(mm);
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;

Hmm mmap write lock as well now :) I guess it makes sense here, esp given mmap
write lock part of VMA write lock.


>  	prev = vma_prev(&vmi);
>  	for_each_vma_range(vmi, vma, end) {
>  		/*
> @@ -1801,13 +1802,16 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  			err = -EOPNOTSUPP;
>  			break;
>  		}
> +		if (vma_start_write_killable(vma)) {
> +			err = -EINTR;
> +			break;
> +		}
>  		new = mpol_dup(old);
>  		if (IS_ERR(new)) {
>  			err = PTR_ERR(new);
>  			break;
>  		}
>
> -		vma_start_write(vma);

Are we ok with moving this to before mpol_dup()? Does this matter? Confused as
to why you moved this up?

>  		new->home_node = home_node;
>  		err = mbind_range(&vmi, vma, &prev, start, end, new);
>  		mpol_put(new);
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2f699c3497a5..c562c77c3ee0 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -420,7 +420,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>   * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOCKED;
>   * called for munlock() and munlockall(), to clear VM_LOCKED from @vma.
>   */

You should update the comment to reflect this possible return value.

> -static void mlock_vma_pages_range(struct vm_area_struct *vma,
> +static int mlock_vma_pages_range(struct vm_area_struct *vma,
>  	unsigned long start, unsigned long end, vm_flags_t newflags)
>  {
>  	static const struct mm_walk_ops mlock_walk_ops = {
> @@ -441,7 +441,9 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma))
> +		return -EINTR;
> +
>  	vm_flags_reset_once(vma, newflags);
>
>  	lru_add_drain();
> @@ -452,6 +454,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  		newflags &= ~VM_IO;
>  		vm_flags_reset_once(vma, newflags);
>  	}
> +	return 0;
>  }
>
>  /*
> @@ -501,10 +504,12 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	 */
>  	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
>  		/* No work to do, and mlocking twice would be wrong */

I'd move this comment down to the vm_flags_reset() line as it's not applicable
if we fail to get the lock.


> -		vma_start_write(vma);
> +		ret = vma_start_write_killable(vma);
> +		if (ret)
> +			goto out;
>  		vm_flags_reset(vma, newflags);
>  	} else {
> -		mlock_vma_pages_range(vma, start, end, newflags);
> +		ret = mlock_vma_pages_range(vma, start, end, newflags);
>  	}
>  out:
>  	*prev = vma;
> @@ -733,9 +738,13 @@ static int apply_mlockall_flags(int flags)
>
>  		error = mlock_fixup(&vmi, vma, &prev, vma->vm_start, vma->vm_end,
>  				    newflags);
> -		/* Ignore errors, but prev needs fixing up. */
> -		if (error)
> +		/* Ignore errors except EINTR, but prev needs fixing up. */

Well, except you're not fixing it up on -EINTR? This comment should be redone.

But I wonder if this is correct? We are ignoring all other errors that
interrupted the operation, so why are we special casing -EINTR?

> +		if (error) {
> +			if (error == -EINTR)
> +				return error;
> +
>  			prev = vma;
> +		}
>  		cond_resched();
>  	}
>  out:
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index c0571445bef7..49dbb7156936 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -765,7 +765,9 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>  	 * vm_flags and vm_page_prot are protected by the mmap_lock
>  	 * held in write mode.
>  	 */
> -	vma_start_write(vma);
> +	error = vma_start_write_killable(vma);
> +	if (error < 0)

Weird inconstency here, this should be if (error).

> +		goto fail;
>  	vm_flags_reset_once(vma, newflags);
>  	if (vma_wants_manual_pte_write_upgrade(vma))
>  		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 2be876a70cc0..aef1e5f373c7 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1286,7 +1286,9 @@ static unsigned long move_vma(struct vma_remap_struct *vrm)
>  		return -ENOMEM;
>
>  	/* We don't want racing faults. */
> -	vma_start_write(vrm->vma);
> +	err = vma_start_write_killable(vrm->vma);
> +	if (err)
> +		return err;
>
>  	/* Perform copy step. */
>  	err = copy_vma_and_data(vrm, &new_vma);
> diff --git a/mm/vma.c b/mm/vma.c
> index bb4d0326fecb..9f2664f1d078 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -530,6 +530,13 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (err)
>  		goto out_free_vmi;
>
> +	err = vma_start_write_killable(vma);
> +	if (err)
> +		goto out_free_mpol;
> +	err = vma_start_write_killable(new);
> +	if (err)
> +		goto out_free_mpol;
> +
>  	err = anon_vma_clone(new, vma, VMA_OP_SPLIT);
>  	if (err)
>  		goto out_free_mpol;
> @@ -540,9 +547,6 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (new->vm_ops && new->vm_ops->open)
>  		new->vm_ops->open(new);
>
> -	vma_start_write(vma);
> -	vma_start_write(new);
> -

Again you're changing ordering seemingly arbitrarily. I think this is actually a
more problematic case as you're now invoking vm_ops->open() with a VMA write
lock held.

So I think you should keep the existing position.

>  	init_vma_prep(&vp, vma);
>  	vp.insert = new;
>  	vma_prepare(&vp);
> @@ -895,16 +899,22 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	}
>
>  	/* No matter what happens, we will be adjusting middle. */
> -	vma_start_write(middle);
> +	err = vma_start_write_killable(middle);
> +	if (err)
> +		goto abort;
>
>  	if (merge_right) {
> -		vma_start_write(next);
> +		err = vma_start_write_killable(next);
> +		if (err)
> +			goto abort;
>  		vmg->target = next;
>  		sticky_flags |= (next->vm_flags & VM_STICKY);
>  	}
>
>  	if (merge_left) {
> -		vma_start_write(prev);
> +		err = vma_start_write_killable(prev);
> +		if (err)
> +			goto abort;
>  		vmg->target = prev;
>  		sticky_flags |= (prev->vm_flags & VM_STICKY);
>  	}
> @@ -1155,10 +1165,12 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	struct vm_area_struct *next = vmg->next;
>  	bool remove_next = false;
>  	vm_flags_t sticky_flags;
> -	int ret = 0;
> +	int ret;
>
>  	mmap_assert_write_locked(vmg->mm);
> -	vma_start_write(target);
> +	ret = vma_start_write_killable(target);
> +	if (ret)
> +		return ret;
>
>  	if (next && target != next && vmg->end == next->vm_end)
>  		remove_next = true;
> @@ -1187,6 +1199,9 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	 * we don't need to account for vmg->give_up_on_mm here.
>  	 */
>  	if (remove_next) {
> +		ret = vma_start_write_killable(next);
> +		if (ret)
> +			return ret;
>  		ret = dup_anon_vma(target, next, &anon_dup);
>  		if (ret)
>  			return ret;
> @@ -1197,10 +1212,8 @@ int vma_expand(struct vma_merge_struct *vmg)
>  			return ret;
>  	}
>
> -	if (remove_next) {
> -		vma_start_write(next);
> +	if (remove_next)
>  		vmg->__remove_next = true;
> -	}

Hmm you're moving the ordering of things around again :) You should have made
this change as part of patch 1 anyway first so this patch wouldn't have a
refactoring in it too.

Top of rmap.c suggests you _can_ take the VMA write lock prior to trying the dup
but I'm just not sure why you'd want to switch these around in this patch?

Can we try to keep original ordering unless there's a really good reason not to?

>  	if (commit_merge(vmg))
>  		goto nomem;
>
> @@ -1233,6 +1246,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	       unsigned long start, unsigned long end, pgoff_t pgoff)
>  {
>  	struct vma_prepare vp;
> +	int err;
>
>  	WARN_ON((vma->vm_start != start) && (vma->vm_end != end));
>
> @@ -1244,7 +1258,11 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (vma_iter_prealloc(vmi, NULL))
>  		return -ENOMEM;
>
> -	vma_start_write(vma);
> +	err = vma_start_write_killable(vma);
> +	if (err) {
> +		vma_iter_free(vmi);
> +		return err;
> +	}
>
>  	init_vma_prep(&vp, vma);
>  	vma_prepare(&vp);
> @@ -1434,7 +1452,9 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
>  			if (error)
>  				goto end_split_failed;
>  		}
> -		vma_start_write(next);
> +		error = vma_start_write_killable(next);
> +		if (error)
> +			goto munmap_gather_failed;
>  		mas_set(mas_detach, vms->vma_count++);
>  		error = mas_store_gfp(mas_detach, next, GFP_KERNEL);
>  		if (error)
> @@ -1828,12 +1848,17 @@ static void vma_link_file(struct vm_area_struct *vma, bool hold_rmap_lock)
>  static int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
>  {
>  	VMA_ITERATOR(vmi, mm, 0);
> +	int err;
>
>  	vma_iter_config(&vmi, vma->vm_start, vma->vm_end);
>  	if (vma_iter_prealloc(&vmi, vma))
>  		return -ENOMEM;
>
> -	vma_start_write(vma);
> +	err = vma_start_write_killable(vma);
> +	if (err) {
> +		vma_iter_free(&vmi);
> +		return err;
> +	}
>  	vma_iter_store_new(&vmi, vma);
>  	vma_link_file(vma, /* hold_rmap_lock= */false);
>  	mm->map_count++;
> @@ -2215,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
>  	 * is reached.
>  	 */
>  	for_each_vma(vmi, vma) {
> -		if (signal_pending(current))
> +		if (signal_pending(current) || vma_start_write_killable(vma))
>  			goto out_unlock;
> -		vma_start_write(vma);
>  	}
>
>  	vma_iter_init(&vmi, mm, 0);
> @@ -2522,6 +2546,11 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	if (!vma)
>  		return -ENOMEM;
>
> +	/* Lock the VMA since it is modified after insertion into VMA tree */
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free_vma;
> +

You're doing it again :)

Can we please keep the lock acquisition at the point it is in unless there's a
really good reason not to.

And if there is a good reason, please do it in another commit prior to the
massive 'change everything' one so it's more easily reviewable :)

>  	vma_iter_config(vmi, map->addr, map->end);
>  	vma_set_range(vma, map->addr, map->end, map->pgoff);
>  	vm_flags_init(vma, map->vm_flags);
> @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
>  #endif
>
> -	/* Lock the VMA since it is modified after insertion into VMA tree */
> -	vma_start_write(vma);
>  	vma_iter_store_new(vmi, vma);
>  	map->mm->map_count++;
>  	vma_link_file(vma, map->hold_file_rmap_lock);
> @@ -2864,6 +2891,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  		 unsigned long addr, unsigned long len, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> +	int err = -ENOMEM;

I hate this 'default error code' pattern, it's a code smell. Please update
everything that jumps to the failure case to set err, and leave this
uninitialised.

We've had real bugs come out of this before!

>
>  	/*
>  	 * Check against address space limits by the changed size
> @@ -2908,7 +2936,10 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	vma_set_range(vma, addr, addr + len, addr >> PAGE_SHIFT);
>  	vm_flags_init(vma, vm_flags);
>  	vma->vm_page_prot = vm_get_page_prot(vm_flags);
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma)) {
> +		err = -EINTR;
> +		goto mas_store_fail;
> +	}
>  	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
>  		goto mas_store_fail;
>
> @@ -2928,7 +2959,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	vm_area_free(vma);
>  unacct_fail:
>  	vm_unacct_memory(len >> PAGE_SHIFT);
> -	return -ENOMEM;
> +	return err;
>  }
>
>  /**
> @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct vm_area_struct *next;
>  	unsigned long gap_addr;
> -	int error = 0;
> +	int error;
>  	VMA_ITERATOR(vmi, mm, vma->vm_start);
>
>  	if (!(vma->vm_flags & VM_GROWSUP))
> @@ -3126,12 +3157,14 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>
>  	/* We must make sure the anon_vma is allocated. */
>  	if (unlikely(anon_vma_prepare(vma))) {
> -		vma_iter_free(&vmi);
> -		return -ENOMEM;
> +		error = -ENOMEM;
> +		goto free;
>  	}
>
>  	/* Lock the VMA before expanding to prevent concurrent page faults */
> -	vma_start_write(vma);
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free;
>  	/* We update the anon VMA tree. */
>  	anon_vma_lock_write(vma->anon_vma);
>
> @@ -3160,6 +3193,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  		}
>  	}
>  	anon_vma_unlock_write(vma->anon_vma);
> +free:

Nitty, but this kinda sucks as a label name, generally when the error label
contains 'free' it is free_xxx where 'xxx' is some specific thing.

So somethiing like 'fail' would be good.

>  	vma_iter_free(&vmi);
>  	validate_mm(mm);
>  	return error;
> @@ -3174,7 +3208,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct vm_area_struct *prev;
> -	int error = 0;
> +	int error;
>  	VMA_ITERATOR(vmi, mm, vma->vm_start);
>
>  	if (!(vma->vm_flags & VM_GROWSDOWN))
> @@ -3205,12 +3239,14 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>
>  	/* We must make sure the anon_vma is allocated. */
>  	if (unlikely(anon_vma_prepare(vma))) {
> -		vma_iter_free(&vmi);
> -		return -ENOMEM;
> +		error = -ENOMEM;
> +		goto free;
>  	}
>
>  	/* Lock the VMA before expanding to prevent concurrent page faults */
> -	vma_start_write(vma);
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free;
>  	/* We update the anon VMA tree. */
>  	anon_vma_lock_write(vma->anon_vma);
>
> @@ -3240,6 +3276,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  		}
>  	}
>  	anon_vma_unlock_write(vma->anon_vma);
> +free:

Obviously same comment her :)

>  	vma_iter_free(&vmi);
>  	validate_mm(mm);
>  	return error;
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 8134e1afca68..a4addc2a8480 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -40,6 +40,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  	struct vm_area_struct *next;
>  	struct mmu_gather tlb;
>  	PAGETABLE_MOVE(pmc, vma, vma, old_start, new_start, length);
> +	int err;
>
>  	BUG_ON(new_start > new_end);
>
> @@ -55,8 +56,9 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  	 * cover the whole range: [new_start, old_end)
>  	 */
>  	vmg.target = vma;
> -	if (vma_expand(&vmg))
> -		return -ENOMEM;
> +	err = vma_expand(&vmg);
> +	if (err)
> +		return err;

Hmm. But before we were filtering the errors and now we're not... I guess not an
issue as before it could _only_ return -ENOMEM, but again, are we sure all
callers are fine with -EINTR I guess :)

>
>  	/*
>  	 * move the page tables downwards, on failure we rely on
> --
> 2.53.0.414.gf7e9f6c205-goog
>

Cheers, Lorenzo

