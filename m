Return-Path: <linuxppc-dev+bounces-929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC8A96A76D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 21:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WywqH2xR4z2xWb;
	Wed,  4 Sep 2024 05:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725392203;
	cv=pass; b=fJSy50nXQXlNHsb9/LUFAWo/tL9JyRwNmTRQR6IzEAnY7Sb142vODLL7wI5gK8YSn72BMZi9TSjIiE/jh3AQGlrcuPa4xE/DtnJOthjqyr7RdRWX1knVBC+0UR9Wf9+Klw5wZjIcpNhqGxPUfBGu23nrXZZq9b702Z6nq+bvoOEkNvR2e4+GExJRHrEuq8rq8aasbShkh5ZgfuSGOW3pmKt+OXRKoSDJOGwk80KST1sdZeUl/xJAV+vrToFclVjadLFz3FQcavrTUCRIJUSlm/mQRcEzesvvjAlGaKu+PZGJHusdvM72pe3UEHmvP+6Rn9aKmQMUAgDqtrc45Ja4zg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725392203; c=relaxed/relaxed;
	bh=XNWUzWtD4jyUHCjUGRd4PNytuuVB9fsnDINWxWiCOzU=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M0gFLzF3ZGY6Jz186C1g6WkSliCesxQTBPq7ONDmCHFgx269bvZe5V+K6t5aVNrWoyBju6D8g5j7Ptg369kKfyiLlLijm40LG8/ngrQ60AXRiC+2F1XBP16eYErRS6U8abfd6EtJ57uLZWhGzrMzXp5Ry8knyDI52oHh4//HKPYsql5IY3nMImDCh5HAz/MvOoG0SHQVNDPHpUvjejr7Ef0Wx1dqv+v3Cw4T6Vc+egvoNnI8tzanYcImSvGojwoY4DUHxNRtk/XwYxFo10eQ2pJVS9paIWoTG4VoWVQVef6MN8q7ZS0fUxxTK5eOoL4sedv568R2l2wao/IGpSsQ6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=AYHrwZ+B; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=on/UMaDg; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=AYHrwZ+B;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=on/UMaDg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WywqG6NN8z2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 05:36:41 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483JXTbr024292;
	Tue, 3 Sep 2024 19:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=XNWUzWtD4jyUHCj
	UGRd4PNytuuVB9fsnDINWxWiCOzU=; b=AYHrwZ+BMAeoQMrUrK8oaTs/p+/+zw2
	2yF76d8nJy7PD+Sgcm5Ssba7DcXfOfQ/b71bWbSJsPgG4WzNOe0f69qGJBGdhVwX
	Uqn8fBRgYSHhh895QuOq/o2/fVY+SLhuey0UsMx250oSV+bDy8IZetgTJt256H9K
	rpOm2JHNhoIAUoeuqK1/Fq8nvZVPt9OcHzzLGfHJMXQIvxnnZOaZPZwmKMrgqPUI
	ehJhL1CA9NYMhTVwBVXgOGVJNb+FpB4eJUpPuXhmuOlJnWB1rQudNP2L3TSrnLqD
	KILW6eUSxvG2LWgj6sGZRhrTzHqDPZrDvoj9mCS+HwdAhub/QKhmg0A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84jfuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:35:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483J2tvR039558;
	Tue, 3 Sep 2024 19:35:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm95s6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEt9RiBN1SX05CRlck18XNzCzAJPWQMJmxxPF8Y2g9KTHDD7sfnJgU8IF46+dJ7gjQAafiO61Km8FeSRZbJD8YIUJy0jsr6Mlvqwnn91Bst1DaRrp1tgldsq2CpfTiTnpY3KqqQYRE1+lgRGtG83U8IerfNyBZQHOLz/hSzi0wAB36Jylwkl+5YqbBsUg4VRiQt4aZHB9JCuGd89TzJzxcVVcRFRzd9pNLuQGhY1hqoN/03uT3SPMI7URW6EcigSaRDMcdS2OYa/O+ruEvKxfq4UFv9G3WncuJS2GDGoRjMLDx3rradbGZaahIzL+X6aGdJ96u1sLB+SqvTns0CPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNWUzWtD4jyUHCjUGRd4PNytuuVB9fsnDINWxWiCOzU=;
 b=wwWis+DWtVCSl6cIm7q4xmRYh06uDo8wcvqrCWav6y6LMeNrUyjqbokhmhSvwrkZzidiboYwqv0YumNZag+9w8YhFn0VySfIfslHoX0K7YwFEApmPXJzPEA+YKfbrxsEYUAe/lqGpeQRYZSmFIF+B6S0agp05R8LVboj3Kkom4hcrRs0P+hK5O3D1v/LhQ0anXTDf0IRGG3jzyBTcJtHKIwiXWwkxgoHVYbznxL93i6y1qzsMTxdj6/NgwUnZKv80V+lhoE0b52rqYybv95qJlcAc8aLA6/q4cNy+VCMMUNc04jBN4IJJiiCL7IaeR4jFwH4d9MFBaRZ/vFH4goA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNWUzWtD4jyUHCjUGRd4PNytuuVB9fsnDINWxWiCOzU=;
 b=on/UMaDgWk0dmZn7LYR0SNa4eBenDWrNPiYbphTdagGc4GW2I+tgOZW31+4Hx0gmH1X8wBMp7qZe/WRMPP08ckJlBkCv5Hj0DbCXmEaGka/NfHarGltufT4yNoDBwyUa1wRoHOTJ7Lbt9x1GmhLPrYlHkhqvsVN8TfvkREusxlo=
