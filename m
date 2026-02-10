Return-Path: <linuxppc-dev+bounces-16781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LTwKohGi2kJTwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:54:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E7711C1F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 15:53:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Phh53vWz2xQ1;
	Wed, 11 Feb 2026 01:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770735236;
	cv=pass; b=B7gAkB37hOQMapxmybbymF2t0iopOJ2wGu/Y1ofyKj+NoR2ixZ1UmaacGMUvPLod3N7gSc9My7LB409HzN1D/I4rQR8qNWclyYVq/PZ3pCEATfmPcrfP+t2/MJIaJQrZiIuqgjmdBUDhUSuIwL0jm4t7PI09w6KPo3Zq4xEhDJT2fwwLcR7OciOVSs0DFi7elmbRi4B3qXewk8lnMgg5wnh9q5BDYdTBOrFJqQRgwbp5aZ+03soYequM1wG8F2iAzVT1UGx7NJDukRyFjf8CrZKhnx2PFIlit5mu21vpf+1XF90CsGfILgys6BscH5ma1A3fCxY/WJD8q5U7VoNorw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770735236; c=relaxed/relaxed;
	bh=YsAcfmDZeSllyEOmrbCFKarUwrcMLoXnElEBGOHY7Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=StOvqhCjGL/PkzEIt/yeaW4VvTfAHgf07A7JOgximGRTtZC7pMJEur7M32q9uTmPjBlxdbpL9a2xR9Zo9oMGWPjfnETnrHhwgaTpN7bncmFN19HW9uoTnu5XSuPS2/1jwz2ghCtZdNemM/f51yjJeaNMAGwCafJj7WJYV4YHXhVOkZ+UYxEheV6XkfFm4EwBCNyACzYHjyI3T5RN9rVCrJyVAiTVUf2WXwr3je0fl05dudhsDr4Jzt1PoyzFvB7nsEbWurnLH+NCLMl9SduGNS0q5Jlmc8EAIzq7wFoh3Tu58m+tmN2wVGD4IfDTBXP5xu9+ZQ4cnDIhCasihtG34A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Qa+FZe0o; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nOaBz9Fe; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Qa+FZe0o;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nOaBz9Fe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Phf578dz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 01:53:52 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9vCk93796745;
	Tue, 10 Feb 2026 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YsAcfmDZeSllyEOmrb
	CFKarUwrcMLoXnElEBGOHY7Gg=; b=Qa+FZe0odMhm+LiXVrTi7kK9kD1CgVYFQ8
	Ze3Md0vr/QMZ7rBoGVMrZYmfRE8FFdWCIpzNvJw5kASaZ4+efwYLQQHD7N1u4DT4
	EppQyeKL2L5liFaHjLojYP1c4T535mTNJm7/TzLL4T6fG9oEoXg0RPpXAGywoT7I
	VSg9oryy6lfuQU5uT9Ukr0YcBPSitRMUiZC3iwrX154zXiWUVUEIKmyCnPQRuKC6
	2LHJCj7130ygO9ETFVfGkCwDj6X/9ekHqf+OvAA4YkLwib7YM/bEtKKwpH6QGvXe
	LYOes8iCrrtzWqMjphmrEh8rIZwwrDxzIaA+gDmZDjvRlw2udrMA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rs3q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 14:53:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AERn1B012976;
	Tue, 10 Feb 2026 14:53:01 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c826y3qmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 14:53:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2ODgokpd6JoKbQt6aa1ZesekWQsIRgN7jrW9nsP/uDD62D0t8dwUxPAFE+Kez+gTLI2VEjNu01ztJr9qBCLCJNSVKPw4vp+rqp/qbqYb+3GbE7rgYnhvtv+u3j1XslLOAiPOCURxDzgKIZ4A/ATHwJdjWTs3T61U4dgm/8pJV4flRNI6yamhJK6uwEDpqh0Xigz/pSq6jpxmX2VPTSdjYwgT85tetw/dN5B91GAKoG/zAlcSonDWWKWStfRSDaWV14zZHHZBALMvxutx9RwLJ1dK4vfnBXCmQsQO/Tv3L3W3NWN/Z9vUnMzqmUmKM2XMRIrA4sZeJUCTZ5YxFLxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsAcfmDZeSllyEOmrbCFKarUwrcMLoXnElEBGOHY7Gg=;
 b=bWQ8hb/OMyJMFCweErajhvNgFxG8pcgBVw3aCKBGmFLmNL0D0iQVRBwMDc9w9tIqYf0nYXT835CUWkb83usKfmg1NU/7MM9X0jbz2PxRSYR3LwaykQGD85F9jiAKynD6It4gJabuX0OEVQvEoZbOhgUlAXlhrRlzwMQUH8vTGvUcBwsC4MYBOIfszupVG8qgZD/iKp+Mkf1WcO9sNfmInjrAWGi8N4F2vMODnztjTvaTRKYpD912EqP9HfH5t+13uQwxYK64+cUUIhquuYtANv3lcelLyz9mGlMVN2w08cnr62yeTf92fzj2pC8YtDx3NupNd4fvqBGp9j4rSJ46bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsAcfmDZeSllyEOmrbCFKarUwrcMLoXnElEBGOHY7Gg=;
 b=nOaBz9FePCEIHUMxZSc517aM+s8uX5r2ivjSi7SHEC4yA6xI/bConhQmePMd4kvIgqp21YMKZ6SiCucDiVjStbRcRMGNGhDh/+fxOijtmeCkNE7XaOXJSdm7wj7SKtihn7mw0cuFBgRkr0efyaO1H/G0jLNzSG4L3iUCzQnfrsI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4613.namprd10.prod.outlook.com (2603:10b6:510:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 14:52:56 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 14:52:56 +0000
Date: Tue, 10 Feb 2026 14:52:56 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
        Brian Cain <bcain@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
        Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Michal Simek <monstr@monstr.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 2/4] mm: rename my_zero_pfn() to zero_pfn()
