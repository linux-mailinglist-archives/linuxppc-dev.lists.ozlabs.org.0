Return-Path: <linuxppc-dev+bounces-9050-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56004AC96D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 22:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b8FtB4pwKz2xQ4;
	Sat, 31 May 2025 06:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748638642;
	cv=pass; b=HoQClkS860A0vNItH98yLwXj15nlyiCgXj0LK9x532vdEKGJftC7rxttjJNg2eQr497ydaFLlgkE5hycPyBClGA8qDON53wxpPnlQe2tNYDrbvqt7s5yPrUryZlQWsjR+avjj0URHaJ68s/l7ypW+VdQhr3LsA5KFCNPbxWByuHW4H2zvwpF4440lNCi/h3bF9BhDTd1kBpIyKKwFiqwuzyzBZbWXDcsjb3bgFaD3din+jhIEUU5D2jqAILk3hDhYt4n2YyNRH64frIzFUwQuuWryOaSqWPjtf+PCWARPVFbTTdFMua6OK0St+kRD5udWQ8prgeBfhVtc39caOzelA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748638642; c=relaxed/relaxed;
	bh=I+DxlQAbrpaOCVfQVyLgrK9X1SNPjzSzIGLlfFmHbLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vjz6D6JSbKYM7KrAJrCsLVYtCtfXgoVgptSpgFyI19p05e17C08z1xL1u+uRFv9Fz3XF2xRDakDrbUfC6PC83ityEItpiOjaifBnzlLh0P2GxsXz9idbOdp/SzgCcqhoRXzdC0q/dn15Moj9y5OTEMkpPtxE5zVEhzVOStDsfGfg7757/GNuVD0sCugMOBL4xn8wScWOfgB0BkfiRuzBlwlMbjqlPA4GJLo0mZQxVxFNAypMEVef4AUXOCQOexuRkhoSabn1Nh13VTSNH2WzjUam6uX6k2GuP1VZ4FO1KuDo7r89qpc4LYJ36G5GluuqT0kQOD249eAAU/JPwk751g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=bEl3DquR; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MJHoueYr; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=bEl3DquR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MJHoueYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6427 seconds by postgrey-1.37 at boromir; Sat, 31 May 2025 06:57:21 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b8Ft93PCRz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 06:57:19 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UJ7Vkn026387;
	Fri, 30 May 2025 19:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=I+DxlQAbrpaOCVfQVy
	LgrK9X1SNPjzSzIGLlfFmHbLc=; b=bEl3DquRUZ4iOPho8YbFLUlX40U92QQyZi
	J84f5A9066yNxz9R9YKi67eBo7KrcfC3CvxOlO+O4UzSyyxu25IojqTXjokNMlkH
	o5UVmTvI6tXI7INYXNdjDndyXt4B3UzScVuA9lr3+RSUQBlSeY0BgVfdt9BAhuI8
	incx/SIVHhTHfXUQAVM0WZeugKPTO+vc4XoWfcbzkesMeHW0r6mjwzMsUsiKT9bj
	lwpb3MUg8gWQv6hObiDvuD5YXDeyISs/sAhMfePOf4En0Gn7Y7kJv6rEt4KGWLqE
	jNFptIaa18EYsw25jS3/5pnaRJRGXImwVir19iGxhyVWEdUTRjww==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pdanjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 19:09:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UI6IRK023031;
	Fri, 30 May 2025 19:09:09 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jdcw05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 19:09:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fV83HSaVXL0nwGdOC7JLeoNVWKvDHT8TulziKNYJRcEwT67HYlN/96q0r75Pj/f+Kz2gEabRRXz6MDrJlowy0L22Qv0VQi/ep9nus/ctQ2M0/ZRb67FIZUdKo7Sa2/7IKv6toPu9UEGxBsUAAcZopTKBdwlZI1+ddFFncm3lMSipSfuDu7uSrPanTOy5xg2SYK+c/PUBaPS7Vz16Hz1Pp5w/+k1HejxV3b2Kc1YFhdYCSupzy26iUbmpIMj9pz4YvTS+MIEknrVAgILM6dL9+C2+Jq6pw9P7KZtGQnAHsv9S+o8u24HgdfBtGcpfAYaCaK8RGnUN2U0Dzva0waWziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+DxlQAbrpaOCVfQVyLgrK9X1SNPjzSzIGLlfFmHbLc=;
 b=QWh4UjgstVjzu6qvtWYkgrFHzt8Qp7B4JQ02a4nX8jxzyyuK3XhFFMc1X+HIGnUmREP1jZiRQcklth4jpBuCT+4CGI9UnpY5Zpjq60w7vH4isKxyrJuj5mnvRC/AuzYgiYzRKZLTF7xL9ZGnRRNYbA3Wsc/U2cLcoDy163s3XaKkm28+zElgxA6BV5UdX2KQerRu7QJP9SnQt5oTql+FUI0Xxhk1BmCV3SPMcz9hbxVgYJo3DNdsDD5IAtw38vY8WSCNhNGSSzLlW80HLjCSsxT0SBiAAiedstaRlzrDbEyLfC2ZEM2thLBhqBYkA5RCtAPPPBbgNdqZ4FJDr8SbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+DxlQAbrpaOCVfQVyLgrK9X1SNPjzSzIGLlfFmHbLc=;
 b=MJHoueYr52bEQ2q3YLNjhCoqAXHl6fgHZ68oSWO7QV/bJ46G5Y+Yl90yAVtjnw0P3vwnvYEW/gF9h7zlgX0LHshKt3vDKz8VLYe1qAdPreIMlLRNLQxIjjCRrDL1D0U7YRc3vNgxyslMPFXRRhRC4msHFgzdpY89pQ4ets+h9uA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB7593.namprd10.prod.outlook.com (2603:10b6:806:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Fri, 30 May
 2025 19:09:06 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 19:09:06 +0000
Date: Fri, 30 May 2025 15:08:59 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
        Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 3/6] mm: Avoid calling page allocator from
 apply_to_page_range()