Received: from LV8PR10MB7943.namprd10.prod.outlook.com (2603:10b6:408:1f9::22)
 by SN7PR10MB7048.namprd10.prod.outlook.com (2603:10b6:806:347::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 3 Sep
 2024 19:35:43 +0000
Received: from LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d]) by LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d%7]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 19:35:43 +0000
Date: Tue, 3 Sep 2024 15:35:38 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/3] mm: Make arch_get_unmapped_area() take vm_flags by
 default
Message-ID: <oruvg2nly4taqwdmfzzpzrnnvbyfzvhbktamte2h4ztma76cy4@vtd5v3seao4d>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-1-9acda38b3dd3@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0321.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::15) To LV8PR10MB7943.namprd10.prod.outlook.com
 (2603:10b6:408:1f9::22)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR10MB7943:EE_|SN7PR10MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: e3416324-594d-4b89-ecd3-08dccc4f991c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jv68cBl1w2YPH2kUnj0VY1uqQ+1ff7EB9ieECNFqG2tXD0qPf5CjrYxVvjfh?=
 =?us-ascii?Q?DvvUrXG+dkN4vCVEzzZwea2/3uNrLqu4QIsEln/aG0cw36vNFc9YZR/cIJYG?=
 =?us-ascii?Q?WLxevh9W916uhM85s2dX8dOaxd9AC8LbOxTBOxB4yIwtcUKHJccsyyBvHI8m?=
 =?us-ascii?Q?gwkTEp7pP0ckdQm0Y2/P6z7lyLnLOrlH/DAFkjbf9Qut4Z+of8kwzky23drX?=
 =?us-ascii?Q?/49qjqB6wAfwAOJTF/dpFS/cR/ybWHDnFnCdOfe6uvZUreMc8cDfj5zEwmTz?=
 =?us-ascii?Q?zxg/ST6VAmNkYx1J+2hdvfNrsR6WYh8BbYYh0BVPEhszEoocfsfod63i/5VK?=
 =?us-ascii?Q?4Rh5UJ97ok5yKkEXrDrgD+KVxBywzPQXEawRkqGwnFpK8UuYUv/H39timL7p?=
 =?us-ascii?Q?JgTzqRrAR1zTaJr9qOjzohLUvzhqFCtd3UjPctGJgK1/9C8hRwXGEUfOZ5Cy?=
 =?us-ascii?Q?g8tNR8KDFbo9LzstKvYIPmt5C8si7pbDojvaIIW0Ta4tIBwpxQIIDwCWlfVj?=
 =?us-ascii?Q?mMj6WcKUU+GPsZ76KFfBeto9nO9ntRNjITSC0PKiQEC30Nv1cmoHoR5OQABb?=
 =?us-ascii?Q?q8wsPMiFookm7yVx0R1s9cWHXxFd3IxBHkIx3pC0d03/1exxVOaLL2zUpxdo?=
 =?us-ascii?Q?qSBSrbg6KbHO4BG7r4qDEZ+6MSymOgGYNYznUtl2aPtPtBV4dn20VhGvVhB7?=
 =?us-ascii?Q?raRuv6bUobl/MW+oSoVNAVQTX7Gz6CRr2KoRzMRzGam6KcpFoop99v7Qtu4I?=
 =?us-ascii?Q?Um+fZJ+CGY4eBaTK/Q7xyBSy2UwxvyqY5tfHnE611L9xmx/zf/EHPpg6fQ+1?=
 =?us-ascii?Q?Cgn+TITFvAQZTwzW5HABHHcShGkKUbVdgxLqtQ2GHPB/pGk5w7qfRHR3yMDP?=
 =?us-ascii?Q?FoAS47CJbud2tPCTK+90IholcBCefou09fS+0sYBNyObVBjgSEWDBoYzHfON?=
 =?us-ascii?Q?CkS2H42soJdqYp44CQjJghJB8kAJL+EU9nQ2+pv1+m68ZgAo5FVYmeuY2Xm3?=
 =?us-ascii?Q?n7T+UZ+e21MxZE1lbz2TdYbozGcfFKMf87M3TWEyqw82ho+TNJmRKN8kf/VN?=
 =?us-ascii?Q?4UAgBGu0NrW0OymkbGA4lUcLY8kuzThZ1MGqmE5sS5gFYYm+7cIT79e5ZHs5?=
 =?us-ascii?Q?0a/99izarDUjGDUZ+PWs8JahV+H6YgfjucuI+VgbjXxhWoYuKY3wSVWpOt0I?=
 =?us-ascii?Q?NlLtWfwHS1CJJYx5awqK8YnENfbwgIetevJCPDaX6VJuAswGsn+wrkRjRcNL?=
 =?us-ascii?Q?UByTv76k5VJKkP15n91WQ8EPKi7ljghY30aUc0Fh22RYXWbjCs3GKFLDZhPX?=
 =?us-ascii?Q?B8cs1CQvIRMnAkq9BhahrvOELXoQzMC+EL/GMnJOLKAB8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7943.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6XiNDH7mprLl0fwQEE8GmO4DWLCqVC5OBISbW857MaXuJzSmWfAdNXFWqCGa?=
 =?us-ascii?Q?qBA1QPCHHUUC5XHI20ayDo9BQ/zkIMM+t9K5vjt7dt9uJp+lMgMt+pR73snV?=
 =?us-ascii?Q?3UkezUiHzBdARdeai6x99sbVOo5WilgI/daEHdhlNlrcxGCgWOupzYSFbSQ4?=
 =?us-ascii?Q?WM7CbP9AufUtaJfpdvqxgaJrt8u6SAPGIEd/lUBo9F5N5HJUeECCilbFOkHj?=
 =?us-ascii?Q?jIjYqCt8goMA6ZVQCdcg53gmYiiPNifLNqyleVdnqodODiAyDNWkzqb6nGgf?=
 =?us-ascii?Q?Go7fih0//ESEw3yWMWelM27EQWPDvKhy/3uD4aS7aFNSEYMYLij0KPc00V03?=
 =?us-ascii?Q?pXMst3D6k7fvv1htxOBB86tlKZWEZZ+RyRJCRovZvSfoU+RTEW3yHXRAyo+2?=
 =?us-ascii?Q?QpNVzovGt0SOQn0kpicrJm2dtHnXb6b8EMRD+YCIy7hlioXl/ov35rNQVDPV?=
 =?us-ascii?Q?C2sZcSrU2tAblQlI++bNAgVXaJFd+/fFb2FsVUFw9XwG0fhuV5ETKsFyZGzB?=
 =?us-ascii?Q?Ps75lKM7j+2nJtTBoKKrq/j/05VmNSHAuwi9r/bcwW2A8cn1tJlrDLX01Vty?=
 =?us-ascii?Q?t/IK4mYqzdiiLSlQWtDR8uSn+k+6LYxT1HaUtu3Mg1sAd0doorYfwBKxJD2o?=
 =?us-ascii?Q?s5z9Hpnenpi4wnXMNWqDIH92V3R5nfBSAHWFQ5CZcvQ2zNyg4ksLzC/pQJtL?=
 =?us-ascii?Q?uD+iNLFqGLu4VbsfCmZkkRJHMnoy1NocQ/hC5QNsbV/V2ZvbQygywEj8I/yg?=
 =?us-ascii?Q?OmWfAAvv3+vGBegYFPsJhq9pqLxenIj0dq0jHLk2MhVJsAJINLltf3V+mVFj?=
 =?us-ascii?Q?Ju4YzyrPg97af23kuCHIACENCNGHrszxfSVvpGjJhwX62+G6OabN2E5/2Jef?=
 =?us-ascii?Q?13SgGWd0Olh4Q/KvP2RUSQDKUuuUHDWlqa9AFM4JhZQIyhBb4TJNeR0Ajr9l?=
 =?us-ascii?Q?sdIXjmwokpjz0+R/iAwpOMXxuB3hZVLdbnmJtGzMBDlJ1k+hyS0yvUvrQ63L?=
 =?us-ascii?Q?EJQxu/FW2K7B3QxmjBoUMKAozQ4oPRtPpBsaTVsQ082n3BftKW/k8zh1UcaJ?=
 =?us-ascii?Q?X5Eb9tyieKpbhEr/tW99/MyLZWJ0kDkn/y7i8dVRK3kA688YC4Ce5YVrtYiv?=
 =?us-ascii?Q?Hxsol5aQtmu3P2qsIgRIOwsxlWq1Ktc/P+Gns61x1YPS2HB6SEcuGGbuPLms?=
 =?us-ascii?Q?5WZSYBwHQNcDeMKrbycDZMuc73c0B6gG5GxkSs9qin2l+ahlBnX0nOWjlKQX?=
 =?us-ascii?Q?XZp1vhVU1ucWhQcuwIjftqgSyfJHi3rI8+z7zMWjoBHi5lUg9c/s2gLXkYUx?=
 =?us-ascii?Q?xLxXYxWHIDPpCmvTePS9VLjB8OuWoU2ThaM08JFAwu65fz4iuHP4iITbJjd0?=
 =?us-ascii?Q?t2jfNjEVDY+kuQBwxoPdiNZ06WST27sIFBmCPSd6ZKe5kHmVBDCg4Ziv81XJ?=
 =?us-ascii?Q?THYdl+L4RPtFEog7tG7HDvED9GIk/IPd+3YB+yw/V3+qbYbHkbMtPIaEawsr?=
 =?us-ascii?Q?oAbvAMNbMTdsJ7S3EUSAd4scl5rz87PuKRJ9ZElRZkPPnQJ2mWYs0AJwBsjm?=
 =?us-ascii?Q?QlvjbSdEgd6cAfEE8ILV/aUlIoujMdvDXf+xuNIm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WniYVBWYozP095f9ILXHXBGT3ev9mZTjsbjz/0VmO9R9dp2dLK6aUxzkNY2FV8772/ASlHtM3nXwyjb73EFifQa0cwlZEngIaFI1Ursy74fELETSkUf7frohOAtAYf/BFbNw4Bwjn2d2QyiDfqi/6v0h9ckUeW6mDHDoRYI6PidHjGHzZFoOCz+R6PoWFyi1NG/8wooZmrzktd+P2EERA92aVjtwQLpBqYneybd2VHfVVNcqWcYOXunZN/qBL0ZjIWGJga3mTUedRvcRuA7PVJuHiMNK3utksfqNz3oqg0S7uikM2q1bIRr0PTJ+oSJjCt9GJ/gocZXlcfeJRWNvgBAeq1HHMcc3P3WRre4MVutTm9Mpb3SioYDjBKx0nJdbsETovm4QXlXNQ6Zqhhg2zF35G34pI6mztqBqZgRL/ufuk2huWAnS1Hp0nq+w3vxiko/PFuoH0Nd9sqhlc0tEQLo+4Qhbs5OZWenkxEeixnDd3RxocmFWXn+0QArFHD4LNU6V2MM0rBIg2Q5PQA0EN9Zf/Ot5zTae3RteqfRQOswf227o/MaxYXPQ+NuP3CtJoX4tx1EwldJcfQuYWovuVyBL9gl7DHqFDUEVRGKyG3M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3416324-594d-4b89-ecd3-08dccc4f991c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:35:42.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afb4OQd6R8SBbpzGnsrhFN5SzOX6n7CdaJYU0nnjCF1r2vBtuWx4bghkjewLnWxxDUgj2znZMaXOG7JFXHZ5jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7048
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_07,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030157
X-Proofpoint-GUID: G-AijYksxi5A1NPaIZ2guU5BAla7EKWG
X-Proofpoint-ORIG-GUID: G-AijYksxi5A1NPaIZ2guU5BAla7EKWG