Message-ID: <b932ac24-2465-4176-a5fa-d9b904600a15@lucifer.local>
References: <20260209144058.2092871-1-rppt@kernel.org>
 <20260209144058.2092871-3-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209144058.2092871-3-rppt@kernel.org>
X-ClientProxiedBy: LO4P123CA0566.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::16) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bb5fd5-8223-4dba-5cbf-08de68b4137e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kXwD2Zj5jaVFVoa7ajY/pn6EL7En4xkhVd4I7bPUJVuv/jDZo3VdFZ+zO08H?=
 =?us-ascii?Q?Wt1gr5OE6oUsaMa8K2ZpXcArjU1N1ZUAZQ73fcAe/ocm0kbLamvE8BgheGjy?=
 =?us-ascii?Q?etgp2wQdCghdHF+SrDkRGogzM0cx1E47ZPKLKJIoC7ePv7WkVlBnnmohD9X4?=
 =?us-ascii?Q?h+o/vgz+tw9VTLMQPQXmuf8ZZMKBTHJiGJtF8Ah4axDwu5sdEOWbsspbkT8X?=
 =?us-ascii?Q?OYeXqk3mv3TXrL87w6dEigMq41ZjGu4HE68rxB4LSka76Hny86SEPVkEIZwt?=
 =?us-ascii?Q?pRTWtq2H19+QLZOTgvBhkZi7Jfrw/qf/dXrMYS7Dg/Njz9qLfN9Vb2FNkucN?=
 =?us-ascii?Q?9zjsaCCevoNP5WdqHbFFc2hXjp0eMTJOHFhjOfZjykFwi3pw5+jEveHhHC+Z?=
 =?us-ascii?Q?tAlGiahQStuAnBxLqwAoMUQJLk0Hiow8+zrp6geyL96PUfKgVeuZHjx3mDDH?=
 =?us-ascii?Q?UDWrKHYzJVyynU94+2ONggkG4Xeu8ARuExZcZLvhvjdCLYoOYqznOkVHuGyB?=
 =?us-ascii?Q?WninGO0T1YAVU8ayPMd9GQcOQ0U+SUDXNIKzYwvfHL4KJcWc0BoqVI2wvqXb?=
 =?us-ascii?Q?wqSm0Q1tnBMvqD3f/TeR38VmGRrKgKOFRSyyNGhIFsfLK2yNkSbZy9aEI49q?=
 =?us-ascii?Q?t9iJEgQYAFF42bSWzggwKj7YnYvN4knYsCfKptaQq1KuW//LgJyqGBb2d9Ji?=
 =?us-ascii?Q?k17ntgnx6vOJUPNTGrsBg89gzz3nw9SJbk8snzhEeSz6DyPlLqurdvjWIOls?=
 =?us-ascii?Q?xmQUQme/U6rr7XcbCZGuE+FmudInnuoxENw+jD5NdQdFi9LchepVo2pHAfuR?=
 =?us-ascii?Q?la5pplzGxdl2SFOfjjCe7H4HUTyW72f/rO2ldQY7Cd89bEiI5LcABcqv5E50?=
 =?us-ascii?Q?pRvVgtGpx6aif6hmbCgJKwr+kl+4Fc354pHE6L1ATFn+GYIVRA/bdS+7VQwI?=
 =?us-ascii?Q?Za18up/mpMA1OVQjt7xDJU9qErsv1EcUnSRJIf+9YMvsFB6WkYAz5gR2P8gb?=
 =?us-ascii?Q?ngtc4UmKvlVwzx4ktoqBFaVUcHo088FUHXrU8Lavbp+V9BcXu1OF1vg4JhQ8?=
 =?us-ascii?Q?1xvNNDyKDTt12FNFc85TRAPCFzduT/br4flouvDR8vB2WiULmFLdJCP7bZcc?=
 =?us-ascii?Q?UdGqV1Tijsg4AHfvxXgLHOJq0JaTPF7/Rdfg3un0SOekPfmSpv8QA0xlNlVZ?=
 =?us-ascii?Q?ikPz/J4swOk8BjTgEp27K0S+Mro/u/m9FCYhI3mjA0yBUGAaqh6sKz090fBG?=
 =?us-ascii?Q?i9mvOccLsSgvHsmErRuIaI7q1l8eOpFxipbN5pxR3MUThRg5VWhrJMFSVyiY?=
 =?us-ascii?Q?FRf31k0wWQcp+Ghok1li7ehaVrfuVLO8DJ22CIxG3IZFTXwwrbsxYs6eTCHB?=
 =?us-ascii?Q?V22dqoLbMt8Byp0xfzLmPsiPuljhSM8AM01Kw3QOex2PXnMKnjfBC0bf+K8L?=
 =?us-ascii?Q?5o2RaRbJNvxec1GHOu/B7Dz48ROKcJbIJSythZyZuNPg2KU1oCJsmOxTMdJG?=
 =?us-ascii?Q?Sx0Xo0/OlpHIRpLqYVdSWqgtrad8A1Kbl24F/w7TFsglJhXS8UJDBPCGoSCq?=
 =?us-ascii?Q?lKG/ovxaP7j1JXPxaog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0K1sq0uqLbR6cUlXK+WL3bWvAUl7w5VjGdByrFCgk1ogAESOC7xFuS/0DBD+?=
 =?us-ascii?Q?0FBB8TJFrv07k/tSj1Ho5ebtnNnDEz/3cemLEdlFGK75lkZmjZf9oEnSEVOg?=
 =?us-ascii?Q?8QfbOACTCFThWCbkLJfxE4pytnKQUkyQ/XK98jf4Cb1oMMea2AvLZgBiVGJv?=
 =?us-ascii?Q?+yMHLFyWdqlkzpDK6DdxoJikkLj3C5gxppTsvxJv9EowM7G2Hrjb+HQBlKcV?=
 =?us-ascii?Q?cxNPGLYbUs9J9CdjOX9zQh/W6Sdoc9hyL4HqM1SL8SRUU4Fray1MGSK8TuT8?=
 =?us-ascii?Q?e94uRE08fut4vm5Dp1+whAjjg62wrIYCQSjbSJpgHkQgNdA1EwTzdHAgpwYW?=
 =?us-ascii?Q?DGyTbSLVNtcCEUGalyvY1o6XKZseVEoXMC4qnOtpOl9ajKMc+e1i1IEaBxtJ?=
 =?us-ascii?Q?aHoTNM2lUEX3Wt1UM6iwfwTN/+pghLLAq/XuBpiIL0jicW6kk4YbZOl1Om/X?=
 =?us-ascii?Q?tKadr8BXKfy4bp3lrs8dhhFZsmJuf5Vyh8+I9tMyf0Rl1xKbACMabkqrL7lP?=
 =?us-ascii?Q?3LX+E0WHHR4/7RR4UYi/W/dmUctVGeWhFm8D6CrCsr+Uc6XfTEpfPEVhtaBo?=
 =?us-ascii?Q?DcRITivBy6Wj1CFosE+uQU+sppgPmAO845RNs62M759CBGX/mFHN7iQua+xK?=
 =?us-ascii?Q?Rzaj4CQLGgw4IEbrfhV8418iS5lnJ+EqJLVLu0t93pW7VMRlcYhAgkMzC4II?=
 =?us-ascii?Q?d8RWItZVTcNiapW5prTb2cywwXYKcyNxMHXKtUC5UGEOlC6IF8OsPyN4txox?=
 =?us-ascii?Q?EUutnI+xa7GFKW0q/DzOm3v53MGUV3GdwzfZFy6O5cJ2Q01zPQIrj1RimHc/?=
 =?us-ascii?Q?jkQjpY7V4yvoyElSkxYcK4j/umV9+Z15z1OvN2eaVgjlS8dHuJzvp0DS3+YN?=
 =?us-ascii?Q?IM269AI9rkdBMLvUAFfRRha/xFuIcEQuFy2anjQ5xLu3kKnNuoT3XGKfci8M?=
 =?us-ascii?Q?7DrzP3gyj9jYotj0XtTxDK5Lu+0YA5bCC2mg/nU80DH4r+JbZ3MxQI5/Osol?=
 =?us-ascii?Q?Typ5Dd5yWkI/R8oQgSAp4vhBss3+cNSAnsPUK5KAMfNMgkVKPFfu/DflUoO1?=
 =?us-ascii?Q?uZF8dfLfxXho7qg7Hg7oTEVVB/G/h5wj1sJrfeSyimy+btZ6EqCNIoE/YkCD?=
 =?us-ascii?Q?gdwctQUvmBnybl9bU9oSJxGMWi05CMJe2NnzTucBjZ4/mWkf/rosL0D50MGb?=
 =?us-ascii?Q?iJkLQybMw4XBRCgq0CZbKG2iLnduR8aLyEhaOAXnfREUBdTIExeYunr1RLK8?=
 =?us-ascii?Q?aiIqQQh+4/SjjZ+xqO4G3lL/ooLXrpFucFwkupQGT6r/1l4ja71B0rzzlsfy?=
 =?us-ascii?Q?23wpVO/ccMQWK7MS2sDS+XLQMILuDdMQ9UBN1/f7+QkDX7Nnt1MAxabWhGJB?=
 =?us-ascii?Q?LrBRZkdxF5LdSfq1gIbGr9h183NEIH6zAkUcgWn7sMxH6s1kx628TpjMf44w?=
 =?us-ascii?Q?6BOvy1wbTc701LANa7XPuuPd5F9tlZgY6XSxWFXsws31qx2+2qTvWIYJSeq6?=
 =?us-ascii?Q?gvkGuApDLtn2FZsPZCjxFGVcyr2Uc8PrWMn2AmhJ2jEWeGmSwjmnQRPepPxj?=
 =?us-ascii?Q?Wudsrq0a/V9PLTNHnl/ELbcyEYs+siIKrvY6YPQnZ+Nxahq/T+4+013hDkz6?=
 =?us-ascii?Q?rkNOGQtVxUIrTrIqb2kklcfkKP7K3ffNHTIubfLcZaRGnDSamSkzdV+FIGzr?=
 =?us-ascii?Q?ibtUKqzPk7t/Rnp61IYChMqvPjsw3KMtQOQW5tOzP7tfiZfvk/BLvHRlx+W8?=
 =?us-ascii?Q?b32TQIYnUg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kjvYgW91+bNLTQiuSNN1MDHHfnmd7KLcu5I9oBid5LGE2v5hxo6JGMWvNjCeZBxK/952OifHDhwL9fRRq6G6RdD0tatDOgALw9ELtjHDyFlRvvtfbrazOCNcmU9vW2XGyTFWkq9RTbvLSON01sB9JfN+w5B9BPfPn4J0zvZnbxZdI/AoAEFrN3EUoADl+mHZgurak5XF0Vm4V9TBx5Tb1DFwgxA3himc964lIhmPnVSOJlco7oE/lL6ZfL8wwqskK2PhjpDosLH6PVddUzUoCgpRN+DcpCFiY0lb9TvAW7hFW3ZMvWRSbzPPPaGKEo4InkgLHC4kuNzdhFFPhoEp6fglSyLWP26MoCHrAvPuKaVZgqA4jO9amNdG/bgo0ijB0dYC0J6M7P1UqIW+e3zegoQ+xyQgVncSpQPtcmQNAAzYXRdcXnILjEWk0lnQ+Po+DahpmFkU+JHOES0sXzp7n19rxVzz/2Nrzaqc5otZdOl12I8AQUSeyvtSvFlqUoiXkejlTWWOfzkEfYFxF+UXYPbgzYfqLeybFJVCuZG7XFohENDKqrjPdo4o7i0jDU512yKcBDmsPYNKiUyav5rWvPxwwFm1yj9dldw06HkUVmM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bb5fd5-8223-4dba-5cbf-08de68b4137e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 14:52:56.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7X/PnuF7/DQgWXa5GMGeDfwnPzlywfkj5UHus9y4TE46ViQw7ub98uFrlgLJIJCNvcDfM5OTBmj5+FnNLq8a6pv2kYGFiRR5Mtn5gNPpkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=694 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100125
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698b464e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=Hu1Ffv23GG47cUM2OGAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13697
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyNSBTYWx0ZWRfXzgPA40vdaiGd
 3oN/zyCbqUkvb73nCQXFDhGkjzC/vyqNX8FzRFg43MIydR2ytauQIKACeWmBB0xPIkPz8FAl2Pa
 csOKWd5B1Jn2UKn8xgKwf1k+hRCWDVNm4lF+nfDOBSCQKGxoIJAKc6IfafLKzU4mwJnBqBfb58Y
 L+zeCDCPUeg1oko79q3KmNfXsnY2TYn1Crbin+BByxesXlHOnQuAI5FmLHeU2eyoX8bFtLi3tqa
 02rXcUVsqPkualFVZUPmVpNteXuCKbGPqv7pmilDp3ye8DhHlbZs1+h1wisACYUkr/Q6jYpJZsM
 iweQWFL1Oh6cd/UVSFUG8g6HyH87xptWxLezHD5LxiQACKZw6rXils1coM6ah9zFnfmYL69Hu7u
 xhd45jS0HyQhJIb2QV5jtsVI2vLTcgQaviviiRjV/n09r1FmGO5XBxyqLZU9VGQE/M2kHcdur9v
 8IIwgkXWTOe0cFienuHILeznFP9iEohm3awklsRU=
X-Proofpoint-ORIG-GUID: EcG39zUlxv5zh3_I40_4b2QSUqDEkbl6
X-Proofpoint-GUID: EcG39zUlxv5zh3_I40_4b2QSUqDEkbl6
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16781-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,gaisler.com,alien8.de,kernel.org,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,oracle.com,linux.ibm.com,gmail.com,ellerman.id.au,suse.com,monstr.eu,dabbelt.com,nod.at,armlinux.org.uk,google.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,kvack.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:dkim];
	FORGED_SENDER(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:catalin.marinas@arm.com,m:chleroy@kernel.org,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:Liam.Howlett@oracle.com,m:maddy@linux.ibm.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:palmer@dabbelt.com,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tglx@kernel.org,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:
 linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-mm@kvack.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzo.stoakes@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E8E7711C1F9
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:40:55PM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> my_zero_pfn() is a silly name.

Is it too late to ask for it to be renamed to lorenzos_zero_pfn()? I've long
felt it was mine, due to the previous naming, and I feel like maybe it's time to
make it official... ;)