Message-ID: <fbscxpcwnqu7fblvzzngvgop2n5upal2wdlqn7k2rsbswdmna6@xiyhbt5j3web>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, linux-mm@kvack.org
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-4-ryan.roberts@arm.com>
 <6nf3cxwhij7jtfi2u6nmt4igezf754gmue5dfskn4jkfkxmjzr@7btdipzmzjuo>
 <c7017555-cc46-4cf9-86d2-03a252165062@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7017555-cc46-4cf9-86d2-03a252165062@arm.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQXP288CA0033.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::30) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e839227-86dd-4acf-0686-08dd9fad72bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kJfJ27FNTVe2elKeGPhwHyIB9h05nb+1Vq9VYumafk3WQiKzfWzXBoxfON2F?=
 =?us-ascii?Q?0FlC7c5Ar0S5XbmPYUMUyvXOAG4IuW0nXYul/sGj40PUOyR8+R86Ltpt7yDi?=
 =?us-ascii?Q?YZ58DTqJ6EMW+NSSuA+3zAwJVNScajb55/lViaP2kKZdMO5bkGnRVPVLgWC5?=
 =?us-ascii?Q?OmGGFCtXDD3AXoWzskoLu05yfZUJ4RHxiK83StuAGjeq5LbryQJogJ0wK3Vn?=
 =?us-ascii?Q?vEAzbuwFgEwZDHSz7Y1UXdPlp5FT71U8kcdRACjaJkdbwSieLLiyKyPGwMmA?=
 =?us-ascii?Q?1uzQF8U2nIRtabfqFJttRDYWO2UnwuEQHY2ZgkYDtwP3QUIW2rVNFYjTg362?=
 =?us-ascii?Q?Rt5drQjjDDy4XbZfQHfF6EG84dGMat2ls+ERAm+erO29TDmIPPQMlvXsLJ9n?=
 =?us-ascii?Q?kFwhU5MMxBh7srtBonXmcEmczw2+ldl96JAFBMAy/B8sRKUrRdP9Mj8PdqF5?=
 =?us-ascii?Q?Ch45xBA9bFM7KhNcN8+QiHun4DqGOSzzcO0ZPkwvZdgjFrfWQB6bZ6QANPw0?=
 =?us-ascii?Q?SkpzA29tjBhaVHFtOU41Tk4VSO4T2Dmh0L54Gpi8oJrnKWxED9rVJ5xXx6/o?=
 =?us-ascii?Q?Rv7GobdElxEig9BVUABsM8BWIO/h+lxnujuzKvVxulZd7U2FjNCRWNoRuUBp?=
 =?us-ascii?Q?C6lJLNRZIeOCJsAF8By1wkR6TZAlyTSSUcQwXfqHh9veAmh+Zz+vYI/ko8+C?=
 =?us-ascii?Q?VAxzPZ0J3ZZsbvkjBNTVzxTANfqjD+Aby6MJJhTqeBqYFh+Hs26G7Z1tdxG9?=
 =?us-ascii?Q?Bk0ncYW5s0fHomai3RV5rwDodiwu0it6ov7y9h2HXXlJbTTRFdWdmHVWZyoi?=
 =?us-ascii?Q?p2Rzt5U/r7+uZ8mRSYfyCh5awfIEtb5e4u/ZJQzNegmbFWJP7mBYc8MZ9WRR?=
 =?us-ascii?Q?T2LNAACoGdgZnrKoPHWL4f4Dv6IFbsp7l89y+EiQS4hd6AE9FKn649thwzsZ?=
 =?us-ascii?Q?29k5bXGAL46mVBm8SUCj2hGnhgw+Rlh/9/2f3sI2W/M6yqQS0l7Dt+nJzRV7?=
 =?us-ascii?Q?vVLiqjk4yBUkyxrDY+z5T1yniX1Ec52W4BtzmwBUbp4E+MsxPqetxO5jax2D?=
 =?us-ascii?Q?56JKPc1+IZBDhbGn0sdLzxbg/OeYWmYAmCuU8CTeklSO6edzAwF21YjIiceh?=
 =?us-ascii?Q?gSDtVJ1HQE61sHO4hJafudFT5BsugtXCmvPR2MvD70CrD82ohZSbngNweMzf?=
 =?us-ascii?Q?sDpQdAOzj6sJt2/K+yjrVlApUFMLCQp39XN6KTmIHuvEbr2NRypP03dIfsmn?=
 =?us-ascii?Q?ktnYKg8YlSDocA7ArIT7DYKsqN028+QVrM5uUz7LB9yvCeYk3kcel0/Unf92?=
 =?us-ascii?Q?BX7EhvnayfhBBCLFXvQ/kquGY+INF8jUnqTlrhxWaCzn16OKDYVCsibL3RAf?=
 =?us-ascii?Q?PiDKP+G1pnDTh5cAfokdyyxpsylxN0N4/dbqCXlmR5t/5p/FpRTJZtx+xSXP?=
 =?us-ascii?Q?BIPnk8Nus4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTYbfM0EgQQX8gpYimYG+IHwqtA03TxEjLVbg/rAsKOH5DybqwTUs8pub+q6?=
 =?us-ascii?Q?TUx5u4WASY8/YqrCbAl18nRZR1w3cWOu4H/nZfVFqY0zKyDJoNsy0QtvG9MX?=
 =?us-ascii?Q?GlfxOc64Oopo5fmVLnJtHAd55+i9cYv3WPqlZG8J00MMj3RI9ht4Vg8ynrCV?=
 =?us-ascii?Q?96s0W3FEa/nLsPc8hv7tdzcJQDHx4U5q7UAbaoSBhTJk1gY/1EwP9YugCjJQ?=
 =?us-ascii?Q?d58KNDMAWhN1j7Q8fIB5x9Rvm13VAZoSwhaFhwNFIBBFBbaM/cBL8hyKQGvE?=
 =?us-ascii?Q?loll5Cm7G28eNduVSvFvL+24+7RszRhxTOP6klaJdU3/XsYykUo/34CEK+M1?=
 =?us-ascii?Q?8QcHC+WA7rt7wcXvufFLe+cQQ7yPNAToTtxrcaAIL5QiLDD0n4yyUjQLk5jk?=
 =?us-ascii?Q?qE1A2iIAOQ+uV+2WnVFlWfVFzjAacP0Bc/kOJ+hcMoortaEEFdr3lTOIOBeO?=
 =?us-ascii?Q?vj5UIVHRsGOLtzsSJw9hAPXlqzi14Y4cqoAmb/9k71+LRxQg0GpLquReu9Sm?=
 =?us-ascii?Q?Wx85fCujj1C9ZfZLoiKm5aSR1fzvCUWnWMtrbVV6YSi5a6yALFFRRmsNn1o+?=
 =?us-ascii?Q?0VmWzwo7KbIfy1lvaVmFED0B7jRr60X0ms83Lu91ULW+xOM881l9yDrXGpc+?=
 =?us-ascii?Q?ZGhNwRR8aLeeVbRVlaUcTIipjFZ+485RlQ76i6/dwuzZv+9X2m9McYqekLNJ?=
 =?us-ascii?Q?18Ik3KB4HtRvJDC6AuhH/Xx9Our9leurZAQ0xMLhHAJzq7k+wpjdHctRLkVQ?=
 =?us-ascii?Q?VqlIzWB7FhWnk8lp6WtuHm5wA79aIe2241QWCFCYu/KuBblGP/TuBkxiZNu+?=
 =?us-ascii?Q?dKmkH8SFRcWM1esiyyp5QsmZJ7JUUP52dllfdr6/w9zpM8xbTkE/bCF6c1M+?=
 =?us-ascii?Q?6eg6jdT9ZBkTlhZy15ap9YzzAQxXzBhJhfXgSjaqVf3w5VPVv7NI9VfDNk78?=
 =?us-ascii?Q?AyVKrfmX3PQcSir1SKGOcXqmTTcGoknhubqqQqC7PLLGuP4AhRL0iiS9aU4Q?=
 =?us-ascii?Q?9byzPA1qqtBZckB1++ApodRrHfT94dPthF7ruoSMVE4V+A1gst7iym34NZ7f?=
 =?us-ascii?Q?TxGMcvEnA7SZBB72u57tXgfL9eHud35qGMF1JJVRMLTk0L8yoedzaBXR0nzq?=
 =?us-ascii?Q?jbNjDE/qD2HJb+daxdmFT8F5a6SxqA5RqQtW+82oAC35JcQH+0FngnYz60M7?=
 =?us-ascii?Q?IUwnKDjsi7c1aU5I7RE9OrQqjzVNsOaSNZUHqCrgYOotZTvt5qTMFlAw829R?=
 =?us-ascii?Q?+N0d5EMHN2CLIyUIrfKxsn86hUCWW1vE9v/uEmuI6zpIZDUvKSbKTIfoM/Vx?=
 =?us-ascii?Q?EqILs386Hlo3EudocuLPZbOupKnVxawG50hSQDDLRER+S2bvaCr8rgmPjTpN?=
 =?us-ascii?Q?6k4y62i6aF9KnP9Ty2KZy2AX7rAjKvjkbED91IeBHJXjFjuFXNVjnEMIYJen?=
 =?us-ascii?Q?s9f3cxuYaeMYxXFwUK+5PWU2Ucae3x+/IP4dK7WaIazL/dz6MSztuQ405mFV?=
 =?us-ascii?Q?3r3UPl41/H61SYNYaUmWXb69AJnjGGN3JlmAU7P++gXOBXepeLIKQO+fEdUN?=
 =?us-ascii?Q?L1Rk0Ewyg7Ooc+wg+gpXFxPxRR5Udo2kd9sJCUPq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sVOhol8w0ju45MVFlO9oaBViN5h1i1vgyURSUcj+8Uq8tfa3EGqFbqavu1BPB34DKpibb7W/p6MmBMSsJ8MC/mT/+ugUd80dJ12eO4g/L+KI0NkfGVc0yUk/81ez0HT5DpDRIgKZ6eJ7g0WY4gz2XKQw7E59ma9ZwgnfmAxGT3yuS2J5gN8YJl/sC1AwB6WFsCyNKMWYJq6CKkON+pRgICF+c/MmSzmThfbNI/ONi6yWMLz4Bse7D4CPcfUpaUxrytmamokB8oEovxEExkDgEeVb/E7MD7RHmmYaCAbLDXfknmrGulRjGTaiGf6+HtE24GO0LAZB4solVtSm+GS2l4ByDLcBl4wpabWA0zu4T5jvCUttEQabInBcynG8WqmJOd9sxcSHqfFZ4DXxi4fPm6eh2CKz7bE/t5aCIJXs7tEjZnBpadgRuu9RHd6c8KGqZPHICQEYY5tvsFo+Vm9mzzS2TNFIu4gjorWDwu2cgQ3/g3CgX1kxK9B2s2KP0fyUEt43XFbcdfkMlCngH9q5xWszSa7m3D3etIuwA3nDHUyHp82eJu8L7sY+rhXopcHhLnHOvd08SzjBHHpn9fRStTs83SwXqQA+ROikWPUkTO8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e839227-86dd-4acf-0686-08dd9fad72bb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 19:09:06.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hu2NOjsxXxo2oTSz1+Y81cGkmpy1+8BIh/ozIz51cIt6tohYaFvsh/6aCI1k8xVr5uKdfukIYc1VfjtTTAzP7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7593
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=631
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300170
X-Proofpoint-ORIG-GUID: nizOyBwxlJx-LsgCzOdBD7qM-5WR2XWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE3MCBTYWx0ZWRfX/+5je1+eyY0p fCIECjqdNPoz7vevwpuWFWr1a/w1t04zXEqnMKnEAFmMugLmT2LEbbmEJiDe/IUu2THrQeZTE1k KM1pS38bPV588quwm5+isxAt/xruV6sHGkYQYwpvWfMnByrbC0ioyu+qAUiSoaRCLcHZ/fCopw3
 bmWekhCPXl/PI6VOS8oPWOqyRzRODnBcDoS24DK9lsm787TL9Y9opwOqwteEhFb4W6Ux+VlASvA vtaLL8n+09X/QQ9ngE7AaDrnQNPwPSExAcDjqwdxjP+T4ViYpkPs0APD8lI0rbVmFw++MGdC5rM c90Bu5SLtlrUs2JW1S+5ad5JEOxhHG4kXRRxYlbEY+rkrSrS3a3/G8NEoEpdskQWKMGg2Cl/k25
 ov2ha5l6ZXxScVKXR/Gm3hwoH1iyLqQkiyGMOU70+oZMOchAM80ejZu9YN4tptSF/G6eU4M8
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=683a0256 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=qmk0JyoKvBD0N212XD8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-GUID: nizOyBwxlJx-LsgCzOdBD7qM-5WR2XWe
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Ryan Roberts <ryan.roberts@arm.com> [250530 12:50]:
...

> > 
> > 
> > These wrappers are terrible for readability and annoying for argument
> > lists too.
> 
> Agreed.
> 
> > 
> > Could we do something like the pgtbl_mod_mask or zap_details and pass
> > through a struct or one unsigned int for create and lazy_mmu?
> 
> Or just create some enum flags?
> 
> > 
> > At least we'd have better self-documenting code in the wrappers.. and if
> > we ever need a third boolean, we could avoid multiplying the wrappers
> > again.
> > 
> > WDYT?
> 
> I'm happy with either approach. I was expecting more constination about the idea
> of being able to disable lazy mode though, so perhaps I'll wait and see if any
> arrives. If it doesn't... flags?

Yes, that works as well.  Please use pmd_flags or anything more
descriptive than just 'flags' :)

I wonder which approach is best in asm instructions and self-documenting
code.

Regards,
Liam