* Mark Brown <broonie@kernel.org> [240902 15:09]:
> When we introduced arch_get_unmapped_area_vmflags() in 961148704acd
> ("mm: introduce arch_get_unmapped_area_vmflags()") we did so as part of
> properly supporting guard pages for shadow stacks on x86_64, which uses
> a custom arch_get_unmapped_area(). Equivalent features are also present
> on both arm64 and RISC-V, both of which use the generic implementation
> of arch_get_unmapped_area() and will require equivalent modification
> there. Rather than continue to deal with having two versions of the
> functions let's bite the bullet and have all implementations of
> arch_get_unmapped_area() take vm_flags as a parameter.
> 
> The new parameter is currently ignored by all implementations other than
> x86. The only caller that doesn't have a vm_flags available is
> mm_get_unmapped_area(), as for the x86 implementation and the wrapper used
> on other architectures this is modified to supply no flags.
> 
> No functional changes.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

I don't love sparc32/sparc64 requires a wide screen monitor, but it
already broke the 80 char limit.

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  arch/alpha/kernel/osf_sys.c       |  2 +-
>  arch/arc/mm/mmap.c                |  3 ++-
>  arch/arm/mm/mmap.c                |  7 ++++---
>  arch/csky/abiv1/mmap.c            |  3 ++-
>  arch/loongarch/mm/mmap.c          |  5 +++--
>  arch/mips/mm/mmap.c               |  2 +-
>  arch/parisc/kernel/sys_parisc.c   |  5 +++--
>  arch/parisc/mm/hugetlbpage.c      |  2 +-
>  arch/powerpc/mm/book3s64/slice.c  |  6 ++++--
>  arch/s390/mm/mmap.c               |  4 ++--
>  arch/sh/mm/mmap.c                 |  5 +++--
>  arch/sparc/kernel/sys_sparc_32.c  |  2 +-
>  arch/sparc/kernel/sys_sparc_64.c  |  4 ++--
>  arch/x86/include/asm/pgtable_64.h |  1 -
>  arch/x86/kernel/sys_x86_64.c      | 21 +++------------------
>  arch/xtensa/kernel/syscall.c      |  3 ++-
>  include/linux/sched/mm.h          | 23 ++++++++---------------
>  mm/mmap.c                         | 31 +++++++------------------------
>  18 files changed, 49 insertions(+), 80 deletions(-)
> 
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index e5f881bc8288..8886ab539273 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -1229,7 +1229,7 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
> -		       unsigned long flags)
> +		       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	unsigned long limit;
>  
> diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
> index 69a915297155..2185afe8d59f 100644
> --- a/arch/arc/mm/mmap.c
> +++ b/arch/arc/mm/mmap.c
> @@ -23,7 +23,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
> index d65d0e6ed10a..3dbb383c26d5 100644
> --- a/arch/arm/mm/mmap.c
> +++ b/arch/arm/mm/mmap.c
> @@ -28,7 +28,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -78,8 +79,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
> -			const unsigned long len, const unsigned long pgoff,
> -			const unsigned long flags)
> +		        const unsigned long len, const unsigned long pgoff,
> +		        const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
> index 7f826331d409..1047865e82a9 100644
> --- a/arch/csky/abiv1/mmap.c
> +++ b/arch/csky/abiv1/mmap.c
> @@ -23,7 +23,8 @@
>   */
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff,
> +		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
> index 889030985135..914e82ff3f65 100644
> --- a/arch/loongarch/mm/mmap.c
> +++ b/arch/loongarch/mm/mmap.c
> @@ -89,7 +89,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
>  }
>  
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, UP);
> @@ -101,7 +102,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
>   */
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr0, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, DOWN);
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index 7e11d7b58761..02bf5353efbd 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -110,7 +110,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr0,
>   */
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr0, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr0, len, pgoff, flags, DOWN);
> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
> index f7722451276e..f852fe274abe 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -167,7 +167,8 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
>  }
>  
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr, len, pgoff, flags, UP);
> @@ -175,7 +176,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  	unsigned long addr, unsigned long len, unsigned long pgoff,
> -	unsigned long flags)
> +	unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return arch_get_unmapped_area_common(filp,
>  			addr, len, pgoff, flags, DOWN);
> diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
> index 0356199bd9e7..aa664f7ddb63 100644
> --- a/arch/parisc/mm/hugetlbpage.c
> +++ b/arch/parisc/mm/hugetlbpage.c
> @@ -40,7 +40,7 @@ hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>  		addr = ALIGN(addr, huge_page_size(h));
>  
>  	/* we need to make sure the colouring is OK */
> -	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
> +	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
>  }
>  
>  
> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
> index ef3ce37f1bb3..ada6bf896ef8 100644
> --- a/arch/powerpc/mm/book3s64/slice.c
> +++ b/arch/powerpc/mm/book3s64/slice.c
> @@ -637,7 +637,8 @@ unsigned long arch_get_unmapped_area(struct file *filp,
>  				     unsigned long addr,
>  				     unsigned long len,
>  				     unsigned long pgoff,
> -				     unsigned long flags)
> +				     unsigned long flags,
> +				     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
>  		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> @@ -650,7 +651,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  					     const unsigned long addr0,
>  					     const unsigned long len,
>  					     const unsigned long pgoff,
> -					     const unsigned long flags)
> +					     const unsigned long flags,
> +					     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
>  		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
> diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
> index 206756946589..96efa061ce01 100644
> --- a/arch/s390/mm/mmap.c
> +++ b/arch/s390/mm/mmap.c
> @@ -82,7 +82,7 @@ static int get_align_mask(struct file *filp, unsigned long flags)
>  
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  				     unsigned long len, unsigned long pgoff,
> -				     unsigned long flags)
> +				     unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -117,7 +117,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  
>  unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  					     unsigned long len, unsigned long pgoff,
> -					     unsigned long flags)
> +					     unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
> index bee329d4149a..c442734d9b0c 100644
> --- a/arch/sh/mm/mmap.c
> +++ b/arch/sh/mm/mmap.c
> @@ -52,7 +52,8 @@ static inline unsigned long COLOUR_ALIGN(unsigned long addr,
>  }
>  
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -	unsigned long len, unsigned long pgoff, unsigned long flags)
> +	unsigned long len, unsigned long pgoff, unsigned long flags,
> +	vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma;
> @@ -99,7 +100,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
>  			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> +			  const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
> index 08a19727795c..80822f922e76 100644
> --- a/arch/sparc/kernel/sys_sparc_32.c
> +++ b/arch/sparc/kernel/sys_sparc_32.c
> @@ -39,7 +39,7 @@ SYSCALL_DEFINE0(getpagesize)
>  	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
>  }
>  
> -unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
> +unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_unmapped_area_info info = {};
>  
> diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
> index d9c3b34ca744..acade309dc2f 100644
> --- a/arch/sparc/kernel/sys_sparc_64.c
> +++ b/arch/sparc/kernel/sys_sparc_64.c
> @@ -87,7 +87,7 @@ static inline unsigned long COLOR_ALIGN(unsigned long addr,
>  	return base + off;
>  }
>  
> -unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
> +unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct * vma;
> @@ -146,7 +146,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
>  			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> +			  const unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma;
>  	struct mm_struct *mm = current->mm;
> diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
> index 3c4407271d08..7e9db77231ac 100644
> --- a/arch/x86/include/asm/pgtable_64.h
> +++ b/arch/x86/include/asm/pgtable_64.h
> @@ -245,7 +245,6 @@ extern void cleanup_highmap(void);
>  
>  #define HAVE_ARCH_UNMAPPED_AREA
>  #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
> -#define HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
>  
>  #define PAGE_AGP    PAGE_KERNEL_NOCACHE
>  #define HAVE_PAGE_AGP 1
> diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
> index 01d7cd85ef97..87f8c9a71c49 100644
> --- a/arch/x86/kernel/sys_x86_64.c
> +++ b/arch/x86/kernel/sys_x86_64.c
> @@ -121,7 +121,7 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>  }
>  
>  unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
> +arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
>  		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> @@ -158,7 +158,7 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
>  }
>  
>  unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
> +arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
>  			  unsigned long len, unsigned long pgoff,
>  			  unsigned long flags, vm_flags_t vm_flags)
>  {
> @@ -228,20 +228,5 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
>  	 * can happen with large stack limits and large mmap()
>  	 * allocations.
>  	 */
> -	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> -{
> -	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, 0);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr,
> -			  const unsigned long len, const unsigned long pgoff,
> -			  const unsigned long flags)
> -{
> -	return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff, flags, 0);
> +	return arch_get_unmapped_area(filp, addr0, len, pgoff, flags, 0);
>  }
> diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
> index b3c2450d6f23..7f048d368dba 100644
> --- a/arch/xtensa/kernel/syscall.c
> +++ b/arch/xtensa/kernel/syscall.c
> @@ -55,7 +55,8 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
>  
>  #ifdef CONFIG_MMU
>  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
> -		unsigned long len, unsigned long pgoff, unsigned long flags)
> +		unsigned long len, unsigned long pgoff, unsigned long flags,
> +		vm_flgs_t vm_flags)
>  {
>  	struct vm_area_struct *vmm;
>  	struct vma_iterator vmi;
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 91546493c43d..c4d34abc45d4 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -179,27 +179,20 @@ static inline void mm_update_next_owner(struct mm_struct *mm)
>  
>  extern void arch_pick_mmap_layout(struct mm_struct *mm,
>  				  struct rlimit *rlim_stack);
> -extern unsigned long
> -arch_get_unmapped_area(struct file *, unsigned long, unsigned long,
> -		       unsigned long, unsigned long);
> -extern unsigned long
> +
> +unsigned long
> +arch_get_unmapped_area(struct file *filp, unsigned long addr,
> +		       unsigned long len, unsigned long pgoff,
> +		       unsigned long flags, vm_flags_t vm_flags);
> +unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> -			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags);
> +			       unsigned long len, unsigned long pgoff,
> +			       unsigned long flags, vm_flags_t);
>  
>  unsigned long mm_get_unmapped_area(struct mm_struct *mm, struct file *filp,
>  				   unsigned long addr, unsigned long len,
>  				   unsigned long pgoff, unsigned long flags);
>  
> -unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
> -			       unsigned long len, unsigned long pgoff,
> -			       unsigned long flags, vm_flags_t vm_flags);
> -unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
> -				       unsigned long len, unsigned long pgoff,
> -				       unsigned long flags, vm_flags_t);
> -
>  unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
>  					   struct file *filp,
>  					   unsigned long addr,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index d0dfc85b209b..7528146f886f 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1821,7 +1821,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
> -		       unsigned long flags)
> +		       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
>  }
> @@ -1885,38 +1885,21 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  unsigned long
>  arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  			       unsigned long len, unsigned long pgoff,
> -			       unsigned long flags)
> +			       unsigned long flags, vm_flags_t vm_flags)
>  {
>  	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
>  }
>  #endif
>  
> -#ifndef HAVE_ARCH_UNMAPPED_AREA_VMFLAGS
> -unsigned long
> -arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned long len,
> -			       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
> -{
> -	return arch_get_unmapped_area(filp, addr, len, pgoff, flags);
> -}
> -
> -unsigned long
> -arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr,
> -				       unsigned long len, unsigned long pgoff,
> -				       unsigned long flags, vm_flags_t vm_flags)
> -{
> -	return arch_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
> -}
> -#endif
> -
>  unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm, struct file *filp,
>  					   unsigned long addr, unsigned long len,
>  					   unsigned long pgoff, unsigned long flags,
>  					   vm_flags_t vm_flags)
>  {
>  	if (test_bit(MMF_TOPDOWN, &mm->flags))
> -		return arch_get_unmapped_area_topdown_vmflags(filp, addr, len, pgoff,
> -							      flags, vm_flags);
> -	return arch_get_unmapped_area_vmflags(filp, addr, len, pgoff, flags, vm_flags);
> +		return arch_get_unmapped_area_topdown(filp, addr, len, pgoff,
> +						      flags, vm_flags);
> +	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
>  }
>  
>  unsigned long
> @@ -1978,8 +1961,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
>  		     unsigned long pgoff, unsigned long flags)
>  {
>  	if (test_bit(MMF_TOPDOWN, &mm->flags))
> -		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags);
> -	return arch_get_unmapped_area(file, addr, len, pgoff, flags);
> +		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
> +	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
>  }
>  EXPORT_SYMBOL(mm_get_unmapped_area);
>  
> 
> -- 
> 2.39.2
> 

